+++
title = "129: Synthesize all the Things!"
description = "Coming up this week, we will be talking to John Marino about his work on the ports-mgmt utility “Synth” and the cross-pollination between DragonFly and FreeBSD. That plus the latest news and your email here onThis episode was brought to you by[![iXsystems - Enterprise S"
date = "2016-02-17T13:00:00Z"
url = "https://www.bsdnow.tv/129"
author = "feedback@bsdnow.tv (JT Pennington)"
text = ""
lastupdated = "2026-03-26T14:37:51.061674102Z"
seen = false
+++

Coming up this week, we will be talking to John Marino about his work on the ports-mgmt utility “Synth” and the cross-pollination between DragonFly and FreeBSD. That plus the latest news and your email here on

This episode was brought to you by
----------

[![iXsystems - Enterprise Servers and Storage for Open Source](/images/1.png)](http://www.ixsystems.com/bsdnow)[![DigitalOcean - Simple Cloud Hosting, Built for Developers](/images/2.png)](http://www.digitalocean.com/)[![Tarsnap - Online Backups for the Truly Paranoid](/images/3.png)](http://www.tarsnap.com/bsdnow)

---

Headlines
----------

### [glibc and the BSDs ](https://blog.des.no/2016/02/freebsd-and-cve-2015-7547/) ###

* You have likely already heard about [CVE-2015-7547 ](https://access.redhat.com/security/cve/cve-2015-7547)
* “A stack-based buffer overflow was found in the way the libresolv library performed dual A/AAAA DNS queries. A remote attacker could create a specially crafted DNS response which could cause libresolv to crash or, potentially, execute code with the permissions of the user running the library.”
* “Note: this issue is only exposed when libresolv is called from the nss\_dns NSS service module.”
* [More details from Google’s Online Security team blog ](https://googleonlinesecurity.blogspot.ca/2016/02/cve-2015-7547-glibc-getaddrinfo-stack.html)
* “Naturally, people have started asking whether FreeBSD is affected. The FreeBSD Security Officer has not yet released an official statement, but in the meantime, here is a brief look at the issue as far as FreeBSD is concerned.”
* “First of all: neither FreeBSD itself nor native FreeBSD applications are affected. While the resolver in FreeBSD’s libc and GNU libc share a common parentage, the bug was introduced when the latter was rewritten to send A and AAAA queries in parallel rather than sequentially when the application requests both.”
* The same most likely applies to the other BSDs
* “However, Linux applications running under emulation on a FreeBSD system use the GNU libc and are therefore vulnerable unless patched.”
* A patch to update emulation/linux\_base-c6 has been prepared and should be committed soon
* Running ‘pkg audit’ will list any known vulnerable packages installed on your system
* “The issue can be mitigated by only using resolvers you trust, and configuring them to avoid sending responses which can trigger the bug.”
* “If you already have your own resolvers, you can configure them to avoid sending UDP responses larger than 2048 bytes. If the response does not fit in 2048 bytes, the server will send a truncated response, and the client should retry using TCP. While a similar bug exists in the code path for TCP requests, I believe that it can only be exploited by a malicious resolver, and interposing your own resolver will protect affected Linux systems and applications.”
* Dag-Erling’s blog post also includes instructions and configuration examples for locking down your resolver, or setting up your own resolver if you don’t have one already \*\*\*

### [OpenBSD Foundation - 2016 Fundraising Campaign](http://www.openbsdfoundation.org/campaign2016.html) ###

* The OpenBSD foundation has announced their 2016 fundraising campaign, and set the goal of raising $250k for the year.
* While they mention that fundraising for 2015 didn’t hit 2014’s blockbuster numbers, it still exceeded the goal set, with an almost equal mix of corporate and community donors.

‘Our goal for 2016 is to increase the amount of support we offer for development, without compromising our regular support for the projects. We would like to:  
 Plan and support more developer events (hackathons), and allow for more developers to attend these events.  
 Continue to improve the project infrastructure.  
 Fund more dedicated developer time for targeted development of specific projects.‘

* To give you an idea of how much OpenBSD technology is used around the world, they broke it down this way:

If $10 were given for every installation of OpenBSD in the last year from the master site (ignoring the mirrors) we would be at our goal.  
 If $2 were given for every download of the OpenSSH source code in the last year from the master site (ignoring the mirrors) we would be at our goal.  
 If a penny was donated for every pf or OpenSSH installed with a mainstream operating system or phone in the last year we would be at our goal.

---

### [Getting Started with ION-DTN 3.4.0 on FreeBSD](https://sgeos.github.io/freebsd/ion/dtn/2016/02/07/getting-started-with-ion-dtn-3-4-0-on-freebsd.html) ###

* “The Interplanetary Overlay Network (ION) software distribution is an implementation of Delay-Tolerant Networking (DTN) architecture as described in Internet RFC 4838, suitable for use in spacecraft”
* This tutorial covers setting up ION 3.4.0 on FreeBSD
* The tutorial starts by downloading the ION software, and installing the relevant build tools
* The instructions allow ION to be installed system-wide, or for a specific user
* The each host is configured
* Then pings are traded between the hosts to ensure everything works
* Then a web page is served over the interplanetary network
* Sadly I don’t have any hosts on other planets to test with.
* The tutorial also includes a troubleshooting guide \*\*\*

### [Open Storage Issue – New BSD Mag is Out!](https://bsdmag.org/download/open_storage/) ###

* The next issue of BSDMag (The Open Storage Issue) just landed which features an interview with Matt Olander of iXsystems.
* During the interview, Matt talks about the culture of support for open-source down at iX, not only FreeNAS and PC-BSD, but the FreeBSD foundation, Slackware and more.
* He also gets to extol the virtues of the open-source development model itself, why it tends to lead to better code overall.
* In addition to the lead interview with Matt, this issue also features some other great interviews with Open Source storage vendors, and even some ZFS howto’s about setting up your ZIL devive \*\*\*

Interview - John Marino - [marino@freebsd.org](mailto:marino@freebsd.org)
----------

---

[FreeNAS with FreeBSD as its base helped save taxpayers $36,000 for a small public school district](https://www.ixsystems.com/whats-new/2016/02/11/january-missioncomplete-best-story/)

---

News Roundup
----------

### [Getting Started With Tor Hidden Services on FreeBSD](https://sgeos.github.io/tor/freebsd/nc/curl/2016/02/06/getting-started-with-tor-hidden-services-on-freebsd.html) ###

* Ever wondered how to setup and use a Tor hidden service? We have a walkthrough posted over on github.io which details how to do that on a FreeBSD -CURRENT system.
* The basics are pretty simple, installing security/tor is the first step (although, he is using portmaster, you may wish to just ‘pkg install security/tor’)
* The walkthrough provides an example server hosting just the date/time on port 8080, which you can use as an example and to verify it works, before serving anything real.
* Once a local server is ready to serve something, the Tor setup is pretty quick, basically just two lines of config in torrc:

HiddenServiceDir /usr/home/tor/hidden\_service/

HiddenServicePort 80 127.0.0.1:8080

* After starting the service, the walkthrough will show you how to get the new hostname for this hidden service and verify its functionality.

---

### [ZFS Remote Mirrors for Home Use](https://github.com/hughobrien/zfs-remote-mirror) ###

* A recently updated tutorial on remotely mirroring your ZFS files
* Using a spare old computer, or a SBC like a Raspberry Pi, and an (external) hard drive
* It covers installing and configuring FreeBSD for both sides of the remote replication
* The new appendix covers the creation of a Raspberry Pi image, although a prebuilt one is also provided
* The setup uses GELI to ensure the data is encrypted at-rest
* Updating and maintaining both systems is covered in detail
* The article is very detailed, and covers pretty much every aspect of the setup, including suggestions on where to physically locate the remote system, and configuration tips to reduce the chance that local intervention will be required
* Most importantly, it covers the disaster recovery steps. How to get your files back when bad things happen \*\*\*

### [Lumina Desktop 0.8.8 Released](http://lumina-desktop.org/lumina-desktop-0-8-8-released/) ###

* PC-BSD’s very own Lumina desktop has issued a new release, 0.8.8
* Notable in this release is support for NetBSD out of box, improvements to the start menu, and ability to change monitor resolutions in the X configuration tool. (Also the desktop font colors look better!)
* 0.8.8 is now available in PC-BSD via pkg, and FreeBSD ports/pkg system as well.
* [Lumina Desktop aims for v1.0 in July 2016](http://fossforce.com/2016/02/lumina-desktop-getting-ready-freebsd-11-0/)
* We also have a blog post from Larry over at FossForce, highlighting that 1.0 of Lumina is still targeted for July(ish) \*\*\*

### [NetBSD on Google's Compute Engine](http://www.feyrer.de/NetBSD/bx/blosxom.cgi/nb_20160213_1951.html) ###

* A NetBSD developer has gotten NetBSD running on Google Compute Engine, a service somewhat similar to Amazon’s EC2, and Microsoft’s Azure
* Support is still being worked on, but I imagine it will land in NetBSD before too long
* [NetBSD on GCE dmesg ](http://dmesgd.nycbug.org/index.cgi?action=dmesgd&do=view&id=2900)
* [OpenBSD on GCE ](http://marc.info/?l=openbsd-misc&m=138610199311393&w=2)
* [FreeBSD on GCE ](https://github.com/swills/FreeBSD-gcloud) \*\*\*

### BeastieBits ###

[htop 2.0 released - an interactive process viewer for Unix (including FreeBSD and OpenBSD)](http://hisham.hm/htop/)

[Full set of binary packages for 7.0 released for ARM v6 and v7 (hf)](http://mail-index.netbsd.org/port-arm/2016/01/31/msg003648.html)

[DragonFly 4.4.2 released](https://www.dragonflybsd.org/release44/)

[LibertyBSD 5.8 has been released](http://libertybsd.net/)

[Broadwell systems may want to take advantage of the patch by Imre Vadasz](http://lists.dragonflybsd.org/pipermail/commits/2016-January/459239.html)

[Finding the hard-to-spot bugs in FreeBSD ](http://www.viva64.com/en/b/0377/)

---

Feedback/Questions
----------

* [Johnny - The Daily Show](http://slexy.org/view/s21dwzoXRn)
* [ Randy - Let it BSD](http://slexy.org/view/s2Hmmu5pUr)
* [ Miguel - NullFS ](http://slexy.org/view/s20tOLsHHj)
* [ Jaek - PC-BSD Hardware](http://slexy.org/view/s2N9wQ1n5X) \*\*\*