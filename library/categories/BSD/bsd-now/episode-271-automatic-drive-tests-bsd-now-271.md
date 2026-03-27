+++
title = "Episode 271: Automatic Drive Tests | BSD Now 271"
description = 'MidnightBSD 1.0 released, MeetBSD review, EuroBSDcon trip reports, DNS over TLS in FreeBSD 12, Upgrading OpenBSD with Ansible, how to use smartd to run tests on your drives automatically, and more.\Headlines   \[MidnightBSD 1.0 now available](https://www.midnightbsd.org/news'
date = "2018-11-08T09:00:00Z"
url = "https://www.bsdnow.tv/271"
author = "feedback@bsdnow.tv (JT Pennington)"
text = ""
lastupdated = "2026-03-26T14:37:50.692034145Z"
seen = false
+++

MidnightBSD 1.0 released, MeetBSD review, EuroBSDcon trip reports, DNS over TLS in FreeBSD 12, Upgrading OpenBSD with Ansible, how to use smartd to run tests on your drives automatically, and more.

\##Headlines  
 \###[MidnightBSD 1.0 now available](https://www.midnightbsd.org/news/)

>
>
> I’m happy to announce the availability of MidnightBSD 1.0 for amd64 and i386. Over the years, many ambitious goals were set for our 1.0 release. As it approached, it was clear we wouldn’t be able to accomplish all of them. This release is more of a natural progression rather than a groundbreaking event. It includes many updates to the base system, improvements to the package manager, an updated compiler, and tools.  
>  Of particular note, you can now boot off of ZFS and use NVME SSDs and some AMD Radeon graphics cards support acceleration. AMD Ryzen support has greatly improved in this release. We also have added bhyve from FreeBSD.  
>  The 1.0 release is finally available. Still building packages for i386 and plan to do an amd64 package build later in the week. The single largest issue with the release process has been the web server performance. The CPU is overloaded and has been at solid 100% for several days. The server has a core i7 7700 in it. I’m trying to figure out what to buy as an upgrade so that we don’t continue to have this issue going forward. As it’s actually blocked in multiple processes, a 6 or 8 core chip might be an improvement for the workload…
>
>

