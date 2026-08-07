+++
title = "Notes for July 26-August 2"
description = "Well, this was a productive week… end. The week as a whole was not particularly inspiring or meaningful (I won an award of sorts at work, and to be honest I… just wanted to get to Friday), but I finally teed up and actually did a bunch of things I’ve been meaning to, and it f"
date = "2026-08-02T13:20:00Z"
url = "https://taoofmac.com/space/notes/2026/08/02/1320?utm_content=atom"
author = "Rui Carmo"
text = ""
lastupdated = "2026-08-06T09:52:38.184569288Z"
seen = false
+++

Well, this was a productive week… *end*. The week as a whole was not particularly inspiring or meaningful (I won an award of sorts at work, and to be honest I… just wanted to get to Friday), but I finally teed up and actually *did* a bunch of things I’ve been meaning to, and it feels great.

[

Cutting Over To `sashimi`
----------

](/space/notes/2026/08/02/1320#cutting-over-to-sashimi)

To begin with, after a month of parallel testing, I switched the site to [`sashimi`](/space/notices/2026/08/01/1130#new-site-generator), the Go generator I have been building to replace the old rendering stack, and after a marathon bit of impromptu writing, I [put up a summary of the past 24 years](/space/blog/2026/08/02/1130#twenty-four-years-of-wiki-engines)–and then mused a bit about how much else of what I’ve built will ever last *at least this long*.

And *of course* it [broke things](/space/notices/2026/08/01/1130#new-site-generator), but the worst parts were when I asked `piclaw` to fix things–it made some totally unprompted changes because, for some stupid reason, I was running Opus 5, which completely validates [my tier list](/space/blog/2026/07/11/1500#my-ai-model-tier-list-for-mid-2026)… Regardless, everything seems to be fixed now.

[

Homelab
----------

](/space/notes/2026/08/02/1320#homelab)

Since my [`z83ii`](/space/blog/2017/12/03/2130#farewell-itunes-almost) died recently, I ended up replacing it in my [Proxmox](/space/os/linux/distributions/proxmox#proxmox-ve) cluster with the [Radxa X4](/space/blog/2024/08/03/1200#the-radxa-x4) I reviewed a couple of years ago, even though to be honest I find the tiny fan somewhat infuriating–but at least it doesn’t get too shrill under load, and it’s hidden away in a place that muffles the sound almost completely.

Rather than do the entire installation and configuration by hand, I just… had `piclaw` do it for me. It dutifully (and automatically) went into the cluster, purged the old state, picked up the freshly installed node, replaced the enterprise package sources with the no-subscription repository, exposed the machine’s 142GiB LVM-thin pool as `local-lvm`, and fixed name resolution for the SMB-backed backup filesystem, all without my intervention.

Then it restored the [microVMs](/space/blog/2026/06/18/1845#running-microvms-in-proxmox-ve-the-easy-way) that were running in the previous node and migrated a few more things at my bidding, which should be sobering if you do any sort of operations work…

>
>
> **Update:** Turns out it was just a busted 12V PSU, and I have spares, so [`z83ii`](/space/blog/2017/12/03/2130#farewell-itunes-almost) is back. Which is handy since it’s a great little machine to test performance-sensitive stuff–if it runs well on an Atom, it *flies* on anything else…
>
>

[

More Hardware Homework
----------

](/space/notes/2026/08/02/1320#more-hardware-homework)

I’ve been doing a fair amount of preparation for upcoming reviews, since I have both (relatively) old and new hardware to finish testing and would like to get that done ASAP.

As usual, there’s a bunch of half-drafted reviews that I need to clean up and validate against the current state of the art, and some that still require firmware hackery and even bits of reverse engineering that I’ve yet to find the time for.

[

`piclaw`, Again
----------

](/space/notes/2026/08/02/1320#piclaw-again)

[`piclaw`](https://github.com/rcarmo/piclaw?utm_campaign=unsolicited_traffic&utm_medium=web&utm_source=taoofmac.com) consumed another disproportionate amount of the week, but this time I’m [trying to get ahead of upstream changes](https://github.com/rcarmo/piclaw/releases?utm_campaign=unsolicited_traffic&utm_medium=web&utm_source=taoofmac.com) and isolating dependencies to make switching over to upstream `pi` updates less painful. I’ve also been drafting a rather lengthy post about the entire experience, which will surface soon(ish).

But the annoying bit is that my penchant for very long-running sessions is still causing issues–or, rather, the way APIs and models handle recovery and compaction is. I found a case where model-authored file blocks could derail recovery and leave an agent turn unanswered (and thus hung), and then… another.

I keep telling myself that [`piclaw`](https://github.com/rcarmo/piclaw?utm_campaign=unsolicited_traffic&utm_medium=web&utm_source=taoofmac.com) is mature enough for me to stop touching it, and yet the code keeps finding creative ways to challenge that assessment…

[

Mac JIT Audits
----------

](/space/notes/2026/08/02/1320#mac-jit-audits)

The long structural audit of the AArch64 JIT in [`macemu`](https://github.com/rcarmo/macemu?utm_campaign=unsolicited_traffic&utm_medium=web&utm_source=taoofmac.com) has been plodding on whenever I have the time, and I *think* it’s nearly there, even though [`previous`](https://github.com/rcarmo/previous-jit?utm_campaign=unsolicited_traffic&utm_medium=web&utm_source=taoofmac.com) is still a problem. I had `gpt-5.6-sol` go through the remaining raw execution, checksum, floating-point, branch and memory boundaries, and 68k Mac emulation is almost 10x faster at some things, but I can’t call it done yet.

This is deliberately unglamorous work. Most changes are proofs that a register, cache entry or exit path has the lifecycle the code assumes it has, but those proofs are essential for making sure tests are reproducible, so… most of the work is actually opcode sanity checks now.

[

Real Life Stuff
----------

](/space/notes/2026/08/02/1320#real-life-stuff)

I found [SindriCAD](/space/apps/sindricad) yesterday, an intriguing cross-platform CAD tool that might (just might) restore my faith in local CAD apps. I’m trying to use it to design a few 3D-printed parts and will eventually come to a conclusion about it, especially because I’ve wanted a good, truly cross-platform tool, and believe me, [FreeCAD](/space/apps/freecad) is *not* it.

But I expect that I will spend the rest of my weekend taking another stab at decluttering my office. I started on Friday afternoon and have had very mixed results so far, but a few pieces of kit have already vacated the premises and, with luck, I will eventually have a clean desk again soon–although looking around me as I type this (5 SBCs, one compact camera, two phones, one roll of duct tape and six pen drives, not to mention the screws, tools and cables strewn about) it seems like it will take a while…