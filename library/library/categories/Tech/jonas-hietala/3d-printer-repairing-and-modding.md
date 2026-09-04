+++
title = "3D printer repairing and modding"
description = "I’ve had my VORON Trident for 2 years and I’ve run it for 2600 hours. Overall I’m happy with the printer but I’ve been itching to make some more mods to it. Having finally finished the [VORON 0](/blog/2025/03/25/lets_b"
date = "2025-12-02T07:39:25Z"
url = "http://jonashietala.se/blog/2025/12/02/3d_printer_repairing_and_modding/index.html"
author = "Jonas Hietala"
text = ""
lastupdated = "2025-12-10T15:23:53.409003961Z"
seen = true
+++

![](/images/jw_mods/modded_front.jpg)

I’ve had my [VORON Trident](/series/voron_trident) for 2 years and I’ve run it for 2600 hours. Overall I’m happy with the printer but I’ve been itching to make some more mods to it. Having finally finished the [VORON 0](/blog/2025/03/25/lets_build_a_voron_0) ([with mods](/blog/2025/05/02/voron_0_mods)) I now have a backup printer I can use to rescue myself when I screw up.

As the printer was starting to crap out with [a leadscrew starting to grind down again](/blog/2024/03/01/lets_build_a_voron_major_failure/), the chamber thermistor stopped working, and PLA clogging up the Rapido hotend *again* it was time for a bit of a rebuild.

Even my [VORON 0](/blog/2025/03/25/lets_build_a_voron_0) ran into an issue where the bed stopped heating up. This happened at the *same time* as all the issues with the [Trident](/series/voron_trident) started appearing.

So much for having a backup printer!

