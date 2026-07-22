+++
title = "Implementing Co, a Small Language With Coroutines #4: Adding Channels"
description = "In the previous post, we added coroutines to Co, the small language we are implementing in this series of posts. In this post, we add channels to it to be able to communicate between coroutines."
date = "2023-06-03T00:00:00Z"
url = "https://abhinavsarkar.net/posts/implementing-co-4/"
author = "Abhinav Sarkar"
text = ""
lastupdated = "2026-07-21T09:17:41.528155705Z"
seen = false
+++

In the [previous post](https://abhinavsarkar.net/posts/implementing-co-3/?mtm_campaign=feed), we added coroutines to Co, the small language we are implementing in this series of posts. In this post, we add channels to it to be able to communicate between coroutines.

This post was originally published on [abhinavsarkar.net](https://abhinavsarkar.net/posts/implementing-co-4/?mtm_campaign=feed).

This post is a part of the series: **Implementing Co, a Small Language With Coroutines**.

1. [The Parser](https://abhinavsarkar.net/posts/implementing-co-1/?mtm_campaign=feed)
2. [The Interpreter](https://abhinavsarkar.net/posts/implementing-co-2/?mtm_campaign=feed)
3. [Adding Coroutines](https://abhinavsarkar.net/posts/implementing-co-3/?mtm_campaign=feed)
4. **Adding Channels** 👈
5. [Adding Sleep](https://abhinavsarkar.net/posts/implementing-co-5/?mtm_campaign=feed)

### Contents ###

1. [Introduction](#introduction)
2. [Channel Design](#channel-design)
3. [Channel Operations](#channel-operations)
4. [Adding Channels](#adding-channels)
5. [Wiring Channels](#wiring-channels)
6. [Sending and Receiving](#sending-and-receiving)
7. [Pubsub using Channels](#pubsub-using-channels)
8. [Bonus Round: Emulating Actors](#bonus-round-emulating-actors)

Introduction[#](#introduction)
----------

With coroutines, we can now have multiple *Threads of Computation* (ToCs) in a Co program. However, right now these ToCs work completely independent of each other. Often in such concurrent systems, we need to communicate between these ToCs, for example, one coroutine may produce some data that other coroutines may need to consume. Or, one coroutine may need to wait for some other coroutine to complete some task before it can proceed. For that, we need [Synchonization](https://en.wikipedia.org/wiki/Synchronization_(computer_science)#Thread_or_process_synchronization) between coroutines.

There are various ways to synchronize ToCs: [Locks](https://en.wikipedia.org/wiki/Lock_(computer_science)), [Semaphores](https://en.wikipedia.org/wiki/Semaphore_(programming)), [Promises](https://en.wikipedia.org/wiki/Futures_and_promises), [Actors](https://en.wikipedia.org/wiki/Actor_model), [Channels](https://en.wikipedia.org/wiki/Channel_(programming)), [Software Transactional Memory](https://en.wikipedia.org/wiki/Software_transactional_memory), etc. In particular, channels are generally used with coroutines for synchronization in many languages like [Go](https://gobyexample.com/channels), [Kotlin](https://kotlinlang.org/docs/coroutines-and-channels.html), [Python](https://docs.python.org/3/library/asyncio-queue.html) etc, and we are going to do the same.

[*Channels*](https://en.wikipedia.org/wiki/Channel_(programming)) are a synchronization primitive based on [Communicating Sequential Processes](https://en.wikipedia.org/wiki/Communicating_Sequential_Processes)<sup><a href="#ref-Hoare1986-ih" class="citation" title="Hoare, “Communicating Sequential Processes.”">@1</a></sup> (CSP). CSP is a formal language for describing patterns of interaction between concurrent processes. In CSP, processes communicate with each other by sending and receiving messages over channels.

A process can send a message to a channel only if the channel is not full, and blocks otherwise. Similarly, a process can receive a message from a channel only if the channel is not empty, blocking otherwise. Thus, channels provide a way for processes to synchronize with each other, and at the same time, communicate by passing messages.

Before we implement channels, we have to decide how they are going to work.

Channel Design[#](#channel-design)
----------

There are various design decisions that we need to make while implementing channels. Depending on what we choose, we end up with different kinds. Some of the major design decisions are:

*Buffered* vs *Unbuffered*

A buffered channel has a buffer to store messages. A send operation on a buffered channel succeeds if the buffer is not full, even if there are no pending receive operations. On the other hand, a send operation on an unbuffered channel blocks until the message is received by some other process. For example, in Java [`LinkedBlockingQueue`](https://docs.oracle.com/en/java/javase/20/docs/api/java.base/java/util/concurrent/LinkedBlockingQueue.html) is a buffered channel, while [`SynchronousQueue`](https://docs.oracle.com/en/java/javase/20/docs/api/java.base/java/util/concurrent/SynchronousQueue.html) is an unbuffered channel[<sup>1</sup>](#fn1).

*Bounded* vs *Unbounded*

A bounded channel has a buffer of fixed capacity, and can hold only a fixed number of messages at maximum. A send operation on a bounded channel blocks if the buffer is full and there are no pending receive operations. An unbounded channel has a buffer with no fixed capacity, and can hold any number of messages. A send operation on an unbounded channel never blocks. For example, in Java [`ArrayBlockingQueue`](https://docs.oracle.com/en/java/javase/20/docs/api/java.base/java/util/concurrent/ArrayBlockingQueue.html) is a bounded channel, while [`LinkedBlockingQueue`](https://docs.oracle.com/en/java/javase/20/docs/api/java.base/java/util/concurrent/LinkedBlockingQueue.html) is an unbounded one.

*Synchronous* vs *Asynchronous*

A synchronous channel blocks on send until the message is received by some other process, even if the channel has an unbounded buffer. An asynchronous channel does not block on send if the channel’s buffer has space. For example, in Java [`LinkedTransferQueue`](https://docs.oracle.com/en/java/javase/20/docs/api/java.base/java/util/concurrent/LinkedTransferQueue.html) is a synchronous channel, while [`ArrayBlockingQueue`](https://docs.oracle.com/en/java/javase/20/docs/api/java.base/java/util/concurrent/ArrayBlockingQueue.html) is an asynchronous channel.

*Blocking* vs *Non-blocking*

A blocking channel blocks on send if the channel’s buffer is full, or on receive if it is empty. A non-blocking channel never blocks on send or receive, and instead returns a sentinel value (usually the [Null](https://en.wikipedia.org/wiki/Null_pointer) value), or throws an error to indicate that the operation could not be executed. For example, in Java [`BlockingQueue.put`](https://docs.oracle.com/en/java/javase/20/docs/api/java.base/java/util/concurrent/BlockingQueue.html#put(E)) is a blocking send operation, while [`BlockingQueue.offer`](https://docs.oracle.com/en/java/javase/20/docs/api/java.base/java/util/concurrent/BlockingQueue.html#offer(E)) is a non-blocking send operation.

*Fair* vs *Unfair*

A fair channel ensures that the order of sends and receives is preserved. That means, if there are multiple pending sends and receives, they are executed in the order they were requested. An unfair channel does not guarantee any order. For example, in Java, `ArrayBlockingQueue` supports [fair and unfair modes](https://docs.oracle.com/en/java/javase/20/docs/api/java.base/java/util/concurrent/ArrayBlockingQueue.html#<init>(int,boolean)) by passing a boolean flag to its constructor.

*Locking* vs *Lock-free*

A locking channel uses locks to synchronize access to the channel. A lock-free channel uses atomic operations for the same. For example, in Java [`LinkedBlockingQueue`](https://docs.oracle.com/en/java/javase/20/docs/api/java.base/java/util/concurrent/LinkedBlockingQueue.html) is a locking channel, while [`ConcurrentLinkedQueue`](https://docs.oracle.com/en/java/javase/20/docs/api/java.base/java/util/concurrent/ConcurrentLinkedQueue.html) is a lock-free channel.

*Selectable* vs *Non-selectable*

A selectable channel can be used in a [*Select*](https://en.wikipedia.org/wiki/Select_(Unix)) like operation to wait for a message on multiple channels at once. A non-selectable channel cannot be used in such an operation. For example, channels in [Go](https://gobyexample.com/channels) and [Clojure core.async](https://github.com/clojure/core.async) are selectable, while aforementioned channels in Java are not.

In our implementation for Co, we have both buffered and unbuffered channels. The buffered channels are bounded, with a fixed capacity. The channels are asynchronous, blocking, fair, lock-free, and non-selectable.

Enough of theory, let’s see how channels work in Co.

Channel Operations[#](#channel-operations)
----------

In this section, we explore the various scenarios for send and receive operations on a channel in Co using diagrams. These diagrams are for buffered channels. For unbuffered channels, the send operation acts as for a fully buffered channel, and the receive operation acts as for an empty buffered channel.

Each channel has three internal queues: a send queue, a receive queue, and a buffer[<sup>2</sup>](#fn2). The send and receive queues are used to store pending send and receive operations (as coroutines) respectively. The buffer is used to store data of the messages. The send and receive queues are always bounded, because otherwise any number of send and receive operations can be blocked on a channel, thus defeating the point of bounded buffer. In extreme cases, it can cause the program to run out of memory.

The invariants we must maintain for the channel operations are:

1. There can never be pending send operations while there are pending receive operations, and vice versa. This is because a send operation will complete immediately if there are pending receive operations, and vice versa.
2. There can never be pending receive operations while there are messages in the buffer. This is because a receive operation will complete immediately by dequeuing the oldest message in the buffer.
3. There can never be pending send operations while there is room in the buffer. This is because a send operation will complete immediately by enqueuing the message in the buffer.

With these invariants in mind, let’s look at the different scenarios in detail:

* When a program tries to receive from a channel, and the channel has nothing in its buffer and there are no pending sends, the program blocks. The programs’s continuation is captured as a coroutine, and is enqueued to the receive queue. Note that the coroutine is not queued into the interpreter’s global coroutine queue.

![Receive when no pending sends and buffer empty](data:image/svg+xml,%3Csvg%20xmlns='http://www.w3.org/2000/svg'%20viewBox='0%200%20873%20321'%3E%3C/svg%3E) \<img src="/images/implementing-co-4/receive1.svg" class="w-100pct nolink extra-width" alt="Receive when no pending sends and buffer empty"\>\</img\> Receive when no pending sends and buffer empty

* The corresponding scenario for a send operation is when the channel has pending receives. In this case, the send operation completes immediately, and the first coroutine in the receive queue is dequeued and resumed with the message.

![Send when pending receives](data:image/svg+xml,%3Csvg%20xmlns='http://www.w3.org/2000/svg'%20viewBox='0%200%20857%20321'%3E%3C/svg%3E) \<img src="/images/implementing-co-4/send1.svg" class="w-100pct nolink extra-width" alt="Send when pending receives"\>\</img\> Send when pending receives

* When there are no pending receives and the buffer is not full, the message is enqueued to the buffer, and the send operation completes immediately.

![Send when no pending receives and buffer not full](data:image/svg+xml,%3Csvg%20xmlns='http://www.w3.org/2000/svg'%20viewBox='0%200%20841%20321'%3E%3C/svg%3E) \<img src="/images/implementing-co-4/send2.svg" class="w-100pct nolink extra-width" alt="Send when no pending receives and buffer not full"\>\</img\> Send when no pending receives and buffer not full

* In the corresponding scenario for a receive operation, when there are no pending sends, and there are messages in the buffer, the oldest message is dequeued, and the receive operation completes immediately with it.

![Receive when no pending sends and buffer not empty](data:image/svg+xml,%3Csvg%20xmlns='http://www.w3.org/2000/svg'%20viewBox='0%200%20873%20321'%3E%3C/svg%3E) \<img src="/images/implementing-co-4/receive2.svg" class="w-100pct nolink extra-width" alt="Receive when no pending sends and buffer not empty"\>\</img\> Receive when no pending sends and buffer not empty

* When the buffer is full, the program trying to do a send operation is blocked and its continuation is captured as a coroutine and queued into the send queue. Note that the coroutine is not queued into the interpreter’s global coroutine queue.

![Send when buffer full](data:image/svg+xml,%3Csvg%20xmlns='http://www.w3.org/2000/svg'%20viewBox='0%200%20841%20321'%3E%3C/svg%3E) \<img src="/images/implementing-co-4/send3.svg" class="w-100pct nolink extra-width" alt="Send when buffer full"\>\</img\> Send when buffer full

* In the corresponding scenario for a receive operation, when the buffer is full, the oldest message is dequeued from the buffer, and the receive operation completes immediately with it. If there are pending sends, the oldest coroutine in the send queue is dequeued and resumed, and its message is enqueued to the buffer.

![Receive when pending sends and buffer full](data:image/svg+xml,%3Csvg%20xmlns='http://www.w3.org/2000/svg'%20viewBox='0%200%201025%20321'%3E%3C/svg%3E) \<img src="/images/implementing-co-4/receive3.svg" class="w-100pct nolink extra-width" alt="Receive when pending sends and buffer full"\>\</img\> Receive when pending sends and buffer full

* When the send queue is full and the buffer is full as well, an error is thrown when trying to do a send operation.

![Send when send queue and buffer full](data:image/svg+xml,%3Csvg%20xmlns='http://www.w3.org/2000/svg'%20viewBox='0%200%20849%20321'%3E%3C/svg%3E) \<img src="/images/implementing-co-4/send4.svg" class="w-100pct nolink extra-width" alt="Send when send queue and buffer full"\>\</img\> Send when send queue and buffer full

* Similarly, when the receive queue is full and the buffer is empty, an error is thrown when a receive operation is attempted.

![Receive when receive queue full and buffer empty](data:image/svg+xml,%3Csvg%20xmlns='http://www.w3.org/2000/svg'%20viewBox='0%200%20865%20321'%3E%3C/svg%3E) \<img src="/images/implementing-co-4/receive4.svg" class="w-100pct nolink extra-width" alt="Receive when receive queue full and buffer empty"\>\</img\> Receive when receive queue full and buffer empty

That captures all scenarios for send and receive operations on a channel. In the next section, we implement channels in Co.

Adding Channels[#](#adding-channels)
----------

Let’s start with defining the `Channel` type:

```
data Channel = Channel
  { channelCapacity :: Int,
    channelBuffer :: Queue Value,
    channelSendQueue :: Queue (Coroutine (), Value),
    channelReceiveQueue :: Queue (Coroutine Value)
  }

newChannel :: Int -> Interpreter Channel
newChannel size = Channel size <$> newQueue <*> newQueue <*> newQueue
```

A channel has a buffer, a send queue, and a receive queue. The buffer is a queue of Co values, the receive queue is a queue of coroutines, and the send queue is a queue of coroutine and value pairs. A channel also has a capacity, which is the capacity of the buffer[<sup>3</sup>](#fn3).

Now, we add `Channel` to the `Value` type:

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

Finally, we introduce some new built-in functions to create channels:

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

The `newChannel` function creates an unbuffered channel, and the `newBufferedChannel` function creates a buffered channel with the given capacity:

```
executeNewBufferedChannel :: [Expr] -> Interpreter Value
executeNewBufferedChannel argEs = evaluate (head argEs) >>= \case
  Num capacity | capacity >= 0 -> Chan <$> newChannel (fromIntegral capacity)
  _ -> throw "newBufferedChannel call expected a positive number argument"
```

Wiring Channels[#](#wiring-channels)
----------

Moving on to wiring the channels into the existing interpreter implementation. First we add a new constructor for send statements to the `Stmt` type:

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

And another for receive expressions to the `Expr` type:

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

We have already written the code to parse these statements and expressions in the [first post](https://abhinavsarkar.net/posts/implementing-co-1/?mtm_campaign=feed), so that’s taken care of. We need to modify the `execute` and `evaluate` functions to handle these new statements and expressions. Let’s start with `execute`:

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

To execute a `SendStmt`, we evaluate its arguments to get the channel and the value to send. Then we call the `channelSend` function to send the value over the channel.

Similarly, to evaluate a `Receive` expression, we evaluate its argument to get the channel, and then call the `channelReceive` function to receive a value from the channel:

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

Now comes the core of the implementation: the `channelSend` and `channelReceive` functions. Let’s look into them in detail.

Sending and Receiving[#](#sending-and-receiving)
----------

The `channelSend` function takes a value and a channel, and sends the value over the channel, blocking if necessary.

```
channelSend :: Value -> Channel -> Interpreter ()
channelSend value Channel {..} = do
  bufferSize <- queueSize channelBuffer
  sendQueueSize <- queueSize channelSendQueue

  dequeue channelReceiveQueue >>= \case
    -- there are pending receives
    Just coroutine@Coroutine {..} ->
      scheduleCoroutine $ coroutine { corCont = const $ corCont value }

    -- there are no pending receives and the buffer is not full
    Nothing | channelCapacity > 0 && bufferSize < channelCapacity ->
      enqueue value channelBuffer

    -- there are no pending receives and
    -- (the buffer is full or the channel is unbuffered)
    Nothing | sendQueueSize < maxSendQueueSize -> do
      env <- State.gets isEnv
      callCC $ \cont -> do
        coroutine <- newCoroutine env cont
        enqueue (coroutine, value) channelSendQueue
        runNextCoroutine

    -- the send queue is full
    Nothing -> throw "Channel send queue is full"
  where
    maxSendQueueSize = 4
```

This is a direct implementation of the algorithm we discussed earlier using diagrams. We try to dequeue a coroutine from the receive queue. Then:

* If there is a coroutine, we schedule it to be run with the sent value. The send call **does not block**.
* If there is no coroutine, and
  * the channel is buffered and the buffer is not full, we enqueue the sent value to the buffer. The send call **does not block**.
  * the buffer is full, we create a new coroutine with the current continuation, and enqueue the coroutine and the value to the send queue. The send call **blocks**.

* If the send queue is full, we throw an error.

Next, let’s write the `channelReceive` function:

```
channelReceive :: Channel -> Interpreter Value
channelReceive Channel {..} = do
  mSend <- dequeue channelSendQueue
  mBufferedValue <- dequeue channelBuffer
  recieveQueueSize <- queueSize channelReceiveQueue

  case (mSend, mBufferedValue) of
    -- the channel is unbuffered and there are pending sends
    (Just (sendCoroutine, sendValue), Nothing) -> do
      scheduleCoroutine sendCoroutine
      return sendValue

    -- the buffer is full and there are pending sends
    (Just (sendCoroutine, sendValue), Just bufferedValue) -> do
      scheduleCoroutine sendCoroutine
      enqueue sendValue channelBuffer
      return bufferedValue

    -- the buffer is empty and there are no pending sends
    (Nothing, Nothing) | recieveQueueSize < maxReceiveQueueSize -> do
      env <- State.gets isEnv
      callCC $ \receive -> do
        coroutine <- newCoroutine env receive
        enqueue coroutine channelReceiveQueue
        runNextCoroutine
        return Null

    -- the receive queue is full
    (Nothing, Nothing) -> throw "Channel receive queue is full"

    -- the buffer is not empty and there are no pending sends
    (Nothing, Just bufferedValue) -> return bufferedValue
  where
    maxReceiveQueueSize = 4
```

This is also a straightforward implementation of the algorithm. We try to dequeue a coroutine and its value from the send queue, and another value from the buffer. Then:

* If there is a coroutine,
  * but no buffered value, we schedule the coroutine to be resumed, and return its value. The returned value becomes the value that is received from the channel. The receive call **does not block**.
  * and a buffered value, we schedule the coroutine to be resumed, enqueue its value to the buffer, and return the buffered value. The receive call **does not block**.

* If there is no coroutine and no buffered value, and the receive queue is not full, we create a new coroutine with the current continuation, and enqueue it to the receive queue. The receive call **blocks**.
* If the receive queue is full, we throw an error.

We hardcode the capacity of the send and receive queues to 4.

That’s it for the implementation of channels. Since we broke down the scenarios for send and receive operations, the implementation is not complicated. Let’s see it in action next.

Pubsub using Channels[#](#pubsub-using-channels)
----------

In this demo, we implement a pubsub system using channels. The pubsub system consists of a server and a set of workers. The server sends messages to the workers over a channel. The workers print the messages and send acks back to the server over another channel. After sending all the messages, the server waits for all the acks from the workers, and then stops the workers.

Diagrammatically, the pubsub system looks like this:

![Pubsub using channels](data:image/svg+xml,%3Csvg%20xmlns='http://www.w3.org/2000/svg'%20viewBox='0%200%20713%20305'%3E%3C/svg%3E) \<img src="/images/implementing-co-4/pubsub.svg" class="w-100pct nolink" alt="Pubsub using channels"\>\</img\> Pubsub using channels

The boxes with double borders are ToCs, and the ones with single borders are channels. The arrows show how the ToCs and channels are connected.

<details> <summary class="print-hide"> Pubsub code </summary>

```
// server sends messages to workers.
function startServer(messageCount, messageChan) {
  print("server starting");
  var i = 1;
  while (i < messageCount + 1) {
    print("server sending: " + i);
    i -> messageChan;
    print("server sent: " + i);
    i = i + 1;
  }
}

// workers receive messages over a channel, print them.
// and send a ack back to the sender on a channel.
function worker(name, messageChan, ackChan) {
  print("worker " + name + " starting");
  var message = null;
  while (true) {
    message = <- messageChan;
    print("worker " + name + " received: " + message);
    if (message == null) {
      print("worker " + name + " stopped");
      return;
    }
    print("worker " + name + " sending: " + message);
    message -> ackChan;
    print("worker " + name + " sent: " + message);
  }
}

// start workers.
function startWorkers(workerCount, messageChan, ackChan) {
  print("workers starting");
  var i = 1;
  while (i < workerCount + 1) {
    function(name) {
      spawn worker(name, messageChan, ackChan);
    }(i);
    i = i + 1;
  }
  print("workers scheduled to be started");
}

// server waits for acks from workers.
function waitForWorkers(messageCount, ackChan, doneChan) {
  print("server waiting for acks");
  var i = 1;
  var message = null;
  while (i < messageCount + 1) {
    message = <- ackChan;
    print("server received: " + message);
    i = i + 1;
  }
  print("server received all acks");
  null -> doneChan;
}

// stop workers.
function stopWorkers(workerCount, messageChan, doneChan) {
  var done = <- doneChan;
  print("workers stopping");
  var i = 1;
  while (i < workerCount + 1) {
    null -> messageChan;
    i = i + 1;
  }
  print("workers scheduled to be stopped");
}

var workerCount = 3;
var messageCount = 7;
var messageBufferSize = 5;
var ackBufferSize = 1;
var messageChan = newBufferedChannel(messageBufferSize);
var ackChan = newBufferedChannel(ackBufferSize);
var doneChan = newChannel();

startWorkers(workerCount, messageChan, ackChan);
spawn waitForWorkers(messageCount, ackChan, doneChan);
startServer(messageCount, messageChan);
stopWorkers(workerCount, messageChan, doneChan);
```

</details>

Running the program produces this output:

<details> <summary class="print-hide"> Pubsub output </summary>

```
workers starting
workers scheduled to be started
server starting
server sending: 1
server sent: 1
server sending: 2
server sent: 2
server sending: 3
server sent: 3
server sending: 4
server sent: 4
server sending: 5
server sent: 5
server sending: 6
worker 1 starting
worker 1 received: 1
worker 1 sending: 1
worker 1 sent: 1
worker 1 received: 2
worker 1 sending: 2
worker 2 starting
worker 2 received: 3
worker 2 sending: 3
worker 3 starting
worker 3 received: 4
worker 3 sending: 4
server waiting for acks
server received: 1
server received: 2
server received: 3
server received: 4
server sent: 6
server sending: 7
server sent: 7
worker 1 sent: 2
worker 1 received: 5
worker 1 sending: 5
worker 1 sent: 5
worker 1 received: 6
worker 1 sending: 6
worker 1 sent: 6
worker 1 received: 7
worker 1 sending: 7
worker 2 sent: 3
worker 3 sent: 4
server received: 5
server received: 6
server received: 7
server received all acks
worker 1 sent: 7
workers stopping
workers scheduled to be stopped
worker 2 received: null
worker 2 stopped
worker 3 received: null
worker 3 stopped
worker 1 received: null
worker 1 stopped
```

</details>

The output shows how the server and worker coroutines yield control to each other when they are waiting for messages or acks[<sup>4</sup>](#fn4).

Bonus Round: Emulating Actors[#](#bonus-round-emulating-actors)
----------

The *[Actor model](https://en.wikipedia.org/wiki/Actor_model)* is a concurrent programming paradigm where computation is carried out by lightweight processes called *Actors* that can only communicate with each other by sending messages. This makes them ideal for building concurrent and distributed systems.

In this section, we emulate actors in Co using channels:

```
function start(process) {
  var inbox = newChannel();
  spawn (function () {
    var val = null;
    while (true) {
      val = <- inbox;
      if (val == null) { return; }
      process(val);
    }
  })();
  return function (message) { message -> inbox; };
}

function send(actor, message) { actor(message); }
function stop(actor) { actor(null); }
```

Actors are implemented as wrappers around channels. By sending messages to an actor’s channel, we can send messages to the actor. However, we cannot expose the channels directly, so we wrap them in functions.

The `start` function creates and starts an actor by creating a new channel, and spawning a coroutine that receives messages from the channel in a loop and passes them to the `process` function taken as a parameter by the `start` function. Upon receiving a `null` value, the coroutine returns, which stops the actor.

The `start` function returns a function to send messages to the actor, which works by sending the messages to the actor’s channel.

The `send` function is a convenience function to send a message to an actor. The `stop` function stop an actor by sending it a `null` message.

It was easy, wasn’t it? Now let’s use actors in some different ways.

Let’s start with a simple example of an actor that prints the received messages:

```
var printer = start(print);
spawn send(printer, "world");
send(printer, "hello");
stop(printer);
```

The `process` parameter here is the [`print`](https://abhinavsarkar.net/posts/implementing-co-2/?mtm_campaign=feed#print-func) function. Running this program produces the following output:

```
hello
world
```

Next, let’s write an actor that counts. For that, first we need to create a *[2-Tuple](https://en.wikipedia.org/wiki/2-Tuple)* data structure using closures, named `Pair`[<sup>5</sup>](#fn5):

```
function Pair(first, second) {
  return function (command) {
    if (command == "first") { return first; }
    if (command == "second") { return second; }
    return null;
  };
}

function first(pair) { return pair("first"); }
function second(pair) { return pair("second"); }
```

Now we implement the counter actor:

```
function makeCounter() {
  var value = 0;
  return start(function (message) {
    var command = first(message);
    var arg = second(message);

    if (command == "inc") { value = value + arg; }
    if (command == "get") { send(arg, value); }
  });
}
```

The `makeCounter` function creates a counter actor. The counter actor is started with a processing function that takes a message as a `Pair`, extracts the command and the argument from the message, and increments the counter value or sends the counter value back depending on the command. We exercise the counter like this:

```
var printer = start(print);
var counter1 = makeCounter();

send(counter1, Pair("inc", 1));
send(counter1, Pair("get", printer));

send(counter1, Pair("inc", 2));
send(counter1, Pair("get", printer));
stop(counter1);

var counter2 = makeCounter();
send(counter2, Pair("inc", 5));
send(counter2, Pair("get", printer));
stop(counter2);
stop(printer);
```

The output of the program is:

```
1
3
5
```

And for the grand finale, let’s reimplement the [ping-pong](https://abhinavsarkar.net/posts/implementing-co-1/?mtm_campaign=feed#cb5-1) program using actors:

```
function makePingPonger(name) {
  var self = null;
  function pingPong(message) {
    var value = first(message);
    var other = second(message);

    if (value == "done") {
      print(name + " done");
      spawn (function () { stop(self); } ());
      return;
    }

    print(name + " " + value);
    if (value == 0) {
      print(name + " done");
      send(other, Pair("done", self));
      spawn (function () { stop(self); } ());
      return;
    }

    send(other, Pair(value - 1, self));
  }
  self = start(pingPong);
  return self;
}
```

The `makePingPonger` function creates a ping-ponger actor. The ping-ponger actor is started with a processing function that takes a message as a `Pair` of the value to print and the other actor to send the next message to. The processing function prints the value, decrements it, and sends it to the other actor. If the value is 0, it sends a `done` message to the other actor and stops itself. If the value is `done`, it stops itself.

Upon running it like this:

```
var pinger = makePingPonger("ping");
var ponger = makePingPonger("pong");
send(pinger, Pair(10, ponger));
```

It produces the same output as the original ping-pong program:

```
ping 10
pong 9
ping 8
pong 7
ping 6
pong 5
ping 4
pong 3
ping 2
pong 1
ping 0
ping done
pong done
```

---

In this post, we added channels to Co, and used them to create a variety of concurrent programs. We learned about CSP and how implement it using coroutines and channels. In the [next post](https://abhinavsarkar.net/posts/implementing-co-5/?mtm_campaign=feed), we will add support for *[sleep](https://en.wikipedia.org/wiki/Sleep_(system_call))* to Co.

The code for complete Co interpreter is available [here](https://abhinavsarkar.net/code/co-interpreter.html?mtm_campaign=feed).

Acknowledgements[#](#acknowledgements)
----------

Many thanks to [Steven Deobald](https://deobald.ca/) for reviewing a draft of this article.

 If you have any questions or comments, please leave a comment below. If you liked this post, please share it. Thanks for reading!

 Hoare, C A R. “Communicating Sequential Processes.” *Communications of the ACM* 21, no. 8 (1978): 666–77. [https://doi.org/10.1145/359576.359585](https://doi.org/10.1145/359576.359585).

---

1. Recently, Java added support for [*Virtual Threads*](https://openjdk.org/jeps/444), which though are not cooperatively scheduled like coroutines, are scheduled by the JVM, and are very lightweight. With virtual threads, the various Java queues can be considered channels as defined in CSP.[↩︎](#fnref1)

2. The design of channels in Co is inspired by the design of channels in [Clojure core.async](http://cdn.cognitect.com/presentations/2014/insidechannels.pdf). It is a simplified version, not supporting some of the features of core.async, such as [transducers](https://clojuredocs.org/clojure.core.async/transduce), and [alts](https://clojuredocs.org/clojure.core.async/alt!).[↩︎](#fnref2)

3. Recall that the [`Queue`](https://abhinavsarkar.net/posts/implementing-co-3/?mtm_campaign=feed#queue-ds) type is an immutable queue data structure wrapped in an `IORef`, which we manipulate using atomic operations [`atomicModifyIORef'`](https://hackage.haskell.org/package/base/docs/Data-IORef.html#v:atomicModifyIORef-39-).[↩︎](#fnref3)

4. You can try running the program with different values for the `workerCount`, `messageCount`, `messageBufferSize` and `ackBufferSize` variables to see how it behaves. You can also try changing the order of the function calls at the end of the program, or prefixing them with `spawn` to see how it affects the output. In some cases, the program may deadlock and hang, and in some other cases, it may throw an error. Try to understand why.[↩︎](#fnref4)

5. We used the same trick to create a [binary tree](https://abhinavsarkar.net/posts/implementing-co-3/?mtm_campaign=feed#bonus-round-breadth-first-traversal-without-a-queue) data structure in the previous post.[↩︎](#fnref5)

This post is a part of the series: **Implementing Co, a Small Language With Coroutines**.

1. [The Parser](https://abhinavsarkar.net/posts/implementing-co-1/?mtm_campaign=feed)
2. [The Interpreter](https://abhinavsarkar.net/posts/implementing-co-2/?mtm_campaign=feed)
3. [Adding Coroutines](https://abhinavsarkar.net/posts/implementing-co-3/?mtm_campaign=feed)
4. **Adding Channels** 👈
5. [Adding Sleep](https://abhinavsarkar.net/posts/implementing-co-5/?mtm_campaign=feed)

---

Thanks for reading this post via feed. Feeds are great, and you're great for using them. ♥

This post was originally published on [abhinavsarkar.net](https://abhinavsarkar.net/posts/implementing-co-4/?mtm_campaign=feed).

### Like, repost, or comment on: ###

* [Fediverse](https://fantastic.earth/@abnv/110481168853488318)
* [Lobsters](https://lobste.rs/s/vwu83k)
* [Reddit](https://www.reddit.com/r/haskell/comments/13zhiat/)
* [Discourse](https://discourse.haskell.org/t//6365)
* [My website](https://abhinavsarkar.net/posts/implementing-co-4/?mtm_campaign=feed#comment-container)

Read more of my [posts](https://abhinavsarkar.net/posts/) and [notes](https://abhinavsarkar.net/notes/).

![](https://anna.abhinavsarkar.net/matomo.php?idsite=1&rec=1)