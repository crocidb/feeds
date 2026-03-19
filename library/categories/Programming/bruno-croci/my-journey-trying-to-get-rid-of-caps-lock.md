+++
title = "My journey trying to get rid of Caps Lock"
description = "The first time I ever used a typewriter, it was already a vintage device. It was my aunt’s old machine, and I suspect it was already pretty much gimmicky by her time too. For a kid who had no computer in the late 90s, it was really cool to sit down and bash my tiny fingers to get"
date = "2026-03-13T00:00:00Z"
url = "https://crocidb.com/post/my-journey-trying-to-get-rid-of-caps-lock/"
author = "Bruno Croci"
text = ""
lastupdated = "2026-03-18T21:57:50.245498337Z"
seen = true
+++

The first time I ever used a typewriter, it was already a vintage device. It was my aunt’s old machine, and I suspect it was already pretty much gimmicky by her time too. For a kid who had no computer in the late 90s, it was really cool to sit down and bash my tiny fingers to get some barely visible text on an A4 paper.

Sorry *mechanical keyboards*, none of your fancy colorful switches could even scratch the difficulty of typing on one of those machines. Holding shift while pressing any other key was really a struggle. That’s why the **shift lock** key was useful. I remember, being a very bored kid, investigating all those mechanisms and how that magical button would lock the shift key, which would itself move the carriage down, so the big caps on the typebar would hit the tape and the paper. You could feel the whole table move when you pressed shift again to release it quickly. Since the very next day we ditched the heavy machinery, the **caps lock** key was deprecated.

![my fiancé playing with her old typewriter just so I could take a photo for this post](images/Pastedimage20260313144708.png)

my fiancé playing with her old typewriter just so I could take a photo for this post

If I EVER need to type all caps like that, I always hold shift all the way and I imagine you do that too. For that reason, I’ve been either ignoring that key or remapping it to something else. For quite a long time I remapped it to **Ctrl**, but I honestly never used it very much. It wasn’t until a few years ago, when I started using Neovim as my main code editor, that remapping it to **Esc** was the greatest change I made to my keyboard ever. And it didn’t stick to only Neovim, I actually don’t even have muscle memory to reach the top-left original **Esc** key anymore, even in games.

The problem is that remapping keys is a surprisingly difficult problem if you consider different systems and different keyboards. I have three computers, and a Steam Deck, that I use on my day-to-day. Two laptops and one desktop. Every laptop has an external keyboard, but also the embedded one, that’s a total of 5 keyboards that I type on regularly. That’s not all, I do have two other laptops that I use sparingly. I also run different distros of Linux and Windows on these computers.

For the longest time, I think I’ve been remapping the keys with the system’s configuration tools. Powertoys on Windows and the GNOME settings. More recently, I think after Wayland adoption, it’s not available in the settings anymore, so last few times I had to set that up, I just copy-pasted something I found online. On Windows, Powertoys doesn’t work with fullscreen applications. On my wayland-gnome, I had problems even with windowed games.

I’ve had so much frustration with this issue that I decided to actually stop and research carefully what my options are. This post covers my attempts, findings, and how I settled with a firmware solution for some keyboards, and software solutions in Windows and Linux.

Custom keyboard firmware
----------

I can hear someone screaming QMK since the very title of this post. And yes, that’s part of my solution. QMK is a custom firmware and toolchain for flashing it that run in some of the most common mechanical keyboards out there.

