+++
title = "154: Myths, Pi’s & Features, oh my!"
description = 'This week on BSDNow, we are taking a look at a few different tutorials, including running your very own RPi web-server. (Come-on, youThis episode was brought to you by[iXsystems - Enterprise Servers and Storage for Open Source /\](http://www.ixsystems'
date = "2016-08-10T12:00:00Z"
url = "https://www.bsdnow.tv/154"
author = "feedback@bsdnow.tv (JT Pennington)"
text = ""
lastupdated = "2026-03-26T14:37:51.011110591Z"
seen = false
+++

This week on BSDNow, we are taking a look at a few different tutorials, including running your very own RPi web-server. (Come-on, you

This episode was brought to you by
----------

[![iXsystems - Enterprise Servers and Storage for Open Source](/images/1.png) /\>](http://www.ixsystems.com/bsdnow)[![DigitalOcean - Simple Cloud Hosting, Built for <br>
Developers](/images/2.png)](http://www.digitalocean.com/)[![Tarsnap - Online Backups for the Truly <br>
Paranoid](/images/3.png)](http://www.tarsnap.com/bsdnow)

---

Headlines
----------

### [broken features aren't used](http://www.tedunangst.com/flak/post/broken-features-arent-used) ###

* This post from TedU talks about the difficulty of removing features from an operating system
* “One of the difficulties in removing a feature is identifying all the potential users. A feature here could be a program bundled with an operating system, or a command line option, or maybe just a function in a library. If we remove a feature, users that depend on it will be sad. Unfortunately, absence of evidence is not evidence of absence. I’ve never heard of anybody running ls -p but it’s not impossible that somebody does.”
* “The reasons why we want to remove an existing feature can vary. Sometimes it’s old code that interferes with maintenance. Sometimes a nearly complete rewrite can improve performance. In other cases, the feature in question is really more of a misfeature. It may have security implications, where the existence of the feature can be used to facilitate the exploitation of other vulnerabilities, and removing the feature will help mitigate the exploit.”
* “There’s no general test that can be used, but there is one test that works in many cases. Test that the feature works. If the feature doesn’t work, that’s compelling evidence that nobody is using it, because nobody can be using it. You don’t need to fix it. You can just remove it.”
* He makes some interesting comments about exhaustive unit tests and the push to keep everything working all the time. If you never break anything to see if someone complains, how do you know if it is still being used? \*\*\*

### [A Raspberry Pi FreeBSD Web Server](http://devio.us/~spacemonkey/raspberry_pi_freebsd_web_server_howto.html) ###

* Looking at a super-low power solution to host some webpages? If so, we have the tutorial for you.
* Specifically a walkthrough of getting FreeBSD up on a Pi, and setting up nginx, OpenNTPD, LibreSSL and friends.
* The walkthrough starts with grabbing a FreeBSD 11 snapshot for arm64 and doing the initial setup process to get to a bootable FreeBSD system.
* If you are an extreme noob, not to fear. The tutorial walks you through setting up usernames, timezones, even a larger /tmp directory on your new MiniBSD setup.
* The tedious part comes to play during the setup of packages. The author walks us through setting up LibreSSL and various other packages via ports (Since LibreSSL isn’t the default in FreeBSD). This will take some time to compile on your humble RPi device. (Go make a sandwich, walk the dog, fix the gutters, etc)
* When it’s all said and done, you’ll end up with a secure little web-server that you’ve configured all by yourself! (Wondering what the word-press performance would be like on that box) \*\*\*

### [Uber switches from PostgreSQL back to MySQL ](https://eng.uber.com/mysql-migration/) ###

* We often hear success stories of people switching to PostgreSQL and getting huge performance gains, but this stories is the reverse
* Uber’s engineering team has switched back to MySQL, because for their specific workload and design, MySQL’s innodb has better performance
* Of course, it is not just vanilla MySQL, but “Schemaless”, a sharding system that sits on top of MySQL
* The article goes into detail about the on-disk format used by Postgres, and the specific shortcomings that Uber encountered
* Uber admits that all of its testing was against the older PostgreSQL 9.2, but one of their complaints is about having difficulty upgrading
* “We started out with Postgres 9.1 and successfully completed the upgrade process to move to Postgres 9.2. However, the process took so many hours that we couldn’t afford to do the process again. By the time Postgres 9.3 came out, Uber’s growth increased our dataset substantially, so the upgrade would have been even lengthier. For this reason, our legacy Postgres instances run Postgres 9.2 to this day, even though the current Postgres GA release is 9.5.”
* There is a followup, from the Postgres side
* [“Why we lost Uber as a user” ](https://www.postgresql.org/message-id/5797D5A1.5030009@agliodbs.com)
* This thread goes into detail about the specific types of problematic queries that Uber was using
* “The Uber guy is right that InnoDB handles this better as long as you don't touch the primary key (primary key updates in InnoDB are really bad)”
* “This is a common problem case we don't have an answer for yet.”
* The thread then goes on to discuss possibly supporting a “pluggable heap storage layer”, to allow different workloads to use different on-disk formats for best performance \*\*\*

### Getting started with GhostBSD and FreeBSD ###

* [Part 1](http://unsolicitedbutoffered.blogspot.com/2016/07/getting-started-with-ghostbsd-and.html)
* [Part 2](http://unsolicitedbutoffered.blogspot.com/2016/07/getting-started-with-ghostbsd-and_31.html)
* [Part 3](http://unsolicitedbutoffered.blogspot.com/2016/08/getting-started-with-ghostbsd-and.html)
* [Part 4](http://unsolicitedbutoffered.blogspot.com/2016/08/getting-started-with-ghostbsd-and_2.html)
* In what may be our first GhostBSD tutorial, we have a nice walkthrough on the initial getting started with it.
* For those who don’t know, GhostBSD provides a nice XFCE or Mate desktop out of box, and still supports 32bit installs for those who want to keep that older hardware running.
* The walkthough takes us through the process of grabbing GhostBSD images and getting the installer up and running via bootable USB stick.
* Once booted, the graphical installer is straight-forward and short, allowing you to get the bits on disk as quickly as possible. (The actual installation took around 45 Minutes on an old Toshiba NB520)
* The author then takes us on a tour of some of GhostBSD’s out-of-box bundled applications (Along with XFCE) and how it compares to similar Linux setups.
* Lastly covered is the setup of Wireless (The manual way with WPA supplicant, since the GUI tool appeared to not work in this particular case)
* All in all a good walkthrough, especially if you’ve not seen GhostBSD in action before, the screenshots are very informative! \*\*\*

News Roundup
----------

### [Steam on FreeBSD 11-CURRENT](https://github.com/SteamOnFreeBSD/SteamOnFreeBSD) ###

* Steam on FreeBSD. Yes, we’ve heard of setups using WINE, but what about running the Linux binaries natively?
* Well you are in luck. We have a github project that details getting the Linux native client up and running on a FreeBSD 11-CURRENT system.
* This github project is rather mysterious, with only the instructions to download a pre-packaged steam.txz file, extract and run the provided install.sh script.
* Curious I inspected some of the scripts, the installer.sh is fairly straight-forward, but does some ‘non-standard’ freebsd things, like fetching packages and extracting specific files/libaries into a new /compat/ubuntu directory.
* After that, it goes through a huge list of debian/ubuntu packages, also throwing them into the aforementioned ubuntu directory.
* At runtime, the wrapper script ensures that various linux compat file-systems are mounted in the correct location, then proceeds to run steam with some LD\_LIBRARY\_FLAGS set from the users .local/share/steam directory.
* A tad scary if honest, however it is a neat PoC to see Steam working on FreeBSD. Hopefully somebody can turn this into a more traditional package which can be easily removed / cleaned up afterwards. \*\*\*

### [How to run Enlightenment on OpenBSD](http://enform.haxlab.org/) ###

* Are you an enlightenment fan? Be honest, we know there are quite a few of you out there!
* If so, we have a tutorial for you today, which talks about how to run E on OpenBSD.
* The process is pretty easy, but some steps might be overlooked if you are new to OpenBSD or don’t know how to tune / compile things on your own.
* It starts out with adjusting some sysctl’s for better tuning that works on an E based desktop.
* Next is installing from package some pre-reqs that will enable us to build E from source.
* After that, we need to download and install EFL from github, and the autogen / gmake commands are helpfully provided for you.
* Lastly the same is done for E itself, and TADA, E is installed and ready to go on your OpenBSD system. If you do this right, should only take 5-10 minutes to be up and running. \*\*\*

### [Myths about FreeBSD](https://wiki.freebsd.org/Myths) ###

* Over on the FreeBSD wiki, we have a new “Myths” page which we’ve never highlighted on the show before.
* First up, and one I’ve very familiar with, is the usual “FreeBSD is only for Servers and not Desktops”, along with a good rebuttal about what it does offer and mention of projects such as PC-BSD which do it also.
* Another prevalent one is the “FreeBSD has a closed development model”, which is easily refuted:

>
>
> FreeBSD has over 400 developers around the world who have commit access to the repository. Many of these are willing to commit patches from third parties. If you want to get an idea of the number of patches that have been committed on behalf of other developers, then search for 'Submitted by' in the commit logs. At the time of writing, this is just under twenty thousand, or about ten percent of all commits. After having a few patches accepted, regular contributors are usually encouraged to apply for commit access.
>
>

* Another one that we are still hearing (Although it is less and less now) was the common “FreeBSD makes me compile everything from source”. Listeners of this show will know that pkg has pretty much made this irrelevant in recent years. However the option to compile yourself from source still exists, but most users won’t find this ever necessary.

* A good list, with many more items on it than we’ve mentioned here. Take a look, you might find something there you’ve heard in the wild, or maybe even thought yourself at one point!

  ---

### [FreeBSD Area51 testing repo, KDE 5 ](https://gist.github.com/swills/8a9a9f8a529256f134830c2a1476db0c) ###

* This github GIST from Steve Wills provides the instructions to enable the FreeBSD xorg teams unofficial ‘Area51’ testing repo on your machine
* This gives you access to the new KDE 5
* Users should obviously be careful testing early-access software, but bug reports are very welcome, and important to getting KDE 5 working well under FreeBSD \*\*\*

Beastie Bits
----------

* [NetBSD Machines at Open Source Conference 2016 Kyoto](http://mail-index.netbsd.org/netbsd-advocacy/2016/08/01/msg000712.html)

* [How to install htop on pfSense](http://www.cyberciti.biz/faq/pfsense-install-htop-using-pkg-command/)

* [The first ever patch for #Chromium on #NetBSD has been committed!](https://twitter.com/krytarowski/status/759909139300491265)

* [CharmBug - Adventures in Hardened BSD - August 24th 2016](http://www.meetup.com/CharmBUG/events/232474857/)

Feedback/Questions
----------

* [ Emanual - GoTTY ](http://pastebin.com/q24sNcNY)
* [ Joe - Disable Device ](http://pastebin.com/iTkmpVr9)
* [ Allen - ZFS Send/Recv](http://pastebin.com/bPHEP4Ya)
* [ Mica - Adobe Replacements](http://pastebin.com/L0ttuNx3)
* [ Robroy - RAID](http://pastebin.com/Dr92CGCU) \*\*\*