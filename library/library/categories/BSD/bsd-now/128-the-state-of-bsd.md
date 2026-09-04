+++
title = "128: The State of BSD"
description = "This week on BSDNow, we interview Nick Wolff about how FreeBSD is used across the State of Ohio and some of the specific technology used. That, plus the latest news is coming your way right now on BSDNow, the place toThis episode was brought to you by[![iXsystems - Ente"
date = "2016-02-10T13:00:00Z"
url = "https://www.bsdnow.tv/128"
author = "feedback@bsdnow.tv (JT Pennington)"
text = ""
lastupdated = "2026-03-26T14:37:51.063739471Z"
seen = true
+++

This week on BSDNow, we interview Nick Wolff about how FreeBSD is used across the State of Ohio and some of the specific technology used. That, plus the latest news is coming your way right now on BSDNow, the place to

This episode was brought to you by
----------

[![iXsystems - Enterprise Servers and Storage for Open Source](/images/1.png)](http://www.ixsystems.com/bsdnow)[ title="DigitalOcean"\>![DigitalOcean - Simple Cloud Hosting, Built for Developers](/images/2.png)](http://www.digitalocean.com/)[![]() src="/images/3.png" alt="Tarsnap - Online Backups for the Truly Paranoid" /\>](http://www.tarsnap.com/bsdnow)

---

Headlines
----------

### [Doc like an Egyptian: Managing project documentation with Sphinx](https://opensource.com/business/16/1/scale-14x-interview-dru-lavigne) ###

* In case you didn’t make it out to SCALE a few weeks back, we have a great interview with Dru Lavigne over at OpenSource.com which goes over her talk on “Doc like an Egyptian”.
* In particular she discusses the challenges of running a wiki for documentation for PC-BSD and FreeNAS which prompted the shift to using Sphinx instead.

>
>
> “While the main purpose of a wiki is to invite user contributions and to provide a low barrier to entry, very few people come to write documentation (however, every spambot on the planet will quickly find your wiki, which creates its own set of maintenance issues).
>
>
>
> Wikis are designed for separate, one-ish page infobytes, such as how-tos. They really aren't designed to provide navigation in a Table of Contents or to provide a flow of Chapters, though you can hack your pages to provide navigational elements to match the document's flow. This gets more difficult as the document increases in size—our guides tend to be 300+ pages. It becomes a nightmare as you try to provide versioned copies of each of those pages so that the user is finding and reading the right page for their version of software.
>
>
>
> While wiki translation extensions are available, how to configure them is not well documented, their use is slow and clunky, and translated pages only increase the number of available pages, getting you back to the problems in the previous bullet. This is a big deal for projects that have a global audience.
>
>
>
> While output-generation wiki extensions are available (for example, to convert your wiki pages to HTML or PDF), how to configure them is not well documented, and they provide very little control for the layout of the generated format. This is a big deal for projects that need to make their documentation available in multiple formats.“
>
>

* She then discusses some of the hurdles of migration from the Wiki to Sphinx, and follows up with some of the differences using Sphinx you should be aware of for any documentation project.

>
>
> “While Sphinx is easy to learn, it does have its quirks. For example, it does not support stacked tags. This means, for example, you can not bold italic a phrase using tags—to achieve that requires a CSS workaround. And, while Sphinx does have extensive documentation, a lot of it assumes you already know what you are doing. When you don't, it can be difficult to find an example that does what you are trying to achieve.
>
>
>
> Sphinx is well suited for projects with an existing repository—say, on github—a build infrastructure, and contributors who are comfortable with using text editors and committing to the repo (or creating, say, git pull requests).“
>
>

---

### [Initial FreeBSD RISC-V Architecture Port Committed.](http://freebsdfoundation.blogspot.com/2016/02/initial-freebsd-risc-v-architecture.html) ###

* Touching on a story we mentioned a few weeks back, we have a blog post from from Annie over at the FreeBSD foundation talking about the details behind the initial support for RISC-V.
* To start us off, you may be wondering what is RISC-V and what makes it special?RISC-V is an exciting new open-source Instruction-Set Architecture (ISA) developed at the University of California at Berkeley, which is seeing increasing interest in the embedded systems and hardware-software research communities.
* Currently the improvements allows booting FreeBSD in the Spike simulator, from the university of Berkeley, with enough reliability to do various things, such as SSH, shell, mail, etc.
* The next steps include getting multi-core support working, and getting it working in simulations of Cambridge’s open-source LowRISC System-on-Chip functioning, and ready for early hardware.
* Both ports and packages are expected to land in the coming days, so if you love hacking on branch new architectures, this may be your time to jump in. \*\*\*

### [FreeBSD Bhyve hypervisor supporting Windows UEFI guests ](https://svnweb.freebsd.org/base?view=revision&revision=295124) ###

* If you have not been following bhyve lately, you’re in for a treat when FreeBSD 10.3 ships in the coming weeks
* bhyve now supports UEFI and CSM booting, in addition to its existing FreeBSD userboot loader, and grub-bhyve port
* The EFI support allows Windows guests to be run on FreeBSD
* Due to the lack of graphics, this requires making a custom .iso to do an ‘Unattended Install’ of Windows, but this is easily done just editing and including a .xml file
* The bootrom can now allocate memory
* Added some SATA command emulations (no-op)
* Increased the number of virtio-blk indirect descriptors
* Added a Firmware guest query interface
* Add -l option to specify userboot path [FreeBSD Bhyve Hypervisor Running Windows Server 2012 R2 Standard](https://jameslodge.com/freebsd-bhyve-hypervisor-running-windows-server-2012-r2-standard/)
* In related news, [TidalScale officially released their product today ](http://www.prnewswire.com/news-releases/tidalscale-releases-its-system-scaling-hyperkernel-300216105.html)
* TidalScale is a commercial product based on bhyve that allows multiple physical machines to be combined into a single massive virtual machine, with the combined processor power, memory, disk I/O, and network capacity of all of the machines \*\*\*

### [FreeBSD TACACS+ GNS3 and Cisco 3700 Router](http://www.unixmen.com/freebsd-tacacs-gns3-and-cisco-3700-router/) ###

* “TACACS+ – (Terminal Access Controller Access Control System plus) — is a session protocol developed by Cisco.”
* This tutorial covers configuring FreeBSD and the tac\_plus4 port to act as an authentication, authorization, and accounting server for Cisco routers
* The configuration of FreeBSD, the software, and the router are covered
* It also includes how to set the FreeBSD server up as a VM on windows, and bridge it to the network
* I am sure there are some network administrators out there that would appreciate this \*\*\*

Interview - Nick Wolff - [darkfiberiru@gmail.com](mailto:darkfiberiru@gmail.com) / [@darkfiberiru](https://twitter.com/darkfiberiru)
----------

---

News Roundup
----------

### [Papers We Love Presents : Bryan Cantrill on Jails & Solaris Zones](http://lists.nycbug.org/pipermail/talk/2016-February/016495.html) ###

* The folks over at NYCBug point us to “Papers We Love”, a New York based meetup group where past papers are presented. They have a talk scheduled for tomorrow (Feb 11th) with Bryan Cantrill discussing Jails and Solaris Zones
* The talk starts at 7PM at the Tumblr building, located between 5th and Park Ave South on 21st street
* “We're **crazy** excited to have Bryan Cantrill, CTO of Joyent, formerly of Sun Microsystems, presenting on [Jails: Confining the omnipotent root](https://us-east.manta.joyent.com/bcantrill/public/ppwl-cantrill-jails.pdf). by Poul-Henning Kamp and Robert Watson and [Solaris Zones: Operating System Support for Consolidating Commercial Workloads](https://us-east.manta.joyent.com/bcantrill/public/ppwl-cantrill-zones.pdf) by Dan Price and Andy Tucker!”
* The abstract posted gives us a sneak peak of what to expect, first covering jails as a method to “partition” the operating system environment, but maintaining the UNIX “root” model.
* Next it looks like he will compare and contrast with the Solaris Zones functionality, which creates virtualized application execution environments, within the single OS instance.
* Sounds like a fantastic talk, hopefully somebody remembers to record and post it for us to enjoy later!
* There will not be a live stream, but a video of the event should appear online after it has been edited \*\*\*

### [FreeBSD Storage Summit](https://wiki.freebsd.org/201602StorageSummit) ###

* The FreeBSD Foundation will be hosting a Storage Summit, co-located at the USENIX FAST (Filesystems And Storage Technology) conference
* Developers and Vendors are invited to work on storage related issues
* This summit will be a hackathon focused event, rather than a discussion focused devsummit
* After setup and introductions, the summit will start with a “Networking Synergies Panel”, to discuss networking as it relates to storage
* After a short break, the attendees will break up into a number of working groups focused on solving actual problems
* The current working groups include:
* CAM Scheduling & Locking, led by Justin Gibbs: “Updating CAM queuing/scheduling and locking models to minimize cross-cpu contention and support multi-queue controllers”
* ZFS, led by Matt Ahrens: topics will include enabling the new cryptographic hashes supported by OpenZFS on FreeBSD, Interaction with the kernel memory subsystem, and other upcoming features.
* User Space Storage Stack, led by George Neville-Neil
* This event offers a unique opportunity for developers and vendors from the storage industry to meet at an event they will likely already be attending \*\*\*

### [Tor Browser 5.5 for OpenBSD/amd64 -current is completed](http://lists.nycbug.org/pipermail/talk/2016-February/016514.html) ###

* “The Tor BSD Diversity Project (TDP) is proud to announce the release of Tor Browser (TB) version 5.5 for OpenBSD. Please note that this version of TB remains in development mode, and is not meant to ensure strong privacy, anonymity or security.”
* “TDP ([https://torbsd.github.io](https://torbsd.github.io)) is an effort to extend the use of the BSD Unixes into the Tor ecosystem, from the desktop to the network. TDP is focused on diversifying the Tor network, with TB being the flagship project. Additional efforts are made to increase the number of \*BSD relays on the Tor network among other sub-projects”
* Help test the new browser bundle, or help diversify the Tor network \*\*\*

### [“FreeBSD Mastery: Advanced ZFS” Table of Contents](http://blather.michaelwlucas.com/archives/2548) ###

* We brought you the news about sponsoring the Advanced ZFS book that MWL is working on, now Michael has given us the tentative chapter layout of the (sure to be a classic) tome coming from him and Allan.

  * 0: Introduction
  * 1: Boot Environments
  * 2: Delegation and Jails
  * 3: Sharing
  * 4: Replication
  * 5: zvols
  * 6: Advanced Hardware
  * 7: Caches
  * 8: Performance
  * 9: Tuning
  * 10: ZFS Potpourri

* In addition to the tease about the upcoming book, michael has asked the community for assistance in coming up with the cover art for it as well.

* In particular it should probably be in-line with his previous works, with a parody of some other classic art-work.

* If you have something, go tweet out to him at @mwlauthor

  ---

### Beastie Bits ###

* [Online registration for AsiaBSDCon 2016 now open *SOON*](https://2016.asiabsdcon.org/index.html.en)

* [BhyveCon 2016](http://bhyvecon.org/)

* [NYC\*BUG shell-fu talk slides](http://www.nycbug.org/index.cgi?action=view&id=10640)

* [Possible regression in DragonFly i915 graphics on older Core2Duos ](http://lists.dragonflybsd.org/pipermail/users/2016-February/228597.html)

* [Videos from FOSDEM 2016. BSD dev room was k4601](http://video.fosdem.org/2016/)

---

Feedback/Questions
----------

* [ Andrew - SMART Tests](http://slexy.org/view/s2F39XEu9w)
* [ JT - Secure File Delete](http://slexy.org/view/s20kk6lzc9)
* [ Jordan - Migrate](http://slexy.org/view/s21zjZ0ci8)
* [ Lars - Pros and Cons of VM](http://slexy.org/view/s2Hqbt0Uq8)
* [ Alex - IPSEC](http://slexy.org/view/s2HnO1hxSO) \*\*\*