+++
title = "KIO Thumbnailer Support"
description = "The KIO Framework has gained support for de-facto standard, cross-desktop thumbnail generators. This means that we have a support for thumbnails from 3rd party applications! On Linux systems, many applications that produce some kind of ou"
date = "2024-08-08T00:00:00Z"
url = "https://akselmo.dev/posts/kio-thumbnailer-support/"
author = "Akseli"
text = ""
lastupdated = "2026-05-27T23:22:57.059254090Z"
seen = true
+++

The [KIO Framework](https://invent.kde.org/frameworks/kio/) has gained support for de-facto standard, cross-desktop thumbnail generators. This means that we have a support for thumbnails from 3rd party applications! On Linux systems, many applications that produce some kind of output, such as a 3D file or text document, ship a thumbnailer file that tells file managers how to create thumbnails of their files. One specific example I've used here in the images are STL files, for which we don't have our own KDE-specific thumbnailer plugin.

![Screenshot of various STL file thumbnails](/assets/images/thumbnailbinary/stlfiles.png)

![Screenshot of a Xenomorph STL files](/assets/images/thumbnailbinary/xeno.png)

These thumbnailer files are currently used by Nautilus and Thunar, so we felt like we were missing out and wanted to join the party! :)

[Thumbnailer files](#thumbnailer-files)
==========

Thumbnailer files are simple text files that tell the system what program we should run to generate a thumbnail. You can check what thumbnailers you have installed by running `ls /usr/share/thumbnailers`

For example, the STL thumbnailer file looks like this:

```
[Thumbnailer Entry]
TryExec=stl-thumb
Exec=xvfb-run --auto-servernum -w 0 stl-thumb -f png -s %s %i %o
MimeType=model/stl;model/x.stl-ascii;model/x.stl-binary;application/sla;

```

It tells the software running the thumbnailer what commands to use to generate the thumbnail, and what mimetypes it supports.

[KDE Thumbnailer Plugins](#kde-thumbnailer-plugins)
==========

On KDE side, we have used plugins for KIO, that reside in the `kio-extras` repository. They work just fine for our usecase in KDE apps, but nobody should need to write a KIO specific plugin for their application.

[The changes to KIO](#the-changes-to-kio)
==========

You can check the [merge request](https://invent.kde.org/frameworks/kio/-/merge_requests/1651) for more in-depth details, but here's a summary of how I made it work side-by-side with our plugin system:

We utilize the KIO plugins always first if possible, since we know for sure they work. This is to avoid any possible regressions and oddities, and to keep the change as unintrusive as possible. When we encounter a mimetype that is not supported by our plugins, like STL files, we utilize a thumbnailer file instead.

This also means that it's transparent to users. **Users do not have to worry which one they have installed.**

[Why make support for thumbnailer files then?](#why-make-support-for-thumbnailer-files-then)
==========

As mentioned earlier, no application should need to create a plugin for KIO just to make their thumbnails show up in our applications.

Thumbnailer files offer other benefits too, such as easing future transitions, (like from KF6 to KF7); working nicely with sandboxing, and being distributable in Flatpak bundles.

I am also working on moving our own plugins into thumbnailers, so we get the benefits from that too.

[How can I test it out?](#how-can-i-test-it-out)
==========

Currently it's only in the master branch of KIO, so if you really want to try it out, you will have to set up KDE Plasma development environment: [https://develop.kde.org/docs/getting-started/building/kdesrc-build-setup/](https://develop.kde.org/docs/getting-started/building/kdesrc-build-setup/)

When inside in the development environment, open Dolphin and enable the thumbnailers from preview settings.

Any help testing it would be very welcome! :) Let me know of any possible improvements and bugs!