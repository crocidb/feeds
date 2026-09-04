+++
title = "Notes for April 27 – May 3"
description = "This was an absurdly productive week, at least on a personal level. I’m not sure whether to be pleased or worried about the number of projects that moved forward simultaneously, but here we are.I do know that a lot of it was due to the fact that I am back having insomnia and "
date = "2026-05-03T22:00:00Z"
url = "https://taoofmac.com/space/notes/2026/05/03/2200?utm_content=atom"
author = "Rui Carmo"
text = ""
lastupdated = "2026-05-05T08:25:09.929714407Z"
seen = false
+++

This was an absurdly productive week, at least on a personal level. I’m not sure whether to be pleased or worried about the number of projects that moved forward simultaneously, but here we are.

I do know that a *lot* of it was due to the fact that I am back having insomnia *and* waking up with my nose clogged due to allergies, and that there is relatively little to do at 4AM except watch videos, read, and… hack away at things.

[

Vibes is Go-ing Places
----------

](/space/notes/2026/05/03/2200#vibes-is-go-ing-places)

I finally got [`vibes`](https://github.com/rcarmo/vibes?utm_source=taoofmac.com&utm_medium=web&utm_campaign=unsolicited_traffic&utm_content=external_link) to mostly work in [Go](/space/dev/golang). The progressive transformation of all my [Python](/space/dev/python) stuff seems inexorable now, but this one was due to my still thinking ACP to wrap existing agent harnesses is much more of a necessity now that Anthropic has taken the lead on puerile attempts at locking people into their subscriptions by forbidding anything but Claude Code.

I still don’t use Claude Code or Anthropic models outside [work](/space/site/disclaimer), but many people do, and I like to have options, so I used [`vibes`](https://github.com/rcarmo/vibes?utm_source=taoofmac.com&utm_medium=web&utm_campaign=unsolicited_traffic&utm_content=external_link) to prototype a few things, including automating UI testing end-to-end with [Gherkin](https://cucumber.io/docs/gherkin/?utm_source=taoofmac.com&utm_medium=web&utm_campaign=unsolicited_traffic&utm_content=external_link) (something I’ve used on and off in customer projects that mandated [BDD](https://en.wikipedia.org/wiki/Behavior-driven_development?utm_source=taoofmac.com&utm_medium=web&utm_campaign=unsolicited_traffic&utm_content=external_link) and never really saw used “well”, but that is very useful with LLMs).

That [BDD](https://en.wikipedia.org/wiki/Behavior-driven_development?utm_source=taoofmac.com&utm_medium=web&utm_campaign=unsolicited_traffic&utm_content=external_link) pipeline quickly ballooned out of proportion, of course, turning into almost 50 Gherkin scenarios with [Playwright](https://playwright.dev/?utm_source=taoofmac.com&utm_medium=web&utm_campaign=unsolicited_traffic&utm_content=external_link) step definitions, a PDF report generator with embedded screenshots, and a CI workflow that tries to run the whole thing against [GitHub Models](https://github.com/marketplace/models?utm_source=taoofmac.com&utm_medium=web&utm_campaign=unsolicited_traffic&utm_content=external_link) so it doesn’t need my API keys (that is broken for now, for some reason, but [OpenCode](https://opencode.ai/?utm_source=taoofmac.com&utm_medium=web&utm_campaign=unsolicited_traffic&utm_content=external_link) free models are enough to say “Hello” and get a response back).

Until 4AM today, [`vibes`](https://github.com/rcarmo/vibes?utm_source=taoofmac.com&utm_medium=web&utm_campaign=unsolicited_traffic&utm_content=external_link) had more structured UX tests than [`piclaw`](https://github.com/rcarmo/piclaw?utm_source=taoofmac.com&utm_medium=web&utm_campaign=unsolicited_traffic&utm_content=external_link), which was both gratifying and mildly embarrassing…

[

Emulation and Ports
----------

](/space/notes/2026/05/03/2200#emulation-and-ports)

The [SheepShaver](https://github.com/rcarmo/macemu?utm_source=taoofmac.com&utm_medium=web&utm_campaign=unsolicited_traffic&utm_content=external_link) JIT is, surprisingly, coming along faster and easier than the 68k one, largely because, well, it’s RISC and has zero gnarly instruction side effects.

Not having spent a lot of time with pre-OSX PPC Macs, I am learning quite a lot about the internals (and JIT “design”, even though I’m working off bits and bobs I’m picking up from console emulation, of all things). Early in the week it booted Mac OS 7.6.1, then promptly broke the instant I ran Prince of Persia, but now it has (somewhat unstable) networking and I am starting to revisit [packaging prebuilt Raspbian builds](https://github.com/rcarmo/macemu-jit?utm_source=taoofmac.com&utm_medium=web&utm_campaign=unsolicited_traffic&utm_content=external_link).

On the [BasiliskII](https://github.com/rcarmo/macemu?utm_source=taoofmac.com&utm_medium=web&utm_campaign=unsolicited_traffic&utm_content=external_link) side, I got [`piclaw`](https://github.com/rcarmo/piclaw?utm_source=taoofmac.com&utm_medium=web&utm_campaign=unsolicited_traffic&utm_content=external_link) to automate fixing a bunch of VNC issues–double keystrokes, mouse snapping to centre, mode-switch crashes, etc. I actually did this before I picked up [Gherkin](https://cucumber.io/docs/gherkin/?utm_source=taoofmac.com&utm_medium=web&utm_campaign=unsolicited_traffic&utm_content=external_link), which I now sort of regret since it would have made some of the tests easier to specify.

And yes, [`previous-jit`](https://github.com/rcarmo/previous-jit?utm_source=taoofmac.com&utm_medium=web&utm_campaign=unsolicited_traffic&utm_content=external_link) is a thing now. I’m using it as an opportunity to both test and clean up the 68k JIT, and it works pretty well on the [Orange Pi 6](/space/reviews/2026/04/11/1900), which has turned into my ARM64 lab.

Got an Orange Pi 4 to boot the [9front](https://9front.org/?utm_source=taoofmac.com&utm_medium=web&utm_campaign=unsolicited_traffic&utm_content=external_link) kernel and crash into the PCI bus, which counts as progress. Still reading kernel source and figuring out how the boot chain works on this specific SoC.

[

Fixing More Papercuts
----------

](/space/notes/2026/05/03/2200#fixing-more-papercuts)

As I was doing [Web App Viewer](/space/notes/2026/04/29/1730), I decided to clean up some pending Android projects that (believe it or not) are useful to me on a daily basis. I started with [Receiver](https://rcarmo.github.io/projects/kotlin-airplay-receiver/?utm_source=taoofmac.com&utm_medium=web&utm_campaign=unsolicited_traffic&utm_content=external_link), and possibly due to insomnia side effects, also kicked off an [RDP server for Android](https://github.com/rcarmo/go-rdp-android?utm_source=taoofmac.com&utm_medium=web&utm_campaign=unsolicited_traffic&utm_content=external_link) devices, because I got tired of every existing option on the Play Store being either scammy, subscription-gated, or both.

And it, too, is doing full E2E testing, [with nice reports](https://github.com/rcarmo/go-rdp-android/releases/tag/v0.1.1?utm_source=taoofmac.com&utm_medium=web&utm_campaign=unsolicited_traffic&utm_content=external_link) - I’ll have a little story to write about this one because it builds on [`go-rdp`](https://github.com/rcarmo/go-rdp?utm_source=taoofmac.com&utm_medium=web&utm_campaign=unsolicited_traffic&utm_content=external_link) and is a great example of how it pays off to build libraries and reusable components (all my recent projects re-use stuff from each other to a fair degree).

Perhaps unwisely, I also decided to look at [iSH](https://ish.app/?utm_source=taoofmac.com&utm_medium=web&utm_campaign=unsolicited_traffic&utm_content=external_link), fork the arm64 version, and fix whatever I could. It can now run `bun` and [Go](/space/dev/golang) pretty well (both crashed the iOS version), but it’s too early to call it generally usable.

[

Piclaw
----------

](/space/notes/2026/05/03/2200#piclaw)

I am slowing it down now that it is effectively “stable”, and focusing on two things:

* Removing as many add-ons as possible [to a standalone project](https://rcarmo.github.io/piclaw-addons/?utm_source=taoofmac.com&utm_medium=web&utm_campaign=unsolicited_traffic&utm_content=external_link) so that I can make it easier to maintain.
* E2E testing, because I am completely fed up with [TypeScript](/space/dev/typescript) breaking in the front-end.

Building upon my earlier experiments during the week, I set up a proper [Gherkin](https://cucumber.io/docs/gherkin/?utm_source=taoofmac.com&utm_medium=web&utm_campaign=unsolicited_traffic&utm_content=external_link)/[Playwright](https://playwright.dev/?utm_source=taoofmac.com&utm_medium=web&utm_campaign=unsolicited_traffic&utm_content=external_link) pipeline with user stories, [PDF report generation](https://github.com/rcarmo/piclaw/releases/tag/v2.2.0?utm_source=taoofmac.com&utm_medium=web&utm_campaign=unsolicited_traffic&utm_content=external_link) and a partridge in a pear tree, so my big hope is that other than upstream churn from [`pi.dev`](https://pi.dev?utm_source=taoofmac.com&utm_medium=web&utm_campaign=unsolicited_traffic&utm_content=external_link) I can just settle in and *use* it.

[

Gi
----------

](/space/notes/2026/05/03/2200#gi)

I’m still very keen on building a low-resource agent harness that works the way I want it to, so this week [gi](https://github.com/rcarmo/gi?utm_source=taoofmac.com&utm_medium=web&utm_campaign=unsolicited_traffic&utm_content=external_link) got scriptable agent loop hooks, a tool registry, route registry and event streams.

But the [`joker`](https://github.com/candid82/joker?utm_source=taoofmac.com&utm_medium=web&utm_campaign=unsolicited_traffic&utm_content=external_link) runtime is where I am having the most fun, by far–my fork is now faster than [Python](/space/dev/python) for a completely arbitrary set of benchmarks:

<img alt="Joker IR Optimization final comparison matrix: Bun, Python, Goja and Joker timings across 13 microbenchmarks, with Joker beating Goja on 11/13 and Python on 5/13" src="https://taoofmac.com/media/notes/2026/05/03/2200/In3Uw7C_a4fBX0iY65zlY8OVAk0=/joker-benchmarks.png" width="1798" height="1180" style="max-width: 100% !important;height: auto !important;">Joker IR Optimization final comparison matrix: Bun, Python, Goja and Joker timings across 13 microbenchmarks, with Joker beating Goja on 11/13 and Python on 5/13

The point, however, is not the benchmarks, but *using* the benchmarks to understand what to tweak for more general cases.

And so far it’s been turning out pretty nice–I’m really looking forward to using it.

[

### Gophers and GPUs ###

](/space/notes/2026/05/03/2200#gophers-and-gpus)

I’ve been playing too much with [Go](/space/dev/golang) assembly, so after optimizing [`go-gte`](https://github.com/rcarmo/go-gte?utm_source=taoofmac.com&utm_medium=web&utm_campaign=unsolicited_traffic&utm_content=external_link) (because I wanted an embedding model for my own stuff), I decided to look at [`tinygrad`](https://github.com/tinygrad/tinygrad?utm_source=taoofmac.com&utm_medium=web&utm_campaign=unsolicited_traffic&utm_content=external_link), and… I started putting [`go-pherence`](https://github.com/rcarmo/go-pherence?utm_source=taoofmac.com&utm_medium=web&utm_campaign=unsolicited_traffic&utm_content=external_link) together based on everything I’ve learned so far.

<img alt="Yeah, I know, cute gophers again" src="https://taoofmac.com/media/notes/2026/05/03/2200/ieksGTodw5fvDNLvuzX3jS4Q8ys=/go-pherence.png" width="256" height="256" style="max-width: 100% !important;height: auto !important;">Yeah, I know, cute gophers again

Again, it is a *thing I think should exist*, because when I was looking a few years ago there were no [Go](/space/dev/golang) libraries for inference whatsoever, and I’d like to have one that I can use on Linux (eventually getting it to work with Vulkan on SBCs) and that takes MLX-compatible weights:

<img alt="Qwen3-0.6B inference results: GPU/CPU tokens-per-second across SmolLM2, Qwen2.5 and Qwen3 architectures after fixing a head_dim mismatch" src="https://taoofmac.com/media/notes/2026/05/03/2200/E3Tx-2ZfG7bpX0XfGiZlZbyCXRM=/go-pherence-qwen3.png" width="1668" height="572" style="max-width: 100% !important;height: auto !important;">Qwen3-0.6B inference results: GPU/CPU tokens-per-second across SmolLM2, Qwen2.5 and Qwen3 architectures after fixing a head\_dim mismatch

[](/space/notes/2026/05/03/2200#homelab)

[Homelab](/space/notes/2026/05/03/2200#homelab)
----------

[`pve-microvm`](https://github.com/rcarmo/pve-microvm?utm_source=taoofmac.com&utm_medium=web&utm_campaign=unsolicited_traffic&utm_content=external_link) keeps paying off. I’ve moved a few of my home services to microVMs, added [OpenWrt](/space/os/linux/distributions/openwrt) (which is now firewalling a test VLAN) and [OPNsense](https://opnsense.org/?utm_source=taoofmac.com&utm_medium=web&utm_campaign=unsolicited_traffic&utm_content=external_link) (which works, but is not as familiar to me), [SmolBSD](https://smolbsd.org/?utm_source=taoofmac.com&utm_medium=web&utm_campaign=unsolicited_traffic&utm_content=external_link) (a NetBSD flavor that boots in 31ms, which is pretty impressive), and, because I am wading into inference territory (more on that later), an [exo](https://github.com/exo-explore/exo?utm_source=taoofmac.com&utm_medium=web&utm_campaign=unsolicited_traffic&utm_content=external_link) distributed inference template.

But even as I was drafting this, my [Synology DS1019+](/space/blog/2020/04/04/2310) vanished off the network. I shut it and the [TNAS](/space/blog/2024/12/26/2330) down, unplugged them, dusted the closet (which was long overdue), plugged them back in, and… the [DS1019+](/space/blog/2020/04/04/2310) came “up”, but is completely unreachable (status LED is solid green, disk activity, link up on both interfaces, etc.).

Shuts down and boots correctly (apparently, with the usual slowness), but even sniffing at traffic with Wireshark directly yielded nothing. I tried resetting it, but to no avail. I have a support ticket open (for what it’s worth these days), and I *think* all the important data is on Azure, but troubleshooting this is something I didn’t want to deal with this week.

[

So, what Did I Learn This Week?
----------

](/space/notes/2026/05/03/2200#so-what-did-i-learn-this-week)

* The [Synology DS1019+](/space/blog/2020/04/04/2310) has serious bugs.
* I have *far too many stupid ideas at 4AM*.
* There is a lot of re-use across my various projects, thanks to my penchant for building foundational bits first.
* Inference is *hard*. Optimizing JITs and interpreters is, comparatively, much more my turf.
* Functional testing works great with LLMs both as output (they write decent user stories that are easier to review and fix than code) and input - the Playwright reports, in particular, provided [Codex](https://github.com/openai/codex?utm_source=taoofmac.com&utm_medium=web&utm_campaign=unsolicited_traffic&utm_content=external_link) with better directions to fix them than I would bother to describe.

So I *might* have found a way to deal with the annoying regressions I was getting in [TypeScript](/space/dev/typescript). Only time will tell.