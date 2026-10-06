+++
title = "Ephemeral testing"
description = '<img width="150" height="150" src="https://lemire.me/blog/wp-content/uploads/2026/10/Gemini_Generated_Image_8mi98l8mi98l8mi9-150x150.jpg" class="webfeedsFeaturedVisual wp-post-image" alt="" style="display: block; margin-bottom: 5px; clear:both;max-width: 100%;" link_thumbnail="" '
date = "2026-10-05T08:00:51Z"
url = "https://lemire.me/blog/2026/10/05/ephemeral-testing/"
author = "Daniel Lemire"
text = ""
lastupdated = "2026-10-05T09:04:49.372157267Z"
seen = true
+++

<img width="150" height="150" src="https://lemire.me/blog/wp-content/uploads/2026/10/Gemini_Generated_Image_8mi98l8mi98l8mi9-150x150.jpg" class="webfeedsFeaturedVisual wp-post-image" alt="" style="display: block; margin-bottom: 5px; clear:both;max-width: 100%;" link_thumbnail="" decoding="async" srcset="https://lemire.me/blog/wp-content/uploads/2026/10/Gemini_Generated_Image_8mi98l8mi98l8mi9-150x150.jpg 150w, https://lemire.me/blog/wp-content/uploads/2026/10/Gemini_Generated_Image_8mi98l8mi98l8mi9-300x300.jpg 300w, https://lemire.me/blog/wp-content/uploads/2026/10/Gemini_Generated_Image_8mi98l8mi98l8mi9-768x768.jpg 768w, https://lemire.me/blog/wp-content/uploads/2026/10/Gemini_Generated_Image_8mi98l8mi98l8mi9.jpg 1024w" sizes="(max-width: 150px) 100vw, 150px">

We have many ways to ensure software quality. Unit testing. Fuzz testing. Integration testing. And so forth.

I’d like to propose a method that was unthinkable before: ephemeral testing. (Ephemeral is a fancy word for ‘throw away’ or ‘temporary’.)

You write your code. You build your software component. Or the AI agent does it for you, it does not matter.

Then you ask an AI agent to build on it: an application, another layer, maybe several. You have it test what it built. You do not assess the original work directly. You assess how good the software built on top of it is.

It is a form of integration testing. The difference is that the software on top is entirely ephemeral. You throw it away when you are done.

A library with a clean API, stable invariants, and useful errors lets the agent produce something that works quickly. A library with hidden state, surprising defaults, or incomplete docs produces a pile of patches and failures. The failures are evidence about your code, not about the agent.

You can repeat it. Different agents, different tasks, same foundation.

In effect, instead of building the core while trying to anticipate what might be needed at the other layers, you just simulate the other layers by actually building them.

Of course, you could argue that with AI, you can rebuild everything whenever you need to. But that’s not practical. You need some form of stability.

I have been applying this trick to various projects. As I consider a new feature, I ask my AI to prototype quickly what I might later build based on what I am doing it. Ephemeral testing works for me thus far.