+++
title = "236: How a cd works"
description = "Well cover OpenBSDs defensive approach to OS security, help you Understanding Syscall Conventions for Different Platforms, Mishandling SMTP Sender Verification, how the cd command works, and the LUA boot loader coming to FreeBSD.This episode was brought to you by[![iX"
date = "2018-03-07T13:00:00Z"
url = "https://www.bsdnow.tv/236"
author = "feedback@bsdnow.tv (JT Pennington)"
text = ""
lastupdated = "2026-03-26T14:37:50.781582997Z"
seen = false
+++

Well cover OpenBSDs defensive approach to OS security, help you Understanding Syscall Conventions for Different Platforms, Mishandling SMTP Sender Verification, how the cd command works, and the LUA boot loader coming to FreeBSD.

This episode was brought to you by
----------

[![iXsystems - Enterprise Servers and Storage for Open Source](/images/1.png)](http://www.ixsystems.com/bsdnow)[![DigitalOcean - Simple Cloud Hosting, Built for Developers](/images/2.png)](http://www.digitalocean.com/)[![Tarsnap - Online Backups for the Truly Paranoid](/images/3.png)](http://www.tarsnap.com/bsdnow)

---

Headlines
----------

### [Pledge: OpenBSDs defensive approach to OS Security](https://medium.com/@_neerajpal/pledge-openbsds-defensive-approach-for-os-security-86629ef779ce) ###

>
>
> The meaning of Pledge is same as in the real world, that is, a solemn promise or undertaking.
>
>
>
> So, in OpenBSD: Calling pledge in a program means to promise that the program will only use certain resources.
>
>

* How does it make a program more secure?

>
>
> It limits the operation of a program. Example: You wrote a program named abc that only needed the stdio to just print something to stdout.
>
>

* You added pledge to use only stdio and nothing else.
* Then, a malicious user found out that there is a vulnerability in your program which one can exploit and get into shell (or root shell).
* Exploiting your program to open a shell (or root shell) will result in the kernel killing the process with SIGABRT (which cannot be caught/ignored) and will generate a log (which you can find with dmesg).

>
>
> This happens because before executing other codes of your program, the code first pledges not to use anything other than stdio promise/operations. But, opening a shell or root shell will call several other system-calls which are distributed in lots of other promises like stdio, proc, exec etc. They are all forbidden because the program has already promised not to use any promises other than stdio.
>
>
>
> Pledge is not a system call filter. So, it is not used to restrict system calls.  
>  For example,
>
>

* pledge(read,NULL) ? wrong syntax of the pledge()
* pledge(stdio inet,NULL) ? correct syntax of the pledge()

>
>
> Pledge works on stdio, dns, inet, etc. promises but not directly on system calls like read, write, etc. And, unique functionality of pledge() is that it works on behavioral approach not just like 1:1 approach with the system calls.
>
>
>
> On 11 December 2017, Theo de Raadt said:
>
>

```
List: openbsd-tech
Subject: pledge execpromises
From: Theo de Raadt <deraadt () openbsd ! org>
Date: 20171211 21:20:51
Message-ID: 6735.1513027251 () cvs ! openbsd ! org
This will probably be committed in the next day or so.
The 2nd argument of pledge() becomes execpromises, which is what
will gets activated after execve.
There is also a small new feature called error, which causes
violating system calls to return -1 with ENOSYS rather than killing
the process. This must be used with EXTREME CAUTION because libraries
and programs are full of unchecked system calls. If you carry on past
one of these failures, your program is in uncharted territory and
risks of exploitation become high.
error is being introduced for a different reason: The pre-exec
processs expectation of what the post-exec process will do might
mismatch, so error allows things like starting an editor which has
no network access or maybe other restrictions in the future

```

---

### [Every Journey Starts with a FAIL...or Understanding Syscall Conventions for Different Platforms](http://k3research.outerhaven.de/posts/every-journey-starts-with-a-fail.html) ###

* Introduction

>
>
> Not long ago I started looking into FreeBSD kernel exploitation. There are only a few resources but probably the best starting point is argp's Phrack article from 2009[0]. And while he does only provide one technique, I wanted to understand it and port it to a modern FreeBSD release before describing new, own researched techniques.
>
>
>
> Well, at least this was my plan. In reality I ended researching how different operating systems resp. the same operating system but for different architectures implement syscalls. Hence, new exploiting methods have to wait for another post. In this one I want to describe my personal FAIL while porting argp's exploit example to a FreeBSD 11.1-RELEASE running on a 64bit processor. Maybe this will give other people interested in kernel stuff some insights they didn't know before. If you already know how syscalls work on 32bit and 64bit \*BSD because you are an experienced exploit or kernel developer, you will probably want to search for something  
>  else to read. Moreover, some of the debugging stuff can look laborious because I wanted to show the steps I have done while attacking my problem instead of showing a simple walkthrough to the solution.
>
>

* The Problem

>
>
> argp described in his article vulnerable code consisting of a loadable kernel module which exposes a syscall to the userland. Because it was written around the time when FreeBSD 8-RELEASE came out and because he has written himself that the code needs smaller adjustments to work with this version (it was written for FreeBSD 7) I thought I will first port it to  
>  FreeBSD 11.1-RELEASE. Moreover it was written for an Intel 32bit processor architecture as we can see from his shellcode examples. Hence, I wanted to go right away the harder way and modify it to work on an 64bit processor.
>
>

* Why the Original Code Worked While It Was Wrong

>
>
> As written above, the syscall convention for the 32bit architecture is different from the one for the 64bit architecture. Indeed, a syscall on a 32bit FreeBSD system passes the arguments via the stack while the syscall offset is stored in the EAX register. The transfer into the kernel address space is done in 'cpu\_fetch\_syscall\_args' in 'sys/i386/i386/trap.c'.
>
>

```
int
cpu_fetch_syscall_args(struct thread *td, struct syscall_args *sa)
{
    ...
    frame = td->td_frame;

    params = (caddr_t)frame->tf_esp + sizeof(int);
    sa->code = frame->tf_eax;

    ...

    if (params != NULL && sa->narg != 0)
        error = copyin(params, (caddr_t)sa->args,
            (u_int)(sa->narg * sizeof(int)));
    else
    ...
}

```

>
>
> That is, 'params' points to ESP+4 bytes offset. Later, the arguments are copied into the kernel space which is referenced by 'sa-\>args'. 'args' is an array of eight 'register\_t' which is defined as 'int32\_t' on the 32bit platform in comparison to the 64bit platform. And as 'struct args' only  
>  consisted of integers they got copied into the syscall arguments which are given to the trigger function inside the kernel module. We could verify this by changing 'int op' to 'long long op' in the kernel module and in trigger.c. We get the following output:
>
>

```
root@freebsd64:trigger/ # ./trigger
0x28414000
256
3
1
0x28414000
256
4294967295
2
root@freebsd64:trigger/ #

```

>
>
> To bring this to an end: argp's version only worked for his special choice of arguments and only on 32bit. On 32bit FreeBSD platforms the arguments are transferred into kernel space by 4 byte integers, hence it will only work for integers anyway. On 64bit FreeBSD platforms we have to use syscall(2) in the intended way.
>
>

---

### iXsystems ###

* [New Disks!](https://www.ixsystems.com/blog/gdpr-countdown/)

### [A Life Lesson in Mishandling SMTP Sender Verification](https://bsdly.blogspot.co.uk/2018/02/a-life-lesson-in-mishandling-smtp.html) ###

>
>
> It all started with one of those rare spam mails that got through.
>
>
>
> This one was hawking address lists, much like the ones I occasionally receive to addresses that I can not turn into spamtraps. The message was addressed to, of all things, [root@skapet.bsdly.net](mailto:root@skapet.bsdly.net). (The message with full headers has been preserved here for reference).
>
>
>
> Yes, that's right, they sent their spam to [root@](mailto:root@). And a quick peek at the headers revealed that like most of those attempts at hawking address lists for spamming that actually make it to a mailbox here, this one had been sent by an outlook.com customer.
>
>
>
> The problem with spam delivered via outlook.com is that you can't usefully blacklist the sending server, since the largish chunk of the world that uses some sort of Microsoft hosted email solution (Office365 and its ilk) have their usually legitimate mail delivered via the very same infrastructure.
>
>
>
> And since outlook.com is one of the mail providers that doesn't play well with greylisting (it spreads its retries across no less than 81 subnets (the output of 'echo outlook.com | doas smtpctl spf walk' is preserved here), it's fairly common practice to just whitelist all those networks and avoid the hassle of lost or delayed mail to and from Microsoft customers.
>
>
>
> I was going to just ignore this message too, but we've seen an increasing number of spammy outfits taking advantage of outlook.com's seeming right of way to innocent third parties' mail boxes.
>
>
>
> So I decided to try both to do my best at demoralizing this particular sender and alert outlook.com to their problem. I wrote a messsage (preserved here) with a Cc: to [abuse@outlook.com](mailto:abuse@outlook.com) where the meat is,
>
>

```
Ms Farell,

The address root@skapet.bsdly.net has never been subscribed to any mailing list, for obvious reasons. Whoever sold you an address list with that address on it are criminals and you should at least demand your money back.

Whoever handles abuse@outlook.com will appreciate the attachment, which is a copy of the message as it arrived here with all headers intact.

Yours sincerely,
Peter N. M. Hansteen

```

>
>
> What happened next is quite amazing.
>
>
>
> If my analysis is correct, it may not be possible for senders who are not themselves outlook.com customers to actually reach the outlook.com abuse team.
>
>
>
> Any student or practitioner of SMTP mail delivery should know that SPF records should only happen on ingress, that is at the point where the mail traffic enters your infrastructure and the sender IP address is the original one. Leave the check for later when the message may have been forwarded, and you do not have sufficient data to perform the check.
>
>
>
> Whenever I encounter incredibly stupid and functionally destructive configuration errors like this I tend to believe they're down to simple incompetence and not malice.
>
>
>
> But this one has me wondering. If you essentially require incoming mail to include the contents of spf.outlook.com (currently no less than 81 subnets) as valid senders for the domain, you are essentially saying that only outlook.com customers are allowed to communicate.
>
>
>
> If that restriction is a result of a deliberate choice rather than a simple configuration error, the problem moves out of the technical sphere and could conceivably become a legal matter, depending on what outlook.com have specified in their contracts that they are selling to their customers.
>
>
>
> But let us assume that this is indeed a matter of simple bad luck or incompetence and that the solution is indeed technical.
>
>
>
> I would have liked to report this to whoever does technical things at that domain via email, but unfortunately there are indications that being their customer is a precondition for using that channel of communication to them.
>
>
>
> I hope they fix that, and soon. And then move on to terminating their spamming customers' contracts.
>
>
>
> The main lesson to be learned from this is that when you shop around for email service, please do yourself a favor and make an effort to ensure that your prospective providers actually understand how the modern-ish SMTP addons SPF, DKIM and DMARC actually work.
>
>
>
> Otherwise you may end up receiving more of the mail you don't want than what you do want, and your own mail may end up not being delivered as intended.
>
>

---

News Roundup
----------

### [Running Salt Proxy Minions on OpenBSD](https://mirceaulinic.net/2018-02-14-openbsd-salt-proxy/) ###

>
>
> As I have previously attempted several times in the past, I am (finally) very close to switch to OpenBSD, a more stable and reliable operating system that I like. Before starting to make the actual change on both personal and work computer, I started testing some of the tools Im currently using, and understand what are the expectations.
>
>
>
> In general I didnt encounter issues, or when I did, I found the answers in the documentation (which is really great), or various forums. I didnt find however any questions regarding Proxy Minions on OpenBSD which is why I thought it might be helpful to share my experience.
>
>

* Installation and Startup

>
>
> With these said, I started playing with Salt, and it was simple and straightforward. First step - install Salt: pkg\_add salt. This will bring several ports for Python futures, ZeroMQ, or Tornado which are needed for Salt.
>
>
>
> After configuring the pillar\_roots in the /etc/salt/master config file for the Master, I started up the master process using rcctl:
>
>

* Starting up the Proxy Minions

>
>
> The Salt package for OpenBSD comes with the rc file for salt-proxy as well, /etc/rc.d/salt\_proxy  
>  While typically you run a single regular Minion on a given machine, it is very like that there are multiple Proxy processes. Additionally, the default Salt rc file has the following configuration for the salt-proxy daemon:
>
>

* Starting many Proxy Minions

>
>
> I have managed to startup a Proxy Minion, but what about many? Executing the three commands above for each and every device is tedious and cannot scale very well. I thus have figured the following way:
>
>

* Have a separate rc file per Proxy, each having the daemon instruction explicitly specifying its Minion ID
* Start the service (using the regular Minion that controls the machine where the Proxy processes are running)
* And the test Proxy Minion is then up (after accepting the key, i.e,, salt-key -a test)

>
>
> Extending the same to a (very) large number of Proxy Minions, you can easily manage the rc files and start the services using a Salt State executed on the regular Minion:
>
>

* Using the file.managed State function to generate the contents of the rc file for each Proxy, with its own Minion ID.
* Using the service.running State function start the service.

>
>
> These two steps would suffice to start an arbitrary number of Proxy Minions, and the command executed will always be the same regardless how many processes you aim to manage.
>
>

* Conclusions

>
>
> I am still a novice when it comes to OpenBSD, I have plenty to learn, but it looks like the transition will be much smoother than I expected. I am already looking forward to the handover, and - most importantly - I will no longer be using systemd. :-)
>
>

---

### [LUA boot loader coming very soon](https://lists.freebsd.org/pipermail/freebsd-current/2018-February/068464.html) ###

>
>
> As you may know, the Lua ([http://www.lua.org](http://www.lua.org)) boot loader has been in the works for some time. It started out life as a GSoC in 2014 by Pedro Souza mentored by Wojciech A. Koszek. Rui Paulo created a svn project branch to try to integrate it. I rebased that effort into a github branch which Pedro Arthur fixed up. Over the past year, I've been cleaning up the boot loader  
>  for other reasons, and found the time was ripe to start integrating this into the tree. However, those integration efforts have taken a while as my day-job work on the boot loader took priority. In the mean time, Ed Maste and the FreeBSD Foundation funded Zakary Nafziger to enhance the original GSoC Lua scripts to bring it closer to parity with the evolution of the FORTH menu system since the GSoC project started.
>
>
>
> I'm pleased to announce that all these threads of development have converged and I'll be pushing the FreeBSD Lua Loader later today. This loader uses Lua as its scripting language instead of FORTH. While co-existance is planned, the timeline for it is looking to be a few weeks  
>  and I didn't want to delay pushing this into the tree for that.
>
>
>
> To try the loader, you'll need to build WITHOUT\_FORTH=yes and WITH\_LOADER\_LUA=yes. Fortunately, you needn't do a full world to do this, you can do it in src/stand and install the result (be sure to have the options for both the build and the install). This will replace your current  
>  /boot/loader that is scripted with FORTH to one that's scripted with Lua.  
>  It will install the lua scripts in /boot/lua. The boot is scripted with /boot/lua/loader.lua instead of /boot/loader.rc. You are strongly advised to create a backup copy of /boot/loader before testing (eg cp /boot/loader /boot/loader\_forth), since you'll need to boot that from boot2 if something  
>  goes wrong. I've tested it extensively, though, with userboot.so and it's test program, so all the initial kinks of finding the lua scripts, etc have been worked out.
>
>
>
> While it's possible to build all the /boot/loader variants with Lua, I've just tested a BIOS booting /boot/loader both with and without menus enabled. I've not tested any of the other variants and the instructions for testing some of them may be rather tedious (especially UEFI, if you want a  
>  simple path to back out). Since there's not been full convergence testing, you'll almost certainly find bumps in this system. Also, all the build-system APIs are likely not yet final.
>
>
>
> I put MFC after a month on the commit. Due to the heroic (dare I say almost crazy) work of Kyle Evans on merging all the revs from -current to 11, I'm planning a MFC to 11 after the co-existence issues are hammered out. In 11, FORTH will be the default, and Lua will be built by default, but users will have to do something to use it. 12, both FORTH and Lua will be built and installed, with Lua as default (barring unforeseen complications). Once the co-existence stuff goes in, I imagine we'll make the switch to Lua by default shortly after that. In 13, FORTH will be removed unless there's a really really compelling case made to keep it.
>
>
>
> So please give it a spin and give me any feedback, documentation updates and/or bug fixes. I'm especially interested in reviews from people that have embedded Lua in other projects or experts in Lua that can improve the robustness of the menu code.
>
>
> ---
>

### [Bitcoin Full Node on FreeBSD](https://bsdmag.org/5374-2/) ###

* What is a Bitcoin ?

>
>
> Bitcoin is a valuable popular open-source cryptocurrency that was invented by Satoshi Nakamoto in 2009. Bitcoins have value because they possess same characteristics like money (durability, portability, fungibility, scarcity, divisibility, and recognizability), but based on the properties of mathematics rather than on physical properties (like gold and silver) or trust in central authorities (like fiat currencies). In short, Bitcoin is backed by mathematics.  
>  Bitcoin is the first decentralized peer-to-peer cryptocurrency that is controlled by its users.  
>  Transactions take place directly between users, and are later verified by network nodes with digital signature and then placed in a public distributed ledger called a blockchain. Bitcoin is unique in that only 21 million bitcoins will ever be created. The unit of the bitcoin system is bitcoin or mBTC.
>
>

* What is a Bitcoin Wallet ?

>
>
> A wallet is nothing more than a pair of public and private keys that are created by a client to store the digital credentials for your bitcoin.
>
>
>
> There are several types of wallets:
>
>

```
Desktop Wallet
Token Wallet
Online Wallet
Mobile Wallet
A token wallet is the safest way to work with bitcoin network, but you can use your mobile or pc as a bitcoin wallet.

```

* What is a Blockchain?

>
>
> A blockchain is a ledger that records bitcoin transactions. The blockchain is a distributed database that achieves independent verification of the chain of ownership. Each network node stores its own copy of the blockchain. Transactions will broadcast on the bitcoin network, and about 2400 transactions create a block. These blocks are building blocks of the blockchain.
>
>

* What is Mining?

>
>
> Mining is the process of dedicating computing power to process transactions, secure the network, and keep everyone in the system synchronized together. It has been designed to be fully decentralized.  
>  Miners need mining software with specialized hardware. Mining software listens for transactions broadcasted through the peer-to-peer network and performs appropriate tasks to process and confirm these transactions. Bitcoin miners perform this work because they can earn transaction fees paid by users for faster transaction processing.  
>  New transactions have to be confirmed then be included in a block along with a mathematical proof of work. Such proofs are very hard to generate because there is no way to create them other than by trying billions of calculations per second. Hence, miners are required to perform these calculations before their blocks are accepted by the network and before they are rewarded. As more people start to mine, the difficulty of finding valid blocks is automatically increased by the network to ensure that the average time to find a block remains equal to 10 minutes. As a result, mining is a very competitive business where no individual miner can control what is included in the blockchain.  
>  The proof of work is also designed to depend on the previous block to force a chronological order in the blockchain. This makes it exponentially difficult to reverse previous transactions because it would require the recalculation of the proofs of work of all the subsequent blocks. When two blocks are found at the same time, miners work on the first block they receive and switch to the longest chain of blocks as soon as the next block is found. This allows mining to secure and maintain a global consensus based on processing power.
>
>

* What is Pooled Mining?

>
>
> You have more chances if you participate with others to create a block. In a pool, all participating miners get paid every time a participating server solves a block. The payment depends on the amount of work an individual miner contributed to help find that block.
>
>

* What is a Full Node?

>
>
> A full node is a client that fully validates transactions and blocks. Full nodes also help the network by accepting transactions and blocks from other full nodes, validating those transactions and blocks, and then relaying them to further full nodes.  
>  Many people and organizations volunteer to run full nodes using spare computing and bandwidth resources.
>
>

* What is a Bitcoind?

>
>
> bitcoind is a Bitcoin client under the MIT license in 32-bit and 64-bit versions for Windows, GNU/Linux-based OSes, Mac OS X, OpenBSD and FreeBSD as well.
>
>
>
> Conclusion
>
>

* Cryptocurrencies are replacement for banking we know today, and bitcoin is the game changer. Mining bitcoin with typical hardware is not a good idea. It needs specialized devices like ASIC, but you can create a full node and help the bitcoin network.
* Useful Links
  * [https://en.wikipedia.org/wiki/Cryptocurrency](https://en.wikipedia.org/wiki/Cryptocurrency)
  * [https://bitcoin.org/en/faq](https://bitcoin.org/en/faq) \*\*\*

### Latest DRM Graphics work ###

* The DRM Graphics stack from Linux is ported to FreeBSD on an ongoing basis to provide support for accelerated graphics for Intel and AMD GPUs.
* [The LinuxKPI bits that the drm-next-kmod driver port depends on have been merged into stable/11 and will be included as part of the upcoming FreeBSD 11.2 ](https://svnweb.freebsd.org/ports?view=revision&revision=462202)
* [Additionally, the version of the drives has been updated from Linux 4.9 to Linux 4.11 with a number of additional devices being supported](https://lists.freebsd.org/pipermail/freebsd-current/2018-February/068690.html) \*\*\*

### [How does `cd` work?](https://blog.safia.rocks/post/171311670379/how-does-cd-work) ###

>
>
> In my last blog post, I dove into some of the code behind the sudo command. I thought this was pretty fun. sudo is one of those commands that I use quite often but havent had the chance to look into truly. I started thinking about other commands that I use on a daily basis but had little understanding of the internals of. The first command that came to mind is cd. cd stands for change directory. Simply put, it allows you to set your current working directory to a different directory.  
>  I read through some of the code that was defined in this file. Some of it was in functions, and other bits were in templates, but after a while, I figured that most of the code was a wrapper around a function called chdir. A lot of the functions defined in the cd.def file linked above actually just invoke chdir and handle errors and parameter cleaning.  
>  So all in all, here is what happens when you run cd on the command line.
>
>

* The cd builtin is invoked as part of the Bash shell.
* The Bash shell invokes the chdir function.
* The chdir function is part of Unix and invokes the chdir system call.
* The Unix kernel executes the chdir call and does its own low-level thing.

>
>
> I could dive in a little bit more into how #4 works, but lets be honest, Ive already read too much code at this point, and my eyes are starting to hurt.
>
>
> ---
>

Beastie Bits
----------

* [Stockholm BSD User Group: March 22](https://www.meetup.com/BSD-Users-Stockholm/events/247552279/)
* [Open Source Hardware Camp 2018 (30/06 & 01/07) Call for Participation](http://mailman.uk.freebsd.org/pipermail/ukfreebsd/2018-February/014182.html)
* [Initial release schedule announcement for FreeBSD 11.2](https://www.freebsd.org/releases/11.2R/schedule.html)
* [Serious Shell Programming (Devin Teske)](https://www.gitbook.com/book/freebsdfrau/serious-shell-programming/details)
* [SSH Mastery 2/e out](https://blather.michaelwlucas.com/archives/3115)
* [TCP Fast Open client side lands in FreeBSD ](https://svnweb.freebsd.org/base?view=revision&revision=330001)
* [Help the Tor BSD Project increase the OS diversity of Tor nodes, for your own safety, and everyone else's ](https://torbsd.org/open-letter.html)
* [5 Differences Between TrueOS & Linux](https://www.kompulsa.com/2018/02/23/5-differences-trueos-linux/) \*\*\*

Feedback/Questions
----------

* Ambrose - [Bunch of questions](http://dpaste.com/0KRRG18#wrap)
* Eddy - [ZFSoL with single SSD](http://dpaste.com/0MTXYJN#wrap)

---