+++
title = "Recovering BIOS Firmware on the Star Labs StarBook"
description = 'How I recovered the bricked firmware on my \_Star Labs StarBook Mk VI (AMD)\_ using a generic \_CH341A\_ SPI programmer with a 1.8V adapter and flashrom.'
date = "2026-08-14T11:03:36Z"
url = "https://xn--gckvb8fzb.com/recovering-bios-firmware-on-the-star-labs-starbook/"
author = "marius@xn--gckvb8fzb.com (Marius)"
text = ""
lastupdated = "2026-08-24T15:49:16.029206168Z"
seen = false
+++

As I described in my [latest quarterly update](/updates-2026-q2/), a perfectly routine firmware update managed to turn my [*Star Labs StarBook Mk VI (AMD)*](/computer/#f0g6) into an expensive paperweight. I had simply copy-pasted the `curl ... | bash` one-liner from *Star Labs*' [official documentation](https://support.starlabs.systems/hc/star-labs/articles/updating-your-firmware), the script did its thing for about half a minute, shut the device down, and from that point on the *StarBook* refused to boot. Black screen, keyboard backlight on, the power LED lit, and the speakers occasionally producing a *clacking* sound. Sadly no amount of the usual *turn-it-off-and-on-again* rituals or battery disconnects brought it back.

The only way out of this situation is to re-flash the BIOS chip externally using an SPI programmer. *Star Labs* do [document this](https://support.starlabs.systems/hc/star-labs/articles/starbook-mk-vvivii-installingrecovering-firmware-with-external-programmer), however their guide assumes you’re using **their** *programming kit* together with a dedicated *debug board* and an *FPC* cable. That kit is significantly more expensive than a generic programmer, doesn’t list any make or model information, and, at the time of writing, has been permanently *out of stock* on their web shop. Not exactly helpful when you’re stranded somewhere with a dead laptop that happens to be the only computer you have with you.

The good news is that you don’t need any of that, at least for this specific model of the *StarBook*. As *Star Labs*’ own *Sean* [pointed out](https://github.com/StarLabsLtd/firmware/issues/396) in the GitHub issue I opened while debugging this mess, this specific *StarBook* uses a *SOIC-8* flash chip, which means you can recover it with a cheap, generic *CH341A* programmer and an ordinary SPI clip, as long as you respect its voltage.

**Warning:** Flashing a BIOS chip externally can **permanently** destroy your device if you do it wrong. The flash chip on the AMD *StarBook* runs at **1.8V** and you **must** use a 1.8V adapter. Driving it at the *CH341A*’s default 3.3V risks damaging the chip, and won’t read it correctly anyway. Everything below is what worked for me, documented to the best of my knowledge, but you’re doing this entirely at your own risk.

1.8V
----------

The flash chip on my *StarBook Mk VI (AMD)*, which I could read off the silicon once I had the backplate off, is a *Winbond 25R128JWSQ*, a SPI NOR flash in a *SOIC-8* package. The `JW` suffix on *Winbond* parts apparently denotes the 1.8V variants.

The ubiquitous, three-dollar *CH341A* “black” programmers that you’ll find on *AliExpress*, *Amazon*, and pretty much everywhere else operate their SPI lines at 3.3V (and the parallel header at 5V). Clamp one of those directly onto a 1.8V chip and, best case, `flashrom` reads garbage. Worst case, however, you cook the flash or something downstream of it.

The *fix* is a small 1.8V adapter board (essentially a level shifter with a voltage regulator) that sits between the *CH341A* and your *SOIC-8* clip. These are sold as kits, e.g. the *KOOBOOK CH341A Programmer + 1.8V Adapter* combo that *Sean* [linked](https://github.com/StarLabsLtd/firmware/issues/396) in the issue. Make sure whatever you buy explicitly mentions 1.8V.

What you’ll need
----------

You will need a *CH341A* programmer with a 1.8V SOIC-8 adapter, a *SOIC-8* test clip (the spring-loaded “Pomona-style” clips, or the cheaper ribbon-cable variety, both work), a second computer running Linux (can be via a live medium, e.g. a USB stick) to drive the programmer from, e.g. a department store laptop and a [*Fedora* live USB](https://support.starlabs.systems/hc/star-labs/articles/updating-your-firmware) will do, if you’re eloquent enough to explain to the staff that you’re definitely not building what almost certainly looks to them like a bomb. You will also need the correct firmware image for your model (more on that below), a small *Phillips* screwdriver and, ideally, a plastic spudger.

Step 1: Opening up the *StarBook*
----------

[![](/recovering-bios-firmware-on-the-star-labs-starbook/images/starbook_1299_hu_ae96ec8610156543.webp)](/recovering-bios-firmware-on-the-star-labs-starbook/images/starbook_1299.jpg)

Power everything off and unplug the charger before you start. Flip the laptop over and remove the backplate by undoing the two long *Phillips* screws in the top corners first, and then the eight shorter screws around the edges. Lift the plate off carefully.

Then, remove the five screws holding the battery in place (one of the screw positions is intentionally left empty) and gently unplug the battery connector.

Last but not least, locate the *SOIC-8* flash chip on the mainboard. It’s the little eight-legged *Winbond* chip described above.

**Note:** While I had the *StarBook* open, I noticed that my (barely two year old) battery had started to visibly bulge, so do take a moment to inspect yours. A swollen lithium battery is a fire hazard and should be replaced.

Step 2: Connecting the clip
----------

[![](/recovering-bios-firmware-on-the-star-labs-starbook/images/starbook_1307_hu_2efea64e3ebbc4e0.webp)](/recovering-bios-firmware-on-the-star-labs-starbook/images/starbook_1307.jpg)

*SOIC-8* flash chips have a defined pin 1, and the clip’s pin 1 (usually the wire on the red edge of the ribbon) has to line up with it. Get the orientation wrong and the chip simply won’t show up.

For reference, the pinout of the *Winbond* *SOIC-8* flash is:

|Pin|   Name    |   Function    |
|---|-----------|---------------|
| 1 |    /CS    |  Chip select  |
| 2 | DO (IO1)  |Data out / MISO|
| 3 | /WP (IO2) | Write protect |
| 4 |    GND    |    Ground     |
| 5 | DI (IO0)  |Data in / MOSI |
| 6 |    CLK    |     Clock     |
| 7 |/HOLD (IO3)|     Hold      |
| 8 |    VCC    | Power (1.8V)  |

You don’t have to wire any of this up by hand, though, as the clip and the 1.8V adapter carry all eight lines for you. The only thing you need to get right is aligning pin 1 of the clip with pin 1 of the chip.

[![](/recovering-bios-firmware-on-the-star-labs-starbook/images/starbook_chip_hu_f15f24b4646e1710.webp)](/recovering-bios-firmware-on-the-star-labs-starbook/images/starbook_chip.jpg)

**Note:** On my chip there is a gray dot painted onto the package, on the corner *opposite* to pin 1. Pin 1 is instead marked by the small *indented* (etched) dot, on the exact opposite side from the painted one. I have no idea why the gray dot is there, but if you align to it you’ll have the clip on backwards. Look for the indentation, not for the gray spot if yours has one too.

Step 3: Flashing with `flashrom`
----------

[![](/recovering-bios-firmware-on-the-star-labs-starbook/images/starbook_1311_hu_8d1b6beb1362f6c.webp)](/recovering-bios-firmware-on-the-star-labs-starbook/images/starbook_1311.jpg)

With the clip attached, plug the *CH341A* into your second machine. A quick look at `dmesg` should confirm it enumerated:

```
usb 3-6: New USB device found, idVendor=1a86, idProduct=5512, bcdDevice= 3.04
usb 3-6: Product: USB UART-LPT

```

Install [`flashrom`](https://flashrom.org) if you haven’t already:

```sh
# Debian/Ubuntu
sudo apt install flashrom

# Fedora
sudo dnf install flashrom

```

Before writing anything, make sure `flashrom` can actually talk to the flash over your clip:

```sh
sudo flashrom -p ch341a_spi

```

If everything is seated correctly, `flashrom` will identify the *Winbond* chip (detected as something like `W25Q128JW`). If instead you get:

```
No EEPROM/flash device found.
Note: flashrom can never write if the flash chip isn't found automatically.

```

…then don’t panic. In my experience this is almost always poor clip contact rather than a real problem. I had to wiggle and reseat the clamp a few times before the chip showed up reliably, because those cheap clips are fiddly. Only proceed once the chip is detected consistently across a couple of runs.

Even if the firmware is bricked, it’s good practice to take a backup before you overwrite anything. Read the chip twice and compare the dumps to be sure your contact is solid:

```sh
sudo flashrom -p ch341a_spi -r backup1.rom
sudo flashrom -p ch341a_spi -r backup2.rom
cmp backup1.rom backup2.rom && echo "OK: reads match"

```

If the two reads differ, your clip contact is flaky and you should reseat it and try again.

As for the firmware image, *Star Labs* publish their firmware in a [public GitHub repository](https://github.com/StarLabsLtd/firmware). For external programming you want a full SPI image, not the EFI/`fwupd` updater files. For my *StarBook Mk VI (AMD)* (product SKU `B6-A`) that’s the [`roms/B6-A.bios`](https://github.com/StarLabsLtd/firmware/blob/main/roms/B6-A.bios) image. The full-image `flashrom` files also live under the model’s [`ami-flashrom` directory](https://github.com/StarLabsLtd/firmware/tree/main/StarBook/MkVI-AMD/ami-flashrom). Pick the one that matches your model and rename it to something convenient, e.g. `starbook.rom`.

**Note:** *Star Labs*’ firmware versioning is, to put it mildly, a mess. As of writing, the last *AMI* (the original “BIOS”) release for the *AMD* *StarBook* is `25.12`, while `26.04` onwards is *Coreboot*. Whichever you decide to flash, just make sure it’s a full image for your exact model.

---
[![](/recovering-bios-firmware-on-the-star-labs-starbook/images/starbook_1313_hu_4ce0bbcd8af7575b.webp)](/recovering-bios-firmware-on-the-star-labs-starbook/images/starbook_1313.jpg)

Last but not least, write the downloaded image using the `flashrom` command:

```sh
sudo flashrom -p ch341a_spi -w starbook.rom

```

By default `flashrom` will erase, write, and then verify the chip. *Star Labs*' official command appends `-n -N` (i.e. `--noverify` and `--noverify-all`) to skip those verification passes, but I’d recommend leaving them off so `flashrom` confirms the write actually stuck. Either way, do not disconnect or disturb the programmer while it’s working. Once it finishes successfully, remove the clip, reconnect the battery, screw the backplate back on, and try to boot.

Step 4: First boot after recovery
----------

When I powered mine back on, the *StarBook* came to life again, only to stop at a screen complaining about a missing boot entry, since flashing a fresh image also wipes the EFI boot variables. That’s nothing dramatic and you just need to point the firmware back at your bootloader. You can either use the boot menu and pick your SSD, which usually re-adds the boot entry, or boot a recovery/live system and run `grub-install` (this is what I did), or drop into the EFI shell and launch your bootloader manually:

```
fs0:
cd efi/fedora
grubx64.efi

```

**Note:** On newer *Coreboot* releases *Star Labs* are enabling *Rom Armor* and anti-rollback. On the *AMD* board external flashing and downgrading still worked for me on `26.06`, but this is expected to be locked down from `26.07` onwards.

Thoughts
----------

[![](/recovering-bios-firmware-on-the-star-labs-starbook/images/starbook_1309_hu_5d060245c8001323.webp)](/recovering-bios-firmware-on-the-star-labs-starbook/images/starbook_1309.jpg)

What frustrates me most about this whole ordeal isn’t that a firmware update can go wrong, because that’s always a risk when you flash something. It’s that *Star Labs*’ documented recovery path depends on a proprietary kit that nobody can actually buy, when a generic *CH341A* with a 1.8V adapter seemingly does the job just fine. However, this info is nowhere to be found in *Star Labs*’ official documentation, which is why I decided to publish this write-up to begin with. Hopefully it spares the next person the day (and the stress) it cost me.