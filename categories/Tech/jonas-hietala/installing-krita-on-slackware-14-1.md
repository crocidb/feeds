---
title = "Installing Krita on Slackware 14.1"
description = "This is a guide on how to build Krita on Slackware 14.1. This is based on this guide for linux.1. removepkg calligra2. Install some dependencies from [Slackbuilds](http://slackb"
date = "2024-07-17T19:35:07Z"
url = "http://jonashietala.se/blog/2015/08/03/installing_krita_on_slackware/index.html"
author = "Jonas Hietala"
text = ""
lastupdated = "2025-10-22T08:58:11.567936273Z"
seen = true
---

This is a guide on how to build [Krita](https://krita.org/) on Slackware 14.1. This is based on [this guide for linux](http://www.davidrevoy.com/article193/guide-building-krita-on-linux-for-cats).

1. `removepkg calligra`

2. Install some dependencies from [Slackbuilds](http://slackbuilds.org).

   ```
   gsl
   libgexiv2
   libpqxx
   pstoedit

   ```

3. Get Krita.

   The [original guide](http://www.davidrevoy.com/article193/guide-building-krita-on-linux-for-cats) recommends building in `~/kde4` but I moved i to `/opt/kde4`.

   ```
   mkdir -p /opt/kde4/build /opt/kde4/src /opt/kde4/inst
   cd /opt/kde4/src
   git clone git://anongit.kde.org/calligra.git

   ```

4. Configure and build.

   There’s a problem with tifflib. (My version is `Krita: 2.9.6 (gitb804a35)`, you may or may not run into this problem).

   Change `/opt/kde4/src/calligra/krita/plugins/formats/tiff/kis_tiff_converter.cc` from

   ```
   #if TIFFLIB_VERSION < 20111221
   typedef size_t tmsize_t;
   #endif

   ```

   to

   ```
   typedef size_t tmsize_t;

   ```

   Then we can build

   ```
   cd /opt/kde4/build
   cmake -DCMAKE_INSTALL_PREFIX=/opt/kde4/inst /opt/kde4/src/calligra \
       -DCMAKE_BUILD_TYPE=RelWithDebInfo -DPRODUCTSET=KRITA
   make -j5
   make install -j5

   ```

   Where `X` in `jX` is `1 + # processors`. The build process is quite slow.

5. Add `/opt/kde4/inst/bin` to PATH and `/opt/kde4/inst` to KDEDIRS.

6. Register krita to the system `kbuildsyscoca4`, but worked for me without it (I don’t use kde).

And launch with `krita`.