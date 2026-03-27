+++
title = "Episode 251: Crypto HAMMER | BSD Now 251"
description = 'DragonflyBSD’s hammer1 encrypted master/slave setup, second part of our BSDCan recap, NomadBSD 1.1-RC1 available, OpenBSD adds an LDAP client to base, FreeBSD gets pNFS support, Intel FPU Speculation Vulnerability confirmed, and what some Unix command names mean.\Headlines   \'
date = "2018-06-21T09:00:00Z"
url = "https://www.bsdnow.tv/251"
author = "feedback@bsdnow.tv (JT Pennington)"
text = ""
lastupdated = "2026-03-26T14:37:50.743008256Z"
seen = false
+++

DragonflyBSD’s hammer1 encrypted master/slave setup, second part of our BSDCan recap, NomadBSD 1.1-RC1 available, OpenBSD adds an LDAP client to base, FreeBSD gets pNFS support, Intel FPU Speculation Vulnerability confirmed, and what some Unix command names mean.

\##Headlines  
 \###[DragonflyBSD: Towards a HAMMER1 master/slave encrypted setup with LUKS](https://www.reddit.com/r/dragonflybsd/comments/8riwtx/towards_a_hammer1_masterslave_encrypted_setup/)

>
>
> I just wanted to share my experience with setting up DragonFly master/slave HAMMER1 PFS’s on top of LUKS  
>  So after a long time using an Synology for my NFS needs, I decided it was time to rethink my setup a little since I had several issues with it :
>
>

* You cannot run NFS on top of encrypted partitions easily
* I suspect I am having some some data corruption (bitrot) on the ext4 filesystem
* the NIC was stcuk to 100 Mbps instead of 1 Gbps even after swapping cables, switches, you name it
* It’s proprietary

>
>
> I have been playing with DragonFly in the past and knew about HAMMER, now I just had the perfect excuse to actually use it in production :) After setting up the OS, creating the LUKS partition and HAMMER FS was easy :
>
>

`kdload dm`  
`cryptsetup luksFormat /dev/serno/<id1>`  
`cryptsetup luksOpen /dev/serno/<id1> fort_knox`  
`newfs_hammer -L hammer1_secure_master /dev/mapper/fort_knox`  
`cryptsetup luksFormat /dev/serno/<id2>`  
`cryptsetup luksOpen /dev/serno/<id2> fort_knox_slave`  
`newfs_hammer -L hammer1_secure_slave /dev/mapper/fort_knox_slave`

* Mount the 2 drives :

`mount /dev/mapper/fort_knox /fort_knox`  
`mount /dev/mapper_fort_know_slave /fort_knox_slave`

>
>
> You can now put your data under /fort\_knox  
>  Now, off to setting up the replication, first get the shared-uuid of /fort\_knox
>
>

`hammer pfs-status /fort_knox`

>
>
> Create a PFS slave “linked” to the master
>
>

`hammer pfs-slave /fort_knox_slave/pfs/slave shared-uuid=f9e7cc0d-eb59-10e3-a5b5-01e6e7cefc12`

>
>
> And then stream your data to the slave PFS !
>
>

`hammer mirror-stream /fort_knox /fort_knox_slave/pfs/slave`

>
>
> After that, setting NFS is fairly trivial even though I had problem with the /etc/exports syntax which is different than Linux
>
>

>
>
> There’s a few things I wish would be better though but nothing too problematic or without workarounds :
>
>

* Cannot unlock LUKS partitions at boot time afaik (Acceptable tradeoff for the added security LUKS gives me vs my old Synology setup) but this force me to run a script to unlock LUKS, mount hammer and start mirror-stream at each boot
* No S1/S3 sleep so I made a script to shutdown the system when there’s no network neighborgs to serve the NFS
* As my system isn’t online 24/7 for energy reasons, I guess will have to run hammer cleanup myself from time to time
* Some uncertainty because hey, it’s kind of exotic but exciting too :)