[The plan](#The-plan)
----------

Besides fixing the printer I also wanted to prepare for a multi-color solution such as the [Box Turtle](https://github.com/ArmoredTurtle/BoxTurtle) and make some quality of life changes.

1. Replace the problematic leadscrew with a replacement part I received from LDO and replace the POM nuts on the other leadscrews.

2. [Install the Inverted electronics](#Inverted-electronics) mod.

   I’ve been using the [RockNRoll](/blog/2024/02/27/lets_build_a_voron_more_mods/#RockNRoll) mod to give access to the electronics compartment by tilting the printer backwards. The [Inverted electronics](https://mods.vorondesign.com/details/pXkXHVIUbqSWqQKJISczw) mod would instead allow me to lift the bottom plate to access the electronics compartment and I want to do it before installing a [Box Turtle](https://github.com/ArmoredTurtle/BoxTurtle) on top of the printer.

3. Replace the Stealthburner with the [Jabberwocky](https://github.com/kinematicdigit/Jabberwocky) toolhead.

   This introduced a series of changes:

   1. Move to an umbilical setup with the [Nitehawk36](https://lab4450.com/product/ldo-nitehawk36-toolhead/) toolboard.

   2. Use [sensorless homing](https://docs.vorondesign.com/tuning/sensorless.html) to get rid of the Y drag chain.

   3. Replace TAP with the [Beacon probe](https://lab4450.com/product/original-beacon-3d-surface-scanner/).

   4. Finally, [install the Jabberwocky](#Installation).

[Replacing the POM nuts](#Replacing-the-POM-nuts)
----------

I’ve had issues before where one of the [POM nuts were ground down](/blog/2024/03/01/lets_build_a_voron_major_failure/) and I felt it was happening again. The printer didn’t completely fail like before but it was sometimes getting really bad first layers in that same corner and the Z probe was occasionally failing to configure Z tilt.

I replaced all three POM nuts together with the whole lead screw (I got a new one sent to me by LDO the first time it failed but I hadn’t installed it yet).

![](/images/jw_mods/pom_nuts.jpg) Dust on the lead screw and all three nuts show signs of damage, although the leftmost is clearly worse off.

This is apparently a common problem with some LDO kits that have coated lead screws. I still have two of the old ones that I may have to replace in the future.

[](#Inverted-electronics)[Inverted electronics](https://mods.vorondesign.com/details/pXkXHVIUbqSWqQKJISczw)
----------

I’ve been looking at the [Inverted electronics](https://mods.vorondesign.com/details/pXkXHVIUbqSWqQKJISczw) mod even before finishing my Trident printer. But it wasn’t possible with the [Print It Forward](https://pif.voron.dev/) service I used to print parts for my first 3D printer, and after the printer was completed I didn’t feel the need to redo the wiring again.

![](/images/jw_mods/electronics_before.jpg) Wiring before ripping it all out. ![](/images/jw_mods/inverted_under.jpg) Underside of the printer with the inverted rails installed. ![](/images/jw_mods/inverted_power.jpg) Installing the first components on the rails. ![](/images/jw_mods/inverted_wiring.jpg) The electronics are reinstalled and up and running. This is not the final configuration, just a snapshot of when I got it running.

I had forgotten to print out [a holder for the Nitehawk 36 USB](https://www.printables.com/model/1218789-nitehawk-36-usb-adapter-mount-for-voron-din-clip) but I had to get the printer up and running to print one.

![](/images/jw_mods/final_electronics.jpg) The electronics with cables cleaned up a little.

Overall it was surprisingly easy to reinstall all the electronics. It was made easier by the move to umbilical and a single USB cable to the toolhead as it removed quite a bit of wiring:

![](/images/jw_mods/removed_wiring.jpg) Heap of things I removed from the printer when moving to umbilical and sensorless homing.

One issue I had with the mod is that the cutouts for the Z motors were a bit large, with gaps where stray filament or heat can escape through. I tried to cover them up by placing some foam tape around the motors:

![](/images/jw_mods/gaps_foam.jpg) The Z motor mounts have a gap between them and the electronics cover. I tried to fill them in with foam tape from below.

[Why the ](#Why-the-Jabberwocky)[Jabberwocky](https://github.com/kinematicdigit/Jabberwocky)?
----------

I’ve been wanting to replace the Stealthburner toolhead a long time:

1. The cooling for PLA is quite bad.
2. PLA has a tendency to clog (seems like a decently common problem with Rapido and Stealthburner).
3. Resolving a clog when it happens is a pain in the ass.
4. It lacks a filament sensor and a cutter (for multi-color).

But what to choose? There are quite a few interesting toolheads I considered:

1. [Dragon Burner](https://github.com/chirpy2605/voron/tree/main/V0/Dragon_Burner)

   I use the [Dragon Burner](https://github.com/chirpy2605/voron/tree/main/V0/Dragon_Burner) in [my VORON 0](/blog/2025/03/25/lets_build_a_voron_0) and using the same toolhead is boring.

2. [Archetype](https://docs.armchairheavyindustries.com/docs/archetype)

   A pretty fun toolhead and I was considering the [Mjölnir](https://docs.armchairheavyindustries.com/docs/archetype/components/ducts/mjolnir) version. It does require you to flip your XY joints to hang upside down and I couldn’t find a filament sensor or filament cutter for it, so I ended up skipping it.

3. [XOL](https://github.com/Armchair-Heavy-Industries/Xol-Toolhead/tree/main)

   XOL seems like a very well regarded and mature option with tons of support. It boasts much better cooling for PLA, which is one of the main reasons I want to migrate away from the Stealthburner.

4. [A4T-toolhead](https://github.com/Armchair-Heavy-Industries/A4T)

   A4T seems similar to XOL, while having even better cooling and a slightly simpler assembly. It would also make use of the Dragon hotend I’ve got lying here, gathering dust.

5. [Jabberwocky](https://github.com/kinematicdigit/Jabberwocky)

   An all-in-one toolhead solution with filament sensors and a filament cutter that seems to have some quality of life features I think I’d really enjoy:

   >
   >
   > Flip up Extruder. Probably an industry first, a tool-less easy to access toolhead design so that one can access the blade or the filament path for servicing and troubleshooting. This allows a user, in the event of hopefully a rare problem during a filament changing print the ability to access the filament path to clear it of issues and continue with a print job.
   >
   >
   >
   > [Jabberwocky Beta test](<https://github.com/TheKittieKatt/Information-Insights/tree/main/Beta Testing Results/Jabberwocky>), TheKittieKatt
   >
   >

The [A4T-toolhead](https://github.com/Armchair-Heavy-Industries/A4T) is interesting but the (supposedly) easier maintenance and multi-color consistency of the [Jabberwocky](https://github.com/kinematicdigit/Jabberwocky) really appealed to me.

Update

As I’m writing this I’ve already ordered parts for the A4T and I’ll try that out soon enough. I just can’t help myself.

[Building the ](#Building-the-Jabberwocky)[Jabberwocky](https://github.com/kinematicdigit/Jabberwocky)
----------

Because *both* of my printers were crapping out I had trouble getting some working parts for the build. The print quality is not great and I need to first get the [Jabberwocky](https://github.com/kinematicdigit/Jabberwocky) up and running and then use it to reprint the bad parts.

There’s also been quite a lot of revisions to the printed parts that might fix some of the issues I encountered. I’m not too pleased with the colorscheme either so I’ll change that too.

![](/images/jw_mods/extruder_under_with_filament.jpg) The bottom of the extruder with a piece of filament sticking through.

I struggled a bit to get the filament to load/unload consistently by hand. I rebuilt the toolhead but in the end I believe I just didn’t have enough grip on the filament to guide it past the gears down into bottom hole.

![](/images/jw_mods/fans_installed.jpg) The bottom part of the toolhead with fans installed. ![](/images/jw_mods/jw_back_no_conch.jpg) The back with [Nitehawk36](https://lab4450.com/product/ldo-nitehawk36-toolhead/) but without the hotend installed. ![](/images/jw_mods/jw_front.jpg) The front but without the cover for the upper LED. (I forgot to print it before the printers went uncooperative.)

### [Beacon wiring](#Beacon-wiring) ###

![](/images/jw_mods/beacon.jpg) [Beacon](https://lab4450.com/product/original-beacon-3d-surface-scanner/) is installed.

Most of the wiring came as-is except for the cable between the [Beacon](https://lab4450.com/product/original-beacon-3d-surface-scanner/) and the [Nitehawk36](https://lab4450.com/product/ldo-nitehawk36-toolhead/). I got the [Nitehawk36](https://lab4450.com/product/ldo-nitehawk36-toolhead/) side of the cable pre-made in the [Nitehawk36](https://lab4450.com/product/ldo-nitehawk36-toolhead/) kit but I had to pin the [Beacon](https://lab4450.com/product/original-beacon-3d-surface-scanner/) side myself.

The colors of the wires in cable were all over the place but there’s a description on the PCB of both the [Nitehawk36](https://lab4450.com/product/ldo-nitehawk36-toolhead/) and [Beacon](https://lab4450.com/product/original-beacon-3d-surface-scanner/) so I just had to take care to match them. I also referenced the [Nitehawk36 documentation](https://docs.ldomotors.com/en/Toolboard/nitehawk-36) and the [Beacon documentation](https://docs.beacon3d.com/usb_cables/).

![](/images/jw_mods/beacon_to_nh36_wire.jpg) The wire between the [Beacon](https://lab4450.com/product/original-beacon-3d-surface-scanner/) and [Nitehawk36](https://lab4450.com/product/ldo-nitehawk36-toolhead/).

### [Cutter installation woes](#Cutter-installation-woes) ###

I had real difficulties installing the blade into the blade holder. There was some filament in the hole (likely due to poor print tuning) and I managed to break the holder when I tried to install the blade:

![](/images/jw_mods/broken_cutter.jpg) I broke the blade holder when I tried to force in the blade. ![](/images/jw_mods/upper_with_broken_cutter.jpg) The lower part of the extruder where the blade will cut the filament.

As I didn’t have a working printer when it broke I had to make it work without the filament cutter initially. Luckily I didn’t break anything crucial…

[Software setup](#Software-setup)
----------

I had to make some software changes but luckily they were quite straightforward:

1. Use sensorless homing.

   I just followed the [VORON documentation](https://docs.vorondesign.com/tuning/sensorless.html).

2. Setup the [Nitehawk36](https://lab4450.com/product/ldo-nitehawk36-toolhead/) toolboard.

   LDO has [setup instructions](https://docs.ldomotors.com/en/Toolboard/nitehawk-36) and the Jabberwocky GitHub contains [klipper settings](https://github.com/kinematicdigit/Jabberwocky/blob/main/Sample_Configs/JW_NH36_config.cfg).

3. Setup [Beacon](https://lab4450.com/product/original-beacon-3d-surface-scanner/) for Z offset and mesh calibration.

   Their [quickstart documentation](https://docs.beacon3d.com/quickstart/) was fast and easy. I did not setup [Beacon Contact](https://docs.beacon3d.com/contact/); maybe I’ll get to it one day.

[What’s next?](#Whats-next)
----------

![](/images/jw_mods/its_alive.jpg) The printer is finally printing again!

After months of not having a working 3D printer I’ve gotten renewed energy to play around with the printer again. I’ve got some loose plans for some mods to make on this printer:

* Reprint the [Jabberwocky](https://github.com/kinematicdigit/Jabberwocky) and try to get the filament cutter up and running.
* Build and test the [A4T-toolhead](https://github.com/Armchair-Heavy-Industries/A4T).
* Install a nozzle scrubber.
* Build a [Box Turtle](https://github.com/ArmoredTurtle/BoxTurtle).

… Or maybe something else? Who knows!