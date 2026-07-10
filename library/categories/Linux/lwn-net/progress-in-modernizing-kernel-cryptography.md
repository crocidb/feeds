+++
title = "[$] Progress in modernizing kernel cryptography"
description = "At the 2026 Linux Security Summit North America, Eric Biggers spoke about some of the problems with the kernel's cryptography framework, as well as the recent progress in adding library APIs to allow devel"
date = "2026-07-08T13:14:23Z"
url = "https://lwn.net/Articles/1077427/"
author = "jzb"
text = ""
lastupdated = "2026-07-09T12:05:22.729181174Z"
seen = false
+++

At the 2026 [Linux Security Summit North America](https://events.linuxfoundation.org/linux-security-summit-north-america/), Eric Biggers spoke about some of the problems with the kernel's cryptography framework, as well as the recent progress in adding library APIs to allow developers to use cryptographic functions without using the traditional crypto API. He walked through a couple of examples to demonstrate the frailty of the original API and showed how the new library API made life easier for developers and kernel maintainers.