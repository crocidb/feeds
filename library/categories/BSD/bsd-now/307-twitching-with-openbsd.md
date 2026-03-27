+++
title = "307: Twitching with OpenBSD"
description = "FreeBSD 11.3 has been released, OpenBSD workstation, write your own fuzzer for the NetBSD kernel, Exploiting FreeBSD-SA-19:02.fd, streaming to twitch using OpenBSD, 3 different ways of dumping hex contents of a file, and more.Headlines[FreeBSD 11.3-RELEASE Announcem"
date = "2019-07-18T14:00:00Z"
url = "https://www.bsdnow.tv/307"
author = "feedback@bsdnow.tv (JT Pennington)"
text = ""
lastupdated = "2026-03-26T14:37:50.620755090Z"
seen = false
+++

FreeBSD 11.3 has been released, OpenBSD workstation, write your own fuzzer for the NetBSD kernel, Exploiting FreeBSD-SA-19:02.fd, streaming to twitch using OpenBSD, 3 different ways of dumping hex contents of a file, and more.

Headlines
----------

### [FreeBSD 11.3-RELEASE Announcement](https://www.freebsd.org/releases/11.3R/announce.html) ###

>
>
> The FreeBSD Release Engineering Team is pleased to announce the availability of FreeBSD 11.3-RELEASE. This is the fourth release of the stable/11 branch.
>
>

* Some of the highlights:
  * The clang, llvm, lld, lldb, and compiler-rt utilities as well as libc++ have been updated to upstream version 8.0.0.
  * The ELF Tool Chain has been updated to version r3614.
  * OpenSSL has been updated to version 1.0.2s.
  * The ZFS filesystem has been updated to implement parallel mounting.
  * The loader(8) has been updated to extend geli(8) support to all architectures.
  * The pkg(8) utility has been updated to version 1.10.5.
  * The KDE desktop environment has been updated to version 5.15.3.
  * The GNOME desktop environment has been updated to version 3.28.
  * The kernel will now log the jail(8) ID when logging a process exit.
  * Several feature additions and updates to userland applications.
  * Several network driver firmware updates.
  * Warnings for features deprecated in future releases will now be printed on all FreeBSD versions.
  * Warnings have been added for IPSec algorithms deprecated in RFC 8221.
  * Deprecation warnings have been added for weaker algorithms when creating geli(8) providers.
  * And more...

---

### [OpenBSD Is Now My Workstation](https://sogubsys.com/openbsd-is-now-my-workstation-operating-system/) ###

>
>
> Why OpenBSD? Simply because it is the best tool for the job for me for my new-to-me Lenovo Thinkpad T420. Additionally, I do care about security and non-bloat in my personal operating systems (business needs can have different priorities, to be clear).
>
>
>
> I will try to detail what my reasons are for going with OpenBSD (instead of GNU/Linux, NetBSD, or FreeBSD of which I’m comfortable using without issue), challenges and frustrations I’ve encountered, and what my opinions are along the way.
>
>
>
> Disclaimer: in this post, I’m speaking about what is my opinion, and I’m not trying to convince you to use OpenBSD or anything else. I don’t truly care, but wanted to share in case it could be useful to you. I do hope you give OpenBSD a shot as your workstation, especially if it has been a while.
>
>

* A Bit About Me and OpenBSD

>
>
> I’m not new to OpenBSD, to be clear. I’ve been using it off and on for over 20 years. The biggest time in my life was the early 2000s (I was even the Python port maintainer for a bit), where I not only used it for my workstation, but also for production servers and network devices.
>
>
>
> I just haven’t used it as a workstation (outside of a virtual machine) in over 10 years, but have used it for servers. Workstation needs, especially for a primary workstation, are greatly different and the small things end up mattering most.
>
>

---

News Roundup
----------

### [Write your own fuzzer for NetBSD kernel! [Part 1]](https://blog.netbsd.org/tnf/entry/write_your_own_fuzzer_for) ###

* How Fuzzing works? The dummy Fuzzer.

>
>
> The easy way to describe fuzzing is to compare it to the process of unit testing a program, but with different input. This input can be random, or it can be generated in some way that makes it unexpected form standard execution perspective.
>
>
>
> The simplest 'fuzzer' can be written in few lines of bash, by getting N bytes from /dev/rand, and putting them to the program as a parameter.
>
>

* Coverage and Fuzzing

>
>
> What can be done to make fuzzing more effective? If we think about fuzzing as a process, where we place data into the input of the program (which is a black box), and we can only interact via input, not much more can be done.
>
>
>
> However, programs usually process different inputs at different speeds, which can give us some insight into the program's behavior. During fuzzing, we are trying to crash the program, thus we need additional probes to observe the program's behaviour.
>
>
>
> Additional knowledge about program state can be exploited as a feedback loop for generating new input vectors. Knowledge about the program itself and the structure of input data can also be considered. As an example, if the input data is in the form of HTML, changing characters inside the body will probably cause less problems for the parser than experimenting with headers and HTML tags.
>
>
>
> For open source programs, we can read the source code to know what input takes which execution path. Nonetheless, this might be very time consuming, and it would be much more helpful if this can be automated. As it turns out, this process can be improved by tracing coverage of the execution
>
>

---

### [vBSDcon - CFP - Call for Papers ends July 19th](https://vbsdcon.com/) ###

