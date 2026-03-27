+++
title = "Episode 262: OpenBSD Surfacing | BSD Now 262"
description = 'OpenBSD on Microsoft Surface Go, FreeBSD Foundation August Update, What’s taking so long with Project Trident, pkgsrc config file versioning, and MacOS remnants in ZFS code.\Headlines   \OpenBSD on the Microsoft Surface GoFor some'
date = "2018-09-06T09:00:00Z"
url = "https://www.bsdnow.tv/262"
author = "feedback@bsdnow.tv (JT Pennington)"
text = ""
lastupdated = "2026-03-26T14:37:50.713307279Z"
seen = false
+++

OpenBSD on Microsoft Surface Go, FreeBSD Foundation August Update, What’s taking so long with Project Trident, pkgsrc config file versioning, and MacOS remnants in ZFS code.

\##Headlines  
 \###[OpenBSD on the Microsoft Surface Go](https://jcs.org/2018/08/31/surface_go)

>
>
> For some reason I like small laptops and the constraints they place on me (as long as they’re still usable). I used a Dell Mini 9 for a long time back in the netbook days and was recently using an 11" MacBook Air as my primary development machine for many years. Recently Microsoft announced a smaller, cheaper version of its Surface tablets called Surface Go which piqued my interest.
>
>

* Hardware

>
>
> The Surface Go is available in two hardware configurations: one with 4Gb of RAM and a 64Gb eMMC, and another with 8Gb of RAM with a 128Gb NVMe SSD. (I went with the latter.) Both ship with an Intel Pentium Gold 4415Y processor which is not very fast, but it’s certainly usable.  
>  The tablet measures 9.65" across, 6.9" tall, and 0.3" thick. Its 10" diagonal 3:2 touchscreen is covered with Gorilla Glass and has a resolution of 1800x1200. The bezel is quite large, especially for such a small screen, but it makes sense on a device that is meant to be held, to avoid accidental screen touches.  
>  The keyboard and touchpad are located on a separate, removable slab called the Surface Go Signature Type Cover which is sold separately. I opted for the “cobalt blue” cover which has a soft, cloth-like alcantara material. The cover attaches magnetically along the bottom edge of the device and presents USB-attached keyboard and touchpad devices. When the cover is folded up against the screen, it sends an ACPI sleep signal and is held to the screen magnetically. During normal use, the cover can be positioned flat on a surface or slightly raised up about 3/4" near the screen for better ergonomics. When using the device as a tablet, the cover can be rotated behind the screen which causes it to automatically stop sending keyboard and touchpad events until it is rotated back around.  
>  The keyboard has a decent amount of key travel and a good layout, with Home/End/Page Up/Page Down being accessible via Fn+Left/Right/Up/Down but also dedicated Home/End/Page Up/Page Down keys on the F9-F12 keys which I find quite useful since the keyboard layout is somewhat small. By default, the F1-F12 keys do not send F1-F12 key codes and Fn must be used, either held down temporarily or Fn pressed by itself to enable Fn-lock which annoyingly keeps the bright Fn LED illuminated. The keys are backlit with three levels of adjustment, handled by the keyboard itself with the F7 key.  
>  The touchpad on the Type Cover is a Windows Precision Touchpad connected via USB HID. It has a decent click feel but when the cover is angled up instead of flat on a surface, it sounds a bit hollow and cheap.
>
>

* Surface Go Pen