>
>
> Overall, I am happy, HAMMER1 and PFS are looking really good, DragonFly is a neat Unix and the community is super friendly (Matthew Dillon actually provided me with a kernel patch to fix the broken ACPI on the PC holding this setup, many thanks!), the system is still a “work in progress” but it is already serving my files as I write this post.
>
>

>
>
> Let’s see in 6 months how it goes in the longer run !
>
>

* Helpful resources : [https://www.dragonflybsd.org/docs/how\_to\_implement\_hammer\_pseudo\_file\_system\_\_40\_\_\_pfs\_\_\_41\_\_\_slave\_mirroring\_from\_pfs\_master/](https://www.dragonflybsd.org/docs/how_to_implement_hammer_pseudo_file_system__40___pfs___41___slave_mirroring_from_pfs_master/)

---

\###BSDCan 2018 Recap

* As promised, here is our second part of our BSDCan report, covering the conference proper. The last tutorials/devsummit of that day lead directly into the conference, as people could pick up their registration packs at the Red Lion and have a drink with fellow BSD folks.
* Allan and I were there only briefly, as we wanted to get back to the “Newcomers orientation and mentorship” session lead by Michael W. Lucas. This session is intended for people that are new to BSDCan (maybe their first BSD conference ever?) and may have questions. Michael explained everything from the 6-2-1 rule (hours of sleep, meals per day, and number of showers that attendees should have at a minimum), to the partner and widowers program (lead by his wife Liz), to the sessions that people should not miss (opening, closing, and hallway track). Old-time BSDCan folks were asked to stand up so that people can recognize them and ask them any questions they might have during the conferences. The session was well attended. Afterwards, people went for dinner in groups, a big one lead by Michael Lucas to his favorite Shawarma place, followed by gelato (of course). This allowed newbies to mingle over dinner and ice cream, creating a welcoming atmosphere.
* The next day, after Dan Langille opened the conference, Benno Rice gave the keynote presentation about “The Tragedy of Systemd”.
* Benedict went to the following talks:

>
>
> “Automating Network Infrastructures with Ansible on FreeBSD” in the DevSummit track. A good talk that connected well with his Ansible tutorial and even allowed some discussions among participants.  
>  “All along the dwatch tower”: Devin delivered a well prepared talk. I first thought that the number of slides would not fit into the time slot, but she even managed to give a demo of her work, which was well received. The dwatch tool she wrote should make it easy for people to get started with DTrace without learning too much about the syntax at first. The visualizations were certainly nice to see, combining different tools together in a new way.  
>  ZFS BoF, lead by Allan and Matthew Ahrens  
>  SSH Key Management by Michael W. Lucas. Yet another great talk where I learned a lot. I did not get to the SSH CA chapter in the new SSH Mastery book, so this was a good way to wet my appetite for it and motivated me to look into creating one for the cluster that I’m managing.  
>  The rest of the day was spent at the FreeBSD Foundation table, talking to various folks. Then, Allan and I had an interview with Kirk McKusick for National FreeBSD Day, then we had a core meeting, followed by a core dinner.
>
>

* Day 2:
  >
  >
  > “Flexible Disk Use in OpenZFS”: Matthew Ahrens talking about the feature he is implementing to expand a RAID-Z with a single disk, as well as device removal.  
  >  Allan’s talk about his efforts to implement ZSTD in OpenZFS as another compression algorithm. I liked his overview slides with the numbers comparing the algorithms for their effectiveness and his personal story about the sometimes rocky road to get the feature implemented.  
  >  “zrepl - ZFS replication” by Christian Schwarz, was well prepared and even had a demo to show what his snapshot replication tool can do. We covered it on the show before and people can find it under sysutils/zrepl. Feedback and help is welcome.  
  >  “The Evolution of FreeBSD Governance” by Kirk McKusick was yet another great talk by him covering the early days of FreeBSD until today, detailing some of the progress and challenges the project faced over the years in terms of leadership and governance. This is an ongoing process that everyone in the community should participate in to keep the project healthy and infused with fresh blood.  
  >  Closing session and auction were funny and great as always.  
  >  All in all, yet another amazing BSDCan. Thank you Dan Langille and your organizing team for making it happen! Well done.
  >
  >

---

**Digital Ocean**

\###[NomadBSD 1.1-RC1 Released](http://nomadbsd.org/index.html#rel1.1-rc1)

>
>
> The first – and hopefully final – release candidate of NomadBSD 1.1 is available!
>
>

* Changes
* The base system has been upgraded to FreeBSD 11.2-RC3
* EFI booting has been fixed.
* Support for modern Intel GPUs has been added.
* Support for installing packages has been added.
* Improved setup menu.
* More software packages:
* benchmarks/bonnie++
* DSBDisplaySettings
* DSBExec
* DSBSu
* mail/thunderbird
* net/mosh
* ports-mgmt/octopkg
* print/qpdfview
* security/nmap
* sysutils/ddrescue
* sysutils/fusefs-hfsfuse
* sysutils/fusefs-sshfs
* sysutils/sleuthkit
* www/lynx
* x11-wm/compton
* x11/xev
* x11/xterm
* Many improvements and bugfixes  
   The image and instructions can be found [here](http://nomadbsd.org/download.html).

---

\##News Roundup  
 \###[LDAP client added to -current](https://undeadly.org/cgi?action=article;sid=20180616115514)

```
CVSROOT:    /cvs
Module name:    src
Changes by: reyk@cvs.openbsd.org    2018/06/13 09:45:58

Log message:
    Import ldap(1), a simple ldap search client.
    We have an ldapd(8) server and ypldap in base, so it makes sense to
    have a simple LDAP client without depending on the OpenLDAP package.
    This tool can be used in an ssh(1) AuthorizedKeysCommand script.

    With feedback from many including millert@ schwarze@ gilles@ dlg@ jsing@

    OK deraadt@

    Status:

    Vendor Tag: reyk
    Release Tags:   ldap_20180613

    N src/usr.bin/ldap/Makefile
    N src/usr.bin/ldap/aldap.c
    N src/usr.bin/ldap/aldap.h
    N src/usr.bin/ldap/ber.c
    N src/usr.bin/ldap/ber.h
    N src/usr.bin/ldap/ldap.1
    N src/usr.bin/ldap/ldapclient.c
    N src/usr.bin/ldap/log.c
    N src/usr.bin/ldap/log.h

    No conflicts created by this import

```

---

\###[Intel® FPU Speculation Vulnerability Confirmed](https://undeadly.org/cgi?action=article;sid=20180614064341)

* Earlier this month, Philip Guenther (guenther@) [committed](https://marc.info/?l=openbsd-cvs&m=152818076013158&w=2) (to amd64 -current) a change from lazy to semi-eager FPU switching to mitigate against rumored FPU state leakage in Intel® CPUs.
* Theo de Raadt (deraadt@) discussed this in [his BSDCan 2018 session](https://undeadly.org/cgi?action=article;sid=20180611101817).
* Using information disclosed in Theo’s talk, [Colin Percival](https://twitter.com/cperciva/status/1007010583244230656) developed a proof-of-concept exploit in around 5 hours. This seems to have prompted an early end to an embargo (in which OpenBSD was not involved), and the [official announcement](https://www.intel.com/content/www/us/en/security-center/advisory/intel-sa-00145.html) of the vulnerability.
* [FPU change in FreeBSD](https://svnweb.freebsd.org/base?view=revision&revision=335072)

```
Summary:

System software may utilize the Lazy FP state restore technique to delay the restoring of state until an instruction operating on that state is actually executed by the new process. Systems using Intel® Core-based microprocessors may potentially allow a local process to infer data utilizing Lazy FP state restore from another process through a speculative execution side channel.

Description:

System software may opt to utilize Lazy FP state restore instead of eager save and restore of the state upon a context switch. Lazy restored states are potentially vulnerable to exploits where one process may infer register values of other processes through a speculative execution side channel that infers their value.

    ·    CVSS - 4.3 Medium CVSS:3.0/AV:L/AC:L/PR:N/UI:N/S:C/C:L/I:N/A:N
Affected Products:

Intel® Core-based microprocessors.

Recommendations:

If an XSAVE-enabled feature is disabled, then we recommend either its state component bitmap in the extended control register (XCR0) is set to 0 (e.g. XCR0[bit 2]=0 for AVX, XCR0[bits 7:5]=0 for AVX512) or the corresponding register states of the feature should be cleared prior to being disabled. Also for relevant states (e.g. x87, SSE, AVX, etc.), Intel recommends system software developers utilize Eager FP state restore in lieu of Lazy FP state restore.

Acknowledgements:

Intel would like to thank Julian Stecklina from Amazon Germany, Thomas Prescher from Cyberus Technology GmbH (https://www.cyberus-technology.de/), Zdenek Sojka from SYSGO AG (http://sysgo.com), and Colin Percival for reporting this issue and working with us on coordinated disclosure.

```

---

**iXsystems**  
 iX Ad Spot  
 \###[iX Systems - BSDCan 2018 Recap](https://www.ixsystems.com/blog/bsdcan-2018-recap/)

\###[FreeBSD gets pNFS support](https://svnweb.freebsd.org/base?view=revision&revision=335012)

```
Merge the pNFS server code from projects/pnfs-planb-server into head.

This code merge adds a pNFS service to the NFSv4.1 server. Although it is
a large commit it should not affect behaviour for a non-pNFS NFS server.
Some documentation on how this works can be found at:
Merge the pN http://people.freebsd.org/~rmacklem/pnfs-planb-setup.txt
and will hopefully be turned into a proper document soon.
This is a merge of the kernel code. Userland and man page changes will
come soon, once the dust settles on this merge.
It has passed a "make universe", so I hope it will not cause build problems.
It also adds NFSv4.1 server support for the "current stateid".

Here is a brief overview of the pNFS service:
A pNFS service separates the Read/Write operations from all the other NFSv4.1
Metadata operations. It is hoped that this separation allows a pNFS service
to be configured that exceeds the limits of a single NFS server for either
storage capacity and/or I/O bandwidth.
It is possible to configure mirroring within the data servers (DSs) so that
the data storage file for an MDS file will be mirrored on two or more of
the DSs.
When this is used, failure of a DS will not stop the pNFS service and a
failed DS can be recovered once repaired while the pNFS service continues
to operate.  Although two way mirroring would be the norm, it is possible
to set a mirroring level of up to four or the number of DSs, whichever is
less.
The Metadata server will always be a single point of failure,
just as a single NFS server is.

A Plan B pNFS service consists of a single MetaData Server (MDS) and K
Data Servers (DS), all of which are recent FreeBSD systems.
Clients will mount the MDS as they would a single NFS server.
When files are created, the MDS creates a file tree identical to what a
single NFS server creates, except that all the regular (VREG) files will
be empty. As such, if you look at the exported tree on the MDS directly
on the MDS server (not via an NFS mount), the files will all be of size 0.
Each of these files will also have two extended attributes in the system
attribute name space:
pnfsd.dsfile - This extended attrbute stores the information that
    the MDS needs to find the data storage file(s) on DS(s) for this file.
pnfsd.dsattr - This extended attribute stores the Size, AccessTime, ModifyTime
    and Change attributes for the file, so that the MDS doesn't need to
    acquire the attributes from the DS for every Getattr operation.
For each regular (VREG) file, the MDS creates a data storage file on one
(or more if mirroring is enabled) of the DSs in one of the "dsNN"
subdirectories.  The name of this file is the file handle
of the file on the MDS in hexadecimal so that the name is unique.
The DSs use subdirectories named "ds0" to "dsN" so that no one directory
gets too large. The value of "N" is set via the sysctl vfs.nfsd.dsdirsize
on the MDS, with the default being 20.
For production servers that will store a lot of files, this value should
probably be much larger.
It can be increased when the "nfsd" daemon is not running on the MDS,
once the "dsK" directories are created.

For pNFS aware NFSv4.1 clients, the FreeBSD server will return two pieces
of information to the client that allows it to do I/O directly to the DS.
DeviceInfo - This is relatively static information that defines what a DS
             is. The critical bits of information returned by the FreeBSD
             server is the IP address of the DS and, for the Flexible
             File layout, that NFSv4.1 is to be used and that it is
             "tightly coupled".
             There is a "deviceid" which identifies the DeviceInfo.
Layout     - This is per file and can be recalled by the server when it
             is no longer valid. For the FreeBSD server, there is support
             for two types of layout, call File and Flexible File layout.
             Both allow the client to do I/O on the DS via NFSv4.1 I/O
             operations. The Flexible File layout is a more recent variant
             that allows specification of mirrors, where the client is
             expected to do writes to all mirrors to maintain them in a
             consistent state. The Flexible File layout also allows the
             client to report I/O errors for a DS back to the MDS.
             The Flexible File layout supports two variants referred to as
             "tightly coupled" vs "loosely coupled". The FreeBSD server always
             uses the "tightly coupled" variant where the client uses the
             same credentials to do I/O on the DS as it would on the MDS.
             For the "loosely coupled" variant, the layout specifies a
             synthetic user/group that the client uses to do I/O on the DS.
             The FreeBSD server does not do striping and always returns
             layouts for the entire file. The critical information in a layout
             is Read vs Read/Writea and DeviceID(s) that identify which
             DS(s) the data is stored on.

At this time, the MDS generates File Layout layouts to NFSv4.1 clients
that know how to do pNFS for the non-mirrored DS case unless the sysctl
vfs.nfsd.default_flexfile is set non-zero, in which case Flexible File
layouts are generated.
The mirrored DS configuration always generates Flexible File layouts.
For NFS clients that do not support NFSv4.1 pNFS, all I/O operations
are done against the MDS which acts as a proxy for the appropriate DS(s).
When the MDS receives an I/O RPC, it will do the RPC on the DS as a proxy.
If the DS is on the same machine, the MDS/DS will do the RPC on the DS as
a proxy and so on, until the machine runs out of some resource, such as
session slots or mbufs.
As such, DSs must be separate systems from the MDS.

***

###[What does {some strange unix command name} stand for?](http://www.unixguide.net/unix/faq/1.3.shtml)

+ awk = "Aho Weinberger and Kernighan"
+ grep = "Global Regular Expression Print"
+ fgrep = "Fixed GREP".
+ egrep = "Extended GREP"
+ cat = "CATenate"
+ gecos = "General Electric Comprehensive Operating Supervisor"
+ nroff = "New ROFF"
+ troff = "Typesetter new ROFF"
+ tee = T
+ bss = "Block Started by Symbol
+ biff = "BIFF"
+ rc (as in ".cshrc" or "/etc/rc") = "RunCom"
+ Don Libes' book "Life with Unix" contains lots more of these
tidbits.
***

##Beastie Bits
+ [RetroBSD: Unix for microcontrollers](http://retrobsd.org/wiki/doku.php)
+ [On the matter of OpenBSD breaking embargos (KRACK)](https://marc.info/?l=openbsd-tech&m=152910536208954&w=2)
+ [Theo's Basement Computer Paradise (1998)](https://zeus.theos.com/deraadt/hosts.html)
+ [Airport Extreme runs NetBSD](https://jcs.org/2018/06/12/airport_ssh)
+ [What UNIX shell could have been](https://rain-1.github.io/shell-2.html)

***
Tarsnap ad
***

##Feedback/Questions
+ We need more feedback and questions. Please email feedback@bsdnow.tv
+ Also, many of you owe us BSDCan trip reports! We have shared what our experience at BSDCan was like, but we want to hear about yours. What can we do better next year? What was it like being there for the first time?
+ [Jason writes in](https://slexy.org/view/s205jU58X2)
    + https://www.wheelsystems.com/en/products/wheel-fudo-psm/
+ [June 19th was National FreeBSD Day](https://twitter.com/search?src=typd&q=%23FreeBSDDay)
***

- Send questions, comments, show ideas/topics, or stories you want mentioned on the show to [feedback@bsdnow.tv](mailto:feedback@bsdnow.tv)
***

```