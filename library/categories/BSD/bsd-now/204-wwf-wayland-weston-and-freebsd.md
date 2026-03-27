+++
title = "204: WWF - Wayland, Weston, and FreeBSD"
description = "In this episode, we clear up the myth about scrub of death, look at Wayland and Weston on FreeBSD, Intel QuickAssist is here, and we check out OpenSMTP on OpenBSD.This episode was brought to you by[![iXsystems - Enterprise Servers and Storage for Open Source](/images/1."
date = "2017-07-26T12:00:00Z"
url = "https://www.bsdnow.tv/204"
author = "feedback@bsdnow.tv (JT Pennington)"
text = ""
lastupdated = "2026-03-26T14:37:50.871190968Z"
seen = false
+++

In this episode, we clear up the myth about scrub of death, look at Wayland and Weston on FreeBSD, Intel QuickAssist is here, and we check out OpenSMTP on OpenBSD.

This episode was brought to you by
----------

[![iXsystems - Enterprise Servers and Storage for Open Source](/images/1.png)](http://www.ixsystems.com/bsdnow)[![DigitalOcean - Simple Cloud Hosting, Built for Developers](/images/2.png)](http://www.digitalocean.com/)[![Tarsnap - Online Backups for the Truly Paranoid](/images/3.png)](http://www.tarsnap.com/bsdnow)

---

Headlines
----------

### Matt Ahrens answers questions about the “Scrub of Death” ###

* In working on the breakdown of that ZFS article last week, Matt Ahrens contacted me and provided some answers he has given to questions in the past, allowing me to answer them using HIS exact words.
* “ZFS has an operation, called SCRUB, that is used to check all data in the pool and recover any data that is incorrect. However, if a bug which make errors on the pool persist (for example, a system with bad non-ecc RAM) then SCRUB can cause damage to a pool instead of recover it. I heard it called the “SCRUB of death” somewhere. Therefore, as far as I understand, using SCRUB without ECC memory is dangerous.” \> I don't believe that is accurate. What is the proposed mechanism by which scrub can corrupt a lot of data, with non-ECC memory? \> ZFS repairs bad data by writing known good data to the bad location on disk. The checksum of the data has to verify correctly for it to be considered "good". An undetected memory error could change the in-memory checksum or data, causing ZFS to incorrectly think that the data on disk doesn’t match the checksum. In that case, ZFS would attempt to repair the data by first re-reading the same offset on disk, and then reading from any other available copies of the data (e.g. mirrors, ditto blocks, or RAIDZ reconstruction). If any of these attempts results in data that matches the checksum, then the data will be written on top of the (supposed) bad data. If the data was actually good, then overwriting it with the same good data doesn’t hurt anything. \> Let's look at what will happen with 3 types of errors with non-ECC memory: \> 1. Rare, random errors (e.g. particle strikes - say, less than one error per GB per second). If ZFS finds data that matches the checksum, then we know that we have the correct data (at least at that point in time, with probability 1-1/2<sup>256).</sup> If there are a lot of memory errors happening at a high rate, or if the in-memory checksum was corrupt, then ZFS won’t be able to find a good copy of the data , so it won’t do a repair write. It’s possible that the correctly-checksummed data is later corrupted in memory, before the repair write. However, the window of vulnerability is very very small - on the order of milliseconds between when the checksum is verified, and when the write to disk completes. It is implausible that this tiny window of memory vulnerability would be hit repeatedly. \> 2. Memory that pretty much never does the right thing. (e.g. huge rate of particle strikes, all memory always reads 0, etc). In this case, critical parts of kernel memory (e.g. instructions) will be immediately corrupted, causing the system to panic and not be able to boot again. \> 3. One or a few memory locations have "stuck bits", which always read 0 (or always read 1). This is the scenario discussed in the message which (I believe) originally started the "Scrub of Death" myth: [https://forums.freenas.org/index.php?threads/ecc-vs-non-ecc-ram-and-zfs.15449/](https://forums.freenas.org/index.php?threads/ecc-vs-non-ecc-ram-and-zfs.15449/) This assumes that we read in some data from disk to a memory location with a stuck bit, "correct" that same bad memory location by overwriting the memory with the correct data, and then we write the bad memory location to disk. However, ZFS doesn't do that. (It seems the author thinks that ZFS uses parity, which it only does when using RAID-Z. Even with RAID-Z, we also verify the checksum, and we don't overwrite the bad memory location.) \> Here's what ZFS will actually do in this scenario: If ZFS reads data from disk into a memory location with a stuck bit, it will detect a checksum mismatch and try to find a good copy of the data to repair the "bad" disk. ZFS will allocate a new, different memory location to read a 2nd copy of the data, e.g. from the other side of a mirror (this happens near the end of dsl\_scan\_scrub\_cb()). If the new memory location also has a stuck bit, then its checksum will also fail, so we won't use it to repair the "bad" disk. If the checksum of the 2nd copy of the data is correct, then we will write it to the "bad" disk. This write is unnecessary, because the "bad" disk is not really bad, but it is overwriting the good data with the same good data. \> I believe that this misunderstanding stems from the idea that ZFS fixes bad data by overwriting it in place with good data. In reality, ZFS overwrites the location on disk, using a different memory location for each read from disk. The "Scrub of Death" myth assumes that ZFS overwrites the location *in memory*, which it doesn't do. \> In summary, there's no plausible scenario where ZFS would amplify a small number of memory errors, causing a "scrub of death". Additionally, compared to other filesystems, ZFS checksums provide some additional protection against bad memory.
* “Is it true that ZFS verifies the checksum of every block on every read from disk?” \> Yes
* “And if that block is incorrect, that ZFS will repair it?” \> Yes
* “If yes, is it possible set options or flag for change that behavior? For example, I would like for ZFS to verify checksums during any read, but not change anything and only report about issues if it appears. Is it possible?” \> There isn't any built-in flag for doing that. It wouldn't be hard to add one though.
* If you just wanted to verify data, without attempting to correct it, you could read or scan the data with the pool was imported read-only
* “If using a mirror, when a file is read, is it fully read and verified from both sides of the mirror?” \> No, for performance purposes, each block is read from only one side of the mirror (assuming there is no checksum error).
* “What is the difference between a scrub and copying every file to /dev/null?” \> That won't check all copies of the file (e.g. it won't check both sides of the mirror). \*\*\*

### [Wayland, and Weston, and FreeBSD - Oh My!](https://euroquis.nl/bobulate/?p=1617) ###

>
>
> KDE’s CI system for FreeBSD (that is, what upstream runs to continuously test KDE git code on the FreeBSD platform) is missing some bits and failing some tests because of Wayland. Or rather, because FreeBSD now has Wayland, but not Qt5-Wayland, and no Weston either (the reference implementation of a Wayland compositor).  
>  Today I went hunting for the bits and pieces needed to make that happen. Fortunately, all the heavy lifting has already been done: there is a Weston port prepared and there was a Qt5-Wayland port well-hidden in the Area51 plasma5/ branch.  
>  I have taken the liberty of pulling them into the Area51 repository as branch qtwayland. That way we can nudge Weston forward, and/or push Qt5-Wayland in separately. Nicest from a testing perspective is probably doing both at the same time.  
>  I picked a random “Hello World” Wayland tutorial and also built a minimal Qt program (using QMessageBox::question, my favorite function to hate right now, because of its i18n characteristics). Then, setting XDG\_RUNTIME\_DIR to /tmp/xdg, I could start Weston (as an X11 client), wayland-hello (as a Wayland client, displaying in Weston) and qt-hello (as either an X11 client, or as a Wayland client).  
>  So this gives users of Area51 (while shuffling branches, granted) a modern desktop and modern display capabilities. Oh my!  
>  It will take a few days for this to trickle up and/or down so that the CI can benefit and we can make sure that KWin’s tests all work on FreeBSD, but it’s another good step towards tight CI and another small step towards KDE Plasma 5 on the desktop on FreeBSD.
>
>
> ---
>

### [pkgsrcCon 2017 report](https://blog.netbsd.org/tnf/entry/pkgsrccon_2017_report) ###

>
>
> This years pkgsrcCon returned to London once again. It was last held in London back in 2014. The 2014 con was the first pkgsrcCon I attended, I had been working on Darwin/PowerPC fixes for some months and presented on the progress I'd made with a 12" G4 PowerBook. I took away a G4 Mac Mini that day to help spare the PowerBook for use and dedicate a machine for build and testing. The offer of PowerPC hardware donations was repeated at this years con, thanks to jperkin@ who showed up with a backpack full of Mac Minis (more on that later).  
>  Since 2014 we have held cons in Berlin (2015) & Krakow (2016). In Krakow we had talks about a wide range of projects over 2 days, from Haiku Ports to Common Lisp to midipix (building native PE binaries for Windows) and back to the BSDs. I was very pleased to continue the theme of a diverse program this year.  
>  Aside from pkgsrc and NetBSD, we had talks about FreeBSD, OpenBSD, Slackware Linux, and Plan 9. Things began with a pub gathering on the Friday for the pre-con social, we hung out and chatted till almost midnight on a wide range of topics, such as supporting a system using NFS on MS-DOS, the origins of pdksh, corporate IT, culture and many other topics.  
>  On parting I was asked about the starting time on Saturday as there was some conflicting information. I learnt that the registration email had stated a later start than I had scheduled for & advertised on the website, by 30 minutes. Lesson learnt: register for your own event! Not a problem, I still needed to setup a webpage for the live video stream, I could do both when I got back. With some trimming here and there I had a new schedule, I posted that to the pkgsrcCon website and moved to trying to setup a basic web page which contained a snippet of javascript to play a live video stream from Scale Engine. 2+ hours later, it was pointed out that the XSS protection headers on pkgsrc.org breaks the functionality. Thanks to jmcneill@ for debugging and providing a working page.  
>  Saturday started off with Giovanni Bechis speaking about pledge in OpenBSD and adding support to various packages in their ports tree, alnsn@ then spoke about installing packages from a repo hosted on the Tor network.  
>  After a quick coffee break we were back to hear Charles Forsyth speak about how Plan 9 and Inferno dealt with portability, building software and the problem which are avoided by the environment there. This was followed by a very energetic rant by David Spencer from the Slackbuilds project on packaging 3rd party software. Slackbuilds is a packaging system for Slackware Linux, which was inspired by FreeBSD ports.  
>  For the first slot after lunch, agc@ gave a talk on the early history of pkgsrc followed by Thomas Merkel on using vagrant to test pkgsrc changes with ease, locally, using vagrant. khorben@ covered his work on adding security to pkgsrc and bsiegert@ covered the benefits of performing our bulk builds in the cloud and the challenges we currently face.  
>  My talk was about some topics and ideas which had inspired me or caught my attention, and how it could maybe apply to my work.The title of the talk was taken from the name of Andrew Weatherall's Saint Etienne remix, possibly referring to two different styles of track (dub & vocal) merged into one or something else. I meant it in terms of applicability of thoughts and ideas. After me, agc@ gave a second talk on the evolution of the Netflix Open Connect appliance which runs FreeBSD and Vsevolod Stakhov wrapped up the day with a talk about the technical implementation details of the successor to pkg\_tools in FreeBSD, called pkg, and how it could be of benefit for pkgsrc.  
>  For day 2 we gathered for a hack day at the London Hack Space.  
>  I had burn't some some CD of the most recent macppc builds of NetBSD 8.0\_BETA and -current to install and upgrade Mac Minis. I setup the donated G4 minis for everyone in a dual-boot configuration and moved on to taking apart my MacBook Air to inspect the wifi adapter as I wanted to replace it with something which works on FreeBSD. It was not clear from the ifixit teardown photos of cards size, it seemed like a normal mini-PCIe card but it turned out to be far smaller. Thomas had also had the same card in his and we are not alone. Thomas has started putting together a driver for the Broadcom card, the project is still in its early days and lacks support for encrypted networks but hopefully it will appear on review.freebsd.org in the future.  
>  weidi@ worked on fixing SunOS bugs in various packages and later in the night we setup a NetBSD/macppc bulk build environment together on his Mac Mini.  
>  Thomas setup an OpenGrock instance to index the source code of all the software available for packaging in pkgsrc. This helps make the evaluation of changes easier and the scope of impact a little quicker without having to run through a potentially lengthy bulk build with a change in mind to realise the impact. bsiegert@ cleared his ticket and email backlog for pkgsrc and alnsn@ got NetBSD/evbmips64-eb booting on his EdgeRouter Lite.  
>  On Monday we reconvened at the Hack Space again and worked some more. I started putting together the talks page with the details from Saturday and the the slides which I had received, in preparation for the videos which would come later in the week. By 3pm pkgsrcCon was over. I was pretty exhausted but really pleased to have had a few days of techie fun.  
>  Many thanks to The NetBSD Foundation for purchasing a camera to use for streaming the event and a speedy response all round by the board. The Open Source Specialist Group at BCS, The Chartered Institute for IT and the London Hack Space for hosting us. Scale Engine for providing streaming facility. weidi@ for hosting the recorded videos. Allan Jude for pointers, Jared McNeill for debugging, NYCBUG and Patrick McEvoy for tips on streaming, the attendees and speakers. This year we had speakers from USA, Italy, Germany and London E2. Looking forward to pkgsrcCon 2018!  
>  The videos and slides are available [here](http://www.pkgsrc.org/pkgsrcCon/2017/talks.html) and the [Internet Archive](http://archive.org/details/pkgsrcCon-2017).
>
>
> ---
>

News Roundup
----------

### [QuickAssist Driver for FreeBSD is here and pfSense Support Coming](https://www.servethehome.com/quickassist-driver-freebsd-pfsupport-coming/) ###

>
>
> This week we have something that STH readers will be excited about. Before I started writing for STH, I was a reader and had been longing for QuickAssist support ever since STH’s first Rangeley article over three and a half years ago. It was clear from the get-go that Rangeley was going to be the preeminent firewall appliance platform of its day. The scope of products that were impacted by the Intel Atom C2000 series bug showed us it was indeed. For my personal firewalls, I use pfSense on that Rangeley platform so I have been waiting to use QuickAssist with my hardware for almost an entire product generation.
>
>
>
> * New Hardware and QuickAssist Incoming to pfSense (Finally) pfSense (and a few other firewalls) are based on FreeBSD. FreeBSD tends to lag driver support behind mainstream Linux but it is popular for embedded security appliances. While STH is the only site to have done QuickAssist benchmarks for OpenSSL and IPSec VPNs pre-Skylake, we expect more platforms to use it now that the new Intel Xeon Scalable Processor Family is out. With the Xeon Scalable platforms, the “Lewisburg” PCH has QuickAssist options of up to 100Gbps, or 2.5x faster than the previous generation add-in cards we tested (40Gbps.) We now have more and better hardware for QAT, but we were still devoid of a viable FreeBSD QAT driver from Intel. That has changed. Our Intel Xeon Scalable Processor Family (Skylake-SP) Launch Coverage Central has been the focus of the STH team’s attention this week. There was another important update from Intel that got buried, a publicly available Intel QuickAssist driver for FreeBSD. You can find the driver on 01.org here dated July 12, 2017. Drivers are great, but we still need support to be enabled in the OS and at the application layer. Patrick forwarded me this tweet from Jim Thompson (lead at Netgate the company behind pfSense): The Netgate team has been a key company pushing QuickAssist appliances in the market, usually based on Linux. To see that QAT is coming to FreeBSD and that they were working to integrate into “pfSense soon” is more than welcome. For STH readers, get ready. It appears to be actually and finally happening. QuickAssist on FreeBSD and pfSense \*\*\*
>
>

### [OpenBSD on the Huawei MateBook X](https://jcs.org/2017/07/14/matebook) ###

>
>
> The Huawei MateBook X is a high-quality 13" ultra-thin laptop with a fanless Core i5 processor. It is obviously biting the design of the Apple 12" MacBook, but it does have some notable improvements such as a slightly larger screen, a more usable keyboard with adequate key travel, and 2 USB-C ports.  
>  It also uses more standard PC components than the MacBook, such as a PS/2-connected keyboard, removable m.2 WiFi card, etc., so its OpenBSD compatibility is quite good.  
>  In contrast to the Xiaomi Mi Air, the MateBook is actually sold (2) in the US and comes with a full warranty and much higher build quality (though at twice the price). It is offered in the US in a "space gray" color for the Core i5 model and a gold color for the Core i7.  
>  The fanless Core i5 processor feels snappy and doesn't get warm during normal usage on OpenBSD. Doing a make -j4 build at full CPU speed does cause the laptop to get warm, though the palmrest maintains a usable temperature.  
>  The chassis is all aluminum and has excellent rigidity in the keyboard area. The 13.0" 2160x1440 glossy IPS "Gorilla glass" screen has a very small bezel and its hinge is properly weighted to allow opening the lid with one hand. There is no wobble in the screen when open, even when jostling the desk that the laptop sits on. It has a reported brightness of 350 nits.  
>  I did not experience any of the UEFI boot variable problems that I did with the Xiaomi, and the MateBook booted quickly into OpenBSD after re-initializing the GPT table during installation.
>
>
> ---
>

### [OpenSMTPD under OpenBSD with SSL/VirtualUsers/Dovecot](https://blog.cagedmonster.net/opensmtpd-under-openbsd-with-ssl-virtualusers-dovecot/) ###

* During the 2013 AsiaBSDCon, the team of OpenBSD presented its mail solution named OpenSMTPD.
* Developed by the OpenBSD team, we find the so much appreciated philosophy of its developers : security, simplicity / clarity and advanced features.
* Basic configuration : OpenSMTPD is installed by default, we can immediately start with a simple configuration. \> We listen on our interfaces, we specify the path of our aliases file so we can manage redirections. \> Mails will be delivered for the domain cagedmonster.net to mbox (the local users mailbox), same for the aliases. \> Finally, we accept to relay local mails exclusively. \> We can now enable smtpd at system startup and start the daemon.
* Advanced configuration including TLS :
  * You can use SSL with : A self-signed certificate (which will not be trusted) or a certificate generated by a trusted authority. LetsEncrypt uses Certbot to generated your certificate. You can check this page for further informations. Let's focus on the first.
  * Generation of the certificate :
  * We fix the permissions :
  * We edit the config file : \> We have a mail server with SSL, it's time to configure our IMAP server, Dovecot, and manage the creation of virtual users.

* Dovecot setup, and creation of Virtual Users : We will use the package system of OpenBSD, so please check the configuration of your /etc/pkg.conf file.
  * Enable the service at system startup :
  * Setup the Virtual Users structure :
  * Adding the passwd table for smtpd :
  * Modification of the OpenSMTPD configuration :
  * We declare the files used for our Virtual Accounts, we include SSL, and we configure mails delivery via the Dovecot lmtp socket.
  * We'll create our user [lina@cagedmonster.net](mailto:lina@cagedmonster.net) and set its password.
  * Configure SSL
  * Configure dovecot.conf
  * Configure mail.con
  * Configure login.conf : Make sure that the value of openfiles-cur in /etc/login.conf is equal or superior of 1000 !
  * Starting Dovecot \*\*\*

### [OpenSMTPD and Dovecot under OpenBSD with MySQL support and SPAMD](https://blog.cagedmonster.net/opensmtpd-and-dovecot-under-openbsd-with-mysql-support-and-spamd/) ###

>
>
> This article is the continuation of my previous tutorial OpenSMTPD under OpenBSD with SSL/VirtualUsers/Dovecot. We'll use the same configuration and add some features so we can :  
>  Use our domains, aliases, virtual users with a MySQL database (MariaDB under OpenBSD).  
>  Deploy SPAMD with OpenSMTPD for a strong antispam solution.
>
>
>
> * Setup of the MySQL support for OpenSMTPD & Dovecot
> * We create our SQL database named « smtpd »
> * We create our SQL user « opensmtpd » we give him the privileges on our SQL database and we set its password
> * We create the structure of our SQL database
> * We generate our password with Blowfish (remember it's OpenBSD !) for our users
> * We create our tables and we include our datas
> * We push everything to our database
> * Time to configure OpenSMTPD
> * We create our mysql.conf file and configure it
> * Configuration of Dovecot.conf
> * Configuration of auth-sql.conf.ext
> * Configuration of dovecot-sql.conf.ext
> * Restart our services OpenSMTPD & SPAMD : SPAMD is a service simulating a fake SMTP server and relying on strict compliance with RFC to determine whether the server delivering a mail is a spammer or not.
> * Configuration of SPAMD :
> * Enable SPAMD & SPAMLOGD at system startup :
> * Configuration of SPAMD flags
> * Configuration of PacketFilter
> * Configuration of SPAMD
> * Start SPAMD & SPAMLOGD \*\*\* ###[Running a TOR relay on FreeBSD](https://networkingbsdblog.wordpress.com/2017/07/14/freebsd-tor-relay-using-priveledge-seperation/)
> * There are 2 main steps to getting a TOR relay working on FreeBSD:
>   * Installing and configuring Tor
>   * Using an edge router to do port translation
>   * In my case I wanted TOR to run it’s services on ports 80 and 443 but any port under 1024 requires root access in UNIX systems. +So I used port mapping on my router to map the ports. +Begin by installing TOR and ARM from: ` /usr/ports/security/tor/ /usr/ports/security/arm/ `
>   
>   
> * Arm is the Anonymizing Relay Monitor: [https://www.torproject.org/projects/arm.html.en](https://www.torproject.org/projects/arm.html.en)
> * It provides useful monitoring graph and can be used to configure the torrc file.
> * Next step edit the torrc file (see Blog article for the edit)
> * It is handy to add the following lines to /etc/services so you can more easily modify your pf configuration. ` torproxy 9050/tcp #torsocks torOR 9090/tcp #torOR torDIR 9099/tcp #torDIR `
> * To allow TOR services my pf.conf has the following lines: ` # interfaces lan_if=”re0″ wifi_if=”wlan0″ interfaces=”{wlan0,re0}” tcp_services = “{ ssh torproxy torOR torDIR }” # options set block-policy drop set loginterface $lan_if # pass on lo set skip on lo scrub in on $lan_if all fragment reassemble # NAT nat on $lan_if from $wifi_if:network to !($lan_if) -> ($lan_if) block all antispoof for $interfaces #In NAT pass in log on $wifi_if inet pass out all keep state #ICMP pass out log inet proto icmp from any to any keep state pass in log quick inet proto icmp from any to any keep state #SSH pass in inet proto tcp to $lan_if port ssh pass in inet proto tcp to $wifi_if port ssh #TCP Services on Server pass in inet proto tcp to $interfaces port $tcp_services keep state `
> * The finally part is mapping the ports as follows: ` TOR directory port: LANIP:9099 —> WANIP:80 TOR router port: LANIP:9090 —-> WANIP:443 `
> * Now enable TOR: `$ sudo echo “tor_enable=YES” >> /etc/rc.conf`
> * Start TOR: `$ sudo service tor start` \*\*\*
>
>

Beastie Bits
----------

[OpenBSD as a “Desktop” (Laptop)](http://unixseclab.com/index.php/2017/06/12/openbsd-as-a-desktop-laptop/)  
[Sascha Wildner has updated ACPICA in DragonFly to Intel’s version 20170629](http://lists.dragonflybsd.org/pipermail/commits/2017-July/625997.html)  
[Dport, Rust, and updates for DragonFlyBSD](https://www.dragonflydigest.com/2017/07/18/19991.html)  
[OPNsense 17.7 RC1 released](https://opnsense.org/opnsense-17-7-rc1/)  
[Unix’s mysterious && and ||](http://www.networkworld.com/article/3205148/linux/unix-s-mysterious-andand-and.html#tk.rss_unixasasecondlanguage)  
[The Commute Deck : A Homebrew Unix terminal for tight places](http://boingboing.net/2017/06/16/cyberspace-is-everting.html)  
[FreeBSD 11.1-RC3 now available](https://lists.freebsd.org/pipermail/freebsd-stable/2017-July/087407.html)  
[Installing DragonFlyBSD with ORCA when you’re totally blind](http://lists.dragonflybsd.org/pipermail/users/2017-July/313528.html)  
[Who says FreeBSD can’t look good](http://imgur.com/gallery/dc1pu)  
[Pratik Vyas adds the ability to do paused VM migrations for VMM](http://undeadly.org/cgi?action=article&sid=20170716160129)

---

Feedback/Questions
----------

[Hrvoje - OpenBSD MP Networking](http://dpaste.com/0EXV173#wrap)  
[Goran - debuggers](http://dpaste.com/1N853NG#wrap)  
[Abhinav - man-k](http://dpaste.com/1JXQY5E#wrap)  
[Liam - university setup](http://dpaste.com/01ERMEQ#wrap)

---