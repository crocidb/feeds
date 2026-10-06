+++
title = '"slab_tiny" Boot Option Proposed For Tiny Linux Systems With Very Limited RAM'
description = 'In 2022 the SLOB allocator was deprecated and removed with Linux 6.4 a year later. SLOB was popular with embedded systems with minimal amounts of RAM, so as a result the CONFIG\_SLUB\_TINY Kconfig option was then added for configuring the slab allocator for a minimal memory footp'
date = "2026-09-24T10:10:30Z"
url = "https://www.phoronix.com/news/Linux-Slab-Tiny-Boot-Option"
author = "Michael Larabel"
text = ""
lastupdated = "2026-09-27T09:50:57.601450524Z"
seen = true
+++

In 2022 the SLOB allocator was deprecated and removed with Linux 6.4 a year later. SLOB was popular with embedded systems with minimal amounts of RAM, so as a result the CONFIG\_SLUB\_TINY Kconfig option was then added for configuring the slab allocator for a minimal memory footprint for systems with 16MB of RAM or less. The CONFIG\_SLUB\_TINY is now on the chopping block with a proposed rework to the allocator code for making the "tiny" memory handling a boot time option...