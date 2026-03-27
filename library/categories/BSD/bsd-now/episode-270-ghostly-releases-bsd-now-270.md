+++
title = "Episode 270: Ghostly Releases | BSD Now 270"
description = 'OpenBSD 6.4 released, GhostBSD RC2 released, MeetBSD - the ultimate hallway track, DragonflyBSD desktop on a Thinkpad, Porting keybase to NetBSD, OpenSSH 7.9, and draft-ietf-6man-ipv6only-flag in FreeBSD.\Headlines   \OpenBSD 6.4 released* '
date = "2018-11-01T11:00:00Z"
url = "https://www.bsdnow.tv/270"
author = "feedback@bsdnow.tv (JT Pennington)"
text = ""
lastupdated = "2026-03-26T14:37:50.694730613Z"
seen = false
+++

OpenBSD 6.4 released, GhostBSD RC2 released, MeetBSD - the ultimate hallway track, DragonflyBSD desktop on a Thinkpad, Porting keybase to NetBSD, OpenSSH 7.9, and draft-ietf-6man-ipv6only-flag in FreeBSD.

\##Headlines  
 \###[OpenBSD 6.4 released](https://www.openbsd.org/64.html)

* [See a detailed log of changes between the 6.3 and 6.4 releases.](https://www.openbsd.org/plus64.html)
* [See the information on the FTP page for a list of mirror machines.](https://www.openbsd.org/ftp.html)
* [Have a look at the 6.4 errata page for a list of bugs and workarounds.](https://www.openbsd.org/errata64.html)
* signify(1) pubkeys for this release:
* base: RWQq6XmS4eDAcQW4KsT5Ka0KwTQp2JMOP9V/DR4HTVOL5Bc0D7LeuPwA
* fw: RWRoBbjnosJ/39llpve1XaNIrrQND4knG+jSBeIUYU8x4WNkxz6a2K97
* pkg: RWRF5TTY+LoN/51QD5kM2hKDtMTzycQBBPmPYhyQEb1+4pff/H6fh/kA

---

\###[GhostBSD 18.10 RC2 Announced](https://www.ghostbsd.org/18.10_RC2_release_announcement)

>
>
> This second release candidate of GhostBSD 18.10 is the second official release of GhostBSD with TrueOS under the hood. The official desktop of GhostBSD is MATE. However, in the future, there might be an XFCE community release, but for now, there is no community release yet.
>
>

* What has changed since RC1

* Removed drm-stable-kmod and we will let users installed the propper drm-\*-kmod

* Douglas Joachin added libva-intel-driver libva-vdpau-driver to supports accelerated some video driver for Intel

* Issues that got fixed

* Bug #70 Cannot run Octopi, missing libgksu error.

* Bug #71 LibreOffice doesn’t start because of missing libcurl.so.4

* Bug #72 libarchive is a missing dependency

>
>
> Again thanks to iXsystems, TrueOS, Joe Maloney, Kris Moore, Ken Moore, Martin Wilke, Neville Goddard, Vester “Vic” Thacker, Douglas Joachim, Alex Lyakhov, Yetkin Degirmenci and many more who helped to make the transition from FreeBSD to TrueOS smoother.
>
>

* Updating from RC1 to RC2:

* sudo pkg update -f

* sudo pkg install -f libarchive curl libgksu

* sudo pkg upgrade

* Where to download:

* All images checksum, hybrid ISO(DVD, USB) and torrent are available here: [https://www.ghostbsd.org/download](https://www.ghostbsd.org/download)

* [ScreenShots]

* [https://www.ghostbsd.org/sites/default/files/Screenshot\_at\_2018-10-20\_13-22-41.png](https://www.ghostbsd.org/sites/default/files/Screenshot_at_2018-10-20_13-22-41.png)

* [https://www.ghostbsd.org/sites/default/files/Screenshot\_at\_2018-10-20\_13-27-26.png](https://www.ghostbsd.org/sites/default/files/Screenshot_at_2018-10-20_13-27-26.png)

---

\###[OpenSSH 7.9 has been released and it has support for OpenSSL 1.1](https://www.openssh.com/txt/release-7.9)

```
Changes since OpenSSH 7.8
=========================

This is primarily a bugfix release.

New Features
------------
 * ssh(1), sshd(8): allow most port numbers to be specified using
   service names from getservbyname(3) (typically /etc/services).
 * ssh(1): allow the IdentityAgent configuration directive to accept
   environment variable names. This supports the use of multiple
   agent sockets without needing to use fixed paths.
 * sshd(8): support signalling sessions via the SSH protocol.
   A limited subset of signals is supported and only for login or
   command sessions (i.e. not subsystems) that were not subject to
   a forced command via authorized_keys or sshd_config. bz#1424
 * ssh(1): support "ssh -Q sig" to list supported signature options.
   Also "ssh -Q help" to show the full set of supported queries.
 * ssh(1), sshd(8): add a CASignatureAlgorithms option for the
   client and server configs to allow control over which signature
   formats are allowed for CAs to sign certificates. For example,
   this allows banning CAs that sign certificates using the RSA-SHA1
   signature algorithm.
 * sshd(8), ssh-keygen(1): allow key revocation lists (KRLs) to
   revoke keys specified by SHA256 hash.
 * ssh-keygen(1): allow creation of key revocation lists directly
   from base64-encoded SHA256 fingerprints. This supports revoking
   keys using only the information contained in sshd(8)
   authentication log messages.

Bugfixes
--------

 * ssh(1), ssh-keygen(1): avoid spurious "invalid format" errors when
   attempting to load PEM private keys while using an incorrect
   passphrase. bz#2901
 * sshd(8): when a channel closed message is received from a client,
   close the stderr file descriptor at the same time stdout is
   closed. This avoids stuck processes if they were waiting for
   stderr to close and were insensitive to stdin/out closing. bz#2863
 * ssh(1): allow ForwardX11Timeout=0 to disable the untrusted X11
   forwarding timeout and support X11 forwarding indefinitely.
   Previously the behaviour of ForwardX11Timeout=0 was undefined.
 * sshd(8): when compiled with GSSAPI support, cache supported method
   OIDs regardless of whether GSSAPI authentication is enabled in the
   main section of sshd_config. This avoids sandbox violations if
   GSSAPI authentication was later enabled in a Match block. bz#2107
 * sshd(8): do not fail closed when configured with a text key
   revocation list that contains a too-short key. bz#2897
 * ssh(1): treat connections with ProxyJump specified the same as
   ones with a ProxyCommand set with regards to hostname
   canonicalisation (i.e. don't try to canonicalise the hostname
   unless CanonicalizeHostname is set to 'always'). bz#2896
 * ssh(1): fix regression in OpenSSH 7.8 that could prevent public-
   key authentication using certificates hosted in a ssh-agent(1)
   or against sshd(8) from OpenSSH <7.8.

Portability
-----------

 * All: support building against the openssl-1.1 API (releases 1.1.0g
   and later). The openssl-1.0 API will remain supported at least
   until OpenSSL terminates security patch support for that API version.
 * sshd(8): allow the futex(2) syscall in the Linux seccomp sandbox;
   apparently required by some glibc/OpenSSL combinations.
 * sshd(8): handle getgrouplist(3) returning more than
   _SC_NGROUPS_MAX groups. Some platforms consider this limit more
   as a guideline.

```

---

\##News Roundup

\###[MeetBSD 2018: The Ultimate Hallway Track](https://www.ixsystems.com/blog/meetbsd-2018/)

>
>
> Founded in Poland in 2007 and first hosted in California in 2008, MeetBSD combines formal talks with UnConference activities to provide a level of interactivity not found at any other BSD conference. The character of each MeetBSD is determined largely by its venue, ranging from Hacker Dojo in 2010 to Intel’s Santa Clara headquarters this year. The Intel SC12 building provided a beautiful auditorium and sponsors’ room, plus a cafeteria for the Friday night social event and the Saturday night FreeBSD 25th Anniversary Celebration. The formal nature of the auditorium motivated the formation of MeetBSD’s first independent Program Committee and public Call for Participation. Together these resulted in a backbone of talks presented by speakers from the USA, Canada, and Poland, combined with UnConference activities tailored to the space.
>
>

* MeetBSD Day 0

>
>
> Day Zero of MeetBSD was a FreeBSD Developer/Vendor Summit hosted in the same auditorium where the talks would take place. Like the conference itself, this event featured a mix of scheduled talks and interactive sessions. The scheduled talks were LWPMFS: LightWeight Persistent Memory Filesystem by Ravi Pokala, Evaluating GIT for FreeBSD by Ed Maste, and NUMA by Mark Johnston. Ed’s overview of the advantages and disadvantages of using Git for FreeBSD development was of the most interest to users and developers, and the discussion continued into the following two days.
>
>

* MeetBSD Day 1

>
>
> The first official day of MeetBSD 2018 was kicked off with introductions led by emcee JT Pennington and a keynote, “Using TrueOS to boot-strap your FreeBSD-based project” by Kris Moore. Kris described a new JSON-based release infrastructure that he has exercised with FreeBSD, TrueOS, and FreeNAS. Kris’ talk was followed by “Intel & FreeBSD: Better Together” by Ben Widawsky, the FreeBSD program lead at Intel, who gave an overview of Intel’s past and current efforts supporting FreeBSD. Next came lunch, followed by Kamil Rytarowski’s “Bug detecting software in the NetBSD userland: MKSANITIZER”. This was followed by 5-Minute Lightning Talks, Andrew Fengler’s “FreeBSD: What to (Not) Monitor”, and an OpenZFS Panel Discussion featuring OpenZFS experts Michael W. Lucas, Allan Jude, Alexander Motin, Pawel Dawidek, and Dan Langille. Day one concluded with a social event at the Intel cafeteria where the discussions continued into the night.
>
>

* MeetBSD Day 2

>
>
> Day Two of MeetBSD 2018 kicked off with a keynote by Michael W. Lucas entitled “Why BSD?”, where Michael detailed what makes the BSD community different and why it attracts us all. This was followed by Dr. Kirk McKusick’s “The Early Days of BSD” talk, which was followed by “DTrace/dwatch in Production” by Devin Teske. After lunch, we enjoyed “A Curmudgeon’s Language Selection Criteria: Why I Don’t Write Everything in Go, Rust, Elixir, etc” by G. Clifford Williams and, “Best practices of sandboxing applications with Capsicum” by Mariusz Zaborski. I then hosted a Virtualization Panel Discussion that featured eight developers from FreeBSD, OpenBSD, and NetBSD. We then split up for Breakout Sessions and the one on Bloomberg’s controversial article on backdoored Supermicro systems was fascinating given the experts present, all of whom were skeptical of the feasibility of the attack. The day wrapped up with a final talk, “Tales of a Daemontown Performance Peddler: Why ‘it depends’ and what you can do about it” by Nick Principe, followed by the FreeBSD 25th Anniversary Celebration.
>
>

* Putting the “meet” in MeetBSD

>
>
> I confess the other organizers and I were nervous about how well one large auditorium would suit a BSD event but the flexible personal space it gave everyone allowed for countless meetings and heated hacking that often brought about immediate results. I watched people take ideas through several iterations with the help and input of obvious and unexpected experts, all of whom were within reach. Not having to pick up and leave for a talk in another room organically resulted in essentially a series of mini hackathons that none of us anticipated but were delighted to witness, taking the “hallway track” to a whole new level. The mix of formal and UnConference activities at MeetBSD is certain to evolve. Thank you to everyone who participated with questions, Lightning Talks, and Panel participation. A huge thanks to our sponsors, including Intel for both hosting and sponsoring MeetBSD California 2018, Western Digital, Supermicro, Verisign, Jupiter Broadcasting, the FreeBSD Foundation, Bank of America Merrill Lynch, the NetBSD Foundation, and the team at iXsystems.
>
>

>
>
> See you at MeetBSD 2020!
>
>

---

\###[Setup DragonflyBSD with a desktop on real hardware ThinkPad T410](https://panoramacircle.com/2018/10/07/setup-dragonflybsd-with-a-desktop-on-real-hardware-thinkpad-t410/)  
 \+[Video Demo](https://youtu.be/p4KwssNY82Q)

>
>
> Linux has become too mainstream and standard BSD is a common thing now? How about DragonflyBSD which was created as a fork of FreeBSD 4.8 in conflict over system internals. This tutorial will show how to install it and set up a user-oriented desktop. It should work with DragonflyBSD, FreeBSD and probably all BSDs.  
>  Some background: BSD was is ultimately derived from UNIX back in the days. It is not Linux even though it is similar in many ways because Linux was designed to follow UNIX principles. Seeing is believing, so check out the video of the install!  
>  I did try two BSD distros before called GhostBSD and TrueOS and you can check out my short reviews. DragonflyBSD comes like FreeBSD bare bones and requires some work to get a desktop running.
>
>

* Download image file and burn to USB drive or DVD

* First installation

* Setting up the system and installing a desktop

* Inside the desktop

* Install some more programs

* How to enable sound?

* Let’s play some free games

* Setup WiFi

* Power mode settings

* More to do?

>
>
> You can check out this blog post if you want a much more detailed tutorial. If you don’t mind standard BSD, get the GhostBSD distro instead which comes with a ready-made desktop xcfe or mate and many functional presets.
>
>

* A small summary of what we got on the upside:

  * Free and open source operating system with a long history
  * Drivers worked fine including Ethernet, WiFi, video 2D & 3D, audio, etc
  * Hammer2 advanced file system
  * You are very unique if you use this OS fork

* Some downsides:

* Less driver and direct app support than Linux

* Installer and desktop have some traps and quirks and require work

---

\###[Porting Keybase to NetBSD](https://dressupgeekout.blogspot.com/2018/10/porting-keybase-to-netbsd.html)

>
>
> Keybase significantly simplifies the whole keypair/PGP thing and makes what is usually a confusing, difficult experience actually rather pleasant. At its heart is an open-source command line utility that does all of the heavy cryptographic lifting. But it’s also hooked up to the network of all other Keybase users, so you don’t have to work very hard to maintain big keychains. Pretty cool!  
>  So, this evening, I tried to get it to all work on NetBSD.  
>  The Keybase client code base is, in my opinion, not very well architected… there exist many different Keybase clients (command line apps, desktop apps, mobile apps) and for some reason the code for all of them are seemingly in this single repository, without even using Git submodules. Not sure what that’s about.  
>  Anyway, “go build”-ing the command line program (it’s written in Go) failed immediately because there’s some platform-specific code that just does not seem to recognize that NetBSD exists (but they do for FreeBSD and OpenBSD). Looks like the Keybase developers maintain a Golang wrapper around struct proc, which of course is different from OS to OS. So I literally just copypasted the OpenBSD wrapper, renamed it to “NetBSD”, and the build basically succeeded from there! This is of course super janky and untrustworthy, but it seems to Mostly Just Work…  
>  I forked the GitHub repo, you can see the diff on top of keybase 2.7.3 here: bccaaf3096a  
>  Eventually I ended up with a \~/go/bin/keybase which launches just fine. Meaning, I can main() okay. But the moment you try to do anything interesting, it looks super scary:
>
>

```
charlotte@sakuracity:~/go/bin ./keybase login
▶ WARNING Running in devel mode
▶ INFO Forking background server with pid=12932
▶ ERROR unexpected error in Login: API network error: doRetry failed,
attempts: 1, timeout 5s, last err: Get
http://localhost:3000/_/api/1.0/merkle/path.json?last=3784314&load_deleted=1&load_reset_chain=1&poll=10&sig_hints_low=3&uid=38ae1dfa49cd6831ea2fdade5c5d0519:
dial tcp [::1]:3000: connect: connection refused

```

>
>
> There’s a few things about this error message that stuck out to me:
>
>

* Forking a background server? What?
* It’s trying to connect to localhost? That must be the server that doesn’t work …

>
>
> Unfortunately, this nonfunctional “background server” sticks around even when a command as simple as ‘login’ command just failed:
>
>

```
charlotte@sakuracity:~/go/bin ps 12932
  PID TTY STAT    TIME COMMAND
  12932 ?   Ssl  0:00.21 ./keybase --debug --log-file
  /home/charlotte/.cache/keybase.devel/keybase.service.log service --chdir
  /home/charlotte/.config/keybase.devel --auto-forked

```

>
>
> I’m not exactly sure what the intended purpose of the “background server” even is, but fortunately we can kill it and even tell the keybase command to not even spawn one:
>
>

```
charlotte@sakuracity:~/go/bin ./keybase help advanced | grep -- --standalone
   --standalone                         Use the client without any daemon support.

```

>
>
> And then we can fix wanting to connect to localhost by specifying an expected Keybase API server – how about the one hosted at [https://keybase.io](https://keybase.io)?
>
>

```
charlotte@sakuracity:~/go/bin ./keybase help advanced | grep -- --server
   --server, -s                         Specify server API.

```

>
>
> Basically, what I’m trying to say is that if you specify both of these options, the keybase command does what I expect on NetBSD:
>
>

```
charlotte@sakuracity:~/go/bin ./keybase --standalone -s https://keybase.io login
▶ WARNING Running in devel mode
Please enter the Keybase passphrase for dressupgeekout (6+ characters):

charlotte@sakuracity:~/go/bin ./keybase --standalone -s https://keybase.io id dressupgeekout
▶ WARNING Running in devel mode
▶ INFO Identifying dressupgeekout
✔ public key fingerprint: 7873 DA50 A786 9A3F 1662 3A17 20BD 8739 E82C 7F2F
✔ "dressupgeekout" on github:
https://gist.github.com/0471c7918d254425835bf5e1b4bcda00 [cached 2018-10-11
20:55:21 PDT]
✔ "dressupgeekout" on reddit:
https://www.reddit.com/r/KeybaseProofs/comments/9ng5qm/my_keybase_proof_redditdressupgeekout/
[cached 2018-10-11 20:55:21 PDT]

```

---

\###[Initial implementation of draft-ietf-6man-ipv6only-flag](https://svnweb.freebsd.org/base?view=revision&revision=339929)

```
This change defines the RA "6" (IPv6-Only) flag which routers
may advertise, kernel logic to check if all routers on a link
have the flag set and accordingly update a per-interface flag.

If all routers agree that it is an IPv6-only link, ether_output_frame(),
based on the interface flag, will filter out all ETHERTYPE_IP/ARP
frames, drop them, and return EAFNOSUPPORT to upper layers.

The change also updates ndp to show the "6" flag, ifconfig to
display the IPV6_ONLY nd6 flag if set, and rtadvd to allow
announcing the flag.

Further changes to tcpdump (contrib code) are availble and will
be upstreamed.

Tested the code (slightly earlier version) with 2 FreeBSD
IPv6 routers, a FreeBSD laptop on ethernet as well as wifi,
and with Win10 and OSX clients (which did not fall over with
the "6" flag set but not understood).

We may also want to (a) implement and RX filter, and (b) over
time enahnce user space to, say, stop dhclient from running
when the interface flag is set.  Also we might want to start
IPv6 before IPv4 in the future.

All the code is hidden under the EXPERIMENTAL option and not
compiled by default as the draft is a work-in-progress and
we cannot rely on the fact that IANA will assign the bits
as requested by the draft and hence they may change.

Dear 6man, you have running code.

Discussed with: Bob Hinden, Brian E Carpenter

```

\##Beastie Bits

* [Running FreeBSD on macOS via xhyve](https://dan.langille.org/2018/10/02/running-freebsd-on-osx-using-xhyve-a-port-of-bhyve/)
* [Auction Winners](https://mwl.io/archives/3841)
* [OpenSSH Principals](https://github.com/vedetta-com/vedetta/blob/master/src/usr/local/share/doc/vedetta/OpenSSH_Principals.md)
* [OpenBSD Foundation gets a second Iridium donation from Handshake](https://undeadly.org/cgi?action=article;sid=20181018160645)
* [NetBSD machines at Open Source Conference 2018 Kagawa](https://mail-index.netbsd.org/netbsd-advocacy/2018/10/10/msg000786.html)
* [Absolute FreeBSD now shipping!](https://mwl.io/archives/3818)
* [NextCloud on OpenBSD](https://h3artbl33d.nl/blog/nextcloud-on-openbsd)
* [FreeBSD 12.0-BETA2 Available](https://www.freebsd.org/news/newsflash.html#event20181027:01)
* [DTrace on Windows ported from FreeBSD](https://twitter.com/gvnn3/status/1049347862541344771)
* [HELBUG fall 2018 meeting scheduled - Thursday the 15th of November](http://dpaste.com/36DFQ1S)
* [35C3 pre-sale has started](https://translate.google.com/translate?hl=de&sl=de&tl=en&u=https://tickets.events.ccc.de/35c3/intro/)
* [Stockholm BSD User Meeting: Tuesday Nov 13, 18:00 - 21:30 ](https://www.meetup.com/BSD-Users-Stockholm/events/254235663/)
* [Polish BSD User Group: Thursday Nov 15, 18:30 - 21:00 ](https://bsd-pl.org/en)

---

\##Feedback/Questions

* Greg - [Interview suggestion for the show](http://dpaste.com/1WA54CC)
* Nelson - [Ghostscript vulnerabilities](http://dpaste.com/21KKF7Q#wrap)
* Allison - [Ports and GCC](http://dpaste.com/3K6D7ST)

---

* Send questions, comments, show ideas/topics, or stories you want mentioned on the show to [feedback@bsdnow.tv](mailto:feedback@bsdnow.tv)

---