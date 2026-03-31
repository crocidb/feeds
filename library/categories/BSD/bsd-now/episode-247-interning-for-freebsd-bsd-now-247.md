+++
title = "Episode 247: Interning for FreeBSD | BSD Now 247"
description = "FreeBSD internship learnings, exciting developments coming to FreeBSD, running FreeNAS on DigitalOcean, Network Manager control for OpenBSD, OpenZFS User Conference Videos are here and batch editing files with ed.Headlines[What I learned during my FreeBSD intership]"
date = "2018-05-24T19:00:00Z"
url = "https://www.bsdnow.tv/247"
author = "feedback@bsdnow.tv (JT Pennington)"
text = ""
lastupdated = "2026-03-26T14:37:50.753329358Z"
seen = true
+++

FreeBSD internship learnings, exciting developments coming to FreeBSD, running FreeNAS on DigitalOcean, Network Manager control for OpenBSD, OpenZFS User Conference Videos are here and batch editing files with ed.

Headlines
----------

### [What I learned during my FreeBSD intership](https://www.freebsdfoundation.org/blog/guest-blog-what-i-learned-during-my-freebsd-internship/) ###

>
>
> Hi, my name is Mitchell Horne. I am a computer engineering student at the University of Waterloo, currently in my third year of studies, and fortunate to have been one of the FreeBSD Foundation’s co-op students this past term (January to April). During this time I worked under Ed Maste, in the Foundation’s small Kitchener office, along with another co-op student Arshan Khanifar. My term has now come to an end, and so I’d like to share a little bit about my experience as a newcomer to FreeBSD and open-source development.
>
>
>
> I’ll begin with some quick background — and a small admission of guilt. I have been an open-source user for a large part of my life. When I was a teenager I started playing around with Linux, which opened my eyes to the wider world of free software. Other than some small contributions to GNOME, my experience has been mostly as an end user; however, the value of these projects and the open-source philosophy was not lost on me, and is most of what motivated my interest in this position. Before beginning this term I had no personal experience with any of the BSDs, although I knew of their existence and was extremely excited to receive the position. I knew it would be a great opportunity for growth, but I must confess that my naivety about FreeBSD caused me to make the silent assumption that this would be a form of compromise — a stepping stone that would eventually allow me to work on open-source projects that are somehow “greater” or more “legitimate”. After four months spent immersed in this project I have learned how it operates, witnessed its community, and learned about its history. I am happy to admit that I was completely mistaken. Saying it now seems obvious, but FreeBSD is a project with its own distinct uses, goals, and identity. For many there may exist no greater opportunity than to work on FreeBSD full time, and with what I know now I would have a hard time coming up with a project that is more “legitimate”.
>
>

* What I Liked

>
>
> In all cases, the work I submitted this term was reviewed by no less than two people before being committed. The feedback and criticism I received was always both constructive and to the point, and it commented on everything from high-level ideas to small style issues. I appreciate having these thorough reviews in place, since I believe it ultimately encourages people to accept only their best work. It is indicative of the high quality that already exists within every aspect of this project, and this commitment to quality is something that should continue to be honored as a core value. As I’ve discovered in some of my previous work terms, it is all too easy cut corners in the name of a deadline or changing priorities, but the fact that FreeBSD doesn’t need to make these types of compromises is a testament to the power of free software.
>
>
>
> It’s a small thing, but the quality and completeness of the FreeBSD documentation was hugely helpful throughout my term. Everything you might need to know about utilities, library functions, the kernel, and more can be found in a man page; and the handbook is a great resource as both an introduction to the operating system and a reference. I only wish I had taken some time earlier in the term to explore the different documents more thoroughly, as they cover a wide range of interesting and useful topics. The effort people put into writing and maintaining FreeBSD’s documentation is easy to overlook, but its value cannot be overstated.
>
>

* What I Learned