>
>
> The touchscreen is powered by an Elantech chip connected via HID-over-i2c, which also supports pen input. A Surface Pen digitizer is available separately from Microsoft and comes in the same colors as the Type Covers. The pen works without any pairing necessary, though the top button on it works over Bluetooth so it requires pairing to use. Either way, the pen requires an AAAA battery inside it to operate. The Surface Pen can attach magnetically to the left side of the screen when not in use.  
>  A kickstand can swing out behind the display to use the tablet in a laptop form factor, which can adjust to any angle up to about 170 degrees. The kickstand stays firmly in place wherever it is positioned, which also means it requires a bit of force to pull it out when initially placing the Surface Go on a desk.  
>  Along the top of the display are a power button and physical volume rocker buttons. Along the right side are the 3.5mm headphone jack, USB-C port, power port, and microSD card slot located behind the kickstand.  
>  Charging can be done via USB-C or the dedicated charge port, which accommodates a magnetically-attached, thin barrel similar to Apple’s first generation MagSafe adapter. The charging cable has a white LED that glows when connected, which is kind of annoying since it’s near the mid-line of the screen rather than down by the keyboard. Unlike Apple’s MagSafe, the indicator light does not indicate whether the battery is charged or not. The barrel charger plug can be placed up or down, but in either direction I find it puts an awkward strain on the power cable coming out of it due to the vertical position of the port.  
>  Wireless connectivity is provided by a Qualcomm Atheros QCA6174 802.11ac chip which also provides Bluetooth connectivity.  
>  Most of the sensors on the device such as the gyroscope and ambient light sensor are connected behind an Intel Sensor Hub PCI device, which provides some power savings as the host CPU doesn’t have to poll the sensors all the time.
>
>

* Firmware

>
>
> The Surface Go’s BIOS/firmware menu can be entered by holding down the Volume Up button, then pressing and releasing the Power button, and releasing Volume Up when the menu appears. Secure Boot as well as various hardware components can be disabled in this menu. Boot order can also be adjusted. A temporary boot menu can be brought up the same way but using Volume Down instead.
>
>

---

\###[FreeBSD Foundation Update, August 2018](https://www.freebsdfoundation.org/news-and-events/newsletter/freebsd-foundation-update-august-2018/)

* MESSAGE FROM THE EXECUTIVE DIRECTOR

>
>
> Dear FreeBSD Community Member,  
>  It’s been a busy summer for the Foundation. From traveling around the globe spreading the word about FreeBSD to bringing on new team members to improve the Project’s Continuous Integration work, we’re very excited about what we’ve accomplished. Take a minute to check out the latest updates within our Foundation sponsored projects; read more about our advocacy efforts in Bangladesh and community building in Cambridge; don’t miss upcoming Travel Grant deadlines, and new Developer Summits; and be sure to find out how your support will ensure our progress continues into 2019.  
>  We can’t do this without you! Happy reading!! Deb
>
>

* August 2018 Development Projects Update
* Fundraising Update: Supporting the Project
* August 2018 Release Engineering Update
* BSDCam 2018 Recap
* October 2018 FreeBSD Developer Summit Call for Participation
* SANOG32 and COSCUP 2018 Recap
* MeetBSD 2018 Travel Grant Application Deadline: September 7

---

\##News Roundup  
 \###[Project Trident: What’s taking so long?](http://project-trident.org/post/2018-09-04_what_is_taking_so_long/)

* What is taking so long?

>
>
> The short answer is that it’s complicated.  
>  Project Trident is quite literally a test of the new TrueOS build system. As expected, there have been quite a few bugs, undocumented features, and other optional bits that we discovered we needed that were not initially present. All of these things have to be addressed and retested in a constant back and forth process.  
>  While Ken and JT are both experienced developers, neither has done this kind of release engineering before. JT has done some release engineering back in his Linux days, but the TrueOS and FreeBSD build system is very different. Both Ken and JT are learning a completely new way of building a FreeBSD/TrueOS distribution. Please keep in mind that no one has used this new TrueOS build system before, so Ken and JT want to not only provide a good Trident release, but also provide a model or template for other potential TrueOS distributions too!
>
>

* Where are we now?

