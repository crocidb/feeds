+++
title = "Episode 253: Silence of the Fans | BSD Now 253"
description = '''Fanless server setup with FreeBSD, NetBSD on pinebooks, another BSDCan trip report, transparent network audio, MirBSD's Korn Shell on Plan9, static site generators on OpenBSD, and more.\Headlines   \[Silent Fanless FreeBSD Desktop/Server](https://vermaden.wordpress.com/2018/'''
date = "2018-07-05T11:00:00Z"
url = "https://www.bsdnow.tv/253"
author = "feedback@bsdnow.tv (JT Pennington)"
text = ""
lastupdated = "2026-03-26T14:37:50.738123900Z"
seen = true
+++

Fanless server setup with FreeBSD, NetBSD on pinebooks, another BSDCan trip report, transparent network audio, MirBSD's Korn Shell on Plan9, static site generators on OpenBSD, and more.

\##Headlines  
 \###[Silent Fanless FreeBSD Desktop/Server](https://vermaden.wordpress.com/2018/06/07/silent-fanless-freebsd-desktop-server/)

>
>
> Today I will write about silent fanless FreeBSD desktop or server computer … or NAS … or you name it, it can have multiple purposes. It also very low power solution, which also means that it will not overheat. Silent means no fans at all, even for the PSU. The format of the system should also be brought to minimum, so Mini-ITX seems best solution here.
>
>

