+++
title = "344: Grains of Salt"
description = "Shell text processing, data rebalancing on ZFS mirrors, Add Security Headers with OpenBSD relayd, ZFS filesystem hierarchy in ZFS pools, speeding up ZSH, How Unix pipes work, grow ZFS pools over time, the real reason ifconfig on Linux is deprecated, clear your terminal in style, "
date = "2020-04-02T12:00:00Z"
url = "https://www.bsdnow.tv/344"
author = "feedback@bsdnow.tv (JT Pennington)"
text = ""
lastupdated = "2026-03-26T14:37:50.551838603Z"
seen = false
+++

Shell text processing, data rebalancing on ZFS mirrors, Add Security Headers with OpenBSD relayd, ZFS filesystem hierarchy in ZFS pools, speeding up ZSH, How Unix pipes work, grow ZFS pools over time, the real reason ifconfig on Linux is deprecated, clear your terminal in style, and more.

Headlines
----------

### [Text processing in the shell](https://blog.balthazar-rouberol.com/text-processing-in-the-shell) ###

>
>
> This article is part of a self-published book project by Balthazar Rouberol and Etienne Brodu, ex-roommates, friends and colleagues, aiming at empowering the up and coming generation of developers. We currently are hard at work on it!
>
>
>
> One of the things that makes the shell an invaluable tool is the amount of available text processing commands, and the ability to easily pipe them into each other to build complex text processing workflows. These commands can make it trivial to perform text and data analysis, convert data between different formats, filter lines, etc.
>
>
>
> When working with text data, the philosophy is to break any complex problem you have into a set of smaller ones, and to solve each of them with a specialized tool.
>
>

---

### [Rebalancing data on ZFS mirrors](https://jrs-s.net/2020/03/10/rebalancing-data-on-zfs-mirrors/) ###

>
>
> One of the questions that comes up time and time again about ZFS is “how can I migrate my data to a pool on a few of my disks, then add the rest of the disks afterward?”
>
>
>
> If you just want to get the data moved and don’t care about balance, you can just copy the data over, then add the new disks and be done with it. But, it won’t be distributed evenly over the vdevs in your pool.
>
>
>
> Don’t fret, though, it’s actually pretty easy to rebalance mirrors. In the following example, we’ll assume you’ve got four disks in a RAID array on an old machine, and two disks available to copy the data to in the short term.
>
>

---

News Roundup
----------

### [Using OpenBSD relayd to Add Security Headers](https://web.archive.org/web/20191109121500/https://goblackcat.com/posts/using-openbsd-relayd-to-add-security-headers/) ###

>
>
> I am a huge fan of OpenBSD’s built-in httpd server as it is simple, secure, and quite performant. With the modern push of the large search providers pushing secure websites, it is now important to add security headers to your website or risk having the search results for your website downgraded. Fortunately, it is very easy to do this when you combine httpd with relayd. While relayd is principally designed for layer 3 redirections and layer 7 relays, it just so happens that it makes a handy tool for adding the recommended security headers. My website automatically redirects users from http to https and this gets achieved using a simple redirection in /etc/httpd.conf So if you have a configuration similar to mine, then you will still want to have httpd listen on the egress interface on port 80. The key thing to change here is to have httpd listen on 127.0.0.1 on port 443.
>
>

---

### [How we set up our ZFS filesystem hierarchy in our ZFS pools](https://utcc.utoronto.ca/~cks/space/blog/solaris/ZFSOurContainerFilesystems) ###

>
>
> Our long standing practice here, predating even the first generation of our ZFS fileservers, is that we have two main sorts of filesystems, home directories (homedir filesystems) and what we call 'work directory' (workdir) filesystems. Homedir filesystems are called /h/NNN (for some NNN) and workdir filesystems are called /w/NNN; the NNN is unique across all of the different sorts of filesystems. Users are encouraged to put as much stuff as possible in workdirs and can have as many of them as they want, which mattered a lot more in the days when we used Solaris DiskSuite and had fixed-sized filesystems.
>
>

---

### [Speeding up ZSH](https://blog.jonlu.ca/posts/speeding-up-zsh) ###

[https://web.archive.org/web/20200315184849/https://blog.jonlu.ca/posts/speeding-up-zsh](https://web.archive.org/web/20200315184849/https://blog.jonlu.ca/posts/speeding-up-zsh)

>
>
> I was opening multiple shells for an unrelated project today and noticed how abysmal my shell load speed was. After the initial load it was relatively fast, but the actual shell start up was noticeably slow. I timed it with time and these were the results.
>
>
>
> In the future I hope to actually recompile zsh with additional profiling techniques and debug information - keeping an internal timer and having a flag output current time for each command in a tree fashion would make building heat maps really easy.
>
>

---

### [How do Unix Pipes work](https://www.vegardstikbakke.com/how-do-pipes-work-sigpipe/) ###

>
>
> Pipes are cool! We saw how handy they are in a previous blog post. Let’s look at a typical way to use the pipe operator. We have some output, and we want to look at the first lines of the output. Let’s download The Brothers Karamazov by Fyodor Dostoevsky, a fairly long novel.
>
>

---

### [What we do to enable us to grow our ZFS pools over time](https://utcc.utoronto.ca/~cks/space/blog/solaris/ZFSHowWeGrowPools) ###

>
>
> In my entry on why ZFS isn't good at growing and reshaping pools, I mentioned that we go to quite some lengths in our ZFS environment to be able to incrementally expand our pools. Today I want to put together all of the pieces of that in one place to discuss what those lengths are.  
>  Our big constraint is that not only do we need to add space to pools over time, but we have a fairly large number of pools and which pools will have space added to them is unpredictable. We need a solution to pool expansion that leaves us with as much flexibility as possible for as long as possible. This pretty much requires being able to expand pools in relatively small increments of space.
>
>

---

### [Linux maintains bugs: The real reason ifconfig on Linux is deprecated](https://blog.farhan.codes/2018/06/25/linux-maintains-bugs-the-real-reason-ifconfig-on-linux-is-deprecated/) ###

>
>
> In my third installment of FreeBSD vs Linux, I will discuss underlying reasons for why Linux moved away from ifconfig(8) to ip(8).
>
>

In the past, when people said, “Linux is a kernel, not an operating system”, I knew that was true but I always thought it was a rather pedantic criticism. Of course no one runs just the Linux kernel, you run a distribution of Linux. But after reviewing userland code, I understand the significant drawbacks to developing “just a kernel” in isolation from the rest of the system.

---

### [Clear Your Terminal in Style](https://adammusciano.com/2020/03/04/2020-03-04-clear-your-terminal-in-style/) ###

>
>
> if you’re someone like me who habitually clears their terminal, sometimes you want a little excitement in your life. Here is a way to do just that.
>
>
>
> This post revolves around the idea of giving a command a percent chance of running. While the topic at hand is not serious, this simple technique has potential in your scripts.
>
>

---

Feedback/Questions
----------

* Guy - [AMD GPU Help](http://dpaste.com/2NEPDHB)
* MLShroyer13 - [VLANs and Jails](http://dpaste.com/31KBNP4#wrap)
* Master One - [ZFS Suspend/resume](http://dpaste.com/0DKM8CF#wrap)

---

* Send questions, comments, show ideas/topics, or stories you want mentioned on the show to [feedback@bsdnow.tv](mailto:feedback@bsdnow.tv)

---
 Your browser does not support the HTML5 video tag.