>
>
> You can submit your proposal at [https://easychair.org/conferences/?conf=vbsdcon2019](https://easychair.org/conferences/?conf=vbsdcon2019)
>
>
>
> The talks will have a very strong technical content bias. Proposals of a business development or marketing nature are not appropriate for this venue.
>
>
>
> If you are doing something interesting with a BSD operating system, please submit a proposal. Whether you are developing a very complex system using BSD as the foundation, or helping others and have a story to tell about how BSD played a role, we want to hear about your experience. People using BSD as a platform for research are also encouraged to submit a proposal.
>
>
>
> Possible topics include: How we manage a giant installation with respect to handling spam, snd/or sysadmin, and/or networking, Cool new stuff in BSD, Tell us about your project which runs on BSD.
>
>
>
> Both users and developers are encouraged to share their experiences.
>
>

---

### [Exploiting FreeBSD-SA-19:02.fd](https://secfault-security.com/blog/FreeBSD-SA-1902.fd.html) ###

>
>
> In February 2019 the FreeBSD project issued an advisory about a possible vulnerability in the handling of file descriptors. UNIX-like systems such as FreeBSD allow to send file descriptors to other processes via UNIX-domain sockets. This can for example be used to pass file access privileges to the receiving process.
>
>
>
> Inside the kernel, file descriptors are used to indirectly reference a C struct which stores the relevant information about the file object. This could for instance include a reference to a vnode which describes the file for the file system, the file type, or the access privileges.
>
>
>
> What really happens if a UNIX-domain socket is used to send a file descriptor to another process is that for the receiving process, inside the kernel a reference to this struct is created. As the new file descriptor is a reference to the same file object, all information is inherited. For instance, this can allow to give another process write access to a file on the drive even if the process owner is normally not able to open the file writable.
>
>
>
> The advisory describes that FreeBSD 12.0 introduced a bug in this mechanism. As the file descriptor information is sent via a socket, the sender and the receiver have to allocate buffers for the procedure. If the receiving buffer is not large enough, the FreeBSD kernel attempts to close the received file descriptors to prevent a leak of these to the sender. However, while the responsible function closes the file descriptor, it fails to release the reference from the file descriptor to the file object. This could cause the reference counter to wrap.
>
>
>
> The advisory further states that the impact of this bug is possibly a local privilege escalation to gain root privileges or a jail escape. However, no proof-of-concept was provided by the advisory authors.
>
>

* In the next section, the bug itself is analyzed to make a statement about the bug class and a guess about a possible exploitation primitive.
* After that, the bug trigger is addressed.
* It follows a discussion of three imaginable exploitation strategies - including a discussion of why two of these approaches failed.
* In the section before last, the working exploit primitive is discussed. It introduces a (at least to the author’s knowledge) new exploitation technique for these kind of vulnerabilities in FreeBSD. The stabilization of the exploit is addressed, too.
* The last section wraps everything up in a conclusion and points out further steps and challenges.

>
>
> The privilege escalation is now a piece of cake thanks to a technique used by kingcope, who published a FreeBSD root exploit in 2005, which writes to the file /etc/libmap.conf. This configuration file can be used to hook the loading of dynamic libraries if a program is started. The exploit therefore creates a dynamic library, which copies /bin/sh to another file and sets the suid-bit for the copy. The hooked library is libutil, which is for instance called by su. Therefore, a call to su by the user will afterwards result in a suid copy of /bin/sh.
>
>

---

### [Streaming to Twitch using OpenBSD](https://dataswamp.org/~solene/2019-07-06-twitch.html) ###

* Introduction

>
>
> If you ever wanted to make a twitch stream from your OpenBSD system, this is now possible, thanks to OpenBSD developer thfr@ who made a wrapper named fauxstream using ffmpeg with relevant parameters.
>
>
>
> The setup is quite easy, it only requires a few steps and searching on Twitch website two informations, hopefully, to ease the process, I found the links for you.
>
>
>
> You will need to make an account on twitch, get your api key (a long string of characters) which should stay secret because it allow anyone having it to stream on your account.
>
>

* These same techniques should work for Twitch, YouTube Live, Periscope, Facebook, etc, including the live streaming service ScaleEngine provides free to BSD user groups.
* There is also an open source application called ‘OBS’ or Open Broadcaster Studio. It is in FreeBSD ports and should work on all of the other BSDs as well. It has a GUI and supports compositing and green screening. We use it heavily at ScaleEngine and it is also used at JupiterBroadcasting in place of WireCast, a $1000-per-copy commercial application.

---

Beastie Bits
----------

* [Portland BSD Pizza Night - 2019-07-25 19:00 - Rudy's Gourmet Pizza](http://calagator.org/events/1250475868)
* [KnoxBUG - Michael W. Lucas : Twenty Years in Jail](http://knoxbug.org/2019-07-29)
* [Ohio Linuxfest - CFP - Closes August 17th](https://ohiolinux.org/call-for-presentations/)
* [My college (NYU Tandon) is moving their CS department and I saw this on a shelf being moved](https://old.reddit.com/r/freebsd/comments/cdx8fp/my_college_nyu_tandon_is_moving_their_cs/)
* [3 different ways of dumping hex contents of a file](https://moopost.blogspot.com/2019/07/3-different-ways-of-dumping-hex.html)

---

Feedback/Questions
----------

* Sebastian - [ZFS setup toward ESXi](http://dpaste.com/0DRKFH6#wrap)
* Christopher - [Questions](http://dpaste.com/2YNN1SH)
* Ser - [Bhyve and Microsoft SQL](http://dpaste.com/1F5TMT0#wrap)

---

* Send questions, comments, show ideas/topics, or stories you want mentioned on the show to [feedback@bsdnow.tv](mailto:feedback@bsdnow.tv)

---
 Your browser does not support the HTML5 video tag.