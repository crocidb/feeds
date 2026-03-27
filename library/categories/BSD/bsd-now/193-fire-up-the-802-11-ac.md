+++
title = "193: Fire up the 802.11 AC"
description = "This week on BSD Now, Adrian Chadd on bringing up 802.11ac in FreeBSD, a PFsense and OpenVPN tutorial, and we talk about an interesting ZFS storage pool checkpoint project.This episode was brought to you by[![iXsystems - Enterprise Servers and Storage for Open Source](/"
date = "2017-05-10T12:00:00Z"
url = "https://www.bsdnow.tv/193"
author = "feedback@bsdnow.tv (JT Pennington)"
text = ""
lastupdated = "2026-03-26T14:37:50.899323947Z"
seen = false
+++

This week on BSD Now, Adrian Chadd on bringing up 802.11ac in FreeBSD, a PFsense and OpenVPN tutorial, and we talk about an interesting ZFS storage pool checkpoint project.

This episode was brought to you by
----------

[![iXsystems - Enterprise Servers and Storage for Open Source](/images/1.png)](http://www.ixsystems.com/bsdnow)[![DigitalOcean - Simple Cloud Hosting, Built for Developers](/images/2.png)](http://www.digitalocean.com/)[![Tarsnap - Online Backups for the Truly Paranoid](/images/3.png)](http://www.tarsnap.com/bsdnow)

---

Headlines
----------

### [Bringing up 802.11ac on FreeBSD](http://adrianchadd.blogspot.com/2017/04/bringing-up-80211ac-on-freebsd.html) ###

* Adrian Chadd has a new blog post about his work to bring 802.11ac support to FreeBSD
* 802.11ac allows for speeds up to 500mbps and total bandwidth into multiple gigabits

>
>
> The FreeBSD net80211 stack has reasonably good 802.11n support, but no 802.11ac support. I decided a while ago to start adding basic 802.11ac support. It was a good exercise in figuring out what the minimum set of required features are and another excuse to go find some of the broken corner cases in net80211 that needed addressing.  
>  802.11ac introduces a few new concepts that the stack needs to understand. I decided to use the QCA 802.11ac parts because (a) I know the firmware and general chip stuff from the first generation 11ac parts well, and (b) I know that it does a bunch of stuff (like rate control, packet scheduling, etc) so I don't have to do it. If I chose, say, the Intel 11ac parts then I'd have to implement a lot more of the fiddly stuff to get good behaviour.  
>  Step one - adding VHT channels. I decided in the shorter term to cheat and just add VHT channels to the already very large ieee80211\_channel map. The linux way of there being a channel context rather than hundreds of static channels to choose from is better in the long run, but I wanted to get things up and running. So, that's what I did first - I added VHT flags for 20, 40, 80, 80+80 and 160MHz operating modes and I did the bare work required to populate the channel lists with VHT channels as well.  
>  Then I needed to glue it into an 11ac driver. My ath10k port was far enough along to attempt this, so I added enough glue to say "I support VHT" to the ic\_caps field and propagated it to the driver for monitor mode configuration. And yes, after a bit of dancing, I managed to get a VHT channel to show up in ath10k in monitor mode and could capture 80MHz wide packets. Success!
>
>
>
> By far the most fiddly was getting channel promotion to work. net80211 supports the concept of dumb NICs (like atheros 11abgn parts) very well, where you can have multiple virtual interfaces but the "driver" view of the right configuration is what's programmed into the hardware. For firmware NICs which do this themselves (like basically everything sold today) this isn't exactly all that helpful. So, for now, it's limited to a single VAP, and the VAP configuration is partially derived from the global state and partially derived from the negotiated state. It's annoying, but it is adding to the list of things I will have to fix later.  
>  the QCA chips/firmware do 802.11 crypto offload. They actually pretend that there's no key - you don't include the IV, you don't include padding, or anything. You send commands to set the crypto keys and then you send unencrypted 802.11 frames (or 802.3 frames if you want to do ethernet only.) This means that I had to teach net80211 a few things:
>
>
>
> * frames decrypted by the hardware needed to have a "I'm decrypted" bit set, because the 802.11 header field saying "I'm decrypted!" is cleared
> * frames encrypted don't have the "i'm encrypted" bit set
> * frames encrypted/decrypted have no padding, so I needed to teach the input path and crypto paths to not validate those if the hardware said "we offload it all." Now comes the hard bit of fixing the shortcomings before I can commit the driver. There are .. lots. The first one is the global state. The ath10k firmware allows what they call 'vdevs' (virtual devices) - for example, multiple SSID/BSSID support is implemented with multiple vdevs. STA+WDS is implemented with vdevs. STA+P2P is implemented with vdevs. So, technically speaking I should go and find all of the global state that should really be per-vdev and make it per-vdev. This is tricky though, because a lot of the state isn't kept per-VAP even though it should be. Anyway, so far so good. I need to do some of the above and land it in FreeBSD-HEAD so I can finish off the ath10k port and commit what I have to FreeBSD. There's a lot of stuff coming - including all of the wave-2 stuff (like multiuser MIMO / MU-MIMO) which I just plainly haven't talked about yet. Viva la FreeBSD wireless! \*\*\*
>
>

### [pfSense and OpenVPN Routing](http://www.terrafoundry.net/blog/2017/04/12/pfsense-openvpn/) ###

>
>
> This article tries to be a simple guide on how to enable your home (or small office) [[https://www.pfsense.org/](pfSense)](https://www.pfsense.org/](pfSense)) setup to route some traffic via the vanilla Internet, and some via a VPN site that you’ve setup in a remote location.
>
>

* Reasons to Setup a VPN:
  * Control
  * Security
  * Privacy
  * Fun

>
>
> VPNs do not instantly guarantee privacy, they’re a layer, as with any other measure you might invoke. In this example I used a server that’s directly under my name. Sure, it was a country with strict privacy laws, but that doesn’t mean that the outgoing IP address wouldn’t be logged somewhere down the line.  
>  There’s also no reason you have to use your own OpenVPN install, there are many, many personal providers out there, who can offer the same functionality, and a degree of anonymity. (If you and a hundred other people are all coming from one IP, it becomes extremely difficult to differentiate, some VPN providers even claim a ‘logless’ setup.)  
>  VPNs can be slow. The reason I have a split-setup in this article, is because there are devices that I want to connect to the internet quickly, and that I’m never doing sensitive things on, like banking. I don’t mind if my Reddit-browsing and IRC messages are a bit slower, but my Nintendo Switch and PS4 should have a nippy connection.  
>  Services like Netflix can and do block VPN traffic in some cases. This is more of an issue for wider VPN providers (I suspect, but have no proof, that they just blanket block known VPN IP addresses.)  
>  If your VPN is in another country, search results and tracking can be skewed. This is arguable a good thing, who wants to be tracked? But it can also lead to frustration if your DuckDuckGo results are tailored to the middle of Paris, rather than your flat in Birmingham.
>
>

* The tutorial walks through the basic setup: Labeling the interfaces, configuring DHCP, creating a VPN:

>
>
> Now that we have our OpenVPN connection set up, we’ll double check that we’ve got our interfaces assigned  
>  With any luck (after we’ve assigned our OPENVPN connection correctly, you should now see your new Virtual Interface on the pfSense Dashboard  
>  We’re charging full steam towards the sections that start to lose people. Don’t be disheartened if you’ve had a few issues up to now, there is no “right” way to set up a VPN installation, and it may be that you have to tweak a few things and dive into a few man-pages before you’re set up.  
>  NAT is tricky, and frankly it only exists because we stretched out IPv4 for much longer than we should have. That being said it’s a necessary evil in this day and age, so let’s set up our connection to work with it.  
>  We need NAT here because we’re going to masque our machines on the LAN interface to show as coming from the OpenVPN client IP address, to the OpenVPN server. Head over to Firewall -\> NAT -\> Outbound.  
>  The first thing we need to do in this section, is to change the Outbound NAT Mode to something we can work with, in this case “Hybrid.”
>
>

* Configure the LAN interface to be NAT’d to the OpenVPN address, and the INSECURE interface to use your regular ISP connection
* Configure the firewall to allow traffic from the LAN network to reach the INSECURE network
* Then add a second rule allowing traffic from the LAN network to any address, and set the gateway the the OPENVPN connection
* And there you have it, traffic from the LAN is routed via the VPN, and traffic from the INSECURE network uses the naked internet connection \*\*\*

### [Switching to OpenBSD](https://mndrix.blogspot.co.uk/2017/05/switching-to-openbsd.html) ###

>
>
> After 12 years, I switched from macOS to OpenBSD. It's clean, focused, stable, consistent and lets me get my work done without any hassle.  
>  When I first became interested in computers, I thought operating systems were fascinating. For years I would reinstall an operating system every other weekend just to try a different configuration: MS-DOS 3.3, Windows 3.0, Linux 1.0 (countless hours recompiling kernels). In high school, I settled down and ran OS/2 for 5 years until I graduated college. I switched to Linux after college and used it exclusively for 5 years. I got tired of configuring Linux, so I switched to OS X for the next 12 years, where things just worked.  
>  But Snow Leopard was 7 years ago. These days, OS X is like running a denial of service attack against myself. macOS has a dozen apps I don't use but can't remove. Updating them requires a restart. Frequent updates to the browser require a restart. A minor XCode update requires me to download a 4.3 GB file. My monitors frequently turn off and require a restart to fix. A system's [availability is a function](http://techthoughts.typepad.com/managing_computers/2007/11/availability-mt.html) of mean time between failure and mean time to repair. For macOS, both numbers are heading in the wrong direction for me. I don't hold any hard feelings about it, but it's time for me to get off this OS and back to productive work.  
>  I found OpenBSD very refreshing, so I created a bootable thumb drive and within an hour had it up and running on a two-year old laptop. I've been using it for my daily work for the past two weeks and it's been great. Simple, boring and productive. Just the way I like it. The documentation is fantastic. I've been using Unix for years and have learned quite a bit just by reading their man pages. OS releases come like clockwork every 6 months and are supported for 12. Security and other updates seem relatively rare between releases (roughly one small patch per week during 6.0). With syspatch in 6.1, installing them should be really easy too.
>
>
> ---
>

### [ZFS Storage Pool Checkpoint Project](https://sdimitro.github.io/post/zpool-checkpoint) ###

>
>
> During the OpenZFS summit last year (2016), Dan Kimmel and I quickly hacked together the zpool checkpoint command in ZFS, which allows reverting an entire pool to a previous state. Since it was just for a hackathon, our design was bare bones and our implementation far from complete. Around a month later, we had a new and almost complete design within Delphix and I was able to start the implementation on my own. I completed the implementation last month, and we’re now running regression tests, so I decided to write this blog post explaining what a storage pool checkpoint is, why we need it within Delphix, and how to use it.  
>  The Delphix product is basically a VM running DelphixOS (a derivative of illumos) with our application stack on top of it. During an upgrade, the VM reboots into the new OS bits and then runs some scripts that update the environment (directories, snapshots, open connections, etc.) for the new version of our app stack. Software being software, failures can happen at different points during the upgrade process. When an upgrade script that makes changes to ZFS fails, we have a corresponding rollback script that attempts to bring ZFS and our app stack back to their previous state. This is very tricky as we need to undo every single modification applied to ZFS (including dataset creation and renaming, or enabling new zpool features).  
>  The idea of Storage Pool Checkpoint (aka zpool checkpoint) deals with exactly that. It can be thought of as a “pool-wide snapshot” (or a variation of extreme rewind that doesn’t corrupt your data). It remembers the entire state of the pool at the point that it was taken and the user can revert back to it later or discard it. Its generic use case is an administrator that is about to perform a set of destructive actions to ZFS as part of a critical procedure. She takes a checkpoint of the pool before performing the actions, then rewinds back to it if one of them fails or puts the pool into an unexpected state. Otherwise, she discards it. With the assumption that no one else is making modifications to ZFS, she basically wraps all these actions into a “high-level transaction”.
>
>

* I definitely see value in this for the appliance use case
* Some usage examples follow, along with some caveats.
* One of the restrictions is that you cannot attach, detach, or remove a device while a checkpoint exists. However, the zpool add operation is still possible, however if you roll back to the checkpoint, the device will no longer be part of the pool. Rather than a shortcoming, this seems like a nice feature, a way to help users avoid the most common foot shooting (which I witnessed in person at Linux Fest), adding a new log or cache device, but missing a keyword and adding it is a storage vdev rather than a aux vdev. This operation could simply be undone if a checkpoint where taken before the device was added. \*\*\*

News Roundup
----------

### [Review of TrueOS](https://distrowatch.com/weekly.php?issue=20170501#trueos) ###

>
>
> TrueOS, which was formerly named PC-BSD, is a FreeBSD-based operating system. TrueOS is a rolling release platform which is based on FreeBSD's "CURRENT" branch, providing TrueOS with the latest drivers and features from FreeBSD. Apart from the name change, TrueOS has deviated from the old PC-BSD project in a number of ways. The system installer is now more streamlined (and I will touch on that later) and TrueOS is a rolling release platform while PC-BSD defaulted to point releases. Another change is PC-BSD used to allow the user to customize which software was installed at boot time, including the desktop environment. The TrueOS project now selects a minimal amount of software for the user and defaults to using the Lumina desktop environment.
>
>

* From the conclusions:

>
>
> What I took away from my time with TrueOS is that the project is different in a lot of ways from PC-BSD. Much more than just the name has changed. The system is now more focused on cutting edge software and features in FreeBSD's development branch. The install process has been streamlined and the user begins with a set of default software rather than selecting desired packages during the initial setup. The configuration tools, particularly the Control Panel and AppCafe, have changed a lot in the past year. The designs have a more flat, minimal look. It used to be that PC-BSD did not have a default desktop exactly, but there tended to be a focus on KDE. With TrueOS the project's in-house desktop, Lumina, serves as the default environment and I think it holds up fairly well.  
>  In all, I think TrueOS offers a convenient way to experiment with new FreeBSD technologies and ZFS. I also think people who want to run FreeBSD on a desktop computer may want to look at TrueOS as it sets up a graphical environment automatically. However, people who want a stable desktop platform with lots of applications available out of the box may not find what they want with this project.
>
>
> ---
>

### [A simple guide to install Ubuntu on FreeBSD with byhve](https://www.davd.eu/install-ubuntu-on-freebsd-with-bhyve/) ###

* David Prandzioch writes in his blog:

>
>
> For some reasons I needed a Linux installation on my NAS. bhyve is a lightweight virtualization solution for FreeBSD that makes that easy and efficient. However, the CLI of bhyve is somewhat bulky and bare making it hard to use, especially for the first time. This is what vm-bhyve solves - it provides a simple CLI for working with virtual machines.
>
>

* More details follow about what steps are needed to setup vm\_bhyve on FreeBSD
* Also check out his other tutorials on his blog: [https://www.davd.eu/freebsd/](https://www.davd.eu/freebsd/) \*\*\*

### [Graphical Overview of the Architecture of FreeBSD ](https://dspinellis.github.io/unix-architecture/arch.pdf) ###

* This diagram tries to show the different components that make up the FreeBSD Operating Systems
* It breaks down the various utilities, libraries, and components into some categories and sub-categories:
* User Commands:
  * Development (cc, ld, nm, as, etc)
  * File Management (ls, cp, cmp, mkdir)
  * Multiuser Commands (login, chown, su, who)
  * Number Processing (bc, dc, units, expr)
  * Text Processing (cut, grep, sort, uniq, wc)
  * User Messaging (mail, mesg, write, talk)
  * Little Languages (sed, awk, m4)
  * Network Clients (ftp, scp, fetch)
  * Document Preparation (\*roff, eqn, tbl, refer)

* Administrator and System Commands
  * Filesystem Management (fsck, newfs, gpart, mount, umount)
  * Networking (ifconfig, route, arp)
  * User Management (adduser, pw, vipw, sa, quota\*)
  * Statistics (iostat, vmstat, pstat, gstat, top)
  * Network Servers (sshd, ftpd, ntpd, routed, rpc.\*)
  * Scheduling (cron, periodic, rc.\*, atrun)

* Libraries (C Standard, Operating System, Peripheral Access, System File Access, Data Handling, Security, Internationalization, Threads)
* System Call Interface (File I/O, Mountable Filesystems, File ACLs, File Permissions, Processes, Process Tracing, IPC, Memory Mapping, Shared Memory, Kernel Events, Memory Locking, Capsicum, Auditing, Jails)
* Bootstrapping (Loaders, Configuration, Kernel Modules)
* Kernel Utility Functions
  * Privilege Management (acl, mac, priv)
  * Multitasking (kproc, kthread, taskqueue, swi, ithread)
  * Memory Management (vmem, uma, pbuf, sbuf, mbuf, mbchain, malloc/free)
  * Generic (nvlist, osd, socket, mbuf\_tags, bitset)
  * Virtualization (cpuset, crypto, device, devclass, driver)
  * Synchronization (*lock, sx, sema, mutex, condvar\_*, atomic\_\*, signal)
  * Operations (sysctl, dtrace, watchdog, stack, alq, ktr, panic)

* I/O Subsystem
  * Special Devices (line discipline, tty, raw character, raw disk)
  * Filesystems (UFS, FFS, NFS, CD9660, Ext2, UDF, ZFS, devfs, procfs)
  * Sockets
  * Network Protocols (TCP, UDP, UCMP, IPSec, IP4, IP6)
  * Netgraph (50+ modules)

* Drivers and Abstractions
  * Character Devices
  * CAM (ATA, SATA, SAS, SPI)
  * Network Interface Drivers (802.11, if\_ae, 100+, if\_xl, NDIS)

* GEOM
  * Storage (stripe, mirror, raid3, raid5, concat)
  * Encryption / Compression (eli, bde, shsec, uzip)
  * Filesystem (label, journal, cache, mbr, bsd)
  * Virtualization (md, nop, gate, virtstor)

* Process Control Subsystems
  * Scheduler
  * Memory Management
  * Inter-process Communication
  * Debugging Support \*\*\*

### [Official OpenBSD 6.1 CD - There's only One!](http://undeadly.org/cgi?action=article&sid=20170503203426&mode=expanded) ###

* [Ebay auction Link](http://www.ebay.com/itm/The-only-Official-OpenBSD-6-1-CD-set-to-be-made-For-auction-for-the-project-/252910718452)
* Now it turns out that in fact, exactly one CD set was made, and it can be yours if you are the successful bidder in the auction that ends on May 13, 2017 (About 3 days from when this episode was recorded).
* The CD set is hand made and signed by Theo de Raadt.
* Fun Fact: The winning bidder will have an OpenBSD CD set that even Theo doesn't have. \*\*\*

Beastie Bits
----------

* [Hardware Wanted by OpenBSD developers](https://www.openbsd.org/want.html)
* [Donate hardware to FreeBSD developers](https://www.freebsd.org/donations/index.html#components)
* [Announcing NetBSD and the Google Summer of Code Projects 2017](https://blog.netbsd.org/tnf/entry/announcing_netbsd_and_the_google)
* [Announcing FreeBSD GSoC 2017 Projects ](https://wiki.freebsd.org/SummerOfCode2017Projects)
* [LibreSSL 2.5.4 Released](https://ftp.openbsd.org/pub/OpenBSD/LibreSSL/libressl-2.5.4-relnotes.txt)
* [CharmBUG Meeting - Tor Browser Bundle Hack-a-thon](https://www.meetup.com/CharmBUG/events/238218840/)
* [pkgsrcCon 2017 CFT](https://mail-index.netbsd.org/netbsd-advocacy/2017/05/01/msg000735.html)
* [Experimental Price Cuts](https://blather.michaelwlucas.com/archives/2931)
* [Linux Fest North West 2017: Three Generations of FreeNAS: The World’s most popular storage OS turns 12](https://www.youtube.com/watch?v=x6VznQz3VEY) \*\*\*

Feedback/Questions
----------

* [Don - Reproducible builds & gcc/clang](http://dpaste.com/2AXX75X#wrap)
* [architect - C development on BSD](http://dpaste.com/0FJ854X#wrap)
* [David - Linux ABI](http://dpaste.com/2CCK2WF#wrap)
* [Tom - ZFS](http://dpaste.com/2Z25FKJ#wrap)
  * [RAIDZ Stripe Width Myth, Busted](https://www.delphix.com/blog/delphix-engineering/zfs-raidz-stripe-width-or-how-i-learned-stop-worrying-and-love-raidz)

* [Ivan - Jails](http://dpaste.com/1Z173WA#wrap) \*\*\*