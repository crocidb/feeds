+++
title = "Episode 252: Goes to 11.2 | BSD Now 252"
description = 'FreeBSD 11.2 has been released, setting up an MTA behind Tor, running pfsense on DigitalOcean, one year of C, using OpenBGPD to announce VM networks, the power to serve, and a BSDCan trip report.\Headlines   \[FreeBSD 11.2-RELEASE Available](https://www.freebsd.org/releases/'
date = "2018-06-28T07:00:00Z"
url = "https://www.bsdnow.tv/252"
author = "feedback@bsdnow.tv (JT Pennington)"
text = ""
lastupdated = "2026-03-26T14:37:50.740790598Z"
seen = false
+++

FreeBSD 11.2 has been released, setting up an MTA behind Tor, running pfsense on DigitalOcean, one year of C, using OpenBGPD to announce VM networks, the power to serve, and a BSDCan trip report.

\##Headlines  
 \###[FreeBSD 11.2-RELEASE Available](https://www.freebsd.org/releases/11.2R/announce.html)

* FreeBSD 11.2 was released today (June 27th) and is ready for download
* Highlights:

>
>
> OpenSSH has been updated to version 7.5p1.  
>  OpenSSL has been updated to version 1.0.2o.  
>  The clang, llvm, lldb and compiler-rt utilities have been updated to version 6.0.0.  
>  The libarchive(3) library has been updated to version 3.3.2.  
>  The libxo(3) library has been updated to version 0.9.0.  
>  Major Device driver updates to:
>
>

* cxgbe(4) – Chelsio 10/25/40/50/100 gigabit NICs – version 1.16.63.0 supports T4, T5 and T6
* ixl(4) – Intel 10 and 40 gigabit NICs, updated to version 1.9.9-k
* ng\_pppoe(4) – driver has been updated to add support for user-supplied Host-Uniq tags

>
>
> New drivers:  
>  \+ drm-next-kmod driver supporting integrated Intel graphics with the i915 driver.
>
>

* mlx5io(4) – a new IOCTL interface for Mellanox ConnectX-4 and ConnectX-5 10/20/25/40/50/56/100 gigabit NICs
* ocs\_fc(4) – Emulex Fibre Channel 8/16/32 gigabit Host Adapters
* smartpqi(4) – HP Gen10 Smart Array Controller Family

>
>
> The newsyslog(8) utility has been updated to support RFC5424-compliant messages when rotating system logs  
>  The diskinfo(8) utility has been updated to include two new flags, -s which displays the disk identity (usually the serial number), and -p which displays the physical path to the disk in a storage controller.  
>  The top(1) utility has been updated to allow filtering on multiple user names when the -U flag is used  
>  The umount(8) utility has been updated to include a new flag, -N, which is used to forcefully unmount an NFS mounted filesystem.  
>  The ps(1) utility has been updated to display if a process is running with capsicum(4) capability mode, indicated by the flag ‘C’  
>  The service(8) utility has been updated to include a new flag, -j, which is used to interact with services running within a jail(8). The argument to -j can be either the name or numeric jail ID  
>  The mlx5tool(8) utility has been added, which is used to manage Connect-X 4 and Connect-X 5 devices supported by mlx5io(4).  
>  The ifconfig(8) utility has been updated to include a random option, which when used with the ether option, generates a random MAC address for an interface.  
>  The dwatch(1) utility has been introduced  
>  The efibootmgr(8) utility has been added, which is used to manipulate the EFI boot manager.  
>  The etdump(1) utility has been added, which is used to view El Torito boot catalog information.  
>  The linux(4) ABI compatibility layer has been updated to include support for musl consumers.  
>  The fdescfs(5) filesystem has been updated to support Linux®-specific fd(4) /dev/fd and /proc/self/fd behavior  
>  Support for virtio\_console(4) has been added to bhyve(4).  
>  The length of GELI passphrases entered when booting a system with encrypted disks is now hidden by default. See the configuration options in geli(8) to restore the previous behavior.
>
>

* In addition to the usual CD/DVD ISO, Memstick, and prebuilt VM images (raw, qcow2, vhd, and vmdk), FreeBSD 11.2 is also available on:
  * Amazon EC2
  * Google Compute Engine
  * Hashicorp/Atlas Vagrant
  * Microsoft Azure

* In addition to a generic ARM64 image for devices like the Pine64 and Raspberry Pi 3, specific images are provided for:

  * GUMSTIX
  * BANANAPI
  * BEAGLEBONE
  * CUBIEBOARD
  * CUBIEBOARD2
  * CUBOX-HUMMINGBOARD
  * RASPBERRY PI 2
  * PANDABOARD
  * WANDBOARD

