+++
title = "The freebsd-update(8) Screensaver"
description = "Today – which is 2026/06/19 – is another anniversary of FreeBSD Day. Because of that kinda special ‘holiday’ I also prepared something special … FreeBSD project slowly but successfully is moving forward into the future with PKGBASE way of things … and freebsd-update(8) days are l"
date = "2026-06-19T10:06:04Z"
url = "https://vermaden.wordpress.com/2026/06/19/freebsd-update-screensaver/"
author = "vermaden"
text = ""
lastupdated = "2026-07-07T12:18:11.872009480Z"
seen = true
+++

Today – which is **2026/06/19** – is another anniversary of [*FreeBSD Day*](https://freebsd.org/news/1993/freebsd-coined/).

![](https://vermaden.wordpress.com/wp-content/uploads/2026/06/freebsd-archive-1993-06-19-start.png)

Because of that kinda special ‘holiday’ I also prepared something special … FreeBSD project slowly but successfully is moving forward into the future with PKGBASE way of things … and **freebsd-update(8)** days are limited as it this tool will be deprecated and gone when FreeBSD 16.0-RELEASE will see the light of day.

I was never a big fan of **freebsd-update(8)** tool – not that it was very bad at what it was designed to do … it was just always interactive and time consuming. Fetching binary delta patches took hours between major releases and FreeBSD developers also cried while preparing these patches between every possibility.

So … as a kinda *Easter Egg* I prepared something special for 33rd FreeBSD Anniversary (*Max Verstappen* number for many years BTW) … a terminal screensaver that mimics the **freebsd-update(8)** tool ![🙂](https://s0.wp.com/wp-content/mu-plugins/wpcom-smileys/twemoji/2/72x72/1f642.png)

This image below is a real life example on how **freebsd-update(8)** upgrade looks like.

![](https://vermaden.wordpress.com/wp-content/uploads/2026/06/freebsd-update-example-small-real.png)

… and this is what I was able to recreate ![🙂](https://s0.wp.com/wp-content/mu-plugins/wpcom-smileys/twemoji/2/72x72/1f642.png)

![](https://vermaden.wordpress.com/wp-content/uploads/2026/06/freebsd-update-screensaver.sh_.gif)

Right now the most recent FreeBSD release is 15.1-RELEASE … and from the earlier tree its 14.4-RELEASE. The FreeBSD project rule about upgrading is to first upgrade from 14.4-RELEASE to 15.0-RELEASE and then from 15.0-RELEASE to 15.1-RELEASE – that is why I picked up my screensaver settings in the same manner.

```
% grep -A 3 SETTINGS freebsd-update-screensaver.sh
# SETTINGS
  VEROLD="14.4-RELEASE"
  VERNEW="15.0-RELEASE"

```

Its available for download on my **[scripts](https://github.com/vermaden/scripts)** page – [**freebsd-update-screensaver.sh**](https://raw.githubusercontent.com/vermaden/scripts/refs/heads/master/freebsd-update-screensaver.sh) – here.

While we are at the upgrading topic – I am really glad that FreeBSD project provided a dedicated upgrade related page to cover all possible ways of **freebsd-update(8)** tool and also newer PKGBASE way with **pkg(8)** tool.

Its available here – [https://freebsd.org/releases/15.1R/upgrading/](https://freebsd.org/releases/15.1R/upgrading/) – for the record.

This is how this page looks like.

![](https://vermaden.wordpress.com/wp-content/uploads/2026/06/freebsd-upgrade-page.png)

I use FreeBSD as my main ‘daily’ system since 2005 – that is 21 years now in 2026. Some people would say that I am crazy or hopeless … some people even shared their concerns like *‘Man … why are You doing this to Yourself?’* – and my take on that is … even with all things that were sometimes harder then on Linux (or Windows/Mac OS X/Android/AMIGA/…) systems – I believe that FreeBSD was/is still least PITA OS to work on with.

It was predictable – using FreeBSD as your daily driver embraces POLA principle – for most of the times – even with major upgrades – you just have backward compatibility and everything works – its very RARE to have something broken when the development process continues its march … and even if … You still have almighty *ZFS Boot Environments* to cover Your ass anytime anything gets less then optimal.

**Happy FreeBSD Day!**

EOF