>
>
> Although there was a lot I enjoyed, there were certainly many struggles I faced throughout the term, and lessons to be learned from them. I expect that some of issues I faced may be specific to FreeBSD, while others may be common to open-source projects in general. I don’t have enough experience to speculate on which is which, so I will leave this to the reader.
>
>
>
> The first lesson can be summed up simply: you have to advocate for your own work. FreeBSD is made up in large part by volunteer efforts, and in many cases there is more work to go around than people available to do it. A consequence of this is that there will not be anybody there to check up on you. Even in my position where I actually had a direct supervisor, Ed often had his plate full with so many other things that the responsibility to find someone to look at my work fell to me. Admittedly, a couple of smaller changes I worked on got left behind or stuck in review simply because there wasn’t a clear person/place to reach out to.
>
>
>
> I think this is both a barrier of entry to FreeBSD and a mental hurdle that I needed to get over. If there’s a change you want to see included or reviewed, then you may have to be the one to push for it, and there’s nothing wrong with that. Perhaps this process should be easier for newcomers or infrequent contributors (the disconnect between Bugzilla and Phabricator definitely leaves a lot to be desired), but we also have to be aware that this simply isn’t the reality right now. Getting your work looked at may require a little bit more self-motivation, but I’d argue that there are much worse problems a project like FreeBSD could have than this.
>
>
>
> I understand this a lot better now, but it is still something I struggle with. I’m not naturally the type of person who easily connects with others or asks for help, so I see this as an area for future growth rather than simply a struggle I encountered and overcame over the course of this work term. Certainly it is an important skill to understand the value of your own work, and equally important is the ability to communicate that value to others.
>
>
>
> I also learned the importance of starting small. My first week or two on the job mainly involved getting set up and comfortable with the workflow. After this initial stage, I began exploring the project and found myself overwhelmed by its scale. With so many possible areas to investigate, and so much work happening at once, I felt quite lost on where to begin. Many of the potential projects I found were too far beyond my experience level, and most small bugs were picked up and fixed quickly by more experienced contributors before I could even get to them.
>
>
>
> It’s easy to make the mistake that FreeBSD is made up solely of a few rock-star committers that do everything. This is how it appears at face-value, as reading through commits, bug reports, and mailing lists yields a few of the same names over and over. The reality is that just as important are the hundreds of users and infrequent contributors who take the time to submit bug reports, patches, or feedback. Even though there are some people who would fall under the umbrella of a rock-star committer, they didn’t get there overnight. Rather, they have built their skills and knowledge through many years of involvement in FreeBSD and similar projects.
>
>
>
> As a student coming into this project and having high expectations of myself, it was easy to set the bar too high by comparing myself against those big committers, and feel that my work was insignificant, inadequate, and simply too infrequent. In reality, there is no reason I should have felt this way. In a way, this comparison is disrespectful to those who have reached this level, as it took them a long time to get there, and it’s a humbling reminder that any skill worth learning requires time, patience, and dedication. It is easy to focus on an end product and simply wish to be there, but in order to be truly successful one must start small, and find satisfaction in the struggle of learning something new. I take pride in the many small successes I’ve had throughout my term here, and appreciate the fact that my journey into FreeBSD and open-source software is only just beginning.
>
>

* Closing Thoughts

>
>
> I would like to close with some brief thank-you’s. First, to everyone at the Foundation for being so helpful, and allowing this position to exist in the first place. I am extremely grateful to have been given this unique opportunity to learn about and give back to the open-source world. I’d also like to thank my office mates; Ed: for being an excellent mentor, who offered an endless wealth of knowledge and willingness to share it. My classmate and fellow intern Arshan: for giving me a sense of camaraderie and the comforting reminder that at many moments he was as lost as I was. Finally, a quick thanks to everyone else I crossed paths with who offered reviews and advice. I appreciate your help and look forward to working with you all further.
>
>
>
> I am walking away from this co-op with a much greater appreciation for this project, and have made it a goal to remain involved in some capacity. I feel that I’ve gained a little bit of a wider perspective on my place in the software world, something I never really got from my previous co-ops. Whether it ends up being just a stepping stone, or the beginning of much larger involvement, I thoroughly enjoyed my time here.
>
>