>
>
> Through perseverance, trial and error, and a lot of head-scratching we have reached the point of having successful builds. It took a while to get there, but now we are simply working out a few bugs with the new installer that Ken wrote as well as finding and fixing all the new Xorg configuration options which recently landed in FreeBSD. We also found that a number of services have been removed or replaced between TrueOS 18.03 and 18.06 so we are needing to adjust what we consider the “base” services for the desktop. All of these issues are being resolved and we are continually rebuilding and pulling in new patches from TrueOS as soon as they are committed.  
>  In the meantime we have made an early BETA release of Trident available to the users in our Telegram Channel for those who want to help out in testing these early versions.
>
>

* Do you foresee any other delays?

>
>
> At the moment we are doing many iterations of testing and tweaking the install ISO and package configurations in order to ensure that all the critical functionality works out-of-box (networking, sound, video, basic apps, etc). While we do not foresee any other major delays, sometimes things happen that our outside of our control. For an example, one of the recent delays that hit recently was completely unexpected: we had a hard drive failure on our build server. Up until recently, The aptly named “Poseidon” build server was running a Micron m500dc drive, but that drive is now constantly reporting errors. Despite ordering a replacement Western Digital Blue SSD several weeks ago, we just received it this past week. The drive is now installed with the builder back to full functionality, but we did lose many precious days with the delay.  
>  The build server for Project Trident is very similar to the one that JT donated to the TrueOS project. JT had another DL580 G7, so he donated one to the Trident Project for their build server. Poseidon also has 256GB RAM (64 x 4GB sticks) which is a smidge higher than what the TrueOS builder has.  
>  Since we are talking about hardware, we probably should address another question we get often, “What Hardware are the devs testing on?” So let’s go ahead and answer that one now.
>
>

* Developer Hardware

* JT: His main test box is a custom-built Intel i7 7700K system running 32GB RAM, dual Intel Optane 900P drives, and an Nvidia 1070 GTX with four 4K Acer Monitors. He also uses a Lenovo x250 ThinkPad alongside a desk full of x230t and x220 ThinkPads. One of which he gave away at SouthEast LinuxFest this year, which you can read about here. However it’s not done there, being a complete hardware hoarder, JT also tests on several Intel NUCs and his second laptop a Fujitsu t904, not to mention a Plethora of HP DL580 servers, a DL980 server, and a stack of BL485c, BL460c, and BL490c Blades in his HP c7000 and c3000 Bladecenter chassis. (Maybe it’s time for an intervention for his hardware collecting habits)

* Ken: For a laptop, he primarily uses a 3rd generation X1 Carbon, but also has an old Eee PC T101MT Netbook (dual core 1GHz, 2GB of memory) which he uses for verifying how well Trident works on low-end hardware. As far as workstations go, his office computer is an Intel i7 with an NVIDIA Geforce GTX 960 running three 4K monitors and he has a couple other custom-built workstations (1 AMD, 1 Intel+NVIDIA) at his home. Generally he assembled random workstations based on hardware that was given to him or that he could acquire cheap.

* Tim: is using a third gen X1 Carbon and a custom built desktop with an Intel Core i5-4440 CPU, 16 GiB RAM, Nvidia GeForce GTX 750 Ti, and a RealTek 8168 / 8111 network card.

* Rod: Rod uses… No one knows what Rod uses, It’s kinda like how many licks does it take to get to the center of a Tootsie-Roll Tootsie-Pop… the world may just never know.

---

\###NetBSD GSoC: pkgsrc config file versioning

