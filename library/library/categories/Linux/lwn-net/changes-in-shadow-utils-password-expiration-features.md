+++
title = "[$] Changes in shadow-utils password-expiration features"
description = "The shadow-utils project provides the tools that handle /etc/shadow, /etc/passwd, and other related databases; in general, it manages users and groups on many Linux systems. While most software releases are notable for what i"
date = "2026-08-07T15:54:53Z"
url = "https://lwn.net/Articles/1086949/"
author = "jzb"
text = ""
lastupdated = "2026-08-10T12:13:28.639458354Z"
seen = true
+++

The [shadow-utils](https://github.com/shadow-maint/shadow#shadow-utils) project provides the tools that handle /etc/shadow, /etc/passwd, and other related databases; in general, it manages users and groups on many Linux systems. While most software releases are notable for what is added, the recent [shadow-utils 4.20.0](https://github.com/shadow-maint/shadow/releases/tag/4.20.0) release is most noteworthy for what has been removed. Specifically, several utilities and functionality related to periodic password expiry, which were deprecated in the December 2025 [4.19.0](https://github.com/shadow-maint/shadow/releases/tag/4.19.0) release, have been removed as planned. It is still possible to manage some aspects of password aging with shadow-utils, but organizations that depend on such features should start planning for their complete removal within a few years.