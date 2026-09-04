---
title = "Golang and 1.2 version performance improvement"
description = "I’ve started using Go last month and I really liked to work with the language. The project I’m working on is dead simple and just retrieves metrics and save on a redis server (the data will be analyzed by a different project that I’m working on). So I have 15 goroutines retrievin"
date = "2013-12-03T00:00:00Z"
url = "https://pothix.com/golang12/"
author = ""
text = ""
lastupdated = "2025-10-22T08:59:09.372791879Z"
seen = true
---

I’ve started using Go last month and I really liked to work with the language. The project I’m working on is dead simple and just retrieves metrics and save on a redis server (the data will be analyzed by a different project that I’m working on). So I have 15 goroutines retrieving data constantly and I’m using just two native threads. I did some CPU profiling on the code using my current machine for Golang 1.