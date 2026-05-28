+++
title = "I deleted Windows! And switched to Fedora"
description = '''Last sunday I finally decided it's time to leave Windows properly behind. I had Windows installed on my PC just in case I want to dualboot back to it.But almost year has been gone by since I switched to Kubuntu and.. Nope. I didn't boot Windows single time during this \~11 months'''
date = "2022-05-06T00:00:00Z"
url = "https://akselmo.dev/posts/i-deleted-windows-and-switched-to-fedora/"
author = "Akseli"
text = ""
lastupdated = "2026-05-27T23:22:57.122380960Z"
seen = true
+++

Last sunday I finally decided it's time to leave Windows properly behind. I had Windows installed on my PC just in case I want to dualboot back to it.

But almost year has been gone by since I switched to Kubuntu and.. Nope. I didn't boot Windows single time during this \~11 months.

Also I switched to Fedora because things went wrong with partition resizing...

[Partition games](#partition-games)
----------

First I just wanted to delete Windows from my disks and then resize partitions to take up its space. I had done this before so I knew to take backups of things, and went for it.

Boot up from live USB, start KDE Partition Manager, delete old stuff and start resizing...

First it took an hour to resize my NVME drive from 700gb to \~1tb. What the fuck, but okay.

Then it was time for resizing my SSD from 1.2tb to \~2tb. It started, did something and.. KDE Partition Manager stopped responding. It crashed and burned.

I knew it was in unsaveable situation, even the NVME drive partition had crapped itself.

Lucky for me for those backups. **EXCEPT I LOST MY MORROWIND SAVES AND I AM STILL SAD ABOUT IT!**

I decided it's time to try something new, so I tipped my head towards Fedora, since I had heard many good things about it. *Sorry not sorry about the pun.*

[Installing Fedora](#installing-fedora)
----------

Here's where things get a bit funny. When installing Fedora, the installation was pretty straightforward, except I got very confused by the disk selection part.

At first, I chose both of my disks when installing. I thought it would just format both as EXT4, automount my SSD, that kind of thing...

Well I had no idea Fedora uses BTRFS and it went like "oh two drives? Raid 0 (or 1?) time!"

When booting up my PC first time after installation, I was confused how I had 3tb of space. It quickly dawned on me that Fedora had combined both of my drives into one.

But I wanted to separate the drives: I wanted to install my games on the SSD, and keep everything else on the NVME.

Que me searching internet how to separate the two drives with the BTRFS commands. Luckily I hadn't installed much on the PC yet because I did one command too many or something, since next boot I just got "EMERGENCY MODE!"

Fuck.

[Installing Fedora properly this time](#installing-fedora-properly-this-time)
----------

I gave up trying to recover that the situation, cleaned both drives with live image and reinstalled Fedora again, but this time I made damn sure that I chose ONLY the NVME drive to install on. Otherwise the installation was smooth sailing as last time.

Success. Then I formated the SSD drive as EXT4, mounted it and did the usual `fstab` magic.

And finally I could install games on my SSD only on Steam, just like the gods intended.

Then I just set up my system from all the backups I have etc etc. The usual guff.

[Using Fedora for almost a week](#using-fedora-for-almost-a-week)
----------

I've loved using it so far! DNF is superior package manager, there's updates really often, my games have slightly better time running (especially on Wayland but more of that later).. Many nice things.

My biggest source of happiness has been how *easy* it is to build packages from scratch with Fedora, especially KDE related stuff.

Most things are already in repos, I can just install all dependencies and start building things, poking around, testing and having fun.

Otherwise since it's KDE, I have pretty much same workflow I had on Kubuntu and there's not that much of difference.

To sum up, major positive differences:

* No snaps! :) I don't need to fiddle with uninstalling those anymore
* DNF is very good for installing packages and managing them. It also has very nice search function.
* Frequent updates for new stuff! Haven't had stability issues yet.

And since Wayland is the default, I finally got to try it.. However..

[Wayland is not for me just yet](#wayland-is-not-for-me-just-yet)
----------

Wayland is great. It's very fast, it's smooth on my two monitors, it is just dang nice to use. Note, I have AMD GPU: RX 480.

But it has still some hiccups, especially with KDE, so I couldn't just yet stay with it. There's tiny bugs like application menu highlight getting stuck on some app, Yakuake had difficult time running, tooltips can jump up anywhere, system tray popups can pop up in middle of screen...

Also games can still lose mouse focus and suddenly I'm clicking on other screen. Same happens in X11, but I have a script that forces my mouse to stay on the first monitor. I haven't found Wayland variation of it, so if you know any, do send a comment!

They're really tiny issues. But they annoy me. And I don't like it.. :'(

So I went back to X11 for now.

After tasting Wayland, I can feel the sluggishness of X11 a bit now. But Wayland is still bit too early for my usecases. But when it works, it's fricking beautiful and I wish all the best for developers working on it. You're making something amazing there, please keep it up!

[Sum up](#sum-up)
----------

I am having fun using Fedora and I don't have to worry about Canonical's shenaningans anymore. Building software is REALLY easy on Fedora and I get cool new stuff/upgrades faster. Stability hasn't been an issue at all.

I just wish the installation was a bit more clear, especially when it comes to installing on many drives. The installer should ask user if they want to combine the drives or install OS on first and have rest as data drives.

But yeah, no more Windows. End of an era. WinXP will always have soft spot in my heart (and Win7 too honestly), but Microsoft is pushing way too much privacy invading ads and other crap that I don't want to be part of that anymore.

Oh yeah, I had to do way less to set up my rig for gaming on Fedora. It just worked without additional installs!

Thanks for reading!