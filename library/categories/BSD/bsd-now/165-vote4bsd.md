+++
title = "165: Vote4BSD"
description = 'This week on BSDNow, we’ve got voting news for you (No not that election), a closer look atThis episode was brought to you byiXsystems - Enterprise <brServers and Storage for Open Source[ src="/images/2.png" a'
date = "2016-10-26T12:00:00Z"
url = "https://www.bsdnow.tv/165"
author = "feedback@bsdnow.tv (JT Pennington)"
text = ""
lastupdated = "2026-03-26T14:37:50.987332079Z"
seen = false
+++

This week on BSDNow, we’ve got voting news for you (No not *that* election), a closer look at

This episode was brought to you by
----------

[![iXsystems - Enterprise <br>
Servers and Storage for Open Source](/images/1.png)](http://www.ixsystems.com/bsdnow)[![]() src="/images/2.png" alt="DigitalOcean - Simple Cloud Hosting, Built for Developers" /\>](http://www.digitalocean.com/)[ href="http://www.tarsnap.com/bsdnow" title="Tarsnap"\>![Tarsnap - Online Backups for the <br>
Truly Paranoid](/images/3.png)]()

---

Headlines
----------

### [ARIN 38 involvement, vote!](http://lists.nycbug.org/pipermail/talk/2016-October/016878.html) ###

