+++
title = "Episode 260: Hacking Tour of Europe | BSD Now 260"
description = 'Trip reports from the Essen Hackathon and BSDCam, CfT: ZFS native encryption and UFS trim consolidation, ZFS performance benchmarks on a FreeBSD server, how to port your OS to EC2, Vint Cerf about traceability, Remote Access console to an RPi3 running FreeBSD, and more.\Headlin'
date = "2018-08-23T09:00:00Z"
url = "https://www.bsdnow.tv/260"
author = "feedback@bsdnow.tv (JT Pennington)"
text = ""
lastupdated = "2026-03-26T14:37:50.719210735Z"
seen = false
+++

Trip reports from the Essen Hackathon and BSDCam, CfT: ZFS native encryption and UFS trim consolidation, ZFS performance benchmarks on a FreeBSD server, how to port your OS to EC2, Vint Cerf about traceability, Remote Access console to an RPi3 running FreeBSD, and more.

\##Headlines  
 \###[Essen Hackathon & BSDCam 2018 trip report](https://wiki.freebsd.org/DevSummit/201808Hackathon)

* Allan and Benedict met at FRA airport and then headed to the Air Rail terminal for our train to Essen where the Hackathon would happen over the weekend of Aug 10 - 12, 2018. Once there, we did not have to wait long until other early-arrivals would show up and soon we had about 10 people gathered for lunch. After buying some take-out pizzas and bringing it back to the Linuxhotel (there was a training still going on there so we could not get into our rooms yet), we sat in the sunny park and talked. More and more people arrived and soon, people started hacking on their laptops. Some people would not arrive until a few hours before midnight, but we already had a record appearance of 20 people in total.
* On Saturday, we gathered everyone in one of the seminar rooms that had rooms and chairs for us. After some organizational infos, we did an introductory round and Benedict wrote down on the whiteboard what people were interested in. It was not long until groups formed to talk about SSL in base, weird ZFS scrubs that would go over 100% completion (fixed now). Other people started working on ports, fixing bugs, or wrote documentation. The day ended in a [BBQ in the Linuxhotel park](https://twitter.com/bsdbcr), which was well received by everyone.
* On Sunday, after attendees packed up their luggage and stored it in the seminar room, we continued hacking until lunchtime. After a quick group picture, we headed to a local restaurant for the social event (which was not open on Saturday, otherwise we would have had it then). In the afternoon, most people departed, a good half of them were heading for BSDCam.
* [Commits from the hackathon (the ones from 2018)](http://freshbsd.org/search?q=Essen+hackathon)
* Overall, the hackathon was well received by attendees and a lot of them liked the fact that it was close to another BSD gathering so they could nicely combine the two. Also, people thought about doing their own hackathon in the future, which is an exciting prospect. Thanks to all who attended, helped out here and there when needed. Special Thanks to [Netzkommune GmbH](https://www.netzkommune.de/) for sponsoring the social event and the [Linuxhotel](http://linuxhotel.de/) for having us.
* Benedict was having a regular work day on Monday after coming back from the hackathon, but flew out to Heathrow on Tuesday. Allan was in London a day earlier and arrived a couple of hours before Benedict in Cambridge. He headed for the Computer Lab even though the main event would not start until Wednesday. Most people gathered at the Maypole pub on Tuesday evening for welcomes, food and drinks.
* On Wednesday, a lot of people met in the breakfast room of Churchill College where most people were staying and went to the Computer Lab, which served as the main venue for BSDCam, together. The morning was spend with introductions and collecting what most people were interested in talking. This unconference style has worked well in the past and soon we had 10 main sessions together for the rest of this and the following two days ([full schedule](https://bsdcam.cl.cam.ac.uk/)).
* Most sessions took notes, which you can find on the [FreeBSD wiki](https://wiki.freebsd.org/DevSummit/201808).
* On Thursday evening, we had a nice formal dinner at Trinity Hall.
* BSDCam 2018 was a great success with a lot of fruitful discussions and planning sessions. We thank the organizers for BSDCam for making it happen.
* A special mentions goes out to Robert Watson and his family. Even though he was not there, he had a good reason to miss it: they had their first child born at the beginning of the week. Congratulations and best wishes to all three of them!

---

\###[Call for Testing: ZFS Native Encryption for FreeBSD](https://lists.freebsd.org/pipermail/freebsd-current/2018-August/070832.html)

* A port of the ZoL (ZFS-on-Linux) feature that provides native crypto support for ZFS is ready for testing on FreeBSD
* Most of the porting was done by [sef@freebsd.org](mailto:sef@freebsd.org) (Sean Eric Fagan)
* The original ZoL commit is here: [https://github.com/zfsonlinux/zfs/pull/5769/commits/5aef9bedc801830264428c64cd2242d1b786fd49](https://github.com/zfsonlinux/zfs/pull/5769/commits/5aef9bedc801830264428c64cd2242d1b786fd49)
* For an overview, see Tom Caputi’s presentation from the OpenZFS Developers Summit in 2016
* Video: [https://youtu.be/frnLiXclAMo](https://youtu.be/frnLiXclAMo)
* Slides: [https://drive.google.com/file/d/0B5hUzsxe4cdmU3ZTRXNxa2JIaDQ/view?usp=sharing](https://drive.google.com/file/d/0B5hUzsxe4cdmU3ZTRXNxa2JIaDQ/view?usp=sharing)
* WARNING: test in VMs or with spare disks etc, pools created with this code, or upgraded to this version, will no longer be importable on systems that do not support this feature. The on-disk format or other things may change before the final version, so you will likely have to ‘zfs send | zfs recv’ the data on to a new pool
* Thanks for testing to help this feature land in FreeBSD

---

**iXsystems**

\###[Call for Testing: UFS TRIM Consolidation](https://lists.freebsd.org/pipermail/freebsd-current/2018-August/070797.html)

* Kirk Mckusick posts to the FreeBSD mailing list looking for testers for the new UFS TRIM Consolidation code

>
>
> When deleting files on filesystems that are stored on flash-memory (solid-state) disk drives, the filesystem notifies the underlying disk of the blocks that it is no longer using. The notification allows the drive to avoid saving these blocks when it needs to flash (zero out) one of its flash pages. These notifications of no-longer-being-used blocks are referred to as TRIM notifications. In FreeBSD these TRIM notifications are sent from the filesystem to the drive using the BIO\_DELETE command.  
>  Until now, the filesystem would send a separate message to the drive for each block of the file that was deleted. Each Gigabyte of file size resulted in over 3000 TRIM messages being sent to the drive. This burst of messages can overwhelm the drive’s task queue causing multiple second delays for read and write requests.  
>  This implementation collects runs of contiguous blocks in the file and then consolodates them into a single BIO\_DELETE command to the drive. The BIO\_DELETE command describes the run of blocks as a single large block being deleted. Each Gigabyte of file size can result in as few as two BIO\_DELETE commands and is typically less than ten. Though these larger BIO\_DELETE commands take longer to run, they do not clog the drive task queue, so read and write commands can intersperse effectively with them.  
>  Though this new feature has been throughly reviewed and tested, it is being added disabled by default so as to minimize the possibility of disrupting the upcoming 12.0 release. It can be enabled by running ``sysctl vfs.ffs.dotrimcons=1’’. Users are encouraged to test it. If no problems arise, we will consider requesting that it be enabled by default for 12.0.  
>  This support is off by default, but I am hoping that I can get enough testing to ensure that it (a) works, and (b) is helpful that it will be reasonable to have it turned on by default in 12.0. The cutoff for turning it on by default in 12.0 is September 19th. So I am requesting your testing feedback in the near-term. Please let me know if you have managed to use it successfully (or not) and also if it provided any performance difference (good or bad).
>
>

* To enable TRIM consolidation use `sysctl vfs.ffs.dotrimcons=1’
* There is also a diff that adds additional statistics: [https://lists.freebsd.org/pipermail/freebsd-current/2018-August/070798.html](https://lists.freebsd.org/pipermail/freebsd-current/2018-August/070798.html)
* You can also watch the volume and latency of BIO\_DELETE commands by running `gstat` with the -d flag

---

\##News Roundup  
 \###[ZFS performance](https://aravindh.net/post/zfs_performance/)

* Aravindh Sampathkumar, a Performance Engineer and Sysadmin posts some simple benchmarks he did on a new ZFS server

>
>
> This is NOT an all-in post about ZFS performance. I built a FreeBSD+ZFS file server recently at work to serve as an offsite backup server. I wanted to run a few synthetic workloads on it and look at how it fares from performance perspective. Mostly for curiosity and learning purposes.  
>  As stated in the notes about building this server, performance was not one of the priorities, as this server will never face our active workload. What I care about from this server is its ability to work with rsync and keep the data synchronised with our primary storage server. With that context, I ran a few write tests to see how good our solution is and what to expect from it in terms of performance.
>
>

* The article then uses FIO to do some benchmarks.
* As the author did, make sure you match the FIO block size to the ZFS record size to avoid write amplification. Either tune FIO or adjust the recordsize property in ZFS
* You also want to consider compression and cache effects

>
>
> Write Performance: Incompressible: 1600-2600 MB/s, Compressible: 2500-6600 MB/s  
>  Another over 1200 MB/s is enough to keep your 10 gigabit network saturated
>
>

* The increased latency that is seen with higher number of writers working, may be the result of the ZFS backpressure system (the write throttle). There is some tuning that can be done there. Specifically, since this machine has 768 GB of ram, you might allow more than 4GB of dirty data, which would mean you’d be able to write larger batches and not have to push back while you wait for a transaction group to flush when dealing with gigabytes/sec of writes

---

\###[How to port your OS to EC2](http://www.daemonology.net/blog/2018-07-14-port-OS-to-EC2.html)

* Colin Percival reflects on his FreeBSD on EC2 maintainership efforts in his blog:

>
>
> I’ve been the maintainer of the FreeBSD/EC2 platform for about 7.5 years now, and as far as “running things in virtual machines” goes, that remains the only operating system and the only cloud which I work on. That said, from time to time I get questions from people who want to port other operating systems into EC2, and being a member of the open source community, I do my best to help them. I realized a few days ago that rather than replying to emails one by one it would be more efficient to post something publicly; so — for the benefit of the dozen or so people who want to port operating systems to run in EC2, and the curiosity of maybe a thousand more people who use EC2 but will never build AMIs themselves — here’s a rough guide to building EC2 images.  
>  Before we can talk about building images, there are some things you need:  
>  Your OS needs to run on x86 hardware. 64-bit (“amd64”, “x86-64”) is ideal, but I’ve managed to run 32-bit FreeBSD on “64-bit” EC2 instances so at least in some cases that’s not strictly necessary.  
>  You almost certainly want to have drivers for Xen block devices (for all of the pre-Nitro EC2 instances) or for NVMe disks (for the most recent EC2 instances). Theoretically you could make do without these since there’s some ATA emulation available for bootstrapping, but if you want to do any disk I/O after the kernel finishes booting you’ll want to have a disk driver.  
>  Similarly, you need support for the Xen network interface (older instances), Intel 10 GbE SR-IOV networking (some newer but pre-Nitro instances), or Amazon’s “ENA” network adapters (on Nitro instances), unless you plan on having instances which don’t communicate over the network. The ENA driver is probably the hardest thing to port, since as far as I know there’s no way to get your hands on the hardware directly, and it’s very difficult to do any debugging in EC2 without having a working network.  
>  Finally, the obvious: You need to have an AWS account, and appropriate API access keys.  
>  Building a disk image
>
>
>
> Building an AMI  
>  I wrote a simple tool for converting disk images into EC2 instances: bsdec2-image-upload. It uploads a disk image to Amazon S3; makes an API call to import that disk image into an EBS volume; creates a snapshot of that volume; then registers an EC2 AMI using that snapshot.  
>  To use bsdec2-image-upload, you’ll first need to create an S3 bucket for it to use as a staging area. You can call it anything you like, but I recommend that you
>
>

>
>
> Create it in a “nearby” region (for performance reasons), and  
>  Set an S3 “lifecycle policy” which deletes objects automatically after 1 day (since bsdec2-image-upload doesn’t clean up the S3 bucket, and those objects are useless once you’ve finished creating an AMI).
>
>

>
>
> Boot configuration  
>  Odds are that your instance started booting and got as far as the boot loader launching the kernel, but at some point after that things went sideways. Now we start the iterative process of building disk images, turning them into AMIs, launching said AMIs, and seeing where they break. Some things you’ll probably run into here:  
>  EC2 instances have two types of console available to them: A serial console and an VGA console. (Or rather, emulated serial and emulated VGA.) If you can have your kernel output go to both consoles, I recommend doing that. If you have to pick one, the serial console (which shows up as the “System Log” in EC2) is probably more useful than the VGA console (which shows up as “instance screenshot”) since it lets you see more than one screen of logs at once; but there’s a catch: Due to some bizarre breakage in EC2 — which I’ve been complaining about for ten years — the serial console is very “laggy”. If you find that you’re not getting any output, wait five minutes and try again.  
>  You may need to tell your kernel where to find the root filesystem. On FreeBSD we build our disk images using GPT labels, so we simply need to specify in /etc/fstab that the root filesystem is on /dev/gpt/rootfs; but if you can’t do this, you’ll probably need to have different AMIs for Nitro instances vs. non-Nitro instances since Xen block devices will typically show up with different device names from NVMe disks. On FreeBSD, I also needed to set the vfs.root.mountfrom kernel environment variable for a while; this also is no longer needed on FreeBSD but something similar may be needed on other systems.  
>  You’ll need to enable networking, using DHCP. On FreeBSD, this means placing ifconfig\_DEFAULT=“SYNCDHCP” into /etc/rc.conf; other systems will have other ways of specifying network parameters, and it may be necessary to specify a setting for the Xen network device, Intel SR-IOV network, and the Amazon ENA interface so that you’ll have the necessary configuration across all EC2 instance types. (On FreeBSD, ifconfig\_DEFAULT takes care of specifying the network settings which should apply for whatever network interface the kernel finds at boot time.)  
>  You’ll almost certainly want to turn on SSH, so that you can connect into newly launched instances and make use of them. Don’t worry about setting a password or creating a user to SSH into yet — we’ll take care of that later.  
>  EC2 configuration  
>  Now it’s time to make the AMI behave like an EC2 instance. To this end, I prepared a set of rc.d scripts for FreeBSD. Most importantly, they  
>  Print the SSH host keys to the console, so that you can veriy that they are correct when you first SSH in. (Remember, Verifying SSH host keys is more important than flossing every day.)  
>  Download the SSH public key you want to use for logging in, and create an account (by default, “ec2-user”) with that key set up for you.  
>  Fetch EC2 user-data and process it via configinit to allow you to configure the system as part of the process of launching it.  
>  If your OS has an rc system derived from NetBSD’s rc.d, you may be able to use these scripts without any changes by simply installing them and enabling them in /etc/rc.conf; otherwise you may need to write your own scripts using mine as a model.  
>  Firstboot scripts  
>  A feature I added to FreeBSD a few years ago is the concept of “firstboot” scripts: These startup scripts are only run the first time a system boots. The aforementioned configinit and SSH key fetching scripts are flagged this way — so if your OS doesn’t support the “firstboot” keyword on rc.d scripts you’ll need to hack around that — but EC2 instances also ship with other scripts set to run on the first boot:  
>  FreeBSD Update will fetch and install security and critical errata updates, and then reboot the system if necessary.  
>  The UFS filesystem on the “boot disk” will be automatically expanded to the full size of the disk — this makes it possible to specify a larger size of disk at EC2 instance launch time.  
>  Third-party packages will be automatically fetched and installed, according to a list in /etc/rc.conf. This is most useful if configinit is used to edit /etc/rc.conf, since it allows you to specify packages to install via the EC2 user-data.  
>  While none of these are strictly necessary, I find them to be extremely useful and highly recommend implementing similar functionality in your systems.  
>  Support my work!  
>  I hope you find this useful, or at very least interesting. Please consider supporting my work in this area; while I’m happy to contribute my time to supporting open source software, it would be nice if I had money coming in which I could use to cover incidental expenses (e.g., conference travel) so that I didn’t end up paying to contribute to FreeBSD.
>
>

---

**Digital Ocean**  
[https://do.co/bsdnow](https://do.co/bsdnow)

\###[Traceability, by Vint Cerf](https://cacm.acm.org/magazines/2018/8/229771-traceability/fulltext)

* A recent article from the August issue of the Communications of the ACM, for your contemplation:

>
>
> At a recent workshop on cybersecurity in the U.K., a primary topic of consideration was how to preserve the freedom and openness of the Internet while protecting against the harmful behaviors that have emerged in this global medium. That this is a significant challenge cannot be overstated. The bad behaviors range from social network bullying and misinformation to email spam, distributed denial of service attacks, direct cyberattacks against infrastructure, malware propagation, identity theft, and a host of other ills requiring a wide range of technical and legal considerations. That these harmful behaviors can and do cross international boundaries only makes it more difficult to fashion effective responses.  
>  In other columns, I have argued for better software development tools to reduce the common mistakes that lead to vulnerabilities that are exploited. Here, I want to focus on another aspect of response related to law enforcement and tracking down perpetrators. Of course, not all harms are (or perhaps are not yet) illegal, but discovering those who cause them may still be warranted. The recent adoption and implementation of the General Data Protection Regulation (GDPR) in the European Union creates an interesting tension because it highlights the importance and value of privacy while those who do direct or indirect harm must be tracked down and their identities discovered.  
>  In passing, I mention that cryptography has sometimes been blamed for protecting the identity or actions of criminals but it is also a tool for protecting privacy. Arguments have been made for “back doors” to cryptographic systems but I am of the opinion that such proposals carry extremely high risk to privacy and safety. It is not my intent to argue this question in this column.  
>  What is of interest to me is a concept to which I was introduced at the Ditchley workshop, specifically, differential traceability. The ability to trace bad actors to bring them to justice seems to me an important goal in a civilized society. The tension with privacy protection leads to the idea that only under appropriate conditions can privacy be violated. By way of example, consider license plates on cars. They are usually arbitrary identifiers and special authority is needed to match them with the car owners (unless, of course, they are vanity plates like mine: “Cerfsup”). This is an example of differential traceability; the police department has the authority to demand ownership information from the Department of Motor Vehicles that issues the license plates. Ordinary citizens do not have this authority.  
>  In the Internet environment there are a variety of identifiers associated with users (including corporate users). Domain names, IP addresses, email addresses, and public cryptography keys are examples among many others. Some of these identifiers are dynamic and thus ambiguous. For example, IP addresses are not always permanent and may change (for example, temporary IP addresses assigned at Wi-Fi hotspots) or may be ambiguous in the case of Network Address Translation. Information about the time of assignment and the party to whom an IP address was assigned may be needed to identify an individual user. There has been considerable debate and even a recent court case regarding requirements to register users in domain name WHOIS databases in the context of the adoption of GDPR. If we are to accomplish the simultaneous objectives of protecting privacy while apprehending those engaged in harmful or criminal behavior on the Internet, we must find some balance between conflicting but desirable outcomes.  
>  This suggests to me that the notion of traceability under (internationally?) agreed circumstances (that is, differential traceability) might be a fruitful concept to explore. In most societies today, it is accepted that we must be identifiable to appropriate authorities under certain conditions (consider border crossings, traffic violation stops as examples). While there are conditions under which apparent anonymity is desirable and even justifiable (whistle-blowing, for example) absolute anonymity is actually quite difficult to achieve (another point made at the Ditchley workshop) and might not be absolutely desirable given the misbehaviors apparent anonymity invites. I expect this is a controversial conclusion and I look forward to subsequent discussion.
>
>

---

\###[Remote Access Console using FreeBSD on an RPi3](https://blackdot.be/2018/08/remote-access-console-using-raspberry-pi-3b-and-freebsd/)

* Our friend, and FOSDEM Booth Neighbour, Jorge, has posted a tutorial on how he created a remote access console for his SmartOS server and other machines in his homelab
* Parts:
* Raspberry Pi 3 B+
* NavoLabs micro POE Hat
* FT4232H based USB-to-RS232 (4x) adapter
* Official Raspberry Pi case (optional)
* Heat-sink kit (optional)
* USB-to-TTL adaptor (optional)
* Sandisk 16Gb microSD

>
>
> For the software I ended up using conserver. Below is a very brief tutorial on how to set everything up. I assume you have basic unix skills.
>
>

* Get an RPi3 image, make some minor modifications for RPi3+, and write it to the USB stick
* Configure FreeBSD on the RPi3
  * Load the ‘muge’ Ethernet Driver
  * Load USB serial support
  * Load the FTDI driver
  * Enable SSHd and Conserver
  * Configure Conserver
  * Setup log rotation
  * Start Conserver

* And you’re good to go  

>
>
> A small bonus script I wrote to turn on the 2nd LED on the rPI once the system is booted, it will then blink the LED if someone is connected to any of the consoles.
>
>

* There is also a followup post with some additional tips: [https://blackdot.be/2018/08/freebsd-uart-and-raspberry-pi-3-b/](https://blackdot.be/2018/08/freebsd-uart-and-raspberry-pi-3-b/)

---

\##Beastie Bits

* [Annual Penguin Races](https://twitter.com/ungleich/status/1031501391792156673)
* [Mscgen - Message Sequence Chart generator](http://www.mcternan.me.uk/mscgen/)
* [This patch makes FreeBSD boot 500 - 800ms faster, please test on your hardware](https://reviews.freebsd.org/D16723)
* [FreeBSD’s arc4random() replaced with OpenBSD ChaCha20 implementation](https://svnweb.freebsd.org/base?view=revision&revision=338059)
* [MeetBSD Devsummit open for registrations](https://twitter.com/freebsdfndation/status/1031590348768915456)
* [New Podcast interview with Michael W. Lucas](https://mwl.io/archives/3654)

---

**Tarsnap**

\##Feedback/Questions  
 We need more feedback emails. Please write to [feedback@bsdnow.tv](mailto:feedback@bsdnow.tv)

Additionally, we are considering a new segment to be added to the end of the show (to make it skippable), where we have a \~15 minute deep dive on a topic. Some initial ideas are on the Virtual Memory subsystem, the Scheduler, Capsicum, and GEOM. What topics would you like to get very detailed explanations of? Many of the explanations may have accompanying graphics, and not be very suitable for audio only listeners, that is why we are planning to put it at the very end of the episode.

---

* Send questions, comments, show ideas/topics, or stories you want mentioned on the show to [feedback@bsdnow.tv](mailto:feedback@bsdnow.tv)