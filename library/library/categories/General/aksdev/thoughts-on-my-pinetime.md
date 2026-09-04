+++
title = "Thoughts on my PineTime"
description = '''So I got myself a PineTime watch about 8 days ago, and so far I've enjoyed using it!It's a rather simple smartwatch, but that's why I like it. No complicate BS, just the basic stuff and that's it. And it was only \~30€! (Plus 10€ shipping :P )['''
date = "2021-12-18T00:00:00Z"
url = "https://akselmo.dev/posts/thoughts-on-my-pinetime/"
author = "Akseli"
text = ""
lastupdated = "2026-05-27T23:22:57.132605712Z"
seen = true
+++

So I got myself a [PineTime](https://www.pine64.org/pinetime/) watch about 8 days ago, and so far I've enjoyed using it!

It's a rather simple smartwatch, but that's why I like it. No complicate BS, just the basic stuff and that's it. And it was only \~30€! (Plus 10€ shipping :P )

[Initial setup](#initial-setup)
==========

The device arrived in around 10 days from ordering it, which is relatively quick considering the world situation + chrimbus time.

[![Unpackaging](/assets/images/pinetime/package.jpg)](/assets/images/pinetime/package.jpg)

I appreciate how little stuff there was. Just the bare necessities, no unnecessary flair.

I however would appreciate a bit more illustrated manual perhaps, showing where to find things. Personally I had no problem with following the guide, but someone else might.

The manual basically said "go there, download this app or some alternative, connect your device to the watch, install updates." I was fine with that, but someone else might be a bit confused. Even a number ordered list would do some good.

I luckily didn't have to install any firmware updates, since it was already up-to-date, in version 1.0.0. I however had to update the InfiniTime "OS" that runs the show.

The size of the watch is pretty much what I expected. It's a watch, not a bulky rock like modern smartwatches are.

[![Size comparison](/assets/images/pinetime/all.jpg)](/assets/images/pinetime/all.jpg)

I booted up the watch and installed [Gadgetbridge](https://gadgetbridge.org/) on my Android phone. At first, I was trying to connect the watch through Gadgetbridge, but unfortunately that didn't work just like that.

What you need to do, is to first use the Bluetooth settings in your phone to pair the device, then separately pair the device from Gadgetbridge. I did this, but first time it didn't work.. Gadgetbridge got stuck loading something. But rebooting both the watch and my phone, and then trying to connect again through Gadgetbridge, it worked.

It was a bit more of a hassle than I expected, but honestly I could see same thing happen with any modern smartwatch.

After that I updated the device. It was pretty simple, I had to just download the newest [InfiniTime](https://github.com/InfiniTimeOrg/InfiniTime/releases) release on my phone (the `dfu` one), then open the zip with Gadgetbridge and it did the rest, very painlessly.

[Daily drive](#daily-drive)
==========

I've been daily driving the watch since it arrived and I've been really happy with it!

It shows me the notifications whenever I get them, I can control music from it (yes, even spotify!), it counts my steps, and best of all, it shows time.

[![PineTime display](/assets/images/pinetime/active.jpg)](/assets/images/pinetime/active.jpg)

I think it also looks very stylish. There's three different watch faces, two that are the default digital watch, one analogue watch face, and the one in the picture which is called PineTimeStyle. I like it the most since you can change the color of it as well. The tiny circle on the bottom right shows my steps goal, and other statuses are showin with nice tiny icons.

I could set the watch to turn the screen on when I raise my wrist, but sometimes it doesn't realise I'm doing so, I have to flick my wrist a bit and then the display turns on. I raise my hands slowly, I am lazy.

The notifications pop up and make the watch vibrate a bit whenever one arrives, so it's easy to check them quickly. The vibration is not too aggressive either in my opinion, so it doesn't bother me if I choose to ignore the watch.

There's also a lot of tiny apps in the watch, like the music changing mode. But there is also couple games, like pong and 2048 (which I find quite addictive lol), heart rate meter, BPM meter that makes the watch vibrate along the set BPM, then bunch of different timers and stopwatches.

What I would love to see is a month view. Just showing me the current month and it's days. Maybe eventually show the events too, but that's quite complicated thing to make on small device like this so I'm not surprised it's not there yet.

About the heart rate meter, please don't rely it. Currently it's more a curiosity and it's not very accurate at all. It just gives you the sense of your heartrate but nothing anyone should rely on.

The battery ran out after 7-8 days of daily driving the watch, which I think is pretty good, considering most smartwatches last only day or two.

I only really used the notifications feature, as it's cold in here and I rather use my bluetooth headphones to change the music. I did play some 2048 with it though and it worked really well. And speaking of cold, the battery time might be affected a little bit because of the below zero temperature. I assume that in summer it'll work longer.

There's also no tracking bullshit that Google/Samsung etc watches have. I don't need those features, I just wanted a watch that shows me notifications, and it does that pretty much perfectly. The notifications are lacking umlauts like Ä or Ö, so messages in Finnish look like they're typed in drunk. There's also no emoji support, which is both good and bad. :P

Bluetooth has only cut out for me once, but I feel like it was my phone acting out instead of the watch.

[Would I recommend one?](#would-i-recommend-one)
==========

If you just want to quickly check on notifications on your watch and maybe play a bit of pong every now and then, and quickly change skip music tracks on your watch, it's perfect! If you're also somewhat privacy conscious like me, the no-tracking is nice (although I have my phone as a tracking device already so.. Eh). On top of that, since everything is open source, from Firmware to OS, you can modify it if you have the skills. I tried to modify the watch a bit, but I had trouble already setting up my developer environment for the watch..

*Btw big props for the devs of this watch and InfiniTime. You have added a lot of content in such a small package and it's impressive!*

For anyone who wants somekind of healthy fit super duper chad watch, PineTime's not gonna work. For that, you need somekind of sporty watch, just remember those arent open source and when they break, they break and create e-waste. And of course they report your every hand movement to Big Tech lol.

I feel like this is more a nerd watch, than sportyboi watch. And it's been excellent for me. And it's only 30€, so for such a low price it's been pretty great quality!

In summary: **It does it's job, doesn't lie about it's capabilities and that's all I wanted.**

*Maybe one day I will try to delve deeper in this InfiniTime OS running on it, and maybe change fonts or something.*