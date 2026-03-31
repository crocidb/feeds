+++
title = "Episode 273: A Thoughtful Episode | BSD Now 273"
description = 'Thoughts on NetBSD 8.0, Monitoring love for a GigaBit OpenBSD firewall, cat’s source history, X.org root permission bug, thoughts on OpenBSD as a desktop, and NomadBSD review.\Headlines   \[Some thoughts on NetBSD 8.0](https://distrowatch.com/weekly.php?issue=20181119netbsd'
date = "2018-11-23T07:00:00Z"
url = "https://www.bsdnow.tv/273"
author = "feedback@bsdnow.tv (JT Pennington)"
text = ""
lastupdated = "2026-03-26T14:37:50.687286279Z"
seen = true
+++

Thoughts on NetBSD 8.0, Monitoring love for a GigaBit OpenBSD firewall, cat’s source history, X.org root permission bug, thoughts on OpenBSD as a desktop, and NomadBSD review.

\##Headlines  
 \###[Some thoughts on NetBSD 8.0](https://distrowatch.com/weekly.php?issue=20181119#netbsd)

>
>
> NetBSD is a highly portable operating system which can be run on dozens of different hardware architectures. The operating system’s clean and minimal design allow it to be run in all sorts of environments, ranging from embedded devices, to servers, to workstations. While the base operating system is minimal, NetBSD users have access to a large repository of binary packages and a ports tree which I will touch upon later.  
>  I last tried NetBSD 7.0 about three years ago and decided it was time to test drive the operating system again. In the past three years NetBSD has introduced a few new features, many of them security enhancements. For example, NetBSD now supports write exclusive-or execute (W^X) protection and address space layout randomization (ASLR) to protect programs against common attacks. NetBSD 8.0 also includes USB3 support and the ability to work with ZFS storage volumes.
>
>

* Early impressions

>
>
> Since I had set up NetBSD with a Full install and enabled xdm during the setup process, the operating system booted to a graphical login screen. From here we can sign into our account. The login screen does not provide options to shut down or restart the computer. Logging into our account brings up the twm window manager and provides a virtual terminal, courtesy of xterm. There is a panel that provides a method for logging out of the window manager. The twm environment is sparse, fast and devoid of distractions.
>
>

* Software management

>
>
> NetBSD ships with a fairly standard collection of command line tools and manual pages, but otherwise it is a fairly minimal platform. If we want to run network services, have access to a web browser, or use a word processor we are going to need to install more software. There are two main approaches to installing new packages. The first, and easier approach, is to use the pkgin package manager. The pkgin utility works much the same way APT or DNF work in the Linux world, or as pkg works on FreeBSD. We can search for software by name, install or remove items. I found pkgin worked well, though its output can be terse. My only complaint with pkgin is that it does not handle “close enough” package names. For example, if I tried to run “pkgin install vlc” or “pkgin install firefox” I would quickly be told these items did not exist. But a more forgiving package manager will realize items like vlc2 or firefox45 are available and offer to install those.  
>  The pkgin tool installs new programs in the /usr/pkg/bin directory. Depending on your configuration and shell, this location may not be in your user’s path, and it will be helpful to adjust your PATH variable accordingly.  
>  The other common approach to acquiring new software is to use the pkgsrc framework. I have talked about using pkgsrc before and I will skip the details. Basically, we can download a collection of recipes for building popular open source software and run a command to download and install these items from their source code. Using pkgsrc basically gives us the same software as using pkgin would, but with some added flexibility on the options we use.  
>  Once new software has been installed, it may need to be enabled and activated, particularly if it uses (or is) a background service. New items can be enabled in the /etc/rc.conf file and started or stopped using the service command. This works about the same as the service command on FreeBSD and most non-systemd Linux distributions.
>
>

* Hardware

>
>
> I found that, when logged into the twm environment, NetBSD used about 130MB of RAM. This included kernel memory and all active memory. A fresh, Full install used up 1.5GB of disk space. I generally found NetBSD ran well in both VirtualBox and on my desktop computer. The system was quick and stable. I did have trouble getting a higher screen resolution in both environments. NetBSD does not offer VirtualBox add-on modules. There are NetBSD patches for VirtualBox out there, but there is some manual work involved in getting them working. When running on my desktop computer I think the resolution issue was one of finding and dealing with the correct video driver. Screen resolution aside, NetBSD performed well and detected all my hardware.
>
>

* Personal projects

