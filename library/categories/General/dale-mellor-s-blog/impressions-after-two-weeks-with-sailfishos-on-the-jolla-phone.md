+++
title = "Impressions After Two Weeks With SailfishOS on the Jolla Phone"
description = " reviewjolla phonesailfishOSImpressions After Two Weeks With SailfishOS on the Jolla Phone https://khleedril.org/blog/2026-09-05--jolla-impressions.html khleedril.org/2026-09-05--jolla-impressionsDale Mellor [ https://khleedril.org/dale-mellor ](https://khleedril.org/da"
date = "1970-01-01T00:00:00Z"
url = "https://khleedril.org/blog/2026-09-05--jolla-impressions.html"
author = "Dale Mellor"
text = ""
lastupdated = "2026-11-12T12:47:49.923798687Z"
seen = true
+++

reviewjolla phonesailfishOS

Impressions After Two Weeks With SailfishOS on the Jolla Phone
==========

 https://khleedril.org/blog/2026-09-05--jolla-impressions.html

 khleedril.org/2026-09-05--jolla-impressions

Dale Mellor [ https://khleedril.org/dale-mellor ](https://khleedril.org/dale-mellor)

 5th September, 2026

Iʼve been happily daily-driving my new Jolla phone for two weeks now, and here are my current thoughts.

This article follows the [two day](https://khleedril.org/blog/2026-08-19--jolla-impressions.html) impressions, and is succeeded by the [two month](https://khleedril.org/blog/2026-10-22--jolla-impressions.html) impressions.

* #### As a phone ####

  * It is very boring. Seriously, all the *not-an-Android* and *“Itʼs Linux!”* is moot; it is just another smart phone (albeit one with heightened security being mostly open source and ethical)
  * The user experience is at least as good as any Android
    * - Action items hidden off the top of the screen (the equivalent of traditional application ‘hamburger’ menus) are still missed regularly

  * Calls and SMS texts totally work
  * Signal totally works
  * Comaps totally works
  * It is a brilliant wireless access point/router/firewall/VPN
  * - When the phone rings cold with a message app (Signal) voice notification, it takes a fingerprint scan, swipe, tap, and another tap to pick the call up. You get used to it after a while, though it is annoying.
  * - Bluetooth with Android apps is hit-and-miss; everything else about running Android apps is brilliant.

* #### As a portable computer ####

  * The operating system is very small. You canʼt run standard desktop apps like *Evolution* or even *Emacs*. I am going to have to look at what it takes to port these kinds of things. Full *GCC* and *Rust* toolchains are available, though.
  * There is a hack to making Bluetooth keyboards work:   

    ```
    devel-su chmod o=rw /dev/uhid
    ```

  * I want to change the home screen experience quite a bit, just to my own tastes
    * The *Events* page would be better as the default home screen rather than the *running apps* page.
    * I want some app icons permanently on-screen, either at the bottom like Android or up the side like Ubuntu Touch.
    * The *running apps* page needs to be laid out more cleverly, to use more of the screen and not waste so much space with useless dead screenshots of running Android apps.
    * Folders of app icons need to display the icons so that you can see at a glance what is in the folders.

  * The documentation for the operating system as a whole looks quite good. So my plan of attack is
    * Read the docs
    * Learn to hack the *Lipstick* app, which is what provides the home screens/pages (and is the Wayland compositor, apparently)
    * Learn QML. Iʼve spent a lifetime avoiding *Qt* since the days *Trolltech* tried to get away with rug-pulls and generally nasty things. But Iʼll have to bite that bullet here.