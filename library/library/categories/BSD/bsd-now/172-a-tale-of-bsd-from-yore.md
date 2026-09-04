+++
title = "172: A tale of BSD from yore"
description = "This week on BSDNow, we have a very special guest joining us to tell us a tale of the early days in BSD history. That plus some new OpenSSH goodness, shell scripting utilities and much more. Stay tuned for your place to B...SD!This episode was brought to you by[![iXsyst"
date = "2016-12-14T13:00:00Z"
url = "https://www.bsdnow.tv/172"
author = "feedback@bsdnow.tv (JT Pennington)"
text = ""
lastupdated = "2026-03-26T14:37:50.972090090Z"
seen = true
+++

This week on BSDNow, we have a very special guest joining us to tell us a tale of the early days in BSD history. That plus some new OpenSSH goodness, shell scripting utilities and much more. Stay tuned for your place to B...SD!

This episode was brought to you by
----------

[![iXsystems - Enterprise Servers and Storage for Open Source](/images/1.png)](http://www.ixsystems.com/bsdnow)[![](/images/2.png) alt="DigitalOcean - Simple Cloud Hosting, Built for Developers" /\>](http://www.digitalocean.com/)[![Tarsnap - Online Backups for the Truly Paranoid](/images/3.png)](http://www.tarsnap.com/bsdnow)

---

Headlines
----------

### [Call For Testing: OpenSSH 7.4 ](http://marc.info/?l=openssh-unix-dev&m=148167688911316&w=2) ###

* Getting ready to head into the holidays for for the end of 2016 means some of us will have spare time on our hands. What a perfect time to get some call for testing work done!
* Damien Miller has issued a public CFT for the upcoming OpenSSH 7.4 release, which considering how much we all rely on SSH I would expect will get some eager volunteers for testing.
* What are some of the potential breakers?

>
>
> “\* This release removes server support for the SSH v.1 protocol.
>
>
>
> * ssh(1): Remove 3des-cbc from the client's default proposal. 64-bit  
>    block ciphers are not safe in 2016 and we don't want to wait until  
>    attacks like SWEET32 are extended to SSH. As 3des-cbc was the  
>    only mandatory cipher in the SSH RFCs, this may cause problems  
>    connecting to older devices using the default configuration,  
>    but it's highly likely that such devices already need explicit  
>    configuration for key exchange and hostkey algorithms already  
>    anyway.
>   
>   
> * sshd(8): Remove support for pre-authentication compression.  
>    Doing compression early in the protocol probably seemed reasonable  
>    in the 1990s, but today it's clearly a bad idea in terms of both  
>    cryptography (cf. multiple compression oracle attacks in TLS) and  
>    attack surface. Pre-auth compression support has been disabled by  
>    default for \>10 years. Support remains in the client.
>   
>   
> * ssh-agent will refuse to load PKCS#11 modules outside a whitelist  
>    of trusted paths by default. The path whitelist may be specified  
>    at run-time.
>   
>   
> * sshd(8): When a forced-command appears in both a certificate and  
>    an authorized keys/principals command= restriction, sshd will now  
>    refuse to accept the certificate unless they are identical.  
>    The previous (documented) behaviour of having the certificate  
>    forced-command override the other could be a bit confusing and  
>    error-prone.
>   
>   
> * sshd(8): Remove the UseLogin configuration directive and support  
>    for having /bin/login manage login sessions.“
>   
>   
>
>

* What about new features? 7.4 has some of those to wake you up also:

>
>
> “\* ssh(1): Add a proxy multiplexing mode to ssh(1) inspired by the  
>  version in PuTTY by Simon Tatham. This allows a multiplexing  
>  client to communicate with the master process using a subset of  
>  the SSH packet and channels protocol over a Unix-domain socket,  
>  with the main process acting as a proxy that translates channel  
>  IDs, etc. This allows multiplexing mode to run on systems that  
>  lack file- descriptor passing (used by current multiplexing  
>  code) and potentially, in conjunction with Unix-domain socket  
>  forwarding, with the client and multiplexing master process on  
>  different machines. Multiplexing proxy mode may be invoked using  
>  "ssh -O proxy ..."
>
>
>
> * sshd(8): Add a sshd\_config DisableForwaring option that disables  
>    X11, agent, TCP, tunnel and Unix domain socket forwarding, as well  
>    as anything else we might implement in the future. Like the  
>    'restrict' authorized\_keys flag, this is intended to be a simple  
>    and future-proof way of restricting an account.
>   
>   
> * sshd(8), ssh(1): Support the "curve25519-sha256" key exchange  
>    method. This is identical to the currently-support method named  
>    "[curve25519-sha256@libssh.org](mailto:curve25519-sha256@libssh.org)".
>   
>   
> * sshd(8): Improve handling of SIGHUP by checking to see if sshd is  
>    already daemonised at startup and skipping the call to daemon(3)  
>    if it is. This ensures that a SIGHUP restart of sshd(8) will  
>    retain the same process-ID as the initial execution. sshd(8) will  
>    also now unlink the PidFile prior to SIGHUP restart and re-create  
>    it after a successful restart, rather than leaving a stale file in  
>    the case of a configuration error. bz#2641
>   
>   
> * sshd(8): Allow ClientAliveInterval and ClientAliveCountMax  
>    directives to appear in sshd\_config Match blocks.
>   
>   
> * sshd(8): Add %-escapes to AuthorizedPrincipalsCommand to match  
>    those supported by AuthorizedKeysCommand (key, key type,  
>    fingerprint, etc.) and a few more to provide access to the  
>    contents of the certificate being offered.
>   
>   
> * Added regression tests for string matching, address matching and  
>    string sanitisation functions.
>   
>   
> * Improved the key exchange fuzzer harness.“
>   
>   
>
>

* Get those tests done and be sure to send feedback, both positive and negative. \*\*\*

### [How My Printer Caused Excessive Syscalls & UDP Traffic](https://zinascii.com/2014/how-my-printer-caused-excessive-syscalls.html) ###

>
>
> “3,000 syscalls a second, on an idle machine? That doesn’t seem right. I just booted this machine. The only processes running are those required to boot the SmartOS Global Zone, which is minimal.”
>
>
>
> This is a story from 2014, about debugging a machine that was being slowed down by excessive syscalls and UDP traffic. It is also an excellent walkthrough of the basics of DTrace
>
>
>
> “Well, at least I have DTrace. I can use this one-liner to figure out what syscalls are being made across the entire system.”
>
>
>
> dtrace -n 'syscall:::entry { @[probefunc,probename] = count(); }'
>
>
>
> “Wow! That is a lot of lwp\_sigmask calls. Now that I know what is being called, it’s time to find out who is doing the calling? I’ll use another one-liner to show me the most common user stacks invoking lwp\_sigmask.”
>
>
>
> dtrace -n 'syscall::lwp\_sigmask:entry { @[ustack()] = count(); }'
>
>
>
> “Okay, so this mdnsd code is causing all the trouble. What is the distribution of syscalls for the mdnsd program?”
>
>
>
> dtrace -n 'syscall:::entry /execname == "mdnsd"/ { @[probefunc] = count(); } tick-1s { exit(0); }'
>
>
>
> “Lots of signal masking and polling. What the hell! Why is it doing this? What is mdnsd anyways? Is there a man page? Googling for mdns reveals that it is used for resolving host names in small networks, like my home network. It uses UDP, and requires zero configuration. Nothing obvious to explain why it’s flipping out. I feel helpless. I turn to the only thing I can trust, the code.”
>
>
>
> “Woah boy, this is some messy looking code. This would not pass illumos cstyle checks. Turns out this is code from Darwin—the kernel of OSX.”
>
>
>
> “Hmmm…an idea pops into my computer animal brain. I wonder…I wonder if my MacBook is also experiencing abnormal syscall rates? Nooo, that can’t be it. Why would both my SmartOS server and MacBook both have the same problem? There is no good technical reason to link these two. But, then again, I’m dealing with computers here, and I’ve seen a lot of strange things over the years—I switch to my laptop.”
>
>
>
> sudo dtrace -n 'syscall::: { @[execname] = count(); } tick-1s { exit(0); }'
>
>
>
> Same thing, except mdns is called discoverd on OS X
>
>
>
> “I ask my friend Steve Vinoski to run the same DTrace one-liner on his OSX machines. He has both Yosemite and the older Mountain Lion. But, to my dismay, neither of his machines are exhibiting high syscall rates. My search continues.”
>
>
>
> “Not sure what to do next, I open the OSX Activity Monitor. In desperation I click on the Network tab.”
>
>
>
> “ HOLE—E—SHIT! Two-Hundred-and-Seventy Million packets received by discoveryd. Obviously, I need to stop looking at code and start looking at my network. I hop back onto my SmartOS machine and check network interface statistics.”
>
>
>
> “Whatever is causing all this, it is sending about 200 packets a second. At this point, the only thing left to do is actually inspect some of these incoming packets. I run snoop(1M) to collect events on the e1000g0 interface, stopping at about 600 events. Then I view the first 15.”
>
>
>
> “ A constant stream of mDNS packets arriving from IP 10.0.1.8. I know that this IP is not any of my computers. The only devices left are my iPhone, AppleTV, and Canon printer. Wait a minute! The printer! Two days earlier I heard some beeping noises…”
>
>
>
> “I own a Canon PIXMA MG6120 printer. It has a touch interface with a small LCD at the top, used to set various options. Since it sits next to my desk I sometimes lay things on top of it like a book or maybe a plate after I’m done eating. If I lay things in the wrong place it will activate the touch interface and cause repeated pressing. Each press makes a beeping noise. If the object lays there long enough the printer locks up and I have to reboot it. Just such events occurred two days earlier.”
>
>
>
> “I fire up dladm again to monitor incoming packets in realtime. Then I turn to the printer. I move all the crap off of it: two books, an empty plate, and the title for my Suzuki SV650 that I’ve been meaning to sell for the last year. I try to use the touch screen on top of the printer. It’s locked up, as expected. I cut power to the printer and whip my head back to my terminal.”
>
>
>
> No more packet storm
>
>
>
> “Giddy, I run DTrace again to count syscalls.”
>
>
>
> “I’m not sure whether to laugh or cry. I laugh, because, LOL computers. There’s some new dumb shit you deal with everyday, better to roll with the punches and laugh. You live longer that way. At least I got to flex my DTrace muscles a bit. In fact, I felt a bit like Brendan Gregg when he was debugging why OSX was dropping keystrokes.”
>
>
>
> “I didn’t bother to root cause why my printer turned into a UDP machine gun. I don’t intend to either. I have better things to do, and if rebooting solves the problem then I’m happy. Besides, I had to get back to what I was trying to do six hours before I started debugging this damn thing.”
>
>
>
> There you go. The Internet of Terror has already been on your LAN for years.
>
>
> ---
>

### [Making Getaddrinfo Concurrent in Python on Mac OS and BSD](https://emptysqua.re/blog/getaddrinfo-cpython-mac-and-bsd/) ###

* We have a very fun blog post today to pass along originally authored by “A. Jesse Jiryu Davis”. Specifically the tale of one man’s quest to unify the Getaddrinfo in Python with Mac OS and BSD.
* To give you a small taste of this tale, let us pass along just the introduction

>
>
> “Tell us about the time you made DNS resolution concurrent in Python on Mac and BSD. No, no, you do not want to hear that story, my friends. It is nothing but old lore and #ifdefs.
>
>
>
> But you made Python more scalable. The saga of Steve Jobs was sung to you by a mysterious wizard with a fanciful nickname! Tell us!
>
>
>
> Gather round, then. I will tell you how I unearthed a lost secret, unbound Python from old shackles, and banished an ancient and horrible Mutex Troll. Let us begin at the beginning.“
>
>

* Is your interest piqued? It should be. I’m not sure we could do this blog post justice trying to read it aloud here, but definetly recommend if you want to see how he managed to get this bit of code working cross platform. (And it’s highly entertaining as well)

>
>
> “A long time ago, in the 1980s, a coven of Berkeley sorcerers crafted an operating system. They named it after themselves: the Berkeley Software Distribution, or BSD. For generations they nurtured it, growing it and adding features. One night, they conjured a powerful function that could resolve hostnames to IPv4 or IPv6 addresses. It was called getaddrinfo. The function was mighty, but in years to come it would grow dangerous, for the sorcerers had not made getaddrinfo thread-safe.”
>
>
>
> “As ages passed, BSD spawned many offspring. There were FreeBSD, OpenBSD, NetBSD, and in time, Mac OS X. Each made its copy of getaddrinfo thread safe, at different times and different ways. Some operating systems retained scribes who recorded these events in the annals. Some did not.”
>
>

* The story continues as our hero battles the Mutex Troll and quests for ancient knowledge

>
>
> “Apple engineers are not like you and me — they are a shy and secretive folk. They publish only what code they must from Darwin. Their comings and goings are recorded in no bug tracker, their works in no changelog. To learn their secrets, one must delve deep.”
>
>
>
> “There is a tiny coven of NYC BSD users who meet at the tavern called Stone Creek, near my dwelling. They are aged and fierce, but I made the Sign of the Trident and supplicated them humbly for advice, and they were kindly to me.”
>
>

* Spoiler: “Without a word, the mercenary troll shouldered its axe and trudged off in search of other patrons on other platforms. Never again would it hold hostage the worthy smiths forging Python code on BSD.” \*\*\*

### [Using release(7) to create FreeBSD images for OpenStack ](https://diegocasati.com/2016/12/13/using-release7-to-create-freebsd-images-for-openstack-yes-you-can-do-it/) ###

* Following a recent episode where we covered a walk through on how to create FreeBSD guest OpenStack images, we wondered if it would be possible to integrate this process into the FreeBSD release(7) process, so they images could be generated consistently and automatically
* Being the awesome audience that you are, one of you responded by doing exactly that

>
>
> “During a recent BSDNow podcast, Allan and Kris mentioned that it would be nice to have a tutorial on how to create a FreeBSD image for OpenStack using the official release(7) tools. With that, it came to me that: #1 I do have access to an OpenStack environment and #2 I am interested in having FreeBSD as a guest image in my environment. Looks like I was up for the challenge.”
>
>
>
> “Previously, I’ve had success running FreeBSD 11.0-RELEASE on OpenStack but more could/should be done. For instance, as suggested by Allan, wouldn’t be nice to deploy the latest code from FreeBSD ? Running -STABLE or even -CURRENT ? Yes, it would. Also, wouldn’t it be nice to customize these images for a specific need? I’d say ‘Yes’ for that as well.”
>
>
>
> “After some research I found that the current openstack.conf file, located at /usr/src/release/tools/ could use some extra tweaks to get where I wanted. I’ve created and attached that to a bugzilla on the same topic. You can read about that [here](https://bugs.freebsd.org/bugzilla/show_bug.cgi?id=213396).”
>
>

* Steps:
  * Fetch the FreeBSD source code and extract it under /usr/src
  * Once the code is in place, follow the regular process of build(7) and perform a `make buildworld buildkernel`
  * Change into the release directory (/usr/src/release) and perform a make cloudware
  * make cloudware-release WITH\_CLOUDWARE=yes CLOUDWARE=OPENSTACK VMIMAGE=2G

>
>
> “That’s it! This will generate a qcow2 image with 1.4G in size and a raw image of 2G. The entire process uses the release(7) toolchain to generate the image and should work with newer versions of FreeBSD.”
>
>
>
> * The patch has already been [committed to FreeBSD ](https://svnweb.freebsd.org/base?view=revision&revision=310047) \*\*\*
>
>

Interview - Rod Grimes - [rgrimes@freebsd.org](mailto:rgrimes@freebsd.org)
----------

* Want to help fund the development of GPU Passthru? [Visit bhyve.org](http://bhyve.org/) \*\*\*

News Roundup
----------

### [Configuring the FreeBSD automounter](http://blog.khubla.com/freebsd/configuring-the-freebsd-automounter) ###

* Ever had to configure the FreeBSD auto-mounting daemon? Today we have a blog post that walks us through a few of the configuration knobs you have at your disposal.
* First up, Tom shows us his /etc/fstab file, and the various UFS partitions he has setup with the ‘noauto’ flag so they are not mounted at system boot.
* His amd.conf file is pretty basic, with just options enabled to restart mounts, and unmount on exit.
* Where most users will most likely want to pay attention is in the crafting of an amd.map file
* Within this file, we have the various command-foo which performs mounts and unmounts of targeted disks / file-systems on demand.
* Pay special attention to all the special chars, since those all matter and a stray or missing ; could be a source of failure.
* Lastly a few knobs in rc.conf will enable the various services and a reboot should confirm the functionality. \*\*\*

### [l2k16 hackathon report: LibreSSL manuals now in mdoc(7)](http://undeadly.org/cgi?action=article&sid=20161114174451) ###

* Hackathon report by Ingo Schwarze

>
>
> “Back in the spring two years ago, Kristaps Dzonsons started the pod2mdoc(1) conversion utility, and less than a month later, the LibreSSL project began. During the general summer hackathon in the same year, g2k14, Anthony Bentley started using pod2mdoc(1) for converting LibreSSL manuals to mdoc(7).”
>
>
>
> “Back then, doing so still was a pain, because pod2mdoc(1) was still full of bugs and had gaping holes in functionality. For example, Anthony was forced to basically translate the SYNOPSIS sections by hand, and to fix up .Fn and .Xr in the body by hand as well. All the same, he speedily finished all of libssl, and in the autumn of the same year, he mustered the courage to commit his work.”
>
>
>
> “Near the end of the following winter, i improved the pod2mdoc(1) tool to actually become convenient in practice and started work on libcrypto, converting about 50 out of the about 190 manuals. Max Fillinger also helped a bit, converting a handful of pages, but i fear i tarried too much checking and committing his work, so he quickly gave up on the task. After that, almost nothing happened for a full year.”
>
>
>
> “Now i was finally fed up with the messy situation and decided to put an end to it. So i went to Toulouse and finished the conversion of the remaining 130 manual pages in libcrypto, such that you can now view the documentation of all functions”
>
>
> ---
>

### [Interactive Terminal Utility: smenu](https://github.com/p-gen/smenu) ###

* Ok, I’ve made no secret of my love for shell scripting. Well today we have a new (somewhat new to us) tool to bring your way.
* Have you ever needed to deal with large lists of data, perhaps as the result of a long specially crafted pipe?
* What if you need to select a specific value from a range and then continue processing?
* Enter ‘smenu’ which can help make your scripting life easier.

>
>
> “smenu is a selection filter just like sed is an editing filter.
>
>
>
> This simple tool reads words from the standard input, presents them in a cool interactive window after the current line on the terminal and writes the selected word, if any, on the standard output.
>
>
>
> After having unsuccessfully searched the NET for what I wanted, I decided to try to write my own.
>
>
>
> I have tried hard to made its usage as simple as possible. It should work, even when using an old vt100 terminal and is UTF-8 aware.“
>
>

* What this means, is in your interactive scripts, you can much easier present the user with a cursor driven menu to select from a range of possible choices. (Without needing to craft a bunch of dialog flags)
* Take a look, and hopefully you’ll be able to find creative uses for your shell scripts in the future. \*\*\*

### [Ubuntu still isn't free software](http://mjg59.dreamwidth.org/45939.html) ###

>
>
> “Any redistribution of modified versions of Ubuntu must be approved, certified or provided by Canonical if you are going to associate it with the Trademarks. Otherwise you must remove and replace the Trademarks and will need to recompile the source code to create your own binaries. This does not affect your rights under any open source licence applicable to any of the components of Ubuntu. If you need us to approve, certify or provide modified versions for redistribution you will require a licence agreement from Canonical, for which you may be required to pay. For further information, please contact us”
>
>
>
> “Mark Shuttleworth [just blogged](http://insights.ubuntu.com/2016/12/01/taking-a-stand-against-unstable-risky-unofficial-ubuntu-images/) about their stance against unofficial Ubuntu images. The assertion is that a cloud hoster is providing unofficial and modified Ubuntu images, and that these images are meaningfully different from upstream Ubuntu in terms of their functionality and security. Users are attempting to make use of these images, are finding that they don't work properly and are assuming that Ubuntu is a shoddy product. This is an entirely legitimate concern, and if Canonical are acting to reduce user confusion then they should be commended for that.”
>
>
>
> “The appropriate means to handle this kind of issue is trademark law. If someone claims that something is Ubuntu when it isn't, that's probably an infringement of the trademark and it's entirely reasonable for the trademark owner to take action to protect the value associated with their trademark. But Canonical's IP policy goes much further than that - it can be interpreted as meaning[1] that you can't distribute works based on Ubuntu without paying Canonical for the privilege, even if you call it something other than Ubuntu. [1]: And by "interpreted as meaning" I mean that's what it says and Canonical refuse to say otherwise”
>
>
>
> “If you ask a copyright holder if you can give a copy of their work to someone else (assuming it doesn't infringe trademark law), and they say no or insist you need an additional contract, it's not free software. If they insist that you recompile source code before you can give copies to someone else, it's not free software. Asking that you remove trademarks that would otherwise infringe trademark law is fine, but if you can't use their trademarks in non-infringing ways, that's still not free software.”
>
>
>
> “Canonical's IP policy continues to impose restrictions on all of these things, and therefore Ubuntu is not free software.”
>
>
> ---
>

Beastie Bits
----------

* [OPNsense 16.7.10 released](https://opnsense.org/opnsense-16-7-10-released/)

* [OpenBSD Foundation Welcomes First Iridium Donor: Smartisan](http://undeadly.org/cgi?action=article&sid=20161123193708&mode=expanded&count=8)

* [Jan Koum donates $500,000 to FreeBSD](https://www.freebsdfoundation.org/blog/foundation-announces-new-uranium-donor/)

* [The Soviet Russia, BSD makes you](https://en.wikipedia.org/wiki/DEMOS)

---

Feedback/Questions
----------

* [ Jason - Value](http://pastebin.com/gRN4Lzy8)
* [ Hamza - Shell Scripting](http://pastebin.com/GZYjRmSR)
  * [Blog link](http://aikchar.me/blog/unix-shell-programming-lessons-learned.html)

* [ Dave - Migrating to FreeBSD](http://pastebin.com/hEBu3Drp)
* [ Dan - Which BSD?](http://pastebin.com/1HpKqCSt)
* [ Zach - AMD Video](http://pastebin.com/4Aj5ebns) \*\*\*