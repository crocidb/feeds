+++
title = "The Radxa Linkr"
description = "I’ve done quite a few KVM reviews in the past, and there’s a reason for that: All of the homelab and industrial IoT stuff I test needs some sort of physical access for setup, and even if I do have monitors with multiple input"
date = "2026-10-18T16:46:00Z"
url = "https://taoofmac.com/space/reviews/2026/10/18/1646?utm_content=atom"
author = "Rui Carmo"
text = ""
lastupdated = "2026-10-21T11:46:12.199425654Z"
seen = false
+++

I’ve done quite a few KVM reviews [in the past](/space/blog/2025/02/02/1630#the-sipeed-nanokvm-cube), and there’s a reason for that: All of the homelab and industrial IoT stuff I test needs some sort of physical access for setup, and even if I do have monitors with multiple inputs, USB video capture dongles, etc., it gets really old to have to constantly re-wire stuff, switch between keyboards, etc.

Additionally, most of the newfound range of cheap/compact KVMs that have popped up over the past two years still need an Ethernet connection, and it’s become ridiculously hard to have even semi-permanent test setups–I keep running out of both power and Ethernet ports, and that’s been the reason why I’ve been limping along on Wi-Fi based Pi Zero KVMs as well [as one or two](/space/blog/2024/09/29/1900#the-aurga-viewer-wireless-kvm) KVMs that, sadly, require proprietary apps.

So when I spotted the [Radxa Linkr](https://radxa.com/products/linkr/linkr/?utm_campaign=unsolicited_traffic&utm_medium=web&utm_source=taoofmac.com), I just had to try it. And that was even before I knew I could get it to work with an [AI](/space/ai) agent…

>
>
> **Disclaimer:** [Radxa](https://radxa.com/?utm_campaign=unsolicited_traffic&utm_medium=web&utm_source=taoofmac.com) supplied me with a [Linkr](https://radxa.com/products/linkr/linkr/?utm_campaign=unsolicited_traffic&utm_medium=web&utm_source=taoofmac.com) free of charge, and this review follows my usual [review policy](/space/site/review_policy#review-policy).
>
>

[

Hardware
----------

](/space/reviews/2026/10/18/1646#hardware) <img src="/space/reviews/2026/10/18/1646/linkr-and-accessories.jpg?v=c9c07d2343d1" alt="Radxa Linkr and its supplied cables" width="2048" height="2048"> The Linkr and its supplied cables.

In the box, you get the [Radxa Linkr](https://radxa.com/products/linkr/linkr/?utm_campaign=unsolicited_traffic&utm_medium=web&utm_source=taoofmac.com) and a set of cables (pictured above in real life, and below in the Quick Start guide).

<img src="/space/reviews/2026/10/18/1646/linkr-quick-start.jpg?v=b23c30cfbcaa" alt="Radxa Linkr Quick Start guide showing its ports, accessories and connection options" width="1280" height="863"> The supplied Quick Start guide (image: Radxa).

The [hardware](https://docs.radxa.com/en/linkr/linkr/getting-started/hardware-interface?utm_campaign=unsolicited_traffic&utm_medium=web&utm_source=taoofmac.com) itself is pretty comprehensive, and packs quite a lot into the small 70 x 22 x 12 mm enclosure:

* Rockchip RV1106G3 SoC, with a 1.2GHz Arm Cortex-A7 CPU, a RISC-V co-processor, 1 TOPS NPU and a hardware video encoder.
* 256MB of integrated DDR3L memory.
* 16GB eMMC storage or a microSD card slot (I got the variant with internal storage) for firmware and virtual media.
* HDMI input up to 2560x1440 at 30Hz, with lower-resolution modes including 1920x1080 at 60Hz and custom EDID support.
* Dual-band 2.4GHz/5GHz Wi-Fi 6 using an AIC8800 module, with client and hotspot modes.
* A USB-C device port for keyboard and mouse emulation, power (5V/2A) and firmware flashing.
* A separate USB-C network port for a direct host connection or 10/100Mbps Ethernet through the supplied USB-C to RJ45 cable.
* One FN user button, a system status LED and an HDMI/video status LED.

The device itself is tiny, and the single FN button is used to identify it on the discovery page or (with newer firmware) to toggle the Wi-Fi hotspot with a double press. You can see the USB-C connectors on the back and side through the semi-transparent casing in the photo above.

A nice touch that you will appreciate if you manage many machines is that there are indicator lights that show when someone is remotely connected (the blue power LED will turn green) or there is a video input problem (signalled by a blinking video status LED).

[

### Connectivity and Video Quality ###

](/space/reviews/2026/10/18/1646#connectivity-and-video-quality)

Besides direct USB connectivity to your machine (which I honestly didn’t spend any time on), the Linkr supports both 2.4GHz and 5GHz Wi-Fi. However, it doesn’t seem to support my particular flavour of WPA3 (at least in current firmware versions), so I stuck to 2.4GHz/WPA2 for all of my testing, which is plenty fast enough.

That’s a decent tradeoff for me (I had zero latency issues, although I spend so much time in VDI and remote console setups that I don’t notice delays anymore) and, at least in one of my tests, was the only way I could connect to a machine in a remote corner of the house where 5GHz has very little reach–but it managed 60fps just fine.

The [Linkr](https://radxa.com/products/linkr/linkr/?utm_campaign=unsolicited_traffic&utm_medium=web&utm_source=taoofmac.com) is quite flexible in terms of video capture. I’ve needed to hack in support for custom EDIDs in my old PiKVMs, so it’s nice to see that is baked in, and the built-in HDMI bridge goes from 1280x720@30/60Hz to 2560x1440@30Hz, with standard 1080p in the middle.

I also found it a nice touch that the [Linkr](https://radxa.com/products/linkr/linkr/?utm_campaign=unsolicited_traffic&utm_medium=web&utm_source=taoofmac.com) includes a virtual sound card that it exposes via USB to the target system, although I have had zero use for audio in any of my tests…

[

### Thermals ###

](/space/reviews/2026/10/18/1646#thermals)

The [Linkr](https://radxa.com/products/linkr/linkr/?utm_campaign=unsolicited_traffic&utm_medium=web&utm_source=taoofmac.com), like all devices, does warm up while in use, and its metal underside can be surprisingly warm to the touch–and yet, my IR thermometer didn’t see it get past 45°C even after hours of continuous use (disconnecting, of course, lets it idle cooler).

[

Setup and UX
----------

](/space/reviews/2026/10/18/1646#setup-and-ux)

As you’ve probably divined from the Quick Start shot above, this is a pretty trivial web-based setup: go to [linkr.now](https://linkr.now?utm_campaign=unsolicited_traffic&utm_medium=web&utm_source=taoofmac.com) (with Chrome or Edge, because Apple still hasn’t figured out most of the modern device-related browser APIs), and you get an HTML app that will find the Linkr and help you connect to it – via USB or, later, via Wi-Fi.

The entire thing is very slick, and the user interface is both responsive and easy to navigate–here’s a little slideshow of the original firmware version:

<img src="/space/reviews/2026/10/18/1646/slideshow.jpg?v=642acc904048" alt="Radxa Linkr web interface slideshow" width="1920" height="1080"> A tour of the web interface captured with firmware 1.4.2. [

Software
----------

](/space/reviews/2026/10/18/1646#software)

Firmware updates and release notes are [available on GitHub](https://github.com/radxa-linkr/linkr/releases?utm_campaign=unsolicited_traffic&utm_medium=web&utm_source=taoofmac.com), and since I got mine (v1.4.2), [Radxa](https://radxa.com/?utm_campaign=unsolicited_traffic&utm_medium=web&utm_source=taoofmac.com) has added quite a few new features, as well as a bunch of fixes, in what is today v1.5.2:

* A Plugin Center, which is a sensible way to keep adding more features without changing the core firmware–I haven’t yet had time to investigate how I could build my own, since I only noticed it as I finished this draft.
* ZeroTier and EasyTier support (I use [Tailscale](/space/apps/tailscale) myself, but it’s nice to see options).
* Screenshot OCR to recognise text in screenshots and edit or copy the results (see below); recognition runs locally, and an optional plugin supplies the OCR resources without Internet access.
* Experimental IPv6 support (which works, at least on my LAN).
* FN-button hotspot toggle (double-press it to turn the Wi-Fi hotspot on or off).

One fix in particular was *very* useful already (they fixed resolution switching with the Radxa Dragon Q8B as video input, and I’m still testing that this weekend), and the pace at which they are currently shipping updates is reassuring, even though I couldn’t find published source code for the firmware in the [public repository](https://github.com/radxa-linkr/linkr?utm_campaign=unsolicited_traffic&utm_medium=web&utm_source=taoofmac.com).

Other than that, you get all the typical remote KVM features (as well as [Tailscale](/space/apps/tailscale) support, which I use extensively):

* Video resolution settings (and custom EDID, as pointed out above).
* Wake-on-LAN (for any MAC address, although you can pin the ones you need).
* Keyboard and mouse control (as well as the virtual USB audio capture, all exposed via USB ID `1d6b:0104 - Multifunction Composite Gadget`).

Mouse control can be set to both absolute and relative, as well as reversing the scroll wheel (which I thought was a very nice touch).

However, Mac and iOS users can’t really use some of the more advanced web UI features like screenshots, recordings or screen OCR, because they’re not available in Safari. Some of this is Apple’s problem, but I’ve hacked Safari-compatible screenshot support into other KVMs, so [Radxa](https://radxa.com/?utm_campaign=unsolicited_traffic&utm_medium=web&utm_source=taoofmac.com) can probably improve that.

I did find the screenshot OCR feature interesting, but it requires pretty crisp text, and some SBCs just aren’t willing to play ball on their boot consoles–however, it can be immediately useful in a pinch:

<img src="/space/reviews/2026/10/18/1646/linkr-screenshot-ocr.png?v=3667f3762975" alt="Linkr screenshot OCR showing boot-console text and the recognition results" width="2604" height="912"> Screenshot OCR on a boot console; the recognition results can be edited and copied.

A nice touch about this is that *recognition happens fully in-browser*:

* It uses [`tesseract.js`](https://github.com/naptha/tesseract.js?utm_campaign=unsolicited_traffic&utm_medium=web&utm_source=taoofmac.com) to recognise English and Simplified Chinese.
* By default, it downloads OCR resources over the Internet, including the worker script from `cdn.jsdelivr.net`.
* The screenshot is processed locally by the browser worker, which returns the recognised text and bounding boxes to the UI.

The offline plugin just caches a local copy of the worker, engine and language data inside the [Linkr](https://radxa.com/products/linkr/linkr/?utm_campaign=unsolicited_traffic&utm_medium=web&utm_source=taoofmac.com) itself, removing the external-download requirement.

[

APIs and AI Agent Control
----------

](/space/reviews/2026/10/18/1646#apis-and-ai-agent-control)

But the real reason I am very much enjoying using the [Linkr](https://radxa.com/products/linkr/linkr/?utm_campaign=unsolicited_traffic&utm_medium=web&utm_source=taoofmac.com) is that, unlike most KVMs, it actually [exposes an API](https://docs.radxa.com/en/linkr/linkr/develop-guide?utm_campaign=unsolicited_traffic&utm_medium=web&utm_source=taoofmac.com) that you can either script against or just point your AI agent to.

I have been using that for over a month now to great effect (including doing a couple of [Fedora](/space/os/linux/distributions/fedora) and Windows installs, which is a veritable quagmire of edge cases) and [built a piclaw add-on you can use as a reference](https://github.com/rcarmo/piclaw-addons/tree/main/addons/linkr?utm_campaign=unsolicited_traffic&utm_medium=web&utm_source=taoofmac.com).

The [release notes](https://github.com/radxa-linkr/linkr/releases?utm_campaign=unsolicited_traffic&utm_medium=web&utm_source=taoofmac.com) also describe new API controls for resolution and video quality, which my add-on doesn’t cover yet. But the basic screenshot and input controls work *amazingly* well if you pair them with a vision-enabled model, and are really simple:

The [documented public API](https://docs.radxa.com/en/linkr/linkr/develop-guide?utm_campaign=unsolicited_traffic&utm_medium=web&utm_source=taoofmac.com) uses an access token in the `Authorization: token <token>` header, and boils down to two endpoints:

* `GET /api/public/snapshot` returns the current screen as a JPEG.
* `POST /api/public/control` accepts an ordered `events` array containing keyboard, mouse, text and delay operations.

The control primitives are small enough to wrap directly in agent tools:

* `keyboard` presses or releases keys using browser `KeyboardEvent.code` names, so combinations are sequences of key-down and key-up events.
* `mouse_abs` positions the pointer using normalised coordinates between 0 and 1 (this can be a little tricky for some models, but they get it eventually).
* `mouse_rel` moves it by pixel offsets (both support mouse buttons and scrolling).
* `text` types up to 1024 characters, limited to printable ASCII, tabs and newlines.
* `delay` pauses between events for a specified number of milliseconds (useful when the target needs time to react).

That gives an agent the usual screenshot/action loop without installing anything on the target machine.

I had to burn through quite a few tokens in initial testing (and the skills my add-on bundles are the result of that), but you should be able to use a relatively cheap model to automate typical system administration tasks, as long as it supports vision.

Can it do fully unattended installations? Well… It’s tricky. Can *you* figure out when to enter the BIOS on a random machine and what key to press? That is so variable across machines (and sometimes even on the same machine) that the only way I got it to work was to get into the BIOS (after a few tries), pick the boot volume myself and then hand over to `piclaw`.

The results and reliability are highly dependent on the AI model you use. I’ve had good experiences with `astra`, `opus` or `sol` on a variety of desktop automation tasks, and they were all able to use the [Linkr](https://radxa.com/products/linkr/linkr/?utm_campaign=unsolicited_traffic&utm_medium=web&utm_source=taoofmac.com) to go through a standard OS installer. I also got them to check Windows updates (clicking through all the steps and choosing when to reboot) and even do console `rpm-ostree` and `flatpak` updates (and reboots) without any issues except the high token count that comes with handling screenshots (and model-side OCR).

This is what currently makes the [Linkr](https://radxa.com/products/linkr/linkr/?utm_campaign=unsolicited_traffic&utm_medium=web&utm_source=taoofmac.com) worth looking at if you want to automate hardware setup, with the caveat that it can, indeed, do away with the odd bit of drudgery, but you need to be smart about how to do it (only retrieving screenshots at intervals/decision points to save tokens, for instance) and, preferably, script things so that the model is only really phoning it in.

For me it was almost a straight conversion of some of the stuff I’ve actually been doing in [Proxmox](/space/os/linux/distributions/proxmox#proxmox-ve) for a while, so it’s nice to have a way to set up a blank box.

[

Minor Hassles
----------

](/space/reviews/2026/10/18/1646#minor-hassles)

Hardware-wise, I should note that you can’t hit a reset button with the [Linkr](https://radxa.com/products/linkr/linkr/?utm_campaign=unsolicited_traffic&utm_medium=web&utm_source=taoofmac.com), so if your hardware doesn’t honour `Ctrl+Alt+Del`, you’re stuck. Other KVMs have dedicated interfaces to do that (and you can always use a smart plug, like I do with my test SBCs), but it’s something to keep in mind.

Additionally, I’ve had a couple of instances where the [Linkr](https://radxa.com/products/linkr/linkr/?utm_campaign=unsolicited_traffic&utm_medium=web&utm_source=taoofmac.com) had a little trouble fitting directly into PCs or SBCs (including [Radxa](https://radxa.com/?utm_campaign=unsolicited_traffic&utm_medium=web&utm_source=taoofmac.com)’s own) because of lack of clearance around the HDMI port or having the USB-C port on the side (which in a few cases meant it would point straight into the desk).

Nothing that you can’t fix with an HDMI extension cable (I used a Chromecast male-to-female extension, which is around 10cm), but worth mentioning since it doesn’t come in the box.

Another minor hassle is that if you power the [Linkr](https://radxa.com/products/linkr/linkr/?utm_campaign=unsolicited_traffic&utm_medium=web&utm_source=taoofmac.com) directly from your target device, many devices (even standard PCs) won’t power up USB until they’ve gone past display initialisation, so the [Linkr](https://radxa.com/products/linkr/linkr/?utm_campaign=unsolicited_traffic&utm_medium=web&utm_source=taoofmac.com) may skip UEFI/BIOS screens while it boots.

When testing SBCs, I had to use that power/data splitter cable to keep the [Linkr](https://radxa.com/products/linkr/linkr/?utm_campaign=unsolicited_traffic&utm_medium=web&utm_source=taoofmac.com) powered up independently–otherwise it would boot up *after* the servers had tried (and failed) to initialise HDMI, so I’d get no video out (and, depending on device, they wouldn’t reactivate HDMI after USB input or Wake-on-LAN, either).

[

Verdict
----------

](/space/reviews/2026/10/18/1646#verdict)

I’m obviously biased towards anything that lets me put a machine on Wi-Fi and get at it through a browser without installing yet another proprietary app, so the [Linkr](https://radxa.com/products/linkr/linkr/?utm_campaign=unsolicited_traffic&utm_medium=web&utm_source=taoofmac.com) already had quite a bit going for it.

But having an API that I can script against, or hand over to an agent once I’ve persuaded the machine to boot from the right device, makes it considerably more useful for the sort of testing I do, and I am quite likely to replace some of my other KVMs with [Linkr](https://radxa.com/products/linkr/linkr/?utm_campaign=unsolicited_traffic&utm_medium=web&utm_source=taoofmac.com)s solely to free up Ethernet ports.

I’ll still need the odd HDMI extension and a separate power supply for a few machines (especially ARM ones), but at least the wiring will be much easier, and who knows, I might even start testing more than one SBC at once…