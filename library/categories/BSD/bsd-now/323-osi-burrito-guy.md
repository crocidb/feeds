+++
title = "323: OSI Burrito Guy"
description = "The earliest Unix code, how to replace fail2ban with blacklistd, OpenBSD crossed 400k commits, how to install Bolt CMS on FreeBSD, optimized hammer2, appeasing the OSI 7-layer burrito guys, and more.Headlines[The Earliest Unix Code: An Anniversary Source Code Releas"
date = "2019-11-07T12:00:00Z"
url = "https://www.bsdnow.tv/323"
author = "feedback@bsdnow.tv (JT Pennington)"
text = ""
lastupdated = "2026-03-26T14:37:50.589702544Z"
seen = false
+++

The earliest Unix code, how to replace fail2ban with blacklistd, OpenBSD crossed 400k commits, how to install Bolt CMS on FreeBSD, optimized hammer2, appeasing the OSI 7-layer burrito guys, and more.

Headlines
----------

### [The Earliest Unix Code: An Anniversary Source Code Release](https://computerhistory.org/blog/the-earliest-unix-code-an-anniversary-source-code-release/) ###

>
>
> What is it that runs the servers that hold our online world, be it the web or the cloud? What enables the mobile apps that are at the center of increasingly on-demand lives in the developed world and of mobile banking and messaging in the developing world? The answer is the operating system Unix and its many descendants: Linux, Android, BSD Unix, MacOS, iOS—the list goes on and on. Want to glimpse the Unix in your Mac? Open a Terminal window and enter “man roff” to view the Unix manual entry for an early text formatting program that lives within your operating system.
>
>
>
> 2019 marks the 50th anniversary of the start of Unix. In the summer of 1969, that same summer that saw humankind’s first steps on the surface of the Moon, computer scientists at the Bell Telephone Laboratories—most centrally Ken Thompson and Dennis Ritchie—began the construction of a new operating system, using a then-aging DEC PDP-7 computer at the labs.
>
>

---

### [This man sent the first online message 50 years ago](https://www.cbc.ca/radio/thecurrent/the-current-for-oct-29-2019-1.5339212/this-man-sent-the-first-online-message-50-years-ago-he-s-since-seen-the-web-s-dark-side-emerge-1.5339244) ###

* As many of you have heard in the past, the first online message ever sent between two computers was "lo", just over 50 years ago, on Oct. 29, 1969.

>
>
> It was supposed to say "log," but the computer sending the message — based at UCLA — crashed before the letter "g" was typed. A computer at Stanford 560 kilometres away was supposed to fill in the remaining characters "in," as in "log in."
>
>

* The CBC Radio show, “The Current” has a half-hour interview with the man who sent that message, Leonard Kleinrock, distinguished professor of computer science at UCLA

>
>
> "The idea of the network was you could sit at one computer, log on through the network to a remote computer and use its services there,"
>
>
>
> 50 years later, the internet has become so ubiquitous that it has almost been rendered invisible. There's hardly an aspect in our daily lives that hasn't been touched and transformed by it.
>
>
>
> Q: Take us back to that day 50 years ago. Did you have the sense that this was going to be something you'd be talking about a half a century later?
>
>
>
> A: Well, yes and no. Four months before that message was sent, there was a press release that came out of UCLA in which it quotes me as describing what my vision for this network would become. Basically what it said is that this network would be always on, always available. Anybody with any device could get on at anytime from any location, and it would be invisible.
>
>
>
> Well, what I missed ... was that this is going to become a social network. People talking to people. Not computers talking to computers, but [the] human element.
>
>
>
> Q: Can you briefly explain what you were working on in that lab? Why were you trying to get computers to actually talk to one another?
>
>
>
> A: As an MIT graduate student, years before, I recognized I was surrounded by computers and I realized there was no effective [or efficient] way for them to communicate. I did my dissertation, my research, on establishing a mathematical theory of how these networks would work. But there was no such network existing. AT&T said it won't work and, even if it does, we want nothing to do with it.
>
>
>
> So I had to wait around for years until the Advanced Research Projects Agency within the Department of Defence decided they needed a network to connect together the computer scientists they were supervising and supporting.
>
>
>
> Q: For all the promise of the internet, it has also developed some dark sides that I'm guessing pioneers like yourselves never anticipated.
>
>
>
> A: We did not. I knew everybody on the internet at that time, and they were all well-behaved and they all believed in an open, shared free network. So we did not put in any security controls.
>
>
>
> When the first spam email occurred, we began to see the dark side emerge as this network reached nefarious people sitting in basements with a high-speed connection, reaching out to millions of people instantaneously, at no cost in time or money, anonymously until all sorts of unpleasant events occurred, which we called the dark side.
>
>
>
> But in those early days, I considered the network to be going through its teenage years. Hacking to spam, annoying kinds of effects. I thought that one day this network would mature and grow up. Well, in fact, it took a turn for the worse when nation states, organized crime and extremists came in and began to abuse the network in severe ways.
>
>
>
> Q: Is there any part of you that regrets giving birth to this?
>
>
>
> A: Absolutely not. The greater good is much more important.
>
>