>
>
> Since NetBSD provides users with a small, core operating system without many utilities if we want to use NetBSD for something we need to have a project in mind. I had four mini projects in mind I wanted to try this week: install a desktop environment, enable file sharing for computers on the local network, test multimedia (video, audio and YouTube capabilities), and set up a ZFS volume for storage.  
>  I began with the desktop. Specifically, I followed the same tutorial I used three years ago to try to set up the Xfce desktop. While Xfce and its supporting services installed, I was unable to get a working desktop out of the experience. I could get the Xfce window manager working, but not the entire session. This tutorial worked beautifully with NetBSD 7.0, but not with version 8.0. Undeterred, I switched gears and installed Fluxbox instead. This gave me a slightly more powerful graphical environment than what I had before with twm while maintaining performance. Fluxbox ran without any problems, though its application menu was automatically populated with many programs which were not actually installed.  
>  Next, I tried installing a few multimedia applications to play audio and video files. Here I ran into a couple of interesting problems. I found the music players I installed would play audio files, but the audio was quite slow. It always sounded like a cassette tape dragging. When I tried to play a video, the entire graphical session would crash, taking me back to the login screen. When I installed Firefox, I found I could play YouTube videos, and the video played smoothly, but again the audio was unusually slow.  
>  I set up two methods of sharing files on the local network: OpenSSH and FTP. NetBSD basically gives us OpenSSH for free at install time and I added an FTP server through the pkgin package manager which worked beautifully with its default configuration.  
>  I experimented with ZFS support a little, just enough to confirm I could create and access ZFS volumes. ZFS seems to work on NetBSD just as well, and with the same basic features, as it does on FreeBSD and mainstream Linux distributions. I think this is a good feature for the portable operating system to have since it means we can stick NetBSD on nearly any networked computer and use it as a NAS.
>
>

* Conclusions

>
>
> NetBSD, like its close cousins (FreeBSD and OpenBSD) does not do a lot of hand holding or automation. It offers a foundation that will run on most CPUs and we can choose to build on that foundation. I mention this because, on its own, NetBSD does not do much. If we want to get something out of it, we need to be willing to build on its foundation - we need a project. This is important to keep in mind as I think going into NetBSD and thinking, “Oh I’ll just explore around and expand on this as I go,” will likely lead to disappointment. I recommend figuring out what you want to do before installing NetBSD and making sure the required tools are available in the operating system’s repositories.  
>  Some of the projects I embarked on this week (using ZFS and setting up file sharing) worked well. Others, like getting multimedia support and a full-featured desktop, did not. Given more time, I’m sure I could find a suitable desktop to install (along with the required documentation to get it and its services running), or customize one based on one of the available window managers. However, any full featured desktop is going to require some manual work. Media support was not great. The right players and codecs were there, but I was not able to get audio to play smoothly.  
>  My main complaint with NetBSD relates to my struggle to get some features working to my satisfaction: the documentation is scattered. There are four different sections of the project’s website for documentation (FAQs, The Guide, manual pages and the wiki). Whatever we are looking for is likely to be in one of those, but which one? Or, just as likely, the tutorial we want is not there, but is on a forum or blog somewhere. I found that the documentation provided was often thin, more of a quick reference to remind people how something works rather than a full explanation.  
>  As an example, I found a couple of documents relating to setting up a firewall. One dealt with networking NetBSD on a LAN, another explored IPv6 support, but neither gave an overview on syntax or a basic guide to blocking all but one or two ports. It seemed like that information should already be known, or picked up elsewhere.  
>  Newcomers are likely to be a bit confused by software management guides for the same reason. Some pages refer to using a tool called pkg\_add, others use pkgsrc and its make utility, others mention pkgin. Ultimately, these tools each give approximately the same result, but work differently and yet are mentioned almost interchangeably. I have used NetBSD before a few times and could stumble through these guides, but new users are likely to come away confused.  
>  One quirk of NetBSD, which may be a security feature or an inconvenience, depending on one’s point of view, is super user programs are not included in regular users’ paths. This means we need to change our path if we want to be able to run programs typically used by root. For example, shutdown and mount are not in regular users’ paths by default. This made checking some things tricky for me.  
>  Ultimately though, NetBSD is not famous for its convenience or features so much as its flexibility. The operating system will run on virtually any processor and should work almost identically across multiple platforms. That gives NetBSD users a good deal of consistency across a range of hardware and the chance to experiment with a member of the Unix family on hardware that might not be compatible with Linux or the other BSDs.
>
>

