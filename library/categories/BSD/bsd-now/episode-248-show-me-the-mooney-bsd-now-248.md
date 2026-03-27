+++
title = "Episode 248: Show Me The Mooney | BSD Now 248"
description = "DragonflyBSD release 5.2.1 is here, BPF kernel exploit writeup, Remote Debugging the running OpenBSD kernel, interview with Patrick Mooney, FreeBSD buildbot setup in a jail, dumping your USB, and 5 years of gaming on FreeBSD.Headlines[DragonFlyBSD: release52 (w/stab"
date = "2018-05-29T18:30:00Z"
url = "https://www.bsdnow.tv/248"
author = "feedback@bsdnow.tv (JT Pennington)"
text = ""
lastupdated = "2026-03-26T14:37:50.750770530Z"
seen = false
+++

DragonflyBSD release 5.2.1 is here, BPF kernel exploit writeup, Remote Debugging the running OpenBSD kernel, interview with Patrick Mooney, FreeBSD buildbot setup in a jail, dumping your USB, and 5 years of gaming on FreeBSD.

Headlines
----------

### [DragonFlyBSD: release52 (w/stable HAMMER2, as default root)](https://www.dragonflybsd.org/release52/) ###

* DragonflyBSD 5.2.1 was released on May 21, 2018
* \> Big Ticket items:
  >  Meltdown and Spectre mitigation support Meltdown isolation and spectre mitigation support added. Meltdown mitigation is automatically enabled for all Intel cpus. Spectre mitigation must be enabled manually via sysctl if desired, using sysctls machdep.spectre*mitigation and machdep.meltdown*mitigation. HAMMER2 H2 has received a very large number of bug fixes and performance improvements. We can now recommend H2 as the default root filesystem in non-clustered mode. Clustered support is not yet available. ipfw Updates Implement state based "redirect", i.e. without using libalias. ipfw now supports all possible ICMP types. Fix ICMP*MAXTYPE assumptions (now 40 as of this release). Improved graphics support The drm/i915 kernel driver has been updated to support Intel Coffeelake GPUs Add 24-bit pixel format support to the EFI frame buffer code. Significantly improve fbio support for the "scfb" XOrg driver. This allows EFI frame buffers to be used by X in situations where we do not otherwise support the GPU. Partly implement the FBIO*BLANK ioctl for display powersaving. Syscons waits for drm modesetting at appropriate places, avoiding races.

---

### [PS4 4.55 BPF Race Condition Kernel Exploit Writeup](<https://github.com/Cryptogenic/Exploit-Writeups/blob/master/FreeBSD/PS4 4.55 BPF Race Condition Kernel Exploit Writeup.md>) ###

>
>
> Note: While this bug is primarily interesting for exploitation on the PS4, this bug can also potentially be exploited on other unpatched platforms using FreeBSD if the attacker has read/write permissions on /dev/bpf, or if they want to escalate from root user to kernel code execution. As such, I've published it under the "FreeBSD" folder and not the "PS4" folder.
>
>

* Introduction

