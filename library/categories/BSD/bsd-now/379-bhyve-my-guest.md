+++
title = "379: bhyve my guest"
description = "Adventures in Freebernetes, tracing kernel functions, The better way of building FreeBSD networks, New beginnings: CDBUG virtual meetings, LibreSSL update in DragonFly, Signal-cli with scli on FreeBSD, and more.NOTES   This episode of BSDNow is brought to you by [Tarsnap](h"
date = "2020-12-03T11:45:00Z"
url = "https://www.bsdnow.tv/379"
author = "feedback@bsdnow.tv (JT Pennington)"
text = ""
lastupdated = "2026-03-26T14:37:50.495374266Z"
seen = false
+++

Adventures in Freebernetes, tracing kernel functions, The better way of building FreeBSD networks, New beginnings: CDBUG virtual meetings, LibreSSL update in DragonFly, Signal-cli with scli on FreeBSD, and more.

***NOTES***  
 This episode of BSDNow is brought to you by [Tarsnap](https://www.tarsnap.com/bsdnow)

Headlines
----------

### [Adventures in Freebernetes: bhyve My Guest](https://productionwithscissors.run/2020/10/29/adventures-in-freebernetes-bhyve-my-guest/) ###

>
>
> Part 2 of experiments in FreeBSD and Kubernetes: Creating your first guest
>
>
> ---
>

### [Tracing Kernel Functions: FBT stack() and arg](https://zinascii.com/2020/fbt-args-and-stack.html?s=03) ###

>
>
> In my previous post I described how FBT intercepts function calls and vectors them into the DTrace framework. That laid the foundation for what I want to discuss in this post: the implementation of the stack() action and built-in arg variables. These features rely on the precise layout of the stack, the details of which I touched on previously. In this post I hope to illuminate those details a bit more with the help of some visuals, and then guide you through the implementation of these two DTrace features as they relate to the FBT provider.
>
>
> ---
>

News Roundup
----------

### [Dummynet: The Better Way of Building FreeBSD Networks](https://klarasystems.com/articles/dummynet-the-better-way-of-building-freebsd-networks/) ###

>
>
> Dummynet is the FreeBSD traffic shaper, packet scheduler, and network emulator. Dummynet allows you to emulate a whole set of network environments in a straight-forward way. It has the ability to model delay, packet loss, and can act as a traffic shaper and policer. Dummynet is roughly equivalent to netem in Linux, but we have found that dummynet is easier to integrate and provides much more consistent results.
>
>
> ---
>

### [New beginnings: CDBUG virtual meetings](http://lists.nycbug.org/pipermail/cdbug-talk/2020-October/000901.html) ###

>
>
> I had overwhelmingly positive responses from the broader \*BSD community about restarting CDBUG meetings as virtual, at least for now. Hopefully this works well and even when we're back to in-person meetings we can still find a way to bring in virtual attendees.
>
>
> ---
>

### [LibreSSL update in DragonFly](https://www.dragonflydigest.com/2020/11/10/25143.html) ###

>
>
> DragonFly has a new version of libressl, noting cause it has a newer TLS1.3 implementation – something that may be necessary for you.
>
>
> ---
>

### [Signal-cli with scli on FreeBSD](https://antranigv.am/weblog_en/posts/freebsd-signal-cli-scli/) ###

>
>
> So couple of days ago I migrated from macOS on Macbook Pro to FreeBSD on ThinkPad T480s.
>
>
> ---
>

Beastie Bits
----------

* [Firefox is not paxctl safe for NetBSD](https://anonhg.netbsd.org/pkgsrc/rev/9386adbd052e)
* [FreeBSD 12.2-RELEASE on Microsoft Azure Marketplace](https://azuremarketplace.microsoft.com/en-us/marketplace/apps/thefreebsdfoundation.freebsd-12_2?tab=Overview)

---

### Tarsnap ###

* This weeks episode of BSDNow was sponsored by our friends at Tarsnap, the only secure online backup you can trust your data to. Even paranoids need backups.

Feedback/Questions
----------

* [carlos - BSD Now around the world](<https://github.com/BSDNow/bsdnow.tv/blob/master/episodes/379/feedback/carlos - BSD Now around the world.md>)
* [paulo - freebsd on a Bananapi](<https://github.com/BSDNow/bsdnow.tv/blob/master/episodes/379/feedback/paulo - freebsd on a Bananapi.md>)
  * [paulo - followup](<https://github.com/BSDNow/bsdnow.tv/blob/master/episodes/379/feedback/paulo - followup.md>)

---

* Send questions, comments, show ideas/topics, or stories you want mentioned on the show to [feedback@bsdnow.tv](mailto:feedback@bsdnow.tv) \*\*\*