---

\###[Showing a Gigabit OpenBSD Firewall Some Monitoring Love](https://tech.mangot.com/blog/2018/11/08/showing-a-gigabit-openbsd-firewall-some-monitoring-love/)

>
>
> I have a pretty long history of running my home servers or firewalls on “exotic” hardware. At first, it was Sun Microsystem hardware, then it moved to the excellent Soekris line, with some cool single board computers thrown in the mix. Recently I’ve been running OpenBSD Octeon on the Ubiquiti Edge Router Lite, an amazing little piece of kit at an amazing price point.
>
>

* Upgrade Time!

>
>
> This setup has served me for some time and I’ve been extremely happy with it. But, in the #firstworldproblems category, I recently upgraded the household to the amazing Gigabit fibre offering from Sonic. A great problem to have, but also too much of a problem for the little Edge Router Lite (ERL).  
>  The way the OpenBSD PF firewall works, it’s only able to process packets on a single core. Not a problem for the dual-core 500 MHz ERL when you’re pushing under \~200 Mbps, but more of a problem when you’re trying to push 1000 Mbps.  
>  I needed something that was faster on a per core basis but still satisfied my usual firewall requirements. Loosely:
>
>

* small form factor
* fan-less
* multiple Intel Ethernet ports (good driver support)
* low power consumption
* not your regular off-the-shelf kit
* relatively inexpensive

>
>
> After evaluating a LOT of different options I settled on the Protectli Vault FW2B. With the specs required for the firewall (2 GB RAM and 8 GB drive) it comes in at a mere $239 USD! Installation of OpenBSD 6.4 was pretty straight forward, with the only problem I had was Etcher did not want to recognize the ‘.fs’ extension on the install image as bootable image. I quickly fixed this with good old Unix dd(1) on the Mac. Everything else was incredibly smooth.  
>  After loading the same rulesets on my new install, the results were fantastic!
>
>

* Monitoring

>
>
> Now that the machine was up and running (and fast!), I wanted to know what it was doing. Over the years, I’ve always relied on the venerable pfstat software to give me an overview of my traffic, blocked packets, etc. It looks like this:  
>  As you can see it’s based on RRDtool, which was simply incredible in its time. Having worked on monitoring almost continuously for almost the past decade, I wanted to see if we could re-implement the same functionality using more modern tools as RRDtool and pfstat definitely have their limitations. This might be an opportunity to learn some new things as well.  
>  I came across pf-graphite which seemed to be a great start! He had everything I needed and I added a few more stats from the detailed interface statistics and the ability for the code to exit for running from cron(8), which is a bit more OpenBSD style. I added code for sending to some SaaS metrics platforms but ultimately stuck with straight Graphite. One important thing to note was to use the Graphite pickle port (2004) instead of the default plaintext port for submission. Also you will need to set a loginterface in your ‘pf.conf’.  
>  A bit of tweaking with Graphite and Grafana, and I had a pretty darn good recreation of my original PF stats dashboard!  
>  As you can see it’s based on RRDtool, which was simply incredible in its time. Having worked on monitoring almost continuously for almost the past decade, I wanted to see if we could re-implement the same functionality using more modern tools as RRDtool and pfstat definitely have their limitations. This might be an opportunity to learn some new things as well.  
>  I came across pf-graphite which seemed to be a great start! He had everything I needed and I added a few more stats from the detailed interface statistics and the ability for the code to exit for running from cron(8), which is a bit more OpenBSD style. I added code for sending to some SaaS metrics platforms but ultimately stuck with straight Graphite. One important thing to note was to use the Graphite pickle port (2004) instead of the default plaintext port for submission. Also you will need to set a loginterface in your ‘pf.conf’.  
>  A bit of tweaking with Graphite and Grafana, and I had a pretty darn good recreation of my original PF stats dashboard!
>
>

\###[The Source History of Cat](https://twobithistory.org/2018/11/12/cat.html)

