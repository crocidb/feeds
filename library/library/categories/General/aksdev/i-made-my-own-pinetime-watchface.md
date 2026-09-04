+++
title = "I made my own PineTime watchface"
description = "I have really enjoyed using my PineTime as a watch, so I really wanted to make my own watchface. I based it around the colors of my KDE Plasma theme.Here's what it looks like:[![Custom watchface](/assets/images/pinetime/watchface_small.j"
date = "2022-09-04T00:00:00Z"
url = "https://akselmo.dev/posts/i-made-my-own-pinetime-watchface/"
author = "Akseli"
text = ""
lastupdated = "2026-05-27T23:22:57.107261679Z"
seen = true
+++

I have really enjoyed using my PineTime as a watch, so I really wanted to make my own watchface. I based it around the colors of my [KDE Plasma theme](https://codeberg.org/akselmo/aks_themes).

Here's what it looks like:

[![Custom watchface](/assets/images/pinetime/watchface_small.jpg)](/assets/images/pinetime/watchface_small.jpg)

[Link to Codeberg repository](https://codeberg.org/akselmo/Aksdark-Watchface)

And next I'm gonna ramble how I did it, what I learned etc. I wanted to share this due to being asked how it was like.

[Preface](#preface)
==========

PineTime uses something called [InfiniTime](https://github.com/InfiniTimeOrg/InfiniTime) as it's OS. By default it has four different watchfaces: analog, digital, PineTimeStyle and terminal.

It also has plenty of different kind of applications like heartbeat sensor, music controls etc. If you want to learn more about it, I posted about it in here: [Thoughts on my PineTime](https://www.akselmo.dev/2021/12/18/Thoughts-on-my-PineTime.html)

So what I exactly did here was creating my own watchface.

[InfiniSim](#infinisim)
==========

[InfiniSim](https://github.com/InfiniTimeOrg/InfiniSim) is a great InfiniTime simulator that lets me modify the InfiniTime software quite fast, without having me to upload the software every time to my watch.

I basically opened the InfiniSim project in my CLion and then instead of building just the simulator, it also built the InfiniTime source as well. I could pretty easily modify the sourcecode of InfiniTime and just run the simulator with one click.

I think this tool is pretty much essential if you want to modify InfiniTime. It makes things so much easier.

[Adding fonts](#adding-fonts)
==========

First things first: I wanted a new font. I've recently fallen in love with the [IBM Plex Font](https://www.ibm.com/plex/) and I wanted my watch look good with it. Luckily, adding fonts wasn't too bad of an ordeal, but it did require some ThinkingTM.

At first I had to add the new fonts to a [fonts.json](https://github.com/InfiniTimeOrg/InfiniTime/compare/develop...Akselmo:InfiniTime:personal-watchface#diff-9cd4f7eefb64934be3c2e2b3db5ce9a1f5ebd672d16007ac3861ea07d73c4269) file.

What was scary at first was that I would need to find the position of the glyphs in hex form... However, luckily, the Jetbrains fonts used by default had the exact same glyph positions so I could just use their hex values for the `range`.

After declaring the fonts in the JSON file, I went to the [CMakeLists.txt](https://github.com/InfiniTimeOrg/InfiniTime/compare/develop...Akselmo:InfiniTime:personal-watchface#diff-d75c2fe90af8f3b003221f82adcb06ffe840f29f2f7bbb2572c095f121bd8d60) file and declared all the new fonts in there.

And last, I added the fonts to the [lv\_conf.h](https://github.com/InfiniTimeOrg/InfiniTime/compare/develop...Akselmo:InfiniTime:personal-watchface#diff-78ca59463856360e2aedcc8a31a39a4c49002f967bdea90bd3b515bce65e1e97) file.

Now I could use my own fonts across the project.

[Watchface modification](#watchface-modification)
==========

For the watchface, I took the terminal watchface and began to modify the file. I quickly learned how to move things around, the source code was really easy to read.

[Link to the terminal watchface source code](https://github.com/InfiniTimeOrg/InfiniTime/blob/develop/src/displayapp/screens/WatchFaceTerminal.cpp)

However what I didn't like, was the amount of repetition in the original code. I decided to make my own functions for setting up the labels how I wanted them. I do not know if there was an actual reason for the repetition, like does adding custom functions to the file add more memory usage?

Anyhow, whatever the case may be, I wanted to test my skillz and make my own functions for it. So instead of copy pasting functions, I just did the following:

```

//In the initializer
const int step_x = 40;
const int step_y = 100;
stepValue = lv_label_create(lv_scr_act(), nullptr);
SetupLabel(stepValue, step_x, step_y, &plex_mono_20);
stepIcon = lv_label_create(lv_scr_act(), nullptr);
SetupIcon(stepIcon, step_x - 27, step_y, 0xffbf40, Symbols::shoe);

...

void WatchFaceAksdark::SetupLabel(lv_obj_t* label, int x_ofs, int y_ofs, _lv_font_struct* font)
{
    lv_label_set_recolor(label, true);
    lv_obj_align(label, lv_scr_act(), LV_ALIGN_IN_LEFT_MID, x_ofs, y_ofs);
    lv_obj_set_style_local_text_font(label, LV_LABEL_PART_MAIN, LV_STATE_DEFAULT, font);
}

void WatchFaceAksdark::SetupIcon(lv_obj_t* label, int x_ofs, int y_ofs, uint32_t hexColor, const char* icon)
{
    lv_obj_align(label, nullptr, LV_ALIGN_IN_LEFT_MID, x_ofs, y_ofs);
    lv_obj_set_style_local_text_color(label, LV_LABEL_PART_MAIN, LV_STATE_DEFAULT, lv_color_hex(hexColor));
    lv_label_set_text_static(label, icon);
}

```

For some labels I wanted an icon next to them (the example above has the show icon next to amount of footsteps).

This let me move the labels and icons around pretty nicely, without having to modify too many commands.

I then also added my own watchface, `WatchFaceAksdark` to same place as the other watchfaces were. I would've also kept all the four watchfaces and added mine as the fifth, but I would've had to modify the watchface settings screen so that it's scrollable. Too lazy so I just replaced the terminal watchface with mine.

For the battery icon, I took the implementation from the PineTimeStyle watchface and just added the label next to it, showing the battery value in percentages.

After everything was declared, I began to modify the `Refresh()` method and some places had old texts, like bluetooth was in text instead of icons, I removed them and changed my icon implementations in place.

Honestly, there's not *that* much to write about. After getting the build environment set up and fonts added, it was quite simple. My plan wasn't to make a watchface from scratch anyhow, just to modify an existing one and this seemed to work nicely.

[Building it for my device](#building-it-for-my-device)
----------

Now building for the InfiniSim is a click of a button, but building a zip file that can be sent to the Pinetime itself..

That was a bit of a headscratcher.

[The official documentation](https://github.com/InfiniTimeOrg/InfiniTime/blob/develop/doc/buildAndProgram.md#build-the-project) says:

>
>
> If you just want to build the project and run it on the Pinetime, using pinetime-app is recommended.
>
>

This was not enough for [Gadgetbridge](https://codeberg.org/Freeyourgadget/Gadgetbridge) to update my device. Or maybe it was, and I did something wrong.

Anyhow, I found a different command that is used to build the `dfu` files, so here's the shell script I used to build it as a zip file. Gadgetbridge can then use this to update the device.

```
#!/usr/bin/env bash
cmake -DARM_NONE_EABI_TOOLCHAIN_PATH=./nrf52/gcc-arm/ -DNRF5_SDK_PATH=./nrf52/sdk/ -DBUILD_DFU=1 ../
make -j pinetime-mcuboot-app

```

The `-DBUILD_DFU=1` was the key flag here, then I had to build it as `pinetime-mcuboot-app`. This zips the file for you and then you can just put it in your phone and use Gadgetbridge to upload it.

[What I learned](#what-i-learned)
----------

I learned that making stuff for embedded devices is fun! I just scratched the surface but honestly I feel like making software for embedded devices would be my kind of thing, and would love to have a job making something for embedded devices. *pls hire me i learn fast*

The libraries used in InfiniTime, like [lvgl](https://lvgl.io/) is really simple to understand and use. I kinda feel like making my own applet for InfiniTime next, just need to come up with something fun. Maybe a tiny game, although I have Arduboy waiting for that as well..

If you have Pinetime, I recommend trying to modify a watchface, like changing colors or something. It's a cool device and because it's open source, being able to modify it for your liking is great.

I also [added a true pink color](https://github.com/InfiniTimeOrg/InfiniTime/pull/1300) to the device because my fiancee wanted it so much. :)

So yeah, go forth and tinker!