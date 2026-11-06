+++
title = "Reasons why your code changes are not showing up"
description = "A few months ago, I was working on a HTML document and my changes were not appearing. I couldn’t figure out why my browser was not showing the updated version of the file. It turns out that I was updating the wrong file. This afternoon I started to draft a list of reasons why cod"
date = "2026-10-29T00:00:00Z"
url = "https://jamesg.blog/2026/10/29/reasons-code-change-does-not-show-up"
author = "with words, wonder"
text = ""
lastupdated = "2026-11-02T23:27:02.346035246Z"
seen = false
+++

A few months ago, I was working on a HTML document and my changes were not appearing. I couldn’t figure out why my browser was not showing the updated version of the file. It turns out that I was updating the wrong file.

This afternoon I started to draft a list of reasons why code changes might not show up. This list is specifically tailored to web development. Here are the ones with which I came up:

* You are editing the wrong file.
  * For instance, you may be are editing an archived version of a file (i.e. one you put in a different folder).

* The code you have edited doesn’t run, because either:
  * The code is incorrect (i.e. invalid CSS), and/or;
  * The conditions that trigger the code aren’t running.

* Your code is showing a cached view.
* You haven’t edited all the files that need to be edited (is this a sign your code can be abstracted?)
* You are looking at a production environment in your browser.
* You are looking at the wrong page.

All of these scenarios have different causes and resolutions, but I figured I would at write down all the scenarios of which I could think just in case it might help another programmer. The first one – editing the wrong file – is one where encountering it once was enough to make me think I should write this post. While it was somewhat frustrating in the moment that I couldn’t see my code changes appearing, when I realised I was editing the wrong file – an old copy – I had to laugh.

On the topic of debugging, I highly recommend Julia Evans’ “[Pocket Guide to Debugging](https://wizardzines.com/zines/debugging-guide/)” zine, wherein Julia walks through how to approach debugging step by step. Julia’s zine is one of the crown jewels of my zine collection.

*Did I miss any reasons? Let me know by [sending me an email](https://jamesg.blog/email)!*

*Thanks to [Thomas](https://vanderwal.net) for our discussion that inspired me to write this post.*

[sending me an email](https://jamesg.blog/email) [Thomas](https://vanderwal.net) [Pocket Guide to Debugging](https://wizardzines.com/zines/debugging-guide/)