>
>
> I once had a debate with members of my extended family about whether a computer science degree is a degree worth pursuing. I was in college at the time and trying to decide whether I should major in computer science. My aunt and a cousin of mine believed that I shouldn’t. They conceded that knowing how to program is of course a useful and lucrative thing, but they argued that the field of computer science advances so quickly that everything I learned would almost immediately be outdated. Better to pick up programming on the side and instead major in a field like economics or physics where the basic principles would be applicable throughout my lifetime.  
>  I knew that my aunt and cousin were wrong and decided to major in computer science. (Sorry, aunt and cousin!) It is easy to see why the average person might believe that a field like computer science, or a profession like software engineering, completely reinvents itself every few years. We had personal computers, then the web, then phones, then machine learning… technology is always changing, so surely all the underlying principles and techniques change too. Of course, the amazing thing is how little actually changes. Most people, I’m sure, would be stunned to know just how old some of the important software on their computer really is. I’m not talking about flashy application software, admittedly—my copy of Firefox, the program I probably use the most on my computer, is not even two weeks old. But, if you pull up the manual page for something like grep, you will see that it has not been updated since 2010 (at least on MacOS). And the original version of grep was written in 1974, which in the computing world was back when dinosaurs roamed Silicon Valley. People (and programs) still depend on grep every day.  
>  My aunt and cousin thought of computer technology as a series of increasingly elaborate sand castles supplanting one another after each high tide clears the beach. The reality, at least in many areas, is that we steadily accumulate programs that have solved problems. We might have to occasionally modify these programs to avoid software rot, but otherwise they can be left alone. grep is a simple program that solves a still-relevant problem, so it survives. Most application programming is done at a very high level, atop a pyramid of much older code solving much older problems. The ideas and concepts of 30 or 40 years ago, far from being obsolete today, have in many cases been embodied in software that you can still find installed on your laptop.  
>  I thought it would be interesting to take a look at one such old program and see how much it had changed since it was first written. cat is maybe the simplest of all the Unix utilities, so I’m going to use it as my example. Ken Thompson wrote the original implementation of cat in 1969. If I were to tell somebody that I have a program on my computer from 1969, would that be accurate? How much has cat really evolved over the decades? How old is the software on our computers?  
>  Thanks to repositories like this one, we can see exactly how cat has evolved since 1969. I’m going to focus on implementations of cat that are ancestors of the implementation I have on my Macbook. You will see, as we trace cat from the first versions of Unix down to the cat in MacOS today, that the program has been rewritten more times than you might expect—but it ultimately works more or less the same way it did fifty years ago.
>
>

* Research Unix

>
>
> Ken Thompson and Dennis Ritchie began writing Unix on a PDP 7. This was in 1969, before C, so all of the early Unix software was written in PDP 7 assembly. The exact flavor of assembly they used was unique to Unix, since Ken Thompson wrote his own assembler that added some features on top of the assembler provided by DEC, the PDP 7’s manufacturer. Thompson’s changes are all documented in the original Unix Programmer’s Manual under the entry for as, the assembler.  
>  The first implementation of cat is thus in PDP 7 assembly. I’ve added comments that try to explain what each instruction is doing, but the program is still difficult to follow unless you understand some of the extensions Thompson made while writing his assembler. There are two important ones. First, the ; character can be used to separate multiple statements on the same line. It appears that this was used most often to put system call arguments on the same line as the sys instruction. Second, Thompson added support for “temporary labels” using the digits 0 through 9. These are labels that can be reused throughout a program, thus being, according to the Unix Programmer’s Manual, “less taxing both on the imagination of the programmer and on the symbol space of the assembler.” From any given instruction, you can refer to the next or most recent temporary label n using nf and nb respectively. For example, if you have some code in a block labeled 1:, you can jump back to that block from further down by using the instruction jmp 1b. (But you cannot jump forward to that block from above without using jmp 1f instead.)  
>  The most interesting thing about this first version of cat is that it contains two names we should recognize. There is a block of instructions labeled getc and a block of instructions labeled putc, demonstrating that these names are older than the C standard library. The first version of cat actually contained implementations of both functions. The implementations buffered input so that reads and writes were not done a character at a time.  
>  The first version of cat did not last long. Ken Thompson and Dennis Ritchie were able to persuade Bell Labs to buy them a PDP 11 so that they could continue to expand and improve Unix. The PDP 11 had a different instruction set, so cat had to be rewritten. I’ve marked up this second version of cat with comments as well. It uses new assembler mnemonics for the new instruction set and takes advantage of the PDP 11’s various addressing modes. (If you are confused by the parentheses and dollar signs in the source code, those are used to indicate different addressing modes.) But it also leverages the ; character and temporary labels just like the first version of cat, meaning that these features must have been retained when as was adapted for the PDP 11.  
>  The second version of cat is significantly simpler than the first. It is also more “Unix-y” in that it doesn’t just expect a list of filename arguments—it will, when given no arguments, read from stdin, which is what cat still does today. You can also give this version of cat an argument of - to indicate that it should read from stdin.  
>  In 1973, in preparation for the release of the Fourth Edition of Unix, much of Unix was rewritten in C. But cat does not seem to have been rewritten in C until a while after that. The first C implementation of cat only shows up in the Seventh Edition of Unix. This implementation is really fun to look through because it is so simple. Of all the implementations to follow, this one most resembles the idealized cat used as a pedagogic demonstration in K&R C. The heart of the program is the classic two-liner:
>
>

