+++
title = "Flipper BUSY Bar"
description = 'A review of the \_Flipper BUSY Bar\_, a 72x16 RGB LED matrix desk device with GPL firmware, an HTTP API, and Matter compatibility, from the guy that once built Lemon.'
date = "2026-08-20T09:31:50Z"
url = "https://xn--gckvb8fzb.com/flipper-busy-bar/"
author = "marius@xn--gckvb8fzb.com (Marius)"
text = ""
lastupdated = "2026-08-24T15:49:16.027145101Z"
seen = false
+++

Yes, it is in fact real, I’m holding it in my hands, and after what feels like years of Flipper teasing everyone with this ominous device in various online posts, I can finally confirm that it is real.

The [*BUSY Bar*](https://busy.app) is a 250 gram desk device by [*Flipper Devices*](https://flipperdevices.com), the company behind the [*Flipper Zero*](https://flipperzero.one) and the still very much in-development [*Flipper One*](https://blog.flipper.net/flipper-one-we-need-your-help/). It’s basically a little display that shows various things on a 72x16 RGB LED matrix, and as of writing this its main selling point is that it can run a Pomodoro-style *focus timer*, and that it has a full-blown HTTP API that’s available over USB, over the local network and over the internet, that lets you control this thing.

The *BUSY Bar* has a five-position selector on the top, that switches between the two focus modes (*BUSY* and *CUSTOM*, which are functionally identical and only differ in their defaults), an *OFF* position that in reality is more of a sleep mode which turns both screens off, an apps position that currently only holds a clock, and a settings position for, well, the settings. A large mechanical button in the middle starts and pauses a session, a scroll wheel adjusts the timer and doubles as an *OK* button, and last but not least there’s a back button for when you have to navigate back.

Speaking of back, the backside of the device has a 1.54 inch monochrome OLED that shows the timer, the battery percentage and the Wi-Fi, Bluetooth and USB indicators. This way the device remains usable to its own user as well, even when clipped to the top edge of a monitor using its built-in mount, pointing its primary matrix display away from its user.

Specs
----------

[![](/flipper-busy-bar/images/flipper-busy-bar-1559_hu_783683d98bd663c3.webp)](/flipper-busy-bar/images/flipper-busy-bar-1559.jpg)

The device measures 168.6 x 55.2 x 40.8mm and weighs 250g/8.82oz. The body is made out of PC/ABS with a PC front and back panel, and the monitor mount padding is TPE. The bar fits monitors up to 21mm thick and I can confirm that it works on curved displays as well. However, if you have a particularly thin monitor (say, one of these portable displays) it won’t be able to sit on top of it.

The full specifications, as published in [Flipper’s own documentation](https://docs.busy.app/bar/tech-specs), are as follows:

|    Spec    |                                                                                       Details                                                                                        |
|------------|--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
|Main display|72x16 RGB LED matrix, 158.4x35.2mm active area, 60 Hz; LED size 1.23x1.2mm, pitch 2.2mm, common anode; *ICND2153* + *ICN2012* drivers; manual or automatic brightness via light sensor|
|Back display|                                                 1.54" monochrome OLED, 160x80, 16 gray shades, 60 Hz; *SSD1320* controller over SPI                                                  |
|  Main MCU  |          [*STM32U595RI*](https://www.st.com/en/microcontrollers-microprocessors/stm32u595ri.html), Arm Cortex-M33 @ 160 MHz with MPU, FPU and DSP; 2 MB flash, 2.5 MB SRAM           |
|Wireless MCU|                  [*Silicon Labs SiWG917M111MGTBA*](https://www.silabs.com/wireless/wi-fi/siwx917-wireless-socs), Arm Cortex-M4F @ 180 MHz; 8 MB flash, 672 KB SRAM                   |
|  Wireless  |                                                    Wi-Fi 6 (*IEEE 802.11 b/g/n/ax*), 2.4 GHz only, WPA3; Bluetooth Low Energy 5.4                                                    |
|  Storage   |                                                                                    8 GB eMMC NAND                                                                                    |
|   Audio    |                                                  Mono; *NS4168* DAC over I2S at 44.1 kHz, embedded class D amplifier; 6 ohm, 0.8 W                                                   |
|  Battery   |                           1-cell 18650, 3250 mAh, *A2007-H04* 4-pin connector; protections against overcharge, over-discharge, over- and undertemperature                            |
|  Charging  |                                                         2.5 hours with an 18 W or higher PD charger, 7 to 8 hours otherwise                                                          |
|   USB-C    |                                                           USB 2.0 Full Speed device, 12 Mbit/s; PD 3.0, 5V⎓3A and 9V⎓1.5A                                                            |
|  Controls  |                                                    Mechanical switch, scroll wheel encoder, 5-position mode selector, back button                                                    |

The 72x16 matrix is driven by the [ICND2153](https://olympianled.com/wp-content/uploads/2019/11/ICND2153_datasheet_EN_2019_V1.2.pdf), a 16-channel constant-current PWM sink driver with a 16-bit grayscale shift register, LED open detection and a pre-charge circuit for ghosting reduction, and the ICN2012 8-channel power switch.

One thing that is a bit sad in 2026 is the 2.4 GHz limitation for Wi-Fi. In an office environment full of devices and microwaves the bar is on the most congested spectrum available. The USB side is also kept, let’s say *lightweight*, with its 12 Mbit/s maximum speed, which, however, is certainly enough for a virtual ethernet interface serving a web UI and an HTTP API.

On the charging side the documentation asks for an 18 W or higher PD charger for the 2.5 hour figure, while the device itself only appears to use 5V⎓3A (15 W) and 9V⎓1.5A (13.5 W) as its PD modes.

There is one discrepancy with regard to the display brightness, where the [tech specs page](https://docs.busy.app/bar/tech-specs) lists no brightness figure at all, the [product page](https://busy.app) currently says 400 nits, and the launch coverage from [CNX Software](https://www.cnx-software.com/2026/07/01/flipper-busy-bar-open-source-productivity-multitool-features-led-pixel-display-supports-matter-connectivity/) and [XDA](https://www.xda-developers.com/flipper-zero-team-built-best-productivity-device-ever-used/) both quote 800 nits. I don’t have the equipment to measure it, so I can’t really tell which it is, but I can assure you that even in a brightly lit space it’s plenty bright.

Internals
----------

[![](/flipper-busy-bar/images/flipper-busy-bar-1560_hu_8d90389406d8ddfc.webp)](/flipper-busy-bar/images/flipper-busy-bar-1560.jpg)

Flipper published an [official disassembly guide on iFixit](https://www.ifixit.com/Guide/BUSY+Bar+Disassembly/209529), which is awesome. Its 21 steps describe a device that’s designed with repairability in mind. The back cover is held by 8 clips and comes off with a plastic card. Below it are 5 Phillips PH1 screws, one on the bottom and four on the back. The battery has a press-latch connector and needs to be disconnected before anything else. The display flex cables use spudger-release latches, the main PCB is held by 3 screws, the control PCB by 5 latches, the front display back cover by 6 latches and the button stabilizer by 3 screws. The monitor mount legs are friction fits.

Nothing is glued and the battery is a standard 18650 cell on a 4-pin connector, which means a replacement is easily and cheaply available from most electronics shops. For a 2026 consumer device this is probably something that my fellow *Right to Repair* advocates will love.

Firmware
----------

[![](/flipper-busy-bar/images/flipper-busy-bar-1561_hu_dac69b09a46866b1.webp)](/flipper-busy-bar/images/flipper-busy-bar-1561.jpg)

The firmware sources are on GitHub as [`busy-app/busybar-firmware`](https://github.com/busy-app/busybar-firmware). Most first-party code is GPL, the `furi` library is MIT, graphical assets are CC-BY 4.0 and fonts are OFL 1.1, all of which are declared in a [REUSE](https://reuse.software) manifest.

The build system is *FBT*, the same SCons-based Flipper Build Tool used for the *Flipper Zero*, and the dependency list is a usual embedded stack with *FreeRTOS* underneath Flipper’s own `furi` abstraction, *lwIP* for TCP/IP, *TinyUSB* for the USB device side, [*Mongoose*](https://github.com/cesanta/mongoose) as the embedded HTTP and WebSocket server, *mbedTLS* for TLS and *LVGL* for the UI.

The bar also includes *JerryScript* in `lib/jerryscript`, wired up through `lib/js_app` and a `js_runner` service. That is the same JavaScript engine the *Flipper Zero* uses for its scripting apps. With the engine already in the firmware the only thing that still seems missing is the documented way to load your own scripts onto the device.

HTTP API
----------

[![](/flipper-busy-bar/images/flipper-busy-bar-1562_hu_ccbbe60287d46edd.webp)](/flipper-busy-bar/images/flipper-busy-bar-1562.jpg)

The *BUSY Bar* runs an HTTP server and speaks the same API over three transports, documented as [OpenAPI 3.1](https://api.busy.app/busybar/docs).

Plugging the device into a computer over USB brings up a virtual ethernet interface with the device at a fixed `10.0.4.20`, printed on the back of the unit. `http://10.0.4.20/` is the local web interface, `http://10.0.4.20/docs` is the API reference generated by the firmware currently on the device, and `http://10.0.4.20/api` is the base URL for said API. No authentication is used over USB, but it can be used via Wi-Fi and it must be used when going through Flipper’s cloud.

### Example ###

```sh
curl -s http://10.0.4.20/api/status/power

```

```json
{
  "state": "discharging",
  "battery_charge": 99,
  "battery_voltage": 4183,
  "battery_current": -180,
  "usb_voltage": 4843
}

```

This request responds with the current power status. The battery current is in mA, and both battery and USB voltage are in mV, which means that you can graph the device’s own power consumption without any extra hardware.

**Note:** Access over Wi-Fi is disabled by default and has to be turned on from the local web interface over USB first. Once enabled, you can pick a token for authentication, which would go into an `X-API-Token` header, if you decide to set one:

```sh
curl -s http://192.168.1.42/api/status \
  -H 'Accept: application/json' \
  -H 'X-API-Token: 12345678'

```

Access over the internet goes through Flipper’s cloud with a bearer token generated at `cloud.busy.app`, scoped either to a single device or to the account:

```sh
curl -s https://api.busy.app/busybar/status \
  -H 'Accept: application/json' \
  -H 'Authorization: Bearer <token>'

```

### Libraries ###

[![](/flipper-busy-bar/images/flipper-busy-bar-1563_hu_d939f865fa9b8bb3.webp)](/flipper-busy-bar/images/flipper-busy-bar-1563.jpg)

Flipper maintains [`busylib`](https://pypi.org/project/busylib/) for Python with both a synchronous and an `asyncio` client. It maps method names onto API paths directly, so `/api/display/draw` becomes `display_draw` and `/api/storage/remove` becomes `storage_remove`. That makes the OpenAPI document usable as the library’s reference documentation:

```python
from busylib import BusyBar, types

bb = BusyBar("10.0.4.20")

bb.display_draw(
    types.DisplayElements(
        application_name="my-app",
        elements=[
            types.TextElement(
                id="status",
                type="text",
                x=2,
                y=4,
                text="BUILDING",
                font="small",
                display=types.DisplayName.FRONT,
            ),
        ],
    )
)

```

The library also has a `converter` module that scales and re-encodes images and audio for the device, an mDNS discovery helper for `_busybar._tcp`, and a firmware compatibility check.

On top of that there is an official TypeScript library for all the soydevs, and a community-maintained [.NET client](https://busybar.dotnet.homotechsual.dev/). And there is also a Zig library, but… [more on that in just a moment](#zig). :-)

Smart home
----------

[![](/flipper-busy-bar/images/flipper-busy-bar-1564_hu_ec113ebb16b309f4.webp)](/flipper-busy-bar/images/flipper-busy-bar-1564.jpg)

The *BUSY Bar* presents itself to *Matter* as a single on/off endpoint, an emulated switch with a configurable startup state of `off`, `on`, `toggle` or `last`. Turning it on starts the *BUSY* timer and turning it off ends it, making the integration a trigger. Reporting the state back to *Matter* requires switching on *Settings ➔ Smart home*, at which point focus sessions can power automations like dimming lights or locking a door when a timer is turned on.

Pairing is done using a QR code on the back screen or in the web interface, and the device can be commissioned into multiple fabrics at once.

The *Home Assistant* integration is done through the HTTP API using the generic REST facilities, which works in both directions, meaning the device as an automation trigger, and the device as an output for anything else in the house.

Apps
----------

The *BUSY Bar* comes with mobile apps for your smartphones. I have tested its iOS app and, well, it was okay, I guess. I’m not a huge smartphone app user to begin with, but I’ll give my two cents here.

The app basically mirrors the current state of the bar and offers rudimentary control over it. When you start a timer and you have the app set up (via Flipper’s cloud) you’ll see the app pushing a permanent notification that displays the timer on your smartphone’s lock screen. It’s also possible to configure a *Do Not Disturb* mode that prevents other apps from interrupting your focus session whenever a timer is currently running.

To me these are gimmicks, but to others these features might be worth something. Having that said, the apps aren’t rated particularly highly and while I didn’t encounter any issues during the few days that I’ve tested the iOS version, the app did leave a somewhat *cheap* impression by the way it looks and functions. It felt like one of these apps that corporate boomers at large hardware manufacturers would come up with, falsely believing that they are in line with what today’s generations might want.

Caveats
----------

There are a few things that bother me, however none of them are actual dealbreakers.

The Wi-Fi authentication is a single shared numeric key, constrained by the API schema to `^[0-9]{4,10}$`, sent in a plain header over unencrypted HTTP on the local network. At the four digit minimum that is a 10,000 value keyspace, and I have found no documentation of rate limiting. The access mode enum also includes an `enabled` value alongside `key`, which means that the API can be opened on the LAN with no key at all. Hence, it’s probably a good idea to use a ten digit key and keep the device off networks you don’t control.

Then there’s all the *coming soon*. Installing user apps, the JS SDK, the Windows application, and the expanded app library, those are all future promises. I don’t doubt the Flipper team that they will eventually arrive, but I could imagine that for a non-technical user it is probably **very** frustrating to have bought a device that can barely do anything at all at the moment, especially on a Windows machine. The device that arrives today is a focus timer, a clock, and a status display.

Lastly, the price. It launched at USD 179 for waiting list members, then USD 199 for the first 3,000 units, with USD 249 quoted as the eventual retail price. At 249 it is a very hard sell, especially in the current software state. If you’re buying this because you’re a technical user and you really want to fiddle with it, it might be worth the Pesos, but as I’ve [demonstrated in the past](/lemon-v2/) you can build a similar device significantly cheaper yourself, especially if you’re already deep into the tinkering rabbit hole.

Summary
----------

[![](/flipper-busy-bar/images/flipper-busy-bar-1565_hu_f411bed075d5d7ba.webp)](/flipper-busy-bar/images/flipper-busy-bar-1565.jpg)

Flipper built the device I would have expected them to build, which I mean as a sincere compliment. The hardware is over-engineered for a status light in the same way that *Flipper* hardware always seems to be, with a real mechanical switch, a real encoder, a replaceable 18650, an official teardown guide and no glue anywhere in it.

Whether it is worth the money depends entirely on what you intend to do with it. As a device that tells your co-workers to go away, it is way too expensive and not at all effective, because people who interrupt you are not deterred by a sign that tells them not to. Let me put it this way: For roughly $50 below the *BUSY Bar*’s retail price you could place one of several *Smith and Wesson* models on your desk and it would likely be a more effective way to deter co-workers from talking to you.

However, as a small, well-built, fully scriptable RGB matrix with an 8 GB filesystem, a WebSocket, and an elaborate priority system, so that several programs can share one screen without overwriting each other, it is the most open and probably best thing in its class, and I expect the community will find uses for it that Flipper hasn’t thought of yet.

**PS:** Turning off the *BUSY Bar* is like quitting Vim, in the sense that it doesn’t offer an obvious way to do so. Yes, the switch on top has an *“OFF”* position. However, that simply turns off the displays, but it keeps the *BUSY Bar* running and connected to Wi-Fi. If you want to fully shut down the device so that it won’t consume any battery, you will have to put the switch into the *“Settings”* position, navigate to *System*, *Power*, and *Shutdown*, and confirm the poweroff with *Yes*. Only then the device actually turns off.

Bonus: `busybar.zig`
----------

As mentioned before, I have a little bonus that I’d like to share with this review, which is a Zig library that implements the *BUSY Bar*’s current OpenAPI specification as closely as possible, and that brings a `busybar` command line tool that lets you control the device over its HTTP API.

The library supports all of Zig’s platform targets as it only uses Zig’s `std` library, and it is fairly lightweight and easy to use. I’m using it with my *BUSY Bar* and it has been working great for me. The command line tool contains a few quality-of-life features like simple commands for starting and stopping the busy mode, which would otherwise require manually writing JSON payloads.

Long story short, if you’re one of the people that have ordered the *BUSY Bar* and are maybe looking to integrate it into Zig tools, or even just into your desktop environment using your own scripts, I invite you to check out the [`busybar.zig` repository](https://tty.fail/mrus/busybar.zig). If you’d only want the CLI tool to play around with your *BUSY Bar* you can find builds for every supported platform over on the [release page on GitHub](https://github.com/mrusme/busybar.zig/releases).