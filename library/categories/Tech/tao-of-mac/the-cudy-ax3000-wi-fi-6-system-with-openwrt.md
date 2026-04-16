+++
title = "The Cudy AX3000 Wi-Fi 6 System (with OpenWRT)"
description = "As I’ve been writing about once or twice, I’ve recently upgraded my Wi-Fi after an attempt to use ISP-provided equipment to replace my remarkably long-lasting (and extremely reliable) [Airport Extreme](/space/com/app"
date = "2025-09-14T16:30:00Z"
url = "https://taoofmac.com/space/reviews/2025/09/14/1630?utm_content=atom"
author = "Rui Carmo"
text = ""
lastupdated = "2026-04-15T10:42:49.416664579Z"
seen = true
+++

As I’ve been writing about [once](/space/notes/2025/08/17/1545) or [twice](/space/notes/2025/08/31/2200), I’ve recently upgraded my Wi-Fi after an attempt to use ISP-provided equipment to replace my remarkably long-lasting (and extremely reliable) [Airport Extreme](/space/com/apple/airport/extreme) base stations.

The short of it is that I ended up getting a few [Cudy M3000](https://www.amazon.es/gp/product/B0DH5BK26K/ref=as_li_tl?_encoding=UTF8&tag=taoofmac-21&linkCode=ur2&camp=3638&creative=24630&utm_source=taoofmac.com&utm_medium=web&utm_campaign=unsolicited_traffic&utm_content=external_link) and setting up [OpenWRT](os/linux/openwrt) on them:

<img alt="The M3000 standalone router/access point" src="https://taoofmac.com/media/reviews/2025/09/14/1630/QfMA3Rk5ygLOffOJsnLU1sWswV8=/cudy_hero.jpg" width="1280" height="1280" style="max-width: 100% !important;height: auto !important;">The M3000 standalone router/access point

>
>
> **Disclaimer:** Although I sought out (and paid for) several [M3000](https://www.amazon.es/gp/product/B0DH5BK26K/ref=as_li_tl?_encoding=UTF8&tag=taoofmac-21&linkCode=ur2&camp=3638&creative=24630&utm_source=taoofmac.com&utm_medium=web&utm_campaign=unsolicited_traffic&utm_content=external_link) units myself, I’m following my standard format and [review policy](/space/site/review_policy) for consistency, since this is more or less a “review”.
>
>

The long of it has been a somewhat fun journey, so here’s the full story.

[

The Story So Far
----------

](/space/reviews/2025/09/14/1630#the-story-so-far)

In case you’ve landed here without any context, I recently [switched ISPs](/space/notes/2025/08/10/2100) and the initial configuration included a set of Wi-Fi 7 extenders to replace my (very) long-lived [Airport Extreme](/space/com/apple/airport/extreme) base stations.

This was a somewhat protracted thing and I had plenty of time to lay down the groundwork by [upgrading my LAN to 2.5GbE Ethernet with a few 10GbE ports](/space/reviews/2025/08/03/1900), but after a week of living with the system [I decided I wanted something I could manage myself](/space/notes/2025/08/17/1545) due to a bunch of management restrictions and outright compatibility problems I could not re-configure it to overcome, because everything is locked out by my ISP.

My functional requirements were pretty clear:

* **Fully local, browser-based management** (I don’t mind managing each device individually).
* **Absolutely *zero* cloud management features**. Zilch. Nada. No setting up a user account with the vendor or any external dependencies (I don’t want or need off-site remote management—and if I did, I could set it up myself.)
* **No mobile apps required** (or desirable) for either initial setup or daily tweaks (which was something I actually didn’t like about the [Airport Extremes](/space/com/apple/airport/extreme) even if it was very convenient to have management baked into iOS).
* **Not an ugly arachnoid eyesore** (we can’t hang access points off walls or ceilings, and the Airport Extremes became effectively invisible in plain sight).

And the [M3000](https://www.amazon.es/gp/product/B0DH5BK26K/ref=as_li_tl?_encoding=UTF8&tag=taoofmac-21&linkCode=ur2&camp=3638&creative=24630&utm_source=taoofmac.com&utm_medium=web&utm_campaign=unsolicited_traffic&utm_content=external_link) doesn’t look half bad compared to an [Airport Extreme](/space/com/apple/airport/extreme), so that was *definitely* a reason for me to take a second look (they come in black too, but the white ones were drop-in replacements for the Airports in our decor).

<img alt="As you can see, they are pretty neutral. I will miss the extra LAN and USB ports, though." src="https://taoofmac.com/media/reviews/2025/09/14/1630/GGbDadDDTpNqaZ1XSrsowRmfQSk=/cudy_side_by_side.jpg" width="2048" height="1024" style="max-width: 100% !important;height: auto !important;">As you can see, they are pretty neutral. I will miss the extra LAN and USB ports, though.

Technically, I had a few more requirements:

* I wanted “dumb” access points. No routing, no meshing, no weird/proprietary vendor features—just a box able to turn Ethernet packets into radio and back again.
* I decided to aim for Wi-Fi 6/6E (I quickly realized that we only have a couple of MacBooks able to do Wi-Fi 7 and that most of our devices are Wi-Fi 6 capable).
* Full control over all Wi-Fi features (channel, SSIDs, power, etc.) with support for an arbitrary number of SSIDs (with VLAN mapping of each) on both 2.4/5 GHz (or 6 GHz if available).
* No band steering (it does not really work in our scenario, and one of the biggest gripes I had with our ISP setup was that I couldn’t turn it off).
* 2.5GbE backhaul (gigabit-plus Wi-Fi is useless if you can’t pipe it through.)
* *At least one* pass-through Ethernet port (the Airport Extreme has three additional GbE ports, which is still apparently a premium configuration over a decade later but has proven very, very handy)

[OpenWRT](os/linux/openwrt) was not really a requirement, but since my first-ever Wi-Fi access points were indeed [WRT54G](/space/com/linksys/wrt54g) devices and I have [a *long* history](/space/com/linksys/wrt54g3g-eu) with it, that’s where I started my research, and [Cudy](https://www.cudy.com/en-eu?utm_source=taoofmac.com&utm_medium=web&utm_campaign=unsolicited_traffic&utm_content=external_link) hardware had quite a few positive references.

Moreover, they actually provide instructions on how to re-flash their devices with [OpenWRT](os/linux/openwrt), and there is an upgrade path to the currently supported version (as well as a likely runway of official [OpenWRT](os/linux/openwrt) support for a few years at least), so they soon rose to the top of my list.

[

Factory Firmware
----------

](/space/reviews/2025/09/14/1630#factory-firmware)

The factory firmware is actually *very* nice, and makes an excellent job of exposing all of the features as well as guiding users through initial setup of the devices either as a router or as an access point in various configurations:

<img src="https://taoofmac.com/media/reviews/2025/09/14/1630/xR9fsWz4QX8oZmxD7Tp-5TggbXE=/cudy_ui.jpg" style="max-width: 100%;height: auto;width: 100%" alt="Static screenshot of the Cudy web interface" width="1724" height="1080"> The base Cudy UI is very comprehensive.

I didn’t run it for long, but it seems to do a very good job of exposing both [OpenWRT](os/linux/openwrt) core functionality and the additional features [Cudy](https://www.cudy.com/en-eu?utm_source=taoofmac.com&utm_medium=web&utm_campaign=unsolicited_traffic&utm_content=external_link) added. Although I didn’t install their app or tried to manage it remotely, I’d say most people would be well served by the factory firmware–and since it even supports TR069 for carrier remote management, ISPs probably should take a look at it too.

But my objective was to make sure I had full control of the hardware and run these on the latest vanilla [OpenWRT](os/linux/openwrt), so there were a few more steps involved.

[

Conversion Process
----------

](/space/reviews/2025/09/14/1630#conversion-process)

The first thing I needed to do was unlock the factory firmware. The white/grey devices I have are “V2” hardware, but [Cudy](https://www.cudy.com/en-eu?utm_source=taoofmac.com&utm_medium=web&utm_campaign=unsolicited_traffic&utm_content=external_link) themselves say that the firmware is identical to the V1 (which is black with red trimming) and provide a vanilla [OpenWRT](os/linux/openwrt) 23.05 image, so I started out with that.

The [Cudy support page](https://www.cudy.com/en-eu/blogs/faq/openwrt-software-download?utm_source=taoofmac.com&utm_medium=web&utm_campaign=unsolicited_traffic&utm_content=external_link) links to their [Google Drive](https://drive.google.com/drive/folders/1BKVarlwlNxf7uJUtRhuMGUqeCa5KpMnj?utm_source=taoofmac.com&utm_medium=web&utm_campaign=unsolicited_traffic&utm_content=external_link), where you can download the `M3000 V1.zip` file (for both V1/V2).

That ZIP file contains a Windows version of `tftpd` (which is an extra nice touch, even if it triggers a bunch of virus warnings), a comprehensive set of instructions for Windows users in a PDF and a few firmware files, which we’ll get to in a moment.

To get the latest supported firmware, I went to the [OpenWRT Firmware Selector](https://firmware-selector.openwrt.org?utm_source=taoofmac.com&utm_medium=web&utm_campaign=unsolicited_traffic&utm_content=external_link) and looked for the Cudy M3000, downloading the latest `sysupgrade` file. I downloaded `24.10.2 (r28739-d9340319c6)`.

I then set up `tftpd` on one of my [Fedora](os/linux/fedora) laptops (because, I don’t have personal Windows machines anymore) and wired it up to the LAN port on the [M3000](https://www.amazon.es/gp/product/B0DH5BK26K/ref=as_li_tl?_encoding=UTF8&tag=taoofmac-21&linkCode=ur2&camp=3638&creative=24630&utm_source=taoofmac.com&utm_medium=web&utm_campaign=unsolicited_traffic&utm_content=external_link).

To enable it to get at the `recovery.bin` file via TFTP, I copied that file to `/var/lib/tftpboot`, set my laptop to IP address `192.168.1.88` and restarted `tftpd`.

I then held down the power button on the [M3000](https://www.amazon.es/gp/product/B0DH5BK26K/ref=as_li_tl?_encoding=UTF8&tag=taoofmac-21&linkCode=ur2&camp=3638&creative=24630&utm_source=taoofmac.com&utm_medium=web&utm_campaign=unsolicited_traffic&utm_content=external_link), plugged in the barrel jack, waited until the lights settled (solid red in my case) and then reset my laptop to use DHCP, because the next step is to log in to the (now unlocked) [Cudy](https://www.cudy.com/en-eu?utm_source=taoofmac.com&utm_medium=web&utm_campaign=unsolicited_traffic&utm_content=external_link) web UI at `http://192.168.10.1`.

Once you’re there, go to Advanced Settings/Firmware and upload `cudy_m3000-v1-sysupgrade.bin` (checksum `d09cdb39e9544b1d33a4daf28964c50b`), which is also provided in the ZIP file.

This gives you a vanilla [OpenWRT](os/linux/openwrt) 23.05 install, and you then go to `http://192.168.1.1/cgi-bin/luci/admin/system/flash`, upload the 24.10.2 file and… you’re done.

[

### TL;DR ###

](/space/reviews/2025/09/14/1630#tl-dr)

* Connect to the LAN port.
* Set your IP address to `192.168.1.88`.
* Start `tftpd` with the `recovery.bin` file in `/var/lib/tftpboot`.
* Plug in the power jack while holding the power button, wait until the lights settle (solid red in my case).
* Reconfigure your machine from `192.168.1.88` to DHCP.
* Log in to the [Cudy](https://www.cudy.com/en-eu?utm_source=taoofmac.com&utm_medium=web&utm_campaign=unsolicited_traffic&utm_content=external_link) web UI (`http://192.168.10.1`), go to Advanced Settings/Firmware and upload `cudy_m3000-v1-sysupgrade.bin` (`d09cdb39e9544b1d33a4daf28964c50b`).
* Wait for it to reboot.
* Go to `http://192.168.1.1/cgi-bin/luci/admin/system/flash` and upload the 24.10.2 sysupgrade image.

[

OpenWRT Configuration
----------

](/space/reviews/2025/09/14/1630#openwrt-configuration)

I initially got a standalone unit to test and then bought a 3-pack and another standalone unit (to keep as a cold spare), so I had a working configuration I could use to set up the new nodes way before I got them all.

Over that initial week with the first unit, I sorted out all of the details:

* Disabled the built-in DHCP server
* Added both Ethernet ports to the `br-lan` bridge to allow pass-through (this way I can plug an Apple TV or similar directly into the gigabit port)
* Set the timezone, checked that NTP worked correctly, etc.
* Installed `rsync` and `luci-app-statistics` to play around with configuration files and monitoring
* Set up the 2.4GHz radio for a “compatibility mode” that wouldn’t frustrate my IoT devices (including the many low bitrate ESP32s lying around)
* Set up WPA3 on the 5GHz radio to enable full `802.11ax` data rates (I also punched up the channel width to 160Mhz and set up `802.11r` for faster hand-overs)

This bit is probably the most interesting for everyone, so here’s a redacted version of my initial `/etc/config/wireless`:

```
config wifi-device 'radio0'
    option type 'mac80211'
    option path 'platform/soc/18000000.wifi'
    option channel 'auto'
    option band '2g'
    option htmode 'HT40'
    option legacy_rates '1'
    option country 'PT'
    option cell_density '1'

config wifi-iface 'default_radio0'
    option device 'radio0'
    option network 'lan'
    option mode 'ap'
    option ssid 'my_ssid'
    option encryption 'psk-mixed'
    option key 'my_key'
    option ieee80211r '1'
    option mobility_domain 'dead'
    option ft_over_ds '0'
    option ft_psk_generate_local '1'

config wifi-device 'radio1'
    option type 'mac80211'
    option path 'platform/soc/18000000.wifi+1'
    option channel 'auto'
    option band '5g'
    option htmode 'HE160'
    option cell_density '1'
    option country 'PT'

config wifi-iface 'default_radio1'
    option device 'radio1'
    option network 'lan'
    option mode 'ap'
    option ssid 'my_5GHz_ssid'
    option encryption 'sae'
    option key 'my_5GHz_key'
    option ocv '1'
    option ieee80211r '1'
    option mobility_domain 'beef'
    option ft_over_ds '0'
    option dtim_period '3'

```

To set up the other nodes, I just uploaded the first one’s configuration backup, changed the hostname and IP address (given the vagaries of our new home gateway, I opted for static IPs) and plugged them in.

[

Performance
----------

](/space/reviews/2025/09/14/1630#performance)

My iPhone and MacBook Pro can both do 1.2 Gbps down / 1.5 Gbps up within 2–3 meters of any of the access points when connecting to our internal OpenSpeedTest instance—which I’m hosting on one of my [TerraMaster](/space/blog/2024/12/26/2330)’s 10GbE interfaces:

<img alt="OpenSpeedTest hosted on my 10GbE NAS" src="https://taoofmac.com/media/reviews/2025/09/14/1630/TFuQON5DiV3TOb37PWsboEHjmsQ=/cudy_speedtest.png" width="1280" height="658" style="max-width: 100% !important;height: auto !important;">OpenSpeedTest hosted on my 10GbE NAS

Running a second simultaneous test gives obviously lower (but similar) individual results and maxes out the 2.5GbE uplink, so I would say this is about as good as it’s ever going to get, since I suspect that even if we were using Wi-Fi 7 and 6GHz, physics and the 2.5GbE backhaul would start factoring in.

Again, this is in a pure “flat” configuration, with all physical interfaces and radios set as part of the `br-lan`–no routing is taking place, and no layer 3 handling is happening.

Our staple latency test (streaming games using Steam Link from a 2.5GbE server) is buttery smooth, but then again it was already good with the [Airport Extremes](/space/com/apple/airport/extreme) (you only really need 30-50Mbps for crisp 1080p streaming), and the [Logitech G Cloud](/space/blog/2024/02/03/2000) (which, ironically, has worse Wi-Fi than any of our iPads) works perfectly.

But I’ll let the data speak for itself:

<img alt="PHY bitrate in my living room" src="https://taoofmac.com/media/reviews/2025/09/14/1630/5k3iohpY4emdK6Wr-_rKuIFdqJM=/cudy_phy.png" width="931" height="222" style="max-width: 100% !important;height: auto !important;">PHY bitrate in my living room

This is the same kind of performance I was getting with the Wi-Fi 7 extenders from my ISP, but:

* I can now *see* it, monitor it and dive into the nitty-gritty details at will instead of having to guess what was happening.
* Even though it’s not Wi-Fi 6E, it is a massive improvement over the sub-300 Mbps I was getting from the Apple Airport Extremes.

So I’m calling this a success performance-wise.

[

Stability
----------

](/space/reviews/2025/09/14/1630#stability)

There is some occasional flip-flopping between access points, but that only happens in Linux and in places where coverage has strong overlap, so I’m not worried about it (I can always turn off `802.11r` if it becomes a nuisance, and I consider it an experiment, not a requirement):

<img alt="This is a good example--I see a similar pattern in the nearest AP to this one" src="https://taoofmac.com/media/reviews/2025/09/14/1630/FZ9huuu8MOW_JhtK_pbrBUOLC4M=/cudy_flipflop.png" width="931" height="222" style="max-width: 100% !important;height: auto !important;">This is a good example--I see a similar pattern in the nearest AP to this one

Looking at the logs from both APs involved it seems to be a client issue:

```
Sun Sep  7 09:50:00 2025 daemon.notice hostapd: phy1-ap0: STA a6:a8:e5:87:20:d0 IEEE 802.11: did not acknowledge authentication response
Sun Sep  7 09:50:46 2025 daemon.notice hostapd: phy1-ap0: STA a6:a8:e5:87:20:d0 IEEE 802.11: did not acknowledge authentication response
Sun Sep  7 09:50:48 2025 daemon.info hostapd: phy1-ap0: STA a6:a8:e5:87:20:d0 IEEE 802.11: associated (aid 5)
Sun Sep  7 09:50:48 2025 daemon.notice hostapd: phy1-ap0: AP-STA-CONNECTED a6:a8:e5:87:20:d0 auth_alg=sae
Sun Sep  7 09:50:48 2025 daemon.info hostapd: phy1-ap0: STA a6:a8:e5:87:20:d0 WPA: pairwise key handshake completed (RSN)
Sun Sep  7 09:50:48 2025 daemon.notice hostapd: phy1-ap0: EAPOL-4WAY-HS-COMPLETED a6:a8:e5:87:20:d0
Sun Sep  7 09:54:34 2025 daemon.info hostapd: phy1-ap0: STA a6:a8:e5:87:20:d0 IEEE 802.11: authenticated
Sun Sep  7 09:54:45 2025 daemon.notice hostapd: phy1-ap0: AP-STA-DISCONNECTED a6:a8:e5:87:20:d0

```

This hasn’t recurred, but I will be keeping an eye on things–and if you want to dig deeper into `802.11r` configuration, [this great page](https://www.libe.net/en/wlan-roaming?utm_source=taoofmac.com&utm_medium=web&utm_campaign=unsolicited_traffic&utm_content=external_link) has a bunch of detail on it.

So far there haven’t been any unexpected behaviors, and since I am not using band steering (which you can add by installing `usteer` or `dawn` and their corresponding `luci` packages, by the way) everything’s been fine with my legacy devices.

[

FAQ
----------

](/space/reviews/2025/09/14/1630#faq)

While I was going through this process, I got a bunch of feedback from people online:

* **Why not UniFi?** Value for money, plain and simple. I have used Ubiquiti devices before, but I wasn’t going to pay three digits for a “dumb” access point and don’t need most of their features.
* **Why not Wi-Fi 7?** There isn’t anything similar with Wi-Fi 6E/7 support and 2.5GbE backhaul yet–at least not anywhere near this price point. [Cudy](https://www.cudy.com/en-eu?utm_source=taoofmac.com&utm_medium=web&utm_campaign=unsolicited_traffic&utm_content=external_link) does have other models, but they haven’t released unlocked [OpenWRT](os/linux/openwrt) firmware (yet, I hope) and besides, I am already getting gigabit-plus speeds for all my devices.
* **What about meshing?** It’s useless for me. We have reinforced concrete walls and two lift shafts in the middle of our flat and even 2.4 GHz has issues, which is partly why I made sure we have at least two Ethernet jacks in each room when we renovated over twenty years ago.
* **What about roaming?** This is a home (office), not an independent country. Standard Wi-Fi handovers work fine even if you walk around the house on a video call. I enabled `802.11r` anyway but see no need for it.
* **What about central management?** It’s *just four* active devices, and they’re all set up as “dumb” access points, so there isn’t a lot to manage except when I’m setting up a new VLAN or need a test SSID. Gathering stats off [`luci-app-statistics`](https://openwrt.org/docs/guide-user/luci/luci_app_statistics?utm_source=taoofmac.com&utm_medium=web&utm_campaign=unsolicited_traffic&utm_content=external_link) via `collectd` is a wheel that’s already been invented, so I don’t need a controller for that.

All in all, I don’t even need the LuCI web UI, and if I need to test a complex configuration I can hack something together with `ssh` and `ansible` for reproducibility in around 30 minutes.

[

Conclusion
----------

](/space/reviews/2025/09/14/1630#conclusion)

The [Cudy AX3000/M3000](https://www.amazon.es/gp/product/B0DDKVHXHL/ref=as_li_tl?_encoding=UTF8&tag=taoofmac-21&linkCode=ur2&camp=3638&creative=24630&utm_source=taoofmac.com&utm_medium=web&utm_campaign=unsolicited_traffic&utm_content=external_link) models make for pretty great [Airport Extreme](/space/com/apple/airport/extreme) replacements, and in this age of networking devices with cloud features nobody asked for [OpenWRT](os/linux/openwrt) turns them into very nice locally managed access points that I will never have to worry about again (until I break the configuration myself, of course).

Although it is much too early to weigh in on hardware reliability (some of the `802.11ac` [Airport Extremes](/space/com/apple/airport/extreme) I was using were manufactured over a decade ago), the price/performance ratio is great, and right now I don’t mind it not being Wi-Fi 7.

After all, it took almost ten years for the 2.4GHz band to become saturated in my building, and it doesn’t look as if the 5GHz band is going to be massively swamped anytime soon, so I’m expecting something like 3-4 years of hassle-free operation if the hardware holds up.

A relevant thing I should point out again is that people who have less need for low-level control might actually be fine with the stock firmware—I did not use it extensively (nor did I try the [Cudy](https://www.cudy.com/en-eu?utm_source=taoofmac.com&utm_medium=web&utm_campaign=unsolicited_traffic&utm_content=external_link) app or any of the router/firewall features), but it already exposes a lot more functionality (and seems a lot more flexible) than ISP gear, so I would encourage people to give it a go.

I suspect I will eventually come across some [OpenWRT](os/linux/openwrt) corner cases as I succumb to the temptation to fiddle with the configuration a bit more, but given our particular situation there’s a very high chance these will just fade into the background and “just work”, which was the ideal outcome that Apple pretty much nailed with the [Airport Extremes](/space/com/apple/airport/extreme)…

>
>
> **Update, September 24, 2025:** I decided to tweak my settings a little bit and enabled 802.11k/v on both radios, which seems to have improved the flip-flopping. That meant upgrading `wpad-basic-mbedtls` to the full version (`opkg update && opkg remove wpad-basic-mbedtls && opkg install wpad-mbedtls`) and the following settings:
>
>

```
config wifi-device 'radio0'
        option type 'mac80211'
        option path 'platform/soc/18000000.wifi'
        option channel 'auto'
        option band '2g'
        option htmode 'HT40'
        option legacy_rates '1'
        option country 'PT'
        option cell_density '1'

config wifi-iface 'default_radio0'
        option device 'radio0'
        option network 'lan'
        option mode 'ap'
        option ssid 'my_ssid'
        option encryption 'psk-mixed'
        option key 'my_key'
        option ieee80211r '1'
        option mobility_domain 'dead'
        option ft_over_ds '0'
        option ft_psk_generate_local '1'
        option ieee80211k '1'
        option wnm_sleep_mode '1'
        option wnm_sleep_mode_no_keys '1'
        option bss_transition '1'
        option proxy_arp '1'

config wifi-device 'radio1'
        option type 'mac80211'
        option path 'platform/soc/18000000.wifi+1'
        option channel 'auto'
        option band '5g'
        option htmode 'HE160'
        option cell_density '1'
        option country 'PT'

config wifi-iface 'default_radio1'
        option device 'radio1'
        option network 'lan'
        option mode 'ap'
        option ssid 'my_5GHz_ssid'
        option encryption 'sae'
        option key 'my_5GHz_key'
        option ocv '1'
        option ieee80211r '1'
        option mobility_domain 'beef'
        option ft_over_ds '0'
        option dtim_period '3'
        option ieee80211k '1'
        option wnm_sleep_mode '1'
        option wnm_sleep_mode_no_keys '1'
        option bss_transition '1'
        option proxy_arp '1'

```

I suspect I might have to tweak the `802.11k` settings a bit more, but so far it seems to be working well.

>
>
> **Update, December 2025:** I've been told that [Cudy] has updated their [OpenWRT page][cudy\_support] with newer firmware versions, so if you're doing this now, make sure to check there first since new hardware revisions (serial numbers starting with 2543) require a different recovery image (good thing I bought a spare unit to keep things uniform). So far, I've had zero issues with any of mine.
>
>

[

One More Update
----------

](/space/reviews/2025/09/14/1630#one-more-update)

After a few more months of living with these, I ended up revisiting the 5GHz configuration. The main thing I changed was to stop trying to be clever with `HE160`. It *did* work, and on paper it looked great (those headline PHY rates are always tempting), but in practice it made the whole setup feel a bit too fussy for a house where I care more about moving around on FaceTime calls and carrying on with work than about wringing the last possible megabit out of a speed test. In hindsight this was fairly obvious: `HE160` is a lot of channel width to throw at a multi-AP setup, and I was also leaving channel selection on `auto`, which wasn’t helping matters.

So I simplified things.

I kept the 5GHz SSID as the “good” network – WPA3, `802.11r`, `802.11k`, `802.11v`, all the usual niceties – but moved the radios to `HE80` and assigned fixed channels to each AP. That gave me a much saner setup: lower theoretical peak rates, yes, but much better behaviour in day-to-day use.

The current 5GHz plan is now:

* AP 1: channel `36`
* AP 2: channel `52`
* AP 3: channel `100`
* AP 4: channel `116`

And the relevant [OpenWRT](os/linux/openwrt) configuration now looks like this:

```
config wifi-device 'radio1'
        option type 'mac80211'
        option path 'platform/soc/18000000.wifi+1'
        option channel '36'   # vary per AP: 36 / 52 / 100 / 116
        option band '5g'
        option htmode 'HE80'
        option cell_density '1'
        option country 'PT'

config wifi-iface 'default_radio1'
        option device 'radio1'
        option network 'lan'
        option mode 'ap'
        option ssid '7 5GHz'
        option encryption 'sae'
        option key '...'
        option ocv '1'
        option ieee80211r '1'
        option mobility_domain 'beef'
        option ft_over_ds '0'
        option dtim_period '3'
        option ieee80211k '1'
        option wnm_sleep_mode '1'
        option wnm_sleep_mode_no_keys '1'
        option bss_transition '1'
        option proxy_arp '1'

```

The rationale is simple enough:

* `HE160` is fine if you care more about peak throughput than roaming, but I don’t.
* Fixed channels make overlap and neighbour relationships much easier to reason about.
* `802.11r` only really makes sense if all APs serving a given SSID are configured consistently, so tidiness matters more than “advanced” settings.
* Keeping the 2.4GHz network as the compatibility lane for older and IoT devices is still the right trade-off here.

So far this seems to have paid off. The 5GHz metrics now look much more sensible, and the APs are behaving in a way that feels a lot closer to what I wanted in the first place.

The other thing I finally got around to doing was centralising the AP metrics. I already had [`luci-app-statistics`](https://openwrt.org/docs/guide-user/luci/luci_app_statistics?utm_source=taoofmac.com&utm_medium=web&utm_campaign=unsolicited_traffic&utm_content=external_link) and `collectd` on all of them, so rather than inventing some sort of controller story for a handful of dumb APs, I just pointed them all at the Graphite instance I already had on the network. This turned out to be mildly more annoying than expected, because although `collectd-mod-write-graphite` is available, the LuCI-side renderer for it wasn’t present on these installs – so adding a UCI block under `luci_statistics` wasn’t enough to get a runtime config generated.

The package installation itself is straightforward:

```
opkg update
opkg install collectd-mod-write-graphite

```

The part that actually mattered was dropping a native `collectd` include file into place:

```
LoadPlugin write_graphite
<Plugin write_graphite>
  <Node "graphite">
    Host "192.168.1.250"
    Port "2003"
    Protocol "tcp"
    Prefix "collectd."
    Postfix ""
    StoreRates true
    AlwaysAppendDS false
    EscapeCharacter "_"
  </Node>
</Plugin>

```

That lives in:

```
/etc/collectd/conf.d/write_graphite.conf

```

and after that it was just a matter of restarting `collectd`:

```
/etc/init.d/collectd restart

```

That was enough to get all the APs reporting centrally, which makes comparing station counts, signal levels and bitrate across the house a lot easier than peering at each box individually.

If anything, this only reinforced my original conclusion: there is still no compelling reason to replace a handful of perfectly good [OpenWRT](os/linux/openwrt) access points with a controller ecosystem when a bit of channel planning and a central metrics sink get you most of the way there.