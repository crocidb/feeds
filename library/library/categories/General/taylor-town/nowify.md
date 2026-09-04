+++
title = "nowify"
description = "nowify statsnowify routinesnowifyCheck it out on GitHub.Time-management is hard. So I delegated the hard parts to a co"
date = "2022-10-20T00:00:00Z"
url = "https://taylor.town/nowify"
author = "Taylor Troesh"
text = ""
lastupdated = "2026-04-20T13:20:40.719272535Z"
seen = true
+++

![nowify stats](https://taylor.town/nowify-stats.png)

![nowify routines](https://taylor.town/nowify-routines.jpg)

![nowify](https://taylor.town/nowify.png)

Check it out [on GitHub](https://github.com/surprisetalk/nowify).

Time-management is hard. So I delegated the hard parts to a computer program.

`nowify` runs my life.

Every morning, I up start `nowify` and it guides me through my day: "what am I supposed to be doing *now*?"

`nowify` counts every second. If I forget about `nowify`, it yells at me.

Here's the general logic:

* Prompt the user with the highest priority routine from the queue. Routines usually occur daily or hourly.
  * If "skip" is selected, prompt this routine again in 40 minutes.
  * If "done" is selected on a repeated routine, prompt again in 60 minutes.
  * If "done" is selected on a non-repeated routine, prompt again tomorrow.
  * If the routine takes more than `N` minutes, start beeping.
  * If "not-done" is selected, start the beep timer again in `N` minutes.

Because humans change more often than computer programs, there are meta-routines to update the routines:

* "What parts of life have been neglected? Adjust routine priorities."
* "What routines are frequently being skipped? Ask spouse for advice."

Very simple. Very effective.