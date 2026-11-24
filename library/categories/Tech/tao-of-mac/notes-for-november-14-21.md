+++
title = "Notes for November 14–21"
description = "After a relatively blissful weekend doing absolutely none of what I’d planned, nor clearing my personal backlog (I ended up doing some work admin stuff that had been pre-empted last Friday), I decided to be a little bit more syste"
date = "2026-11-21T17:04:00Z"
url = "https://taoofmac.com/space/notes/2026/11/21/1704?utm_content=atom"
author = "Rui Carmo"
text = ""
lastupdated = "2026-11-23T10:53:44.785839513Z"
seen = false
+++

After a relatively blissful weekend doing absolutely none of what I’d planned, nor clearing my personal backlog (I ended up doing some work admin stuff that had been [pre-empted last Friday](/space/notes/2026/11/13/2034#work-and-industry)), I decided to be a little bit more systematic about things.

I am now back to Pomodoro timer land because that’s the only way to carve out 20-25 minutes of uninterrupted focus time for *anything*, including writing, and I think this week it served me well, for besides taking a couple of fairly momentous decisions at work, I also managed to get a surprising amount of stuff done in focused chunks.

[

Bye, Parallels, It Was Nice Using You
----------

](/space/notes/2026/11/21/1704#bye-parallels-it-was-nice-using-you)

I cancelled my [Parallels](/space/apps/parallels_workstation#parallels-workstation) subscription last weekend, for three reasons:

* It was a €69.99 subscription, and they charged me without any noticeable warning this time around.
* There is no way running Windows VMs on a Mac is worth paying *that much* every year anymore.
* Absolutely *nothing* they were offering as distinguishing extras and “features” was worth it, even for professional use.

In short, I might have kept it if they had sensible pricing, because the only thing I will grant [Parallels](/space/apps/parallels_workstation#parallels-workstation) does better than most options is hardware support. And yet the moat there has pretty much dried up now that [UTM](/space/apps/utm) is starting to implement very usable 3D acceleration via `viogpu3d`, which gives me in excess of 60fps in [WebGL Aquarium](https://webglsamples.org/aquarium/aquarium.html?utm_campaign=unsolicited_traffic&utm_medium=web&utm_source=taoofmac.com) and the couple of CAD programs I tried so far.

>
>
> The trick to get it working well, if you’re setting up a new VM *today*, is to use the uninstaller script for the default video driver in the UTM utilities CD, then reboot to the Windows fallback video driver *before* running the installer. This could be better documented (or done right in the [UTM](/space/apps/utm) installer), but it’s easy enough to sort out.
>
>

Given what I’m seeing in emulation and graphics throughput, I expect that a few months of AI-accelerated development will close that gap (and others).

But on top of that, [UTM](/space/apps/utm) is very much automatable these days. [Parallels](/space/apps/parallels_workstation#parallels-workstation) was too, but [UTM](/space/apps/utm)’s approach seems nicer, and you can use [QEMU](/space/emulation/qemu) tooling to handle its disk images instead of yet another proprietary format.

All I think it’s missing from a management perspective is a snapshot tree (i.e., not just a linear stack of OS snapshots), but I suspect that too will come in time.

[

Slimming Down `piclaw`
----------

](/space/notes/2026/11/21/1704#slimming-down-piclaw)

The long, hard slog to slim down [`piclaw`](https://github.com/rcarmo/piclaw?utm_campaign=unsolicited_traffic&utm_medium=web&utm_source=taoofmac.com) and remove the redundancies I had built atop the original SDK that are now embedded in `pi-durable` continues, and like I’ve written [before](/space/notes/2026/11/08/1521#homelab), in the process I tore out entire chunks of machinery and features I (at least) have no use for:

<img src="/space/notes/2026/11/21/1704/piclaw-code-churn.png?v=8db11669d0c7" alt="Chart of source and test code added to and removed from piclaw between 20 October and 20 November 2026" width="2560" height="1800"> A month of `piclaw` churn, with more code removed than added.

I suspect I will eventually write a bit more about this at length as a follow-up to [my long post on building it](/space/blog/2026/08/21/2218#building-piclaw-on-top-of-an-opinionated-coding-agent), but for the moment I’m just enjoying polishing it down and systematically closing issues without much of a hurry.

In parallel, [`kintsugi`](https://github.com/rcarmo/kintsugi?utm_campaign=unsolicited_traffic&utm_medium=web&utm_source=taoofmac.com) has become my long-haul/heavy-CPU project environment, and I’ve been using it to do whatever [Go](/space/dev/golang#go-lang) and [Rust](/space/dev/rust) work I need to get done. I’ve yet to figure out a decent way to manage build caches consistently, but at least now I don’t need to rebuild entire sandboxes every weekend.

[

Measuring Agent Calls
----------

](/space/notes/2026/11/21/1704#measuring-agent-calls)

I’m back building building blocks, and since I needed a stable, reusable web wrapper for the GitHub Copilot SDK (which [is now Microsoft’s core agent harness](https://blogs.microsoft.com/blog/2026/10/28/introducing-the-microsoft-copilot-harness-unlocking-the-potential-of-truly-multi-model-agentic-work/?utm_campaign=unsolicited_traffic&utm_medium=web&utm_source=taoofmac.com)), I decided to [create one](https://github.com/rcarmo/ms-durable?utm_campaign=unsolicited_traffic&utm_medium=web&utm_source=taoofmac.com) and model it after `pi-durable`–but with built-in tool observability, because I will be using this in places where I will want to drill through the inter-agent and tool call chain without all the nice Azure observability tooling.

The result is pretty decent, and here’s what it looks like when I ask the base agent to create four sub-agents to render a 3D animation of a MacBook Pro, complete with interactive approvals:

<img src="/space/notes/2026/11/21/1704/ms-durable-trace.png?v=6b8bff27dc14" alt="ms-durable interface showing the MacBook Pro animation request, model and tool calls, and interactive approvals" width="2054" height="919"> The `ms-durable` trace for the MacBook Pro animation, including tool calls and approvals.

…and here’s the output render, for posterity:

<img src="/space/notes/2026/11/21/1704/macbook-pro-animation.gif?v=ed84a746b12d" alt="Animated 3D rendering of a MacBook Pro" width="320" height="240"> The resulting MacBook Pro animation. [

Sorting Out Mail.app
----------

](/space/notes/2026/11/21/1704#sorting-out-mail-app)

I’ve been falling behind on my personal e-mail to a point where it’s just ridiculous, and since Apple killed Mail plug-ins years ago (including [Mail Act-On](/space/links/2008/10/21/0714#mailacton-2-0-1), which was the best way I ever had to file messages) and has utterly failed to deliver any effective way to manage inboxes (no, the “smart move” thing they injected into the toolbar does not really work for me), I decided to have another go at it.

[Shelf](/space/apps/shelf) helps a lot, but since I didn’t want to do it semi-manually and have become used to having Copilot do that for me at work, I decided to throw AI at the problem–however, I had a few constraints:

* No login access to any e-mail account (local [Mail.app](/space/apps/mail#mail-app) automation only)
* No way to do anything more than list folders and messages or move them between folders (i.e., no destructive actions)
* Minimal metadata access (although I am allowing message text search as well now)
* Minimal (or no) local agent access

So I created a restricted [MCP](/space/ai/mcp#model-context-protocol) server to do exactly that, and set up [OpenMinis](/space/links/2026/07/20/2213#open-minis-is-the-ios-agent-i-wish-siri-ai-could-be) (which runs completely sandboxed on my Macs, seeing as I’m running the iPad application *and* it uses ARM emulation inside to run the agent) to use a private Azure OpenAI endpoint to drive that (I don’t have Macs powerful enough to run decent local LLMs, and [Strata](https://github.com/Niko1221/Strata?utm_campaign=unsolicited_traffic&utm_medium=web&utm_source=taoofmac.com) still crashes my RTX 3060, but Qwen does work for a few minutes and is good enough at this).

And boy, what a shitty mess Apple Events automation still is. I’ve been ranting about how badly Apple has let automation deteriorate [for years](/space/blog/2025/03/14/1830#there-is-no-moat-but-apple-has-no-automation-foundation-anymore), and there have been rumours of Apple doing [MCP](/space/ai/mcp#model-context-protocol) servers of their own to automate macOS, but the foundations are *so bad* that it took me *hours* to get something as simple as moving messages between accounts to work reliably.

The [Swift](/space/dev/swift) code is [up on GitHub](https://github.com/rcarmo/swift-mailmcp?utm_campaign=unsolicited_traffic&utm_medium=web&utm_source=taoofmac.com), and I will likely be adding a few things to it or incorporating it into [Shelf](/space/apps/shelf) somehow–but I won’t be investing a lot of effort into it until I learn more about what Apple intends to do–if anything.