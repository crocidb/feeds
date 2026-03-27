+++
title = "206: To hier is UNIX"
description = "Lumina Desktop 1.3 is out, we show you a Plasma 5 on FreeBSD tutorial, explore randomness, and more.This episode was brought to you byiXsystems - Enterprise Servers and Storage for Open Source[![DigitalOcean - Simple "
date = "2017-08-09T12:00:00Z"
url = "https://www.bsdnow.tv/206"
author = "feedback@bsdnow.tv (JT Pennington)"
text = ""
lastupdated = "2026-03-26T14:37:50.866119582Z"
seen = false
+++

Lumina Desktop 1.3 is out, we show you a Plasma 5 on FreeBSD tutorial, explore randomness, and more.

This episode was brought to you by
----------

[![iXsystems - Enterprise Servers and Storage for Open Source](/images/1.png)](http://www.ixsystems.com/bsdnow)[![DigitalOcean - Simple Cloud Hosting, Built for Developers](/images/2.png)](http://www.digitalocean.com/)[![Tarsnap - Online Backups for the Truly Paranoid](/images/3.png)](http://www.tarsnap.com/bsdnow)

---

Headlines
----------

### [Lumina Desktop v1.3 released](https://lumina-desktop.org/version-1-3-0-released/) ###

* Notable Changes:
* New Utility: lumina-mediaplayer. Lumina Media Player is a graphic interface for the Qt QMediaPlayer Class, with Pandora internet radio streaming integration. Lumina Media Player supports many audio formats, including .ogg, .mp3, .mp4, .flac, and .wmv. It is also possible to increase the number of playable formats by installing gstreamer-plugins. This utility is found in the Applications → Utilities section, or opened by typing lumina-mediaplayer in a command line.
  * New Utility: lumina-xdg-entry. This is another simple utility designed to help users create .desktop entries and shortcuts. Find it in the Utilities application category, or open it by typing lumina-xdg-entry in a command line.

* Lumina Desktop:
  * Desktop folders are integrated, and can now be manipulated directly from the desktop.
  * Added the automatic settings migration of a desktop monitor (single monitor only, for now).
  * Numerous speed and performance improvements with how icons load and the system interacts with the desktop.

* Lumina-FM:
  * Now fully integrated with lumina-archiver.
  * A “System directory” tree pane is available. Options to enable/disable it are being added later, as it is on by default.
  * Numerous speed improvements with caching and loading icons.

* Lumina Texteditor:
  * There is a new json manifest file format for syntax highlighting support. Users can open this file, customize their highlighting options, and immediately see their changes without rebuilding the utility.
  * The text editor now supports more than 10 different file formats.
  * Added options for file-wide preferences in syntax files. Options include: word wrap, character per line limits, excess whitespace highlighting, font style restrictions, and tab-width settings.
  * LTE supports tabs with detach, drag’n’drop, and location customization with the View menu option.
  * Add checkable menu option to show the “unsaved changes” dialogue box on close.

* Lumina Screenshot:
  * Adjustments to the lumina-screenshot interface.
  * Add an adjustable warning to lumina-screenshot when closing with an unsaved image.
  * Add functionality to select a specific area of the screen for screenshots.

* Lumina Archiver:
  * Functionality improvements.
  * Bug fixes.
  * Interface changes.

* General Improvements:
  * Permission checks for settings files (all utilities). When launched with sudo, all tools use or create a root-permissioned copy of the user’s settings file. This prevents a settings file being locked by root.
  * UI text reworks to help re-unify style.
  * Add hooks to update the desktop with icons for the /media directory when a system uses USB automounting functionality.
  * Fix Fluxbox bug with windows workspace assignments.
  * Work on new utility lumina-notify (not fully functional yet).
  * Fix panel reporting error crashing lumina-config.
  * Bug fix for dbus-send calls for Gentoo.
  * Clean up automatic DPI scaling support.
  * Bug fix for the panel clock.
  * Compton compositor is now disabled by default (but can be manually enabled).
  * Translation file updates.
  * Documentation updates. \*\*\*

### [FreeBSD 11.0 and Plasma 5 HowTo](https://euroquis.nl/bobulate/?p=1609) ###

>
>
> Here’s a step-by-step guide to getting a machine with FreeBSD 11 in it, running X, and KDE Plasma 5 Desktop and KDE Applications. It’s the latest thing! (Except that 11-STABLE is in the middle of the pack of what’s supported .. but the KDE bits are fresh. I run 10.3 with KDE4 or Plasma 5 on my physical machines, myself, so the FreeBSD version isn’t that important except that packages are readily available for 11-STABLE, not for 10-STABLE.)
>
>

* We skip the part about installing FreeBSD (it’s in there if you need it) and get right to the important parts that you need:
* An X Server and a backup X11 environment (ancient):

>
>
> pkg install xorg xterm twm
>
>

* Desktop technologies (modern):

>
>
> pkg install hal dbus  
>  echo hald\_enable=YES \>\> /etc/rc.conf  
>  echo dbus\_enable=YES \>\> /etc/rc.conf
>
>

* Next up, test whether the X server works by running startx and exiting out of twm.

>
>
> If running with ZFS, it’s a good idea to snapshot now, just so you can easily roll back to the it-works-with-basic-X11 setup you have now.  
>  zfs snapshot -r zroot@x11
>
>

* Now swap out the default FreeBSD package repository, for the KDE-FreeBSD community one. This is documented also on the [Area51 page](https://community.kde.org/FreeBSD/Setup/Area51).

>
>
> mkdir -p /usr/local/etc/pkg/repos  
>  cd /usr/local/etc/pkg/repos  
>  cat \> FreeBSD.conf \< FreeBSD: { enabled: no }  
>  EOF  
>  cat \> Area51.conf \<\<EOF  
>  Area51: {  
>  url: "[http://meatwad.mouf.net/rubick/poudriere/packages/110-amd64-kde/](http://meatwad.mouf.net/rubick/poudriere/packages/110-amd64-kde/)",  
>  priority: 2,  
>  enabled: yes  
>  }  
>  EOF
>
>

* Tell pkg(8) to refresh itself (it may install a newer pkg, too), then install something nicer than xterm + twm, and then do some post-install configuration:

>
>
> pkg update  
>  pkg install konsole plasma5-plasma-desktop  
>  echo cuse\_load=YES \>\> /boot/loader.conf  
>  echo webcamd\_enable=YES \>\> /etc/rc.conf
>
>

* Log in as your test user, and set up .xinitrc to start Plasma 5:

>
>
> cat \> .xinitrc \<\<EOF  
>  \#! /bin/sh  
>  /usr/local/bin/xterm -geometry +0+0 &  
>  KDE=/usr/local/bin/startkde  
>  test -x $KDE && exec /usr/local/bin/ck-launch-session $KDE  
>  exec /usr/local/bin/twm  
>  EOF  
>  chmod 755 .xinitrc
>
>

* If you really want, you can run startx, but this isn’t the complete Plasma 5 desktop experience... and KDE Applications are not installed, either. So you get a bare xterm (useful to kill X or start konsole) and kwin and not much else. Good thing that getting the rest of KDE Plasma 5 Desktop and KDE Applications is pretty easy (and we could have skipped the intermediate step with konsole and gone straight to the finish:

>
>
> pkg install kde
>
>

* This metaport will pull in another 2GiB of stuff, for all the KDE Applications and a complete Plasma desktop. There are intermediate metaports for slightly-less-heavy installations, but this one is easy to remember and will almost certainly get you what you want. So it really comes down to installing X, dbus, hal, and then the kde package. Voila! \*\*\*

### [Full FreeBSD Server on a Raspberry Pi](https://blog.cagedmonster.net/setup-full-server-with-freebsd-on-raspberrypi/) ###

* Disclaimer :
  * The Raspberry PI is a such a great device. You can do a really huge amount of fun things with this little board...
  * The goal of this paper is to show how you can build a full personal server on your Raspberry PI, using FreeBSD and it's packages.

* Here's how we'll proceed :
  * Get FreeBSD
  * Configure FreeBSD
  * Install and configure sudo
  * Configure your Wifi with a static IPv4 and IPv6 address
  * Install and start Packet Filter
  * Install and configure nginx with "let's encrypt" SSL / PHP / MySQL
  * Install and configure OpenSMTPd and SPAMd
  * Install and configure Netdata with nginx to monitor your system
  * Avoid OS detection \*\*\*

News Roundup
----------

### [HardenedBSD, now has openntpd in base](https://hardenedbsd.org/article/shawn-webb/2017-06-27/introducing-openntpd-base) ###

* Over the past few months, Bernard Spil has been hard at work importing OpenNTPd 6.0p1 in HardenedBSD base. Starting with 12-CURRENT, HardenedBSD will ship with OpenNTPd by default. Just like with LibreSSL in base, HardenedBSD users have a choice when building world of which NTP daemon to use. Users who want to use the legacy NTPd can set WITHOUT\_OPENNTPD and WITH\_NTP in src.conf(5). Bernard will continue maintaining LibreSSL and OpenNTPd in HardenedBSD base.
* Users who are upgrading from an existing 12-CURRENT system from source and who use the legacy NTP daemon in base will need to perform the following actions:

  * Install new world
  * Run mergemaster or etcupdate
  * sysrc ntpd\_enable="NO"
  * sysrc local\_openntpd\_enable="YES"

* A binary update will be published within the next 24 hours that contains OpenNTPd in base. Those who use hbsd-update will only need to perform steps 3 and 4 above.

  ---

### [Unix: How random is random](http://www.networkworld.com/article/3208389/linux/unix-how-random-is-random.html) ###

* Sandra Henry-Stocker writes on Networkworld:

>
>
> On Unix systems, random numbers are generated in a number of ways and random data can serve many purposes. From simple commands to fairly complex processes, the question “How random is random?” is worth asking.  
>  EZ random numbers  
>  If all you need is a casual list of random numbers, the RANDOM variable is an easy choice. Type "echo $RANDOM" and you'll get a number between 0 and 32,767 (the largest number that two bytes can hold).
>
>

* Note: this only works in bash, and is generally a silly thing to do

>
>
> Of course, this process is actually providing a "pseudo-random" number. As anyone who thinks about random numbers very often might tell you, numbers generated by a program have a limitation. Programs follow carefully crafted steps, and those steps aren’t even close to being truly random. You can increase the randomness of RANDOM's value by seeding it (i.e., setting the variable to some initial value). Some just use the current process ID (via $$) for that. Note that for any particular starting point, the subsequent values that $RANDOM provides are quite predictable.
>
>

* More complex random data

>
>
> For more serious requirements for random data, such as its use in encryption, some more truly random data comes into play. The /dev/random and /dev/urandom files get beyond the predictability of programming by making use of environmental noise gathered from device drivers and other system sources and stored it in an “entropy pool”.
>
>

* Examining entropy
* Randomness vs. entropy
* Generating files with random data
* Generating random numbers
* Beyond /dev/urandom \*\*\*

### [Moving firmware to userland](http://lists.dragonflybsd.org/pipermail/kernel/2017-July/239413.html) ###

* This is a post from the DragonFlyBSD mailinglist:

>
>
> I would like to introduce a few ideas about the new firmware subsystem. I assume that it should not require adding a new system tools or modifying boot process.  
>  Simplification is the first. It would be good to remove parent-child relationship and corresponding functionality. It would significantly simplify firmware handling. Its only practical use is when there are multiple images in one loadable kernel module. The module can be unloaded when all children are not in use. Usage of the children images is tracked through the counter for the parent image. If images will not be placed inside loadable kernel modules, the parent-child mechanism won't have any practical meaning. I think, currently the mechanism is not used anywhere in the DragonFly system and if it was, it could be easily replaced by putting every child image in its own module without modifying drivers.  
>  There are two use cases according to who will provide firmware images to   
>  the system:
>
>
>
> * developers of DragonFly BSD (they can modify and rebuild the system)
> * third-parties (they should not be required to modify and rebuild the system)
>
>
>
> All firmware images needs to have some information attached (at least,   
>  if ack with a license is needed) which should be d) stored persistently.  
>  The question is where to save the information for non-built-in images.
>
>

* Various solutions are proposed that meet some -- but not all -- of the mentioned requirements, along with pros and cons.
* It closes with:

>
>
> There would be two firmware sources: kernel and filesystem. In case of the same image names, user could have a choice by setting a kernel environment variable, firmware from which source has higher priority and will be provided to consumer.
>
>
> ---
>

### [OpenBSD changes of note 625](https://www.tedunangst.com/flak/post/openbsd-changes-of-note-625) ###

* Continue with some cleanup and improvement of the depend step of building. Lots of little things to support lex and yacc better as well.
* Intel Optane parts are leaking into the wild, some driver fixes to support them.
* Add support for pattern substitution to variables in ksh using a common syntax borrowed from ksh93. Or not, reverted.
* Deprecate fgetln.
* Add detection for missing X sets to syspatch.
* Refinement of the inteldrm code, including better backlight support.
* A special edition of slaacd for the installer.
* After much wailing and gnashing of teeth, fix strtol to parse strings like “0xridiculous”.
* A fix for malloc and zero sized allocations when using canaries.
* Add the ability to pause and unpause VMs in vmd.
* Remove “listen secure” syntax from smtpd.conf. It’s broken since a couple of months and noone complained.
* Remove sending of router solicitations and processing of router advertisements from the kernel.
* The lidsuspend sysctl has been fully replaced by lidaction.
* Fix fortune to filter out unprintable characters. Convert the fortune files to using UTF-8 instead of archaic overprinting. Fortunes with unprintable words may still be obtained with the -o option.
* Introduce some quirks to the IDE and ATA code to prevent drives from attaching twice on hyper-v.
* Add vmctl send and receive as well.
* Update to xterm 330.
* Remove some magic cleanup from dhclient. It will not deliberately attempt to interfere with other operations on the same interface.
* Update libexpat to 2.2.2. Fixes NULL parser dereference.
* Ilja Van Sprundel found a whole mess of kernel bugs in this and that. Some info leaks, some erroneous signal handling, some unbounded malloc calls. Lions, tigers, bears. Try to fix them. \*\*\*

Beastie Bits
----------

* [Heir - description of the file system hierarchy](https://lud.cc/programming/man-hier/)
* [FreeBSD hier(7)](https://www.freebsd.org/cgi/man.cgi?query=hier&format=html)
* [sshlockout and your logs](http://lists.dragonflybsd.org/pipermail/commits/2017-July/626020.html)
* [net-mgmt/netdata can now monitor ZFS pools](https://svnweb.freebsd.org/ports?view=revision&revision=446144)
* [Ted Unangst is reviewing some books, chapter by chapter. “Coders at Work”, “Founders at Work”, “the Mythical Man-Month”, “The Pragmatic Programmer”, and “Code: The Hidden Language of Computer Hardware and Software”. This is chapter 5, look for the bookreview tag on the site to find the previous ones](https://www.tedunangst.com/flak/post/books-chapter-five)
* [pfSense 2.3.4-p1 release now available](https://www.netgate.com/blog/pfsense-2-3-4-p1-release-now-available.html) \*\*\*

Feedback/Questions
----------

* [Ben - Thanks](http://dpaste.com/0V84RN7)
* [Jay - ZFS and Speed](http://dpaste.com/3KRWRS0)
* [Patrick - Portalfs removed?](http://dpaste.com/0M9STNX)
* [Sir l33tname - ZFS pool question](http://dpaste.com/2H0Y3R5) \*\*\*