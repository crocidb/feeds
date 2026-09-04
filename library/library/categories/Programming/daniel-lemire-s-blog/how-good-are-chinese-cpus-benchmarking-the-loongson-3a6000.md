+++
title = "How good are Chinese CPUs? Benchmarking the Loongson 3A6000"
description = '<img width="150" height="150" src="https://lemire.me/blog/wp-content/uploads/2025/11/Capture-decran-le-2025-11-23-a-18.06.52-150x150.png" class="webfeedsFeaturedVisual wp-post-image" alt="" style="display: block; margin-bottom: 5px; clear:both;max-width: 100%;" link_thumbnail="" '
date = "2025-11-23T23:09:59Z"
url = "https://lemire.me/blog/2025/11/23/how-good-are-chinese-cpus-benchmarking-the-loongson-3a6000/"
author = "Daniel Lemire"
text = ""
lastupdated = "2026-03-19T16:26:22.834755627Z"
seen = true
+++

<img width="150" height="150" src="https://lemire.me/blog/wp-content/uploads/2025/11/Capture-decran-le-2025-11-23-a-18.06.52-150x150.png" class="webfeedsFeaturedVisual wp-post-image" alt="" style="display: block; margin-bottom: 5px; clear:both;max-width: 100%;" link_thumbnail="" decoding="async" loading="lazy">

I maintain a few widely used libraries that have optimized code paths based on the specific processor being used. We started supporting Loongson processors in recent years, but I did not have access to a Loongson processor until now. To my knowledge, they are not widely distributed in North America. This made it difficult for me to do any performance tuning. Thankfully, kind people from the Loongson Hobbyists’ Community helped me acquire a small computer with a Loongson processors.

My understanding is that Loongson processors serve to reduce the dependence of China on architectures like x64 and ARM. They use their own proprietary architecture called LoongArch. These processors have two generations of SIMD (single instruction, multiple data) vector extensions designed for parallel processing : LSX and LASX. LSX (Loongson SIMD Extension) provides 128-bit wide vector registers and instructions roughly comparable to ARM NEON or early x64 SSE extensions. LASX (Loongson Advanced SIMD Extension), first appearing in the Loongson 3A5000 (2021), is the 256-bit successor that is somewhat comparable with x64 AVX/AVX2 present in most x64 (Intel and AMD) processors.

The LoongArch architecture is not yet universally supported. You can run most of Linux (Debian), but Visual Studio Code cannot ssh into a LoongArch system although there is community support in VSCodium. However, recent versions of the GCC and LLVM compilers support LoongArch.

My Loongson-3A6000 processor supports both LASX and LSX. However, I do not know how to do runtime dispatching under LoongArch: check whether LASX is supported as the program is running and switching on LASX support dynamically. I can force the compiler to use LASX (by compiling with `-march=native`) but my early experiments show that LASX routines are no faster than LSX routines… possibly a sign of poor optimization on our part.

I decided to run some tests to see how this Chinese processor compares with a relatively recent Intel processor (Ice Lake). The comparison is not meant to be fair. The Ice Lake processor is somewhat older but it is an expensive server-class processor. Further, the code that I am using is likely to have been tuned for x64 processors much more than for Loongson processors. I am also not trying to be exhaustive: I just want a broad idea.

Let us first consider number parsing. My test is reproducible.

```
git clone https://github.com/lemire/simple_fastfloat_benchmark.git
cd simple_fastfloat_benchmark
cmake -B build
cmake --build build
./build/benchmarks/benchmark # use sudo for perf counters

```

This will parse random numbers. I focus on the fast\_float results. I use GCC 15 in both instances.

|   processor   |instructions/float|ins/cycle|GHz |
|---------------|------------------|---------|----|
|Loongson-3A6000|        377       |  4.92   |2.50|
|Xeon Gold 6338 |       295        |  5.07   |3.19|

So the Loongson-3A6000 retires about as many instructions per cycle as the Intel processor. However, it requires more instructions and its clock frequency is lower. So the Intel processor wins this round.

What if we replace the fast\_float function by abseil’s number parse (from Google). I get that both processors are entirely comparable, except for the clock frequency.

|   processor   |instructions/float|ins/cycle|GHz |
|---------------|------------------|---------|----|
|Loongson-3A6000|       562        |  4.42   |2.50|
|Xeon Gold 6338 |       571        |  5.08   |3.19|

Intel still wins due to the higher frequency, but by a narrower margin.

I wanted to test the Loongson processor on SIMD intensive tasks. So I used the simdutf library to do some string transcoding.

```
git clone https://github.com/simdutf/simdutf/git
cd simdutf
cmake -B build -D SIMDUTF_BENCHMARKS=ON
cmake --build build --target benchmark
./build/benchmarks/benchmark -P utf8_to_utf16le -F README.md
# use sudo for perf counters

```

My results are as follows, depending on which instructions are used. The Intel processor has three options (128-bit with SSSE3, 256-bit with AVX2 and 512-bit with AVX-512) while the Loongson processor has two options (128-bit with LSX and 256-bit with LASX).

|       processor        |ins/byte|ins/cycle| GHz |
|------------------------|--------|---------|-----|
| Loongson-3A6000 (LSX)  |  0.562 |  2.633  |2.50 |
| Loongson-3A6000 (LASX) |  0.390 |  1.549  |2.50 |
| Xeon Gold 6338 (SSSE3) | 0.617  |  5.07   |3.236|
| Xeon Gold 6338 (AVX2)  | 0.364  |  2.625  |3.19 |
|Xeon Gold 6338 (AVX-512)| 0.271  |  1.657  |3.127|

Roughly speaking, the Loongson transcodes a simple ASCII file (the README.md file) at 10 GB/s whereas the Intel processor does it slightly faster than 20 GB/s.

Overall, I find these results quite good for the Loongson processor.

[The folks at Chips and Cheese have a more extensive review](https://chipsandcheese.com/p/loongson-3a6000-a-star-among-chinese-cpus). They put the Chinese processor somewhere between the first AMD Zen processors and the AMD Zen 2 processors on a per core basis. The AMD Zen 2 processors power current gaming consoles such as the PlayStation 5. Chips and Cheese concluded “Engineers at Loongson have a lot to be proud of”: I agree.