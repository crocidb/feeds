+++
title = "219: We love the ARC"
description = "Papers we love: ARC by Bryan Cantrill, SSD caching adventures with ZFS, OpenBSD full disk encryption setup, and a Perl5 Slack Syslog BSD daemon.This episode was brought to you by[iXsystems - Enterprise Servers and Storage for Open Source](http://www.ix"
date = "2017-11-08T13:00:00Z"
url = "https://www.bsdnow.tv/219"
author = "feedback@bsdnow.tv (JT Pennington)"
text = ""
lastupdated = "2026-03-26T14:37:50.831172749Z"
seen = false
+++

Papers we love: ARC by Bryan Cantrill, SSD caching adventures with ZFS, OpenBSD full disk encryption setup, and a Perl5 Slack Syslog BSD daemon.

This episode was brought to you by
----------

[![iXsystems - Enterprise Servers and Storage for Open Source](/images/1.png)](http://www.ixsystems.com/bsdnow)[![DigitalOcean - Simple Cloud Hosting, Built for Developers](/images/2.png)](http://www.digitalocean.com/)[![Tarsnap - Online Backups for the Truly Paranoid](/images/3.png)](http://www.tarsnap.com/bsdnow)

---

Headlines
----------

### [Papers We Love: ARC: A Self-Tuning, Low Overhead Replacement Cache](https://www.youtube.com/watch?v=F8sZRBdmqc0&feature=youtu.be) ###

* Ever wondered how the ZFS ARC (Adaptive Replacement Cache) works?
* How about if Bryan Cantrill presented the original paper on its design?
* Today is that day.
* [Slides](https://www.slideshare.net/bcantrill/papers-we-love-arc-after-dark)
* It starts by looking back at a fundamental paper from the 40s where the architecture of general-purpose computers are first laid out
* The main is the description of memory hierarchies, where you have a small amount of very fast memory, then the next level is slower but larger, and on and on. As we look at the various L1, L2, and L3 caches on a CPU, then RAM, then flash, then spinning disks, this still holds true today.
* The paper then does a survey of the existing caching policies and tries to explain the issues with each. This includes MIN, which is the theoretically optimal policy, which requires future knowledge, but is useful for setting the upper bound, what is the best we could possibly do.
* The paper ends up showing that the ARC can end up being better than manually trying to pick the best number for the workload, because it adapts as the workload changes
* At about 1:25 into the video, Bryan start talking about the practical implementation of the ARC in ZFS, and some challenges they have run into recently at Joyent.
* A great discussion about some of the problems when ZFS needs to shrink the ARC. Not all of it applies 1:1 to FreeBSD because the kernel and the kmem implementation are different in a number of ways
* There were some interesting questions asked at the end as well \*\*\*

### [How do I use man pages to learn how to use commands?](https://unix.stackexchange.com/a/193837) ###

* nwildner on StackExchange has a very thorough answer to the question how to interpret man pages to understand complicated commands (xargs in this case, but not specifically).
* Have in mind what you want to do.

>
>
> When doing your research about xargs you did it for a purpose, right? You had a specific need that was reading standard output and executing commands based on that output.
>
>

* But, when I don't know which command I want?

>
>
> Use man -k or apropos (they are equivalent). If I don't know how to find a file: man -k file | grep search. Read the descriptions and find one that will better fit your needs.
>
>

* Apropos works with regular expressions by default, (man apropos, read the description and find out what -r does), and on this example I'm looking for every manpage where the description starts with "report".
* Always read the DESCRIPTION before starting

* Take a time and read the description. By just reading the description of the xargs command we will learn that:

>
>
> xargs reads from STDIN and executes the command needed. This also means that you will need to have some knowledge of how standard input works, and how to manipulate it through pipes to chain commands  
>  The default behavior is to act like /bin/echo. This gives you a little tip that if you need to chain more than one xargs, you don't need to use echo to print.  
>  We have also learned that unix filenames can contain blank and newlines, that this could be a problem and the argument -0 is a way to prevent things explode by using null character separators. The description warns you that the command being used as input needs to support this feature too, and that GNU find support it. Great. We use a lot of find with xargs.  
>  xargs will stop if exit status 255 is reached.
>
>

* Some descriptions are very short and that is generally because the software works on a very simple way. Don't even think of skipping this part of the manpage ;)
* Other things to pay attention...

* You know that you can search for files using find. There is a ton of options and if you only look at the SYNOPSIS, you will get overwhelmed by those. It's just the tip of the iceberg. Excluding NAME, SYNOPSIS, and DESCRIPTION, you will have the following sections:

>
>
> When this method will not work so well...
>
>
>
> * Tips that apply to all commands
>
>

* Some options, mnemonics and "syntax style" travel through all commands making you buy some time by not having to open the manpage at all. Those are learned by practice and the most common are:

>
>
> Generally, -v means verbose. -vvv is a variation "very very verbose" on some software.  
>  Following the POSIX standard, generally one dash arguments can be stacked. Example: tar -xzvf, cp -Rv.  
>  Generally -R and/or -r means recursive.  
>  Almost all commands have a brief help with the --help option.  
>  \--version shows the version of a software.  
>  \-p, on copy or move utilities means "preserve permissions".  
>  \-y means YES, or "proceed without confirmation" in most cases.
>
>

* Default values of commands.

>
>
> At the pager chunk of this answer, we saw that less -is is the pager of man. The default behavior of commands are not always shown at a separated section on manpages, or at the section that is most top placed.  
>  You will have to read the options to find out defaults, or if you are lucky, typing /pager will lead you to that info. This also requires you to know the concept of the pager(software that scrolls the manpage), and this is a thing you will only acquire after reading lots of manpages.
>
>

* And what about the SYNOPSIS syntax?

>
>
> After getting all the information needed to execute the command, you can combine options, option-arguments and operands inline to make your job done. Overview of concepts:  
>  Options are the switches that dictates a command behavior. "Do this" "don't do this" or "act this way". Often called switches.
>
>

* Check out the full answer and see if it helps you better grasp the meaning of a man page and thus the command. \*\*\*

### [My adventure into SSD caching with ZFS (Home NAS)](https://robertputt.co.uk/my-adventure-into-ssd-caching-with-zfs-home-nas.html) ###

* Robert Putt as written about his adventure using SSDs for caching with ZFS on his home NAS.

>
>
> Recently I decided to throw away my old defunct 2009 MacBook Pro which was rotting in my cupboard and I decided to retrieve the only useful part before doing so, the 80GB Intel SSD I had installed a few years earlier. Initially I thought about simply adding it to my desktop as a bit of extra space but in 2017 80GB really wasnt worth it and then I had a brainwave Lets see if we can squeeze some additional performance out of my HP Microserver Gen8 NAS running ZFS by installing it as a cache disk.  
>  I installed the SSD to the cdrom tray of the Microserver using a floppy disk power to SATA power converter and a SATA cable, unfortunately it seems the CD ROM SATA port on the motherboard is only a 3gbps port although this didnt matter so much as it was an older 3gbps SSD anyway. Next I booted up the machine and to my suprise the disk was not found in my FreeBSD install, then I realised that the SATA port for the CD drive is actually provided by the RAID controller, so I rebooted into intelligent provisioning and added an additional RAID0 array with just the 1 disk to act as my cache, in fact all of the disks in this machine are individual RAID0 arrays so it looks like just a bunch of disks (JBOD) as ZFS offers additional functionality over normal RAID (mainly scrubbing, deduplication and compression).
>
>

* Configuration

* Lets have a look at the zpool before adding the cache drive to make sure there are no errors or uglyness:

>
>
> Now lets prep the drive for use in the zpool using gpart. I want to split the SSD into two seperate partitions, one for L2ARC (read caching) and one for ZIL (write caching). I have decided to split the disk into 20GB for ZIL and 50GB for L2ARC. Be warned using 1 SSD like this is considered unsafe because it is a single point of failure in terms of delayed writes (a redundant configuration with 2 SSDs would be more appropriate) and the heavy write cycles on the SSD from the ZIL is likely to kill it over time.  
>  Now its time to see if adding the cache has made much of a difference. I suspect not as my Home NAS sucks, it is a HP Microserver Gen8 with the crappy Celeron CPU and only 4GB RAM, anyway, lets test it and find out. First off lets throw fio at the mount point for this zpool and see what happens both with the ZIL and L2ARC enabled and disabled.
>
>

* Observations

>
>
> Ok, so the initial result is a little dissapointing, but hardly unexpected, my NAS sucks and there are lots of bottle necks, CPU, memory and the fact only 2 of the SATA ports are 6gbps. There is no real difference performance wise in comparison between the results, the IOPS, bandwidth and latency appear very similar. However lets bare in mind fio is a pretty hardcore disk benchmark utility, how about some real world use cases?  
>  Next I decided to test a few typical file transactions that this NAS is used for, Samba shares to my workstation. For the first test I wanted to test reading a 3GB file over the network with both the cache enabled and disabled, I would run this multiple times to ensure the data is hot in the L2ARC and to ensure the test is somewhat repeatable, the network itself is an uncongested 1gbit link and I am copying onto the secondary SSD in my workstation. The dataset for these tests has compression and deduplication disabled.
>
>

* Samba Read Test

>
>
> Not bad once the data becomes hot in the L2ARC cache reads appear to gain a decent advantage compared to reading from the disk directly. How does it perform when writing the same file back accross the network using the ZIL vs no ZIL.
>
>

* Samba Write Test

>
>
> Another good result in the real world test, this certainately helps the write transfer speed however I do wonder what would happen if you filled the ZIL transferring a very large file, however this is unlikely with my use case as I typically only deal with a couple of files of several hundred megabytes at any given time so a 20GB ZIL should suit me reasonably well.
>
>

* Is ZIL and L2ARC worth it?

>
>
> I would imagine with a big beefy ZFS server running in a company somewhere with a large disk pool and lots of users with multiple enterprise level SSD ZIL and L2ARC would be well worth the investment, however at home I am not so sure. Yes I did see an increase in read speeds with cached data and a general increase in write speeds however it is use case dependant. In my use case I rarely access the same file frequently, my NAS primarily serves as a backup and for archived data, and although the write speeds are cool I am not sure its a deal breaker. If I built a new home NAS today Id probably concentrate the budget on a better CPU, more RAM (for ARC cache) and more disks. However if I had a use case where I frequently accessed the same files and needed to do so in a faster fashion then yes, Id probably invest in an SSD for caching. I think if you have a spare SSD lying around and you want something fun todo with it, sure chuck it in your ZFS based NAS as a cache mechanism. If you were planning on buying an SSD for caching then Id really consider your needs and decide if the money can be spent on alternative stuff which would improve your experience with your NAS. I know my NAS would benefit more from an extra stick of RAM and a more powerful CPU, but as a quick evening project with some parts I had hanging around adding some SSD cache was worth a go.
>
>
> ---
>

More Viewer Interview Questions for Allan
----------

---

News Roundup
----------

### [Setup OpenBSD 6.2 with Full Disk Encryption](https://blog.cagedmonster.net/setup-openbsd-with-full-disk-encryption/) ###

* Here is a quick way to setup (in 7 steps) OpenBSD 6.2 with the encryption of the filesystem.

* First step: Boot and start the installation:

>
>
> (I)nstall: I  
>  Keyboard Layout: ENTER (I'm french so in my case I took the FR layout)  
>  Leave the installer with: !
>
>

* Second step: Prepare your disk for encryption.

>
>
> Using a SSD, my disk is named : sd0, the name may vary, for example : wd0.  
>  Initiating the disk:  
>  Configure your volume:  
>  Now we'll use bioctl to encrypt the partition we created, in this case : sd0a (disk sd0 + partition « a »).  
>  Enter your passphrase.
>
>

* Third step:

>
>
> Let's resume the OpenBSD's installer. We follow the install procedure
>
>

* Fourth step: Partitioning of the encrypted volume.

>
>
> We select our new volume, in this case: sd1  
>  The whole disk will be used: W(hole)  
>  Let's create our partitions:  
>  NB: You are more than welcome to create multiple partitions for your system.
>
>

* Fifth step: System installation

>
>
> It's time to choose how we'll install our system (network install by http in my case)
>
>

* Sixth step: Finalize the installation.

* Last step: Reboot and start your system.

>
>
> Put your passphrase. Welcome to OpenBSD 6.2 with a full encrypted file system.
>
>

* Optional: Disable the swap encryption.

>
>
> The swap is actually part of the encrypted filesystem, we don't need OpenBSD to encrypt it. Sysctl is giving us this possibility.
>
>

---

### [Step-by-Step FreeBSD installation with ZFS and Full Disk Encryption](https://blog.cagedmonster.net/step-by-step-freebsd-installation-with-full-disk-encryption/) ###

* 1. What do I need?
  * For this tutorial, the installation has been made on a Intel Core i7 - AMD64 architecture.
  * On a USB key, you would probably use this link : [ftp://ftp.freebsd.org/pub/FreeBSD/releases/amd64/amd64/ISO-IMAGES/11.1/FreeBSD-11.1-RELEASE-amd64-mini-memstick.img](ftp://ftp.freebsd.org/pub/FreeBSD/releases/amd64/amd64/ISO-IMAGES/11.1/FreeBSD-11.1-RELEASE-amd64-mini-memstick.img)
  * If you can't do a network installation, you'd better use this image : [ftp://ftp.freebsd.org/pub/FreeBSD/releases/amd64/amd64/ISO-IMAGES/11.1/FreeBSD-11.1-RELEASE-amd64-memstick.img](ftp://ftp.freebsd.org/pub/FreeBSD/releases/amd64/amd64/ISO-IMAGES/11.1/FreeBSD-11.1-RELEASE-amd64-memstick.img)
  * You can write the image file on your USB device (replace XXXX with the name of your device) using dd : `# dd if=FreeBSD-11.1-RELEASE-amd64-mini-memstick.img of=/dev/XXXX bs=1m`

* 2. Boot and install: [Screenshot](https://blog.cagedmonster.net/content/images/2017/09/F1.png)
* 3. Configure your keyboard layout: [Screenshot](https://blog.cagedmonster.net/content/images/2017/09/F2.png) & [Screenshot](https://blog.cagedmonster.net/content/images/2017/09/F3.png)
* 4. Hostname and system components configuration :
  * Set the name of your machine: [Screenshot]([https://blog.cagedmonster.net/content/images/2017/09/F4.png\_](https://blog.cagedmonster.net/content/images/2017/09/F4.png_)
  * What components do you want to install? [Screenshot](https://blog.cagedmonster.net/content/images/2017/09/F5.png)

* 5. Network configuration:
  * Select the network interface you want to configure. [Screenshot](https://blog.cagedmonster.net/content/images/2017/09/F6.png)
  * First, we configure our IPv4 network. I used a static adress so you can see how it works, but you can use DHCP for an automated configuration, it depends of what you want to do with your system (desktop/server) [Screenshot](https://blog.cagedmonster.net/content/images/2017/09/F7.png) & [Screenshot](https://blog.cagedmonster.net/content/images/2017/09/F7-1.png) & [Screenshot](https://blog.cagedmonster.net/content/images/2017/09/F8.png)

* IPv6 network configuration. Same as for IPv4, you can use SLAAC for an automated configuration. [Screenshot](https://blog.cagedmonster.net/content/images/2017/09/F9.png) & [Screenshot](https://blog.cagedmonster.net/content/images/2017/09/F10-1.png) & [Screenshot](https://blog.cagedmonster.net/content/images/2017/09/F10-2.png)
  * Here, you can configure your DNS servers, I used the Google DNS servers so you can use them too if needed. [Screenshot](https://blog.cagedmonster.net/content/images/2017/09/F11.png)

* 6. Select the server you want to use for the installation:
  * I always use the IPv6 mirror to ensure that my IPv6 network configuration is good.[Screenshot](https://blog.cagedmonster.net/content/images/2017/09/F12.png)

* 7. Disk configuration:
  * As we want to do an easy full disk encryption, we'll use ZFS. [Screenshot](https://blog.cagedmonster.net/content/images/2017/09/F13.png)
  * Make sure to select the disk encryption :[Screenshot](https://blog.cagedmonster.net/content/images/2017/09/F14.png)
  * Launch the disk configuration :[Screenshot](https://blog.cagedmonster.net/content/images/2017/09/F15.png)
  * Here everything is normal, you have to select the disk you'll use :[Screenshot](https://blog.cagedmonster.net/content/images/2017/09/F16.png)
  * I have only one SSD disk named da0 :[Screenshot](https://blog.cagedmonster.net/content/images/2017/09/F17.png)
  * Last chance before erasing your disk :[Screenshot](https://blog.cagedmonster.net/content/images/2017/09/F18.png)

* Time to choose the password you'll use to start your system : [Screenshot](https://blog.cagedmonster.net/content/images/2017/09/F19.png) & [Screenshot](https://blog.cagedmonster.net/content/images/2017/09/F20.png) & [Screenshot](https://blog.cagedmonster.net/content/images/2017/09/F21.png)
* 8. Last steps to finish the installation:
  * The installer will download what you need and what you selected previously (ports, src, etc.) to create your system: [Screenshot](https://blog.cagedmonster.net/content/images/2017/09/F22.png)

* 8.1. Root password:
  * Enter your root password: [Screenshot](https://blog.cagedmonster.net/content/images/2017/09/F22-1.png)

* 8.2. Time and date:
  * Set your timezone, in my case: Europe/France [Screenshot](https://blog.cagedmonster.net/content/images/2017/09/F22-2.png) & [Screenshot](https://blog.cagedmonster.net/content/images/2017/09/F23.png) & [Screenshot](https://blog.cagedmonster.net/content/images/2017/09/F23-1.png)
  * Make sure the date and time are good, or you can change them :[Screenshot](https://blog.cagedmonster.net/content/images/2017/09/F24.png) & [Screenshot](https://blog.cagedmonster.net/content/images/2017/09/F25.png)

* 8.3. Services:
  * Select the services you'll use at system startup depending again of what you want to do. In many cases powerd and ntpd will be useful, sshd if you're planning on using FreeBSD as a server. [Screenshot](https://blog.cagedmonster.net/content/images/2017/09/F26.png)

* 8.4. Security:
  * Security options you want to enable. You'll still be able to change them after the installation with sysctl. [Screenshot](https://blog.cagedmonster.net/content/images/2017/09/F26-1.png)

* 8.5. Additionnal user:
  * Create an unprivileged system user: [Screenshot](https://blog.cagedmonster.net/content/images/2017/09/F26-2.png)
  * Make sure your user is in the wheel group so he can use the su command. [Screenshot](https://blog.cagedmonster.net/content/images/2017/09/F26-3.png) & [Screenshot](https://blog.cagedmonster.net/content/images/2017/09/F26-4.png)

* 8.6. The end: End of your configuration, you can still do some modifications if you want : [Screenshot](https://blog.cagedmonster.net/content/images/2017/09/F26-5.png) & [Screenshot](https://blog.cagedmonster.net/content/images/2017/09/F26-6.png) & [Screenshot](https://blog.cagedmonster.net/content/images/2017/09/F26-7.png)
* 9. First boot:
  * Enter the passphrase you have chosen previously : [Screenshot](https://blog.cagedmonster.net/content/images/2017/09/F27.png) & [Screenshot](https://blog.cagedmonster.net/content/images/2017/09/F28.png) & [Screenshot](https://blog.cagedmonster.net/content/images/2017/09/F29.png)

* Welcome to Freebsd 11.1 with full disk encryption! \*\*\*

### [The anatomy of ldd program on OpenBSD](http://nanxiao.me/en/the-anatomy-of-ldd-program-on-openbsd/) ###

>
>
> In the past week, I read the [ldd](https://github.com/openbsd/src/blob/master/libexec/ld.so/ldd/ldd.c) source code on OpenBSD to get a better understanding of how it works. And this post should also be a reference for other\*NIX OSs.
>
>

* The [ELF](https://en.wikipedia.org/wiki/Executable_and_Linkable_Format) file is divided into 4 categories: relocatable, executable, shared, and core. Only the executable and shared object files may have dynamic object dependencies, so the ldd only check these 2 kinds of ELF file:
* (1) Executable. `ldd` leverages the `LD_TRACE_LOADED_OBJECTS` environment variable in fact, and the code is as following:

>
>
> ```
> if (setenv("LD_TRACE_LOADED_OBJECTS", "true", 1) < 0)
> err(1, "setenv(LD_TRACE_LOADED_OBJECTS)");
>
> ```
>
>
>
> When LD\_TRACE\_LOADED\_OBJECTS is set to 1 or true, running executable file will show shared objects needed instead of running it, so you even not needldd to check executable file. See the following outputs:
>
>
>
> ```
> $ /usr/bin/ldd
> usage: ldd program ...
> $ LD_TRACE_LOADED_OBJECTS=1 /usr/bin/ldd
>         Start            End              Type Open Ref GrpRef Name
>         00000b6ac6e00000 00000b6ac7003000 exe  1    0   0      /usr/bin/ldd
>         00000b6dbc96c000 00000b6dbcc38000 rlib 0    1   0      /usr/lib/libc.so.89.3
>         00000b6d6ad00000 00000b6d6ad00000 rtld 0    1   0      /usr/libexec/ld.so  
>
> ```
>
>

* (2) Shared object. The code to print dependencies of shared object is as following:

>
>
> ```
> if (ehdr.e_type == ET_DYN && !interp) {
>     if (realpath(name, buf) == NULL) {
>         printf("realpath(%s): %s", name,
>             strerror(errno));
>         fflush(stdout);
>         _exit(1);
>     }
>     dlhandle = dlopen(buf, RTLD_TRACE);
>     if (dlhandle == NULL) {
>         printf("%s\n", dlerror());
>         fflush(stdout);
>         _exit(1);
>     }
>     _exit(0);
> }
>
> ```
>
>
>
> Why the condition of checking a ELF file is shared object or not is like this:
>
>
>
> ```
> if (ehdr.e_type == ET_DYN && !interp) {
>     ......
> }
>
> ```
>
>
>
> Thats because the file type of position-independent executable (PIE) is the same as shared object, but normally PIE contains a interpreter program header since it needs dynamic linker to load it while shared object lacks (refer this article). So the above condition will filter PIE file.  
>  The dlopen(buf, RTLD\_TRACE) is used to print dynamic object information. And the actual code is like this:
>
>
>
> ```
> if (_dl_traceld) {
>     _dl_show_objects();
>     _dl_unload_shlib(object);
>     _dl_exit(0);
> }
>
> ```
>
>
>
> In fact, you can also implement a simple application which outputs dynamic object information for shared object yourself:
>
>
>
> ```
> &#35; include <dlfcn.h>
> int main(int argc, char **argv)
> {
>     dlopen(argv[1], RTLD_TRACE);
>     return 0;
> }
>
> ```
>
>
>
> Compile and use it to analyze /usr/lib/libssl.so.43.2:
>
>
>
> ```
> $ cc lddshared.c
> $ ./a.out /usr/lib/libssl.so.43.2
>     Start            End              Type Open Ref GrpRef Name
>     000010e2df1c5000 000010e2df41a000 dlib 1    0   0      /usr/lib/libssl.so.43.2
>     000010e311e3f000 000010e312209000 rlib 0    1   0      /usr/lib/libcrypto.so.41.1
>
> ```
>
>
>
> The same as using ldd directly:
>
>
>
> ```
> $ ldd /usr/lib/libssl.so.43.2
> /usr/lib/libssl.so.43.2:
>     Start            End              Type Open Ref GrpRef Name
>     00001d9ffef08000 00001d9fff15d000 dlib 1    0   0      /usr/lib/libssl.so.43.2
>     00001d9ff1431000 00001d9ff17fb000 rlib 0    1   0      /usr/lib/libcrypto.so.41.1
>
> ```
>
>
>
> Through the studying of ldd source code, I also get many by-products: such as knowledge of ELF file, linking and loading, etc. So diving into code is a really good method to learn \*NIX deeper!
>
>
> ---
>

### [Perl5 Slack Syslog BSD daemon](https://clinetworking.wordpress.com/2017/10/13/perl5-slack-syslog-bsd-daemon/) ###

>
>
> So I have been working on my little Perl daemon for a week now.  
>  It is a simple syslog daemon that listens on port 514 for incoming messages. It listens on a port so it can process log messages from my consumer Linux router as well as the messages from my server. Messages that are above alert are sent, as are messages that match the regex of SSH or DHCP (I want to keep track of new connections to my wifi). The rest of the messages are not sent to slack but appended to a log file. This is very handy as I can get access to info like failed ssh logins, disk failures, and new devices connecting to the network all on my Android phone when I am not home.
>
>

* [Screenshot](https://clinetworking.files.wordpress.com/2017/10/screenshot_2017-10-13-23-00-26.png)

>
>
> The situation arose today that the internet went down and I thought to myself what would happen to all my important syslog messages when they couldnt be sent? Before the script only ran an eval block on the botsend() function. The error was returned, handled, but nothing was done and the unsent message was discarded. So I added a function that appended unsent messengers to an array that are later sent when the server is not busy sending messages to slack.  
>  Slack has a limit of one message per second. The new addition works well and means that if the internet fails my server will store these messages in memory and resend them at a rate of one message per second when the internet connectivity returns. It currently sends the newest ones first but I am not sure if this is a bug or a feature at this point! It currently works with my Linux based WiFi router and my FreeBSD server. It is easy to scale as all you need to do is send messages to syslog to get them sent to slack. You could sent CPU temp, logged in users etc.
>
>

* There is a github page: [https://github.com/wilyarti/slackbot](https://github.com/wilyarti/slackbot)

---

### [Lscpu for OpenBSD/FreeBSD](http://nanxiao.me/en/lscpu-for-openbsdfreebsd/) ###

* [Github Link](https://github.com/NanXiao/lscpu)

>
>
> There is a neat command, lscpu, which is very handy to display CPU information on GNU/Linux OS:
>
>
>
> ```
> $ lscpu
> Architecture:        x86_64
> CPU op-mode(s):      32-bit, 64-bit
> Byte Order:          Little Endian
> CPU(s):              32
> On-line CPU(s) list: 0-31
> Thread(s) per core:  2
> Core(s) per socket:  8
> Socket(s):           2
>
> ```
>
>
>
> But unfortunately, the BSD OSs lack this command, maybe one reason is lscpu relies heavily on /proc file system which BSD dont provide, :-). TakeOpenBSD as an example, if I want to know CPU information, dmesg should be one choice:
>
>
>
> ```
> $ dmesg | grep -i cpu
> cpu0 at mainbus0: apid 0 (boot processor)
> cpu0: Intel(R) Core(TM)2 Duo CPU P8700 @ 2.53GHz, 2527.35 MHz
> cpu0: FPU,VME,DE,PSE,TSC,MSR,PAE,MCE,CX8,APIC,SEP,MTRR,PGE,MCA,CMOV,PAT,PSE36,CFLUSH,DS,ACPI,MMX,FXSR,SSE,SSE2,SS,HTT,TM,
> PBE,SSE3,DTES64,MWAIT,DS-CPL,VMX,SMX,EST,TM2,SSSE3,CX16,xTPR,PDCM,SSE4.1,XSAVE,NXE,LONG,LAHF,PERF,SENSOR
> cpu0: 3MB 64b/line 8-way L2 cache
> cpu0: apic clock running at 266MHz
> cpu0: mwait min=64, max=64, C-substates=0.2.2.2.2.1.3, IBE
>
> ```
>
>
>
> But the output makes me feeling messy, not very clear. As for dmidecode, it used to be another option, but now cant work out-of-box because it will access /dev/mem which for security reason, OpenBSD doesnt allow by default (You can refer this discussion):
>
>
>
> ```
> $ ./dmidecode
> $ dmidecode 3.1
> Scanning /dev/mem for entry point.
> /dev/mem: Operation not permitted
>
> ```
>
>
>
> Based on above situation, I want a specified command for showing CPU information for my BSD box. So in the past 2 weeks, I developed a lscpu program for OpenBSD/FreeBSD, or more accurately, OpenBSD/FreeBSD on x86 architecture since I only have some Intel processors at hand. The application getsCPU metrics from 2 sources:
>
>

* (1) `sysctl` functions. The BSD OSs provide sysctl interface which I can use to get general CPU particulars, such as how many CPUs the system contains, the byte-order of CPU, etc.
* (2) `CPUID` instruction. For x86 architecture, CPUID instruction can obtain very detail information of CPU. This coding work is a little tedious and error-prone, not only because I need to reference both Intel and AMD specifications since these 2 vendors have minor distinctions, but also I need to parse the bits of register values.
* The code is [here](https://github.com/NanXiao/lscpu), and if you run OpenBSD/FreeBSD on x86 processors, please try it. It will be better you can give some feedback or report the issues, and I appreciate it very much. In the future if I have other CPUs resource, such as ARM or SPARC64, maybe I will enrich this small program. \*\*\*

Beastie Bits
----------

* [OpenBSD Porting Workshop - Brian Callahan will be running an OpenBSD porting workshop in NYC for NYC\*BUG on December 6, 2017.](http://daemonforums.org/showthread.php?t=10429)
* [Learn to tame OpenBSD quickly](http://www.openbsdjumpstart.org/#/)
* [Detect the operating system using UDP stack corner cases](https://gist.github.com/sortie/94b302dd383df19237d1a04969f1a42b) \*\*\*

Feedback/Questions
----------

* Awesome Mike - [ZFS Questions](http://dpaste.com/1H22BND#wrap)
* Michael - [Expanding a file server with only one hard drive with ZFS](http://dpaste.com/1JRJ6T9) - [information based on Allan's IRC response](http://dpaste.com/36M7M3E)
* Brian - [Optimizing ZFS for a single disk](http://dpaste.com/3X0GXJR#wrap) \*\*\*