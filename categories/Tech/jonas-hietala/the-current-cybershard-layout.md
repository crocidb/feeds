---
title = "The current Cybershard layout"
description = "This is the keyboard layout I’m using for my custom keyboard that I generated, printed, and hand-wired. It’s a minimalistic keyboard of 35 keys and features an integrated trackball on the right-hand sid"
date = "2025-02-02T14:37:32Z"
url = "http://jonashietala.se/blog/2024/11/26/the_current_cybershard_layout/index.html"
author = "Jonas Hietala"
text = ""
lastupdated = "2025-10-22T08:58:11.142478134Z"
seen = true
---

This is the keyboard layout I’m using for my custom keyboard [that I generated, printed, and hand-wired](https://www.jonashietala.se/blog/2024/11/26/building_my_ultimate_keyboard/). It’s a minimalistic keyboard of 35 keys and features an integrated trackball on the right-hand side.

The keyboard layout started out as a direct copy of the [T-34 keyboard layout](/blog/2022/09/06/the_current_t-34_keyboard_layout), with some small modifications from the 34-key keyboard T-34 was designed for:

* An extra two keys on the left-hand side, in the ring and middle finger columns.
* Removed the second thumb key on the right-hand side.
* Accommodation for mouse keys and trackball handling.

While the layout has diverged since then, the design philosophy from [original T-34 post](/blog/2021/06/03/the-t-34-keyboard-layout/) still holds true and I recommend it as it may explain why the layout looks like it does.

The layout could pretty easily be converted to a 32-key layout by removing the two extra keys and the inner thumb key on the left-hand side. These keys are barely used and the biggest reason I have them is that I don’t have the energy to rebuild the keyboard.

[Legend](#Legend)
----------

![](/images/cybershard-layout/legend.svg)

I use quite a number of special features for the keys and I’ve tried to color code according to the above legend.

I made a bit of a detour and developed [my own tool](https://github.com/treeman/layout_gen) to generate the embedded svg images in this post as the existing tools didn’t *exactly* match my preferences.

Note that I made it only for myself and it will probably break in many ways if you try to use it for your layout. It’s also extremely ugly code…

[Layers](#Layers)
----------

[Layers](https://docs.qmk.fm/#/feature_layers) are super important for smaller keyboards and I use them a ton.

### [Base](#Base) ###

![](/images/cybershard-layout/_BASE.svg)

* The [repeat key](#Repeat-key) is used to output the last pressed key.
* I shift keys using [auto shift](https://docs.qmk.fm/#/feature_auto_shift) (see [long press](#Long-press)) and [CAPSWORD](#CAPSWORD).
* The letters `Z` and `Q`, together with a bunch of other keys, are on [combos](#Combos).
* The keys for `F2`, `F12` and `FUN` are just extras and aren’t in a comfortable enough position to warrant anything more common.

If you wonder why the top left and right keys are off that’s because the keyboard is built with them further away and with a different curvature than the other keys in the outer columns. I don’t press `J` or `.` with my pinky but with my ring finger, leaving only two keys dedicated to the pinkies.

### [Swedish overlay](#Swedish-overlay) ###

![](/images/cybershard-layout/_SWE.svg) Swedish overlay.

When I want to write Swedish I activate this layer that replaces `()_` with `åäö`, or I use [combos](#Combos) from any layer.

### [Symbols](#Symbols) ###

![](/images/cybershard-layout/_SYM.svg) Symbols layer.

I typically use [combos](#Combos) to output symbols (following the same layout pattern as the symbols layer). The symbols layer is mostly used to roll symbol pairs like `{}` or `#[`.

Some common symbol sequences (like `->`, ` != `, or `````) exists as [combos](#Combos) and others as [long press](#Long-press).

### [Numbers](#Numbers) ###

![](/images/cybershard-layout/_NUM.svg) Numbers layer. The browner keys (like `J`) turn off [NUMWORD](#NUMWORD).

While I can activate the number layer persistently (using [leader sequences](#Leader-sequences)) I typically use [combos](#Thumb-key-combos) for single digits (like `0`), or [NUMWORD](#NUMWORD) for larger numbers (like `1984`).

[NUMWORD](#NUMWORD) makes the number layer smart, so it will deactivate when certain keys are pressed. It’s used to type numbers in text or code and for relative movement in Neovim, where `17J` would move 17 lines down and then turn off the number layer. Jumping directly to a line in Neovim with `12G` is also made convenient.

If I want to enter the layer without it turning off I can either use [leader sequences](#Leader-sequences) to activate it persistently or hold the [NUMWORD](#NUMWORD) [combo](#Combos-over-keyboard-halfs) (hold both thumbs). The layer won’t release until both thumb keys are released, so `Space` can be tapped with the left thumb without leaving the number layer.

`@u` is there to easily activate macros in Neovim. For example `7@u` in the number layer would run the `u` macro 7 times and then turn off [NUMWORD](#NUMWORD).

### [Function keys](#Function-keys) ###

![](/images/cybershard-layout/_FUN.svg) Function keys.

* The function keys follow the same layout as the [numbers layer](#Numbers).
* The trackball `DPI` can be lowered and raised at runtime.

### [Navigation layers](#Navigation-layers) ###

![](/images/cybershard-layout/_NAV.svg) Navigation layer.

* Keys with `Gui` are used in [xmonad](https://xmonad.org/).

  * `Gui` + `W`, `Gui` + `E` and `Gui` + `R` are used to switch between monitor.
  * `Gui` + `J`/`Gui` + `K` to switch windows.
  * `Gui` + `,`/`Gui` + `.` to add/remove windows from the “master” area.

* This layer is commonly used in conjunction with the trackball, giving access to mouse keys.

  For instance, `Shift` + `Left Mouse` can be used to drag, `Ctrl` + `A` to select, and `Ctrl` + `C` to copy.

* Tabbing is for switching browser tabs and the `Back` / `Fwd` mouse buttons goes backwards and forwards in history.

* `Ctrl` + arrow is used to switch windows in Neovim.

* `Ctrl` + `D` and `Ctrl` + `U` are used in Neovim to scroll half a screen (compared to `PgUp`/`PgDn` that scrolls an entire screen).

* The [workspace layer](#Workspace-layer) is triggered by first holding `Space`, and then holding the right thumb key (`WNAV`).

![](/images/cybershard-layout/_ARROW.svg) Arrows on the left-hand side.

This layer exists for the rare occasions I want to navigate using only the left hand. The keys on the right side is there just because and are rarely, if ever, used.

### [Workspace layer](#Workspace-layer) ###

![](/images/cybershard-layout/_WNAV.svg) Workspace layer. All keys have an implicit `Gui` modifier.

This is used for all window and workspace management in [xmonad](https://xmonad.org/). Some common operations are also on the [navigation layer](#Navigation-layers). [Auto shift](#Long-press) works and can used to send a window to another workspace (`Gui` + `Shift` + `2`).

### [Windows layer](#Windows-layer) ###

![](/images/cybershard-layout/_WIN.svg) Windows layer. All keys have an implicit `Alt` modifier.

This is purely to enable window switching using `Alt-Tab` and `Ctrl-Alt-Tab`, without releasing `Alt`.

### [Mouse layer](#Mouse-layer) ###

![](/images/cybershard-layout/_MOUSE.svg) The mouse layer for right-hand only usage.

I generally prefer to use the [navigation layer](#Navigation-layers), where the mouse buttons are on the left side, but in some cases I’d like to only use my right hand.

### [Special characters](#Special-characters) ###

![](/images/cybershard-layout/_SPEC.svg) Specials layer.

The [dead keys](https://en.wikipedia.org/wiki/Dead_key) add diacritic to any letter. For example, to get `é` you can use the dead key `´` then `e`, and the operating system will merge them together. (`É` also exists as a [combo](#Combos).)

### [Modifiers](#Modifiers) ###

![](/images/cybershard-layout/_MODS.svg) Modifiers.

I typically use [long press](#Long-press) for shift and [combos](#Combos) for other modifiers, this layer is a fallback for when those aren’t enough (the layer is mostly used for `Right Alt`).

### [Gaming layer](#Gaming-layer) ###

![](/images/cybershard-layout/_GAME.svg) A simple gaming layer.

I’m not a heavy gamer by any means but this layer allows me to play Core Keeper with my kid. By necessity this layer disables [auto shift](https://docs.qmk.fm/#/feature_auto_shift).

[Combos](#Combos)
----------

[Combos](https://docs.qmk.fm/#/feature_combo) is another fantastic tool that I (ab)use a lot. Simply put it allows you to press multiple keys at once and acts as another key—very useful for smaller layouts.

These combos are layer independent, and work regardless of what layers are activated. The base layer is shown in the graphics for reference.

### [Neighbour combos](#Neighbour-combos) ###

These combos are made by keys next to each other, either horizontally (pressed with two fingers) or vertically (pressed with one finger in the middle of two keys).

![](/images/cybershard-layout/neighbour_combos.svg) 2-key neighboring combos.

* Some combos have a separate hold behaviour; for instance holding `Escape` activates the [symbols layer](#Symbols), allowing me to output `[]` easily.
* `vsplit` splits a window vertically in Neovim and `hsplit` splits it horizontally, and `Close Window` closes a window in Neovim (`<C-w>q`).
* `Clear` resets all states; sets the [base](#Base) layer, releases modifiers, stops [CAPSWORD](#CAPSWORD) and [NUMWORD](#NUMWORD), and clears other persistent states.
* `Ctrl` + `Shift` + `M` is the shortcut to mute/unmute in Teams.

![](/images/cybershard-layout/mid_triple_combos.svg) 3-key horizontal combos.

* `SWE` activates the [Swedish layer](#Swedish-overlay), and if prefixed with `()_` it will replace that with `åäö` and vice versa. So for example if I typed `hall(` I would press `SWE` to get `hallå`, with the Swedish layer activated.
* `Ctrl W` is used to close tabs in Firefox.

![](/images/cybershard-layout/save_vim.svg) A 4-key horizontal combo.

* `Save Neovim` is a 4-key combo that saves the buffer in Neovim.

### [Split combos](#Split-combos) ###

These split combos uses the ring and index finger.

![](/images/cybershard-layout/quotes.svg) Combos for the quotes `"` and `'`. ![](/images/cybershard-layout/angled.svg) Combos don’t have to be on the same row, these angled combos are fairly comfortable. ![](/images/cybershard-layout/split_top.svg) One-shot `Alt` on the left combo and holding the right combo activates the [windows](#Windows-layer) layer (with implicit `Alt`). ![](/images/cybershard-layout/split_lower.svg) [Leader key](https://docs.qmk.fm/#/feature_leader_key) on the bottom row.

### [Combos over keyboard halfs](#Combos-over-keyboard-halfs) ###

![](/images/cybershard-layout/smart_layers.svg)

* Tapping `T` + `A` once activates [CAPSWORD](#CAPSWORD), tapping again makes it persistent (`CAPS LOCK`), and a third tap to deactivate `CAPS LOCK`.
* Tapping `Space` + `E` activates [NUMWORD](#NUMWORD) and tapping them again activates the [number layer](#Numbers) persistently.

The [repeat key](#Repeat-key) works with the above, making them easier to double-tap.

![](/images/cybershard-layout/swap_unds_mins_c.svg)

* Swaps `_` and `-`.

![](/images/cybershard-layout/specials.svg)

* Access the [specials](#Special-characters) layer with the ring fingers.

### [Thumb key combos](#Thumb-key-combos) ###

I have a bunch of 2-key `thumb` + `key` combos:

![](/images/cybershard-layout/MT_SPC.svg) Combos using `Space` and another key. ![](/images/cybershard-layout/SE_E.svg) Combos using `E` and another key.

The logic here is that `same-side thumb` + `key` = `symbol` and `opposite-side thumb` + `key` = `digit`, following the placements of the [numbers](#Numbers), [symbols](#Symbols) and [swedish](#Swedish-overlay) layers. They’re used if I want to just type a single character, without having to activate a layer first.

![](/images/cybershard-layout/FUN.svg) Combos using `FUN` and another key.

I have similar combos for the [function keys](#Function-keys).

### [QMK boot](#QMK-boot) ###

![](/images/cybershard-layout/boot.svg)

The keycode `QMK_BOOT` enters boot mode for the microcontroller connected via USB, making it easy to update the keymap on the keyboard. These two 5-key combos (one for each half) are almost impossible to trigger accidentally while being easily accessible.

[Additional features](#Additional-features)
----------

While [layers](https://docs.qmk.fm/#/feature_layers) and [combos](#Combos) are the two main features I use, [QMK](https://docs.qmk.fm/) has a lot of other nifty features (and you roll your own implementation of them too).

### [Long press](#Long-press) ###

Most keys have a different behaviour when tapped compared to a long press. Most commonly I use this to produce shifted keys (called [auto shift](https://docs.qmk.fm/#/feature_auto_shift)). So tapping the `A` key will output `a` as normal and if it it `A` will appear instead.

There are a bunch of special cases as well (many on top of [combos](#Combos)):

|          Tap          |                       Long press                       |
|-----------------------|--------------------------------------------------------|
|`_` `<` `>` `/` `\` `#`|                    Double, e.g `__`                    |
|`"` `'` `=` ``` `0` `.`|                   Triple, e.g `"""`                    |
|      `|` `&` `=`      |             Double with spaces, e.g ` || `             |
|          `!`          |                  ` != ` (with spaces)                  |
|          `?`          |                         `{:?}`                         |
|          `#`          |                        `{:#?}`                         |
|          `%`          |                         `%{}`                          |
|      `(` `[` `{`      |             Close and move cursor between              |
|          `@`          |`@u` (paired with `qu` combo for Neovim macro execution)|

### [Leader sequences](#Leader-sequences) ###

I use the combo `l` + `)` as the [leader key](https://docs.qmk.fm/#/feature_leader_key). This will wait for a sequence of key presses (in contrast to combos where keys must be pressed at the same time). I use this with mnemonics for rarely used outputs:

|  Leader sequence  |                               Action                               |
|-------------------|--------------------------------------------------------------------|
|  `l` + `)`, `c`   |                         ****C****aps lock                          |
|  `l` + `)`, `s`   |**S**wedish input in Linux (mapped in [xmonad](https://xmonad.org/))|
|`l` + `)`, `t`, `n`|                ****T****oggle ****N****umber layer                 |
|`l` + `)`, `t`, `s`|                ****T****oggle ****S****ymbols layer                |
|`l` + `)`, `t`, `f`|               ****T****oggle ****F****unction layer                |
|`l` + `)`, `t`, `c`|            ****T****oggle ****C****aps lock escape swap            |
| `l` + `)`, `Esc`  |                   `Ctrl` `Shift` ****Esc****ape                    |

### [CAPSWORD](#CAPSWORD) ###

CAPSWORD is a “smart caps lock”. It works like a regular caps lock, except it automatically turns off after certain keys are typed (most commonly space).

It will not turn off on letters, numbers, `_` `-` `Backspace` and the `Repeat` keys.

### [NUMWORD](#NUMWORD) ###

NUMWORD is a “smart layer”. It’s similar to [CAPSWORD](#CAPSWORD), except it activates and then turns off the [numbers layer](#Numbers) instead of caps lock.

It will not turn off on these keys: `0-9` `%` `/` `+` `*` `-` `_` `.` `,` `:` `=` `x` `Backspace` `Enter` and the `Repeat` keys.

### [Repeat key](#Repeat-key) ###

The repeat key simply repeats the previous key. So to type `fall` I can type `f` `a` `l` `Repeat`, using four different fingers instead of pressing `l` twice. It can also repeat things like `Ctrl-c` or `Delete`, and unlike regular keys that use [auto shift](https://docs.qmk.fm/#/feature_auto_shift) the `Repeat` key can be held.

### [Trackball](#Trackball) ###

The trackball is normally configured to move the mouse as a regular trackball.

There are different modes that alters the behavior of the trackball:

1. Lower the DPI when `Space` or `_` are held (the mouse moves slower when the [navigation layer](#Navigation-layers) or the [mouse layer](#Mouse-layer) are active).
2. Raise the DPI when the [`MOD` combo](#Neighbour-combos) is held (the mouse moves faster).
3. Scroll instead of moving the mouse when the [`SYM` combo](#Neighbour-combos) is held.

[More info](#More-info)
----------

* Read the [T-34 series](/series/t-34/) for the design process and motivations of my other keyboard layout (it’s the same layout with minor refinements and additions).

* See the post [Building my ultimate keyboard](https://www.jonashietala.se/blog/2024/11/26/building_my_ultimate_keyboard/) for how I designed and built the keyboard I’m using this layout with.

* For implementation details and the most up-to-date reference check out the layout’s [QMK source code](https://github.com/treeman/qmk_firmware/tree/master/keyboards/cybershard).

  I use a bunch of custom re-implementations of existing QMK functionality and it’s probably not a good idea to copy them. They’re there for various reasons, such as [CAPSWORD](#CAPSWORD) not being integrated into QMK when I started using it and I can’t be bothered to migrate over.

  The code is super messy and in desperate need of refactoring…

---

* November 19, 2024

  Copied the [T-34](/series/t-34/) layout and adapted it for the new keyboard by adding a mouse layer, remove the shortcut layer, and changed the activation of the specials layer.

* November 22, 2024

  Moved `-` to an angled combo, moving the `WIN` key to the top row, and move `%` to the home-row and `!` to the bottom row.

* November 23, 2024

  Reworked the mouse layer and use a more advanced triggering mechanism to be more explicit about when the layer is turned on and off.

* November 25, 2024

  Added double-tap functionality to [NUMWORD](#NUMWORD) and [CAPSWORD](#CAPSWORD) [combos](#Combos-over-keyboard-halfs).

* November 26, 2024

  1. Moved `-` back to it’s original position and placed `%` on the angled combo.
  2. Experimental functionality to swap `-` and `_` for the languages that use `kebab-case`.
  3. Removed the mouse layer and placed mouse buttons on the [navigation layer](#Navigation-layers).

* December 3, 2024

  Reworked the [navigation layer](#Navigation-layers) to keep the original positions for `PgUp`, `PgDn`, and `Tab`s. To allow this I moved the mouse click to index finger and demoted the `up`/`down` to the top row.

* January 12, 2025

  1. Reworked the [navigation layer](#Navigation-layers) to be more focused on two hands on the board. The idea is to use better placed keys on the right-hand side instead of cramming in too much on the left. Moved `PgUp` and `Home` to the right side and it’s enough to use the arrow keys on the right. (The secondary navigation layer exists to enable arrow keys on the left side.)

  2. Added mouse button combos on the right-hand side so in a pinch I can operate the mouse with one hand.

* January 14, 2025

  1. Removed mouse button combos from the right-side and place them on a separate layer instead (to keep the shift combo in the regular place).

  2. Add `Gui` + `,`/`.` for [xmonad](https://xmonad.org/) master window management to the [navigation layer](#Navigation-layers), moving `Ctrl` + `A` to the home-row once again.

* January 20, 2025

  Added the [gaming layer](#Gaming-layer).