>
>
> Welcome to the kernel portion of the PS4 4.55FW full exploit chain write-up. This bug was found by qwerty, and is fairly unique in the way it's exploited, so I wanted to do a detailed write-up on how it worked. The full source of the exploit can be found [here](https://github.com/Cryptogenic/PS4-4.55-Kernel-Exploit). I've previously covered the webkit exploit implementation for userland access [here](<https://github.com/Cryptogenic/Exploit-Writeups/blob/master/WebKit/setAttributeNodeNS UAF Write-up.md>).
>
>

* FreeBSD or Sony's fault? Why not both...

>
>
> Interestingly, this bug is actually a FreeBSD bug and was not (at least directly) introduced by Sony code. While this is a FreeBSD bug however, it's not very useful for most systems because the /dev/bpf device driver is root-owned, and the permissions for it are set to 0600 (meaning owner has read/write privileges, and nobody else does) - though it can be used for escalating from root to kernel mode code execution. However, let’s take a look at the make\_dev() call inside the PS4 kernel for /dev/bpf (taken from a 4.05 kernel dump).
>
>

` seg000:FFFFFFFFA181F15B lea rdi, unk_FFFFFFFFA2D77640 seg000:FFFFFFFFA181F162 lea r9, aBpf ; "bpf" seg000:FFFFFFFFA181F169 mov esi, 0 seg000:FFFFFFFFA181F16E mov edx, 0 seg000:FFFFFFFFA181F173 xor ecx, ecx seg000:FFFFFFFFA181F175 mov r8d, 1B6h seg000:FFFFFFFFA181F17B xor eax, eax seg000:FFFFFFFFA181F17D mov cs:qword_FFFFFFFFA34EC770, 0 seg000:FFFFFFFFA181F188 call make_dev `

>
>
> We see UID 0 (the UID for the root user) getting moved into the register for the 3rd argument, which is the owner argument. However, the permissions bits are being set to 0x1B6, which in octal is 0666. This means anyone can open /dev/bpf with read/write privileges. I’m not sure why this is the case, qwerty speculates that perhaps bpf is used for LAN gaming. In any case, this was a poor design decision because bpf is usually considered privileged, and should not be accessible to a process that is completely untrusted, such as WebKit. On most platforms, permissions for /dev/bpf will be set to 0x180, or 0600.
>
>

* Race Conditions - What are they?

>
>
> The class of the bug abused in this exploit is known as a "race condition". Before we get into bug specifics, it's important for the reader to understand what race conditions are and how they can be an issue (especially in something like a kernel). Often in complex software (such as a kernel), resources will be shared (or "global"). This means other threads could potentially execute code that will access some resource that could be accessed by another thread at the same point in time. What happens if one thread accesses this resource while another thread does without exclusive access? Race conditions are introduced.
>
>
>
> Race conditions are defined as possible scenarios where events happen in a sequence different than the developer intended which leads to undefined behavior. In simple, single-threaded programs, this is not an issue because execution is linear. In more complex programs where code can be running in parallel however, this becomes a real issue. To prevent these problems, atomic instructions and locking mechanisms were introduced. When one thread wants to access a critical resource, it will attempt to acquire a "lock". If another thread is already using this resource, generally the thread attempting to acquire the lock will wait until the other thread is finished with it. Each thread must release the lock to the resource after they're done with it, failure to do so could result in a deadlock.
>
>
>
> While locking mechanisms such as mutexes have been introduced, developers sometimes struggle to use them properly. For example, what if a piece of shared data gets validated and processed, but while the processing of the data is locked, the validation is not? There is a window between validation and locking where that data can change, and while the developer thinks the data has been validated, it could be substituted with something malicious after it is validated, but before it is used. Parallel programming can be difficult, especially when, as a developer, you also want to factor in the fact that you don't want to put too much code in between locking and unlocking as it can impact performance.
>
>

* See [article](<https://github.com/Cryptogenic/Exploit-Writeups/blob/master/FreeBSD/PS4 4.55 BPF Race Condition Kernel Exploit Writeup.md>) for the rest

---

**iXsystems**

### [Remote Debugging the running OpenBSD kernel](http://bijanebrahimi.github.io/blog/remote-debugging-the-running-openbsd-kernel.html) ###

* Subtitled: A way to understand the OpenBSD internals +\> The Problem +\> A few month ago, I tried porting the FreeBSD kdb along with it's gdb stub implementations to OpenBSD as a practice of learning the internals of an BSD operating system. The ddb code in both FreeBSD and OpenBSD looks pretty much the same and the GDB Remote Serial Protocol looks very minimal. +\> But sadly I got very busy and the work is stalled but I'm planning on resuming the attempt as soon as I get the chance, But there is an alternative way to Debugging the OpenBSD kernel via QEMU. What I did below is basically the same with a few minor changes which I hope to describe it as best. +\> Installing OpenBSD on Qemu +\> For debugging the kernel, we need a working OpenBSD system running on Qemu. I chose to create a raw disk file to be able to easily mount it later via the host and copy the custom kernel onto it.
  >  $ qemu-img create -f raw disk.raw 5G $ qemu-system-x86*64 -m 256M \\ -drive format=raw,file=install63.fs \\ -drive format=raw,file=disk.raw +\> Custom Kernel +\> To debug the kernel, we need a version of the kernel with debugging symbols and for that we have to recompile it first. The process is documented at Building the System from Source: ... +\> Then we can copy the bsd kernel to the guest machine and keep the bsd.gdb on the host to start the remote debugging via gdb. +\> Remote debugging kernel +\> Now it's to time to boot the guest with the new custom kernel. Remember that the -s argument enables the gdb server on qemu on localhost port 1234 by default: $ qemu-system-x86*64 -m 256M -s \\ -net nic -net user \\ -drive format=raw,file=install63.fs \\ +\> Now to finally attach to the running kernel:

---

Interview - Patrick Mooney - Software Engineer [pmooney@pfmooney.com](pmooney@pfmooney.com) / [@pfmooney](https://twitter.com/pfmooney)
----------

* BR: How did you first get introduced to UNIX?
* AJ: What got you started contributing to an open source project?
* BR: What sorts of things have you worked on in the past?
* AJ: Can you tell us more about what attracted you to illumos?
* BR: How did you get interested in, and started with, systems development?
* AJ: When did you first get interested in bhyve?
* BR: How much work was it to take the years-old port of bhyve and get it working on modern IllumOS?
* AJ: What was the process for getting the bhyve port caught up to current FreeBSD?
* BR: How usable is bhyve on illumOS?
* AJ: What area are you most interested in improving in bhyve?
* BR: Do you think the FreeBSD and illumos versions of bhyve will stay in sync with each other?
* AJ: What do you do for fun?
* BR: Anything else you want to mention?

---

News Roundup
----------

### [Setting up buildbot in FreeBSD Jails](https://andidog.de/blog/2018-04-22-buildbot-setup-freebsd-jails) ###

>
>
> In this article, I would like to present a tutorial to set up buildbot, a continuous integration (CI) software (like Jenkins, drone, etc.), making use of FreeBSD’s containerization mechanism "jails". We will cover terminology, rationale for using both buildbot and jails together, and installation steps. At the end, you will have a working buildbot instance using its sample build configuration, ready to play around with your own CI plans (or even CD, it’s very flexible!). Some hints for production-grade installations are given, but the tutorial steps are meant for a test environment (namely a virtual machine). Buildbot’s configuration and detailed concepts are not in scope here.
>
>

* Table of contents

  * Choosing host operating system and version for buildbot
  * Create a FreeBSD playground
  * Introduction to jails
  * Overview of buildbot
  * Set up jails
  * Install buildbot master
  * Run buildbot master
  * Install buildbot worker
  * Run buildbot worker
  * Set up web server nginx to access buildbot UI
  * Run your first build
  * Production hints
  * Finished!

* Choosing host operating system and version for buildbot

>
>
> We choose the released version of FreeBSD (11.1-RELEASE at the moment). There is no particular reason for it, and as a matter of fact buildbot as a Python-based server is very cross-platform; therefore the underlying OS platform and version should not make a large difference.
>
>
>
> It will make a difference for what you do with buildbot, however. For instance, poudriere is the de-facto standard for building packages from source on FreeBSD. Builds run in jails which may be any FreeBSD base system version older or equal to the host’s version (reason will be explained below). In other words, if the host is FreeBSD 11.1, build jails created by poudriere could e.g. use 9.1, 10.3, 11.0, 11.1, but potentially not version 12 or newer because of incompatibilities with the host’s kernel (jails do not run their own kernel as full virtual machines do). To not prolong this article over the intended scope, the details of which nice things could be done or automated with buildbot are not covered.
>
>
>
> Package names on the FreeBSD platform are independent of the OS version, since external software (as in: not part of base system) is maintained in FreeBSD ports. So, if your chosen FreeBSD version (here: 11) is still officially supported, the packages mentioned in this post should work. In the unlikely event of package name changes before you read this article, you should be able to find the actual package names like pkg search buildbot.
>
>
>
> Other operating systems like the various Linux distributions will use different package names but might also offer buildbot pre-packaged. If not, the buildbot installation manual offers steps to install it manually. In such case, the downside is that you will have to maintain and update the buildbot modules outside the stability and (semi-)automatic updates of your OS packages.
>
>

* See [article](https://andidog.de/blog/2018-04-22-buildbot-setup-freebsd-jails) for the rest

---

**DigitalOcean**

### [Dumping your USB](http://www.grenadille.net/post/2018/03/29/Dumping-your-USB) ###

>
>
> One of the many new features of OpenBSD 6.3 is the possibility to dump USB traffic to userland via bpf(4). This can be done with tcpdump(8) by specifying a USB bus as interface:
>
>

```

tcpdump -Xx -i usb0
==========

tcpdump: listening on usb0, link-type USBPCAP 12:28:03.317945 bus 0 \< addr 1: ep1 intr 2 0000: 0400 ..

12:28:03.318018 bus 0 \> addr 1: ep0 ctrl 8 0000: 00a3 0000 0002 0004 00 .........   
 [...] ```

>
>
> As you might have noted I decided to implement the existing USBPcap capture format. A capture format is required because USB packets do not include all the necessary information to properly interpret them. I first thought I would implement libpcap's DLT*USB but then I quickly realize that this was not a standard. It is instead a FreeBSD specific format which has been since then renamed DLT*USB*FREEBSD. But I didn't want to embrace xkcd #927, so I look at the existing formats: DLT*USB*FREEBSD, DLT*USB*LINUX, DLT*USB*LINUX*MMAPPED, DLT*USB*DARWIN and DLT\_USBPCAP. I was first a bit sad to see that nobody could agree on a common format then I moved on and picked the simplest one: USBPcap. Implementing an already existing format gives us out-of-box support for all the tools supporting it. That's why having common formats let us share our energy. In the case of USBPcap it is already supported by Wireshark, so you can already inspect your packet graphically. For that you need to first capture raw packets:
>
>

```

tcpdump -s 3303 -w usb.pcap -i usb0
==========

tcpdump: listening on usb0, link-type USBPCAP ^C 208 packets received by filter 0 packets dropped by kernel ```

>
>
> USB packets can be quite big, that's why I'm not using tcpdump(8)'s default packet size. In this case, I want to make sure I can dump the complete uaudio(4) frames. It is important to say that what is dumped to userland is what the USB stack sees. Packets sent on the wire might differ, especially when it comes to retries and timing. So this feature is not here to replace any USB analyser, however I hope that it will help people understand how things work and what the USB stack is doing. Even I found some interesting timing issues while implementing isochronous support.
>
>

---

### [Run OpenBSD on your web server](https://www.romanzolotarev.com/openbsd/webserver.html) ###

* [Deploy and login to your OpenBSD server first.](https://www.romanzolotarev.com/vultr.html)

>
>
> As soon as you're there you can enable an httpd(8) daemon, it's already installed on OpenBSD, you just need to configure it:
>
>

`www# vi /etc/httpd.conf`

* Add two server sections---one for www and another for naked domain (all requests are redirected to www).

``` server "www.example.com" { listen on \* port 80 root "/htdocs/www.example.com" }

server "example.com" { listen on \* port 80 block return 301 "http://www.example.com$REQUEST\_URI" } ```

* httpd is chrooted to /var/www by default, so let's make a document root directory:

`www# mkdir -p /var/www/htdocs/www.example.com`

* Save and check this configuration:

` www# httpd -n configuration ok `

* Enable httpd(8) daemon and start it.

` www# rcctl enable httpd www# rcctl start httpd `

* Publish your website

* Copy your website content into /var/www/htdocs/www.example.com and then test it your web browser.

`http://XXX.XXX.XXX.XXX/`

>
>
> Your web server should be up and running.
>
>

* Update DNS records

>
>
> If there is another HTTPS server using this domain, configure that server to redirect all HTTPS requests to HTTP.
>
>
>
> Now as your new server is ready you can update DNS records accordingly.
>
>

` example.com. 300 IN A XXX.XXX.XXX.XXX www.example.com. 300 IN A XXX.XXX.XXX.XXX `

* Examine your DNS is propagated.

`$ dig example.com www.example.com`

* Check IP addresses it answer sections. If they are correct, you should be able to access your new web server by its domain name.

* [What's next? Enable HTTPS on your server.](https://www.romanzolotarev.com/openbsd/acme-client.html)

---

### [Modern Akonadi and KMail on FreeBSD](https://euroquis.nl/bobulate/?p=1827) ###

>
>
> For, quite literally a year or more, KMail and Akonadi on FreeBSD have been only marginally useful, at best. KDE4 era KMail was pretty darn good, but everything after that has had a number of FreeBSD users tearing out their hair. Sure, you can go to Trojitá, which has its own special problems and is generally “meh”, or bail out entirely to webmail, but .. KMail is a really great mail client when it works. Which, on Linux desktops, is nearly always, and on FreeBSD, is was nearly never.
>
>
>
> I looked at it with Dan and Volker last summer, briefly, and we got not much further than “hmm”. There’s a message about “The world is going to end!” which hardly makes sense, it means that a message has been truncated or corrupted while traversing a UNIX domain socket.
>
>
>
> Now Alexandre Martins — praise be! — has wandered in with a likely solution. KDE Bug 381850 contains a suggestion, which deserves to be publicised (and tested):
>
>

`sysctl net.local.stream.recvspace=65536` `sysctl net.local.stream.sendspace=65536`

>
>
> The default FreeBSD UNIX local socket buffer space is 8kiB. Bumping the size up to 64kiB — which matches the size that Linux has by default — suddenly makes KMail and Akonadi shine again. No other changes, no recompiling, just .. bump the sysctls (perhaps also in /etc/sysctl.conf) and KMail from Area51 hums along all day without ending the world.
>
>
>
> Since changing this value may have other effects, and Akonadi shouldn’t be dependent on a specific buffer size anyway, I’m looking into the Akonadi code (encouraged by Dan) to either automatically size the socket buffers, or to figure out where in the underlying code the assumption about buffer size lives. So for now, sysctl can make KMail users on FreeBSD happy, and later we hope to have things fully automatic (and if that doesn’t pan out, well, pkg-message exists).
>
>
>
> PS. Modern KDE PIM applications — Akonadi, KMail — which live in the deskutils/ category of the official FreeBSD ports were added to the official tree April 10th, so you can get your fix now from the official tree.
>
>

---

Beastie Bits
----------

* [pkg-provides support for DragonFly (from Rodrigo Osorio)](http://lists.dragonflybsd.org/pipermail/users/2018-April/335722.html)
* [Memories of writing a parser for man pages](https://monades.roperzh.com/memories-writing-parser-man-pages/)
* [Bryan Cantrill interview over at DeveloperOnFire podcast](http://developeronfire.com/podcast/episode-198-bryan-cantrill-persistence-and-action)
* [1978-03-25 - 2018-03-25: 40 years BSD Mail](http://minnie.tuhs.org/pipermail/tuhs/2018-March/013285.html)
* [My 5 years of FreeBSD gaming: a compendium of free games and engines running natively on FreeBSD](https://imgur.com/a/KOTJS)
* [Sequential Resilver being upstreamed to FreeBSD, from FreeNAS, where it was ported from ZFS-on-Linux](https://reviews.freebsd.org/D15562)
* [University of Aberdeen’s Internet Transport Research Group is hiring ](https://lists.freebsd.org/pipermail/freebsd-jobs/2018-May/000944.html)

---

**Tarsnap ad**

Feedback/Questions
----------

* Dave - [mounting non-filesystem things inside jails](http://dpaste.com/0KHRB4Z#wrap)
* Morgan - [ZFS on Linux Data loss bug](http://dpaste.com/10QD42T#wrap)
* Rene - [How to keep your ISP’s nose out of your browser history with encrypted DNS](http://dpaste.com/30VM51S#wrap)
* Rodriguez - [Feedback question! Relating to Windows](http://dpaste.com/3WVYR9D#wrap)

---

* Send questions, comments, show ideas/topics, or stories you want mentioned on the show to [feedback@bsdnow.tv](mailto:feedback@bsdnow.tv)