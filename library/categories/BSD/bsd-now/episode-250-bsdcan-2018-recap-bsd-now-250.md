+++
title = "Episode 250: BSDCan 2018 Recap | BSD Now 250"
description = 'TrueOS becoming a downstream fork with Trident, our BSDCan 2018 recap, HardenedBSD Foundation founding efforts, VPN with OpenIKED on OpenBSD, FreeBSD on a System76 Galago Pro, and hardware accelerated crypto on Octeons.\Headlines\[TrueOS to Focus on Core Operating Syste'
date = "2018-06-14T11:00:00Z"
url = "https://www.bsdnow.tv/250"
author = "feedback@bsdnow.tv (JT Pennington)"
text = ""
lastupdated = "2026-03-26T14:37:50.745517825Z"
seen = false
+++

TrueOS becoming a downstream fork with Trident, our BSDCan 2018 recap, HardenedBSD Foundation founding efforts, VPN with OpenIKED on OpenBSD, FreeBSD on a System76 Galago Pro, and hardware accelerated crypto on Octeons.

\##Headlines##  
 \###[TrueOS to Focus on Core Operating System](https://www.trueos.org/blog/trueosdownstream/)

>
>
> The TrueOS Project has some big plans in the works, and we want to take a minute and share them with you. Many have come to know TrueOS as the “graphical FreeBSD” that makes things easy for newcomers to the BSDs. Today we’re announcing that TrueOS is shifting our focus a bit to become a cutting-edge operating system that keeps all of the stability that you know and love from ZFS (OpenZFS) and FreeBSD, and adds additional features to create a fresh, innovative operating system. Our goal is to create a core-centric operating system that is modular, functional, and perfect for do-it-yourselfers and advanced users alike.
>
>

>
>
> TrueOS will become a downstream fork that will build on FreeBSD by integrating new software technologies like OpenRC and LibreSSL. Work has already begun which allows TrueOS to be used as a base platform for other projects, including JSON-based manifests, integrated Poudriere / pkg tools and much more. We’re planning on a six month release cycle to keep development moving and fresh, allowing us to bring you hot new features to ZFS, bhyve and related tools in a timely manner. This makes TrueOS the perfect fit to serve as the basis for building other distributions.
>
>

>
>
> Some of you are probably asking yourselves “But what if I want to have a graphical desktop?” Don’t worry! We’re making sure that everyone who knows and loves the legacy desktop version of TrueOS will be able to continue using a FreeBSD-based, graphical operating system in the future. For instance, if you want to add KDE, just use sudo pkg install kde and voila! You have your new shiny desktop. Easy right? This allows us to get back to our roots of being a desktop agnostic operating system. If you want to add a new desktop environment, you get to pick the one that best suits your use.
>
>

>
>
> We know that some of you will still be looking for an out-of-the-box solution similar to legacy PC-BSD and TrueOS. We’re happy to announce that Project Trident will take over graphical FreeBSD development going forward. Not much is going to change in that regard other than a new name! You’ll still have Lumina Desktop as a lightweight and feature-rich desktop environment and tons of utilities from the legacy TrueOS toolchain like sysadm and AppCafe. There will be migration paths available for those that would like to move to other FreeBSD-based distributions like Project Trident or GhostBSD.
>
>

>
>
> We look forward to this new chapter for TrueOS and hope you will give the new edition a spin! Tell us what you think about the new changes by leaving us a comment. Don’t forget you can ask us questions on our Twitter and be a part of our community by joining the new TrueOS Forums when they go live in about a week. Thanks for being a loyal fan of TrueOS.
>
>

\###[Project Trident FAQ](http://project-trident.org/faq)

* Q: Why did you pick the name “Project Trident”?

>
>
> A: We were looking for a name that was unique, yet would still relate to the BSD community. Since Beastie (the FreeBSD mascot) is always pictured with a trident, it felt like that would be a great name.
>
>

* Q: Where can users go for technical support?

>
>
> A: At the moment, Project Trident will continue sharing the TrueOS community forums and Telegram channels. We are currently evaluating dedicated options for support channels in the future.
>
>

* Q: Can I help contribute to the project?

>
>
> A: We are always looking for developers who want to join the project. If you’re not a developer you can still help, as a community project we will be more reliant on contributions from the community in the form of how-to guides and other user-centric documentation and support systems.
>
>

