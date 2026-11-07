+++
title = "[$] User namespaces + file capabilities = trouble"
description = "User namespaces are a key part of the kernel's toolkit for assembling containers; processes within a user namespace can appear to have full root access to the system while gaining no extra privileges in the wider system. At least, that is the i"
date = "2026-11-05T14:33:59Z"
url = "https://lwn.net/Articles/1103429/"
author = "corbet"
text = ""
lastupdated = "2026-11-05T22:34:08.879816372Z"
seen = false
+++

[User namespaces](https://lwn.net/Articles/532593/) are a key part of the kernel's toolkit for assembling containers; processes within a user namespace can appear to have full root access to the system while gaining no extra privileges in the wider system. At least, that is the intent. In practice, keeping privilege contained within a user namespace has often turned out to be difficult. As an example, consider [this small patch series](https://lwn.net/ml/all/20261027-b4-setfcap-userns-v8-0-2674adc63f3c@toxicpanda.com) from Josef Bacik, which is intended to address some situations where a process within a user namespace can elevate the privileges of processes outside of it.