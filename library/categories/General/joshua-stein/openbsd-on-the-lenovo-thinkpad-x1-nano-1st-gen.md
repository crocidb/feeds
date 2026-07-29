+++
title = "OpenBSD on the Lenovo ThinkPad X1 Nano (1st Gen)"
description = """Lenovo has finally made a smaller version of its X1 Carbon, something I've been looking forward to for years.<img src="/images/2021-01-27-hero-680x212.jpg" srcset="/images/2021-01-27-hero-680x212.jpg 1x, /images/2021-01-27-hero-1360x424@2x.jpg 2x" width="680" """
date = "2021-01-27T05:00:00Z"
url = "https://jcs.org/2021/01/27/x1nano#2024-06-25"
author = "joshua stein"
text = ""
lastupdated = "2026-07-28T12:43:13.653808225Z"
seen = false
+++

Lenovo has finally made a smaller version of its [X1 Carbon](/2019/08/14/x1c7), something I've been looking forward to for years.

<img src="/images/2021-01-27-hero-680x212.jpg" srcset="/images/2021-01-27-hero-680x212.jpg 1x, /images/2021-01-27-hero-1360x424@2x.jpg 2x" width="680" height="212" alt="side profile of thinkpad x1 nano on desk" class="header">

Table of Contents
----------

