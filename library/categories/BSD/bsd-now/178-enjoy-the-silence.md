+++
title = "178: Enjoy the Silence"
description = "This week on BSD Now, we will be discussing a wide variety of topics including Routers, Run-Controls, the “Rule” of silence and someThis episode was brought to you by[iXsystems - Enterprise Servers and Storage for Open Source](http://www.ixsystems.com/"
date = "2017-01-25T13:00:00Z"
url = "https://www.bsdnow.tv/178"
author = "feedback@bsdnow.tv (JT Pennington)"
text = ""
lastupdated = "2026-03-26T14:37:50.958534711Z"
seen = false
+++

This week on BSD Now, we will be discussing a wide variety of topics including Routers, Run-Controls, the “Rule” of silence and some

This episode was brought to you by
----------

[![iXsystems - Enterprise Servers and Storage for Open Source](/images/1.png)](http://www.ixsystems.com/bsdnow)[ href="http://www.digitalocean.com/" title="DigitalOcean"\>![DigitalOcean - Simple Cloud Hosting, Built for Developers](/images/2.png)]()[ href="http://www.tarsnap.com/bsdnow" title="Tarsnap"\>![Tarsnap - Online Backups for the Truly Paranoid](/images/3.png)]()

---

Headlines
----------

### [Ports no longer build on EOL FreeBSD versions](https://www.reddit.com/r/freebsd/comments/5ouvmp/ports_no_longer_build_on_eol_freebsd_versions/) ###

* The FreeBSD ports tree has been updated to automatically fail if you try to compile ports on EOL versions of FreeBSD (any version of 9.x or earlier, 10.0 - 10.2, or 11 from before 11.0)
* This is to prevent shooting yourself in the food, as the compatibility code for those older OSes has been removed now that they are no longer supported.
* If you use pkg, you will also run into problems on old releases. Packages are always built on the oldest supported release in a branch. Until recently, this meant packages for 10.1, 10.2, and 10.3 were compiled on 10.1. Now that 10.1 and 10.2 are EOL, packages for 10.x are compiled on 10.3.
* This matters because 10.3 supports the new openat() and various other \*at() functions used by capsicum. Now that pkg and packages are built on a version that supports this new feature, they will not run on systems that do not support it. So pkg will exit with an error as soon as it tries to open a file.
* You can work around this temporarily by using the pkg-static command, but you should upgrade to a supported release immediately. \*\*\*

### [Improving TrueOS: OpenRC](https://www.trueos.org/blog/improving-trueos-openrc/) ###

* With TrueOS moving to a rolling-release model, we’ve decided to be a bit more proactive in sharing news about new features that are landing.
* This week we’ve posted an article talking about the transition to OpenRC
* In past episodes you’ve heard me mention OpenRC, but hopefully today we can help answer any of those lingering questions you may still have about it
* The first thing always asked, is “What is OpenRC?”

>
>
> OpenRC is a dependency-based init system working with the system provided init program. It is used with several Linux distributions, including Gentoo and Alpine Linux. However, OpenRC was created by the NetBSD developer Roy Marples in one of those interesting intersections of Linux and BSD development. OpenRC’s development history, portability, and 2-clause BSD license make its integration into TrueOS an easy decision.
>
>

* Now that we know a bit about what it is, how does it behave differently than traditional RC?

>
>
> TrueOS now uses OpenRC to manage all system services, as opposed to FreeBSD’s RC. Instead of using rc.d for base system rc scripts, OpenRC uses init.d. Also, every service in OpenRC has its own user configuration file, located in /etc/conf.d/ for the base system and /usr/local/etc.conf.d/ for ports. Finally, OpenRC uses runlevels, as opposed to the FreeBSD single- or multi- user modes. You can view the services and their runlevels by typing $ rc-update show -v in a CLI. Also, TrueOS integrates OpenRC service management into SysAdm with the Service Manager tool
>
>

* One of the prime benefits of OpenRC is much faster boot-times, which is important in a portable world of laptops (and desktops as well). But service monitoring and crash detection are also important parts of what make OpenRC a substantial upgrade for TrueOS.

* Lastly people have asked us about migration, what is done, what isn’t? As of now almost all FreeBSD base system services have been migrated over. In addition most desktop-facing services required to run Lumina and the like are also ported. We are still going through the ports tree and converting legacy rc.d scripts to init.d, but the process takes time. Several new folks have begun contributing OpenRC scripts and we hope to have all the roughly 1k ports converted over this year.

  ---

### [BSDRP Releases 1.70 ](https://sourceforge.net/projects/bsdrp/files/BSD_Router_Project/1.70/) ###

* A new release of the BSD Router Project
* This distro is designed to replace high end routers, like those from Cisco and Juniper, with FreeBSD running on regular off-the-shelf server.
* Highlights:
  * Upgraded to FreeBSD 11.0-STABLE r312663 (skip 11.0 for massive performance improvement)
  * Re-Added: netmap-fwd ([https://github.com/Netgate/netmap-fwd](https://github.com/Netgate/netmap-fwd))
  * Add FIBsync patch to netmap-fwd from Zollner Robert
  * netmap pkt-gen supports IPv6, thanks to Andrey V. Elsukov ([ae@freebsd.org](mailto:ae@freebsd.org))
  * bird 1.6.3 (add BGP Large communities support)
  * OpenVPN 2.4.0 (adds the high speed AEAD GCM cipher)

* All of the other packages have also been upgraded
* A lot of great work has been done on BSDRP, and it has also generated a lot of great benchmarks and testing that have resulted in performance increases and improved understanding of how FreeBSD networking scales across different CPU types and speeds \*\*\*

### [DragonFlyBSD gets UEFI support](http://gitweb.dragonflybsd.org/dragonfly.git/commitdiff/7b1aa074fcd99442a1345fb8a695b62d01d9c7fd) ###

* This commit adds support for UEFI to the Dragonfly Installer, allowing new systems to be installed to boot from UEFI
* [This script](http://gitweb.dragonflybsd.org/dragonfly.git/commitdiff/9d53bd00e9be53d6b893afd79111370ee0c053b0) provides a way to build a HAMMER filesystem that works with UEFI
* There is also a [UEFI man page](http://gitweb.dragonflybsd.org/dragonfly.git/commitdiff/d195d5099328849c500d4a1b94d6915d3c72c71e)
* The [install media](http://gitweb.dragonflybsd.org/dragonfly.git/commitdiff/5fa778d7b36ab0981ff9dcbd96c71ebf653a6a19) has also been updated to support booting from either UEFI or MBR, in the same way that the FreeBSD images work \*\*\*

News Roundup
----------

### [The Rule of Silence](http://www.linfo.org/rule_of_silence.html) ###

* “The rule of silence, also referred to as the silence is golden rule, is an important part of the Unix philosophy that states that when a program has nothing surprising, interesting or useful to say, it should say nothing. It means that well-behaved programs should treat their users' attention and concentration as being valuable and thus perform their tasks as unobtrusively as possible. That is, silence in itself is a virtue.”
* This doesn’t mean a program cannot be verbose, it just means you have to ask it for the additional output, rather than having it by default
* “There is no single, standardized statement of the Unix philosophy, but perhaps the simplest description would be: "Write programs that are small, simple and transparent. Write them so that they do only one thing, but do it well and can work together with other programs." That is, the philosophy centers around the concepts of smallness, simplicity, modularity, craftsmanship, transparency, economy, diversity, portability, flexibility and extensibility.”
* “This philosophy has been fundamental to the the fact that Unix-like operating systems have been thriving for more than three decades, far longer than any other family of operating systems, and can be expected to see continued expansion of use in the years to come”
* “The rule of silence is one of the oldest and most persistent design rules of such operating systems. As intuitive as this rule might seem to experienced users of such systems, it is frequently ignored by the developers of other types of operating systems and application programs for them. The result is often distraction, annoyance and frustration for users.”
* “There are several very good reasons for the rule of silence: (1) One is to avoid cluttering the user's mind with information that might not be necessary or might not even be desired. That is, unnecessary information can be a distraction. Moreover, unnecessary messages generated by some operating systems and application programs are sometimes poorly worded, and can cause confusion or needless worry on the part of users.”
* No news is good news. When there is bad news, error messages should be descriptive, and ideally tell the user what they might do about the error.
* “A third reason is that command line programs (i.e., all-text mode programs) on Unix-like operating systems are designed to work together with pipes, i.e., the output from one program becomes the input of another program. This is a major feature of such systems, and it accounts for much of their power and flexibility. Consequently, it is important to have only the truly important information included in the output of each program, and thus in the input of the next program.”
* Have you ever had to try to strip out useless output so you could feed that data into another program?
* “The rule of silence originally applied to command line programs, because all programs were originally command line programs. However, it is just as applicable to GUI (graphical user interfaces) programs. That is, unnecessary and annoying information should be avoided regardless of the type of user interface.”
* “A example is the useless and annoying dialog boxes (i.e., small windows) that pop up on the display screen with with surprising frequency on some operating systems and programs. These dialog boxes contain some obvious, cryptic or unnecessary message and require the user to click on them in order to close them and proceed with work. This is an interruption of concentration and a waste of time for most users. Such dialog boxes should be employed only in situations in which some unexpected result might occur or to protect important data.”
* It goes on to make an analogy about Public Address systems. If too many unimportant messages, like advertisements, are sent over the PA system, people will start to ignore them, and miss the important announcements. \*\*\*

### [The Tao of tmux](https://leanpub.com/the-tao-of-tmux/read) ###

* An interesting article floated across my news feed a few weeks back. It’s what essentially boils down to a book called the “Tao of tmux”, which immediately piqued my interest.
* My story may be similar to many of yours. I was initially raised on using screen, and screen only for my terminal session and multiplexing needs.
* Since then I’ve only had a passing interest in tmux, but its always been one of those utilities I felt was worthy of investing some more time into. (Especially when seeing some of the neat setups some of my peers have with it)
* Needless to say, this article has been bookmarked, and I’ve started digesting some of it, but thought it would be good to share with anybody else who finds them-self in a similar situation.
* The book starts off well, explaining in the simplest terms possible what Tmux really is, by comparing and contrasting it to something we are all familiar with, GUIS!
* Helpfully they also include a chart which explains some of the terms we will be using frequently when discussing tmux ([https://leanpub.com/the-tao-of-tmux/read#leanpub-auto-window-manager-for-the-terminal](https://leanpub.com/the-tao-of-tmux/read#leanpub-auto-window-manager-for-the-terminal))
* One of the things the author does recommend is also making sure you are up to speed on your Terminal knowledge.

>
>
> Before getting into tmux, a few fundamentals of the command line should be reviewed. Often, we’re so used to using these out of street smarts and muscle memory a great deal of us never see the relation of where these tools stand next to each other.
>
>
>
> Seasoned developers are familiar with zsh, Bash, iTerm2, konsole, /dev/tty, shell scripting, and so on. If you use tmux, you’ll be around these all the time, regardless of whether you’re in a GUI on a local machine or SSH’ing into a remote server.
>
>
>
> If you want to learn more about how processes and TTY’s work at the kernel level (data structures and all) the book The Design and Implementation of the FreeBSD Operating System (2nd Edition) by Marshall Kirk McKusick is nice. In particular, Chapter 4, Process Management and Section 8.6, Terminal Handling. The TTY demystified by Linus Åkesson (available online) dives into the TTY and is a good read as well.
>
>

* We had to get that shout-out of Kirk’s book in here ;)
* From here the boot/article takes us on a whirlwind journey of Sessions, Windows, Panes and more. Every control- command is covered, information on how to customize your statusbar, tips, tricks and the like. There’s far more here than we can cover in a single segment, but you are highly encouraged to bookmark this one and start your own adventure into the world of tmux. \*\*\*

### [SDF Celebrates 30 years of service in 2017](https://sdf.org/) ###

* [HackerNews thread on SDF ](https://news.ycombinator.com/item?id=13453774)
* “Super Dimension Fortress (SDF, also known as freeshell.org) is a non-profit public access UNIX shell provider on the Internet. It has been in continual operation since 1987 as a non-profit social club. The name is derived from the Japanese anime series The Super Dimension Fortress Macross; the original SDF server was a BBS for anime fans[1]. From its BBS roots, which have been well documented as part of the BBS: The Documentary project, SDF has grown into a feature-rich provider serving members around the world.”
* A public access UNIX system, it was many people’s first access to a UNIX shell.
* In the 90s, Virtual Machines were rare, the software to run them usually cost a lot of money and no one had very much memory to try to run two operating systems at the same time.
* So for many people, these type of shell accounts were the only way they could access UNIX without having to replace the OS on their only computer
* This is how I first started with UNIX, eventually moving to paying for access to bigger machines, and then buying my own servers and renting out shell accounts to host IRC servers and channel protection bots.
* “On June 16th, 1987 Ted Uhlemann (handle: charmin, later iczer) connected his Apple ][e's 300 baud modem to the phone line his mother had just given him for his birthday. He had published the number the night before on as many BBSes around the Dallas Ft. Worth area that he could and he waited for the first caller. He had a copy of Magic Micro BBS which was written in Applesoft BASIC and he named the BBS "SDF-1" after his favorite Japanimation series ROBOTECH (Macross). He hoped to draw users who were interested in anime, industrial music and the Church of the Subgenius.”
* I too started out in the world of BBSes before I had access to the internet. My parents got my a dedicated phone line for my birthday, so I wouldn’t tie up their line all the time. I quickly ended up running my own BBS, the Sudden Death BBS ([Renegade](https://en.wikipedia.org/wiki/Renegade_(BBS)) on MS DOS)
* I credit this early experience for my discovery of a passion for Systems Administration, that lead me to my current career
* “Slowly, SDF has grown over all these years, never forgetting our past and unlike many sites on the internet, we actually have a past. Some people today may come here and see us as outdated and "retro". But if you get involved, you'll see it is quite alive with new ideas and a platform for opportunity to try many new things. The machines are often refreshed, the quotas are gone, the disk space is expanding as are the features (and user driven features at that) and our cabinets have plenty of space for expansion here in the USA and in Europe (Germany).”
* “Think about ways you'd like to celebrate SDF's 30th and join us on the 'bboard' to discuss what we could do. I realize many of you have likely moved on yourselves, but I just wanted you to know we're still here and we'll keep doing new and exciting things with a foundation in the UNIX shell.” \*\*\*

### [Getting Minecraft to Run on NetBSD](https://www.reddit.com/r/NetBSD/comments/5mtsy1/getting_minecraft_to_run_on_netbsd/) ###

* One thing that doesn’t come up often on BSDNow is the idea of gaming. I realize most of us are server folks, or perhaps don’t play games (The PC is for work, use your fancy-smanzy PS4 and get off my lawn you kids)
* Today I thought it would be fun to highlight this post over at Reddit talking about running MineCraft on NetBSD
* Now I realize this may not be news to some of you, but perhaps it is to others. For the record my kids have been playing Minecraft on PC-BSD / TrueOS for years. It's the primary reason they are more often booted into that instead of Windows. (Funny story behind that - Got sick of all the 3rd party mods, which more often than not came helpfully bundled with viruses and malware)
* On NetBSD the process looks a bit different than on FreeBSD. First up, you’ll need to enable Linux Emulation and install Oracle JRE (Not OpenJDK, that path leads to sadness here)
* The guide will then walk us through the process of fetching the Linux runtime packages, extracting and then enabling bits such as ‘procfs’ that is required to run the Linux binaries.
* Once that's done, minecraft is only a simple “oracle8-jre /path/to/minecraft.jar” command away from starting up, and you’ll be “crafting” in no time. (Does anybody even play survival anymore?) \*\*\*

Beastie Bits
----------

* [UNIX on the Computer Chronicals ](https://youtu.be/g7P16mYDIJw)

* [FreeBSD: Atheros AR9380 and later, maximum UDP TX goes from 250mbit to 355mbit. ](https://twitter.com/erikarn/status/823298416939659264)

* [Capsicumizing traceroute with casper ](https://reviews.freebsd.org/D9303)

---

Feedback/Questions
----------

* [ Jason - TarSnap on Windows](http://pastebin.com/Sr1BTzVN)
* [ Mike - OpenRC & DO](http://pastebin.com/zpHyhHQG)
* [ Anonymous - Old Machines](http://pastebin.com/YnjkrDmk)
* [ Matt - Iocage](http://pastebin.com/pBUXtFak)
* [ Hjalti - Rclone & FreeNAS](http://pastebin.com/zNkK3epM)

---