`while ((c = getc(fi)) != EOF)`  
`putchar(c);`

>
>
> There is of course quite a bit more code than that, but the extra code is mostly there to ensure that you aren’t reading and writing to the same file. The other interesting thing to note is that this implementation of cat only recognized one flag, -u. The -u flag could be used to avoid buffering input and output, which cat would otherwise do in blocks of 512 bytes.
>
>

* BSD

>
>
> After the Seventh Edition, Unix spawned all sorts of derivatives and offshoots. MacOS is built on top of Darwin, which in turn is derived from the Berkeley Software Distribution (BSD), so BSD is the Unix offshoot we are most interested in. BSD was originally just a collection of useful programs and add-ons for Unix, but it eventually became a complete operating system. BSD seems to have relied on the original cat implementation up until the fourth BSD release, known as 4BSD, when support was added for a whole slew of new flags. The 4BSD implementation of cat is clearly derived from the original implementation, though it adds a new function to implement the behavior triggered by the new flags. The naming conventions already used in the file were adhered to—the fflg variable, used to mark whether input was being read from stdin or a file, was joined by nflg, bflg, vflg, sflg, eflg, and tflg, all there to record whether or not each new flag was supplied in the invocation of the program. These were the last command-line flags added to cat; the man page for cat today lists these flags and no others, at least on Mac OS. 4BSD was released in 1980, so this set of flags is 38 years old.  
>  cat would be entirely rewritten a final time for BSD Net/2, which was, among other things, an attempt to avoid licensing issues by replacing all AT&T Unix-derived code with new code. BSD Net/2 was released in 1991. This final rewrite of cat was done by Kevin Fall, who graduated from Berkeley in 1988 and spent the next year working as a staff member at the Computer Systems Research Group (CSRG). Fall told me that a list of Unix utilities still implemented using AT&T code was put up on a wall at CSRG and staff were told to pick the utilities they wanted to reimplement. Fall picked cat and mknod. The cat implementation bundled with MacOS today is built from a source file that still bears his name at the very top. His version of cat, even though it is a relatively trivial program, is today used by millions.  
>  Fall’s original implementation of cat is much longer than anything we have seen so far. Other than support for a -? help flag, it adds nothing in the way of new functionality. Conceptually, it is very similar to the 4BSD implementation. It is only longer because Fall separates the implementation into a “raw” mode and a “cooked” mode. The “raw” mode is cat classic; it prints a file character for character. The “cooked” mode is cat with all the 4BSD command-line options. The distinction makes sense but it also pads out the implementation so that it seems more complex at first glance than it actually is. There is also a fancy error handling function at the end of the file that further adds to its length.
>
>

* MacOS

>
>
> The very first release of Mac OS X thus includes an implementation of cat pulled from the NetBSD project. So the first Mac OS X implementation of cat is Kevin Fall’s cat. The only thing that had changed over the intervening decade was that Fall’s error-handling function err() was removed and the err() function made available by err.h was used in its place. err.h is a BSD extension to the C standard library.  
>  The NetBSD implementation of cat was later swapped out for FreeBSD’s implementation of cat. According to Wikipedia, Apple began using FreeBSD instead of NetBSD in Mac OS X 10.3 (Panther). But the Mac OS X implementation of cat, according to Apple’s own open source releases, was not replaced until Mac OS X 10.5 (Leopard) was released in 2007. The FreeBSD implementation that Apple swapped in for the Leopard release is the same implementation on Apple computers today. As of 2018, the implementation has not been updated or changed at all since 2007.  
>  So the Mac OS cat is old. As it happens, it is actually two years older than its 2007 appearance in MacOS X would suggest. This 2005 change, which is visible in FreeBSD’s Github mirror, was the last change made to FreeBSD’s cat before Apple pulled it into Mac OS X. So the Mac OS X cat implementation, which has not been kept in sync with FreeBSD’s cat implementation, is officially 13 years old. There’s a larger debate to be had about how much software can change before it really counts as the same software; in this case, the source file has not changed at all since 2005.  
>  The cat implementation used by Mac OS today is not that different from the implementation that Fall wrote for the 1991 BSD Net/2 release. The biggest difference is that a whole new function was added to provide Unix domain socket support. At some point, a FreeBSD developer also seems to have decided that Fall’s raw\_args() function and cook\_args() should be combined into a single function called scanfiles(). Otherwise, the heart of the program is still Fall’s code.  
>  I asked Fall how he felt about having written the cat implementation now used by millions of Apple users, either directly or indirectly through some program that relies on cat being present. Fall, who is now a consultant and a co-author of the most recent editions of TCP/IP Illustrated, says that he is surprised when people get such a thrill out of learning about his work on cat. Fall has had a long career in computing and has worked on many high-profile projects, but it seems that many people still get most excited about the six months of work he put into rewriting cat in 1989.
>
>

