---
title = "CUDA Hello World: Done Less Wrong"
description = "You’ve probably seen a CUDA tutorial like this one — a classic “Hello World” blending CPU and GPU code in a single “heterogeneous” CUDA C++ source file, with the kernel launched using NVCC’s now-iconic triple-bracket <<<syntax:|`<br/1<br/2<br/3<br/4<br/5<br/6<"
date = "2025-04-05T00:00:00Z"
url = "https://ashvardanian.com/posts/less-wrong-cuda-hello-world/"
author = "Ash's Blog"
text = ""
lastupdated = "2025-10-22T08:59:03.319768622Z"
seen = true
---

You’ve probably seen a CUDA tutorial like this one — a classic “Hello World” blending CPU and GPU code in a single “heterogeneous” CUDA C++ source file, with the kernel launched using NVCC’s now-iconic triple-bracket `<<<>>>` syntax:

|```<br/> 1<br/> 2<br/> 3<br/> 4<br/> 5<br/> 6<br/> 7<br/> 8<br/> 9<br/>10<br/>11<br/><br/>```|```<br/>#include <cuda_runtime.h><br/>#include <stdio.h><br/><br/>__global__ void kernel() {<br/>    printf("Hello World from block %d, thread %d\n", blockIdx.x, threadIdx.x);<br/>}<br/><br/>int main() {<br/>    kernel<<<1, 1>>>(); // Returns `void`?! 🤬    <br/>    return cudaDeviceSynchronize() == cudaSuccess ? 0 : -1;<br/>}<br/><br/>```|
|---------------------------------------------------------------------------------------------|----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|

I still see this exact pattern in production code — and I’ll admit, it shows up in some of my own toy projects too - [one](https://github.com/ashvardanian/ParallelReductionsBenchmark), [two](https://github.com/ashvardanian/cuda-python-starter-kit), and [three](https://github.com/ashvardanian/scaling-democracy). But relying on triple-bracket kernel launches in production isn’t ideal. They don’t return error codes, and they encourage a false sense of simplicity. So in the next \~25 KBytes of text, we’ll explore the *less wrong* ways to launch kernels.