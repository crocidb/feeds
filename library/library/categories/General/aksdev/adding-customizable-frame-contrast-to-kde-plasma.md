+++
title = "Adding Customizable Frame Contrast to KDE Plasma"
description = "For a while now, probably two years, I wanted to have support for high-contrast colorschemes in KDE Plasma.Technically, this was already doable, by just modifying your colorscheme to such colors. However one thing was lacking: Outlines were calculated automagically with hardcoded"
date = "2025-10-29T20:40:46Z"
url = "https://akselmo.dev/posts/frame-contrast-settings/"
author = "Akseli"
text = ""
lastupdated = "2026-05-27T23:22:57.004513507Z"
seen = true
+++

For a while now, probably two years, I wanted to have support for high-contrast colorschemes in KDE Plasma.

Technically, this was already doable, by just modifying your colorscheme to such colors. However one thing was lacking: Outlines were calculated automagically with hardcoded value.

Well, no more! Now you can set your own frame contrast value! And you may ask "Why not change the color completely?" which is a good question and I will answer that later.

This feature will be in Plasma 6.6. Hopefully. Or if you use [KDE Linux](https://kde.org/linux/) you can already try it out. :)

[The settings](#the-settings)
----------

This is how the settings will look like.

[![](https://akselmo.dev/processed_images/frame0.91b6a936bf6e7ad3.png) ](https://akselmo.dev/assets/images/kde/frame0.png) [![](https://akselmo.dev/processed_images/frame13.adb1802f10d09496.png) ](https://akselmo.dev/assets/images/kde/frame13.png) [![](https://akselmo.dev/processed_images/frame20.128c0c15fa1256e1.png) ](https://akselmo.dev/assets/images/kde/frame20.png) [![](https://akselmo.dev/processed_images/frame100.5f833399148e9064.png) ](https://akselmo.dev/assets/images/kde/frame100.png)

This setting used to be a slider.. And guess what, it did *nothing* in Breeze style. It was leftover from Oxygen times. Do not worry though if you use Oxygen style, the slider value is just percentage now and it will be converted to the value Oxygen uses.

[Desktop examples](#desktop-examples)
----------

Some examples how it might look like in desktop setting.

[![](https://akselmo.dev/processed_images/frame0_desktop.23c74a9c3631dea1.png) ](https://akselmo.dev/assets/images/kde/frame0_desktop.png) [![](https://akselmo.dev/processed_images/frame13_desktop.7152bac045be41ff.png) ](https://akselmo.dev/assets/images/kde/frame13_desktop.png) [![](https://akselmo.dev/processed_images/frame100_desktop.afdeb5e8597bdba9.png) ](https://akselmo.dev/assets/images/kde/frame100_desktop.png) [![](https://akselmo.dev/processed_images/frame100_light_desktop.0c4af81bd7e45d47.png) ](https://akselmo.dev/assets/images/kde/frame100_light_desktop.png)

All items are updated to follow this:

* QtQuick windows (qqc2-desktop-style)
* QtWidgets style and decorations (Breeze)
* Plasma SVG files (Anything using `class: ColorScheme-Frame` )

There's still some bugs with panels not always updating immediately, though we're working on fixing them.

[Why not change the whole color?](#why-not-change-the-whole-color)
----------

Currently across all of our apps and styles, we do the following:

* Take background color and foreground color
* Mix them with previously hardcoded frameContrast value, which was 0.2
* Use that as the color for all the frames

If we wanted this to be recolorable completely, we would have to go through **every single occurence** of this color mixing. Most apps luckily rely on the styling, but some may have custom things, for example custom QtQuick Controls that are doing this manually, using the `Kirigami.Theme.frameContrast` value.

I think we most likely would have gotten away with it for most apps, but then rest of them would look wrong, and some of them may not even be KDE apps but are using Kirigami.. So we would need to tell everyone to do this update, or risk things look broken.

This was the compromise solution: Allow users to change the `Kirigami.Theme.frameContrast` value to whatever they wish, even turn it off. :)

[A lot of work](#a-lot-of-work)
----------

This was a lot of work. In total, it was [8 merge requests](https://invent.kde.org/teams/vdg/issues/-/issues/108) that had to work together and be merged in correct order, etc..

And this is why modifying Breeze in our current stack is so difficult. You have to do many many changes across the platform.. And make sure that nothing breaks in the process!

### [My first draft: Use kdeglobals](#my-first-draft-use-kdeglobals) ###

First step for me was trying to make this a global configuration value only in `~/.config/kdeglobals`, which every platform would watch for modifications for this particular value.

It worked fine, but it was quite messy, and I had to make sure all the default values across the stack would be synced. That is annoying for anyone who wants to maybe modify the default value later. On top of that, I felt like different platforms constantly watching the config file for changes just was not a good idea..

### [Second draft: Use KColorScheme](#second-draft-use-kcolorscheme) ###

After chatting with people, we decided it would be best to just add this as a new value into our KColorScheme library. Instead of all the platforms looking for this configuration change, only the KColorScheme library did it.

This allowed me to simplify the implementation significantly.

### [Summary of changes](#summary-of-changes) ###

All in all, I had to do the following:

* Update KColorScheme to load this value from kdeglobals/current colorscheme | [Link](https://invent.kde.org/frameworks/kcolorscheme/-/merge_requests/56)
* Update the settings for plasma-workspace to allow users to change this value | [Link](https://invent.kde.org/plasma/plasma-workspace/-/merge_requests/5917)
* Update Breeze window decorations and QtWidgets style to use this value | [Link](https://invent.kde.org/plasma/breeze/-/merge_requests/558)
* Update Kirigami platformtheme to notify any platforms that use it about the changes | [Link](https://invent.kde.org/frameworks/kirigami/-/merge_requests/1940)
* Update the libplasma library to actually listen for changes to this contrast value and change accordingly | [Link](https://invent.kde.org/plasma/libplasma/-/merge_requests/1369)
* Update qqc2-desktop-style (QtQuick style) to listen for changes to this value and change accordingly | [Link](https://invent.kde.org/frameworks/qqc2-desktop-style/-/merge_requests/484)
* Update KSvg library so that the Plasma styles can now use `ColorScheme-Frame` class to load correct color | [Link](https://invent.kde.org/frameworks/ksvg/-/merge_requests/80)
* Update kde-gtk-config to make sure the Breeze GTK theme also updates correctly when value is changed | [Link](https://invent.kde.org/plasma/kde-gtk-config/-/merge_requests/136)

Yeah. It's a lot. This took me about a week to work on.

A week to make one number user modifiable.

Now imagine how long it would have taken if I had made the whole color modifiable!

And remember, there's tons of legacy code here which rely on each other, so I could not take shortcuts at places without possibly breaking everything.

[And that's why Union was born](#and-that-s-why-union-was-born)
----------

This is why [Union](https://quantumproductions.info/articles/2025-02/moving-kdes-styling-future) is such an important project when it comes to styling, and which is why we are most likely NOT going to modify Breeze much further, aside maintenance: A lot of work for even small changes.

Union lets us have a "single source of truth." We can change things only in **one place** and (hopefully) see the visuals update everywhere, be it QtQuick, QtWidgets or Plasma style or whatever we decide to support! Which means easier to work on styling and iterate on it, designers have easier time collaborating because changes do not take days.. Etc.

So I am putting more effort in Union from now on.

[Summary and future](#summary-and-future)
----------

I felt this was important change due to accessibility reasons, so I did it. And I am happy that I did, even if it was tons of work. (And there's more left with bugfixing lol.) This will also help alleviate issues where people feel like our apps are too "framey." You can now turn them off (well, you can make their color same as the background color) by setting the contrast to 0%. I must warn you that setting the value to **0% will probably look broken at some places**, so we will probably have to add a warning to the color editor that "hey this is not optimal but you can do it lol."

In short-term future, I want this to be tied to the desktop portal interface for high-contrast accessibility preference: When user has this enabled, be they on Plasma desktop or not, the applications will maximize this frame contrast value automatically.

And then, there's bug hunting and finding out any weird inconsistencies. If you spot any, please report them to [https://bugs.kde.org](https://bugs.kde.org)!

In long-term, this whole color thing will be rewritten to something much more robust, shinier, fancier and it will work with Union and everything is nice and beautiful. At least, that's what I hope.

I hope people will like this feature, especially those who need high-contrast colors.

Thanks for reading.