* The Hundred-Year-Old Program

>
>
> In the grand scheme of things, computers are not an old invention. We’re used to hundred-year-old photographs or even hundred-year-old camera footage. But computer programs are in a different category—they’re high-tech and new. At least, they are now. As the computing industry matures, will we someday find ourselves using programs that approach the hundred-year-old mark?  
>  Computer hardware will presumably change enough that we won’t be able to take an executable compiled today and run it on hardware a century from now. Perhaps advances in programming language design will also mean that nobody will understand C in the future and cat will have long since been rewritten in another language. (Though C has already been around for fifty years, and it doesn’t look like it is about to be replaced any time soon.) But barring all that, why not just keep using the cat we have forever?  
>  I think the history of cat shows that some ideas in computer science are in fact very durable. Indeed, with cat, both the idea and the program itself are old. It may not be accurate to say that the cat on my computer is from 1969. But I could make a case for saying that the cat on my computer is from 1989, when Fall wrote his implementation of cat. Lots of other software is just as ancient. So maybe we shouldn’t think of computer science and software development primarily as fields that disrupt the status quo and invent new things. Our computer systems are built out of historical artifacts. At some point, we may all spend more time trying to understand and maintain those historical artifacts than we spend writing new code.
>
>

---

\##News Roundup  
 \###[Trivial Bug in X.Org Gives Root Permission on Linux and BSD Systems](https://www.bleepingcomputer.com/news/security/trivial-bug-in-xorg-gives-root-permission-on-linux-and-bsd-systems/)