I said I have three keyboards I use daily, they’re all mechanical with fancy modern firmwares, at least I thought. Two of those are **Durgod K320** and one is a **Keychron K2**. They all are technically supported by QMK. My Keychron not officially, but I was happy when I found this [repository](https://github.com/rajumakantham/QMK-on-K2V2) explaining how to flash QMK on it. But it turns out only version 2 and 3 support QMK, and I have the first one. So ruled out.

### Flashing QMK on the K320 ###

![the top one has blue switches and the bottom, brown](images/Pastedimage20260306125008.png)

the top one has blue switches and the bottom, brown

The K320, though, is officially supported, but in order to flash the QMK firmware, I need to open the keyboard, [short some contacts](https://github.com/qmk/qmk_firmware/blob/master/keyboards/durgod/k3x0/readme.md) to enable boot mode, then flash the image.

So I started by installing the necessary QMK tools:

```
# installing QMK
curl -fsSL https://install.qmk.fm | sh

# setting up environment
qmk setup

# compiling K320
qmk compile -kb durgod/k320 -km default

```

That generated `durgod_k320_base_default.bin` in the `qmk_firmware` folder. That was checked out in `$HOME` by the qmk installer.

#### Opening up the Keyboard ####

One thing that the [article explaining how to flash it](https://github.com/qmk/qmk_firmware/blob/master/keyboards/durgod/k3x0/readme.md) is very clear about is that, although there are **Durgod K320** keyboards with different microcontrollers, it will only work in the one with an **STM32**. Which means that I have to open the keyboard and check it and there’s a risk of no success.

Opening this keyboard is quite difficult. There are [several videos](https://www.youtube.com/results?search_query=opening+durgod+k320) explaining it, and I tried to follow them with my tools. First I started by removing the keys, and I was surprised with the amount of hair and fingernails that this collects. I took a photo, but I won’t show it and disgust you with this. :)

When I removed the board to check on the micro-controller, I realized that it was not a **STM32**, but an **APM32** instead:

![Geehy APM32 instead of the expected STM32](images/Pastedimage20260302233147.png)

Geehy APM32 instead of the expected STM32

This worried me at first. Such work for nothing. So I researched a bit and it seems like the **Geehy APM32 F072RBT6** is *almost* a plug-in replacement for the **STM32**. So I decided to try anyway. At least I was going to backup the original firmware and if something didn’t work, I’d just flash it back.

I shorted `boot0` to `vdd`, or `C27` and `R21`:

![If it’s not clear, that’s really really tiny and way more difficult to do that it seems](images/Pastedimage20260302233401.png)

If it’s not clear, that’s really really tiny and way more difficult to do that it seems

And connected the USB cable at the same time, so the keyboard enters boot mode, in DFU. One way to test it: the LEDs near the contacts should not light up, and the device should show up in DFU:

```
dfu-util -l

```

But it didn’t work. After many attempts, I thought that maybe I was shorting something else with my skin, so I made a lot of effort not to touch anything with my hands. Couple more tries and this showed up:

```
dfu-util 0.11

Copyright 2005-2009 Weston Schmidt, Harald Welte and OpenMoko Inc.
Copyright 2010-2021 Tormod Volden and Stefan Schmidt
This program is Free Software and has ABSOLUTELY NO WARRANTY
Please report bugs to http://sourceforge.net/p/dfu-util/tickets/

Found DFU: [314b:0106] ver=0010, devnum=18, cfg=1, intf=0, path="1-3", alt=1, name="@Option Bytes  /0x1FFFF800/01*016 e", serial="0448"
Found DFU: [314b:0106] ver=0010, devnum=18, cfg=1, intf=0, path="1-3", alt=0, name="@Internal Flash  /0x8000000/06*002Kg,058*002Kg", serial="0448"

```

That’s good news! So I backed up the stock firmware with:

```
dfu-util -a 0 -d 0483:DF11 -s 0x08000000 -U k320_original.bin

```

And then I flashed the compiled qmk firmware I built earlier:

```
qmk flash -kb durgod/k320 -km default

```

And it worked! I mean, the keyboard was on and it was working as expected.

#### Some more customization ####

Since I had it already opened, I decided to try something else. In many of the videos I saw, people were casting some silicone on the bottom shell to try and dampen the sound of the keyboard a bit. Since that keyboard of mine has the clicky blue switches, that I might not be that excited about anymore, I decided to try it with the tools I have: some paper towel:

![not as fancy as silicone or foam, but I like to improvise](images/Pastedimage20260302235106.png)

not as fancy as silicone or foam, but I like to improvise

I might be biased, but I *think* it did improve the sound a bit. Maybe just a bit.

#### Customizing QMK ####

Once QMK is installed, it’s easier to flash new firmwares. To enter boot mode, I just need to disconnect the USB, press **Esc + Space** and then connect it back again. I tried many times and it didn’t work. And I still don’t know why, but it doesn’t work very reliably, maybe like 1 every 4 or 5 times it actually enters boot mode. Not sure if there’s anything wrong with my specific keyboard. Should research later.

Then I went to the [QMK Configurator](https://config.qmk.fm/#/durgod/k320/base/LAYOUT_all) and switched the **Caps Lock** key for **Esc**. That generates a `json` file with the config, but we need to build another firmware with this config file. So the configurator itself can compile and you just download the `bin` file.

Once in bootmode:

```
dfu-util -a 0 -d 0483:df11 -s 0x08000000:leave -D durgod_k320_base_durgod_k320_base_layout_noesc.bin

```

And it works as expected! Hardware level **Caps Lock** extermination!

But I found the process a bit too complicated. Of course I’m not gonna be changing the scheme all the time, but it’s not that friendly to build a new firmware, get the keyboard into *bootmode* and flash it.

### VIA ###

Via is another solution with QMK that makes applying changes to the keyboard SO MUCH easier. You configure everything directly from a [webpage](https://www.usevia.app/) and it flashes instantly to the keyboard:

![I love the fact that I can just open their website and change anything about my keyboard](images/Pastedimage20260306124042.png)

I love the fact that I can just open their website and change anything about my keyboard

All I had to do was download the VIA firmware for my keyboard on their website and flash it. So much that I actually went much further and implemented a whole new layer of keys that I can reach while *holding* **Caps Lock**. So now I overloaded it to have two functions in one: it’s **Esc** when tapped, reach `layer1` when held.

### Flashed Keyboards ###

I did the process for both of my K320 and that solved part of my problem. Two of my keyboards now can be customized, but there’s still all the laptop keyboards and the ones that just don’t support QMK. And although I’m always interested in getting a new keyboard, two-hundred-euros is not something I’d like to spend if it’s not a really good plasticky point-n-shoot camera from the 90s, amiright?

Software Solution
----------

I always used the stock OS keyboard remap tool. On Linux it was whatever graphic environment’s settings offered. The main problem with this approach is that it only works in that specific environment. No TTY or login screen supported. That’s pretty lame, because I see myself using alternate TTY more than I should.

After some research, I found out about [keyd](https://github.com/rvaiya/keyd). It’s a daemon-based solution that is heavily inspired by QMK and supports most of the same features. I don’t really understand on which level the keyboard interception happens, but I’m interested in exploring that at some point later.

I appreciate the simplicity of `keyd`’s configurations. To setup the basic Caps Lock=Esc, all I needed to do in my most recent Arch setup, from installing to having it working, was:

```
sudo pacman -S keyd

```

Then setup the config in `/etc/keyd/default.conf`:

```
[ids]
*

[main]
capslock = escape

```

And enabling the service:

```
sudo systemctl enable --now keyd

```

Boom. It works beautifully. By far the easiest possible solution to the **Caps Lock** problem.

Since `keyd` also supports lots of other features similar to QMK/VIA such as layers, I replicated my whole VIA config in it and the whole config is:

```
[ids]
*

[main]
capslock = overload(layer1, escape)

[layer1]
h = left
j = down
k = up
l = right
b = macro(leftcontrol+left)
w = macro(leftcontrol+right)
u = macro(leftcontrol+z)

```

Explaining: I have my caps-lock key that acts as ESC when tapped, and change the layer when held. The other layer will have the `hjkl` vim-movement keys act as the arrows, allowing me to use them anywhere on my system, the same with `bw` for back and forward one word and `u` to undo stuff.

This is especially good because I can now enjoy even more typing on my Thinkpad laptops, internationally known to have the best laptop keyboards.

### Windows ###

I also need to replicate the software remapping to Windows. I’ve been using **PowerToys**, and I genuinely think it’s a good general collection of tools, but the keyboard remap is not really quite there. First it only supports mapping one key to another (no fancy layers, macros, etc), second it doesn’t really work all the time, like in fullscreen programs.

I found out that intercepting keys gets way more complicated on Windows. `keyd` itself suggests [kmonad](https://github.com/kmonad/kmonad) for more advanced customization, and it supports the Microsoft system. The configuration, though, is a bit more complex. Getting my Caps Lock/layer config in it looks like this:

```
(defcfg
  input  (low-level-hook)
  output (send-event-sink 200 10)
  fallthrough true
  allow-cmd false
)

(defsrc
  grv  1    2    3    4    5    6    7    8    9    0    -    =    bspc
  tab  q    w    e    r    t    y    u    i    o    p    [    ]    \
  caps a    s    d    f    g    h    j    k    l    ;    '    ret
  lsft z    x    c    v    b    n    m    ,    .    /    rsft
  lctl lmet lalt           spc            ralt rmet cmp  rctl
)

(defalias
  cap (tap-hold-next 200 esc (layer-toggle layer1))
)

(deflayer base
  grv  1    2    3    4    5    6    7    8    9    0    -    =    bspc
  tab  q    w    e    r    t    y    u    i    o    p    [    ]    \
  @cap a    s    d    f    g    h    j    k    l    ;    '    ret
  lsft z    x    c    v    b    n    m    ,    .    /    rsft
  lctl lmet lalt           spc            ralt rmet cmp  rctl
)

(deflayer layer1
  _    _    _    _    _    _    _    _    _    _    _    _    _    _
  _    _    C-rght _  _    _    _    C-z  _    _    _    _    _    _
  _    _    _    _    _    _    left down up   rght _    _    _
  _    _    _    _    _    C-left _  _    _    _    _    _
  _    _    _              _              _    _    _    _
)

```

Although I appreciate Lisp, I’ll go with the INI style config any day.

`kmonad` is a cli tool, not a first-class citizen on *winland*. The program accepts the config file as a parameter, so you need to run as:

```
kmonad.exe .\config.kbd

```

… and you have to keep the empty terminal window open during all the execution of the program!

You’d think that having a program like this run as a background service would be a no-brainer, but it turns out Windows isolates its services for security reasons. While it’s *technically* possible for a service to intercept keystrokes, it’s just as simple as a Linux deamon. So what’s the alternative?

#### Kanata ####

Someone online recommended using [kanata](https://github.com/jtroo/kanata), which started basically as a rewrite of `kmonad` in Rust, *by the way*. It has a better support for Windows, because it can be executed as a tray application.

![it’s supposed to reload the config automatically though](images/Pastedimage20260312170459.png)

it’s supposed to reload the config automatically though

The config is slightly different, though:

```
(defcfg
  process-unmapped-keys yes
)

(defalias
  cap (tap-hold 200 200 esc (layer-toggle layer1))
)

(defsrc
  grv  1    2    3    4    5    6    7    8    9    0    -    =    bspc
  tab  q    w    e    r    t    y    u    i    o    p    [    ]    \
  caps a    s    d    f    g    h    j    k    l    ;    '    ret
  lsft z    x    c    v    b    n    m    ,    .    /    rsft
  lctl lmet lalt           spc            ralt rmet cmp  rctl
)

(deflayer base
  grv  1    2    3    4    5    6    7    8    9    0    -    =    bspc
  tab  q    w    e    r    t    y    u    i    o    p    [    ]    \
  @cap a    s    d    f    g    h    j    k    l    ;    '    ret
  lsft z    x    c    v    b    n    m    ,    .    /    rsft
  lctl lmet lalt           spc            ralt rmet cmp  rctl
)

(deflayer layer1
  _    _    _    _    _    _    _    _    _    _    _    _    _    _
  _    _    C-rght _  _    _    _    C-z  _    _    _    _    _    _
  _    _    _    _    _    _    left down up   rght _    _    _
  _    _    _    _    _    C-left _  _    _    _    _    _
  _    _    _              _              _    _    _    _
)

```

Unfortunately, this solution is not as good as having a daemon running in the background, and it can only run in user-space. To make it start on logon, I created a shortcut in `shell:startup` with:

```
C:\Users\crocidb\Kanata\kanata_windows_gui_winIOv2_x64.exe -c C:\Users\crocidb\dotfiles\keyboards\kanata_windows.kbd

```

It does take longer to start on logon than I would like, but it works and is invisible. I set that up in my windows laptop and even the embedded keyboard now is remapped to my scheme.

Conclusion
----------

I can now have the same scheme on all my keyboards in all the computers I use. Even the Steam Deck and my less-used laptops are configured with these, so switching from one to another is completely seamless. I added all the keyboard configs to my [dotfiles](https://github.com/crocidb/dotfiles/tree/master/keyboards), so whenever I change one thing somewhere, all I need to do is `git pull` and get the latest version. It’s still a bummer I have three different config systems (VIA, keyd and kanata), but such is life.

This started as a quest to eliminate **Caps Lock** and eventually turned into a rabbit hole of customizing the whole keyboard experience. I got to learn many things about systems, drivers, firmwares and keyboards in general. So much that I want to keep researching this field. I already have so many notes and loose ends leading me to actually try to understand how `keyd` works and setup some tests on my own. But that’s for another post.

At the moment, I’m looking to replace my **Keychron** keyboard that doesn’t support qmk for a brand new one that already has it flashed. And I think I’m falling out of love with the clicky blue switches. Let me know if you have any recommendations.