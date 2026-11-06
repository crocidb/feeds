+++
title = "[$] System-call wrappers for glibc"
description = "In a followup to his session at the 2025 Linux Plumbers Conference (LPC), Carlos O'Donell returned to the topic of system-call wrappers for the GNU C library (glibc) at this year"
date = "2026-10-30T15:07:29Z"
url = "https://lwn.net/Articles/1101647/"
author = "jake"
text = ""
lastupdated = "2026-11-02T23:27:02.326237699Z"
seen = false
+++

In a followup to his [session at the 2025 Linux Plumbers Conference](https://lpc.events/event/19/contributions/2220/) (LPC), Carlos O'Donell returned to the topic of [system-call wrappers for the GNU C library](https://lpc.events/event/20/contributions/2397/) (glibc) at this year's event. This time around, he was joined by Florian Weimer, who is another glibc maintainer. The idea was to give an update on what has happened over the last year with regard to Linux system calls that lack a glibc wrapper, thus are only accessible via [syscall()](https://man7.org/linux/man-pages/man2/syscall.2.html). In addition, they wanted to hear from attendees about their needs in this area.