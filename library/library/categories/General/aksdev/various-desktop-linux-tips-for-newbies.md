+++
title = "Various desktop Linux tips for newbies"
description = "There has been quite a surge in interest towards desktop Linux lately. The userbase, at least according to some metrics, seems to be climbing.I realised today that it's been 4 years for me since I did the switch. I have gathered som"
date = "2025-08-16T17:15:24Z"
url = "https://akselmo.dev/posts/how-to-linux-2025/"
author = "Akseli"
text = ""
lastupdated = "2026-05-27T23:22:57.015420439Z"
seen = true
+++

There has been quite a surge in interest towards desktop Linux lately. The userbase, at least according to [some metrics](https://www.gamingonlinux.com/steam-tracker/), seems to be climbing.

I realised today that it's been 4 years for me since I did the switch. I have gathered some know-how that maybe a complete newbie could find useful. I also try to untangle some jargon I've learned: It may not be exactly technically correct, but this is meant for a more regular user anyway.

Note: ***Do not trust "AI" tools when looking for information.*** They can lie. They don't really "know" anything, they just copy what they see on the internet, and spit it out. Sometimes in wrong orders and contexts. I will list some resources I trust at the end of the post.

I have also written about this before here: [Setting up Kubuntu for gaming](https://akselmo.dev/posts/setting-up-kubuntu-for-gaming/)

That post is quite out of date though, so consider this a supplemental material and sort of upgrade.

[Investigate the software you need](#investigate-the-software-you-need)
----------

There is often times where you can only use specific software on Windows only. Or specific games with anticheats do not work on Linux; Not all of them though! Just some, especially with kernel level anticheats!.

But for example Photoshop or similar tools do not work on Linux natively. There can be tricks to get them working.

You would not expect Mac software to work on Windows, right? This is similar kind of situation.

Now Linux can run **some** Windows applications through [Bottles](https://usebottles.com/), which uses [Wine](https://www.winehq.org/). But not all.

So, make a list of the Must Have applications you have. Then search for Linux compatibility.

In some cases, you may find alternatives for the application, that work on both Windows and Linux! When that happens, you can already test it out in Windows and see if it works for your workflow, and start using that instead. Note that this can take time to learn, but I think it would be worth it.

### [And hardware too](#and-hardware-too) ###

I haven't had a problem with incompatible hardware with Linux for long long time, but it's still good idea to check it. For example, if you have Nvidia GPU, you may want to check if the GPU is supported by which drivers, or if you need to install drivers at all. For AMD/Intel GPU users, you're in luck, because the drivers are in the Kernel: This means that you don't need to install anything.

If I have had trouble with hardware, it's often been audio devices, like headsets that have two separate dials for sound (mono and stereo), weird bluetooth speakers, etc..

There is a site called [Linux Hardware](https://linux-hardware.org/) you can use to search for compatible parts.

[Backup all your stuff](#backup-all-your-stuff)
----------

Before doing anything to your PC: Backup your data. Backup the photos, the videos, the game save files, documents, anything you may need. Back them up to a cloud service or external drive.

Make sure those backups work, too.

[Distribution choice paralysis](#distribution-choice-paralysis)
----------

Linux distributions are all their own operating systems, they just share the most central part, that is the [Linux kernel](https://www.kernel.org/).

Distributions take that kernel, add their own things to it and make it what they want it to be for their users.

There's a lot of distributions. Like, A LOT. So of course it'll feel daunting to choose one.

But there's no "wrong" choice. It will probably take time to figure out which one you like, but honestly, most people will be fine with one that does it's job, stays out of the way and updates without effort.

Everyone has tons of opinions about this. Then there's the weird curmudgeons that tell others their opinion is "wrong." Those people are something you can ignore. If it works for you, that's all that matters.

After choosing a distribution, you install it to an USB stick (that has nothing important in it, so NOT the one with your backups!!) with tool like [Rufus](https://rufus.ie/en/), boot from it at PC startup (varies between motherboards) and get installing.

### [My recommended newbie distributions](#my-recommended-newbie-distributions) ###

To help one get started with choosing, here's my recommendations from all the distributions I've tried on my \~4 year journey.

Do note that gaming is big factor in my computer use, so if the distribution can't game well, it's not on this list.

#### [Bazzite](#bazzite) ####

Homepage: [https://bazzite.gg/](https://bazzite.gg/)

Bazzite is perfect distribution for anyone starting with Linux.

It's made so that user can't really break it, due to it's nature: You can't really open system files and start modifying them and deleting them. Then, updates are done in a way that if something goes wrong, you can go to previous version of the distribution.

On top of that, it makes setting it up very easy with its [guides](https://docs.bazzite.gg/General/Installation_Guide/). And in download section, you select what hardware you have, and what desktop environment you have, so you know from the get-go that it's very likely going to work with your system.

**If you don't really know what to choose, go with Bazzite.**

#### [Fedora KDE](#fedora-kde) ####

Homepage: [https://fedoraproject.org/kde/](https://fedoraproject.org/kde/)

Fedora KDE is solid. It works, it updates regularly, it plays games I play really well, and works with development. And then it stays out of the way. Fedora is also what Bazzite is built on top of.

Fedora however allows you to tinker with the system files and such, as long as you have access to it. You should not do that if you don't know what you're doing! But it's possible.

Installation on systems with AMD/Intel GPU is really easy and you don't need to install any separate drivers.

With Nvidia GPU, you will likely have to use RPM Fusion repositories, and follow their guide: [https://rpmfusion.org/Howto/NVIDIA](https://rpmfusion.org/Howto/NVIDIA).

So yes, for Nvidia users it can be bit more tinkery.

**Fedora KDE is my daily driver** because it works really well with any development work I do due to it's up-to-date system libraries. And since it's regularly updated, if there is a bug, it often gets fixed just as fast.

#### [Kubuntu](#kubuntu) ####

Homepage: [https://kubuntu.org/](https://kubuntu.org/)

Last but not the least, Kubuntu is a solid distribution as well. It does not update as frequently as Fedora KDE does, but not everyone needs such frequent updates, especially for basic daily use.

Kubuntu utilizes same tools and systems as [Ubuntu](https://ubuntu.com/), which you may have heard of. So it has a solid community behind it.

When I used Kubuntu, it worked with games really well and I had zero issues with it. I moved to Fedora due to development stuff, so that's why I don't use it anymore.

When downloading Kubuntu, make sure to choose "Latest."

### [Opinions and notes about LTS distros](#opinions-and-notes-about-lts-distros) ###

LTS stands for "Long Term Support" or "Long Term Stable."

This wording has caused a lot of confusion: People tend to think "stable" means it doesn't crash. What it actually means is that **it won't change** and that means **the bugs are stable too.** The only updates it gets are security updates. Bug fixes, especially for software, are really rare.

LTS/Stable distributions are perfect for **enterprise environments** or your grandmas PC which you know she won't remember to update.

For regular use, especially gaming use, I would recommend against them: They use LTS kernel that has support only for specific devices, so if you buy a new shiny GPU and plop it in to system running on LTS kernel, it very likely does not have support for that new shiny GPU.

Also, when you encounter an annoying bug, be prepared for that bug to stay around until the next LTS release: Which can mean years!

So unless you really know you *need/want* LTS distribution, choose anything that is "Latest" or frequently updated. You will have less headaches that way: I learned this the hard way.

Note: Bunch of people have told me that I should have more nuance here. I understand it too, for some people LTS distribution can be quite perfect. I'm not saying that one should completely avoid them, either. But newcomer should, in my honest opinion, try more up-to-date distribution. I think they provide better experiences, especially for regular desktop use. Bazzite has been really good for this usecase.

[Desktop environments](#desktop-environments)
----------

You may notice that I seem to recommend distros running on [KDE software](https://kde.org/).

This is because, well, I work on that software and I like it! But people also find it very easy to learn when they're coming from Windows.

When I started Linuxing, I tried [GNOME](https://www.gnome.org/). It's a great desktop environment, but it's far from what Windows is. This was very overwhelming for me, because I was already learning completely new operating system paradigm, so having also the desktop use change from underneath was really jarring. I then tried [XFCE](https://xfce.org/), which is very lightweight and nice to use, but it lacked some things I wanted, like [Wayland](https://en.wikipedia.org/wiki/Wayland_(protocol)) support.

I then stumbled upon on [KDE Plasma](https://kde.org/plasma-desktop/) and fell in love with it: I did not have to learn completely new way of using my desktop, but could *gradually* modify the desktop to suit my needs. My Plasma setup is *far* from the defaults nowadays, and Plasma allowed me to discover what I like on my own pace.

Note that I don't think any desktop environment is "bad." They're just different, catering for different needs.

But for most Windows users, I do recommend KDE Plasma for the above reasons: Less cognitive load to learn everything.

[Unlearning Windows](#unlearning-windows)
----------

When moving to desktop Linux, most people are confused by some things, like "Where's my C-drive."

Windows has taught many of us specific patterns, and when those patterns do not exist, we tend to blame the system we're using.

What you need to remember is that you're not trying to switch to "better Windows." You're switching to completely different operating system, and you need to try your best at *unlearning Windows*.

### [So where is the C and D drive](#so-where-is-the-c-and-d-drive) ###

Instead of having drives like C and D, you mount the drives you have.

You can open terminal and type `ls /mnt/` and it shows what drives you have mounted.

Mounting in this case means that it's plugged in and browsable.

Here's a shoddy comparison:

* C drive on Windows -\> `/`
* D drive on Windows -\> `/mnt/drive-name`

The `/` is called "root directory" and that's where everything in the PC resides.

It can get more complicated, and my suggestion is to just leave `/` alone.

If you want to have games on your other drive, check your `/mnt/` folder for that drive. Usually during installation the drive is made for you.

If not, you may have to ask help for the distribution you're using.

In Linux, all drives and such are folders, that start from `/`. Instead of multiple "trees" that start from "C" or "D", there's one big tree that starts from `/`.

### [What's /home/ or \~](#what-s-home-or) ###

When you open file manager such as [Dolphin](https://apps.kde.org/dolphin/), usually the first folder you see open is `/home/your-username/`.

This is your home folder. Think of it like "my documents" folder in Windows computers.

Keep all your documents, videos, images etc. in here.

When people say `~/Documents`, the `~` is shorthand for `/home/your-username/`. This also works inside terminal, so you can type `ls ~` to see what's inside your home folder, without having to type the `/home/user`.

### [Can I just keep my game drive from Windows?](#can-i-just-keep-my-game-drive-from-windows) ###

When installing Linux, many people tend to ask that if they can just keep the drive full of games, like `D:` drive, without formatting it and just use the same game files.

Well, you sort of can, but Linux is not very fast with it. When Windows formats drives, it uses something called `NTFS` for them. Linux has many different ones, but usually it's `ext4` or `btrfs`.

`NTFS` drives can be opened and such on Linux, but it can be rather slow.

So my tip is just to back up the game data to something like USB drive and then move them, or just download the games again. You will be much happier with the performance that way.

[Do not be afraid of terminal](#do-not-be-afraid-of-terminal)
----------

Terminal is that box full of text you can type in. It looks like something from the 80s/90s.. And it can be intimidating.

Don't be afraid of it! Terminals are great way to operate on some things because *they're desktop agnostic!*.

This means that if your friend uses GNOME and you use KDE Plasma, and you both have some problem you have to solve. GNOME and Plasma have different user interfaces, so you can't really advice your friend how to solve that issue on their end.

However, what you *can* do is solve that issue inside terminal with a command, then share that command with your friend who can then use it too.

Of course, there's a ton more nuance here.. But the above is why it's still being used.

Couple important notes:

* **If you don't understand the command, study it first before running it.**
* **If the command requires `sudo` to be run, study it three times before even thinking of running it.**

Commands that need `sudo` to be run mean that they have access to everything on your computer, as they need a `root` access. If you don't know what you're doing, things may break.

Again, this is not something you need to be afraid of, but you should be cautious, especially when copying commands from the internet!

[Report bugs!](#report-bugs)
----------

In Linux world, most things don't cost anything. However, if you encounter bugs, you should report those to the app/system you encountered it with.

This helps the bug to get fixed. Sometimes it can take long time, sometimes it can be fixed next day.

But without the bug report, nobody will know.

Here's a post about reporting bugs I wrote: [How I report bugs](https://akselmo.dev/posts/how-i-report-bugs/)

Note: **If you're using LTS distribution, report all the bugs to the distribution itself, not the app/system!**

[Avoid installing apps from internet](#avoid-installing-apps-from-internet)
----------

On Windows, it's common to go to a website and download an exe file there to install something.

On Linux, we prefer using app "stores" where one just types what they want to download and then download it.

For example in KDE Plasma, we use tool called [Discover](https://apps.kde.org/discover/).

Instead of going to internet, open Discover and type the name of the app. If it exists, it'll pop-up, and then you can download it there.

This is safer for the user as the files come from the distribution (or Flathub, more on that later), so they have been (likely) tested that they work. They also are installed more cleanly to the system, so you get all the launcher icons and other things.

You *can* download apps from web pages, and sometimes that's the only way to get some apps. But always first check your distribution app downloader.

### [Flathub](#flathub) ###

[Flathub](https://flathub.org/) is the new cool thing that uses [Flatpaks](https://flatpak.org/).

As a regular user you don't need to worry as much what Flatpaks are, but I will explain anyway: When distributing application between distros, some distros use different package management systems.

This then can get out of hand when you want to share your app with 10 distributions that all use their own thing. Or they use the same thing but have different library versions.. And this causes headaches.

What Flatpak tries to do is just Make Things Work by adding all that's needed to the package, then user just installs it. Flathub is a central place where people upload their flatpaks.

Flatpaks also have security measures, that can be helpful with some apps. For example Flatpak apps can be told to not be able to read any other folder than `~/Downloads` etc. Kind of like what Android has with their permission system.

So, if your system does not have Flathub set up, select your distribution from [here](https://flathub.org/setup), and add it to your system.

However I advice to not install Steam through it: Steam works better when it has more access to your system. So follow your distributions guide for installing Steam in those cases.

[Dualbooting](#dualbooting)
----------

If you want or need to use Windows for something, it is possible to set up your PC so that when you power on your PC, it asks you if you want to use Windows or Linux.

Distributions have their own manuals for that. Be prepared that Windows updates have been known to meddle with your boot-loader (the thing that shows you the "Windows or Linux?" at startup), which may cause your PC suddenly boot only to Windows one day.

So, it's possible, but you need to do some research about it for the distro you have chosen.

[Learning resources](#learning-resources)
----------

Again, **do not rely on AI tools.** They can lie.

Instead, search information from various forums and wikis, such as:

* [ArchWiki](https://wiki.archlinux.org/title/Main_page)
  * Despite the name, it can be useful for whatever distribution you use!

* [ProtonDB](https://www.protondb.com/)
  * Game compatibility with Linux

* [GamingOnLinux](https://www.gamingonlinux.com/)
  * A lot of gaming related news, and they have section for tracking [anti-cheat compatibility](https://www.gamingonlinux.com/anticheat/)

* [All Things Linux wiki](https://atl.wiki/)
  * Up and coming new wiki for Linux things

* [r/linuxhardware](https://old.reddit.com/r/linuxhardware/)
  * People ask here often if specific hardware works on Linux

Then, every project and desktop has often their own forums and wiki pages. When in doubt, read those. Don't be afraid to ask in the forums either, or in chats like IRC or Matrix.

[Anything else?](#anything-else)
----------

Uh, that's a lot of stuff. I don't remember if I had anything else in mind. I will update this post if I do remember suddenly something.

I hope this has been useful, however! I can't give in-depth guides to everything, because things can vary between distributions, hardware, desktop environments.. But I hope this can at least help you get started and helps resolve some questions you have.

If you have any questions, feel free to mail me at `linux-newbies@akselmo.dev`. If it's something that should deserve it's place here, I will update the post.

Anyways, thanks for reading!

[Edits](#edits)
==========

* 2025-08-23: Clarified that my notes about LTS are opinions, added Dualbooting section