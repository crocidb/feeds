+++
title = "Dumping a Reolink E1 Pro Firmware from the flash chip"
description = "This post documents my first hardware hacking project: dumping the firmware from a Reolink E1 Pro security camera. Just to be clear, I was (and still am) a complete beginner when it comes to hardware hacking. I did this together with my roommate, who had slightly more experience "
date = "2026-01-22T22:50:33Z"
url = "https://p0pcycle.com/2026/01/22/dumping-a-reolink-e1-pro-firmware-from-the-flash-chip/"
author = "P0pcycle"
text = ""
lastupdated = "2026-11-12T00:42:28.158591397Z"
seen = true
+++

1. [Opening the Device](https://p0pcycle.com/2026/01/22/dumping-a-reolink-e1-pro-firmware-from-the-flash-chip/#opening-the-device)
2. [Missing Tools](https://p0pcycle.com/2026/01/22/dumping-a-reolink-e1-pro-firmware-from-the-flash-chip/#missing-tools)
3. [Dumping the flash](https://p0pcycle.com/2026/01/22/dumping-a-reolink-e1-pro-firmware-from-the-flash-chip/#dumping-the-flash)
4. [Understanding the SPI NAND Flash](https://p0pcycle.com/2026/01/22/dumping-a-reolink-e1-pro-firmware-from-the-flash-chip/#understanding-the-spi-nand-flash)
5. [xfer vs read/write bytes()](https://p0pcycle.com/2026/01/22/dumping-a-reolink-e1-pro-firmware-from-the-flash-chip/#xfer-vs-read-write-bytes)
6. [Clocking](https://p0pcycle.com/2026/01/22/dumping-a-reolink-e1-pro-firmware-from-the-flash-chip/#clocking)
7. [Why dummy bytes are needed](https://p0pcycle.com/2026/01/22/dumping-a-reolink-e1-pro-firmware-from-the-flash-chip/#why-dummy-bytes-are-needed)
8. [Unsuccessful data read](https://p0pcycle.com/2026/01/22/dumping-a-reolink-e1-pro-firmware-from-the-flash-chip/#unsuccessful-data-read)
9. [Writing basic instructions](https://p0pcycle.com/2026/01/22/dumping-a-reolink-e1-pro-firmware-from-the-flash-chip/#writing-basic-instructions)
10. [Using a Logic Analyzer](https://p0pcycle.com/2026/01/22/dumping-a-reolink-e1-pro-firmware-from-the-flash-chip/#using-a-logic-analyzer)
11. [Power problems](https://p0pcycle.com/2026/01/22/dumping-a-reolink-e1-pro-firmware-from-the-flash-chip/#power-problems)
12. [Reading data out](https://p0pcycle.com/2026/01/22/dumping-a-reolink-e1-pro-firmware-from-the-flash-chip/#reading-data-out)
13. [Why we chose Buffer Read Mode](https://p0pcycle.com/2026/01/22/dumping-a-reolink-e1-pro-firmware-from-the-flash-chip/#why-we-chose-buffer-read-mode)
14. [Dumping the Firmware](https://p0pcycle.com/2026/01/22/dumping-a-reolink-e1-pro-firmware-from-the-flash-chip/#dumping-the-firmware)
15. [Extracting the Filesystem](https://p0pcycle.com/2026/01/22/dumping-a-reolink-e1-pro-firmware-from-the-flash-chip/#extracting-the-filesystem)
16. [Finishing words](https://p0pcycle.com/2026/01/22/dumping-a-reolink-e1-pro-firmware-from-the-flash-chip/#finishing-words)
17. [Final script](https://p0pcycle.com/2026/01/22/dumping-a-reolink-e1-pro-firmware-from-the-flash-chip/#final-script)

This post documents my first hardware hacking project: dumping the firmware from a Reolink E1 Pro security camera. Just to be clear, I was (and still am) a complete beginner when it comes to hardware hacking. I did this together with my roommate, who had slightly more experience than me and already owned some basic hobbyist hardware tools.

The goal wasn’t to find vulnerabilities or exploit the device. The goal was simply to get the firmware out and understand how we could use the SPI protocol to do so. Yessss, along the way we made a lot of mistakes, misunderstood several concepts, but we learned a lot. I apologize in advance to all of you hardware hackers out there, this post might make you cry.

Anyhoo, we will focus on the process, including the parts that didn’t work at first.

Opening the Device
----------

The first step was physical: opening the camera.

<img data-recalc-dims="1" loading="lazy" decoding="async" width="1536" height="2048" data-attachment-id="992" data-permalink="https://p0pcycle.com/2026/01/22/dumping-a-reolink-e1-pro-firmware-from-the-flash-chip/32e3a504-9dce-4b39-8f83-73e5bf1a6855_1_102_o/" data-orig-file="https://i0.wp.com/p0pcycle.com/wp-content/uploads/2026/01/32e3a504-9dce-4b39-8f83-73e5bf1a6855_1_102_o.jpeg?fit=1536%2C2048&amp;ssl=1" data-orig-size="1536,2048" data-comments-opened="1" data-image-meta="{&quot;aperture&quot;:&quot;2.2&quot;,&quot;camera&quot;:&quot;iPhone 14 Pro&quot;,&quot;created_timestamp&quot;:&quot;1765887930&quot;,&quot;focal_length&quot;:&quot;2.22&quot;,&quot;iso&quot;:&quot;1000&quot;,&quot;shutter_speed&quot;:&quot;0.016666666666667&quot;}" data-image-title="32E3A504-9DCE-4B39-8F83-73E5BF1A6855_1_102_o" data-image-description="" data-image-caption="" data-large-file="https://i0.wp.com/p0pcycle.com/wp-content/uploads/2026/01/32e3a504-9dce-4b39-8f83-73e5bf1a6855_1_102_o.jpeg?fit=768%2C1024&amp;ssl=1" src="https://i0.wp.com/p0pcycle.com/wp-content/uploads/2026/01/32e3a504-9dce-4b39-8f83-73e5bf1a6855_1_102_o.jpeg?resize=1536%2C2048&amp;ssl=1" alt="" class="wp-image-992" style="aspect-ratio:0.7500094507239254;width:296px;height:auto">

Once opened, we removed the main PCB and started identifying components. The two important parts for us were:

* The main System on a Chip (SoC), which we didn’t identify in detail
* An external SPI NAND flash chip, which we assumed contained the firmware

<img data-recalc-dims="1" loading="lazy" decoding="async" width="1020" height="1284" data-attachment-id="998" data-permalink="https://p0pcycle.com/2026/01/22/dumping-a-reolink-e1-pro-firmware-from-the-flash-chip/image-101/" data-orig-file="https://i0.wp.com/p0pcycle.com/wp-content/uploads/2026/01/image-5.png?fit=1020%2C1284&amp;ssl=1" data-orig-size="1020,1284" data-comments-opened="1" data-image-title="image" data-image-description="" data-image-caption="" data-large-file="https://i0.wp.com/p0pcycle.com/wp-content/uploads/2026/01/image-5.png?fit=813%2C1024&amp;ssl=1" src="https://i0.wp.com/p0pcycle.com/wp-content/uploads/2026/01/image-5.png?resize=1020%2C1284&amp;ssl=1" alt="" class="wp-image-998" style="aspect-ratio:0.79375875175035;width:328px;height:auto">

We looked for easy wins first: UART headers, JTAG, or any exposed debug ports. Unfortunately, there were no obvious or populated debug interfaces available… (at least none that we could confidently identify).

Since there was no easy software or debug access, we decided to go after the firmware directly via the flash chip.

Missing Tools
----------

At this point, we ran into a very classic hardware hacking problem: we didn’t have the right tools. This quickly became a recurring theme throughout the project :’).

Because we were only simpleton hardware hacking hobbiest, our toolset was limited. My roommate had some stuff from a previous project, but unlike here, he had a UART debug port on his previous project. However, he had 4 stabilized probe needles, but we needed 8 so that wasn’t going to work.

Our next idea was then to connect to the SPI NAND flash using a basic alligator clip setup (that we also had to buy). In theory, this should have worked. In practice, it didn’t. The clips wouldn’t clip onto the teeny-tiny soldered pins of the flash chip, so we literally couldn’t read any data.

<img data-recalc-dims="1" loading="lazy" decoding="async" width="997" height="675" data-attachment-id="1105" data-permalink="https://p0pcycle.com/2026/01/22/dumping-a-reolink-e1-pro-firmware-from-the-flash-chip/image-119/" data-orig-file="https://i0.wp.com/p0pcycle.com/wp-content/uploads/2026/01/image-22.png?fit=997%2C675&amp;ssl=1" data-orig-size="997,675" data-comments-opened="1" data-image-title="image" data-image-description="" data-image-caption="" data-large-file="https://i0.wp.com/p0pcycle.com/wp-content/uploads/2026/01/image-22.png?fit=997%2C675&amp;ssl=1" src="https://i0.wp.com/p0pcycle.com/wp-content/uploads/2026/01/image-22.png?resize=997%2C675&amp;ssl=1" alt="" class="wp-image-1105" style="aspect-ratio:1.4770696843359141;width:278px;height:auto">alligator clip

So, back to ordering more hardware.

We ended up buying 4 more stabilized probe needles (from PCbite), which allowed us to precisely and reliably contact each of the eight pins on the flash chip individually.

On top of that, we didn’t even have a proper magnifying glass or microscope. Reading the tiny markings on the chip meant straining our eyes and awkwardly zooming in with our phone cameras.

This project taught us that a large part of hardware hacking is having to delay your project by a few days by having to acquire new tools.

Dumping the flash
----------

With no UART or debug access, dumping the SPI NAND flash directly made the most sense.

The idea was simple in theory:

* Identify the flash chip
* Look up its datasheet
* Communicate with it over SPI
* Read out the contents

First things first, really squint our eyes to read the flash’s chip model.

<img data-recalc-dims="1" loading="lazy" decoding="async" width="250" height="154" data-attachment-id="1005" data-permalink="https://p0pcycle.com/2026/01/22/dumping-a-reolink-e1-pro-firmware-from-the-flash-chip/image-103/" data-orig-file="https://i0.wp.com/p0pcycle.com/wp-content/uploads/2026/01/image-7.png?fit=250%2C154&amp;ssl=1" data-orig-size="250,154" data-comments-opened="1" data-image-title="image" data-image-description="" data-image-caption="" data-large-file="https://i0.wp.com/p0pcycle.com/wp-content/uploads/2026/01/image-7.png?fit=250%2C154&amp;ssl=1" src="https://i0.wp.com/p0pcycle.com/wp-content/uploads/2026/01/image-7.png?resize=250%2C154&amp;ssl=1" alt="" class="wp-image-1005">

```
WINBOND W25N512GVxIG/IT
3V 512M-BIT
SERIAL SLC NAND FLASH MEMORY WITH
DUAL/QUAD SPI
BUFFER READ & CONTINUOUS READ
```

We found the datasheet on the internet, and proceeded to look for the pad configuration. This tells us how to setup our pins to the Raspberry Pi GPIO Pinout

<img data-recalc-dims="1" loading="lazy" decoding="async" width="966" height="392" data-attachment-id="1007" data-permalink="https://p0pcycle.com/2026/01/22/dumping-a-reolink-e1-pro-firmware-from-the-flash-chip/image-104/" data-orig-file="https://i0.wp.com/p0pcycle.com/wp-content/uploads/2026/01/image-8.png?fit=966%2C392&amp;ssl=1" data-orig-size="966,392" data-comments-opened="1" data-image-title="image" data-image-description="" data-image-caption="" data-large-file="https://i0.wp.com/p0pcycle.com/wp-content/uploads/2026/01/image-8.png?fit=966%2C392&amp;ssl=1" src="https://i0.wp.com/p0pcycle.com/wp-content/uploads/2026/01/image-8.png?resize=966%2C392&amp;ssl=1" alt="" class="wp-image-1007"> <img data-recalc-dims="1" loading="lazy" decoding="async" width="1036" height="1128" data-attachment-id="1001" data-permalink="https://p0pcycle.com/2026/01/22/dumping-a-reolink-e1-pro-firmware-from-the-flash-chip/image-102/" data-orig-file="https://i0.wp.com/p0pcycle.com/wp-content/uploads/2026/01/image-6.png?fit=1036%2C1128&amp;ssl=1" data-orig-size="1036,1128" data-comments-opened="1" data-image-title="image" data-image-description="" data-image-caption="" data-large-file="https://i0.wp.com/p0pcycle.com/wp-content/uploads/2026/01/image-6.png?fit=940%2C1024&amp;ssl=1" src="https://i0.wp.com/p0pcycle.com/wp-content/uploads/2026/01/image-6.png?resize=1036%2C1128&amp;ssl=1" alt="" class="wp-image-1001" style="aspect-ratio:0.9188801148600143;width:358px;height:auto">[https://pinout.xyz/](https://pinout.xyz/)

With a bit of AI magic, we figured out how to pin each of them correctly.

|Chip Pin|Chip Function|RPi GPIO Pin| RPi Function |
|--------|-------------|------------|--------------|
|   1    |     /CS     |   Pin 24   | CE0 (GPIO 8) |
|   2    |  DO (IO1)   |   Pin 21   |MISO (GPIO 9) |
|   3    |  /WP (IO2)  |   Pin 17   |    3.3V\*    |
|   4    |     GND     |   Pin 20   |     GND      |
|   5    |  DI (IO0)   |   Pin 19   |MOSI (GPIO 10)|
|   6    |     CLK     |   Pin 23   |SCLK (GPIO 11)|
|   7    | /HOLD (IO3) |   Pin 17   |    3.3V\*    |
|   8    |     VCC     |   Pin 17   |     3.3V     |
<img data-recalc-dims="1" loading="lazy" decoding="async" width="1536" height="1522" data-attachment-id="1009" data-permalink="https://p0pcycle.com/2026/01/22/dumping-a-reolink-e1-pro-firmware-from-the-flash-chip/image-105/" data-orig-file="https://i0.wp.com/p0pcycle.com/wp-content/uploads/2026/01/image-9.png?fit=1536%2C1522&amp;ssl=1" data-orig-size="1536,1522" data-comments-opened="1" data-image-title="image" data-image-description="" data-image-caption="" data-large-file="https://i0.wp.com/p0pcycle.com/wp-content/uploads/2026/01/image-9.png?fit=1024%2C1015&amp;ssl=1" src="https://i0.wp.com/p0pcycle.com/wp-content/uploads/2026/01/image-9.png?resize=1536%2C1522&amp;ssl=1" alt="" class="wp-image-1009">

Ben Eater’s video helped us a lot understand concepts and how the SPI protocol worked.

[![Embedded YouTube video](https://img.youtube.com/vi/MCi7dCBhVpQ/0.jpg)](https://www.youtube.com/watch?v=MCi7dCBhVpQ)

Understanding the SPI NAND Flash
----------

Our original idea was to dump the flash using flashrom. However, we didn’t find support for this particular chip, so we had to manually implement the SPI commands ourselves based entirely on the datasheet.

<img data-recalc-dims="1" loading="lazy" decoding="async" width="1733" height="212" data-attachment-id="1050" data-permalink="https://p0pcycle.com/2026/01/22/dumping-a-reolink-e1-pro-firmware-from-the-flash-chip/image-110/" data-orig-file="https://i0.wp.com/p0pcycle.com/wp-content/uploads/2026/01/image-13.png?fit=1733%2C212&amp;ssl=1" data-orig-size="1733,212" data-comments-opened="1" data-image-title="image" data-image-description="" data-image-caption="" data-large-file="https://i0.wp.com/p0pcycle.com/wp-content/uploads/2026/01/image-13.png?fit=1024%2C125&amp;ssl=1" src="https://i0.wp.com/p0pcycle.com/wp-content/uploads/2026/01/image-13.png?resize=1733%2C212&amp;ssl=1" alt="" class="wp-image-1050">

This required:

* Identifying command opcodes (read ID, read page, etc.)
* Understanding addressing and page layouts
* Knowing when and how data would be returned

xfer vs read/write bytes()
----------

Another major conceptual hurdle was understanding how SPI reads actually work.

SPI is **full-duplex**: for every byte clocked out on MOSI (master out, slve in), a byte is clocked in on MISO (master in, slve out). This means that even when you want to *read* data, you must still *send* data to generate clock pulses.

In practice:

* A read command is sent
* Address bytes are transmitted
* Dummy bytes are clocked out
* Real data is clocked back in on MISO

If you want to read 100 bytes, you must transmit 100 dummy bytes to clock them out.

This new understanding also explained something that had confused us earlier when using the Python `spidev` library.

Initially, we tried using higher-level helper functions like `writebytes()` and `readbytes()`. Intuitively, these felt like the “right” functions to use: write a command, then read data back.

However, this didn’t work at all for us.

What *did* work was using `xfer2()`, which performs a single full-duplex SPI transaction, sending and receiving bytes **simultaneously**.

Digging deeper, we ended up reading parts of the SPI driver and `spidev` source code itself. One particular comment stood out: SPI transfers are inherently full-duplex, and separating writes and reads into distinct calls can break devices that expect a continuous transaction with chip select held active.

```
/*
This supports access to SPI devices using normal userspace I/O calls.
Note that while traditional UNIX/POSIX I/O semantics are half duplex, and often mask message boundaries, full SPI support requires full duplex transfers.  There are several kinds of internal message boundaries to handle chipselect management and other protocol options.
 */
```

In other words:

* `writebytes()` sends data but ignores incoming bytes
* `readbytes()` clocks data but doesn’t send meaningful command bytes
* `xfer2()` does both at the same time, which is what the flash actually expects

Once we switched entirely to `xfer2()` and treated every operation as a single full-duplex exchange (including dummy bytes), communication became consistent.

Example for reading the JEDEC ID:

```
print(f"jedec ID reply: {bytes(spi.xfer2([CMD_JEDEC_ID, DUMMY_BYTE, DUMMY_BYTE, DUMMY_BYTE, DUMMY_BYTE]) ).hex ()}")
```

<img data-recalc-dims="1" loading="lazy" decoding="async" width="936" height="358" data-attachment-id="1022" data-permalink="https://p0pcycle.com/image-108/" data-orig-file="https://i0.wp.com/p0pcycle.com/wp-content/uploads/2026/01/image-11-edited.png?fit=936%2C358&amp;ssl=1" data-orig-size="936,358" data-comments-opened="1" data-image-title="image" data-image-description="" data-image-caption="" data-large-file="https://i0.wp.com/p0pcycle.com/wp-content/uploads/2026/01/image-11-edited.png?fit=936%2C358&amp;ssl=1" src="https://i0.wp.com/p0pcycle.com/wp-content/uploads/2026/01/image-11-edited.png?resize=936%2C358&amp;ssl=1" alt="" class="wp-image-1022">

We send the instruction (read the JEDEC ID) and then one dummy byte for the 8 clocks as a data in (DI), and another 3 dummy bytes (8 x 3 clocks) for the value of the JEDEC ID, the data out (DO).

Clocking
----------

<img data-recalc-dims="1" loading="lazy" decoding="async" width="800" height="800" data-attachment-id="1014" data-permalink="https://p0pcycle.com/2026/01/22/dumping-a-reolink-e1-pro-firmware-from-the-flash-chip/image-106/" data-orig-file="https://i0.wp.com/p0pcycle.com/wp-content/uploads/2026/01/image-10.png?fit=800%2C800&amp;ssl=1" data-orig-size="800,800" data-comments-opened="1" data-image-title="image" data-image-description="" data-image-caption="" data-large-file="https://i0.wp.com/p0pcycle.com/wp-content/uploads/2026/01/image-10.png?fit=800%2C800&amp;ssl=1" src="https://i0.wp.com/p0pcycle.com/wp-content/uploads/2026/01/image-10.png?resize=800%2C800&amp;ssl=1" alt="" class="wp-image-1014" style="width:258px;height:auto">

The SPI master (our Raspberry Pi) must generate clock pulses for data to come out of the device. No clock = no data.

The NAND chip’s datasheet says:

>
>
> When /CS is brought low the device will be selected, power consumption will increase to active levels and instructions can be written to and data read from the device.
>
>
>
> The SPI Serial Clock Input (CLK) pin provides the timing for serial input and output operations.
>
>

In our setup, using the SPI driver from Linux on a Raspberry Pi, the spidev driver defaults to CS being active on low.

*TL;DR:* CS needs to be low and the clock toggling in order to be able to read/write data from and to the chip.

Why dummy bytes are needed
----------

Each byte is 8 clock pulses.

If you want to read 1 byte, you need to generate 8 clock pulses. To generate those pulses, the master (in this case the Raspberry Pi) must send something on MOSI.

So the master sends a dummy byte (often `0x00` or `0xFF`):

* MOSI: meaningless data
* SCLK: toggles
* MISO: real data from the flash

Example:

* Send 100 dummy bytes → generate 800 clock pulses
* Receive 100 real bytes from MISO

Unsuccessful data read
----------

We used a Raspberry Pi to communicate with the flash and relied on Linux’s `spidev` interface from Python.

In short, `spidev` is a Linux kernel driver that exposes SPI devices to userspace, allowing applications to perform raw SPI transfers without writing kernel drivers.

Using some claude vibe-coding, Python and the `spidev` library, we started sending commands to the flash.

However… nothing but zeros.

<img data-recalc-dims="1" loading="lazy" decoding="async" width="1224" height="460" data-attachment-id="1117" data-permalink="https://p0pcycle.com/2026/01/22/dumping-a-reolink-e1-pro-firmware-from-the-flash-chip/image-120/" data-orig-file="https://i0.wp.com/p0pcycle.com/wp-content/uploads/2026/01/image-23.png?fit=1224%2C460&amp;ssl=1" data-orig-size="1224,460" data-comments-opened="1" data-image-title="image" data-image-description="" data-image-caption="" data-large-file="https://i0.wp.com/p0pcycle.com/wp-content/uploads/2026/01/image-23.png?fit=1024%2C385&amp;ssl=1" src="https://i0.wp.com/p0pcycle.com/wp-content/uploads/2026/01/image-23.png?resize=1224%2C460&amp;ssl=1" alt="" class="wp-image-1117">

Our first attempts were not very successful.

The vibe code was reading some stuff, like the JEDEC ID (which we could validate via the datasheet), but when trying to read data from the data buffer, it was just returning all 0’s.

<img data-recalc-dims="1" loading="lazy" decoding="async" width="1292" height="658" data-attachment-id="1118" data-permalink="https://p0pcycle.com/2026/01/22/dumping-a-reolink-e1-pro-firmware-from-the-flash-chip/image-121/" data-orig-file="https://i0.wp.com/p0pcycle.com/wp-content/uploads/2026/01/image-24.png?fit=1292%2C658&amp;ssl=1" data-orig-size="1292,658" data-comments-opened="1" data-image-title="image" data-image-description="" data-image-caption="" data-large-file="https://i0.wp.com/p0pcycle.com/wp-content/uploads/2026/01/image-24.png?fit=1024%2C522&amp;ssl=1" src="https://i0.wp.com/p0pcycle.com/wp-content/uploads/2026/01/image-24.png?resize=1292%2C658&amp;ssl=1" alt="" class="wp-image-1118" style="aspect-ratio:1.9635787806809184;width:581px;height:auto">JEDEC ID and Status Register returns exepcted values

After countless debugs and print(), we finally decided to debug it properly.

<img data-recalc-dims="1" loading="lazy" decoding="async" width="991" height="914" data-attachment-id="1051" data-permalink="https://p0pcycle.com/2026/01/22/dumping-a-reolink-e1-pro-firmware-from-the-flash-chip/image-111/" data-orig-file="https://i0.wp.com/p0pcycle.com/wp-content/uploads/2026/01/image-14.png?fit=991%2C914&amp;ssl=1" data-orig-size="991,914" data-comments-opened="1" data-image-title="image" data-image-description="" data-image-caption="" data-large-file="https://i0.wp.com/p0pcycle.com/wp-content/uploads/2026/01/image-14.png?fit=991%2C914&amp;ssl=1" src="https://i0.wp.com/p0pcycle.com/wp-content/uploads/2026/01/image-14.png?resize=991%2C914&amp;ssl=1" alt="" class="wp-image-1051" style="aspect-ratio:1.0842715050825227;width:294px;height:auto">As you can see we tried multiple times to get a reading… unsuccessfully

Writing basic instructions
----------

Before we came across the reason why we weren’t receiving any data (aka when **we** were being dummy bytes), we decided to write our own script that did the most basic stuff like reading the JEDEC ID, reading the status register, and re-writing the status register (e.g. setting BUF = 0 to try the continuous reading mode).

When reading the datasheet more carefully, we stumbled across two reading mode, “buffered” and “continuous”. I will be covering that later. However, the way we can control that read mode is by sending a write instruction to MOSI (master out, slve in) to re-write the status register and change the value of BUF.

As an example, if we just *read* the status register, we get back a 8 bit integer (which we decided to represent as a hexadecimal value for clarity):

<img data-recalc-dims="1" loading="lazy" decoding="async" width="1614" height="598" data-attachment-id="1062" data-permalink="https://p0pcycle.com/2026/01/22/dumping-a-reolink-e1-pro-firmware-from-the-flash-chip/image-114/" data-orig-file="https://i0.wp.com/p0pcycle.com/wp-content/uploads/2026/01/image-17.png?fit=1614%2C598&amp;ssl=1" data-orig-size="1614,598" data-comments-opened="1" data-image-title="image" data-image-description="" data-image-caption="" data-large-file="https://i0.wp.com/p0pcycle.com/wp-content/uploads/2026/01/image-17.png?fit=1024%2C379&amp;ssl=1" src="https://i0.wp.com/p0pcycle.com/wp-content/uploads/2026/01/image-17.png?resize=1614%2C598&amp;ssl=1" alt="" class="wp-image-1062">Diagram for reading status register

To read the status register, we send the instruction 0x0F or 0x05 (read instruction), and then send the Status Register Address (SR Address).

Then, we send 1 dummy byte (8 clock cycles) for the value that will be returned (I cover why in the dummy byte section).

```
CMD_READ_STATUS_REG = 0x05
STATUS_REG_ADDR = 0xB0

spi.xfer2([CMD_READ_STATUS_REG, STATUS_REG_ADDR, DUMMY_BYTE])
```

We received 0x1D as a return value, which when interpreted in binary, we get   
`0001 1101`.

<img data-recalc-dims="1" loading="lazy" decoding="async" width="232" height="370" data-attachment-id="1066" data-permalink="https://p0pcycle.com/2026/01/22/dumping-a-reolink-e1-pro-firmware-from-the-flash-chip/attachment/8/" data-orig-file="https://i0.wp.com/p0pcycle.com/wp-content/uploads/2026/01/8.png?fit=232%2C370&amp;ssl=1" data-orig-size="232,370" data-comments-opened="1" data-image-title="8" data-image-description="" data-image-caption="" data-large-file="https://i0.wp.com/p0pcycle.com/wp-content/uploads/2026/01/8.png?fit=232%2C370&amp;ssl=1" src="https://i0.wp.com/p0pcycle.com/wp-content/uploads/2026/01/8.png?resize=232%2C370&amp;ssl=1" alt="" class="wp-image-1066" style="aspect-ratio:0.6271094175285792;width:120px;height:auto">

Comparing to the diagram below, we can see that the BUF bit is set to 1.

<img data-recalc-dims="1" loading="lazy" decoding="async" width="1476" height="990" data-attachment-id="1064" data-permalink="https://p0pcycle.com/2026/01/22/dumping-a-reolink-e1-pro-firmware-from-the-flash-chip/w25n512gvxigit/" data-orig-file="https://i0.wp.com/p0pcycle.com/wp-content/uploads/2026/01/w25n512gvxigit.png?fit=1476%2C990&amp;ssl=1" data-orig-size="1476,990" data-comments-opened="1" data-image-title="W25N512GVxIGIT" data-image-description="" data-image-caption="" data-large-file="https://i0.wp.com/p0pcycle.com/wp-content/uploads/2026/01/w25n512gvxigit.png?fit=1024%2C687&amp;ssl=1" src="https://i0.wp.com/p0pcycle.com/wp-content/uploads/2026/01/w25n512gvxigit.png?resize=1476%2C990&amp;ssl=1" alt="" class="wp-image-1064">

Similarly, we can set a new value for BUF by sending in the desired hexadecimal value to modify just that one bit:  

<img data-recalc-dims="1" loading="lazy" decoding="async" width="242" height="344" data-attachment-id="1069" data-permalink="https://p0pcycle.com/2026/01/22/dumping-a-reolink-e1-pro-firmware-from-the-flash-chip/8-2/" data-orig-file="https://i0.wp.com/p0pcycle.com/wp-content/uploads/2026/01/8-1.png?fit=242%2C344&amp;ssl=1" data-orig-size="242,344" data-comments-opened="1" data-image-title="8" data-image-description="" data-image-caption="" data-large-file="https://i0.wp.com/p0pcycle.com/wp-content/uploads/2026/01/8-1.png?fit=242%2C344&amp;ssl=1" src="https://i0.wp.com/p0pcycle.com/wp-content/uploads/2026/01/8-1.png?resize=242%2C344&amp;ssl=1" alt="" class="wp-image-1069" style="aspect-ratio:0.7035795683067435;width:134px;height:auto">Flipping one bit for the BUF value to 0

Sample python code to read and write to the Status Register:

```
CMD_READ_STATUS_REG = 0x05
CMD_WRITE_STATUS_REG = 0x1F
STATUS_REG_ADDR = 0xB0
NEW_VALUE = 0x15

stat_reg_value = spi.xfer2([CMD_READ_STATUS_REG, STATUS_REG_ADDR, DUMMY_BYTE])
print(stat_reg_value)
spi.xfer2([CMD_WRITE_STATUS_REG, STATUS_REG_ADDR, NEW_VALUE])
```

Using a Logic Analyzer
----------

We connected a Saleae logic analyzer to the SPI lines (CS, CLK, MOSI, MISO) to see what was actually happening on the wire.

This helped confirm that:

* SPI traffic was being generated
* Commands were being sent
* We received the valid values for the JEDEC ID and Status Register
* But we still received 0x00 as data read from the flash

Everything *looked* good. We got basic information such as the JEDEC ID and Status Register, yet the data output was still 0’s.

<img data-recalc-dims="1" loading="lazy" decoding="async" width="1715" height="991" data-attachment-id="1075" data-permalink="https://p0pcycle.com/2026/01/22/dumping-a-reolink-e1-pro-firmware-from-the-flash-chip/screenshot/" data-orig-file="https://i0.wp.com/p0pcycle.com/wp-content/uploads/2026/01/la.jpg?fit=1715%2C991&amp;ssl=1" data-orig-size="1715,991" data-comments-opened="1" data-image-meta="{&quot;caption&quot;:&quot;Screenshot&quot;,&quot;title&quot;:&quot;Screenshot&quot;,&quot;orientation&quot;:&quot;1&quot;}" data-image-title="Screenshot" data-image-description="" data-image-caption="<p>Screenshot</p>
" data-large-file="https://i0.wp.com/p0pcycle.com/wp-content/uploads/2026/01/la.jpg?fit=1024%2C592&amp;ssl=1" src="https://i0.wp.com/p0pcycle.com/wp-content/uploads/2026/01/la.jpg?resize=1715%2C991&amp;ssl=1" alt="" class="wp-image-1075">We can see the data being sent and received with the logic analyzer. We are **reading** the Status Register value and receiving the value 0x15 in return (this is when BUF = 0 is set).

Power problems
----------

Eventually, we stumbled onto a clue by accident.

After a few mental breakdowns trying to figure out why we weren’t receiving any data, we decided to power the camera normally while still probing the flash (it was a bad ideaaaa, do not replicate). However, the data read instructions were suceeding. That immediately suggested that something was wrong with our first power setup.

Originally, we measured the voltage directly at the flash chip’s VCC pin. Instead of 3.3V, we were getting around 2.2V.

We first thought that the issue was due to the resistance on the breadboard. The setup had the flash’s VCC pin connected to the breadboard’s power rail, which in turn was connected to the Raspberry Pi’s 3.3V pin, and we thought that the rail might introduced enough resistance (or some other mysterious unknown reason\*) to cause a significant voltage drop.

Once we moved the VCC connection closer to the Raspberry Pi’s 3.3V output on the rail, the voltage at the flash jumped to a stable 3.3V.

Now we had all CS, MOSI, and MISO idling at high while no data was being transmitted.

This caught us off guard because the data sheet of the NAND doesn’t have any requirement regarding the state of the MOSI and MISO lines when idle, and more importantly, all of the previous SPI communications we had issues with had the MOSI and MISO lines idling low, which didn’t seem to be problematic at first (because the JEDEC instruction would reply correctly).

Ironically, we only discovered this because the flash had been back-powered when we connected the power back to the chip. Again, we are beginners, so shit happens. Luckily, nothing broke or exploded.

**\*noob moment**

So it turns out the power rails on our breadboard were split in half, meaning the VCC pin of the NAND flash was not actually connected to the Raspberry Pi’s 3.3 V output. We confirmed this using a continuity test on a multimeter. As a result, the flash had been under-powered the entire time. Our “3 V” rail wasn’t delivering 3 V at all, and the chip was instead partially powering itself through one of the SPI signal lines (most likely CS). 

<img data-recalc-dims="1" loading="lazy" decoding="async" width="3024" height="3140" data-attachment-id="1054" data-permalink="https://p0pcycle.com/2026/01/22/dumping-a-reolink-e1-pro-firmware-from-the-flash-chip/image-112/" data-orig-file="https://i0.wp.com/p0pcycle.com/wp-content/uploads/2026/01/image-15.png?fit=3024%2C3140&amp;ssl=1" data-orig-size="3024,3140" data-comments-opened="1" data-image-title="image" data-image-description="" data-image-caption="" data-large-file="https://i0.wp.com/p0pcycle.com/wp-content/uploads/2026/01/image-15.png?fit=986%2C1024&amp;ssl=1" src="https://i0.wp.com/p0pcycle.com/wp-content/uploads/2026/01/image-15.png?resize=3024%2C3140&amp;ssl=1" alt="" class="wp-image-1054" style="aspect-ratio:0.9638320095217275;width:332px;height:auto">

To verify our findings, here is actual proof from the board makers themselves:

<img data-recalc-dims="1" loading="lazy" decoding="async" width="1882" height="968" data-attachment-id="1056" data-permalink="https://p0pcycle.com/2026/01/22/dumping-a-reolink-e1-pro-firmware-from-the-flash-chip/note-some-larger-breadboards-will-often-isolate-one-half-of-the-breadboards-power-rails-form-the-other/" data-orig-file="https://i0.wp.com/p0pcycle.com/wp-content/uploads/2026/01/note-some-larger-breadboards-will-often-isolate-one-half-of-the-breadboards-power-rails-form-the-other.png?fit=1882%2C968&amp;ssl=1" data-orig-size="1882,968" data-comments-opened="1" data-image-title="Note Some larger breadboards will often isolate one half of the breadboard&amp;#8217;s power rails form the other" data-image-description="" data-image-caption="" data-large-file="https://i0.wp.com/p0pcycle.com/wp-content/uploads/2026/01/note-some-larger-breadboards-will-often-isolate-one-half-of-the-breadboards-power-rails-form-the-other.png?fit=1024%2C527&amp;ssl=1" src="https://i0.wp.com/p0pcycle.com/wp-content/uploads/2026/01/note-some-larger-breadboards-will-often-isolate-one-half-of-the-breadboards-power-rails-form-the-other.png?resize=1882%2C968&amp;ssl=1" alt="" class="wp-image-1056" style="aspect-ratio:1.944907362023331;width:456px;height:auto">

Reading data out
----------

Before you can read data from the flash, the chip first needs to load a page from its internal memory into a temporary data buffer. After power-up, this is already done automatically for page 0, so the device is immediately ready for basic read commands.

This is done by sending a Page Data Read instruction.

>
>
> After the 2,112 bytes of page data are loaded into the Data Buffer, several Read instructions can be issued to access the Data Buffer and read out the data.
>
>

**How to find the Page Address**

As per the data sheet, the PA is 16-bits (which is two bytes) in big endian. Because SPI can only transmit 8 bits at the time, we need to send the high byte and then the low byte.

So the first page would be [0x00, 0x00], the second page would be [0x00, 0x01], and so on…

<img data-recalc-dims="1" loading="lazy" decoding="async" width="614" height="166" data-attachment-id="1088" data-permalink="https://p0pcycle.com/2026/01/22/dumping-a-reolink-e1-pro-firmware-from-the-flash-chip/image-117/" data-orig-file="https://i0.wp.com/p0pcycle.com/wp-content/uploads/2026/01/image-20.png?fit=614%2C166&amp;ssl=1" data-orig-size="614,166" data-comments-opened="1" data-image-title="image" data-image-description="" data-image-caption="" data-large-file="https://i0.wp.com/p0pcycle.com/wp-content/uploads/2026/01/image-20.png?fit=614%2C166&amp;ssl=1" src="https://i0.wp.com/p0pcycle.com/wp-content/uploads/2026/01/image-20.png?resize=614%2C166&amp;ssl=1" alt="" class="wp-image-1088" style="width:346px;height:auto">

**Reading the page**

```
spi.xfer2([CMD_PAGE_DATA_READ, DUMMY_BYTE, page_addr_as_bytes[0], page_addr_as_bytes[1]])
```

**Reading the data**

Our flash has 32.768 pages. Each page size is 2.112 bytes, so we will send `page_size * dummy_byte` to clock out data. Then we can loop in range from 0 to 32.768.

```
NUM_PAGES = 32768

def read_page(page_addr: int) -> bytes:
    page_addr_as_bytes = page_addr.to_bytes(2, byteorder='big')
    spi_sleep() # chill after page read
    spi.xfer2([CMD_PAGE_DATA_READ, DUMMY_BYTE, page_addr_as_bytes[0], page_addr_as_bytes[1]])
    PAGE_SIZE = 2112
    page_contents = bytes(spi.xfer2([CMD_READ_DATA, DUMMY_BYTE, DUMMY_BYTE, DUMMY_BYTE] + [DUMMY_BYTE] * PAGE_SIZE))
    return page_contents

with open("firmware.bin", "wb") as outfile:
    for page in range(NUM_PAGES):
        print(f"reading page {page}")
        outfile.write(read_page(page))
```

Why we chose Buffer Read Mode
----------

There are two modes values for BUF to read data from the flash chip, being Continuous Read (BUF = 0) or Buffer Read Mode (BUF = 1):

**Buffer Read Mode**  
In this mode, you tell the chip *where* in the buffer you want to start reading by providing a column (offset) address. The flash will then output data starting from that position. When it reaches the end of the buffer, it simply stops outputting data. This mode is useful when you only want a specific portion of a page.

**Continuous Read Mode**  
In this mode, you don’t need to specify a starting position. The chip always begins reading from the start of the buffer. When it reaches the end of the current page, it automatically continues reading into the next page. This allows you to read large chunks of memory, or even the entire flash, using a single read command.

Our initial idea was to use the continuous read mode (as it’s enabled by default) and would let us dump the entire flash contents with a single read instruction. However, we learned that the SPI transaction size (the read) is limited (often to 4KiB by the kernel driver).

**With Continuous Read Mode**: Theoretically more efficient, but we would need CS to stay low continuously (as mentioned in the datasheet).

*Chip Select (CS) side-note:*  
*CS is like a “listen/ignore” switch for the chip. When CS is low, it means it will listen to instructions and receive “messages”. When CS is high, it will not process any instructions.*

If the SPI transaction breaks after 4KiB and CS goes high, the continuous read is interrupted and we would lose our position in the stream.

<img data-recalc-dims="1" loading="lazy" decoding="async" width="1074" height="358" data-attachment-id="1077" data-permalink="https://p0pcycle.com/2026/01/22/dumping-a-reolink-e1-pro-firmware-from-the-flash-chip/image-116/" data-orig-file="https://i0.wp.com/p0pcycle.com/wp-content/uploads/2026/01/image-19.png?fit=1074%2C358&amp;ssl=1" data-orig-size="1074,358" data-comments-opened="1" data-image-title="image" data-image-description="" data-image-caption="" data-large-file="https://i0.wp.com/p0pcycle.com/wp-content/uploads/2026/01/image-19.png?fit=1024%2C341&amp;ssl=1" src="https://i0.wp.com/p0pcycle.com/wp-content/uploads/2026/01/image-19.png?resize=1074%2C358&amp;ssl=1" alt="" class="wp-image-1077">Notice CS needs to stay at low during the ENTIRE read

**With Buffer Read Mode**: We can work within this limitation by reading one page at a time, CS goes high between each command, and we would just manually loop through pages, not losing our position in the stream since we would be reading page by page.

We got the idea to check the transaction size due to this comment from the SpiDev documentation:

>
>
> Similar to `writebytes` but accepts arbitrary large lists. If list size exceeds buffer size (which is read from `/sys/module/spidev/parameters/bufsiz`), data will be split into smaller chunks and sent in multiple operations. – [Spidev Doc](<https://pypi.org/project/spidev/#:~:text=Similar to writebytes but accepts arbitrary large lists. If list size exceeds buffer size (which is read from /sys/module/spidev/parameters/bufsiz), data will be split into smaller chunks and sent in multiple operations.>)
>
>

```
user:$ cat /sys/module/spidev/parameters/bufsiz
4096
```

So we decided to go with a BUF = 1, Buffer Read Mode. After loading (reading) the page into the buffer, we could then read from the buffer.

Dumping the Firmware
----------

After fixing the power issues and figuring out which read mode we were going to go with, we finally dumped the entire flash chip and wrote the raw bytes to a file.

We did it, we finally had a \~valid\~ firmware image.

Extracting the Filesystem
----------

To validate the dump, we ran it through `binwalk`.

Now we finally had recognizable filesystem structures. Seeing an actual embedded filesystem extracted from a device we physically dumped ourselves was incredibly satisfying.

At that point, the main goal of the project was achieved.

However, when trying to extract it with binwalk, we ran into some issues. It wasn’t able to successfully extract the UBI image, and was having trouble with some offsets or perhaps some corrupted UBI blocks.

To be completely honest, we did not want to fight the extraction, so we let Claude Code take the wheel here.

Claude Code searched for the UBI erase count header magic number throughout the entire firmware image. Instead of using binwalk’s detected offset (0x328048), we extracted from 0x580000 where the properly aligned UBI blocks began:

```
dd if=firmware.bin bs=131072 skip=44 count=215 of=ubi_main.bin

ubireader_extract_images -o ubi_extracted ubi_main.bin

unsquashfs -d rootfs_extracted ubi_extracted/ubi_main.bin/img-*-vol-rootfs.ubifs
unsquashfs -d app_extracted ubi_extracted/ubi_main.bin/img-*-vol-app.ubifs
```

<img data-recalc-dims="1" loading="lazy" decoding="async" width="1280" height="245" data-attachment-id="1100" data-permalink="https://p0pcycle.com/2026/01/22/dumping-a-reolink-e1-pro-firmware-from-the-flash-chip/image-118/" data-orig-file="https://i0.wp.com/p0pcycle.com/wp-content/uploads/2026/01/image-21.png?fit=1280%2C245&amp;ssl=1" data-orig-size="1280,245" data-comments-opened="1" data-image-title="image" data-image-description="" data-image-caption="" data-large-file="https://i0.wp.com/p0pcycle.com/wp-content/uploads/2026/01/image-21.png?fit=1024%2C196&amp;ssl=1" src="https://i0.wp.com/p0pcycle.com/wp-content/uploads/2026/01/image-21.png?resize=1280%2C245&amp;ssl=1" alt="" class="wp-image-1100">WE HAVE A FILESYSTEM

Finishing words
----------

This project was messy, confusing, and head-banging… but it was also very fun and educational. If you’re a beginner interested in hardware hacking, I can’t recommend this kind of hands-on project enough.

As usual, I learned a lot more from what didn’t work than from what did work.

<img data-recalc-dims="1" loading="lazy" decoding="async" width="1024" height="764" data-attachment-id="1026" data-permalink="https://p0pcycle.com/2026/01/22/dumping-a-reolink-e1-pro-firmware-from-the-flash-chip/6ca8dd53-fa68-4bea-95a6-588a5b67ebe1/" data-orig-file="https://i0.wp.com/p0pcycle.com/wp-content/uploads/2026/01/6ca8dd53-fa68-4bea-95a6-588a5b67ebe1.jpeg?fit=1024%2C764&amp;ssl=1" data-orig-size="1024,764" data-comments-opened="1" data-image-meta="{&quot;orientation&quot;:&quot;1&quot;}" data-image-title="6CA8DD53-FA68-4BEA-95A6-588A5B67EBE1" data-image-description="" data-image-caption="" data-large-file="https://i0.wp.com/p0pcycle.com/wp-content/uploads/2026/01/6ca8dd53-fa68-4bea-95a6-588a5b67ebe1.jpeg?fit=1024%2C764&amp;ssl=1" src="https://i0.wp.com/p0pcycle.com/wp-content/uploads/2026/01/6ca8dd53-fa68-4bea-95a6-588a5b67ebe1.jpeg?resize=1024%2C764&amp;ssl=1" alt="" class="wp-image-1026">

Final script
----------

```
import spidev
import time
import argparse

parser = argparse.ArgumentParser()
parser.add_argument("-o", "--output", default="firm.bin")
parser.add_argument("--clock", type=int, default=20000000)
parser.add_argument("--numpages", type=int, default=32768)

args = parser.parse_args()

def spi_sleep():
    time.sleep(0.0005)

CMD_JEDEC_ID = 0x9F
CMD_DEVICE_RESET = 0xFF
CMD_PAGE_DATA_READ = 0x13
CMD_READ_DATA = 0x03
CMD_READ_STATUS_REG = 0x05
CMD_WRITE_STATUS_REG = 0x1F

STATUS_REG_2_CFG_ADDR = 0xB0
STATUS_REG_2_BUF_MASK = (1<<3)
STATUS_REG_3_ADDR = 0xC0
STATUS_REG_3_ECC1_MASK = (1<<5)
STATUS_REG_3_ECC0_MASK = (1<<4)

DUMMY_BYTE = 0x00

spi = spidev.SpiDev()
spi.open(0, 0)

spi.max_speed_hz = args.clock
spi.mode = 0

spi.xfer2([CMD_DEVICE_RESET])
spi_sleep() # chill after reset

print(f"jedec ID reply: {bytes(spi.xfer2([CMD_JEDEC_ID, DUMMY_BYTE, DUMMY_BYTE, DUMMY_BYTE, DUMMY_BYTE])).hex()}")

def set_buf_mode(enable: bool):
    cfg_reg = spi.xfer2([CMD_READ_STATUS_REG, STATUS_REG_2_CFG_ADDR, DUMMY_BYTE])[2]
    print(f"read status reg 2: {hex(cfg_reg)}")
    if bool(cfg_reg & STATUS_REG_2_BUF_MASK) != enable:
        if enable:
            cfg_reg |= STATUS_REG_2_BUF_MASK
        else:
            cfg_reg &= ~STATUS_REG_2_BUF_MASK
        print(f"writing to status reg 2 with BUF={int(enable)}: {hex(cfg_reg)}")
        spi.xfer2([CMD_WRITE_STATUS_REG, STATUS_REG_2_CFG_ADDR, cfg_reg])
    else:
        print(f"BUF already set to {int(enable)}")

set_buf_mode(False)

def read_page(page_addr: int) -> bytes:
    page_addr_as_bytes = page_addr.to_bytes(2, byteorder='big')
    spi_sleep() # chill after page read
    spi.xfer2([CMD_PAGE_DATA_READ, DUMMY_BYTE, page_addr_as_bytes[0], page_addr_as_bytes[1]])
    PAGE_SIZE = 2112
    INSTRUCTION_INPUT_LENGTH  = 4
    page_contents = bytes(spi.xfer2([CMD_READ_DATA, DUMMY_BYTE, DUMMY_BYTE, DUMMY_BYTE] + [DUMMY_BYTE] * PAGE_SIZE)[INSTRUCTION_INPUT_LENGTH:-64])
    assert(len(page_contents) == 2048)

    status_reg_3 = spi.xfer2([CMD_READ_STATUS_REG, STATUS_REG_3_ADDR, DUMMY_BYTE])[2]
    if status_reg_3 & (STATUS_REG_3_ECC1_MASK|STATUS_REG_3_ECC0_MASK) != 0:
        print(f"ECC failure: {hex(status_reg_3)}")
        exit(1)
    return page_contents

with open(args.output, "wb") as outfile:
    for page in range(args.numpages):
        print(f"reading page {page}")
        outfile.write(read_page(page))

print("done")
```