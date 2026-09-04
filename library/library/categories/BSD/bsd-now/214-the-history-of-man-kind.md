+++
title = "214: The history of man, kind"
description = "The costs of open sourcing a project are explored, we discover why PS4 downloads are so slow, delve into the history of UNIX man pages, and more.This episode was brought to you by[iXsystems - Enterprise Servers and Storage for Open Source](http://www.i"
date = "2017-10-04T12:00:00Z"
url = "https://www.bsdnow.tv/214"
author = "feedback@bsdnow.tv (JT Pennington)"
text = ""
lastupdated = "2026-03-26T14:37:50.844369239Z"
seen = true
+++

The costs of open sourcing a project are explored, we discover why PS4 downloads are so slow, delve into the history of UNIX man pages, and more.

This episode was brought to you by
----------

[![iXsystems - Enterprise Servers and Storage for Open Source](/images/1.png)](http://www.ixsystems.com/bsdnow)[![DigitalOcean - Simple Cloud Hosting, Built for Developers](/images/2.png)](http://www.digitalocean.com/)[![Tarsnap - Online Backups for the Truly Paranoid](/images/3.png)](http://www.tarsnap.com/bsdnow)

---

Headlines
----------

### [The Cost Of Open Sourcing Your Project](https://meshedinsights.com/2016/09/20/open-source-unlikely-to-be-abandonware/) ###

>
>
> Accusing a company of dumping their project as open source is probably misplaced  its an expensive business no-one would do frivolously.  
>  If you see an active move to change software licensing or governance, its likely someone is paying for it and thus could justify the expense to an executive.
>
>

* A Little History

>
>
> Some case study cameos may help. From 2004 onwards, Sun Microsystems had a policy of all its software moving to open source. The company migrated almost all products to open source licenses, and had varying degrees of success engaging communities around the various projects, largely related to the outlooks of the product management and Sun developers for the project.  
>  Sun occasionally received requests to make older, retired products open source. For example, Sun acquired a company called Lighthouse Design which created a respected suite of office productivity software for Steve Jobs NeXT platform. Strategy changes meant that software headed for the vault (while Jonathan Schwartz, a founder of Lighthouse, headed for the executive suite). Members of the public asked if Sun would open source some of this software, but these requests were declined because there was no business unit willing to fund the move.  
>  When Sun was later bought by Oracle, a number of those projects that had been made open source were abandoned. Abandoning software doesnt mean leaving it for others; it means simply walking away from wherever you left it. In the case of Suns popular identity middleware products, that meant Oracle let the staff go and tried to migrate customers to other products, while remaining silent in public on the future of the project. But the code was already open source, so the user community was able to pick up the pieces and carry on, with help from Forgerock.  
>  It costs a lot of money to open source a mature piece of commercial software, even if all you are doing is throwing a tarball over the wall. Thats why companies abandoning software they no longer care about so rarely make it open source, and those abandoning open source projects rarely move them to new homes that benefit others.
>
>

* If all you have thought about is the eventual outcome, you may be surprised how expensive it is to get there. Costs include: For throwing a tarball over the wall:
* Legal clearance.

>
>
> Having the right to use the software is not the same as giving everyone in the world an unrestricted right to use it and create derivatives. Checking every line of code to make sure you have the rights necessary to release under an OSI-approved license is a big task requiring high-value employees on the liberation team. That includes both developers and lawyers; neither come cheap.
>
>

* Repackaging.

>
>
> To pass it to others, a self-contained package containing all necessary source code, build scripts and non-public source and tool dependencies has to be created since it is quite unlikely to exist internally. Again, the liberation team will need your best developers.
>
>

* Preserving provenance.

>
>
> Just because you have confidence that you have the rights to the code, that doesnt mean anyone else will. The version control system probably contains much of the information that gives confidence about who wrote which code, so the repackaging needs to also include a way to migrate the commit information.
>
>

* Code cleaning.

>
>
> The file headers will hopefully include origin information but the liberation team had better check. They also need to check the comments for libel and profanities, not to mention trade secrets (especially those from third parties) and other IP issues.
>
>

* For a sustainable project, all the above plus:
* Compliance with host governance.

>
>
> It is a fantastic idea to move your project to a host like Apache, Conservancy, Public Software and so on. But doing so requires preparatory work. As a minimum you will need to negotiate with the new host organisation, and they may well need you to satisfy their process requirements. Paperwork obviously, but also the code may need conforming copyright statements and more. Thats more work for your liberation team.
>
>

* Migration of rights.

>
>
> Your code has an existing community who will need to migrate to your new host. That includes your staff  they are community too! They will need commit rights, governance rights, social media rights and more. Your liberation team will need your community manager, obviously, but may also need HR input.
>
>

* Endowment.

>
>
> Keeping your project alive will take money. Its all been coming from you up to this point, but if you simply walk away before the financial burden has been accepted by the new community and hosts there may be a problem. You should consider making an endowment to your new host to pay for their migration costs plus the cost of hosting the community for at least a year.
>
>

* Marketing.

>
>
> Explaining the move you are making, the reasons why you are making it and the benefits for you and the community is important. If you dont do it, there are plenty of trolls around who will do it for you. Creating a news blog post and an FAQ  the minimum effort necessary  really does take someone experienced and youll want to add such a person to your liberation team.
>
>

* Motivations
* There has to be some commercial reason that makes the time, effort and thus expense worth incurring. Some examples of motivations include:
* Market Strategy.

>
>
> An increasing number of companies are choosing to create substantial, openly-governed open source communities around software that contributes to their business. An open multi-stakeholder co-developer community is an excellent vehicle for innovation at the lowest cost to all involved. As long as your market strategy doesnt require creating artificial scarcity.
>
>

* Contract with a third party.

>
>
> While the owner of the code may no longer be interested, there may be one or more parties to which they owe a contractual responsibility. Rather than breaching that contract, or buying it out, a move to open source may be better. Some sources suggest a contractual obligation to IBM was the reason Oracle abandoned OpenOffice.org by moving it over to the Apache Software Foundation for example.
>
>

* Larger dependent ecosystem.

>
>
> You may have no further use for the code itself, but you may well have other parts of your business which depend on it. If they are willing to collectively fund development you might consider an inner source strategy which will save you many of the costs above. But the best way to proceed may well be to open the code so your teams and those in other companies can fund the code.
>
>

* Internal politics.

>
>
> From the outside, corporations look monolithic, but from the inside it becomes clear they are a microcosm of the market in which they exist. As a result, they have political machinations that may be addressed by open source. One of Oracles motivations for moving NetBeans to Apache seems to have been political. Despite multiple internal groups needing it to exist, the code was not generating enough direct revenue to satisfy successive executive owners, who allegedly tried to abandon it on more than one occasion. Donating it to Apache meant that couldnt happen again.
>
>
>
> None of this is to say a move to open source guarantees the success of a project. A Field of Dreams strategy only works in the movies, after all. But while it may be tempting to look at a failed corporate liberation and describe it as abandonware, chances are it was intended as nothing of the kind.
>
>

---

### [Why PS4 downloads are so slow](https://www.snellman.net/blog/archive/2017-08-19-slow-ps4-downloads/) ###

* From the blog that brought us [The origins of XXX as FIXME](https://www.snellman.net/blog/archive/2017-04-17-xxx-fixme/) and [The mystery of the hanging S3 downloads](https://www.snellman.net/blog/archive/2017-07-20-s3-mystery/), this week it is: Why are PS4 downloads so slow?

>
>
> Game downloads on PS4 have a reputation of being very slow, with many people reporting downloads being an order of magnitude faster on Steam or Xbox. This had long been on my list of things to look into, but at a pretty low priority. After all, the PS4 operating system is based on a reasonably modern FreeBSD (9.0), so there should not be any crippling issues in the TCP stack.  
>  The implication is that the problem is something boring, like an inadequately dimensioned CDN. But then I heard that people were successfully using local HTTP proxies as a workaround. It should be pretty rare for that to actually help with download speeds, which made this sound like a much more interesting problem.  
>  Before running any experiments, it's good to have a mental model of how the thing we're testing works, and where the problems might be. If nothing else, it will guide the initial experiment design.  
>  The speed of a steady-state TCP connection is basically defined by three numbers. The amount of data the client is will to receive on a single round-trip (TCP receive window), the amount of data the server is willing to send on a single round-trip (TCP congestion window), and the round trip latency between the client and the server (RTT). To a first approximation, the connection speed will be:  
> ` speed = min(rwin, cwin) / RTT `  
>  With this model, how could a proxy speed up the connection?
>
>

* The speed through the proxy should be the minimum of the speed between the client and proxy, and the proxy and server. It should only possibly be slower

>
>
> With a local proxy the client-proxy RTT will be very low; that connection is almost guaranteed to be the faster one. The improvement will have to be from the server-proxy connection being somehow better than the direct client-server one. The RTT will not change, so there are just two options: either the client has a much smaller receive window than the proxy, or the client is somehow causing the server's congestion window to decrease. (E.g. the client is randomly dropping received packets, while the proxy isn't).
>
>

* After setting up a test rig, where the PS4s connection was bridged through a linux box so packets could be captured, and artificial latency could be added, some interested results came up:

>
>
> The differences in receive windows at different times are striking. And more important, the changes in the receive windows correspond very well to specific things I did on the PS4  
>  When the download was started, the game Styx: Shards of Darkness was running in the background (just idling in the title screen). The download was limited by a receive window of under 7kB. This is an incredibly low value; it's basically going to cause the downloads to take 100 times longer than they should. And this was not a coincidence, whenever that game was running, the receive window would be that low.  
>  Having an app running (e.g. Netflix, Spotify) limited the receive window to 128kB, for about a 5x reduction in potential download speed.  
>  Moving apps, games, or the download window to the foreground or background didn't have any effect on the receive window.  
>  Playing an online match in a networked game (Dreadnought) caused the receive window to be artificially limited to 7kB.  
>  I ran a speedtest at a time when downloads were limited to 7kB receive window. It got a decent receive window of over 400kB; the conclusion is that the artificial receive window limit appears to only apply to PSN downloads.  
>  When a game was started (causing the previously running game to be stopped automatically), the receive window could increase to 650kB for a very brief period of time. Basically it appears that the receive window gets unclamped when the old game stops, and then clamped again a few seconds later when the new game actually starts up.  
>  I did a few more test runs, and all of them seemed to support the above findings. The only additional information from that testing is that the rest mode behavior was dependent on the PS4 settings. Originally I had it set up to suspend apps when in rest mode. If that setting was disabled, the apps would be closed when entering in rest mode, and the downloads would proceed at full speed.  
>  The PS4 doesn't make it very obvious exactly what programs are running. For games, the interaction model is that opening a new game closes the previously running one. This is not how other apps work; they remain in the background indefinitely until you explicitly close them.
>
>

* So, FreeBSD and its network stack are not to blame
* Sony used a poor method to try to keep downloads from interfering with your gameplay
* The impact of changing the receive window is highly dependant upon RTT, so it doesnt work as evenly as actual traffic shaping or queueing would.
* An interesting deep dive, it is well worth reading the full article and checking out the graphs \*\*\*

### [OpenSSH 7.6 Released](http://www.openssh.com/releasenotes.html#7.6) ###

* From the release notes:

>
>
> This release includes a number of changes that may affect existing  
>  configurations:  
>  ssh(1): delete SSH protocol version 1 support, associated  
>  configuration options and documentation.  
>  ssh(1)/sshd(8): remove support for the hmac-ripemd160 MAC.  
>  ssh(1)/sshd(8): remove support for the arcfour, blowfish and CAST  
>  Refuse RSA keys \<1024 bits in length and improve reporting for keys that do not meet   
>  this requirement.  
>  ssh(1): do not offer CBC ciphers by default.
>
>

* Changes since OpenSSH 7.5
* This is primarily a bugfix release. It also contains substantial internal refactoring.

>
>
> Security: sftp-server(8): in read-only mode, sftp-server was incorrectly permitting creation of zero-length files. Reported by Michal Zalewski.
>
>

* New features:

>
>
> ssh(1): add RemoteCommand option to specify a command in the ssh config file instead of giving it on the client's command line. This allows the configuration file to specify the command that will be executed on the remote host.  
>  sshd(8): add ExposeAuthInfo option that enables writing details of the authentication methods used (including public keys where applicable) to a file that is exposed via a $SSH\_USER\_AUTH environment variable in the subsequent session.  
>  ssh(1): add support for reverse dynamic forwarding. In this mode, ssh will act as a SOCKS4/5 proxy and forward connections to destinations requested by the remote SOCKS client. This mode is requested using extended syntax for the -R and RemoteForward options and, because it is implemented solely at the client, does not require the server be updated to be supported.  
>  sshd(8): allow LogLevel directive in sshd\_config Match blocks;  
>  ssh-keygen(1): allow inclusion of arbitrary string or flag certificate extensions and critical options.  
>  ssh-keygen(1): allow ssh-keygen to use a key held in ssh-agent as a CA when signing certificates.  
>  ssh(1)/sshd(8): allow IPQoS=none in ssh/sshd to not set an explicit ToS/DSCP value and just use the operating system default.  
>  ssh-add(1): added -q option to make ssh-add quiet on success.  
>  ssh(1): expand the StrictHostKeyChecking option with two new settings. The first "accept-new" will automatically accept hitherto-unseen keys but will refuse connections for changed or invalid hostkeys. This is a safer subset of the current behaviour of StrictHostKeyChecking=no. The second setting "off", is a synonym for the current behaviour of StrictHostKeyChecking=no: accept new host keys, and continue connection for hosts with incorrect hostkeys. A future release will change the meaning of StrictHostKeyChecking=no to the behaviour of "accept-new".  
>  ssh(1): add SyslogFacility option to ssh(1) matching the equivalent option in sshd(8).
>
>

* Check out the bugfixes and portability sections, too. \*\*\*

News Roundup
----------

### [FreeBSD comes to FiFo 0.9.3 with vmadm](https://blog.project-fifo.net/freebsd-in-fifo-0-9-3/) ###

* What is Project FiFo? Its an Open Source SmartOS Cloud Management and orchestration software. FiFo can be installed on SmartOS zones, running on standard compute nodes. There is no need for dedicated hardware or server roles.

>
>
> FiFo 0.9.3 has been in the works for a while, and it comes with quite a few new features. With our last release, we started experimenting with FreeBSD support. Since then much work has gone into improving this. We also did something rather exciting with the mystery box! However, more on that in a later post.  
>  The stable release of 0.9.3 will land within a few days with only packaging and documentation tasks left to do. Part of this means that well have packages for all major components that work natively on BSD. There is no more need for a SmartOS box to run the components!  
>  When we introduced FreeBSD support last version we marked it as an experimental feature. We needed to try out and experiment what works and what does not. Understand the way FreeBSD does things, what tools exist, and how those align with our workflow. Bottomline we were not even sure BSD support was a thing in the future.  
>  We are happy to announce that with 0.9.3 we are now sure BSD support is a thing, and it is here to remain. That said it was good that we experimented in the last release, we did some significant changes to what we have now. When first looking at FreeBSD we went ahead and used existing tooling, namely iocage, to manage jails. It turns out the tooling around jails is not on par with what exists on illumos and especially SmartOS. The goodness of vmadm as a CLI for managing zones is just unparalleled. So we do what every (in)sane person would do!  
>  So with 0.9.3, we did what every (in)sane person would do! We implemented a version of vmadm that would work with FreeBSD and jails and keep the same CLI. Our clone works completely stand alone; vmadm is a compiled binary, written in rust which is blazing fast! The design takes up lessons learned from both zoneadm and vmadm in illumos/SmartOS for how things work instead of trying to reinvent the wheel. Moreover, while we love giving the FreeBSD community a tool we learned to love on SmartOS this also makes things a lot easier for us. FiFo now can use the same logic on SmartOS and FreeBSD as the differences are abstracted away inside of vmadm. That said there are a few notable differences.  
>  First of all, vmadm uses datasets the same way it does on SmartOS. However, there is no separate imgadm tool. Instead, we encapsulate the commands under vmadm images. To make this work we also provide a dataset server with base images for FreeBSD that used the same API as SmartOS dataset servers. Second, we needed to work around some limitations in VNET to make jails capable of being fully utilized in multi-tenancy environments.  
>  Nested vnet jails on freebsd While on illumos a virtual nic can be bound to an IP that can not be changed from inside the zone, VNET does not support this. Preventing tenants from messing with IP settings is crucial from a security standpoint!  
>  To work around that each jail created by vmadm are two jails: a minimal outer jail with nothing but a VNET interface, no IP or anything and an internal one that runs the user code. This outer jail then creates an inner jail with an inherited NIC that gets a fixed IP, combining both the security of a VNET jail as well as the security of a fixed IP interface.  
>  The nested jail layout resembles the way that SmartOS handles KVM machines, running KVM inside a zone. So in addition to working around VNET limitations, this already paves the way for bhyve nested in jails that might come in a future release. We hope to leverage the same two-step with just a different executable started in the outer jail instead of the jail command itself.
>
>
> ---
>

### [History of UNIX Manpages](https://manpages.bsd.lv/history.html) ###

>
>
> Where do UNIX manpages come from? Who introduced the section-based layout of NAME, SYNOPSIS, and so on? And for manpage source writers and readers: where were those economical two- and three-letter instructions developed? The many accounts available on the Internet lack citations and are at times inconsistent.  
>  In this article, I reconstruct the history of the UNIX manpage based on source code, manuals, and first-hand accounts.  
>  Special thanks to Paul Pierce for his CTSS source archive; Bernard Nivelet for the Multics Internet Server; the UNIX Heritage Society for their research UNIX source reconstruction; Gunnar Ritter for the Heirloom Project sources; Alcatel-Lucent Bell Labs for the Plan 9 sources; BitSavers for their historical archive; and last but not least, Rudd Canaday, James Clarke, Brian Kernighan, Douglas McIlroy, Nils-Peter Nelson, Jerome Saltzer, Henry Spencer, Ken Thompson, and Tom Van Vleck for their valuable contributions.
>
>
>
> Please see the Copyright section if you plan on reproducing parts of this work.
>
>

* People:
  * Abell, Vic
  * Canaday, Rudd
  * Capps, Dennis
  * Clarke, James
  * Dzonsons, Kristaps
  * Kernighan, Brian
  * Madnick, Stuart
  * McIlroy, Douglas
  * Morris, Robert
  * Ossanna, Joseph F.
  * Ritchie, Dennis
  * Ritter, Gunnar
  * Saltzer, Jerome H.
  * Spencer, Henry
  * Thompson, Ken \*\*\*

### [BSDCam 2017 Trip Report: Mathieu Arnold](https://www.freebsdfoundation.org/blog/bsdcam-2017-trip-report-mathieu-arnold/) ###

>
>
> It seems that every time I try to go to England using the Eurostar, it gets delayed between 30 minutes and 2 hours. This year, it got my 45 minute layover down to 10 minutes. Luckily, Kings Cross is literally across the street from Saint Pancras, and I managed to get into my second train just in time.  
>  I arrived in Cambridge on Tuesday right on time for tea. A quick walk from the station got me to St Catharines College. This year, we were in a different building for the rooms, so I listened to the convoluted explanation the porter gave me to get to my room, I managed to get there without getting lost more than once. That evening was almost organized as we got together for dinner at the usual pub, the Maypole.
>
>

* Wednesday:

>
>
> The weather is lovely, and it is a good thing as there is a 25-30 minute walk from the College to the Computer Laboratory where the devsummit happens. The first morning is for deciding what we are going to talk about for the rest of the week, so we all go in turn introducing ourselves and voicing about what we would like to talk about. There are a few subjects that are of interest to me, so I listen to the toolchain discussions while writing new bits for the Porters Handbook.
>
>

* Thursday:

>
>
> I spent most of the day writing documentation, and talked a bit with a couple of DocEng members about joining the team as I would like to give some love to the build framework that has not been touched in a long time. At the end of the afternoon is a packaging session, we talked about the status of package in base, which is not really going anywhere right now. On the ports side, three aspects that are making good progress include, package flavors, sub packages, and migrating some base libraries to private libraries, which is a nightmare because of openssl, and kerberos, and pam. That evening, we had the formal diner at St Johns College, I love those old buildings that reminds me of Hogwarts. (I am sure there is a quidditch pitch somewhere nearby.)
>
>

* Friday:

>
>
> Last day. I continued to write documentation, while listening to a provisioning session. It would be great to have bhyve support in existing orchestration tools like vagrant, openstack, or maybe ganeti. We end the day, and the devsummit with short talks, some very interesting, some going way over my head.  
>  The weekend is here. I spent most of Saturday strolling in some of the numerous Cambridge parks, gardens, greens, fens and I worked on a knitting pattern in the evening. On Sunday, I ate my last full gargantuan english breakfast of the year, and then back in a train to Kings Cross, and a Eurostar (this one on time) back to Paris.  
>  I would like to thank the FreeBSD Foundation for making this trip possible for me.
>
>
> ---
>

### [GSoC 2017 Reports: Add SUBPACKAGES support to pkgsrc, part 1](https://blog.netbsd.org/tnf/entry/gsoc_2017_reports_add_code) ###

* Introduction
* SUBPACKAGES (on some package systems they are known as multi-packages, but this term for pkgsrc is already used by packages that can be built against several versions (e.g. Python, PHP, Ruby packages)) consist in generating multiple binary packages from a single pkgsrc package. For example, from a pkgsrc package - local/frobnitzem - we will see how to generate three separate binary packages: frobnitzem-foo, frobnitzem-bar and frobnitzem-baz.
* This can be useful to separate several components of binary packages (and avoid to run the extract and configure phase two times!), for debugpkgs (so that all \*.debug files containing debug symbols are contained in a separate -debugpkg package that can be installed only when it is needed), etc..
* An high-level look at how SUBPACKAGES support is implemented
* Most of the changes needed are in mk/pkgformat/pkg/ hierarchy (previously known as mk/flavour and then renamed and generalized to other package formats during Anton Panev's Google Summer of Code 2011).
* The code in mk/pkgformat/${PKG\_FORMAT}/ handle the interaction of pkgsrc with the particular ${PKG\_FORMAT}, e.g. for pkg populate meta-data files used by pkg\_create(1), install/delete packages via pkg\_add(1), and pkg\_delete(1), etc.
* Conclusion
* In this first part of this blog post series we have seen what are SUBPACKAGES, when and why they can be useful.
* We have then seen a practical example of them taking a very trivial package and learned how to "subpackage-ify" it.
* Then we have described - from an high-level perspective - the changes needed to the pkgsrc infrastructure for the SUBPACKAGES features that we have used. If you are more interested in them please give a look to the pkgsrc debugpkg branch that contains all work done described in this blog post.
* In the next part we will see how to handle *DEPENDS and buildlink3 inclusion for subpackages. \**\*

Beastie Bits
----------

* [First partial boot of FreeBSD on Power8](http://dmesgd.nycbug.org/index.cgi?do=view&id=3329)
* [The new TNF Board of Directors are installed and patched for 2017.](https://blog.netbsd.org/tnf/entry/the_new_tnf_board_of)
* [Open Source Summit 2017 October 23-26, 2017, Prague, Czech Republic Giovanni Bechis will give a talk about seccomp(2) vs pledge(2)](https://osseu17.sched.com/event/BxJw/seccomp2-vs-pledge2-giovanni-bechis-snb-srl)
* [My first patch to OpenBSD](http://nanxiao.me/en/my-first-patch-to-openbsd/)

---

Feedback/Questions
----------

* Brian - [OPNSense Facebook Group](http://dpaste.com/35WA42Z#wrap)
* Mark Felder - [ZFS Health via SNMP](http://dpaste.com/0B8QH2W)
* Matt - [Cantrill Presentation](http://dpaste.com/1D9WTHV#wrap) \*\*\*