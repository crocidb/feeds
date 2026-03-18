+++
title = "GL.iNet Slate 7"
description = 'A brief review of the \_GL.iNet Slate 7\_ (\_GL-BE3600\_) dual-band Wi-Fi 7 travel router, as well as a comparison to my long-time router, the \_Linksys WRT3200 ACM\_ with \_OpenWrt\_.'
date = "2026-03-12T08:18:50Z"
url = "https://xn--gckvb8fzb.com/gl-inet-slate-7/"
author = "marius@xn--gckvb8fzb.com (Marius)"
text = ""
lastupdated = "2026-03-18T21:57:46.140842938Z"
seen = false
+++

If you happened to have stumbled upon my write-up almost four years ago about [running an open source home area network](/running-an-open-source-home-area-network/), you might know that I’m enjoying a fairly elaborate and mostly FOSS-based infrastructure, that is as lightweight and travel-friendly as possible. Although many things have changed ever since and an update to the original post is well overdue, the fundamentals remained the same: My personal infrastructure has to be as flexible and portable as possible, to fit my ever-changing life.

One key component of my setup had been the *Linksys WRT3200 ACM* router running [*OpenWrt*](https://openwrt.org), an embedded Linux distribution designed primarily for network devices. The *Linksys* has been a reliable piece of equipment for me for now well over five years and besides its dated and somewhat flaky Wi-Fi I have few complaints about the device’s functionality whatsoever. Whenever I needed to move to a new location or travel for prolonged periods of time, however, the approximately 246×194×52mm device (without its four antennas) isn’t exactly the most *travel friendly* at 798g/1.76lb. In addition, the Linksys is powered via its barrel connector and requires a dedicated, external PSU, which in turn usually requires bringing either multiple power socket adapters or, given the limited amount of power outlets in hotel rooms, a single adapter and a *Type A/B* power strip to connect all my electronic devices. This, in turn, brings up the total weight to well over 1kg/2.2lb.

Short story long, I have been on the lookout for a replacement for the aging Linksys for a while now and have ultimately decided to give the *GL.iNet Slate 7* a try, considering that it’s at least *based on* *OpenWrt*. At the hardware level, the *Slate 7* is an interesting take on the *travel router* concept, featuring dual-band Wi-Fi 7 (*802.11be*) with external foldable antennas, dual 2.5 GbE Ethernet ports, a touchscreen, and probably the most important feature to me, USB-C PD input. All in a compact 130×91×34mm package that weighs only 295g/0.65lbs.

Specs
----------

[![](/gl-inet-slate-7/images/gl-inet-slate-7-DSCF0011_hu_ada86ba464979ea2.webp)](/gl-inet-slate-7/images/gl-inet-slate-7-DSCF0011.jpg)

Spec-wise the *Slate 7* is above most *consumer* travel routers, but below full-featured routers with tri-band Wi-Fi 7 and multi-gigabit backbones. The router doesn’t support the 6 GHz band, and hence only does *Multi-Link Operation* (*MLO*) over the 2.4 GHz and the 5 GHz bands.

The exact specifications of the hardware are as follows:

* CPU: Qualcomm Quad-core ≈1.1 GHz
* Memory: 1 GB DDR4 RAM
* Storage: 512 MB Flash
* Ethernet: 1× 2.5 GbE WAN, 1× 2.5 GbE LAN
* Wireless: IEEE *802.11be* (Wi-Fi 7) dual-band
  * Not tri-band, only 2.4 GHz and 5 GHz
  * 160 MHz channels on 5 GHz
  * Maximum theoretical PHY rates
    * 2.4 GHz: 688 Mbps
    * 5 GHz: 2882 Mbps

  * Antennas: 2× foldable external

* USB: 1× USB-A 3.0 for tethering/modem or storage
* Power: USB-C PD compatible (\~5–12 V), usable with powerbanks
* Size: 130×91×34mm
* Weight: 295g/0.65lb

[*GL.iNet*’s documentation](https://docs.gl-inet.com/router/en/4/interface_guide/wireless/#mlo-wi-fi) of the *MLO* feature sadly is misleading/wrong, depicting the 6 GHz band on the screenshot and saying, quote:

>
>
> **Note**: This Wi-Fi band is only available on Flint 3e (GL-BE6500), Flint 3 (GL-BE9300), and Slate 7 (GL-BE3600).
>
>
>
> MLO (Multi-Link Operation) is one of the core features of Wi-Fi 7 (802.11be), designed to improve network performance, significantly reduce latency, and enhance connection stability by utilizing multiple frequency bands simultaneously such as 2.4 GHz, 5 GHz, and 6 GHz.
>
>

For wireless networking aficionados, the aforementioned lack of the 6 GHz band on the *Slate 7* might hence be a deal breaker.

OpenWrt
----------

[![](/gl-inet-slate-7/images/admin01_hu_9bf19d47d6eede6.webp)](/gl-inet-slate-7/images/admin01.png)

The *Slate 7* runs *OpenWrt 23.05-SNAPSHOT* (Kernel 5.4.213) as of the time of writing, with *GL.iNet*’s firmware layer on top. This layer includes *Qualcomm*’s SDK and binary blobs, which is sadly a proprietary mess, as it is with so many devices (e.g. smartphones) running presumed *open-source software* these days.

That said, the device offers full root access via SSH and it’s possible to install *OpenWrt*’s *LuCI UI* if necessary. Even without that, however, it’s possible to configure everything using the `uci` command and the configuration files. This makes it at least slightly more trustworthy than your average [*ASUS* router](https://thehackernews.com/2025/11/wrthug-exploits-six-asus-wrt-flaws-to.html). If you buy this device for its *open-source* flexibility, however, be aware you’re effectively in a *GL.iNet*-flavored *OpenWrt* sandbox with proprietary *Qualcomm* components.

Like every other *OpenWrt* device, the *Slate 7* also implements a package manager that allows you to install additional components from the package repository. One thing that I like is the fact that it comes with *Multi-WAN*, [*WireGuard*](#vpn) and *DNScrypt-proxy2* pre-installed and offers a user-friendly UI to configure these things which, on [my OpenWrt Linksys](/computer/#a0i) took a bit of wrangling to get them right, especially the *Mwan3* part.

Touchscreen
----------

[![](/gl-inet-slate-7/images/gl-inet-slate-7-DSCF0002_hu_2790422bc7ff1868.webp)](/gl-inet-slate-7/images/gl-inet-slate-7-DSCF0002.jpg)

The *Slate 7* tries something unusual for a router in this class, namely a built-in touchscreen for controls, which is another reason I opted for this device.

The touchscreen can display a variety of different things, from your Wi-Fi details with QR-code for quick joining, over VPN status info with on/off toggle, all the way to real-time connection and hardware stats. During firmware upgrades, the touchscreen will display a progress bar with the upgrade process, which is definitely a plus over the *Linksys*.

In its current version, the firmware also implements a *lockscreen* that protects the display with a 4-digit PIN, in case you wouldn’t want others to access your Wi-Fi details or turn off your VPN.

VPN
----------

[![](/gl-inet-slate-7/images/admin02_hu_e5043d51bf1768f8.webp)](/gl-inet-slate-7/images/admin02.png)

Speaking of which, the router supports *WireGuard* with \~500 Mbps throughput, as well as *OpenVPN* with \~380 Mbps peak and integrates with a handful of paid VPN offerings for easy configuration. It’s nevertheless possible to simply import your own configuration.

### Tailscale ###

The *Slate 7* comes with *beta* support for *Tailscale*, which I had briefly tested and which appears to be working without any issues. However, it is not possible to configure advanced *Tailscale* flags via the web interface. If you need a more sophisticated *Tailscale* setup, you will likely have to *hack it* yourself.

Tor
----------

Yes, the *Slate 7* can run a *Tor* node to allow you to browse *Onion* sites from within your network. The feature is marked *beta* but appears to work fairly well. However, the moment *Tor* is enabled, *VPNs*, *DNS*, *AdGuard Home* and *IPv6* will not work properly anymore.

**Note:** These “*will not work properly”* limitations are 100% a *GL.iNet* issue and not caused by *OpenWrt*. The reason I know this is because I had all these services working simultaneously on the *Linksys*, and I had them interconnected in a way that would allow to e.g. perform DNS lookups via Tor, through *DNScrypt-proxy2*. Clearly it’s possible to neatly integrate all these services, but I guess that the *GL.iNet* admin UI simply isn’t there yet, as these integrations require more complex configurations in the background.

AdGuard Home
----------

*AdGuard Home* is part of the default installation of the *Slate 7*. I haven’t tested it so far, mainly because my DNS setup already filters most things out, but judging by the web interface and the manual it seems like *GL.iNet*’s implementation is pretty much *plug-’n-play*.

Network Acceleration
----------

The router has a *Network Acceleration* feature that can be enabled to use hardware acceleration for networking, which reduces CPU load and device heat. However, when enabled, features like *Client Speed and Traffic Statistics*, *Client Speed Limit*, *Parental Control*, and *VPN* with *IPv6* will not work properly, at least with the current firmware version.

Experience (so far)
----------

[![](/gl-inet-slate-7/images/netgear-nighthawk-m2-DSCF0013_hu_2dcde81711e02859.webp)](/gl-inet-slate-7/images/netgear-nighthawk-m2-DSCF0013.jpg)

I’ve had the *Slate 7* for about two months at this point and so far I’m relatively satisfied with how it has been performing. Every now and then I have experienced Wi-Fi reconnects specifically on my [phone](/phone/), however, I was unable to reproduce this behavior on any other device. It appears that these reconnects have something to do with the [*GrapheneOS* *Pixel 8*](/google-pixel-9-released-the-best-time-to-upgrade-to-the-pixel-8-and-grapheneos/) rather than the *Slate 7*.

On the upside, the *Slate 7* supports tethering via its USB-A port, so I can directly attach my *Netgear Nighthawk M2* LTE router and use its mobile connectivity as WAN. Unlike with *Mwan3* on *vanilla OpenWrt*, configuring USB port tethering on the *Slate 7* is a matter of a few clicks.

Slate 7 vs. WRT3200 ACM
----------

[![](/gl-inet-slate-7/images/a0i-DSC06935_hu_35dbf5ad43fd023d.webp)](/gl-inet-slate-7/images/a0i-DSC06935.jpg)

Comparing the *Slate 7* to the full-size *WRT3200* is a bit of an odd thing to do, given that the devices serve different purposes, despite me *misusing* the *Linksys* as a travel router. However, for the sake of comparing a *pure* *OpenWrt* device with the *Slate 7* the experience I’ve had with the *Linksys* serves as a good basis.

### Architectural & Wireless Technology Differences ###

As mentioned before, the *Slate 7* is a modern, Wi-Fi 7 dual-band travel router, integrating dual 2.5 GbE ports, a touchscreen, and USB-C PD input in a compact form factor. It assumes you’re optimizing for portability. In contrast, the *WRT3200 ACM* is a larger SOHO class router from several generations earlier, built around Wi-Fi 5 with *Tri-Stream 160* and *MU-MIMO*. Its hardware (Marvell Armada ARM SoC, 512 MB RAM, 256 MB flash) was high-end in its day and remains capable for routing/firewall throughput on *OpenWrt*, but it lacks the ability to run many modern features sufficiently, e.g. a *WireGuard* VPN client at full speed.

However, perhaps the largest point of divergence is software openness and the Wi-Fi driver stack. The *WRT3200 ACM* enjoys true upstream *OpenWrt* support with builds maintained in the official images, albeit with quirks in its wireless drivers (`mwlwifi`) and some limited features, giving you an experience close to *vanilla OpenWrt* with full package control, firewall, and kernel update paths. However, the price for this openness sadly is Wi-Fi instability and the lack of more up-to-date features.

By contrast, the *Slate 7* runs a *Qualcomm* SDK-based *OpenWrt* fork with proprietary driver blobs for its Wi-Fi 7 PHY, which enables the vendor firmware to provide the advertised Wi-Fi features (e.g., 160 MHz channels). *True vanilla OpenWrt* however isn’t easily available and upstream OpenWrt builds won’t natively support the Qualcomm wireless stack. This means you may be stuck on *GL.iNet*’s cadence for Wi-Fi driver updates unless the community or *Qualcomm* upstreams that support. We can safely assume, though, that this is unlikely to happen. The *Slate 7* is hence *OpenWrt* only *in spirit*.

### Performance ###

[![](/gl-inet-slate-7/images/gl-inet-slate-7-DSCF0010_hu_b0fd125c2e06cfae.webp)](/gl-inet-slate-7/images/gl-inet-slate-7-DSCF0010.jpg)

For raw routing, VLANs, firewall, VPN, and routing policies, both are capable platforms with SSH/LuCI and full package ecosystems. The *Slate 7*’s hardware advantages like better multi-gig throughput, lower power envelope, USB-C PD, and next-gen Wi-Fi PHY, skew it towards users who want high-speed WAN ingress/egress, travel/office portability, and modern client support. Meanwhile, the *WRT3200 ACM* shines as a *classic OpenWrt playground* with strong software freedom and mature community tooling for advanced network setups (e.g., VLAN trunking, policy routing) but doesn’t offer the multi-gigabit wired backbone or next-gen wireless speed of *Slate 7*. While its four 1 GbE LAN ports (+ 1 GbE WAN) still serve well for home and small office LANs, the *Linksys* is clearly outclassed in wired throughput and spectrum efficiency compared to the *Slate 7*.

### Longevity ###

While the *Linksys WRT3200 ACM*’s *OpenWrt* support has at times lagged (e.g. builds stuck at `22.03.x`), its position in the official *OpenWrt* target tree gives it clear upstream maintenance prospects for years to come. The *Slate 7*, on the other hand, may never get full upstream driver support for its *Qualcomm* hardware, leaving its long-term wireless stack reliant on the cooperation between *GL.iNet* and *Qualcomm*, which presents an uncertain future for the device.

If your priority is pure open-source flexibility with a mature community rail-to-rail *OpenWrt* experience, the *WRT3200 ACM* still holds value for many people. However, if you prioritize/need faster throughput and better efficiency, and a travel-ready appliance that still lets you *have it your way* (at least to some extent) via *OpenWrt*, the *Slate 7* seems like a decent choice, albeit with some proprietary caveats around wireless drivers.

Verdict
----------

[![](/gl-inet-slate-7/images/gl-inet-slate-7-DSCF0005_hu_8b0a845dc9c28392.webp)](/gl-inet-slate-7/images/gl-inet-slate-7-DSCF0005.jpg)

The *Slate 7* is a compelling travel router design that bridges modern Wi-Fi tech and OpenWrt customization into an ultra-portable package, but it carries the classic open-source hardware caveat, where the software ecosystem matters as much as the silicon, and only time will tell how that ecosystem is going to develop. If you don’t require portability and prefer a native *OpenWrt* experience, then the [*OpenWrt One*](https://docs.banana-pi.org/en/OpenWRT-One/BananaPi_OpenWRT-One), or, if you can wait, the [*OpenWrt Two*](https://liliputing.com/openwrt-two-will-be-a-higher-performance-router-with-10-gigabit-lan-and-wifi-7-support/), which is going to be produced by *GL.iNet*, might be a better fit for you.

If, however, you’re looking for modern hardware that includes proprietary features at the cost of openness, yet still offers a solid *OpenWrt* basis, the *Slate 7* (or its newer, more powerful, Tri-band capable upgrade, the [*Slate 7 Pro*](https://www.gl-inet.com/products/gl-be10000/)) might be for you.

I will likely stick to the *Slate 7* for travel, as the reduced size and weight of the device, and the ability to power it via USB-C PD makes up for its shortcomings.