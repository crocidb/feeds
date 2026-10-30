+++
title = "Linux 7.4 To Close Files Synchronously For close_range, exec & exit"
description = 'Of the many VFS changes to be merged for Linux 7.4 is now closing files synchrously for close\_range, exec, and exit calls. In turn when needing to close many file descriptors this provides for much lower latency than the status quo...'
date = "2026-10-21T11:55:42Z"
url = "https://www.phoronix.com/news/Linux-7.4-Sync-Close-Files"
author = "Michael Larabel"
text = ""
lastupdated = "2026-10-22T13:34:56.168570791Z"
seen = false
+++

Of the many VFS changes to be merged for Linux 7.4 is now closing files synchrously for close\_range, exec, and exit calls. In turn when needing to close many file descriptors this provides for much lower latency than the status quo...