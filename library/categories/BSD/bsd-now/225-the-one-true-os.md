+++
title = "225: The one true OS"
description = "TrueOS stable 17.12 is out, we have an OpenBSD workstation guide for you, learnings from the PDP-11, FreeBSD 2017 Releng recap and Duo SSH.This episode was brought to you by[iXsystems - Enterprise Servers and Storage for Open Source](http://www.ixsyste"
date = "2017-12-20T13:00:00Z"
url = "https://www.bsdnow.tv/225"
author = "feedback@bsdnow.tv (JT Pennington)"
text = ""
lastupdated = "2026-03-26T14:37:50.812006053Z"
seen = false
+++

TrueOS stable 17.12 is out, we have an OpenBSD workstation guide for you, learnings from the PDP-11, FreeBSD 2017 Releng recap and Duo SSH.

This episode was brought to you by
----------

[![iXsystems - Enterprise Servers and Storage for Open Source](/images/1.png)](http://www.ixsystems.com/bsdnow)[![DigitalOcean - Simple Cloud Hosting, Built for Developers](/images/2.png)](http://www.digitalocean.com/)[![Tarsnap - Online Backups for the Truly Paranoid](/images/3.png)](http://www.tarsnap.com/bsdnow)

---

Headlines
----------

### [TrueOS stable release 17.12](https://www.trueos.org/blog/trueos-17-12-release/) ###

>
>
> We are pleased to announce a new release of the 6-month STABLE version of TrueOS!  
>  This release cycle focused on lots of cleanup and stabilization of the distinguishing features of TrueOS: OpenRC, boot speed, removable-device management, SysAdm API integrations, Lumina improvements, and more. We have also been working quite a bit on the server offering of TrueOS, and are pleased to provide new text-based server images with support for Virtualization systems such as bhyve! This allows for simple server deployments which also take advantage of the TrueOS improvements to FreeBSD such as:
>
>

* Sane service management and status reporting with OpenRC
* Reliable, non-interactive system update mechanism with fail-safe boot environment support.
* Graphical management of remote TrueOS servers through SysAdm (also provides a reliable API for administrating systems remotely).
* LibreSSL for all base SSL support.
* Base system managed via packages (allows for additional fine-tuning).
* Base system is smaller due to the removal of the old GCC version in base. Any compiler and/or version may be installed and used via packages as desired.
* Support for newer graphics drivers and chipsets (graphics, networking, wifi, and more)

>
>
> TrueOS Version 17.12 (2017, December) is now available for download from the TrueOS website. Both the STABLE and UNSTABLE package repositories have also been updated in-sync with each other, so current users only need to follow the prompts about updating their system to run the new release.  
>  We are also pleased to announce the availability of TrueOS Sponsorships! If you would like to help contribute to the project financially we now have the ability to accept both one-time donations as well as recurring monthly donations which wil help us advocate for TrueOS around the world. Thank you all for using and supporting TrueOS!
>
>

* Notable Changes:
  * Over 1100 OpenRC services have been created for 3rd-party packages. This should ensure the functionality of nearly all available 3rd-party packages that install/use their own services.
  * The OpenRC services for FreeBSD itself have been overhauled, resulting in significantly shorter boot times.
  * Separate install images for desktops and servers (server image uses a text/console installer)
  * Bhyve support for TrueOS Server Install
  * FreeBSD base is synced with 12.0-CURRENT as of December 4th, 2017 (Github commit: 209d01f)
  * FreeBSD ports tree is synced as of November 30th (pre-FLAVOR changes)
  * Lumina Desktop has been updated/developed from 1.3.0 to 1.4.1
  * PCDM now supports multiple simultaneous graphical sessions
  * Removable devices are now managed through the “automounter” service.
  * Devices are “announced” as available to the system via \*.desktop shortcuts in /media. These shortcuts also contain a variety of optional “Actions” that may be performed on the device.
  * Devices are only mounted while they are being used (such as when browsing via the command line or a file manager).
  * Devices are automatically unmounted as soon as they stop being accessed.
  * Integrated support for all major filesystems (UFS, EXT, FAT, NTFS, ExFAT, etc..)
  * NOTE: The Lumina desktop is the only one which supports this functionality at the present time.
  * The TrueOS update system has moved to an “active” update backend. This means that the user will need to actually start the update process by clicking the “Update Now” button in SysAdm, Lumina, or PCDM (as well as the command-line option). The staging of the update files is still performed automatically by default but this (and many other options) can be easily changed in the “Update Manager” settings as desired.

* Known Errata:
  * [VirtualBox] Running FreeBSD within a VirtualBox VM is known to occasionally receive non-existent mouse clicks – particularly when using a scroll wheel or two-finger scroll.

* Quick Links:
  * [TrueOS Forums](https://discourse.trueos.org/)
  * [TrueOS Bugs](https://github.com/trueos/trueos-core/issues)
  * [TrueOS Handbook](https://www.trueos.org/handbook/trueos.html)
  * [TrueOS Community Chat on Telegram](https://t.me/TrueOSCommunity) \*\*\*

### [OpenBSD Workstation Guide](https://begriffs.com/posts/2017-05-17-linux-workstation-guide.html) ###

* Design Goals
* User actions should complete instantaneously. While I understand if compiling code and rendering videos takes time, opening programs and moving windows should have no observable delay. The system should use minimalist tools.
* Corollary: cache data offline when possible. Everything from OpenStreetMaps to StackExchange can be stored locally. No reason to repeatedly hit the internet to query them. This also improves privacy because the initial download is indiscriminate and doesn’t reveal personal queries or patterns of computer activity.
* No idling program should use a perceptible amount of CPU. Why does CalendarAgent on my Macbook sometimes use 150% CPU for fifteen minutes? Who knows. Why are background ChromeHelpers chugging along at upper-single-digit CPU? I didn’t realize that holding a rendered DOM could be so challenging.
* Avoid interpreted languages, web-based desktop apps, and JavaScript garbage. There, I said it. Take your Electron apps with you to /dev/null!
* Stability. Old fashioned programs on a conservative OS on quality mainstream hardware. There are enough challenges to tackle without a bleeding edge system being one of them.
* Delegate to quality hardware components. Why use a janky ncurses software audio mixer when you can use…an actual audio mixer?
* Hardware privacy. No cameras or microphones that I can’t physically disconnect. Also real hardware protection for cryptographic keys.
* Software privacy. Commercial software and operating systems have gotten so terrible about this. I even catch Mac command line tools trying to call Google Analytics. Sorry homebrew, your cute emojis don’t make up for the surveillance.
  * The Hardware
  * Core

>
>
> To get the best hardware for the money I’m opting for a desktop computer. Haven’t had one since the early 2000s and it feels anachronistic, but it will outperform a laptop of similar cost. After much searching, I found the HP Z240 Tower Workstation. It’s no-nonsense and supports exactly the customizations I was looking for:
>
>

* No operating system pre-loaded (Cut out the “Windows tax”)
* Intel Xeon E3-1270 v6 processor (Supports ECC ram)
* 16 GB (2x8 GB) DDR4-2400 ECC Unbuffered memory (2400Mhz is the full memory clock speed supported by the Xeon)
* 256 GB HP Z Turbo Drive G2 PCIe SSD (Uses NVMe rather than SATA for faster throughput, supported by nvme(4))
* No graphics card (We’ll add our own)
* Intel® Ethernet I210-T1 PCIe (Supported by em(4))

* A modest discrete video card will enable 2D Glamor acceleration on X11. The Radeon HD 6450 (sold separately) is fanless and listed as supported by radeon(4).

* Why build a solid computer and not protect it? Externally, the APC BR1300G UPS will protect the system from power surges and abrupt shutdowns.

  * Peripherals

>
>
> The Matias Ergo Pro uses mechanical switches for that old fashioned clicky sound. It also includes dedicated buttons along the side for copying and pasting. Why is that cool? Well, it improves secondary selection, a technique that Sun computers used but time forgot.  
>  Since we’re talking about a home office workstation, you may want a printer. The higher quality printers speak PostScript and PDF natively. Unix machines connect to them on TCP port 9100 and send PostScript commands directly. (You can print via telnet if you know the commands!) The Brother HL-L5100DN is a duplex LaserJet which allows that “raw” TCP printing.
>
>

* Audio/Video

>
>
> I know a lot of people enjoy surrounding themselves with a wall of monitors like they’re in the heart of NASA Mission Control, but I find multi-monitor setups slightly disorienting. It introduces an extra bit of cognitive overhead to determine which monitor is for what exactly. That’s why I’d go with a modest, crisp Dell UltraSharp 24" U2417H. It’s 1080p and yeah there are 4k monitors nowadays, but text and icons are small enough as it is for me!  
>  If I ever considered a second monitor it would be e-ink for comfortably reading electronic copies of books or long articles. The price is currently too high to justify the purchase, but the most promising monitor seems to be the Dasung Paperlike.  
>  In the other direction, video input, it’s more flexible to use a general-purpose HDMI capture box like the Rongyuxuan than settle on a particular webcam. This allows hooking up a real camera, or any other video device.  
>  Although the motherboard for this system has built-in audio, we should use a card with better OpenBSD support. The WBTUO PCIe card uses a C-Media CMI8768 chipset, handled by cmpci(4). The card provides S/PDIFF in and out ports if you ever want to use an external DAC or ADC.  
>  The way to connect it with other things is with a dedicated hardware mixer. The Behringer Xenyx 802 has all the connections needed, and the ability to route audio to and from the computer and a variety of devices at once. The mixer may seem an odd peripheral, but I want to mix the computer with an old fashioned CD player, ham radio gear, and amplifier so this unifies the audio setup.  
>  When doing remote pair programming or video team meetings it’s nice to have a quality microphone. The best ones for this kind of work are directional, with a cardioid reception pattern. The MXL 770 condenser mic is perfect, and uses a powered XLR connection supplied by the mixer.
>
>

* Backups

>
>
> We’re going dead simple and old-school, back to tapes. There are a set of tape standards called LTO-n. As n increases the tape capacity gets bigger, but the tape drive gets more expensive. In my opinion the best balance these days for the home user is LTO-3. You can usually find an HP Ultrium 960 LTO-3 on eBay for 150 dollars. The cartridges hold 800GB and are about 15 dollars apiece. Hard drives keep coming down in price, but these tapes are very cheap and simpler than keeping a bunch of disk drives. Also tape has proven longevity, and good recoverability.  
>  To use old fashioned tech like this you need a SCSI host bus adapter like the Adaptec 29320LPE, supported by ahd(4).
>
>

* Cryptography

>
>
> You don’t want to generate and store secret keys on a general purpose network attached computer. The attack surface is a mile wide. Generating or manipulating “offline” secret keys needs to happen on a separate computer with no network access.  
>  Little boards like the Raspberry Pi would be good except they use ARM processors (incompatible with Tails OS) and have wifi. The JaguarBoard is a small x86 machine with no wireless capability. Just switch the keyboard and monitor over to this machine for your “cleanroom.”   
>  jaguar board: Generating keys requires entropy. The Linux kernel on Tails samples system properties to generate randomness, but why not help it out with a dedicated true random number generator (TRNG)? Bit Babbler supplies pure randomness at a high bitrate through USB. (OneRNG works better on the OpenBSD main system, via uonerng(4).)  
>  bit babbler: This little computer will save its results onto a OpenPGP Smartcard V2.1. This card provides write-only access to keys, and computes cryptographic primitives internally to sign and encrypt messages. To use it with a regular computer, hook up a Cherry ST2000 card reader. This reader has a PIN pad built in, so no keylogger on the main computer could even obtain your decryption PIN.
>
>

* The Software

>
>
> We take the beefed up hardware above and pair it with ninja-fast software written in C. Some text-based, others raw X11 graphical apps unencumbered by ties to any specific window manager.  
>  I’d advise OpenBSD for the underlying operating system, not a Linux. OpenBSD has greater internal consistency, their man pages are impeccable, and they make it a priority to prune old code to keep the system minimal.
>
>
> ---
>

### [What Have We Learned from the PDP-11?](https://dave.cheney.net/2017/12/04/what-have-we-learned-from-the-pdp-11) ###

>
>
> The paper I have chosen tonight is a retrospective on a computer design. It is one of a series of papers by Gordon Bell, and various co-authors, spanning the design, growth, and eventual replacement of the companies iconic line of PDP-11 mini computers.  
>  This year represents the 60th anniversary of the founding of the company that produced the PDP-11. It is also 40 years since this paper was written, so I thought it would be entertaining to review Bell’s retrospective through the lens of our own 20/20 hindsight.  
>  To set the scene for this paper, first we should talk a little about the company that produced the PDP-11, the Digital Equipment Corporation of Maynard, Massachusetts. Better known as DEC.  
>  It’s also worth noting that the name PDP is an acronym for “Programmed Data Processor”, as at the time, computers had a reputation of being large, complicated, and expensive machines, and DEC’s venture capitalists would not support them if they built a “computer”  
>  A computer is not solely determined by its architecture; it reflects the technological, economic, and human aspects of the environment in which it was designed and built. […] The finished computer is a product of the total design environment.
>
>

* “Right from the get go, Bell is letting us know that the success of any computer project is not abstractly building the best computer but building the right computer, and that takes context.”

>
>
> It is the nature of computer engineering to be goal-oriented, with pressure to produce deliverable products. It is therefore difficult to plan for an extensive lifetime.  
>  Because of the open nature of the PDP-11, anything which interpreted the instructions according to the processor specification, was a PDP-11, so there had been a rush within DEC, once it was clear that the PDP-11 market was heating up, to build implementations; you had different groups building fast, expensive ones and cost reduced slower ones  
>  The first weakness of minicomputers was their limited addressing capability. The biggest (and most common) mistake that can be made in a computer design is that of not providing enough address bits for memory addressing and management.  
>  A second weakness of minicomputers was their tendency not to have enough registers. This was corrected for the PDP-11 by providing eight 16-bit registers. Later, six 32-bit registers were added for floating-point arithmetic. […] More registers would increase the multiprogramming context switch time and confuse the user.
>
>

* “It’s also interesting to note Bell’s concern that additional registers would confuse the user. In the early 1970’s the assumption that the machine would be programmed directly in assembly was still the prevailing mindset.”

>
>
> A third weakness of minicomputers was their lack of hardware stack capability. In the PDP-11, this was solved with the autoincrement/autodecrement addressing mechanism. This solution is unique to the PDP-11 and has proven to be exceptionally useful. (In fact, it has been copied by other designers.)
>
>

* “Nowadays it’s hard to imagine hardware that doesn’t have a notion of a stack, but consider that a stack isn’t important if you don’t need recursion.”
* “The design for the PDP-11 was laid down in 1969 and if we look at the programming languages of the time, FORTRAN and COBOL, neither supported recursive function calls. The function call sequence would often store the return address at a blank word at the start of the procedure making recursion impossible.”

>
>
> A fourth weakness, limited interrupt capability and slow context switching, was essentially solved with the device of UNIBUS interrupt vectors, which direct device interrupts.  
>  The basic mechanism is very fast, requiring only four memory cycles from the time an interrupt request is issued until the first instruction of the interrupt routine begins execution.  
>  A fifth weakness of prior minicomputers, inadequate character-handling capability, was met in the PDP-11 by providing direct byte addressing capability.
>
>

* “Strings and character handling were of increasing importance during the 1960’s as scientific and business computing converged. The predominant character encodings at the time were 6 bit character sets which provided just enough space for upper case letters, the digits 0 to 9, space, and a few punctuation characters sufficient for printing financial reports.”
* “Because memory was so expensive, placing one 6 bit character into a 12 or 18 bit word was simply unacceptable so characters would be packed into words. This proved efficient for storage, but complex for operations like move, compare, and concatenate, which had to account for a character appearing in the top or bottom of the word, expending valuable words of program storage to cope.”
* “The problem was addressed in the PDP-11 by allowing the machine to operate on memory as both a 16-bit word, and the increasingly popular 8-bit byte. The expenditure of 2 additional bits per character was felt to be worth it for simpler string handling, and also eased the adoption of the increasingly popular 7-bit ASCII standard of which DEC were a proponent at the time. Bell concludes this point with the throw away line:”

>
>
> Although string instructions are not yet provided in the hardware, the common string operations (move, compare, concatenate) can be programmed with very short loops.  
>  A sixth weakness, the inability to use read-only memories, was avoided in the PDP-11. Most code written for the PDP-11 tends to be pure and reentrant without special effort by the programmer, allowing a read-only memory (ROM) to be used directly.  
>  A seventh weakness, one common to many minicomputers, was primitive I/O capabilities.  
>  A ninth weakness of minicomputers was the high cost of programming them. Many users program in assembly language, without the comfortable environment of editors, file systems, and debuggers available on bigger systems. The PDP-11 does not seem to have overcome this weakness, although it appears that more complex systems are being built successfully with the PDP-11 than with its predecessors, the PDP-8 and PDP-15.  
>  The problems faced by computer designers can usually be attributed to one of two causes: inexperience or second-systemitis  
>  Before the PDP-11, there was no UNIX. Before the PDP-11, there was no C, this is the computer that C was designed on. If you want to know why the classical C int is 16 bits wide, it’s because of the PDP-11. UNIX bought us ideas such as pipes, everything is a file, and interactive computing.  
>  UNIX, which had arrived at Berkley in 1974 aboard a tape carried by Ken Thompson, would evolve into the west coast flavoured Berkley Systems Distribution. Berkeley UNIX had been ported to the VAX by the start of the 1980’s and was thriving as the counter cultural alternative to DEC’s own VMS operating system. Berkeley UNIX spawned a new generation of hackers who would go on to form companies like Sun micro systems, and languages like Self, which lead directly to the development of Java. UNIX was ported to a bewildering array of computer systems during the 80’s and the fallout from the UNIX wars gave us the various BSD operating systems who continue to this day.
>
>

* The article, and the papers it is summarizing, contain a lot more than we could possibly dig into even if we dedicated the entire show to the topic \*\*\*

News Roundup
----------

### [Two-factor authentication SSH with Duo in FreeBSD 11](https://www.teachnix.com/2017/11/29/configuring-two-factor-authentication-on-freebsd-with-duo/) ###

>
>
> This setup uses an SSH key as the first factor of authentication. Please watch Part 1 on setting up SSH keys and how to scp it to your server.
>
>

* [Video guide](https://www.youtube.com/watch?v=E5EuvF-iaV0)

* Register for a free account at Duo.com

* Install the Duo package on your FreeBSD server

`pkg install -y duo`

* Log into the Duo site \> Applications \> Protect an Application \> Search for Unix application \> Protect this Application This will generate the keys we need to configure Duo.
* Edit the Duo config file using the course notes template

`vi /usr/local/etc/pam_duo.conf`

* Example config

```
[duo]
; Duo integration key
ikey = Integration key goes here
; Duo secret key
skey = Secret key goes here
; Duo API host
host = API hostname goes here

```

* Change the permissions of the Duo config file. If the permissions are not correct then the service will not function properly.

`chmod 600 /usr/local/etc/pam_duo.conf`

* Edit the SSHD config file using the course notes template

`vi /etc/ssh/sshd_config`

* Example config

```
ListenAddress 0.0.0.0
Port 22
PasswordAuthentication no
UsePAM yes
ChallengeResponseAuthentication yes
UseDNS no
PermitRootLogin yes
AuthenticationMethods publickey,keyboard-interactive

```

* Edit PAM to configure SSHD for Duo using the course notes template
* Example config

```
&#35; auth
auth            sufficient      pam_opie.so             no_warn no_fake_prompts
auth            requisite       pam_opieaccess.so       no_warn allow_local
auth            required        /usr/local/lib/security/pam_duo.so

&#35; session
&#35; session        optional        pam_ssh.so              want_agent
session         required        pam_permit.so

&#35; password
&#35; password       sufficient      pam_krb5.so             no_warn try_first_pass
password        required        pam_unix.so             no_warn try_first_pass

```

* Restart the sshd service

`service sshd restart`

* SSH into your FreeBSD server and follow the link it outputs to enroll your phone with Duo.

`ssh server.example.com`

* SSH into your server again

`ssh server.example.com`

* Choose your preferred method and it should log you into your server.

---

### [FreeBSD 2017 Release Engineering Recap](https://www.freebsdfoundation.org/blog/2017-release-engineering-recap/) ###

>
>
> This past year was undoubtedly a rather busy and successful year for the Release Engineering Team. Throughout the year, development snapshot builds for FreeBSD-CURRENT and supported FreeBSD-STABLE branches were continually provided. In addition, work to package the base system using pkg(8) continued throughout the year and remains ongoing.  
>  The FreeBSD Release Engineering Team worked on the FreeBSD 11.1-RELEASE, with the code slush starting mid-May. The FreeBSD 11.1-RELEASE cycle stayed on schedule, with the final release build starting July 21, and the final release announcement following on July 25, building upon the stability and reliability of 11.0-RELEASE.  
>  Milestones during the 11.1-RELEASE cycle can be found on the [11.1 schedule page](https://www.freebsd.org/releases/11.1R/schedule.html). The final announcement is available [here](https://www.freebsd.org/releases/11.1R/announce.html).  
>  The FreeBSD Release Engineering Team started the FreeBSD 10.4-RELEASE cycle, led by Marius Strobl. The FreeBSD 10.4-RELEASE cycle continued on schedule, with the only adjustments to the schedule being the addition of BETA4 and the removal of RC3. FreeBSD 10.4-RELEASE builds upon the stability and reliability of FreeBSD 10.3-RELEASE, and is planned to be the final release from the stable/10 branch.  
>  Milestones during the 10.4-RELEASE cycle can be found on the [10.4 schedule page](https://www.freebsd.org/releases/10.4R/schedule.html). The final announcement is available [here](https://www.freebsd.org/releases/10.4R/announce.html).  
>  In addition to these releases, support for additional arm single-board computer images were added, notably Raspberry Pi 3 and Pine64. Additionally, release-related documentation effective 12.0-RELEASE and later has been moved from the base system repository to the documentation repository, making it possible to update related documentation as necessary post-release.  
>  Additionally, the FreeBSD Release Engineering article in the Project Handbook had been rewritten to outline current practices used by the Release Engineering Team. For more information on the procedures and processes the FreeBSD Release Engineering Team follows, the new article is available here and continually updated as procedures change.  
>  Finally, following the availability of FreeBSD 11.1-RELEASE, Glen Barber attended the September Developer Summit hosted at vBSDCon in Reston, VA, USA, where he gave a brief talk comprising of several points relating directly to the 11.1-RELEASE cycle. In particular, some of the points covered included what he felt went well during the release cycle, what did not go as well as it could have, and what we, as a Project, could do better to improve the release process. The slides from the talk are available in the FreeBSD Wiki.  
>  During the question and answer time following the talk, some questions asked included:
>
>

* Q: Should developers use the ‘Relnotes’ tag in the Subversion commit template more loosely, at risk of an increase in false positives.

>
>
> A: When asked when the tag in the template was initially added, the answer would have been “no”, however in hindsight it is easier to sift through the false positives, than to comb through months or years of commit logs.
>
>

* Q: What issues are present preventing moving release-related documentation to the documentation repository?

>
>
> A: There were some rendering issues last time it was investigated, but it is really nothing more than taking the time to fix those issues. (Note, that since this talk, the migration of the documentation in question had moved.)
>
>

* Q: Does it make sense to extend the timeframe between milestone builds during a release cycle from one week to two weeks, to allow more time for testing, for example, RC1 versus RC2?

>
>
> A: No. It would extend the length of the release cycle with no real benefit between milestones since as we draw nearer to the end of a given release cycle, the number of changes to that code base significantly reduce.
>
>

---

### [FLIMP - GIMP Exploit on FreeBSD](https://flimp.fuzzing-project.org) ###

>
>
> In 2014, when starting the [Fuzzing Project](https://fuzzing-project.org/), Hanno Böck did some primitive fuzzing on GIMP and reported two bugs. They weren't fixed and were forgotten in the public bug tracker.  
>  Recently Tobias Stöckmann found [one of these bugs](https://bugzilla.gnome.org/show_bug.cgi?id=739133) (CVE-2017-17785) and figured out that it's easy to exploit.
>
>

* What kind of bug is that?

>
>
> It's a classic heap buffer overflow in the FLIC parser. FLIC is a file format for animations and was introduced by Autodesk Animator.
>
>

* How does the exploit work?

>
>
> Tobias has created a [detailed writeup](https://flimp.fuzzing-project.org/exploit.html).
>
>

* The exploit doesn't work for me!

>
>
> We figured out it's unreliable and the memory addresses are depending on many circumstances. The exploit ZIP comes with two variations using different memory addresses.  
>  Try both of them. We also noticed putting the files in a subdirectory sometimes made the exploit work.
>
>

* Anything more to tell about the GIMP?

>
>
> There's a wide variety of graphics formats. GIMP tries to support many of them, including many legacy formats that nobody is using any more today.  
>  While this has obvious advantages - you can access the old images you may find on a backup CD from 1995 - it comes with risks. Support for many obscure file formats means many parsers that hardly anyone ever looks at.
>
>

* So... what about the other parsers?

>
>
> The [second bug](https://bugzilla.gnome.org/show_bug.cgi?id=739134) (CVE-2017-17786), which is a simple overread, was in the TGA parser. Furthermore we found buffer overreads in the [XCF parser](https://bugzilla.gnome.org/show_bug.cgi?id=790783) (CVE-2017-17788), the [Gimp Brush (GBR) parser](https://bugzilla.gnome.org/show_bug.cgi?id=790784) (CVE-2017-17784) and the [Paint Shop Pro (PSP) parser](https://bugzilla.gnome.org/show_bug.cgi?id=790849) (CVE-2017-17789).  
>  We found another [Heap buffer overflow](https://bugzilla.gnome.org/show_bug.cgi?id=790849) in the Paint Shop Pro parser (CVE-2017-17787) which is probably also exploitable.  
>  In other words: The GIMP import parsers are full of memory safety bugs.
>
>

* What should happen?

>
>
> First of all obviously all known memory safety bugs should be fixed.  
>  Furthermore we believe the way GIMP plugins work is not ideal for security testing. The plug-ins are separate executables, however they can't be executed on their own, as they communicate with the main GIMP process.  
>  Ideally either these plug-ins should be changed in a way that allows running them directly from the command line or - even better - they should be turned into libraries. The latter would also have the advantage of making the parser code useable for other software projects.  
>  Finally it might be a good idea to sandbox the import parsers.
>
>
> ---
>

### [Dell FS12-NV7 Review – Bargain FreeBSD/ZFS box](http://blog.frankleonhardt.com/2017/dell-fs12-nv7-review-bargain-freebsdzfs-box/) ###

>
>
> It seems just about everyone selling refurbished data centre kit has a load of Dell FS12-NV7’s to flog. Dell FS-what? You won’t find them in the Dell catalogue, that’s for sure. They look a bit like C2100s of some vintage, and they have a lot in common. But on closer inspection they’re obviously a “special” for an important customer. Given the number of them knocking around, it’s obviously a customer with big data, centres stuffed full of servers with a lot of processing to do. Here’s a hint: It’s not Google or Amazon.  
>  So, should you be buying a weirdo box with no documentation whatsoever? I’d say yes, definitely. If you’re interests are anything like mine. In a 2U box you can get twin 4-core CPUs and 64Gb of RAM for £150 or less. What’s not to like? Ah yes, the complete lack of documentation.  
>  Over the next few weeks I intend to cover that. And to start off this is my first PC review for nearly twenty years.  
>  As I mentioned, it’s a 2U full length heavy metal box on rails. On the back there are the usual I/O ports: a 9-way RS-232, VGA, two 1Gb Ethernet, two USB2 and a PS/2 keyboard and mouse. The front is taken up by twelve 3.5″ hard drive bays, with the status lights and power button on one of the mounting ears to make room. Unlike other Dell servers, all the connections are on the back, only.  
>  So, in summary, you’re getting a lot for your money if its the kind of thing you want. It’s ideal as a high-performance Unix box with plenty of drive bays (preferably running BSD and ZFS). In this configuration it really shifts. Major bang-per-buck. Another idea I’ve had is using it for a flight simulator. That’s a lot of RAM and processors for the money. If you forego the SAS controllers in the PCIe slots and dump in a decent graphics card and sound board, it’s hard to see what’s could be better (and you get jet engine sound effects without a speaker).  
>  So who should buy one of these? BSD geeks is the obvious answer. With a bit of tweaking they’re a dream. It can build-absolutely-everything in 20-30 minutes. For storage you can put fast SAS drives in and it goes like the wind, even at 3Gb bandwidth per drive. I don’t know if it works with FreeNAS but I can’t see why not – I’m using mostly FreeBSD 11.1 and the generic kernel is fine. And if you want to run a load of weird operating systems (like Windows XP) in VM format, it seems to work very well with the Xen hypervisor and Dom0 under FreeBSD. Or CentOS if you prefer.  
>  So I shall end this review in true PCW style:
>
>

* Pros:
  * Cheap
  * Lots of CPUs,
  * Lots of RAM
  * Lots of HD slots
  * Great for BSD/ZFS or VMs

* Cons:
  * Noisy
  * no AES-NI
  * SAS needs upgrading
  * Limited PCI slots

>
>
> As I’ve mentioned, the noise and SAS are easy and relatively cheap to fix, and thanks to BitCoin miners, even the PCI slot problem can be sorted. I’ll talk about this in a later post.
>
>

---

Beastie Bits
----------

* [Reflections on Hackathons](https://undeadly.org/cgi?action=article;sid=20171126090055)
* [7-Part Video Crash Course on SaltStack For FreeBSD](https://www.youtube.com/watch?v=HijG0hWebZk&list=PL5yV8umka8YQOr1wm719In5LITdGzQMOF)
* [The LLVM Thread Sanitizer has been ported to NetBSD](https://blog.netbsd.org/tnf/entry/the_llvm_thread_sanitizer_has)
* [The First Unix Port (1998)](http://bitsavers.informatik.uni-stuttgart.de/bits/Interdata/32bit/unix/univWollongong_v6/miller.pdf)
* [arm64 platform now officially supported [and has syspatch(8)]](https://undeadly.org/cgi?action=article;sid=20171208082238)
* [BSDCan 2018 Call for Participation](https://www.freebsdfoundation.org/news-and-events/call-for-papers/bsdcan-2018-call-for-participation/)
* [AsiaBSDCon 2018 Call for Papers](https://www.freebsdfoundation.org/news-and-events/call-for-papers/asiabsdcon-2018-call-for-papers/) \*\*\*

Feedback/Questions
----------

* Shawn - [DragonFlyBSD vagrant images](http://dpaste.com/3PRPJHG#wrap)
* Ben - [undermydesk](http://dpaste.com/0AZ32ZB#wrap)
* Ken - [Conferences](http://dpaste.com/3E8FQC6#wrap)
* Ben - [ssh keys](http://dpaste.com/0E4538Q#wrap)
  * [SSH Chaining](https://www.bsdnow.tv/tutorials/ssh-chaining) \*\*\*