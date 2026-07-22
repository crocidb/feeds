+++
title = "Going REPLing with Haskeline"
description = "So you went ahead and created a new programming language, with an AST, a parser, and an interpreter. And now you hate how you have to write the programs in your new language in files to run them? You need a REPL! In this post, we’ll create a "
date = "2024-10-31T00:00:00Z"
url = "https://abhinavsarkar.net/posts/repling-with-haskeline/"
author = "Abhinav Sarkar"
text = ""
lastupdated = "2026-07-21T09:17:41.503911254Z"
seen = false
+++

So you went ahead and created a new programming language, with an AST, a parser, and an interpreter. And now you hate how you have to write the programs in your new language in files to run them? You need a [REPL](https://en.wikipedia.org/wiki/REPL)! In this post, we’ll create a shiny REPL with lots of nice features using the Haskeline library to go along with your new PL that you implemented in Haskell.

This post was originally published on [abhinavsarkar.net](https://abhinavsarkar.net/posts/repling-with-haskeline/?mtm_campaign=feed).

### Contents ###

1. [The Demo](#the-demo)
2. [Dawn of a New Language](#dawn-of-a-new-language)
3. [A REPL of Our Own](#a-repl-of-our-own)
4. [State and Settings](#state-and-settings)
5. [REPLing Down the Prompt](#repling-down-the-prompt)
6. [Reading the Input](#reading-the-input)
7. [Evaluating the Input](#evaluating-the-input)
8. [Doing the Completions](#doing-the-completions)
9. [Conclusion](#conclusion)

The Demo[#](#the-demo)
----------

First a short demo:

 \<details\> \<summary\> Play demo \</summary\> \<img src class="lazyload nolink w-100pct" data-src="/images/repling-with-haskeline/demo.gif"\>\</img\> \<noscript\>\<img src="/images/repling-with-haskeline/demo.gif" class="nolink w-100pct"\>\</img\>

That is a pretty good REPL, isn’t it? You can even [try it online](https://demo.abnv.me/fibolisp/)[<sup>1</sup>](#fn1), running entirely in your browser.

Dawn of a New Language[#](#dawn-of-a-new-language)
----------

Let’s assume that we have created a new small [Lisp](https://en.wikipedia.org/wiki/Lisp_(programming_language))[<sup>2</sup>](#fn2), just large enough to be able to conveniently write and run the Fibonacci function that returns the nth [Fibonacci number](https://en.wikipedia.org/wiki/Fibonacci_sequence). That’s it, nothing more. This lets us focus on the features of the REPL[<sup>3</sup>](#fn3), not the language.

We have a parser to parse the code from text to an AST, and an interpreter that evaluates an AST and returns a value. We are not going into the details of the parser and the interpreter, just listing the type signatures of the functions they provide is enough for this post.

Let’s start with the AST:

```
module Language.FiboLisp.Types where

import Data.Text qualified as Text
import Data.Text.Lazy qualified as LText
import Text.Pretty.Simple qualified as PS
import Text.Printf (printf)

type Ident = String

data Expr
  = Num_ Integer
  | Bool_ Bool
  | Var Ident
  | BinaryOp Op Expr Expr
  | If Expr Expr Expr
  | Apply Ident [Expr]
  deriving (Show)

data Op = Add | Sub | LessThan
  deriving (Show, Enum)

data Def = Def {defName :: Ident, defParams :: [Ident], defBody :: Expr}

data Program = Program [Def] [Expr]
  deriving (Show)

carKeywords :: [String]
carKeywords = ["def", "if", "+", "-", "<"]

instance Show Def where
  show Def {..} =
    printf "(Def %s [%s] (%s))" defName (unwords defParams) (show defBody)

showProgram :: Program -> String
showProgram =
  Text.unpack
    . LText.toStrict
    . PS.pShowOpt
      ( PS.defaultOutputOptionsNoColor
          { PS.outputOptionsIndentAmount = 2,
            PS.outputOptionsCompact = True,
            PS.outputOptionsCompactParens = True
          }
      )
```

That’s right! We named our little language FiboLisp.

FiboLisp is expression oriented; everything is an expression. So naturally, we have an `Expr` AST. Writing the Fibonacci function requires not many syntactic facilities. In FiboLisp we have:

* integer numbers,
* booleans,
* variables,
* addition, subtraction, and less-than binary operations on numbers,
* conditional `if` expressions, and
* function calls by name.

We also have function definitions, captured by `Def`, which records the function name, its parameter names, and its body as an expression.

And finally we have `Program`s, which are a bunch of function definitions to define, and another bunch of expressions to evaluate.

Short and simple. We don’t need anything more[<sup>4</sup>](#fn4). This is how the Fibonacci function looks in FiboLisp:

```
(def fibo [n]
  (if (< n 2)
    n
    (+ (fibo (- n 1)) (fibo (- n 2)))))
```

We can see all the AST types in use here. Note that FiboLisp is lexically scoped.

The module also lists a bunch of keywords (`carKeywords`) that can appear in the *car*[<sup>5</sup>](#fn5) position of a Lisp expression, that we use later for auto-completion in the REPL, and some functions to convert the AST types to nice looking strings.

For the parser, we have this pared-down code:

```
module Language.FiboLisp.Parser (ParsingError(..), parse) where

import Control.DeepSeq (NFData)
import Control.Exception (Exception)
import GHC.Generics (Generic)
import Language.FiboLisp.Types

parse :: String -> Either ParsingError Program

data ParsingError = ParsingError String | EndOfStreamError
  deriving (Show, Generic, NFData)

instance Exception ParsingError
```

The essential function is `parse`, which takes the code as a string, and returns either a `ParsingError` on failure, or a `Program` on success. If the parser detects that an [S-expression](https://en.wikipedia.org/wiki/S-expression) is not properly closed, it returns an `EndOfStreamError` error.

We also have this pretty-printer module that converts function ASTs back to pretty Lisp code:

```
module Language.FiboLisp.Printer (prettyShowDef) where

import Language.FiboLisp.Types

prettyShowDef :: Def -> String
```

Finally, the last thing before we hit the real topic of this post, the FiboLisp interpreter:

```
module Language.FiboLisp.Interpreter
  (Value, RuntimeError, interpret, builtinFuncs, builtinVals) where

import Control.DeepSeq (NFData)
import Control.Exception (Exception)
import Data.Map.Strict qualified as Map
import GHC.Generics (Generic)
import Language.FiboLisp.Types

interpret :: (String -> IO ()) -> Program -> IO (Either RuntimeError Value)

newtype RuntimeError = RuntimeError String
  deriving (Show, Generic, NFData)

instance Exception RuntimeError

data Value = ...
  deriving (Show, Generic, NFData)

builtinFuncs :: Map.Map String Value

builtinVals :: [Value]
```

We have elided the details again. All that matters to us is the `interpret` function that takes a program, and returns either a runtime error or a value. `Value` is the runtime representation of the values of FiboLisp expressions, and all we care about is that it can be `show`n and fully evaluated via `NFData`[<sup>6</sup>](#fn6). `interpret` also takes a `String -> IO ()` function, that’ll be demystified when we get into implementing the REPL.

Lastly, we have a map of built-in functions and a list of built-in values. We expose them so that they can be treated specially in the REPL.

If you want, you can go ahead and fill in the missing code using your favourite parsing and pretty-printing libraries[<sup>7</sup>](#fn7), and the method of writing interpreters. For this post, those implementation details are not necessary.

Let’s package all this functionality into a module for ease of importing:

```
module Language.FiboLisp
  ( module Language.FiboLisp.Types,
    module Language.FiboLisp.Parser,
    module Language.FiboLisp.Printer,
    module Language.FiboLisp.Interpreter,
  )
where

import Language.FiboLisp.Interpreter
import Language.FiboLisp.Parser
import Language.FiboLisp.Printer
import Language.FiboLisp.Types
```

Now, with all the preparations done, we can go REPLing.

A REPL of Our Own[#](#a-repl-of-our-own)
----------

The main functionality that a REPL provides is entering expressions and definitions, one at a time, that it **R**eads, **E**valuates, and **P**rints, and then **L**oops back, letting us do the same again. This can be accomplished with a simple program that prompts the user for an input and does all these with it. However, such a REPL will be quite lackluster.

These days programming languages come with advanced REPLs like [IPython](https://ipython.org/) and [nREPL](https://nrepl.org/), which provide many functionalities beyond simple REPLing. We want FiboLisp to have a great REPL too.

You may have already noticed some advanced features that our REPL provides in the demo. Let’s state them here:

1. Commands starting with colon:
   1. to set and unset settings: `:set` and `:unset`,
   2. to load files into the REPL: `:load`,
   3. to show the source code of functions: `:source`,
   4. to show a help message: `:help`.

2. Settings to enable/disable:
   1. dumping of parsed ASTs: `dump`,
   2. showing program execution times: `time`.

3. Multiline expressions and functions, with correct indentation.
4. Colored output and messages.
5. Auto-completion of commands, code and file names.
6. Safety checks when loading files.
7. [Readline](https://en.wikipedia.org/wiki/GNU_Readline)-like navigation through the history of previous inputs.

[Haskeline](https://hackage.haskell.org/package/haskeline) — the Haskell library that we use to create the REPL — provides only basic functionalities, upon which we build to provide these features. Let’s begin.

State and Settings[#](#state-and-settings)
----------

As usual, we start the module with many imports[<sup>8</sup>](#fn8):

```
{-# LANGUAGE TemplateHaskell #-}

module Language.FiboLisp.Repl (run) where

import Control.DeepSeq qualified as DS
import Control.Exception (Exception (..), evaluate)
import Control.Lens.Basic qualified as Lens
import Control.Monad (when)
import Control.Monad.Catch qualified as Catch
import Control.Monad.IO.Class (MonadIO, liftIO)
import Control.Monad.Identity (IdentityT (..))
import Control.Monad.Reader (MonadReader, ReaderT (runReaderT))
import Control.Monad.Reader qualified as Reader
import Control.Monad.State.Strict (MonadState, StateT (runStateT))
import Control.Monad.State.Strict qualified as State
import Control.Monad.Trans (MonadTrans, lift)
import Data.Char qualified as Char
import Data.Functor ((<&>))
import Data.List
  (dropWhileEnd, foldl', isPrefixOf, isSuffixOf, nub, sort, stripPrefix)
import Data.Map.Strict qualified as Map
import Data.Maybe (fromJust)
import Data.Set qualified as Set
import Data.Time (NominalDiffTime, diffUTCTime, getCurrentTime)
import Language.FiboLisp qualified as L
import System.Console.Haskeline qualified as H
import System.Console.Terminfo qualified as Term
import System.Directory (canonicalizePath, doesFileExist, getCurrentDirectory)
```

Notice that we import the previously shown `Language.FiboLisp` module qualified as `L`, and Haskeline as `H`. Another important library that we use here is [terminfo](https://hackage.haskell.org/package/terminfo), which helps us do colored output.

A REPL must preserve the context through a session. In case of FiboLisp, this means we should be able to define a function[<sup>9</sup>](#fn9) as one input, and then use it later in the session, one or many times[<sup>10</sup>](#fn10). The REPL should also respect the REPL settings through the session till they are unset.

Additionally, the REPL has to remember whether it is in middle of writing a multiline input. To support multiline input, the REPL also needs to remember the previous indentation, and the input done in previous lines of a multiline input. Together these form the `ReplState`:

```
data ReplState = ReplState
  { _replDefs :: Defs,
    _replSettings :: Settings,
    _replLineMode :: LineMode,
    _replIndent :: Int,
    _replSeenInput :: String
  }

type Defs = Map.Map L.Ident L.Def
type Settings = Set.Set Setting
data Setting = Dump | MeasureTime deriving (Eq, Ord, Enum)
data LineMode = SingleLine | MultiLine deriving (Eq)

instance Show Setting where
  show = \case
    Dump -> "dump"
    MeasureTime -> "time"
```

Let’s deal with settings first. We set and unset settings using the `:set` and `:unset` commands. So, we write the code to parse setting the settings:

```
data SettingMode = Set | Unset deriving (Eq, Enum)

instance Show SettingMode where
  show = \case
    Set -> ":set"
    Unset -> ":unset"

parseSetting :: String -> Maybe Setting
parseSetting = \case
  "dump" -> Just Dump
  "time" -> Just MeasureTime
  _ -> Nothing

parseSettingMode :: String -> Maybe SettingMode
parseSettingMode = \case
  ":set" -> Just Set
  ":unset" -> Just Unset
  _ -> Nothing

parseSettingCommand :: String -> Either String (SettingMode, Setting)
parseSettingCommand command = case words command of
  [modeStr, settingStr] -> case parseSettingMode modeStr of
    Just mode -> case parseSetting settingStr of
      Just setting -> Right (mode, setting)
      Nothing -> Left $ "Unknown setting: " <> settingStr
    Nothing -> Left $ "Unknown command: " <> command
  [modeStr]
    | Just _ <- parseSettingMode modeStr -> Left "No setting specified"
  _ -> Left $ "Unknown command: " <> command
```

Nothing fancy here, just splitting the input into words and going through them to make sure they are valid.

The REPL is a monad that wraps over `ReplState`:

```
newtype Repl a = Repl
  { runRepl_ :: StateT ReplState (ReaderT AddColor IO) a
  }
  deriving
    ( Functor,
      Applicative,
      Monad,
      MonadIO,
      MonadState ReplState,
      MonadReader AddColor,
      Catch.MonadThrow,
      Catch.MonadCatch,
      Catch.MonadMask
    )

type AddColor = Term.Color -> String -> String

runRepl :: AddColor -> Repl a -> IO a
runRepl addColor =
  fmap fst
    . flip runReaderT addColor
    . flip runStateT (ReplState Map.empty Set.empty SingleLine 0 "")
    . runRepl_
```

`Repl` also lets us do IO — is it really a REPL if you can’t do printing — and deal with exceptions. Additionally, we have a read-only state that is a function, which will be explained soon. The REPL starts in the single line mode, with no indentation, functions definitions, settings, or previously seen input.

REPLing Down the Prompt[#](#repling-down-the-prompt)
----------

Let’s go top-down. We write the `run` function that is the entry point of this module:

```
run :: IO ()
run = do
  term <- Term.setupTermFromEnv
  let addColor =
        case Term.getCapability term $ Term.withForegroundColor @String of
          Just fc -> fc
          Nothing -> \_ s -> s
  runRepl addColor . H.runInputT settings $ do
    H.outputStrLn $ addColor promptColor "FiboLisp REPL"
    H.outputStrLn $ addColor infoColor "Press <TAB> to start"
    repl
  where
    settings =
      H.setComplete doCompletions $
        H.defaultSettings {H.historyFile = Just ".fibolisp"}
```

This sets up Haskeline to run our REPL using the functions we provide in the later sections: `repl` and `doCompletions`. This also demystifies the read-only state of the REPL: a function that adds colors to our output strings, depending on the capabilities of the terminal in which our REPL is running in. We also set up a history file to remember the previous REPL inputs.

When the REPL starts, we output some messages in nice colors, which are defined as:

```
promptColor, printColor, outputColor, errorColor, infoColor :: Term.Color
promptColor = Term.Green
printColor = Term.White
outputColor = Term.Green
errorColor = Term.Red
infoColor = Term.Cyan
```

Off we go `repl`ing now:

```
type Prompt = H.InputT Repl

repl :: Prompt ()
repl = do
  replLineMode .= SingleLine
  replIndent .= 0
  replSeenInput .= ""
  Catch.handle (\H.Interrupt -> repl) . H.withInterrupt $
    readInput >>= \case
      EndOfInput -> outputWithColor promptColor "Goodbye."
      input -> evalAndPrint input >> repl

outputWithColor :: Term.Color -> String -> Prompt ()
outputWithColor color text = do
  addColor <- getAddColor
  H.outputStrLn $ addColor color text

getAddColor :: Prompt AddColor
getAddColor = lift Reader.ask
```

We infuse our `Repl` with the powers of Haskeline by wrapping it with Haskeline’s `InputT` monad transformer, and call it the `Prompt` type. In the `repl` function, we `readInput`, `evalAndPrint` it, and `repl` again.

We also deal with the user quitting the REPL (the `EndOfInput` case), and hitting Ctrl + C to interrupt typing or a running evaluation (the handling for `H.Interrupt`).

Wait a minute! What is that imperative looking `.=` doing in our Haskell code? That’s right, we are looking through some lenses!

```
type Lens' s a = Lens.Lens s s a a

replDefs :: Lens' ReplState Defs
replDefs = $(Lens.field '_replDefs)

replSettings :: Lens' ReplState Settings
replSettings = $(Lens.field '_replSettings)

replLineMode :: Lens' ReplState LineMode
replLineMode = $(Lens.field '_replLineMode)

replIndent :: Lens' ReplState Int
replIndent = $(Lens.field '_replIndent)

replSeenInput :: Lens' ReplState String
replSeenInput = $(Lens.field '_replSeenInput)

use :: (MonadTrans t, MonadState s m) => Lens' s a -> t m a
use l = lift . State.gets $ Lens.view l

(.=) :: (MonadTrans t, MonadState s m) => Lens' s a -> a -> t m ()
l .= a = lift . State.modify' $ Lens.set l a

(%=) :: (MonadTrans t, MonadState s m) => Lens' s a -> (a -> a) -> t m ()
l %= f = lift . State.modify' $ Lens.over l f
```

If you’ve never encountered [lenses](https://hackage.haskell.org/package/lens-tutorial/docs/Control-Lens-Tutorial.html) before, you can think of them as pairs of setters and getters. The `repl*` lenses above are for setting and getting the corresponding fields from the `ReplState` data type[<sup>11</sup>](#fn11). The `use`, `.=`, and `%=` functions are for getting, setting and modifying respectively the state in the `State` monad using lenses. We see them in action at the beginning of the [`repl`](#cb13-3) function when we use `.=` to set the various fields of `ReplState` to their initial values in the `State` monad.

All that is left now is actually reading the input, evaluating it and printing the results.

Reading the Input[#](#reading-the-input)
----------

Haskeline gives us functions to read the user’s input as text. However, being Haskellers, we prefer some structure around it:

```
data Input
  = Setting (SettingMode, Setting)
  | Load FilePath
  | Source String
  | Help
  | Program L.Program
  | BadInputError String
  | EndOfInput
```

We’ve got all previously mentioned cases covered with the `Input` data type. We also do some input validation and capture errors for the failure cases with the `BadInputError` constructor. `EndOfInput` is used for when the user quits the REPL.

Here is how we read the input:

```
readInput :: Prompt Input
readInput = do
  addColor <- getAddColor
  lineMode <- use replLineMode
  prevIndent <- use replIndent

  let promptSym = case lineMode of SingleLine -> "λ"; _ -> "|"
      prompt = addColor promptColor $ promptSym <> "> "

  mInput <- H.getInputLineWithInitial prompt (replicate prevIndent ' ', "")
  let currentIndent = maybe 0 (length . takeWhile (== ' ')) mInput

  case trimStart . trimEnd <$> mInput of
    Nothing -> return EndOfInput
    Just input | null input -> do
      replIndent .= case lineMode of
        SingleLine -> prevIndent
        MultiLine -> currentIndent
      readInput
    Just input@(':' : _) -> parseCommand input
    Just input -> parseCode input currentIndent

trimStart :: String -> String
trimStart = dropWhile Char.isSpace

trimEnd :: String -> String
trimEnd = dropWhileEnd Char.isSpace
```

We use the `getInputLineWithInitial` function provided by Haskeline to show a prompt and read user’s input as a string. The prompt shown depends on the `LineMode` of the REPL state. In the `SingleLine` mode we show `λ>`, where in the `MultiLine` mode we show `|>`.

If there is no input, that means the user has quit the REPL. In that case we return `EndOfInput`, which is handled in the [`repl`](#cb13-3) function. If the input is empty, we read more input, preserving the previous indentation (`prevIndent`) in the `MultiLine` mode.

If the input starts with `:`, we parse it for various commands:

```
parseCommand :: String -> Prompt Input
parseCommand input
  | ":help" `isPrefixOf` input = return Help
  | ":load" `isPrefixOf` input =
      checkFilePath . trimStart . fromJust $ stripPrefix ":load" input
  | ":source" `isPrefixOf` input = do
      return . Source . trimStart . fromJust $ stripPrefix ":source" input
  | input == ":" = return $ BadInputError "No command specified"
  | otherwise = case parseSettingCommand input of
      Right setting -> return $ Setting setting
      Left err -> return $ BadInputError err

checkFilePath :: String -> Prompt Input
checkFilePath file
  | null file = return $ BadInputError "No file specified"
  | otherwise =
      isSafeFilePath file <&> \case
        True -> Load file
        False -> BadInputError $ "Cannot access file: " <> file

isSafeFilePath :: (MonadIO m) => FilePath -> m Bool
isSafeFilePath fp =
  liftIO $ isPrefixOf <$> getCurrentDirectory <*> canonicalizePath fp
```

The `:help` and `:source` cases are straightforward. In case of `:load`, we make sure to check that the file asked to be loaded is located somewhere inside the current directory of the REPL or its recursive subdirectories. Otherwise, we deny loading by returning a `BadInputError`. We parse the settings using the [`parseSettingCommand`](#cb9-20) function we wrote earlier.

If the input is not a command, we parse it as code:

```
parseCode :: String -> Int -> Prompt Input
parseCode currentInput indent = do
  seenInput <- use replSeenInput
  let input = seenInput <> " " <> currentInput
  case L.parse input of
    Left L.EndOfStreamError -> do
      replLineMode .= MultiLine
      replIndent .= indent
      replSeenInput .= input
      readInput
    Left err ->
      return $ BadInputError $ "ERROR: " <> displayException err
    Right program -> return $ Program program
```

We append the previously seen input (in case of multiline input) with the current input and parse it using the `parse` function provided by the `Language.FiboLisp` module. If parsing fails with an `EndOfStreamError`, it means that the input is incomplete. In that case, we set the REPL line mode to `Multiline`, REPL indentation to the current indentation, and seen input to the previously seen input appended with the current input, and read more input. If it is some other error, we return a `BadInputError` with it.

If the result of parsing is a program, we return it as a `Program` input.

That’s it for reading the user input. Next, we evaluate it.

Evaluating the Input[#](#evaluating-the-input)
----------

Recall that the [`repl`](#cb13-3) function calls the `evalAndPrint` function with the read input:

```
evalAndPrint :: Input -> Prompt ()
evalAndPrint = \case
  EndOfInput -> return ()
  BadInputError err -> outputWithColor errorColor err
  Help -> H.outputStr helpMessage
  Setting (Set, setting) -> replSettings %= Set.insert setting
  Setting (Unset, setting) -> replSettings %= Set.delete setting
  Source ident -> showSource ident
  Load fp -> loadAndEvalFile fp
  Program program -> interpretAndPrint program
  where
    helpMessage =
      unlines
        [ "Available commands",
          ":set/:unset dump       Dumps the program AST",
          ":set/:unset time       Shows the program execution time",
          ":load <file>           Loads a source file",
          ":source <func_name>    Prints the source code of a function",
          ":help                  Shows this help"
        ]
```

The cases of `EndOfInput`, `BadInputError` and `Help` are straightforward. For settings, we insert or remove the setting from the REPL settings, depending on it being set or unset. For the other cases, we call the respective helper functions.

For a `:source` command, we check if the requested identifier maps to a user-defined or builtin function, and if so, print its source. Otherwise we print an error.

```
showSource :: L.Ident -> Prompt ()
showSource ident = do
  defs <- use replDefs
  case Map.lookup ident defs of
    Just def -> outputWithColor infoColor $ L.prettyShowDef def
    Nothing -> case Map.lookup ident L.builtinFuncs of
      Just func -> outputWithColor infoColor $ show func
      Nothing ->
        outputWithColor errorColor $ "No such function: " <> ident
```

For a `:load` command, we check if the requested file exists. If so, we read and parse it, and interpret the resultant program. In case of any errors in reading or parsing the file, we catch and print them.

```
loadAndEvalFile :: FilePath -> Prompt ()
loadAndEvalFile fp =
  liftIO (doesFileExist fp) >>= \case
    False -> outputWithColor errorColor $ "No such file: " <> fp
    True -> Catch.handleAll outputError $ do
      code <- liftIO $ readFile fp
      outputWithColor infoColor $ "Loaded " <> fp
      case L.parse code of
        Left err -> outputError err
        Right program -> interpretAndPrint program

outputError :: (Exception e) => e -> Prompt ()
outputError err =
  outputWithColor errorColor $ "ERROR: " <> displayException err
```

Finally, we come to the workhorse of the REPL: the interpretation of the user provided program:

```
interpretAndPrint :: L.Program -> Prompt ()
interpretAndPrint (L.Program pDefs exprs) =
  Catch.handleAll outputError $ do
    defs <- use replDefs
    settings <- use replSettings

    let defs' =
          foldl' (\ds d -> Map.insert (L.defName d) d ds) defs pDefs
        program = L.Program (Map.elems defs') exprs
    when (Dump `Set.member` settings) $
      outputWithColor infoColor (L.showProgram program)

    addColor <- getAddColor
    extPrint <- H.getExternalPrint

    (execTime, val) <- liftIO . measureElapsedTime $ do
      val <- L.interpret (extPrint . addColor printColor) program
      evaluate $ DS.force val

    case val of
      Left err -> outputError err
      Right v -> do
        let output = show v
        if null output
          then return ()
          else outputWithColor outputColor $ "=> " <> output

    when (MeasureTime `Set.member` settings) $
      outputWithColor infoColor $
        "(Execution time: " <> show execTime <> ")"

    replDefs .= defs'

measureElapsedTime :: IO a -> IO (NominalDiffTime, a)
measureElapsedTime f = do
  start <- getCurrentTime
  ret <- f
  end <- getCurrentTime
  return (diffUTCTime end start, ret)
```

We start by collecting the user defined functions in the current input with the previously defined functions in the session such that current functions override the previous functions with the same names. At this point, if the `dump` setting is set, we print the program AST.

Then we invoke the `interpret` function provided by the `Language.FiboLisp` module. Recall that the [`interpret`](#cb5-10) function takes the program to interpret and a function of type `String -> IO ()`. This function is a color-adding wrapper over the function returned by the Haskeline function `getExternalPrint`[<sup>12</sup>](#fn12). This function allows non-REPL code to safely print to the Haskeline driven REPL without garbling the output. We pass it to the `interpret` function so that the interpret can invoke it when the user code invokes the builtin `print` function or similar.

We make sure to [`force`](https://hackage.haskell.org/package/deepseq/docs/Control-DeepSeq.html#v:force) and [`evaluate`](https://hackage.haskell.org/package/base/docs/Control-Exception.html#v:evaluate) the value returned by the interpreter so that any lazy values or errors are fully evaluated[<sup>13</sup>](#fn13), and the measured elapsed time is correct.

If the interpreter returns an error, we print it. Else we convert the value to a string, and if is it not empty[<sup>14</sup>](#fn14), we print it.

Finally, we print the execution time if the `time` setting is set, and set the REPL defs to the current program defs.

That’s all! We have completed our REPL. But wait, I think we forgot one thing …

Doing the Completions[#](#doing-the-completions)
----------

The REPL would work fine with this much code, but it would not be a good experience for the user, because they’d have to type everything without any help from the REPL. To make it convenient for the user, we provide contextual auto-completion functionality while typing. Haskeline lets us plug in our custom completion logic by setting a completion function, which we did [way back](#cb11-14) at the start. Now we need to implement it.

```
doCompletions :: H.CompletionFunc Repl
doCompletions =
  fmap runIdentityT . H.completeWordWithPrev Nothing " " $ \leftRev word -> do
    defs <- use replDefs
    lineMode <- use replLineMode
    settings <- use replSettings
    let funcs = nub $ Map.keys defs <> Map.keys L.builtinFuncs
        vals = map show L.builtinVals
    case (word, lineMode) of
      ('(' : rest, _) ->
        pure
          [ H.Completion ('(' : hint) hint True
            | hint <- nub . sort $ L.carKeywords <> funcs,
              rest `isPrefixOf` hint
          ]
      (_, SingleLine) -> case word of
        "" | null leftRev ->
          pure [H.Completion "" s True | s <- commands <> funcs <> vals]
        ':' : _ | null leftRev ->
          pure [H.simpleCompletion c | c <- commands, word `isPrefixOf` c]
        _
          | "tes:" `isSuffixOf` leftRev ->
            pure
              [ H.simpleCompletion $ show s
                | s <- [Dump ..], s `notElem` settings, word `isPrefixOf` show s
              ]
          | "tesnu:" `isSuffixOf` leftRev ->
            pure
              [ H.simpleCompletion $ show s
                | s <- [Dump ..], s `elem` settings, word `isPrefixOf` show s
              ]
          | "daol:" `isSuffixOf` leftRev ->
            isSafeFilePath word >>= \case
              True -> H.listFiles word
              False -> pure []
          | "ecruos:" `isSuffixOf` leftRev ->
            pure
              [ H.simpleCompletion ident
                | ident <- funcs,
                  ident `Map.notMember` L.builtinFuncs,
                  word `isPrefixOf` ident
              ]
          | otherwise ->
            pure [H.simpleCompletion c | c <- funcs <> vals, word `isPrefixOf` c]
      _ -> pure []
  where
    commands = ":help" : ":load" : ":source" : map show [Set ..]
```

Haskeline provides us the `completeWordWithPrev` function to easily create our own completion function. It takes a callback function that it calls with the current word being completed (the word immediately to the left of the cursor), and the content of the line before the word (to the left of the word), reversed. We use these to return different completion lists of strings.

Going case by case:

1. If the word starts with `(`, it means we are in middle of writing FiboLisp code. So we return the [`carKeywords`](#cb1-27) and the user-defined and builtin function names that start with the current word sans the initial `(`. This happens regardless of the current line mode. Rest of the cases below apply only in the `SingleLine` mode.
2. If the entire line is empty, we return the names of all commands, functions, and builtin values.
3. If the word starts with `:`, and is at the beginning of the line, we return the commands that start with the word.
4. If the line starts with
   1. `:set`, we return the **not set** settings
   2. `:unset`, we return the **set** settings
   3. `:load`, we return the names of the files and directories in the current directory
   4. `:source`, we return the names of the user-defined functions

    that start with the word.
5. Otherwise we return no completions.

This covers all cases, and provides helpful completions, while avoiding bad ones. And this completes the implementation of our wonderful REPL.

Conclusion[#](#conclusion)
----------

I wrote this REPL while implementing a Lisp that I wrote[<sup>15</sup>](#fn15) while going through the [Essentials of Compilation book](https://web.archive.org/web/20241031/https://mitpress.mit.edu/9780262047760/essentials-of-compilation/), which I thoroughly recommend for getting started with compilers. It started as a basic REPL, and gathered a lot of nice functionalities over time. So I decided to extract and share it here. I hope that this Haskeline tutorial helps you in creating beautiful and useful REPLs. Here is the complete [code](https://abhinavsarkar.net/code/fibolisp-repl.html?mtm_campaign=feed) for the REPL.

 If you have any questions or comments, please leave a comment below. If you liked this post, please share it. Thanks for reading!

---

1. The online demo is rather slow to load and to run, and works only on Firefox and Chrome. Even though I managed to put it together somehow, I don’t actually know how it exactly works, and I’m unable to fix the issues with it.[↩︎](#fnref1)

2. Lisps are awesome and I absolutely recommend creating one or more of them as an amateur PL implementer. Some resources I recommend are: the [Build Your Own Lisp](https://web.archive.org/web/20241031/https://www.buildyourownlisp.com/) book, and the [Make-A-Lisp](https://github.com/kanaka/mal) tutorial.[↩︎](#fnref2)

3. REPLs are wonderful for doing interactive and exploratory programming where you try out small snippets of code in the REPL, and put your program together piece-by-piece. They are also good for debugging because they let you inspect the state of running programs from within. I still fondly remember the experience of connecting (or [jacking in](https://docs.cider.mx/cider/basics/up_and_running.html#launch-an-nrepl-server-from-emacs)) to running productions systems written in [Clojure](https://clojure.org) over REPL, and figuring out issues by dumping variables.[↩︎](#fnref3)

4. We don’t even need `let`. We can, and have to, define variables by creating functions, with parameters serving the role of variables. In fact, we can’t even assign or reassign variables. Functions are the only scoping mechanism in FiboLisp, much like old-school JavaScript with its [IIFEs](https://developer.mozilla.org/en-US/docs/Glossary/IIFE).[↩︎](#fnref4)

5. *car* is obviously [**C**ontents of the **A**ddress part of the **R**egister](https://en.wikipedia.org/wiki/CAR_and_CDR), the first expression in a list form in a Lisp.[↩︎](#fnref5)

6. You may be wondering about why we need the `NFData` instances for the errors and values. This will become clear when we write the REPL.[↩︎](#fnref6)

7. I recommend the [sexp-grammar](https://hackage.haskell.org/package/sexp-grammar) library, which provides both parsing and printing facilities for S-expressions based languages. Or you can write something by yourself using the parsing and pretty-printing libraries like [megaparsec](https://hackage.haskell.org/package/megaparsec) and [prettyprinter](https://hackage.haskell.org/package/prettyprinter).[↩︎](#fnref7)

8. We assume that our project’s Cabal file sets the default-language to GHC2021, and the default-extensions to `LambdaCase`, `OverloadedStrings`, `RecordWildCards`, and `StrictData`.[↩︎](#fnref8)

9. Recall that there is no way to define variables in FiboLisp.[↩︎](#fnref9)

10. If the interpreter allows mutually recursive function definitions, functions can be called before defining them.[↩︎](#fnref10)

11. We are using the [basic-lens](https://hackage.haskell.org/package/basic-lens) library here, which is the tiniest lens library, and provides only the five functions and types we see used here.[↩︎](#fnref11)

12. Using the function returned from `getExternalPrint` is not necessary in our case because the REPL blocks when it invokes the interpreter. That means, nothing but the interpreter can print anything while it is running. So the interpreter can actually print directly to `stdout` and nothing will go wrong.

   However, imagine a case in which our code starts a background thread that needs to print to the REPL. In such case, we must use the Haskeline provided print function instead of printing directly. When printing to the REPL using it, Haskeline coordinates the prints so that the output in the terminal is not garbled.[↩︎](#fnref12)

13. Now we see why we [derive](#cb5-12) `NFData` instances for errors and `Value`.[↩︎](#fnref13)

14. Returned value could be of type void with no textual representation, in which case we would not print it.[↩︎](#fnref14)

15. I wrote the original REPL code almost three years ago. I refactored, rewrote and improved a lot of it in the course of writing this post. As they say, writing is thinking.[↩︎](#fnref15)

---

Thanks for reading this post via feed. Feeds are great, and you're great for using them. ♥

This post was originally published on [abhinavsarkar.net](https://abhinavsarkar.net/posts/repling-with-haskeline/?mtm_campaign=feed).

### Like, repost, or comment on: ###

* [Fediverse](https://fantastic.earth/@abnv/113400096862417591)
* [Lobsters](https://lobste.rs/s/7vjlxx)
* [Reddit](https://www.reddit.com/r/haskell/comments/1gg5zrb/)
* [Discourse](https://discourse.haskell.org/t//10644)
* [My website](https://abhinavsarkar.net/posts/repling-with-haskeline/?mtm_campaign=feed#comment-container)

Read more of my [posts](https://abhinavsarkar.net/posts/) and [notes](https://abhinavsarkar.net/notes/).

![](https://anna.abhinavsarkar.net/matomo.php?idsite=1&rec=1)