>
>
> A vulnerability that is trivial to exploit allows privilege escalation to root level on Linux and BSD distributions using [X.Org](http://X.Org) server, the open source implementation of the X Window System that offers the graphical environment.  
>  The flaw is now identified as CVE-2018-14665 (credited to security researcher Narendra Shinde). It has been present in xorg-server for two years, since version 1.19.0 and is exploitable by a limited user as long as the X server runs with elevated permissions.
>
>

* Privilege escalation and arbitrary file overwrite

>
>
> An advisory on Thursday describes the problem as an “incorrect command-line parameter validation” that also allows an attacker to overwrite arbitrary files.  
>  Privilege escalation can be accomplished via the -modulepath argument by setting an insecure path to modules loaded by the [X.org](http://X.org) server. Arbitrary file overwrite is possible through the -logfile argument, because of improper verification when parsing the option.
>
>

* Bug could have been avoided in OpenBSD 6.4

>
>
> OpenBSD, the free and open-source operating system with a strong focus on security, uses xorg. On October 18, the project released version 6.4 of the OS, affected by CVE-2018-14665. This could have been avoided, though.  
>  Theo de Raadt, founder and leader of the OpenBSD project, says that X maintainer knew about the problem since at least October 11. For some reason, the OpenBSD developers received the message one hour before the public announcement this Thursday, a week after their new OS release.  
>  “As yet we don’t have answers about why our X maintainer (on the X security team) and his team provided information to other projects (some who don’t even ship with this new X server) but chose to not give us a heads-up which could have saved all the new 6.4 users a lot of grief,” Raadt says.  
>  Had OpenBSD developers known about the bug before the release, they could have taken steps to mitigate the problem or delay the launch for a week or two.  
>  To remedy the problem, the OpenBSD project provides a source code patch, which requires compiling and rebuilding the X server.  
>  As a temporary solution, users can disable the Xorg binary by running the following command:
>
>

`chmod u-s /usr/X11R6/bin/Xorg`

* Trivial exploitation

>
>
> CVE-2018-14665 does not help compromise systems, but it is useful in the following stages of an attack.  
>  Leveraging it after gaining access to a vulnerable machine is fairly easy. Matthew Hickey, co-founder, and head of Hacker House security outfit created and published an exploit, saying that it can be triggered from a remote SSH session.  
>  Three hours after the public announcement of the security gap, Daemon Security CEO Michael Shirk replied with one line that overwrote shadow files on the system. Hickey did one better and fit the entire local privilege escalation exploit in one line.  
>  Apart from OpenBSD, other operating systems affected by the bug include Debian and Ubuntu, Fedora and its downstream distro Red Hat Enterprise Linux along with its community-supported counterpart CentOS.
>
>

---

\###[OpenBSD on the Desktop: some thoughts](https://blog.gsora.xyz/openbsd-on-the-desktop-some-thoughts/)

>
>
> I’ve been using OpenBSD on my ThinkPad X230 for some weeks now, and the experience has been peculiar in some ways.  
>  The OS itself in my opinion is not ready for widespread desktop usage, and the development team is not trying to push it in the throat of anybody who wants a Windows or macOS alternative.  
>  You need to understand a little bit of how \*NIX systems work, because you’ll use CLI more than UI.  
>  That’s not necessarily bad, and I’m sure I learned a trick or two that could translate easily to Linux or macOS.  
>  Their development process is purely based on developers that love to contribute and hack around, just because it’s fun.  
>  Even the mailing list is a cool place to hang on!  
>  Code correctness and security are a must, nothing gets committed if it doesn’t get reviewed thoroughly first - nowadays the first two properties should be enforced in every major operating system.  
>  I like the idea of a platform that continually evolves.  
>  pledge(2) and unveil(2) are the proof that with a little effort, you can secure existing software better than ever.  
>  I like the “sensible defaults” approach, having an OS ready to be used - UI included if you selected it during the setup process - is great.  
>  Just install a browser and you’re ready to go.  
>  Manual pages on OpenBSD are real manuals, not an extension of the “–help” command found in most CLI softwares.  
>  They help you understand inner workings of the operating system, no internet connection needed.  
>  There are some trade-offs, too.  
>  Performance is not first-class, mostly because of all the security mitigations and checks done at runtime3.  
>  I write Go code in neovim, and sometimes you can feel a slight slowdown when you’re compiling and editing multiple files at the same time, but usually I can’t notice any meaningful difference.  
>  Browsers are a different matter though, you can definitely feel something differs from the experience you can have on mainstream operating systems.  
>  But again, trade-offs.  
>  To use OpenBSD on the desktop you must be ready to sacrifice some of the goodies of mainstream OSes, but if you’re searching for a zen place to do your computing stuff, it’s the best you can get right now.
>
>

---

\###[Review: NomadBSD 1.1](https://distrowatch.com/weekly.php?issue=20180813#nomadbsd)

>
>
> One of the most recent additions to the DistroWatch database is NomadBSD. According to the NomadBSD website: “NomadBSD is a 64-bit live system for USB flash drives, based on FreeBSD. Together with automatic hardware detection and setup, it is configured to be used as a desktop system that works out of the box, but can also be used for data recovery.”  
>  The latest release of NomadBSD (or simply “Nomad”, as I will refer to the project in this review) is version 1.1. It is based on FreeBSD 11.2 and is offered in two builds, one for generic personal computers and one for Macbooks. The release announcement mentions version 1.1 offers improved video driver support for Intel and AMD cards. The operating system ships with Octopkg for graphical package management and the system should automatically detect, and work with, VirtualBox environments.  
>  Nomad 1.1 is available as a 2GB download, which we then decompress to produce a 4GB file which can be written to a USB thumb drive. There is no optical media build of Nomad as it is designed to be run entirely from the USB drive, and write data persistently to the drive, rather than simply being installed from the USB media.
>
>

* Initial setup

>
>
> Booting from the USB drive brings up a series of text-based menus which ask us to configure key parts of the operating system. We are asked to select our time zone, keyboard layout, keyboard model, keyboard mapping and our preferred language. While we can select options from a list, the options tend to be short and cryptic. Rather than “English (US)”, for example, we might be given “en\_US”. We are also asked to create a password for the root user account and another one for a regular user which is called “nomad”. We can then select which shell nomad will use. The default is zsh, but there are plenty of other options, including csh and bash. We have the option of encrypting our user’s home directory.  
>  I feel it is important to point out that these settings, and nomad’s home directory, are stored on the USB drive. The options and settings we select will not be saved to our local hard drive and our configuration choices will not affect other operating systems already installed on our computer. At the end, the configuration wizard asks if we want to run the BSDstats service. This option is not explained at all, but it contacts BSDstats to provide some basic statistics on BSD users.  
>  The system then takes a few minutes to apply its changes to the USB drive and automatically reboots the computer. While running the initial setup wizard, I had nearly identical experiences when running Nomad on a physical computer and running the operating system in a VirtualBox virtual machine. However, after the initial setup process was over, I had quite different experiences depending on the environment so I want to divide my experiences into two different sections.
>
>

* Physical desktop computer

>
>
> At first, Nomad failed to boot on my desktop computer. From the operating system’s boot loader, I enabled Safe Mode which allowed Nomad to boot. At that point, Nomad was able to start up, but would only display a text console. The desktop environment failed to start when running in Safe Mode.  
>  Networking was also disabled by default and I had to enable a network interface and DHCP address assignment to connect to the Internet. Instructions for enabling networking can be found in FreeBSD’s Handbook. Once we are on-line we can use the pkg command line package manager to install and update software. Had the desktop environment worked then the Octopkg graphical package manager would also be available to make browsing and installing software a point-n-click experience.  
>  Had I been able to run the desktop for prolonged amounts of time I could have made use of such pre-installed items as the Firefox web browser, the VLC media player, LibreOffice and Thunderbird. Nomad offers a fairly small collection of desktop applications, but what is there is mostly popular, capable software.  
>  When running the operating system I noted that, with one user logged in, Nomad only runs 15 processes with the default configuration. These processes require less than 100MB of RAM, and the whole system fits comfortably on a 4GB USB drive.
>
>

* Conclusions

>
>
> Ultimately using Nomad was not a practical option for me. The operating system did not work well with my hardware, or the virtual environment. In the virtual machine, Nomad crashed consistently after just a few minutes of uptime. On the desktop computer, I could not get a desktop environment to run. The command line tools worked well, and the system performed tasks very quickly, but a command line only environment is not well suited to my workflow.  
>  I like the idea of what NomadBSD is offering. There are not many live desktop flavours of FreeBSD, apart from GhostBSD. It was nice to see developers trying to make a FreeBSD-based, plug-and-go operating system that would offer a desktop and persistent storage. I suspect the system would work and perform its stated functions on different hardware, but in my case my experiment was necessarily short lived.
>
>

---

\##Beastie Bits

* [FreeBSD lockless algorithm - seq](https://oshogbo.vexillium.org/blog/50/)
* [Happy Bob’s Libtls tutorial](https://github.com/bob-beck/libtls/blob/master/TUTORIAL.md)
* [Locking OpenBSD when it’s sleeping](https://chown.me/blog/locking-openbsd-when-sleeping.html)
* [iio - The OpenBSD Way](https://www.geoghegan.ca/serviio.html)
* [Installing Hugo and Hosting Website on OpenBSD Server](https://bsdboy.ml/blog/installing-hugo-and-hosting-on-openbsd.html)
* [Fosdem 2019 reminder: BSD devroom CfP](http://blog.osorio.me/post.php?idpost=1)
* [OpenBGPD, gotta go fast! - Claudio Jeker](https://www.youtube.com/watch?v=4gOoPxGKKjA&feature=youtu.be)
* [Project Trident RC3 available](http://project-trident.org/post/2018-11-10_rc3-available/)
* [FreeBSD 10.4 EOL](https://lists.freebsd.org/pipermail/freebsd-announce/2018-November/001849.html)
* [Play “Crazy Train” through your APU2 speaker](https://bsd.network/@ephemeris/101073578346815313)

---

\##Feedback/Questions

* Tobias - [Satisfying my storage hunger and wallet pains](http://dpaste.com/174WGEY#wrap)
* Lasse - [Question regarding FreeBSD backups](http://dpaste.com/1QBMH73)
  * [https://twitter.com/dlangille](https://twitter.com/dlangille)
  * [https://dan.langille.org/](https://dan.langille.org/)

---

* Send questions, comments, show ideas/topics, or stories you want mentioned on the show to [feedback@bsdnow.tv](mailto:feedback@bsdnow.tv)

---