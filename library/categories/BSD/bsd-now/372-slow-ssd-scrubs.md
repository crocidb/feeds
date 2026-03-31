+++
title = "372: Slow SSD scrubs"
description = "Wayland on BSD, My BSD sucks less than yours, Even on SSDs, ongoing activity can slow down ZFS scrubs drastically, OpenBSD on the Desktop, simple shell status bar for OpenBSD and cwm, and more.NOTES   This episode of BSDNow is brought to you by [Tarsnap](https://www.tarsnap"
date = "2020-10-15T10:00:00Z"
url = "https://www.bsdnow.tv/372"
author = "feedback@bsdnow.tv (JT Pennington)"
text = ""
lastupdated = "2026-03-26T14:37:50.506143778Z"
seen = true
+++

Wayland on BSD, My BSD sucks less than yours, Even on SSDs, ongoing activity can slow down ZFS scrubs drastically, OpenBSD on the Desktop, simple shell status bar for OpenBSD and cwm, and more.

***NOTES***  
 This episode of BSDNow is brought to you by [Tarsnap](https://www.tarsnap.com/bsdnow)

Headlines
----------

### [Wayland on BSD](https://blog.netbsd.org/tnf/entry/wayland_on_netbsd_trials_and) ###

>
>
> After I posted about the new default window manager in NetBSD I got a few questions, including "when is NetBSD switching from X11 to Wayland?", Wayland being X11's "new" rival. In this blog post, hopefully I can explain why we aren't yet!
>
>
> ---
>
>
> ### [My BSD sucks less than yours](https://www.bsdfrog.org/pub/events/my_bsd_sucks_less_than_yours-full_paper.pdf) ###
>
>
>
> This paper will look at some of the differences between the FreeBSD and OpenBSD operating systems. It is not intended to be solely technical but will also show the different "visions" and design decisions that rule the way things are implemented. It is expected to be a subjective view from two BSD developers and does not pretend to represent these projects in any way.
>
>
>
> Video
>
>
>
> * [EuroBSDCon 2017 Part 1](https://www.youtube.com/watch?v=ZhpaKuXKob4)
> * [EuroBSDCon 2017 Part 2](https://www.youtube.com/watch?v=cYp70KWD824)
>
>

---

News Roundup
----------

### [Even on SSDs, ongoing activity can slow down ZFS scrubs drastically](https://utcc.utoronto.ca/~cks/space/blog/solaris/ZFSSSDActivitySlowsScrubs) ###

>
>
> Back in the days of our OmniOS fileservers, which used HDs (spinning rust) across iSCSI, we wound up changing kernel tunables to speed up ZFS scrubs and saw a significant improvement. When we migrated to our current Linux fileservers with SSDs, I didn't bother including these tunables (or the Linux equivalent), because I expected that SSDs were fast enough that it didn't matter. Indeed, our SSD pools generally scrub like lightning.
>
>
> ---
>
>
> ### [OpenBSD on the Desktop (Part I)](https://paedubucher.ch/articles/2020-09-05-openbsd-on-the-desktop-part-i.html) ###
>
>
>
> Let's install OpenBSD on a Lenovo Thinkpad X270. I used this computer for my computer science studies. It has both Arch Linux and Windows 10 installed as dual boot. Now that I'm no longer required to run Windows, I can ditch the dual boot and install an operating system of my choice.
>
>
> ---
>
>
> ### [A simple shell status bar for OpenBSD and cwm(1)](https://www.tumfatig.net/20200923/a-simple-shell-status-bar-for-cwm/) ###
>
>
>
> These days, I try to use simple and stock software as much as possible on my OpenBSD laptop. I’ve been playing with cwm(1) for weeks and I was missing a status bar. After trying things like Tint2, Polybar etc, I discovered @gonzalo’s termbar. Thanks a lot!  
>  As I love scripting, I decided to build my own.
>
>
> ---
>
>
> Beastie Bits
> ----------
>
>
>
> [DragonFly v5.8.3 released to address to issues](http://lists.dragonflybsd.org/pipermail/commits/2020-September/769777.html)  
> [OpenSSH 8.4 released](http://www.openssh.com/txt/release-8.4)
>
>
> ---
>
>
> ### Tarsnap ###
>
>
>
> * This weeks episode of BSDNow was sponsored by our friends at Tarsnap, the only secure online backup you can trust your data to. Even paranoids need backups.
>
>

Feedback/Questions
----------

* [Dane - FreeBSD vs Linux in Microservices and Containters](<https://github.com/BSDNow/bsdnow.tv/blob/master/episodes/372/feedback/Dane - FreeBSD vs Linux in Microservices and Containters.md>)
* [Mason - questions.md](<https://github.com/BSDNow/bsdnow.tv/blob/master/episodes/372/feedback/Mason - questions.md>)
* [Michael - Tmux License.md](<https://github.com/BSDNow/bsdnow.tv/blob/master/episodes/372/feedback/Michael - Tmux License.md>)

---

* Send questions, comments, show ideas/topics, or stories you want mentioned on the show to [feedback@bsdnow.tv](mailto:feedback@bsdnow.tv) \*\*\*