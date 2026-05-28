+++
title = "What even are Breeze, QtQuick, QtWidget, Union..?"
description = "I was asked a good question: What are these things? What are the differences? I will try to explain what they are in this post, in bit less technical manner.I will keep some of the parts bit short here, since I am not 100% knowledgeable about everything, and I rather people read "
date = "2026-03-01T17:19:01Z"
url = "https://akselmo.dev/posts/what-are-breeze-widgets-quick-union/"
author = "Akseli"
text = ""
lastupdated = "2026-05-27T23:22:56.989248734Z"
seen = true
+++

I was asked a good question: What are these things? What are the differences? I will try to explain what they are in this post, in bit less technical manner.

I will keep some of the parts bit short here, since I am not 100% knowledgeable about everything, and I rather people read documentation about it instead of relying my blogpost. :) But here's the basics of it.

![My lizard fursona making an smug face.](/assets/images/emotes/smug.png)

It's infodump time.

[QtWidgets](#qtwidgets)
----------

QtWidgets is the "older" way of writing Qt applications. It's mostly C++ and sometimes quite difficult to work with. It's not very flexible.

More information in here:

* [https://doc.qt.io/qt-6/qtwidgets-index.html](https://doc.qt.io/qt-6/qtwidgets-index.html)

### [QStyle](#qstyle) ###

QStyle is the class for making UI elements that follow the style given for the application. Instead of hardcoding all the styles, we use QStyle methods for writing things. This is what I was talking about in my [previous post](https://akselmo.dev/posts/breeze-and-union-preparing/).

More information in here:

* [https://doc.qt.io/qt-6/qstyle.html](https://doc.qt.io/qt-6/qstyle.html)

### [Breeze](#breeze) ###

Breeze is our current style/theme. It's what defines how things should look like. Sometimes when we say "Breeze" in QtWidgets context, it means the QStyle of it, since we do not have other name for it.

Repository: [https://invent.kde.org/plasma/breeze/](https://invent.kde.org/plasma/breeze/)

[QtQuick](#qtquick)
----------

QtQuick is the modern way of writing Qt applications. In QtQuick, we use QML which is a declarative language for writing the UI components and such. Then we usually have C++ code running the backend for the application, such as handling data.

More information in here:

* [https://doc.qt.io/qt-6/qtquick-index.html](https://doc.qt.io/qt-6/qtquick-index.html)
* [https://doc.qt.io/qt-6/qtqml-index.html](https://doc.qt.io/qt-6/qtqml-index.html)

### [qqc2-desktop-style](#qqc2-desktop-style) ###

qqc2-desktop-style is the Breeze style for QtQuick applications. It tells QtQuick applications what certain elements should look like.

Repository: [https://invent.kde.org/frameworks/qqc2-desktop-style/](https://invent.kde.org/frameworks/qqc2-desktop-style/)

### [Kirigami](#kirigami) ###

Kirigami is a set of shared components and items we can utilize in our QtQuick applications. Instead of rewriting similar items every time for new apps, we use Kirigami for many things. We call them Kirigami applications since we rely on it quite a lot.

### [Kirigami and qqc2-desktop-style](#kirigami-and-qqc2-desktop-style) ###

These two are a bit intermixed. For example, Kirigami provides convenient size units we have agreed on together, such as `Kirigami.Units.smallSpacing`.

We then use these units in the qqc2-desktop-style, but in other applications as well: Both for basic components that QtQuick provides us which are then styled by qqc2-desktop-style, but also for any custom components one may need to write for an application, if Kirigami does not provide such.

![My lizard fursona making an sad face.](/assets/images/emotes/sad.png)

I wish the two weren't so tightly coupled but there's probably a reason for that, that has been decided before my time. (Or it just happened as things tend to go.)

[Diagram of the current stack](#diagram-of-the-current-stack)
----------

This is how the current stack looks like.

[![Diagram of current situation](/assets/images/breeze/current-situation.svg)](/assets/images/breeze/current-situation.svg)

### [Problem: Keeping styles in sync](#problem-keeping-styles-in-sync) ###

As you can see from the diagram, the styles must be kept in sync by hand. We have to go over each change and somehow sync them.

![My lizard fursona making an scream face.](/assets/images/emotes/scream.png)

Not all things have to be kept in sync. This whole thing is rather.. Primitive. Some parts come from QStyle, some parts are handcrafted, some metrics and spacings can get out of sync when changed.. But for purposes of "regular person reading this" they need to be carefully modified by developers to make sure everything looks consistent.

Even bigger problem is that these two (QtWidgets and QtQuick) can behave very differently, causing a lot of inconsistent look and behavior!

But this is why Union was made.

[Union](#union)
----------

Union is our own "style engine" on top of these two. Instead of having to keep two completely different stacks in sync, we feed Union one single source of truth in form of CSS files, and it then chews the data out to both QtQuick and QtWidgets apps, making sure the both look as close to each other as possible!

[![Diagram of what it looks like with Union](/assets/images/breeze/union.svg)](/assets/images/breeze/union.svg)

I think it's entirely possible to create other outputs for it too, such as GTK style. Our ideal goal with Union is to have it feed style information even across toolkits eventually, but first we just aim for these two! :)

![My lizard fursona making an smile face.](/assets/images/emotes/smile.png)

And yes the CSS style files are completely customizable by users! But note that the CSS is not 1-to-1 something one would use to write for web platforms!

Repository: [https://invent.kde.org/plasma/union/](https://invent.kde.org/plasma/union/)

### [Note about Plasma styles](#note-about-plasma-styles) ###

Plasma styles are their own thing, which are made entirely out of SVG files.

I do not know if Union will have an output for that as well, or do we just use the qqc2-desktop-style directly in our Plasma stack (panels, widgets) so we can deprecate the SVG stack. Nothing has been decided in this front yet as far as I know.

---

Yeah that's a lot of stuff. Over +20 years of KDE we have accumulated so many different ways of doing things, so of course things will get out of sync.

Union will be a big step in resolving the inconsistencies and allowing users easily to customize their desktop with CSS files, instead of having to edit two or three different styles for different engines and then having to compile them all and load them over the defaults.

I hope this post helps open up this a bit. Please see the previous post as well, if you're interested in this work: [https://akselmo.dev/posts/breeze-and-union-preparing/](https://akselmo.dev/posts/breeze-and-union-preparing/)

[](https://brid.gy/publish/mastodon)