+++
title = "139: Cheri-picking BSD"
description = "This week, Allan is out of town, but since when has that ever stopped us from bringing you a new episode of BSDNow? We have news,This episode was brought to you by[iXsystems - Enterprise Servers and Storage for Open Source](http://www.ixsystems.com/bsd"
date = "2016-04-27T12:00:00Z"
url = "https://www.bsdnow.tv/139"
author = "feedback@bsdnow.tv (JT Pennington)"
text = ""
lastupdated = "2026-03-26T14:37:51.041946607Z"
seen = true
+++

This week, Allan is out of town, but since when has that ever stopped us from bringing you a new episode of BSDNow? We have news,

This episode was brought to you by
----------

[![iXsystems - Enterprise Servers and Storage for Open Source](/images/1.png)](http://www.ixsystems.com/bsdnow)[![DigitalOcean - Simple Cloud Hosting, Built for Developers](/images/2.png)](http://www.digitalocean.com/)[![Tarsnap - Online Backups for the Truly Paranoid](/images/3.png)](http://www.tarsnap.com/bsdnow)

---

Headlines
----------

### [Unix's file durability problem](https://utcc.utoronto.ca/~cks/space/blog/unix/FileSyncProblem) ###

* Another article by Chris Siebenmann from the University of Toronto
* This time, the issue was a lost comment on his Python based blog which uses files on disk rather than a database
* After an unexpected restart of the system, a recently posted comment no longer existed
* The post goes on to investigate what the ‘right way’ to ensure file durability is
* The answer, as you might expect, is “it depends…”
* Normally, fsync() should work, but it seems with ext4 and some other file systems, you must also fsync() the directory where the file was created, or it might not be possible to find the file after a crash
* Do you need to fsync() the parent of that directory too? Then what is fdatasync() for? What about just calling sync()?
* “One issue is that unlike many other Unix API issues, it's impossible to test to see if you got it all correct and complete. If your steps are incomplete, you don't get any errors; your data is just silently sometimes at risk. Even with a test setup to create system crashes or abrupt power loss (which VMs make much easier), you need uncommon instrumentation to know things like if your OS actually issued disk flushes or just did normal buffered writes. And straightforward testing can't tell you if what you're doing will work all the time, because what is required varies by Unix, kernel version, and the specific filesystem involved.”
* [Second post by author: How I'm trying to do durable disk writes ](https://utcc.utoronto.ca/~cks/space/blog/python/HowISyncDataDWiki)
* [Additional Discussion on Hacker News](https://news.ycombinator.com/item?id=11511269)
* The discussion on HN also gets into AIO and other more complicated facilities, but even those seem to be vague about when your data is actually safe
* At least ZFS ensures you never get half of your new data, and half of your old data. \*\*\*

### [Build a FreeBSD 10.3-release Openstack Image with bsd-cloudinit](https://raymii.org/s/tutorials/FreeBSD_10.3-release_Openstack_Image.html) ###

* Are you using FreeBSD and OpenStack or would you like to be? We next have a great tutorial which explains the ins-and-outs of doing exactly that.  

* Remy van Elst brings us a great walkthrough on his site on how to get started, and hint it involves just a few ‘pip’ commands.
* After getting the initial Python tools bootstrapped, next he shows us how to save our OpenStack settings in a sourceable shell command, which comes in handy before doing admin on a instance.
* Next the ‘glance’ and ‘cinder’ tools are used to upload the target OS ISO file and then create a volume for it to install onto.
* Next the VM is started and some specific steps are outlined on getting FreeBSD 10.3 installed into the instance. It includes some helpful hints as how to fix a mountroot error, if you installed to ada0, but need to mount via vtdb0 instead now.
* After the installation is finished, the prep for ‘cloudinit’ is done, and the resulting image is compressed and made ready for deployment.
* We’ve kinda stepped through some of the more gory steps here, but if OpenStack is something you work with, this tutorial should be at the top of your “must read” list. \*\*\*

### [Undeadly and HTTPS](http://undeadly.org/cgi?action=article&sid=20160411201504) ###

* Undeadly, the OpenBSD journal, is thinking of moving to HTTPS only
* In order to do this, they would like some help rewriting part of the site
* Currently, when you login to post comments, this is done over HTTPS, but to an stunnel instance running a custom script that gives you a cookie, and sends you back to the non-HTTPS site
* They would like to better integrate the authentication system, and otherwise improve the code for the site
* There is some pushback as well, questioning whether it makes sense to block users who are unable to use HTTPS for one reason or another
* I think it makes sense to have the site default to HTTPS, but, maybe HTTPS only doesn’t make sense. There is nothing private on the site, other than the authentication system which is optional, not required to post a comment.
* There is also some discussion about the code for the site, including the fact that when the code was released, the salt for the password database was included
* This is not actually a security problem, but the discussion may be interesting to some viewers \*\*\*

### [FreeBSD Journal March/April Edition ](https://www.freebsdfoundation.org/journal/browser-based-edition/) ###

* The next issue of the FreeBSD Journal is here, and this time it is about Teaching with Operating Systems
* In addition to the usual columns, including: svn update, the ports report, a conference report from FOSDEM, a meetup report from PortsCamp Taipei, A book review of "The Algorithm Design Manual", and the Events Calendar; there are a set of feature articles about teaching
* Teaching with FreeBSD through Tracing, Analysis, and Experimentation
* CHERI: Building a foundation for secure, trusted computing bases
* A brief history of Fast Filesystems
* There is also an interview with Gleb Smirnoff, a member of the Core team, release engineering, and the deputy security officer, as well as a senior software developer at Netflix
* Get the latest issue from your favourite mobile store, or the “Desktop Edition” directly in your browser from the FreeBSD Foundation’s website \*\*\*

Interview - Brooks Davis - [brooks@FreeBSD.org](mailto:brooks@FreeBSD.org) / [@brooksdavis](https://twitter.com/brooksdavis)
----------

* CHERI and Capabilities \*\*\*

[TrueNAS Three-Peats!!!](https://www.ixsystems.com/blog/truenas-three-peats/)

---

News Roundup
----------

### [UbuntuBSD Is Looking To Become An Official Ubuntu Flavor](http://linux.softpedia.com/blog/ubuntubsd-is-looking-to-become-an-official-ubuntu-flavor-502746.shtml) ###

* You may recall a few weeks back that we were a bit surprised by the UbuntuBSD project and its longevity / goals.
* However the project seems to be pushing forward, with news on softpedia.com that they are now seeking to become an ‘official’ Ubuntu Flavor.
* They’ve already released a forth beta, so it seems the project currently has some developers pushing it forward:

>
>
> "I would like to contribute all my work to Ubuntu Community and, if you think it is worthy, make ubuntuBSD an official Ubuntu project like Xubuntu or Edubuntu," said Jon Boden. "If you're interested, please let me know how would you like me to proceed."
>
>
> ---
>

### [It's Just Bits](http://blog.appliedcompscilab.com/its_just_bits/index.html) ###

* We have next an interesting blog post talking about the idea that “It’s just all bits!”
* The author then takes us down the idea of no matter how old or mysterious the code may be, in the end it is ending up as bits arranged a certain way.
* Then the article transitions and takes us through the idea that old bits, and bits that have grown too large should often be good candidates for replacement by “simpler” bits, using OpenBSD as an example.

>
>
> “The OpenBSD community exemplifies this in many ways by taking existing solutions and simplifying them. Processing man pages is as old as Unix, and even in the 21st century OpenBSD has taken the time to rewrite the existing solution to be simpler and safer. It's just bits that need to be turned into other bits. Similarly, OpenBSD has introduced doas as an alternative to sudo. While not replacing sudo entirely, doas makes the 99.99% case of what people use sudo for easier and safer. They are just bits that need to be authenticated. “
>
>

* All in all, a good read, and it reinforces the point that nothing is really truly “finished”. As computing advances and new technologies / practices are made available, sometimes it makes a lot of sense to go back and re-write things in order to simplify the complexity that has snuck in over time. \*\*\*

### [Disk IO limiting is coming to FreeBSD](https://lists.freebsd.org/pipermail/svn-src-head/2016-April/084288.html) ###

* A much requested feature for both Jails and VM’s on FreeBSD has just landed with experimental support in -HEAD, Disk IO limiting!

* The Commit message states as follows:

>
>
> “Add four new RCTL resources - readbps, readiops, writebps and writeiops,  
>  for limiting disk (actually filesystem) IO.
>
>
>
> Note that in some cases these limits are not quite precise. It's ok,  
>  as long as it's within some reasonable bounds.
>
>
>
> Testing - and review of the code, in particular the VFS and VM parts - is  
>  very welcome.”
>
>

* Well, what are you waiting for? This is a fantastic new feature which I’m sure will get incorporated into other tools for controlling jails and VM’s down the road.
* If you give it a spin, be sure to report back bugs so they can get quashed in time for 11. \*\*\*

### BeastieBits ###

* [PC-BSD 10.3 Is the Last in the Series, PC-BSD 11.0 Arrives Later This Year](http://news.softpedia.com/news/pc-bsd-10-3-is-the-last-in-the-series-pc-bsd-11-0-arrives-later-this-year-502570.shtml)

* [ASLR now on by default in NetBSD amd64](http://mail-index.netbsd.org/source-changes/2016/04/10/msg073939.html)

* [Daniel Bilik's fix for hangs on Baytrail](http://lists.dragonflybsd.org/pipermail/users/2016-April/228682.html)

* [Don’t forget about PGCon 2016](http://www.pgcon.org/2016/)

* [Get your paper in for EuroBSDCon 2016, deadline is May 8th](https://2016.eurobsdcon.org/call-for-papers/)

---

Feedback/Questions
----------

* [ John - Destroy all Dataset](http://pastebin.com/QdGWn0TW)
* [ Thomas - Misc Questions](http://pastebin.com/43YkwBjP)
* [ Ben - ZFS Copy](http://pastebin.com/gdi3pswe)  

* [ Bryson - SysV IPC](http://pastebin.com/E9n938D1)
* [ Drin - IPSEC ](http://pastebin.com/bgGTmbDG) \*\*\*