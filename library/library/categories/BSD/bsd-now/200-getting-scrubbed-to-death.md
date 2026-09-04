+++
title = "200: Getting Scrubbed to Death"
description = "The NetBSD 8.0 release process is underway, we try to measure the weight of an electron, and look at stack clashing.This episode was brought to you byiXsystems - Enterprise Servers and Storage for Open Source[![Digita"
date = "2017-06-28T12:00:00Z"
url = "https://www.bsdnow.tv/200"
author = "feedback@bsdnow.tv (JT Pennington)"
text = ""
lastupdated = "2026-03-26T14:37:50.882717139Z"
seen = true
+++

The NetBSD 8.0 release process is underway, we try to measure the weight of an electron, and look at stack clashing.

This episode was brought to you by
----------

[![iXsystems - Enterprise Servers and Storage for Open Source](/images/1.png)](http://www.ixsystems.com/bsdnow)[![DigitalOcean - Simple Cloud Hosting, Built for Developers](/images/2.png)](http://www.digitalocean.com/)[![Tarsnap - Online Backups for the Truly Paranoid](/images/3.png)](http://www.tarsnap.com/bsdnow)

---

Headlines
----------

### [NetBSD 8.0 release process underway](https://mail-index.netbsd.org/netbsd-announce/2017/06/06/msg000267.html) ###

* Soren Jacobsen writes on NetBSD-announce:

>
>
> If you've been reading source-changes@, you likely noticed the recent creation of the netbsd-8 branch. If you haven't been reading source-changes@, here's some news: the netbsd-8 branch has been created, signaling the beginning of the release process for NetBSD 8.0.  
>  We don't have a strict timeline for the 8.0 release, but things are looking pretty good at the moment, and we expect this release to happen in a shorter amount of time than the last couple major releases did.  
>  At this point, we would love for folks to test out netbsd-8 and let us know how it goes. A couple of major improvements since 7.0 are the addition of USB 3 support and an overhaul of the audio subsystem, including an in-kernel mixer. Feedback about these areas is particularly desired.  
>  To download the latest binaries built from the netbsd-8 branch, head to  
>  [[http://daily-builds.NetBSD.org/pub/NetBSD-daily/netbsd-8/(]http://daily-builds.NetBSD.org/pub/NetBSD-daily/netbsd-8/)](http://daily-builds.NetBSD.org/pub/NetBSD-daily/netbsd-8/(]http://daily-builds.NetBSD.org/pub/NetBSD-daily/netbsd-8/))  
>  Thanks in advance for helping make NetBSD 8.0 a stellar release!
>
>

---

### [OpenIndiana Hipster 2017.04 is here](https://www.openindiana.org/2017/05/03/openindiana-hipster-2017-04-is-here/) ###

* Desktop software and libraries
  * Xorg was updated to 1.18.4, xorg libraries and drivers were updated.
  * Mate was updated to 1.16
  * [Intel video driver was updated, the list of supported hardware has significantly extended](https://wiki.openindiana.org/oi/Intel+KMS+driver)
  * libsmb was updated to 4.4.6
  * gvfs was updated to 1.26.0
  * gtk3 was updated to 3.18.9
  * Major text editors were updated (we ship vim 8.0.104, joe 4.4, emacs 25.2, nano 2.7.5
  * pulseaudio was updated to 10.0
  * firefox was updated to 45.9.0
  * thunderbird was updated to 45.8.0
  * critical issue in enlightenment was fixed, now it's operational again
  * privoxy was updated to 3.0.26
  * Mesa was updated to 13.0.6
  * Nvidia driver was updated to 340.102

* Development tools and libraries
  * GCC 6 was added. Patches necessary to compile illumos-gate with GCC 6 were added (note, compiling illumos-gate with version other than illumos-gcc-4.4.4 is not supported)
  * [GCC 7.1 added to Hipster](https://www.openindiana.org/2017/05/05/gcc-7-1-added-the-hipster-and-rolling-forward/)
  * Bison was updated to 3.0.4
  * Groovy 2.4 was added
  * Ruby 1.9 was removed, Ruby 2.3 is the default Ruby now
  * Perl 5.16 was removed. 64-bit Perl 5.24 is shipped.
  * 64-bit OpenJDK 8 is the default OpenJDK version now.
  * Mercurial was updated to 4.1.3
  * Git was updated to 2.12.2
  * ccache was updated to 3.3.3
  * QT 5.8.0 was added
  * Valgrind was updated to 3.12.0

* Server software
  * PostgreSQL 9.6 was added, PostgreSQL 9.3-9.5 were updated to latest minor versions
  * MongoDB 3.4 was added
  * MariaDB 10.1 was added
  * NodeJS 7 was added
  * Percona Server 5.5/5.6/5.7 and MariaDB 5.5 were updated to latest minor versions
  * OpenVPN was updated to 2.4.1
  * ISC Bind was updated to 9.10.4-P8
  * Squid was updated to 3.5.25
  * Nginx was updated to 1.12.0
  * Apache 2.4 was updated to 2.4.25. Apache 2.4 is the default Apache server now. Apache 2.2 will be removed before the next snapshot.
  * ISC ntpd was updated to 4.2.8p10
  * OpenSSH was updated to 7.4p1
  * Samba was updated to 4.4.12
  * Tcpdump was updated to 4.9.0
  * Snort was updated to 2.9.9.0
  * Puppet was updated to 3.8.6

* A lot of other bug fixes and minor software updates included. \*\*\*

### [PKGSRC at The University of WisconsinMilwaukee](https://uwm.edu/hpc/software-management/) ###

* This piece is from the University of Wisconsin, Milwaukee

>
>
> Why Use Package Managers?  
>  Why Pkgsrc?
>
>
>
> Portability  
>  Flexibility  
>  Modernity  
>  Quality and Security  
>  Collaboration  
>  Convenience  
>  Growth
>
>
>
> Binary Packages for Research Computing  
>  The University of Wisconsin  Milwaukee provides binary pkgsrc packages for selected operating systems as a service to the research computing community.  
>  Unlike most package repositories, which have a fixed prefix and frequently upgraded packages, these packages are available for multiple prefixes and remain unchanged for a given prefix. Additional packages may be added and existing packages may be patched to fix bugs or security issues, but the software versions will not be changed. This allows researchers to keep older software in-place indefinitely for long-term studies while deploying newer software in later snapshots.  
>  Contributing to Pkgsrc  
>  Building Your Own Binary Packages
>
>

* Check out the full article and consider using pkgsrc for your own research purposes.
* [PKGSrc Con is this weekend!](http://www.pkgsrc.org/pkgsrcCon/2017/) \*\*\*

### [Measuring the weight of an electron](https://deftly.net/posts/2017-06-01-measuring-the-weight-of-an-electron.html) ###

* An interesting story of the struggles of one person, aided only by their pet Canary, porting Electron to OpenBSD.

>
>
> This is a long rant. A rant intended to document lunacy, hopefully aid others in the future and make myself feel better about something I think is crazy. It may seem like I am making an enemy of electron, but keep in mind that isnt my intention! The enemy here, is complexity! My friend Henry, a canary, is coming along for the ride!
>
>

* Getting the tools

>
>
> At first glance Electron seems like a pretty solid app, it has decent docs, its consolidated in a single repository, has a lot of visibility, porting it shouldnt be a big deal, right?
>
>

* After cloning the repo, trouble starts:

>
>
> Reading through the doc, right off the bat there are a few interesting things: At least 25GB disk space. Huh, OK, some how this \~47M repository is going to blow up to 25G?  
>  Continuing along with the build, I know I have two versions of clang installed on OpenBSD, one from ports and one in base. Hopefully I will be able to tell the build to use one of these versions.
>
>

* Next, its time to tell the bootstrap that OpenBSD exists as a platform. After that is fixed, the build-script runs.

* Even though cloning another git repo fails, the build happily continues.

>
>
> Wait. Another repository failed to clone? At least this time the build failed after trying to clone boto.. again. I am guessing it tried twice because something might have changed between now and the last clone? Off in the distance we catch a familiar tune, it almost sounds like Gnarls Barkleys song Crazy, cant tell for sure.  
>  As it turns out, if you are using git-fsck, you are unable to clone boto and requests. Obviously the proper fix for his is to not care about the validity of the git objects! So we die a little inside and comment out fsckobjects in our \~/.gitconfig.
>
>

* Next up, chromium-58 is downloaded 

>
>
> Out of curiosity we look at vendor/libchromiumcontent/script/update, it seems its purpose is to download / extract chromium clang and node, good thing we already specified --clang\_dir or it might try to build clang again!  
>  544 dots and 45 minutes later, we have an error! The chromium-58.0.3029.110.tar.xz file is mysteriously not there anymore.. Interesting. Wut. Updating Clang. Didnt I explicitly say not to build clang? At this point we have to shift projects, no longer are we working on Electron.. Its libchromiumcontent that needs our attention.
>
>

* Fixing sub-tools

>
>
> Ahh, our old friends the dots! This is the second time waiting 45+ minutes for a 500+ MB file to download. We are fairly confident it will fail, delete the file out from under itself and hinder the process even further, so we add an explicit exit to the update script. This way we can copy the file somewhere safe!
>
>

* Another 45 minute chrome build and saving the downloaded executable to a save space seems in order. Fixing another 50 occurrences of error conditions lets the build continue - to another clang build.

>
>
> We remove the call to update\_clang, because.. well.. we have two copies of it already and the Electron doc said everything would be fine if we had \>= clang 3.4!
>
>

* More re-builds and updates of clang and chromium are being commented out, just to get somewhere close to the actual electron build.

* Fixing sub-sub-tools

* Ninja needs to be build and the script for that needs to be told to ignore this unsupported OS to continue.

>
>
> No luck. At this point we are faced with a complex web of python scripts that execute gn on GN files to produce ninja files which then build the various components and somewhere in that cluster, something doesnt know about OpenBSD  
>  I look at Henry, he is looking a photo of his wife and kids. They are sitting on a telephone wire, the morning sun illuminating their beautiful faces. Henry looks back at me and says Its not worth it. We slam the laptop shut and go outside.
>
>

---

Interview - Dan McDonald - [allcoms@gmail.com](mailto:allcoms@gmail.com) (danboid)
----------

---

News Roundup
----------

### [g4u 2.6 (ghosting for unix) released 18th birthday](https://mail-index.netbsd.org/netbsd-users/2017/06/08/msg019625.html) ###

* Hubert Feyrer writes in his mail to netbsd-users:

>
>
> After a five-year period for beta-testing and updating, I have finally released g4u 2.6. With its origins in 1999, I'd like to say: Happy 18th Birthday, g4u!
>
>

* About g4u:

>
>
> g4u ("ghosting for unix") is a NetBSD-based bootfloppy/CD-ROM that allows easy cloning of PC harddisks to deploy a common setup on a number of PCs using FTP. The floppy/CD offers two functions. The first is to upload the compressed image of a local harddisk to a FTP server, the other is to restore that image via FTP, uncompress it and write it back to disk. Network configuration is fetched via DHCP. As the harddisk is processed as an image, any filesystem and operating system can be deployed using g4u. Easy cloning of local disks as well as partitions is also supported.
>
>

* The past:

>
>
> When I started g4u, I had the task to install a number of lab machines with a dual-boot of Windows NT and NetBSD. The hype was about Microsoft's "Zero Administration Kit" (ZAK) then, but that did barely work for the Windows part - file transfers were slow, depended on the clients' hardware a lot (requiring fiddling with MS DOS network driver disks), and on the ZAK server the files for installing happened do disappear for no good reason every now and then. Not working well, and leaving out NetBSD (and everything else), I created g4u. This gave me the (relative) pain of getting things working once, but with the option to easily add network drivers as they appeared in NetBSD (and oh they did!), plus allowed me to install any operating system.
>
>

* The present:

>
>
> We've used g4u successfully in our labs then, booting from CDROM. I also got many donations from public and private institutions plus companies from many sectors, indicating that g4u does make a difference.
>
>
>
> In the meantime, the world has changed, and CDROMs aren't used that much any more. Network boot and USB sticks are today's devices of choice, cloning of a full disk without knowing its structure has both advantages but also disadvantages, and g4u's user interface is still command-line based with not much space for automation. For storage, FTP servers are nice and fast, but alternatives like SSH/SFTP, NFS, iSCSI and SMB for remote storage plus local storage (back to fun with filesystems, anyone? avoiding this was why g4u was created in the first place!) should be considered these days. Further aspects include integrity (checksums), confidentiality (encryption). This leaves a number of open points to address either by future releases, or by other products.
>
>

* The future:

>
>
> At this point, my time budget for g4u is very limited. I welcome people to contribute to g4u - g4u is Open Source for a reason. Feel free to get back to me for any changes that you want to contribute!
>
>

* The changes:

>
>
> Major changes in g4u 2.6 include:
>
>

* Make this build with NetBSD-current sources as of 2017-04-17 (shortly before netbsd-8 release branch), binaries were cross-compiled from Mac OS X 10.10
* Many new drivers, bugfixes and improvements from NetBSD-current (see beta1 and beta2 announcements)
* Go back to keeping the disk image inside the kernel as ramdisk, do not load it as separate module. Less error prone, and allows to boot the g4u (NetBSD) kernel from a single file e.g. via PXE (Testing and documentation updates welcome!)
* Actually DO provide the g4u (NetBSD) kernel with the embedded g4u disk image from now on, as separate file, g4u-kernel.gz
* In addition to MD5, add SHA512 checksums

  * Congratulation, g4u. Check out the [g4u website](http://fehu.org/~feyrer/g4u/) and support the project if you are using it. \*\*\*

### [Fixing FreeBSD Networking on Digital Ocean](https://wycd.net/posts/2017-05-19-fixing-freebsd-networking-on-digital-ocean.html) ###

* Most cloud/VPS providers use some form of semi-automated address assignment, rather than just regular static address configuration, so that newly created virtual machines can configure themselves.
* Sometimes, especially during the upgrade process, this can break. This is the story of one such user:

>
>
> I decided it was time to update my FreeBSD Digital Ocean droplet from the end-of-life version 10.1 (shame on me) to the modern version 10.3 (good until April 2018), and maybe even version 11 (good until 2021). There were no sensitive files on the VM, so I had put it off.  
>  Additionally, cloud providers tend to have shoddy support for BSDs, so breakages after messing with the kernel or init system are rampant, and I had been skirting that risk.  
>  The last straw for me was a broken pkg: /usr/local/lib/libpkg.so.3: Undefined symbol "openat"
>
>

* So the user fires up freebsd-update and upgrades to FreeBSD 10.3

>
>
> I rebooted, and of course, it happened: no ssh access after 30 seconds, 1 minute, 2 minutesI logged into my Digital Ocean account and saw green status lights for the instance, but something was definitely wrong.  
>  Fortunately, Digital Ocean provides console access (albeit slow, buggy, and crashes my browser every time I run ping). ifconfig revealed that the interfaces vtnet0 (public) and vtnet1 (private) havent been configured with IP addresses.  
>  Combing through files in /etc/rc.\*, I found a file called /etc/rc.digitalocean.d/${DROPLET\_ID}.conf containing static network settings for this droplet (${DROPLET\_ID} was something like 1234567).  
>  It seemed that FreeBSD wasnt picking up the Digital Ocean network settings config file. The quick and dirty way would have been to messily append the contents of this file to /etc/rc.conf, but I wanted a nicer way. Reading the script in /etc/rc.d/digitalocean told me that /etc/rc.digitalocean.d/${DROPLET\_ID}.conf was supposed to have a symlink at /etc/rc.digitalocean.d/droplet.conf. It was broken and pointed to /etc/rc.digitalocean.d/.conf, which could happen when the curl command in /etc/rc.d/digitalocean fails
>
>

* Maybe the curl binary was also in need for an upgrade so failed to fetch the droplet ID

>
>
> Using grep to fish for files containing droplet.conf, I discovered that it was hacked into the init system via load\_rc\_config() in /etc/rc.subr
>
>

* I would prefer if Digital Ocean had not customized the version of FreeBSD they ship quite so much

* I could fix that symlink and restart the services:

>
>
> set DROPLET\_ID=$(curl -s [http://169.254.169.254/metadata/v1/id](http://169.254.169.254/metadata/v1/id))
> ==========
>
>
>
> ln -s -f /etc/rc.digitalocean.d/${DROPLET\_ID}.conf /etc/rc.digitalocean.d/droplet.conf
> ==========
>
>
>
> /etc/rc.d/netif restart
> ==========
>
>
>
> /etc/rc.d/routing restart
> ==========
>
>
>
> Networking was working again, and I could then ssh into my server and run the following to finish the upgrade:
>
>
>
> freebsd-update install
> ==========
>
>
>
> At this point, I decided that I didnt want to deal with this mess again until at least 2021, so I decided to go for 11.0-RELEASE
>
>
>
> freebsd-update -r 11.0-RELEASE update
> ==========
>
>
>
> freebsd-update install
> ==========
>
>
>
> reboot
> ==========
>
>
>
> freebsd-update install
> ==========
>
>
>
> pkg-static install -f pkg
> ==========
>
>
>
> pkg update
> ==========
>
>
>
> pkg upgrade
> ==========
>
>
>
> uname -a
> ==========
>
>
>
> FreeBSD hostname 11.0-RELEASE-p9 FreeBSD 11.0-RELEASE-p9
>
>
>
> pkg -v
> ==========
>
>
>
> 1.10.1  
>  The problem was solved correctly, and my /etc/rc.conf remains free of generated cruft.  
>  The Digital Ocean team can make our lives easier by having their init scripts do more thorough system checking, e.g., catching broken symlinks and bad network addresses. Im hopeful that collaboration of the FreeBSD team and cloud providers will one day result in automatic fixing of these situations, or at least a correct status indicator.
>
>

* The Digital Ocean team didnt really know many FreeBSD people when they made the first 10.1 images, they have improved a lot, but they of course could always use more feedback from *BSD users \**\*

### [Stack Clash](https://www.qualys.com/2017/06/19/stack-clash/stack-clash.txt) ###

>
>
> A 12-year-old question: "If the heap grows up, and the stack grows down, what happens when they clash? Is it exploitable? How?  
> [In 2005, Gael Delalleau presented "Large memory management vulnerabilities" and the first stack-clash exploit in user-space (against mod\_php 4.3.0 on Apache 2.0.53)](http://cansecwest.com/core05/memory_vulns_delalleau.pdf)  
> [In 2010, Rafal Wojtczuk published "Exploiting large memory management vulnerabilities in Xorg server running on Linux", the second stack-clash exploit in user-space (CVE-2010-2240)](http://www.invisiblethingslab.com/resources/misc-2010/xorg-large-memory-attacks.pdf)  
>  Since 2010, security researchers have exploited several stack-clashes in the kernel-space, In user-space, however, this problem has been greatly underestimated; the only public exploits are Gael Delalleau's and Rafal Wojtczuk's, and [they were written before Linux introduced a protection against stack-clashes (a "guard-page" mapped below the stack)](https://bugzilla.redhat.com/show_bug.cgi?id=CVE-2010-2240)  
>  In this advisory, we show that stack-clashes are widespread in user-space, and exploitable despite the stack guard-page; we discovered multiple vulnerabilities in guard-page implementations, and devised general methods for:  
>  "Clashing" the stack with another memory region: we allocate memory until the stack reaches another memory region, or until another memory region reaches the stack;  
>  "Jumping" over the stack guard-page: we move the stack-pointer from the stack and into the other memory region, without accessing the stack guard-page;  
>  "Smashing" the stack, or the other memory region: we overwrite the stack with the other memory region, or the other memory region with the stack.
>
>

* So this advisory itself, is not a security vulnerability. It is novel research showing ways to work around the mitigations against generic vulnerability types that are implemented on various operating systems.
* While this issue with the mitigation feature has been fixed, even without the fix, successful exploitation requires another application with its own vulnerability in order to be exploited. Those vulnerabilities outside of the OS need to be fixed on their own.
* [FreeBSD-Security post](https://lists.freebsd.org/pipermail/freebsd-security/2017-June/009335.html)

>
>
> The issue under discussion is a limitation in a vulnerability mitigation technique. Changes to improve the way FreeBSD manages stack growth, and mitigate the issue demonstrated by Qualys' proof-of-concept code, are in progress by FreeBSD developers knowledgeable in the VM subsystem.
>
>

* [FreeBSD address space guards](https://svnweb.freebsd.org/base?view=revision&revision=320317)
* [HardenedBSD Proof of Concept for FreeBSD](https://github.com/lattera/exploits/blob/master/FreeBSD/StackClash/001-stackclash.c)
* HardenedBSD implementation: [https://github.com/HardenedBSD/hardenedBSD/compare/de8124d3bf83d774b66f62d11aee0162d0cd1031...91104ed152d57cde0292b2dc09489fd1f69ea77c](https://github.com/HardenedBSD/hardenedBSD/compare/de8124d3bf83d774b66f62d11aee0162d0cd1031...91104ed152d57cde0292b2dc09489fd1f69ea77c) & [https://github.com/HardenedBSD/hardenedBSD/commit/00ad1fb6b53f63d6e9ba539b8f251b5cf4d40261](https://github.com/HardenedBSD/hardenedBSD/commit/00ad1fb6b53f63d6e9ba539b8f251b5cf4d40261)
* [Qualys PoC: freebsd\_cve-2017-fgpu.c](https://www.qualys.com/2017/06/19/stack-clash/freebsd_cve-2017-fgpu.c)
* [Qualys PoC: freebsd\_cve-2017-fgpe.c](https://www.qualys.com/2017/06/19/stack-clash/freebsd_cve-2017-fgpe.c)
* [Qualys PoC: freebsd\_cve-2017-1085.c](https://www.qualys.com/2017/06/19/stack-clash/freebsd_cve-2017-1085.c)
* [Qualys PoC: OpenBSD](https://www.qualys.com/2017/06/19/stack-clash/openbsd_at.c)
* [Qualys PoC: NetBSD](https://www.qualys.com/2017/06/19/stack-clash/netbsd_cve-2017-1000375.c) \*\*\*

### [Will ZFS and non-ECC RAM kill your data? ](http://jrs-s.net/2015/02/03/will-zfs-and-non-ecc-ram-kill-your-data/) ###

* TL;DR: ECC is good, but even without, having ZFS is better than not having ZFS.

>
>
> Whats ECC RAM? Is it a good idea?  
>  Whats ZFS? Is it a good idea?  
>  Is ZFS and non-ECC worse than not-ZFS and non-ECC?  
>  What about the Scrub of Death?
>
>

* The article walks through ZFS folk lore, and talks about what can really go wrong, and what is just the over-active imagination of people on the FreeNAS forums

>
>
> But would using any other filesystem that isnt ZFS have protected that data? Cause remember, nobodys arguing that you can lose data to evil RAM  the argument is about whether evil RAM is more dangerous with ZFS than it would be without it.  
>  I really, really want to use the Scrub Of Death in a movie or TV show. How can I make it happen?  
>  I dont care about your logic! I wish to appeal to authority!  
>  OK. Authority in this case doesnt get much better than Matthew Ahrens, one of the cofounders of ZFS at Sun Microsystems and current ZFS developer at Delphix. In the comments to one of my filesystem articles on Ars Technica, Matthew said Theres nothing special about ZFS that requires/encourages the use of ECC RAM more so than any other filesystem.
>
>
> ---
>

Beastie Bits
----------

* [EuroBSDcon 2017 Travel Grant Application Now Open](https://www.freebsdfoundation.org/blog/eurobsdcon-2017-travel-grant-application-now-open/)
* [FreeBSD 11.1-BETA3 is out, please give it a test](https://lists.freebsd.org/pipermail/freebsd-stable/2017-June/087303.html)
* [Allan and Lacey let us know the video to the Postgresql/ZFS talk is online](http://dpaste.com/1FE80FJ)
* [Trapsleds](https://marc.info/?l=openbsd-tech&m=149792179514439&w=2)
* [BSD User group in North Rhine-Westphalia, Germany](https://bsd.nrw/) \*\*\*

Feedback/Questions
----------

* [Joe - Home Server Suggestions](http://dpaste.com/2Z5BJCR#wrap)
* [Stephen - general BSD](http://dpaste.com/1VRQYAM#wrap)
* [Eduardo - ZFS Encryption](http://dpaste.com/2TWADQ8#wrap)
* [Joseph - BGP Kernel Error](http://dpaste.com/0SC0GAC#wrap) \*\*\*