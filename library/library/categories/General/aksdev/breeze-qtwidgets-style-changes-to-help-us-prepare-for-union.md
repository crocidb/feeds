+++
title = "Breeze QtWidgets style changes to help us prepare for Union"
description = "We have worked on some spring cleaning for Breeze, which helps us to prepare for Union and the changes it brings. This post is a bit more technical.Help us test things!Edit: I made another post that sh"
date = "2026-02-28T15:40:05Z"
url = "https://akselmo.dev/posts/breeze-and-union-preparing/"
author = "Akseli"
text = ""
lastupdated = "2026-05-27T23:22:56.991377104Z"
seen = true
+++

We have worked on some spring cleaning for Breeze, which helps us to prepare for [Union](https://quantumproductions.info/articles/2025-02/moving-kdes-styling-future) and the changes it brings. This post is a bit more technical.

Help us test things!

Edit: I made another post that should help explain some of the terminology and such: [https://akselmo.dev/posts/what-are-breeze-widgets-quick-union/](https://akselmo.dev/posts/what-are-breeze-widgets-quick-union/)

If you are running Plasma git master branch, you may have noticed that Breeze has gotten various (small) changes to it.

**Note that these changes are NOT in 6.6 branch**, just in master branch. Current target is **Plasma 6.7** but **that may change (6.8)** if we still have some issues with it! And to clarify, I do not know when Union releases to wider public yet. These changes will be most likely before Union.

This all is happening for two reasons:

1. Bring [Breeze](https://invent.kde.org/plasma/breeze/) on-par with the current [QtQuick styling](https://invent.kde.org/frameworks/qqc2-desktop-style), which is our *current vision* for Breeze
2. Find out any discrepancies and fix them, to make moving to [Union](https://invent.kde.org/plasma/union/) theming more seamless

In more technical terms, this means we have made `QStyle::PE_PanelItemViewItem` ([docs](https://doc.qt.io/qt-6/qstyle.html#PrimitiveElement-enum)) more round. This primitive is used in a lot of places.

For example, see the background of the places panel element here:

[![Places panel item background being more rounded](/assets/images/places-round.png)](/assets/images/places-round.png)

It looks much more like the items in our System Settings for example, since they're rounded too.

However this has not been easy: Due to how QStyle works, we have to add margins to the primitive itself, otherwise it will be touching the edges of the view, making it look bad.

These changes have made us notice bunch of visual oddities since we have +20 years of cruft across our stack, working on top of Breeze style without taking QStyle into account. People use completely custom solutions instead of relying on QStyle, though the QStyle API is not easy to work with so I do understand why it can be annoying.

[Why does using QStyle API matters in regards to Union?](#why-does-using-qstyle-api-matters-in-regards-to-union)
----------

This is all fine and good if we just decide to use Breeze always and forever. But we're not! With Union style engine, people are going to do all kinds of cool things. First of course we just are trying to make 1-to-1 Breeze "copy" with Union, since it's a good target to compare that everything works.

But when people are going to make their cool new themes with Union, our QtWidgets stack will not always follow that, due to all the custom things they're doing! So we need to minimize custom styling within QtWidgets apps and frameworks, and make sure they use QStyle APIs, so that Union can tell them properly what to do.

A more practical example:

1. KoolApp directly paints a rectangle with `QPainter` as a selection background.
   * It's a regular rectangle, 90 degree angles.

2. Union style engine is released to the public and everyone starts making their own themes
3. Someone makes a theme that makes all selection backgrounds a rounded rectangle
4. They then open KoolApp and notice nothing changes! Since KoolApp draws its on its own.
5. Everyone is unhappy. :(

However, when KoolApp is updated to use `drawPrimitive` like this:

```
// Remove the old background
//painter->setRenderHint(QPainter::Antialiasing);
//painter->setPen(Qt::NoPen);
//painter->setBrush(color);
//painter->drawRect(rect);

// Use style API instead
...
style()->drawPrimitive(QStyle::PE_PanelItemViewItem, &option, &painter, this);
...

// Then for text, add some spacing at start and end so it does not hug the edges of the primitive
const int margin = style()->pixelMetric(QStyle::PM_LayoutHorizontalSpacing);

// NOTE: you can use QStyle::SE_ItemViewItemText to get the subelement of the text
// NOTE: If you use HTML to draw rich text, you will have to do adjustments manually!
//       Because nothing can be ever easy. :(
...

```

Now the background uses what the QStyle gives it, which in turn is whatever Union has declared for it.

I understand there are cases where someone might want to draw their custom thing, but if at all possible, please use QStyle API instead! It will make theming much easier on the long run.

[Why change now? Why not wait for Union?](#why-change-now-why-not-wait-for-union)
----------

It's better to start catching this all now. It can be more tough to find the bugs with Union styling later on, because it changes much more than just one style: It changes the whole styling engine.

When we tinker with Breeze theme to find out these discrepancies, it's easier to spot if the problem is in Breeze theme itself or the application/framework drawing the items. With Union, we can also have a bug in Union too, so it adds one more layer to the bughunt.

So when Breeze looks fine with apps, we can be sure that any changes Union brings, it can be either a bug in Union or the style Union is using, instead of having to *also* hunt down the bug from application/framework.

Think of it as a gradual rollout of changes. :)

[A call for testing](#a-call-for-testing)
----------

The current Breeze style changes we have now in git master branch are already out there if you're using [KDE Linux](https://kde.org/linux/) for example.

What we need is YOU to test out our stack. Test out other peoples Qt apps too.

So please check this VDG issue and join there: [https://invent.kde.org/teams/vdg/issues/-/issues/118](https://invent.kde.org/teams/vdg/issues/-/issues/118)

Read the tasks section, look over what others have shared, share information, etc. **Report everything in that issue!**

Any help is appreciated, from spotting small errors to fixing them.

**I doubt our QtWidgets and QtQuick styles can be 1-to-1 without Union**, so do not worry too much about that. At the moment goal is just to make sure the **Breeze QStyle is properly utilized.** Perfect is the enemy of good and all that.

I hope this does not cause too much annoyance for our git master branch users, but if you're using master branch, we hope you're helping us test too. :)

Let's make the movement from separate QtWidgets/QtQuick style engines to one unified Union style engine as seamless as possible. And this will help other QtWidgets styles too, such as Fusion, Kvantum, Klassy, etc..!

Happy testing!

[](https://brid.gy/publish/mastodon)