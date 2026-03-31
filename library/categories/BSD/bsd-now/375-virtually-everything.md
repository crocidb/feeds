+++
title = "375: Virtually everything"
description = "bhyve - The FreeBSD Hypervisor, udf information leak, being a vim user instead of classic vi, FreeBSD on ESXi ARM Fling: Fixing Virtual Hardware, new FreeBSD Remote Process Plugin in LLDB, OpenBSD Laptop, and more.NOTES   This episode of BSDNow is brought to you by [Tarsnap"
date = "2020-11-05T11:00:00Z"
url = "https://www.bsdnow.tv/375"
author = "feedback@bsdnow.tv (JT Pennington)"
text = ""
lastupdated = "2026-03-26T14:37:50.501640451Z"
seen = true
+++

bhyve - The FreeBSD Hypervisor, udf information leak, being a vim user instead of classic vi, FreeBSD on ESXi ARM Fling: Fixing Virtual Hardware, new FreeBSD Remote Process Plugin in LLDB, OpenBSD Laptop, and more.

***NOTES***  
 This episode of BSDNow is brought to you by [Tarsnap](https://www.tarsnap.com/bsdnow)

Headlines
----------

### [bhyve - The FreeBSD Hypervisor](https://klarasystems.com/articles/bhyve-the-freebsd-hypervisor/) ###

>
>
> FreeBSD has had varying degrees of support as a hypervisor host throughout its history. For a time during the mid-2000s, VMWare Workstation 3.x could be made to run under FreeBSD’s Linux Emulation, and Qemu was ported in 2004, and later the kQemu accelerator in 2005. Then in 2009 a port for VirtualBox was introduced. All of these solutions suffered from being a solution designed for a different operating system and then ported to FreeBSD, requiring constant maintenance.
>
>
> ---
>
>
> ### ZFS and FreeBSD Support ###
>
>
>
> Klara offers flexible Support Subscriptions for your ZFS and FreeBSD infrastructure. Get a world class team of experts to back you up. [Check it out on our website!](https://klarasystems.com/support/)
>
>

### [udf info leak](https://gist.github.com/CTurt/a00fb4164e13342567830b052aaed94b) ###

>
>
> FreeBSD UDF driver info leak  
>  Analysis done on FreeBSD release 11.0 because that's what I had around.
>
>
>
> * [Fix committed to FreeBSD](https://svnweb.freebsd.org/changeset/base/366005) \*\*\*
>
>

News Roundup
----------

### [I'm now a user of Vim, not classical Vi (partly because of windows)](https://utcc.utoronto.ca/~cks/space/blog/unix/VimNowAUser) ###

>
>
> In the past I've written entries (such as this one) where I said that I was pretty much a Vi user, not really a Vim user, because I almost entirely stuck to Vi features. In a comment on my entry on not using and exploring Vim features, rjc reinforced this, saying that I seemed to be using vi instead of vim (and that there was nothing wrong with this). For a long time I thought this way myself, but these days this is not true any more. These days I really want Vim, not classical Vi.
>
>
> ---
>
>
> ### [FreeBSD on ESXi ARM Fling: Fixing Virtual Hardware](https://vincerants.com/freebsd-on-esxi-arm-fling-fixing-virtual-hardware/) ###
>
>
>
> With the current state of FreeBSD on ARM in general, a number of hardware drivers are either set to not auto-load on boot, or are entirely missing altogether. This page is to document my findings with various bits of hardware, and if possible, list fixes.
>
>
> ---
>
>
> ### [Introduction of a new FreeBSD Remote Process Plugin in LLDB](https://www.moritz.systems/blog/introduction-of-a-new-freebsd-remote-process-plugin-in-lldb/) ###
>
>
>
> Moritz Systems have been contracted by the FreeBSD Foundation to modernize the LLDB debugger’s support for FreeBSD. We are writing a new plugin utilizing the more modern client-server layout that is already used by Darwin, Linux, NetBSD and (unofficially) OpenBSD. The new plugin is going to gradually replace the legacy one.
>
>

---

### [OpenBSD Laptop](https://functionallyparanoid.com/2020/10/14/openbsd-laptop/) ###

>
>
> Hi, I know it’s been a while. I recently had to nuke and re-pave my personal laptop and I thought it would be a nice thing to share with the community how I set up OpenBSD on it so that I have a useful, modern, secure environment for getting work done. I’m not going to say I’m the expert on this or that this is the BEST way to set up OpenBSD, but I thought it would be worthwhile for folks doing Google searches to at least get my opinion on this. So, given that, let’s go…
>
>
> ---
>

### Tarsnap ###

* This weeks episode of BSDNow was sponsored by our friends at Tarsnap, the only secure online backup you can trust your data to. Even paranoids need backups.

Feedback/Questions
----------

* [Ethan - Linux user wanting to try out OpenBSD](<https://github.com/BSDNow/bsdnow.tv/blob/master/episodes/375/feedback/Ethan - Linux user wanting to try out OpenBSD.md>)
* [iian - Learning IT](<https://github.com/BSDNow/bsdnow.tv/blob/master/episodes/375/feedback/iian - Learning IT.md>)
* [johnny - bsd swag](<https://github.com/BSDNow/bsdnow.tv/blob/master/episodes/375/feedback/johnny - bsd swag.md>)

---

* Send questions, comments, show ideas/topics, or stories you want mentioned on the show to [feedback@bsdnow.tv](mailto:feedback@bsdnow.tv) \*\*\*