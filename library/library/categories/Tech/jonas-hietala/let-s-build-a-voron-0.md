---
title = "Let's build a VORON 0"
description = "About 1.5 years ago I ventured into 3D printing by building a VORON Trident. It was a very fun project and I’ve even used the printer quite a bit.Naturally, I had to build another one and this time I opted for the "
date = "2025-04-04T04:49:41Z"
url = "http://jonashietala.se/blog/2025/03/25/lets_build_a_voron_0/index.html"
author = "Jonas Hietala"
text = ""
lastupdated = "2025-10-22T08:58:11.114170522Z"
seen = true
---

![](/images/voron_0/completed_front.jpg)

About 1.5 years ago I ventured into 3D printing by [building a VORON Trident](/series/voron_trident/). It was a very fun project and I’ve even used the printer quite a bit.

Naturally, I had to build another one and this time I opted for the cute [VORON 0](https://vorondesign.com/voron0.2).

[Why another printer?](#Why-another-printer)
----------

I really like my [VORON Trident](/series/voron_trident/) and it’ll continue to be my main printer for the foreseeable future but a second printer would do two important things for me:

1. Act as a backup printer if my Trident breaks.

   A printer made partially of printed parts is great as you can easily repair it… But only if you have a working printer to print the parts.

   It would also be very annoying if I disassemble the printer because I want to mod it and realize I’ve forgotten to print a part I needed.

2. Building printers are *really fun*.

   [Building the VORON Trident](/series/voron_trident/) is one of my most fun and rewarding projects I’ve done.

[Why a VORON 0?](#Why-a-VORON-0)
----------

These properties makes the VORON 0 an ideal secondary printer for me:

1. You need to assemble the VORON 0 yourself (a feature not a bug)

2. Prints ABS/ASA well (for printer parts)

3. Very moddable and truly open source

4. It’s tiny

   ![](/images/voron_0/zero_and_trident.jpg) The VORON 0 to the left and the VORON Trident 250 to the right. It’s really small, which is perfect for me as I have a limited amount of space.

   It would be very fun to build a VORON 2.4 (or even a VORON Phoenix) but I really don’t have space for more printers.

[Getting the parts](#Getting-the-parts)
----------

I opted to buy a kit instead of self-sourcing the parts as it’s usually cheaper and requires a lot less work, even if you replace some parts.

This is what I ended up getting:

* A VORON 0 kit from [Lecktor](https://lecktor.com/en/)

* Parts for a [Dragon Burner](https://github.com/chirpy2605/voron/tree/main/V0/Dragon_Burner) toolhead

* Parts for a [Nevermore V4](https://github.com/nevermore3d/Nevermore_Micro) active carbon filter

* Later on, I replaced the SKR Mini E3 V2 that came with the kit with the V3

### [Lots of delays](#Lots-of-delays) ###

I ordered a VORON 0 from [Lecktor](https://lecktor.com/en/) in February 2024 and it took roughly 4 months before I got the *first* shipment of parts and it wasn’t until the end of 2024 that I had received all the parts needed to complete the build.

The wait was *annoying*…

While I can’t complain about the quality of parts, with the massive delays I regret ordering from [Lecktor](https://lecktor.com/en/) and in hindsight I should’ve ordered an LDO kit from [3DJake](https://www.3djake.com/), like I was first considering.

### [Printing parts myself](#Printing-parts-myself) ###

So what do you do when you can’t start the build?

You print parts!

![](/images/voron_0/box_of_parts.jpg) A box of some of the printed parts for the build (and many I later threw away).

There’s something very satisfying with printing parts you then build a printer with.

This time I wanted to make a colorful printer and I came up with this mix of filament:

* [PolyLite ASA Yellow](https://www.3djake.com/polymaker/polylite-asa-yellow)
* [Formfutura EasyFil ABS Light Green](https://www.3djake.com/formfutura/easyfiltm-abs-light-green)
* [Formfutura EasyFil ABS Light Blue](https://www.3djake.com/formfutura/easyfiltm-abs-light-blue)
* [Formfutura EasyFil ABS Magenta](https://www.3djake.com/formfutura/easyfiltm-abs-magenta)

I think they made the printer look great.

[The build](#The-build)
----------

![](/images/voron_0/office_overview2.jpg)

I won’t do as detailed of a build log as I did when [building the VORON Trident](/series/voron_trident/) but I tried to take some pictures. Scroll on!

### [Frames and bed](#Frames-and-bed) ###

![](/images/voron_0/assembly_start.jpg) The linear Y-rails. ![](/images/voron_0/kirigami_assemblqu.jpg) The kit comes with the [Kirigami bed mod](https://github.com/christophmuellerorg/voron_0_kirigami_bed/). ![](/images/voron_0/frame.jpg) The frame with A/B motors. ![](/images/voron_0/plate_upside_down.jpg) Building the bottom of the printer with feet, power supply, and display.

### [MGN9 instead of MGN7 X-axis](#MGN9-instead-of-MGN7-X-axis) ###

After I assembled the X-axis I noticed a problem:

![](/images/voron_0/wrong_drive2.jpg) The carriage collides with the stock A drive.

The reason is that the kit comes with MGN9 rails for the X-axis instead of the standard MGN7 rails. This required me to reprint modified A/B drives, X-carriage, and alignment tools.

![](/images/voron_0/wrong_drive1.jpg) The carriage passes the modded B drive.

### [Belts](#Belts) ###

![](/images/voron_0/belt_routing.jpg) Starting to install the belt. ![](/images/voron_0/in_progress.jpg) The belt is **tight**.

### [Dragon Burner toolhead](#Dragon-Burner-toolhead) ###

I got the parts needed to build the standard mini stealthburner…

But I’m attracted to playing around with new stuff and I decided to try out the [Dragon Burner](https://github.com/chirpy2605/voron/tree/main/V0/Dragon_Burner) instead. I went with it because it’s quite popular, it has good cooling (I print a bunch of PLA), and I haven’t tried it out yet.

![](/images/voron_0/dragonburner_front.jpg) The fans are inserted. I don’t care about LEDs so I inserted an opaque magenta part instead. I think it looks really good.

Some friendly people over at the [VORON forum](https://forum.vorondesign.com/) and the Discord were quick to point out that I had installed the hotend fan wrong. The fan is supposed to blow air towards the hotend, not away from it.

![](/images/voron_0/nevermore_fan_ok.jpg) The hotend fan now correctly installed. The sticker on this particular fan should be pointing inwards and shouldn’t be visible. ![](/images/voron_0/dragonburner_back.jpg) The back of the Dragon Burner. I opted for the [Rapido 2](https://www.phaetus.com/products/rapido2) instead of the [Dragon](https://www.phaetus.com/products/dragon-hotend-hf) that came with the kit because the [Dragon](https://www.phaetus.com/products/dragon-hotend-hf) has problems printing PLA. ![](/images/voron_0/dragonburner_cable_back.jpg) I was a bit confused on how to route the wires as there was very little space when mounting the toolhead on the carriage. Routing the wires close to the fans, clipping off the ears of the fans, and holding together it with cable ties in this way worked for me.

### [Galileo 2 standalone](#Galileo-2-standalone) ###

![](/images/voron_0/dragonburner_mounted.jpg) Dragon Burner together with the Galileo 2 extruder mounted on the printer.

For the extruder I opted for the standalone version of [Galileo 2](https://github.com/JaredC01/Galileo2). I’ve [used Galileo 2 on the Trident](/blog/2024/02/27/lets_build_a_voron_more_mods#Galileo-2) but I hated the push down latch it uses in the Stealthburner configuration. The latch eventually broke by pulling out a heat-set insert so I went back to the Clockwork 2 on the Trident, giving me the parts to rebuilt the Galileo for the VORON 0 in a standalone configuration.

![](/images/voron_0/galileo_standalone.jpg) The parts for Galileo 2. There will be left-overs from the Stealthburner variant.

The build was really fast and simple—compared to the Stealthburner variant it’s night and day. I didn’t even think to take a break for pictures.

### [Nevermore filter](#Nevermore-filter) ###

Since I want to be able to print ABS I feel I need to have an activated carbon filter. I wanted to have an exhaust fan with a HEPA filter as well, but I’ll leave that to a mod in the future.

The [Nevermore V4](https://github.com/nevermore3d/Nevermore_Micro) is an activated carbon filter that fits well in the VORON 0.

![](/images/voron_0/nevermore_fan.jpg) I fastened the fan using a strip of VHB—it was a struggle to position it in the middle. ![](/images/voron_0/nevermore_mounted.jpg) The Nevermore is mounted standing in the side of the printer.

Just remember to preload the extrusion with extra M3 nuts when you assemble the printer. (I’ve heard LDO has nuts you can insert after… Sounds great.)

### [Panels](#Panels) ###

![](/images/voron_0/backplate.jpg) With the panel and spool holder at the back.

Please ignore the filament path in this picture, it’ll interfere with the rear belt when routed behind the umbilical cable.

![](/images/voron_0/panels_tophat.jpg) With the tophat and door installed.

I’m slightly annoyed with the small gaps and holes the printer has (mainly between the tophat and the panels at the bottom half).

I later changed some of the parts related to the top hat to match the colorscheme better.

### [Wiring](#Wiring) ###

Wiring was simpler than for the [Trident](/series/voron_trident/) but it was harder to make the wiring pretty. Thank god I could cover it up.

![](/images/voron_0/bottom_wiring.jpg) The underside of the printer with the power, 5V converter, display, and Z-motor. ![](/images/voron_0/back_wiring.jpg) Back of the printer with the Raspberry Pi and MCU.

#### [Raspberry Pi](#Raspberry-Pi) ####

![](/images/voron_0/pi_zero.jpg) The Raspberry Pi only has two cables; power and communication over the GPIO pins and a display via USB. ![](/images/voron_0/tft_connection.jpg) The Pi communicates and gets power over the TFT connection on the MCU.

#### [Toolhead](#Toolhead) ####

The kit came with a toolhead board and breakout board for an umbilical setup:

![](/images/voron_0/toolhead_board.jpg) The toolhead board.  
 I didn’t use the x-endstop. ![](/images/voron_0/umbilical_breakout_board.jpg) The breakout board.

I did run into an issue where the polarity of the fans on the toolhead board did not match the polarity of the fans on the MCU, leading to some frustration where the fans refused to spin. I ended up swapping the polarity using the cables from the breakout board to the MCU.

#### [Chamber thermistor](#Chamber-thermistor) ####

The MCU only has two thermistor ports and they’re used for the hotend and bed thermistors. For the chamber thermistor (that’s integrated into the breakout board) I use the MOSI pin on the SPI1 8-pin header:

![](/images/voron_0/chamber_thermistor.jpg) The chamber thermistor connected to MOSI and ground on the SPI1 header.

#### [SKR mini E3 v3](#SKR-mini-E3-v3) ####

I got an SKR mini E3 v2 with the kit but I replaced it with the v3 for two reasons:

1. An extra `FAN` output, used for the Nevermore Filter
2. A filament runout sensor

There’s not much to say about the extra `FAN` output but the filament runout sensor has 3 pins, while VORON 0.2 style runout sensor has 3 pins. I reused the prepared y-endstop I got with the kit, scratched away some of the plastic to make the 2-pin connection fit the 3-pins on the MCU (the +5V pin isn’t needed):

![](/images/filament_runout_sensor.jpg) The filament runout sensor connected to `E0-stop`.  
 Yes it’s not the right connector but where there’s a will there’s a way.

[Klipper setup](#Klipper-setup)
----------

I followed the [VORON documentation](https://docs.vorondesign.com/build/software/#software-installation) and chose Mainsail as I’ve been happy with it on my Trident. I’m not going to describe everything and only call out some issues I had or extra steps I had to take.

### [MCU firmware](#MCU-firmware) ###

The [VORON documentation](https://docs.vorondesign.com/build/software/#software-installation) assumes USB communication so the default firmware instructions didn’t work for me.

According to [BigTreeTech’s documentation](https://github.com/bigtreetech/BIGTREETECH-SKR-mini-E3/blob/master/firmware/V3.0/Klipper/README.md) if you communicate over USART2 (the TFT port) then you need to compile the firmware with `Communication interface` set to `Serial (on USART2 PA3/PA2)`. You then need to use this klipper configuration:

```
[mcu]
serial: /dev/ttyAMA0
restart_method: command

```

It took a long time for me to figure out as I had a display connected via USB, so I thought the display was the MCU and got stuck at a `Your Klipper version is: xxx MCU(s) which should be updated: xxx` error.

### [Filament runout](#Filament-runout) ###

```
[filament_switch_sensor Filament_Runout_Sensor]
pause_on_runout: True
runout_gcode: PAUSE
switch_pin: PC15

```

### [Chamber thermistor](#Chamber-thermistor-1) ###

According to [this comment](https://github.com/bigtreetech/BIGTREETECH-SKR-mini-E3/issues/632#issuecomment-1383618898) this is the config to use the SPI header for a thermistor:

```
[temperature_sensor chamber_temp]
sensor_type: Generic 3950
sensor_pin: PA7
pullup_resistor: 10000

```

Works for me™

### [Display](#Display) ###

It’s [easy to flash the display](https://forum.vorondesign.com/threads/voron-0-display-not-flashing.1641/) directly from the Raspberry Pi although the first firmware I built was too large. There are optional features you can remove but I removed too many so the configuration for the buttons wasn’t accepted. These were the features that ended up working for me:

```
[*] Support GPIO "bit-banging" devices
[*] Support LCD devices
[ ] Support thermocouple MAX sensors
[ ] Support adxl accelerometers
[ ] Support lis2dw and lis3dh 3-axis accelerometers
[ ] Support MPU accelerometers
[*] Support HX711 and HX717 ADC chips
[ ] Support ADS 1220 ADC chip
[ ] Support ldc1612 eddy current sensor
[ ] Support angle sensors
[*] Support software based I2C "bit-banging"
[*] Support software based SPI "bit-banging"

```

### [Sensorless homing](#Sensorless-homing) ###

I was nervous setting up sensorless homing, fearing that without a physical switch the printer might decide to burn the motor against the edge or something. (I really have no idea how it works, hence my fear.)

In the end it was straightforward. The [VORON 0 example firmware](https://github.com/VoronDesign/Voron-0/tree/Voron0.2r1/Firmware) was already configured for sensorless homing and the only things I had to do was:

1. Physically jump the `X-DIAG` and `Y-DIAG` pins on the board
2. Tweak the `driver_SGTHRS` values (I landed on `85` down from `255`)

And now I have sensorless homing working consistently.

What confused me was that the [sensorless homing guide](https://docs.vorondesign.com/tuning/sensorless.html) and the [homing macros](https://github.com/EricZimmerman/Voron02/blob/PreKlippain/macros/helpers/homing.cfg) it links to were slightly different from the [VORON 0 example firmware](https://github.com/VoronDesign/Voron-0/tree/Voron0.2r1/Firmware) and it wasn’t clear if I had to make all the changes or not. (I did not.)

[Some random issues I encountered](#Some-random-issues-I-encountered)
----------

In typical 3D printer fashion, you’ll always run into various issues, for example:

* I got the `mcu shutdown: Timer too close` error a few times.

  I don’t know what I did but it only happened a couple of times at beginning.

* The filament sensor had some consistency issues.

  Some extra tape on the bearing seemed to fix it.

* The filament keeps getting stuck in the extruder after unload.

  I’m still having issues but forgetting to tighten the nozzle and using a too short PTFE tube didn’t help.

* I had trouble getting the filament to stick to bed.

  Super frustrating to be honest. I re-calibrated the z offset and thumb screws a bunch of times and (right now) it seems to work fairly well. Even though you’re not supposed to need automatic bed leveling for a printer this small, I can’t help but miss the “just works” feeling I have with the Trident.

  Update 2025-03-27

  I absolutely recommend anyone to follow Elli’s [First Layer Squish](https://ellis3dp.com/Print-Tuning-Guide/articles/first_layer_squish.html) guide after you’ve tried to calibrate your bed screws and z endstop. It’s much easier to see any minor inconsistencies visually than with the paper test and you’ll get much better bed adhesion (and prints) if you just take your time to tune in a good first layer squish.

[Initial thoughts on the printer](#Initial-thoughts-on-the-printer)
----------

![](/images/voron_0/dino_print.jpg) A model I printed for one of my kids. It came out really well.

I haven’t printed that much with the printer yet but I have some positive things to say about it:

* It looks very good and was very fun to build.
* The small footprint is great and a surprising amount of prints fits on the small build volume.
* The print quality is very good. The extra cooling from the [Dragon Burner](https://github.com/chirpy2605/voron/tree/main/V0/Dragon_Burner) is great when printing PLA (which I use a lot).

But I have some negative things to say too:

* It’s loud. The 5V fan close to the Raspberry Pi is *horribly* loud but the print movement is also too loud for my taste.
* It’s poorly insulated. For example there are gaps between the top hat and the rest of the printer that I don’t see a good way to cover up.

Overall though I’m very happy with it. I wouldn’t recommend it as a first printer or to someone who just wants a tool that works out of the box, but for people like me who wanted to build a backup/secondary printer I think it’s *great*.

[What’s next?](#Whats-next)
----------

With a secondary printer finally up and running I can now start working on some significant mods for my [Trident](/series/voron_trident/)! This is the tentative plan right now:

1. Install the [Inverted electronics](https://mods.vorondesign.com/details/pXkXHVIUbqSWqQKJISczw) mod.
2. Replace Stealthburner with another toolhead, most likely [A4T-toolhead](https://github.com/Armchair-Heavy-Industries/A4T).
3. Build a [BoxTurtle](https://www.3djake.com/ldo-motors/boxturtle-v10) for multi-color support.

But we’ll see when I manage to get to it. I’m not in a rush and I should take a little break and play with my [VORON 0](https://vorondesign.com/voron0.2) and perhaps work on my other dozen or so projects that lie dormant.