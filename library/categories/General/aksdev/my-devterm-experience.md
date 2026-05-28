+++
title = "My Devterm experience"
description = "So I got a Devterm...Back in June I ordered a Devterm. It finally arrived this month.I enthusiastically retrieved the package and started assembling. The assembly part was pretty easy, since there's really no tools needed except for couple v"
date = "2022-01-16T00:00:00Z"
url = "https://akselmo.dev/posts/my-devterm-experience/"
author = "Akseli"
text = ""
lastupdated = "2026-05-27T23:22:57.130856958Z"
seen = true
+++

So I got a Devterm...

Back in June I ordered a [Devterm](https://www.clockworkpi.com/devterm). It finally arrived this month.

I enthusiastically retrieved the package and started assembling. The assembly part was pretty easy, since there's really no tools needed except for couple very tiny screws. Luckily I have an iFixit kit for that kind of stuff. If there was a screwdriver in the box, I entirely missed it.

During the first boot, I received... Nothing! The screen was blank. I searched the forums for information about it and someone mentioned maybe the backlight doesn't work.

Well I was bummed so I checked if it was just backlight or something else. I placed a flashlight on top of the screen and sure enough, there was text, it was the backlight that was broken.

I was torn. I had waited this 300€ device for 6 months. I disassembled the device and noticed on closer inspection that yep, the screen backlight ribbon cable was torn a lil bit, so that one of the two connections was broken.

I was just as torn as that ribbon cable at that point. I tend to get really excited about stuff like this, so it was a really big let down. Naturally I asked for a refund.. I don't like doing that, at all. I feel so guilty when asking for refund, but did it anyway. My money situation has been bit weak lately and getting even partial refund would help me a ton. Luckily the ClockworkPi folks were understanding and gave me part of my money back. I was going to wait for better days and if they have replacement screens on sale, I could get one by then.

[But maybe I could fix it myself?](#but-maybe-i-could-fix-it-myself)
----------

I have NEVER fixed anything like this myself. Never, ever. I got a soldering iron as a chrimbus present like couple years ago and I have only used it once, to de-solder a part from friends old Amiga, but that's it.

Anyway, since I was like "well, if I fuck it up, at least it's already broken" I disassembled the whole screen. I noticed the ribbon cable backlight connectors and tested them out with multimeter, and sure enough, only the negative side of the circuit was broken. I checked the Devterm forums and found someone with similar issue, and they had fixed it like this: [Link](https://forum.clockworkpi.com/t/how-to-fix-devterm-a0604-screen-not-turning-on/7476/11)

So I salvaged a wire from some super old ATI Radeon fan (Yes, ATI) and soldered it to the ribbon cable connector, then jammed it near the third LED from top. And quite magically, it began to work. (There was a bit more than that in this troubleshooting process, such as using multimeter to test the wire etc etc but that's the gist of it really.)

I then used electric tape to keep the other end of the wire near the LED, since it is soooooooo tiny that I couldnt figure out how to solder it there. It's not optimal solution, I know, but it works.. For now. Until that tape gives in I guess lol.

I then carefully began to assemble the screen back and had to cut some of the screen case parts so I can slide the wire underneath. And then.. I cut my thumb to the damn screen metal part. Ow.

*I've been told electronics require blood sacrifices sometimes.*

After all of that, I assembled the whole thing and voila, we have light.

[![Devterm with backlight on](/assets/images/devterm/let_there_be_light.jpg)](/assets/images/devterm/let_there_be_light.jpg)

I just wish I could have soldered the wire properly like in the image in that forum link, but I have no tools/skills for that. I assumed I have no skills with fixing electronics in the first place..

But I am glad I was wrong. I'm super proud of this fix, even it was very tiny one.

I am kind of glad that the screen arrived broken, I learned a lot from this and it was somewhat fun even, despite slicing my thumb.

I probably will buy a replacement screen in future however, just so I can have it working 100% sure and properly. But this will work for now as I play around with this thing.

**The moral of this story: Always give something a try! You never know, you'll probably surprise yourself.**