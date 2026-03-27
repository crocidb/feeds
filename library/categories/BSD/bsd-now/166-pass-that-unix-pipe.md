+++
title = "166: Pass that UNIX Pipe"
description = "This week on the show, we’re loaded up with great stories ranging from System call fuzzing, a history of UNIX Pipes, speeding up MySQL imports and more. Stay tuned, BSDNow is coming your way right now.This episode was brought to you by[![iXsystems - Enterprise Servers a"
date = "2016-11-02T12:00:00Z"
url = "https://www.bsdnow.tv/166"
author = "feedback@bsdnow.tv (JT Pennington)"
text = ""
lastupdated = "2026-03-26T14:37:50.984989841Z"
seen = false
+++

This week on the show, we’re loaded up with great stories ranging from System call fuzzing, a history of UNIX Pipes, speeding up MySQL imports and more. Stay tuned, BSDNow is coming your way right now.

This episode was brought to you by
----------

[![iXsystems - Enterprise Servers and Storage for Open Source](/images/1.png)](http://www.ixsystems.com/bsdnow)[![DigitalOcean - Simple Cloud Hosting, Built for Developers](/images/2.png)](http://www.digitalocean.com/)[![Tarsnap - Online Backups for the Truly Paranoid](/images/3.png)](http://www.tarsnap.com/bsdnow)

---

Headlines
----------

### [System call fuzzing of OpenBSD amd64 using TriforceAFL (i.e. AFL and QEMU)](https://github.com/nccgroup/TriforceOpenBSDFuzzer) ###

* The NCCGroup did a series of fuzz testing against the OpenBSD syscall interface, during which they found a number of vulnerabilities, we covered this back in the early summer
* What we didn’t notice, is that they also made the tools they used available.
* A combination of AFL (American Fuzzy Lop), QEMU, OpenBSD’s FlashRD image generation tool, and the “Triforce” driver
* The other requirement is “a Linux box as host to run the fuzzer (other fuzzer hosts may work as well, we've only run TriforceAFL from a Linux host, specifically Debian/Ubuntu”
* It would be interesting to see if someone could get this to run from a BSD host
* It would also be interesting to run the same tests against the other BSDs \*\*\*

### [On the Early History and Impact of Unix: the Introduction of Pipes](http://people.fas.harvard.edu/~lib113/reference/unix/unix2.html) ###

* Pipes are something we just take for granted today, but there was a time before pipes (How did anything get done?)
* Ronda Hauben writes up a great look back at the beginning of UNIX, and specifically at how pipes were born:

>
>
> One of the important developments in Unix was the introduction of pipes. Pipes had been suggested by McIlroy during the early days of creating Unix. Ritchie explains how "the idea, explained one afternoon on a blackboard, intrigued us but failed to ignite any immediate action. There were several objections to the idea as put....What a failure of imagination," he admits.(35) McIlroy concurs, describing how the initial effort to add pipes to Unix occurred about the same time in 1969 that Ritchie, Thompson and Canaday were outlining ideas for a file system. "That was when," he writes, "the simple pipeline as a way to combine programs, with data notationally propagating along a chain of (not necessarily concurrent) filters was articulated."(36) However, pipes weren't implemented in Unix until 1972.
>
>

* We also have a great quote from McIlroy on the day pipes were first introduced:

>
>
> Open Systems! Our Systems! How well those who were there remember the pipe-festooned garret where Unix took form. The excitement of creation drew people to work there amidst the whine of the computer's cool- ing fans, even though almost the same computer ac- cess, could be had from one's office or from home. Those raw quarters saw a procession of memorable events. The advent of software pipes precipitated a day-long orgy of one-liners....As people reveled in the power of functional composition in the large, which is even today unavailable to users of other systems.
>
>

* The paper goes on to talk about the invention of other important tools, such as “grep”, “diff” and more. Well worth your time if you want a glimpse into the history of UNIX \*\*\*

### [Speeding up MySQL Import on FreeBSD](https://blog.feld.me/posts/2016/09/speeding-up-mysql-import-on-freebsd/) ###

* Mark Felder writes a blog post explaining how to speed up MySQL bulk data imports
* “I was recently tasked with rebuilding a readonly slave database server which only slaves a couple of the available databases. The backup/dump is straightforward and fast, but the restore was being excruciatingly slow. I didn't want to wait a week for this thing to finish, so I had to compile a list of optimizations that would speed up the process. This is the best way to do it on FreeBSD, assuming you're working with InnoDB. Additional optimizations may be required if you're using a different database engine.”
* “Please note this is assuming no other databases are running on this MySQL instance. Some of these are rather dangerous and you wouldn't want to put other live data at risk.”
* Most of the changes are meant to be temporary, used on a new server to import a dump of the database, then the settings are to be turned off.
* Specifically:

  * sync\_binlog = 0
  * innodb\_flush\_log\_at\_trx\_commit = 0
  * innodb-doublewrite = 0

* He also prepends the following but of SQL before importing the data:

  * set sql\_log\_bin=0; set autocommit=0; set unique\_checks=0; set foreign\_key\_checks=0;

* You can also help yourself if your MySQL database lives on ZFS

  * zfs set recordsize=16k pool/var/db/mysql
  * zfs set redundant\_metadata=most pool/var/db/mysql

* Remember, this tuning is ONLY for the initial import, leaving these settings on long term risks losing 5-10 seconds of your data if the server reboots unexpectedly

  * zfs set sync=disabled pool/var/db/mysql
  * zfs set logbias=throughput pool/var/db/mysql \*\*\*

### [PostgreSQL and FreeBSD Quick Start](https://cwharton.com/blog/2016/10/postgresql-and-freebsd-quick-start/) ###

* There’s lots of databases to choose from, but Postgres always has a special place on FreeBSD. Today we have a look at a ‘getting started’ guide for those taking the plunge and using it for the first time.
* Naturally getting started will look familiar to many, a couple simple “pkg” and “sysrc” commands later, and you’ll be set.
* After starting the service (With the “service” command) you’ll be ready to start setting up your postgres instance.
* Next up you’ll need to create your initial user/password combo, and a database with access granted to this particular user.
* If you plan to enable remote access to this DB server, you’ll need to make some adjustments to one of the .conf files, allowing other IP’s to connect. (If you are hosting something on the same system, this may not be needed)
* Now yous should be good to go! Enjoy using your brand new Postgres database. If this is your first rodeo, maybe start with something easy, like Apache or Nginx + Wordpress to try it out. \*\*\*

News Roundup
----------

### [OpenBSD vmm hypervisor test drive](https://www.youtube.com/watch?v=KE_7E1pXy5c) ###

* As we asked for a week or two ago, someone has taken OpenBSD’s vmm for a test drive, and made a video of it
* The command line interface for vmm, vmctl, looks quite easy to use. It takes an approach much closer to some of the bhyve management frameworks, rather than bhyve’s rather confusing set of switches
* It also has a config file, the format of which looks very similar to what I designed for bhyveucl, and my first effort to integrate a config file into bhyve itself.
* The video also looks at accessing the console, configuring the networking, and doing an OpenBSD install in a fresh VM
* Currently vmm only supports running OpenBSD VMs \*\*\*

### [FreeBSD Foundation October 2016 Update](https://www.freebsdfoundation.org/wp-content/uploads/2016/10/FreeBSD-Foundation-October-2016-Update.pdf) ###

* Wow, November is already upon us with the Holidays just around the corner. Before things get lost in the noise we wanted to highlight this update from the FreeBSD foundation.
* Before getting into the stories, they helpfully provide a list of upcoming conferences for this fall/winter, which includes a couple of USENIX gatherings, and the Developer Summit / MeetBSD next week. +The foundation gives us a quick hardware update initially, discussing some of the new ThunderX Cavium servers which are deployed (ARMv8 64Bit) and yes I’m drooling a bit. They also mention that work is ongoing for the RPi3 platform and PINE64.
* GNN also has an article reprinted from the FreeBSD journal, talking about the achievement of making it to 11.0 over the span of 23 years now. Of course he mentions that the foundation is open to all, and welcomes donations to continue to keep up this tradition of good work being done.
* Deb Goodkin gives us an update on the “Grace Hopper” convention that took place in Houston TX several weeks back. Roughly 14k women in Tech attended, which is a great turnout, and FreeBSD was well represented there.
* Next we have a call to potential speakers, don’t forget that there are plenty of places you can help present about FreeBSD, not just at \*BSD centered conferences, but the SCALES of the world as well.
* We wrap up with a look at EuroBSDCon 2016, quite a nice writeup, again brought to us by Deb at the foundation, and includes a list of some of those recognized for their contributions to FreeBSD. \*\*\*

### [Adhokku – a toy PaaS powered by FreeBSD jails and Ansible](https://github.com/adhokku/adhokku) ###

* Described as a toy Platform-as-a-Service, Adhokku is an ansible based automated jail creation framework
* Based on the concept of Dokku, a single-host open source PaaS for Linux powered by Docker

>
>
> When you deploy an application using Adhokku, Adhokku creates a new jail on the remote host and provisions it from a fixed clean state using the instructions in the Jailfile in your Git repository. All jails sit behind a reverse proxy that directs traffic to one of them based on the domain name or the IP address in the HTTP request. When a new jail has been provisioned for an application, Adhokku seamlessly reconfigures the reverse proxy to send traffic to it instead of the one currently active for that application.
>
>
>
> The following instructions show how to get Adhokku and an example application running in a VM on your development machine using Vagrant. This process should require no FreeBSD-specific knowledge, through modifying the Jailfile to customize the application may.
>
>

* This seems like an interesting project, and it is good to see people developing workflows so users familiar with docker etc, can easily use BSD instead \*\*\*

### [Installing OpenBSD 6.0 on your laptop is really hard (not)](http://sohcahtoa.org.uk/openbsd.html) ###

* OpenBSD on a laptop? Difficult? Not hardly.
* We have a great walkthrough by Keith Burnett, which demonstrates just how easy it can be to get up and running with an XFCE desktop from a fresh OpenBSD installation.
* For those curious,this was all done with a Thinkpad X60 and 120GB SSD and OpenBSD 6.0.
* He doesn’t really cover the install process itself, that is well covered by the link to the OpenBSD FAQ pages.
* Once the system is up and running though, we start with the most important portion, getting working internet access (Via wifi)
* Really just a few ‘ifconfig’ commands later and we are in business.
* Step 2 was getting the package configuration going. (I’ve never understood why this is still a thing, but no fret, its easy enough to do)
* With package repos available, now you can grab the binaries for XFCE and friends with just a few simple “pkg\_add” commands
* Steps 4-6 are some specific bits to enable XFCE services, and some handy things such as setting doas permissions to get USB mounting working (For graphical mount/unmount)
* Lastly, keeping the system updated is important, so we have a nice tutorial on how to do that as well, using a handy “openup” script, which takes some of the guesswork out of it.
* Bonus! Steps for doing FDE as also included, which isn’t for everyone, but you may want it \*\*\*

Beastie Bits
----------

* [Pi-top with RPi-3 and FreeBSD HEAD](https://twitter.com/gvnn3/status/791475373380804608)
* [NetBSD 7.0.2 released](http://blog.netbsd.org/tnf/entry/netbsd_7_0_1_released1)
* [DragonflyBSD - git: kernel - Fix mmcsd read/write issues](http://lists.dragonflybsd.org/pipermail/commits/2016-October/624851.html)
* [A char device which implements an Enigma machine (FreeBSD & Linux)](https://github.com/rafael-santiago/dev-enigma) \*\*\*

Feedback/Questions
----------

* [ Matt - System Monitoring](http://pastebin.com/ayzvCuaq)
* [ Tony - LLVM License](http://pastebin.com/r5axPSE7)
* [ Ben - Thanks](http://pastebin.com/MNxCvUtX)
* [ David - Write Cache ](http://pastebin.com/RswFASqW)
* [ Charles - Fonts](http://pastebin.com/e317a32f) \*\*\*