+++
title = "Implementing Co, a Small Language With Coroutines #5: Adding Sleep"
description = "In the previous post, we added channels to Co, the small language we are implementing in this series of posts. In this post, we add the sleep primitive to it, enabling time-based coroutine scheduling. We then use sleep to bu"
date = "2026-01-16T00:00:00Z"
url = "https://abhinavsarkar.net/posts/implementing-co-5/"
author = "Abhinav Sarkar"
text = ""
lastupdated = "2026-07-21T09:17:41.439836442Z"
seen = false
+++

In the [previous post](https://abhinavsarkar.net/posts/implementing-co-4/?mtm_campaign=feed), we added channels to Co, the small language we are implementing in this series of posts. In this post, we add the `sleep` primitive to it, enabling time-based coroutine scheduling. We then use sleep to build a simulation of digital logic circuits.

This post was originally published on [abhinavsarkar.net](https://abhinavsarkar.net/posts/implementing-co-5/?mtm_campaign=feed).

This post is a part of the series: **Implementing Co, a Small Language With Coroutines**.

1. [The Parser](https://abhinavsarkar.net/posts/implementing-co-1/?mtm_campaign=feed)
2. [The Interpreter](https://abhinavsarkar.net/posts/implementing-co-2/?mtm_campaign=feed)
3. [Adding Coroutines](https://abhinavsarkar.net/posts/implementing-co-3/?mtm_campaign=feed)
4. [Adding Channels](https://abhinavsarkar.net/posts/implementing-co-4/?mtm_campaign=feed)
5. **Adding Sleep** 👈

### Contents ###

1. [Introduction](#introduction)
2. [Adding Sleep](#adding-sleep)
3. [Delayed Coroutines](#delayed-coroutines)
4. [Queuing Coroutines](#queuing-coroutines)
5. [Implementing Sleep](#implementing-sleep)
6. [Sleep in Action](#sleep-in-action)
   1. [Sleep Sort](#sleep-sort)
   2. [JavaScript-like Timeouts and Intervals](#javascript-like-timeouts-and-intervals)

7. [Bonus Round: Digital Circuit Simulation](#bonus-round-digital-circuit-simulation)
   1. [Conjuring Lists](#conjuring-lists)
   2. [Wires](#wires)
   3. [Logic Gates](#logic-gates)
   4. [Adders](#adders)
   5. [Ripple-carry Adder](#ripple-carry-adder)

8. [Conclusion](#conclusion)

Introduction[#](#introduction)
----------

[Sleep](https://en.wikipedia.org/wiki/Sleep_(system_call)) is a commonly used operation in concurrent programs. It pauses the execution of the current *Thread of Computation* (ToC) for a specified duration, after which the ToC is resumed automatically. Sleep is used for various purposes: polling for events, delaying execution of an operation, simulating latency, implementing timeouts, and more.

Sleep is generally implemented as a primitive operation in most languages, delegating the actual implementation to the underlying operating system. The operating system’s scheduler removes the ToC from the list of runnable ToCs, places it in a list of sleeping ToCs, and after the specified duration, moves it back to the list of runnable ToCs for scheduling.

Since Co implements its own ToC (coroutine) scheduler, we implement sleep as a primitive operation within the interpreter itself[<sup>1</sup>](#fn1).

Adding Sleep[#](#adding-sleep)
----------

We start by exposing `sleep` and `getCurrentMillis` as built-in functions to Co:

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

The `sleep` built-in function takes one argument—the duration in milliseconds to sleep for. The `getCurrentMillis` function returns the current time in milliseconds since the [Unix epoch](https://en.wikipedia.org/wiki/Unix_epoch). Both of them delegate to the functions explained next.

```
executeSleep :: [Expr] -> Interpreter Value
executeSleep argEs = evaluate (head argEs) >>= \case
  Num n | n >= 0 -> sleep n >> return Null
  Num n -> throw $ "Sleep time must be non-negative: " <> show n
  _ -> throw "sleep call expected a number argument"

executeGetCurrentMillis :: [Expr] -> Interpreter Value
executeGetCurrentMillis _ =
  Num . fromIntegral . floor . (* 1000) <$> liftIO getPOSIXTime
```

The `executeSleep` function evaluates its argument to a number, checks that it is non-negative, and then calls the `sleep` function in the `Interpreter` monad. `executeGetCurrentMillis` calls [`getPOSIXTime`](https://hackage.haskell.org/package/time/docs/Data-Time-Clock-POSIX.html#v:getPOSIXTime) and returns the milliseconds wrapped as a `Num`.

The implementation of sleep is more involved than other built-in functions because it interacts with the coroutine scheduler. When a coroutine calls `sleep`, we want to suspend the coroutine, and schedule it to be resumed after the specified duration. There may be multiple coroutines in the sleep state at a time, and they must be resumed according to their wakeup time (time at which sleep was called + sleep duration), and not in any other order. To be efficient, it is also important that the scheduler does not poll repeatedly for new coroutines to wake up and run, but instead waits till the right time. These are the two requirements for our coroutine scheduler. And the solution is: delayed coroutines.

Delayed Coroutines[#](#delayed-coroutines)
----------

The [coroutines](https://abhinavsarkar.net/posts/implementing-co-3/?mtm_campaign=feed#from-continuations-to-coroutines) we have implemented so far were scheduled to run immediately. To implement sleep, we extend the coroutine concept with *Delayed Coroutines*—coroutines that are scheduled to run at a specific future time.

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

Now the `Coroutine` data type holds an [`MVar`](https://hackage.haskell.org/package/base/docs/Control-Concurrent-MVar.html#t:MVar) to signal when the coroutine is ready to be run. The old-style coroutines that run immediately are created ready to run by the `newCoroutine` function. But delayed coroutines are different:

```
newDelayedCoroutine ::
  Integer -> Env -> (a -> Interpreter ()) -> Interpreter (Coroutine a)
newDelayedCoroutine sleepMillis env cont = do
  ready <- newEmptyMVar
  void $ liftIO $ forkIO $ do
    threadDelay $ fromIntegral sleepMillis * 1000
    putMVar ready ()
  return $ Coroutine env cont ready
```

The key difference from a regular coroutine is that the `MVar` used for signaling is created empty. We fork a thread[<sup>2</sup>](#fn2) that sleeps[<sup>3</sup>](#fn3) for the specified sleep duration, and then signals that the coroutine is ready to run by filling the `MVar`.

An `MVar` is a synchronization primitive[<sup>4</sup>](#fn4)—essentially a mutable box that can hold a value or be empty. When we call `takeMVar` on an empty `MVar`, it blocks until another thread fills it. This is what makes it powerful for our use case: instead of the interpreter repeatedly polling the queue asking “is this coroutine ready yet?”, we let the interpreter wait on the `MVar`. The forked thread signals readiness at the right time by filling the `MVar`. The interpreter wakes up immediately—no wasted CPU cycles, no busy-waiting.

Queuing Coroutines[#](#queuing-coroutines)
----------

We already have a `Queue` of coroutines in our `Interpreter`. It is a [min-priority queue](https://en.wikipedia.org/wiki/min-priority_queue) sorted by timestamps, which we have been using as a [FIFO](https://en.wikipedia.org/wiki/FIFO_(computing_and_electronics)) queue till now. Now we use it for its real purpose: storing delayed coroutines sorted by their wakeup times.

```
type Queue a = IORef (PQ.MinPQueue TimeSpec a, TimeSpec)

newQueue :: MonadBase IO m => m (Queue a)
newQueue = do
  now <- liftBase currentSystemTime
  newIORef (PQ.empty, now)

queueSize :: MonadBase IO m => Queue a -> m Int
queueSize = fmap (PQ.size . fst) . readIORef
```

The queue also tracks the maximum wakeup time of all coroutines in the queue. This information is useful for calculating how long the interpreter should sleep before termination.

The core operations on the queue are:

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

We saw the `enqueue` function [earlier](https://abhinavsarkar.net/posts/implementing-co-3/?mtm_campaign=feed#scheduling-coroutines):

>
>
> The `enqueueAt` function enqueues the given value at the given time in the queue. The `enqueue` function enqueues the value at the current time, thus scheduling it to run immediately.
>
>
>
> The `dequeue` function dequeues the value with the lowest priority from the queue, which in this case, is the value that is enqueued first.
>
>
>
> The `currentSystemTime` function returns the monotonically increasing current system time.
>
>

The `dequeue` function dequeues the coroutine with lowest priority, so if we use the wakeup time as priority, it will dequeue the coroutine that is to be run next. That works!

The `enqueueAt` function calculates and tracks the maximum wakeup times of the coroutines as well. Next, we implement the scheduling of delayed coroutines:

```
scheduleDelayedCoroutine :: TimeSpec -> Coroutine () -> Interpreter ()
scheduleDelayedCoroutine wakeupTime coroutine = do
  State.gets isCoroutines >>= enqueueAt wakeupTime coroutine
```

The `scheduleDelayedCoroutine` function enqueues a coroutine in the interpreter coroutine queue with the specified wakeup time. We also improve the `runNextCoroutine` function to wait for the coroutine to be ready before running it.

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

The `takeMVar` function call blocks till the thread that was forked when creating the coroutine wakes up and fills the `corReady` `MVar`. So we don’t have to poll the queue.

That’s all we have to do for having delayed coroutines.

Implementing Sleep[#](#implementing-sleep)
----------

With the infrastructure in place, the `sleep` function becomes straightforward:

```
sleep :: Integer -> Interpreter ()
sleep millis = do
  now <- currentSystemTime
  let wakeupTime = now + fromNanoSecs (fromIntegral millis * 1000000)
  env <- State.gets isEnv
  callCC $ \cont -> do
    coroutine <- newDelayedCoroutine millis env cont
    scheduleDelayedCoroutine wakeupTime coroutine
    runNextCoroutine
```

When a coroutine calls `sleep`, we capture the current environment and use `callCC` to capture the continuation—the code that should run after the sleep completes. We then create a new delayed coroutine with this continuation, schedule it for the future, and run the next coroutine in the queue. The scheduler machinery takes care of running the delayed coroutine at the right time.

We also modify the `awaitTermination` function from the previous post to handle delayed coroutines. It now sleeps till the last wakeup time before checking if the queue is empty:

```
awaitTermination :: Interpreter ()
awaitTermination = do
  (coroutines, maxWakeupTime) <- readIORef =<< State.gets isCoroutines
  dur <- calcSleepDuration maxWakeupTime
  unless (PQ.null coroutines) $ if dur > 0
    then sleep dur >> awaitTermination
    else yield >> awaitTermination
```

Notice how we use the `sleep` function we just defined in `awaitTermination`. The `calcSleepDuration` function calculates how long to sleep before the last coroutine becomes ready:

```
calcSleepDuration :: TimeSpec -> Interpreter Integer
calcSleepDuration maxWakeupTime = do
  now <- currentSystemTime
  return $ 1 + fromIntegral (maxWakeupTime - now) `div` 1000000
```

That’s all for sleeping. This may be too much to take in, so let’s go through some examples.

Sleep in Action[#](#sleep-in-action)
----------

Sleep can be used for polling/waiting for events, delaying execution, simulating latency, implementing timeouts, and more. Let’s see some simple uses.

### Sleep Sort[#](#sleep-sort) ###

An interesting example of sleep is the infamous [sleep sort](https://www.geeksforgeeks.org/dsa/sleep-sort-king-laziness-sorting-sleeping/), which sorts a list of numbers by spawning a coroutine for each number that sleeps for the duration of that number, then prints it:

```
function sleepSort(a, b, c, d, e) {
  function printNum(num) {
    sleep(num);
    print(num);
  }
  spawn printNum(a);
  spawn printNum(b);
  spawn printNum(c);
  spawn printNum(d);
  spawn printNum(e);
}

sleepSort(5, 4, 3, 2, 1);
```

Running this program prints what we expect:

```
1
2
3
4
5
```

Don’t use `sleepSort` for sorting your numbers though. Moving on.

### JavaScript-like Timeouts and Intervals[#](#javascript-like-timeouts-and-intervals) ###

With sleep, we can implement JavaScript-like [`setTimeout`](https://developer.mozilla.org/en-US/docs/Web/API/Window/setTimeout) and [`setInterval`](https://developer.mozilla.org/en-US/docs/Web/API/Window/setInterval) functions:

```
function setTimeout(callback, millis) {
  spawn (function () { sleep(millis); callback(); })();
}

function hello() {
  print("hello");
}

setTimeout(hello, 10000);
```

The `setTimeout` function spawns a coroutine that sleeps for the specified duration and then calls the callback function.

```
function setInterval(callback, seconds) {
  function run() {
    callback();
    setTimeout(run, seconds);
  }
  setTimeout(run, seconds);
}

var start = getCurrentMillis();
function tick(t) {
  var now = getCurrentMillis();
  print(t + " " + (now - start));
}

setInterval(function () { tick("tick"); }, 2000);
sleep(1000);
setInterval(function () { tick("tock"); }, 2000);
```

The `setInterval` function repeatedly calls a callback at a fixed interval using `setTimeout` to reschedule itself. Running the above code prints alternating `tick` and `tock` every 1 second, forever:

```
tick 2005
tock 3008
tick 4009
tock 5009
tick 6015
tock 7013
tick 8017
tock 9019
tick 10020
tock 11021
tick 12021
```

Notice that the scheduling is not accurate up to milliseconds, but only approximate.

Bonus Round: Digital Circuit Simulation[#](#bonus-round-digital-circuit-simulation)
----------

As a more complex example of using sleep, we implement a simulator for digital logic circuits, from basic *[Logic gates](https://en.wikipedia.org/wiki/Logic_gates)* to a *[Ripple carry adder](https://en.wikipedia.org/wiki/Ripple_carry_adder)*. The idea is to model circuits as a network of wires and gates, where the wires carry digital signal values (`0` or `1`), and the logic gates transform input signals to output signals with a propagation delay.

The digital circuit simulation example is from the [Wizard Book](https://mitp-content-server.mit.edu/books/content/sectbyfn/books_pres_0/6515/sicp.zip/full-text/book/book-Z-H-22.html#%_sec_3.3.4). Quoting an example:

>
>
> An inverter is a primitive function box [logic gate] that inverts its input. If the input signal to an inverter changes to 0, then one inverter-delay later the inverter will change its output signal to 1. If the input signal to an inverter changes to 1, then one inverter-delay later the inverter will change its output signal to 0.
>
>

But first, we’ll need to make some lists.

### Conjuring Lists[#](#conjuring-lists) ###

We implement a simple cons list (a singly linked list) using [a trick from the Wizard book](https://web.archive.org/web/20260116/https://mitp-content-server.mit.edu/books/content/sectbyfn/books_pres_0/6515/sicp.zip/full-text/book/book-Z-H-14.html#%_sec_2.1.3):

```
function Cons(first, rest) {
  return function (command) {
    if (command == "first") { return first; }
    if (command == "rest") { return rest; }
  };
}

function Empty() { return null;}

function first(list) { return list("first"); }
function rest(list) { return list("rest"); }
function prepend(list, element) { return Cons(element, list); }
```

`Empty` creates an empty list, and we grow the list by prepending an element to it by calling the `prepend` function. `first` returns the first element of a list, and `rest` returns the rest of them. Notice that a `Cons` cell is just a closure that holds references to its first and rest parameters, and returns a selector function to retrieve them.

Next, we define a helper function to call a list of actions, yielding after each one:

```
function callEach(actions) {
  if (actions != Empty()) {
    callEach(rest(actions));
    first(actions)();
    yield;
  }
}
```

### Wires[#](#wires) ###

A wire holds a mutable signal value and a list of actions to call when the signal changes:

```
function Wire() {
  var signalValue = 0;
  var actions = Empty();

  return function (command) {
    if (command == "get-signal") {
      return signalValue;
    }
    if (command == "set-signal") {
      return function (newValue) {
        if (signalValue != newValue) {
          signalValue = newValue;
          callEach(actions);
        }
      };
    }
    if (command == "add-action") {
      return function (action) {
        actions = prepend(actions, action);
        action();
      };
    }
    return null;
  };
}

function getSignal(wire) { return wire("get-signal"); }
function setSignal(wire, signal) { wire("set-signal")(signal); }
function addAction(wire, action) { wire("add-action")(action); }

function connect(a, b) {
  function propagate() {
    setSignal(b, getSignal(a));
  }
  addAction(a, propagate);
}
```

A wire provides three operations:

* `get-signal`: returns the current signal value.
* `set-signal`: sets a new signal value and calls all actions if the value changed.
* `add-action`: adds an action to be called when the signal changes, and calls it immediately.

The `connect` function connects two wires, causing the signal from one to propagate to another.

### Logic Gates[#](#logic-gates) ###

First, we define the basic logic operations:

```
function and(a, b) {
  if (a == 1) { if (b == 1) { return 1; } }
  return 0;
}

function or(a, b) {
  if (a == 1) { return 1; }
  if (b == 1) { return 1; }
  return 0;
}

function not(a) {
  if (a == 1) { return 0; }
  return 1;
}
```

And a utility function to schedule a function to run after a delay:

```
function runAfter(millis, func) {
  spawn (function () {
    sleep(millis);
    func();
  })();
}
```

With these building blocks, we define the logic gates. Each gate computes its output based on its inputs and schedules the output update after a propagation delay specific to the gate:

```
var andGateDelay = 300;

function AndGate(a, b, out) {
  function compute() {
    var newSignal = and(getSignal(a), getSignal(b));
    runAfter(andGateDelay, function () { setSignal(out, newSignal); });
  }
  addAction(a, compute);
  addAction(b, compute);
}

var orGateDelay = 500;

function OrGate(a, b, out) {
  function compute() {
    var newSignal = or(getSignal(a), getSignal(b));
    runAfter(orGateDelay, function () { setSignal(out, newSignal); });
  }
  addAction(a, compute);
  addAction(b, compute);
}

var notGateDelay = 200;

function NotGate(a, out) {
  function compute() {
    var newSignal = not(getSignal(a));
    runAfter(notGateDelay, function () { setSignal(out, newSignal); });
  }
  addAction(a, compute);
}
```

We add the `compute` action to each input wire, which runs when the input signals change, and sets the signal on the output wire after a delay.

Let’s test an And gate:

```
var input1 = Wire();
var input2 = Wire();
var output = Wire();

log(">> Setting up the probes");
addProbe("input1", input1);
addProbe("input2", input2);
addProbe("output", output);

log(">> Setting up the And gate");
AndGate(input1, input2, output);

log(">> Setting input1 to 1");
setSignal(input1, 1);

sleep(1000);

log(">> Setting input2 to 1");
setSignal(input2, 1);
```

For probing, we define a helper that logs signal changes with milliseconds elapsed since start of the run:

```
var start = getCurrentMillis();

function log(msg) {
  print("[" + (getCurrentMillis() - start) + "] " + msg);
}

function addProbe(label, wire) {
  addAction(wire, function () {
    log(label + ": " + getSignal(wire));
  });
}
```

The output:

```
[0] >> Setting up the probes
[0] input1: 0
[0] input2: 0
[0] output: 0
[0] >> Setting up the And gate
[0] >> Setting input1 to 1
[0] input1: 1
[1005] >> Setting input2 to 1
[1006] input2: 1
[1310] output: 1
```

It works as expected. You can notice the sleep and the And gate delay in action.

### Adders[#](#adders) ###

Using the basic logic gates, next we build adders. A [Half adder](https://en.wikipedia.org/wiki/Half_adder) is a digital circuit that adds two bits:

![Half Adder](data:image/svg+xml,%3Csvg%20xmlns='http://www.w3.org/2000/svg'%20viewBox='0%200%2091%2022'%3E%3C/svg%3E) \<img src="/images/implementing-co-5/half-adder.svg" class="w-100pct nolink mw-60pct" alt="Half Adder"\>\</img\> Half Adder

It has two input signals/bits `Input1` and `Input2`, and two output bits `Sum` and `Carry`. We simply connect the And, Or and Not gates with input, output and intermediate wires in our code as shown in the diagram:

```
function HalfAdder(label, input1, input2, sum, carry) {
  var a = Wire();
  var b = Wire();
  addProbe(label + "-a", a);
  addProbe(label + "-b", b);

  OrGate(input1, input2, a);
  AndGate(input1, input2, carry);
  NotGate(carry, b);
  AndGate(a, b, sum);
}
```

Nice and simple. Let’s test it:

```
var input1 = Wire();
var input2 = Wire();
var sum = Wire();
var carry = Wire();

log(">> Setting up the probes");
addProbe("input1", input1);
addProbe("input2", input2);
addProbe("sum", sum);
addProbe("carry", carry);

log(">> Setting up the half-adder");
HalfAdder("half-adder", input1, input2, sum, carry);

log(">> Setting input1 to 1");
setSignal(input1, 1);

sleep(1000);

log(">> Setting input2 to 1");
setSignal(input2, 1);
```

And the output:

```
[0] >> Setting up the probes
[0] input1: 0
[0] input2: 0
[0] sum: 0
[0] carry: 0
[0] >> Setting up the half-adder
[0] half-adder-a: 0
[0] half-adder-b: 0
[1] >> Setting input1 to 1
[1] input1: 1
[205] half-adder-b: 1
[505] half-adder-a: 1
[811] sum: 1
[1003] >> Setting input2 to 1
[1003] input2: 1
[1307] carry: 1
[1508] half-adder-b: 0
[1811] sum: 0
```

In binary, `1 + 1 = 10`. Correct! Notice again how the signal propagation through the gates is delayed. Next up is the full adder.

A [Full adder](https://en.wikipedia.org/wiki/Full_adder) adds three bits, two inputs and a carry-in:

![Full Adder](data:image/svg+xml,%3Csvg%20xmlns='http://www.w3.org/2000/svg'%20viewBox='0%200%20511%20220'%3E%3C/svg%3E) \<img src="/images/implementing-co-5/full-adder.svg" class="w-100pct nolink mw-70pct" alt="Full Adder"\>\</img\> Full Adder

Notice that a full adder uses two half adders. Again, we follow the diagram and connect the wires:

```
function FullAdder(label, input1, input2, carryIn, sum, carryOut) {
  var hsum = Wire();
  var carry1 = Wire();
  var carry2 = Wire();

  addProbe(label + "-hsum", hsum);
  addProbe(label + "-carry1", carry1);
  addProbe(label + "-carry2", carry2);

  HalfAdder(label + "-HA-" + 1, input2, carryIn, hsum, carry1);
  HalfAdder(label + "-HA-" + 2, input1, hsum, sum, carry2);
  OrGate(carry1, carry2, carryOut);
}
```

Let’s skip the demo for full adder and jump to something more exciting.

### Ripple-carry Adder[#](#ripple-carry-adder) ###

A [Ripple-carry adder](https://en.wikipedia.org/wiki/Ripple-carry_adder) chains together multiple full adders to add multi-bit numbers. The diagram below shows a four-bit adder:

![Ripple-carry Adder](data:image/svg+xml,%3Csvg%20xmlns='http://www.w3.org/2000/svg'%20viewBox='0%200%20276%20129'%3E%3C/svg%3E) \<img src="/images/implementing-co-5/ripple-adder.svg" class="w-100pct nolink extra-width" alt="Ripple-carry Adder"\>\</img\> Ripple-carry Adder

We create a ripple-carry adder that can add any number of bits. First we need some helper functions:

```
function Bits(label, n) {
  var bits = Empty();
  var bit = null;
  while (n > 0) {
    bit = Wire();
    addProbe(label + (n - 1), bit);
    bits = prepend(bits, bit);
    n = n - 1;
  }
  return bits;
}

function setBits(bits, bitValues) {
  if (bits != Empty()) {
    setSignal(first(bits), first(bitValues));
    setBits(rest(bits), rest(bitValues));
  }
}
```

`Bits` creates a list of wires to represent an N-bit input/output. `setBits` sets the bits of a N-bit wire list to a given N-bit value. Now we write a ripple-carry adder:

```
function RippleCarryAdder(label, a, b, carryIn, sum, carryOut) {
  var aBits = a;
  var bBits = b;
  var sumBits = sum;
  var cIn = carryIn;
  var cOut = null;
  var i = 1;
  while (aBits != Empty()) {
    cOut = Wire();
    addProbe(label + "-carryIn-" + i, cIn);
    addProbe(label + "-carryOut-" + i, cOut);
    FullAdder(label + "-FA-" + i,
      first(aBits), first(bBits), cIn, first(sumBits), cOut);
    aBits = rest(aBits);
    bBits = rest(bBits);
    sumBits = rest(sumBits);
    cIn = cOut;
    i = i + 1;
  }
  connect(cOut, carryOut);
}
```

The ripple-carry adder uses one full adder per bit, cascading the carry-out bit of each input bit-pair’s sum to the next pair of bits. To demonstrate, let’s add two 4-bit numbers:

```
log(">> Setting up the probes");
var a = Bits("a", 4);
var b = Bits("b", 4);
var sum = Bits("sum", 4);
var carryIn = Wire();
var carryOut = Wire();

addProbe("carryIn", carryIn);
addProbe("carryOut", carryOut);

log(">> Setting up the ripple carry adder");
RippleCarryAdder("RCA", a, b, carryIn, sum, carryOut);

log(">> Setting carryIn to 0");
setSignal(carryIn, 0);

log(">> Setting a to 5 = 0101 in binary");
setBits(a, Cons(1, Cons(0, Cons(1, Cons(0, Empty())))));

sleep(1000);

log(">> Setting b to 11 = 1011 in binary");
setBits(b, Cons(1, Cons(1, Cons(0, Cons(1, Empty())))));
```

This one runs for a while because of the collective delays.

<details> <summary> The output </summary>

```
[0] >> Setting up the probes
[1] a3: 0
[1] a2: 0
[1] a1: 0
[1] a0: 0
[1] b3: 0
[1] b2: 0
[1] b1: 0
[1] b0: 0
[1] sum3: 0
[1] sum2: 0
[1] sum1: 0
[1] sum0: 0
[1] carryIn: 0
[1] carryOut: 0
[1] >> Setting up the ripple carry adder
[1] RCA-carryIn-1: 0
[1] RCA-carryOut-1: 0
[1] RCA-FA-1-hsum: 0
[1] RCA-FA-1-carry1: 0
[1] RCA-FA-1-carry2: 0
[1] RCA-FA-1-HA-1-a: 0
[1] RCA-FA-1-HA-1-b: 0
[1] RCA-FA-1-HA-2-a: 0
[1] RCA-FA-1-HA-2-b: 0
[1] RCA-carryIn-2: 0
[1] RCA-carryOut-2: 0
[1] RCA-FA-2-hsum: 0
[2] RCA-FA-2-carry1: 0
[2] RCA-FA-2-carry2: 0
[2] RCA-FA-2-HA-1-a: 0
[2] RCA-FA-2-HA-1-b: 0
[2] RCA-FA-2-HA-2-a: 0
[2] RCA-FA-2-HA-2-b: 0
[2] RCA-carryIn-3: 0
[2] RCA-carryOut-3: 0
[2] RCA-FA-3-hsum: 0
[2] RCA-FA-3-carry1: 0
[2] RCA-FA-3-carry2: 0
[2] RCA-FA-3-HA-1-a: 0
[2] RCA-FA-3-HA-1-b: 0
[2] RCA-FA-3-HA-2-a: 0
[2] RCA-FA-3-HA-2-b: 0
[2] RCA-carryIn-4: 0
[2] RCA-carryOut-4: 0
[2] RCA-FA-4-hsum: 0
[2] RCA-FA-4-carry1: 0
[2] RCA-FA-4-carry2: 0
[2] RCA-FA-4-HA-1-a: 0
[2] RCA-FA-4-HA-1-b: 0
[2] RCA-FA-4-HA-2-a: 0
[2] RCA-FA-4-HA-2-b: 0
[2] >> Setting carryIn to 0
[2] >> Setting a to 5 = 0101 in binary
[2] a0: 1
[3] a2: 1
[205] RCA-FA-1-HA-1-b: 1
[205] RCA-FA-1-HA-2-b: 1
[205] RCA-FA-2-HA-1-b: 1
[207] RCA-FA-2-HA-2-b: 1
[207] RCA-FA-3-HA-1-b: 1
[207] RCA-FA-3-HA-2-b: 1
[207] RCA-FA-4-HA-1-b: 1
[207] RCA-FA-4-HA-2-b: 1
[505] RCA-FA-1-HA-2-a: 1
[505] RCA-FA-3-HA-2-a: 1
[810] sum0: 1
[810] sum2: 1
[1014] >> Setting b to 11 = 1011 in binary
[1015] b0: 1
[1015] b1: 1
[1016] b3: 1
[1521] RCA-FA-1-HA-1-a: 1
[1521] RCA-FA-2-HA-1-a: 1
[1521] RCA-FA-4-HA-1-a: 1
[1826] RCA-FA-1-hsum: 1
[1826] RCA-FA-2-hsum: 1
[1826] RCA-FA-4-hsum: 1
[2129] RCA-FA-1-carry2: 1
[2331] RCA-FA-2-HA-2-a: 1
[2331] RCA-FA-4-HA-2-a: 1
[2331] RCA-FA-1-HA-2-b: 0
[2633] RCA-carryOut-1: 1
[2633] sum1: 1
[2633] sum3: 1
[2633] sum0: 0
[2634] RCA-carryIn-2: 1
[2936] RCA-FA-2-carry1: 1
[3138] RCA-FA-2-HA-1-b: 0
[3440] RCA-carryOut-2: 1
[3440] RCA-FA-2-hsum: 0
[3440] RCA-carryIn-3: 1
[3946] RCA-FA-2-HA-2-a: 0
[3946] RCA-FA-3-HA-1-a: 1
[4251] sum1: 0
[4252] RCA-FA-3-hsum: 1
[4556] RCA-FA-3-carry2: 1
[4756] RCA-FA-3-HA-2-b: 0
[5059] RCA-carryOut-3: 1
[5059] sum2: 0
[5059] RCA-carryIn-4: 1
[5363] RCA-FA-4-carry1: 1
[5564] RCA-FA-4-HA-1-b: 0
[5867] RCA-carryOut-4: 1
[5867] RCA-FA-4-hsum: 0
[5867] carryOut: 1
[6370] RCA-FA-4-HA-2-a: 0
[6675] sum3: 0
```

</details>

Let me pick out the final output:

```
sum0: 0
sum1: 0
sum2: 0
carryOut: 1
sum3: 0
```

We add `0101` and `1011` in binary, resulting in `10000`, which is correct again. Everything works perfectly. With sleep, we’ve now implemented all major features of Co—a complete concurrent language with first-class coroutines, channels, and time-based scheduling.

Conclusion[#](#conclusion)
----------

With the addition of sleep, we’ve completed our implementation of Co—a small language with coroutines and channels. Over these five posts, we went from parsing source code to building a full interpreter that handles cooperative multitasking using coroutines.

The key insight was realizing that coroutines are just environments plus continuations. By designing our interpreter to use continuation-passing style, we gained the ability to suspend execution at any point and resume it later. Channels built naturally on top of that, providing a way for coroutines to synchronize and pass messages. And sleep extended the scheduler to handle time-based execution, unlocking patterns like timeouts and periodic tasks.

The examples we built along the way—pubsub system, actor system, and digital circuit simulation—show what becomes possible once these primitives are in place. Starting with basic arithmetic and functions, we ended up with a language capable of expressing real concurrent programs.

What comes next? Maybe a compiler for Co? Stay tuned by subscribing to the [feed](https://abhinavsarkar.net/feed.atom?mtm_campaign=feed) or the [email newsletter](#subscription).

The full code for the Co interpreter is available [here](https://abhinavsarkar.net/code/co-interpreter.html?mtm_campaign=feed).

 If you have any questions or comments, please leave a comment below. If you liked this post, please share it. Thanks for reading!

---

1. The sleep implementation in Co is not interruptible. That is, if a coroutine is sleeping, it cannot be resumed before the specified duration. This is different from sleep implementations in most programming languages, where the sleep operation can be interrupted by sending a signal to the sleeping ToC.[↩︎](#fnref1)

2. Threads in GHC are *[Green Threads](https://en.wikipedia.org/wiki/Green_Threads)* and are very cheap to create and run. It is perfectly okay to fork a new one for each delayed coroutine.[↩︎](#fnref2)

3. So in a way, we cheat here by using the sleep primitive provided by the GHC runtime to implement our sleep primitive. If we write a compiler for Co, we’ll have to write our own runtime where we’ll have to implement our sleep function using the functionalities provided by the operating systems.[↩︎](#fnref3)

4. To learn more about how `MVar`s can be used to communicate between threads, read the [chapter 24 of Real World Haskell](https://web.archive.org/web/20260116/https://book.realworldhaskell.org/read/concurrent-and-multicore-programming.html#id673028).[↩︎](#fnref4)

This post is a part of the series: **Implementing Co, a Small Language With Coroutines**.

1. [The Parser](https://abhinavsarkar.net/posts/implementing-co-1/?mtm_campaign=feed)
2. [The Interpreter](https://abhinavsarkar.net/posts/implementing-co-2/?mtm_campaign=feed)
3. [Adding Coroutines](https://abhinavsarkar.net/posts/implementing-co-3/?mtm_campaign=feed)
4. [Adding Channels](https://abhinavsarkar.net/posts/implementing-co-4/?mtm_campaign=feed)
5. **Adding Sleep** 👈

---

Thanks for reading this post via feed. Feeds are great, and you're great for using them. ♥

This post was originally published on [abhinavsarkar.net](https://abhinavsarkar.net/posts/implementing-co-5/?mtm_campaign=feed).

### Like, repost, or comment on: ###

* [Fediverse](https://fantastic.earth/@abnv/115905408192306242)
* [Lobsters](https://lobste.rs/s/taxbgk)
* [Reddit](https://www.reddit.com/r/haskell/comments/1qehkip/)
* [Discourse](https://discourse.haskell.org/t//13549)
* [Hacker News](https://news.ycombinator.com/item?id=46645854)
* [My website](https://abhinavsarkar.net/posts/implementing-co-5/?mtm_campaign=feed#comment-container)

Read more of my [posts](https://abhinavsarkar.net/posts/) and [notes](https://abhinavsarkar.net/notes/).

![](https://anna.abhinavsarkar.net/matomo.php?idsite=1&rec=1)