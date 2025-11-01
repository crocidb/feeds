---
title = "Offset coordinates in Krita with Xinerama"
description = "I recently bought an Intuos Manga drawing tablet recently, because I got this fix idea that I want to learn how to draw. And what better way to do it than with a drawing tablet, while satisfying my need for new thing"
date = "2024-07-17T19:35:07Z"
url = "http://jonashietala.se/blog/2015/07/05/offset_coordinates_in_krita_with_xinerama/index.html"
author = "Jonas Hietala"
text = ""
lastupdated = "2025-10-22T08:58:11.578780973Z"
seen = true
---

I recently bought an [Intuos Manga](http://www.wacom.com/en-us/products/pen-tablets/intuos-manga) drawing tablet recently, because I got this fix idea that I want to learn how to draw. And what better way to do it than with a drawing tablet, while satisfying my need for new things?

![](/images/galleryimage2IntuousManga.jpg)

With little experience I boldly set forth and I found a lovely and free drawing program [Krita](https://krita.org/). I’ve used photoshop earlier but it’s just so expensive and [Krita](https://krita.org/) seems like a good replacement. [Inkscape](https://inkscape.org/en/) is another good alternative for vector graphics.

To install [Krita](https://krita.org/) you need KDE, which should come preinstalled with Slackware. If you’re like me and decided to skip it you can install it with

```
slackpkg install kde

```

I had some trouble installing [Krita](https://krita.org/), but ultimately [this guide with cats](http://www.davidrevoy.com/article193/guide-building-krita-on-linux-for-cats) worked when I also changed `krita/plugins/formats/tiff/kis_tiff_converter.cc` from

```
#if TIFFLIB_VERSION < 20111221
typedef size_t tmsize_t;
#endif

```

to

```
typedef size_t tmsize_t;

```

which I filed as a bug report over at KDE.

More troubling was the fact that drawing on the canvass was offset using dual screens with Xinerama. It worked fine in both Inkscape and Gimp and even on the gui controls. The problem went away if I switched to only a single screen. Now [this](https://bugzilla.gnome.org/show_bug.cgi?id=634977) [is](https://bugzilla.gnome.org/show_bug.cgi?id=66813) [a](https://forum.kde.org/viewtopic.php?f=139&t=120228) [common](https://bugs.kde.org/show_bug.cgi?id=298144) [problem](https://bbs.archlinux.org/viewtopic.php?id=142144) [with](https://bugs.launchpad.net/ubuntu/+source/wacom-tools/+bug/301075) Xinerama and Krita.

I did not manage to solve it using Xinerama, the bug is still unfixed. It works perfectly if instead of Xinerama RandR is used to setup the dual screen layout. I managed to set it up thanks to the [excellent arch linux wiki](https://wiki.archlinux.org/index.php/Xrandr).

The final result for me is to add this to `.xinitrc` and use a simple `xorg.conf`:

```
xrandr --output DVI-I-3 --mode 1920x1080 --pos 0x0 --rotate left --output DVI-I-2 --mode 1920x1080 --pos 1080x480

```

And Krita (and Inkspace, Gimp, …) works perfectly.

My full workspace setup is [on github](https://github.com/treeman/dotfiles/tree/master/.workspace).