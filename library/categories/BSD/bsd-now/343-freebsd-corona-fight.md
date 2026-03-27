+++
title = "343: FreeBSD, Corona: Fight!"
description = "Fighting the Coronavirus with FreeBSD, Wireguard VPN Howto in OPNsense, NomadBSD 1.3.1 available, fresh GhostBSD 20.02, New FuryBSD XFCE and KDE images, pf-badhost 0.3 released, and more.Headlines[Fighting the Coronavirus with FreeBSD](https://www.leidinger.net/blog"
date = "2020-03-26T12:00:00Z"
url = "https://www.bsdnow.tv/343"
author = "feedback@bsdnow.tv (JT Pennington)"
text = ""
lastupdated = "2026-03-26T14:37:50.553450852Z"
seen = false
+++

Fighting the Coronavirus with FreeBSD, Wireguard VPN Howto in OPNsense, NomadBSD 1.3.1 available, fresh GhostBSD 20.02, New FuryBSD XFCE and KDE images, pf-badhost 0.3 released, and more.

Headlines
----------

### [Fighting the Coronavirus with FreeBSD](https://www.leidinger.net/blog/2020/03/19/fighting-the-coronavirus-with-freebsd-foldinghome/) ###

>
>
> Here is a quick HOWTO for those who want to provide some FreeBSD based compute resources to help finding vaccines.
>
>
>
> UPDATE 2020-03-22: 0mp@ made a port out of this, it is in “biology/linux-foldingathome”.
>
>
>
> Per default it will now pick up some SARS-CoV‑2 (COVID-19) related folding tasks. There are some more config options (e.g. how much of the system resources are used). Please refer to the official Folding@Home site for more information about that. Be also aware that there is a big rise in compute resources donated to Folding@Home, so the pool of available work units may be empty from time to time, but they are working on adding more work units. Be patient.
>
>

---

### [How to configure the Wireguard VPN in OPNsense](https://homenetworkguy.com/how-to/configure-wireguard-opnsense/) ###

>
>
> WireGuard is a modern designed VPN that uses the latest cryptography for stronger security, is very lightweight, and is relatively easy to set up (mostly). I say ‘mostly’ because I found setting up WireGuard in OPNsense to be more difficult than I anticipated. The basic setup of the WireGuard VPN itself was as easy as the authors claim on their website, but I came across a few gotcha's. The gotcha's occur with functionality that is beyond the scope of the WireGuard protocol so I cannot fault them for that. My greatest struggle was configuring WireGuard to function similarly to my OpenVPN server. I want the ability to connect remotely to my home network from my iPhone or iPad, tunnel all traffic through the VPN, have access to certain devices and services on my network, and have the VPN devices use my home's Internet connection.
>
>
>
> WireGuard behaves more like a SSH server than a typical VPN server. With WireGuard, devices which have shared their cryptographic keys with each other are able to connect via an encrypted tunnel (like a SSH server configured to use keys instead of passwords). The devices that are connecting to one another are referred to as “peer” devices. When the peer device is an OPNsense router with WireGuard installed, for instance, it can be configured to allow access to various resources on your network. It becomes a tunnel into your network similar to OpenVPN (with the appropriate firewall rules enabled). I will refer to the WireGuard installation on OPNsense as the server rather than a “peer” to make it more clear which device I am configuring unless I am describing the user interface because that is the terminology used interchangeably by WireGuard.
>
>
>
> The documentation I found on WireGuard in OPNsense is straightforward and relatively easy to understand, but I had to wrestle with it for a little while to gain a better understanding on how it should be configured. I believe it was partially due to differing end goals – I was trying to achieve something a little different than the authors of other wiki/blog/forum posts. Piecing together various sources of information, I finally ended up with a configuration that met the goals stated above.
>
>

---

News Roundup
----------

### [NomadBSD 1.3.1](https://nomadbsd.org/index.html#1.3.1) ###

>
>
> NomadBSD 1.3.1 has recently been made available. NomadBSD is a lightweight and portable FreeBSD distribution, designed to run on live on a USB flash drive, allowing you to plug, test, and play on different hardware. They have also started a forum as of yesterday, where you can ask questions and mingle with the NomadBSD community. Notable changes in 1.3.1 are base system upgraded to FreeBSD 12.1-p2. automatic network interface setup improved, image size increased to over 4GB, Thunderbird, Zeroconf, and some more listed below.
>
>

---

### [GhostBSD 20.02](https://ghostbsd.org/20.02_release_announcement) ###

>
>
> Eric Turgeon, main developer of GhostBSD, has announced version 20.02 of the FreeBSD based operating system. Notable changes are ZFS partition into the custom partition editor installer, allowing you to install alongside with Windows, Linux, or macOS. Other changes are force upgrade all packages on system upgrade, improved update station, and powerd by default for laptop battery performance.
>
>

---

### [New FuryBSD XFCE and KDE images](https://www.furybsd.org/new-furybsd-12-1-based-images-are-available-for-xfce-and-kde/) ###

>
>
> This new release is now based on FreeBSD 12.1 with the latest FreeBSD quarterly packages. This brings XFCE up to 4.14, and KDE up to 5.17. In addition to updates this new ISO mostly addresses community bugs, community enhancement requests, and community pull requests. Due to the overwhelming amount of reports with GitHub hosting all new releases are now being pushed to SourceForge only for the time being. Previous releases will still be kept for archive purposes.
>
>

---

### [pf-badhost 0.3 Released](https://www.geoghegan.ca/pfbadhost.html) ###

>
>
> pf-badhost is a simple, easy to use badhost blocker that uses the power of the pf firewall to block many of the internet's biggest irritants. Annoyances such as SSH and SMTP bruteforcers are largely eliminated. Shodan scans and bots looking for webservers to abuse are stopped dead in their tracks. When used to filter outbound traffic, pf-badhost blocks many seedy, spooky malware containing and/or compromised webhosts.
>
>

---

Beastie Bits
----------

* [DragonFly i915 drm update](https://www.dragonflydigest.com/2020/03/23/24324.html)
* [CShell is punk rock](http://blog.snailtext.com/posts/cshell-is-punk-rock.html)
* [The most surprising Unix programs](https://minnie.tuhs.org/pipermail/tuhs/2020-March/020664.html)

---

Feedback/Questions
----------

* Master One - [Torn between OpenBSD and FreeBSD](http://dpaste.com/102HKF5#wrap)
* Brad - [Follow up to Linus ZFS story](http://dpaste.com/1VXQA2Y#wrap)
* Filipe Carvalho - [Call for Portuguese BSD User Groups](http://dpaste.com/2H7S8YP)

---

* Send questions, comments, show ideas/topics, or stories you want mentioned on the show to [feedback@bsdnow.tv](mailto:feedback@bsdnow.tv)

---
 Your browser does not support the HTML5 video tag.