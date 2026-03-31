+++
title = "216: Software is storytelling"
description = "EuroBSDcon trip report, how to secure OpenBSDs LDAP server, ZFS channel programs in FreeBSD HEAD and why software is storytelling.This episode was brought to you by[iXsystems - Enterprise Servers and Storage for Open Source](http://www.ixsystems.com/b"
date = "2017-10-18T12:00:00Z"
url = "https://www.bsdnow.tv/216"
author = "feedback@bsdnow.tv (JT Pennington)"
text = ""
lastupdated = "2026-03-26T14:37:50.839048592Z"
seen = true
+++

EuroBSDcon trip report, how to secure OpenBSDs LDAP server, ZFS channel programs in FreeBSD HEAD and why software is storytelling.

This episode was brought to you by
----------

[![iXsystems - Enterprise Servers and Storage for Open Source](/images/1.png)](http://www.ixsystems.com/bsdnow)[![DigitalOcean - Simple Cloud Hosting, Built for Developers](/images/2.png)](http://www.digitalocean.com/)[![Tarsnap - Online Backups for the Truly Paranoid](/images/3.png)](http://www.tarsnap.com/bsdnow)

---

Headlines
----------

### EuroBSDcon Trip Report ###

* This is from Frank Moore, who has been supplying us with collections of links for the show and who we met at EuroBSDcon in Paris for the first time. Here is his trip report.

>
>
> My attendance at the EuroBSDCon 2017 conference in Paris was sprinkled with   
>  several 'firsts'. My first visit to Paris, my first time travelling on a EuroTunnel Shuttle train and my first time at any BSD conference. Hopefully, none of these will turn out to be 'lasts'.  
>  I arrived on the Wednesday afternoon before the conference started on Thursday morning. My hotel was conveniently located close to the conference centre in Paris' 3rd arrondissement. This area is well-known as a buzzy enclave of hip cafes, eateries, independent shops, markets, modern galleries and museums. It certainly lived up to its reputation. Even better, the weather held over the course of the conference, only raining once, with the rest of the time being both warm and sunny.  
>  The first two days were taken up with attending Dr Kirk McKusick's excellent tutorial 'An Introduction to the FreeBSD Open-Source Operating System'. This is training "straight from the horse's mouth". Kirk has worked extensively on The FreeBSD operating system since the 1980's, helping to design the original BSD filesystem (FFS) and later working on UFS as well. Not only is Kirk an engaging speaker, making what could be a dry topic very interesting, he also   
>  sprinkles liberal doses of history and war stories throughout his lectures. Want to know why a protocol was designed the way that it was? Or why a system flag has a particular value or position in a record? Kirk was there and has the first-hand answer. He reminisces about his meetings and work with other Unix and BSD luminaries and debunks and confirms common myths in equal measure.  
>  Kirk's teaching style and knowledge are impressive. Every section starts with an overview and a big picture diagram before drilling down into the nitty-gritty detail. Nothing feels superfluous, and everything fits together logically. It's easy to tell that the material and its delivery have been honed over many years, but without feeling stale. Topics covered included the kernel, processes, virtual memory, threads, I/O, devices, FFS, ZFS, and networking.   
>  The slides were just as impressive, with additional notes written by a previous student and every slide containing a reference back to the relevant page(s) in the 2nd edition of Kirk's operating system book. As well as a hard copy for those that requested it, Kirk also helpfully supplied soft copies of all the training materials.  
>  The breaks in between lectures were useful for meeting the students from the other tutorials and for recovering from the inevitable information overload.  
>  It's not often that you can get to hear someone as renowned as Dr McKusick give a lecture on something as important as the FreeBSD operating system. If you have any interest in FreeBSD, Unix history, or operating systems in general, I would urge you to grab the opportunity to attend one of his lectures. You won't be disappointed.  
>  The last two days of the conference consisted of various hour-long talks by members of each of the main BSD systems. All of them were fairly evenly represented except Dragonfly BSD which unfortunately only had one talk. With three talks going on at any one time, it was often difficult to pick which one to go to. At other times there might be nothing to pique the interest. Attendance at a talk is not mandatory, so for those times when no talks looked inviting, just hanging out in one of the lobby areas with other attendees was often just as interesting and informative.   
>  The conference centre itself was certainly memorable with the interior design of an Egyptian temple or pyramid. All the classrooms were more than adequate while the main auditorium was first-class and easily held the 300+ attendees comfortably. All in all, the facilities, catering and organisation were excellent. Kudos to the EuroBSDCon team, especially Bapt and Antoine for all their hard work and hospitality.  
>  As a long-time watcher and occasional contributor to the BSD Now podcast it was good to meet both Allan and Benedict in the flesh. And having done some proofreading for Michael Lucas previously, it was nice to finally meet him as well.  
>  My one suggestion to the organisers of the next conference would be to provide more   
>  hand-holding for newbies. As a first-time attendee at a BSD conference it would have been nice to have been formally introduced to various people within the projects as the goto people for their areas. I could do this myself, but it's not always easy finding the right person and wrangling an introduction. I also think it was a missed opportunity for each project to recruit new developers to their cause. Apparently, this is already in place at BSDCan, but should probably be rolled out across all BSD conferences.  
>  Having said all that, my aims for the conference were to take Dr McKusick's course, meet a few BSD people and make contacts within one of the BSD projects to start contributing. I was successful on all these fronts, so for me this was mission accomplished. Another first!
>
>
> ---
>

### [autoconf/clang (No) Fun and Games](https://undeadly.org/cgi?action=article;sid=20170930133438) ###

* Robert Nagy (robert@) wrote in with a fascinating story of hunting down a recent problem with ports:

>
>
> You might have been noticing the amount of commits to ports regarding autoconf and nested functions and asking yourself what the hell is this all about?  
>  I was hanging out at my friend Antoine (ajacoutot@)'s place just before EuroBSDCon 2017 started and we were having drinks and he told me that there is this weird bug where Gnome hangs completely after just a couple of seconds of usage and the gnome-shell process just sits in the fsleep state. This started to happen at the time when inteldrm(4) was updated, the default compiler was switched to clang(1) and futexes were turned on by default.  
>  The next day we started to have a look at the issue and since the process was hanging in fsleep, it seemed clear that the cause must be futexes, so we had to start bisecting the base system, which resulted in random success and failure. In the end we figured out that it is neither futex nor inteldrm(4) related, so the only thing that was left is the switch to clang.  
>  Now the problem is that we have to figure out what part of the system needs to be build with clang to trigger this issue, so we kept on going and systematically recompiled the base system with gcc until everything was ruled out and it kept on hanging.  
>  We were drunk and angry that now we have to go and check hundreds of ports because gnome is not a small standalone port, so between two bottles of wine a build VM was fired up to do a package build with gcc, because manually building all the dependencies would just take too long and we had spent almost two days on this already.  
>  Next day \~200 packages were available to bisect and figure out what's going on. After a couple of tries it turned out that the hang is being caused by the gtk+3 package, which is bad since almost everything is using gtk+3. Now it was time to figure out what file the gtk+3 source being built by clang is causing the issue. (Compiler optimizations were ruled out already at this point.) So another set of bisecting happened, building each subdirectory of gtk+3 with clang and waiting for the hang to manifest and it did not. What the $f?  
>  Okay so something else is going on and maybe the configure script of gtk+3 is doing something weird with different compilers, so I quickly did two configure runs with gcc and clang and simply diff'd the two directories. Snippets from the diff:
>
>
>
> \-GDK\_HIDDEN\_VISIBILITY\_CFLAGS = -fvisibility=hidden  
>  GDK\_HIDDEN\_VISIBILITY\_CFLAGS =
>
>
>
> \-lt\_cv\_prog\_compiler\_rtti\_exceptions=no  
>  lt\_cv\_prog\_compiler\_rtti\_exceptions=yes
>
>
>
> \-#define *GDK\_EXTERN \_\_attribute*\_((visibility("default"))) extern
>
>
>
> \-lt\_prog\_compiler\_no\_builtin\_flag=' -fno-builtin'  
>  \+lt\_prog\_compiler\_no\_builtin\_flag=' -fno-builtin -fno-rtti -fno-exceptions'  
>  Okay, okay that's something, but wait clang has symbol visibility support so what is going on again? Let's take a peek at config.log:
>
>
>
> configure:29137: checking for -fvisibility=hidden compiler flag
>
>
>
> configure:29150: cc -c -fvisibility=hidden -I/usr/local/include -I/usr/X11R6/include conftest.c \>&5  
>  conftest.c:82:17: error: function definition is not allowed here
>
>
>
> int main (void) { return 0; }  
>  ^  
>  1 error generated.
>
>
>
> Okay that's clearly an error but why exactly? autoconf basically generates a huge shell script that will check for whatever you throw at it by creating a file called conftest.c and putting chunks of code into it and then trying to compile it. In this case the relevant part of the code was:
>
>
> >
> >
> > | int  
> >  | main ()  
> >  | {  
> >  | int main (void) { return 0; }  
> >  | ;  
> >  | return 0;  
> >  | }
> >
> >
>
>
>
> That is a nested function declaration which is a GNU extension and it is not supported by clang, but that's okay, the question is why the hell would you use nested functions to check for simple compiler flags. The next step was to go and check what is going on in configure.ac to see how the configure script is generated. In the gtk+3 case the following snippet is used:
>
>
>
> ```
> AC_MSG_CHECKING([for -fvisibility=hidden compiler flag])
>
> ```
>
>
>
> AC\_TRY\_COMPILE([], [int main (void) { return 0; }],  
>  AC\_MSG\_RESULT(yes)  
>  enable\_fvisibility\_hidden=yes,  
>  AC\_MSG\_RESULT(no)  
>  enable\_fvisibility\_hidden=no)
>
>
>
> According to the autoconf manual the AC\_TRY\_COMPILE macro accepts the following parameters:  
>  That clearly states that a function body has to be specified because the function definition is already provided automatically, so doing AC\_TRY\_COMPILE([], [int main (void) { return 0;}], instead of AC\_TRY\_COMPILE([],[] will result in a nested function declaration, which will work just fine with gcc, even though the autoconf usage is wrong.  
>  After fixing the autoconf macro in gtk+3 and rebuilding the complete port from scratch with clang, the hang completely went away as the proper CFLAGS and LDFLAGS were picked up by autoconf for the build.  
>  At this point we realized that most of the ports tree uses autoconf so this issue might be a lot bigger than we thought, so I asked sthen@ to do a grep on the ports object directory and just search for "function definition is not allowed here", which resulted in about \~60 additional ports affected.  
>  Out of the list of ports there were only two false positive matches. These were actually trying to test whether the compiler supports nested functions. The rest were a combination of several autoconf macros used in a wrong way, e.g: AC\_TRY\_COMPILE, AC\_TRY\_LINK. Most of them were fixable by just removing the extra function declaration or by switching to other autoconf macros like AC\_LANG\_SOURCE where you can actually declare your own functions if need be.  
>  The conclusion is that this issue was a combination of people not reading documentation and just copy/pasting autoconf snippets, instead of reading their documentation and using the macros in the way they were intended, and the fact that switching to a new compiler is never easy and bugs or undefined behaviour are always lurking in the dark.  
>  Thanks to everyone who helped fixing all the ports up this quickly! Hopefully all of the changes can be merged upstream, so that others can benefit as well.
>
>
> ---
>

Interview - David Carlier - [@devnexen](https://twitter.com/devnexen)
----------

* Software Engineer at Afilias \*\*\*

News Roundup
----------

### [Setting up OpenBSD's LDAP Server (ldapd) with StartTLS and SASL](http://blog.databasepatterns.com/2017/08/setting-up-openbsds-ldap-server-ldapd.html) ###

* A tutorial on setting up OpenBSDs native LDAP server with TLS encryption and SASL authentication

>
>
> OpenBSD has its own LDAP server, ldapd. Here's how to configure it for use with StartTLS and SASL authentication  
>  Create a certificate (acme-client anyone?)  
>  Create a basic config file  
>  listen on em0 tls certificate ldapserver
>
>

* This will listen on the em0 interface with tls using the certificate called ldapserver.crt / ldapserver.key
* Validate the configuration:

>
>
> /usr/sbin/ldapd -n
>
>

* Enable and start the service:

>
>
> rcctl enable ldapd  
>  rcctl start ldapd
>
>

* On the client machine:

>
>
> pkg\_add openldap-client
> ==========
>
>

* Copy the certificate to /etc/ssl/trusted.crt
* Add this line to /etc/openldap/ldap.conf

>
>
> TLS\_CACERT /etc/ssl/trusted.crt
>
>

* Enable and start the service

>
>
> rcctl enable saslauthd  
>  rcctl start saslauthd
>
>

* Connect to ldapd (-ZZ means force TLS, use -H to specify URI):

>
>
> ldapsearch -H ldap://ldapserver -ZZ
>
>
> ---
>

### [FreeBSD Picks Up Support for ZFS Channel Programs in -current](https://svnweb.freebsd.org/base?view=revision&revision=324163) ###

>
>
> ZFS channel programs (ZCP) adds support for performing compound ZFS administrative actions via Lua scripts in a sandboxed environment (with time and memory limits).  
>  This initial commit includes both base support for running ZCP scripts, and a small initial library of API calls which support getting properties and listing, destroying, and promoting datasets.  
>  Testing: in addition to the included unit tests, channel programs have been in use at Delphix for several months for batch destroying filesystems.
>
>

* Take a simple task as an example: Create a snapshot, then set a property on that snapshot. In the traditional system for this, when you issue the snapshot command, that closes the currently open transaction group (say #100), and opens a new one, #101. While #100 is being written to disk, other writes are accumulated in #101. Once #100 is flushed to disk, the zfs snapshot command returns. You can then issue the zfs set command. This actually ends up going into transaction group #102. Each administrative action needs to wait for the transaction group to flush, which under heavy loads could take multiple seconds. Now if you want to create AND set, you need to wait for two or three transaction groups. Meanwhile, during transaction group #101, the snapshot existed without the property set, which could cause all kinds of side effects.

* ZFS Channel programs solves this by allowing you to perform a small scripted set of actions as a single atomic operation.

* In Delphixs appliance, they often needed to do as many as 15 operations together, which might take multiple minutes. Now with channel programs it is much faster, far safer, and has fewer chances of side effects

* [BSDCan 2017 - Matt Ahrens: Building products based on OpenZFS, using channel programs -- Video Soon](http://www.bsdcan.org/2017/schedule/events/854.en.html)

  ---

### [Software Is About Storytelling](http://bravenewgeek.com/software-is-about-storytelling/) ###

* Tyler Treat writes on the brave new geek blog:

>
>
> Software engineering is more a practice in archeology than it is in building. As an industry, we undervalue storytelling and focus too much on artifacts and tools and deliverables. How many times have you been left scratching your head while looking at a piece of code, system, or process? Its the story, the legacy left behind by that artifact, that is just as importantif not morethan the artifact itself.  
>  And I dont mean whats in the version control historythats often useless. I mean the real, human story behind something. Artifacts, whether thats code or tools or something else entirely, are not just snapshots in time. Theyre the result of a series of decisions, discussions, mistakes, corrections, problems, constraints, and so on. Theyre the product of the engineering process, but the problem is they usually dont capture that process in its entirety. They rarely capture it at all. They commonly end up being nothing but a snapshot in time.  
>  Its often the sign of an inexperienced engineer when someone looks at something and says, this is stupid or why are they using X instead of Y? Theyre ignoring the context, the fact that circumstances may have been different. There is a story that led up to that point, a reason for why things are the way they are. If youre lucky, the people involved are still around. Unfortunately, this is not typically the case. And so its not necessarily the poor engineers fault for wondering these things. Their predecessors havent done enough to make that story discoverable and share that context.  
>  I worked at a company that built a homegrown container PaaS on ECS. Doing that today would be insane with the plethora of container solutions available now. Why arent you using Kubernetes? Well, four years ago when we started, Kubernetes didnt exist. Even Docker was just in its infancy. And its not exactly a flick of a switch to move multiple production environments to a new container runtime, not to mention the politicking with leadership to convince them its worth it to not ship any new code for the next quarter as we rearchitect our entire platform. Oh, and now the people behind the original solution are no longer with the company. Good luck! And this is on the timescale of about five years. Thats maybe like one generation of engineers at the company at mostnothing compared to the decades or more software usually lives (an interesting observation is that timescale, I think, is proportional to the size of an organization). Dont underestimate momentum, but also dont underestimate changing circumstances, even on a small time horizon.  
>  The point is, stop looking at technology in a vacuum. There are many facets to consider. Likewise, decisions are not made in a vacuum. Part of this is just being an empathetic engineer. The corollary to this is you dont need to adopt every bleeding-edge tech that comes out to be successful, but the bigger point is software is about storytelling. The question you should be asking is how does your organization tell those stories? Are you deliberate or is it left to tribal knowledge and hearsay? Is it something you truly value and prioritize or simply a byproduct?  
>  Documentation is good, but the trouble with documentation is its usually haphazard and stagnant. Its also usually documentation of how and not why. Documenting intent can go a long way, and understanding the why is a good way to develop empathy. Code survives us. Theres a fantastic talk by Bryan Cantrill on [oral tradition in software engineering](https://youtu.be/4PaWFYm0kEw) where he talks about this. People care about intent. Specifically, when you write software, people care what you think. As Bryan puts it, future generations of programmers want to understand your intent so they can abide by it, so we need to tell them what our intent was. We need to broadcast it. Good code comments are an example of this. They give you a narrative of not only whats going on, but why. When we write software, we write it for future generations, and thats the most underestimated thing in all of software. Documenting intent also allows you to document your values, and that allows the people who come after you to continue to uphold them.  
>  Storytelling in software is important. Without it, software archeology is simply the study of puzzles created by time and neglect. When an organization doesnt record its history, its bound to repeat the same mistakes. A companys memory is comprised of its people, but the fact is people churn. Knowing how you got here often helps you with getting to where you want to be. Storytelling is how we transcend generational gaps and the inevitable changing of the old guard to the new guard in a maturing engineering organization. The same is true when we expand that to the entire industry. Were too memorylessshipping code and not looking back, discovering everything old that is new again, and simply not appreciating our lineage.
>
>
> ---
>

Beastie Bits
----------

* [1st BSD Users Stockholm Meetup](https://www.meetup.com/en-US/BSD-Users-Stockholm/)
* [Absolute FreeBSD, 3rd Edition draft completed ](https://blather.michaelwlucas.com/archives/3020)
* [Absolute FreeBSD, 3rd Edition Table of Contents](https://blather.michaelwlucas.com/archives/2995)
* [t2k17 Hackathon Report: My first time (Aaron Bieber)](https://undeadly.org/cgi?action=article;sid=20170824193521)
* [The release of pfSense 2.4.0 will be slightly delayed to apply patches for vulnerabilities in 3rd party packages that are part of pfSense](https://www.netgate.com/blog/no-plan-survives-contact-with-the-internet.html)

---

Feedback/Questions
----------

* [Ben writes in that zrepl is in ports now](http://dpaste.com/1XMJYMH#wrap)
* [Peter asks us about Netflix on BSD](http://dpaste.com/334WY4T#wrap)
* [meka writes in about dhclient exiting](http://dpaste.com/3GSGKD3#wrap) \*\*\*