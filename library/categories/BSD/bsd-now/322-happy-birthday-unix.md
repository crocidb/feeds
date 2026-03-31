+++
title = "322: Happy Birthday, Unix"
description = "Unix is 50, Hunting down Ken's PDP-7, OpenBSD and OPNSense have new releases, Clarification on what GhostBSD is, sshuttle - VPN over SSH, and more.HeadlinesUnix is 50 In the summer of 1969 computer scientists Ken Thompson "
date = "2019-10-31T11:00:00Z"
url = "https://www.bsdnow.tv/322"
author = "feedback@bsdnow.tv (JT Pennington)"
text = ""
lastupdated = "2026-03-26T14:37:50.591729482Z"
seen = true
+++

Unix is 50, Hunting down Ken's PDP-7, OpenBSD and OPNSense have new releases, Clarification on what GhostBSD is, sshuttle - VPN over SSH, and more.

Headlines
----------

### [Unix is 50](https://www.bell-labs.com/unix50/) ###

>
>
> In the summer of 1969 computer scientists Ken Thompson and Dennis Ritchie created the first implementation of Unix with the goal of designing an elegant and economical operating system for a little-used PDP-7 minicomputer at Bell Labs. That modest project, however, would have a far-reaching legacy. Unix made large-scale networking of diverse computing systems — and the Internet — practical. The Unix team went on to develop the C language, which brought an unprecedented combination of efficiency and expressiveness to programming. Both made computing more "portable". Today, Linux, the most popular descendent of Unix, powers the vast majority of servers, and elements of Unix and Linux are found in most mobile devices. Meanwhile C++ remains one of the most widely used programming languages today. Unix may be a half-century old but its influence is only growing.
>
>

---

### [Hunting down Ken's PDP-7: video footage found](https://bsdimp.blogspot.com/2019/10/video-footage-of-first-pdp-7-to-run-unix.html) ###

>
>
> In my prior blog post, I traced Ken's scrounged PDP-7 to SN 34. In this post I'll show that we have actual video footage of that PDP-7 due to an old film from Bell Labs. this gives us almost a minute of footage of the PDP-7 Ken later used to create Unix.
>
>

---

News Roundup
----------

### [OpenBSD 6.6 Released](https://openbsd.org/66.html) ###

