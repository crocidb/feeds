+++
title = "233: High on ZFS"
description = "We explain the physics behind ZFS, DTrace switching to the GPL, Emacs debugging, syncookies coming to PF & FreeBSD’s history on EC2.This episode was brought to you by[iXsystems - Enterprise Servers and Storage for Open Source](http://www.ixsystems.com/"
date = "2018-02-14T13:00:00Z"
url = "https://www.bsdnow.tv/233"
author = "feedback@bsdnow.tv (JT Pennington)"
text = ""
lastupdated = "2026-03-26T14:37:50.790437960Z"
seen = true
+++

We explain the physics behind ZFS, DTrace switching to the GPL, Emacs debugging, syncookies coming to PF & FreeBSD’s history on EC2.

This episode was brought to you by
----------

[![iXsystems - Enterprise Servers and Storage for Open Source](/images/1.png)](http://www.ixsystems.com/bsdnow)[![DigitalOcean - Simple Cloud Hosting, Built for Developers](/images/2.png)](http://www.digitalocean.com/)[![Tarsnap - Online Backups for the Truly Paranoid](/images/3.png)](http://www.tarsnap.com/bsdnow)

---

Headlines
----------

### [128 bit storage: Are you high?](https://blogs.oracle.com/bonwick/128-bit-storage:-are-you-high) ###

* For people who have heard about ZFS boiling oceans and wonder where that is coming from, we dug out this old piece from 2004 on the blog of ZFS co-creator Jeff Bonwick, originally from the Sun website.

>
>
> 64 bits would have been plenty ... but then you can't talk out of your ass about boiling oceans then, can you?  
>  Well, it's a fair question. Why did we make ZFS a 128-bit storage system? What on earth made us think it's necessary? And how do we know it's sufficient? Let's start with the easy one: how do we know it's necessary?  
>  Some customers already have datasets on the order of a petabyte, or 2<sup>50</sup> bytes. Thus the 64-bit capacity limit of 2<sup>64</sup> bytes is only 14 doublings away. Moore's Law for storage predicts that capacity will continue to double every 9-12 months, which means we'll start to hit the 64-bit limit in about a decade. Storage systems tend to live for several decades, so it would be foolish to create a new one without anticipating the needs that will surely arise within its projected lifetime.  
>  If 64 bits isn't enough, the next logical step is 128 bits. That's enough to survive Moore's Law until I'm dead, and after that, it's not my problem. But it does raise the question: what are the theoretical limits to storage capacity?  
>  Although we'd all like Moore's Law to continue forever, quantum mechanics imposes some fundamental limits on the computation rate and information capacity of any physical device. In particular, it has been shown that 1 kilogram of matter confined to 1 liter of space can perform at most 10<sup>51</sup> operations per second on at most 10<sup>31</sup> bits of information [see Seth Lloyd, "Ultimate physical limits to computation." Nature 406, 1047-1054 (2000)]. A fully-populated 128-bit storage pool would contain 2<sup>128</sup> blocks = 2<sup>137</sup> bytes = 2<sup>140</sup> bits; therefore the minimum mass required to hold the bits would be (2<sup>140</sup> bits) / (10<sup>31</sup> bits/kg) = 136 billion kg.  
>  That's a lot of gear.  
>  To operate at the 1031 bits/kg limit, however, the entire mass of the computer must be in the form of pure energy. By E=mc<sup>2,</sup> the rest energy of 136 billion kg is 1.2x1028 J. The mass of the oceans is about 1.4x1021 kg. It takes about 4,000 J to raise the temperature of 1 kg of water by 1 degree Celcius, and thus about 400,000 J to heat 1 kg of water from freezing to boiling.  
>  The latent heat of vaporization adds another 2 million J/kg.  
>  Thus the energy required to boil the oceans is about 2.4x106 J/kg \* 1.4x1021 kg =   
>  3.4x1027 J. Thus, fully populating a 128-bit storage pool would, literally, require more energy than boiling the oceans.
>
>

* Best part of all: you don’t have to understand any of this to use ZFS. Rest assured that you won’t hit any limits with that filesystem for a long time. You still have to buy bigger disks over time, though... \*\*\*

### [dtrace for Linux, Oracle relicenses dtrace](https://gnu.wildebeest.org/blog/mjw/2018/02/14/dtrace-for-linux-oracle-does-the-right-thing/) ###

>
>
> At Fosdem we had a talk on dtrace for linux in the Debugging Tools devroom.
>
>
>
> Not explicitly mentioned in that talk, but certainly the most exciting thing, is that Oracle is doing a proper linux kernel port:
>
>

```
 commit e1744f50ee9bc1978d41db7cc93bcf30687853e6
 Author: Tomas Jedlicka <tomas.jedlicka@oracle.com>
 Date: Tue Aug 1 09:15:44 2017 -0400

 dtrace: Integrate DTrace Modules into kernel proper

 This changeset integrates DTrace module sources into the main kernel
 source tree under the GPLv2 license. Sources have been moved to
 appropriate locations in the kernel tree.

```

>
>
> That is right, dtrace dropped the CDDL and switched to the GPL!
>
>
>
> The user space code dtrace-utils and libdtrace-ctf (a combination of GPLv2 and UPL) can be found on the DTrace Project Source Control page. The NEWS file mentions the license switch (and that it is build upon elfutils, which I personally was pleased to find out).
>
>
>
> The kernel sources (GPLv2+ for the core kernel and UPL for the uapi) are slightly harder to find because they are inside the uek kernel source tree, but following the above commit you can easily get at the whole linux kernel dtrace directory.
>
>
>
> The UPL is the Universal Permissive License, which according to the FSF is a lax, non-copyleft license that is compatible with the GNU GPL.
>
>
>
> Thank you Oracle for making everyone’s life easier by waving your magic relicensing wand!
>
>
>
> Now there is lots of hard work to do to actually properly integrate this. And I am sure there are a lot of technical hurdles when trying to get this upstreamed into the mainline kernel. But that is just hard work. Which we can now start collaborating on in earnest.
>
>
>
> Like systemtap and the Dynamic Probes (dprobes) before it, dtrace is a whole system observability tool combining tracing, profiling and probing/debugging techniques. Something the upstream linux kernel hackers don’t always appreciate when presented as one large system. They prefer having separate small tweaks for tracing, profiling and probing which are mostly separate from each other. It took years for the various hooks, kprobes, uprobes, markers, etc. from systemtap (and other systems) to get upstream. But these days they are. And there is now even a byte code interpreter (eBPF) in the mainline kernel as originally envisioned by dprobes, which systemtap can now target through stapbpf. So with all those techniques now available in the linux kernel it will be exciting to see if dtrace for linux can unite them all.
>
>

---

### [Debugging Emacs or: How I Learned to Stop Worrying and Love DTrace](http://nullprogram.com/blog/2018/01/17/) ###

>
>
> For some time Elfeed was experiencing a strange, spurious failure. Every so often users were seeing an error (spoiler warning) when updating feeds: “error in process sentinel: Search failed.” If you use Elfeed, you might have even seen this yourself. From the surface it appeared that curl, tasked with the responsibility for downloading feed data, was producing incomplete output despite reporting a successful run. Since the run was successful, Elfeed assumed certain data was in curl’s output buffer, but, since it wasn’t, it failed hard.
>
>
>
> Unfortunately this issue was not reproducible. Manually running curl outside of Emacs never revealed any issues. Asking Elfeed to retry fetching the feeds would work fine. The issue would only randomly rear its head when Elfeed was fetching many feeds in parallel, under stress. By the time the error was discovered, the curl process had exited and vital debugging information was lost. Considering that this was likely to be a bug in Emacs itself, there really wasn’t a reliable way to capture the necessary debugging information from within Emacs Lisp. And, indeed, this later proved to be the case.
>
>
>
> A quick-and-dirty work around is to use condition-case to catch and swallow the error. When the bizarre issue shows up, rather than fail badly in front of the user, Elfeed could attempt to swallow the error — assuming it can be reliably detected — and treat the fetch as simply a failure. That didn’t sit comfortably with me. Elfeed had done its due diligence checking for errors already. Someone was lying to Elfeed, and I intended to catch them with their pants on fire. Someday.
>
>
>
> I’d just need to witness the bug on one of my own machines. Elfeed is part of my daily routine, so surely I’d have to experience this issue myself someday. My plan was, should that day come, to run a modified Elfeed, instrumented to capture extra data. I would have also routinely run Emacs under GDB so that I could inspect the failure more deeply.
>
>
>
> For now I just had to wait to hunt that zebra.
>
>

* Bryan Cantrill, DTrace, and FreeBSD

>
>
> Over the holidays I re-discovered Bryan Cantrill, a systems software engineer who worked for Sun between 1996 and 2010, and is most well known for DTrace. My first exposure to him was in a BSD Now interview in 2015. I had re-watched that interview and decided there was a lot more I had to learn from him. He’s become a personal hero to me. So I scoured the internet for more of his writing and talks.
>
>
>
> Some interesting operating system technology came out of Sun during its final 15 or so years — most notably DTrace and ZFS — and Bryan speaks about it passionately. Almost as a matter of luck, most of it survived the Oracle acquisition thanks to Sun releasing it as open source in just the nick of time. Otherwise it would have been lost forever. The scattered ex-Sun employees, still passionate about their prior work at Sun, along with some of their old customers have since picked up the pieces and kept going as a community under the name illumos. It’s like an open source flotilla.
>
>
>
> Naturally I wanted to get my hands on this stuff to try it out for myself. Is it really as good as they say? Normally I stick to Linux, but it (generally) doesn’t have these Sun technologies available. The main reason is license incompatibility. Sun released its code under the CDDL, which is incompatible with the GPL. Ubuntu does infamously include ZFS, but other distributions are unwilling to take that risk. Porting DTrace is a serious undertaking since it’s got its fingers throughout the kernel, which also makes the licensing issues even more complicated.
>
>
>
> Linux has a reputation for Not Invented Here (NIH) syndrome, and these licensing issues certainly contribute to that. Rather than adopt ZFS and DTrace, they’ve been reinvented from scratch: btrfs instead of ZFS, and a slew of partial options instead of DTrace. Normally I’m most interested in system call tracing, and my go to is strace, though it certainly has its limitations — including this situation of debugging curl under Emacs. Another famous example of NIH is Linux’s epoll(2), which is a broken version of BSD kqueue(2).
>
>
>
> So, if I want to try these for myself, I’ll need to install a different operating system. I’ve dabbled with OmniOS, an OS built on illumos, in virtual machines, using it as an alien environment to test some of my software (e.g. enchive). OmniOS has a philosophy called Keep Your Software To Yourself (KYSTY), which is really just code for “we don’t do packaging.” Honestly, you can’t blame them since they’re a tiny community. The best solution to this is probably pkgsrc, which is essentially a universal packaging system. Otherwise you’re on your own.
>
>
>
> There’s also openindiana, which is a more friendly desktop-oriented illumos distribution. Still, the short of it is that you’re very much on your own when things don’t work. The situation is like running Linux a couple decades ago, when it was still difficult to do.
>
>
>
> If you’re interested in trying DTrace, the easiest option these days is probably FreeBSD. It’s got a big, active community, thorough documentation, and a huge selection of packages. Its license (the BSD license, duh) is compatible with the CDDL, so both ZFS and DTrace have been ported to FreeBSD.
>
>

* What is DTrace?

>
>
> I’ve done all this talking but haven’t yet described what DTrace really is. I won’t pretend to write my own tutorial, but I’ll provide enough information to follow along. DTrace is a tracing framework for debugging production systems in real time, both for the kernel and for applications. The “production systems” part means it’s stable and safe — using DTrace won’t put your system at risk of crashing or damaging data. The “real time” part means it has little impact on performance. You can use DTrace on live, active systems with little impact. Both of these core design principles are vital for troubleshooting those really tricky bugs that only show up in production.
>
>
>
> There are DTrace probes scattered all throughout the system: on system calls, scheduler events, networking events, process events, signals, virtual memory events, etc. Using a specialized language called D (unrelated to the general purpose programming language D), you can dynamically add behavior at these instrumentation points. Generally the behavior is to capture information, but it can also manipulate the event being traced.
>
>
>
> Each probe is fully identified by a 4-tuple delimited by colons: provider, module, function, and probe name. An empty element denotes a sort of wildcard. For example, syscall::open:entry is a probe at the beginning (i.e. “entry”) of open(2). syscall:::entry matches all system call entry probes.
>
>
>
> Unlike strace on Linux which monitors a specific process, DTrace applies to the entire system when active. To run curl under strace from Emacs, I’d have to modify Emacs’ behavior to do so. With DTrace I can instrument every curl process without making a single change to Emacs, and with negligible impact to Emacs. That’s a big deal.
>
>
>
> So, when it comes to this Elfeed issue, FreeBSD is much better poised for debugging the problem. All I have to do is catch it in the act. However, it’s been months since that bug report and I’m not really making this connection yet. I’m just hoping I eventually find an interesting problem where I can apply DTrace.
>
>

* [Bryan Cantrill: Talks I have given](http://dtrace.org/blogs/bmc/2018/02/03/talks/) \*\*\*

News Roundup
----------

### [a2k18 Hackathon preview: Syncookies coming to PF](https://undeadly.org/cgi?action=article;sid=20180207090000) ###

>
>
> As you may have heard, the a2k18 hackathon is in progress. As can be seen from the commit messages, several items of goodness are being worked on.  
>  One eagerly anticipated item is the arrival of TCP syncookies (read: another important tool in your anti-DDoS toolset) in PF. Henning Brauer (henning@) added the code in a series of commits on February 6th, 2018, with this one containing the explanation:
>
>

```
syncookies for pf.

when syncookies are on, pf will blindly answer each and every SYN with a syncookie-SYNACK. Upon reception of the ACK completing the 3WHS, pf will reconstruct the original SYN, shove it through pf_test, where state will be created if the ruleset permits it. Then massage the freshly created state (we won't see the SYNACK), set up the sequence number modulator, and call into the existing synproxy code to start the 3WHS with the backend host.

Add an - somewhat basic for now - adaptive mode where syncookies get enabled if a certain percentage of the state table is filled up with half-open tcp connections. This makes pf firewalls resilient against large synflood attacks.

syncookies are off by default until we gained more experience, considered experimental for now.

see http://bulabula.org/papers/2017/bsdcan/ for more details.

joint work with sashan@, widely discussed and with lots of input by many

```

>
>
> The first release to have this feature available will probably be the upcoming OpenBSD 6.3 if a sufficient number of people test this in their setups (hint, hint). More info is likely to emerge soon in post-hackathon writeups, so watch this space!
>
>

---

### [Pale Moon] ###

* A Perfect example of how not to approach OS developers/packagers
* [Removed from OpenBSD Ports due to Licensing Issues](https://github.com/jasperla/openbsd-wip/issues/86)
* [FreeBSD Palemoon branding violation](https://lists.freebsd.org/pipermail/freebsd-ports/2018-February/112455.html)
* [Mightnight BSD's response](https://twitter.com/midnightbsd/status/961232422091280386) \*\*\*

### [FreeBSD EC2 History](http://www.daemonology.net/blog/2018-02-12-FreeBSD-EC2-history.html) ###

>
>
> A couple years ago Jeff Barr published a blog post with a timeline of EC2 instances. I thought at the time that I should write up a timeline of the FreeBSD/EC2 platform, but I didn't get around to it; but last week, as I prepared to ask for sponsorship for my work I decided that it was time to sit down and collect together the long history of how the platform has evolved and improved over the years.  
>  Normally I don't edit blog posts after publishing them (with the exception of occasional typographical corrections), but I do plan on keeping this post up to date with future developments.
>
>

* August 25, 2006: Amazon EC2 launches. It supports a single version of Ubuntu Linux; FreeBSD is not available.
* December 13, 2010: I manage to get FreeBSD running on EC2 t1.micro instances.
* March 22, 2011: I manage to get FreeBSD running on EC2 "cluster compute" instances.
* July 8, 2011: I get FreeBSD 8.2 running on all 64-bit EC2 instance types, by marking it as "Windows" in order to get access to Xen/HVM virtualization. (Unfortunately this meant that users had to pay the higher "Windows" hourly pricing.)
* January 16, 2012: I get FreeBSD 9.0 running on 32-bit EC2 instances via the same "defenestration" trick. (Again, paying the "Windows" prices.)
* August 16, 2012: I move the FreeBSD rc.d scripts which handle "EC2" functionality (e.g., logging SSH host keys to the console) into the FreeBSD ports tree.
* October 7, 2012: I rework the build process for FreeBSD 9.1-RC1 and later to use "world" bits extracted from the release ISOs; only the kernel is custom-built. Also, the default SSH user changes from "root" to "ec2-user".
* October 31, 2012: Amazon launches the "M3" family of instances, which support Xen/HVM without FreeBSD needing to pay the "Windows" tax.
* November 21, 2012: I get FreeBSD added to the AWS Marketplace.
* October 2, 2013: I finish merging kernel patches into the FreeBSD base system, and rework the AMI build (again) so that FreeBSD 10.0-ALPHA4 and later use bits extracted from the release ISOs for the entire system (world + kernel). FreeBSD Update can now be used for updating everything (because now FreeBSD/EC2 uses a GENERIC kernel).
* October 27, 2013: I add code to EC2 images so that FreeBSD 10.0-BETA2 and later AMIs will run FreeBSD Update when they first boot in order to download and install any critical updates.
* December 1, 2013: I add code to EC2 images so that FreeBSD 10.0-BETA4 and later AMIs bootstrap the pkg tool and install packages at boot time (by default, the "awscli" package).
* December 9, 2013: I add configinit to FreeBSD 10.0-RC1 and later to allow systems to be easily configured via EC2 user-data.
* July 1, 2014: Amazon launches the "T2" family of instances; now the most modern family for every type of EC2 instance (regular, high-memory, high-CPU, high-I/O, burstable) supports HVM and there should no longer be any need for FreeBSD users to pay the "Windows tax".
* November 24, 2014: I add code to FreeBSD 10.2 and later to automatically resize their root filesystems when they first boot; this means that a larger root disk can be specified at instance launch time and everything will work as expected.
* April 1, 2015: I integrate the FreeBSD/EC2 build process into the FreeBSD release building process; FreeBSD 10.2-BETA1 and later AMIs are built by the FreeBSD release engineering team.
* January 12, 2016: I enable Intel 82599-based "first generation EC2 Enhanced Networking" in FreeBSD 11.0 and later.
* June 9, 2016: I enable the new EC2 VGA console functionality in FreeBSD 11.0 and later. (The old serial console also continues to work.)
* June 24, 2016: Intel 82599-based Enhanced Networking works reliably in FreeBSD 11.0 and later thanks to discovering and working around a Xen bug.
* June 29, 2016: I improve throughput on Xen blkfront devices (/dev/xbd\*) by enabling indirect segment I/Os in FreeBSD 10.4 and later. (I wrote this functionality in July 2015, but left it disabled by default a first because a bug in EC2 caused it to hurt performance on some instances.)
* July 7, 2016: I fix a bug in FreeBSD's virtual memory initialization in order to allow it to support boot with 128 CPUs; aka. FreeBSD 11.0 and later support the EC2 x1.32xlarge instance type.
* January 26, 2017: I change the default configuration in FreeBSD 11.1 and later to support EC2's IPv6 networking setup out of the box (once you flip all of the necessary switches to enable IPv6 in EC2 itself).
* May 20, 2017: In collaboration with Rick Macklem, I make FreeBSD 11.1 and later compatible with the Amazon "Elastic File System" (aka. NFSv4-as-a-service) via the newly added "oneopenown" mount option (and lots of bug fixes).
* May 25, 2017: I enable support for the Amazon "Elastic Network Adapter" in FreeBSD 11.1 and later. (The vast majority of the work — porting the driver code — was done by Semihalf with sponsorship from Amazon.)
* December 5, 2017: I change the default configuration in FreeBSD 11.2 and later to make use of the Amazon Time Sync Service (aka. NTP-as-a-service).

* The current status

* The upcoming FreeBSD release (11.2) supports: IPv6, Enhanced Networking (both generations), Amazon Elastic File System, Amazon Time Sync Service, both consoles (Serial VGA), and every EC2 instance type (although I'm not sure if FreeBSD has drivers to make use of the FPGA or GPU hardware on those instances).

* [Colin's Patreon' page if you'd like to support him](https://www.patreon.com/cperciva)

---

### X network transparency ###

* [X's network transparency has wound up mostly being a failure](https://utcc.utoronto.ca/~cks/space/blog/unix/XNetworkTransparencyFailure)

>
>
> I was recently reading Mark Dominus's entry about some X keyboard problems, in which he said in passing (quoting himself):
>
>
>
> I have been wondering for years if X's vaunted network transparency was as big a failure as it seemed: an interesting idea, worth trying out, but one that eventually turned out to be more trouble than it was worth. [...]
>
>
>
> My first reaction was to bristle, because I use X's network transparency all of the time at work. I have several programs to make it work very smoothly, and some core portions of my environment would be basically impossible without it. But there's a big qualification on my use of X's network transparency, namely that it's essentially all for text. When I occasionally go outside of this all-text environment of xterms and emacs and so on, it doesn't go as well.
>
>
>
> X's network transparency was not designed as 'it will run xterm well'; originally it was to be something that should let you run almost everything remotely, providing a full environment. Even apart from the practical issues covered in Daniel Stone's slide presentation, it's clear that it's been years since X could deliver a real first class environment over the network. You cannot operate with X over the network in the same way that you do locally. Trying to do so is painful and involves many things that either don't work at all or perform so badly that you don't want to use them.
>
>
>
> In my view, there are two things that did in general X network transparency. The first is that networks turned out to not be fast enough even for ordinary things that people wanted to do, at least not the way that X used them. The obvious case is web browsers; once the web moved to lots of images and worse, video, that was pretty much it, especially with 24-bit colour.
>
>
>
> (It's obviously not impossible to deliver video across the network with good performance, since YouTube and everyone else does it. But their video is highly encoded in specialized formats, not handled by any sort of general 'send successive images to the display' system.)
>
>
>
> The second is that the communication facilities that X provided were too narrow and limited. This forced people to go outside of them in order to do all sorts of things, starting with audio and moving on to things like DBus and other ways of coordinating environments, handling sophisticated configuration systems, modern fonts, and so on. When people designed these additional communication protocols, the result generally wasn't something that could be used over the network (especially not without a bunch of setup work that you had to do in addition to remote X). Basic X clients that use X properties for everything may be genuinely network transparent, but there are very few of those left these days. (Not even xterm is any more, at least if you use XFT fonts. XFT fonts are rendered in the client, and so different hosts may have different renderings of the same thing, cf.)
>
>

\< What remains of X's network transparency is still useful to some of us, but it's only a shadow of what the original design aimed for. I don't think it was a mistake for X to specifically design it in (to the extent that they did, which is less than you might think), and it did help X out pragmatically in the days of X terminals, but that's mostly it.

(I continue to think that remote display protocols are useful in general, but I'm in an usual situation. Most people only ever interact with remote machines with either text mode SSH or a browser talking to a web server on the remote machine.)

>
>
> PS: The X protocol issues with synchronous requests that Daniel Stone talks about don't help the situation, but I think that even with those edges sanded off X's network transparency wouldn't be a success. Arguably X's protocol model committed a lesser version of part of the NeWS mistake.
>
>

* [X's network transparency was basically free at the time](https://utcc.utoronto.ca/~cks/space/blog/unix/XFreeNetworkTransparency)

>
>
> I recently wrote an entry about how X's network transparency has wound up mostly being a failure for various reasons. However, there is an important flipside to the story of X's network transparency, and that is that X's network transparency was almost free at the time and in the context it was created. Unlike the situation today, in the beginning X did not have to give up lots of performance or other things in order to get network transparency.
>
>
>
> X originated in the mid 1980s and it was explicitly created to be portable across various Unixes, especially BSD-derived ones (because those were what universities were mostly using at that time). In the mid to late 1980s, Unix had very few IPC methods, especially portable ones. In particular, BSD systems did not have shared memory (it was called 'System V IPC' for the obvious reasons). BSD had TCP and Unix sockets, some System V machines had TCP (and you could likely assume that more would get it), and in general your safest bet was to assume some sort of abstract stream protocol and then allow for switchable concrete backends. Unsurprisingly, this is exactly what X did; the core protocol is defined as a bidirectional stream of bytes over an abstracted channel. (And the concrete implementation of $DISPLAY has always let you specify the transport mechanism, as well as allowing your local system to pick the best mechanism it has.)
>
>
>
> Once you've decided that your protocol has to run over abstracted streams, it's not that much more work to make it network transparent (TCP provides streams, after all). X could have refused to make the byte order of the stream clear or required the server and the client to have access to some shared files (eg for fonts), but I don't think either would have been a particularly big win. I'm sure that it took some extra effort and care to make X work across TCP from a different machine, but I don't think it took very much. (At the same time, my explanation here is probably a bit ahistorical. X's initial development seems relatively strongly tied to sometimes having clients on different machines than the display, which is not unreasonable for the era. But it doesn't hurt to get a feature that you want anyway for a low cost.)
>
>
>
> I believe it's important here that X was intended to be portable across different Unixes. If you don't care about portability and can get changes made to your Unix, you can do better (for example, you can add some sort of shared memory or process to process virtual memory transfer). I'm not sure how the 1980s versions of SunView worked, but I believe they were very SunOS dependent. Wikipedia says SunView was partly implemented in the kernel, which is certainly one way to both share memory and speed things up.
>
>
>
> PS: Sharing memory through mmap() and friends was years in the future at this point and required significant changes when it arrived.
>
>

---

Beastie Bits
----------

* [Grace Hopper Celebration 2018 Call for Participation](https://www.freebsdfoundation.org/news-and-events/call-for-papers/grace-hopper-celebration-2018-call-for-participation/)
* [Google Summer of Code: Call for Project Ideas](https://www.freebsdfoundation.org/blog/google-summer-of-code-call-for-project-ideas/)
* [The OpenBSD Foundation 2018 Fundraising Campaign](https://undeadly.org/cgi?action=article;sid=20180129190641)
* [SSH Mastery 2/e out](https://blather.michaelwlucas.com/archives/3115)
* [AsiaBSDcon 2018 Registration is open](https://2018.asiabsdcon.org/)
* [Tarsnap support for Bitcoin ending April 1st; and a Chrome bug](http://mail.tarsnap.com/tarsnap-announce/msg00042.html)

---

Feedback/Questions
----------

* Todd - [Couple Questions](http://dpaste.com/195HGHY#wrap)
* Seth - [Tar Snap](http://dpaste.com/1N7NQVQ#wrap)
* Alex - [sudo question](http://dpaste.com/3D9P1DW#wrap)
* Thomas - [FreeBSD on ARM?](http://dpaste.com/24NMG47#wrap)
* Albert - [Austria BSD User Group](http://dpaste.com/373CRX7#wrap)

---