* [Full Release Notes](https://www.freebsd.org/releases/11.2R/relnotes.html)  

---

\###[Setting up an MTA Behind Tor](https://github.com/lattera/articles/blob/master/opsec/2018-05-08_torified_mta/article.md)

>
>
> This article will document how to set up OpenSMTPD behind a fully Tor-ified network. Given that Tor’s DNS resolver code does not support MX record lookups, care must be taken for setting up an MTA behind a fully Tor-ified network. OpenSMTPD was chosen because it was easy to modify to force it to fall back to A/AAAA lookups when MX lookups failed with a DNS result code of NOTIMP (4).
>
>

>
>
> Note that as of 08 May 2018, the OpenSMTPD project is planning a configuration file language change. The proposed change has not landed. Once it does, this article will be updated to reflect both the old language and new.
>
>

>
>
> The reason to use an MTA behing a fully Tor-ified network is to be able to support email behind the .onion TLD. This setup will only allow us to send and receive email to and from the .onion TLD.
>
>

* Requirements:

* A fully Tor-ified network

* HardenedBSD as the operating system

* A server (or VM) running HardenedBSD behind the fully Tor-ified network.

* /usr/ports is empty

* Or is already pre-populated with the HardenedBSD Ports tree

* Why use HardenedBSD? We get all the features of FreeBSD (ZFS, DTrace, bhyve, and jails) with enhanced security through exploit mitigations and system hardening. Tor has a very unique threat landscape and using a hardened ecosystem is crucial to mitigating risks and threats.

>
>
> Also note that this article reflects how I’ve set up my MTA. I’ve included configuration files verbatim. You will need to replace the text that refers to my .onion domain with yours.
>
>

>
>
> On 08 May 2018, HardenedBSD’s version of OpenSMTPD just gained support for running an MTA behind Tor. The package repositories do not yet contain the patch, so we will compile OpenSMTPD from ports.
>
>

* Steps
* Installation
* Generating Cryptographic Key Material
* Tor Configuration
* OpenSMTPD Configuration
* Dovecot Configuration
* Testing your configuration
* Optional: Webmail Access

---

**iXsystems**  
[https://www.forbes.com/sites/forbestechcouncil/2018/06/21/strings-attached-knowing-when-and-when-not-to-accept-vc-funding/#30f9f18f46ec](https://www.forbes.com/sites/forbestechcouncil/2018/06/21/strings-attached-knowing-when-and-when-not-to-accept-vc-funding/#30f9f18f46ec)  
[https://www.ixsystems.com/blog/self-2018-recap/](https://www.ixsystems.com/blog/self-2018-recap/)

\###[Running pfSense on a Digital Ocean Droplet](https://squigly.blogspot.com/2018/02/running-pfsense-on-digitalocean-droplet.html)

>
>
> I love pfSense (and opnSense, no discrimination here). I use it for just about anything, from homelab to large scale deployments and I’ll give out on any fancy \<enter brand name fw appliance here\> for a pfSense setup on a decent hardware.
>
>

>
>
> I also love DigitalOcean, if you ever used them, you know why, if you never did, head over and try, you’ll understand why.  
>  \<shameless plug: head over to [JupiterBroadcasting.com](http://JupiterBroadcasting.com), the *best* technology content out there, they have coupon codes to get you started with DO\>.
>
>

>
>
> Unfortunately, while DO offers tremendous amount of useful distros and applications, pfSense isn’t one of them. But, where there’s a will, there’s a way, and here’s how to get pfSense up and running on DO so you can have it as the gatekeeper to your kingdom.
>
>

>
>
> Start by creating a FreeBSD droplet, choose your droplet size (for modest setups, I find the 5$ to be quite awesome):
>
>

>
>
> There are many useful things you can do with pfSense on your droplet, from OpenVPN, squid, firewalling, fancy routing, url filtering, dns black listing and much much more.
>
>

* One note though, before we wrap up:

>
>
> You have two ways to initiate the initial setup wizard of the web-configurator:  
>  Spin up another droplet, log into it and browse your way to the INTERNAL ip address of the internal NIC you’ve set up. This is the long and tedious way, but it’s also somewhat safer as it eliminates the small window of risk the second method poses.  
>  or  
>  Once your WAN address is all setup, your pfSense is ready to accept https connection to start the initial web-configurator setup.  
>  Thing is, there’s a default, well known set of credential to this initial wizard (admin:pfsense), so, there is a slight window of opportunity that someone can swoop in (assuming they know you’ve installed pfsense + your wan IP address + the exact time window between setting up the WAN interface and completing the wizard) and do \<enter scary thing here\>.
>
>

>
>
> I leave it up to you which of the path you’d like to go, either way, once you’re done with the web-configurator wizard, you’ll have a shiny new pfSense installation at your disposal running on your favorite VPS.
>
>

>
>
> Hopefully this was helpful for someone, I hope to get a similar post soon detailing how to get FreeNAS up and running on DO.  
>  Many thanks to Tubsta and his blogpost as well as to Allan Jude, Kris Moore and Benedict Reuschling for their AWESOME and inspiring podcast, BSD Now.
>
>

---

\##News Roundup  
 \###[One year of C](http://floooh.github.io/2018/06/02/one-year-of-c.html)

>
>
> It’s now nearly a year that I started writing non-trivial amounts of C code again (the first sokol\_gfx.h commit was on the 14-Jul-2017), so I guess it’s time for a little retrospective.
>
>

>
>
> In the beginning it was more of an experiment: I wanted to see how much I would miss some of the more useful C++ features (for instance namespaces, function overloading, ‘simple’ template code for containers, …), and whether it is possible to write non-trivial codebases in C without going mad.
>
>

>
>
> Here are all the github projects I wrote in C:
>
>

* sokol: a slowly growing set of platform-abstraction headers
* sokol-samples - examples for Sokol
* chips - 8-bit chip emulators
* chips-test - tests and examples for the chip- emulators, including some complete home computer emulators (minus sound)

>
>
> All in all these are around 32k lines of code (not including 3rd party code like flextGL and HandmadeMath). I think I wrote more C code in the recent 10 months than any other language.
>
>

>
>
> So one thing seems to be clear: yes, it’s possible to write a non-trivial amount of C code that does something useful without going mad (and it’s even quite enjoyable I might add).
>
>

* Here’s a few things I learned:

* Pick the right language for a problem

* C is a perfect match for WebAssembly

* C99 is a huge improvement over C89

* The dangers of pointers and explicit memory management are overrated

* Less Boilerplate Code

* Less Language Feature ‘Anxiety’

* Conclusion

>
>
> All in all my “C experiment” is a success. For a lot of problems, picking C over C++ may be the better choice since C is a much simpler language (btw, did you notice how there are hardly any books, conferences or discussions about C despite being a fairly popular language? Apart from the neverending bickering about undefined behaviour from the compiler people of course ;) There simply isn’t much to discuss about a language that can be learned in an afternoon.
>
>

>
>
> I don’t like some of the old POSIX or Linux APIs as much as the next guy (e.g. ioctl(), the socket API or some of the CRT library functions), but that’s an API design problem, not a language problem. It’s possible to build friendly C APIs with a bit of care and thinking, especially when C99’s designated initialization can be used (C++ should really make sure that the full C99 language can be used from inside C++ instead of continuing to wander off into an entirely different direction).
>
>

---

\###[Configuring OpenBGPD to announce VM’s virtual networks](https://empt1e.blogspot.com/2018/06/configuring-openbgpd-to-announce-vms.html)

>
>
> We use BGP quite heavily at work, and even though I’m not interacting with that directly, it feels like it’s something very useful to learn at least on some basic level. The most effective and fun way of learning technology is finding some practical application, so I decided to see if it could help to improve networking management for my Virtual Machines.
>
>

>
>
> My setup is fairly simple: I have a host that runs bhyve VMs and I have a desktop system from where I ssh to VMs, both hosts run FreeBSD. All VMs are connected to each other through a bridge and have a common network 10.0.1/24. The point of this exercise is to be able to ssh to these VMs from desktop without adding static routes and without adding vmhost’s external interfaces to the VMs bridge.
>
>

>
>
> I’ve installed openbgpd on both hosts and configured it like this:
>
>

```
vmhost: /usr/local/etc/bgpd.conf
AS 65002
router-id 192.168.87.48
fib-update no

network 10.0.1.1/24

neighbor 192.168.87.41 {
    descr "desktop"
    remote-as 65001
}

```

>
>
> Here, router-id is set vmhost’s IP address in my home network (192.168.87/24), fib-update no is set to forbid routing table update, which I initially set for testing, but keeping it as vmhost is not supposed to learn new routes from desktop anyway. network announces my VMs network and neighbor describes my desktop box. Now the desktop box:
>
>

```
desktop: /usr/local/etc/bgpd.conf
AS 65001
router-id 192.168.87.41
fib-update yes

neighbor 192.168.87.48 {                                                                                                                                                                                           
        descr "vmhost"                                                                                                                                                                                             
        remote-as 65002                                                                                                                                                                                            
}

```

>
>
> It’s pretty similar to vmhost’s bgpd.conf, but no networks are announced here, and fib-update is set to yes because the whole point is to get VM routes added. Both hosts have to have the openbgpd service enabled:
>
>

```
/etc/rc.conf.local
openbgpd_enable="YES"

```

* Conclusion

>
>
> As mentioned already, similar result could be achieved without using BGP by using either static routes or bridging interfaces differently, but the purpose of this exercise is to get some basic hands-on experience with BGP. Right now I’m looking into extending my setup in order to try more complex BGP schema. I’m thinking about adding some software switches in front of my VMs or maybe adding a second VM host (if budget allows). You’re welcome to comment if you have some ideas how to extend this setup for educational purposes in the context of BGP and networking.
>
>

>
>
> As a side note, I really like openbgpd so far. Its configuration file format is clean and simple, documentation is good, error and information messages are clear, and CLI has intuitive syntax.
>
>

---

**Digital Ocean**

\###[The Power to Serve](https://nocomplexity.com/the-power-to-serve/)

>
>
> All people within the IT Industry should known where the slogan “The Power To Serve” is exposed every day to millions of people. But maybe too much wishful thinking from me. But without “The Power To Serve” the IT industry today will look totally different. Companies like Apple, Juniper, Cisco and even WatsApp would not exist in their current form.
>
>

>
>
> I provide IT architecture services to make your complex IT landscape manageable and I love to solve complex security and privacy challenges. Complex challenges where people, processes and systems are heavily interrelated. For this knowledge intensive work I often run some IT experiments. When you run experiments nowadays you have a choice:
>
>

* Rent some cloud based services or
* DIY (Do IT Yourself) on premise

>
>
> Running your own developments experiments on your own infrastructure can be time consuming. However smart automation saves time and money. And by creating your own CICD pipeline (Continuous Integration, Continuous Deployment) you stay on top of core infrastructure developments. Even hands-on. Knowing how things work from a technical ‘hands-on’ perspective gives great advantages when it comes to solving complex business IT problems. Making a clear distinguish between a business problem or IT problem is useless. Business and IT problems are related. Sometimes causal related, but more often indirect by one or more non linear feedback loops. Almost every business depends of IT systems. Bad IT means often that your customers will leave your business.
>
>

>
>
> One of the things of FeeBSD for me is still FreeBSD Jails. In 2015 I had luck to attend to a presentation of the legendary hacker Poul-Henning Kamp . Check his BSD bio to see what he has done for the FreeBSD community! FreeBSD jails are a light way to visualize your system without enormous overhead. Now that the development on Linux for LXD/LXD is more mature (lxd is the next generation system container manager on linux) there is finally again an alternative for a nice chroot Linux based system again. At least when you do not need the overhead and management complexity that comes with Kubernetes or Docker.
>
>

>
>
> FreeBSD means control and quality for me. When there is an open source package I need, I want to install it from source. It gives me more control and always some extra knowledge on how things work. So no precompiled binaries for me on my BSD systems! If a build on FreeBSD fails most of the time this is an alert regarding the quality for me.
>
>

>
>
> If a complex OSS package is not available at all in the FreeBSD ports collection there should be a reason for it. Is it really that nobody on the world wants to do this dirty maintenance work? Or is there another cause that running this software on FreeBSD is not possible…There are currently 32644 ports available on FreeBSD. So all the major programming language, databases and middleware libraries are present. The FreeBSD organization is a mature organization and since this is one of the largest OSS projects worldwide learning how this community manages to keep innovation and creates and maintains software is a good entrance for learning how complex IT systems function.
>
>

>
>
> FreeBSD is of course BSD licensed. It worked well! There is still a strong community with lots of strong commercial sponsors around the community. Of course: sometimes a GPL license makes more sense. So beside FreeBSD I also love GPL software and the rationale and principles behind it. So my hope is that maybe within the next 25 years the hard battle between BSD vs GPL churches will be more rationalized and normalized. Principles are good, but as all good IT architects know: With good principles alone you never make a good system. So use requirements and not only principles to figure out what OSS license fits your project. There is never one size fits all.
>
>

>
>
> June 19, 1993 was the day the official name for FreeBSD was agreed upon. So this blog is written to celebrate 25th anniversary of FreeBSD.
>
>

---

\###Dave’s BSDCan trip report

* So far, only one person has bothered to send in a BSDCan trip report. Our warmest thanks to Dave for doing his part.

>
>
> Hello guys! During the last show, you asked for a trip report regarding BSDCan 2018.  
>  This was my first time attending BSDCan. However, BSDCan was my second BSD conference overall, my first being vBSDCon 2017 in Reston, VA.  
>  Arriving early Thursday evening and after checking into the hotel, I headed straight to the Red Lion for the registration, picked up my badge and swag and then headed towards the ‘DMS’ building for the newbies talk. The only thing is, I couldn’t find the DMS building! Fortunately I found a BSDCan veteran who was heading there themselves. My only suggestion is to include the full building name and address on the BSDCan web site, or even a link to Google maps to help out with the navigation. The on-campus street maps didn’t have ‘DMS’ written on them anywhere. But I digress.  
>  Once I made it to the newbies talk hosted by Dan Langille and Michael W Lucas, it highlighted places to meet, an overview of what is happening, details about the ‘BSDCan widow/widower tours’ and most importantly, the 6-2-1 rule!  
>  The following morning, we were present with tea/coffee, muffins and other goodies to help prepare us for the day ahead.  
>  The first talk, “The Tragedy of systemd” covered what systemd did wrong and how the BSD community could improve on the ideas behind it.  
>  With the exception of Michael W Lucas, SSH Key Management and Kirk McKusick, The Evolution of FreeBSD Governance talk, I pretty much attended all of the ZFS talks including the lunchtime BoF session, hosted by Allan Jude. Coming from FreeNAS and being involved in the community, this is where my main interest and motivation lies. Since then I have been able to share some of that information with the FreeNAS community forums and chatroom.  
>  I also attended the “Speculating about Intel” lunchtime BoF session hosted by Theo de Raddt, which proved to be “interesting”.  
>  The talks ended with the wrap up session with a few words from Dan, covering the record attendance and made very clear there “was no cabal”. Followed by the the handing over of Groff the BSD goat to a new owner, thank you’s from the FreeBSD Foundation to various community committers and maintainers, finally ending with the charity auction, where a things like a Canadian $20 bill sold for $40, a signed FreeBSD Foundation shirt originally worn by George Neville-Neil, a lost laptop charger, Michael’s used gelato spoon, various books, the last cookie and more importantly, the second to last cookie!  
>  After the auction, we all headed to the Red Lion for food and drinks, sponsored by iXsystems.  
>  I would like to thank the BSDCan organizers, speakers and sponsors for a great conference. I will certainly hope to attend next year!  
>  Regards,  
>  Dave (aka m0nkey\_)
>
>

* Thanks to Dave for sharing his experiences with us and our viewers

---

\##Beastie Bits

* [Robert Watson (from 2008) on how much FreeBSD is in Mac OS X ](https://lists.freebsd.org/pipermail/freebsd-advocacy/2008-August/003674.html)
* [Why Intel Skylake CPUs are sometimes 50% slower than older CPUs](https://aloiskraus.wordpress.com/2018/06/16/why-skylakex-cpus-are-sometimes-50-slower-how-intel-has-broken-existing-code/)
* [Kristaps Dzonsons is looking for somebody to maintain this as mentioned at this link](https://lobste.rs/s/bos5cr/practical_unix_manuals_mdoc)
* [camcontrol(8) saves the day again! Formatting floppy disks in a USB floppy disk drive](https://www.reddit.com/r/freebsd/comments/87rru4/formatting_floppy_disks_in_a_usb_floppy_disk_drive/)
* [32+ great indie games now playable on OpenBSD -current; 7 currently on sale!](https://www.reddit.com/r/openbsd_gaming/comments/898ey5/32_great_indie_games_now_playable_on_current_7/)
* [Warsaw BSD User Group. June 27 2018 18:30-21:00, Wheel Systems Office, Aleje Jerozolimskie 178, Warsaw](https://bsd-pl.org/en)

**Tarsnap**

\##Feedback/Questions

* Ron - [Adding a disk to ZFS](http://dpaste.com/2B6CWDM#wrap)
* Marshall - [zfs question](http://dpaste.com/2W7VD6K#wrap)
* Thomas - [Allan, the myth perpetuator](http://dpaste.com/1FS7534#wrap)
* Ross - [ZFS IO stats per dataset](http://dpaste.com/1HWQWB6#wrap)

---

* Send questions, comments, show ideas/topics, or stories you want mentioned on the show to [feedback@bsdnow.tv](mailto:feedback@bsdnow.tv)