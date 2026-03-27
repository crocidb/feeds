+++
title = "134: Marking up the Ports tree"
description = "This week on the show, Allan and I have gotten a bit more sleep since AsiaBSDCon, which is excellent since there is a LOT of news to cover. That plus our interview with Ports SecTeam member Mark Felder. So keep itThis episode was brought to you by[![iXsystems - Enterpri"
date = "2016-03-24T12:00:00Z"
url = "https://www.bsdnow.tv/134"
author = "feedback@bsdnow.tv (JT Pennington)"
text = ""
lastupdated = "2026-03-26T14:37:51.051759930Z"
seen = false
+++

This week on the show, Allan and I have gotten a bit more sleep since AsiaBSDCon, which is excellent since there is a LOT of news to cover. That plus our interview with Ports SecTeam member Mark Felder. So keep it

This episode was brought to you by
----------

[![iXsystems - Enterprise Servers and Storage for Open Source](/images/1.png)](http://www.ixsystems.com/bsdnow)[![DigitalOcean - Simple Cloud Hosting, Built for Developers](/images/2.png)](http://www.digitalocean.com/)[![Tarsnap - Online Backups for the Truly Paranoid](/images/3.png)](http://www.tarsnap.com/bsdnow)

---

Headlines
----------

### [FreeNAS 9.10 Released](http://lists.freenas.org/pipermail/freenas-announce/2016-March/000028.html) ###

* OS:
  * The base OS version for FreeNAS 9.10 is now FreeBSD 10.3-RC3, bringing in a huge number of OS-related bug fixes, performance improvements and new features. +Directory Services:
  * You can now connect to large AD domains with cache disabled. +Reporting:
  * Add the ability to send collectd data to a remote graphite server. +Hardware Support:
  * Added Support for Intel I219-V & I219-LM Gigabit Ethernet Chipset
  * Added Support for Intel Skylake architecture
  * Improved support for USB devices (like network adapters)
  * USB 3.0 devices now supported. +Filesharing:
  * Samba (SMB filesharing) updated from version 4.1 to 4.3.4
  * Added GUI feature to allow nfsv3-like ownership when using nfsv4
  * Various bug fixes related to FreeBSD 10. +Ports:
  * FreeBSD ports updated to follow the FreeBSD 2016Q1 branch. +Jails:
  * FreeBSD Jails now default to a FreeBSD 10.3-RC2 based template.
  * Old jails, or systems on which jails have been installed, will still default to the previous FreeBSD 9.3 based template. Only those machinesusing jails for the first time (or deleting and recreating their jails dataset) will use the new template. +bhyve: ++In the upcoming 10 release, the CLI will offer full support for managing virtual machines and containers. Until then, the iohyve command is bundled as a stop-gap solution to provide basic VM management support - \*\*\*

### [Ubuntu BSD's first Beta Release](https://sourceforge.net/projects/ubuntubsd/) ###

* Under the category of “Where did this come from?”, we have a first beta release of Ubuntu BSD.
* Specifically it is Ubuntu, respun to use the FreeBSD kernel and ZFS natively.
* From looking at the minimal information up on sourceforge, we gather that is has a nice text-based installer, which supports ZFS configuration and iSCSI volume creation setups.
* Aside from that, it includes the XFCE desktop out of box, but claims to be suitable for both desktops and servers alike right now.
* We will keep an eye on this, if anybody listening has already tested it out, maybe drop us a line on your thoughts of how this mash-up works out. \*\*\*

### [FreeBSD - a lesson in poor defaults](http://vez.mrsk.me/freebsd-defaults.txt) ###

* Former BSD producer, and now OpenBSD developer, TJ, writes a post detailing the defaults he changes in a fresh FreeBSD installation
* Maybe some of these should be the defaults
* While others are definitely a personal preference, or are not as security related as they seem
* A few of these, while valid criticisms, but some are done for a reason
* Specifically, the OpenSSH changes.
* So, you’re a user, you install FreeBSD 10.0, and it comes with OpenSSH version X, which has some specific defaults
* As guaranteed by the FreeBSD Project, you will have a nice smooth upgrade path to any version in the 10.x branch
* Just because OpenSSH has released version Y, doesn’t mean that the upgrade can suddenly remove support for DSA keys, or re-adding support for AES-CBC (which is not really weak, and which can be hardware accelerated, unlikely most of the replacements)
* “FreeBSD is the team trying to increase the risk.” Is incorrect, they are trying to reduce the impact on the end user
* Specifically, a user upgrading from 10.x to 10.3, should not end up locked out of their SSH server, or otherwise confronted by unexpected errors or slowdowns because of upstream changes
* I will note again, (and again), that the NONE cipher can NOT allow a user to “shoot themselves in the foot”, encryption is still used during the login phase, it is just disabled for the file transfer phase. The NONE cipher will refuse to work for an interactive session.
* While the post states that the NONE cipher doesn’t improve performance that much, it infact does
* In my own testing, chacha20-poly1305 1.3 gbps, aes128-gcm (fastest) 5.0 gbps, NONE cipher 6.3 gbps
* That means that the NONE cipher is an hour faster to transfer 10 TB over the LAN.
* The article suggests just removing sendmail with no replacement. Not sure how they expect users to deliver mail, or the daily/weekly reports
* Ports can be compiled as a regular user. Only the install phase requires root
* for ntpd, it is not clear that there is an acceptable replacement yet, but I will not that it is off by default
* In the sysctl section, I am not sure I see how enabling tcp blackhole actually increases security at all
* I am not sure that linking to every security advisory in openssl since 2001 is actually useful
* Encrypted swap is an option in bsdinstall now, but I am not sure it is really that important
* FreeBSD now uses the Fortuna PRNG, upgraded to replace the older Yarrow, not vanilla RC4.
* “The resistance from the security team to phase out legacy options makes mewonder if they should be called a compatibility team instead.”
* I do not think this is the choice of the security team, it is the ABI guarantee that the project makes. The stable/10 branch will always have the same ABI, and a program or driver compiled against it will work with any version on that branch
* The security team doesn’t really have a choice in the matter. Switching the version of OpenSSL used in FreeBSD 9.x would likely break a large number of applications the user has installed
* Something may need to be done differently, since it doesn’t look like any version of OpenSSL, (or OpenSSH), will be supported for 5 years ever again \*\*\*

### [ZFS Raidz Performance, Capacity and Integrity](https://calomel.org/zfs_raid_speed_capacity.html) ###

* An updated version of an article comparing the performance of various ZFS vdev configurations
* The settings users in the test may not reflect your workload
* If you are benchmarking ZFS, consider using multiple files across different datasets, and not making all of the writes synchronous
* Also, it is advisable to run more than 3 runs of each test
* Comparing the numbers from the 12 and 24 disk tests, it is surprising to see that the 12 mirror sets did not outperform the other configurations. In the 12 drive tests, the 6 mirror sets had about the same read performance as the other configurations, it is not clear why the performance with more disks is worse, or why it is no longer in line with the other configurations
* More investigation of this would be required
* There are obviously so other bottlenecks, as 5x SSDs in RAID-Z1 performed the same as 17x SSDs in RAID-Z1
* Interesting results none the less \*\*\*

iXSystems
----------

* [FreeNAS Mini Review](http://www.nasanda.com/2016/03/ixsystems-freenas-mini-nas-device-reviewed/)

Interview - Mark Felder - [feld@freebsd.org](mailto:feld@freebsd.org) / [@feldpos](https://twitter.com/feldpos)
----------

* Ports, Ports and more Ports

DigitalOcean
----------

* [Digital Ocean's guide to setting up an OpenVPN server](https://www.digitalocean.com/community/tutorials/how-to-configure-and-connect-to-a-private-openvpn-server-on-freebsd-10-1)

News Roundup
----------

[AsiaBSDCon OpenBSD Papers](http://undeadly.org/cgi?action=article&sid=20160316153158&mode=flat&count=0)

* Undeadly.org has compiled a handy list of the various OpenBSD talks / papers that were offered a few weeks ago at AsiaBSDCon 2016.

Antoine Jacoutot (ajacoutot@) - OpenBSD rc.d(8) (slides | paper)  
 Henning Brauer (henning@) - Running an ISP on OpenBSD (slides)  
 Mike Belopuhov (mikeb@) - Implementation of Xen PVHVM drivers in OpenBSD (slides | paper)  
 Mike Belopuhov (mikeb@) - OpenBSD project status update (slides)  
 Mike Larkin (mlarkin@) - OpenBSD vmm Update (slides)  
 Reyk Floeter (reyk@) - OpenBSD vmd Update (slides)

* Each talk provides slides, and some the papers as well. Also included is the update to ‘vmm’ discussed at bhyveCon, which will be of interest to virtualization enthusiasts. \*\*\*

### [Bitcoin Devs could learn a lot from BSD](http://bitcoinist.net/bitcoin-devs-could-learn-a-lot-from-bsd/) ###

* An interesting article this week, comparing two projects that at first glance may not be entirely related, namely BitCoin and BSD.
* The article first details some of the woes currently plaguing the BitCoin development community, such as toxic community feedback to changes and stakeholders with vested financial interests being unable to work towards a common development purpose.
* This leads into the crux or the article, about what BitCoin devs could learn from BSD:

>
>
> First and foremost, the way code is developed needs change to stop the current negative trend in Bitcoin. The FreeBSD project has a rigid internal hierarchy of people with write access to their codebase, which the various Bitcoin implementations also have, but BSD does this in a way that is very open to fresh eyes on their code, allowing parallel problem solving without the petty infighting we see in Bitcoin. Anyone can propose a commit publicly to the code, make it publicly available, and democratically decide which change ends up in the codebase. FreeBSD has a tiny number of core developers compared to the size of their codebase, but at any point, they have a huge community advancing their project without hard forks popping up at every small disagreement. Brian Armstrong commented recently on this flaw with Bitcoin development, particularly with the Core Devs:
>
>
>
> “Being high IQ is not enough for a team to succeed. You need to make reasonable tradeoffs, collaborate, be welcoming, communicate, and be easy to work with. Any team that doesn’t have this will be unable to attract top talent and will struggle long term. In my opinion, perhaps the biggest risk in Bitcoin right now is, ironically, one of the things which has helped it the most in the past: the Bitcoin Core developers.”
>
>

* A good summary of the culture that could be adopted is summed up as follows:

>
>
> The other thing Bitcoin devs could learn from is the BSD community’s adoption of the Unix Design philosophy. Primarily “Worse is Better,” The rule of Diversity, and Do One Thing and Do It Well. “Worse is Better” emphasizes using extant functional solutions rather than making more complex ones, even if they would be more robust. The Rule of Diversity stresses flexibility of the program being developed, allowing for modification and different implementations without breaking. Do one Thing and Do it well is a mantra of the BSD and Unix Communities that stresses modularity and progress over “perfect” solutions. Each of these elements help to make BSD a wildly successful open source project with a healthy development community and lots of inter-cooperation between the different BSD systems. While this is the opposite of what we see with Bitcoin at present, the situation is salvageable provided changes like this are made, especially by Core Developers.
>
>

* All in all, a well written and interesting take on the FreeBSD/BSD project. We hope the BitCoin devs can take something useful from it down the road. \*\*\*

### [FreeBSD cross-compiling with gcc and poudriere](http://ben.eficium.net/2016/03/freebsd-cross-compiling-with-gcc.html) ###

* Cross-Compiling, always a challenge, has gotten easier using poudriere and qemu in recent years.
* However this blog post details some of the particular issues still being face when trying to compile some certain ports for ARM (I.E. rPi) that don’t play nicely with FreeBSD’s default CLANG compiler.
* The writer (Ben Slack) takes us through some of the work-arounds he uses to build some troublesome ports, namely lsof and libatomic\_ops.
* Note this is not just an issue with cross compile, the above mentioned ports also don’t build with clang on the Pi directly.
* After doing the initial poudriere/qemu cross-compile setup, he then shows us the minor tweaks to adjust which compiler builds specific ports, and how he triggers the builds using poudriere.
* With the actual Makefile adjustment being so minor, one wonders if this shouldn’t just be committed upstream, with some if (ARM) - USE\_GCC=yes type conditional. \*\*\*

### [Nvidia releases new Beta graphics driver for FreeBSD](https://devtalk.nvidia.com/default/topic/925607/unix-graphics-announcements-and-news/linux-solaris-and-freebsd-driver-364-12-beta-/) ###

* Added support for the following GPUs: GeForce 920MX & GeForce 930MX
* Added support for the Vulkan API version 1.0.
* Fixed a bug that could cause incorrect frame rate reporting on Quadro Sync configurations with multiple GPUs.
* Added a new RandR property, CscMatrix, which specifies a 3x4 color-space conversion matrix.
* Improved handling of the X gamma ramp on GF119 and newer GPUs. On these GPUs, the RandR gamma ramp is always 1024 entries and now applies to the cursor and VDPAU or workstation overlays in addition to the X root window.
* Fixes for bugs and added several other EGL extensions \*\*\*

Beastie Bits
----------

* [New TN Bug started](http://knoxbug.org/)

* [DragonFlyBSD Network/TCP Performance's gets a bump](http://gitweb.dragonflybsd.org/dragonfly.git/commitdiff/4a43469a10cef8c17553c342aab9d73611ea7bc8?utm_source=anzwix)

* [FreeBSD Foundation introduces a new website and logo](https://www.freebsdfoundation.org/blog/introducing-a-new-look-for-the-foundation/)

* Our producer made these based on the new logo:

  * [http://q5sys.sh/2016/03/a-new-freebsd-foundation-logo-means-its-time-for-some-new-wallpapers/](http://q5sys.sh/2016/03/a-new-freebsd-foundation-logo-means-its-time-for-some-new-wallpapers/)
  * [http://q5sys.sh/2016/03/pc-bsd-and-lumina-desktop-wallpapers/](http://q5sys.sh/2016/03/pc-bsd-and-lumina-desktop-wallpapers/)
  * [https://github.com/pcbsd/lumina/commit/60314f46247b7ad6e877af503b3814b0be170da8](https://github.com/pcbsd/lumina/commit/60314f46247b7ad6e877af503b3814b0be170da8)

* [IPv6 errata for 5.7/5.8, pledge errata for 5.9](http://undeadly.org/cgi?action=article&sid=20160316190937&mode=flat)

* [Sponsoring “PAM Mastery”](http://blather.michaelwlucas.com/archives/2577)

* [A visualization of FreeBSD commits on GitHub for 2015](https://rocketgraph.com/s/v89jBkKN4e-)

* [The VAX platform is no more](http://undeadly.org/cgi?action=article&sid=20160309192510)

---

Feedback/Questions
----------

* [ Hunter - Utils for Blind](http://slexy.org/view/s20KPYDOsq)
* [ Chris - ZFS Quotas](http://slexy.org/view/s2EHdI3z3L)
* [ Anonymous - Tun, Tap and Me!](http://slexy.org/view/s21Nx1VSiU)
* [ Andrew - Navigating the BSDs](http://slexy.org/view/s2ZKK2DZTL)
* [ Brent - Wifi on BSD](http://slexy.org/view/s20duO29mN) \*\*\*