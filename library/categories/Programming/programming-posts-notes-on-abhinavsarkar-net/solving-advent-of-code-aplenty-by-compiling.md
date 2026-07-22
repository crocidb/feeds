+++
title = "Solving Advent of Code “Aplenty” by Compiling"
description = "Every year I try to solve some problems from the Advent of Code (AoC) competition in a not straightforward [way](https://abhinavsarkar.ne"
date = "2024-04-07T00:00:00Z"
url = "https://abhinavsarkar.net/posts/compiling-aoc23-aplenty/"
author = "Abhinav Sarkar"
text = ""
lastupdated = "2026-07-21T09:17:41.519888420Z"
seen = false
+++

Every year I try to solve some problems from the [Advent of Code](https://adventofcode.com) (AoC) competition in a [not](https://abhinavsarkar.net/posts/type-level-haskell-aoc7/?mtm_campaign=feed) [straightforward](https://abhinavsarkar.net/notes/2022-type-level-rps?mtm_campaign=feed) [way](https://abhinavsarkar.net/posts/parsers-zippers-interpreters-aoc7/?mtm_campaign=feed). Let’s solve the part one of the day 19 problem [Aplenty](https://adventofcode.com/2023/day/19) by compiling the problem input to an executable file.

This post was originally published on [abhinavsarkar.net](https://abhinavsarkar.net/posts/compiling-aoc23-aplenty/?mtm_campaign=feed).

This post is a part of the series: **Solving Advent of Code**.

1. [“Handy Haversacks” in Type-level Haskell](https://abhinavsarkar.net/posts/type-level-haskell-aoc7/?mtm_campaign=feed)
2. [“No Space Left On Device” with Parsers, Zippers and Interpreters](https://abhinavsarkar.net/posts/parsers-zippers-interpreters-aoc7/?mtm_campaign=feed)
3. [“Rock-Paper-Scissors” in Type-level Haskell](https://abhinavsarkar.net/notes/2022-type-level-rps/?mtm_campaign=feed)
4. **“Aplenty” by Compiling** 👈
5. [“Seating System” with Comonads and Stencils](https://abhinavsarkar.net/posts/solving-aoc20-seating-system/?mtm_campaign=feed)

### Contents ###

1. [The Problem](#the-problem)
2. [The Parser](#the-parser)
3. [The Interpreter](#the-interpreter)
4. [The Control-flow Graph](#the-control-flow-graph)
5. [The Compiler](#the-compiler)
6. [The Compiler Output](#the-compiler-output)
7. [The Bonus: Optimizations](#the-bonus-optimizations)
8. [The Conclusion](#the-conclusion)

The Problem[#](#the-problem)
----------

What the problem presents as input is essentially a program. Here is the example input:

```
px{a<2006:qkq,m>2090:A,rfg}
pv{a>1716:R,A}
lnx{m>1548:A,A}
rfg{s<537:gd,x>2440:R,A}
qs{s>3448:A,lnx}
qkq{x<1416:A,crn}
crn{x>2662:A,R}
in{s<1351:px,qqz}
qqz{s>2770:qs,m<1801:hdj,R}
gd{a>3333:R,R}
hdj{m>838:A,pv}

{x=787,m=2655,a=1222,s=2876}
{x=1679,m=44,a=2067,s=496}
{x=2036,m=264,a=79,s=2244}
{x=2461,m=1339,a=466,s=291}
{x=2127,m=1623,a=2188,s=1013}
```

 exinput.txt

Each line in the first section of the input is a code block. The bodies of the blocks have statements of these types:

* *Accept* (`A`) or *Reject* (`R`) that terminate the program.
* Jumps to other blocks by their names, for example: `rfg` as the last statement of the `px` block in the first line.
* Conditional statements that have a condition and what to do if the condition is true, which can be only Accept/Reject or a jump to another block.

The problem calls the statements *“rules”*, the blocks *“workflows”*, and the program *“system”*.

All blocks of the program operates on a set of four values: `x`, `m`, `a`, and `s`. The problem calls them *“ratings”*, and each set of ratings is for/forms a *“part”*. The second section of the input specifies a bunch of these parts to run the system against.

This seems to map very well to a C program, with `Accept` and `Reject` returning `true` and `false` respectively, and jumps accomplished using `goto`s. So that’s what we’ll do: we’ll compile the problem input to a C program, then compile that to an executable, and run it to get the solution to the problem.

And of course, we’ll do all this in Haskell. First some imports:

```
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE StrictData #-}

module Main where

import qualified Data.Array as Array
import Data.Char (digitToInt, isAlpha, isDigit)
import Data.Foldable (foldl', foldr')
import Data.Function (fix)
import Data.Functor (($>))
import qualified Data.Graph as Graph
import Data.List (intercalate, (\\))
import qualified Data.Map.Strict as Map
import System.Environment (getArgs)
import qualified Text.ParserCombinators.ReadP as P
import Prelude hiding (GT, LT)
```

The Parser[#](#the-parser)
----------

First, we parse the input program to Haskell data types. We use the [ReadP](https://hackage.haskell.org/package/base/docs/Text-ParserCombinators-ReadP.html) parser library built into the Haskell standard library.

```
data Part = Part
  { partX :: Int,
    partM :: Int,
    partA :: Int,
    partS :: Int
  } deriving (Show)

data Rating = X | M | A | S deriving (Show, Eq)

emptyPart :: Part
emptyPart = Part 0 0 0 0

addRating :: Part -> (Rating, Int) -> Part
addRating p (r, v) = case r of
  X -> p {partX = v}
  M -> p {partM = v}
  A -> p {partA = v}
  S -> p {partS = v}

partParser :: P.ReadP Part
partParser =
  foldl' addRating emptyPart
    <$> P.between (P.char '{') (P.char '}')
          (partRatingParser `P.sepBy1` P.char ',')

partRatingParser :: P.ReadP (Rating, Int)
partRatingParser =
  (,) <$> ratingParser <*> (P.char '=' *> intParser)

ratingParser :: P.ReadP Rating
ratingParser =
  P.get >>= \case
    'x' -> pure X
    'm' -> pure M
    'a' -> pure A
    's' -> pure S
    _ -> P.pfail

intParser :: P.ReadP Int
intParser =
  foldl' (\n d -> n * 10 + d) 0 <$> P.many1 digitParser

digitParser :: P.ReadP Int
digitParser = digitToInt <$> P.satisfy isDigit

parse :: (Show a) => P.ReadP a -> String -> Either String a
parse parser text = case P.readP_to_S (parser <* P.eof) text of
  [(res, "")] -> Right res
  [(_, s)] -> Left $ "Leftover input: " <> s
  out -> Left $ "Unexpected output: " <> show out
```

`Part` is a Haskell data type representing parts, and `Rating` is an enum for, well, ratings[<sup>1</sup>](#fn1). Following that are parsers for parts and ratings, written in Applicative and Monadic styles using the basic parsers and combinators provided by the ReadP library.

Finally, we have the `parse` function to run a parser on an input. We can try parsing parts in GHCi:

```
> parse partParser "{x=2127,m=1623,a=2188,s=1013}"
Right (Part {partX = 2127, partM = 1623, partA = 2188, partS = 1013})
```

Next, we represent and parse the program, I mean, the system:

```
newtype System =
  System (Map.Map WorkflowName Workflow)
  deriving (Show, Eq)

data Workflow = Workflow
  { wName :: WorkflowName,
    wRules :: [Rule]
  } deriving (Show, Eq)

type WorkflowName = String

data Rule
  = AtomicRule AtomicRule
  | If Condition AtomicRule
  deriving (Show, Eq)

data AtomicRule
  = Jump WorkflowName
  | Accept
  | Reject
  deriving (Show, Eq, Ord)

data Condition
  = Comparison Rating CmpOp Int
  deriving (Show, Eq)

data CmpOp = LT | GT deriving (Show, Eq)
```

A `System` is a map of workflows by their names. A `Workflow` has a name and a list of rules. A `Rule` is either an `AtomicRule`, or an `If` rule. An `AtomicRule` is either a `Jump` to another workflow by name, or an `Accept` or `Reject` rule. The `Condition` of an `If` rule is a less that (`LT`) or a greater than (`GT`) `Comparison` of some `Rating` of an input part with an integer value.

Now, it’s time to parse the system:

```
systemParser :: P.ReadP System
systemParser =
  System
    . foldl' (\m wf -> Map.insert (wName wf) wf m) Map.empty
    <$> workflowParser `P.endBy1` P.char '\n'

workflowParser :: P.ReadP Workflow
workflowParser =
  Workflow
    <$> P.many1 (P.satisfy isAlpha)
    <*> P.between (P.char '{') (P.char '}')
          (ruleParser `P.sepBy1` P.char ',')

ruleParser :: P.ReadP Rule
ruleParser =
  (AtomicRule <$> atomicRuleParser) P.<++ ifRuleParser

ifRuleParser :: P.ReadP Rule
ifRuleParser =
  If
    <$> (Comparison <$> ratingParser <*> cmpOpParser <*> intParser)
    <*> (P.char ':' *> atomicRuleParser)

atomicRuleParser :: P.ReadP AtomicRule
atomicRuleParser = do
  c : _ <- P.look
  case c of
    'A' -> P.char 'A' $> Accept
    'R' -> P.char 'R' $> Reject
    _ -> (Jump .) . (:) <$> P.char c <*> P.many1 (P.satisfy isAlpha)

cmpOpParser :: P.ReadP CmpOp
cmpOpParser = P.choice [P.char '<' $> LT, P.char '>' $> GT]
```

Parsing is straightforward as there are no recursive data types or complicated precedence or associativity rules here. We can exercise it in GHCi (output formatted for clarity):

```
> parse workflowParser "px{a<2006:qkq,m>2090:A,rfg}"
Right (
  Workflow {
    wName = "px",
    wRules = [
      If (Comparison A LT 2006) (Jump "qkq"),
      If (Comparison M GT 2090) Accept,
      AtomicRule (Jump "rfg")
    ]
  }
)
```

Excellent! We can now combine the part parser and the system parser to parse the problem input:

```
data Input = Input System [Part] deriving (Show)

inputParser :: P.ReadP Input
inputParser =
  Input
    <$> systemParser
    <*> (P.char '\n' *> partParser `P.endBy1` P.char '\n')
```

Before moving on to translating the system to C, let’s write an interpreter so that we can compare the output of our final C program against it for validation.

The Interpreter[#](#the-interpreter)
----------

Each system has a workflow named “in”, where the execution of the system starts. Running the system results in `True` if the run ends with an `Accept` rule, or in `False` if the run ends with a `Reject` rule. With this in mind, let’s cook up the interpreter:

```
runSystem :: System -> Part -> Bool
runSystem (System system) part = runRule $ Jump "in"
  where
    runRule = \case
      Accept -> True
      Reject -> False
      Jump wfName -> jump wfName

    jump wfName = case Map.lookup wfName system of
      Just workflow -> runRules $ wRules workflow
      Nothing ->
        error $ "Workflow not found in system: " <> wfName

    runRules = \case
      (rule : rest) -> case rule of
        AtomicRule aRule -> runRule aRule
        If cond aRule ->
          if evalCond cond
            then runRule aRule
            else runRules rest
      _ -> error "Workflow ended without accept/reject"

    evalCond = \case
      Comparison r LT value -> rating r < value
      Comparison r GT value-> rating r > value

    rating = \case
      X -> partX part
      M -> partM part
      A -> partA part
      S -> partS part
```

The interpreter starts by running the rule to jump to the “in” workflow. Running a rule returns `True` or `False` for `Accept` or `Reject` rules respectively, or jumps to a workflow for `Jump` rules. Jumping to a workflow looks it up in the system’s map of workflows, and sequentially runs each of its rules.

An `AtomicRule` is run as previously mentioned. An `If` rule evaluates its condition, and either runs the consequent rule if the condition is true, or moves on to running the rest of the rules in the workflow.

That’s it for the interpreter. We can run it on the example input:

```
> inputText <- readFile "input.txt"
> Right (Input system parts) = parse inputParser inputText
> runSystem system (parts !! 0)
True
> runSystem system (parts !! 1)
False
```

The AoC problem requires us to return the sum total of the ratings of the parts that are accepted by the system:

```
solve :: Input -> Int
solve (Input system parts) =
  sum
  . map (\(Part x m a s) -> x + m + a + s)
  . filter (runSystem system)
  $ parts
```

Let’s run it for the example input:

```
> Right input <- parse inputParser <$> readFile "exinput.txt"
> solve input
19114
```

It returns the correct answer! Next up, we generate some C code.

The Control-flow Graph[#](#the-control-flow-graph)
----------

But first, a quick digression to graphs. A [Control-flow graph](https://en.wikipedia.org/wiki/Control-flow_graph) or CFG, is a graph of all possible paths that can be taken through a program during its execution. It has many uses in compilers, but for now, we use it to generate more readable C code.

Using the [`Data.Graph`](https://hackage.haskell.org/package/containers/docs/Data-Graph.html) module from the `containers` package, we write the function to create a control-flow graph for our system/program, and use it to [topologically sort](https://en.wikipedia.org/wiki/Topological_sorting) the workflows:

```
type Graph' a =
  (Graph.Graph, Graph.Vertex -> (a, [a]), a -> Maybe Graph.Vertex)

cfGraph :: Map.Map WorkflowName Workflow -> Graph' WorkflowName
cfGraph system =
  graphFromMap
    . Map.toList
    . flip Map.map system
    $ \(Workflow _ rules) ->
      flip concatMap rules $ \case
        AtomicRule (Jump wfName) -> [wfName]
        If _ (Jump wfName) -> [wfName]
        _ -> []
  where
    graphFromMap :: (Ord a) => [(a, [a])] -> Graph' a
    graphFromMap m =
      let (graph, nLookup, vLookup) =
            Graph.graphFromEdges $ map (\(f, ts) -> (f, f, ts)) m
       in (graph, \v -> let (x, _, xs) = nLookup v in (x, xs), vLookup)

toposortWorkflows :: Map.Map WorkflowName Workflow -> [WorkflowName]
toposortWorkflows system =
  let (cfg, nLookup, _) = cfGraph system
   in map (fst . nLookup) $ Graph.topSort cfg
```

`Graph'` is a simpler type for a graph of nodes of type `a`. The `cfGraph` function takes a the map from workflow names to workflows — that is, a system — and returns a control-flow graph of workflow names. It does this by finding jumps from workflows to other workflows, and connecting them.

Then, the `toposortWorkflows` function uses the created CFG to topologically sort the workflows. We’ll see this in action in a bit. Moving on to …

The Compiler[#](#the-compiler)
----------

The compiler, for now, simply generates the C code for a given system. We write a `ToC` typeclass for convenience:

```
class ToC a where
  toC :: a -> String

instance ToC Part where
  toC (Part x m a s) =
    "{" <> intercalate ", " (map show [x, m, a, s]) <> "}"

instance ToC CmpOp where
  toC = \case
    LT -> "<"
    GT -> ">"

instance ToC Rating where
  toC = \case
    X -> "x"
    M -> "m"
    A -> "a"
    S -> "s"

instance ToC AtomicRule where
  toC = \case
    Accept -> "return true;"
    Reject -> "return false;"
    Jump wfName -> "goto " <> wfName <> ";"

instance ToC Condition where
  toC = \case
    Comparison rating op val ->
      toC rating <> " " <> toC op <> " " <> show val

instance ToC Rule where
  toC = \case
    AtomicRule aRule -> toC aRule
    If cond aRule ->
      "if (" <> toC cond <> ") { " <> toC aRule <> " }"

instance ToC Workflow where
  toC (Workflow wfName rules) =
    wfName
      <> ":\n"
      <> intercalate "\n" (map (("  " <>) . toC) rules)

instance ToC System where
  toC (System system) =
    intercalate
      "\n"
      [ "bool runSystem(int x, int m, int a, int s) {",
        "  goto in;",
        intercalate
          "\n"
          (map (toC . (system Map.!)) $ toposortWorkflows system),
        "}"
      ]

instance ToC Input where
  toC (Input system parts) =
    intercalate
      "\n"
      [ "#include <stdbool.h>",
        "#include <stdio.h>\n",
        toC system,
        "int main() {",
        "  int parts[][4] = {",
        intercalate ",\n" (map (("    " <>) . toC) parts),
        "  };",
        "  int totalRating = 0;",
        "  for(int i = 0; i < " <> show (length parts) <> "; i++) {",
        "    int x = parts[i][0];",
        "    int m = parts[i][1];",
        "    int a = parts[i][2];",
        "    int s = parts[i][3];",
        "    if (runSystem(x, m, a, s)) {",
        "      totalRating += x + m + a + s;",
        "    }",
        "  }",
        "  printf(\"%d\", totalRating);",
        "  return 0;",
        "}"
      ]
```

As mentioned before, `Accept` and `Reject` rules are converted to return `true` and `false` respectively, and `Jump` rules are converted to `goto`s. `If` rules become `if` statements, and `Workflow`s become block labels followed by block statements.

A `System` is translated to a function `runSystem` that takes four parameters, `x`, `m`, `a` and `s`, and runs the workflows translated to blocks by executing `goto in`.

Finally, an `Input` is converted to a C file with the required includes, and a `main` function that solves the problem by calling the `runSystem` function for all parts.

Let’s throw in a `main` function to put everything together.

```
main :: IO ()
main = do
  file <- head <$> getArgs
  code <- readFile file
  case parse inputParser code of
    Right input -> putStrLn $ toC input
    Left err -> error err
```

The `main` function reads the input from the file provided as the command line argument, parses it and outputs the generated C code. Let’s run it now.

The Compiler Output[#](#the-compiler-output)
----------

We compile our compiler and run it to generate the C code for the example problem:

```
$ ghc --make aplenty.hs
$ ./aplenty exinput.txt > aplenty.c
```

This is the C code it generates:

```
#include <stdbool.h>
#include <stdio.h>

bool runSystem(int x, int m, int a, int s) {
  goto in;
in:
  if (s < 1351) { goto px; }
  goto qqz;
qqz:
  if (s > 2770) { goto qs; }
  if (m < 1801) { goto hdj; }
  return false;
qs:
  if (s > 3448) { return true; }
  goto lnx;
lnx:
  if (m > 1548) { return true; }
  return true;
px:
  if (a < 2006) { goto qkq; }
  if (m > 2090) { return true; }
  goto rfg;
rfg:
  if (s < 537) { goto gd; }
  if (x > 2440) { return false; }
  return true;
qkq:
  if (x < 1416) { return true; }
  goto crn;
hdj:
  if (m > 838) { return true; }
  goto pv;
pv:
  if (a > 1716) { return false; }
  return true;
gd:
  if (a > 3333) { return false; }
  return false;
crn:
  if (x > 2662) { return true; }
  return false;
}
int main() {
  int parts[][4] = {
    {787, 2655, 1222, 2876},
    {1679, 44, 2067, 496},
    {2036, 264, 79, 2244},
    {2461, 1339, 466, 291},
    {2127, 1623, 2188, 1013}
  };
  int totalRating = 0;
  for(int i = 0; i < 5; i++) {
    int x = parts[i][0];
    int m = parts[i][1];
    int a = parts[i][2];
    int s = parts[i][3];
    if (runSystem(x, m, a, s)) {
      totalRating += x + m + a + s;
    }
  }
  printf("%d", totalRating);
  return 0;
}
```

We see the `toposortWorkflows` function in action, sorting the blocks in the topological order of jumps between them, as opposed to the [original input](#the-problem). Does this work? Only one way to know:

```
$ gcc aplenty.c -o solution
$ ./solution
19114
```

Perfect! The solution matches the interpreter output.

The Bonus: Optimizations[#](#the-bonus-optimizations)
----------

By studying the output C code, we spot some possibilities for optimizing the compiler output. Notice how the `lnx` block returns same value (`true`) regardless of which branch it takes:

```
lnx:
  if (m > 1548) { return true; }
  return true;
```

So, we should be able to replace it with:

```
lnx:
  return true;
```

If we do this, the `lnx` block becomes degenerate, and hence the jumps to the block can be inlined, turning the `qs` block from:

```
qs:
  if (s > 3448) { return true; }
  goto lnx;
```

to:

```
qs:
  if (s > 3448) { return true; }
  return true;
```

which makes the `if` statement in the `qs` block redundant as well. Hence, we can repeat the previous optimization and further reduce the generated code.

Another possible optimization is to inline the blocks to which there are only single jumps from the rest of the blocks, for example the `qqz` block.

Let’s write these optimizations.

### Simplify Workflows[#](#simplify-workflows) ###

```
simplifyWorkflows :: System -> System
simplifyWorkflows (System system) =
  System $ Map.map simplifyWorkflow system
  where
    simplifyWorkflow (Workflow name rules) =
      Workflow name
        $ foldr'
          ( \r rs -> case rs of
              [r'] | ruleOutcome r == ruleOutcome r' -> rs
              _ -> r : rs
          )
          [last rules]
        $ init rules

    ruleOutcome = \case
      If _ aRule -> aRule
      AtomicRule aRule -> aRule
```

`simplifyWorkflows` goes over all workflows and repeatedly removes the statements from the end of the blocks that has same outcome as the statement previous to them.

### Inline Redundant Jumps[#](#inline-redundant-jumps) ###

```
inlineRedundantJumps :: System -> System
inlineRedundantJumps (System system) =
  System $
    foldl' (flip Map.delete) (Map.map inlineJumps system) $
      Map.keys redundantJumps
  where
    redundantJumps =
      Map.map (\wf -> let ~(AtomicRule rule) = head $ wRules wf in rule)
        . Map.filter (\wf -> length (wRules wf) == 1)
        $ system

    inlineJumps (Workflow name rules) =
      Workflow name $ map inlineJump rules

    inlineJump = \case
      AtomicRule (Jump wfName)
        | Map.member wfName redundantJumps ->
            AtomicRule $ redundantJumps Map.! wfName
      If cond (Jump wfName)
        | Map.member wfName redundantJumps ->
            If cond $ redundantJumps Map.! wfName
      rule -> rule
```

`inlineRedundantJumps` find the jumps to degenerate workflows and inlines them. It does this by first going over all workflows and creating a map of degenerate workflow names to the only rule in them, and then replacing the jumps to such workflows with the only rules.

### Remove Jumps[#](#remove-jumps) ###

```
removeJumps :: System -> System
removeJumps (System system) =
  let system' =
        foldl' (flip $ Map.adjust removeJumpsWithSingleJumper) system $
          toposortWorkflows system
   in System
        . foldl' (flip Map.delete) system'
        . (\\ ["in"])
        $ workflowsWithNJumpers 0 system'
  where
    removeJumpsWithSingleJumper (Workflow name rules) =
      Workflow name $
        init rules <> case last rules of
          AtomicRule (Jump wfName)
            | wfName `elem` workflowsWithSingleJumper ->
                let (Workflow _ rules') = system Map.! wfName
                 in rules'
          rule -> [rule]

    workflowsWithSingleJumper = workflowsWithNJumpers 1 system

    workflowsWithNJumpers n sys =
      let (cfg, nLookup, _) = cfGraph sys
       in map (fst . nLookup . fst)
            . filter (\(_, d) -> d == n)
            . Array.assocs
            . Graph.indegree
            $ cfg
```

`removeJumps` does two things: first, it finds blocks with only one jumper, and inlines their statements to the jump location. Then it finds blocks to which there are no jumps, and removes them entirely from the program. It uses the `workflowsWithNJumpers` helper function that uses the control-flow graph of the system to find all workflows to which there are `n` number of jumps, where `n` is provided as an input to the function. Note the usage of the `toposortWorkflows` function here, which makes sure that we remove the blocks in topological order, accumulating as many statements as possible in the final program.

With these functions in place, we write the `optimize` function:

```
optimize :: System -> System
optimize =
  applyTillUnchanged
    (removeJumps . inlineRedundantJumps . simplifyWorkflows)
  where
    applyTillUnchanged :: (Eq a) => (a -> a) -> a -> a
    applyTillUnchanged f =
      fix (\recurse x -> if f x == x then x else recurse (f x))
```

We execute the three optimization functions repeatedly till a [fixed point](https://en.wikipedia.org/wiki/Fixed-point_combinator) is reached for the resultant `System`, that is, till there are no further possibilities of optimization.

Finally, we change our `main` function to apply the optimizations:

```
main :: IO ()
main = do
  file <- head <$> getArgs
  code <- readFile file
  case parse inputParser code of
    Right (Input system parts) ->
      putStrLn . toC $ Input (optimize system) parts
    Left err -> error err
```

Compiling the optimized compiler and running it as earlier, generates this C code for the `runSystem` function now:

```
bool runSystem(int x, int m, int a, int s) {
  goto in;
in:
  if (s < 1351) { goto px; }
  if (s > 2770) { return true; }
  if (m < 1801) { goto hdj; }
  return false;
px:
  if (a < 2006) { goto qkq; }
  if (m > 2090) { return true; }
  if (s < 537) { return false; }
  if (x > 2440) { return false; }
  return true;
qkq:
  if (x < 1416) { return true; }
  if (x > 2662) { return true; }
  return false;
hdj:
  if (m > 838) { return true; }
  if (a > 1716) { return false; }
  return true;
}
```

It works well[<sup>2</sup>](#fn2). We now have 1.7x fewer lines of code as compared to before[<sup>3</sup>](#fn3).

The Conclusion[#](#the-conclusion)
----------

This was another attempt to solve Advent of Code problems in somewhat unusual ways. This year we learned some basics of compilation. Swing by next year for more weird ways to solve simple problems.

The full code for this post is available [here](https://abhinavsarkar.net/code/aplenty.html?mtm_campaign=feed).

 If you have any questions or comments, please leave a comment below. If you liked this post, please share it. Thanks for reading!

---

1. I love how I have to write XMAS horizontally and vertically a couple of time.[↩︎](#fnref1)

2. I’m sure many more optimizations are possible yet. After all, this program is essentially a decision tree.[↩︎](#fnref2)

3. For the actual problem input with 522 blocks, the optimizations reduce the LoC by 1.5x.[↩︎](#fnref3)

This post is a part of the series: **Solving Advent of Code**.

1. [“Handy Haversacks” in Type-level Haskell](https://abhinavsarkar.net/posts/type-level-haskell-aoc7/?mtm_campaign=feed)
2. [“No Space Left On Device” with Parsers, Zippers and Interpreters](https://abhinavsarkar.net/posts/parsers-zippers-interpreters-aoc7/?mtm_campaign=feed)
3. [“Rock-Paper-Scissors” in Type-level Haskell](https://abhinavsarkar.net/notes/2022-type-level-rps/?mtm_campaign=feed)
4. **“Aplenty” by Compiling** 👈
5. [“Seating System” with Comonads and Stencils](https://abhinavsarkar.net/posts/solving-aoc20-seating-system/?mtm_campaign=feed)

---

Thanks for reading this post via feed. Feeds are great, and you're great for using them. ♥

This post was originally published on [abhinavsarkar.net](https://abhinavsarkar.net/posts/compiling-aoc23-aplenty/?mtm_campaign=feed).

### Like, repost, or comment on: ###

* [Fediverse](https://fantastic.earth/@abnv/112230912525636389)
* [Lobsters](https://lobste.rs/s/s8pwku)
* [Reddit](https://www.reddit.com/r/haskell/comments/1by8p1b/)
* [My website](https://abhinavsarkar.net/posts/compiling-aoc23-aplenty/?mtm_campaign=feed#comment-container)

Read more of my [posts](https://abhinavsarkar.net/posts/) and [notes](https://abhinavsarkar.net/notes/).

![](https://anna.abhinavsarkar.net/matomo.php?idsite=1&rec=1)