>
>
> I have chosen Intel based solutions as they are very low power (6-10W), if you prefer AMD (as I often do) the closest solution in comparable price and power is Biostar A68N-2100 motherboard with AMD E1-2100 CPU and 9W power. Of course AMD has even more low power SoC solutions but finding the Mini-ITX motherboard with decent price is not an easy task. For comparison Intel has lots of such solutions below 6W whose can be nicely filtered on the [ark.intel.com](http://ark.intel.com) page. Pity that AMD does not provide such filtration for their products. I also chosen AES instructions as storage encryption (GELI on FreeBSD) today seems as obvious as HTTPS for the web pages.
>
>

* [Here is how the system look powered up and working](https://vermaden.files.wordpress.com/2018/06/itx-mobo.jpg)

>
>
> This motherboard uses Intel J3355 SoC which uses 10W and has AES instructions. It has two cores at your disposal but it also supports VT-x and EPT extensions so you can even run Bhyve on it.
>
>

* Components

>
>
> Now, an example system would look like that one below, here are the components with their prices.
>
>

* $49 CPU/Motherboard ASRock J3355B-ITX Mini-ITX
* $14 RAM Crucial 4 GB DDR3L 1.35V (low power)
* $17 PSU 12V 160W Pico (internal)
* $11 PSU 12V 96W FSP (external)
* $5 USB 2.0 Drive 16 GB ADATA
* $4 USB Wireless 802.11n
* $100 TOTAL

>
>
> The PSU 12V 160W Pico (internal) and PSU 12V 96W FSP can be purchased on [aliexpress.com](http://aliexpress.com) or [ebay.com](http://ebay.com) for example, at least I got them there. Here is the 12V 160W Pico (internal) PSU and its optional additional cables to power the optional HDDs. If course its one SATA power and one MOLEX power so additional MOLEX-SATA power adapter for about 1$ would be needed. Here is the 12V 96W FSP (external) PSU without the power cord.
>
>

>
>
> This gives as total silent fanless system price of about $120. Its about ONE TENTH OF THE COST of the cheapest FreeNAS hardware solution available – the FreeNAS Mini (Diskless) costs $1156 also without disks.
>
>

>
>
> You can put plain FreeBSD on top of it or Solaris/Illumos distribution OmniOSce which is server oriented. You can use prebuilt NAS solution based on FreeBSD like FreeNAS, NAS4Free, ZFSguru or even Solaris/Illumos based storage with napp-it appliance.
>
>

---

\###[An annotated look at a NetBSD Pinebook’s startup](https://blog.netbsd.org/tnf/entry/pinebook)

* Pinebook is an affordable 64-bit ARM notebook. Today we’re going to take a look at the kernel output at startup and talk about what hardware support is available on NetBSD.
* [Photo](https://twitter.com/jmcwhatever/status/998258710496628736/photo/1)
* Pinebook comes with 2GB RAM standard. A small amount of this is reserved by the kernel and framebuffer.
* NetBSD uses flattened device-tree (FDT) to enumerate devices on all Allwinner based SoCs. On a running system, you can inspect the device tree using the ofctl(8) utility:
* Pinebook’s Allwinner A64 processor is based on the ARM Cortex-A53. It is designed to run at frequencies up to 1.2GHz.
* The A64 is a quad core design. NetBSD’s aarch64 pmap does not yet support SMP, so three cores are disabled for now.
* The interrupt controller is a standard ARM GIC-400 design.
* Clock drivers for managing PLLs, module clock dividers, clock gating, software resets, etc. Information about the clock tree is exported in the hw.clk sysctl namespace (root access required to read these values).

```
# sysctl hw.clk.sun50ia64ccu0.mmc2
hw.clk.sun50ia64ccu0.mmc2.rate = 200000000
hw.clk.sun50ia64ccu0.mmc2.parent = pll_periph0_2x
hw.clk.sun50ia64ccu0.mmc2.parent_domain = sun50ia64ccu0

```

---

**Digital Ocean**  
[http://do.co/bsdnow](http://do.co/bsdnow)

\###[BSDCan 2018 Trip Report: Mark Johnston](https://www.freebsdfoundation.org/blog/bsdcan-2018-trip-report-mark-johnston/)

>
>
> BSDCan is a highlight of my summers: the ability to have face-to-face conversations with fellow developers and contributors is invaluable and always helps refresh my enthusiasm for FreeBSD. While in a perfect world we would all be able to communicate effectively over the Internet, it’s often noted that locking a group of developers together in a room can be a very efficient way to make progress on projects that otherwise get strung out over time, and to me this is one of the principal functions of BSD conferences. In my case I was able to fix some kgdb bugs that had been hindering me for months; get some opinions on the design of a feature I’ve been working on for FreeBSD 12.0; hear about some ongoing usage of code that I’ve worked on; and do some pair-debugging of an issue that has been affecting another developer.  
>  As is tradition, on Tuesday night I dropped off my things at the university residence where I was staying, and headed straight to the Royal Oak. This year it didn’t seem quite as packed with BSD developers, but I did meet several long-time colleagues and get a chance to catch up. In particular, I chatted with Justin Hibbits and got to hear about the bring-up of FreeBSD on POWER9, a new CPU family released by IBM. Justin was able to acquire a workstation based upon this CPU, which is a great motivator for getting FreeBSD into shape on that platform. POWER9 also has some promise in the server market, so it’s important for FreeBSD to be a viable OS choice there.  
>  Wednesday morning saw the beginning of the two-day FreeBSD developer summit, which precedes the conference proper. Gordon Tetlow led the summit and did an excellent job organizing things and keeping to the schedule. The first presentation was by Deb Goodkin of the FreeBSD Foundation, who gave an overview of the Foundation’s role and activities. After Deb’s presentation, present members of the FreeBSD core team discussed the work they had done over the past two years, as well as open tasks that would be handed over to the new core team upon completion of the ongoing election. Finally, Marius Strobl rounded off the day’s presentations by discussing the state and responsibilities of FreeBSD’s release engineering team.  
>  One side discussion of interest to me was around the notion of tightening integration with our Bugzilla instance; at moment we do not have any good means to mark a given bug as blocking a release, making it easy for bugs to slip into releases and thus lowering our overall quality. With FreeBSD 12.0 upon us, I plan to help with the triage and fixes for known regressions before the release process begins.  
>  After a break, the rest of the morning was devoted to plans for features in upcoming FreeBSD releases. This is one of my favorite discussion topics and typically takes the form of have/need/want, where developers collectively list features that they’ve developed and intend to upstream (have), features that they are missing (need), and nice-to-have features (want). This year, instead of the usual format, we listed features that are intended to ship in FreeBSD 12.0. The compiled list ended up being quite ambitious given how close we are to the beginning of the release cycle, but many individual developers (including myself) have signed up to deliver work. I’m hopeful that most, if not all of it, will make it into the release.  
>  After lunch, I attended a discussion led by Matt Ahrens and Alexander Motin on OpenZFS. Of particular interest to me were some observations made regarding the relative quantity and quality of contributions made by different “camps” of OpenZFS users (illumos, FreeBSD and ZoL), and their respective track records of upstreaming enhancements to the OpenZFS project. In part due to the high pace of changes in ZoL, the definition of “upstream” for ZFS has become murky, and of late ZFS changes have been ported directly from ZoL. Alexander discussed some known problems with ZFS on FreeBSD that have been discovered through performance testing. While I’m not familiar with ZFS internals, Alexander noted that ZFS’ write path has poor SMP scalability on FreeBSD owing to some limitations in a certain kernel API called taskqueue(9). I would like to explore this problem further and perhaps integrate a relatively new alternative interface which should perform better.  
>  Friday and Saturday were, of course, taken up by BSDCan talks. Friday’s keynote was by Benno Rice, who provided some history of UNIX boot systems as a precursor to some discussion of systemd and the difficulties presented by a user and developer community that actively resist change. The rest of the morning was consumed by talks and passed by quickly. First was Colin Percival’s detailed examination of where the FreeBSD kernel spends time during boot, together with an overview of some infrastructure he added to track boot times. He also provided a list of improvements that have been made since he started taking measurements, and some areas we can further improve. Colin’s existing work in this area has already brought about substantial reductions in boot time; amusingly, one of the remaining large delays comes from the keyboard driver, which contains a workaround for old PS/2 keyboards. While there seems to be general agreement that the workaround is probably no longer needed on most systems, the lingering uncertainty around this prevents us from removing the workaround. This is, sadly, a fairly typical example of an OS maintenance burden, and underscores the need to carefully document hardware bug workarounds. After this talk, I got to see some rather novel demonstrations of system tracing using dwatch, a new utility by Devin Teske, which aims to provide a user-friendly interface to DTrace. After lunch, I attended talks on netdump, a protocol for transmitting kernel dumps over a network after the system has panicked, and on a VPC implementation for FreeBSD. After the talks ended, I headed yet again to the hacker lounge and had some fruitful discussions on early microcode loading (one of my features for FreeBSD 12.0). These led me to reconsider some aspects of my approach and saved me a lot of time. Finally, I continued my debugging session from Wednesday with help from a couple of other developers.  
>  Saturday’s talks included a very thorough account by Li-Wen Hsu of his work in organizing a BSD conference in Taipei last year. As one of the attendees, I had felt that the conference had gone quite smoothly and was taken aback by the number of details and pitfalls that Li-Wen enumerated during his talk. This was followed by an excellent talk by Baptiste Daroussin on the difficulties one encounters when deploying FreeBSD in new environments. Baptiste offered criticisms of a number of aspects of FreeBSD, some of which hit close to home as they involved portions of the system that I’ve worked on.  
>  At the conclusion of the talks, we all gathered in the main lecture hall, where Dan led a traditional and quite lively auction for charity. I managed to snag a Pine64 board and will be getting FreeBSD installed on it the first chance I get. At the end of the auction, we all headed to ByWard for dinner, concluding yet another BSDCan.
>
>

* Thanks to Mark for sharing his experiences at this years BSDCan

---

\##News Roundup  
 \###[Transparent network audio with mpd & sndiod](https://undeadly.org/cgi?action=article&sid=20180410063454)

>
>
> Landry Breuil (landry@ when wearing his developer hat) wrote in…
>
>

```
I've been a huge fan of MPD over the years to centralize my audio collection, and i've been using it with the http output to stream the music as a radio on the computer i'm currently using…

audio_output {
       type            "sndio"
       name            "Local speakers"
       mixer_type      "software"
}
audio_output {
       type            "httpd"
       name            "HTTP stream"
       mixer_type      "software"
       encoder         "vorbis"
       port            "8000"
       format          "44100:16:2"
}
this setup worked for years, allows me to stream my home radio to $work by tunnelling the port 8000 over ssh via LocalForward, but that still has some issues:

a distinct timing gap between the 'local output' (ie the speakers connected to the machine where MPD is running) and the 'http output' caused by the time it takes to reencode the stream, which is ugly when you walk through the house and have a 15s delay
sometimes mplayer as a client doesn't detect the pauses in the stream and needs to be restarted
i need to configure/start a client on each computer and point it at the sound server url (can do via gmpc shoutcast client plugin…)
it's not that elegant to reencode the stream, and it wastes cpu cycles
So the current scheme is:

mpd -> http output -> network -> mplayer -> sndiod on remote machine
|
-> sndio output -> sndiod on soundserver
Fiddling a little bit with mpd outputs and reading the sndio output driver, i remembered sndiod has native network support… and the mpd sndio output allows you to specify a device (it uses SIO_DEVANY by default).

So in the end, it's super easy to:

enable network support in sndio on the remote machine i want the audio to play by adding -L<local ip> to sndiod_flags (i have two audio devices, with an input coming from the webcam):
sndiod_flags="-L10.246.200.10 -f rsnd/0 -f rsnd/1"
open pf on port 11025 from the sound server ip:
pass in proto tcp from 10.246.200.1 to any port 11025
configure a new output in mpd:
audio_output {
       type            "sndio"
       name            "sndio on renton"
       device          "snd@10.246.200.10/0"
       mixer_type      "software"
}
and enable the new output in mpd:
$mpc enable 2
Output 1 (Local speakers) is disabled
Output 2 (sndio on renton) is enabled
Output 3 (HTTP stream) is disabled
Results in a big win: no gap anymore with the local speakers, no reencoding, no need to configure a client to play the stream, and i can still probably reproduce the same scheme over ssh from $work using a RemoteForward.

mpd -> sndio output 2 -> network -> sndiod on remote machine
|
-> sndio output 1 -> sndiod on soundserver
Thanks ratchov@ for sndiod :)

```

---

\###[MirBSD’s Korn Shell on Plan9 Jehanne](https://www.mirbsd.org/permalinks/wlog-10_e20180415-tg.htm)

>
>
> Let start by saying that I’m not really a C programmer.  
>  My last public contribution to a POSIX C program was a little improvement to the Snort’s react module back in 2008.  
>  So while I know the C language well enough, I do not know anything about the subtleness of the standard library and I have little experience with POSIX semantics.  
>  This is not a big issue with Plan 9, since the C library and compiler are not standard anyway, but with Jehanne (a Plan 9 derivative of my own) I want to build a simple, loosely coupled, system that can actually run useful free software ported from UNIX.  
>  So I ported RedHat’s newlib to Jehanne on top of a new system library I wrote, LibPOSIX, that provides the necessary emulations. I wrote several test, checking they run the same on Linux and Jehanne, and then I begun looking for a real-world, battle tested, application to port first.  
>  I approached MirBSD’s Korn Shell for several reason:
>
>

* it is simple, powerful and well written
* it has been ported to several different operating systems
* it has few dependencies
* it’s the default shell in Android, so it’s really battle tested

>
>
> I was very confident. I had read the POSIX standard after all! And I had a test suite!  
>  I remember, I thought “Given newlib, how hard can it be?”  
>  The porting begun on September 1, 2017. It was completed by tg on January 5, 2018. 125 nights later.  
>  Turn out, my POSIX emulation was badly broken. Not just because of the usual bugs that any piece of C can have: I didn’t understood most POSIX semantics at all!
>
>

---

**iXsystems**

\###[Static site generator with rsync and lowdown on OpenBSD](https://www.romanzolotarev.com/ssg.html)

* ssg is a tiny POSIX-compliant shell script with few dependencies:

* lowdown(1) to parse markdown,

* rsync(1) to copy temporary files, and

* entr(1) to watch file changes.

* It generates Markdown articles to a static website.

* It copies the current directory to a temporary on in /tmp skipping .\* and \_\*, renders all Markdown articles to HTML, generates RSS feed based on links from index.html, extracts the first \<h1\> tag from every article to generate a sitemap and use it as a page title, then wraps articles with a single HTML template, copies everything from the temporary directory to $DOCS/

>
>
> Why not Jekyll or “$X”?
>
>

* ssg is one hundred times smaller than Jekyll.

>
>
> ssg and its dependencies are about 800KB combined. Compare that to 78MB of ruby with Jekyll and all the gems. So ssg can be installed in just few seconds on almost any Unix-like operating system.  
>  Obviously, ssg is tailored for my needs, it has all features I need and only those I use.  
>  Keeping ssg helps you to master your Unix-shell skills: awk, grep, sed, sh, cut, tr. As a web developer you work with lots of text: code and data. So you better master these wonderful tools.
>
>

* Performance

>
>
> 100 pps. On modern computers ssg generates a hundred pages per second. Half of a time for markdown rendering and another half for wrapping articles into the template. I heard good static site generators work—twice as fast—at 200 pps, so there’s lots of performance that can be gained. ;)
>
>

---

\###[Why does FreeBSD have virtually no (0%) desktop market share?](https://www.quora.com/Why-does-FreeBSD-have-virtually-no-0-desktop-market-share/answer/Terry-Lambert)

* Because someone made a horrible design decision back in 1984.

>
>
> In absolute fairness to those involved, it was an understandable decision, both from a research perspective, and from an economic perspective, although likely not, from a technology perspective.
>
>

* Why and what.

>
>
> The decision was taken because the X Window System was intended to run on cheap hardware, and, at the time, that meant reduced functionality in the end-point device with the physical display attached to it.  
>  At the same time, another force was acting to also limit X displays to display services only, rather than rolling in both window management and specific widget instances for common operational paradigms.  
>  Mostly, common operational paradigms didn’t really exist for windowing systems because they also simply didn’t exist at the time, and no one really knew how people were going to use the things, and so researchers didn’t want to commit future research to a set of hard constraints.  
>  So a decision was made: separate the display services from the application at the lowest level of graphics primitives currently in use at the time.
>
>

* The ramifications of this were pretty staggering.

>
>
> First, it guaranteed that all higher level graphics would live on the host side of the X protocol, instead of on the display device side of the protocol.  
>  Despite a good understanding of Moore’s law, and the fact that, since no X Terminals existed at the time as hardware, but were instead running as emulations on workstations that had sufficient capability, this put the higher level GUI object libraries — referred to as “widgets” — in host libraries linked into the applications.  
>  Second, it guaranteed that display organization and management paradigms would also live on the host side of the protocol — assumed, in contradiction to the previous decision, to be running on the workstation.  
>  But, presumably, at some point, as lightweight X Terminals became available, to migrate to a particular host computer managing compute resource login/access services.
>
>

* Between these early decisions reigned chaos.

>
>
> Specifically, the consequences of these decisions have been with us ever since:  
>  Look-and-feel are a consequence of the toolkit chosen by the application programmer, rather than a user decision which applies universally to all applications.  
>  You could call this “lack of a theme”, and — although I personally despise the idea of customizing or “theming” desktops — this meant that one paradigm chosen by the user would not apply universally across all applications, no matter who had written them.  
>  Window management style is a preference.  
>  You could call this a more radical version of “theming” — which you will remember, I despise — but a consequence to this is that training is not universal across personnel using such systems, nor is it transferrable.  
>  In other words, I can’t send someone to a class, and have them come back and use the computers in the office as a tool, with the computer itself — and the elements not specific to the application itself — disappearing into the background.  
>  Both of these ultimately render an X-based system unsuitable for desktops.  
>  I can’t pay once for training. Training that I do pay for does not easily and naturally translate between applications. Each new version may radically alter the desktop management paradigm into unrecognizability.
>
>

* Is there hope for the future?

>
>
> Well, the Linux community has been working on something called Wayland, and it is very promising…  
>  …In the same way X was “very promising” in 1984, because, unfortunately, they are making exactly the same mistakes X made in 1984, rather than correcting them, now that we have 20/20 hindsight, and know what a mature widget library should look like.  
>  So Wayland is screwing up again.  
>  But hey, it only took us, what, 25 years to get from X in 1987 to Wayland in in 2012.  
>  Maybe if we try again in 2037, we can get to where Windows was in 1995.
>
>

---

\##Beastie Bits

* [New washing machine comes with 7 pages of open source licenses!](https://twitter.com/FranckPachot/status/1012606253338591232)
* [BSD Jobs Site](https://www.bsdjobs.com/)
* [FreeBSD Foundation Update, May 2018](https://www.freebsdfoundation.org/wp-content/uploads/2018/05/FreeBSD-Foundation-May-2018-Update.pdf)
* [FreeBSD Journal looking for book reviewers](http://freebsdjournal.org/)
* [zedenv ZFS Boot Environment Manager](https://ramsdenj.com/2018/05/29/zedenv-zfs-boot-environment-manager.html)

---

**Tarsnap**

\##Feedback/Questions

* Wouter - [Feedback](http://dpaste.com/28959CK#wrap)
* Efraim - [OS Suggestion](http://dpaste.com/2RZ16K8#wrap)
* kevr - [Raspberry Pi2/FreeBSD/Router on a Stick](http://dpaste.com/2PX7KSP#wrap)
* Vanja - [Interview Suggestion](http://dpaste.com/0ARSVWE#wrap)

---

* Send questions, comments, show ideas/topics, or stories you want mentioned on the show to [feedback@bsdnow.tv](mailto:feedback@bsdnow.tv)