+++
title = "Scaling-Up Contrastive Learning over NVLink Multicast"
description = "Contrastive losses built on PyTorch, JAX, or even NCCL and NVSHMEM directly leave much of the hardware on the table. Want 5x larger batches at 2x lower latency, with collectives designed for CUDA-graph replay? Get ready to write some PTX!"
date = "2026-10-21T00:00:00Z"
url = "https://ashvardanian.com/posts/scaling-up-contrastive-learning-over-nvlink/"
author = "Ash's Blog"
text = ""
lastupdated = "2026-10-27T22:33:13.053122938Z"
seen = false
+++

Contrastive losses built on PyTorch, JAX, or even NCCL and NVSHMEM directly leave much of the hardware on the table. Want 5x larger batches at 2x lower latency, with collectives designed for CUDA-graph replay? Get ready to write some PTX!