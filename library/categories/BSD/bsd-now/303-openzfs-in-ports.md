+++
title = "303: OpenZFS in Ports"
description = "OpenZFS-kmod port available, using blacklistd with NPF as fail2ban replacement, ZFS raidz expansion alpha preview 1, audio VU-meter increases CO2 footprint rant, XSAVE and compat32 kernel work for LLDB, where icons for modern X applications come from, and more.Headlines"
date = "2019-06-20T02:30:00Z"
url = "https://www.bsdnow.tv/303"
author = "feedback@bsdnow.tv (JT Pennington)"
text = ""
lastupdated = "2026-03-26T14:37:50.628183324Z"
seen = false
+++

OpenZFS-kmod port available, using blacklistd with NPF as fail2ban replacement, ZFS raidz expansion alpha preview 1, audio VU-meter increases CO2 footprint rant, XSAVE and compat32 kernel work for LLDB, where icons for modern X applications come from, and more.

Headlines
----------

### [ZFSonFreeBSD ports renamed OpenZFS](https://www.freshports.org/sysutils/openzfs-kmod) ###

* The ZFS on FreeBSD project has renamed the userland and kernel ports from zol and zol-kmod to openzfs and openzfs-kmod
* The new versions from this week are IOCTL compatible with the command line tools in FreeBSD 12.0, so you can use the old userland with the new kernel module (although obviously not the new features)
* With the renaming it is easier to specify which kernel module you want to load in /boot/loader.conf: \> zfs\_load=”YES”
* or \> openzfs\_load=”YES”
* To load traditional or the newer version of ZFS
* The kmod still requires FreeBSD 12-stable or 13-current because it depends on the newer crypto support in the kernel for the ZFS native encryption feature. Allan is looking at ways to work around this, but it may not be practical.
* We would like to do an unofficial poll on how people would the userland to co-exist. Add a suffix to the new commands in /usr/local (zfs.new zpool.new or whatever). One idea i’ve had is to move the zfs and zpool commands to /libexec and make /sbin/zfs and /sbin/zpool a switcher script, that will call the base or ports version based on a config file (or just based on if the port is installed)
* For testing purposes, generally you should be fine as long as you don’t run ‘zpool upgrade’, which will make your pool only importable using the newer ZFS.
* For extra safety, you can create a ‘zpool checkpoint’, which will allow you to undo any changes that are made to the pool during your testing with the new openzfs tools. Note: the checkpoint will undo EVERYTHING. So don’t save new data you want to keep.
* Note: Checkpoints disable all freeing operations, to prevent any data from being overwritten so that you can re-import at the checkpoint and undo any operation (including zfs destroy-ing a dataset), so also be careful you don’t run out of space during testing.
* Please test and provide feedback.

---

### [How to use blacklistd(8) with NPF as a fail2ban replacement](https://www.unitedbsd.com/d/63-how-to-use-blacklistd8-with-npf-as-a-fail2ban-replacement) ###

* About blacklistd(8)

