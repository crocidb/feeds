---
title = "2x Faster Hashes on AWS Graviton: NEON → SVE2"
description = "AWS is the world’s largest cloud provider. It’s hard to comprehend how many billions of times per second their instances compute string hashes and SHA-256 file checksums! After releasing StringZilla v4, I spun up instances of the las"
date = "2025-10-06T00:00:00Z"
url = "https://ashvardanian.com/posts/aws-graviton-checksums-on-neon-vs-sve/"
author = "Ash's Blog"
text = ""
lastupdated = "2025-10-22T08:59:03.307843021Z"
seen = true
---



AWS is the world’s largest cloud provider. It’s hard to comprehend how many billions of times per second their instances compute string hashes and SHA-256 file checksums! After releasing [StringZilla v4](https://github.com/ashvardanian/StringZilla), I spun up instances of the last 3 Graviton generations, exploring optimization opportunities across NEON, SVE, and SVE2 extensions.

|                     |Graviton 2 | Graviton 3  |   Graviton 4    |
|---------------------|-----------|-------------|-----------------|
|       Context       |           |             |                 |
|  Availability year  |   2020    |    2022     |      2024       |
|    Process node     |7 nm, TSMC | 5 nm, TSMC  |    3nm, TSMC    |
|    Architecture     |Neoverse N1| Neoverse V1 |   Neoverse V2   |
|      Max cores      |    64     |     64      |       96        |
| AWS instance family |   \*6g    |    \*7g     |      \*8g       |
|                     |           |             |                 |
|      Specifics      |           |             |                 |
|  Vector extensions  |   NEON    |  NEON, SVE  | NEON, SVE, SVE2 |
|Encryption extensions| NEON+AES  |NEON+AES 🤦‍♂️|NEON+AES, SVE+AES|
|  SVE vector length  |   128b    |    256b     |    128b 🤦‍♂️    |

>
>
> Yes, SVE on Gravitons is tricky. More on that later.
>
>