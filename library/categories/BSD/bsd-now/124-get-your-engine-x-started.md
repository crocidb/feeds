+++
title = "124: Get your engine(x) started!"
description = "This week on the show, we have a very full news roster to rundown, plus an oldie, but goodie with Igor of the nginx project. That plus all your questions and feedback,iX Systems Mission Complete * Submit your story of how you"
date = "2016-01-13T13:00:00Z"
url = "https://www.bsdnow.tv/124"
author = "feedback@bsdnow.tv (JT Pennington)"
text = ""
lastupdated = "2026-03-26T14:37:51.071856984Z"
seen = true
+++

This week on the show, we have a very full news roster to rundown, plus an oldie, but goodie with Igor of the nginx project. That plus all your questions and feedback,

#### [iX Systems Mission Complete](https://www.ixsystems.com/missioncomplete/) ####

* Submit your story of how you accomplished a mission with FreeBSD, FreeNAS, or iXsystems hardware, and you could win monthly prizes, and have your story featured in the FreeBSDJournal! \*\*\*

#### [FreeNAS Logo Design Contest](https://www.ixsystems.com/freenas-logo-contest/) ####

[Rules and Requirements](https://forums.freenas.org/index.php?threads/freenas-logo-design-contest.39968/)

---

#### For those of you curious about Kris' new lighting here are the links to what he is using. ####

* [Softbox Light Diffuser](http://smile.amazon.com/gp/product/B00OTG6474?psc=1&redirect=true&ref_=oh_aui_detailpage_o01_s00&pldnSite=1)
* [Full Spectrum 5500K CFL Bulb](http://smile.amazon.com/gp/product/B00198U6U6?psc=1&redirect=true&ref_=oh_aui_detailpage_o06_s00) \*\*\*

This episode was brought to you by
----------

[![iXsystems - Enterprise Servers and Storage for Open Source](/images/1.png)](http://www.ixsystems.com/bsdnow)[![DigitalOcean - Simple Cloud Hosting, Built for Developers](/images/2.png)](http://www.digitalocean.com/)[![Tarsnap - Online Backups for the Truly Paranoid](/images/3.png)](http://www.tarsnap.com/bsdnow)

---

Headlines
----------

### [Clearing the air ](http://blog.randi.io/2015/12/31/the-developer-formerly-known-as-freebsdgirl/) ###

* A number of you have written in the past few weeks asking why Allan and I didn’t talk about one of the biggest stories to make headlines last week.
* Both of us are quite aware of the details surrounding the incidents between former FreeBSD developers “freebsdgirl” and “xmj”, however the news was still ongoing and we didn’t feel it right to discuss until some of the facts had time to shake out and a more clear (and calm) discussion could be had.
* However, without getting into all the gory details here’s some of the key points that we want to highlight for our listeners. We each have our own thoughts on this.

Kris:

* The FreeBSD that I know has been VERY open and inclusive to all who want to contribute. The saying “Shut up and code” is there for a reason. We’ve seen developers of all types, different race / gender / creed, and the one thing we all have in common is the love for BSD.
* This particular incident has been linked to FreeBSD, which isn’t exactly a fair association, since the project and other members of community were not directly involved. What started out as a disagreement (over something non-BSD related) turned into an ugly slugfest all across social media and (briefly) on a BSD chatroom.
* In this case after reviewing lots of the facts, I think both sides were WAY out of line, and hope they recognize that.
* There has been slamming of the core team and foundation in social media, as somehow the delay / silence is an admission of wrong-doing. Nothing could be further from the truth. These are serious people doing a serious job, and much like BSD they would rather take the time to do it right instead of just going off on social media and making things worse. (Plus they all are volunteers who are spread across many different time-zones)
* Also, if you hear rumors of incidents of harassment, remember that without details all those will ever be is rumors. Obviously those in the project would take any incident like that seriously, but without coming forward and sharing the details it’s impossible to take any action or make changes for the better.

Allan:

* The FreeBSD community is the best group of people I have ever worked with, but that doesn’t mean that it is immune to the same problems that every other group of people faces. As much as all of us wish it didn’t, harassment and other ill-behavior does happen, and must be dealt with
* The FreeBSD Core team has previously sanctioned committers and revoked commit bits for things that happened entirely offline and outside of the FreeBSD community. Part of being a committer is representing the project in everything that you do, so anything you do that reflects badly upon the project is grounds for your removal
* There was something written about this in the project documentation somewhere (that I can not find for the live of me), specifically about the prestige that comes with (or used to) an @freebsd.org account, and how new members of the community need to keep that in mind as they work to earn, and keep, a commit bit
* In this specific situation, I am not sure what core did exactly, we’ll have to wait for their report to find out, but I am not sure what more they could have done.
* “Individual members of core have the power to temporarily suspend commit privileges until core as a whole has the chance to review the issue. Only a 2/3 majority of core has the authority to suspend commit privileges for longer than a week or to remove them permanently. Core's “special powers” only kick in when it acts as a group, not on an individual basis. As individuals, the core team members are all committers first and core second”
* So, an individual member of core can revoke the commit bit of someone who is reported to have acted in a manner not conducive with the rules, but I don’t know how that would have made a difference in this case.
* The only point from Randi’s list of 10 things the project should change that I do not think is possible is #6. As stated in the “Committers' Big List of Rules” that I quoted earlier, the core team can only take action after they have had time for everyone to review and discuss a matter, and then vote on it.
* The core team is made up of 9 people with other responsibilities and commitments. Further, they are currently spread across 6 different countries, and 6 different times zones (even the countries and time zones do not line up).
* We eagerly await Cores report on this matter, and more importantly, Core and the Foundation's work to come up with a better framework and response policy to deal with such situations in the future.
* The important thing is to ensure that incident reports are properly handled, so that those reporting issues feel safe in doing so
* While we hope there is never another incident of harassment in the FreeBSD community, the realities of the world we live in mean we need to be ready to deal with it \*\*\*

### [Dan Langille discussing his rig](https://www.reddit.com/r/homelab/comments/3zv64t/the_home_lab_9_servers_about_98tb_working_url/) ###

* [Pictures of Dan Langille's Home Lab](http://imgur.com/gallery/nuBBD)
* Ever read FreeBSD Diary? How about used FreshPorts or FreshSource? Gone to BSDCan? If so you may be interested in seeing exactly where those sites are served from.
* Dan Langille posts to reddit with information about his home lab, with the obligatory pictures to back it up
* As most good home racks do, this one starts at Home Depot and ends up with a variety of systems and hardware living on it.
* All in all an impressive rig and nice job wiring
* (I wonder what that ASUS RT‑N66U is doing, if it’s running FreeBSD or just an access point??)
* Reminder: Get your BSDCan talk proposal submitted before the deadline, January 19th \*\*\*

### [Pre-5.9 pledge(2) update](http://undeadly.org/cgi?action=article&sid=20160107174436) ###

* Theo gives us a status update on pledge() for pre OpenBSD 5.9“For the next upcoming release, we will disable the 'paths' argument.Reasoning: We have been very busy making as much of the tree set thepromises right in applications, and building a few new promises aswell. We simply don't have enough time to review the kernel code andmake sure it is bug-free. We'll use the next 6 months developmentcycle to decide on paths, and then re-audit the tree to use theinterface where it is suitable. The base tree (/bin /sbin /usr/bin /usr/sbin /usr/libexec /usr/games)contains 652 ELF binaries. 451 use pledge. 201 do not. Approximately47 do not need or cannot use pledge. Leaving 154 we could potentiallypledge in the future. Most of those are not very important. Thereare a few hot spots, but most of what people use has been handled wellby the team.“

[Chromium: now with OpenBSD pledge(2)](http://undeadly.org/cgi?action=article&sid=20160107075227)

* In addition to the pledge news, we also have a story about the Chromium browser being converted to use pledge on OpenBSD.“The renderer, gpu, plugin and utility processes are now using pledge(2)Unfortunately the GPU process only requires an rpath pledge because ofMesa trying to parse two configuration files, /etc/drirc and ${HOME}/.drircSo currently the GPU process will use an rpath pledge in the nextweek or so so that people can test, but this situation has to beresolved because it is not acceptable that a mostly unused configurationfile is being parsed from a library and that stops us from using lesspledges and thus disallowing the GPU process to have read accessto the filesystem ... like your ssh keys.” UPDATE: the rpath pledge has been removed.  
   \*\*\*

iXsystems
----------

* [https://forums.freenas.org/index.php?threads/freenas-logo-design-contest.39968/](https://forums.freenas.org/index.php?threads/freenas-logo-design-contest.39968/)

---

Interview - Igor Sysoev - [igor@sysoev.ru](mailto:igor@sysoev.ru) / [@isysoev](https://twitter.com/isysoev)
----------

NGINX and FreeBSD

---

News Roundup
----------

### [FreeBSD on EdgeRouter Lite - no serial port required](http://www.daemonology.net/blog/2016-01-10-FreeBSD-EdgeRouter-Lite.html) ###

* A few years back there was a neat story on how to setup FreeBSD on the EdgeRouter-Lite
* This last week we get to revisit this, as Colin Percival posts a script, and a very detailed walkthrough of using it to generate your own custom image which does NOT require hooking up a serial cable.
* Currently the script only works on -CURRENT, but may work later for 10.3
* The script is pretty complete, does the buildworld and creation of a USB image for you. It also does a basic firewall configuration and even growfs for expanding to the full-size of your USB media.
* Using the ‘firstboot’ keyword, an rc.d script does all the initial configuration allowing you access to the system
* If you have one, or are looking at switching to a FreeBSD based router, do yourself a favor and take a look at this article. \*\*\*

### [John Marino reaches out to the community for testing of Synth, a new custom package repo builder](http://lists.dragonflybsd.org/pipermail/users/2016-January/228540.html) ###

* A hybrid of poudriere and portmaster/portupgrade
* Uses your regular ports tree and your running system, but built builds packages faster, the poudriere way
* Requires no setup, no downloading or building reference versions of the OS, no checking out yet another copy of the ports tree
* In the future may have support for using binary packages for dependencies, build only the apps you actually want to customize
* Looks very promising \*\*\*

### [OpenBSD malloc finds use-after-free in Android OS ](https://android-review.googlesource.com/#/c/196090/) ###

* Score one for OpenBSD’s rigorous security and attention to detail. We have an interesting commit / comment from Android
* It looks like this particular mistake was found in the uncrypt routines, in particular the using of a variable memory which had already gone out of scope.
* Through the usage of OpenBSD’s malloc junk filling feature, the developers were able to identify and correct the issue.
* Maybe there is a case to be made that this be used more widely, especially during testing? \*\*\*

### [Netflix's async sendfile now in FreeBSD-current](http://www.slideshare.net/facepalmtarbz2/new-sendfile-in-english) ###

* We have some slides presented by Gleb Smirnoff at last years FreeBSD storage summit, talking about changes to sendfile made by Netflix.
* It starts off with a bit of history, showing the misery of life without sendfile(2) back in FreeBSD 1.0, specifically the ftpd daemon.
* Then in 1997 that all changed, HP-UX 11.00 grew the sendfile function, and FreeBSD 3.0 / Linux 2.2 added it in ‘98
* The slides then go into other details, on how the first implementations would map the userland cycle into the kernel. Then in 2004 the SF\_NODISKIO flag was added, followed by changes in 2006 and 2013 to using sbspace() bytes and sending shared memory descriptor data respectively.
* The idea is that instead of the web server waiting for the send to complete, it calls sendfile then goes about its other work, then it gets a notification when the work is done, and finishes up any of the request handling, like logging how many bytes were sent
* The new sendfile implementation took the maximum load of an older netflix box from 25 gigabits/sec to 35 gigabits/sec
* Separately, Netflix has also done work on implementing a TLS version of sendfile(), to streamline the process of sending encrypted data
* There is still a todo list, including making sendfile() play nice with ZFS. Currently files sent via sendfile from ZFS are stored in memory twice, once in the ARC, and once in the buffer cache that sendfile uses \*\*\*

### Beastie Bits ###

* [Unix Timeline of how Unix versions have evolved](http://www.levenez.com/unix/)

* [netmap support now in bhyve in FreeBSD -Current](https://svnweb.freebsd.org/base?view=revision&revision=293459)

* [McCabe complexity and Dragonfly BSD](https://www.dragonflydigest.com/2016/01/12/17478.html)

* [Bourne Basic - a BASIC interpreter implemented (painfully) in pure Bourne shell](https://gist.github.com/cander/2785819)

* [NixOS on FreeBSD](https://github.com/NixOS/nixpkgs/pull/10816#issuecomment-169298385)

* [Turning an ordinary OpenBSD system into a router](http://www.openbsd.org/faq/pf/example1.html)

* [nvidia releases beta 361.16 driver for FreeBSD](https://devtalk.nvidia.com/default/topic/908423/unix-graphics-announcements-and-news/linux-solaris-and-freebsd-driver-361-16-beta-/)

Feedback/Questions
----------

* [ Bryson - SmartOS / KVM / ZFS](http://slexy.org/view/s2BLZeBrSK)
* [ Samba 1969](http://slexy.org/view/s2OQIxkZst)
* [ DO / VPN / PF](http://slexy.org/view/s206j2ekTZ)
* [ Unstable VM / Update](http://slexy.org/view/s20kyrKSH9)

  ---

* Send questions, comments, show ideas/topics, or stories you want mentioned on the show to [feedback@bsdnow.tv](mailto:feedback@bsdnow.tv)

  ---