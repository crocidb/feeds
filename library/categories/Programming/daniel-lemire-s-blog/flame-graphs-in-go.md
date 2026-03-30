+++
title = "Flame Graphs in Go"
description = '<img width="150" height="150" src="https://lemire.me/blog/wp-content/uploads/2025/10/Capture-decran-le-2025-10-26-a-16.14.04-150x150.png" class="webfeedsFeaturedVisual wp-post-image" alt="" style="display: block; margin-bottom: 5px; clear:both;max-width: 100%;" link_thumbnail="" '
date = "2025-10-26T20:13:34Z"
url = "https://lemire.me/blog/2025/10/26/flame-graphs-in-go/"
author = "Daniel Lemire"
text = ""
lastupdated = "2026-03-19T16:26:22.841571897Z"
seen = true
+++

<img width="150" height="150" src="https://lemire.me/blog/wp-content/uploads/2025/10/Capture-decran-le-2025-10-26-a-16.14.04-150x150.png" class="webfeedsFeaturedVisual wp-post-image" alt="" style="display: block; margin-bottom: 5px; clear:both;max-width: 100%;" link_thumbnail="" decoding="async" loading="lazy">

The hardest problem in software performance is often to understand your code and why it might be slow. One approach to this problem is called profiling. Profiling tries to count the time spent in the various functions of your program.

It can be difficult to understand the result of profiling. Furthermore, it is more complicated than it seems. For example, how do you count the time spent in a function A that calls another function B. Does the time spent in function B count for the time spent in function A? Suppose function A executes code for 2 seconds, then calls function B which takes 3 seconds to run, and finally A continues with 1 additional second. The total time for A would be 6 seconds if everything were included, but that does not accurately reflect where the time is truly spent. We might prefer the exclusive or flat time: the time spent only in the body of the function itself, without counting calls to other functions. In our example, for A, that would be 2 + 1 = 3 seconds (the time before and after the call to B). For B, it would be 3 seconds. The cumulative time is the total time spent in the function and all the functions it calls, recursively. For A, that would include the 3 own seconds plus the 3 seconds of B, totaling 6 seconds. For B, it would just be its 3 seconds, unless it calls other functions.

Go has builtin support for profiling. It requires two steps.

1. Use `runtime/pprof` to collect profiles.
2. Use `go tool pprof` to review the data.

Let us consider a concrete example. We have a benchmark function parsing repeatedly strings as floating-point numbers.

```
func BenchmarkParseFloat(b *testing.B) {
    for i := 0; i < b.N; i++ {
        idx := i % len(floatStrings)
        _, _ = strconv.ParseFloat(floatStrings[idx], 64)
    }
}

```

In effect, we want to profile the `strconv.ParseFloat` function to see where it is spending its time. We run:

```
go test -bench=. -cpuprofile=cpu.prof    

```

Notice the `-cpuprofile=cpu.prof` flag which instructs go to dump its profiling data to the file `cpu.prof`. Go profiles the code using a sampling-based approach, where it periodically interrupts the execution to capture stack traces of running goroutines. It has low overhead—only a small fraction of execution time is spent on sampling—and it works across multiple goroutines and threads.

If you are trying to profile a long-running application, like a server, you can use the net/http/pprof package to request profiling data dynamically using network requests. However, it requires modifying your application accordingly.

We can call `go tool pprof` on the `cpu.prof` to examine its result. The simplest flag is `-text`, it prints out a summary in the console.

```
go tool pprof -text cpu.prof

```

You might see the following output.

```
Time: 2025-10-26 14:35:03 EDT
Duration: 1.31s, Total samples = 990ms (75.45%)
Showing nodes accounting for 990ms, 100% of 990ms total
      flat  flat%   sum%        cum   cum%
     830ms 83.84% 83.84%      830ms 83.84%  strconv.readFloat
      20ms  2.02% 92.93%      900ms 90.91%  strconv.atof64
      20ms  2.02% 94.95%       20ms  2.02%  strconv.eiselLemire64
      20ms  2.02% 96.97%       20ms  2.02%  strconv.special
      10ms  1.01% 98.99%      910ms 91.92%  strconv.ParseFloat
      10ms  1.01%   100%       10ms  1.01%  strconv.atof64exact

```

It can be difficult to interpret this result. Thus we want to visualize the result. My favorite technique is the flame graph. It is a useful technique invented by Brendan Gregg.

A flamegraph is a stacked bar chart where each bar represents a function call, and the width of the bar indicates the estimated time spent in that function. The time can be replaced by other metrics such as CPU instructions, memory allocations or any other metrics that can be matched to a software function. The y-axis represents the call stack depth, with the top being the root of the stack. Colors can be used to make it more elegant.

The name flame graph comes from the shape that often resembles flames, with wider bases indicating more time-consuming functions and narrower tops showing less frequent paths. There are many variations such as flame charts where the x-axis represents time progression, and y-axis shows call stack at each moment. But flame graphs are more common.

Given that you have generated the file `cpu.prof`, you can visualize it by first starting a web server:

```
go tool pprof -http=:8123 cpu.prof

```

It assumes that port 8123 is free on your system: you can change the port 8123 if needed. Open your browser at the URL `http://localhost:8123/ui/flamegraph`.

You should see a graph:

[<img loading="lazy" decoding="async" class="alignnone size-large wp-image-22282" src="http://lemire.me/blog/wp-content/uploads/2025/10/flamegraph-1024x198.png" alt="" width="660" height="128" srcset="https://lemire.me/blog/wp-content/uploads/2025/10/flamegraph-1024x198.png 1024w, https://lemire.me/blog/wp-content/uploads/2025/10/flamegraph-300x58.png 300w, https://lemire.me/blog/wp-content/uploads/2025/10/flamegraph-768x149.png 768w, https://lemire.me/blog/wp-content/uploads/2025/10/flamegraph-1536x298.png 1536w, https://lemire.me/blog/wp-content/uploads/2025/10/flamegraph.png 1744w" sizes="auto, (max-width: 660px) 100vw, 660px">](http://lemire.me/blog/wp-content/uploads/2025/10/flamegraph.png)

Our first step is to narrow our focus on the function we care about. For more clarity, double click on `strconv.ParseFloat`, or right click on it and select focus. The bulk of the time (over 80%) of the `ParseFloat` is spent in the `readFloat` function. This function converts the string into a mantissa and an exponent. There are other functions being called such as `strconv.special`, `strconv.atof64exact`, and `strconv.eiselLemire64`. However, they account for little time in this specific benchmark.

Thus, if we wanted to improve the performance of `strconv.ParseFloat` function, we might want to focus on optimizing the `readFloat` function. Furthermore, at least given our specific test, optimizing the `strconv.special`, `strconv.atof64exact`, and `strconv.eiselLemire64` functions is unlikely to be productive.

In our specific example, the profiling gives us a clear answer. However, it is not always so. Profiling can be misleading. For one thing, profiling is typically statistical. If your program is short-lived or has uneven load, it might provide incorrect data. Furthermore, inefficient work spread out over many functions could not show up in a flame graph. Thus you should always interpret profiling results with care.