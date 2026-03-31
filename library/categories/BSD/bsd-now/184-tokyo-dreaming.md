+++
title = "184: Tokyo Dreaming"
description = "This week on BSDNow, Allan and I are in Tokyo for AsiaBSDCon, but not to worry, we have a full episode lined up and ready to go. Hackathon reportsThis episode was brought to you by[iXsystems - Enterprise Servers and Storage for Open Source](http://www."
date = "2017-03-08T13:00:00Z"
url = "https://www.bsdnow.tv/184"
author = "feedback@bsdnow.tv (JT Pennington)"
text = ""
lastupdated = "2026-03-26T14:37:50.943178833Z"
seen = true
+++

This week on BSDNow, Allan and I are in Tokyo for AsiaBSDCon, but not to worry, we have a full episode lined up and ready to go. Hackathon reports

This episode was brought to you by
----------

[![iXsystems - Enterprise Servers and Storage for Open Source](/images/1.png)](http://www.ixsystems.com/bsdnow)[ href="http://www.digitalocean.com/" title="DigitalOcean"\>![DigitalOcean - Simple Cloud Hosting, Built for Developers](/images/2.png)]()[ href="http://www.tarsnap.com/bsdnow" title="Tarsnap"\>![Tarsnap - Online Backups for the Truly Paranoid](/images/3.png)]()

---

Headlines
----------

### OpenBSD A2k17 hackathon reports ###

* [a2k17 hackathon report: Patrick Wildt on the arm64 port](http://undeadly.org/cgi?action=article&sid=20170131101827)
* [a2k17 hackathon report: Antoine Jacoutot on syspatch, rc.d improvements and more](http://undeadly.org/cgi?action=article&sid=20170203232049)
* [a2k17 hackathon report: Martin Pieuchot on NET\_LOCK and much more ](http://undeadly.org/cgi?action=article&sid=20170127154356)
* [a2k17 hackathon report: Kenneth Westerback on the hidden wonders of the build system, the network stack and more ](http://undeadly.org/cgi?action=article&sid=20170127031836)
* [a2k17 hackathon report: Bob Beck on LibreSSL progress and more ](http://undeadly.org/cgi?action=article&sid=20170125225403) \*\*\*

### [NetBSD is now reproducible ](https://blog.netbsd.org/tnf/entry/netbsd_fully_reproducible_builds) ###

* Christos Zoulas posts to the NetBSD blog that he has completed his project to make fully reproducible NetBSD builds for amd64 and sparc64

>
>
> I have been working on and off for almost a year trying to get reproducible builds (the same source tree always builds an identical cdrom) on NetBSD. I did not think at the time it would take as long or be so difficult, so I did not keep a log of all the changes I needed to make. I was also not the only one working on this. Other NetBSD developers have been making improvements for the past 6 years. I would like to acknowledge the NetBSD build system (aka build.sh) which is a fully portable cross-build system. This build system has given us a head-start in the reproducible builds work.
>
>
>
> I would also like to acknowledge the work done by the Debian folks who have provided a platform to run, test and analyze reproducible builds. Special mention to the diffoscope tool that gives an excellent overview of what's different between binary files, by finding out what they are (and if they are containers what they contain) and then running the appropriate formatter and diff program to show what's different for each file.
>
>
>
> Finally other developers who have started, motivated and did a lot of work getting us here like Joerg Sonnenberger and Thomas Klausner for their work on reproducible builds, and Todd Vierling and Luke Mewburn for their work on build.sh.
>
>

* Some of the stumbling blocks that were overcome:
  * Timestamps
  * Date/time/author embedded in source files
  * Timezone sensitive code
  * Directory order / build order
  * Non-sanitized data stored in files
  * Symbolic links / paths
  * General tool inconsistencies: including gcc profiling, the fact that GPT partition tables, are by definition, globally unique each time they are created, and the iso9660 standard calls for a timestamp with a timezone.
  * Toolchain
  * Build information / tunables / environment. NetBSD now has a knob ‘MKREPRO’, if set to YES it sets a long list of variables to a consistent set of a values.

* The post walks through how these problems where solves
* Future Work:
  * Vary more parameters and find more inconsistencies
  * Verify that cross-building is reproducible
  * Verify that unprivileged builds are reproducible
  * Test on other platforms \*\*\*

### [Features are faults redux](http://www.tedunangst.com/flak/post/features-are-faults-redux) ###

* From Ted Unangst

>
>
> Last week I gave a talk for the security class at Notre Dame based on features are faults but with some various commentary added. It was an exciting trip, with the opportunity to meet and talk with the computer vision group as well. Some other highlights include the Indiana skillet I had for breakfast, which came with pickles and was amazing, and explaining the many wonders of cvs to the Linux users group over lunch. After that came the talk, which went a little something like this.
>
>
>
> I got started with OpenBSD back about the same time I started college, although I had a slightly different perspective then. I was using OpenBSD because it included so many security features, therefore it must be the most secure system, right? For example, at some point I acquired a second computer. What’s the first thing anybody does when they get a second computer? That’s right, set up a kerberos domain. The idea that more is better was everywhere. This was also around the time that ipsec was getting its final touches, and everybody knew ipsec was going to be the most secure protocol ever because it had more options than any other secure transport. We’ll revisit this in a bit.
>
>
>
> There’s been a partial attitude adjustment since then, with more people recognizing that layering complexity doesn’t result in more security. It’s not an additive process. There’s a whole talk there, about the perfect security that people can’t or won’t use. OpenBSD has definitely switched directions, including less code, not more. All the kerberos code was deleted a few years ago.
>
>
>
> Let’s assume about one bug per 100 lines of code. That’s probably on the low end. Now say your operating system has 100 million lines of code. If I’ve done the math correctly, that’s literally a million bugs. So that’s one reason to avoid adding features. But that’s a solveable problem. If we pick the right language and the right compiler and the right tooling and with enough eyeballs and effort, we can fix all the bugs. We know how to build mostly correct software, we just don’t care.
>
>
>
> As we add features to software, increasing its complexity, new unexpected behaviors start to emerge. What are the bounds? How many features can you add before craziness is inevitable? We can make some guesses. Less than a thousand for sure. Probably less than a hundred? Ten maybe? I’ll argue the answer is quite possibly two. Interesting corollary is that it’s impossible to have a program with exactly two features. Any program with two features has at least a third, but you don’t know what it is
>
>
>
> My first example is a bug in the NetBSD ftp client. We had one feature, we added a second feature, and just like that we got a [third misfeature](http://marc.info/?l=oss-security&m=141451507810253&w=2)
>
>
>
> Our story begins long ago. The origins of this bug are probably older than I am. In the dark times before the web, FTP sites used to be a pretty popular way of publishing files. You run an ftp client, connect to a remote site, and then you can browse the remote server somewhat like a local filesystem. List files, change directories, get files. Typically there would be a README file telling you what’s what, but you don’t need to download a copy to keep. Instead we can pipe the output to a program like more. Right there in the ftp client. No need to disconnect.
>
>
>
> Fast forward a few decades, and http is the new protocol of choice. http is a much less interactive protocol, but the ftp client has some handy features for batch downloads like progress bars, etc. So let’s add http support to ftp. This works pretty well. Lots of code reused.
>
>
>
> http has one quirk however that ftp doesn’t have. Redirects. The server can redirect the client to a different file. So now you’re thinking, what happens if I download [http://somefile](http://somefile) and the server sends back 302 http://|reboot. ftp reconnects to the server, gets the 200, starts downloading and saves it to a file called |reboot. Except it doesn’t. The function that saves files looks at the first character of the name and if it’s a pipe, runs that command instead. And now you just rebooted your computer. Or worse.
>
>
>
> It’s pretty obvious this is not the desired behavior, but where exactly did things go wrong? Arguably, all the pieces were working according to spec. In order to see this bug coming, you needed to know how the save function worked, you needed to know about redirects, and you needed to put all the implications together.
>
>

* The post then goes into a lot more detail about other issues. We just don’t have time to cover it all today, but you should go read it, it is very enlightening

>
>
> What do we do about this? That’s a tough question. It’s much easier to poke fun at all the people who got things wrong. But we can try. My attitudes are shaped by experiences with the OpenBSD project, and I think we are doing a decent job of containing the complexity. Keep paring away at dependencies and reducing interactions. As a developer, saying “no” to all feature requests is actually very productive. It’s so much faster than implementing the feature. Sometimes users complain, but I’ve often received later feedback from users that they’d come to appreciate the simplicity.
>
>
>
> There was a question about which of these vulnerabilities were found by researchers, as opposed to troublemakers. The answer was most, if not all of them, but it made me realize one additional point I hadn’t mentioned. Unlike the prototypical buffer overflow vulnerability, exploiting features is very reliable. Exploiting something like shellshock or imagetragick requires no customized assembly and is independent of CPU, OS, version, stack alignment, malloc implementation, etc. Within about 24 hours of the initial release of shellshock, I had logs of people trying to exploit it. So unless you’re on about a 12 hour patch cycle, you’re going to have a bad time.
>
>
> ---
>

### [reimplement zfsctl (.zfs) support](https://svnweb.freebsd.org/changeset/base/314048) ###

* avg@ (Andriy Gapon) has rewritten the .zfs support in FreeBSD

>
>
> The current code is written on top of GFS, a library with the generic support for writing filesystems, which was ported from Illumos. Because of significant differences between illumos VFS and FreeBSD VFS models, both the GFS and zfsctl code were heavily modified to work on FreeBSD. Nonetheless, they still contain quite a few ugly hacks and bugs.
>
>
>
> This is a reimplementation of the zfsctl code where the VFS-specific bits are written from scratch and only the code that interacts with the rest of ZFS is reused.
>
>
>
> Some ideas are picked from an independent work by Will (wca@)
>
>

* This work improves the overall quality of the ZFS port to FreeBSD

>
>
> The code that provides support for ZFS .zfs/ directory functionality has been reimplemented. It is no longer possible to create a snapshot by mkdir under .zfs/snapshot/. That should be the only user visible change.
>
>

* TIL: On IllumOS, you can create, rename, and destroy snapshots, by manipulating the virtual directories in the .zfs/snapshots directory.

* If enough people would find this feature useful, maybe it could be implemented (rm and rename have never existed on FreeBSD). At the same time, it seems like rather a lot of work, when the ZFS command line tools work so well. Although wca@ pointed out on IRC, it can be useful to be able to create a snapshot over NFS, or SMB.

  ---

Interview - Konrad Witaszczyk - [def@freebsd.org](mailto:def@freebsd.org)
----------

* Encrypted Kernel Crash Dumps \*\*\*

News Roundup
----------

### [PBKDF2 Performance improvements on FreeBSD](https://svnweb.freebsd.org/changeset/base/313962) ###

* [Joe Pixton did some research](https://jbp.io/2015/08/11/pbkdf2-performance-matters/) and found that, because of the way the spec is written, most PBKDF2 implementations are 2x slower than they need to be.
* Since the PBKDF is used to derive a key, used for encryption, this poses a problem. The attacker can derive a key twice as fast as you can. On FreeBSD the PBKDF2 was configured to derive a SHA512-HMAC key that would take approximately 2 seconds to calculate. That is 2 seconds on one core. So an attacker can calculate the same key in 1 second, and use many cores.
* Luckily, 1 second is still a long time for each brute force guess. On modern CPUs with the fast algorithm, you can do about 500,000 iterations of PBKDF per second (per core).
* Until a recent change, OpenBSD used only 8192 iterations. It now uses a similar benchmark of \~2 seconds, and uses bcrypt instead of a SHA1-HMAC.
* Joe’s research showed that the majority of implementations were done the ‘slow’ way. Calculating the initial part of the outer round each iteration, instead of reusing the initial calculation over and over for each round.
* Joe submitted a match to FreeBSD to solve this problem. That patch was improved, and a test of tests were added by jmg@, but then work stalled
* I picked up the work, and fixed some merge conflicts in the patch that had cropped up based on work I had done that moved the HMAC code to a separate file.
* This work is now committed.

>
>
> With this change, all newly generated GELI keys will be approximately 2x as strong. Previously generated keys will take half as long to calculate, resulting in faster mounting of encrypted volumes. Users may choose to rekey, to generate a new key with the larger default number of iterations using the geli(8) setkey command. Security of existing data is not compromised, as \~1 second per brute force attempt is still a very high threshold.
>
>

* If you are interested in the topic, I recommend the video of Joe’s presentation from the Passwords15 conference in Las Vegas \*\*\*

### [Quick How-To: Updating a screenshot in the TrueOS Handbook](https://www.trueos.org/blog/quick-updating-screenshot-trueos-handbook/) ###

* Docs writers, might be time to pay attention. This week we have a good walk-through of adding / updating new screenshots to the TrueOS Sphinx Documentation.
* For those who have not looked in the past, TrueOS and FreeNAS both have fantastic docs by the team over at iXsystems using Sphinx as their doc engine.
* Often we get questions from users asking what “they can do to help” but don’t necessarily have programming skills to apply.
* The good news is that using Sphinx is relatively easy, and after learning some minio rst syntax you can easily help fix, or even contribute to new sections of the TrueOS (Or FreeNAS) documentation.
* In this example, Tim takes us through the process of replacing an old out of date screenshot in the handbook with the latest hotness.
* Starting with a .png file, he then locates the old screenshot name and adds the updated version “lumina-e.png” to “lumina-f.png”. With the file added to the tree, the relevant section of .rst code can be adjusted and the sphinx build run to verify the output HTML looks correct.
* Using this method you can easily start to get involved with other aspects of documentation and next thing you know you’ll be writing boot-loaders like Allan! \*\*\*

### [Learn C Programming With 9 Excellent Open Source Books](https://www.ossblog.org/learn-c-programming-with-9-excellent-open-source-books/) ###

* Now that you’ve easily mastered all your documentation skills, you may be ready to take on a new challenge. (Come on, that boot-loader isn’t going to write itself!)
* We wanted to point out some excellent resources to get you started on your journey into writing C.
* Before you think, “oh, more books to purchase”, wait there’s good news. These are the top-9 open-source books that you can download in digital form free of charge. Now I bet we got your attention.
* We start the rundown with “The C Book”, by Mike Banahan, Declan Brady and Mark Doran, which will lay the groundwork with your introduction into the C language and concepts.
* Next up, if you are going to do anything, do it with style, so take a read through the “C Elements of Style” which will make you popular at all the parties. (We can’t vouch for that statement)
* From here we have a book on using C to build your own minimal “lisp” interpreter, reference guides on GNU C and some other excellent introduction / mastery books to help round-out your programming skill set.
* Your C adventure awaits, hopefully these books can not only teach you good C, but also make you feel confident when looking at bits of the FreeBSD world or kernel with a proper foundation to back it up. \*\*\*

### [Running a Linux VM on OpenBSD](http://eradman.com/posts/linuxvm-on-openbsd.html) ###

* Over the past few years we’ve talked a lot about Virtualization, Bhyve or OpenBSD’s ‘vmm’, but qemu hasn’t gotten much attention.
* Today we have a blog post with details on how to deploy qemu to run Linux on top of an OpenBSD host system.
* The starts by showing us how to first provision the storage for qemu, using the handy ‘qemu-img’ command, which in this example only creates a 4GB disk, you’ll probably want more for real-world usage though.
* Next up the qemu command will be run, pay attention to the particular flags for network and memory setup. You’ll probably want to bump it up past the recommended 256M of memory.
* Networking is always the fun part, as the author describes his intended setup

>
>
> I want OpenBSD and Debian to be able to obtain an IP via DHCP on their wired interfaces and I don't want external networking required for an NFS share to the VM. To accomplish this I need two interfaces since dhclient will erase any other IPv4 addresses already assigned. We can't assign an address directly to the bridge, but we can configure a virtual Ethernet device and add it.
>
>

* The setup for this portion involves touching a few more files, but isn’t that painless. Some “pf” rules to enable NAT for and dhcpd setup to assign a “fixed” IP to the vm will get us going, along with some additional details on how to configure the networking for inside the debian VM.
* Once those steps are completed you should be able to mount NFS and share data from the host to the VM painlessly.

---

Beastie Bits
----------

* [MacObserver: Interview with Open Source Developer & Former Apple Manager Jordan Hubbard ](https://www.macobserver.com/podcasts/background-mode-jordan-hubbard/)

* [2016 Google Summer of Code Mentor Summit and MeetBSD Trip Report: Gavin Atkinson](https://www.freebsdfoundation.org/blog/2016-google-summer-of-code-mentor-summit-and-meetbsd-trip-report-gavin-atkinson/)

---

Feedback/Questions
----------

* [ Joe - BGP / Vultr Followup](http://pastebin.com/TNyHBYwT)
* [ Ryan Moreno asks about Laptops ](http://pastebin.com/s4Ypezsz) \*\*\*