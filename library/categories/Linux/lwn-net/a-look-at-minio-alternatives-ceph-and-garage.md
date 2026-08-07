+++
title = "[$] A look at MinIO alternatives: Ceph and Garage"
description = "MinIO is a popular object-storage server that offered compatibility with the Amazon Simple Storage Service (S3) API. In December 2025, the company behind the project (also named Mi"
date = "2026-06-25T17:40:13Z"
url = "https://lwn.net/Articles/1077739/"
author = "jzb"
text = ""
lastupdated = "2026-06-29T12:19:28.852922387Z"
seen = true
+++

[MinIO](https://github.com/minio/minio#minio-quickstart-guide) is a popular object-storage server that offered compatibility with the Amazon [Simple Storage Service](https://en.wikipedia.org/wiki/Amazon_S3) (S3) API. In December 2025, the company behind the project (also named MinIO) [announced](https://github.com/minio/minio/commit/27742d469462e1561c776f88ca7a1f26816d69e2) that the project was in maintenance mode and would not accept new changes; it was [archived completely](https://github.com/minio/minio/commit/7aac2a2c5b7c882e68c1ce017d8256be2feea27f) in February 2026. MinIO users have been hunting for alternatives since then, but the array of choices can be baffling. While many other projects aim to fill the space, their strengths and areas of focus tend to vary. Two of the alternatives—[Ceph](https://ceph.io/en/) and [Garage](https://garagehq.deuxfleurs.fr/)—are particularly compelling, and both offer solid S3 compatibility.