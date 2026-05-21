+++
title = "Notes for May 3-10"
description = "This was a weird week, both because I keep waking up at 5AM with my sinuses clogged, and because I feel like I’m losing momentum. Feeling almost permanently cotton-headed, sleepy due to sheer exhaustion or because of antihistamines certainly has something to do with it, but [I am"
date = "2026-05-10T14:33:00Z"
url = "https://taoofmac.com/space/notes/2026/05/10/1433?utm_content=atom"
author = "Rui Carmo"
text = ""
lastupdated = "2026-05-20T09:23:14.792913458Z"
seen = false
+++

This was a weird week, both because I keep waking up at 5AM with my sinuses clogged, and because I feel like I’m losing momentum. Feeling almost permanently cotton-headed, sleepy due to sheer exhaustion or because of antihistamines certainly has something to do with it, but [I am not exactly enthusiastic this weekend](/space/blog/2026/05/09/2130).

[

We Must Go Deeper
----------

](/space/notes/2026/05/10/1433#we-must-go-deeper)

I spent the latter part of the week hacking away at [`go-ds4`](https://github.com/rcarmo/go-ds4?utm_source=taoofmac.com&utm_medium=web&utm_campaign=unsolicited_traffic&utm_content=external_link) and [`go-pherence`](https://github.com/rcarmo/go-pherence?utm_source=taoofmac.com&utm_medium=web&utm_campaign=unsolicited_traffic&utm_content=external_link), which was interesting to me not just because I am still trying to get Vulkan to work for inference on a couple of SBCs, but also because, all of a sudden, *a bunch of my stuff* converged into SIMD and [Go](/space/dev/golang) assembly–including, of all things, an H.264 decoder I plan to add to [`go-rdp`](https://github.com/rcarmo/go-rdp-android?utm_source=taoofmac.com&utm_medium=web&utm_campaign=unsolicited_traffic&utm_content=external_link).

This meant going all in on model internals again, which is something I’ve neglected for a while and that I would otherwise find fascinating were it not for my general state of tiredness.

[](/space/notes/2026/05/10/1433#my-little)

[](/space/notes/2026/05/10/1433#my-little)[My Little ](/space/notes/2026/05/10/1433#my-little)[Clojure](/space/dev/clojure)
----------

[`go-joker`](https://github.com/rcarmo/go-joker?utm_source=taoofmac.com&utm_medium=web&utm_campaign=unsolicited_traffic&utm_content=external_link) went from “forked and interesting” to “actually competitive with Python” in about two days of focused work. Again, there is a weird serendipity and convergence across most of my other projects (like the JITs I’ve been hacking on in [`macemu-jit`](https://github.com/rcarmo/macemu-jit?utm_source=taoofmac.com&utm_medium=web&utm_campaign=unsolicited_traffic&utm_content=external_link) and [`previous-jit`](https://github.com/rcarmo/previous-jit?utm_source=taoofmac.com&utm_medium=web&utm_campaign=unsolicited_traffic&utm_content=external_link)), but this time I took out [*CLR via C#*](https://www.amazon.es/gp/product/0735667454/ref=as_li_tl?_encoding=UTF8&tag=taoofmac-21&linkCode=ur2&camp=3638&creative=24630&utm_source=taoofmac.com&utm_medium=web&utm_campaign=unsolicited_traffic&utm_content=external_link) and had [Codex](https://openai.com/codex?utm_source=taoofmac.com&utm_medium=web&utm_campaign=unsolicited_traffic&utm_content=external_link) build a tiered IR bytecode interpreter that can in turn do [WASM](/space/dev/wasm) compilation via `wazero` for pure numeric loops, and doesn’t have a GIL (thanks to [Go](/space/dev/golang)routines).

I should really write about that, when I feel better.

[

Android Remoting
----------

](/space/notes/2026/05/10/1433#android-remoting)

As part of an ongoing experiment to see just how far I can go without the Android SDK installed, I kept nudging my [Android RDP server](https://github.com/rcarmo/go-rdp-android?utm_source=taoofmac.com&utm_medium=web&utm_campaign=unsolicited_traffic&utm_content=external_link) along, and am generally *very* happy with all the automated testing scaffolding I built around that, because I’ve extended it to [`vibes`](https://github.com/rcarmo/vibes?utm_source=taoofmac.com&utm_medium=web&utm_campaign=unsolicited_traffic&utm_content=external_link) and [`piclaw`](https://github.com/rcarmo/piclaw?utm_source=taoofmac.com&utm_medium=web&utm_campaign=unsolicited_traffic&utm_content=external_link) with great success.

[

My Agentic Work Is Nearly Done
----------

](/space/notes/2026/05/10/1433#my-agentic-work-is-nearly-done)

I think [`piclaw`](https://github.com/rcarmo/piclaw?utm_source=taoofmac.com&utm_medium=web&utm_campaign=unsolicited_traffic&utm_content=external_link) is pretty much done by now. I backported `kitty` graphics support in the terminal (the [`ghostty-web`](https://github.com/rcarmo/ghostty-web?utm_source=taoofmac.com&utm_medium=web&utm_campaign=unsolicited_traffic&utm_content=external_link) ecosystem is pretty amazing on its own), and of course I use it constantly (I am actually typing this draft in it), and I will be doing some fixes and at least one UX release, but I need to go back and fix my Synology, redeploy a bunch of things in my homelab, and prep for more electronics projects.

But first, I’m going to take a nap, because I did wake up at 4AM again, crafted [a dead stupid add-on](https://rcarmo.github.io/piclaw-addons/addons/yolo-vibe?utm_source=taoofmac.com&utm_medium=web&utm_campaign=unsolicited_traffic&utm_content=external_link) and badly need to rest.