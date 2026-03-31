+++
title = "286: Old Machine Revival"
description = 'Adding glue to a desktop environment, flashing the BIOS on a PC Engine, revive a Cisco IDS into a capable OpenBSD computer, An OpenBSD WindowMaker desktop, RealTime data compression, the love for pipes, and more.\Headlines   \[Adding Glue To a Desktop Environment](https://ve'
date = "2019-02-21T21:00:00Z"
url = "https://www.bsdnow.tv/286"
author = "feedback@bsdnow.tv (JT Pennington)"
text = ""
lastupdated = "2026-03-26T14:37:50.659996100Z"
seen = true
+++

Adding glue to a desktop environment, flashing the BIOS on a PC Engine, revive a Cisco IDS into a capable OpenBSD computer, An OpenBSD WindowMaker desktop, RealTime data compression, the love for pipes, and more.

\##Headlines  
 \###[Adding Glue To a Desktop Environment](https://venam.nixers.net/blog/unix/2019/01/07/win-automation.html)

>
>
> In this article we will put some light on a lot of tools used in the world of Unix desktop environment customization, particularly regarding wmctrl, wmutils, xev, xtruss, xwininfo, xprop, xdotools, xdo, sxhkd, xbindkeys, speckeysd, xchainkeys, alttab, triggerhappy, gTile, gidmgr, keynav, and more. If those don’t make sense then this article will help. Let’s hope this can open your mind to new possibilities.  
>  With that in mind we can wonder if what’s actually needed from a window manager, presentation and operation, can be split up and complemented with other tools. We can also start thinking laterally, the communication and interaction between the different components of the environment. We have the freedom to do so because the X protocol is transparent and components usually implement many standards for interfacing between windows. It’s like gluing parts together to create a desktop environment.
>
>

* The tools we’ll talk about fall into one of those categories:
* Debugging
* Window manipulation
* Simulation of interaction
* Extended manipulation
* Hotkey daemon
* Layout manager

---

\###[Flashing the BIOS on the PC Engines APU4c4](https://github.com/lattera/articles/blob/master/hardware/apu/2019-02-05_flashing_bios/article.md)

>
>
> I absolutely love the PC Engines APU devices. I use them for testing HardenedBSD experimental features in more constrained 64-bit environments and firewalls. Their USB and mSATA ports have a few quirks, and I bumped up against a major quirk that required flashing a different BIOS as a workaround. This article details the hacky way in which I went about doing that.  
>  What prompted this article is that something in either the CAM or GEOM layer in FreeBSD 11.2 caused the mSATA to hang, preventing file writes. OPNsense 18.7 uses FreeBSD 11.1 whereas the recently-released OPNsense 19.1 uses HardenedBSD 11.2 (based on FreeBSD 11.2). I reached out to PC Engines directly, and they let me know that the issue is a known BIOS issue. Flashing the “legacy” BIOS series would provide me with a working system.  
>  It also just so happens that a new “legacy” BIOS version was just released which turns on ECC mode for the RAM. So, I get a working OPNsense install AND ECC RAM! I’ll have one bird for dinner, the other for dessert.  
>  Though I’m using an APU4, these instructions should work for the other APU devices. The BIOS ROM download URLs should be changed to reflect the device you’re targeting along with the BIOS version you wish to deploy.  
>  SPECIAL NOTE: There be dragons! I’m primarily writing this article to document the procedure for my own purposes. My memory tends to be pretty faulty these days. So, if something goes wrong, please do not hold me responsible. You’re the one at the keyboard. ;)  
>  VERY SPECIAL NOTE: We’ll use the mSATA drive for swap space, just in case. Should the swap space be used, it will destroy whatever is on the disk.
>
>

---

\##News Roundup  
 \###[Revive a Cisco IDS into a capable OpenBSD computer!](https://komlositech.wordpress.com/2018/12/30/revive-a-cisco-ids-into-a-capable-openbsd-firewall/)

>
>
> Even though Cisco equipment is very capable, it tends to become End-of-Life before you can say “planned obsolescence”. Websites become bigger, bandwidths increase, and as a side effect of those “improvements”, routers, firewalls, and in this case, intrusion prevention systems get old quicker and quicker.  
>  Apparently, this was also the case for the Cisco IDS-4215 Intrusion Detection Sensor that I was given a few months ago.  
>  I’m not too proud to admit that at first, I didn’t care about the machine itself, but rather about the add-on PCI network card with 4 Fast Ethernet interfaces. The sensor has obviously seen better days, as it had a broken front panel and needed some cleaning, but upon a closer inspection under the hood (which is held closed by the 4 screws on top), this IDS consists of an embedded Celeron PC with two onboard Ethernet cards, a 2.5″ IDE hard disk, a CF card, and 2 PCI expansion slots (more on them later). Oh, and don’t forget the nasty server-grade fan, which pushed very little air for the noise it was making.
>
>

---

\###[An OpenBSD desktop using WindowMaker](https://www.tumfatig.net/20190215/an-openbsd-desktop-using-windowmaker/?utm_source=discoverbsd)