* Isaac (.Ike) Levy, one of our interview guests from earlier this year, is running for a seat on the 15 person ARIN Advisory Council
* His goal is to represent the entire \*BSD community at this important body that makes decisions about how IP addresses are allocated and managed
* Biographies and statements for all of the candidates are [available here](https://www.arin.net/participate/elections/candidate_bios.pdf)
* The election ends Friday October 28th
* If elected, Ike will be looking for input from the community \*\*\*

### [LibreSSL not just available but default (DragonFlyBSD)](https://www.dragonflydigest.com/2016/10/19/18794.html) ###

* DragonFly has become the latest BSD to join the growing LibreSSL family. As mentioned a few weeks back, they were in the process of wiring it up as a replacement for OpenSSL.
* With this latest commit, you can now build the entire base and OpenSSL isn’t built at all.
* Congrats, and hopefully more BSDs (and Linux) jump on the bandwagon [Compat\_43 is gone](http://lists.dragonflybsd.org/pipermail/commits/2016-October/624734.html)
* RiP 4.3 Compat support.. Well for DragonFly anyway.
* This commit finally puts out to pasture the 4.3 support, which has been disabled by default in DragonFly for almost 5 years now.
* This is a nice cleanup of their tree, removing more than a thousand lines of code and some of the old cruft still lingering from 4.3. \*\*\*

### [Create your first FreeBSD kernel module](http://meltmes.kiloreux.me/create-your-first-freebsd-kernel-module/) ###

* This is an interesting tutorial from Abdelhadi Khiati, who is currently a master's student in AI and robotics

>
>
> I have been lucky enough to participate in Google Summer of Code with the FreeBSD foundation. I was amazed by the community surrounding it which was noob friendly and very helpful (Thank you FreeBSD \<3)
>
>
>
> I wanted to make a starting tutorial for people to write a simple module for kernel before diving inside more complicated kernel shizzle
>
>
>
> The kernel module that we will be working on is a simple event handler for the kernel. It will be composed of 2 parts, the event handling function, and the module declaration
>
>
>
> The module event handler is a function that handles different events for the module. Like the module being loaded, unloaded or on system shutdown
>
>
>
> Now that we have the events handling function ready. We need to declare the moduledata\_t to be able to use it inside DECLARE\_MODULE macro and load it into the kernel. It has the module name and a pointer to the event handling function
>
>
>
> Lastly, we need to declare the module using the DECLARE\_MODULE macro. Which has the following structure:
>
>

\~\~  
 DECLARE\_MODULE(name, moduledata\_t data, sub, order);  
 \~\~

>
>
> name: The module name that will be used in the SYSINIT() call to identify the module.  
>  data: The moduledata\_t structure that we already presented.  
>  sub : Since we are using a driver here so the value will be SI\_SUB\_DRIVERS this argument specify the type of system startup interface.  
>  order : Represents the order of initialization within the subsystem, we will us the SI\_ORDER\_MIDDLE value here.
>
>

* To compile the previous file you need to use a Makefile as following:  
   \~\~  
   KMOD=hello  
   SRCS=module.c  
   .include  
   \~\~

* We look forward to a future post where more functionality is added to the kernel module

  ---

### [Installing Windows 10 Under the bhyve Hypervisor.](http://pr1ntf.xyz/windows10.html) ###

* Looking for your Bhyve fix? If so, then Trent (Of iohyve fame) has a nice blog post today with a detailed look at how to get Windows 10 up and running in bhyve.
* First up, Trent gives us a nice look back at how far we’ve come in only a single year. Just a year ago, initial support for UEFI was landing, there was no VNC option, leaving us to only serial console goodness. Fast-forward to today and Windows 10 + Bhyve + Vnc is a go.
* He immediately jumps us into the good stuff, talking about what you’ll need to follow along. His tutorial was written on 12-CURRENT, but running 11.0-RELEASE should work as well.
* Of course, he does mention that before starting on this quest, make sure to read the bhyve handbook, specifically check that your CPU is supported. If you are running something without the correct Vt extensions, then your journey will end prematurely in sadness.
* Next up is some of the prep work needed to get your box ready to run VM’s. Loading the kernel module, creating “tap” devices for networking and such are detailed.
* If you are lazy (like me) then you’ll want to copy-n-paste his handy scripts which automate this process for you.
* With the system prepped, we get to the good stuff. You’ll need to install the bhyve-firmware package (which enables UEFI booting) and get your handy Windows 10 ISO.
* From here Trent has helpfully again provided us with handy scripts to both do the bhyve startup, as well as enabling VNC support over a SSH tunnel.
* At this point you are good to go, fire up your VNC client and you should be greeted with the typical Windows “Press any key to boot from CD” message. No, he doesn’t provide instructions on how to install / Use / Like Windows, but we’ll leave that up to you. \*\*\*

News Roundup
----------

### [Lumina version 1.1.0 Released](https://lumina-desktop.org/version-1-1-0-released/) ###

* A new version of Lumina has just landed! 1.1.0 brings with it some important fixes, as well as new utilities that make your desktop computing easier than ever.
* First up, all i18n files have been re-worked, instead of needing to install another package, they are included with the build when WITH\_I18N is set.
* A handy new “start-lumina-desktop” command has been added, which makes it easy to get lumina running from your Login Manager or even manually in .xinitrc or the like.
* A bunch of internals related to how it tracks installed Applications and start-menu entries has been re-worked, fixing some memory issues and speeding things up.
* The default “Insight” file-manager has been given an overhaul, which includes some new features like “git” support.
* A new Qt5 “lumina-calculator” has also joined the family, which means not needing to use kcalc or xcalc on TrueOS anymore.
* A nice “TrueOS” specific option has also landed. Specifically now when System Updates are waiting to install at shutdown, Lumina will detect and prompt if you want to install or skip the update. Handy when on the road, or if you don’t have the time to wait for an update to complete. \*\*\*

### [OpenBGPD Large Communities support in –current](http://bad.network/openbgpd-large-communities.html) ###

* A blog post from OpenBSD’s Peter Hessler:

>
>
> On Friday, I committed support for Large Communities to OpenBGPD. This is a draft-RFC that I am pretty excited about.
>
>
>
> Back in the early days of The Internet, when routers rode dinosaurs to work and nerds weren't cool, we wanted to signal to our network neighbours certain information about routes. To be fair, we still do. But, back then everyone had 16 bit ASNs, so there was a simple concept called 'communities'. This was a 32bit opaque value, that was traditionally split into two 16bit values. Conveniently, we were able to encode an "us" and a "them", and perform actions based on what our neighbours told us.
>
>
>
> But, 16bits is pretty limiting. There could only be \~65'000 possible networks on The Internet total? Eeek. So, we created 32bit ASNs. 4 billion networks is seen as a quite reasonable limitation. However, you can't really encode a 32bit "us" and a 32bit "them" value into 32bits of total space. Something called "Extended Communities" was invented, but it tries to solve everything except the case of a 32bit ASN signalling to another 32bit ASN.
>
>
>
> Enter Large Communities. This is 3 32bit values. The first one is the "owner" of the namespace. Normally, you would put in your own ASN, or the ASN that you wish to signal. The second two 32bit values are opaque and only have meaning from the originating operator, but normally people will use "myasn":"verb":"noun" Or "myasn":"noun":"verb". Either way, it fits very nicely.
>
>
>
> Having previously ran a 32bit ASN, it became quickly obvious the lack of suitable communities was a critical problem. It was even the way to request an "old style" 16bit ASN from RIPE, "I need to use communities". Even the ability to say "do this to that ASN" was ugly, since you couldn't really communicate who the community was supposed to matter to. Clearly, we The Internet Community screwed up by not addressing this need earlier.
>
>
>
> OpenBGPD in OpenBSD -current has support for Large Communities, and this will be available in the 6.1 release and later. This was based partially on a patch from Job Snijders, thanks!
>
>
> ---
>

### [First look at the renewed CTL High Availability implementation in FreeBSD](https://mezzantrop.files.wordpress.com/2016/10/first-look-at-the-renewed-ctl-high-availability-implementation-in-freebsd-v1-1.pdf) ###

* Following up on a previous post about making a high availability dual head storage controller, the new post looks at using FreeBSD’s CTL HA implementation, and FreeBSD 11.0 to do that:

>
>
> This enhancement looks extremely important for the BeaST storage system as implementation of high available native ALUA in FreeBSD can potentially replace the BeaST arbitration mechanism (“Arbitrator”), which is completely described in the papers on the BeaST project page
>
>
>
> ALUA in storage world terminology means Asymmetric Logical Unit Assignment. In simple words this set of technologies allows a host to access any LUN via both controllers of a storage system
>
>
>
> As I still do not have any real hardware drive-enclosures, we will use Oracle Virtual Box and iSCSI protocol. I have already deployed this environment for the BeaST development, so we can use the similar, yet more simplified template for the renewed CTL HA testing purpose.
>
>

* If anyone has access to hardware of this nature (a storage shelf with 2 heads connected to it), that they could lend the author to help validate the design on real hardware, that would be most helpful. \> We will run two storage controllers (ctrl-a, ctrl-b) and a host (cln-1). A virtual SAS drive (da0) of 256 MB is configured as “shareable” in Virtual Media Manager and simultaneously connected with both storage controllers
* The basic settings are applied to both controllers
* One interesting setting is:

  >
  >
  > kern.cam.ctl.ha\_role – configures default role for the node. So ctrl-a is set as 0 (primary node), ctrl-b – 1 (secondary node). The role also can be specified on per-LUN basis which allows to distribute LUNs over both controllers evenly.  
  >  Note, kern.cam.ctl.ha\_id and kern.cam.ctl.ha\_mode are read-only parameters and must be set only via the /boot/loader.conf file.
  >
  >

* Once kern.cam.ctl.ha\_peer is set, and the peers connect to each other, the log messages should reflect this:

  * CTL: HA link status changed from 0 to 1
  * CTL: HA link status changed from 1 to 2

>
>
> The link states can be: 0 – not configured, 1 – configured but not established and 2 – established
>
>

* Then ctld is configured to export /dev/da0 on each of the controllers
* Then the client is booted, and uses iscsid to connect to each of the exposed targets

>
>
> sysctl kern.iscsi.fail\_on\_disconnection=1 on the client is needed to drop connection with one of the controllers in case of its failure
>
>
>
> As we know that da0 and da1 on the client are the same drive, we can put them under multipathing control: gmultipath create -A HA /dev/da0 /dev/da1
>
>

* The document them shows a file being copied continuously to simulate load. Because the multipath is configured in ‘active/active’ mode, the traffic is split between the two controllers
* Then the secondary controller is turned off, and iscsi disconnects that path, and gmultipath adapts and sends all of the traffic over the primary path.
* When the secondary node is brought back up, but the primary is taken down, traffic stops
* The console on the client is filled with errors: “Logical unit not accessible, asymmetric access state transition”
* The ctl(4) man page explains: \> If there is no primary node (both nodes are secondary, or secondary node has no connection to primary one), secondary node(s) report Transitioning state. \> Therefore, it looks like a “normal” behavior of CTL HA cluster in a case of disaster and loss of the primary node. It also means that a very lucky administrator can restore the failed primary controller before timeouts are elapsed.
* If the primary is down, the secondary needs to be promoted by some other process (CARP maybe?): sysctl kern.cam.ctl.ha\_role=0
* Then traffic follows again
* This is a very interesting look at this new feature, and I hope to see more about it in the future \*\*\*

### [Is SPF Simply Too Hard for Application Developers?](http://bsdly.blogspot.com/2016/10/is-spf-simply-too-hard-for-application.html) ###

* Peter Hansteen asks an interesting question:

>
>
> The Sender Policy Framework (SPF) is unloved by some, because it conflicts with some long-established SMTP email use cases. But is it also just too hard to understand and to use correctly for application developers?
>
>

* He tells a story about trying to file his Norwegian taxes, and running into a bug

>
>
> Then in August 2016, I tried to report a bug via the contact form at Altinn.no, the main tax authorities web site.
>
>
>
> The report in itself was fairly trivial: The SMS alert I had just received about an invoice for taxes due contained one date, which turned out to be my birth date rather than the invoice due date. Not a major issue, but potentially confusing to the recipient until you actually log in and download the invoice as PDF and read the actual due date and other specifics.
>
>
>
> The next time I checked my mail at bsdly.net, I found this bounce:
>
>
>
> [support@altinn.no](mailto:support@altinn.no): SMTP error from remote mail server after RCPT TO:: host mx.isp.as2116.net [193.75.104.7]: 550 5.7.23 SPF validation failed
>
>
>
> which means that somebody, somewhere tried to send a message to [support@altinn.no](mailto:support@altinn.no), but the message could not be delivered because the sending machine did not match the published SPF data for the sender domain.
>
>
>
> What happened is actually quite clear even from the part quoted above: the host mx.isp.as2116.net [193.75.104.7] tried to deliver mail on my behalf (I received the bounce, remember), and since I have no agreement for mail delivery with the owners and operators of that host, it is not in bsdly.net's SPF record either, and the delivery fails.
>
>

* After having a bunch of other problems, he finally gets a message back from the tax authority support staff:

>
>
> It looks like you have Sender Policy Framework (SPF) enabled on your mailserver, It is a known weakness of our contact form that mailervers with SPF are not supported.
>
>
>
> The obvious answer should be, as you will agree if you're still reading: The form's developer should place the user's email address in the Reply-To: field, and send the message as its own, valid local user. That would solve the problem.
>
>
>
> Yes, I'm well aware that SPF also breaks traditional forwarding of the type generally used by mailing lists and a few other use cases. Just how afraid should we be when those same developers come to do battle with the followup specifications such as DKIM and (shudder) the full DMARC specification?
>
>
> ---
>

Beastie Bits
----------

* [Looking for a very part-time SysAdmin](https://lists.freebsd.org/pipermail/freebsd-jobs/2016-October/000930.html)

* [If anyone wants to build the latest nodejs on OpenBSD...](https://twitter.com/qb1t/status/789610796380598272)

* [IBM considers donating Power8 servers to OpenBSD](https://marc.info/?l=openbsd-misc&m=147680858507662&w=2)

* [Install and configure DNS server in FreeBSD](https://galaxy.ansible.com/vbotka/freebsd-dns/)

* [bhyve vulnerability in FreeBSD 11.0 ](https://www.freebsd.org/security/advisories/FreeBSD-SA-16:32.bhyve.asc)

---

Feedback/Questions
----------

* [ Larry - Pkg Issue](http://pastebin.com/8hwDVQjL)
* [ Larry - Followup ](http://pastebin.com/3nswwk90)
* [ Jason - TrueOS](http://pastebin.com/pjfYWdXs)
* [ Matias - ZFS HALP!](http://pastebin.com/2tAmR5Wz)
* [ Robroy - User/Group](http://pastebin.com/7vWvUr8K) \*\*\*