* Q: How is the project supported financially?

>
>
> A: Project Trident is sponsored by the community, from both individuals and corporations. iXsystems has stepped up as the first enterprise-level sponsor of the project, and has been instrumental in getting Project Trident up and running. Please visit the Sponsors page to see all the current sponsors.
>
>

* Q: How can I help support the project financially?

>
>
> A: Several methods exist, from one time or recurring donations via Paypal to limited time swag t-shirt campaigns during the year. We are also looking into more alternative methods of support, so please visit the Sponsors page to see all the current methods of sponsorship.
>
>

* Q: Will there be any transparency of the financial donations and expenditures?

>
>
> A: Yes, we will be totally open with how much money comes into the project and what it is spent on. Due to concerns of privacy, we will not identify individuals and their donation amounts unless they specifically request to be identified. We will release a monthly overview in/out ledger, so that community members can see where their money is going.
>
>

* Relationship with TrueOS

* Project Trident does have very close ties to the TrueOS project, since most of the original Project Trident developers were once part of the TrueOS project before it became a distribution platform. For users of the TrueOS desktop, we have some additional questions and answers below.

* Q: Do we need to be at a certain TrueOS install level/release to upgrade?

>
>
> A: As long as you have a TrueOS system which has been updated to at least the 18.03 release you should be able to just perform a system update to be automatically upgraded to Project Trident.
>
>

* Q: Which members moved from TrueOS to Project Trident?

>
>
> A: Project Trident is being led by prior members of the TrueOS desktop team. Ken and JT (development), Tim (documentation) and Rod (Community/Support). Since Project Trident is a community-first project, we look forward to working with new members of the team.
>
>

---

**iXsystems**

\###[BSDCan](https://www.bsdcan.org/2018)