---

### Recent Developments in FreeBSD ###

* [Support for encrypted, compressed (gzip and zstd), and network crash dumps enabled by default on most platforms](https://svnweb.freebsd.org/base?view=revision&revision=333890)
* [Intel Microcode Splitter](https://svnweb.freebsd.org/base?view=revision&revision=333649)
* [Intel Spec Store Bypass Disable control](https://svnweb.freebsd.org/base?view=revision&revision=334005)
* [Raspberry Pi 3B+ Ethernet Driver](https://svnweb.freebsd.org/base?view=revision&revision=333713)
* [IBRS for i386](https://reviews.freebsd.org/D15522)
* Upcoming:
* [Microcode updater for AMD CPUs](https://reviews.freebsd.org/D15523)
* [the RACK TCP/IP stack, from Netflix](https://reviews.freebsd.org/D15525)
* Voting in the FreeBSD Core Election begins today:

---

**DigitalOcean** [Digital Ocean Promo Link for BSD Now Listeners](http://do.co/bsdnow)

---

### [Running FreeNAS on a DigitalOcean Droplet](http://www.shlomimarco.com/blog/running-freenas-on-a-digitalocean-droplet) ###

* Need to backup your FreeNAS offsite? Run a locked down instance in the cloud, and replicate to it
* The tutorial walks though the steps of converting a fresh FreeBSD based droplet into a FreeNAS
* Create a droplet, and add a small secondary block-storage device
* Boot the droplet, login, and download FreeNAS
* Disable swap, enable ‘foot shooting’ mode in GEOM
* use dd to write the FreeNAS installer to the boot disk
* Reboot the droplet, and use the FreeNAS installer to install FreeNAS to the secondary block storage device
* Now, reimage the droplet with FreeBSD again, to replace the FreeNAS installer
* Boot, and dd FreeNAS from the secondary block storage device back to the boot disk
* You can now destroy the secondary block device
* Now you have a FreeNAS, and can take it from there.
* Use the FreeNAS replication wizard to configure sending snapshots from your home NAS to your cloud NAS
* Note: You might consider creating a new block storage device to create a larger pool, that you can more easily grow over time, rather than using the boot device in the droplet as your main pool.

---

News Roundup
----------

### [Network Manager Control for OpenBSD (Updated)](http://www.vincentdelft.be/post/post_20180411) ###

* Generalities
* I just remind the scope of this small tool:

  * allow you to pre-define several cable or wifi connections
  * let nmctl to connect automatically to the first available one
  * allow you to easily switch from one network connection to an other one
  * create openbox dynamic menus

* Enhancements in this version

>
>
> This is my second development version: 0.2. I've added performed several changes in the code:
>
>

* code style cleanup, to better match the python recommendations
* adapt the tool to allow to connect to an Open-wifi having blancs in the name. This happens in some hotels
* implement a loop as work-around concerning the arp table issue.

>
>
> The source code is still on the git of Sourceforge.net. You can see the files [here](https://sourceforge.net/p/nmctl/code/ci/master/tree/)
>
>
>
> And you can download the last version [here](https://sourceforge.net/p/nmctl/code/ci/master/tarball)
>
>

* Feedbacks after few months

>
>
> I'm using this script on my OpenBSD laptop since about 5 months. In my case, I'm mainly using the openbox menus and the --restart option.
>
>

* The Openbox menus

>
>
> The openbox menus are working fine. As explain in my previous blog, I just have to create 2 entries in my openbox's menu.xml file, and all the rest comes automatically from nmctl itself thanks to the --list and --scan options. I've not changed this part of nmctl since it works as expected (for me :-) ).
>
>

* The --restart option

>
>
> Because I'm very lazy, and because OpenBSD is very simple to use, I've added the command "nmctl --restart" in the /etc/apm/resume script. Thanks to apmd, this script will be used each time I'm opening the lid of my laptop. In other words, each time I'll opening my laptop, nmctl will search the optimum network connection for me. But I had several issues in this scenario. Most of the problems were linked to the arp table issues. Indeed, in some circumstances, my proxy IP address was associated to the cable interface instead of the wifi interface or vice-versa. As consequence I'm not able to connect to the proxy, thus not able to connect to internet. So the ping to google (final test nmctl perform) is failing. Knowing that anyhow, I'm doing a full arp cleanup, it's not clear for me from where this problem come from. To solve this situation I've implemented a "retry" concept. In other words, before testing an another possible network connection (as listed in my /etc/nmctl.conf file), the script try 3x the current connection's parameters. If you want to reduce or increase this figures, you can do it via the --retry parameter.
>
>

* Results of my expertise with this small tool

>
>
> Where ever I'm located, my laptop is now connecting automatically to the wifi / cable connection previously identified for this location. Currently I have 3 places where I have Wifi credentials and 2 offices places where I just have to plug the network cable. Since the /etc/apm/resume scripts is triggered when I open the lid of the laptop, I just have to make sure that I plug the RJ45 before opening the laptop. For the rest, I do not have to type any commands, OpenBSD do all what is needed ;-). I hotels or restaurants, I can just connect to the Open Wifi thanks to the openbox menu created by "nmctl --scan".
>
>

* Next steps

* Documentation

>
>
> The tool is missing lot of documentation. I appreciate OpenBSD for his great documentation, so I have to do the same. I plan to write a README and a man page at first instances. But since my laziness, I will do it as soon as I see some interest for this tool from other persons.
>
>

* Tests

>
>
> I now have to travel and see how to see the script react on the different situations. Interested persons are welcome to share with me the outcome of their tests. I'm curious how it work.
>
>

---

### [OpenBSD 6.3 on EdgeRouter Lite simple upgrade method](https://an.undulating.space/post/180411-erl-openbsd-upgrade/) ###

* TL;DR

>
>
> OpenBSD 6.3 oceton upgrade instructions may not factor that your ERL is running from the USB key they want wiped with the miniroot63.fs image loaded on. Place the bsd.rd for OpenBSD 6.3 on the sd0i slice used by U-Boot for the kernel, and then edit the boot command to run it.
>
>

* a tiny upgrade

>
>
> The OpenBSD documentation is comprehensive, but there might be rough corners around what are probably edge cases in their user base. People running EdgeRouter Lite hardware for example, who are looking to upgrade from 6.2 to 6.3. The documentation, which gave us everything we needed last time, left me with some questions about how to upgrade. In INSTALL.octeon, the Upgrading section does mention: The best solution, whenever possible, is to backup your data and reinstall from scratch I had to check if that directive existed in the documentation for other architectures. I wondered if oceton users were getting singled out. We were not. Just simplicity and pragmatism.
>
>

* Reading on:

>
>
> To upgrade OpenBSD 6.3 from a previous version, start with the general instructions in the section "Installing OpenBSD". But that section requires us to boot off of TFTP or NFS. Which I don’t want to do right now. Could also use a USB stick with the miniroot63.fs installed on it. But as the ERL only has a single USB port, we would have to remove the USB stick with the current install on it. Once we get to the Install or Upgrade prompt, there would be nothing to upgrade. Well, I guess I could use a USB hub. But the ERL’s USB port is inside the case. With all the screws in. And the tools are neatly put away. And I’d have to pull the USB hub from behind a workstation. And it’s two am. And I cleaned up the cabling in the lab this past weekend. Looks nice for once. So I don’t want to futz around with all that. There must be an almost imperceptibly easier way of doing this than setting up a TFTP server or NFS share in five minutes… Right?
>
>

---

**iXsystems** [Boise Technology Show 2018 Recap](https://www.ixsystems.com/blog/boisetechshow-2018/)

### [OpenZFS User Conference Slides & Videos](http://zfs.datto.com/) ###

* [Thank you ZFS](https://vimeo.com/album/5150026/video/266112599)
* [ZSTD Compression](https://vimeo.com/album/5150026/video/266112475)
* [Pool Layout Considerations](https://vimeo.com/album/5150026/video/266111164)
* [ZFS Releases](https://vimeo.com/album/5150026/video/266111346)
* [Helping Developers Help You](https://vimeo.com/album/5150026/video/266112077)
* [ZFS and MySQL on Linux](https://vimeo.com/album/5150026/video/266112233)
* [Micron](https://vimeo.com/album/5150026/video/266110985)
* [OSNEXUS](https://vimeo.com/album/5150026/video/266108105)
* [ZFS at Six Feet Up](https://vimeo.com/album/5150026/video/266107946)
* [Flexible Disk Use with OpenZFS](https://vimeo.com/album/5150026/video/266107372)

---

### [Batch editing files with ed](https://jvns.ca/blog/2018/05/11/batch-editing-files-with-ed/) ###

* what’s ‘ed’?

>
>
> ed is this sort of terrifying text editor. A typical interaction with ed for me in the past has gone something like this:
>
>

` $ ed help ? h ? asdfasdfasdfsadf ? <close terminal in frustration> `

>
>
> Basically if you do something wrong, ed will just print out a single, unhelpful, ?. So I’d basically dismissed ed as an old arcane Unix tool that had no practical use today. vi is a successor to ed, except with a visual interface instead of this ?
>
>

* surprise: Ed is actually sort of cool and fun

>
>
> So if Ed is a terrifying thing that only prints ? at you, why am I writing a blog post about it? WELL!!!! On April 1 this year, Michael W Lucas published a new short book called Ed Mastery. I like his writing, and even though it was sort of an april fool’s joke, it was ALSO a legitimate actual real book, and so I bought it and read it to see if his claims that Ed is actually interesting were true. And it was so cool!!!! I found out:
>
>

* how to get Ed to give you better error messages than just ?
* that the name of the grep command comes from ed syntax (g/re/p)
* the basics of how to navigate and edit files using ed

>
>
> All of that was a cool Unix history lesson, but did not make me want to actually use Ed in real life. But!!!
>
>
>
> The other neat thing about Ed (that did make me want to use it!) is that any Ed session corresponds to a script that you can replay! So if I know Ed, then I can use Ed basically as a way to easily apply vim-macro-like programs to my files.
>
>

---

Beastie Bits
----------

* [FreeBSD Mastery: Jails -- Help make it happen ](https://blather.michaelwlucas.com/archives/3186)
* [Video: OpenZFS Basics presented by George Wilson and Matt Ahrens at Scale 16x back in March 2018](https://www.youtube.com/watch?v=MsY-BafQgj4)
* [DragonFlyBSD’s IPFW gets highspeed lockless in-kernel NAT](https://www.dragonflydigest.com/2018/05/17/21257.html)
* [A Love Letter to OpenBSD](https://www.reddit.com/r/openbsd/comments/8ei00k/a_love_letter_to_openbsd/)
* [New talks, and the F-bomb](https://blather.michaelwlucas.com/archives/3176)
* [Practical UNIX Manuals: mdoc](https://manpages.bsd.lv/mdoc.html)
* [BSD Meetup in Zurich: May 24th](https://lists.freebsd.org/pipermail/freebsd-advocacy/2018-May/004758.html)
* [BSD Meetup in Warsaw: May 24th](https://www.eventbrite.com/e/the-polish-bsd-user-group-1-meetup-tickets-45941857332)
* [MeetBSD 2018](http://meetbsd.com/)

---

**Tarsnap**

Feedback/Questions
----------

* Seth - [First time poudriere Builder](http://dpaste.com/12R65X4#wrap)
* Farhan - [Why we didn't go FreeBSD](http://dpaste.com/1GHCGY5#wrap)
* architech - [Encryption Feedback](http://dpaste.com/1H72FGE#wrap)
* Dave - [Handy Tip on setting up automated coredump handling for FreeBSD](http://dpaste.com/27YH93Y#wrap)

---

* Send questions, comments, show ideas/topics, or stories you want mentioned on the show to [feedback@bsdnow.tv](mailto:feedback@bsdnow.tv)