* A series of reports from the course of the summer on this Google Summer of Code project
* The goal of the project is to integrate with a VCS (Version Control System) to make managing local changes to config files for packages easier
* [GSoC 2018 Reports: Configuration files versioning in pkgsrc, Part 1](https://blog.netbsd.org/tnf/entry/gsoc_2018_reports_configuration_files)

>
>
> Packages may install code (both machine executable code and interpreted programs), documentation and manual pages, source headers, shared libraries and other resources such as graphic elements, sounds, fonts, document templates, translations and configuration files, or a combination of them.  
>  Configuration files are usually the means through which the behaviour of software without a user interface is specified. This covers parts of the operating systems, network daemons and programs in general that don’t come with an interactive graphical or textual interface as the principal mean for setting options.  
>  System wide configuration for operating system software tends to be kept under /etc, while configuration for software installed via pkgsrc ends up under LOCALBASE/etc (e.g., /usr/pkg/etc).  
>  Software packaged as part of pkgsrc provides example configuration files, if any, which usually get extracted to LOCALBASE/share/examples/PKGBASE/.  
>  Don’t worry: automatic merging is disabled by default, set $VCSAUTOMERGE to enable it.  
>  In order to avoid breakage, installed configuration is backed up first in the VCS, separating user-modified files from files that have been already automatically merged in the past, in order to allow the administrator to easily restore the last manually edited file in case of breakage.  
>  VCS functionality only applies to configuration files, not to rc.d scripts, and only if the environment variable $NOVCS is unset.  
>  The version control system to be used as a backend can be set through $VCS. It default to RCS, the Revision Control System, which works only locally and doesn’t support atomic transactions.  
>  Other backends such as CVS are supported and more will come; these, being used at the explicit request of the administrator, need to be already installed and placed in a directory part of $PATH.
>
>

* [GSoC 2018 Reports: Configuration files versioning in pkgsrc, part 2: remote repositories (git and CVS)](https://blog.netbsd.org/tnf/entry/gsoc_2018_reports_configuration_files1)

>
>
> pkgsrc is now able to deploy configuration from packages being installed from a remote, site-specific vcs repository.  
>  User modified files are always tracked even if automerge functionality is not enabled, and a new tool, pkgconftrack(1), exists to manually store user changes made outside of package upgrade time.  
>  Version Control software is executed as the same user running pkg\_add or make install, unless the user is “root”. In this case, a separate, unprivileged user, pkgvcsconf, gets created with its own home directory and a working login shell (but no password). The home directory is not strictly necessary, it exists to facilitate migrations betweens repositories and vcs changes; it also serves to store keys used to access remote repositories.  
>  Using git instead of rcs is simply done by setting VCS=git in pkg\_install.conf
>
>

* [GSoC 2018 Reports: Configuration files versioning in pkgsrc, part 3: remote repositories (SVN and Mercurial)](https://blog.netbsd.org/tnf/entry/gsoc_2018_reports_configuration_files2)
* [GSoC 2018 Reports: Configuration files versioning in pkgsrc, part 4: configuration deployment, pkgtools and future improvements](https://blog.netbsd.org/tnf/entry/gsoc_2018_reports_configuration_files3)

>
>
> Support for configuration tracking is in scripts, pkginstall scripts, that get built into binary packages and are run by pkg\_add upon installation. The idea behind the proposal suggested that users of the new feature should be able to store revisions of their installed configuration files, and of package-provided default, both in local or remote repositories. With this capability in place, it doesn’t take much to make the scripts “pull” configuration from a VCS repository at installation time.  
>  That’s what setting VCSCONFPULL=yes in pkg\_install.conf after having enabled VCSTRACK\_CONF does: You are free to use official, third party prebuilt packages that have no customization in them, enable these options, and point pkgsrc to a private conf repository. If it contains custom configuration for the software you are installing, an attempt will be made to use it and install it on your system. If it fails, pkginstall will fall back to using the defaults that come inside the package. RC scripts are always deployed from the binary package, if existing and PKG\_RCD\_SCRIPTS=yes in pkg\_install.conf or the environment.  
>  This will be part of packages, not a separate solution like configuration management tools. It doesn’t support running scripts on the target system to customize the installation, it doesn’t come with its domain-specific language, it won’t run as a daemon or require remote logins to work. It’s quite limited in scope, but you can define a ROLE for your system in pkg\_install.conf or in the environment, and pkgsrc will look for configuration you or your organization crafted for such a role (e.g., public, standalone webserver vs reverse proxy or node in a database cluster)
>
>

---

\###[A little bit of the one-time MacOS version still lingers in ZFS](https://utcc.utoronto.ca/~cks/space/blog/solaris/ZFSDTypeAndMacOS)

>
>
> Once upon a time, Apple came very close to releasing ZFS as part of MacOS. Apple did this work in its own copy of the ZFS source base (as far as I know), but the people in Sun knew about it and it turns out that even today there is one little lingering sign of this hoped-for and perhaps prepared-for ZFS port in the ZFS source code. Well, sort of, because it’s not quite in code.  
>  Lurking in the function that reads ZFS directories to turn (ZFS) directory entries into the filesystem independent format that the kernel wants is the following comment:
>
>

`objnum = ZFS_DIRENT_OBJ(zap.za_first_integer);`  
`/*`  
`* MacOS X can extract the object type here such as:`  
`* uint8_t type = ZFS_DIRENT_TYPE(zap.za_first_integer);`  
`*/`

* Specifically, this is in zfs\_readdir in zfs\_vnops.c .

>
>
> ZFS maintains file type information in directories. This information can’t be used on Solaris (and thus Illumos), where the overall kernel doesn’t have this in its filesystem independent directory entry format, but it could have been on MacOS (‘Darwin’), because MacOS is among the Unixes that support d\_type. The comment itself dates all the way back to this 2007 commit, which includes the change ‘reserve bits in directory entry for file type’, which created the whole setup for this.  
>  I don’t know if this file type support was added specifically to help out Apple’s MacOS X port of ZFS, but it’s certainly possible, and in 2007 it seems likely that this port was at least on the minds of ZFS developers. It’s interesting but understandable that FreeBSD didn’t seem to have influenced them in the same way, at least as far as comments in the source code go; this file type support is equally useful for FreeBSD, and the FreeBSD ZFS port dates to 2007 too (per this announcement).  
>  Regardless of the exact reason that ZFS picked up maintaining file type information in directory entries, it’s quite useful for people on both FreeBSD and Linux that it does so. File type information is useful for any number of things and ZFS filesystems can (and do) provide this information on those Unixes, which helps make ZFS feel like a truly first class filesystem, one that supports all of the expected general system features.
>
>

---

\##Beastie Bits

* [Mac-like FreeBSD Laptop](http://trafyx.com/?p=2551)
* [Syncthing on FreeBSD](https://vermaden.wordpress.com/2018/08/21/syncthing-on-freebsd/)
* [New ZFS Boot Environments Tool](https://vermaden.wordpress.com/2018/08/24/new-zfs-boot-environments-tool/)
* [My system’s time was so wrong, that even ntpd didn’t work](http://anadoxin.org/blog/my-systems-time-was-so-wrong-that-even-ntpd-didnt-work.html)
* [OpenSSH 7.8/7.8p1 (2018-08-24)](https://www.openssh.com/releasenotes.html#7.8)
* [EuroBSD (Sept 20-23rd) registration Early Bird Period is coming to an end](https://2018.eurobsdcon.org/registration/)
* [MeetBSD (Oct 18-20th) is coming up fast, hurry up and register!](https://www.meetbsd.com/)
* [AsiaBSDcon 2019 Dates](https://2019.asiabsdcon.org/)

---

\##Feedback/Questions

* Will - [Kudos and a Question](http://dpaste.com/2EQMHXV)
* Peter - [Fanless Computers](http://dpaste.com/2N6DC6P#wrap)
* Ron - [ZFS disk clone or replace or something](http://dpaste.com/0MRG11V#wrap)
* Bostjan - [ZFS Record Size](http://dpaste.com/16B1WDB)

---

* Send questions, comments, show ideas/topics, or stories you want mentioned on the show to [feedback@bsdnow.tv](mailto:feedback@bsdnow.tv)

---