* BSDCan finished Saturday last week
* It started with the GoatBoF on Tuesday at the Royal Oak Pub, where people had a chance to meet and greet. Benedict could not attend due to an all-day FreeBSD Foundation meeting and and even FreeBSD Journal Editorial Board meeting.
* The FreeBSD devsummit was held the next two days in parallel to the tutorials. Gordon Tetlow, who organized the devsummit, opened the devsummit. Deb Goodkin from the FreeBSD Foundation gave the first talk with a Foundation update, highlighting current and future efforts. Li-Wen Hsu is now employed by the Foundation to assist in QA work (Jenkins, CI/CD) and Gordon Tetlow has a part-time contract to help secteam as their secretary.
* Next, the FreeBSD core team (among them Allan and Benedict) gave a talk about what has happened this last term. With a core election currently running, some of these items will carry over to the next core team, but there were also some finished ones like the FCP process and FreeBSD members initiative. People in the audience asked questions on various topics of interest.
* After the coffee break, the release engineering team gave a talk about their efforts in terms of making releases happen in time and good quality.
* Benedict had to give his Ansible tutorial in the afternoon, which had roughly 15 people attending. Most of them beginners, we could get some good discussions going and I also learned a few new tricks. The overall feedback was positive and one even asked what I’m going to teach next year.
* The second day of the FreeBSD devsummit began with Gordon Tetlow giving an insight into the FreeBSD Security team (aka secteam). He gave a overview of secteam members and responsibilities, explaining the process based on a long past advisory. Developers were encouraged to help out secteam. NDAs and proper disclosure of vulnerabilities were also discussed, and the audience had some feedback and questions.
* When the coffee break was over, the FreeBSD 12.0 planning session happened. A [Google doc](https://wiki.freebsd.org/DevSummit/201806/HaveNeedWant12) served as a collaborative way of gathering features and things left to do. People signed up for it or were volunteered. Some features won’t make it into 12.0 as they are not 100% ready for prime time and need a few more rounds of testing and bugfixing. Still, 12.0 will have some compelling features.
* [A 360° group picture](https://theta360.com/s/xuR4ogsjGmu584JJju0vUaTA) was taken after lunch, and then people split up into the working groups for the afternoon or started hacking in the UofO Henderson residence.
* Benedict and Allan both attended the OpenZFS working group, lead by Matt Ahrens. He presented the completed and outstanding work in FreeBSD, without spoiling too much of the ZFS presentations of various people that happened later at the conference.
* Benedict joined the boot code session a bit late (hallway track is the reason) when most things seem to have already been discussed.
* [BSDCan 2018 — Ottawa (In Pictures)](https://www.talegraph.com/tales/WmObSRejzT)
* [iXsystems Photos from BSDCan 2018](https://photos.google.com/share/AF1QipPv_eOz9z-e8R23DkSEcMLF9ivl8est0H4k0lkAoIdY0Jgsn4eyKT54fPyy4EukCw?key=RmJoNS1uOHU2djRDdzZxNGM4ZEY1dFVKamhCNThR)

---

\##News Roundup  
 \###[June HardenedBSD Foundation Update](https://hardenedbsd.org/article/shawn-webb/2018-06-09/june-hardenedbsd-foundation-update)

>
>
> We at HardenedBSD are working towards starting up a 501©(3) not-for-profit organization in the USA. Setting up this organization will allow future donations to be tax deductible. We’ve made progress and would like to share with you the current state of affairs.
>
>

>
>
> We have identified, sent invitations out, and received acceptance letters from six people who will serve on the HardenedBSD Foundation Board of Directors. You can find their bios below. In the latter half of June 2018 or the beginning half of July 2018, we will meet for the first time as a board and formally begin the process of creating the documentation needed to submit to the local, state, and federal tax services.
>
>

>
>
> Here’s a brief introduction to those who will serve on the board:
>
>

* W. Dean Freeman (Advisor): Dean has ten years of professional experience with deploying and security Unix and networking systems, including assessing systems security for government certification and assessing the efficacy of security products. He was introduced to Unix via FreeBSD 2.2.8 on an ISP shell account as a teenager. Formerly, he was the Snort port maintainer for FreeBSD while working in the Sourcefire VRT, and has contributed entropy-related patches to the FreeBSD and HardenedBSD projects – a topic on which he presented at vBSDCon 2017.

* Ben La Monica (Advisor): Ben is a Senior Technology Manager of Software Engineering at Morningstar, Inc and has been developing software for over 15 years in a variety of languages. He advocates open source software and enjoys tinkering with electronics and home automation.

* George Saylor (Advisor): George is a Technical Directory at G2, Inc. Mr. Saylor has over 28 years of information systems and security experience in a broad range of disciplines. His core focus areas are automation and standards in the event correlation space as well as penetration and exploitation of computer systems. Mr Saylor was also a co-founder of the OpenSCAP project.

* Virginia Suydan (Accountant and general administrator): Accountant and general administrator for the HardenedBSD Foundation. She has worked with Shawn Webb for tax and accounting purposes for over six years.

* Shawn Webb (Director): Co-founder of HardenedBSD and all-around infosec wonk. He has worked and played in the infosec industry, doing both offensive and defensive research, for around fifteen years. He loves open source technologies and likes to frustrate the bad guys.

* Ben Welch (Advisor): Ben is currently a Security Engineer at G2, Inc. He graduated from Pennsylvania College of Technology with a Bachelors in Information Assurance and Security. Ben likes long walks, beaches, candlelight dinners, and attending various conferences like BSides and ShmooCon.

---

\###[Your own VPN with OpenIKED & OpenBSD](https://medium.com/@cmacrae/your-own-vpn-with-openiked-openbsd-13d7abd3d1d4)

>
>
> Remote connectivity to your home network is something I think a lot of people find desirable. Over the years, I’ve just established an SSH tunnel and use it as a SOCKS proxy, sending my traffic through that. It’s a nice solution for a “poor man’s VPN”, but it can be a bit clunky, and it’s not great having to expose SSH to the world, even if you make sure to lock everything down
>
>

>
>
> I set out the other day to finally do it properly. I’d come across this great post by Gordon Turner: [OpenBSD 6.2 VPN Endpoint for iOS and macOS](https://blog.gordonturner.com/2018/02/25/openbsd-6-2-vpn-endpoint-for-ios-and-macos/)
>
>

>
>
> Whilst it was exactly what I was looking for, it outlined how to set up an L2TP VPN. Really, I wanted IKEv2 for performance and security reasons (I won’t elaborate on this here, if you’re curious about the differences, there’s a lot of content out on the web explaining this).
>
>

>
>
> The client systems I’d be using have native support for IKEv2 (iOS, macOS, other BSD systems). But, I couldn’t find any tutorials in the same vein.
>
>

>
>
> So, let’s get stuck in!
>
>

* A quick note ✍️

>
>
> This guide will walk through the set up of an IKEv2 VPN using OpenIKED on OpenBSD. It will detail a “road warrior” configuration, and use a PSK (pre-shared-key) for authentication. I’m sure it can be easily adapted to work on any other platforms that OpenIKED is available on, but keep in mind my steps are specifically for OpenBSD.
>
>

* Server Configuration

>
>
> As with all my home infrastructure, I crafted this set-up declaratively. So, I had the deployment of the VM setup in Terraform (deployed on my private Triton cluster), and wrote the configuration in Ansible, then tied them together using radekg/terraform-provisioner-ansible.
>
>

>
>
> One of the reasons I love Ansible is that its syntax is very simplistic, yet expressive. As such, I feel it fits very well into explaining these steps with snippets of the playbook I wrote. I’ll link the full playbook a bit further down for those interested.
>
>

* See the full article for the information on:
* sysctl parameters
* The naughty list (optional)
* Configure the VPN network interface
* Configure the firewall
* Configure the iked service
* Gateway configuration
* Client configuration
* Troubleshooting

---

**DigitalOcean**

\###[FreeBSD on a System76 Galago Pro](https://corrupted.io/2018/05/15/system76-free-bsd.html)

>
>
> Hey all, It’s been a while since I last posted but I thought I would hammer something out here. My most recent purchase was a System76 Galago Pro. I thought, afer playing with POP! OS a bit, is there any reason I couldn’t get BSD on this thing. Turns out the answer is no, no there isnt and it works pretty decently.
>
>

>
>
> To get some accounting stuff out of the way I tested this all on FreeBSD Head and 11.1, and all of it is valid as of May 10, 2018. Head is a fast moving target so some of this is only bound to improve.
>
>

* The hardware

* Intel Core i5 Gen 8

* UHD Graphics 620

* 16 GB DDR4 Ram

* RTL8411B PCI Express Card Reader

* RTL8111 Gigabit ethernet controller

* Intel HD Audio

* Samsung SSD 960 PRO 512GB NVMe

* The caveats

>
>
> There are a few things that I cant seem to make work straight out of the box, and that is the SD Card reader, the backlight, and the audio is a bit finicky. Also the trackpad doesn’t respond to two finger scrolling. The wiki is mostly up to date, there are a few edits that need to be made still but there is a bug where I cant register an account yet so I haven’t made all the changes.
>
>

* Processor

>
>
> It works like any other Intel processor. Pstates and throttling work.
>
>

* Graphics

>
>
> The boot menu sets itself to what looks like 1024x768, but works as you expect in a tiny window. The text console does the full 3200x1800 resolution, but the text is ultra tiny. There isnt a font for the console that covers hidpi screens yet. As for X Windows it requres the drm-kmod-next package. Once installed follow the directions from the package and it works with almost no fuss. I have it running on X with full intel acceleration, but it is running at it’s full 3200x1800 resolution, to scale that down just do xrandr --output eDP-1 --scale 0.5x0.5 it will blow it up to roughly 200%. Due to limitations with X windows and hidpi it is harder to get more granular.
>
>

* Intel Wireless 8265

>
>
> The wireless uses the iwm module, as of right now it does not seem to automagically load right now. Adding iwm\_load=“YES” will cause the module to load on boot and kldload iwm
>
>

* Battery

>
>
> I seem to be getting about 5 hours out of the battery, but everything reports out of the box as expected. I could get more by throttling the CPU down speed wise.
>
>

* Overall impression

>
>
> It is a pretty decent experience. While not as polished as a Thinkpad there is a lot of potential with a bit of work and polishing. The laptop itself is not bad, the keyboard is responsive. The build quality is pretty solid. My only real complaint is the trackpad is stiff to click and sort of tiny. They seem to be a bit indifferent to non linux OSes running on the gear but that isnt anything new. I wont have any problems using it and is enough that when I work through this laptop, but I’m not sure at this stage if my next machine will be a System76 laptop, but they have impressed me enough to put them in the running when I go to look for my next portable machine but it hasn’t yet replaced the hole left in my heart by lenovo messing with the thinkpad.
>
>

---

\###[Hardware accelerated AES/HMAC-SHA on octeons](https://undeadly.org/cgi?action=article;sid=20180418073437)

```
In this commit, visa@ submitted code (disabled for now) to use built-in acceleration on octeon CPUs, much like AESNI for x86s.

I decided to test tcpbench(1) and IPsec, before and after updating and enabling the octcrypto(4) driver.

I didn't capture detailed perf stats from before the update, I had heard someone say that Edgerouter Lite boxes would only do some 6MBit/s over ipsec, so I set up a really simple ipsec.conf with ike esp from A to B leading to a policy of

esp tunnel from A to B spi 0xdeadbeef auth hmac-sha2-256 enc aes
going from one ERL to another (I collect octeons, so I have a bunch to test with) and let tcpbench run for a while on it. My numbers hovered around 7Mbit/s, which coincided with what I've heard, and also that most of the CPU gets used while doing it.
Then I edited /sys/arch/octeon/conf/GENERIC, removed the # from octcrypto0 at mainbus0 and recompiled. Booted into the new kernel and got a octcrypto0 line in dmesg, and it was time to rock the ipsec tunnel again. The crypto algorithm and HMAC used by default on ipsec coincides nicely with the list of accelerated functions provided by the driver.

Before we get to tunnel traffic numbers, just one quick look at what systat pigs says while the ipsec is running at full steam:

     PID USER        NAME                 CPU     20\    40\    60\    80\  100\
   58917 root        crypto             52.25 #################
   42636 root        softnet            42.48 ##############
                     (idle)             29.74 #########
    1059 root        tcpbench           24.22 #######
   67777 root        crynlk             19.58 ######
So this indicates that the load from doing ipsec and generating the traffic is somewhat nicely evened out over the two cores in the Edgerouter, and there's even some CPU left unused, which means I can actually ssh into it and have it usable. I have had it running for almost 2 days now, moving some 2.1TB over the tunnel.
Now for the new and improved performance numbers:

   204452123        4740752       37.402  100.00%
Conn:   1 Mbps:       37.402 Peak Mbps:       58.870 Avg Mbps:       37.402
   204453149        4692968       36.628  100.00%
Conn:   1 Mbps:       36.628 Peak Mbps:       58.870 Avg Mbps:       36.628
   204454167        5405552       42.480  100.00%
Conn:   1 Mbps:       42.480 Peak Mbps:       58.870 Avg Mbps:       42.480
   204455188        5202496       40.804  100.00%
Conn:   1 Mbps:       40.804 Peak Mbps:       58.870 Avg Mbps:       40.804
   204456194        5062208       40.256  100.00%
Conn:   1 Mbps:       40.256 Peak Mbps:       58.870 Avg Mbps:       40.256

The tcpbench numbers fluctuate up and down a bit, but the output is nice enough to actually keep tabs on the peak values. Peaking to 58.8MBit/s! Of course, as you can see, the average is lower but nice anyhow.

A manyfold increase in performance, which is good enough in itself, but also moves the throughput from a speed that would make a poor but cheap gateway to something actually useful and decent for many home network speeds. Biggest problem after this gets enabled will be that my options to buy cheap used ERLs diminish.

```

---

\##Beastie Bits

* [Using FreeBSD Text Dumps](http://www.etinc.com/122/Using-FreeBSD-Text-Dumps)
* [llvm’s lld now the default linker for amd64 on FreeBSD](https://svnweb.freebsd.org/base?view=revision&revision=334391)
* [Author Discoverability](https://blather.michaelwlucas.com/archives/3194)
* [Pledge and Unveil in OpenBSD {pdf}](https://www.openbsd.org/papers/BeckPledgeUnveilBSDCan2018.pdf)
* [EuroBSDCon 2018 CFP Closes June 17, hurry up and get your submissions in](https://2018.eurobsdcon.org/call-for-papers/)
* [Just want to attend, but need help getting to the conference? Applications for the Paul Schenkeveld travel grant accepted until June 15th](https://2018.eurobsdcon.org/paul-schenkeveld-travel-grant/)

---

**Tarsnap**

\##Feedback/Questions

* Casey - [ZFS on Digital Ocean](http://dpaste.com/2H42V7W#wrap)
* Jürgen - [A Question](http://dpaste.com/3N7ZN8C#wrap)
* Kevin - [Failover best practice](http://dpaste.com/231CY5Z#wrap)
* Dennis - [SQL](http://dpaste.com/1QPNB25#wrap)

---

* Send questions, comments, show ideas/topics, or stories you want mentioned on the show to [feedback@bsdnow.tv](mailto:feedback@bsdnow.tv)