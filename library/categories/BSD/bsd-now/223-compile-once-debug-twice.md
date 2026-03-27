+++
title = "223: Compile once, debug twice"
description = "Picking a compiler for debuggability, how to port Rust apps to FreeBSD, what the point of Docker is on FreeBSD/Solaris, another EuroBSDcon recap, and network manager control in OpenBSDThis episode was brought to you by[![iXsystems - Enterprise Servers and Storage for Op"
date = "2017-12-06T13:00:00Z"
url = "https://www.bsdnow.tv/223"
author = "feedback@bsdnow.tv (JT Pennington)"
text = ""
lastupdated = "2026-03-26T14:37:50.818271708Z"
seen = false
+++

Picking a compiler for debuggability, how to port Rust apps to FreeBSD, what the point of Docker is on FreeBSD/Solaris, another EuroBSDcon recap, and network manager control in OpenBSD

This episode was brought to you by
----------

[![iXsystems - Enterprise Servers and Storage for Open Source](/images/1.png)](http://www.ixsystems.com/bsdnow)[![DigitalOcean - Simple Cloud Hosting, Built for Developers](/images/2.png)](http://www.digitalocean.com/)[![Tarsnap - Online Backups for the Truly Paranoid](/images/3.png)](http://www.tarsnap.com/bsdnow)

---

Headlines
----------

### [Compile once, Debug twice: Picking a compiler for debuggability, part 1 of 3](https://backtrace.io/blog/compile-once-debug-twice-picking-a-compiler-for-debuggability-1of3/) ###

* An interesting look into why when you try to debug a crash, you can often find all of the useful information has been optimized out

>
>
> Have you ever had an assert get triggered only to result in a useless core dump with missing variable information or an invalid callstack?  
>  Common factors that go into selecting a C or C++ compiler are: availability, correctness, compilation speed and application performance. A factor that is often neglected is debug information quality, which symbolic debuggers use to reconcile application executable state to the source-code form that is familiar to most software engineers.  
>  When production builds of an application fail, the level of access to program state directly impacts the ability for a software engineer to investigate and fix a bug. If a compiler has optimized out a variable or is unable to express to a symbolic debugger how to reconstruct the value of a variable, the engineers investigation process is significantly impacted. Either the engineer has to attempt to recreate the problem, iterate through speculative fixes or attempt to perform prohibitively expensive debugging, such as reconstructing program state through executable code analysis.  
>  Debug information quality is in fact not proportionally related to the quality of the generated executable code and wildly varies from compiler to compiler.  
>  Different compilers emit debug information at varying levels of quality and accuracy. However, certain optimizations will certainly impact any debuggers ability to generate accurate stack traces or extract variable values.   
>  In the above program, the value of argv is extracted and then the program is paused. The ck\_pr\_load\_ptr function performs a read from the region of memory pointed to by argv, in a manner that prevents the compiler from performing optimization on it. This ensures that the memory access occurs and for this reason, the value of argv must be accessible by the time ck\_pr\_load\_ptr is executed.  
>  When compiled with gcc, the debugger fails to find the value of the variable. The compiler determines that the value of argv is no longer needed after the ck\_pr\_load\_ptr operation and so doesnt bother paying the cost of saving the value.  
>  Some optimizations generate executable code whose call stack cannot be sufficiently disambiguated to reconcile a call stack that mirrors that of the source program. Two common culprits for this are tail call optimization and basic block commoning.
>
>

* In another example

>
>
> If the program receives a first argument of 1, then function is called with the argument of "a". If the program receives a first argument of 2, then function is called with the argument of "b". However, if we compile this program with clang, the stack traces in both cases are identical! clang informs the debugger that the function f invoked the function("b") branch where x = 2 even if x = 1.  
>  Though some optimizations will certainly impact the accuracy of a symbolic debugger, some compilers simply lack the ability to generate debug information in the presence of certain optimizations. One common optimization is induction variable elimination. A variable thats incremented or decremented by a constant on every iteration of a loop or derived from another variable that follows this pattern, is an induction variable.  
>  Coupled with other optimizations, the compiler is then able to generate code that doesnt actually rely on a dedicated counter variable i for maintaining the current offset into buffer.  
>  As you can see, i is completely optimized out. The compiler determines it doesnt have to pay the cost of maintaining the induction variable i. It maintains the pointer in the register %rdi. The code is effectively rewritten to something closer to this:
>
>

* So the for loop, changes into a while loop, with a condition of the end of the input

>
>
> We have shown some common optimizations that may get in the way of the debuggability of your application and demonstrated a disparity in debug information quality across two popular compilers. In the next blog post of this series, we will examine how gcc and clang stack up with regards to debug information quality across a myriad of synthetic applications and real world applications.
>
>

* Looking forward to part 2 \*\*\*

### [This is how you can port your rust application to FreeBSD](https://medium.com/@andoriyu/this-is-how-you-can-port-your-rust-application-to-freebsd-7d3e9f1bc3df) ###

* This is how you can port your rust application to FreeBSD

>
>
> The FreeBSD Ports Collection is the way almost everyone installs applications (ports) on FreeBSD. Like everything else about FreeBSD, it is primarily a volunteer effort. It is important to keep this in mind when reading this document.  
>  In FreeBSD, anyone may submit a new port, or volunteer to maintain an existing unmaintained port. No special commit privilege is needed.  
>  For this guide I will use fd tool written by David Peter as example project.
>
>

* Prerequisites

  * FreeBSD installation (VM is fine)
  * Local ports tree (done via svn)
  * portlint (located at devel/portlint)
  * poudriere (located at ports-mgmt/poudriere)[optional]

* Getting ports tree

  * When you install FreeBSD opt-out of the ports tree. Install svn:

```
pkg install svn
svn checkout https://svn.freebsd.org/ports/head /usr/ports

```

* Poudriere

>
>
> Sometimes you might get asked to show poudriere build log, sometimes you wont. Its good to have anyway. If you choose to use poudriere, use ZFS. There are plenty of guides on the subject. FreeBSD Porters Handbook is the most complete source of information on porting to FreeBSD.
>
>

* Makefile

>
>
> Whole porting process in most cases is writing one Makefile. I recommend doing something like this.  
>  Here is the one I wrote for fd:
>
>

* Port metadata

>
>
> Each port must have one primary category in case of fd it will be sysutils, therefore it's located in /usr/ports/systuils/fd.
>
>

```
PORTNAME= fd
CATEGORIES= sysutils

```

>
>
> Since this port conflicts with other util named fd I specified package suffix as: PKGNAMESUFFIX= -find and indicate conflict: CONFLICTS\_INSTALL= fd-[0-9]\*. That means to install it from packages user will have to type:
>
>

```
pkg install fd-find

```

* Licenses

>
>
> This section is different for every port, but in case of fd it's pretty straightforward:
>
>

```
LICENSE= MIT APACHE20
LICENSE_COMB= dual

```

>
>
> Since fd includes the text of licenses you should do this as well:
>
>

```
LICENSE_FILE_MIT= ${WRKSRC}/LICENSE-MIT
LICENSE_FILE_APACHE20= ${WRKSRC}/LICENSE-APACHE

```

* Distfiles

>
>
> FreeBSD has a requirement that all ports must allow offline building. That means you have specified which files are needed to be downloaded. Luckily we now have helpers to download GitHub sources directly from GitHub:
>
>

```
USE_GITHUB= yes
GH_ACCOUNT= sharkdp

```

>
>
> Since PORTNANE is fd it will try to download sources for sharkdp/fd. By default it's going to download tag:
>
>

```
${DISTVERSIONPREFIX}${DISTVERSION}${DISTVERSIONSUFFIX}

```

>
>
> fd uses v as the prefix, therefore we need to specify: DISTVERSIONPREFIX= v.  
>  It's also possible to specify GH\_TAGNAME in case tag name doesn't match that pattern.
>
>

* Extra packages

>
>
> There are very few rust projects that are standalone and use no crates dependencies. Its used to be PITA to make it work offline, but now cargo is a first class citizen in ports:
>
>

```
USES= cargo
CARGO_CRATES= aho-corasick-0.6.3 \
              atty-0.2.3 \
              # and so goes on

```

>
>
> Yes, you have to specify each dependency. Luckily, there is a magic awk script that turns Cargo.lock into what you need. Execute make cargo-crates in the port root. This will fail because you're missing checksum for the original source files:
>
>

```
make makesum
make cargo-crates

```

>
>
> This will give you what you need. Double check that result is correct. There is a way to ignore checksum error, but I cant remember Execute make makesum again.
>
>

* CARGO\_OUT

>
>
> If. build.rs relies on that you have to change it. fd allows you to use SHELL\_COMPLETIONS\_DIR to specify where completions go, while ripgrep doesn't. In our case we just specify SHELL\_COMPLETIONS\_DIR:
>
>

```
SHELL_COMPLETIONS_DIR= ${WRKDIR}/shell-completions-dir CARGO_ENV= SHELL_COMPLETIONS_DIR=${SHELL_COMPLETIONS_DIR}

```

* PLIST

>
>
> FreeBSD is very strict about files its installing and it wont allow you to install random files that get lost. You have to specify which files youre installing. In this case, its just two:
>
>

```
PLIST_FILES= bin/fd \
             man/man1/fd.1.gz

```

>
>
> Note that sources for fd have uncompressed man file, while here its listed as compressed. If port installs a lot of files, specify them in pkg-plist like here. To actually install them:
>
>

```
post-install:
  @${STRIP_CMD} ${STAGEDIR}${PREFIX}/bin/fd
  ${INSTALL_MAN}${WRKSRC}/doc/fd.1 ${STAGEDIR}${MAN1PREFIX}/man/man1

```

* Shell completions

>
>
> clap-rs can generate shell completions for you, it's usually handled by build.rs script. First, we need to define options:
>
>

```
OPTIONS_DEFINE= BASH FISH ZSH # list options
OPTIONS_DEFAULT= BASH FISH ZSH # select them by default
BASH_PLIST_FILES= etc/bash_completion.d/fd.bash-completion
FISH_PLIST_FILES= share/fish/completions/fd.fish
ZSH_PLIST_FILES= share/zsh/site-functions/_fd

```

>
>
> To actually install them:
>
>

```
post-install-BASH-on:
 @${MKDIR} ${STAGEDIR}${PREFIX}/etc/bash_completion.d
 ${INSTALL_DATA} ${SHELL_COMPLETIONS_DIR}/fd.bash-completion \
 ${STAGEDIR}${PREFIX}/etc/bash_completion.d
post-install-FISH-on:
 @${MKDIR} ${STAGEDIR}${PREFIX}/share/fish/completions
 ${INSTALL_DATA} ${SHELL_COMPLETIONS_DIR}/fd.fish \
 ${STAGEDIR}${PREFIX}/share/fish/completions
post-install-ZSH-on:
 @${MKDIR} ${STAGEDIR}${PREFIX}/share/zsh/site-functions
 ${INSTALL_DATA} ${SHELL_COMPLETIONS_DIR}/_fd \
 ${STAGEDIR}${PREFIX}/share/zsh/site-functions

```

* Bonus round - Patching source code

>
>
> Sometimes you have to patch it and send the patch upstream. Merging it upstream can take awhile, so you can patch it as part of the install process. An easy way to do it:
>
>

* Go to work/ dir
* Copy file you want to patch and add .orig suffix to it
* Edit file you want to patch
* Execute make makepatch in port's root

* Submitting port

>
>
> First, make sure portlint -AC doesn't give you any errors or warnings. Second, make sure poudriere can build it on both amd64 and i386. If it can't??you have to either fix it or mark port broken for that arch.  
>  Follow this steps like I did steps. If you have any issues you can always ask your question in freebsd-ports on freenode try to find your answer in porters handbook before asking.
>
>

---

### [Conference Recap: EuroBSDCon 2017 Recap](https://www.freebsdfoundation.org/blog/conference-recap-eurobsdcon-2017-recap/) ###

>
>
> The location was wonderful and I loved sneaking out and exploring the city when I could. From what I heard, it was the largest BSD conference in history, with over 320 attendees!  
>  Each venue is unique and draws many local BSD enthusiasts, who normally wouldnt be able to travel to a conference. I love having the chance to talk to these people about how they are involved in the projects and what they would like to do. Most of the time, they are asking me questions about how they can get more involved and how we can help.  
> *Magical* is how I would describe the conference social event. To stand in front of the dinner cruise on the Seine, with the Eiffel Tower standing tall, lit up in the night, while working  talking to our community members, was incredible. But, let me start at the beginning.  
>  We attend these conferences to talk to our community members, to find out what they are working on, determine technologies that should be supported in FreeBSD, and what we can do to help and improve FreeBSD.  
>  We started the week with a half-day board meeting on Wednesday. BSD conferences give us a chance to not only meet with community members around the world, but to have face-to-face meetings with our team members, who are also located around the world. We worked on refining our strategic direction and goals, determining what upcoming conferences we want FreeBSD presence at and who can give FreeBSD talks and workshops there, discussed current and potential software development projects, and discussed how we can help raise awareness about and increase the use of FreeBSD in Europe.  
>  Thursday was the first day of the FreeBSD developer summit, led by our very own Benedict Reuschling. He surprised us all by having us participate in a very clever quiz on France. 45 of us signed into the software, where hed show the question on the screen and we had a limited amount of time to select our answers, with the results listed on the screen. It was actually a lot of fun, especially since they didnt publicize the names of the people who got the questions wrong. The lucky or most knowledgeable person on France, was [des@freebsd.org](mailto:des@freebsd.org).  
>  Some of our board members ran tutorials in parallel to the summit. Kirk McKusick gave his legendary tutorial, An Introduction to the FreeBSD Open-Source Operating System , George Neville-Neil gave his tutorial, DTrace for Developers, and Benedict Reuschling gave a tutorial on, Managing BSD systems with Ansible.  
>  I was pleased to have two chairs from ACM-W Europe run an Increasing Diversity in the BSDs BoF for the second year in a row. We broke up into three groups to discuss different gender bias situations, and what we can do to address these types of situations, to make the BSD projects more diverse, welcoming, and inclusive. At the end, people asked that we continue these discussions at future BSD conferences and suggested having an expert in the field give a talk on how to increase the diversity in our projects.  
>  As I mentioned earlier, the social dinner was on a boat cruising along the Seine. I had a chance to talk to community members in a more social environment. With the conference being in France, we had a lot of first time attendees from France. I enjoyed talking to many of them, as well as other people I only get to see at the European conferences. Sunday was full of more presentations and conversations. During the closing session, I gave a short talk on the Foundation and the work we are doing. Then, Benedict Reuschling, Board Vice President, came up and gave out recognition awards to four FreeBSD contributors who have made an impact on the Project.
>
>
> ---
>

News Roundup
----------

### [Playing with the pine64](https://chown.me/blog/playing-with-the-pine64.html) ###

* Daniel Jakots writes in his blog about his experiences with his two pine64 boards:

>
>
> Finding something to install on it  
>  6 weeks ago, I ordered two pine64 units. I didn't (and still don't) have much plan for them, but I wanted to play with some cheap boards. I finally received them this week. Initially I wanted to install some Linux stuff on it, I didn't have much requirement so I thought I would just look what seems to be easy and/or the best supported systemd flavour. I headed over their wiki. Everything seems either not really maintained, done by some random people or both. I am not saying random people do bad things, just that installing some random things from the Internet is not really my cup of tea.  
>  I heard about [Armbian](https://www.armbian.com/pine64/) but the server flavour seems to be experimental so I got scared of it. And sadly, the whole things looks like to be alot undermanned.  
>  So I went for OpenBSD because I know the stuff and who to har<sup>Wkindly</sup> ask for help. Spoiler alert, it's boring because it just works.
>
>

* Getting OpenBSD on it

>
>
> I downloaded miniroot62.fs, dd'ed it on the micro SD card. I was afraid I'd need to fiddle with some things like sysutils/dtb because I don't know what I would have needed to do. That's because I don't know what it does and for this precise reason I was wrong and I didn't need to do anything. So just dd the miniroot62.fs and you can go to next checkpoint.  
>  I plugged an HDMI cable, ethernet cable and the power, it booted, I could read for 10 seconds but then it got dark. Of course it's because you need a serial console. Of course I didn't have one.  
>  I thought about trying to install OpenBSD blindly, I could have probably succeeded with autoinstall buuuuuut  
>  Following some good pieces of advice from OpenBSD people I bought some cp2102 (I didn't try to understand what it was or what were the other possibilities, I just wanted something that would work :D).  
>  I looked how to plug the thing. It appears you can plug it on two different places but if you plug it on the Euler bus it could power a bit the board so if you try to reboot it, it would then mess with the power disruption and could lead a unclean reboot.  
>  You just need to plug three cables: GND, TXD and RXD. Of course, the TXD goes on the RXD pin from the picture and the RXD goes on the TXD pin. Guess why I'm telling you that!
>
>

* That's it
* Then you can connect with the usual

>
>
> $ cu -dl /dev/cuaU0 -s 115200
>
>
> ---
>

### [Whats the point of Docker on FreeBSD or Solaris?](http://blog.frankleonhardt.com/2017/whats-the-point-of-docker-on-freebsd-or-solaris/) ###

>
>
> Penguinisters are very keen on their docker, but for the rest of us it may be difficult to see what the fuss is all about  its only been around a few years and everyones talking about it. And someone asked again today. What are we missing?  
>  Well docker is a solution to a Linux (and Windows) problem that FreeBSD/Solaris doesnt have. Until recently, the Linux kernel only implemented the original user isolation model involving chroot. More recent kernels have had Control Groups added, which are intended to provide isolation for a group of processes (namespaces). This came out of Google, and theyve extended to concept to include processor resource allocation as one of the knobs, which could be a good idea for FreeBSD. The scheduler is aware of the JID of the process its about to schedule, and I might take a look in the forthcoming winter evenings. But I digress.  
>  So if isolation (containerisation in Linux terms) is in the Linux kernel, what is Docker bringing to the party? The only thing I can think of is standardisation and an easy user interface (at the expense of having Python installed). You might think of it in similar terms to ezjail  a complex system intended to do something that is otherwise very simple.  
>  To make a jail in FreeBSD all you need do is copy the files for your system to a directory. This can even be a whole servers system disk if you like, and jails can run inside jails. You then create a very simple config file, giving the jail a name, the path to your files and an what IP addresses to pass through (if any) and youre done. Just type service jail nameofjal start, and off it goes.  
>  Is there any advantage in running Docker? Well, in a way, there is. Docker has a repository of system images that you can just install and run, and this is what a lot of people want. Theyre a bit like virtual appliances, but not mind-numbingly inefficient.  
>  You can actually run docker on FreeBSD. A port was done a couple of years ago, but it relies on the 64-bit Linux emulation that started to appear in 10.x. The newer the version of FreeBSD the better.  
>  Docker is in ports/sysutils/docker-freebsd. It makes uses of jails instead of Linux cgroups, and requires ZFS rather than UFS for file system isolation. I believe the Linux version uses Union FS but I could be completely wrong on that.  
>  The FreeBSD port works with the Docker hub repository, giving you access to thousands of pre-packaged system images to play with. And thats about as far as Ive ever tested it. If you want to run the really tricky stuff (like Windows) you probably want full hardware emulation and something like Xen. If you want to deploy or migrate FreeBSD or Solaris systems, just copy a new tarball in to the directory and go. Its a non-problem, so why make it more complicated?  
>  Given the increasing frequency Docker turns up in conversations, its probably worth taking seriously as Linux applications get packaged up in to images for easy access. Jails/Zones may be more efficient, and Docker images are limited to binary, but convenience tends to win in many environments.
>
>
> ---
>

### [Network Manager Control for OpenBSD](http://www.vincentdelft.be/post/post_20171023) ###

>
>
> I propose you a small script allowing you to easily manage your networks connections. This script is integrated within the openbox dynamic menus. Moreover, it allow you to automatically have the connections you have pre-defined based.  
>  I was frustrated to not be able to swap quickly from one network interface to an another, to connect simply and quickly to my wifi, to my cable connection, to the wifi of a friend, ...   
>  Every time you have to type the ifconfig commands, .... This is nice, but boring. Surely, when you are in a middle of a presentation and you just want a quick connection to your mobile in tethering mode.  
>  Thanks to OpenBSD those commands are not so hard, but this frustrate me to not be able to do it with one click. Directly from my windows environment. Since I'm using Openbox, from a menu of openbox.  
>  So, I've looked around to see what is currently existing.   
>  One tool I've found was [netctl](https://github.com/akpoff/netctl). The idea is to have a repository of hostname.if files ready to use for different cases.   
>  The idea sounds great, but I had some difficulties to use it.   
>  But what annoys me the most, is that it modify the current hostname.if files in /etc.   
>  To my eyes, I would avoid to modify those files because they are my working basis. I want to rely on them and make sure that my network will be back to a normal mode after a reboot.   
>  Nevertheless, if I've well understood netctl, you have a feature where it will look for the predefined network config matching the environment where you are. Very cool.  
>  So, after having played with netctl, look for alternative on internet, I've decided to create nmctl. A small python script which just perform the mandatory network commands.
>
>

* 1. nmctl: a Network Manager Control tool for OpenBSD

>
>
> Nmctl a small tool that allow you to manage your network connections.   
>  Why python ? Just because it's the easiest programming language for me. But I should maybe rewrite it in shell, more standard in the OpenBSD world than python.
>
>

* 1.1. download and install

>
>
> I've put nmctl on my sourceforge account [here](https://sourceforge.net/p/nmctl/code/ci/master/tree/)  
>  You can dowload the last version [here](https://sourceforge.net/p/nmctl/code/ci/master/tarball)  
>  To install you just have to run: make install (as root)  
>  The per-requists are:
>
>
>
> * having python2.7 installed
> * Since nmctl must be run as root, I strongly recommend you to run it via [doas](http://man.openbsd.org/doas.conf.5).
>
>

* 1.2. The config file

>
>
> First you have to create a config and store it in /etc/nmctl.conf.   
>  This file must respect few rules:  
>  Each block must starts with a line having the following format: '''\<-name-\>:\<-interface-\>'''  
>  Each following lines must start by at least one space. Those lines have more or less the same format as for hostname.if.  
>  You have to create a block with the name "open". This will be used to establish a connection to the Open Wifi around you (in restaurant for example)  
>  The order of those elements is important. In case you use the -restart option, nmctl will try each of those network configs one after one until it can ping [www.google.com](http://www.google.com). (if you wan to ping something else, you can change it in the python script if you want).  
>  You can use external commands. Just preced them with the "!".  
>  You have macors. Macros allow you to perform some actions. The 2 currently implemented are '''\<-nwid-\>''' and '''\<-random mac-\>'''.  
>  You can use keywords. Currently the only one implemented is "dhcp"  
>  Basically you can put all commands that nmctl will apply to the interface to which those commands are referring to. So, you will always have "ifconfig \<-interface-\> \<-command you type in the config file-\>".   
>  Check the manpage of ifconfig to see how flexible command is.  
>  You have currently 2 macros:
>
>
>
> * \<-nwid-\> which refers to the "nwid \<-nwid name-\>" when you select an Open Wifi with the -open option of nmctl.
> * \<-random mac-\> is a macro generating a random mac address. This is useful test a dhcp server for example.
>
>
>
> The keyword "dhcp" will trigger a command like "dhclient \<-interface-\>".
>
>

* 1.3. Config file sample.

>
>
> Let me show you one nmctl.conf example. It speaks by itself.
>
>

```

&#35; the name open is required for Open wifi.
&#35; this is the interface that nmctl will take to establish a connection
&#35; We must put the macro <nwid>. This is where nmctl will put the nwid command
&#35; and the selected openwifi selected by the parameter --open

open:iwn0
 !route flush
 <nwid> -wpa
 dhcp

cable:em0
 !route flush
 dhcp

lgg4:iwn0
 !route flush
 nwid LGG4s_8114 wpakey aanotherpassword
 dhcp

home:iwn0
 !route flush
 nwid Linksys19594 wpakey apassword
 dhcp

college:iwn0
 !route flush
 nwid john wpakey haahaaaguessme
 dhcp

cable_fixip:em0
 !route flush
 inet 192.168.3.3 netmask 255.255.255.0
 !route add -host default 192.168.3.1

&#35; with this network interface I'm using the macro <random mac>
&#35; which will do what you guess it will do :-)
cable_random:em0
 !route flush
 lladdr <random mac>
 dhcp

```

>
>
> In this config we have several cable's networks associated with my interface "em0" and several wifi networks associated with my wireless interface "iwn0".  
>  You see that you can switch from dhcp, to fixed IP and even you can play with the random mac address macro.  
>  Thanks to the network called "open", you can connect to any open wifi system. To do that, just type ''' nmctl --open \<-name of the open wifi-\>'''  
>  So, now, with just one command you can switch from one network configuration to an another one.   
>  That's become cool :-).
>
>

* 2. Integration with openbox

>
>
> Thanks to the dynamic menu feature of oenbox[sic], you can have your different pre-defined networks under one click of your mouse.  
>  For that, you just have to add, at the most appropriate place for you, the following code in your ./config/openbox/menu.xml
>
>

```
<menu id="network-menu" label="Network">
  <menu id="wifi-list" label="Wifi configured"  execute="doas /usr/local/bin/nmctl --list" />
  <menu id="wifi-scan" label="Wifi scan"  execute="doas /usr/local/bin/nmctl --scan" />
  <separator />

```

>
>
> In this case, you see the different networks as defined in the config file just above.
>
>

* 3. Automatically identify your available connection and connect to it in one go

>
>
> But the most interesting part, is coming from a loop through all of your defined networks.   
>  This loop is reachable via the -restart option.  
>  Basically the idea is to loop from the first network config to the last and test a ping for each of them. Once the ping works, we break the loop and keep this setting.  
>  Thus where ever you are, you just have to initiate a nmctl -restart and you will be connected to the network you have defined for this place. There is one small exception, the open-wifis. We do not include them in this loop exercise.  
>  Thus the way you define your config file is important.   
>  Since the network called "open" is dedicated to "open wifi", it will not be part of this scan exercise. I propose you keep it at the first place.  
>  Then, in my case, if my mobile, called lgg4, is open and visible by my laptop, I will connect it immediately.   
>  Second, I check if my "home wifi" is visible.   
>  Third, if I have a cable connected on my laptop, I'm using this connection and do a dhcp command.   
>  Then, I check to see if my laptop is not viewing the "college" wifi.   
>  ? and so on until a ping command works.  
>  If you do not have a cable in your laptop and if none of your pre-defined wifi connections are visible, the scan will stop.
>
>

* 3.1 examples

>
>
> No cable connected, no pre-defined wifi around me:
>
>

```
t420:~$ time doas nmctl -r
nwids around you:  bbox2-d954
    0m02.97s real     0m00.08s user     0m00.11s system
t420:~$
t420:~$

```

>
>
> I'm at home and my wifi router is running:
>
>

```
t420:~$ time doas nmctl -r
nwids around you:  Linksys19594 bbox2-d954
ifconfig em0 down: 0
default              fw                   done
fw                   00:22:4d:ac:30:fd    done
nas                  link#2               done
route flush: 0
ifconfig iwn0 nwid Linksys19594  ...: 0
iwn0: no link ........... sleeping
dhclient iwn0: 0
Done.
PING www.google.com (216.58.212.164): 56 data bytes
64 bytes from 216.58.212.164: icmp_seq=0 ttl=52 time=12.758 ms

--- www.google.com ping statistics ---
1 packets transmitted, 1 packets received, 0.0% packet loss
round-trip min/avg/max/std-dev = 12.758/12.758/12.758/0.000 ms
ping -c1 -w2 www.google.com: 0
    0m22.49s real     0m00.08s user     0m00.11s system
t420:~$

```

>
>
> I'm at home but tethering is active on my mobile:
>
>

```
t420:~$
t420:~$ time doas nmctl -r
nwids around you:  Linksys19594 bbox2-d954 LGG4s_8114
ifconfig em0 down: 0
default              fw                   done
fw                   00:22:4d:ac:30:fd    done
nas                  link#2               done
route flush: 0
ifconfig iwn0 nwid LGG4s_8114  ...: 0
iwn0: DHCPDISCOVER - interval 1
iwn0: DHCPDISCOVER - interval 2
iwn0: DHCPOFFER from 192.168.43.1 (a0:91:69:be:10:49)
iwn0: DHCPREQUEST to 255.255.255.255
iwn0: DHCPACK from 192.168.43.1 (a0:91:69:be:10:49)
iwn0: bound to 192.168.43.214 -- renewal in 1800 seconds
dhclient iwn0: 0
Done.
ping: Warning: www.google.com has multiple addresses; using 173.194.69.99
PING www.google.com (173.194.69.99): 56 data bytes
64 bytes from 173.194.69.99: icmp_seq=0 ttl=43 time=42.863 ms

--- www.google.com ping statistics ---
1 packets transmitted, 1 packets received, 0.0% packet loss
round-trip min/avg/max/std-dev = 42.863/42.863/42.863/0.000 ms
ping -c1 -w2 www.google.com: 0
    0m13.78s real     0m00.08s user     0m00.13s system
t420:~$

```

>
>
> Same situation, but I cut the tethering just after the scan. Thus the dhcp command will not succeed.   
>  We see that, after timeouts, nmctl see that the ping is failing (return code 1), thus he pass to the next possible pre-defined network.
>
>

```
t420:~$ time doas nmctl -r
nwids around you:  Linksys19594 bbox2-d954 LGG4s_8114
ifconfig em0 down: 0
default              192.168.43.1         done
192.168.43.1         a0:91:69:be:10:49    done
route flush: 0
ifconfig iwn0 nwid LGG4s_8114  ...: 0
iwn0: no link ........... sleeping
dhclient iwn0: 0
Done.
ping: no address associated with name
ping -c1 -w2 www.google.com: 1
ifconfig em0 down: 0
192.168.43.1         link#2               done
route flush: 0
ifconfig iwn0 nwid Linksys19594  ...: 0
iwn0: DHCPREQUEST to 255.255.255.255
iwn0: DHCPACK from 192.168.3.1 (00:22:4d:ac:30:fd)
iwn0: bound to 192.168.3.16 -- renewal in 302400 seconds
dhclient iwn0: 0
Done.
PING www.google.com (216.58.212.164): 56 data bytes
64 bytes from 216.58.212.164: icmp_seq=0 ttl=52 time=12.654 ms

--- www.google.com ping statistics ---
1 packets transmitted, 1 packets received, 0.0% packet loss
round-trip min/avg/max/std-dev = 12.654/12.654/12.654/0.000 ms
ping -c1 -w2 www.google.com: 0
    3m34.85s real     0m00.17s user     0m00.20s system
t420:~$

```

---

### [OpenVPN Setup Guide for FreeBSD](https://www.c0ffee.net/blog/openvpn-guide) ###

* OpenVPN Setup Guide
  * Browse securely from anywhere using a personal VPN with OpenVPN, LDAP, FreeBSD, and PF.

>
>
> A VPN allows you to securely extend a private network over the internet via tunneling protocols and traffic encryption. For most people, a VPN offers two primary features: (1) the ability to access services on your local network over the internet, and (2) secure internet connectivity over an untrusted network. In this guide, I'll describe how to set up a personal VPN using OpenVPN on FreeBSD. The configuration can use both SSL certificates and LDAP credentials for authentication. We'll also be using the PF firewall to NAT traffic from our VPN out to the internet.  
>  One important note about running your own VPN: since you are most likely hosting your server using a VPS or hosting provider, with a public IP address allocated specifically to you, your VPN will not give you any extra anonymity on the internet. If anything, you'll be making yourself more of a target, since all your activity can be trivially traced back to your server's IP address. So while your VPN will protect you from a snooping hacker on the free WiFi at Starbucks, it won't protect you from a federal investigation.  
>  This guide assumes you are running FreeBSD with the PF firewall. If you're using a different Unix flavor, I'll probably get you most of the way therebut you'll be on your own when configuring your firewall and networking.  
>  Finally, I've used example.com and a non-routable public IP address for all the examples in this guide. You'll need to replace them with your own domain name and public IP address.
>
>

---

Beastie Bits
----------

* [BSDCan 2017 videos](https://www.youtube.com/channel/UCuQhwHMJ0yK2zlfyRr1XZ_Q/feed)
* [Getting started with OpenBSD device driver development PDF](https://www.openbsd.org/papers/eurobsdcon2017-device-drivers.pdf)
* [AWS CloudWatch Logs agent for FreeBSD](https://macfoo.wordpress.com/2017/10/27/aws-cloudwatch-logs-agent-for-freebsd/)
* [FreeBSD Foundation November 2017 Development Projects Update](https://www.freebsdfoundation.org/blog/november-2017-development-projects-update/)
* [Schedule for the BSD Devroom at FOSDEM 2018](https://fosdem.org/2018/schedule/track/bsd/) \*\*\*

Feedback/Questions
----------

* Matt - [The show and Cantrill](http://dpaste.com/35VNXR5#wrap)
* Paulo - [FreeBSD Question](http://dpaste.com/17E9Z2W#wrap)
* Steven - [Virtualization under FreeBSD](http://dpaste.com/1N6F0TC#wrap) \*\*\*