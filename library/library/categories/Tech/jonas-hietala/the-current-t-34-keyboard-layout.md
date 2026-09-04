---
title = "The current T-34 keyboard layout"
description = "I’ve been documenting my own keyboard layout in a series for a while now. But as the layout is constantly changing it’s been difficult to piece together how the layout currently looks like, so this post tries to show how the layout looks right now in it’s entiret"
date = "2024-12-01T08:14:22Z"
url = "http://jonashietala.se/blog/2022/09/06/the_current_t-34_keyboard_layout/index.html"
author = "Jonas Hietala"
text = ""
lastupdated = "2025-10-22T08:58:11.352187891Z"
seen = true
---

I’ve been documenting my own keyboard layout [in a series](/series/t-34/) for a while now. But as the layout is constantly changing it’s been difficult to piece together how the layout currently looks like, so this post tries to show how the layout looks right now in it’s entirety.

If you want to read about the background and philosophy about the layout, please see the [original T-34 post](/blog/2021/06/03/the-t-34-keyboard-layout/), and to see it’s evolution please refer to the [T-34 series](/series/t-34/). The layout is implemented using [QMK](https://docs.qmk.fm/) and the [code is on GitHub](https://github.com/treeman/qmk_firmware/tree/master/keyboards/ferris/keymaps/treeman).

The layout is made for a small 34 key keyboard, I use the [Ferris](https://github.com/pierrechevalier83/ferris) with flat choc keycaps to easily press [combos](#Combos).

[Legend](#Legend)
----------

![](/images/t-34-layout/legend.svg) Legend

[Layers](#Layers)
----------

[Layers](https://docs.qmk.fm/#/feature_layers) are the meat and potatoes of any layout for a smaller keyboard, and mine is no different.

### [Base](#Base) ###

![](/images/t-34-layout/_BASE.svg) Base layer.

The [repeat key](#Repeat-key) is used to output the last pressed key. I shift keys using [auto shift](https://docs.qmk.fm/#/feature_auto_shift) (see [long press](#Long-press)) and [CAPSWORD](#CAPSWORD). The letters `Z` and `Q`, together with a bunch of other keys, are on [combos](#Combos).

### [Swedish overlay](#Swedish-overlay) ###

![](/images/t-34-layout/_SWE.svg) Swedish overlay.

When I want to write Swedish I activate this layer that replaces `()_` with `åäö`, or I use [combos](#Combos) from any layer.

### [Navigation layer](#Navigation-layer) ###

![](/images/t-34-layout/_NAV.svg) Navigation layer.

`Gui-W`, `Gui-E` and `Gui-R` are used to switch between monitors and `Gui-J`/`Gui-K` to switch windows in [xmonad](https://xmonad.org/). `Ctrl` + arrow is used to switch windows in Vim. Tabbing is for switching tabs in Firefox.

### [Workspace layer](#Workspace-layer) ###

![](/images/t-34-layout/_WNAV.svg) Workspace layer. All keys have an implicit `Gui` modifier.

This is used for all window and workspace management in [xmonad](https://xmonad.org/). Some common operations are also on the [navigation layer](#Navigation-layer).

### [Windows layer](#Windows-layer) ###

![](/images/t-34-layout/_WIN.svg) Windows layer. All keys have an implicit `Alt` modifier.

This is purely to enable window switching using `Alt-Tab` and `Ctrl-Alt-Tab`, without releasing `Alt`.

### [Numbers](#Numbers) ###

![](/images/t-34-layout/_NUM.svg) Numbers. The darkened keys turn off [NUMWORD](#NUMWORD).

While I can activate the number layer persistently (using [leader sequences](#Leader-sequences)) I typically use [combos](#Numbers-and-symbols) for single digitis (like `0`), or [NUMWORD](#NUMWORD) for larger numbers (like `1984`).

[NUMWORD](#NUMWORD) makes the number layer smart, so it will deactivate when certain keys are pressed (colored dark gray in the image). It’s used to type numbers in text or code and for relative movement in Vim, where `17J` would move 17 lines down and then turn off the number layer.

`@u` is there to easily activate macros in Vim. For example `7@u` in the number layer would run the `u` macro 7 times and then turn off [NUMWORD](#NUMWORD).

### [Function keys](#Function-keys) ###

![](/images/t-34-layout/_FUN.svg) Function keys.

### [Symbols](#Symbols) ###

![](/images/t-34-layout/_SYM.svg) Symbols.

Similar to the numbers layer, there are [combos](#Combos) that are used to output standalone symbols. The [combos](#Combos) follow the layout of the symbols layer, and combos with same-side thumb. So `Space` + left-hand key or `E` + right-hand key outputs a symbol, regardless of what layers are activated.

Some common symbol sequences, like `->`, exists as [combos](#Combos) and others, like ` != `, as [long press](#Long-press).

### [One-handed Shortcuts](#One-handed-Shortcuts) ###

![](/images/t-34-layout/_SHRT.svg) Shortcuts.

To give access to common QWERTY shortcuts using the left hand, for programs where I have my right hand on the mouse/trackball. ([Long press](#Long-press) still shifts them.)

### [Special symbols](#Special-symbols) ###

![](/images/t-34-layout/_SPEC.svg) Specials (with ←↓↑→ symbols, not arrow keys).

Some of these are [dead keys](https://en.wikipedia.org/wiki/Dead_key), to add diacritic to any letter. To get `é` I do `´` then `e`, and the operating system will merge them together.

### [Modifiers](#Modifiers) ###

![](/images/t-34-layout/_MODS.svg) Modifiers.

I typically use [long press](#Long-press) for shift and [combos](#Combos) for other modifiers, this layer is a fallback for when those aren’t enough.

[Combos](#Combos)
----------

[Combos](https://docs.qmk.fm/#/feature_combo) is another fantastic tool that I (ab)use a lot. Simply put it allows you to press multiple keys at once and acts as an additional key—very useful for smaller layouts.

Note that combos are layer independent, and work the same regardless of what layers are activated. The base layer is shown in the graphics for reference.

### [Neighbour combos](#Neighbour-combos) ###

These combos are made by keys next to each other, either horizontally (pressed with two fingers) or vertically (pressed with one finger in the middle of two keys).

![](/images/t-34-layout/neighbour_combos.svg) 2-key neighboring combos.

* Some combos have a separate hold behaviour; for instance holding `Escape` activates the [symbols layer](#Symbols), allowing me to output `[]` easily.
* `vsplit` splits a window vertically in Vim and `hsplit` splits it horizontally, and `Close Window` closes a window in Vim (`<C-w>q`).
* `Clear` resets all states; sets the [base](#Base) layer, releases modifiers, stops [CAPSWORD](#CAPSWORD) and [NUMWORD](#NUMWORD), and clears other persistent states.

![](/images/t-34-layout/mid_triple_combos.svg) 3-key horizontal combos.

* `SWE` activates the [Swedish layer](#Swedish-overlay), and if prefixed with `()_` it will replace that with `åäö` and vice versa. So for example if I typed `hall(` I would press `SWE` to get `hallå`, with the Swedish layer activated.
* `Ctrl W` is used to close tabs in Firefox.

![](/images/t-34-layout/save_vim.svg) A 4-key horizontal combo.

* `Save Vim` is a 4-key combo that saves the buffer in Vim.

### [Split combos](#Split-combos) ###

These split combos uses the ring and index finger.

![](/images/t-34-layout/quotes.svg) Combos for the quotes `"` and `'`. ![](/images/t-34-layout/angled.svg) Combos don’t have to be on the same row, these angled combos are fairly comfortable. ![](/images/t-34-layout/split_lower.svg) One-shot `Alt` and the [Leader key](#Leader-sequences).

### [Combos over keyboard halfs](#Combos-over-keyboard-halfs) ###

![](/images/t-34-layout/smart_layers.svg)

* Tapping `T` + `A` once activates [CAPSWORD](#CAPSWORD), tapping again makes it persistent (`CAPS LOCK`), and a third tap to deactivate `CAPS LOCK`.
* Tapping `Space` + `E` activates [NUMWORD](#NUMWORD) and tapping them again activates the [number layer](#Numbers) persistently.

The [repeat key](#Repeat-key) works with the above, making them easier to double-tap.

### [Numbers and symbols](#Numbers-and-symbols) ###

![](/images/t-34-layout/MT_SPC.svg) Combos using `Space` and another key. ![](/images/t-34-layout/SE_E.svg) Combos using `E` and another key.

Combos with a thumb key is used for digits or standalone symbols, with the logic of `same-side thumb` + `key` = `symbol` and `opposite-side thumb` + `key` = `digit`. The placements follow the [numbers](#Numbers), [symbols](#Symbols) and [Swedish](#Swedish-overlay) layers. Both thumbs activates [NUMWORD](#NUMWORD).

[Long press](#Long-press)
----------

Most keys have a different behaviour when tapped compared to a long press. Most commonly I use this to produce shifted keys (called [auto shift](https://docs.qmk.fm/#/feature_auto_shift)). So to get `A` I press and hold `a` until it turns up.

There are a bunch of special cases as well (mostly on top of [combos]):

|          Tap          |                     Long press                      |
|-----------------------|-----------------------------------------------------|
|`_` `<` `>` `/` `\` `#`|                  Double, e.g `__`                   |
|`"` `'` `=` ``` `0` `.`|                  Triple, e.g `"""`                  |
|      `|` `&` `=`      |            Double with spaces, e.g `||`             |
|          `!`          |                ` != ` (with spaces)                 |
|          `?`          |                       `{:?}`                        |
|          `#`          |                       `{:#?}`                       |
|          `%`          |                        `%{}`                        |
|      `(` `[` `{`      |            Close and move cursor between            |
|          `@`          |`@u` (paired with `qu` combo for Vim macro execution)|

[Leader sequences](#Leader-sequences)
----------

I use the combo `l` + `)` as the [leader key](https://docs.qmk.fm/#/feature_leader_key). This will wait for a sequence of key presses (in contrast to combos where keys must be pressed at the same time). This is used with mnemonics for rarely used outputs:

|  Leader sequence  |                   Action                   |
|-------------------|--------------------------------------------|
|  `l` + `)`, `c`   |             ****C****aps lock              |
|`l` + `)`, `t`, `n`|    ****T****oggle ****N****umber layer     |
|`l` + `)`, `t`, `s`|    ****T****oggle ****S****ymbols layer    |
|`l` + `)`, `t`, `c`|****T****oggle ****C****aps lock escape swap|

[CAPSWORD](#CAPSWORD)
----------

CAPSWORD is a “smart caps lock”. It works like a regular caps lock, except it automatically turns off after certain keys are typed (most commonly space).

It will not turn off on these keys: `a-z` `å` `ä` `ö` `_` `-` `Backspace` and `Repeat`.

[NUMWORD](#NUMWORD)
----------

NUMWORD is a “smart layer”. It’s similar to [CAPSWORD](#CAPSWORD), except it’s for the [numbers layer](#Numbers) instead of caps lock.

It will not turn off on these keys: `0-9` `%` `+` `*` `-` `_` `.` `,` `:` `=` `x` `Backspace` `Repeat` `Reverse Repeat` and `Enter`.

[Repeat key](#Repeat-key)
----------

The repeat key simply repeats the previous key. So to type `fall` I can type `f` `a` `l` `Repeat`, using four different fingers instead of pressing `l` twice. It can also repeat things like `Ctrl-c` or `Delete`.

There’s also a reverse repeat key that “reverses” the last pressed key. The idea is that if you pressed `PageUp` a bunch, but went too far, you could press `Reverse Repeat` to output `PageDown`.

See [T-34/0](/blog/2021/09/05/t-34-0/) for the introduction of the [repeat key](/blog/2021/09/05/t-34-0/#the-repeat-key) and [reverse repeat key](/blog/2021/09/05/t-34-0/#reverse-repeat) for some more information about them.

[More info](#More-info)
----------

While I try to keep this post updated, [reading the code](https://github.com/treeman/qmk_firmware/tree/master/keyboards/ferris/keymaps/treeman) will always give you a more up to date reference. If you’re interested in **why** the layout looks like it does, I try to write the motivations in the [T-34 series](/series/t-34/).

---

* November 27, 2024

  Update the graphics to use embedded svgs generated from the source code.

* November 3, 2023

  Add `@u` to number layer for easier execution of Neovim macros (e.g. `17@u`)

* October 24, 2022

  1. Add the Windows layer to enable windows switching using `Alt-Tab` and `Ctrl-Alt-Tab`.
  2. Move `PgUp` to the home row pinky on the navigation layer.
  3. Use the `QWERTY` layout for the shortcut layer on the left side.

* August 28, 2022

  Another [large update](/blog/2022/08/28/the_t-342_keyboard_layout) that swaps `A` `O` and `I` `U`, reduces inner thumb key usage, makes layers accessible via home-row combos, reworks the symbols, and more.

* December 15, 2021

  [This update](/blog/2021/12/15/t-34-1) moves the repeat key, adds a shortcut layer, and moves modifiers to combos.

* September 5, 2021

  A major update [documented in this post](/blog/2021/09/05/t-34-0) that introduces the repeat key, moves around keys on the base layer, reworks the symbols layer, and more.