1. [Top](#)

1. [Hardware](#hardware)
2. [Firmware](#firmware)
3. [Current OpenBSD Support Summary](#current-openbsd-support-summary)
4. [Updates](#updates)

Hardware
----------

The X1 Nano is basically a 13" version of the 14" X1 Carbon, reducing its footprint, thickness, and weight. Availability in the US has been fairly limited (and expensive) at the moment, offering no WWAN or any customizable options, and Core i7 models are not shipping out for months. I purchased the Intel Core i5-1135G7 model with 16 GB of RAM and a 1 TB NVMe SSD. The only screen option currently available is a matte non-touch 2K display.

The X1 Nano (X1N1?) weighs 2.0 lbs compared to my previous [X1C7's](/2019/08/14/x1c7) 2.4 lbs. The width is reduced from the 14" X1 Carbon's 12.71" to 11.53", depth from 8.54" to 8.18", and thickness from 14.95mm to 13.87mm.

On the left side of the laptop are two Thunderbolt 3-enabled (USB 4) USB-C ports and a headphone jack. The PCI ethernet device and its required dongle are no longer available, which is not really needed these days with non-Thunderbolt USB-C ethernet adapters being able to max out a gigabit ethernet connection (at least on non-OpenBSD platforms).

On the right side are just the fan vent and power button, which is now moved from about the middle of the side to the far-right edge. I find the power button very hard to press now, especially to hold it in for how ever many seconds it takes to force a hard power-off.

The Dolby Atmos sound system remains with its unfortunate branding still present on the left side of the keyboard deck. There are two up-firing speakers at the top of the keyboard deck, which sound excellent and loud.

The 13" 2K (2160x1350) matte, non-touch IPS screen looks great and is the same horizontal resolution as my [13" MateBook X](/2017/07/14/matebook) which I've still been using for years. The resolution is high enough to use 1.5x scaling but low enough to not draw a lot of power. It can get very bright at 450 nits, and most of the time indoors I'm using it at about 40% brightness. I did a color calibration and it wasn't too far off the factory default.

The Nano has a ThinkShutter device to physically cover up the webcam lens as my X1 Carbon did, and retains the black "ThinkPad" branding on the keyboard deck.

The screen hinge is tight and cannot really be opened one-handed due to the reduced weight of the laptop. However, the lid does not wobble at all when typing.

The keyboard still seems full-sized, though the function-row keys are shorter. The X1 Nano further reduces the X1C7's key travel from 1.5mm to 1.35mm, though I still find it very enjoyable to type on and it retains a chunky tactile feel. The keys do have a bit of a creaky sound when typing or just moving fingers on keys without pressing them, though adding keyboard grease/lube under the most egregious offenders quieted them down significantly. The keyboard is backlit and offers two levels of adjustment with `Fn+Space` or through `wsconsctl keyboard.backlight` on OpenBSD, or through software utilities like [xdimmer](https://github.com/jcs/xdimmer).

The Elan touchpad surface remains soft and easy to glide fingers across, and its integrated "diving-board-style" button has a quiet thud for a click with no play in its mechanism. The three physical TrackPoint buttons between the keyboard and touchpad have a shallow click. The TrackPoint still operates over a legacy PS/2 attachment and the touchpad is a Windows Precision Touchpad connected over I<sup>2</sup>C as on the X1C7.

I am again using a far-superior ["soft rim"-style TrackPoint cap](https://www.etsy.com/listing/862901861/3mm-high-softrim-type-3d-printed-caps) as I did on my X1 Carbon, though the cap for the X1 Nano is even shorter at 3mm.

[<img src="/images/2021-01-27-trackpoint-335x251.jpg" srcset="/images/2021-01-27-trackpoint-335x251.jpg 1x, /images/2021-01-27-trackpoint-670x502@2x.jpg 2x" width="335" height="251" alt="close-up of keyboard showing new trackpoint cap installed, with old cap next to it" class="1/2">](/images/2021-01-27-trackpoint-1500x1125.jpg) [<img src="/images/2021-01-27-trackpoint_profile-335x251.jpg" srcset="/images/2021-01-27-trackpoint_profile-335x251.jpg 1x, /images/2021-01-27-trackpoint_profile-670x502@2x.jpg 2x" width="335" height="251" alt="new trackpoint cap height compared to keyboard key height" class="1/2">](/images/2021-01-27-trackpoint_profile-1500x1125.jpg)

A square USB-attached fingerprint sensor sits unused next to the touchpad which I'd honestly forgotten was even there until I just looked at a picture.

Wireless connectivity is provided by a non-socketed Intel AX201 802.11ax WiFi and Bluetooth 5.1 chip. The original SSD was a Western Digital PC SN530 removable m.2 2242 form-factor SSD mounted under a heatsink, which I've since upgraded to a SanDisk WD PC SN740 2 TB SSD.

There is no audible coil whine. The fan has a tendency to come on rather eagerly when the CPU is allowed to use its full frequency with turbo, and to remain on for what seems like a long time even after the CPU-intensive operation has stopped and the surface of the laptop is cool to the touch. Fortunately the fan is rather quiet (\~33 dBA about an inch from the exhaust outlet at the fan's highest setting) and has a neutral white-noise sound without any high-pitched whining. Perhaps a future update to the firmware/EC will adjust the temperature thresholds for the fan to come on less eagerly, and not stay on so long.

[<img src="/images/2021-01-27-inside-680x510.jpg" srcset="/images/2021-01-27-inside-680x510.jpg 1x, /images/2021-01-27-inside-1360x1020@2x.jpg 2x" width="680" height="510" alt="inside of x1 nano" class="wide">](/images/2021-01-27-inside-1500x1125.jpg)

Firmware
----------

The X1 Nano defaults to a graphical firmware upon pressing `F1`, which can be switched back into a simple text mode. `F12` can be used to temporarily select a different boot device. Pro-tip: press `Fn+F1` to mute the speakers before pressing either of these options to prevent a loud, annoying beep.

I recommend enabling the "F1-F12 as Primary Function" option to not require using the Fn key to register these keys.

Installing a different boot logo is still [possible](/2017/09/01/thinkpad_x1c#firmware) through Windows, which also gets rid of the new "TCO Certified" logo in the bottom-right corner.

Secure Boot must be disabled in the BIOS menu to boot OpenBSD, and a "CSM Support" option is no longer available (nor needed).

Unfortunately the X1 Nano is an "Intel Evo" platform device, which means it no longer has a normal ACPI S3 suspend mode. The X1C7 had a firmware option to disable this "Modern Standby" and enable "Legacy S3 standby mode", but the X1 Nano no longer has this option.

As of firmware version [1.43](https://download.lenovo.com/pccbbs/mobiles/n2tuj12w.txt) the X1 Nano has a normal S3 suspend mode with the sleep option in the firmware menu set to "Linux".

Current OpenBSD Support Summary
----------

Status is relative to OpenBSD-current as of 2023-06-13.

|    Component     |Works?|                                                                                                     Notes                                                                                                     |
|------------------|------|---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
|      Audio       | Yes  |                                  Intel audio with Realtek ALC287 codec and supported by [`azalia`](http://man.openbsd.org/azalia.4). Microphone can be disabled in the BIOS.                                  |
|  Battery status  | Yes  |                                                            48Whr battery, status available through [`acpibat`](http://man.openbsd.org/acpibat.4).                                                             |
|    Bluetooth     |  No  |                                      Attaches as a [`ugen`](http://man.openbsd.org/ugen.4) device, but OpenBSD does not support Bluetooth. Can be disabled in the BIOS.                                       |
|Fingerprint sensor|  No  |Synaptics `00bd` via USB, [might be supported by libfprint](https://www.reddit.com/r/thinkpad/comments/e90cgp/p43s_working_fingerprint_reader_on_linux/) with some extra firmware. Can be disabled in the BIOS.|
|Keyboard backlight| Yes  |                                      Supported natively by the EC. Can be toggled with Fn+Space and with `wsconsctl keyboard.backlight` values of `0`, `50`, and `100`.                                       |
|   Hibernation    | Yes  |                                                                          Can be triggered by [`ZZZ`](http://man.openbsd.org/ZZZ.8).                                                                           |
|       SSD        | Yes  |                                             The ~~Western Digital PC SN530~~ SanDisk PC SN740 NVMe drive is supported by [`nvme`](http://man.openbsd.org/nvme.4).                                             |
| Suspend / resume | Yes  |                                                            ACPI S3 suspend support requires a BIOS update and the S3 Sleep option set to "Linux".                                                             |
|  Thunderbolt 3   | Yes  |                   Thunderbolt `ppb` bridges magically appear when devices are plugged in; tested with [`nvme`](https://man.openbsd.org/nvme.4) and [`bge`](https://man.openbsd.org/bge.4).                    |
|     Touchpad     | Yes  |                                                                   Elan I<sup>2</sup>C, supported by [`imt`](http://man.openbsd.org/imt.4).                                                                    |
|    TrackPoint    | Yes  |                                                                              Supported by [`pms`](http://man.openbsd.org/pms.4).                                                                              |
|       USB        | Yes  |                                                                                         The 2 USB-C ports work fine.                                                                                          |
|      Video       | Yes  |                 [`inteldrm`](http://man.openbsd.org/inteldrm.4) supports accelerated video, DPMS, gamma control, and integrated backlight control. HDMI output through a USB-C adapter works.                 |
|      Webcam      | Yes  |                         Chicony USB, supported by the [`uvideo`](http://man.openbsd.org/uvideo.4) driver when the `kern.video.record` sysctl is enabled. Can be disabled in the BIOS.                         |
|     Wireless     | Yes  |                                                  The non-removable Intel AX201 802.11ax wireless chip is supported by [`iwx`](http://man.openbsd.org/iwx.4).                                                  |

Updates
----------

**2021-01-17:** The usual round of PCI device ID additions have been made, and `iwx` has been [updated](https://github.com/openbsd/src/commit/8edfa316af4155e6583562fc817d827a3f2fbd09) to attach to the AX201 device found in the X1 Nano.

There are some minor issues with DPMS that cause the screen to take a few seconds longer to wake up after being shut off. Sometimes when returning to my laptop after it's been locked (and the screen turned off via DPMS) it blinks a few times before showing the screen contents.

**2021-01-25:** I've been experimenting with [adjustable fan control in `acpithinkpad`](https://github.com/jcs/openbsd-src/commit/cf7c4a31389d24a07c91c40e3daa9da68339e037) to silence the fan at all times. It doesn't seem to raise the temperature too high, and the laptop seems capable of passively cooling itself down fairly well once CPU-intensive tasks have stopped.

**2021-01-27:** I've also been working on [adding support for Intel HWP](https://github.com/jcs/openbsd-src/commit/29edcdbd593388193af3e1461f4432c6c94ff5b2) as a modern replacement for OpenBSD's `hw.setperf`, where the processors/firmware dynamically adjust their frequency on their own in response to work load, rather than the OpenBSD kernel doing it.

**2021-06-27:** The X1 Nano now has a [firmware update](https://download.lenovo.com/pccbbs/mobiles/n2tuj12w.txt) that adds a "Sleep State for Linux" option which emulates S3, however resuming does not yet work properly with OpenBSD.

**2021-09-13:** The S3 suspend and resume issue has been [fixed](https://github.com/openbsd/src/commit/01a460e63d55e408f8cad398e0fca6927377f517) with proper TPM 2.0 support in the `tpm` driver, so the X1 Nano can fully suspend and resume in OpenBSD now as long as the BIOS is updated and the TPM is enabled in the BIOS.

**2023-06-13:** I [upgraded](/images/2021-01-27-ssd-3059x2292.jpg) the original 512 GB Western Digital PC SN530 SSD to a 2 TB SanDisk WD PC SN740 SSD. While it's difficult to find a fast, high-capacity, single-sided SSD in 2242 form factor, the PC SN740 is a single-sided 2230 drive that is readily available in large capacities and can be [adapted](https://amzn.to/3qwUGKm) to 2242 size to fit the X1 Nano.

I also discovered by accident that Thunderbolt magically works without any driver support on OpenBSD. I plugged in a [Thunderbolt NVMe enclosure](https://amzn.to/3Jcce5b) to check whether it would fall back to USB attachment, but `ppb`, `pci`, and `nvme` devices attached. I verified with an Apple Thunderbolt 2 ethernet device (through a Thunderbolt 2 to 3 adapter) and it also attached as `bge` as expected, and detached properly when unplugging.

**2024-06-22:** I created an [internal USB port board](/2024/05/29/x1usb) to replace the fingerprint reader with a USB port to carry around my Logitech mouse dongle.

**2024-06-24:** I 3d-printed TPU replacements for the TrackPoint nub and fingerprint reader slots, and painted the TrackPoint buttons as an [homage](/notes/2024/06/24/112672910483122131) to [Dolch systems](/2018/03/20/dolch64):

[<img src="/images/2021-01-27-dolch-335x251.jpg" srcset="/images/2021-01-27-dolch-335x251.jpg 1x, /images/2021-01-27-dolch-670x502@2x.jpg 2x" width="335" height="251" class="1/2">](/images/2021-01-27-dolch-1500x1124.jpg) [<img src="/images/2021-01-27-together-335x251.jpg" srcset="/images/2021-01-27-together-335x251.jpg 1x, /images/2021-01-27-together-670x502@2x.jpg 2x" width="335" height="251" class="1/2">](/images/2021-01-27-together-1500x1124.jpg)