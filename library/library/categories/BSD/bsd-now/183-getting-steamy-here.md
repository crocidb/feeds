+++
title = "183: Getting Steamy Here"
description = "This week on BSDNow, we have “Weird Unix Things”, “Is it getting Steamy in here?” and an Interview about BSD Sockets API. (ThoseThis episode was brought to you by[iXsystems - Enterprise Servers and Storage for Open Source](http://www.ixsystems.com/bsdn"
date = "2017-03-01T13:00:00Z"
url = "https://www.bsdnow.tv/183"
author = "feedback@bsdnow.tv (JT Pennington)"
text = ""
lastupdated = "2026-03-26T14:37:50.947712419Z"
seen = true
+++

This week on BSDNow, we have “Weird Unix Things”, “Is it getting Steamy in here?” and an Interview about BSD Sockets API. (Those

This episode was brought to you by
----------

[![iXsystems - Enterprise Servers and Storage for Open Source](/images/1.png)](http://www.ixsystems.com/bsdnow)[![DigitalOcean - Simple Cloud Hosting, Built for Developers](/images/2.png)](http://www.digitalocean.com/)[![Tarsnap - Online Backups for the Truly Paranoid](/images/3.png)](http://www.tarsnap.com/bsdnow)

---

Headlines
----------

### [playonbsd with TrueOS: It’s Getting Steamy in Here and I’ve Had Too Much Wine](https://www.trueos.org/blog/playonbsd-trueos-getting-steamy-ive-much-wine/) ###

>
>
> We’ve done a couple of tutorials in the past on using Steam and Wine with PC-BSD, but now with the addition of playonbsd to the AppCafe library, you have more options than ever before to game on your TrueOS system. We’re going to have a look today at playonbsd, how it works with TrueOS, and what you can expect if you want to give it a try on your own system. Let’s dive right in!
>
>
>
> Once playonbsd is installed, go back to your blank desktop, right-click on the wallpaper, and select terminal. Playonbsd does almost all the configuring for you, but there are still a couple of simple options you’ll want to configure to give yourself the best experience. In your open terminal, type: playonbsd. You can also find playonbsd by doing a fast search using Lumina’s built-in search function in the start menu after it’s been installed. Once opened, a graphical interface greets us with easy to navigate menus and even does most of the work for you.
>
>

* A nice graphical UI that hides the complexity of setting up WINE and Steam, and lets you pick select the game you want, and get it setup
* Start gaming quicker, without the headache

>
>
> If you’re a PC gamer, you should definitely give playonbsd a try! You may be surprised at how well it works. If you want to know ahead of time if your games are well supported or not, head on over to WineHQ and do a search. Many people have tested and provided feedback and even solutions for potential problems with a large variety of video games. This is a great resource if you run into a glitch or other problem.
>
>

---

### [Weird Unix thing: 'cd //'](https://jvns.ca/blog/2017/02/08/weird-unix-things-cd/) ###

* So why can you do ‘cd //tmp’, and it isn’t the same as ‘cd /tmp’?
* The spec says:

>
>
> An implementation may further simplify curpath by removing any trailing  characters that are not also leading  characters, replacing multiple non-leading consecutive  characters with a single , and replacing three or more leading  characters with a single . If, as a result of this canonicalization, the curpath variable is null, no further steps shall be taken.
>
>

* “So! We can replace “three or more leading / characters with a single slash”. That does not say anything about what to do when there are 2 / characters though, which presumably is why cd //tmp leaves you at //tmp.”

>
>
> A pathname that begins with two successive slashes may be interpreted in an implementation-defined manner
>
>

* So what is it for? Well, the blog did a bit of digging and came up with [this stackoverflow answer](http://unix.stackexchange.com/questions/256497/on-what-systems-is-foo-bar-different-from-foo-bar/256569#256569)
* In cygwin and some other systems // is treated as a unix-ified version of \\, to access UNC windows file sharing paths like \\server\\share
* Perforce, the vcs, uses // to denote a path relative to the depot
* It seems to have been used in the path for a bunch of different network file systems, but also for myriad other things

---

### [Testing out snapshots in Apple’s next-generation APFS file system](https://arstechnica.com/apple/2017/02/testing-out-snapshots-in-apples-next-generation-apfs-file-system/) ###

* Adam Leventhal takes his DTrace hammer to Apple’s new file system to see what is going on

>
>
> Back in June, Apple announced its new upcoming file system: APFS, or Apple File System. There was no mention of it in the WWDC keynote, but devotees needed no encouragement. They picked over every scintilla of data from the documentation on Apple’s developer site, extrapolating, interpolating, eager for whatever was about to come. In the WWDC session hall, the crowd buzzed with a nervous energy, eager for the grand unveiling of APFS. I myself badge-swapped my way into the conference just to get that first glimpse of Apple’s first original filesystem in the 30+ years since HFS
>
>
>
> Apple’s presentation didn’t disappoint the hungry crowd. We hoped for a modern filesystem, optimized for next generation hardware, rich with features that have become the norm for data centers and professionals. With APFS, Apple showed a path to meeting those expectations. Dominic Giampaolo and Eric Tamura, leaders of the APFS team, shared performance optimizations, data integrity design, volume management, efficient storage of copied data, and snapshots—arguably the feature of APFS most directly in the user’s control.
>
>
>
> It’s 2017, and Apple already appears to be making good on its promise with the revelation that the forthcoming iOS 10.3 will use APFS. The number of APFS tinkerers using it for their personal data has instantly gone from a few hundred to a few million. Beta users of iOS 10.3 have already made the switch apparently without incident. They have even ascribed unscientifically-significant performance improvements to APFS.
>
>

* Previously Adam had used DTrace to find a new syscall introduced in OS X, fs\_snapshot, but he had not dug into how to use it. Now it seems, the time has come

>
>
> Learning from XNU and making some educated guesses, I wrote my first C program to create an APFS snapshot. This section has a bit of code, which you can find in [this Github repo](https://github.com/ahl/apfs)
>
>

* That just returned “fs\_snapshot: Operation not permitted”
* So, being Adam, he used DTrace to figure out what the problem was

>
>
> Running this DTrace script in one terminal while running the snapshot program in another shows the code flow through the kernel as the program executes
>
>
>
> In the code flow, the priv\_check\_cred() function jumps out as a good place to continue because of its name, the fact that fs\_snapshot calls it directly, and the fact that it returns 1 which corresponds with EPERM, the error we were getting.
>
>

* Turns out, it just requires some sudo

>
>
> With a little more testing I wrote my own version of Apple's unreleased snapUtil command from the WWDC demo
>
>
>
> We figured out the proper use of the fs\_snapshot system call and reconstructed the WWDC snapUtil. But all this time an equivalent utility has been lurking on macOS Sierra. If you look in /System/Library/Filesystems/apfs.fs/Contents/Resources/, Apple has included a number of APFS-related utilities, including apfs\_snapshot (and, tantalizingly, a tool called hfs\_convert).
>
>
>
> Snapshots let you preserve state to later peruse; we can also revert an APFS volume to a previous state to restore its contents. The current APFS semantics around rollback are a little odd. The revert operation succeeds, but it doesn't take effect until the APFS volume is next mounted
>
>
>
> Another reason Apple may not have wanted people messing around with snapshots is that the feature appears to be incomplete. Winding yourself into a state where only a reboot can clear a mounted snapshot is easy, and using snapshots seems to break some of the diskutil APFS output
>
>

* It is interesting to see what you can do with DTrace, as well as to see what a DTrace and ZFS developer things of APFS \*\*\*

Interview - Tom Jones - [tj@enoti.me](mailto:tj@enoti.me)
----------

* Replacing the BSD Sockets API \*\*\*

News Roundup
----------

### [FreeBSD rc.d script to map ethernet device names by MAC address](https://github.com/eborisch/ethname) ###

>
>
> Self-contained FreeBSD rc.d script for re-naming devices based on their MAC address. I needed it due to USB Ethernet devices coming up in different orders across OS upgrades.
>
>

* Copy ethname into /usr/local/etc/rc.d/
* Add the following to rc.conf:

  >
  >
  > ethname\_enable="YES"  
  >  ethname\_devices="em0 ue0 ue1" # Replace with desired devices to rename
  >
  >

* Create /usr/local/etc/ifmap in the following format:

  >
  >
  > 01:23:45:67:89:ab eth0  
  >  01:23:45:67:89:ac eth1
  >
  >

>
>
> That's it. Use ifconfig\_="" settings in rc.conf with the new names.
>
>

* I know MFSBSD has something like this, but a polished up hybrid of the two should likely be part of the base system if something is not already available
* This would be a great “Junior Job”, if say, a viewer wanted to get started with their first FreeBSD patch \*\*\*

### [Mog: A different take on the Unix tool cat](https://github.com/witchard/mog) ###

* Do you abuse cat to view files?
* Did you know cat is meant for con\*cat\*enating files, meaning: cat part1 part2 part3 \> wholething.txt
* mog is a tool for actually viewing files, and it adds quite a few nice features
  * Syntax highlight scripts
  * Print a hex dump of binary files
  * Show details of image files
  * Perform objdump on executables
  * List a directory

>
>
> mog reads the $HOME/.mogrc config file which describes a series of operations it can do in an ordered manner. Each operation has a match command and an action command. For each file you give to mog it will test each match command in turn, when one matches it will perform the action. A reasonably useful config file is generated when you first run it.
>
>
> ---
>

### [How Unix erases things when you type a backspace while entering text](https://utcc.utoronto.ca/~cks/space/blog/unix/HowUnixBackspaces) ###

>
>
> Yesterday I mentioned in passing that printing a DEL character doesn't actually erase anything. This raises an interesting question, because when you're typing something into a Unix system and hit your backspace key, Unix sure erases the last character that you entered. So how is it doing that?
>
>
>
> The answer turns out to be basically what you'd expect, although the actual implementation rapidly gets complex. When you hit backspace, the kernel tty line discipline rubs out your previous character by printing (in the simple case) Ctrl-H, a space, and then another Ctrl-H.
>
>
>
> Of course just backing up one character is not always the correct way of erasing input, and that's when it gets complicated for the kernel. To start with we have tabs, because when you (the user) backspace over a tab you want the cursor to jump all the way back, not just move back one space. The kernel has a certain amount of code to work out what column it thinks you're on and then back up an appropriate number of spaces with Ctrl-Hs.
>
>
>
> Then we have the case when you quoted a control character while entering it, eg by typing Ctrl-V Ctrl-H; this causes the kernel to print the Ctrl-H instead of acting on it, and it prints it as the two character sequence <sup>H.</sup> When you hit backspace to erase that, of course you want both (printed) characters to be rubbed out, not just the 'H'. So the kernel needs to keep track of that and rub out two characters instead of just one.
>
>

* Chris then provides an example, from IllumOS, of the kernel trying to deal with multibyte characters

>
>
> FreeBSD also handles backspacing a space specially, because you don't need to actually rub that out with a '\\b \\b' sequence; you can just print a plain \\b. Other kernels don't seem to bother with this optimization. The FreeBSD code for this is in sys/kern/tty\_ttydisc.c in the ttydisc\_rubchar function
>
>
>
> PS: If you want to see the kernel's handling of backspace in action, you usually can't test it at your shell prompt, because you're almost certainly using a shell that supports command line editing and readline and so on. Command line editing requires taking over input processing from the kernel, and so such shells are handling everything themselves. My usual way to see what the kernel is doing is to run 'cat \>/dev/null' and then type away.
>
>

* And you thought the backspace key would be simple... \*\*\*

### [FreeBSD ports now have Wayland](http://www.freshports.org/graphics/wayland/) ###

* We’ve discussed the pending Wayland work, but we wanted to point you today to the ports which are in mainline FreeBSD ports tree now.
* First of all, (And I was wondering how they would deal with this) it has landed in the “graphics” category, since Wayland is the Anti-X11, putting it in x11/ didn’t make a lot of sense.
* Couple of notes before you start installing new packages and expecting wayland to “just work”
* First, this does require that you have working DRM from the kernel side. You’ll want to grab TrueOS or build from Matt Macy’s FreeBSD branches on GitHub before testing on any kind of modern Intel GPU. Nvidia with modesetting should be supported.
* Next, not all desktops will “just work”. You may need to grab experimental Weston for compositor. KDE / Gnome (And Lumina) and friends will grow Wayland support in the future, so don’t expect to just fire up $whatever and have it all work out of box.
* Feedback is needed! This is brand new functionality for FreeBSD, and the maintainers will want to hear your results. For us on the TrueOS side we are interested as well, since we want to port Lumina over to Wayland soon(ish)
* Happy Experimenting! \*\*\*

Beastie Bits
----------

* [Faces of FreeBSD 2017: Joseph Kong](https://www.freebsdfoundation.org/blog/faces-of-freebsd-2017-joseph-kong/)

* [OPNsense 17.1 “Eclectic Eagle”, based on FreeBSD 11 Released](https://opnsense.org/opnsense-17-1-released/)

* [Why you should start programming on UNIX](http://www.koszek.com/blog/2017/01/28/why-you-should-start-programming-on-unix/)

* [OpenSMTPD Mail Filtering](http://eradman.com/posts/opensmtpd-filtering.html)

---

Feedback/Questions
----------

* [ Zane - Databases and Jails](http://pastebin.com/89AyGe5F)
* [ Mohammad - USB Install](http://pastebin.com/Te8sz9id)
* [ Chuck - Updating Jails](http://pastebin.com/G2SzahWL)
* [ David - Lumina / LXQt](http://pastebin.com/71ExJLpL) \*\*\*