* Announce: [https://marc.info/?l=openbsd-tech&m=157132024225971&w=2](https://marc.info/?l=openbsd-tech&m=157132024225971&w=2)
* Upgrade Guide: [https://openbsd.org/faq/upgrade66.html](https://openbsd.org/faq/upgrade66.html)
* Changelog: [https://openbsd.org/plus66.html](https://openbsd.org/plus66.html)

---

### [OPNsense 19.7.5 released](https://opnsense.org/opnsense-19-7-5-released/) ###

>
>
> Hello friends and followers, Lots of plugin and ports updates this time with a few minor improvements in all core areas. Behind the scenes we are starting to migrate the base system to version
>
>

12.1 which is supposed to hit the next 20.1 release. Stay tuned for more infos in the next month or so.

Here are the full patch notes:

* system: show all swap partitions in system information widget
* system: flatten services\_get() in preparation for removal
* system: pin Syslog-ng version to specific package name
* system: fix LDAP/StartTLS with user import page
* system: fix a PHP warning on authentication server page
* system: replace most subprocess.call use
* interfaces: fix devd handling of carp devices (contributed by stumbaumr)
* firewall: improve firewall rules inline toggles
* firewall: only allow TCP flags on TCP protocol
* firewall: simplify help text for direction setting
* firewall: make protocol log summary case insensitive
* reporting: ignore malformed flow records
* captive portal: fix type mismatch for timeout read
* dhcp: add note for static lease limitation with lease registration (contributed by Northguy)
* ipsec: add margintime and rekeyfuzz options
* ipsec: clear $dpdline correctly if not set
* ui: fix tokenizer reorder on multiple saves
* plugins: os-acme-client 1.26[1]
* plugins: os-bind will reload bind on record change (contributed by blablup)
* plugins: os-etpro-telemetry minor subprocess.call replacement
* plugins: os-freeradius 1.9.4[2]
* plugins: os-frr 1.12[3]
* plugins: os-haproxy 2.19[4]
* plugins: os-mailtrail 1.2[5]
* plugins: os-postfix 1.11[6]
* plugins: os-rspamd 1.8[7]
* plugins: os-sunnyvalley LibreSSL support (contributed by Sunny Valley Networks)
* plugins: os-telegraf 1.7.6[8]
* plugins: os-theme-cicada 1.21 (contributed by Team Rebellion)
* plugins: os-theme-tukan 1.21 (contributed by Team Rebellion)
* plugins: os-tinc minor subprocess.call replacement
* plugins: os-tor 1.8 adds dormant mode disable option (contributed by Fabian Franz)
* plugins: os-virtualbox 1.0 (contributed by andrewhotlab)

---

### [Dealing with the misunderstandings of what is GhostBSD](http://ghostbsd.org/node/194) ###

>
>
> Since the release of 19.09, I have seen a lot of misunderstandings on what is GhostBSD and the future of GhostBSD. GhostBSD is based on TrueOS with FreeBSD 12 STABLE with our twist to it. We are still continuing to use TrueOS for OpenRC, and the new package's system for the base system that is built from ports. GhostBSD is becoming a slow-moving rolling release base on the latest TrueOS with FreeBSD 12 STABLE. When FreeBSD 13 STABLE gets released, GhostBSD will be upgraded to TrueOS with FreeBSD 13 STABLE.
>
>
>
> Our official desktop is MATE, which means that the leading developer of GhostBSD does not officially support XFCE. Community releases are maintained by the community and for the community. GhostBSD project will provide help to build and to host the community release. If anyone wants to have a particular desktop supported, it is up to the community. Sure I will help where I can, answer questions and guide new community members that contribute to community release.
>
>
>
> There is some effort going on for Plasma5 desktop. If anyone is interested in helping with XFCE and Plasma5 or in creating another community release, you are well come to contribute. Also, Contribution to the GhostBSD base system, to ports and new ports, and in house software are welcome. We are mostly active on Telegram [https://t.me/ghostbsd](https://t.me/ghostbsd), but you can also reach us on the forum.
>
>

---

### [SHUTTLE – VPN over SSH | VPN Alternative](https://www.terminalbytes.com/sshuttle-vpn-over-ssh-vpn-alternative/) ###

>
>
> Looking for a lightweight VPN client, but are not ready to spend a monthly recurring amount on a VPN? VPNs can be expensive depending upon the quality of service and amount of privacy you want. A good VPN plan can easily set you back by 10$ a month and even that doesn’t guarantee your privacy. There is no way to be sure whether the VPN is storing your confidential information and traffic logs or not. sshuttle is the answer to your problem it provides VPN over ssh and in this article we’re going to explore this cheap yet powerful alternative to the expensive VPNs. By using open source tools you can control your own privacy.
>
>

* VPN over SSH – sshuttle

>
>
> sshuttle is an awesome program that allows you to create a VPN connection from your local machine to any remote server that you have ssh access on. The tunnel established over the ssh connection can then be used to route all your traffic from client machine through the remote machine including all the dns traffic. In the bare bones sshuttle is just a proxy server which runs on the client machine and forwards all the traffic to a ssh tunnel. Since its open source it holds quite a lot of major advantages over traditional VPN.
>
>

---

### [OpenSSH 8.1 Released](http://www.openssh.com/txt/release-8.1) ###

* Security

  * ssh(1), sshd(8), ssh-add(1), ssh-keygen(1): an exploitable integer overflow bug was found in the private key parsing code for the XMSS key type. This key type is still experimental and support for it is not compiled by default. No user-facing autoconf option exists in portable OpenSSH to enable it. This bug was found by Adam Zabrocki and reported via SecuriTeam's SSD program.
  * ssh(1), sshd(8), ssh-agent(1): add protection for private keys at rest in RAM against speculation and memory side-channel attacks like Spectre, Meltdown and Rambleed. This release encrypts private keys when they are not in use with a symmetric key that is derived from a relatively large "prekey" consisting of random data (currently 16KB).

* This release includes a number of changes that may affect existing configurations:

  * ssh-keygen(1): when acting as a CA and signing certificates with an RSA key, default to using the rsa-sha2-512 signature algorithm. Certificates signed by RSA keys will therefore be incompatible with OpenSSH versions prior to 7.2 unless the default is overridden (using "ssh-keygen -t ssh-rsa -s ...").

* New Features

  * ssh(1): Allow %n to be expanded in ProxyCommand strings
  * ssh(1), sshd(8): Allow prepending a list of algorithms to the default set by starting the list with the '<sup>'</sup> character, E.g. "HostKeyAlgorithms <sup>ssh-ed25519"</sup>
  * ssh-keygen(1): add an experimental lightweight signature and verification ability. Signatures may be made using regular ssh keys held on disk or stored in a ssh-agent and verified against an authorized\_keys-like list of allowed keys. Signatures embed a namespace that prevents confusion and attacks between different usage domains (e.g. files vs email).
  * ssh-keygen(1): print key comment when extracting public key from a private key.
  * ssh-keygen(1): accept the verbose flag when searching for host keys in known hosts (i.e. "ssh-keygen -vF host") to print the matching host's random-art signature too.
  * All: support PKCS8 as an optional format for storage of private keys to disk. The OpenSSH native key format remains the default, but PKCS8 is a superior format to PEM if interoperability with non-OpenSSH software is required, as it may use a less insecure key derivation function than PEM's.

---

Beastie Bits
----------

* [Say goodbye to the 32 CPU limit in NetBSD/aarch64](https://twitter.com/jmcwhatever/status/1185584719183962112)
* [vBSDcon 2019 videos](https://www.youtube.com/channel/UCvcdrOSlYOSzOzLjv_n1_GQ/videos)
* [Browse the web in the terminal - W3M](https://www.youtube.com/watch?v=3Hfda0Tjqsg&feature=youtu.be)
* [NetBSD 9 and GSoC](http://netbsd.org/~kamil/GSoC2019.html#slide1)
* [BSDCan 2019 Videos](https://www.youtube.com/playlist?list=PLeF8ZihVdpFegPoAKppaDSoYmsBvpnSZv)
* [NYC\*BUG Install Fest: Nov 6th 18:45 @ Suspenders](https://www.nycbug.org/index?action=view&id=10673)
* [FreeBSD Miniconf at linux.conf.au 2020 Call for Sessions Now Open](https://www.freebsdfoundation.org/blog/freebsd-miniconf-at-linux-conf-au-2020-call-for-sessions-now-open/)
* [FOSDEM 2020 - BSD Devroom Call for Participation](https://people.freebsd.org/~rodrigo/fosdem20/)
* [University of Cambridge looking for Research Assistants/Associates](https://twitter.com/ed_maste/status/1184865668317007874)

---

Feedback/Questions
----------

* Trenton - [Beeping Thinkpad](http://dpaste.com/0ZEXNM6#wrap)
* Alex - [Per user ZFS Datasets](http://dpaste.com/1K31A65#wrap)
  * [Allan’s old patch from 2015](https://reviews.freebsd.org/D2272)

* Javier - [FBSD 12.0 + ZFS + encryption](http://dpaste.com/1XX4NNA#wrap)

---

* Send questions, comments, show ideas/topics, or stories you want mentioned on the show to [feedback@bsdnow.tv](mailto:feedback@bsdnow.tv)

---
 Your browser does not support the HTML5 video tag.