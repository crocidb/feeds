+++
title = "Implementing Co, a Small Language With Coroutines #3: Adding Coroutines"
description = "In the previous post, we wrote the interpreter for basic features of Co, the small language we are building in this series of posts. In this post, we explore and implement what makes Co really interesting: support for lightwei"
date = "2023-02-11T00:00:00Z"
url = "https://abhinavsarkar.net/posts/implementing-co-3/"
author = "Abhinav Sarkar"
text = ""
lastupdated = "2026-07-21T09:17:41.548261108Z"
seen = false
+++

In the [previous post](https://abhinavsarkar.net/posts/implementing-co-2/?mtm_campaign=feed), we wrote the interpreter for basic features of Co, the small language we are building in this series of posts. In this post, we explore and implement what makes Co really interesting: support for lightweight concurrency using Coroutines.

This post was originally published on [abhinavsarkar.net](https://abhinavsarkar.net/posts/implementing-co-3/?mtm_campaign=feed).

This post is a part of the series: **Implementing Co, a Small Language With Coroutines**.

1. [The Parser](https://abhinavsarkar.net/posts/implementing-co-1/?mtm_campaign=feed)
2. [The Interpreter](https://abhinavsarkar.net/posts/implementing-co-2/?mtm_campaign=feed)
3. **Adding Coroutines** 👈
4. [Adding Channels](https://abhinavsarkar.net/posts/implementing-co-4/?mtm_campaign=feed)
5. [Adding Sleep](https://abhinavsarkar.net/posts/implementing-co-5/?mtm_campaign=feed)

In this and next two posts, we add support for the following features to the Co interpreter:

* `yield` statement to yield the current thread of computation (ToC).
* `spawn` statement to start a new ToC.
* First class channels with operators to send and receive values over them.
* `sleep` function to sleep the current ToC for a given number of milliseconds.

Let’s Co!

### Contents ###

1. [Coroutines](#coroutines)
2. [Coroutines in Various Languages](#coroutines-in-various-languages)
3. [Implementing Coroutines](#implementing-coroutines)
4. [Continuation-Passing Style](#continuation-passing-style)
   1. [Continuation-Passing Style in Haskell](#continuation-passing-style-in-haskell)
   2. [Call with Current Continuation](#call-with-current-continuation)

5. [From Continuations to Coroutines](#from-continuations-to-coroutines)
6. [Scheduling Coroutines](#scheduling-coroutines)
7. [Yield and Spawn](#yield-and-spawn)
   1. [Implementation](#implementation)

8. [Waiting for Termination](#waiting-for-termination)
9. [Putting Everything Together](#putting-everything-together)
10. [Bonus Round: Breadth-First Traversal without a Queue](#bonus-round-breadth-first-traversal-without-a-queue)

Coroutines[#](#coroutines)
----------

[Coroutines](https://en.wikipedia.org/wiki/Coroutines)<sup><a href="#ref-Knuth1997-rv" class="citation" title="Knuth, “Coroutines.”">@1</a></sup> are computations that support [*Cooperative multitasking*](https://en.wikipedia.org/wiki/Cooperative_multitasking)<sup><a href="#ref-Bartel2011-ap" class="citation" title="Bartel, “Non-Preemptive Multitasking.”">@2</a></sup>. Unlike ordinary [*Subroutines*](https://en.wikipedia.org/wiki/Subroutines) that execute from start to end, and do not hold any state between invocations, coroutines can exit in the middle, and may resume later from the same point while holding state between invocations. They do so by [*yielding*](https://en.wikipedia.org/wiki/Yield_(multithreading)) the control of the current running thread.

![Subroutines vs. Coroutines](data:image/svg+xml,%3Csvg%20xmlns='http://www.w3.org/2000/svg'%20viewBox='0%200%20713%20337'%3E%3C/svg%3E) \<img src="/images/implementing-co-3/coroutine-vs-subroutine.svg" class="w-100pct nolink" alt="Subroutines vs. Coroutines"\>\</img\> Subroutines vs. Coroutines

The above diagram compares the execution of a subroutine and a coroutine, invoked from a caller[<sup>1</sup>](#fn1). The rectangles represent instructions, starting at top and ending at bottom. The arrows represent the flow of control.

The subroutine executes from start to end when called. The coroutine can exit in the middle by yielding, and can resume later from the same point. The coroutine state is saved automatically at the point of yielding, and restored when the coroutine resumes. Note that the coroutine may not be resumed, in which case the rest of the coroutine never executes.

Coroutines in Various Languages[#](#coroutines-in-various-languages)
----------

Many languages have support for coroutines, either [built-in](https://en.wikipedia.org/wiki/Coroutine#Programming_languages_with_native_support) or [through libraries or plugins](https://en.wikipedia.org/wiki/Coroutine#Implementations). Here are two examples in [Kotlin](https://kotlinlang.org) and [Python](https://python.org/)[<sup>2</sup>](#fn2):

```
fun main() = runBlocking {
    launch { // launch a new coroutine and continue
        delay(1000L) // non-blocking delay for 1 second
        println("World!") // print after delay
    }
    println("Hello") // main coroutine
}
// prints "Hello World!"
```

Coroutines in Kotlin

```
import asyncio

async def say_after(delay, what):
    await asyncio.sleep(delay)
    print(what, end="")

async def main():
    await asyncio.gather(
        say_after(1, 'World!\n'),
        say_after(0, 'Hello '))

asyncio.run(main())
# prints "Hello World!"
```

Coroutines in Python

Now, for a different kind of example, the following [JavaScript](https://en.wikipedia.org/wiki/JavaScript) code prints numbers 11–16 and 1–4 interleaved, using [Generators](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Generator)[<sup>3</sup>](#fn3):

```
function* printNums(start, end) {
  for (let i = start; i < end + 1; i++) {
    console.log(i);
    yield;
  }
}

function run(...gens) {
  const queue = [...gens];
  while (queue.length != 0) {
    const p = queue.shift();
    if (!p.next().done) {
      queue.push(p);
    }
  }
}

run(printNums(11, 16), printNums(1, 4));
// prints numbers 11–16 and 1–4, interleaved.
```

Generators in JavaScript

The next example is in Co, and it has the same behaviour as the JavaScript example above, except we don’t have to write the function to schedule and run the coroutines. The runtime for Co—the Co interpreter—does that implicitly for us.

```
function printNums(start, end) {
  var i = start;
  while (i < end + 1) {
    print(i);
    yield;
    i = i + 1;
  }
}

spawn printNums(1, 4);
printNums(11, 16);
```

Coroutine example in Co

So how are coroutines implemented in Co? Let’s find out.

Implementing Coroutines[#](#implementing-coroutines)
----------

A coroutine is essentially an *Environment*<sup><a href="#ref-Abelson1996-c32" class="citation" title="Abelson, Sussman, and with&nbsp;Julie&nbsp;Sussman, “The Environment Model of Evaluation.”">@6</a></sup> and a *Continuation*<sup><a href="#ref-Reynolds1993-dc" class="citation" title="Reynolds, “The Discoveries of Continuations.”">@7</a></sup>. The environment is the state of the executing code at the point of yielding. The continuation is the code to be executed when the coroutine is resumed later. If we can capture the environment and the continuation, we can implement coroutines.

Different implementations of coroutines capture the environment and the continuation in different ways[<sup>4</sup>](#fn4):

* We can capture the environment as the current stack and the continuation as the pointer to the next instruction to be executed at the level of [machine code](https://en.wikipedia.org/wiki/machine_code). This is how coroutines are implemented in C and C++.
* We can transform the code into a state machine as a large switch statement, and use variables to store the environment. This is how Go threads are implemented in the Clojure [core.async](https://clojure.github.io/core.async/)[<sup>5</sup>](#fn5) library.
* We can capture the environment and the continuation as a [*Closure*](https://en.wikipedia.org/wiki/Closure_(computer_programming)). To do this, we need to first transform the code into [*Continuation-passing style*](https://en.wikipedia.org/wiki/Continuation-passing_style) (CPS), so that we have the handle to the continuation at every point in the code. This is how we are going to implement coroutines in Co.

Let’s learn what CPS is, and how we can use it to implement coroutines.

Continuation-Passing Style[#](#continuation-passing-style)
----------

In the usual direct programming style, we write one statement or function call after another, as a sequence of steps to execute. There is another way of thinking about program execution: after returning from executing one statement/function, the rest of the program—which can be thought of as a big statement/function itself—is run. In CPS, this is made explicit: each statement/function takes the rest of the program that comes after it as an argument, which it invokes explicitly. For example, if we have a program to get the recommendations for a user and print them, written in direct style like this:

```
function getUserRecommendations(userId) {
  let user = getUser(userId);
  let friends = getFriends(user);
  let recommendations = getRecommendations(friends);
  recordRecommendations(userId, recommendations);
  return recommendations;
}

function main() {
  let recommendations = getUserRecommendations(123);
  console.log(recommendations);
}
```

It can be converted to an equivalent CPS program like this:

```
function getUserRecommendationsCPS(userId, cont) {
  getUserCPS(userId, (user) => {
    getFriendsCPS(user, (friends) => {
      getRecommendationsCPS(friends, (recommendations) => {
        recordRecommendationsCPS(userId, recommendations, () => {
          cont(recommendations);
        });
      });
    });
  });
}

function mainCPS() {
  getUserRecommendationsCPS(123, (recommendations) => {
    console.log(recommendations);
  });
}
```

We see how each function takes the rest of the program after it captured as a function, as a parameter, and calls it explicitly to further the flow of the program. Instead of returning the recommendations, the `getUserRecommendationsCPS` function now takes a function as an additional parameter, which it calls with the recommendations at the end of all the processing. Same for all the other functions invoked in the program. These functions passed as arguments are known as continuations because they **continue** the execution of the programs when called, and hence this style is called the continuation-passing style. The `cont` function is the continuation here.

<details> <summary> The rest of the functions can be written in CPS like this: </summary>

```
function getUserCPS(userId, cont) {
  let user = getUser(userId);
  cont(user);
}

function getFriendsCPS(user, cont) {
  let friends = getFriends(user);
  cont(friends);
}

function getRecommendationsCPS(friends, cont) {
  let recommendations = getRecommendations(friends);
  cont(recommendations);
}

function recordRecommendationsCPS(userId, recommendations, cont) {
  recordRecommendations(userId, recommendations);
  cont();
}
```

</details>

So, what is the point of all this? Why transform code into CPS? Since, in CPS the rest of the program is passed as a function, a program can itself explicitly manipulate the flow of control of the program. This lets us do things like[<sup>6</sup>](#fn6):

* Returning early from a function by calling the continuation with the return value, and not executing the rest of the function.
* Implementing exceptions by passing two continuations: one for the normal flow of the program, and another for the exceptional flow.
* Implementing non-deterministic programs by passing continuations for backtracking to previous states of the program.
* Converting potentially stack-blowing recursive programs into iterative programs by passing the continuation as a parameter to the recursive function.
* Suspending the execution of the program by storing the continuation, and resuming it later.

We can now begin to see how CPS can be used to implement coroutines.

### Continuation-Passing Style in Haskell[#](#continuation-passing-style-in-haskell) ###

It is straightforward to translate the [above program](#cb5-1) into Haskell:

```
getUserRecommendations :: Monad m => Int -> m Recommendations
getUserRecommendations userId = do
  user <- getUser userId
  friends <- getFriends user
  recommendations <- getRecommendations friends
  recordRecommendations userId recommendations
  return recommendations

main :: IO ()
main = getUserRecommendations 123 >>= print
```

And the CPS versions:

```
getUserRecommendationsCPS ::
  Monad m => Int -> (Recommendations -> m a) -> m a
getUserRecommendationsCPS userId cont =
  getUserCPS userId $ \user ->
    getFriendsCPS user $ \friends ->
      getRecommendationsCPS friends $ \recommendations ->
        recordRecommendationsCPS userId recommendations $ \_ ->
          cont recommendations

getUserCPS :: Monad m => Int -> (User -> m a) -> m a
getUserCPS userId cont = getUser userId >>= cont

getFriendsCPS :: Monad m => User -> (Friends -> m a) -> m a
getFriendsCPS user cont = getFriends user >>= cont

getRecommendationsCPS ::
  Monad m => Friends -> (Recommendations -> m a) -> m a
getRecommendationsCPS friends cont =
  getRecommendations friends >>= cont

recordRecommendationsCPS ::
  Monad m => Int -> Recommendations -> (() -> m a) -> m a
recordRecommendationsCPS userId recommendations cont =
  recordRecommendations userId recommendations >> cont ()

mainCPS :: IO ()
mainCPS = getUserRecommendationsCPS 123 $ print
```

We can immediately notice a pattern in the type signatures of the functions above: they are all of the form:

```
f :: Monad m => b -> (a -> m r) -> m r
```

It is indeed a known pattern, and is captured by the `ContT` type:

```
newtype ContT r m a =
  ContT { runContT :: (a -> m r) -> m r }
```

Turns out, the [`ContT`](https://hackage.haskell.org/package/mtl/docs/Control-Monad-Cont.html#t:ContT) type is a monad transformer, and we can use it to write the above CPS program in a more concise way[<sup>7</sup>](#fn7):

```
getUserRecommendationsCont ::
  Monad m => Int -> ContT r m Recommendations
getUserRecommendationsCont userId = do
  user <- getUserCont userId
  friends <- getFriendsCont user
  recommendations <- getRecommendationsCont friends
  recordRecommendationsCont userId recommendations
  return recommendations

getUserCont :: Monad m => Int -> ContT r m User
getUserCont userId = ContT (getUser userId >>=)

getFriendsCont :: Monad m => User -> ContT r m Friends
getFriendsCont user = ContT (getFriends user >>=)

getRecommendationsCont ::
  Monad m => Friends -> ContT r m Recommendations
getRecommendationsCont friends =
  ContT (getRecommendations friends >>=)

recordRecommendationsCont ::
  Monad m => Int -> Recommendations -> ContT r m ()
recordRecommendationsCont userId recommendations =
  ContT $ \cont ->
    recordRecommendations userId recommendations >> cont ()

mainCont :: IO ()
mainCont = runContT (getUserRecommendationsCont 123) print
```

So we have come full circle: we started with [monadic code](#cb8-1), and ended with similar [monadic code](#cb12-1), but with a different monad. So what did we gain from this transformation? Well, we can now use the [`callCC`](https://hackage.haskell.org/package/mtl/docs/Control-Monad-Cont.html#v:callCC) function provided by `ContT`.

### Call with Current Continuation[#](#call-with-current-continuation) ###

`callCC`—short for “call with current continuation”—is a function that provides on-demand access to the current continuation at any point in the code, just like we had in the [CPS version](#cb9-1) of the program. At the same time, by using `ConT` we can write the program again in the concise monadic style[<sup>8</sup>](#fn8).

The following example uses `callCC` to print the user recommendation twice, instead of once[<sup>9</sup>](#fn9):

```
getUserRecommendationsCont2 ::
  Monad m => Int -> ContT r m Recommendations
getUserRecommendationsCont2 userId = do
  user <- getUserCont userId
  friends <- getFriendsCont user
  recommendations <- getRecommendationsCont friends
  logRecommendationsCont userId recommendations
  callCC $ \cont -> do
    cont recommendations
    cont recommendations

mainCont2 :: IO ()
mainCont2 = runContT (getUserRecommendationsCont2 123) print
```

This is the power of CPS: it lets the programs manipulate the flow of control explicitly, and in some cases markedly, as we see in the next section.

From Continuations to Coroutines[#](#from-continuations-to-coroutines)
----------

Since continuations are functions, we can store them in data structures. This lets us pause the execution of a CPS program at a certain point, and resume it later from the same point. This is exactly what coroutines do.

To implement coroutines in Co, first we enhance the `Interpreter` monad to be able to capture the current continuation by adding the `ContT` monad transformer in the transformer stack:

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

To be able to pause and resume the Co code being interpreted, we need to capture the current interpreter environment as well. The environment contains the bindings that the executing Co code sees at any given time. By capturing and later restoring the environment, the code execution resumes with same environment, and hence works correctly.

```
data Coroutine a = Coroutine
  { corEnv :: Env
  , corCont :: a -> Interpreter ()
  , corReady :: MVar ()
  }

newCoroutine :: Env -> (a -> Interpreter ()) -> Interpreter (Coroutine a)
newCoroutine env cont = do
  ready <- newMVar ()
  return $ Coroutine env cont ready
```

The `Coroutine` data type contains the environment and the continuation. The `newCoroutine` function creates a new coroutine.

Next, we enhance the interpreter state to keep a queue of coroutines to be run.

```
data InterpreterState = InterpreterState
  { isEnv :: Env,
    isCoroutines :: Queue (Coroutine ())
  }

initInterpreterState :: IO InterpreterState
initInterpreterState = InterpreterState <$> builtinEnv <*> newQueue
```

We use an [`IORef`](https://hackage.haskell.org/package/base/docs/Data-IORef.html#t:IORef) containing a [min-priority queue](https://en.wikipedia.org/wiki/min-priority_queue) to store the coroutines[<sup>10</sup>](#fn10). For now, we use it as a simple [FIFO](https://en.wikipedia.org/wiki/FIFO_(computing_and_electronics)) queue, but we will see in a later post how we use it to implement the `sleep` functionality in our interpreter.

[]()

```
type Queue a = IORef (PQ.MinPQueue TimeSpec a, TimeSpec)

newQueue :: MonadBase IO m => m (Queue a)
newQueue = do
  now <- liftBase currentSystemTime
  newIORef (PQ.empty, now)

queueSize :: MonadBase IO m => Queue a -> m Int
queueSize = fmap (PQ.size . fst) . readIORef
```

Now that we know how coroutines are stored in the interpreter, let’s see how we schedule them.

Scheduling Coroutines[#](#scheduling-coroutines)
----------

First step in scheduling coroutines is to write functions to enqueue and dequeue from a queue:

```
enqueueAt :: TimeSpec -> a -> Queue a -> Interpreter ()
enqueueAt time val queue = atomicModifyIORef' queue $ \(q, maxWakeupTime) ->
  (( PQ.insert time val q,
     if time > maxWakeupTime then time else maxWakeupTime
   ), ())

enqueue :: a -> Queue a -> Interpreter ()
enqueue val queue = do
  now <- currentSystemTime
  enqueueAt now val queue

dequeue :: Queue a -> Interpreter (Maybe a)
dequeue queue = atomicModifyIORef' queue $ \(q, maxWakeupTime) ->
  if PQ.null q
    then ((q, maxWakeupTime), Nothing)
    else let ((_, val), q') = PQ.deleteFindMin q
         in ((q', maxWakeupTime), Just val)

currentSystemTime :: MonadIO m => m TimeSpec
currentSystemTime = liftIO $ getTime Monotonic
```

To use the min-priority queue as a FIFO queue, we use the current system time—which is a monotonically increasing value—as the priority of the values in the queue. This way, the coroutines are scheduled in the order they are enqueued.

The `enqueueAt` function enqueues the given value at the given time in the queue. The `enqueue` function enqueues the value at the current time, thus scheduling it to run immediately.

The `dequeue` function dequeues the value with the lowest priority from the queue, which in this case, is the value that is enqueued first.

The `currentSystemTime` function returns the monotonically increasing current system time.

Over these queuing primitives, we build the coroutine scheduling functions:

```
scheduleCoroutine :: Coroutine () -> Interpreter ()
scheduleCoroutine coroutine =
  State.gets isCoroutines >>= enqueue coroutine
```

The `scheduleCoroutine` function takes a coroutine, and schedules it by enqueuing it in the coroutine queue in the interpreter state.

```
runNextCoroutine :: Interpreter ()
runNextCoroutine =
  State.gets isCoroutines >>= dequeue >>= \case
    Nothing -> throwError CoroutineQueueEmpty
    Just Coroutine {..} -> do
      void $ takeMVar corReady
      setEnv corEnv
      corCont ()
```

The `runNextCoroutine` function dequeues the next coroutine from the queue, and runs it. It first restores the environment of the coroutine in the interpreter state, and then runs the continuation of the coroutine. If the queue is empty, it throws a `CoroutineQueueEmpty` exception, which we add in the `Exception` data type:

```
data Exception
  = Return Value
  | RuntimeError String
  | CoroutineQueueEmpty
```

The `runNextCoroutine` function is the heart of the coroutine scheduling. It is called at the end of every function related to coroutines in the interpreter, and that’s how the coroutines are run one-after-another. Next, we see how we use these functions to implement the `yield` and `spawn` statements in Co.

Yield and Spawn[#](#yield-and-spawn)
----------

Let’s recall the program we used to demonstrate coroutines:

```
function printNums(start, end) {
  var i = start;
  while (i < end + 1) {
    print(i);
    yield;
    i = i + 1;
  }
}

spawn printNums(1, 4);
printNums(11, 16);
```

Running this program with the interpreter produces the following output:

```
11
1
12
2
13
3
14
4
15
16
```

As we see, the numbers printed by the `printNums(11, 16)` function call are interleaved with the ones printed by the `printNums(1, 4)` call.

This is how the code is interpreted:

1. First, the definition of the function `printNums` executes. The function gets stored in the environment as a `Function` value.
2. The `spawn printNums(1, 4)` statement executes. The `spawn` statement creates a new coroutine for the function call `printNums(1, 4)` and schedules it.
3. <details> <summary> The `printNums(11, 16)` function call executes, prints `11` and yields. </summary>
   1. The `while` loop executes, and the `print` statement prints the value of the variable `i`, which is `11` at this point.
   2. The `yield` statement executes. This creates a new coroutine for the rest of the call execution, and schedules it. The call execution suspends at this point.

   </details>
4. <details> <summary> The `runNextCoroutine` function executes, which dequeues the coroutine for the `printNums(1, 4)` call, and runs it. This prints `1` and yields. </summary>
   1. The `while` loop executes, and the `print` statement prints the value of the variable `i`, which is `1` at this point.
   2. The `yield` statement executes. This creates a new coroutine for the rest of the call execution, and schedules it. The call execution suspends at this point.

   </details>
5. <details> <summary> The `runNextCoroutine` function executes again, which dequeues the coroutine for the `printNums(11, 16)` call, and runs it. This prints `12` and yields. </summary>
   1. The call resumes after the `yield` statement. The `while` loop executes again, and the `print` statement prints the value of the variable `i`, which is `12` at this point.
   2. The function execution suspends at the `yield` statement again.

   </details>
6. <details> <summary> The `runNextCoroutine` function executes again, which dequeues the coroutine for the `printNums(1, 4)` call, and runs it. This prints `2` and yields. </summary>
   1. The call resumes after the `yield` statement. The `while` loop executes again, and the `print` statement prints the value of the variable `i`, which is `2` at this point.
   2. The function execution suspends at the `yield` statement again.

   </details>
7. This back-and-forth process of suspension and resumption of function executions continues until the `printNums(1, 4)` call returns after printing the number `4`.
8. After that, the call `printNums(11, 16)` resumes to print the numbers and yields, again and again, until it returns after printing the number `16`.
9. Interpretation ends.

The diagram below depicts this process in abstract:

![Spawning, yielding, and running coroutines](data:image/svg+xml,%3Csvg%20xmlns='http://www.w3.org/2000/svg'%20viewBox='0%200%20673%20849'%3E%3C/svg%3E) \<img src="/images/implementing-co-3/coroutine-scheduling.svg" class="w-100pct nolink mw-80pct" alt="Spawning, yielding, and running coroutines"\>\</img\> Spawning, yielding, and running coroutines

With the understanding of how they work, let’s see how to implement the `yield` and `spawn` statements in Co.

### Implementation[#](#implementation) ###

First, we add the `YieldStmt` and `SpawnStmt` constructors to the `Stmt` data type:

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

Then, we enhance the `stmt` parser to parse these statements:

```
stmt :: Parser Stmt
stmt =
  IfStmt <$> (reserved "if" *> parens expr) <*> braces (many stmt)
    <|> WhileStmt <$> (reserved "while" *> parens expr) <*> braces (many stmt)
    <|> VarStmt <$> (reserved "var" *> identifier) <*> (symbol "=" *> expr <* semi)
    <|> YieldStmt <$ (reserved "yield" <* semi)
    <|> SpawnStmt <$> (reserved "spawn" *> expr <* semi)
    <|> ReturnStmt <$> (reserved "return" *> optional expr <* semi)
    <|> FunctionStmt
      <$> try (reserved "function" *> identifier)
      <*> parens (sepBy identifier $ symbol ",")
      <*> braces (many stmt)
    <|> try (AssignStmt <$> identifier <*> (symbol "=" *> expr <* semi))
    <|> try (SendStmt <$> expr <*> (symbol "->" *> expr <* semi))
    <|> ExprStmt <$> expr <* semi
```

Next, we implement the `execute` function for the `YieldStmt` and `SpawnStmt` statements:

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

All the scaffolding is now in place. Next, we implement the `yield` and `spawn` functions. First comes `spawn`:

```
spawn :: Expr -> Interpreter ()
spawn expr = do
  env <- State.gets isEnv
  coroutine <- newCoroutine env (const $ evaluate expr >> runNextCoroutine)
  scheduleCoroutine coroutine
```

The `spawn` statement creates a new coroutine for the expression `expr` and schedules it. The coroutine captures the current environment, and evaluates the expression `expr` when it is run. The `runNextCoroutine` function is called after the expression is evaluated to run the next coroutine in the queue[<sup>11</sup>](#fn11).

Next up is `yield`:

```
yield :: Interpreter ()
yield = do
  env <- State.gets isEnv
  callCC $ \cont -> do
    newCoroutine env cont >>= scheduleCoroutine
    runNextCoroutine
```

The `yield` function is the essence of coroutines in Co. This is where we use the continuations that we added to the interpreter. First, we capture the current environment from the interpreter state. Then, we invoke `callCC` to get the current continuation. This continuation represents the rest of the program execution that lies in future after the `yield` statement[<sup>12</sup>](#fn12). We create a new coroutine with the captured environment and the continuation, and schedule it. Finally, we run the next coroutine in the queue.

By capturing the environment and the continuation in a coroutine, and scheduling it to be run later, we are able to suspend the current program execution, and resume it later. At the same time, by running the next coroutine in the queue, we cause the interleaved execution of function calls that we saw in the previous section.

Waiting for Termination[#](#waiting-for-termination)
----------

There is one last thing we need to implement. If we were to run the following program with the interpreter as we have it now, it would terminate prematurely without printing anything:

```
function printNums(start, end) {
  var i = start;
  while (i < end + 1) {
    print(i);
    yield;
    i = i + 1;
  }
}

spawn printNums(1, 4);
```

That’s because `spawn` schedules a coroutine for the `printNums(1, 4)` function call, but the interpreter does not wait for all scheduled coroutines to finish executing before terminating. So, we add a mechanism for the same:

```
awaitTermination :: Interpreter ()
awaitTermination = do
  (coroutines, maxWakeupTime) <- readIORef =<< State.gets isCoroutines
  dur <- calcSleepDuration maxWakeupTime
  unless (PQ.null coroutines) $ if dur > 0
    then sleep dur >> awaitTermination
    else yield >> awaitTermination
```

The `awaitTermination` function checks if the coroutine queue is empty. If it is not, it yields and calls itself again to redo the check. Calling `yield` causes the next coroutine in the queue to be run. `awaitTermination` keeps checking the queue, and yielding until the queue is empty. Then, it finally returns.

Putting Everything Together[#](#putting-everything-together)
----------

Finally, we put everything together in the `interpret` function:

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

We add `awaitTermination` at the end of the program to be interpreted so that the interpreter waits for the coroutine queue to be empty before terminating.

We use `runContT` to run the program with the initial continuation, which is just `return`. This causes the interpreter to terminate when the program returns.

Lastly, we catch the `CoroutineQueueEmpty` exception, ignore it, and terminate the interpreter.

That’s it! We have implemented coroutines in Co. For an interesting example of usage of coroutines, we are going to implement the breadth-first traversal of a binary tree without using a queue in the next section.

Bonus Round: Breadth-First Traversal without a Queue[#](#bonus-round-breadth-first-traversal-without-a-queue)
----------

[Breadth-first traversal](https://en.wikipedia.org/wiki/Breadth-first_traversal) is a common algorithm for traversing a tree. It traverses the tree level-by-level, from left to right. It uses a queue to keep track of the nodes that are yet to be traversed. However, with coroutines, we can implement a breadth-first traversal without using a queue.

First, we need to define a binary tree data structure in Co. Remember, however, that Co does not have a built-in data structure for trees, neither does it support user-defined data structures. So, we are going to borrow [a trick from the Wizard book](https://web.archive.org/web/20230211/https://mitp-content-server.mit.edu/books/content/sectbyfn/books_pres_0/6515/sicp.zip/full-text/book/book-Z-H-14.html#%_sec_2.1.3), and implement it using closures:

```
function BinaryTree(val, left, right) {
  return function (command) {
    if (command == "val") { return val; }
    if (command == "left") { return left; }
    if (command == "right") { return right; }
    return null;
  };
}

function binaryTreeVal(tree) { return tree("val"); }
function binaryTreeLeft(tree) { return tree("left"); }
function binaryTreeRight(tree) { return tree("right"); }
```

We define a binary tree as a function that takes a node value, and left and right subtrees as parameters, and returns an anonymous function that takes a command, and returns the corresponding parameter value. The `binaryTreeVal`, `binaryTreeLeft` and `binaryTreeRight` are helper functions that call the returned anonymous function with the appropriate command.

Next, we write a function to generate a [perfect binary tree](https://en.wikipedia.org/wiki/Binary_tree#perfect) given a starting power-of-two number:

```
function generatePowersOfTwoBinaryTree(start) {
  function generateTree(start, interval) {
    if (start == 1) {
      return BinaryTree(1, null, null);
    }
    return BinaryTree(start,
      generateTree(start - interval/2, interval/2),
      generateTree(start - interval/2, interval/2));
  }
  return generateTree(start, start);
}
```

And, a function to pretty-print a tree node:

```
function printTreeNode(val, depth) {
  var i = 0;
  var padding = "┃━";
  while (i < depth) {
    padding = padding + "━━━━━━━━";
    i = i + 1;
  }

  print(padding + " " + val);
}
```

Finally, here’s the function that does the breadth-first traversal, and prints the tree:

```
function printBinaryTreeBreadthFirst(tree) {
  function traverseTree(tree, depth) {
    if (tree == null) { return; }
    printTreeNode(binaryTreeVal(tree), depth);
    spawn traverseTree(binaryTreeLeft(tree), depth + 1);
    spawn traverseTree(binaryTreeRight(tree), depth + 1);
  }
  traverseTree(tree, 0);
}
```

We run it like this:

```
var tree = generatePowersOfTwoBinaryTree(16);
printBinaryTreeBreadthFirst(tree);
```

<details> <summary> And, we get the following output: </summary>

```
┃━ 16
┃━━━━━━━━━ 8
┃━━━━━━━━━ 8
┃━━━━━━━━━━━━━━━━━ 4
┃━━━━━━━━━━━━━━━━━ 4
┃━━━━━━━━━━━━━━━━━ 4
┃━━━━━━━━━━━━━━━━━ 4
┃━━━━━━━━━━━━━━━━━━━━━━━━━ 2
┃━━━━━━━━━━━━━━━━━━━━━━━━━ 2
┃━━━━━━━━━━━━━━━━━━━━━━━━━ 2
┃━━━━━━━━━━━━━━━━━━━━━━━━━ 2
┃━━━━━━━━━━━━━━━━━━━━━━━━━ 2
┃━━━━━━━━━━━━━━━━━━━━━━━━━ 2
┃━━━━━━━━━━━━━━━━━━━━━━━━━ 2
┃━━━━━━━━━━━━━━━━━━━━━━━━━ 2
┃━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ 1
┃━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ 1
┃━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ 1
┃━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ 1
┃━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ 1
┃━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ 1
┃━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ 1
┃━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ 1
┃━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ 1
┃━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ 1
┃━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ 1
┃━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ 1
┃━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ 1
┃━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ 1
┃━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ 1
┃━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ 1
```

</details>

The trick here is to use the coroutine queue itself for the breadth-first traversal. After printing a tree node, we spawn a coroutine for traversing each child node. The coroutines are scheduled in the order they are spawned, so the traversal is breadth-first, resulting in the above output.

---

In this post, we added support for coroutines to our Co interpreter. We learned about the continuation-passing style, and used it to implement coroutines. In the [next part](https://abhinavsarkar.net/posts/implementing-co-4/?mtm_campaign=feed), we’ll add support for channels to our interpreter, and use them for cross-coroutine communication.

The code for complete Co interpreter is available [here](https://abhinavsarkar.net/code/co-interpreter.html?mtm_campaign=feed).

Acknowledgements[#](#acknowledgements)
----------

Many thanks to [Arun Raghavan](https://arunraghavan.net/) for reviewing a draft of this article.

 If you have any questions or comments, please leave a comment below. If you liked this post, please share it. Thanks for reading!

 Abelson, Harold, Gerald Jay Sussman, and with Julie Sussman. “The Environment Model of Evaluation.” In *Structure and Interpretation of Computer Programs*, 2nd Editon. MIT Press/McGraw-Hill, 1996. [https://mitp-content-server.mit.edu/books/content/sectbyfn/books\_pres\_0/6515/sicp.zip/full-text/book/book-Z-H-21.html#%\_sec\_3.2](https://mitp-content-server.mit.edu/books/content/sectbyfn/books_pres_0/6515/sicp.zip/full-text/book/book-Z-H-21.html#%_sec_3.2).

 Bartel, Joe. “Non-Preemptive Multitasking.” *The Computer Journal*, no. 30 (May 2011): 37–38, 28. [http://cini.classiccmp.org/pdf/HT68K/HT68K%20TCJ30p37.pdf](<http://cini.classiccmp.org/pdf/HT68K/HT68K TCJ30p37.pdf>).

 Knuth, Donald E. “Coroutines.” In *The Art of Computer Programming: Volume 1: Fundamental Algorithms*, 3rd ed., 193–200. Addison Wesley, 1997.

 Reynolds, John C. “The Discoveries of Continuations.” *LISP and Symbolic Computation* 6, no. 3-4 (1993): 233–47. [https://www.cs.ru.nl/\~freek/courses/tt-2011/papers/cps/histcont.pdf](https://www.cs.ru.nl/~freek/courses/tt-2011/papers/cps/histcont.pdf).

---

1. This representation is copied from a [series](https://dmitrykandalov.com/coroutines-as-threads) of articles on coroutines by Dmitry Kandalov. The articles are a great introduction to coroutines, and are highly recommended.[↩︎](#fnref1)

2. Read the [Kotlin docs](https://kotlinlang.org/docs/coroutines-guide.html) and [Python docs](https://docs.python.org/3/library/asyncio-task.html) to learn more about coroutines in Kotlin and Python respectively.[↩︎](#fnref2)

3. Generators are similar to coroutines. The main difference is that generators are typically used to produce a sequence of values, while coroutines are used to implement concurrency. But coroutines (as we have them in this post) can be implemented over generators, and generators can be implemented over coroutines and channels. So the difference is mostly of intent.[↩︎](#fnref3)

4. Coroutines as we have them in Co, are asymmetric, non-first-class, and stackful.

   In contrast, coroutines in

   * Kotlin are asymmetric, non-first-class and stackless,
   * Python are asymmetric, first-class and stackless,
   * Lua are asymmetric, first-class and stackful, and
   * Zig are symmetric, non-first-class and stackless.

   See the Wikipedia article on coroutines for more details on the [types of coroutines](https://en.wikipedia.org/wiki/Coroutine#Definition_and_Types) and their [various implementations](https://en.wikipedia.org/wiki/Coroutine#Implementations).[↩︎](#fnref4)

5. The core.async library implements something like coroutines in Clojure, but they are not true coroutines. They have [various limitations](https://www.clojure.org/guides/core_async_go#_unsupported_constructs_and_other_limitations_in_go_blocks) like not being able to yield from a functions called from a `go` block. This is because core.async is implemented as a macro that transforms the code directly inside a `go` block into a state machine, but not the functions called from the `go` block.[↩︎](#fnref5)

6. See [this article](https://free.cofree.io/2020/01/02/cps/) by Ziyang Liu and [this one](https://matt.might.net/articles/programming-with-continuations--exceptions-backtracking-search-threads-generators-coroutines/) by Matt Might for detailed explanations of the various use-cases of CPS.[↩︎](#fnref6)

7. See [this article](https://blog.poisson.chat/posts/2019-10-26-reasonable-continuations.html) by Li-yao XIA for an introduction to the `Cont` monad.[↩︎](#fnref7)

8. [Scheme](https://en.wikipedia.org/wiki/Scheme_(programming_language)) was the first language to introduce `call/cc`. Since then [many languages](https://en.wikipedia.org/wiki/Continuation#Programming_language_support) have added support for it.[↩︎](#fnref8)

9. If we compare the [CPS version](#cb9-1) of the program with the [direct style version](#cb8-1), we can see that it is possible to print the recommendations twice in the CPS version by calling the continuation twice. However, this is not possible in the direct style version, since the flow of control is implicit in it.[↩︎](#fnref9)

10. We use the min-priority queue from the [pqueue](https://hackage.haskell.org/package/pqueue) library.[↩︎](#fnref10)

11. It is essential to call `runNextCoroutine` after the expression in the `spawn` statement is evaluated. The evaluation of the expression may or may not yield. If it does, yielding causes the next coroutine to be [run](#cb17-1).

   However, if it does not yield, but instead returns, and we do not call `runNextCoroutine` after it, the flow of control then goes to the end of the previous call to `runNextCoroutine` called from a previous yield. This causes the program after the previous yield to start executing, but with the interpreter environment set to that of the expression in the `spawn` statement, leading to unexpected behavior.

   So, calling `runNextCoroutine` after the expression evaluation is a must to ensure correct execution.[↩︎](#fnref11)

12. The coroutines in Co are stackful, which means that the ToC can be yielded from anywhere in the program, including nested function calls, and are resumed from the same point. This is in contrast to stackless coroutine implementations, where the ToC can only be yielded from particular functions that are marked as being able to yield, like generators in Python or `async` functions in JavaScript. Stackless coroutines are more efficient, but they are also more restrictive.[↩︎](#fnref12)

This post is a part of the series: **Implementing Co, a Small Language With Coroutines**.

1. [The Parser](https://abhinavsarkar.net/posts/implementing-co-1/?mtm_campaign=feed)
2. [The Interpreter](https://abhinavsarkar.net/posts/implementing-co-2/?mtm_campaign=feed)
3. **Adding Coroutines** 👈
4. [Adding Channels](https://abhinavsarkar.net/posts/implementing-co-4/?mtm_campaign=feed)
5. [Adding Sleep](https://abhinavsarkar.net/posts/implementing-co-5/?mtm_campaign=feed)

---

Thanks for reading this post via feed. Feeds are great, and you're great for using them. ♥

This post was originally published on [abhinavsarkar.net](https://abhinavsarkar.net/posts/implementing-co-3/?mtm_campaign=feed).

### Like, repost, or comment on: ###

* [Fediverse](https://fantastic.earth/@abnv/109846979571728887)
* [Lobsters](https://lobste.rs/s/sotg8z)
* [Reddit](https://www.reddit.com/r/haskell/comments/10zqy5g/)
* [My website](https://abhinavsarkar.net/posts/implementing-co-3/?mtm_campaign=feed#comment-container)

Read more of my [posts](https://abhinavsarkar.net/posts/) and [notes](https://abhinavsarkar.net/notes/).

![](https://anna.abhinavsarkar.net/matomo.php?idsite=1&rec=1)