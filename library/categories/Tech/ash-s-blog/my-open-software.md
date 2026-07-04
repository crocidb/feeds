+++
title = "My Open Software"
description = "All of my software is hosted on GitHub, mostly under the Apache-2.0 permissive license. Free for commercial and non-commercial use, modification, and distribution.Major Projects *[USearch](https://github.com/unum-cloud/USe"
date = "0001-01-01T00:00:00Z"
url = "https://ashvardanian.com/software/"
author = "Ash's Blog"
text = ""
lastupdated = "2025-12-10T15:23:53.098772025Z"
seen = false
+++

All of my software is hosted on GitHub, mostly under the [Apache-2.0](https://opensource.org/licenses/Apache-2.0) permissive license. Free for commercial and non-commercial use, modification, and distribution.

Major Projects
----------

* **[USearch](https://github.com/unum-cloud/USearch)** - a universal search engine powering many databases, AI labs, and experiments in Natural Sciences. Compact C++ core with 10+ language bindings — 10–100× faster than Meta FAISS for vector search and far beyond Apache Lucene.
* **[StringZilla](https://github.com/ashvardanian/StringZilla)** - SIMD, SWAR, and CUDA-accelerated string algorithms for search, matching, hashing, and sorting at Web Scale and Bioinformatics scale. Hundreds of hand-tuned kernels with manual multi-versioning, exposed to C, C++, Rust, Python, Swift, and JavaScript, up to 10× faster on CPUs and 100× faster on GPUs.
* **[SimSIMD](https://github.com/ashvardanian/SimSIMD)** - an extensive collection of mixed-precision vector math kernels for C, Python, Rust, and JavaScript. Designed for linear algebra, scientific computing, statistics, information retrieval, and image processing, delivering consistent SIMD speedups over BLAS and NumPy on both x86 and ARM architectures.
* **[UCall](https://github.com/unum-cloud/UCall)** - a kernel-bypass web server backend for C and Python built on io\_uring. Achieves 70× higher throughput and 50× lower latency than FastAPI for real-time workloads, including serving compact AI models.
* **[UForm](https://github.com/unum-cloud/UForm)** - tiny multimodal AI models with state-of-the-art parameter and data efficiency. Compatible with Python, JS, and Swift, serving as a lightweight alternative to OpenAI CLIP for on-device and server inference.
* **[ForkUnion](https://github.com/ashvardanian/ForkUnion)** - ultra-low-latency parallelism library for Rust and C++. Avoids allocations, mutexes, and even Compare-And-Swap atomics — achieving up to 10× speedups over Rayon and TaskFlow.

Some of those are used in open-source databases, like [ClickHouse](https://github.com/ClickHouse/ClickHouse), [DuckDB](https://github.com/duckdb/duckdb), [TiDB](https://github.com/pingcap/tidb), [ScyllaDB](https://github.com/scylladb/scylladb), [yugabyteDB](https://github.com/yugabyte/yugabyte-db), [DragonflyDB](https://github.com/dragonflydb/dragonfly), [MemGraph](https://github.com/memgraph), [Vald](https://github.com/vdaas/vald), [Turso](https://github.com/tursodatabase/turso), LLM toolchains, like [LangChain](https://github.com/langchain-ai/langchain), [LlamaIndex](https://github.com/run-llama/semtools), [Microsoft SemanticKernel](https://github.com/microsoft/semantic-kernel), [Nomic AI GPT4All](https://github.com/nomic-ai/gpt4all), [Surf](https://github.com/deta/surf), and many other less “open” systems, such as backend infrastructure of major AI labs, government intelligence agencies, Hyper-scale cloud companies, Fortune 500, iOS and Android apps with 100M-1B MAU.