---

News Roundup
----------

### [How to use blacklistd(8) with NPF as a fail2ban replacement](https://www.unitedbsd.com/d/63-how-to-use-blacklistd8-with-npf-as-a-fail2ban-replacement) ###

>
>
> blacklistd(8) provides an API that can be used by network daemons to communicate with a packet filter via a daemon to enforce opening and closing ports dynamically based on policy.
>
>
>
> The interface to the packet filter is in /libexec/blacklistd-helper (this is currently designed for npf) and the configuration file (inspired from inetd.conf) is in etc/blacklistd.conf
>
>
>
> Now, blacklistd(8) will require bpfjit(4) (Just-In-Time compiler for Berkeley Packet Filter) in order to properly work, in addition to, naturally, npf(7) as frontend and syslogd(8), as a backend to print diagnostic messages. Also remember npf shall rely on the npflog\* virtual network interface to provide logging for tcpdump() to use.
>
>
>
> Unfortunately (dont' ask me why ??) in 8.1 all the required kernel components are still not compiled by default in the GENERIC kernel (though they are in HEAD), and are rather provided as modules. Enabling NPF and blacklistd services would normally result in them being automatically loaded as root, but predictably on securelevel=1 this is not going to happen.
>
>

* [FreeBSD’s handbook chapter on blacklistd](https://www.freebsd.org/doc/en_US.ISO8859-1/books/handbook/firewalls-blacklistd.html)

---

### [OpenBSD crossed 400,000 commits](https://marc.info/?l=openbsd-tech&m=157059352620659&w=2) ###

>
>
> Sometime in the last week OpenBSD crossed 400,000 commits (\*) upon all our repositories since starting at 1995/10/18 08:37:01 Canada/Mountain. That's a lot of commits by a lot of amazing people.
>
>
>
> (\*) by one measure. Since the repository is so large and old, there are a variety of quirks including ChangeLog missing entries and branches not convertible to other repo forms, so measuring is hard. If you think you've got a great way of measuring, don't be so sure of yourself -- you may have overcounted or undercounted.
>
>

* Subject to the notes Theo made about under and over counting, FreeBSD should hit 1 million commits (base + ports + docs) some time in 2020
* NetBSD + pkgsrc are approaching 600,000, but of course pkgsrc covers other operating systems too

---

### [How to Install Bolt CMS with Nginx and Let's Encrypt on FreeBSD 12](https://www.howtoforge.com/how-to-install-bolt-cms-nginx-ssl-on-freebsd-12/) ###

>
>
> Bolt is a sophisticated, lightweight and simple CMS built with PHP. It is released under the open-source MIT-license and source code is hosted as a public repository on Github. A bolt is a tool for Content Management, which strives to be as simple and straightforward as possible. It is quick to set up, easy to configure, uses elegant templates. Bolt is created using modern open-source libraries and is best suited to build sites in HTML5 with modern markup. In this tutorial, we will go through the Bolt CMS installation on FreeBSD 12 system by using Nginx as a web server, MySQL as a database server, and optionally you can secure the transport layer by using acme.sh client and Let's Encrypt certificate authority to add SSL support.
>
>

* Requirements
* The system requirements for Bolt are modest, and it should run on any fairly modern web server:
  * PHP version 5.5.9 or higher with the following common PHP extensions: pdo, mysqlnd, pgsql, openssl, curl, gd, intl, json, mbstring, opcache, posix, xml, fileinfo, exif, zip.
  * Access to SQLite (which comes bundled with PHP), or MySQL or PostgreSQL.
  * Apache with mod\_rewrite enabled (.htaccess files) or Nginx (virtual host configuration covered below).
  * A minimum of 32MB of memory allocated to PHP.

---

### [hammer2 - Optimize hammer2 support threads and dispatch](http://lists.dragonflybsd.org/pipermail/commits/2019-September/719632.html) ###

>
>
> Refactor the XOP groups in order to be able to queue strategy calls, whenever possible, to the same CPU as the issuer. This optimizes several cases and reduces unnecessary IPI traffic between cores. The next best thing to do would be to not queue certain XOPs to an H2 support thread at all, but I would like to keep the threads intact for later clustering work.  
>   
>  The best scaling case for this is when one has a large number of user threads doing I/O. One instance of a single-threaded program on an otherwise idle machine might see a slightly reduction in performance but at the same time we completely avoid unnecessarily spamming all cores in the system on the behalf of a single program, so overhead is also significantly lower.
>
>
>
> This will tend to increase the number of H2 support threads since we need a certain degree of multiplication for domain separation.
>
>
>
> This should significantly increase I/O performance for multi-threaded workloads.
>
>

---

### [You know, we might as well just run every network service over HTTPS/2 and build another six layers on top of that to appease the OSI 7-layer burrito guys](http://boston.conman.org/2019/10/17.1) ###

>
>
> I've seen the writing on the wall, and while for now you can configure Firefox not to use DoH, I'm not confident enough to think it will remain that way. To that end, I've finally set up my own DoH server for use at Chez Boca. It only involved setting up my own CA to generate the appropriate certificates, install my CA certificate into Firefox, configure Apache to run over HTTP/2 (THANK YOU SO VERY XXXXX­XX MUCH GOOGLE FOR SHOVING THIS HTTP/2 XXXXX­XXX DOWN OUR THROATS!—no, I'm not bitter) and write a 150 line script that just queries my own local DNS, because, you know, it's more XXXXX­XX secure or some XXXXX­XXX reason like that.
>
>
>
> Sigh.
>
>

---

Beastie Bits
----------

* [An Oral History of Unix](https://www.princeton.edu/~hos/Mahoney/unixhistory)
* [NUMA Siloing in the FreeBSD Network Stack [pdf]](https://people.freebsd.org/~gallatin/talks/euro2019.pdf)
* [EuroBSDCon 2019 videos available](https://www.youtube.com/playlist?list=PLskKNopggjc6NssLc8GEGSiFYJLYdlTQx)
* [Barbie knows best](https://twitter.com/eksffa/status/1188638425567682560)
* [For the #OpenBSD #e2k19 attendees. I did a pre visit today.](https://twitter.com/bob_beck/status/1188226661684301824)
* [Drawer Find](https://twitter.com/pasha_sh/status/1187877745499561985)
* [Slides - Removing ROP Gadgets from OpenBSD - AsiaBSDCon 2019](https://www.openbsd.org/papers/asiabsdcon2019-rop-slides.pdf)

---

Feedback/Questions
----------

* Bostjan - [Open source doesn't mean secure](http://dpaste.com/1M5MVCX#wrap)
* Malcolm - [Allan is Correct.](http://dpaste.com/2RFNR94)
* Michael - [FreeNAS inside a Jail](http://dpaste.com/28YW3BB#wrap)

  ---

* Send questions, comments, show ideas/topics, or stories you want mentioned on the show to [feedback@bsdnow.tv](mailto:feedback@bsdnow.tv)

---
 Your browser does not support the HTML5 video tag.