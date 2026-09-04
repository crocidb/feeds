+++
title = "151: Fuzzy Auditing"
description = 'This week on BSDNow, we have all sorts of interesting news, including a Kernel Fuzzing audit done for OpenBSD, a much improvedThis episode was brought to you by[iXsystems - Enterprise Servers and Storage for Open Source /\](http://www.ixsystems.com/bs'
date = "2016-07-20T12:00:00Z"
url = "https://www.bsdnow.tv/151"
author = "feedback@bsdnow.tv (JT Pennington)"
text = ""
lastupdated = "2026-03-26T14:37:51.017733845Z"
seen = true
+++

This week on BSDNow, we have all sorts of interesting news, including a Kernel Fuzzing audit done for OpenBSD, a much improved

This episode was brought to you by
----------

[![iXsystems - Enterprise Servers and Storage for Open Source](/images/1.png) /\>](http://www.ixsystems.com/bsdnow)[![DigitalOcean - Simple Cloud Hosting, Built for <br>
Developers](/images/2.png)](http://www.digitalocean.com/)[![Tarsnap - Online Backups for the Truly <br>
Paranoid](/images/3.png)](http://www.tarsnap.com/bsdnow)

---

Headlines
----------

### [Multiple Bugs in OpenBSD Kernel](http://marc.info/?l=oss-security&m=146853062403622&w=2) ###

* Its patch Wednesday! (OR last Thursday if you were watching the mailing lists)
* Jesse Hertz and Tim Newsham (part of the NCC Group calling themselves project Triforce) have been working with the OpenBSD team to fix some newly discovered bugs in the kernel using fuzzing.
* Specifically they were able to track down several potential methods to corrupt memory or panic the kernel:
  * mmap\_panic: Malicious calls to mmap() can trigger an allocation panic or trigger memory corruption.
  * kevent\_panic: Any user can panic the kernel with the kevent system call.
  * thrsleep\_panic: Any user can panic the kernel with the \_\_thrsleep system Call.
  * thrsigdivert\_panic: Any user can panic the kernel with the \_\_thrsigdivert system call.
  * ufs\_getdents\_panic: Any user can panic the kernel with the getdents system call.
  * mount\_panic: Root users, or users on systems with kern.usermount set to true, can trigger a kernel panic when mounting a tmpfs filesystem.
  * unmount\_panic: Root users, or users on systems with kern.usermount set to true, can trigger a kernel panic when unmounting a filesystem.
  * tmpfs\_mknod\_panic: Root can panic kernel with mknod on a tmpfs filesystem.

* This was a great find, and we have a link to more of the results, if you would like to explore them in more detail.
* [NCC Group OpenBSD Kernel fuzzing results](http://www.openwall.com/lists/oss-security/2016/07/14/5)
* Would like to see more work like this done in all of the BSDs \*\*\*

### [Running CockroachDB in a FreeBSD Jail](https://www.cockroachlabs.com/blog/critters-in-a-jar-running-cockroachdb-in-a-freebsd-jail/) ###

* The developers behind CockroachDB have written up a nice walkthrough of getting their software to run inside FreeBSD jails.

>
>
> “Manually encapsulating CockroachDB using Linux cgroups is no easy task, which is why tools like Docker exist in the first place. By comparison, running server processes natively in FreeBSD jails is straightforward and robust.”
>
>

* The walkthrough begins with compiling CockroachDB straight from source (A port is pending), which is pretty easy relying upon bash / git / gmake and GO.
* With the compile finished, the next step will be mounting linprocfs, although that may be going away in the future:

>
>
> “(Note: Linux compatibility files / packages / libraries are not needed further. CockroachDB uses Linux’s procfs to inspect system properties via gosigar. If/when gosigar evolves to read FreeBSD properties natively, CockroachDB will not need linprocfs any more.)”
>
>

* With the initial setup complete, the walkthrough then takes us through the process of creating the rc.d script (Which should be included with the port) and ultimately setting up ezjail and deploying CockroachDB within.
* With the word getting out about jails and their functionality, we hope to see more projects also provide walkthroughs and FreeBSD support natively. Kudos to the CockroachDB team! \*\*\*

### [Usermount bugs](https://marc.info/?l=openbsd-announce&m=146854517406640&w=2) ###

* kern.usermount, (vfs.usermount on FreeBSD) is a sysctl that can be enabled to allow an unprivileged user to mount filesystems. It is very useful for allowing non-root users to mount a USB stick or other external media.
* It is not without its dangers though: \> “kern.usermount=1 is unsafe for everyone, since it allows any non-pledged program to call the mount/umount system calls. There is no way any user can be expected to keep their system safe / reliable with this feature. Ignore setting to =1, and after release we'll delete the sysctl entirely.”
* In OpenBSD 6.0 and forward, the setting will no longer work, and root privileges will be required to mount a filesystem
* If there is a bug in the filesystem driver, the user could potentially exploit that and root the system \> “In addition to the patched bugs, several panics were discovered by NCC that can be triggered by root or users with the usermount option set. These bugs are not getting patched because we believe they are only the tip of the iceberg. The mount system call exposes too much code to userland to be considered secure”
* This is a very pragmatic way of dealing with these issues, as it is not really possible to be sure that EVERY bug has been fixed, and that this feature is no longer an exploit vector
* [usermount being removed from OpenBSD](http://undeadly.org/cgi?action=article&sid=20160715125022)
* I use this facility in FreeBSD extensively, combined with ZFS permission delegation, to allow non-root users to create and mount new ZFS datasets, and to do replication without requiring any root access
* There are some safety belts, for instance: the user must own the directory that the new filesystem will be mounted to, so they can’t mount to /etc and replace the password file with their own \*\*\*

### [Let's Encrypt client from BSD in C](https://kristaps.bsd.lv/letskencrypt/) ###

* File this one under the category of “It’s about time!”, but Kristaps (Who we’ve interviewed in the past) has released some new software for interacting with letsencrypt.
* The header for the project site sums it up nicely:

>
>
> “Be up-front about security: OpenSSL is known to have issues, you can't trust what comes down the pipe, and your private key's integrity is a hard requirement. Not a situation where you can be careless. letskencrypt is a client for Let's Encrypt users, but one designed for security. No Python. No Ruby. No Bash.A straightforward, open source implementation in C that isolates each step of the sequence.”
>
>

* What specifically does it isolate you ask? Right now it is broken down into 6 steps:

read and parse an account and domain private key  
 authenticate with the Let's Encrypt server  
 authorise each domain listed for the certificate  
 submit the X509 request  
 receive and serialise the signed X509 certificate  
 request, receive, and serialise the certificate chain from the issuer

* I don’t know about all of you, but I’m going to be switching over one of my systems this weekend. \*\*\*

News Roundup
----------

### [Videos from the FOSDEM BSD Dev room are now online](https://video.fosdem.org/2016/k4601/) ###

* The videos from the BSD Dev room at FOSDEM have been stealthily posted online at some point since last I checked
* The videos are individually linked from the talks on the [Schedule ](https://archive.fosdem.org/2016/schedule/track/bsd/)
* The talk pages also include the slides, which can help you to follow along \*\*\*

### [FreeBSD on Jetson TK1](http://kernelnomicon.org/?p=628) ###

* The nVidia Jetson TK1 is a medium sized ARM device that is a big more than your standard Raspberry Pi
* The device has:
  * NVIDIA 4-Plus-1™ Quad-Core ARM® Cortex™-A15 CPU (2.3 GHz)
  * NVIDIA Kepler GPU with 192 CUDA Cores
  * 2 GB DDR3L x16 Memory with 64-bit Width
  * 16 GB 4.51 eMMC Memory
  * 1 Half Mini-PCIE Slot
  * 1 Full-Size SD/MMC Connector
  * 1 Full-Size HDMI Port
  * 1 USB 2.0 Port, Micro AB
  * 1 USB 3.0 Port, A
  * 1 RS232 Serial Port
  * 1 ALC5639 Realtek Audio Codec with Mic In and Line Out
  * 1 RTL8111GS Realtek GigE LAN
  * 1 SATA Data Port
  * SPI 4 MByte Boot Flash

* The following signals are available through an expansion port:
  * DP/LVDS
  * Touch SPI 1x4 + 1x1 CSI-2
  * GPIOs
  * UART
  * HSIC
  * i2c

* The device costs $192 USD from nVidia or Amazon
* Oleksandr Tymoshenko ([gonzo@freebsd.org](mailto:gonzo@freebsd.org)) has a post describing what it takes to get FreeBSD running on the Jetson TK1 \> “First of all – my TK1 didn’t have U-Boot. Type of bootloader depends on the version of Linux4Tegra TK1 comes with. Mine had L4T R19, with some kind of “not u-boot” bootloader.”
* They tried using the provided tool, compiled on FreeBSD since it uses libusb, but it gave an error. Falling back to trying from Ubuntu, they got the same error.
* They then flashed the TK1 with newer firmware, and suddenly, uboot is available.
* The post then walks through pxe booting FreeBSD on the TK1
* The guide then walks through replacing the UBoot with a version compatible with UBLDR, for more features
* We’ll have to wait for another post to get FreeBSD burned onto the device, but at this point, you can reliably boot it without any user interaction
* I have one of these devices, so I am very interested in this work \*\*\*

### [Why we use OpenBSD at VidiGaurd](https://blog.vidiguard.com/why-we-use-openbsd-at-vidiguard-4521f217b2b7#.9r86v742v) ###

* VidiGuard (Which makes autonomous drone solutions for security monitoring) has posted an interesting write-up on why they use OpenBSD.
* Specifically they start by mentioning while they are in business to provide physical security, they just as equally value their data security, especially their customer data.
* They name 4 specific features that matter to them, starting with Uncompromising Quality and Security:

>
>
> “Over the past 20 years, OpenBSD’s focus on uncompromising quality and code correctness has yielded an operating system second-to-none. Code auditing and review is core to the project’s development process. The team’s focus on security includes integrated cryptography, new security mitigation techniques, and an optional-security-is-no-security stance, making it arguably the most secure operating system available today. This approach pays off in the form of only a few security updates for a given release, compared to other operating systems that might release a handful of updates every week.”
>
>

* High praise indeed! They also mention the sane-defaults, documentation and last but not least, the license as also winning factors in making OpenBSD their operating system of choice.
* Thanks to VidiGuard for publically detailing the use of BSD, and we hope to see other business follow suit! \*\*\*

### ["You can (and should) slow down and learn how things work" – Interview with Dru Lavigne](https://bsdmag.org/dru_lavigne/) ###

* If you’ve been around the BSD community for any length of time, you no doubt have heard of Dru Lavigne (Or perhaps own one of her books!)
* She was recently interviewed by Luca Ferrari for BSD Magazine and you may find it a fascinating read.
* The 2nd question asked sounded a lot like our opener to an interview (How did you get into BSD)

>
>
> “ In the mid 90s, I went back to school to learn network and system administration. As graduation grew near and I started looking for a work, I noticed that all the interesting jobs wanted Unix skills. Wanting to increase my skills, and not having any money, I did an Internet search for “Free Unix”. The first hit was freebsd.org. I went to the website and started reading the Handbook and thought “I can do this”. Since I only had access to one computer and wanted to ramp up my skills quickly, I printed out the installation and networking chapters of the Handbook. I replaced the current operating system with FreeBSD and forced myself to learn how to do everything I needed to do on that computer in FreeBSD. It was a painful (and scary) few weeks as I figured out how to transition the family’s workflow to FreeBSD, but it was also exhilarating to learn that “yes, I can do this!. Since then, I’ve had the opportunity to try out or administer the other BSDs, several Linux distros, SCO, and Solaris. I found that the layout, logic, and release engineering process of the BSDs makes the most sense to me and I’m happiest when on a BSD system.”
>
>

* When asked, Dru also had a good response to what challenges potential new UNIX or BSD users may face:

>
>
> “Students who haven’t been exposed to open source before are used to thinking of technology in terms of a purchasable brand consisting of “black boxes” that are supposed to “just work”, without having to think about how they work. You can (and should) slow down and learn how things work. It can be a mind shift to learn that the freedom to use and change how something works does exist, and isn’t considered stealing. And that learning how something works, while hard, can be fun. BSD culture, in particular, is well suited for those who have the time and temperament to dive into how things work. With over 40 years of freely available source and commit messages, you can dive as deep as you want into learning how things came to be, how they evolved over the years, how they work now, and how they can be improved. There is a diverse range of stuff to choose from: from user tools to networking to memory management to hardware drivers to security mechanisms and so on. There is also a culture of sharing and learning and encouragement for users who demonstrate that they have done their homework and have their own ideas to contribute.”
>
>

* The interview is quite long, and Dru provides fantastic insights into more aspects of BSD in general. Well worth your time to read! \*\*\*

Beastie Bits:
----------

* [Ed Maste is seeking testing 'without\_gpl\_dtc'](https://twitter.com/ed_maste/status/755474764479672321)

* [“PAM Mastery” tech reviewers wanted](http://blather.michaelwlucas.com/archives/2717)

* [OPNsense 16.7 RC2](https://opnsense.org/opnsense-16-7-rc2-released/)

* [Jupyter Notebook for bootstrapping Arduino on FreeBSD](https://nbviewer.jupyter.org/github/DadAtH-me/Projects/blob/master/arduino-on-nix.ipynb)

* [The Design and Implementation of the Anykernel and Rump Kernels (second edition)](http://www.fixup.fi/misc/rumpkernel-book/)

* [Complete desktop synchronisation with Unison and FreeBSD jails (xjails)](https://github.com/kbs1/freebsd-synced-xjails)

  ---

Feedback/Questions
----------

* [ Eric - List most popular files](http://pastebin.com/S7u0VeVi)
* [ Robroy - ZFS Write Cache](http://pastebin.com/81Zmj0cX)
* [ Luis - FreeNAS HW Setup](http://pastebin.com/SfeKR7v2)
* [ Emett - Python Followup](http://pastebin.com/wy4ar0YH)
* [ Peter - Multicast + Jails](http://pastebin.com/zd2QAu25) \*\*\*