+++
title = "205: FreeBSD Turning it up to 11.1"
description = "FreeBSD 11.1-RELEASE is out, we look at building at BSD home router, how to be your own OpenBSD VPN provider, and find that glob matching can be simple and fast.This episode was brought to you by[![iXsystems - Enterprise Servers and Storage for Open Source](/images/1.pn"
date = "2017-08-02T12:00:00Z"
url = "https://www.bsdnow.tv/205"
author = "feedback@bsdnow.tv (JT Pennington)"
text = ""
lastupdated = "2026-03-26T14:37:50.868581110Z"
seen = true
+++

FreeBSD 11.1-RELEASE is out, we look at building at BSD home router, how to be your own OpenBSD VPN provider, and find that glob matching can be simple and fast.

This episode was brought to you by
----------

[![iXsystems - Enterprise Servers and Storage for Open Source](/images/1.png)](http://www.ixsystems.com/bsdnow)[![DigitalOcean - Simple Cloud Hosting, Built for Developers](/images/2.png)](http://www.digitalocean.com/)[![Tarsnap - Online Backups for the Truly Paranoid](/images/3.png)](http://www.tarsnap.com/bsdnow)

---

Headlines
----------

### [FreeBSD 11.1-RELEASE](https://www.freebsd.org/releases/11.1R/relnotes.html) ###

* [FreeBSD 11.1 was released on July 26th](https://www.freebsd.org/releases/11.1R/announce.asc)
* You can download it as an ISO or USB image, a prebuilt VM Image (vmdk, vhd, qcow2, or raw), and it is available as a cloud image (Amazon EC2, Microsoft Azure, Google Compute Engine, Vagrant)
* Thanks to everyone, including the release engineering team who put so much time and effort into managing this release and making sure it came out on schedule, all of the FreeBSD developers who contributed the features, the companies that sponsored that development, and the users who tested the betas and release candidates.
* Support for blacklistd(8) has been added to OpenSSH
* The cron(8) utility has been updated to add support for including files within /etc/cron.d and /usr/local/etc/cron.d by default.
* The syslogd(8) utility has been updated to add the include keyword which allows specifying a directory containing configuration files to be included in addition to syslog.conf(5). The default syslog.conf(5) has been updated to include /etc/syslog.d and /usr/local/etc/syslog.d by default.
* The zfsbootcfg(8) utility has been added, providing one-time boot.config(5)-style options
* The efivar(8) utility has been added, providing an interface to manage UEFI variables.
* The ipsec and tcpmd5 kernel modules have been added, these can now be loaded without having to recompile the kernel
* A number of new IPFW modules including Network Prefix Translation for IPv6 as defined in RFC 6296, stateless and stateful NAT64, and a module to modify the TCP-MSS of packets
* A huge array of driver updates and additions
* The NFS client now supports the Amazon® Elastic File System™ (EFS)
* The new ZFS Compressed ARC feature was added, and is enabled by default
* The EFI loader has been updated to support TFTPFS, providing netboot support without requiring an NFS server
* For a complete list of new features and known problems, please see the online release notes and errata list, available at:
  * [FreeBSD 11.1-RELEASE Release Notes](https://www.freebsd.org/releases/11.1R/relnotes.html)
  * [FreeBSD 11.1-RELEASE Errata](https://www.freebsd.org/releases/11.1R/errata.html)
  * For more information about FreeBSD release engineering activities, please see: [Release Engineering Information](https://www.freebsd.org/releng/)

* Availability
  * FreeBSD 11.1-RELEASE is now available for the amd64, i386, powerpc, powerpc64, sparc64, armv6, and aarch64 architectures.
  * FreeBSD 11.1-RELEASE can be installed from bootable ISO images or over the network. Some architectures also support installing from a USB memory stick. The required files can be downloaded as described in the section below.
  * SHA512 and SHA256 hashes for the release ISO, memory stick, and SD card images are included at the bottom of this message.
  * PGP-signed checksums for the release images are also available at: [FreeBSD 11.1 Release Checksum Signatures](https://www.freebsd.org/releases/11.1R/signatures.html)
  * A PGP-signed version of this announcement is available at: [FreeBSD 11.1-RELEASE Announcement](https://www.FreeBSD.org/releases/11.1R/announce.asc) \*\*\*

### [Building a BSD home router - ZFS and Jails](https://eerielinux.wordpress.com/2017/07/15/building-a-bsd-home-router-pt-8-zfs-and-jails/) ###

* Part of a series of posts about building a router:
  * [Part 1](https://eerielinux.wordpress.com/2017/05/30/building-a-bsd-home-router-pt-1-hardware-pc-engines-apu2/) -- discussing why you want to build your own router and how to assemble the APU2
  * [Part 2](https://eerielinux.wordpress.com/2017/06/03/building-a-bsd-home-router-pt-2-the-serial-console-excursion) -- some Unix history explanation of what a serial console is
  * [Part 3](https://eerielinux.wordpress.com/2017/06/10/building-a-bsd-home-router-pt-3-serial-access-and-flashing-the-firmware/) -- demonstrating serial access to the APU and covering firmware update
  * [Part 4](https://eerielinux.wordpress.com/2017/06/15/building-a-bsd-home-router-pt-4-installing-pfsense/) -- installing pfSense
  * [Part 5](https://eerielinux.wordpress.com/2017/06/20/building-a-bsd-home-router-pt-5-installing-opnsense/) -- installing OPNsense instead
  * [Part 6](https://eerielinux.wordpress.com/2017/06/30/building-a-bsd-home-router-pt-7-advanced-opnsense-setup/) -- Comparison of pfSense and OPNsense
  * [Part 7](https://eerielinux.wordpress.com/2017/06/30/building-a-bsd-home-router-pt-7-advanced-opnsense-installation/) -- Advanced installation of OPNsense

* After the advanced installation in part 7, the tutorials covers converting an unused partition into swap space, and converting the system to ZFS
* After creating a new pool using the set aside partition, some datasets are created, and the log files, ports, and obj ZFS datasets are mounted
* The tutorial then goes on to cover how to download the ports tree, and install additional software on the router
* I wonder what part 9 will be about. \*\*\*

### [Be your own VPN provider with OpenBSD (v2)](https://networkfilter.blogspot.com/2017/04/be-your-own-vpn-provider-with-openbsd-v2.htm) ###

* This article covers how to build your own VPN server with some advanced features including:
  * Full Disk Encryption (FDE)
  * Separate CA/signing machine (optional)
  * Multiple DNSCrypt proxy instances for failover
  * OpenVPN: Certificate Revocation List/CRL (optional)
  * OpenVPN: TLS 1.2 only
  * OpenVPN: TLS cipher based on AES-256-GCM only
  * OpenVPN: HMAC-SHA512 instead of HMAC-SHA1
  * OpenVPN: TLS encryption of control channel (makes it harder to identify OpenVPN traffic)

* The article starts with an explanation of the differences between OpenVPN and IPSEC.
* In the end the author chose OpenVPN because you can select the port it runs on, and it has a better chance of working from hotel or coffee shop WiFi.
* The guide them walks through doing an installation on an encrypted disk, with a caution about the limitations of encrypted disk with virtual machines hosted by other parties.
* The guide then locks down the newly installed system, configuring SSH for keys only, adding some PF rules, and configuring doas
* Then networking is configured, including enabling IP forwarding since this machine is going to act as the VPN gateway
* Then a large set of firewall rules are created that NAT the VPN traffic out of the gateway, except for DNS requests that are redirected to the gateways local unbound
* Then some python scripts are provided to block brute force attempts

>
>
> We will use DNSCrypt to make our DNS requests encrypted, and Unbound to have a local DNS cache. This will allow us to avoid using our VPS provider DNS servers, and will also be useful to your future VPN clients which will be able to use your VPN server as their DNS server too  
>  Before configuring Unbound, which is the local DNS cache which will make requests to dnscrypt\_proxy, we can configure an additional dnscrypt instance, as explained in the pkg readme. Indeed, dnscrypt DNS servers being public ones, they often goes into maintenance, become offline or temporarily unreachable. To address this issue, it is possible to setup multiple dnscrypt instances. Below are the steps to follow to add one, but you can add more if you wish
>
>

* Then a CA and Certificate are created for OpenVPN
* OpenVPN is installed and configured as a server
* Configuration is also provided for a client, and a mobile client
* Thanks to the author for this great tutorial
* You might also want to check out this section from their 2015 version of this post: [Security vs Anonymity](https://networkfilter.blogspot.nl/2015/01/be-your-own-vpn-provider-with-openbsd.html#security_anonymity) \*\*\*

### [Essen Hackathon Trip - Benedict Reuschling](https://www.freebsdfoundation.org/blog/2017-essen-hackathon-trip-report-benedict-reuschling/) ###

* Over on the FreeBSD Foundation Blog, Benedict provides a detailed overview of the Essen Hackathon we were at a few weeks ago.
* Head over there and give it a read, and get a feel for what these smaller type of community events are like. Hopefully you can attend, or better yet, organize, a similar event in your area.

---

News Roundup
----------

### [Blog about my self-hosted httpd blog](https://reykfloeter.com/posts/blog-about-my-blog) ###

>
>
> I really like Twitter because it allows me to share short messages, we have a great community, and 140 characters are enough for everybody.  
>  And this statement was exactly 140 characters, but sometimes I want to say more than that. And that's why I finally created this new blog. I was never really into blogging because I barely had time or the audience to write long articles. I sometimes wrote short stories for sites like undeadly.org, I collected some of them here, but my own blog was hosted on tumblr and never saw any activity.  
>  I want to try it again, and this time I decided to create a self-hosted blog. Something that runs on my own server and with httpd, the web server that I wrote for OpenBSD. So I was looking for potential blogging tools that I could use to run my own blog. Besides the popular and heavyweight ones such as WordPress, there are countless other options: I looked at blogs from fellow developers, such as Ted Unangst's flak (I like the fact that it is written in Lua but the implementation is a bit over my head), or Pelican that is used by Peter Hessler for bad.network (but, sorry, I don't like Python), and finally Kristaps Dzonsons' sblg that is used for all of his projects and blogs. I decided to use sblg.  
>  Kristaps keeps on releasing very useful free software. Most well-known is mandoc, at least everyone is using it for manpages these days, but there is is also his BCHS (beaches) web stack which strongly advertises OpenBSD's httpd. Great. I also use kcgi whenever I have to write small CGIs. So sblg seemed like the right choice to me.  
>  Let me quickly iterate over my current Makefile. I keep on tweaking this file, so it might have been changed by the time you are reading this article. Please note that the Makefile is written for OpenBSD's make, a distant derivative of pmake which is not like GNU make.  
>  I'm not a designer or web developer, but I appreciate good looking web pages. I wanted to have something that is responsive, works on desktops and mobiles, looks somewhat modern, works without JavaScript, but doesn't disqualify me for all the eye candy from a geek point of view.  
>  I bootstrapped the theme by creating a simple grid layout with a fairly typical blog style: banner, top menu, middle text, sidebar. In 2017, bootstrap is probably a vintage (or retro) framework but it makes it very easy to create responsive pages with a proper layout and without caring about all the CSS and HTML5 madness too much. I also use Font Awesome because it is awesome, provides some fancy icons, and was suggested in sblg's example templates (let's blame Kristaps for it). I do not include any JavaScript which prevents me from using bootstrap's responsive hamburger menu.  
>  I have to admit that "reykfloeter" is not an ideal name for a blog. My actual name is "Reyk Flöter", and I normally just use my first name "reyk" as a user- and nickname, but it was taken when I registered my Twitter account and the related domain. So I picked reykfloeter in a few places.  
>  I'm aware that my German last name is nearly unpronounceable for others, so "reykfloeter" appears like a random concatenation of letters. As most of us, I own a number of domains and maybe I should move the blog to bsd.plumbing (which is used as a home for relayd and httpd), arc4random.com (but I intended to use it as a fine OpenBSD-powered Entropy-as-a-Service for poor Linuxers), or even copper.coffee?  
>  In addition to the domain, I also need a good blog name or tag line. A very memorable example in the BSD world is Peter Hansteen's THAT GRUMPY BSD GUY blog. So what should I use?
>
>

* Reyk Flöter's blog
  * OpenBSD hacker. Coffee nerd. Founder.
  * Ask Reyk (imaginary how-tos and 10 step guides)
  * [Sewage, Drainage and BSD Plumbing](bsd.plumbing/blog)
  * [A Replacement Call for Random](arc4random.com)
  * [Coffee with Reyk](copper.coffee)

>
>
> For now it will just be reykfloeter - blog
>
>
> ---
>

### [iXsystems releases the X10](https://www.ixsystems.com/blog/serverenvy-truenas-x10/) ###

* TrueNAS X10 is the the 3rd generation of the TrueNAS unified storage line. The X10 is the first of a new TrueNAS series, and will be expandable to up to 360TB with the TrueNAS ES12 expansion shelf.
* The X10 is cost effective, at a 30% lower price point than the Z20, making it an effective addition to your backup/DR infrastructure. The street price of a 20TB non-HA model falls under $10K. It’s designed to move with six predefined configurations that match common use cases. The dual controllers for high availability are an optional upgrade to ensure business continuity and avoid downtime.
* The X10 boasts 36 hot swap SAS using two expansion shelves, for up to 360TB of storage, allowing you to backup thousands of VMs or share tens of thousands of files. One of the use cases for TrueNAS X10 is for backup, so users can upgrade the X10 to two ports of blazing 10GigE connectivity. The 20TB non-HA model enables you to backup over 7,000 VDI VMs for under $3.00 per VM. Overall, the X10 is a greener solution than the TrueNAS Z product line, with the non-HA version boasting only 138 watts of power and taking up only 2U of space.
* Best of all, the TrueNAS X10 starts at $5,500 street. You can purchase a 120TB configuration today for under $20K street.

### [Glob Matching Can Be Simple And Fast Too](https://research.swtch.com/glob) ###

>
>
> Here’s a straightforward benchmark. Time how long it takes to run ls (a\*)nb in a directory with a single file named a100, compared to running ls | grep (a.\*)nb. Superscripts denote string repetition and parentheses are for grouping only, so that when n is 3, we’re running ls a\*a\*a\*b in a directory containing the single file aaa…aaa (100 a’s), compared against ls | grep a.\*a.\*a.\*b in the same directory.  
>  The exception seems to be the original Berkeley csh, which runs in linear time (more precisely, time linear in n). Looking at the source code, it doesn’t attempt to perform glob expansion itself. Instead it calls the C library implementation glob(3), which runs in linear time, at least on this Linux system. So maybe we should look at programming language implementations too.  
>  Most programming languages provide some kind of glob expansion, like C’s glob. Let’s repeat the experiment in a variety of different programming languages:  
>  Perhaps the most interesting fact evident in the graph is that GNU glibc, the C library used on Linux systems, has a linear-time glob implementation, but BSD libc, the C library used on BSD and macOS systems, has an exponential-time implementation.  
>  PHP is not shown in the graph, because its glob function simply invokes the host C library’s glob(3), so that it runs in linear time on Linux and in exponential time on non-Linux systems. (I have not tested what happens on Windows.) All the languages shown in the graph, however, implement glob matching without using the host C library, so the results should not vary by host operating system.  
>  The netkit ftpd runs quickly on Linux because it relies on the host C library’s glob function. If run on BSD, the netkit ftpd would take exponential time. ProFTPD ships a copy of the glibc glob, so it should run quickly even on BSD systems. Ironically, Pure-FTPd and tnftpd take exponential time on Linux because they ship a copy of the BSD glob function. Presumably they do this to avoid assuming that the host C library is bug-free, but, at least in this one case, the host C library is better than the one they ship.
>
>

* Additional Reading

>
>
> This post is an elaboration of an informal 2012 Google+ post showing that most shells used exponential-time glob expansion. At the time, Tom Duff, the author of Plan 9’s rc shell, commented that, “I can confirm that rc gets it wrong. My excuse, feeble as it is, is that doing it that way meant that the code took 10 minutes to write, but it took 20 years for someone to notice the problem. (That’s 10 ‘programmer minutes’, i.e. less than a day.)” I agree that’s a reasonable decision for a shell. In contrast, a language library routine, not to mention a network server, today needs to be robust against worst-case inputs that might be controlled by remote attackers, but nearly all of the code in question predates that kind of concern. I didn’t realize the connection to FTP servers until I started doing additional research for this post and came across a reference to CVE-2010-2632 in FreeBSD’s glob implementation.
>
>

---

### [BSD VPS Providers Needed](https://torbsd.github.io/blog.html#bsd-vps) ###

>
>
> One of TDP’s recent projects is accumulating a list of virtual private server services (VPS) that provide a BSD option.  
>  VPS’s are generally inexpensive services that enable the user to only concern themselves with software configuration, and not be bothered with hardware or basic operating system setup. In the pre-Cloud era, VPS providers were the “other people’s computers” that users outsourced their systems to.  
>  The same shortcomings of cloud services apply to VPS providers. You don’t control the hardware. Your files are likely viewable by users up the directory hierarchy. The entropy source or pool is a single source for multiple systems. The same time drift applies to all time-keeping services.  
>  Nevertheless, VPS services are often cheap and provide a good spread in terms of geography. All a provider really needs is a few server-grade computers and a decent network connection. VPS’s are still a gateway drug to bare-metal servers, although it seems more and more of these gateway users stop at stage one.  
>  Cheap systems with a public IP are also a great way to tinker with a new operating system.  
>  For this reason, TDP created this list of BSD VPS providers. Some explicitly deny running Tor as a server. Some just reference vague “proxy services.” Others don’t mention Tor or proxies at all.  
>  The list is a start with currently just under 70 VPS providers listed. Input through various channels already started, and TDP intends to update the list over the coming months. A first draft email and open letter addressed to the providers were drafted, and we are looking to speak directly to at least some of the better-known BSD VPS providers.  
>  We may be able to convince a few to allow public Tor relays, or at least published bridges. These providers could be new BSD users’ gateway drug into the world of BSD Tor nodes. Running a Tor relay shouldn’t be considered a particularly risky activity. Maybe we can adjust that perception.  
>  Let us know any input via email or GitHub, and we’ll be glad to make updates.
>
>

---

Beastie Bits
----------

* [Avoid OS Detection with OpenBSD](https://blog.cagedmonster.net/avoid-os-detection-openbsd/)
* [TrueOS update to fix updating](https://www.trueos.org/blog/update-fix-updating/)
* [MidnightBSD 0.8.5 VirtualBox Install](https://www.youtube.com/watch?v=I08__ZWaJ0w)
* [BSD Pizza Night in Portland](http://calagator.org/events/tag/BSD) \*\*\*

Feedback/Questions
----------

* Andrew - [BSDCan videos?](http://dpaste.com/08E90PX)
* Marc - [The Rock64 Board](http://dpaste.com/08KE40G)
* Jason - [Follow up on UEFI and Bhyve](http://dpaste.com/2EP7BFC)
* Patrick - [EFI booting](http://dpaste.com/34Z9SFM) \*\*\*