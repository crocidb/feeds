---
title = "Computer upgrade"
description = "After 5 years or so I’ve made a large upgrade to my desktop, and this post contains details and some pictures about the process.It was timeI didn’t really want to do an upgrade right now, but I felt I had to do it. Sometimes the lag had gotten very noticeable, for examp"
date = "2024-07-17T19:35:07Z"
url = "http://jonashietala.se/blog/2023/10/09/computer_upgrade/index.html"
author = "Jonas Hietala"
text = ""
lastupdated = "2025-10-22T08:58:11.320263848Z"
seen = true
---

After 5 years or so I’ve made a large upgrade to my desktop, and this post contains details and some pictures about the process.

It was time
==========

I didn’t really want to do an upgrade right now, but I felt I had to do it. Sometimes the lag had gotten very noticeable, for example when running multiple Neovim instances with several different LSPs in Rust and Elixir.

That was frustrating, but the biggest reason was this ghastly discovery in my liquid cooling loop:

[![](/images/computer_upgrade/disgusting.jpg)](/images/computer_upgrade/disgusting.jpg) [![](/images/computer_upgrade/disgusting2.jpg)](/images/computer_upgrade/disgusting2.jpg)

If you can’t spot it (no shame on you), there’s a huge ball of gunk that’s stuck hanging down beneath the graphics card, and it almost seems like it’s blocking the liquid from passing through properly (more on that later).

I *know* that you’re supposed to check on your loop once a year or so. But things just sort of happened. We moved, I worked and we got three kids. Sometimes it’s just hard to take time for these things, but now I just had to do it or I might not have a computer left to work on.

The new things
==========

* **CPU**: AMD Ryzen 9 7950X
* **RAM**: Kingston 32GB DDR5 5200MHz CL40 FURY
* **Motherboard**: ASRock B650 PG Lightning
* **Fans**: 8x Noctua NF-A14 PWM 140mm
* **SSD**: Kingston KC3000 M.2 2280 NVMe SSD 2TB
* **Water cooling**: New tubing, fitting, a large reservoir and probably something more

Taking apart the computer is a pain, so I decided to do an upgrade as well. I landed on a Ryzen 9 7950X, a beast of a CPU that should leave me with no slowness complaints (well, as few as possible I guess). With that I also had to get a new motherboard and new DDR5 RAM memory.

The fans were some gravy as some of the old fans occasionally stopped spinning and the SSD was just an impulse buy (it was big, fast and cheap).

I redid the water cooling loop a little as well. The position of the reservoir/pump combo wasn’t good and I wanted to try to get a position for better airflow.

Tearing down the loop
==========

Building the liquid cooling loop was all fun and game 5 years ago, but now it was time to pay. I had installed a drain, but it failed to drain most of the liquid. There was something in the tube that blocked it, and the drain was mounted too high so it couldn’t drain the lower radiator properly.

![](/images/computer_upgrade/empty.jpg)

Come on little disgusting thing, I know you want to come out.  
 I failed to drain most of the liquid trough the drain, so things got messy.

Why couldn’t I be satisfied with air cooling?

Rebuilding the loop
==========

Building a computer isn’t hard, but adding in a custom loop makes the build take twice or thrice as long.

But to be completely honest, it’s also a little fun.

![](/images/computer_upgrade/cleaning.jpg)

I used [loop cleaner + superflush](https://www.ekwb.com/shop/ek-cryofuel-loop-cleaner-superflush-concentrate-250ml) to properly clean the system. Because of the previous gunk, I was worried about dirt in the GPU block, the pump and radiators. It’s hard to be sure, but I think I got rid of most of it.

![](/images/computer_upgrade/drain.jpg) I was a good boy and added a fill valve to easily fill the loop. ![](/images/computer_upgrade/red_view.jpg) How the valve connects to the reservoir.

I liked the idea the valve, but the first time I tried to fill up using it the liquid didn’t enter the reservoir properly and things got really messy.

At first I thought that the tube had an U-bend in it, but what ultimately fixed it was me replacing the reservoir top so I could open up an air intake.

It’s… Not perfect
==========

Despite my best efforts of planning the loop, the drain system ended up sucking. While I managed to drain most of the liquid, there were some parts like the lower radiator and the reservoir where the liquid got stuck, and I had to resort to flipping the computer upside down and shake to get rid of it.

Yet again.

![](/images/computer_upgrade/nodrain.jpg) Plenty of liquid left in some weird places.

It’s alive
==========

Building a computer is a little scary because you don’t know if it’s going to work when you’re done. And especially so with this kind of build, where disassembling would be a major endeavor.

But it worked! And it’s glorious!

![](/images/computer_upgrade/back.jpg) Ah, the beautiful cable management. ![](/images/computer_upgrade/side_view.jpg) My 3-year old really enjoys this view. ![](/images/computer_upgrade/top_fans.jpg) The Noctua fans are amazing. ![](/images/computer_upgrade/front_fans.jpg) Yes, I replaced all the fans.