>
>
> Since I started using \*N?X, I’ve regularly used WindowMaker. I’ve always liked the look and feel, the dock system and the dockapps. It may look a bit oldish nowadays. And that’s enough to try to change this. So here it is, a 2019 flavored WindowMaker Desktop, running on OpenBSD 6.4/amd64.  
>  This configuration uses the Nord color-scheme, the Adapta-Nokto-Eta GTK theme and the Moblin Unofficial Icons icon set. I did remove applications icons. I just don’t need them on the bottom of the screen as I heavily use “F11” to pop-up the windows list. To be able to do that and keep the dockapps, I tweaked my \~/GNUstep/Defaults/WMWindowAttributes and created a \~/GNUstep/Library/WindowMaker/Themes/Nord.themed/style.  
>  And here it is, the NeXT OpenBSD Desktop!
>
>

---

\###[RealTime Data Compression](https://fastcompression.blogspot.com/2019/01/opaque-types-and-static-allocation.html)

>
>
> In a previous episode, we’ve seen that it is possible to create opaque types. However, creation and destruction of such type must be delegated to some dedicated functions, which themselves rely on dynamic allocation mechanisms.  
>  Sometimes, it can be convenient to bypass the heap, and all its malloc() / free() shenanigans. Pushing a structure onto the stack, or within thread-local storage, are natural capabilities offered by a normal struct. It can be desirable at times.  
>  The previously described opaque type is so secret that it has no size, hence is not suitable for such scenario.  
>  Fortunately, static opaque types are possible.  
>  The main idea is to create a “shell type”, with a known size and an alignment, able to host the target (private) structure.  
>  For safer maintenance, the shell type and the target structure must be kept in sync, by using typically a static assert. It will ensure that the shell type is always large enough to host the target structure. This check is important to automatically detect future evolution of the target structure.
>
>

---

\###[For the Love of Pipes](https://blog.jessfraz.com/post/for-the-love-of-pipes/)

>
>
> My top used shell command is |. This is called a pipe.  
>  In brief, the | allows for the output of one program (on the left) to become the input of another program (on the right). It is a way of connecting two commands together.  
>  According to [doc.cat-v.org/unix/pipes/](http://doc.cat-v.org/unix/pipes/), the origin of pipes came long before Unix. Pipes can be traced back to this note from Doug McIlroy in 1964
>
>

---

\##Beastie Bits

* [Installation Notes for NetBSD/i386 0.9](https://scontent-iad3-1.xx.fbcdn.net/v/t1.0-9/52532824_10216880223150142_5567720793346932736_n.jpg?_nc_cat=100&_nc_ht=scontent-iad3-1.xx&oh=f4de0999bd268725b39969435c1e2d82&oe=5D23255E)
* [Porting Zig to NetBSD - a fun, speedy port](http://coypu.sdf.org/porting-zig.html)
* [NNN - Tiny, lightning fast, feature-packed file manager Release v2.3](https://github.com/jarun/nnn/blob/master/README.md)
* [eta - A tool for monitoring progress and ETA of an arbitrary process  
  ](https://github.com/aioobe/eta)
* [A FreeBSD User Tries Out…NetBSD 8.0](https://www.youtube.com/watch?v=OxB70pg5Tsg&feature=share)
* [Faster vlan(4) forwarding?](http://www.grenadille.net/post/2019/02/18/Faster-vlan(4)-forwarding)
* [FuguIta - OpenBSD 6.4 Live System](http://fuguita.org/)
* [Adding Name-based hosting To Nginx on OpenBSD with Acme-Client](https://chargen.one/steve/adding-name-based-hosting-to-nginx-on-openbsd-with-acme-client)
* [HOWTO set up QEMU with HAXM acceleration on NetBSD](http://polprog.net/blog/netbsd-hax/)
* [README: gcc 7 switch coming to a port near you!](https://mail-index.netbsd.org/current-users/2019/02/07/msg035054.html)

---

\##BUG Calendar

* ChiBUG, Chicago, USA: [Tuesday, February 26th 18:00 at the Oak Park Library](https://chibug.org/)
* CharmBUG, Baltimore, USA: [Wednesday, February 27, 2019  
   19:30 at Columbia Ale House](https://www.meetup.com/CharmBUG/)
* NYC\*BUG, New York, USA: [Wednesday, March 6, 2019 18:45 at Suspenders](https://www.nycbug.org/index)
* KnoxBUG, Knoxville, USA: [Monday, February 25, 2019 - 18:00 at iX Systems offices ](http://knoxbug.org)
* BSDPL, Warsaw, Poland: [February 28, 2019 18:15 - 21:00 at Wheel Systems Office](https://bsd-pl.org/en)

---

\##Feedback/Questions

* Sam - [Customizing OpenBSD ports source code](http://dpaste.com/2NP4VGE#wrap)
* Frank - [Rivalry Linux & BSD](http://dpaste.com/1EHYHQ1#wrap)
* Zach - [mysql/mariadb tuning](http://dpaste.com/13GGAED)

---

* Send questions, comments, show ideas/topics, or stories you want mentioned on the show to [feedback@bsdnow.tv](mailto:feedback@bsdnow.tv)

---

 Your browser does not support the HTML5 video tag.