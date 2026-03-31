+++
title = "234: Code and Community"
description = "GSoC 2018 Projects announced, tutorial FreeBSD jails with iocage, new Code of Conduct for FreeBSD, libhijack, and fancy monitoring for OpenSMTPDThis episode was brought to you by[iXsystems - Enterprise Servers and Storage for Open Source](http://www.ix"
date = "2018-02-21T13:00:00Z"
url = "https://www.bsdnow.tv/234"
author = "feedback@bsdnow.tv (JT Pennington)"
text = ""
lastupdated = "2026-03-26T14:37:50.787840962Z"
seen = true
+++

GSoC 2018 Projects announced, tutorial FreeBSD jails with iocage, new Code of Conduct for FreeBSD, libhijack, and fancy monitoring for OpenSMTPD

This episode was brought to you by
----------

[![iXsystems - Enterprise Servers and Storage for Open Source](/images/1.png)](http://www.ixsystems.com/bsdnow)[![DigitalOcean - Simple Cloud Hosting, Built for Developers](/images/2.png)](http://www.digitalocean.com/)[![Tarsnap - Online Backups for the Truly Paranoid](/images/3.png)](http://www.tarsnap.com/bsdnow)

---

Headlines
----------

### [Google Summer of Code 2018](https://summerofcode.withgoogle.com/organizations/?sp-page=5) ###

* [FreeBSD](https://www.freebsd.org/projects/summerofcode.html)
* [FreeBSD Google Summer oF Code Ideas](https://wiki.freebsd.org/SummerOfCodeIdeas)

>
>
> You can join #freebsd-soc on the efnet IRC network to chat with FreeBSD developers interested in mentoring student proposals and projects, past FreeBSD/GSoC students, and other students applying to FreeBSD/GSoC this year.
>
>

* [NetBSD](https://mail-index.netbsd.org/netbsd-advocacy/2018/02/12/msg000765.html)

>
>
> You can get a stipend (paid for by Google) and spend a few months getting to know and improving the insides of NetBSD or pkgsrc.
>
>

```
The schedule is:
12-27 March             Applying
23 April                Find out if you were accepted
14 May - 22 August      Do the project!

We have some suggestions for suitable projects:
- ARM EFI bootloader
- Using libFuzzer on base tools
- Refactoring ALTQ (QoS implementation) and integrating with NPF
- Testsuite for libcurses
- Improve pkgin

Other suggestions and details are at:
https://wiki.netbsd.org/projects/gsoc/

```

>
>
> These projects are suggestions; you can come up with your own. Suggestions for other suitable projects are welcome.
>
>
>
> Feel free to contact, or chat around on IRC: irc.freenode.org #netbsd #netbsd-code #pkgsrc
>
>

* [Haiku](https://summerofcode.withgoogle.com/organizations/4821756754264064/)
  * [Students: How to Apply for a Haiku Idea](https://www.haiku-os.org/community/gsoc/2018/students)
  * [Project Ideas](https://www.haiku-os.org/community/gsoc/2018/ideas) \> If you have questions you can contact the devs on IRC: irc.freenode.org #haiku

---

### [FreeBSD Jails with iocage](http://norrist.devio.us/iocage_freebsd.html) ###

* Introduction

>
>
> FreeBSD jails allow users to run multiple, isolated instances of FreeBSD on a single server. Iocage simplifies the management of FreeBSD Jails. Following this tutorial, the jails will be configured to bind to an IP address on the jail host's internal network, and the host OS will pass traffic from the external network to the jail.
>
>
>
> The jails will be managed with Iocage. Iocage uses ZFS properties to store configuration data for each jail, so a ZFS file system is required.
>
>

* Network setup These steps will:
  * Set up the internal network.
  * Enable the pf packet filter
  * Configure pf pass internet traffic to and from the jail.

>
>
> PF is full featured firewall, and can do more than just pass traffic to an internal network. Refer to the PF documentation for additional configuration options.
>
>

* Run the following to configure the internal network and enable pf.

```
sysrc cloned_interfaces+="lo1"
sysrc ifconfig_lo1="inet 192.0.2.1/24"
sysrc pf_enable="YES"

```

* Put the following in /etc/pf.conf

```
# Variables
# ext_if should be set to the hosts external NIC
ext_if = "vtnet0"
jail_if = "lo1"
jail_net = $jail_if:network

# NAT allows the jails to access the external network
nat on $ext_if from $jail_net to any -> ($ext_if)

# Redirect traffic on port 80 to the web server jail
# Add similar rules for additional jails
rdr pass on $ext_if inet proto tcp to port 80 -> 192.0.2.10

```

* Reboot to activate the network changes

* ZFS

>
>
> The best way to use ZFS on a VPS is to attach block storage as a new disk.  
>  If block storage is not available, you can optionally use a file as the ZFS device.
>
>

* Enable and start ZFS.

```
sysrc zfs_enable="YES"
service zfs start

```

* ZFS using Block storage

>
>
> List the available disks.   
>  If you are using a VPS, the block store will probably be the second disk.
>
>

`geom disk list`

* Create a ZFS pool named jailstore.

`zpool create jailstore /dev/vtbd1`

* ZFS using a file

>
>
> Create the ZFS file.
>
>

`dd if=/dev/zero of=/zfsfile bs=1M count=4096`

* Create a ZFS pool named jailstore.

`zpool create jailstore /zfsfile`

* Install iocage the easy way

`pkg install py36-iocage`

>
>
> Skip to "Using iocage"
>
>

* Install iocage the hard way
* Swap file

>
>
> Smaller servers may not have enough RAM to build iocage. If needed, create a swap file and reboot.
>
>

```
dd if=/dev/zero of=/swapfile bs=1M count=1024
echo 'swapfile="/swapfile"' >> /etc/rc.conf
reboot

```

* Install some build dependencies

`pkg install subversion python36 git-lite libgit2 py36-pip`

* Building iocage requires the FreeBSD source.

`svn checkout https://svn.freebsd.org/base/releng/11.1 /usr/src`

* Get the latest FreeBSD ports tree.

```
portsnap fetch
portsnap extract

```

* build iocage.

```
cd /usr/ports/sysutils/iocage/
make install

```

* Using iocage

```
iocage activate jailstore
iocage fetch

iocage create -n www ip4_addr="lo1|192.0.2.10/24" -r 11.1-RELEASE
iocage start www
iocage console www

```

>
>
> Once you have a shell inside the jail, install and start Apache.
>
>

```
pkg install apache24
sysrc apache24_enable="yes"
service apache24 start

```

>
>
> Port 80 on the jail will now be accessible on the hosts IP address.
>
>

* Multiple jails.

>
>
> Additional jails can be installed using the example above.
>
>

* Install the new jail with the iocage create command , but use a different IP address
* Expose the new jail to the network by adding additional rules to pf.conf.

---

### iXsystems ###

* [SNIA Persistent Memory Summit 2018 Report](https://www.ixsystems.com/blog/snia-report-2018/)

### [New FreeBSD Code of Conduct](https://www.freebsd.org/internal/code-of-conduct.html) ###

>
>
> The FreeBSD Project is inclusive. We want the FreeBSD Project to be a venue where people of all backgrounds can work together to make the best operating system, built by a strong community. These values extend beyond just development to all aspects of the Project. All those given recognition as members of the Project in whatever form are seen as ambassadors of the Project.
>
>
>
> Diversity is a huge strength and is critical to the long term success of the Project. To that end we have a few ground rules that we ask people to adhere to. This code applies equally to everyone representing the FreeBSD Project in any way, from new members, to committers, to the core team itself. These rules are intended to ensure a safe, harassment-free environment for all and to ensure that everyone feels welcome both working within, and interacting with, the Project.
>
>
>
> This document is not an exhaustive list of things that you should not do. Rather, consider it a guide to make it easier to enrich all of us and the technical communities in which we participate.
>
>
>
> This code of conduct applies to all spaces used by the FreeBSD Project, including our mailing lists, IRC channels, and social media, both online and off. Anyone who is found to violate this code of conduct may be sanctioned or expelled from FreeBSD Project controlled spaces at the discretion of the FreeBSD Code of Conduct Committee.
>
>
>
> Some FreeBSD Project spaces may have additional rules in place, which will be made clearly available to participants. Participants are responsible for knowing and abiding by these rules.
>
>

Harassment includes but is not limited to:

* Comments that reinforce systemic oppression related to gender, gender identity and expression, sexual orientation, disability, mental illness, neurodiversity, physical appearance, body size, age, race, or religion.
* Unwelcome comments regarding a person's lifestyle choices and practices, including those related to food, health, parenting, drugs, and employment.
* Deliberate misgendering.
* Deliberate use of "dead" or rejected names.
* Gratuitous or off-topic sexual images or behaviour in spaces where they're not appropriate.
* Physical contact and simulated physical contact (e.g., textual descriptions like "*hug*" or "*backrub*") without consent or after a request to stop.
* Threats of violence.
* Incitement of violence towards any individual, including encouraging a person to commit suicide or to engage in self-harm.
* Deliberate intimidation.
* Stalking or following.
* Harassing photography or recording, including logging online activity for harassment purposes.
* Sustained disruption of discussion.
* Unwelcome sexual attention.
* Pattern of inappropriate social contact, such as requesting/assuming inappropriate levels of intimacy with others.
* Continued one-on-one communication after requests to cease.
* Deliberate "outing" of any private aspect of a person's identity without their consent except as necessary to protect vulnerable people from intentional abuse.
* Publication of non-harassing private communication without consent.
* Publication of non-harassing private communication with consent but in a way that intentionally misrepresents the communication (e.g., removes context that changes the meaning).
* Knowingly making harmful false claims about a person. \*\*\*

Interview - Benno Rice - [benno@freebsd.org](mailto:benno@freebsd.org) / [@jeamland](https://twitter.com/jeamland)
----------

---

News Roundup
----------

### [libhijack in PoC||GTFO 0x17!](https://www.soldierx.com/news/libhijack-PoCGTFO-0x17) ###

* Hijacking Your Free Beasties

>
>
> In the land of red devils known as Beasties exists a system devoid of meaningful exploit mitigations. As we explore this vast land of opportunity, we will meet our ELFish friends, [p]tracing their very moves in order to hijack them. Since unprivileged process debugging is  
>  enabled by default on FreeBSD, we can abuse PTrace to create anonymous memory mappings, inject code into them, and overwrite PLT/GOT entries. We will revive a tool called libhijack to make our nefarious activities of hijacking ELFs via PTrace relatively easy.
>
>
>
> Nothing presented here is technically new. However, this type of work has not been documented in this much detail, tying it all into one cohesive work. In Phrack 56, Silvio Cesare taught us ELF research enthusiasts how to hook the PLT/GOT. The Phrack 59 article on Runtime Process Infection briefly introduces the concept of injecting shared objects by injecting shellcode via PTrace that calls dlopen(). No other piece of research, however, has discovered the joys of forcing the application to create anonymous memory mappings in which to inject  
>  Code.
>
>
>
> This is only part one of a series of planned articles that will follow libhijack's development. The end goal is to be able to anonymously inject shared objects. The libhijack project is maintained by the SoldierX community.
>
>

* Previous Research

>
>
> All prior work injects code into the stack, the heap, or existing executable code. All three methods create issues on today's systems. On amd64 and arm64, the two architectures libhijack cares about, the stack is non-executable by default. jemalloc, the heap implementation  
>  on FreeBSD, creates non-executable mappings. Obviously overwriting existing executable code destroys a part of the executable image.
>
>

* The Role of ELF \> FreeBSD provides a nifty API for inspecting the entire virtual memory space of an application. The results returned from the API tells us the protection flags (readable, writable, executable) of each mapping. If FreeBSD provides such a rich API, why would we need to parse the ELF headers?

>
>
> PLT/GOT hijacking requires parsing ELF headers. One would not be able to find the PLT/GOT without iterating through the Process Headers to find the Dynamic Headers, eventually ending up with the DT\_PLTGOT entry.
>
>
>
> With FreeBSD's libprocstat API, we don't have a need for parsing ELF headers until we get to the PLT/GOT stage, but doing so early makes it easier for the attacker using libhijack
>
>

* The Future of libhijack

>
>
> Writing devious code in assembly is cumbersome. Assembly doesn't scale well to multiple architectures. Instead, we would like to write our devious code in C, compiling to a shared object that gets injected anonymously. This requires writing a remote RTLD within libhijack and  
>  is in progress. Writing a remote RTLD will take a while as doing so is not an easy task.
>
>
>
> Additionally, creation of a general-purpose helper library that gets injected would be helpful. It could aid in PLT/GOT redirection attacks, possibly storing the addresses of functions we've previously hijacked. This work is dependent on the remote RTLD.
>
>
>
> libhijack currently lacks documentation. Once the ABI and API stabilize, formal documentation will be written.
>
>

* Conclusion

>
>
> Using libhijack, we can easily create anonymous memory mappings, inject into them arbitrary code, and hijack the PLT/GOT on FreeBSD. On HardenedBSD, a hardened derivative of FreeBSD, libhijack is fully mitigated through PaX NOEXEC.
>
>
>
> We've demonstrated that wrapper-style Capsicum is ineffective on FreeBSD. Through the use of libhijack, we emulate a control flow hijack in which the application is forced to call sandbox\_open and fdlopen on the resulting file descriptor.
>
>
>
> Further work to support anonymous injection of full shared objects, along with their dependencies, will be supported in the future. Imagine injecting libpcap into Apache to sniff traffic whenever "GET /pcap" is sent.
>
>
>
> In order to prevent abuse of PTrace, FreeBSD should set the security.bsd.unprivileged\_proc\_debug to 0 by default. In order to prevent process manipulation, FreeBSD should implement PaX NOEXEC.
>
>

* libhijack can be found at [https://github.com/SoldierX/libhijack](https://github.com/SoldierX/libhijack)

---

### [Introduction to POSIX shell](https://sircmpwn.github.io/2018/02/05/Introduction-to-POSIX-shell.html) ###

>
>
> What the heck is the POSIX shell anyway? Well, the POSIX (the Portable Operating System Interface) shell is the standard Unix shell - standard meaning it was formally defined and shipped in a published standard. This makes shell scripts written for it portable, something no other shell can lay claim to. The POSIX shell is basically a formalized version of the venerable Bourne shell, and on your system it lives at /bin/sh, unless you’re one of the unlucky masses for whom this is a symlink to bash.
>
>

* Why use POSIX shell?

>
>
> The “Bourne Again shell”, aka bash, is not standardized. Its grammar, features, and behavior aren’t formally written up anywhere, and only one implementation of bash exists. Without a standard, bash is defined by its implementation. POSIX shell, on the other hand, has many competing implementations on many different operating systems - all of which are compatible with each other because they conform to the standard.
>
>
>
> Any shell that utilizes features specific to Bash are not portable, which means you cannot take them with you to any other system. Many Linux-based systems do not use Bash or GNU coreutils. Outside of Linux, pretty much everyone but Hurd does not ship GNU tools, including bash1. On any of these systems, scripts using “bashisms” will not work.
>
>
>
> This is bad if your users wish to utilize your software anywhere other than GNU/Linux. If your build tooling utilizes bashisms, your software will not build on anything but GNU/Linux. If you ship runtime scripts that use bashisms, your software will not run on anything but GNU/Linux. The case for sticking to POSIX shell in shipping software is compelling, but I argue that you should stick to POSIX shell for your personal scripts, too. You might not care now, but when you feel like flirting with other Unicies you’ll thank me when all of your scripts work.
>
>
>
> One place where POSIX shell does not shine is for interactive use - a place where I think bash sucks, too. Any shell you want to use for your day-to-day command line work is okay in my book. I use fish. Use whatever you like interactively, but stick to POSIX sh for your scripts.
>
>

* How do I use POSIX shell?

>
>
> At the top of your scripts, put #!/bin/sh. You don’t have to worry about using env here like you might have been trained to do with bash: /bin/sh is the standardized location for the POSIX shell, and any standards-conforming system will either put it there or make your script work anyway.
>
>
>
> The next step is to avoid bashisms. There are many, but here are a few that might trip you up:
>
>

* [[ condition ]] does not work; use [ condition ]
* Arrays do not work; use IFS
* Local variables do not work; use a subshell

>
>
> The easiest way to learn about POSIX shell is to read the standard - it’s not too dry and shorter than you think.
>
>

* Using standard coreutils

>
>
> The last step to writing portable scripts is to use portable tools. Your system may have GNU coreutils installed, which provides tools like grep and cut. Unfortunately, GNU has extended these tools with its own non-portable flags and tools. It’s important that you avoid these.
>
>
>
> One dead giveaway of a non-portable flag is long flags, e.g. grep --file=FILE as opposed to grep -f. The POSIX standard only defines the getopt function - not the proprietary GNU getopt\_long function that’s used to interpret long options. As a result, no long flags are standardized. You might worry that this will make your scripts difficult to understand, but I think that on the whole it will not. Shell scripts are already pretty alien and require some knowledge to understand. Is knowledge of what the magic word grep means much different from knowledge of what grep -E means?
>
>
>
> I also like that short flags allow you to make more concise command lines. Which is better: ps --all --format=user --without-tty, or ps -aux? If you are inclined to think the former, do you also prefer function(a, b, c) { return a + b + c; } over (a, b, c) =\> a + b + c? Conciseness matters, and POSIX shell supports comments if necessary!
>
>

* Some tips for using short flags:
* They can be collapsed: cmd -a -b -c is equivalent to cmd -abc
* If they take additional arguments, either a space or no separation is acceptable: cmd -f"hello world" or cmd -f "hello world"

>
>
> A good reference for learning about standardized commands is, once again, the standard. From this page, search for the command you want, or navigate through “Shell & Utilities” -\> “Utilities” for a list. If you have man-pages installed, you will also find POSIX man pages installed on your system with the p postfix, such as man 1p grep. Note: at the time of writing, the POSIX man pages do not use dashes if your locale is UTF-8, which makes searching for flags with / difficult. Use env LC\_ALL=POSIX man 1p grep if you need to search for flags, and I’ll speak to the maintainer of man-pages about this.
>
>

---

### [FreeBSD Broadcom Wi-Fi Improvements](http://landonf.org/code/freebsd/Broadcom_WiFi_Improvements.20180122.html) ###

* Introduction

>
>
> Since 2015, I've been working on improving FreeBSD support for Broadcom Wi-Fi devices and SoCs, including authoring the bhnd(4) driver family, which provides a unified bus and driver programming interface for these devices.
>
>
>
> First committed in early 2016, bhnd(4) allowed us to quickly bring up FreeBSD/MIPS on Broadcom SoCs, but it has taken much longer to implement the full set of features required to support modern Broadcom SoftMAC Wi-Fi hardware.
>
>
>
> Thanks to the generosity of the FreeBSD Foundation, I've recently finished implementing the necessary improvements to the bhnd(4) driver family. With these changes in place, I was finally able to port the existing bwn(4) Broadcom SoftMAC Wi-Fi driver to the bhnd(4) bus, and implement initial support for the BCM43224 and BCM43225 chipsets, with additional hardware support to be forthcoming.
>
>
>
> Now that my efforts on FreeBSD/Broadcom Wi-Fi support have progressed far enough to be generally useful, I wanted to take some time to provide a brief overview of Broadcom's Wi-Fi hardware, and explain how my work provides a foundation for further FreeBSD Broadcom Wi-Fi/SoC improvements.
>
>

* A Brief Background on Broadcom Wi-Fi Hardware

>
>
> Broadcom's Wi-Fi devices are members of the Broadcom Home Networking Division (BHND) device family; other BHND devices include MIPS/ARM SoCs (including Wi-Fi SoCs commonly found in consumer access points), as well as a large variety of related networking hardware.
>
>

* BHND devices utilize a common set of Broadcom IP cores (or "functional blocks") connected via one of two on-chip bus architectures:
* Hardware designed prior to 2009 used Broadcom’s “SSB” backplane architecture, based on Sonics Silicon’s interconnect IP.
* Subsequent hardware adopted Broadcom’s “BCMA” backplane, based on ARM’s AMBA IP. The IP cores used in earlier SSB-based devices were adapted for compatibility with the new backplane.

>
>
> When BHND hardware is used in a PCI Wi-Fi card, or a SDIO Wi-Fi module, the device's dual-mode peripheral controller is configured to operate as an endpoint device on the host's peripheral bus, bridging access to the SoC hardware:
>
>

* Host access to SoC address space is provided via a set of register windows (e.g., a set of configurable windows into SoC address space mapped via PCI BARs)
* DMA is supported by the bridge core’s sparse mapping of host address space into the backplane address space. These address regions may be used as a target for the on-chip DMA engines.
* Any backplane interrupt vectors routed to the bridge core may be mapped by the bridge to host interrupts (e.g., PCI INTx/MSI/MSI-X).

>
>
> The host is generally expected to provide drivers for the IP cores found on the SoC backplane; since these cores are found in both BHND SoCs and BHND Wi-Fi devices, it is advantageous to share driver and platform code between the two targets.
>
>

* Modernizing FreeBSD's Broadcom SoftMAC Wi-Fi Support

  * FreeBSD support for Broadcom SoftMAC Wi-Fi adapters is provided by two partially overlapping PCI/CardBus drivers:
  * Legacy Wi-Fi adapters are supported by bwi(4). This driver remains in-tree to support devices incompatible with v4 or later firmware (e.g. BCM4301, BCM4302, BCM4306 rev 1-2), all of which were released prior to December 2002.
  * Modern Wi-Fi adapters are supported by bwn(4), with access to on-chip cores mediated by bhnd(4).

>
>
> Prior to my work porting bwn(4) to bhnd(4), access to on-chip cores was mediated by siba\_bwn, a PCI/WiFi-specific derivative of the legacy siba(4) SSB bus driver. There were two major limitations to siba\_bwn that have long blocked adding support for newer SoftMAC Wi-Fi chipsets: the newer BCMA interconnect found in post-2009 hardware was not supported by siba(4), and siba\_bwn assumed a PCI/PCIe bridge, preventing its use on FreeBSD/MIPS Broadcom SoCs with interconnect-attached D11 cores.
>
>

* The new bhnd(4) driver family, written as a replacement for siba(4) and siba\_bwn, provides:
* A unified bus driver interface for both SSB and BCMA on-chip interconnects
* A generic BHND bridge driver framework for host-connected BHND devices (e.g. Wi-Fi adapters, etc)
* A PCI/PCIe bridge core driver, for PCI-attached BHND devices.
* An abstract BHND NVRAM API, with support for the varied NVRAM formats found in BHND Wi-Fi adapters and SoCs.
* Drivers for common BHND platform peripherals (UARTs, SPROM/flash, PMUs, etc)

>
>
> By porting bwn(4) to bhnd(4), we are now able to support existing BCMA devices with MAC/PHY/Radio combinations readily supported by bwn(4), as was the case with the BCM43224 and BCM43225 chipsets. This also opens the door to porting additional PHY support from Broadcom’s ISC-licensed Linux drivers, and will allow us to bring up bwn(4) on Broadcom WiSoCs supported by FreeBSD/MIPS.
>
>

---

### [Monitor OpenSMTPD using Logstash and Grafana](https://www.tumfatig.net/20180129/monitor-opensmtpd-using-logstash-grafana/) ###

>
>
> Logs are usefull. Graphs are sexy. Here’s a way to get a view on what happens to your OpenSMTPD traffic, using Web v2.0 tools ; namely Logstash & Grafana.  
>  For those who would not be aware of those tools, logstash is some kind of log-parser that can eat syslog formatted logs and write them into elasticsearch ; in “document” format. Grafana is a Web frontend that can dig into various databases and render graphics from requests.  
>  I won’t go into the whole “how to install” process here. Installation is quite straight forward and online documentation is quite clear.
>
>

* What you need

>
>
> OpenSMTPD deals with emails and logs its activity via Syslog.  
>  Syslog is configured to send the logs to Logstash.  
>  Logstash has a set of rules configured to transform the text-oriented information into searchable document-oriented data. The transformed data is stored into Elasticsearch.  
>  Elasticsearch provides Web API to search and find stuff.  
>  Grafana connects to ELS to get data and draw the graphs.
>
>

Beastie Bits
----------

* [CharmBUG Presentation - Writing FreeBSD Malware](https://www.meetup.com/CharmBUG/events/247995596/)
* [March London \*BSD meeting 13/03/18](http://mailman.uk.freebsd.org/pipermail/ukfreebsd/2018-February/014180.html)
* [FreBSD Ports Workshop](https://wiki.freebsd.org/MateuszPiotrowski/Ports/Workshop)
* [The history of NetBSD/atari and support for ATARI compatible Milan / OSC2018Osaka](https://speakerdeck.com/tsutsui/osc2018osaka)
* [SSH Mastery, 2nd Edition](https://www.tiltedwindmillpress.com/?product=ssh-mastery-2nd-edition) \*\*\*

Feedback/Questions
----------

* Stephen - [Viewer Interview Question](http://dpaste.com/06WTRB9#wrap)
* pb - [trust expanding your 280TB pool](http://dpaste.com/0TZV6CM#wrap)
* Tim - [ZFS questions for the ZFS Man](http://dpaste.com/0759X1E#wrap)
* Daniel - [ZFS full backup question](http://dpaste.com/1SJXSBQ#wrap) \*\*\*