+++
title = "Notes for April 20-26"
description = "Amidst the chaos brought upon my usual seasonal allergies, work turned out to be calmer than usual–the usual industry churn and constant rumors of layoffs have made “calmer” a relative term, though–so most of my evenings went to projects.I also re-read [Project Hail Mary](https"
date = "2026-04-26T21:44:00Z"
url = "https://taoofmac.com/space/notes/2026/04/26/2144?utm_content=atom"
author = "Rui Carmo"
text = ""
lastupdated = "2026-04-27T12:43:20.670693586Z"
seen = true
+++

Amidst the chaos brought upon my usual seasonal allergies, work turned out to be calmer than usual–the usual industry churn and constant rumors of layoffs have made “calmer” a relative term, though–so most of my evenings went to projects.

I also re-read [*Project Hail Mary*](https://www.amazon.es/gp/product/1529100615/ref=as_li_tl?_encoding=UTF8&tag=taoofmac-21&linkCode=ur2&camp=3638&creative=24630&utm_source=taoofmac.com&utm_medium=web&utm_campaign=unsolicited_traffic&utm_content=external_link)–partly because I needed something absorbing that wasn’t a screen, and partly because Weir is one of the few authors who makes engineering problem-solving feel like a page-turner. It holds up, and I can’t wait to see the movie.

[

Mac Retro-Hackery
----------

](/space/notes/2026/04/26/2144#mac-retro-hackery)

<img alt="Rocketing away" src="https://taoofmac.com/media/notes/2026/04/26/2144/9X_eG4RbECVnjzoE9yuvP81dVxk=/macemu-jit.png" width="256" height="256" style="max-width: 100% !important;height: auto !important;">Rocketing away

[Last week’s](/space/notes/2026/04/19/1400) PPC detour is, surprisingly, working much better than the 68k JIT, but already paid off: my naïve take on memory layouts meant that I hit one of the banes of modern emulation very fast–ASLR on aarch64 Linux was randomising addresses that the JIT needed to be fixed, but *now* I understand a lot of the issues I was having with 68K version.

The fix for now was to have the binary disable its own ASLR at startup via `personality(ADDR_NO_RANDOMIZE)` and re-exec, which is ugly but works and is the sort of thing nobody documents. And after doing that on the [`BasiliskII`](https://github.com/rcarmo/macemu?utm_source=taoofmac.com&utm_medium=web&utm_campaign=unsolicited_traffic&utm_content=external_link) side as well, a lot of issues went away.

Both JITs now have proper `Makefile` workflows with `tmux` targets, which means I can build, test, run and kill either emulator from a single command–which I’ve been doing with my iPad, from the comfort of my couch.

As to the [`Cydintosh`](/space/links/2026/04/15/0718), it is *not* assembled, because the resistive touch screens I have are borderline unusable for precise tapping (so good thing I only 3D printed a test fit with old filament). I ordered a couple of larger capacitive ones and a bunch of other ESP32 stuff, so I expect to come back to that next weekend.

[

PVE microVMs
----------

](/space/notes/2026/04/26/2144#pve-microvms)

<img alt="So tiny" src="https://taoofmac.com/media/notes/2026/04/26/2144/-w6qiYGERDHPnavOvcFSRSFaLQY=/pve-microvm.png" width="256" height="256" style="max-width: 100% !important;height: auto !important;">So tiny

My little [Proxmox](/space/os/linux/distributions/proxmox) hack has been working great–although I had to fix a few things after upgrading one of my nodes (regression testing is the bane of my existence these days), [`pve-microvm`](https://github.com/rcarmo/pve-microvm?utm_source=taoofmac.com&utm_medium=web&utm_campaign=unsolicited_traffic&utm_content=external_link) now supports all the operating systems I care about, a few I had never considered using, and other than the fact that I am creatively patching [Proxmox](/space/os/linux/distributions/proxmox)’s interface, it has been pretty stable, which was unexpected.

I got [`piclaw`](https://github.com/rcarmo/piclaw?utm_source=taoofmac.com&utm_medium=web&utm_campaign=unsolicited_traffic&utm_content=external_link) to hack in a custom OCI dialog to replace the Create VM wizard, an `xterm.js` console tab for microVMs (noVNC makes zero sense for serial-only machines), and [a bunch of other features](https://github.com/rcarmo/pve-microvm/blob/main/docs/usage.md?utm_source=taoofmac.com&utm_medium=web&utm_campaign=unsolicited_traffic&utm_content=external_link).

And *of course* it broke when [Proxmox](/space/os/linux/distributions/proxmox) shipped a patch release, but since I have a [z83ii](/space/blog/2017/12/03/2130) as a sacrificial node I can contain the blast radius of any upgrades. Mostly.

But right now I’m converting most of my LXCs to microVMs, and it’s been a blast–the speed is fantastic, and the fact that I can run [Plan 9](/space/os/plan9) in a microVM is just icing on the cake.

[

The Churning `piclaw`
----------

](/space/notes/2026/04/26/2144#the-churning)

Like I wrote above, regressions are the bane of my existence, and I am getting *really* annoyed at [TypeScript](/space/dev/typescript) because despite all the nice tooling, it can still pass most linting and “compiling” and fail spectacularly at runtime. And since the upstream [Pi](/space/ai/agentic/pi) packages have been undergoing considerable churn and breaking changes, a lot of [`piclaw`](https://github.com/rcarmo/piclaw?utm_source=taoofmac.com&utm_medium=web&utm_campaign=unsolicited_traffic&utm_content=external_link) broke in various ways, and experimenting with different models *really* doesn’t help.

Even as I’m typing this, I am (yet) again waiting for an OpenAI model to audit some UI breakage that Anthropic’s models caused, because they just drop chunks off the code when editing it sometimes, but I am getting really annoyed at fixing things three times in a row…

And yet, the flexibility of [Pi](/space/ai/agentic/pi) and its extension model is pretty amazing–I decided to adopt it wholesale and have started breaking off pieces of [`piclaw`](https://github.com/rcarmo/piclaw?utm_source=taoofmac.com&utm_medium=web&utm_campaign=unsolicited_traffic&utm_content=external_link) into a [`piclaw-addons`](https://github.com/rcarmo/piclaw-addons?utm_source=taoofmac.com&utm_medium=web&utm_campaign=unsolicited_traffic&utm_content=external_link) repository, into which I can throw all the mad experiments I want–for instance, yesterday I hacked together a “cheapskate” addon (a cost-conscious model router) that lets you use a bunch of free tiers across various providers, something that would be impossible to do in most harnesses…

[

Gi
----------

](/space/notes/2026/04/26/2144#gi)

<img alt="Yes, another cute gopher" src="https://taoofmac.com/media/notes/2026/04/26/2144/yWdHl72O7P0_YUSnCrQcpOk_D4g=/gi.png" width="256" height="256" style="max-width: 100% !important;height: auto !important;">Yes, another cute gopher

And yet, I think it’s time to have a backup. So I created [`gi`](https://github.com/rcarmo/gi?utm_source=taoofmac.com&utm_medium=web&utm_campaign=unsolicited_traffic&utm_content=external_link), a [Go](/space/dev/golang) harness inspired by [Pi](/space/ai/agentic/pi) and designed for extensibility, but where *all the extensions are externalized* to the point where they can’t (hopefully) break the core, and where I want to try to rewind the clock to the simpler times of LISP machines–take your workspace, copy a state dump to another machine, and just carry on.

So I designed it as a single [Go](/space/dev/golang) binary that can pack *everything* into a single [SQLite](/space/db/sqlite) database, and that binary embeds both a [Clojure](/space/dev/clojure) dialect (via [`Joker`](https://github.com/candid82/joker?utm_source=taoofmac.com&utm_medium=web&utm_campaign=unsolicited_traffic&utm_content=external_link)) and a [JavaScript](/space/dev/javascript) engine that can hook into the state machine–so extensions can be written in either and live inside the SQLite blob alongside everything else.

And in true belt and suspenders style, I’m going to pack both a TUI and a web UI in the same binary.

But, most importantly, I’m taking a completely different approach at dependencies and testing–starting with bringing together most of my previous stuff in various forms, and writing a functional test suite and not just a code one. Still missing tool execution, keychain, workspace indexing–but it’s at the point where I can sit down and have a conversation with it.

[

9front on ARM
----------

](/space/notes/2026/04/26/2144#9front-on-arm)

<img alt="9front literally &quot;on&quot; ARM" src="https://taoofmac.com/media/notes/2026/04/26/2144/uwSuYk75ttAJ38mWmIscDgClWFY=/9front.png" width="256" height="256" style="max-width: 100% !important;height: auto !important;">9front literally "on" ARM

Yeah, I know. *Another* project. But I realized that I needed to remind myself of how to bootstrap a kernel on bare metal before I even *try* to get [`Haiku`](https://github.com/rcarmo/haiku?utm_source=taoofmac.com&utm_medium=web&utm_campaign=unsolicited_traffic&utm_content=external_link) running outside QEMU, so I started poking at porting [`9front`](https://9front.org/?utm_source=taoofmac.com&utm_medium=web&utm_campaign=unsolicited_traffic&utm_content=external_link) to one of my ARM SBCs.

[Plan 9](/space/os/plan9)’s ideas about distributed computing and per-process namespaces have been rattling around in my head since the 90s, but more to the point it is a *very* simple system, and shifts the bulk of the effort into getting `uboot` and hardware bootstrapping to work instead of trying to figure out everything at once.

As a fun detour from that, I ended up creating a simple [USB Video viewer](https://rcarmo.github.io/projects/swift-usb-video-viewer/?utm_source=taoofmac.com&utm_medium=web&utm_campaign=unsolicited_traffic&utm_content=external_link) to pull up video output from a USB capture card to watch things crash spectacularly.

<img alt="Keeping an eye on things" src="https://taoofmac.com/media/notes/2026/04/26/2144/dh3vKeyVrp1PPDIgxosDNytEOrk=/swift-usb-video-viewer.png" width="256" height="256" style="max-width: 100% !important;height: auto !important;">Keeping an eye on things

[](/space/notes/2026/04/26/2144#yet-another-website)

[Yet Another Website](/space/notes/2026/04/26/2144#yet-another-website)
----------

While I was at it, I finally got around to refreshing [`rcarmo.github.io`](https://rcarmo.github.io/?utm_source=taoofmac.com&utm_medium=web&utm_campaign=unsolicited_traffic&utm_content=external_link)–my open source landing page, which had been accumulating a *decade* of pixel dust while I was off doing other things.

It’s nothing fancy: a single page that groups some of my repositories by topic (AI agents, cloud, hardware, infrastructure, libraries, macOS, terminal stuff) with one-line descriptions for each, and acts as a sane front door for anyone who stumbles onto my [GitHub profile](https://github.com/rcarmo?utm_source=taoofmac.com&utm_medium=web&utm_campaign=unsolicited_traffic&utm_content=external_link) and doesn’t fancy scrolling through 380-something repos.

[<img src="https://taoofmac.com/media/notes/2026/04/26/2144/6OvVRwHiiF1-d3hiIMIoHpuSrYA=/rcarmo-github-io.jpg" alt="rcarmo.github.io project landing page" style="max-width: 100%;height: auto;width: 100%" width="1280" height="800">](https://rcarmo.github.io/?utm_source=taoofmac.com&utm_medium=web&utm_campaign=unsolicited_traffic&utm_content=external_link) The refreshed landing page, sorted by topic and (slightly) opinionated about what's worth highlighting.

The rest of the week’s GitHub activity was the usual scattering: a small [`go-ai`](https://github.com/rcarmo/go-ai?utm_source=taoofmac.com&utm_medium=web&utm_campaign=unsolicited_traffic&utm_content=external_link) update (the unified LLM client I’m using inside [`gi`](https://github.com/rcarmo/gi?utm_source=taoofmac.com&utm_medium=web&utm_campaign=unsolicited_traffic&utm_content=external_link)), some [`ground-init`](https://github.com/rcarmo/ground-init?utm_source=taoofmac.com&utm_medium=web&utm_campaign=unsolicited_traffic&utm_content=external_link) and [`mdnsbridge`](https://github.com/rcarmo/mdnsbridge?utm_source=taoofmac.com&utm_medium=web&utm_campaign=unsolicited_traffic&utm_content=external_link) cleanups, a [`zmk-config-totem`](https://github.com/rcarmo/zmk-config-totem?utm_source=taoofmac.com&utm_medium=web&utm_campaign=unsolicited_traffic&utm_content=external_link) tweak for the split keyboard I’ve been slowly getting used to, and a couple of [`apfelstrudel`](https://github.com/rcarmo/apfelstrudel?utm_source=taoofmac.com&utm_medium=web&utm_campaign=unsolicited_traffic&utm_content=external_link) commits–because if I’m going to break my brain on emulators all week, I might as well let an AI agent help me make some weird music every now and then.

[

Site Cleanups
----------

](/space/notes/2026/04/26/2144#site-cleanups)

Flint, my “very stable” agent, kept earning its keep on the side: I finally split out [MLX](/space/ai/mlx) and [embeddings](/space/ai/embeddings) as their own [AI](/space/ai) subsections (consolidating entries that had been awkwardly squatting in the language tables) and tucked away a couple of [agentic](/space/ai/agentic/pi) odds and ends–notably [`pi-draw`](/space/ai/agentic/pi) and a [baloney detection kit](/space/ai/agentic/skills)–into the relevant pages.

None of this is glamorous, but the resource pages have been drifting for a while, and having an agent do the boring sorting (and ask me sensible questions about edge cases) is exactly the kind of thing to deal with chores I’ve been putting off for years.

And yeah, I know it’s too much, and that I’m spreading myself too thin.