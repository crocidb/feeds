---
title = "ISOC update"
description = "I have now worked a bit more than 3 weeks out of my 4 weeks of IDA Summer of Code and this is an update post of what I’ve done so far. I will write a more extensive summary post at the end of the project. I was planning on writing a weekly summary, but t"
date = "2024-07-17T19:35:07Z"
url = "http://jonashietala.se/blog/2014/09/04/isoc_update/index.html"
author = "Jonas Hietala"
text = ""
lastupdated = "2025-10-22T08:58:11.607123106Z"
seen = true
---

I have now worked a bit more than 3 weeks out of my 4 weeks of [IDA Summer of Code](/blog/2014/06/11/isoc/) and this is an update post of what I’ve done so far. I will write a more extensive summary post at the end of the project. I was planning on writing a weekly summary, but that ship sailed a long time ago.

I’ve written a lot of documenting code examples, specifically making sure most of the methods in [collections](http://doc.rust-lang.org/collections/index.html) had examples. I’m especially proud of the main examples for [priority\_queue](http://doc.rust-lang.org/std/collections/priority_queue/index.html) and [rand](http://doc.rust-lang.org/std/rand/index.html) I wrote about [here](/blog/2014/07/23/dijkstras_algorithm/) and [here](/blog/2014/07/30/monty_hall/).

I have one [RFC](https://github.com/rust-lang/rfcs/pull/186) where I propose to introduce a new keyword `newtype`. I don’t think it will be accepted, but it spurred some good discussions and *something* similar might be included further down the road. It remains to be seen if it will be with a new keyword or if we’ll utilize existing constructions.

Other than that I’ve done a bit of triage: the act of looking up old issues to see if they are relevant, update them and preferably fix them. I have done some small fixes to a couple of issues, most have been very minor ones like adjusting error messages or adding tests.

The time I have left I will try to fix more issues. This week I tried to add [default arguments for json decoding when using `Option`](https://github.com/rust-lang/rust/issues/12794), but I approached it the wrong way. I may attempt to do it “the right way” but I’m unsure if I can come up with a nice way.