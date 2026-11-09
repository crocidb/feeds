+++
title = "Notes for November 1–8"
description = "It’s dark and rainy and annoying enough outside that I am both enjoying sitting on the couch with a blanket and pining for my regular walks to the nearest park. And as usual for the season, work is steadily stacking up until the holidays, so this was an even more intense week tha"
date = "2026-11-08T15:21:00Z"
url = "https://taoofmac.com/space/notes/2026/11/08/1521?utm_content=atom"
author = "Rui Carmo"
text = ""
lastupdated = "2026-11-08T15:42:39.668869310Z"
seen = true
+++

It’s dark and rainy and annoying enough outside that I am both enjoying sitting on the couch with a blanket and pining for my regular walks to the nearest park. And as usual for the season, work is steadily stacking up until the holidays, so this was an even more intense week than the last.

But besides [reviving another of my MacBooks](/space/blog/2026/11/03/2037#reviving-a-touch-bar-macbook-with-fedora-silverblue), I’ve had a couple of free hours here and there to keep track of some stuff…

[

Nature Is Healing
----------

](/space/notes/2026/11/08/1521#nature-is-healing)

Yes, US elections are inescapable, and no, I don’t care about the politics (just their outcomes), but I think this quote from [Nilay Patel on the Vergecast](https://www.youtube.com/watch?t=422s&utm_campaign=unsolicited_traffic&utm_medium=web&utm_source=taoofmac.com&v=-U4thshDTL8) (which I watch almost religiously), via [Simon Willison’s note](https://simonwillison.net/2026/Nov/6/nilay-patel/?utm_campaign=unsolicited_traffic&utm_medium=web&utm_source=taoofmac.com), is the best summation of the [AI](/space/ai#artificial-intelligence) zeitgeist yet:

>
>
> The products aren’t good enough to sell people on the costs.
>
>
>
> You cannot tell people that you have to listen to the whine of a data center in their backyard for AI overviews and some of the most hilarious deep fake slop in history.
>
>
>
> It’s not worth it. It just isn’t worth it to anyone. And agents aren’t real and they might not be being used the way that anyone wants them to yet. All these companies are spending more than they’re making on these products. Refrigerators holding blood storage in Europe are being hacked.
>
>
>
> The costs are too high. The benefits are not real. And if you connect that to corruption, you’re like, in order to impose these costs on me, these CEOs are in the White House shaking Trump’s hand, renaming it to the Gulf of America, paying for this ballroom that we don’t want. It’s obvious crypto-corruption, and it’s still slop.
>
>
>
> The AI industry will not get out of it until they make *better products*. Until everyone can see without needing to be convinced, without needing an ad campaign, without any of this stuff that just using these products makes your life better.
>
>

Because, you see, outside our little technology bubble, [AI](/space/ai#artificial-intelligence) hasn’t really improved *anything* overall–yes, there are indirect benefits in many industries, there are cost savings, even the occasional new non-tech product, but all of it has to be offset against the stupefying increases in complexity.

Just like during the Big Data hype cycle, companies now have to have new processes and tools to manage [AI](/space/ai#artificial-intelligence), and the elephant in the room everywhere is the [staggering hardware price increases](/space/links/2025/12/05/1330#the-rampocalypse-is-nigh), which affect businesses and consumers alike in more fundamental ways, like how much it now costs to have *any* sort of computing device to work on even if all you need to do is e-mail and spreadsheets.

And *that*, I think, together with reality creeping in around the edges of the Anthropic IPO, might finally break the hype. But until then (and even for a good while after), prices for *everything* will just keep creeping up.

[

Penny Pinching
----------

](/space/notes/2026/11/08/1521#penny-pinching)

As an indirect offshoot of that, I’ve set my agents to go through my cloud services and [Proxmox](/space/os/linux/distributions/proxmox#proxmox-ve) nodes to relentlessly optimise RAM usage, storage allocations and (in the case of my Azure subscription) disk writes and backup cycles, which are a significant part of my monthly Azure bill.

I’ve been neglecting power consumption for a while, but as we start getting into the cold season I’m again looking at wattage, starting with optimising my servers a bit:

![](/space/notes/2026/11/08/1521/server-closet-power-14d-clean.svg?v=c5a809d4f51a)

[

Homelab
----------

](/space/notes/2026/11/08/1521#homelab)

Free from the tyranny of upgrading [`piclaw`](https://github.com/rcarmo/piclaw?utm_campaign=unsolicited_traffic&utm_medium=web&utm_source=taoofmac.com) to the latest upstream (it’s happening, but first I have a couple of agents slowly whittling it down to the core to remove bloat), I’ve gone back to tidying up my home services, which need some foundational work (I am completely fed up with self-signed certificates), a few usability fixes and a bit of resource optimisation.

Fortunately I have been able to sort of run [`Strata`](https://github.com/Niko1221/Strata?utm_campaign=unsolicited_traffic&utm_medium=web&utm_source=taoofmac.com) on my RTX 3060 for a few hours at a time after a few more kernel and driver updates, so quite a bit of the work has been done with a pastiche of local models, but with just one discrete GPU across seven nodes, things have been slow.

[

### Naming Things Is Hard, But Finding Them Is Harder ###

](/space/notes/2026/11/08/1521#naming-things-is-hard-but-finding-them-is-harder)

The first part entails finishing [`dance`](https://github.com/rcarmo/go-dance?utm_campaign=unsolicited_traffic&utm_medium=web&utm_source=taoofmac.com) to the point where it’s usable as a personal CA (no, I am [not going to let it use 4 as a private key](https://arstechnica.com/security/2026/10/disgraced-emudhra-drops-out-of-tls-business-following-certificate-debacle/?utm_campaign=unsolicited_traffic&utm_medium=web&utm_source=taoofmac.com)).

I am still mildly annoyed at the fact that using `.local` for, well, local, in-house LAN services in 2026 still seems to be a corner case, but I am determined to have proper TLS working without having to use [Tailscale](/space/apps/tailscale) for stuff that is literally on the same wiring. If there isn’t a simpler way than installing my own CA on my own devices, I’ll at least own the issuer and have my machines use ACME to self-provision.

So far that has meant minor tweaks to [`mdnsbridge`](https://github.com/rcarmo/mdnsbridge?utm_campaign=unsolicited_traffic&utm_medium=web&utm_source=taoofmac.com) as well, and I am still debugging the entire CA/issuer lifecycle, but fortunately I can just yell at a pair of LLMs to finish the work and deploy it–the number of `SKILL.md` and note lookups involved in the process is pretty wild at this point, but let’s just say that [`piclaw`](https://github.com/rcarmo/piclaw?utm_campaign=unsolicited_traffic&utm_medium=web&utm_source=taoofmac.com)’s core memory hacks and having them add notes to [Obsidian](/space/apps/obsidian) are still paying off handsomely.

[

### Near-frictionless Writing ###

](/space/notes/2026/11/08/1521#near-frictionless-writing)

The second point is mostly fixes to my [Obsidian](/space/apps/obsidian) server, which has completely replaced [Writing Workshop](/space/blog/2026/09/19/1659#a-writing-tool-that-leaves-the-writing-to-me) *and* my [VS Code](/space/apps/code#visual-studio-code) publishing workflow. On a good day, I can just pop open the URL in a browser, edit my drafts directly in [Obsidian](/space/apps/obsidian) *including pasting in and cropping images*, and then have a couple of rounds with the built-in agent to review the post, fix any typos, resolve any internal links (which was the most time-consuming post-processing phase), pick tags and just issue direct GitHub API calls to push the exact changeset (which then starts a delta-optimised site rebuild).

As an authoring environment, it is pretty awesome–and if it is broken I can just SSH in or use [`piclaw`](https://github.com/rcarmo/piclaw?utm_campaign=unsolicited_traffic&utm_medium=web&utm_source=taoofmac.com)’s built-in terminal to edit drafts (which is what I’m using now as it’s fixing an edge case with TLS in the server).

I think it will be good enough to use 100% of the time in a few weeks, since we’re past the 80%/20% mark between feature completeness and polish.

[

### Measure Thrice, Cut Twice ###

](/space/notes/2026/11/08/1521#measure-thrice-cut-twice)

Besides power, I’m currently looking at the way I gather data across my little menagerie of machines. I already gather data into [Graphite](https://graphiteapp.org/?utm_campaign=unsolicited_traffic&utm_medium=web&utm_source=taoofmac.com) for bare-metal hardware and some internal VM stats (using [`telegraf`](https://github.com/influxdata/telegraf?utm_campaign=unsolicited_traffic&utm_medium=web&utm_source=taoofmac.com)), [Proxmox](/space/os/linux/distributions/proxmox#proxmox-ve) and [Portainer](/space/os/linux/docker/portainer) services (using both their native telemetry and a bit of [`telegraf`](https://github.com/influxdata/telegraf?utm_campaign=unsolicited_traffic&utm_medium=web&utm_source=taoofmac.com) trickery), token usage from all my agents (via [Graphite](https://graphiteapp.org/?utm_campaign=unsolicited_traffic&utm_medium=web&utm_source=taoofmac.com) exporters) and all my home automation telemetry.

[Graphite](https://graphiteapp.org/?utm_campaign=unsolicited_traffic&utm_medium=web&utm_source=taoofmac.com) is still pretty great and I have zero interest in changing the metrics schemas or the protocol itself, but I have been looking at replacing it with [VictoriaMetrics](https://victoriametrics.com/?utm_campaign=unsolicited_traffic&utm_medium=web&utm_source=taoofmac.com) on the server side solely because I would like a leaner, meaner server daemon to remove some load from the [Synology](/space/com/synology).

[

Entertainment
----------

](/space/notes/2026/11/08/1521#entertainment)

We finally finished [Dark Matter](https://www.imdb.com/title/tt19231492/?utm_campaign=unsolicited_traffic&utm_medium=web&utm_source=taoofmac.com)’s second season last evening, which turned out to be a great example of how to extend an original plot and promises an interesting third season. We’ve skipped [Silo](https://www.imdb.com/title/tt14688458/?utm_campaign=unsolicited_traffic&utm_medium=web&utm_source=taoofmac.com) and some of the other stuff for the moment, but it’s time to revisit our watchlist for these longer seasonal evenings…