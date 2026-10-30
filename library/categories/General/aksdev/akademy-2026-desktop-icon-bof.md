+++
title = "Akademy 2026 Desktop Icon BoF"
description = "I am very late to write this but anyways. But please do the survey.KDE Plasma desktop icons (the actual system that holds the icons, not the .desktop files) is a bit crusty, due to many years of people fixing bugs there. This now causes ne"
date = "2026-10-23T14:46:00Z"
url = "https://akselmo.dev/posts/akademy-2026-desktop-icon-bof/"
author = "Akseli"
text = ""
lastupdated = "2026-10-27T22:33:07.821078944Z"
seen = true
+++

*I am very late to write this but anyways. But please do the* [*survey*](https://survey.kde.org/355778)*.*

KDE Plasma desktop icons (the actual system that holds the icons, not the `.desktop` files) is a bit crusty, due to many years of people fixing bugs there. This now causes new bugs in return.

So, at Akademy this year I had my own very first BoF around this topic. It was bit of a mess as I have never done a BoF before, but we had a good brainstorm session and I got good feedback.

One of the good feedback was that hey, let's ask our users! Thus I made a survey, where I ask questions such as:

* You have icons on another screen but it gets disconnected
* Your screen resolution changes

Link to the survey: [https://survey.kde.org/355778](https://survey.kde.org/355778)

We want to know what is *your* opinion on this, so we can get this done better for future. And when there is enough data, I will make some graphs. :D

We also discussed the history of the desktop icons. The original system was made in a bit of a rush and it was early times for QtQuick, so there was new things to learn too. This worked "well enough" for many years, until we began to get more features.. And that sneakily introduced bugs. This is typical thing to happen to software, so it's not surprising.

I have already done one refactor to them previously: [https://akselmo.dev/posts/plasma-desktop-icons-positioning-refactor/](https://akselmo.dev/posts/plasma-desktop-icons-positioning-refactor/). However I was way less experienced back then, so I tried my best to not break anything.. Thus the refactoring turned out to be bit less intensive as was needed: Instead of doing a deep cleaning in a room, I just dusted the shelves.

Second time is the charm, this time I'll go in with a proper plan. And for that I need your help!! So please.. Fill the survey! [https://survey.kde.org/355778](https://survey.kde.org/355778)

Hopefully this time we can finally get rid of the randomly moving icons and disappearances and whatnot. I also aim that there will be more code removal than code addition.

Thanks for reading! *And do the survey!! Even if you don't use KDE Plasma!*

[](https://brid.gy/publish/mastodon)