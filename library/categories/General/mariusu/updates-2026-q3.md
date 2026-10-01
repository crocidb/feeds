+++
title = "Updates 2026/Q3"
description = "Life and project updates from the current consecutive three-month period. You might find this interesting in case you're using any of my open source tools or you just want to read random things. :-)"
date = "2026-09-29T23:38:50Z"
url = "https://xn--gckvb8fzb.com/updates-2026-q3/"
author = "marius@xn--gckvb8fzb.com (Marius)"
text = ""
lastupdated = "2026-09-30T20:51:44.833030200Z"
seen = false
+++

This post includes personal updates and some open source project updates.

Personal things
----------

もしもし、マリウスです, faxing at 9600 baud directly from [Tokyo, Japan](/travel/japan/). After a short hop over to [Hong Kong and Shenzhen](/travel/china/), I’m back in the beautiful neighborhood of [Shimokitazawa](https://en.wikipedia.org/wiki/Shimokitazawa), where I’m spending almost the entire rest of the year until right before Xmas, when I’ll be heading back to Shenzhen.

First things first, a warning: This is a **very** long post as it includes a metric ton of project updates. If you’re interested in the stuff that I’m building then this update is definitely for you.

However, let’s start off with some infrastructure-related things.

### Infrastructure & hardware ###

A few major updates happened in the past quarter with regard to my infrastructure. Probably the most important one is the migration from individual VPS instances to my own bare metal running a [Proxmox](http://proxmox.com) *“datacenter”*.

While I had been relatively satisfied with [Vultr](https://www.vultr.com/?ref=8833453) in the past, with an ever-increasing number of virtual server instances, for projects like [MSG.TAXI](https://msg.taxi), [Hyperuplink](https://hyperup.link), [tty.fail](/i-regret-migrating-to-codeberg/), and everything related to this very website, my cloud service bill became overly expensive, all while [contributions](/support/) sadly decreased over the past months, making it unsustainable to run cloud infrastructure, especially to that extent. It just so happened that Vultr had more maintenance windows than usual over the past months, which prompted me to finally deal with the task of moving my VPS instances onto my own hardware.

By migrating to bare metal, I was able to slash costs by approximately 30%, by discarding the resource safety buffer I had accounted for within each individual VPS, for a more dynamically allocating approach across individual instances. With rising hardware costs, however, one trade-off that I had to make concerns high availability. A full hardware failure on the current setup will result in all uncached services becoming unavailable for as long as the repairs take. Unless prices for hardware go down again, [which is unlikely to happen](/hold-on-to-your-hardware/), or contributions pick up again, which in the current market climate is equally unlikely, I won’t be building out the setup any further.

As for some general stats about this specific website, over the past six months it generated at its peak over 270GB of traffic per month, which is considerable, given its compact size and its GTmetrix rating of `A` (100% performance, 98% structure, 450ms LCP, 0ms TBT, 0.02 CLS), with the first contentful paint after 344ms, the speed index at 366ms, the time to interactive at 436ms, and an average page size (including images) of a few megabytes at most. Because I stopped running *any* form of analytics software, due to [privacy reasons](/no-more-tea-leaf-reading/) at first, but ultimately because of the realization that it has become pointless with all the robots LARPing as legitimate human traffic, I cannot tell you the number of visitors this website or any of the related projects have, and frankly I don’t even care. Not because I don’t care about actual humans being interested in the things I’m publishing, but because over the past months I have been receiving an increasing amount of feedback via e-mail, as well as welcoming a surprising number of new members to the [community channel](/contact/#xmpp), so that I don’t need analytics software to show me that visitors appreciate the work I’m putting in and decide to stick around.

#### Community chat ####

Speaking of sticking around: The SimpleX group that existed next to the primary [XMPP channel](/contact/#xmpp) is no more. Neither the platform, nor the group itself developed in a favorable way over the past years, despite its almost 500 members. SimpleX turned from an interesting privacy platform into yet-another-Telegram-type messenger and is on the way to *enshittification* with VC investments from e.g. ACP, who is an investor in K2 Space (ELINT), OnScreen.ai (tracking), Zorus (employee/network monitoring), as well as Jack Dorsey. To make matters worse, at the end of September Evgeny Poberezkin reached out to me via e-mail with the following request:

>
>
> Hi Marius,
>
>
>
> Thank you very much for this article: [https://xn--gckvb8fzb.com/an-overview-of-privacy-focused-decentralized-instant-messengers/](https://xn--gckvb8fzb.com/an-overview-of-privacy-focused-decentralized-instant-messengers/) (we shared it here: [https://simplex.chat/](https://simplex.chat/)\<redacted\>).
>
>
>
> We launched equity crowdfunding on Wefunder in August ([https://simplex.chat/](https://simplex.chat/)\<redacted\>), to give users the opportunity to get a stake in SimpleX Chat and benefit from its growth - 150 people have already invested.
>
>
>
> Please help us spread the word - maybe you could write about it and some other recent news: the foundation, channels, public names, and supporter badges, which we launched recently ([https://simplex.chat/](https://simplex.chat/)\<redacted\>).
>
>
>
> It would be great to connect - SimpleX link is below - please send any questions!
>
>
>
> Thank you again and all the best  
>  Evgeny
>
>
>
> P.S. If you write something, could you please share with us before publishing so it complies with Regulation Crowdfunding rules? We cannot promote (and won’t be able to re-share with our community) if it mentions valuation, security type, how much is or left to raise (saying how many people invested is allowed), and how the funds will be used. We can mention perks we provide though. Thank you!
>
>
>
> –  
>  Evgeny Poberezkin  
>  SimpleX Chat, Founder
>
>

Despite my article clearly stating, quote:

>
>
> **Red flag:** VC funded, specifically by [Jack Dorsey](https://simplex.chat/blog/20240814-simplex-chat-vision-funding-v6-private-routing-new-user-experience.html#the-present-announcing-the-investment-from-jack-dorsey-and-asymmetric), since Aug 14, 2024, hence I do not recommend it any longer.
>
>

… Evgeny (or, more likely, his team that didn’t properly vet every organic site linking/mentioning SimpleX) sent me this fairly generic looking e-mail, to which I replied by pointing at the *red flag*. Long story short, the fact that SimpleX has now seemingly become so much of a *product* in the literal sense that they are trying to get approved organic content out for their funding campaign shows once more that it isn’t a suitable option for the privacy/decentralization community anymore. I have therefore deleted the SimpleX group, as well as removed all mentions of the messenger on this website, treating it the same way as I treat e.g. Telegram, WhatsApp or any other commercial platform.

#### Back to the infrastructure ####

Anyway, a few days ago I shut down the last Vultr instance, an OpenBSD machine that had been serving this website for years. It outlived the rest of my cloud infrastructure by a couple of days.

The *clearnet* version of this website had moved from the `httpd` instance to a [Bunny](https://bunny.net?ref=mcdwaycxf4) storage zone with a *pull zone* in front of it earlier in September, which happened due to the increased traffic by bots and [maybe humans](https://news.ycombinator.com/from?site=xn--gckvb8fzb.com), and which means that there is no origin server at all any longer. The Tor and I2P sites still needed a machine of their own, since Bunny doesn’t offer a way to serve either of them, hence both are now served from a virtual machine on my own hardware.

That machine has no public IP address, which neither the Tor daemon nor i2pd needs in order to publish a site. Unfortunately it does appear to make the I2P site less reliable, presumably because an I2P router that nobody can connect to depends on other routers to introduce it, and in a measurement about four hours after the move, 4 out of 8 requests to the *eepsite* succeeded, while all 8 requests to the onion service did. If the eepsite doesn’t load for you, simply try again, since a second attempt usually works.

The clearnet side has a trade-off of its own, namely that this website now depends on a provider being there, where the VPS used to be able to serve the entire thing by itself if I ever took the CDN away. What makes me comfortable with it is that the build is still a folder of plain files that any web server can serve, hence going back would require not much more than a server, a workflow step and a few changes in the DNS, but not a rebuild. There’s a dedicated write-up on the whole publishing pipeline in the works, so I’m keeping it at this for now.

#### Computer ####

[<img class="kg-image" src="/updates-2026-q3/images/lenovo-x1-carbon-gen-14-aura_hu_af1071c249fa06be.webp" width="1440" height="810" alt="" loading="lazy" decoding="async">](https://cdn.xn--gckvb8fzb.com/updates-2026-q3/images/lenovo-x1-carbon-gen-14-aura.jpg)

It’s been almost three months since I got the [Lenovo X1 Carbon Gen 14 Aura](/lenovo-x1-carbon-gen-14-aura/) and switched from the [StarBook Mk VI](/computer/#f0g6) to [it](/computer/#b4r45u), and I haven’t regretted it so far. The laptop performs as well as I had expected it to while offering very decent battery life. At times I’m getting dangerously close to its 32GB RAM limit, which is something I had expected before purchasing it, but most of my workloads still have plenty of breathing room.

##### Portable monitor #####

Shortly after upgrading to the [X1 Carbon](/computer/#b4r45u) I also decided to get an external (portable) 19" screen, and so I snapped up the Uperfect GR19BU. So far my experience with the display has been very decent, but I won’t get ahead of myself as I’m going to release a dedicated write-up/review on it soon.

However, with several other new additions to my setup, like this display, the [Mudi 7](/gl-inet-mudi-7/), and the things [below](#dock), it’ll probably make sense to also start preparing a follow-up on the [travel desk setup](/minimal-yet-productive-travel-desk-setup/) from earlier this year. As usual with many of the posts on this site, however, it takes between one and three months from the first line to the finished and published post, so don’t count on it until the end of the year or maybe even early next year.

##### Dock #####

After having had a few minor issues with the uni USB-C hub (8-in-1 with USB-C power), and slowly running out of USB ports, I decided that it was time to get a proper Thunderbolt 4 dock for my [X1 Carbon](/computer/#b4r45u), and what option would be better than the official Lenovo ThinkPad Thunderbolt 4 Smart Dock Gen 2 7500, for which I happened to find a pretty sweet deal. As a matter of fact the deal was so good that I didn’t realize at the time of buying that the dock comes with A) its own external 135 Watt power adapter and cannot be powered through a regular USB-C PD charger, which is sort of messing with my [minimal yet productive travel desk setup](/minimal-yet-productive-travel-desk-setup/#power), because I’m already carrying a PSU that weighs over 800g, and B) with *cLoUd CoNnEcTiViTy*. The dock itself is 590g, its PSU (plus power cord) another 350g, which amounts to 940g total added weight for only the dock.

Clearly the dock isn’t meant to be a travel-friendly option, but it seems like no Thunderbolt dock really is considering the (even heavier) alternatives, like the CalDigit TS-4. However, with regular USB-C hubs not providing enough connectivity, performance and, most importantly, stability, it was time to try a different class of devices.

Sadly the dock only lasted a single day before it stopped working and had a slight smell of burnt electronics to it. Hence I had almost three weeks of back and forth with Lenovo’s customer service in order to get it RMA’d/replaced, which was a frustrating experience to put it mildly. Then again, I don’t think the lackluster performance of Lenovo in the specific geographic region that I had to deal with them in is a fair representation of Lenovo’s global customer service, but very likely typical customer service across most companies in that region.

Anyhow, I eventually received the replacement and I’m finally able to use it. The hardware is fairly decent, I haven’t encountered any odd messages in my `dmesg` log yet, and I finally have enough USB-A/-C ports to connect all sorts of peripherals, like my keyboard, my mouse, the [portable monitor](#portable-monitor), and more. However, I’d wish that these docks would replace their HDMI and DisplayPort connectors with more USB-A/-C ports and maybe even a halfway decent sound card with various audio connectors (3.5mm amongst others). I never needed that many display outputs on a computer, let alone on a portable device. But I guess I’m the exception, as pretty much every dock manufacturer seems to follow this quadruple/sextuple/octuple display-setup trend.

The only *meh* part of the dock seems to be the integrated Ethernet card/port, that appears to be a Realtek RTL8156B (`driver=r8152 firmware=rtl8156b-2`), which is a bit of a potato. There are plenty of user reports online that describe all sorts of issues with this specific NIC under Linux. While it does offer 2.5G, matching my new [switch](#switch) perfectly, it does seem to come with a few issues with regard to reliability and actual performance. However, with the amount of USB ports on the dock I can connect one of the many 1G Ethernet adapters that I have and be done with it, in case the integrated NIC should ever give me a hard time. So far, however, it had been working without issues.

#### Switch ####

[<img class="kg-image" src="/updates-2026-q3/images/ubiquiti-flex-mini-2.5g_hu_c1312cc7c9bf00ab.webp" width="1440" height="810" alt="" loading="lazy" decoding="async">](https://cdn.xn--gckvb8fzb.com/updates-2026-q3/images/ubiquiti-flex-mini-2.5g.jpg)

In an ongoing effort to *USB-C-ify* all of my hardware I also pulled the trigger on a new portable switch, namely the Ubiquiti Flex Mini 2.5G. I’ve been using the blocky Netgear 1GbE switches forever, but I’ve always struggled to power them, as they come with a barrel connector and a dedicated PSU. While I did at some point get a USB-A-to-barrel-connector cable, judging from the power output of the PSU those switches are not intended to be run off of a USB-A port. It works, but it’s probably not the best idea.

Short story long, I went for the Flex Mini primarily because it is powered via USB-C, so that I don’t have to carry another PSU or worry about damaging the device. As an added benefit, the switch now offers 2.5G links, which the Lenovo [dock](#dock), as well as the [Mudi 7](/gl-inet-mudi-7/) and the [Slate 7](/gl-inet-slate-7/) can benefit from. Ideally my [portable NAS](/computer/#h4nk4-m) should also benefit from the higher speeds, but sadly that probably won’t happen with the current hardware.

Speaking of which …

#### NAS ####

[<img class="kg-image" src="/updates-2026-q3/images/updc-v3_hu_bf9203839814715b.webp" width="1440" height="810" alt="" loading="lazy" decoding="async">](https://cdn.xn--gckvb8fzb.com/updates-2026-q3/images/updc-v3.jpg)

The [Ultra-Portable Data Center](/ultra-portable-data-center-part-two/) (v2) has had its second birthday and has held up extremely well, considering all the [travel](/travel/) and, at times, incredibly dusty, humid, and/or hot environments that it went through. More importantly, though, even two years later there is still not a single comparable, commercial product on the market that would make me want to replace [the existing system](/computer/#h4nk4-m) with it. Every piece of hardware that I’ve stumbled upon to date appears to come with major hard- or software headaches, be it the UnifyDrive UT2, the Beelink ME Mini, the CWWK x86 P6, or even the significantly larger/heavier AOOSTAR R7. The closest in terms of software freedom, hardware reliability and physical footprint to date appears to be the QNAP TBS-464, which is an ultra-thin and lightweight, portable 4-bay M.2 NVMe NAS introduced back in 2021.

Because I had to further reduce the weight and size of the items that I carry with me on my travels, however, at the beginning of September I began working on the next iteration of my ultra-portable NAS, the UPDC v3. I haven’t yet found the time to pour the endeavor into a dedicated write-up, but I am happy to say that I’ve managed to reduce the build’s footprint from initially around 1.48 liters down to as little as 0.68 liters in volume. I won’t spoil too much, yet, but it’s fair to say that I’m relatively happy with the end result and that it allowed me to make the UPDC a fixed part of my [carry-on luggage](/luggage/).

#### Keyboard ####

[<img class="kg-image" src="/updates-2026-q3/images/pbs-black-on-black_hu_2d0f6fe295095ecb.webp" width="1440" height="810" alt="" loading="lazy" decoding="async">](https://cdn.xn--gckvb8fzb.com/updates-2026-q3/images/pbs-black-on-black.jpg)

Not much happened on the keyboard front this quarter, apart from a set of PBS Black on Black that I was gifted, and that has since been on my [Kunai](/keyboard/#kunai). It has become one of my favorite [keycap sets](/keyboard/#keycaps) and it is pretty much what I was [hoping for](/updates-2025-q1/#elacgap-xda-transparent-black). The PBS keycaps are however not as rough/textured as I was hoping them to be, which is a bit of a bummer. Anyway, I might post a dedicated long-form review in a few months when I’ll be able to better judge long-term use.

Open source projects
----------

I invested some time in pursuing [my open source projects](https://tty.fail/mrus) in the past quarter, hence there are a few updates to share. Several of them shared the same two things, which were a move to the [SEGV-1.1 license](/segv/), and a *vanity import path* under my own domain.

### Ghostty `bold-is-glow` ###

As some of you might remember, I had an [unpleasant encounter](/updates-2025-q2/#toodaloo-alacritty-hello-ghostty) last year with one of the Alacritty developers, which prompted me to do something that was long overdue, namely switch to Ghostty. Along the way [I implemented](https://github.com/ghostty-org/ghostty/discussions/7369) the exact feature I initially wanted for Alacritty and made my code public, on a dedicated branch in my fork of Ghostty.

Over a year later, I’m still maintaining that patch. If you’re using my `bold-is-glow` patch, make sure to update your local version.

### Neon Modem Overdrive ###

[Neon Modem Overdrive](https://tty.fail/mrus/neonmodem), my BBS-style command line client, received a whole new backend this quarter. It can now connect to Hyperuplink, the bulletin board of the future, to which I’ll get in [just a second](#hyperuplink). Neon Modem is the first dedicated client implementation for the relatively young and not-yet-well-thought-out REST API. Additionally, a shared prompt package now handles the server URL and credential input for that system as well as for Discourse and Lemmy, instead of each one keeping its own copy.

I also tracked down a longstanding source of UI lag. The post-create and post-show windows were doing more work on every keystroke than they needed to, and reworking their handlers and rendering made the interface responsive again. A new release with all of this is available on [tty.fail](https://tty.fail/mrus/neonmodem), with binaries on [GitHub](https://github.com/mrusme/neonmodem).

### Kopi ###

[Kopi](https://tty.fail/mrus/kopi), the command line coffee journal, had its two heaviest dependencies replaced. The SQLite driver moved from the `CGO`-based [`github.com/mattn/go-sqlite3`](https://github.com/mattn/go-sqlite3) to the pure-Go [`modernc.org/sqlite`](https://gitlab.com/cznic/sqlite), so Kopi now builds without a C toolchain and ships as a fully static binary on every platform. The OCR helper, which reads the details off a photo of a coffee bag, moved from an Ollama-specific client to the [official OpenAI Go SDK](https://github.com/openai/openai-go), so it can point at any OpenAI-compatible endpoint rather than only an Ollama instance.

The Go module was renamed to a vanity import path under my own domain (`xn--gckvb8fzb.com/kopi`), and the usual dependency, workflow and GoReleaser housekeeping came with it.

On top of this, Kopi received the [first contribution](https://tty.fail/mrus/kopi/commit/e84a32bfd4b0937448a42952332b6d5b17dfbd52), which was applied to it via `git am` at the end of July.

### reader ###

[reader](https://tty.fail/mrus/reader), the command line web page reader, had a productive quarter. The biggest change is the removal of the [journalist](https://github.com/mrusme/journalist) dependency, whose crawling logic is now part of reader’s own `crawler` package rather than pulled in from a separate module. As I don’t maintain journalist any longer it made sense to pull out the bits that I need for reader.

Additionally, reader gained proxy support, so it honors the standard proxy environment variables (#23). It now also correctly handles the URL scheme when deciding whether a source is an HTTP resource (#35), and it got a fix for an `.eml`-related issue (#37), which I worked out despite the reporter never supplying the example files I asked for.

**Note:** Don’t be *that guy*. If you open an issue in any piece of software that you don’t pay for and that someone else dedicates their time to free of charge, consider upfront if it’s really something that you’re going to use, and if it’s an issue you’re willing to dive into and help fix. If either of these are a clear *nope*, then simply don’t report it at all.

### usbec ###

[usbec](https://tty.fail/mrus/usbec), the USB Equipment Commander daemon that runs commands when USB devices are plugged in or removed, had its one core dependency reimplemented in-tree and enhanced. The [`go-hotplug`](https://github.com/elemecca/go-hotplug) module was dropped and its Linux netlink listener rebuilt inside usbec’s own `hotplug` package, so the daemon no longer depends on an outside module for that. The license moved from GPLv3 to the [SEGV-1.1 license](/segv/), the module was renamed to the vanity import path, and the release workflow and GoReleaser config were fixed along with it.

In addition, the *USB* Equipment Commander is now a *USB & Network* Equipment Commander, with the introduction of NetworkManager (via D-Bus). This allows you to have usbec run commands whenever the network changes in any of the various ways it can change. My motivation was to run a script that queries my public IP and the inferred location via `https://api.ip2location.io` and shows it as a desktop notification whenever NetworkManager (re-)connects.

### zpoweralertd ###

[zpoweralertd](https://tty.fail/mrus/zpoweralertd), my Zig rewrite and drop-in replacement of poweralertd, which is a UPower-powered power (.. power, POWER, POWERRRRR) alerter, has received a deep and thorough refresh. The biggest change is the C bindings, which I have replaced with handwritten `opaque`s, just the way I had used them for the first time in [ssh-askpass-zigtk](#ssh-askpass-zigtk), but more on that new tool below.

The second big change is the Zig compatibility, which now requires at least 0.16, and which I have tested against the current master/future 0.17 release as well, to make sure that everything will continue working. With this, I also largely refactored the code, for which I initially took inspiration from poweralertd. The restructuring allowed me to clean up the codebase and find a handful of memory-related issues along the way.

A new version of zpoweralertd has been released that contains these enhancements and, for the first time, it is available as pre-built binaries directly from the releases page.

### cexec ###

[cexec](https://tty.fail/mrus/cexec), my small cached-exec wrapper that runs a command and caches its output for a given amount of time so that re-running it returns the stored output instead of executing it again, was rewritten from Go to Zig this quarter.

The new version is a drop-in replacement for the previous one, but it changed a few things in the background, one of which is the storage. Previously cexec used BuntDB, which turned out to be a bad choice for a process that can theoretically run multiple times in parallel and access/write to the same database. The new version, instead, uses plain files that are scoped to the actual commands that are being executed. In addition, the new Zig version supports encryption for the cached runs, with an optional key from `-k` or the `CEXEC_KEY` environment variable, which makes using cexec suitable even for output that contains sensitive data.

On top of that, everything cexec does is now also available as a Zig module, so that the same caching can be used from another program without having to shell out to the cexec binary.

### ssh-askpass-zigtk ###

New this quarter is [`ssh-askpass-zigtk`](https://tty.fail/mrus/ssh-askpass-zigtk), a GTK4 `SSH_ASKPASS` helper written in [Zig](https://ziglang.org). OpenSSH runs an *askpass* program to prompt for a passphrase or a yes/no confirmation when it has no controlling terminal.

The reason it exists is my own issue with X11, which I [explained here](/a-gtk4-ssh-askpass-in-zig/). The reference askpass, and most others, link GTK against X11, so they fail to build on my Gentoo system with the global `-X` USE flag. `ssh-askpass-zigtk` does not require X11 dependencies, so it builds and runs on an X11-less GTK4. It works on Linux and (hopefully) on the BSDs alike.

### Switchyard ###

Also new this quarter is [Switchyard](https://tty.fail/mrus/switchyard), a lightweight bridge that accepts e-mail over SMTP and forwards each message to XMPP. You might have read about it before in [the dedicated post](/teaching-an-old-dog-new-tricks-forgejo-xmpp/) that I had published at the beginning of August, but if you haven’t I recommend going through it if a bridge for SMTP to XMPP sounds like something you could have a use for.

### Browser Select ###

For years I had a small `browser` shell script in my [dotfiles](https://tty.fail/mrus/dotfiles) that popped up a bemenu list whenever I clicked a link, so that I could decide which browser it opened in. This quarter I turned that idea into a proper GTK4 application written in Zig, namely [Browser Select](https://tty.fail/mrus/browserselect). It registers itself as a web browser, hence every link another application opens goes to it first, and a small popup then lists the browsers installed on the system for you to pick one with the mouse or the keyboard. Just like the script before, that used the Go version of [cexec](#cexec) as a binary to cache the choice for a few seconds, Browser Select also uses the new Zig cexec library for remembering a choice for a while, so that clicking a burst of links doesn’t lead to repeated asking for a browser.

### busybar.zig ###

The [Flipper BUSY Bar review](/flipper-busy-bar/#zig) that I posted this quarter came with a little goodie: [busybar.zig](https://tty.fail/mrus/busybar.zig).

It is a Zig 0.16 client library and command line tool for the Flipper BUSY Bar, implementing the device’s current OpenAPI specification as closely as possible, so that you can drive it over its HTTP API from Zig code or straight from the shell. It uses nothing but Zig’s `std` library, which means it builds for every target Zig supports, including macOS and Windows.

### Darkwing Ducky ###

[Darkwing Ducky](https://tty.fail/mrus/darkwing) is a BadUSB (“Rubber Ducky”) firmware for the PicoUSB, an RP2040-based board, built in Zig 0.16 with [MicroZig](https://github.com/ZigEmbeddedGroup/microzig). I’ve struggled to finish this for about ten months or so, primarily because implementing the required USB HID code that acts like an external keyboard wasn’t all that straightforward with MicroZig.

Anyway, Darkwing Ducky announces itself to the host as an ordinary keyboard and then types out a predefined sequence, which can be useful for automating the setup of a machine that you have physical access to, or, well, for other things. While the PicoUSB comes with its own CircuitPython-based software, I wanted to try Zig on hardware, especially with MicroZig for a while and so this device was the perfect excuse to do so. If you’re curious, the [repository](https://tty.fail/mrus/darkwing) has the details on the payload format and how to flash it.

### Hyperuplink ###

The internet bulletin board software that I had been writing about as ▓▓▓▓▓▓▓▓▓▓▓ in the previous updates has a name, and it’s out.

[Hyperuplink](https://hyperup.link) went public at the end of August, together with [a dedicated post](/hyperuplink-discuss-like-its-1998/) that covers what it is, why it exists and how to run it. If a JavaScript-free forum as a single binary sounds like your kind of thing, read that one first and come back here afterwards. Otherwise you might as well skip this part.

Most of the quarter went into the bits and pieces that the board needed before anyone other than me could run it. Attachments and profile pictures with local or S3-compatible storage, board-wide settings and an administration UI for all of them, a search, soft-deletion for categories, forums and topics, and a manual that is embedded in the binary and available under *Help* -\> *Manual*. On top of that came a whole set of themes and color schemes, as well as the packaging, which now covers Docker and Podman images, Quadlets, a Helm chart, a nixpkg with a NixOS module, an ebuild for Gentoo, and service files for systemd, OpenRC and rc.d.

And if that wasn’t enough already there is the REST API, which is what [Neon Modem](#nmo) connects to.

If you’d like to have a look at Hyperuplink yourself without any commitment, there’s a [demo instance](https://demo.hyperup.link) that you can check out. You can find its login details on the [official website](https://hyperup.link). Account creation is disabled on the demo instance (for now).

### Go on Glides ###

Go compiles down to a single static binary, which is why it is a great choice for Hyperuplink. However it has nothing along the lines of Django, Rails or Phoenix that takes care of the web parts, hence a good share of Hyperuplink was never about the bulletin board at all, but about routing, controllers, models, migrations, background jobs, translations and configuration. At the end of July I moved that share out of the repository and into [Go on Glides](https://tty.fail/mrus/glides), a web application framework for Go that includes everything needed to build database-backed web applications, on top of [Fiber](https://gofiber.io) v3 and [pgx](https://github.com/jackc/pgx), with embedded migrations, an asynchronous job queue, cron jobs, i18n, local and S3-compatible storage, and helpers that each project would otherwise have to reimplement.

The reason for the split is that I’m building a second service on the same foundation, namely [Maya](#inca), which meant that Hyperuplink’s internals had to become something that more than one program can use.

### Inca and Maya ###

[Inca](https://tty.fail/mrus/inca) is the spiritual successor of [addrb](https://tty.fail/mrus/addrb) and [caldr](https://tty.fail/mrus/caldr), my two earlier attempts at the same problem, this time as a single command line client for CalDAV and CardDAV that synchronizes calendars, tasks and contacts into a local database for offline use. It is built on top of the “framework” that I built and make use of in [zeit](https://tty.fail/mrus/zeit), and therefore it shares a lot of zeit’s UI aesthetic.

On the other end is [Maya](https://tty.fail/mrus/maya), a CalDAV and CardDAV server as a single Go binary with PostgreSQL underneath it, which (sadly) uses a patched hard-fork of [go-webdav](https://github.com/emersion/go-webdav), and which exists because neither Radicale nor Baïkal ever made me happy. It’s the second program built on [Glides](#glides).

I’ve been *dogfooding* Maya myself since early September, and as of now it still isn’t publicly available because it’s not yet at a point that I’m comfortable releasing it, in particular due to its hard-fork of go-webdav, which was a requirement because the upstream project is sadly pretty much dead at this point. However, given the absolute mess that DAV protocols are, it’s not even surprising that the maintainer seemingly lost interest in this project, and that the ecosystem is so bad.

Anyway, I have both, Inca and Maya, at a point that I can daily-drive them and, more importantly, that other clients (Android, iOS, desktop) can participate without too many hiccups along the way, but I’m not at all happy with the results for reasons that I will get into if I ever choose to release Maya.

### Netrunner ###

Also new this quarter, and admittedly not something one might call a *modest undertaking*, is [Netrunner](https://netrunner.surf), a web browser built on WebKitGTK and GTK4, written in [Zig](https://ziglang.org). I’m calling it *the hacker’s browser* as it’s meant for people who prefer a lightweight browser over Chromium and Firefox and who care more about configurability and about built-in integrations than about endless features and add-ons. Netrunner deliberately leaves out a number of things that other browsers have, bookmarks being probably the most obvious one, because the people it is built for tend to have a system for those features in place already.

Netrunner is configured through a single TOML file that holds the static settings as well as the runtime state, e.g. which sites are allowed to run JavaScript, play audio or send notifications. The session (i.e. open windows and their tabs) is also persisted in that one TOML file when the browser quits, and restored on the next start.

Two other features that Netrunner comes with built-in are Onion addresses and Eepsites, which are native protocols for the browser. By default, whenever you open an `.onion` URL or an `.i2p` link Netrunner opens a connection via Tor or i2pd and keeps it alive for as long as you browse sites within the Onion/I2P network. As soon as your browsing activity goes back to the clearnet, Netrunner automatically disconnects from Tor/I2P again. To the user these connects/disconnects happen completely transparently and every network gets a `WebKitNetworkSession` of its own, so a tab that follows a link onto another network moves over and keeps its back and forward history. In plain English this means that `.onion` and `.i2p` URLs are indistinguishable from any other URL and you don’t need to do anything *special* to be able to open them.

Obviously Netrunner is not a replacement for the official Tor Browser that the Tor Project releases and that is somewhat hardened to make sure you stay as anonymous and safe as possible. Instead, Netrunner’s Tor and I2P integrations are intended for the casual user who enjoys the freedom of browsing those networks as if they were part of the “normal internet”.

Speaking about the normal internet, one thing that can’t be missed, especially these days, is content filtering. While WebKit sadly doesn’t support running a full-blown uBlock Origin, its own content filter engine is nevertheless a relatively decent option for basic ad blocking and annoyance filtering. As a matter of fact, Netrunner uses the same AdBlock and uBlock Origin lists that popular browser extensions use, but it does so by downloading and converting them into the WebKit content blocker format via [adblock-webkit-convert.zig](https://tty.fail/mrus/adblock-webkit-convert.zig), one of two small Zig libraries that came out of this browser experiment. Sadly, the WebKit content blocker format does not support all the trickery that e.g. uBlock is able to do within its browser extension, which means that no, you won’t be able to avoid YouTube ads within Netrunner, at least for now. You will however still score above 62% on [AdBlocker test sites](https://adblock.turtlecute.org), which is fairly okay.

The other library that came out of this experiment is [osdetect](https://tty.fail/mrus/osdetect), which does what its name suggests: It detects with some amount of confidence what operating system a program is running on, and it gives you specifics like whether it’s e.g. a Debian or a Gentoo machine, or not even a Linux at all. I won’t tell what my main motivation for building this library was, but if I should ever get to the point that I have a 0.1 version of Netrunner ready for release you will be able to `grep` the source code for `osdetect` to find out.

Moving forward
----------

Which brings me to the release. Not only to that of Netrunner or Maya, but to the more general question of open source and how I intend to contribute to the ecosystem moving forward.

Despite having a landing page online, Netrunner is a fun project that I don’t take *too* seriously and that I’m currently dogfooding, just like I do with [Maya](#inca), to find out whether this is a project that I can imagine maintaining long-term, or whether it is one that will eventually outgrow my availability. After two decades of putting the software that I build for myself online, I have come to realize one or two things.

The first thing is that *“just putting it out there”* won’t benefit the software and it certainly won’t benefit me. My main motivation for building all these things is my own curiosity about how stuff works and, ultimately, my own needs. I need a proper CalDAV/CardDAV server that is pleasant to administer/maintain and that can talk to all of the software that I’m using, hence I’m building [Maya (and Inca)](#inca). I need a proper TUI client for Keebtalk and a few other forums, hence I’m building [Neon Modem Overdrive](#nmo). Speaking of which, I needed a forum and I was sick of the cruft that is phpBB or Discourse, so I built [Hyperuplink](https://hyperup.link). And it’s also me who is annoyed by the utterly insane bloat of modern web browsers, which is why I started building Netrunner.

Publishing any of them inevitably changes the software from *“what I need”* to *“what I need and what others seem to need”*, and there is no guarantee, even if you go the extra mile to implement what others ask for, that those people will stick around or ever start contributing themselves. [Zeit](https://tty.fail/mrus/zeit) is one example where I experienced exactly that, multiple times, and every time it left a bitter taste in my mouth and, what’s worse, hundreds of lines of code that other people had requested but that nobody ended up using long term. At some point Zeit v0.x had become so *bloated* with other people’s needs that I rewrote it from scratch as the v1 release that it is today, with only the features that I believe make sense to support long term.

The second thing that I realized is that *“putting it out there”* in hopes of finding like-minded people to collaborate with is a pipe dream. The open source *“community”* has been broken for a long time and, in most cases, was never much of a community to begin with, but rather the developer-equivalent of a [one-man band](https://en.wikipedia.org/wiki/One-man_band). Not that there are no exceptions, however, my projects usually aren’t *those* exceptions.

Kopi received its [first contribution](https://tty.fail/mrus/kopi/commit/e84a32bfd4b0937448a42952332b6d5b17dfbd52) only this quarter, two years after I initially released it, and it was a one-time submission rather than something that materialized into a long-term collaboration.

[reader](#reader), in the very same quarter, collected a handful of issues, one of which I fixed without ever receiving any feedback on it whatsoever. And if you look through the few [“Issues” sections on GitHub](https://github.com/mrusme/neonmodem/issues?q=is:issue) that I haven’t disabled yet, you’ll see that it’s the same story across the other projects as well, and you might understand why most of the repos lack the “Issues” tab these days.

A single patch against two or three dozen issue reports is roughly the ratio that every single one of my projects has had over the past two decades, and I don’t believe that this is because my software is **particularly** unattractive to contributors, despite it being intentionally niche, but simply because writing a patch for someone else’s program is work, while filing a request is at most a two-minute annoyance.

This is also why I, contrary to many other voices in the industry, do not regard opening an issue report as an actual contribution to a project. With all due respect, I don’t want your issue reports, keep them, especially the drive-by ones for something that you’re unlikely to end up using anyway. What a public repository attracts, hence, is an *audience* rather than a *community*, and many times that audience has a very short attention span. All of this eventually turns a maintainer into more of an unpaid support desk, which is not what I would like for myself.

On top of that, LLMs have taken away the one argument that publishing open source software still had going for it. That argument wasn’t that a stranger would show up and maintain **your** software **for you**, but that someone out there might one day need the exact same thing badly enough to extend what you had already built, instead of writing it from scratch all by themselves.

In 2026, however, that someone doesn’t need your repository any longer, because they’ll describe what they want to a model and get back something that compiles. Whether what comes out the other end is any good depends on the person directing the LLM and on the effort, or, dare I say, the money they’re willing to throw at it, rather than on the LLM itself. Code itself has become relatively *cheap*.

As a matter of fact, if you want a specific feature implemented in any of my years-old tools, you might as well ask *the machine* to do it for you, so you can have what you need for the time being. And frankly, I’m quite happy about that! I’m happy that a random passer-by can get the feature that they thought they needed during their euphoric discovery phase of a tool they just found out about, mainly because I also know that the moment the honeymoon phase ends and the person loses interest in the tool, their interest in that feature will vanish along with it, and it would be left up to the maintainer to continue supporting it.

Don’t get me wrong, I’m not arguing that collaboration never works, because examples like Linux, curl and PostgreSQL prove the opposite, but I am arguing that for small programs that a single person can hold in their head there are very few reasons for others to actively contribute, and even fewer in a world of automated code generation.

Going back to where I started, I’m not sure yet whether I’ll ever publish any of the newer tools and programs that I’m building, like Maya or Netrunner, simply because I don’t see much of a reason to do so. Especially when, for projects like Netrunner, I know of [far more popular examples](https://github.com/atlas-engineer/nyxt) that still died the moment their maintainer stopped investing time into them.

And maybe that’s a good thing. Maybe these kinds of projects, just like the ones that I’m publishing, are simply not relevant enough in the grand scheme of things. Maybe it’s just Darwinism at work, and maybe that’s just how things should be after all.

>
>
> There he goes. One of God’s own prototypes. Some kind of high-powered mutant never even considered for mass production. Too weird to live, and too rare to die.
>
>
>
> – Raoul Duke
>
>