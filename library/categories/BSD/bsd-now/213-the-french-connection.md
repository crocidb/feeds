+++
title = "213: The French CONnection"
description = "We recap EuroBSDcon in Paris, tell the story behind a pf PR, and show you how to do screencasting with OpenBSD.This episode was brought to you byiXsystems - Enterprise Servers and Storage for Open Source[![DigitalOcea"
date = "2017-09-27T12:00:00Z"
url = "https://www.bsdnow.tv/213"
author = "feedback@bsdnow.tv (JT Pennington)"
text = ""
lastupdated = "2026-03-26T14:37:50.847798526Z"
seen = false
+++

We recap EuroBSDcon in Paris, tell the story behind a pf PR, and show you how to do screencasting with OpenBSD.

This episode was brought to you by
----------

[![iXsystems - Enterprise Servers and Storage for Open Source](/images/1.png)](http://www.ixsystems.com/bsdnow)[![DigitalOcean - Simple Cloud Hosting, Built for Developers](/images/2.png)](http://www.digitalocean.com/)[![Tarsnap - Online Backups for the Truly Paranoid](/images/3.png)](http://www.tarsnap.com/bsdnow)

---

Headlines
----------

### [Recap of EuroBSDcon 2017 in Paris, France](https://2017.eurobsdcon.org) ###

* EuroBSDcon was held in Paris, France this year, which drew record numbers this year.
* With over 300 attendees, it was the largest BSD event I have ever attended, and I was encouraged by the higher than expected number of first time attendees.
* The FreeBSD Foundation held a board meeting on Wednesday afternoon with the members who were in Paris. Topics included future conferences (including a conference kit we can mail to people who want to represent FreeBSD) and planning for next year.
* The FreeBSD Devsummit started on Thursday at the beautiful Mozilla Office in Paris. After registering and picking up our conference bag, everyone gathered for a morning coffee with lots of handshaking and greeting. We then gathered in the next room which had a podium with microphone, screens as well as tables and chairs. After developers sat down, Benedict opened the devsummit with a small quiz about France for developers to win a [Mogics Power Bagel](https://www.mogics.com/?page_id=3824). 45 developers participated and DES won the item in the end. After introductions and collecting topics of interest from everyone, we started with the Work in Progress (WIP) session.
* The WIP session had different people present a topic they are working on in 7 minute timeslots. Topics ranged from FreeBSD Forwarding Performance, fast booting options, and a GELI patch under review to attach multiple providers. See their [slides on the FreeBSD wiki](https://wiki.freebsd.org/DevSummit/201709).
* After lunch, the FreeBSD Foundation gave a general update on staff and funding, as well as a more focused presentation about our partnership with Intel. People were interested to hear what was done so far and asked a few questions to the Intel representative Glenn Weinberg.
* After lunch, developers worked quietly on their own projects. The mic remained open and occasionally, people would step forward and gave a short talk without slides or motivated a discussion of common interest. The day concluded with a dinner at a nice restaurant in Paris, which allowed to continue the discussions of the day.
* The second day of the devsummit began with a talk about the CAM-based SDIO stack by Ilya Bakulin. His work would allow access to wifi cards/modules on embedded boards like the Raspberry Pi Zero W and similar devices as many of these are using SDIO for data transfers.
* Next up was a discussion and Q&A session with the FreeBSD core team members who were there (missing only Benno Rice, Kris Moore, John Baldwin, and Baptiste Daroussin, the latter being busy with conference preparations). The new FCP (FreeBSD community proposals) were introduced for those who were not at BSDCan this year and the hows and whys about it. Allan and I were asked to describe our experiences as new members of core and we encouraged people to run for core when the next election happens. After a short break, Scott Long gave an overview of the work that’s been started on NUMA (Non-Uniform Memory Architecture), what the goals of the project are and who is working on it.
* Before lunch, Christian Schwarz presented his work on zrepl, a new ZFS replication solution he developed using Go. This sparked interest in developers, [a port was started](https://reviews.freebsd.org/D12462) and people suggested to Christian that he should submit his talk to AsiaBSDcon and BSDCan next year. Benedict had to leave before lunch was done to teach his Ansible tutorial (which was well attended) at the conference venue.
* There were organized dinners, for those two nights, quite a feat of organization to fit over 100 people into a restaurant and serve them quickly.
* On Saturday, there was a social event, a river cruise down the Seine. This took the form of a ‘standing’ dinner, with a wide selection of appetizer type dishes, designed to get people to walk around and converse with many different people, rather than sit at a table with the same 6-8 people. I talked to a much larger group of people than I had managed to at the other dinners.
* I like having both dinner formats.
* We would also like to thank all of the BSDNow viewers who attended the conference and made the point of introducing themselves to us. It was nice to meet you all.
* The recordings of the live video stream from the conference are available immediately, so you can watch the raw versions of the talks now:
* Auditorium
  * [Keynote 1: Software Development in the Age of Heroes](https://youtu.be/4iR8g9-39LM?t=179) by [Thomas Pornin](https://twitter.com/BearSSLnews)
  * [Tuning FreeBSD for routing and firewalling](https://youtu.be/4iR8g9-39LM?t=1660) by [Olivier Cochard-Labbé](https://twitter.com/ocochardlabbe)
  * [My BSD sucks less than yours, Act I](https://youtu.be/4iR8g9-39LM?t=7040) by [Antoine Jacoutot](https://twitter.com/ajacoutot) and [Baptiste Daroussin](https://twitter.com/_bapt_)
  * [My BSD sucks less than yours, Act II](https://youtu.be/4iR8g9-39LM?t=14254) by [Antoine Jacoutot](https://twitter.com/ajacoutot) and [Baptiste Daroussin](https://twitter.com/_bapt_)
  * [Reproducible builds on NetBSD](https://youtu.be/4iR8g9-39LM?t=23351) by Christos Zoulas
  * [Your scheduler is not the problem](https://youtu.be/4iR8g9-39LM?t=26845) by Martin Pieuchot
  * [Keynote 2: A French story on cybercrime](https://youtu.be/4iR8g9-39LM?t=30540) by [Éric Freyssinet](https://twitter.com/ericfreyss)
  * [Case studies of sandboxing base system with Capsicum](https://youtu.be/jqdHYEH_BQY?t=731) by [Mariusz Zaborski](https://twitter.com/oshogbovx)
  * [OpenBSD’s small steps towards DTrace (a tale about DDB and CTF)](https://youtu.be/jqdHYEH_BQY?t=6030) by Jasper Lievisse Adriaanse
  * [The Realities of DTrace on FreeBSD](https://youtu.be/jqdHYEH_BQY?t=13096) by [George Neville-Neil](https://twitter.com/gvnn3)
  * [OpenSMTPD, current state of affairs](https://youtu.be/jqdHYEH_BQY?t=16818) by [Gilles Chehade](https://twitter.com/PoolpOrg)
  * [Hoisting: lessons learned integrating pledge into 500 programs](https://youtu.be/jqdHYEH_BQY?t=21764) by Theo de Raadt
  * [Keynote 3: System Performance Analysis Methodologies](https://youtu.be/jqdHYEH_BQY?t=25463) by [Brendan Gregg](https://twitter.com/brendangregg)
  * [Closing Session](https://youtu.be/jqdHYEH_BQY?t=29355)

* Karnak
  * [“Is it done yet ?” The never ending story of pkg tools](https://youtu.be/1hjzleqGRYk?t=71) by [Marc Espie](https://twitter.com/espie_openbsd)
  * [A Tale of six motherboards, three BSDs and coreboot](https://youtu.be/1hjzleqGRYk?t=7498) by Piotr Kubaj and Katarzyna Kubaj
  * [State of the DragonFly’s graphics stack](https://youtu.be/1hjzleqGRYk?t=11475) by François Tigeot
  * [From NanoBSD to ZFS and Jails – FreeBSD as a Hosting Platform, Revisited](https://youtu.be/1hjzleqGRYk?t=16227) by Patrick M. Hausen
  * [Bacula – nobody ever regretted making a backup](https://youtu.be/1hjzleqGRYk?t=20069) by [Dan Langille](https://twitter.com/DLangille)
  * [Never Lose a Syslog Message](https://youtu.be/qX0BS4P65cQ?t=325) by Alexander Bluhm
  * [Running CloudABI applications on a FreeBSD-based Kubernetes cluster](https://youtu.be/qX0BS4P65cQ?t=5647) by [Ed Schouten](https://twitter.com/EdSchouten)
  * [The OpenBSD web stack](https://youtu.be/qX0BS4P65cQ?t=13255) by [Michael W. Lucas](https://twitter.com/mwlauthor)
  * [The LLDB Debugger on NetBSD](https://youtu.be/qX0BS4P65cQ?t=16835) by Kamil Rytarowski
  * [What’s in store for NetBSD 8.0?](https://youtu.be/qX0BS4P65cQ?t=21583) by Alistair Crooks

* Louxor
  * [A Modern Replacement for BSD spell(1)](https://youtu.be/6Nen6a1Xl7I?t=156) by [Abhinav Upadhyay](https://twitter.com/abhi9u)
  * [Portable Hotplugging: NetBSD’s uvm\_hotplug(9) API development](https://youtu.be/6Nen6a1Xl7I?t=5874) by Cherry G. Mathew
  * [Hardening pkgsrc](https://youtu.be/6Nen6a1Xl7I?t=9343) by [Pierre Pronchery](https://twitter.com/khorben)
  * [Discovering OpenBSD on AWS](https://youtu.be/6Nen6a1Xl7I?t=14874) by [Laurent Bernaille](https://twitter.com/lbernail)
  * [OpenBSD Testing Infrastructure Behind bluhm.genua.de](https://youtu.be/6Nen6a1Xl7I?t=18639) by Jan Klemkow
  * [The school of hard knocks – PT1](https://youtu.be/8wuW8lfsVGc?t=276) by [Sevan Janiyan](https://twitter.com/sevanjaniyan)
  * [7 years of maintaining firefox, and still looking ahead](https://youtu.be/8wuW8lfsVGc?t=5321) by Landry Breuil
  * [Branch VPN solution based on OpenBSD, OSPF, RDomains and Ansible](https://youtu.be/8wuW8lfsVGc?t=12385) by Remi Locherer
  * [Running BSD on AWS](https://youtu.be/8wuW8lfsVGc?t=15983) by Julien Simon and Nicolas David
  * [Getting started with OpenBSD device driver development](https://youtu.be/8wuW8lfsVGc?t=21491) by Stefan Sperling

* A huge thanks to the organizers, program committee, and sponsors of EuroBSDCon. Next year, EuroBSDcon will be in Bucharest, Romania. \*\*\*

### [The story of PR 219251](https://www.sigsegv.be//blog/freebsd/PR219251) ###

* The actual story I wanted Kristof to tell, the pf bug he fixed at the Essen Hackathon earlier this summer.

>
>
> As I threatened to do in my previous post, I'm going to talk about PR 219251 for a bit. The bug report dates from only a few months ago, but the first report (that I can remeber) actually came from Shawn Webb on Twitter, of all places  
>  Despite there being a stacktrace it took quite a while (nearly 6 months in fact) before I figured this one out.  
>  It took Reshad Patuck managing to distill the problem down to a small-ish test script to make real progress on this. His testcase meant that I could get core dumps and experiment. It also provided valuable clues because it could be tweaked to see what elements were required to trigger the panic.  
>  This test script starts a (vnet) jail, adds an epair interface to it, sets up pf in the jail, and then reloads the pf rules on the host. Interestingly the panic does not seem to occur if that last step is not included.
>
>

* Obviously not the desired behaviour, but it seems strange. The instances of pf in the jails are supposed to be separate.

>
>
> We try to fetch a counter value here, but instead we dereference a bad pointer. There's two here, so already we need more information. Inspection of the core dump reveals that the state pointer is valid, and contains sane information. The rule pointer (rule.ptr) points to a sensible location, but the data is mostly 0xdeadc0de. This is the memory allocator being helpful (in debug mode) and writing garbage over freed memory, to make use-after-free bugs like this one easier to find.  
>  In other words: the rule has been free()d while there was still a state pointing to it. Somehow we have a state (describing a connection pf knows about) which points to a rule which no longer exists. The core dump also shows that the problem always occurs with states and rules in the default vnet (i.e. the host pf instance), not one of the pf instances in one of the vnet jails. That matches with the observation that the test script does not trigger the panic unless we also reload the rules on the host.  
>  Great, we know what's wrong, but now we need to work out how we can get into this state. At this point we're going to have to learn something about how rules and states get cleaned up in pf. Don't worry if you had no idea, because before this bug I didn't either.  
>  The states keep a pointer to the rule they match, so when rules are changed (or removed) we can't just delete them. States get cleaned up when connections are closed or they time out. This means we have to keep old rules around until the states that use them expire.  
>  When rules are removed pf\_unlink\_rule() adds then to the V\_pf\_unlinked\_rules list (more on that funny V\_ prefix later). From time to time the pf purge thread will run over all states and mark the rules that are used by a state. Once that's done for all states we know that all rules that are not marked as in-use can be removed (because none of the states use it). That can be a lot of work if we've got a lot of states, so pf\_purge\_thread() breaks that up into smaller chuncks, iterating only part of the state table on every run.  
>  We iterate over all of our virtual pf instances (VNET\_FOREACH()), check if it's active (for FreeBSD-EN-17.08, where we've seen this code before) and then check the expired states with pf\_purge\_expired\_states(). We start at state 'idx' and only process a certain number (determined by the PFTM\_INTERVAL setting) states. The pf\_purge\_expired\_states() function returns a new idx value to tell us how far we got.  
>  So, remember when I mentioned the odd V\_ prefix? Those are per-vnet variables. They work a bit like thread-local variables. Each vnet (virtual network stack) keeps its state separate from the others, and the V\_ variables use a pointer that's changed whenever we change the currently active vnet (say with CURVNET\_SET() or CURVNET\_RESTORE()). That's tracked in the 'curvnet' variable. In other words: there are as many V\_pf\_vnet\_active variables as there are vnets: number of vnet jails plus one (for the host system).  
>  Why is that relevant here? Note that idx is not a per-vnet variable, but we handle multiple pf instances here. We run through all of them in fact. That means that we end up checking the first X states in the first vnet, then check the second X states in the second vnet, the third X states in the third and so on and so on.  
>  That of course means that we think we've run through all of the states in a vnet while we really only checked some of them. So when pf\_purge\_unlinked\_rules() runs it can end up free()ing rules that actually are still in use because pf\_purge\_thread() skipped over the state(s) that actually used the rule. The problem only happened if we reloaded rules in the host, because the active ruleset is never free()d, even if there are no states pointing to the rule.  
>  That explains the panic, and the fix is actually quite straightforward: idx needs to be a per-vnet variable, V\_pf\_purge\_idx, and then the problem is gone. As is often the case, the solution to a fairly hard problem turns out to be really simple.
>
>

* As you might expect, finding the problem takes a lot more work that fixing it
* Thanks to Kristof for writing up this detailed post explaining how the problem was found, and what caused it. \*\*\*

### [vBSDcon 2017: BSD at Work](https://www.ixsystems.com/blog/vbsdcon-2017-dexter/) ###

>
>
> The third biennial vBSDcon hosted by Verisign took place September 7th through 9th with the FreeBSD Developer Summit taking place the first day. vBSDcon and iXsystems’ MeetBSD event have been alternating between the East and West coasts of the U.S.A. and these two events play vital roles in reaching Washington, DC-area and Bay Area/Silicon Valley audiences. Where MeetBSD serves many BSD Vendors, vBSDcon attracts a unique government and security industry demographic that isn’t found anywhere else. Conference time and travel budgets are always limited and bringing these events to their attendees is a much-appreciated service provided by their hosts.  
>  The vBSDcon FreeBSD DevSummit had a strong focus on OpenZFS, the build system and networking with the FreeBSD 12 wish list of features in mind. How to best incorporate the steady flow of new OpenZFS features into FreeBSD such as dataset-level encryption was of particular interest. This feature from a GNU/Linux-based storage vendor is tribute to the growth of the OpenZFS community which is vital in light of the recent “Death of Solaris and ZFS” at Oracle. There has never been more demand for OpenZFS on FreeBSD and the Oracle news further confirms our collective responsibility to meet that demand.  
>  The official conference opened with my talk on “Isolated BSD Build Environments” in which I explained how the bhyve hypervisor can be used to effortlessly tour FreeBSD 5.0-onward and build specific source releases on demand to trace regressions to their offending commit. I was followed by a FreeNAS user who made the good point that FreeNAS is an exemplary “entry vector” into Unix and Enterprise Storage fundamentals, given that many of the vectors our generation had are gone. Where many of us discovered Unix and the Internet via console terminals at school or work, smart phones are only delivering the Internet without the Unix. With some irony, both iOS and Android are Unix-based yet offer few opportunities for their users to learn and leverage their Unix environments.  
>  The next two talks were The History and Future of Core Dumps in FreeBSD by Sam Gwydir and Using pkgsrc for multi-platform deployments in heterogeneous environments by G. Clifford Williams. I strongly recommend that anyone wanting to speak at AsiaBSDCon read Sam’s accompanying paper on core dumps because I consider it the perfect AsiaBSDCon topic and his execution is excellent. Core dumps are one of those things you rarely think about until they are a DROP EVERYTHING! priority. G. Clifford’s talk was about what I consider a near-perfect BSD project: pkgsrc, the portable BSD package manager. I put it up there with OpenSSH and mandoc as projects that have provided significant value to other Open Source operating systems. G. Clifford’s real-world experiences are perfectly inline with vBSDcon’s goal to be more production-oriented than other BSDCons.  
>  Of the other talks, any and all Dtrace talks are always appreciated and George Neville-Neil’s did not disappoint. He based it on his experiences with the Teach BSD project which is bringing FreeBSD-based computer science education to schools around the world. The security-related talks by John-Mark Gurney, Dean Freeman and Michael Shirk also represented vBSDcon’s consideration of the local community and made a convincing point that the BSDs should make concerted efforts to qualify for Common Criteria, FIPS, and other Government security requirements. While some security experts will scoff at these, they are critical to the adoption of BSD-based products by government agencies.  
>  BSD Now hosts Allan Jude and Benedict Reuschling hosted an OpenZFS BoF and Ansible talk respectively and I hosted a bhyve hypervisor BoF. The Hallway Track and food at vBSDcon were excellent and both culminated with an after-dinner dramatic reading of Michael W. Lucas’ latest book that raised money for the FreeBSD Foundation. A great time was had by all and it was wonderful to see everyone!
>
>
> ---
>

News Roundup
----------

### [FreeBSD 10.4-RC2 Available](https://lists.freebsd.org/pipermail/freebsd-stable/2017-September/087848.html) ###

* FreeBSD 10.4 will be released soon, this is the last chance to find bugs before the official release is cut.
* Noteworthy Changes Since 10.4-RC1:
  * Given that the amd64 disc1 image was overflowing, more of the base components installed into the disc1 (live) file systems had to be disabled. Most notably, this removed the compiler toolchain from the disc1 images. All disabled tools are still available with the dvd1 images, though.
  * The aesni(4) driver now no longer shares a single FPU context across multiple sessions in multiple threads, addressing problems seen when employing aesni(4) for ipsec(4).
  * Support for netmap(4) by the ixgbe(4) driver has been brought into line with the netmap(4) API present in stable/10. Also, ixgbe(4) now correctly handles VFs in its netmap(4) support again instead of treating these as PFs.
  * During the creation of amd64 and i386 VM images, etcupdate(8) and mergemaster(8) databases now are bootstrapped, akin to what happens along the extraction of base.txz as part of a new installation via bsdinstall(8). This change allows for both of these tools to work out-of-box on the VM images and avoids errors seen when upgrading these images via freebsd-update(8).

* If you are still on the stable/10 branch, you should test upgrading to 10.4, and make sure there are no problems with your workload
* Additional testing specifically of the features that have changed since 10.4-BETA1 would also be most helpful
* This will be the last release from the stable/10 branch \*\*\*

### [OpenBSD changes of note 628](https://www.tedunangst.com/flak/post/openbsd-changes-of-note-628) ###

>
>
> EuroBSDCon in two weeks. Be sure to attend early and often.
>
>

* Many and various documentation improvements for libcrypto. New man pages, rewrites, expanded bugs sections, and more.
* Only allow upward migration in vmd.

>
>
> There’s a README for the syspatch build system if you want to run your own.
>
>

* Move the kernel relinking code from /etc/rc into a seperate script usable by syspatch. Kernel patches can now be reduced to just the necessary files.
* Make the callers of sogetopt() responsible for allocating memory. Now allocation and free occur in the same place.
* Use waitpid() instead of wait() in most programs to avoid accidentally collecting the wrong child.
* Have cu call isatty() before making assumptions.
* Switch mandoc rendering of mathematical symbols and greek letters from trying to imitate the characters’ graphical shapes, which resulted in unintelligible renderings in many cases, to transliterations conveying the characters’ meanings.
* Update libexpat to 2.2.4. Fix copying partial UTF-8 characters.

>
>
> Sigh, here we go again.
>
>

* Work around bug in F5’s handling of the supported elliptic curves extension. RFC 4492 only defines elliptic\_curves for ClientHello. However, F5 is sending it in ServerHello. We need to skip over it since our TLS extension parsing code is now more strict.
* After a first install, run syspatch -c to check for patches.
* If SMAP is present, clear PSL\_AC on kernel entry and interrupt so that only the code in copy{in,out}\* that need it run with it set. Panic if it’s set on entry to trap() or syscall(). Prompted by Maxime Villard’s NetBSD work. Errata.
* New drivers for arm: rktemp, mvpinctrl, mvmpic, mvneta, mvmdio, mvpxa, rkiic, rkpmic.
* No need to exec rm from within mandoc. We know there’s exactly one file and directory to remove. Similarly with running cmp.
* Revert to Mesa 13.0.6 to hopefully address rendering issues a handful of people have reported with xpdf/fvwm on ivy bridge with modesetting driver.
* Rewrite ALPN extension using CBB/CBS and the new extension framework. Rewrite SRTP extension using CBB/CBS and the new extension framework.
* Revisit 2q queue sizes. Limit the hot queue to 1/20th the cache size up to a max of 4096 pages. Limit the warm and cold queues to half the cache. This allows us to more effectively notice re-interest in buffers instead of losing it in a large hot queue.
* Add glass console support for arm64. Probably not yet for your machine, though.
* Replace heaps of hand-written syscall stubs in ld.so with a simpler framework.
* 65535 is a valid port to listen on.
* When xinit starts an X server that listens only on UNIX socket, prefer DISPLAY=unix:0 rather than DISPLAY=:0. This will prevent applications from ever falling back to TCP if the UNIX socket connection fails (such as when the X server crashes). Reverted.
* Add -z and -Z options to apmd to auto suspend or hibernate when low on battery.
* Remove the original (pre-IETF) chacha20-poly1305 cipher suites.
* Add urng(4) which supports various USB RNG devices. Instead of adding one driver per device, start bundling them into a single driver.
* Remove old deactivated pledge path code. A replacement mechanism is being brewed.
* Fix a bug from the extension parsing rewrite. Always parse ALPN even if no callback has been installed to prevent leaving unprocessed data which leads to a decode error.
* Clarify what is meant by syslog priorities being ordered, since the numbers and priorities are backwards.
* Remove a stray setlocale() from ksh, eliminating a lot of extra statically linked code.
* Unremove some NPN symbols from libssl because ports software thinks they should be there for reasons.
* Fix saved stack location after resume. Somehow clang changed it. Resume works again on i386.
* Improve error messages in vmd and vmctl to be more informative.
* Stop building the miniroot installer for OMAP3 Beagleboards. It hasn’t worked in over a year and nobody noticed.
* Have the callers of sosetopt() free the mbuf for symmetry.
* On octeon, let the kernel use the hardware FPU even if emulation is compiled in. It’s faster.
* Fix support for 486DX CPUs by not calling cpuid. I used to own a 486. Now I don’t.
* Merge some drm fixes from linux.
* Defer probing of floppy drives, eliminating delays during boot.
* Better handling of probes and beacons and timeouts and scans in wifi stack to avoid disconnects.
* Move mutex, condvar, and thread-specific data routes, pthread\_once, and pthread\_exit from libpthread to libc, along with low-level bits to support them. Let’s thread aware (but not actually threaded) code work with just libc.
* New POSIX xlocale implementation. Complete as long as you only use ASCII and UTF-8, as you should.
* Round and round it goes; when 6.2 stops, nobody knows. A peak at the future? \*\*\*

### [Screencasting with OpenBSD](http://eradman.com/posts/screencasting.html) ###

* USB Audio

>
>
> Any USB microphone should appear as a new audio device. Here is the dmesg for my mic by ART:
>
>

`  
 uaudio0 at uhub0 port 2 configuration 1 interface 0 "M-One USB" rev 1.10/0.01 addr 2  
 uaudio0: audio rev 1.00, 8 mixer controls  
 audio1 at uaudio0  
`

>
>
> audioctl can read off all of the specific characterisitcs of this device
>
>

`  
 $ audioctl -f /dev/audio1 | grep record  
 mode=play,record  
 record.rate=48000  
 record.channels=1  
 record.precision=16  
 record.bps=2  
 record.msb=1  
 record.encoding=slinear_le  
 record.pause=0  
 record.active=0  
 record.block_size=1960  
 record.bytes=0  
 record.errors=0  
`

>
>
> Now test the recording from the second audio device using aucat(1)
>
>

`  
 aucat -f rsnd/1 -o file.wav  
`

>
>
> If the device also has a headset audio can be played through the same device.
>
>

`  
 aucat -f rsnd/1 -i file.wav  
`

* Screen Capture using Xvfb

>
>
> The rate at which a framebuffer for your video card is a feature of the hardware and software your using, and it's often very slow. x11vnc will print an estimate of the banwidth for the system your running.
>
>

`  
 x11vnc  
 ...  
 09/05/2012 22:23:45 fb read rate: 7 MB/sec  
`

>
>
> This is about 4fps. We can do much better by using a virtual framebuffer. Here I'm setting up a new screen, setting the background color, starting cwm and an instance of xterm
>
>

`  
 Xvfb :1 -screen 0 720x540x16 &  
 DISPLAY=:1 xsetroot -solid steelblue &  
 DISPLAY=:1 cwm &  
 DISPLAY=:1 xterm +sb -fa Hermit -fs 14 &  
`

>
>
> Much better! Now we're up around 20fps.
>
>

`  
 x11vnc -display :1 &  
 ...  
 11/05/2012 18:04:07 fb read rate: 168 MB/sec  
`

>
>
> Make a connection to this virtual screen using raw encoding to eliminate time wasted on compression.
>
>

`  
 vncviewer localhost -encodings raw  
`

>
>
> A test recording with sound then looks like this
>
>

`  
 ffmpeg -f sndio -i snd/1 -y -f x11grab -r 12 -s 800x600 -i :1.0 -vcodec ffv1 ~/out.avi  
`

>
>
> Note: always stop the recording and playback using q, not Ctrl-C so that audio inputs are shut down properly.
>
>

* Screen Capture using Xephyr

>
>
> Xephyr is perhaps the easiest way to run X with a shadow framebuffer. This solution also avoids reading from the video card's RAM, so it's reasonably fast.
>
>

`  
 Xephyr -ac -br -noreset -screen 800x600 :1 &  
 DISPLAY=:1 xsetroot -solid steelblue &  
 DISPLAY=:1 cwm &  
 DISPLAY=:1 xrdb -load ~/.Xdefaults &  
 DISPLAY=:1 xterm +sb -fa "Hermit" -fs 14 &  
`

>
>
> Capture works in exactally the same way. This command tries to maintain 12fps.
>
>

`  
 ffmpeg -f sndio -i snd/1 -y -f x11grab -r 12 -s 800x600 -i :1.0 -vcodec ffv1 -acodec copy ~/out.avi  
 To capture keyboard and mouse input press Ctrl then Shift. This is very handy for using navigating a window manager in the nested X session.  
`

* Arranging Windows

>
>
> I have sometimes found it helpful to launch applications and arrange them in a specific way. This will open up a web browser listing the current directory and position windows using xdotool
>
>

`  
 DISPLAY=:1 midori "file:///`pwd`" &  
 sleep 2  
 DISPLAY=:1 xdotool search --name "xterm" windowmove 0 0  
 DISPLAY=:1 xdotool search --class "midori" windowmove 400 0  
 DISPLAY=:1 xdotool search --class "midori" windowsize 400 576  
`

>
>
> This will position the window precisely so that it appears to be in a tmux window on the right.
>
>

* Audio/Video Sync

>
>
> If you find that the audio is way out of sync with the video, you can ajust the start using the -ss before the audio input to specify the number of seconds to delay. My final recording command line, that delays the audio by 0.5 seconds, writing 12fps
>
>

`  
 ffmpeg -ss 0.5 -f sndio -i snd/1 -y -f x11grab -r 12 -s 800x600 -i :1.0 -vcodec ffv1 -acodec copy ~/out.avi  
`

* Sharing a Terminal with tmux

>
>
> If you're trying to record a terminal session, tmux is able to share a session. In this way a recording of an X framebuffer can be taken without even using the screen. Start by creating the session.
>
>

`  
 tmux -2 -S /tmp/tmux0  
`

>
>
> Then on the remote side connect on the same socket
>
>

`  
 tmux -2 -S /tmp/tmux0 attach  
`

* Taking Screenshots

>
>
> Grabbing a screenshots on Xvfb server is easily accomplished with ImageMagick's import command
>
>

`  
 DISPLAY=:1 import -window root screenshot.png  
`

* Audio Processing and Video Transcoding

>
>
> The first step is to ensure that the clip begins and ends where you'd like it to. The following will make a copy of the recording starting at time 00:00 and ending at 09:45
>
>

`  
 ffmpeg -i interactive-sql.avi \  
 -vcodec copy -acodec copy  
 -ss 00:00:00 -t 00:09:45  
 interactive-sql-trimmed.avi  
 mv interactive-sql-trimmed.avi interactive-sql.avi  
`

>
>
> Setting the gain correctly is very important with an analog mixer, but if you're using a USB mic there may not be a gain option; simply record using it's built-in settings and then adjust the levels afterwards using a utility such as normalize. First extact the audio as a raw PCM file and then run normalize
>
>

`  
 ffmpeg -i interactive-sql.avi -c:a copy -vn audio.wav  
 normalize audio.wav  
`

>
>
> Next merge the audio back in again
>
>

`  
 ffmpeg -i interactive-sql.avi -i audio.wav \  
 -map 0:0 -map 1:0 -c copy interactive-sql-normalized.avi  
`

>
>
> The final step is to compress the screencast for distribution. Encoding to VP8/Vorbis is easy:
>
>

`  
 ffmpeg -i interactive-sql-normalized.avi -c:v libvpx -b:v 1M  
 -c:a libvorbis -q:a 6 interactive-sql.webm  
`

>
>
> H.264/AAC is tricky. For most video players the color space needs to be set to yuv420p. The -movflags puts the index data at the beginning of the file to enable streaming/partial content requests over HTTP:
>
>

`  
 ffmpeg -y -i interactive-sql-normalized.avi -c:v libx264 \  
 -preset slow -crf 14 -pix_fmt yuv420p -movflags +faststart \  
 -c:a aac -q:a 6 interactive-sql.mp4  
`

---

### [TrueOS @ Ohio Linuxfest ’17!](https://www.trueos.org/blog/trueos-ohio-linuxfest-17/) ###

* Dru Lavigne and Ken Moore are both giving presentations on Saturday the 30th. Sit in and hear about new developments for the Lumina and FreeNAS projects.
* Ken is offering Lumina Rising: Challenging Desktop Orthodoxy at 10:15 am in Franklin A. Hear his thoughts about the ideas propelling desktop environment development and how Lumina, especially Lumina 2, is seeking to offer a new model of desktop architecture. Elements discussed include session security, application dependencies, message handling, and operating system integration.
* Dru is talking about What’s New in FreeNAS 11 at 2:00 pm in Franklin D. She’ll be providing an overview of some of the new features added in FreeNAS 11.0, including:
  * Alert Services
  * Starting specific services at boot time
  * AD Monitoring to ensure the AD service restarts if disconnected
  * A preview of the new user interface
  * support for S3-compatible storage and the bhyve hypervisor

* She’s also giving a sneak peek of FreeNAS 11.1, which has some neat features:
  * A complete rewrite of the Jails/Plugins system as FreeNAS moves from warden to iocage
  * Writing new plugins with just a few lines of code
  * A brand new asynchronous middleware API

* Who’s going? Attending this year are:
  * Dru Lavigne (dlavigne): Dru leads the technical documentation team at iX, and contributes heavily to open source documentation projects like FreeBSD, FreeNAS, and TrueOS.
  * Ken Moore (beanpole134): Ken is the lead developer of Lumina and a core contributor to TrueOS. He also works on a number of other Qt5 projects for iXsystems.
  * J.T. Pennington (q5sys): Some of you may be familiar with his work on BSDNow, but J.T. also contributes to the TrueOS, Lumina, and SysAdm projects, helping out with development and general bug squashing. \*\*\*

Beastie Bits
----------

* [Lumina Development Preview: Theme Engine](https://www.trueos.org/blog/lumina-development-preview-theme-engine/)
* [It's happening! Official retro Thinkpad lappy spotted in the wild](https://www.theregister.co.uk/2017/09/04/retro_thinkpad_spotted_in_the_wild/)
* [LLVM libFuzzer and SafeStack ported to NetBSD](https://blog.netbsd.org/tnf/entry/llvm_libfuzzer_and_safestack_ported)
* [Remaining 2017 FreeBSD Events](https://www.freebsdfoundation.org/news-and-events/event-calendar/2017-openzfs-developer-summit/) \*\*\*

Feedback/Questions
----------

* Andrew - [BSD Teaching Material](http://dpaste.com/0YTT0VP)
* Seth - [Switching to Tarsnap after Crashplan becomes no more](http://dpaste.com/1SK92ZX#wrap)
* Thomas - [Native encryption in ZFS](http://dpaste.com/02KD5FX#wrap)
* Coding Cowboy - [Coding Cowboy - Passwords and clipboards](http://dpaste.com/31K0E40#wrap) \*\*\*