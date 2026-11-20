+++
title = "Serverless"
description = "This page lists a few “serverless” resources I find interesting. Even though a good deal of the serverless stuff I did from 2016 onwards runs on [Azure Functions](https://azure.microsoft.com/en-us/services/functions/?utm_campaign=unsolicited_traffic&utm_medium=web&utm_source=taoo"
date = "2018-01-27T21:48:00Z"
url = "https://taoofmac.com/space/cloud/serverless?utm_content=atom"
author = "Rui Carmo"
text = ""
lastupdated = "2026-11-19T14:05:19.596024273Z"
seen = false
+++

This page lists a few “serverless” resources I find interesting. Even though a good deal of the serverless stuff I did from 2016 onwards runs on [Azure Functions](https://azure.microsoft.com/en-us/services/functions/?utm_campaign=unsolicited_traffic&utm_medium=web&utm_source=taoofmac.com), I have a long history with Google App Engine and can find my way around AWS Lambda, so I’m not biased. Of late, I’ve also started keeping track of Lambda-like platforms that run inside [Docker](/space/os/linux/docker) and [Kubernetes](http://kubernetes.io?utm_campaign=unsolicited_traffic&utm_medium=web&utm_source=taoofmac.com) (since I believe those will eventually supersede proprietary approaches), and service mesh proxies targeting micro-service architectures (which are a fundamental requirement for exposing scalable services).

[

Resources
----------

](/space/cloud/serverless#resources)

|                          Category                          |                                 Date                                  |                                                                    Notes                                                                     |
|------------------------------------------------------------|-----------------------------------------------------------------------|----------------------------------------------------------------------------------------------------------------------------------------------|
|                       API Management                       |                                 2018                                  |                                                           A very nice API gateway                                                            |
|                        Applications                        |                                 2026                                  |    self-hostable Cloudflare-native shared support inbox for small teams, built on Workers, Hono, React, D1, R2, Queues, and Email Routing    |
|                     Compute Isolation                      |                                 2020                                  |                                                               Lightweight VMs                                                                |
|                          Ingress                           |                                 2018                                  |                                   A modern reverse proxy that can work as a Kubernetes ingress controller                                    |
|                 Lyft’s front-end L7 proxy                  |                                                                       |                                                                                                                                              |
|                            PaaS                            |                                 2026                                  |Runs Cloudflare Workers and Durable Objects unchanged on AWS, Google Cloud, Azure or self-hosted infrastructure; open source under Apache 2.0.|
|                            2018                            |A Docker-based solution with Kubernetes integration that runs on Azure.|                                                                                                                                              |
|Interesting, but has no decoupling between ingress and admin|                                                                       |                                                                                                                                              |
|                        Service Mesh                        |                                 2018                                  |                                                      A microservice management platform                                                      |
|                          Wrapper                           |                                 2018                                  |                                     A [Python](dev/zappa) centric solution for deploying on AWS Lambda.                                      |