>
>
> blacklistd(8) provides an API that can be used by network daemons to communicate with a packet filter via a daemon to enforce opening and closing ports dynamically based on policy.  
>  The interface to the packet filter is in /libexec/blacklistd-helper (this is currently designed for npf) and the configuration file (inspired from inetd.conf) is in etc/blacklistd.conf  
>  Now, blacklistd(8) will require bpfjit(4) (Just-In-Time compiler for Berkeley Packet Filter) in order to properly work, in addition to, naturally, npf(7) as frontend and syslogd(8), as a backend to print diagnostic messages. Also remember npf shall rely on the npflog\* virtual network interface to provide logging for tcpdump() to use.   
>  Unfortunately (dont' ask me why :P) in 8.1 all the required kernel components are still not compiled by default in the GENERIC kernel (though they are in HEAD), and are rather provided as modules. Enabling NPF and blacklistd services would normally result in them being automatically loaded as root, but predictably on securelevel=1 this is not going to happen
>
>

---

News Roundup
----------

### [[WIP] raidz expansion, alpha preview 1](https://github.com/zfsonlinux/zfs/pull/8853) ###

* Motivation and Context \> This is a alpha-quality preview of RAID-Z expansion. This feature allows disks to be added one at a time to a RAID-Z group, expanding its capacity incrementally. This feature is especially useful for small pools (typically with only one RAID-Z group), where there isn't sufficient hardware to add capacity by adding a whole new RAID-Z group (typically doubling the number of disks). \> For additional context as well as a design overview, see my short talk from the 2017 OpenZFS Developer Summit: slides video

---

### [Rant: running audio VU-meter increases my CO2 footprint](https://medium.com/@MartinCracauer/bug-rant-running-audio-vu-meter-increases-my-co2-footprint-871d5c1bee5a) ###

>
>
> A couple months ago I noticed that the monitor on my workstation never power off anymore. Screensaver would go on, but DPMs (to do the poweroff) never kicked in.  
>  I grovels the output of various tools that display DPMS settings, which as usual in Xorg were useless. Everybody said DPMS is on with a timeout. I even wrote my own C program to use every available Xlib API call and even the xscreensaver library calls. (should make it available) No go, everybody says that DPMs is on, enabled and set on a timeout. Didn’t matter whether I let xscreeensaver do the job or just the X11 server.  
>  After a while I noticed that DPMS actually worked between starting my X11 server and starting all my clients. I have a minimal .xinitrc and start the actual session from a script, that is how I could notice. If I used a regular desktop login I wouldn’t have noticed. A server state bug was much more likely than a client bug.
>
>
>
> * See the article for the rest...
>
>

---

### [XSAVE and compat32 kernel work for LLDB](http://blog.netbsd.org/tnf/entry/xsave_and_compat32_kernel_work) ###

>
>
> Upstream describes LLDB as a next generation, high-performance debugger. It is built on top of LLVM/Clang toolchain, and features great integration with it. At the moment, it primarily supports debugging C, C++ and ObjC code, and there is interest in extending it to more languages.  
>  In February, I have started working on LLDB, as contracted by the NetBSD Foundation. So far I've been working on reenabling continuous integration, squashing bugs, improving NetBSD core file support and lately extending NetBSD's ptrace interface to cover more register types. You can read more about that in my Apr 2019 report.  
>  In May, I was primarily continuing the work on new ptrace interface. Besides that, I've found and fixed a bug in ptrace() compat32 code, pushed LLVM buildbot to ‘green’ status and found some upstream LLVM regressions. More below.
>
>

---

### [Some things about where icons for modern X applications come from](https://utcc.utoronto.ca/~cks/space/blog/unix/ModernXAppIcons) ###

>
>
> If you have a traditional window manager like fvwm, one of the things it can do is iconify X windows so that they turn into icons on the root window (which would often be called the 'desktop'). Even modern desktop environments that don't iconify programs to the root window (or their desktop) may have per-program icons for running programs in their dock or taskbar. If your window manager or desktop environment can do this, you might reasonably wonder where those icons come from by default.  
>  Although I don't know how it was done in the early days of X, the modern standard for this is part of the Extended Window Manager Hints. In EWMH, applications give the window manager a number of possible icons, generally in different sizes, as ARGB bitmaps (instead of, say, SVG format). The window manager or desktop environment can then pick whichever icon size it likes best, taking into account things like the display resolution and so on, and display it however it wants to (in its original size or scaled up or down).  
>  How this is communicated in specific is through the only good interprocess communication method that X supplies, namely X properties. In the specific case of icons, the \_NET\_WM\_ICON property is what is used, and xprop can display the size information and an ASCII art summary of what each icon looks like. It's also possible to use some additional magic to read out the raw data from \_NET\_WM\_ICON in a useful format; see, for example, this Stackoverflow question and its answers.
>
>

---

Beastie Bits
----------

* [Recent Security Innovations](http://undeadly.org/cgi?action=article;sid=20190605110020)
* [Old Unix books + Solaris](https://imgur.com/a/HbSYtQI)
* [Pro-Desktop - A Tiling Desktop Environment](https://bitcannon.net/post/pro-desktop/)
* [The Tar Pipe](https://blog.extracheese.org/2010/05/the-tar-pipe.html)
* [At least one vim trick you might not know](https://www.hillelwayne.com/post/intermediate-vim/)

---

Feedback/Questions
----------

* Johnny - [listener feedback](http://dpaste.com/0ZQCQ8Y#wrap)
* Brian - [Questions](http://dpaste.com/1843RNX#wrap)
* Mark - [ZFS Question](http://dpaste.com/3M83X9G#wrap)

---

* Send questions, comments, show ideas/topics, or stories you want mentioned on the show to [feedback@bsdnow.tv](mailto:feedback@bsdnow.tv)

---
 Your browser does not support the HTML5 video tag.