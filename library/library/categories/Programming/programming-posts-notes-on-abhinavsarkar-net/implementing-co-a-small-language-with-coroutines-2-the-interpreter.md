+++
title = "Implementing Co, a Small Language With Coroutines #2: The Interpreter"
description = "In the previous post, we wrote the parser for Co, the small language we are building in this series of posts. The previous post was all about the syntax of Co. In this post we dive into the semantics of Co, and write an interp"
date = "2021-09-21T00:00:00Z"
url = "https://abhinavsarkar.net/posts/implementing-co-2/"
author = "Abhinav Sarkar"
text = ""
lastupdated = "2026-07-21T09:17:41.591948234Z"
seen = false
+++

In the [previous post](https://abhinavsarkar.net/posts/implementing-co-1/?mtm_campaign=feed), we wrote the parser for Co, the small language we are building in this series of posts. The previous post was all about the syntax of Co. In this post we dive into the semantics of Co, and write an interpreter for its basic features.

This post was originally published on [abhinavsarkar.net](https://abhinavsarkar.net/posts/implementing-co-2/?mtm_campaign=feed).

This post is a part of the series: **Implementing Co, a Small Language With Coroutines**.

1. [The Parser](https://abhinavsarkar.net/posts/implementing-co-1/?mtm_campaign=feed)
2. **The Interpreter** 👈
3. [Adding Coroutines](https://abhinavsarkar.net/posts/implementing-co-3/?mtm_campaign=feed)
4. [Adding Channels](https://abhinavsarkar.net/posts/implementing-co-4/?mtm_campaign=feed)
5. [Adding Sleep](https://abhinavsarkar.net/posts/implementing-co-5/?mtm_campaign=feed)

### Contents ###

1. [Previously, on …](#previously-on)
2. [Running a Program](#running-a-program)
3. [Runtime Values](#runtime-values)
4. [Environment Model of Evaluation](#environment-model-of-evaluation)
5. [Scopes](#scopes)
6. [Closures](#closures)
7. [Early Returns](#early-returns)
8. [The Interpreter](#the-interpreter)
9. [Manipulating Environments](#manipulating-environments)
10. [Evaluating Expressions](#evaluating-expressions)
11. [Executing Statements](#executing-statements)
12. [Evaluating Function Calls](#evaluating-function-calls)
13. [Interpreting a Program](#interpreting-a-program)

Previously, on …[#](#previously-on)
----------

Here’s a quick recap. The basic features of Co that we are aiming to implement in this post are:

* [Dynamic](https://en.wikipedia.org/wiki/Dynamic_typing) and [strong](https://en.wikipedia.org/wiki/Strong_typing) typing.
* Null, boolean, string and integer literals, and values.
* Addition, subtraction, multiplication and integer division arithmetic operations.
* String concatenation operation.
* Equality and inequality checks on booleans, strings and numbers.
* Less-than and greater-than comparison operations on numbers.
* Variable declarations, usage and assignments.
* `if` and `while` statements.
* Function declarations and calls, with support for recursion.
* First class functions and anonymous functions.
* Mutable closures.

Note that some parts of code snippets in this post have been faded away. These are the part which add support for coroutines and channels. You can safely ignore these parts for now. We’ll go over them in the next post.

We represent the Co [*Abstract Syntax Tree*](https://en.wikipedia.org/wiki/Abstract_Syntax_Tree) (AST) as a pair of Haskell [Algebraic Data Types](https://en.wikipedia.org/wiki/Algebraic_data_type) (ADTs), one for [*Expressions*](https://en.wikipedia.org/wiki/Expression_(computer_science)):

```
data Expr
  = LNull
  | LBool Bool
  | LStr String
  | LNum Integer
  | Variable Identifier
  | Binary BinOp Expr Expr
  | Call Expr [Expr]
  | Lambda [Identifier] [Stmt]
  | Receive Expr
  deriving (Show, Eq)

type Identifier = String
```

And another for [*Statements*](https://en.wikipedia.org/wiki/Statement_(computer_science)):

```
data Stmt
  = ExprStmt Expr
  | VarStmt Identifier Expr
  | AssignStmt Identifier Expr
  | IfStmt Expr [Stmt]
  | WhileStmt Expr [Stmt]
  | FunctionStmt Identifier [Identifier] [Stmt]
  | ReturnStmt (Maybe Expr)
  | YieldStmt
  | SpawnStmt Expr
  | SendStmt Expr Expr
  deriving (Show, Eq)

type Program = [Stmt]
```

Also, `program` is the parser for Co programs. To parse code, run the `program` parser with the `runParser` function like this:

```
> runParser program "var x = 1 + s;"
Right [VarStmt "x" (Binary Plus (LNum 1) (Variable "s"))]
```

Now, off to the new stuff.

Running a Program[#](#running-a-program)
----------

There are many ways to run a program. If the program is written in [*Machine Code*](https://en.wikipedia.org/wiki/Machine_Code), you can run it directly on the matching [CPU](https://en.wikipedia.org/wiki/CPU). But machine code is too [low-level](https://en.wikipedia.org/wiki/Low-level_programming_language), and writing programs in it is very tedious and error-prone. Thus, programmers prefer to write code in [high-level programming languages](https://en.wikipedia.org/wiki/high-level_programming_languages), and turn it into machine code to be able to run it<sup><a href="#ref-Abelson1996-c4" class="citation" title="Abelson, Sussman, and with&nbsp;Julie&nbsp;Sussman, “Metalinguistic Abstraction.”">@1</a></sup>. Here’s where different ways of running code come in:

* We can run the high-level code through a [*Compiler*](https://en.wikipedia.org/wiki/Compiler) to turn it into machine code to be able to run it directly. Example: compiling [C++](https://en.wikipedia.org/wiki/C++) using [GCC](https://en.wikipedia.org/wiki/GNU_Compiler_Collection).
* We can run the code through a compiler which turns it into a relatively lower-level programming language code, and then run that lower-level program through another compiler to turn it into machine code. Example: compiling [Haskell](https://www.haskell.org) into [LLVM IR](https://web.archive.org/web/20210921/https://llvm.org/) using [GHC](https://www.haskell.org/ghc/), which can then be run through the LLVM toolchain to generate machine code.
* We can run the code through a [*Transpiler*](https://en.wikipedia.org/wiki/Transpiler) (also called *Source-to-source compiler*) to turn it into code in a programming language that is of similar level, and then run the resultant code with that language’s toolchain. Example: transpiling [Purescript](https://www.purescript.org/) into [JavaScript](https://en.wikipedia.org/wiki/JavaScript), and running it with [node.js](https://nodejs.org/).
* We can compile the source code to [*Bytecode*](https://en.wikipedia.org/wiki/Bytecode) and run the bytecode on a [*Virtual Machine*](https://en.wikipedia.org/wiki/Virtual_Machine). Example: [Java virtual machine](https://en.wikipedia.org/wiki/Java_virtual_machine) running [Java](https://en.wikipedia.org/wiki/Java) bytecode compiled from [Clojure](https://clojure.org/) source code by the Clojure compiler.
* We can parse the code to an AST, and immediately execute the AST using an [*AST Interpreter*](https://en.wikipedia.org/wiki/Interpreter_(computing)#Abstract_syntax_tree_interpreters). Example: [PHP](https://www.php.net/) version 3, [Bash](https://www.gnu.org/software/bash/). [<sup>1</sup>](#fn1)
* We can also mix-and-match parts of the above options to create hybrids, like [*Just-in-time compilation*](https://en.wikipedia.org/wiki/Just-in-time_compilation) to machine code within a virtual machine.

![Many ways to run a program](data:image/svg+xml,%3Csvg%20xmlns='http://www.w3.org/2000/svg'%20viewBox='0%200%20641%20529'%3E%3C/svg%3E) \<img src="/images/implementing-co-2/source-to-machine.svg" class="w-100pct nolink" alt="Many ways to run a program"\>\</img\> Many ways to run a program

For running Co programs, we will implement an AST-walking interpreter. The interpreter implemented in this post will support only the [basic features](#previously-on) of Co. In the next post, we’ll extend it to support coroutines and channels.

The complete code for the interpreter is [here](https://abhinavsarkar.net/code/co-interpreter.html?mtm_campaign=feed). You can load it in GHCi using [stack](https://en.wikipedia.org/wiki/Low-level_programming_language) (by running `stack co-interpreter.hs`), and follow along while reading this article.

Runtime Values[#](#runtime-values)
----------

An AST-walking interpreter takes an AST as its input, and recursively walks down the AST nodes, from top to bottom. While doing this, it evaluates expressions to runtime values, and executes the statements to do their effects.

The runtime values are things that can be passed around in the code during the program run time. Often called “first-class”, these values can be assigned to variables, passed as function arguments, and returned from functions. If Co were to support data structures like lists and maps, these values could be stored in them as well. The `Value` ADT below represents these values:

```
data Value
  = Null
  | Boolean Bool
  | Str String
  | Num Integer
  | Function Identifier [Identifier] [Stmt] Env
  | BuiltinFunction Identifier Int ([Expr] -> Interpreter Value)
  | Chan Channel
```

Other than the usual values like `null`, booleans, strings, and numbers, we also have functions as first-class runtime values in Co. We have a constructor `Function` for the functions that programmers define in their Co code, and another constructor `BuiltinFunction` for built-in functions like `print`[<sup>2</sup>](#fn2).

We also write instances to show and check equality for these values:

```
instance Show Value where
  show = \case
    Null -> "null"
    Boolean b -> show b
    Str s -> s
    Num n -> show n
    Function name _ _ _ -> "function " <> name
    BuiltinFunction name _ _ -> "function " <> name
    Chan Channel {} -> "Channel"

instance Eq Value where
  Null == Null = True
  Boolean b1 == Boolean b2 = b1 == b2
  Str s1 == Str s2 = s1 == s2
  Num n1 == Num n2 = n1 == n2
  _ == _ = False
```

Note that only `null`, booleans, strings and numbers can be checked for equality in Co. Also, only values of same type can be equals. A string can never be equal to a number[<sup>3</sup>](#fn3).

So, how do we go about turning the expressions to values, and executing statements? Before learning that, we must take a detour into some theory of programming languages.

Readers familiar with the concepts of environments, scopes, closures and early returns can skip the next sections, and jump directly to the [implementation](#the-interpreter).

Environment Model of Evaluation[#](#environment-model-of-evaluation)
----------

Let’s say we have this little Co program to run:

```
var a = 2;
function twice(x) { return x + x; }
print(twice(a));
```

We need to evaluate `twice(a)` to a value to print it. One way to do that is to substitute variables for their values, quite literally. `twice` is a variable, value of which is a function. And `a` is another variable, with value `2`. We can do repeated substitution to arrive at a resultant value like this:

```
print(twice(a));
=> print(twice(2));
=> print(2 + 2);
=> print(4);
```

This is called the [*Substitution model of evaluation*](https://web.archive.org/web/20210921/https://mitp-content-server.mit.edu/books/content/sectbyfn/books_pres_0/6515/sicp.zip/full-text/book/book-Z-H-10.html#%_sec_1.1.5)<sup><a href="#ref-Abelson1996-c115" class="citation" title="Abelson, Sussman, and with&nbsp;Julie&nbsp;Sussman, “The Substitution Model for Procedure Application.”">@5</a></sup>. This works for the example we have above, and for a large set of programs[<sup>4</sup>](#fn4). However, it breaks down as soon as we add mutability to the mix:

```
var a = 2;
function incA() {
  var b = a + 1;
  return b;
}
print(incA());
a = 3;
print(incA());
```

Running this with the Co interpreter results in the output:

```
3
4
```

We can’t use the substitution model here because we can’t consider variables like `a` to be substitutable with single values anymore. Now, we must think of them more as places in which the values are stored. Also, the stored values may change over the lifetime of the program execution. We call this place where the variable values are stored, the *Environment*, and this understanding of program execution is called the [*Environment Model of Evaluation*](https://web.archive.org/web/20210921/https://mitp-content-server.mit.edu/books/content/sectbyfn/books_pres_0/6515/sicp.zip/full-text/book/book-Z-H-21.html#%_sec_3.2)<sup><a href="#ref-Abelson1996-c32" class="citation" title="Abelson, Sussman, and with&nbsp;Julie&nbsp;Sussman, “The Environment Model of Evaluation.”">@7</a></sup>.

![Value of a variable may change over time](data:image/svg+xml,%3Csvg%20xmlns='http://www.w3.org/2000/svg'%20viewBox='0%200%20497%2065'%3E%3C/svg%3E) \<img src="/images/implementing-co-2/env-model.svg" class="w-100pct mw-80pct nolink" alt="Value of a variable may change over time"\>\</img\> Value of a variable may change over time

A pair of a variable’s name and its value at any particular time is called a *Binding*. An *Environment* is a collection of zero-or-more bindings. To fully understand environments, first we have to learn about scopes.

Scopes[#](#scopes)
----------

Let’s consider the `twice` function again:

```
function twice(x) { return x + x; }
print(twice(1));
print(twice(2));
```

Calling `twice` with different arguments prints different results. The function seems to forget the value of its parameter `x` after each call. This may feel very natural to programmers, but how does it really work? The answer is [*Scopes*](https://en.wikipedia.org/wiki/Scope_(computer_science)).

A scope is a region of the program lifetime during which a variable name-to-value binding is in effect. When the program execution enters a scope, the variables in that scope become defined and available to the executing code[<sup>5</sup>](#fn5). When the program execution exits the scope, the variables become undefined and inaccessible (also known as “going out of scope”).

[*Lexical scoping*](https://en.wikipedia.org/wiki/Lexical_scoping) is a specific style of scoping where the structure of the program itself shows where a scope begins and ends<sup><a href="#ref-Abelson1996-c118" class="citation" title="Abelson, Sussman, and with&nbsp;Julie&nbsp;Sussman, “Procedures as Black-Box Abstractions.”">@9</a></sup>. Like most modern languages, Co is lexically scoped. A function in Co starts a new scope which extends over the entire function body, and the scope ends when the function ends[<sup>6</sup>](#fn6). Functions are the only way of creating new scopes in Co[<sup>7</sup>](#fn7).

That’s how repeated invocation of functions don’t remember the values of their parameters across the calls. Every time a new call is started, a new scope is created with the parameter names bound to the value of the arguments of the call. And when the call returns, this new scope is destroyed.

Scopes can be enclosed within other scopes. In Co, this can be done by defining a function inside the body of another function. All programs have at least one scope, which is the program’s top-level scope, often called the global scope.

Scopes are intimately related to the environment. In fact, the structure of the environment is how scopes are implemented<sup><a href="#ref-Abelson1996-c556" class="citation" title="Abelson, Sussman, and with&nbsp;Julie&nbsp;Sussman, “Lexical Addressing.”">@12</a></sup>.

![Scopes are implemented by the environment](data:image/svg+xml,%3Csvg%20xmlns='http://www.w3.org/2000/svg'%20viewBox='0%200%20377%20193'%3E%3C/svg%3E) \<img src="/images/implementing-co-2/twice-scopes.svg" class="w-100pct mw-70pct nolink" alt="Scopes are implemented by the environment"\>\</img\> Scopes are implemented by the environment

An environment can be thought of as a stack of frames, with one frame per enclosed scope<sup><a href="#ref-Abelson1996-c32" class="citation" title="Abelson, Sussman, and with&nbsp;Julie&nbsp;Sussman, “The Environment Model of Evaluation.”">@13</a></sup>. A frame contains zero-or-more bindings. The bindings in enclosed scopes (frames higher in the environment stack) hide the bindings (called [shadowing](https://en.wikipedia.org/wiki/Variable_shadowing)) in enclosing scopes (frames lower in the environment stack). Program’s global scope is represented by the lowermost frame in the stack.

The above diagram shows the frames of the two calls to the `twice` function. The scope of the `twice` function is enclosed in the global scope. To find the value of a variable inside the function, the interpret first looks into the topmost frame that represents the scope of the `twice` function. If the binding is not found, then the interpreter goes down the stack of frames, and looks into the frame for the global scope.

What happens when a function body tries to access variables not defined in the function’s scope? We get *Closures*.

Closures[#](#closures)
----------

If a function body refers to variables not defined in the function’s scope, such variables are called [*Free Variables*](https://en.wikipedia.org/wiki/Free_variables_and_bound_variables)<sup><a href="#ref-Abelson1996-c118" class="citation" title="Abelson, Sussman, and with&nbsp;Julie&nbsp;Sussman, “Procedures as Black-Box Abstractions.”">@14</a></sup>. In lexically scoped languages, the value of a free variable is determined from the scope in which the function is defined. A function along with the references to all its free variables, is called a *[Closure](https://en.wikipedia.org/wiki/Closure_(computer_programming))*[<sup>8</sup>](#fn8).

Closures are prevalent in programming languages with first-class functions. Co—with its support for first-class functions—also supports closures. Closures in Co are mutable, meaning the values of the free variables of a function can change over time, and the changes are reflected in the behavior of the function[<sup>9</sup>](#fn9).

We already saw an example of closures earlier:

```
var a = 2;
function incA() {
  var b = a + 1;
  return b;
}
print(incA());
a = 3;
print(incA());
```

This is how the frames exist over time for the two invocations of the `incA` function:

![a is a free variable of the function incA](data:image/svg+xml,%3Csvg%20xmlns='http://www.w3.org/2000/svg'%20viewBox='0%200%20449%20209'%3E%3C/svg%3E) \<img src="/images/implementing-co-2/incA-scopes.svg" class="w-100pct mw-80pct nolink" alt="a is a free variable of the function incA"\>\</img\> `a` is a free variable of the function `incA`

Here, `a` is a free variable of the function `incA`. Its value is not present in the scope of `incA`, but is obtained from the global scope. When its value in the global scope changes later, the value returned by `incA` changes as well. In other words, `incA` and `a` together form a closure.

The following example demonstrates a closure with a mutable free variable and enclosed scopes:

```
function makeCounter(name) {
  var count = 0;
  return function () {
    count = count + 1;
    print(name + " = " + count);
  };
}

var countA = makeCounter("a");
var countB = makeCounter("b");

countA();
countA();
countB();
countA();
```

Here, both `name` and `count` are free variables referred in the returned function. While `name` is only read, `count` is changed in the body of the function.

Running the above code prints:

```
a = 1
a = 2
b = 1
a = 3
```

Note that the two functions `countA` and `countB` refer to two different instances of the `count` variable, and are not affected by each other. In other words, `countA` and `countB` are two different closures for the same function.

Now for one last thing to learn about before we jump to the implementation: early returns.

Early Returns[#](#early-returns)
----------

Statement oriented programming languages often allow returning from a function before the entire function is done executing. This is called an [*Early return*](https://en.wikipedia.org/wiki/Return_statement#Multiple_return_statements). We saw an example of this in the fibonacci function in the previous post:

```
function fib(n) {
  if (n < 2) {
    return n;
  }
  return fib(n - 2)
    + fib(n - 1);
}
```

In the above code, when the input `n` is less than 2, the code returns early from the function at the line 3.

Expression oriented programming languages, like Haskell, have no early returns. Every function is an expression in Haskell, and has to be evaluated entirely[<sup>10</sup>](#fn10) to get back a value. Since our AST-walking interpreter itself is written in Haskell, we need to figure out how to support early returns in the Co code being interpreted. The interpreter should be able to stop evaluating at an AST node representing a `return` statement, and jump to the node representing the function’s caller.

One way to implement this is [*Exceptions*](https://en.wikipedia.org/wiki/Exception_(computer_science)). Exceptions let us abort the execution of code at any point of execution, and resume from some other point in the lower in the function call stack. Although Haskell [supports](https://hackage.haskell.org/package/base-4.12.0.0/docs/Control-Exception.html) exceptions as we know them from languages like Java and Python, it also supports exceptions as values using the *[Error monad](https://hackage.haskell.org/package/mtl-2.2.2/docs/Control-Monad-Except.html#t:MonadError)*. That’s what we will leverage for implementing early returns in our interpreter.

Finally, we are really to start implementing the interpreter.

The Interpreter[#](#the-interpreter)
----------

The interpreter is implemented as a Haskell `newtype` over a stack of monad using the monad transformers and typeclasses from the [mtl](https://hackage.haskell.org/package/mtl) library:

```
newtype Interpreter a = Interpreter
  { runInterpreter ::
      ExceptT Exception
        (ContT
            (Either Exception ())
            (StateT InterpreterState IO))
        a
  }
  deriving
    ( Functor,
      Applicative,
      Monad,
      MonadIO,
      MonadBase IO,
      MonadState InterpreterState,
      MonadError Exception,
      MonadCont
    )
```

From bottom to top, the monad stack is comprised of:

1. the [`IO`](https://hackage.haskell.org/package/base-4.14.0.0/docs/System-IO.html#t:IO) monad to be able to print to the console,
2. the [`State`](https://hackage.haskell.org/package/mtl-2.2.2/docs/Control-Monad-State-Strict.html#t:State) monad transformer to track the state of the interpreter, and
3. the [`Except`](https://hackage.haskell.org/package/mtl-2.2.2/docs/Control-Monad-Except.html#t:Except) monad transformer to propagate exceptions while interpreting the code.

We model the environment as [`Map`](https://hackage.haskell.org/package/containers/docs/Data-Map-Strict.html#t:Map) of variable names to [`IORef`](https://hackage.haskell.org/package/base/docs/Data-IORef.html#t:IORef)s of values:

```
type Env = Map.Map Identifier (IORef Value)
```

The immutable nature of `Map` and the mutable nature of `IORef` allow us to correctly model scopes, frames and closures in Co, as we see in the later sections of this post.

The interpreter state contains the environment used for interpretation. The state changes as variables come in and go out of scopes.

```
data InterpreterState = InterpreterState
  { isEnv :: Env,
    isCoroutines :: Queue (Coroutine ())
  }

initInterpreterState :: IO InterpreterState
initInterpreterState = InterpreterState <$> builtinEnv <*> newQueue
```

Initial interpreter state contains the built-in environment with bindings for the built-in functions like `print`. In particular, `print` is implemented by the `executePrint` function, which we see in a later section. Note that, [arity](https://en.wikipedia.org/wiki/arity) of built-in functions is also encapsulated in them.

[]()

```
builtinEnv :: IO Env
builtinEnv = Map.fromList <$> traverse (traverse newIORef) [
    ("print", BuiltinFunction "print" 1 executePrint)
  , ("newChannel",
     BuiltinFunction "newChannel" 0 $ fmap Chan . const (newChannel 0))
  , ("newBufferedChannel",
     BuiltinFunction "newBufferedChannel" 1 executeNewBufferedChannel)
  , ("sleep", BuiltinFunction "sleep" 1 executeSleep)
  , ("getCurrentMillis",
     BuiltinFunction "getCurrentMillis" 0 executeGetCurrentMillis)
  ]
```

When trying to interpret wrong code like `1 + true`, the interpreter throws runtime errors. We roll these errors along with early returns into an ADT for exceptions:

```
data Exception
  = Return Value
  | RuntimeError String
  | CoroutineQueueEmpty
```

That’s it for defining the types for the interpreter. Next, we implement the functions to interpret Co programs, starting with functions to work with environments.

Manipulating Environments[#](#manipulating-environments)
----------

In Co, variables must be initialized when being defined. Additionally, only the already defined variables can be referenced or assigned.

To define a new variable, we create a new `IORef` with the variable’s value, insert it in the current environment map with the variable name as the key, and replace the interpreter state with the new environment map.

```
defineVar :: Identifier -> Value -> Interpreter ()
defineVar name value = do
  env <- State.gets isEnv
  if Map.member name env
  then throw $ "Variable already defined: " <> name
  else do
    valueRef <- newIORef value
    setEnv $ Map.insert name valueRef env

setEnv :: Env -> Interpreter ()
setEnv env = State.modify' $ \is -> is {isEnv = env}
```

Note that trying to redefine an already defined variable throws a runtime error.

We also create a helper function `setEnv` that we reuse in later sections.

To lookup and assign a variable, we get the current environment, lookup the `IORef` in the map by the variable’s name, and then read the `IORef` for lookup, or write the new value to it for assignment.

```
lookupVar :: Identifier -> Interpreter Value
lookupVar name =
  State.gets isEnv >>= findValueRef name >>= readIORef

assignVar :: Identifier -> Value -> Interpreter ()
assignVar name value =
  State.gets isEnv >>= findValueRef name >>= flip writeIORef value
```

We use the helper function `findValueRef` to lookup a variable name in the environment map. It throws a runtime error if the variable is not already defined.

```
findValueRef :: Identifier -> Env -> Interpreter (IORef Value)
findValueRef name env =
  case Map.lookup name env of
    Just ref -> return ref
    Nothing -> throw $ "Unknown variable: " <> name

throw :: String -> Interpreter a
throw = throwError . RuntimeError
```

These functions are enough for us to implement the evaluation of expressions and execution of statements.

Evaluating Expressions[#](#evaluating-expressions)
----------

Co expressions are represented by the [`Expr`](#cb1-1) ADT. The `evaluate` function below shows how they are evaluated to runtime values.

```
evaluate :: Expr -> Interpreter Value
evaluate = \case
  LNull -> pure Null
  LBool bool -> pure $ Boolean bool
  LStr str -> pure $ Str str
  LNum num -> pure $ Num num
  Variable v -> lookupVar v
  Lambda params body -> Function "<lambda>" params body <$> State.gets isEnv
  binary@Binary {} -> evaluateBinaryOp binary
  call@Call {} -> evaluateFuncCall call
  Receive expr -> evaluate expr >>= \case
    Chan channel -> channelReceive channel
    val -> throw $ "Cannot receive from a non-channel: " <> show val
```

Literals `null`, booleans, strings, and numbers evaluate to themselves. Variables are looked up from the environment using the `lookupVar` function we wrote earlier. Anonymous functions are evaluated to function values that capture the current environment from the interpreter state. We learn more about function definitions and calls in the next section. Binary operations and function call expressions are handled by helper functions explained below.

```
evaluateBinaryOp :: Expr -> Interpreter Value
evaluateBinaryOp ~(Binary op leftE rightE) = do
  left <- evaluate leftE
  right <- evaluate rightE
  let errMsg msg = msg <> ": " <> show left <> " and " <> show right
  case (op, left, right) of
    (Plus, Num n1, Num n2) -> pure $ Num $ n1 + n2
    (Plus, Str s1, Str s2) -> pure $ Str $ s1 <> s2
    (Plus, Str s1, _) -> pure $ Str $ s1 <> show right
    (Plus, _, Str s2) -> pure $ Str $ show left <> s2
    (Plus, _, _) -> throw $ errMsg "Cannot add or append"

    (Minus, Num n1, Num n2) -> pure $ Num $ n1 - n2
    (Minus, _, _) -> throw $ errMsg "Cannot subtract non-numbers"

    (Slash, Num n1, Num n2) -> pure $ Num $ n1 `div` n2
    (Slash, _, _) -> throw $ errMsg "Cannot divide non-numbers"

    (Star, Num n1, Num n2) -> pure $ Num $ n1 * n2
    (Star, _, _) -> throw $ errMsg "Cannot multiply non-numbers"

    (LessThan, Num n1, Num n2) -> pure $ Boolean $ n1 < n2
    (LessThan, _, _) -> throw $ errMsg "Cannot compare non-numbers"
    (GreaterThan, Num n1, Num n2) -> pure $ Boolean $ n1 > n2
    (GreaterThan, _, _) -> throw $ errMsg "Cannot compare non-numbers"

    (Equals, _, _) -> pure $ Boolean $ left == right
    (NotEquals, _, _) -> pure $ Boolean $ left /= right
```

To evaluate a binary operation, first we recursively evaluate its left and right operands by calling `evaluate` on them. Then, depending on the operation and types of the operands, we do different things.

* The `+` operation can be used to either add two numbers, or to concat two operands when one or both of them are strings. In all other cases, it throws runtime errors.
* The `-`, `/`, `*`, `>`, and `<` operations can be invoked only on numbers. Other cases throw runtime errors.
* The `==` and `!=` operations run corresponding Haskell operations on their operands.

That’s all for evaluating binary operations. Next, let’s look at how to execute statements. We come back to evaluating function calls after that.

Executing Statements[#](#executing-statements)
----------

Co statements are represented by the [`Stmt`](#cb2-1) ADT. The `execute` function below uses a case expression to execute the various types of statements in different ways:

```
execute :: Stmt -> Interpreter ()
execute = \case
  ExprStmt expr -> void $ evaluate expr
  VarStmt name expr -> evaluate expr >>= defineVar name
  AssignStmt name expr -> evaluate expr >>= assignVar name
  IfStmt expr body -> do
    cond <- evaluate expr
    when (isTruthy cond) $
      traverse_ execute body
  while@(WhileStmt expr body) -> do
    cond <- evaluate expr
    when (isTruthy cond) $ do
      traverse_ execute body
      execute while
  ReturnStmt mExpr -> do
    mRet <- traverse evaluate mExpr
    throwError . Return . fromMaybe Null $ mRet
  FunctionStmt name params body -> do
    env <- State.gets isEnv
    defineVar name $ Function name params body env
  YieldStmt -> yield
  SpawnStmt expr -> spawn expr
  SendStmt expr chan -> evaluate chan >>= \case
    Chan channel -> do
      val <- evaluate expr
      channelSend val channel
    v -> throw $ "Cannot send to a non-channel: " <> show v
  where
    isTruthy = \case
      Null -> False
      Boolean b -> b
      _ -> True
```

Expressions in expression statements are evaluated by calling `evaluate` on them, and the resultant values are discarded.

For variable definition and assignment statements, first we evaluate the value expressions, and then define or assign variables with the given variable names and the resultant values.

For `if` statements, first we evaluate their conditions, and if conditions yield truthy[<sup>11</sup>](#fn11) values, we recursively execute the statement bodies. `while` statements are executed in a similar fashion, except we recursively execute the `while` statements again after executing their bodies.

For `return` statements, we evaluate their optional return value expressions, and then throw the resultant values as exceptions wrapped with the `Return` constructor.

Execution of function statements is more interesting. First thing that we do is to capture the current environment from the interpreter state. Then we define a new variable[<sup>12</sup>](#fn12) with the function’s name and a runtime function value that encapsulates the function’s name, parameter names, and body statements, as well as, the captured environment. This is how closures record the values of functions’ free variables from their definition contexts.

In the next section, we see how the captured environments and returns as exceptions are used to evaluate function calls.

Evaluating Function Calls[#](#evaluating-function-calls)
----------

The capability of defining and calling functions is the cornerstone of abstraction in programming languages. In Co, functions are first-class, and are also the means of implementing scopes and closures. Named functions support recursion[<sup>13</sup>](#fn13) as well. Hence, this section is the most important and involved one.

We start by evaluating the callee expression of the function call.

```
evaluateFuncCall :: Expr -> Interpreter Value
evaluateFuncCall ~(Call callee argEs) =
  evaluate callee >>= \case
    BuiltinFunction name arity func -> do
      checkArgCount name argEs arity
      func argEs
    func@Function {} -> evaluateFuncCall' func argEs
    val -> throw $ "Cannot call a non-function: " <> show callee <> " is " <> show val

checkArgCount :: Identifier -> [Expr] -> Int -> Interpreter ()
checkArgCount funcName argEs arity =
  when (length argEs /= arity) $
    throw $ funcName <> " call expected " <> show arity
            <> " argument(s) but received " <> show (length argEs)

executePrint :: [Expr] -> Interpreter Value
executePrint argEs =
  evaluate (head argEs) >>= liftIO . print >> return Null
```

If the resultant value is not a function, we throw a runtime error.

If we get a built-in function, we check that the count of arguments is same as the arity of the function by invoking `checkArgCount`, failing which we throw a runtime error. Then, we invoke the corresponding implementation function. For `print`, it is the `executePrint` function, in which we evaluate the argument and print it using Haskell’s [`print`](https://hackage.haskell.org/package/base-4.12.0.0/docs/Prelude.html#v:print) function.

If we get a user-defined function, we evaluate the function call with the helper function `evaluateFuncCall'`. But before diving into it, let’s take a look at how the world looks from inside a function.

```
function makeGreeter(greeting) {
  function greeter(name) {
    var say = greeting + " " + name;
    print(say);
  }
  return greeter;
}

var hello = makeGreeter("hello");
var namaste = makeGreeter("namaste");

hello("Arthur");
namaste("Ford");
```

In the above Co code, the function `greeter` has a free variable `greeting`, a bound parameter `name`, and a local variable `say`. Upon executing the code with the interpreter, we get the following output:

```
hello Arthur
namaste Ford
```

The output makes sense when we understand the variables `hello` and `namaste` are closures over the function `greeter`. The environment seen from inside `greeter` when it is being executed is a mix of the scope (and hence, the environment) it is defined in, and the scope it is called in.

![Function environment is a mix of its caller and definition environments](data:image/svg+xml,%3Csvg%20xmlns='http://www.w3.org/2000/svg'%20viewBox='0%200%20465%20241'%3E%3C/svg%3E) \<img src="/images/implementing-co-2/function-eval.svg" class="w-100pct mw-70pct nolink" alt="Function environment is a mix of its caller and definition environments"\>\</img\> Function environment is a mix of its caller and definition environments

More specifically, the free variables come from the definition scope, and the parameters come from the caller scope. Local variables can be derived from any combinations of free variables and parameters. With this understanding, let’s see how we evaluate function calls:

```
evaluateFuncCall' :: Value -> [Expr] -> Interpreter Value
evaluateFuncCall'
    ~func@(Function funcName params body funcDefEnv) argEs = do
  checkArgCount funcName argEs (length params)
  funcCallEnv <- State.gets isEnv
  setupFuncEnv
  retVal <- executeBody funcCallEnv
  setEnv funcCallEnv
  return retVal
  where
    setupFuncEnv = do
      args <- traverse evaluate argEs
      env <- overrideVar funcDefEnv funcName func
      env' <- foldM (uncurry . overrideVar) env $ zip params args
      setEnv env'

    overrideVar env name value =
      Map.insert name <$> newIORef value <*> pure env

    executeBody funcCallEnv =
      (traverse_ execute body >> return Null) `catchError` \case
        Return val -> return val
        err -> setEnv funcCallEnv >> throwError err
```

Let’s go over the above code, step by step:

1. `evaluateFuncCall'` is called with the function to evaluate. We get access to the function’s name, its parameter names, body statements, and the environment it is defined in. We also get the argument expressions for the function call. (Line 2–3)
2. First, we check that the count of arguments is same as the count of the function parameter by invoking `checkArgCount`, failing which we throw a runtime error. (Line 4)
3. Then, we capture the current environment from the interpreter state. This is the function’s caller’s environment. (Line 5)
4. Next, we set up the environment in which the function will be executed (line 6). In `setupFuncEnv`:
   1. We evaluate the argument expressions in the current (caller’s) environment[<sup>14</sup>](#fn14). (Line 12)
   2. We bind the callee function itself to its name in its own environment. This lets our function to recursively call itself. (Line 13)
   3. We bind the argument values to their parameter names in the function’s environment. This lets the function body access the arguments being called with. (Line 14)
   4. We set the current environment in the interpreter state to the functions’s environment. (Line 15)

5. With the function environment set up, we execute the function body in `executeBody` (line 7):
   1. We execute each statement in the body, and return `null` in case there was no explicit `return` in the function. (Line 21)
   2. If the body contains a `return` statement, or if its execution throws a runtime error, we handle the exception in the `catchError` case statement.
      1. For `return`, we pass along the return value. (Line 22)
      2. For a runtime error, first we set the current environment back to the caller’s environment that we captured in step 3, and then we throw the error. The error is eventually handled in the `interpret` function described in the next section. (Line 23)

   3. We capture the value returned from executing the body. (Line 7)

6. We set the current environment back to the caller’s environment that we captured in step 3. (Line 8)
7. We return the captured return value from `evaluateFuncCall'`. The function call is now complete. (Line 9)

Curious readers may wonder, why do we need to use State monad, [`Map`](https://hackage.haskell.org/package/containers/docs/Data-Map-Strict.html#t:Map)s, and [`IORef`](https://hackage.haskell.org/package/base/docs/Data-IORef.html#t:IORef)s together, when all of them do similar work of storing and mutating variables? Because, together they let us implement function calls, scopes and closures, as described below:

1. State monad lets us swap the current environment for a function’s definition environment when a function call is made, and to restore the calling environment after the call is complete.
2. Immutable maps are perfect for implementing scopes. Adding variables in an immutable map returns a modified map without changing the original map. This lets us shadow variables defined in outer scopes when entering inner scopes, while also being able to easily restore the shadowed variables by just restoring the original map after the inner scopes end[<sup>15</sup>](#fn15). There is no need to use a stack of mutable maps, which is how environments are generally implemented in interpreters which do not use immutable maps.
3. Lastly, putting `IORef`s as values of immutable maps lets us implement mutable closures. All closures of same function share the same references to the `IORef`s. This allows variable mutations made from one closure to be visible to all others. If we had used just immutable maps, changes made to variable values would not propagate between closures because of immutability.

So that’s how function calls—the most crucial part of the interpreter—work. That completes the guts of our interpreter for the [basic features](#previously-on) of Co. In the next and last section, we put everything together.

Interpreting a Program[#](#interpreting-a-program)
----------

We are down to the last step. We interpret a program returned from the parser written in the [previous post](https://abhinavsarkar.net/posts/implementing-co-1/?mtm_campaign=feed) to run it.

```
interpret :: Program -> IO (Either String ())
interpret program = do
  state <- initInterpreterState
  retVal <- flip evalStateT state
    . flip runContT return
    . runExceptT
    . runInterpreter
    $ (traverse_ execute program >> awaitTermination)
  case retVal of
    Left (RuntimeError err) -> return $ Left err
    Left (Return _) -> return $ Left "Cannot return from outside functions"
    Left CoroutineQueueEmpty -> return $ Right ()
    Right _ -> return $ Right ()
```

We run the list of statements in the program by running the `execute` function on them. Then we run the monad transformer stack, layer by layer, to get the return value. Finally, we case match on the return value to catch errors, and we are done.

We package the parser and the interpreter together to create the `runFile` function that takes a file path, reads and parses the file, and then interprets the AST:

```
runFile :: FilePath -> IO ()
runFile file = do
  code <- readFile file
  case runParser program code of
    Left err -> hPutStrLn stderr err
    Right program -> interpret program >>= \case
      Left err -> hPutStrLn stderr $ "ERROR: " <> err
      _ -> return ()
```

Finally, we can run the interpreter on the Co files:

```
> runFile "fib.co"
0
1
1
2
3
5
0
1
1
2
3
5
```

---

That’s all for now. We implemented the interpreter for the [basic features](#previously-on) for Co, and learned about how function calls, scopes and closures work. In the [next part](https://abhinavsarkar.net/posts/implementing-co-3/?mtm_campaign=feed), we’ll extend our interpreter to add support for coroutines and channels in Co.

The full code for the interpreter can be seen [here](https://abhinavsarkar.net/code/co-interpreter.html?mtm_campaign=feed).

 If you have any questions or comments, please leave a comment below. If you liked this post, please share it. Thanks for reading!

 Abelson, Harold, Gerald Jay Sussman, and with Julie Sussman. “Lexical Addressing.” In *Structure and Interpretation of Computer Programs*, 2nd Editon. MIT Press/McGraw-Hill, 1996. [https://mitp-content-server.mit.edu/books/content/sectbyfn/books\_pres\_0/6515/sicp.zip/full-text/book/book-Z-H-35.html#%\_sec\_5.5.6](https://mitp-content-server.mit.edu/books/content/sectbyfn/books_pres_0/6515/sicp.zip/full-text/book/book-Z-H-35.html#%_sec_5.5.6).

 ———. “Metalinguistic Abstraction.” In *Structure and Interpretation of Computer Programs*, 2nd Editon. MIT Press/McGraw-Hill, 1996. [https://mitp-content-server.mit.edu/books/content/sectbyfn/books\_pres\_0/6515/sicp.zip/full-text/book/book-Z-H-25.html#%\_chap\_4](https://mitp-content-server.mit.edu/books/content/sectbyfn/books_pres_0/6515/sicp.zip/full-text/book/book-Z-H-25.html#%_chap_4).

 ———. “Normal Order and Applicative Order.” In *Structure and Interpretation of Computer Programs*, 2nd Editon. MIT Press/McGraw-Hill, 1996. [https://mitp-content-server.mit.edu/books/content/sectbyfn/books\_pres\_0/6515/sicp.zip/full-text/book/book-Z-H-27.html#%\_sec\_4.2.1](https://mitp-content-server.mit.edu/books/content/sectbyfn/books_pres_0/6515/sicp.zip/full-text/book/book-Z-H-27.html#%_sec_4.2.1).

 ———. “Procedures as Black-Box Abstractions.” In *Structure and Interpretation of Computer Programs*, 2nd Editon. MIT Press/McGraw-Hill, 1996. [https://mitp-content-server.mit.edu/books/content/sectbyfn/books\_pres\_0/6515/sicp.zip/full-text/book/book-Z-H-10.html#%\_sec\_1.1.8](https://mitp-content-server.mit.edu/books/content/sectbyfn/books_pres_0/6515/sicp.zip/full-text/book/book-Z-H-10.html#%_sec_1.1.8).

 ———. “The Costs of Introducing Assignment.” In *Structure and Interpretation of Computer Programs*, 2nd Editon. MIT Press/McGraw-Hill, 1996. [https://mitp-content-server.mit.edu/books/content/sectbyfn/books\_pres\_0/6515/sicp.zip/full-text/book/book-Z-H-20.html#%\_sec\_3.1.3](https://mitp-content-server.mit.edu/books/content/sectbyfn/books_pres_0/6515/sicp.zip/full-text/book/book-Z-H-20.html#%_sec_3.1.3).

 ———. “The Environment Model of Evaluation.” In *Structure and Interpretation of Computer Programs*, 2nd Editon. MIT Press/McGraw-Hill, 1996. [https://mitp-content-server.mit.edu/books/content/sectbyfn/books\_pres\_0/6515/sicp.zip/full-text/book/book-Z-H-21.html#%\_sec\_3.2](https://mitp-content-server.mit.edu/books/content/sectbyfn/books_pres_0/6515/sicp.zip/full-text/book/book-Z-H-21.html#%_sec_3.2).

 ———. “The Substitution Model for Procedure Application.” In *Structure and Interpretation of Computer Programs*, 2nd Editon. MIT Press/McGraw-Hill, 1996. [https://mitp-content-server.mit.edu/books/content/sectbyfn/books\_pres\_0/6515/sicp.zip/full-text/book/book-Z-H-10.html#%\_sec\_1.1.5](https://mitp-content-server.mit.edu/books/content/sectbyfn/books_pres_0/6515/sicp.zip/full-text/book/book-Z-H-10.html#%_sec_1.1.5).

---

1. It’s hard to find examples of real-world programming languages that are run with AST interpreters. This is because AST interpreters are too slow for real-world usage. However, they are the easiest to understand and implement, and hence are widely using in teaching programming languages theory.[↩︎](#fnref1)

2. Since the user-defined and built-in functions are first-class, they can be assigned to variables, and passed as arguments to other functions. Thus, Co supports [higher-order functions](https://en.wikipedia.org/wiki/higher-order_functions) as well.[↩︎](#fnref2)

3. This is called [Strong typing](https://en.wikipedia.org/wiki/Strong_typing) in programming languages parlance. JavaScript, on the other hand, is a weakly typed language. In JavaScript, `1 == '1'` evaluates to `true`, whereas in Co, it evaluates to `false`.[↩︎](#fnref3)

4. The property of being able to substitute expressions for their corresponding values without changing the meaning of the program is called [*Referential transparency*](https://en.wikipedia.org/wiki/Referential_transparency)<sup><a href="#ref-Abelson1996-c313" class="citation" title=" (Abelson, Sussman, and with&nbsp;Julie&nbsp;Sussman, “The Costs of Introducing Assignment”)">@6</a></sup>. Pure functions—like `twice` here—that do not have any side-effects are referentially transparent.[↩︎](#fnref4)

5. I’m being a little hand-wavy here because most programmers have at least an intuitive understanding of scopes. Read literature for accurate details.[↩︎](#fnref5)

6. This is in contrast to [*Dynamic scoping*](https://en.wikipedia.org/wiki/Dynamic_scoping) where the a variable’s scope is essentially global, and is defined by function’s execution context instead of definition context, as in lexical scoping.[↩︎](#fnref6)

7. [*Blocks*](https://en.wikipedia.org/wiki/Block_(programming)) are another widely used structure to support lexical scoping. Co doesn’t have blocks in the interest of simplicity of implementation.[↩︎](#fnref7)

8. The function is said to close its free variables over its closure. Hence, the name *Closure*.[↩︎](#fnref8)

9. Some programming languages like Java support a limited version of closures, which requires values of the free variables of functions to not change over time.[↩︎](#fnref9)

10. Well, not entirely, because Haskell is a lazily evaluated language.[↩︎](#fnref10)

11. In Co, only `null` and `false` evaluate to false. All other values evaluate to true. This is implemented by the `isTruthy` function.[↩︎](#fnref11)

12. Functions are just variables in Co. That is to say, functions definitions and variable definitions share the same namespace. This is how it works in many programming languages like JavaScript and Python. But some languages like [Common Lisp](https://en.wikipedia.org/wiki/Common_Lisp) have [separate namespaces](https://en.wikipedia.org/wiki/Common_Lisp#The_function_namespace) for functions and variables.[↩︎](#fnref12)

13. Co does not support mutual recursion though. This is because a function in Co only sees the bindings done before its own definition. This can be fixed by either adding a special syntax for mutually recursive functions, or by hoisting all the bindings in a scope to the top of the scope, like [how JavaScript does](https://developer.mozilla.org/en-US/docs/Glossary/Hoisting).

   Anonymous functions do not support recursion at all, because they do not have names to refer to themselves in their bodies.[↩︎](#fnref13)

14. Evaluating function arguments before the function body is called the [*Strict evaluation strategy*](https://en.wikipedia.org/wiki/Evaluation_strategy#Eager_evaluation). Most of the modern programming languages work this way, for example, Java, Python, JavaScript, Ruby etc. This is in contrast to [*Non-strict evaluation*](https://en.wikipedia.org/wiki/Evaluation_strategy#Non-strict_evaluation) in programming languages like Haskell, where the arguments to functions are evaluated only when their values are needed in the function bodies<sup><a href="#ref-Abelson1996-c421" class="citation" title=" (Abelson, Sussman, and with&nbsp;Julie&nbsp;Sussman, “Normal Order and Applicative Order”)">@21</a></sup>.[↩︎](#fnref14)

15. This is what the `overrideVar` function does in the code above.[↩︎](#fnref15)

This post is a part of the series: **Implementing Co, a Small Language With Coroutines**.

1. [The Parser](https://abhinavsarkar.net/posts/implementing-co-1/?mtm_campaign=feed)
2. **The Interpreter** 👈
3. [Adding Coroutines](https://abhinavsarkar.net/posts/implementing-co-3/?mtm_campaign=feed)
4. [Adding Channels](https://abhinavsarkar.net/posts/implementing-co-4/?mtm_campaign=feed)
5. [Adding Sleep](https://abhinavsarkar.net/posts/implementing-co-5/?mtm_campaign=feed)

---

Thanks for reading this post via feed. Feeds are great, and you're great for using them. ♥

This post was originally published on [abhinavsarkar.net](https://abhinavsarkar.net/posts/implementing-co-2/?mtm_campaign=feed).

### Like, repost, or comment on: ###

* [Lobsters](https://lobste.rs/s/udjpjb)
* [Reddit](https://www.reddit.com/r/haskell/comments/psnl63/)
* [Discourse](https://discourse.haskell.org/t//3285)
* [My website](https://abhinavsarkar.net/posts/implementing-co-2/?mtm_campaign=feed#comment-container)

Read more of my [posts](https://abhinavsarkar.net/posts/) and [notes](https://abhinavsarkar.net/notes/).

![](https://anna.abhinavsarkar.net/matomo.php?idsite=1&rec=1)