* Download links: [https://www.midnightbsd.org/download/](https://www.midnightbsd.org/download/)
* [https://www.youtube.com/watch?time\_continue=33&v=-rlk2wFsjJ4](https://www.youtube.com/watch?time_continue=33&v=-rlk2wFsjJ4)

---

\###[MeetBSD Review](https://linuxunplugged.com/articles/meetbsd2018)

>
>
> MeetBSD 2018 took place at the sprawling Intel Santa Clara campus. The venue itself felt more like an olive branch than a simple friendly gesture by Intel. In truth it felt like a bit of an apology. You get the subtle sense they feel bad about how the BSD’s were treated with the Meltdown and Specter flaws. In fact, you may be right to think they felt a bit sorry towards the entire open source community.
>
>

* MeetBSD 2018

>
>
> At most massive venues the parking is the first concern, not so here - in fact that was rather straightforward. No, the real challenge is navigating the buildings. Luckily I had help from navigator extraordinaire, Hadea, who located the correct building, SC12 quickly. Finding the entrance took a moment or two though. The lobby itself was converted by iXsystems efficiently into the MeetBSD expo hall, clean, efficient and roomy with registration, some seating, and an extra conference room for on-on-one sessions. On day two sponsor booths were also setup. All who showed up on day one were warmly greeted with badges, lanyards and goodies by Denise and her friendly team.  
>  Like every great BSD event, plenty of food was made available. And as always they make it look effortless. These events showcase iXsystem’s inherent generosity toward its community; with breakfast items in the back of the main auditorium room in the morning, boxed lunches, fruit and cookies at lunch time, and snacks for the rest of the day. But just in case your still hungry, there is a pizza meetup in another Intel room after day one and two.  
>  MeetBSD leverages it’s realistically small crowd size on day one. The morning starts off with introductions of the entire group, the mic is passed around the room.  
>  The group is a good mix of pros in the industry (such as Juniper, Intel, Ebay, Groupon, Cisco, etc), iX staff, and a few enthusiast. Lots of people with a focus or passion for networking. And, of course, some friendly Linux bashing went down for good measure, always followed by a good natured chuckle.
>
>

* MeetBSD Gives me The Feels

>
>
> I find that I am subtly unnerved at this venue, and at lunch I saw it clearly. I have always had a strong geek radar, allowing me to navigate a new area (like Berkeley for MeetBSD of 2016, or even SCALE earlier this year in Pasadena), and in a glance I can see who is from my conference and who isn’t. This means it is easy, nearly effortless to know who to greet with a smile and a wave. These are MY people. Here at the Intel campus though it is different. The drive in alone reveals behemoth complexes all with well known tech names prominently displayed. This is Silicon Valley, and all of these people look like MY people. So much for knowing who’s from my conference. Thank goodness for those infamous BSD horns. None-the-less I am struck by how massive these tech giants are. And Intel is one of the largest of those giants, and see the physical reminders of this fact brought home the significance that they had opened their doors, wifi, and bathrooms to the BSD community.
>
>

---

\###[EuroBSDcon 2018 Trip Reports]  
[https://www.freebsdfoundation.org/blog/eurobsd-2018-trip-report-joseph-mingrone/](https://www.freebsdfoundation.org/blog/eurobsd-2018-trip-report-joseph-mingrone/)  
[https://www.freebsdfoundation.org/blog/eurobsd-2018-trip-report-vinicius-zavam/](https://www.freebsdfoundation.org/blog/eurobsd-2018-trip-report-vinicius-zavam/)  
[https://www.freebsdfoundation.org/blog/eurobsd-2018-trip-report-emmanuel-vadot/](https://www.freebsdfoundation.org/blog/eurobsd-2018-trip-report-emmanuel-vadot/)

---

\##News Roundup  
 \###[DNS over TLS in FreeBSD 12](https://blog.des.no/2018/10/dns-over-tls-in-freebsd-12/)

>
>
> With the arrival of OpenSSL 1.1.1, an upgraded Unbound, and some changes to the setup and init scripts, FreeBSD 12.0, currently in beta, now supports DNS over TLS out of the box.  
>  DNS over TLS is just what it sounds like: DNS over TCP, but wrapped in a TLS session. It encrypts your requests and the server’s replies, and optionally allows you to verify the identity of the server. The advantages are protection against eavesdropping and manipulation of your DNS traffic; the drawbacks are a slight performance degradation and potential firewall traversal issues, as it runs over a non-standard port (TCP port 853) which may be blocked on some networks. Let’s take a look at how to set it up.
>
>

* Conclusion

>
>
> We’ve seen how to set up Unbound—specifically, the local\_unbound service in FreeBSD 12.0—to use DNS over TLS instead of plain UDP or TCP, using Cloudflare’s public DNS service as an example. We’ve looked at the performance impact, and at how to ensure (and verify) that Unbound validates the server certificate to prevent man-in-the-middle attacks.  
>  The question that remains is whether it is all worth it. There is undeniably a performance hit, though this may improve with TLS 1.3. More importantly, there are currently very few DNS-over-TLS providers—only one, really, since Quad9 filter their responses—and you have to weigh the advantage of encrypting your DNS traffic against the disadvantage of sending it all to a single organization. I can’t answer that question for you, but I can tell you that the parameters are evolving quickly, and if your answer is negative today, it may not remain so for long. More providers will appear. Performance will improve with TLS 1.3 and QUIC. Within a year or two, running DNS over TLS may very well become the rule rather than the experimental exception.
>
>

---

\###[Upgrading OpenBSD with Ansible](https://chown.me/blog/upgrading-openbsd-with-ansible.html)

* My router runs OpenBSD -current

>
>
> A few months ago, I needed software that had just hit the ports tree. I didn’t want to wait for the next release, so I upgraded my router to use -current. Since then, I’ve continued running -current, which means upgrading to a newer snapshot every so often. Running -current is great, but the process of updating to a newer snapshot was cumbersome. Initially, I had to plug in a serial cable and then reboot into bsd.rd, hit enter ten times, then reboot, run sysmerge and update packages.  
>  I eventually switched to upobsd to be able to upgrade without the need for a serial connection. The process was better, but still tiresome. Usually, I would prepare the special version of bsd.rd, boot on bsd.rd, and do something like wash the dishes in the meantime. After about ten minutes, I would dry my hands and then go back to my workstation to see whether the bsd.rd part had finished so I could run sysmerge and pkg\_add, and then return to the dishes while it upgraded packages.  
>  Out of laziness, I thought: “I should automate this,” but what happened instead is that I simply didn’t upgrade that machine very often. (Yes, laziness). With my router out of commission, life is very dull, because it is my gateway to the Internet. Even services hosted at my place (like my Mastodon instance) are not reachable when the router is down because I use multiple VLANs (so I need the router to jump across VLANs).
>
>

* Ansible Reboot Module

>
>
> I recently got a new job, and one of my first tasks was auditing the Ansible roles written by my predecessors. In one role, the machine rebooted and they used the wait\_for\_connection module to wait for it to come back up. That sounded quite hackish to me, so out of curiosity, I tried to determine whether there was a better way. I also thought I might be able to use something similar to further automate my OpenBSD upgrades, and wanted to assess the cleanliness of this method. ;-)  
>  I learned that with the then-upcoming 2.7 Ansible release, a proper reboot module would be included. I went to the docs, which stated that for a certain parameter:  
>  I took this to mean that there was no support for OpenBSD. I looked at the code and, indeed, there was not. However, I believed that it wouldn’t be too hard to add it. I added the missing pieces for OpenBSD, tested it on my poor Pine64 and then submitted it upstream. After a quick back and forth, the module’s author merged it into devel (having a friend working at Red Hat helped the process, merci Cyril !) A couple days later, the release engineer merged it into stable-2.7.  
>  I proceeded to actually write the playbook, and then I hit a bug. The parameter reboot\_timeout was not recognized by Ansible. This feature would definitely be useful on a slow machine (such as the Pine64 and its dying SD card). Again, my fix was merged into master by the module’s author and then merged into stable-2.7. 2.7.1 will be the first release to feature these fixes, but if you use OpenBSD -current, you already have access to them. I backported the patches when I updated ansible.  
>  Fun fact about Ansible and reboots: “The win\_reboot module was […] included with Ansible 2.1,” while for unix systems it wasn’t added until 2.7. :D For more details, you can read the module’s author blog article.
>
>

* The explanations

>
>
> Ansible runs my script on the remote host to fetch the sets. It creates an answer file from the template and then gives it to upobsd. Once upobsd has created the kernel, Ansible copies it in place of /bsd on the host. The router reboots and boots on /bsd, which is upobsd’s bsd.rd. The installer runs in auto\_update mode. Once it comes back from bsd.rd land, it archives the kernel and finishes by upgrading all the packages.  
>  It also supports upgrading without fetching the sets ahead of time. For instance, I upgrade this way on my Pine64 because if I cared about speed, I wouldn’t use this weak computer with its dying SD card. For this case, I just comment out the path\_sets variable and Ansible instead creates an answer file that will instruct the installer to fetch the sets from the designated mirror.  
>  I’ve been archiving my kernels for a few years. It’s a nice way to fill up / keep a history of my upgrades. If I spot a regression, I can try a previous kernel … which may not work with the then-desynchronized userland, but that’s another story.  
>  sysmerge already runs with rc.sysmerge in batch mode and sends the result by email. I don’t think there’s merit to running it again in the playbook. The only perk would be discovering in the terminal whether any files need to be manually merged, rather than reading exactly the same output in the email.  
>  Initially, I used the openbsd\_pkg module, but it doesn’t work on -current just before a release because pkg\_add automatically looks for pub/OpenBSD/${release}/packages/${arch} (which is empty). I wrote and tested this playbook while 6.4 was around the corner, so I switched to command to be able to pass the -Dsnap parameter.
>
>

* The result

>
>
> I’m very happy with the playbook! It performs the upgrade with as little intervention as possible and minimal downtime. \\o/
>
>

---

\###[Using smartd to automatically run tests on your drives](https://dan.langille.org/2018/11/04/using-smartd-to-automatically-run-tests-on-your-drives/)

>
>
> Those programs can “control and monitor storage systems using the Self-Monitoring, Analysis and Reporting Technology System (SMART) built into most modern ATA/SATA, SCSI/SAS and NVMe disks. In many cases, these utilities will provide advanced warning of disk degradation and failure.” See the smartmontools website for more information.
>
>

>
>
> NOTE: “Due to OS-specific issues and also depending on the different state of smartmontools development on the platforms, device support is not the same for all OS platforms.” – use the documentation for your OS.
>
>

>
>
> I first started using smartd in March 2010 (according to that blog post, that’s when I still writing on both The FreeBSD Diary and this blog). Back then, and until recently, all I did was start smartd. As far as I can tell, all it did was send daily status messages via the FreeBSD periodic tools. I would set my drive devices via daily\_status\_smart\_devices in /etc/periodic.conf and the daily status reports would include drive health information.
>
>

* Two types of tests
* My original abandoned attempt
* How do you prove it works?
* Looking at the test results
* Failed drive to the rescue
* smartd.conf I am using
* supernews

---

\##Beastie Bits

* [Decent Pics of “Relayd & Httpd Mastery” signature](https://mwl.io/archives/3833)
* [A Unix Shell poster from 1983](https://twitter.com/0xUID/status/1051208357850345472?s=20)
* [Cambridge UNIX historians (Cambridge, United Kingdom)](https://www.meetup.com/UNIX-historians/)
* [Goals for FreeBSD 13](https://hackmd.io/Yv46aOjTS0eYk0m4YLXOTw#)
* [September/October 2018 Issue of the FreeBSD Journal Now Available](https://www.freebsdfoundation.org/blog/september-october-2018-issue-of-the-freebsd-journal-now-available/)
* [Using acme.sh for Let’s Encrypt certificates on pkgsrc.org servers](https://blog.netbsd.org/tnf/entry/using_acme_sh_for_let)
* [Deploying Anycast DNS Using OpenBSD and BGP](https://jonwillia.ms/2018/09/23/anycast-dns-openbsd)
* [How to check your data integrity?](https://dataswamp.org/~solene/2017-03-17-integrity.html)

---

\##Feedback/Questions

* Raymond - [MeetBSD California](http://dpaste.com/0KNXTJF)
  * Dev Summit Videos: [https://www.youtube.com/playlist?list=PLb87fdKUIo8TNG6f94xo9\_W-XXrEbqgWI](https://www.youtube.com/playlist?list=PLb87fdKUIo8TNG6f94xo9_W-XXrEbqgWI)
  * Conference Videos: [https://www.youtube.com/playlist?list=PLb87fdKUIo8Q41aoPE6vssP-uF4dxk86b](https://www.youtube.com/playlist?list=PLb87fdKUIo8Q41aoPE6vssP-uF4dxk86b)
  * Conference videos are still being processed, the rest should appear over the next few weeks.

* Greg - [Stable vs Release](http://dpaste.com/1W29RSK)  
* Mjrodriguez - [Open/FreeBSD support for Single Board computers](http://dpaste.com/2XKMR6B#wrap)  

---

* Send questions, comments, show ideas/topics, or stories you want mentioned on the show to [feedback@bsdnow.tv](mailto:feedback@bsdnow.tv)

---