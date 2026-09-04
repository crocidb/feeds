+++
title = "195: I don’t WannaCry"
description = "A pledge of love to OpenBSD, combating ransomware like WannaCry with OpenZFS, and using PFsense to maximize your non-gigabit Internet connectionThis episode was brought to you by[iXsystems - Enterprise Servers and Storage for Open Source](http://www.ix"
date = "2017-05-24T12:00:00Z"
url = "https://www.bsdnow.tv/195"
author = "feedback@bsdnow.tv (JT Pennington)"
text = ""
lastupdated = "2026-03-26T14:37:50.894696340Z"
seen = true
+++

A pledge of love to OpenBSD, combating ransomware like WannaCry with OpenZFS, and using PFsense to maximize your non-gigabit Internet connection

This episode was brought to you by
----------

[![iXsystems - Enterprise Servers and Storage for Open Source](/images/1.png)](http://www.ixsystems.com/bsdnow)[![DigitalOcean - Simple Cloud Hosting, Built for Developers](/images/2.png)](http://www.digitalocean.com/)[![Tarsnap - Online Backups for the Truly Paranoid](/images/3.png)](http://www.tarsnap.com/bsdnow)

---

Headlines
----------

### [ino64 project committed to FreeBSD 12-CURRENT](https://svnweb.freebsd.org/base?view=revision&revision=318736) ###

* The ino64 project has been completed and merged into FreeBSD 12-CURRENT

>
>
> Extend the ino\_t, dev\_t, nlink\_t types to 64-bit ints. Modify struct dirent layout to add d\_off, increase the size of d\_fileno to 64-bits, increase the size of d\_namlen to 16-bits, and change the required alignment. Increase struct statfs f\_mntfromname[] and f\_mntonname[] array length MNAMELEN to 1024
>
>

* This means the length of a mount point (MNAMELEN) has been increased from 88 byte to 1024 bytes. This allows longer ZFS dataset names and more nesting, and generally improves the usefulness of nested jails
* It also allow more than 4 billion files to be stored in a single file system (both UFS and ZFS). It also deals with a number of NFS problems, such as Amazon’s EFS (cloud NFS), which uses 64 bit IDs even with small numbers of files.

>
>
> ABI breakage is mitigated by providing compatibility using versioned symbols, ingenious use of the existing padding in structures, and by employing other tricks. Unfortunately, not everything can be fixed, especially outside the base system. For instance, third-party APIs which pass struct stat around are broken in backward and forward incompatible ways.
>
>

* A bug in poudriere that may cause some packages to not rebuild is being fixed. Many packages like perl will need to be rebuilt after this change

>
>
> Update note: strictly follow the instructions in UPDATING. Build and install the new kernel with COMPAT\_FREEBSD11 option enabled, then reboot, and only then install new world.
>
>

* So you need the new GENERIC kernel with the COMPAT\_FREEBSD11 option, so that your old userland will work with the new kernel, and you need to build, install, and reboot onto the new kernel before attempting to install world. The usual process of installing both and then rebooting will NOT WORK

>
>
> Credits: The 64-bit inode project, also known as ino64, started life many years ago as a project by Gleb Kurtsou (gleb). Kirk McKusick (mckusick) then picked up and updated the patch, and acted as a flag-waver. Feedback, suggestions, and discussions were carried by Ed Maste (emaste), John Baldwin (jhb), Jilles Tjoelker (jilles), and Rick Macklem (rmacklem). Kris Moore (kmoore) performed an initial ports investigation followed by an exp-run by Antoine Brodin (antoine). Essential and all-embracing testing was done by Peter Holm (pho). The heavy lifting of coordinating all these efforts and bringing the project to completion were done by Konstantin Belousov (kib).
>
>
>
> Sponsored by: The FreeBSD Foundation (emaste, kib)
>
>

---

### [Why I love OpenBSD](https://medium.com/@h3artbl33d/why-i-love-openbsd-ca760cf53941) ###

* Jeroen Janssen writes:

>
>
> I do love open source software. Oh boy, I really do love open source software. It’s extendable, auditable, and customizable. What’s not to love?  
>  I’m astonished by the idea that tens, hundreds, and sometimes even thousands of enthusiastic, passionate developers collaborate on an idea. Together, they make the world a better place, bit by bit.  
>  And this leads me to one of my favorite open source projects: the 22-year-old OpenBSD operating system.  
>  The origins of my love affair with OpenBSD  
>  From Linux to \*BSD  
>  The advantages of OpenBSD
>
>
>
> It’s extremely secure  
>  It’s well documented  
>  It’s open source  
>  \> It’s neat and clean
>
>
>
> My take on OpenBSD
>
>

---

\*\* DO \*\*

### [Combating WannaCry and Other Ransomware with OpenZFS Snapshots](https://www.ixsystems.com/blog/combating-ransomware/) ###

>
>
> Ransomware attacks that hold your data hostage using unauthorized data encryption are spreading rapidly and are particularly nefarious because they do not require any special access privileges to your data. A ransomware attack may be launched via a sophisticated software exploit as was the case with the recent “WannaCry” ransomware, but there is nothing stopping you from downloading and executing a malicious program that encrypts every file you have access to. If you fail to pay the ransom, the result will be indistinguishable from your simply deleting every file on your system. To make matters worse, ransomware authors are expanding their attacks to include just about any storage you have access to. The list is long, but includes network shares, Cloud services like DropBox, and even “shadow copies” of data that allow you to open previous versions of files.  
>  To make matters even worse, there is little that your operating system can do to prevent you or a program you run from encrypting files with ransomware just as it can’t prevent you from deleting the files you own. Frequent backups are touted as one of the few effective strategies for recovering from ransomware attacks but it is critical that any backup be isolated from the attack to be immune from the same attack. Simply copying your files to a mounted disk on your computer or in the Cloud makes the backup vulnerable to infection by virtue of the fact that you are backing up using your regular permissions. If you can write to it, the ransomware can encrypt it. Like medical workers wearing hazmat suits for isolation when combating an epidemic, you need to isolate your backups from ransomware.  
>  OpenZFS snapshots to the rescue  
>  OpenZFS is the powerful file system at the heart of every storage system that iXsystems sells and of its many features, snapshots can provide fast and effective recovery from ransomware attacks at both the individual user and enterprise level as I talked about in 2015. As a copy-on-write file system, OpenZFS provides efficient and consistent snapshots of your data at any given point in time. Each snapshot only includes the precise delta of changes between any two points in time and can be cloned to provide writable copies of any previous state without losing the original copy. Snapshots also provide the basis of OpenZFS replication or backing up of your data to local and remote systems. Because an OpenZFS snapshot takes place at the block level of the file system, it is immune to any file-level encryption by ransomware that occurs over it. A carefully-planned snapshot, replication, retention, and restoration strategy can provide the low-level isolation you need to enable your storage infrastructure to quickly recover from ransomware attacks.  
>  OpenZFS snapshots in practice  
>  While OpenZFS is available on a number of desktop operating systems such as TrueOS and macOS, the most effective way to bring the benefits of OpenZFS snapshots to the largest number of users is with a network of iXsystems TrueNAS, FreeNAS Certified and FreeNAS Mini unified NAS and SAN storage systems. All of these can provide OpenZFS-backed SMB, NFS, AFP, and iSCSI file and block storage to the smallest workgroups up through the largest enterprises and TrueNAS offers available Fibre Channel for enterprise deployments. By sharing your data to your users using these file and block protocols, you can provide them with a storage infrastructure that can quickly recover from any ransomware attack thrown at it. To mitigate ransomware attacks against individual workstations, TrueNAS and FreeNAS can provide snapshotted storage to your VDI or virtualization solution of choice. Best of all, every iXsystems TrueNAS, FreeNAS Certified, and FreeNAS Mini system includes a consistent user interface and the ability to replicate between one another. This means that any topology of individual offices and campuses can exchange backup data to quickly mitigate ransomware attacks on your organization at all levels.  
>  Join us for a [free webinar](http://www.onlinemeetingnow.com/register/?id=uegudsbc75) with iXsystems Co-Founder Matt Olander and learn more about why businesses everywhere are replacing their proprietary storage platforms with TrueNAS then email us at [info@ixsystems.com](mailto:info@ixsystems.com) or call 1-855-GREP-4-IX (1-855-473-7449), or 1-408-493-4100 (outside the US) to discuss your storage needs with one of our solutions architects.
>
>

---

Interview - Michael W. Lucas - [mwlucas@michaelwlucas.com](mailto:mwlucas@michaelwlucas.com) / [@twitter](https://twitter.com/mwlauthor)
----------

Books, conferences, and how these two combine

* BR: Welcome back. Tell us what you’ve been up to since the last time we interviewed you regarding books and such.
* AJ: Tell us a little bit about relayd and what it can do.
* BR: What other books do you have in the pipeline?
* AJ: What are your criteria that qualifies a topic for a mastery book?
* BR: Can you tell us a little bit about these writing workshops that you attend and what happens there?
* AJ: Without spoiling too much: How did you come up with the idea for git commit murder?
* BR: Speaking of BSDCan, can you tell the first timers about what to expect in the [[http://www.bsdcan.org/2017/schedule/events/890.en.html](Newcomers](http://www.bsdcan.org/2017/schedule/events/890.en.html](Newcomers) orientation and mentorship) session on Thursday?
* AJ: Tell us about the new WIP session at BSDCan. Who had the idea and how much input did you get thus far?
* BR: Have you ever thought about branching off into a new genre like children’s books or medieval fantasy novels?
* AJ: Is there anything else before we let you go? \*\*\*

News Roundup
----------

### [Using LLDP on FreeBSD](https://tetragir.com/freebsd/networking/using-lldp-on-freebsd.html) ###

>
>
> LLDP, or Link Layer Discovery Protocol allows system administrators to easily map the network, eliminating the need to physically run the cables in a rack. LLDP is a protocol used to send and receive information about a neighboring device connected directly to a networking interface. It is similar to Cisco’s CDP, Foundry’s FDP, Nortel’s SONMP, etc. It is a stateless protocol, meaning that an LLDP-enabled device sends advertisements even if the other side cannot do anything with it. In this guide the installation and configuration of the LLDP daemon on FreeBSD as well as on a Cisco switch will be introduced.  
>  If you are already familiar with Cisco’s CDP, LLDP won’t surprise you. It is built for the same purpose: to exchange device information between peers on a network. While CDP is a proprietary solution and can be used only on Cisco devices, LLDP is a standard: IEEE 802.3AB. Therefore it is implemented on many types of devices, such as switches, routers, various desktop operating systems, etc. LLDP helps a great deal in mapping the network topology, without spending hours in cabling cabinets to figure out which device is connected with which switchport. If LLDP is running on both the networking device and the server, it can show which port is connected where. Besides physical interfaces, LLDP can be used to exchange a lot more information, such as IP Address, hostname, etc.  
>  In order to use LLDP on FreeBSD, net-mgmt/lldpd has to be installed. It can be installed from ports using portmaster: #portmaster net-mgmt/lldpd Or from packages: #pkg install net-mgmt/lldpd By default lldpd sends and receives all the information it can gather , so it is advisable to limit what we will communicate with the neighboring device.  
>  The configuration file for lldpd is basically a list of commands as it is passed to lldpcli. Create a file named lldpd.conf under /usr/local/etc/ The following configuration gives an example of how lldpd can be configured. For a full list of options, see %man lldpcli  
>  To check what is configured locally, run #lldpcli show chassis detail  
>  To see the neighbors run #lldpcli show neighbors details
>
>

* Check out the rest of the article about enabling LLDP on a Cisco switch

---

### [experiments with prepledge](http://www.tedunangst.com/flak/post/experiments-with-prepledge) ###

* Ted Unangst takes a crack at a system similar to the one being designed for Capsicum, Oblivious Sandboxing (See the presentation at BSDCan), where the application doesn’t even know it is in the sandbox

  >
  >
  > MP3 is officially dead, so I figure I should listen to my collection one last time before it vanishes entirely. The provenance of some of these files is a little suspect however, and since I know one shouldn’t open files from strangers, I’d like to take some precautions against malicious malarkey. This would be a good use for pledge, perhaps, if we can get it working.  
  >  At the same time, an occasional feature request for pledge is the ability to specify restrictions before running a program. Given some untrusted program, wrap its execution in a pledge like environment. There are other system call sandbox mechanisms that can do this (systrace was one), but pledge is quite deliberately designed not to support this. But maybe we can bend it to our will.  
  >  Our pledge wrapper can’t be an external program. This leaves us with the option of injecting the wrapper into the target program via LD\_PRELOAD. Before main even runs, we’ll initialize what needs initializing, then lock things down with a tight pledge set. Our eventual target will be ffplay, but hopefully the design will permit some flexibility and reuse.
  >
  >

* So the new code is injected to override the open syscall, and reads a list of files from an environment variable. Those files are opened and the path and file descriptor are put into a linked list, and then pledge is used to restrict further access to the file system. The replacement open call now searches just that linked list, returning the already opened file descriptors.

* So as long as your application only tries to open files that you have preopened, it can function without modification within the sandbox. Or at least that is the goal...

* ffplay tries to dlopen() some things, and because of the way dlopen() works, it doesn’t go via the libc open() wrapper, so it doesn’t get overridden

* ffplay also tries to call a few ioctl’s, not allowed

* After stubbing both of those out, it still doesn’t work and it is just getting worse

* Ted switches to a new strategy, using ffmpeg to convert the .mp3 to a .wav file and then just cat it to /dev/audio

* A few more stubs for ffmpeg, including access(), and adding tty access to the list of pledges, and it finally works

>
>
> This point has been made from the early days, but I think this exercise reinforces it, that pledge works best with programs where you understand what the program is doing. A generic pledge wrapper isn’t of much use because the program is going to do something unexpected and you’re going to have a hard time wrangling it into submission.  
>  Software is too complex. What in the world is ffplay doing? Even if I were working with the source, how long would it take to rearrange the program into something that could be pledged? One can try using another program, but I would wager that as far as multiformat media players go, ffplay is actually on the lower end of the complexity spectrum. Most of the trouble comes from using SDL as an abstraction layer, which performs a bunch of console operations.  
>  On the flip side, all of this early init code is probably the right design. Once SDL finally gets its screen handle setup, we could apply pledge and sandbox the actual media decoder. That would be the right way to things.  
>  Is pledge too limiting? Perhaps, but that’s what I want. I could have just kept adding permissions until ffplay had full access to my X socket, but what kind of sandbox is that? I don’t want naughty MP3s scraping my screen and spying on my keystrokes. The sandbox I created had all the capabilities one needs to convert an MP3 to audible sound, but the tool I wanted to use wasn’t designed to work in that environment. And in its defense, these were new post hoc requirements. Other programs, even sed, suffer from less than ideal pledge sets as well. The best summary might be to say that pledge is designed for tomorrow’s programs, not yesterday’s (and vice versa).  
>  There were a few things I could have done better. In particular, I gave up getting audio to work, even though there’s a nice description of how to work with pledge in the sio\_open manual. Alas, even going back and with a bit more effort I still haven’t succeeded. The requirements to use libsndio are more permissive than I might prefer.
>
>
> ---
>

### [How I Maximized the Speed of My Non-Gigabit Internet Connection](https://medium.com/speedtest-by-ookla/engineer-maximizes-internet-speed-story-c3ec0e86f37a) ###

* We have a new post from Brennen Smith, who is the Lead Systems Engineer at Ookla, the company that runs Speedtest.net, explaining how he used pfSense to maximize his internet connection

>
>
> I spend my time wrangling servers and internet infrastructure. My daily goals range from designing high performance applications supporting millions of users and testing the fastest internet connections in the world, to squeezing microseconds from our stack —so at home, I strive to make sure that my personal internet performance is running as fast as possible.  
>  I live in an area with a DOCSIS ISP that does not provide symmetrical gigabit internet — my download and upload speeds are not equal. Instead, I have an asymmetrical plan with 200 Mbps download and 10 Mbps upload — this nuance considerably impacted my network design because asymmetrical service can more easily lead to bufferbloat.  
>  We will cover bufferbloat in a later article, but in a nutshell, it’s an issue that arises when an upstream network device’s buffers are saturated during an upload. This causes immense network congestion, latency to rise above 2,000 ms., and overall poor quality of internet. The solution is to shape the outbound traffic to a speed just under the sending maximum of the upstream device, so that its buffers don’t fill up. My ISP is notorious for having bufferbloat issues due to the low upload performance, and it’s an issue prevalent even on their provided routers.
>
>

* They walk through a list of router devices you might consider, and what speeds they are capable of handling, but ultimately ended up using a generic low power x86 machine running pfSense 2.3

>
>
> In my research and testing, I also evaluated IPCop, VyOS, OPNSense, Sophos UTM, RouterOS, OpenWRT x86, and Alpine Linux to serve as the base operating system, but none were as well supported and full featured as PFSense.
>
>

* The main setting to look at is the traffic shaping of uploads, to keep the pipe from getting saturated and having a large buffer build up in the modem and further upstream. This build up is what increases the latency of the connection

>
>
> As with any experiment, any conclusions need to be backed with data. To validate the network was performing smoothly under heavy load, I performed the following experiment:
>
>
>
> * Ran a ping6 against speedtest.net to measure latency.
> * Turned off QoS to simulate a “normal router”.
> * Started multiple simultaneous outbound TCP and UDP streams to saturate my outbound link.
> * Turned on QoS to the above settings and repeated steps 2 and 3.
>
>
>
> As you can see from the plot below, without QoS, my connection latency increased by \~1,235%. However with QoS enabled, the connection stayed stable during the upload and I wasn’t able to determine a statistically significant delta.  
>  That’s how I maximized the speed on my non-gigabit internet connection. What have you done with your network?
>
>

---

### [FreeBSD on 11″ MacBook Air](https://www.geeklan.co.uk/?p=2214) ###

* Sevan Janiyan writes in his tech blog about his experiences running FreeBSD on an 11’’ MacBook Air

>
>
> This tiny machine has been with me for a few years now, It has mostly run OS X though [I have tried OpenBSD on it](https://www.geeklan.co.uk/?p=1283). Besides the screen resolution I’m still really happy with it, hardware wise. Software wise, not so much. I use an external disk containing a zpool with my data on it. Among this data are several source trees. CVS on a ZFS filesystem on OS X is painfully slow. I dislike that builds running inside Terminal.app are slow at the expense of a responsive UI. The system seems fragile, at the slightest push the machine will either hang or become unresponsive. Buggy serial drivers which do not implement the break signal and cause instability are frustrating.  
>  Last week whilst working on [Rump kernel](http://rumpkernel.org/) builds I introduced some new build issues in the process of fixing others, I needed to pick up new changes from CVS by updating my copy of the source tree and run builds to test if issues were still present.  
>  I was let down on both counts, it took ages to update source and in the process of cross compiling a NetBSD/evbmips64-el release, the system locked hard. That was it, time to look what was possible elsewhere. While I have been using OS X for many years, I’m not tied to anything exclusive on it, maybe tweetbot, perhaps, but that’s it.  
>  On the BSDnow podcast they’ve been covering changes coming in to TrueOS (formerly PC-BSD – a desktop focused distro based on FreeBSD), their experiments seemed interesting, the project now tracks FreeBSD-CURRENT, they’ve replaced rcng with OpenRC as the init system and it comes with a pre-configured desktop environment, using their own window manager (Lumina). Booting the USB flash image it made it to X11 without any issue. The dock has a widget which states the detected features, no wifi (Broadcom), sound card detected and screen resolution set to 1366×768. I planned to give it a try on the weekend. Friday, I made backups and wiped the system. TrueOS installed without issue, after a short while I had a working desktop, resuming from sleep worked out of the box. I didn’t spend long testing TrueOS, switching out NetBSD-HEAD only to realise that I really need ZFS so while I was testing things out, might as well give stock FreeBSD 11-STABLE a try (TrueOS was based on -CURRENT).  
>  Turns out sleep doesn’t work yet but sound does work out of the box and with a few invocations of pkg(8) I had xorg, dwm, firefox, CVS and virtuabox-ose installed from binary packages. VirtualBox seems to cause the system to panic (bug 219276) but I should be able to survive without my virtual machines over the next few days as I settle in. I’m considering ditching VirtualBox and converting the vdi files to raw images so that they can be written to a new zvol for use with bhyve. As my default keyboard layout is Dvorak, OS X set the EFI settings to this layout. The first time I installed FreeBSD 11-STABLE, I opted for full disk encryption but ran into this odd issue where on boot the keyboard layout was Dvorak and password was accepted, the system would boot and as it went to mount the various filesystems it would switch back to QWERTY. I tried entering my password with both layout but wasn’t able to progress any further, no bug report yet as I haven’t ruled myself out as the problem.  
>  Thunderbolt gigabit adapter –[bge(4)](https://www.freebsd.org/cgi/man.cgi?query=bge) and DVI adapter both worked on FreeBSD though the gigabit adapter needs to be plugged in at boot to be detected. The trackpad bind to [wsp(4)](https://www.freebsd.org/cgi/man.cgi?query=wsp), left, right and middle clicks are available through single, double and tripple finger tap. Sound card binds to [snd\_hda(4)](https://www.freebsd.org/cgi/man.cgi?query=snd_hda) and works out of the box.  
>  For wifi I’m using a [urtw(4)](https://www.freebsd.org/cgi/man.cgi?query=urtw) Alfa adapter which is a bit on the large side but works very reliably. A copy of the [dmesg](https://www.geeklan.co.uk/files/macbookair/freebsd-dmesg.txt) is here.
>
>
> ---
>

Beastie Bits
----------

* [OPNsense - call-for-testing for SafeStack](https://forum.opnsense.org/index.php?topic=5200.0)
* [BSD 4.4: cat](https://www.rewritinghistorycasts.com/screencasts/bsd-4.4:-cat)
* [Continuous Unix commit history from 1970 until today](https://github.com/dspinellis/unix-history-repo)
* [Update on Unix Architecture Evolution Diagrams](https://www.spinellis.gr/blog/20170510/)
* [“Relayd and Httpd Mastery” is out!](https://blather.michaelwlucas.com/archives/2951)
* [Triangle BSD User Group Meeting -- libxo](https://www.meetup.com/Triangle-BSD-Users-Group/events/240247251/) \*\*\*

Feedback/Questions
----------

* [Carlos - ASUS Tinkerboard](http://dpaste.com/1GJHPNY#wrap)
* [James - Firewall question](http://dpaste.com/0QCW933#wrap)
* [Adam - ZFS books](http://dpaste.com/0GMG5M2#wrap)
* [David - Managing zvols](http://dpaste.com/2GP8H1E#wrap) \*\*\*