+++
title = "Notes for August 3-8"
description = "I have a problem. Or, rather, I have two problems: I have been spending far too much time messing about with AI instead of reading. I end up zoning out in front of YouTube and, even with serious attempts at curating my feed, I spend far mo"
date = "2026-08-08T12:00:00Z"
url = "https://taoofmac.com/space/notes/2026/08/08/1200?utm_content=atom"
author = "Rui Carmo"
text = ""
lastupdated = "2026-08-10T12:13:33.792327581Z"
seen = true
+++

I have a problem. Or, rather, I have *two* problems:

* I have been spending far too much time messing about with [AI](/space/ai#artificial-intelligence) instead of reading.
* I end up zoning out in front of YouTube and, even with serious attempts at curating my feed, I spend far more time than I should there.

I’ve [griped about this before](/space/blog/2026/01/17/2130#impending-doom-is-a-great-incentive-to-focus), but this week I decided to take some time to fine-tune the friction around those activities–removing or adding it as needed.

[

E-Ink and Calibre MCP
----------

](/space/notes/2026/08/08/1200#e-ink-and-calibre-mcp)

My [Calibre](/space/apps/calibre) library has grown somewhat out of hand, either due to automated additions (I have been getting the web edition of The Economist delivered through it for [well over a decade](/space/blog/2013/08/18/1050#summer-hardware)) or lack of proper curation, so I decided to use [AI](/space/ai#artificial-intelligence) to see if I could remove the friction involved in finding something to read (or re-read) and have it either e-mailed to my [Nomad](/space/reviews/2025/01/18/2335#the-supernote-a6x2-nomad) via [Kindle](/space/com/amazon/kindle) or easily accessible on my [Xteink X4](/space/reviews/2026/04/04/1800#the-xteink-x4).

That mostly meant figuring out how to get an [MCP](/space/ai/mcp#model-context-protocol) server working with [Calibre](/space/apps/calibre), but it ended up including a parallel side quest to improve [`bun-readlater-epub`](https://github.com/rcarmo/bun-readlater-epub?utm_campaign=unsolicited_traffic&utm_medium=web&utm_source=taoofmac.com) and [`bun-opds-server`](https://github.com/rcarmo/bun-opds-server?utm_campaign=unsolicited_traffic&utm_medium=web&utm_source=taoofmac.com) to see if I could make it easier to queue up and download long-form content.

>
>
> As an aside, recent revisions of [CrossPoint](https://github.com/crosspoint-reader/crosspoint-reader?utm_campaign=unsolicited_traffic&utm_medium=web&utm_source=taoofmac.com) have a Wi-Fi bug that prevents the [Xteink X4](/space/reviews/2026/04/04/1800#the-xteink-x4) from joining our Wi-Fi (apparently because it fails to use a coherent MAC address), so I have to import things via its hotspot (which automatically optimises the [EPUBs](markup/epub)). I suspect I will eventually have to fix it myself when I have more time, because the maintainers have been unable to do it for two releases now…
>
>

The *real* improvement, though, was *how* I decided to design [my own MCP server](https://github.com/rcarmo/python-umcp-calibre?utm_campaign=unsolicited_traffic&utm_medium=web&utm_source=taoofmac.com) for automating [Calibre](/space/apps/calibre). Most existing implementations out there are either sidecars that can’t manipulate [Calibre](/space/apps/calibre) data or CLI wrappers that inevitably contend with [Calibre](/space/apps/calibre) access to its library databases, so I took the plugin route and built one that runs *inside* it and can thus use *everything*: metadata editing, conversions, moving books between libraries, e-mailing them to me, the works:

<img src="/space/notes/2026/08/08/1200/weekly-calibre.png?v=7c4e6bdbe851" alt="uMCP Bridge in Calibre" width="2334" height="1692">uMCP Bridge in Calibre

This effectively means I can now point any AI agent to [Calibre](/space/apps/calibre) and tell it literally:

* find me the last three books by X and e-mail them to my Kindle address
* grab this URL and import it into the Incoming library
* change ratings programmatically
* find and remove duplicates across libraries…

There’s no practical limit, really, although I might need to hack a few more things in. And since it uses the native job engine, everything works correctly.

The biggest quality-of-life improvement is that I don’t need to access the UI anymore. Since I have been running the extra-clunky [Selkies-based container](https://docs.linuxserver.io/images/docker-calibre/?utm_campaign=unsolicited_traffic&utm_medium=web&utm_source=taoofmac.com) (which streams the desktop using its own thing and works very poorly on the iPad), there’s no more browser logins, slow wading through listings, or finicky right-clicking.

As an encore, since I wanted to maximise the time I could spend on the [Nomad](/space/reviews/2025/01/18/2335#the-supernote-a6x2-nomad), I also updated [`picoflux`](https://github.com/rcarmo/picoflux?utm_campaign=unsolicited_traffic&utm_medium=web&utm_source=taoofmac.com) and tweaked the e-ink theme I bolted on a month or so ago.

[

Old-Timey TV Shenanigans
----------

](/space/notes/2026/08/08/1200#old-timey-tv-shenanigans)

That removed a lot of the friction around reading. Next, I needed to *add* friction to watching YouTube videos.

I recently spent a little while fiddling with [Jellyfin](https://jellyfin.org/?utm_campaign=unsolicited_traffic&utm_medium=web&utm_source=taoofmac.com)–partly because I do that on occasion to see if it’s finally a decent alternative to [Plex](/space/apps/plex) (spoiler: not yet, by miles), but also due to my infrequent investigations into the state of hardware video decoding ([`go-264`](https://github.com/rcarmo/go-264?utm_campaign=unsolicited_traffic&utm_medium=web&utm_source=taoofmac.com) will eventually go down that path).

This time I wanted to hack it into a sort of anti-YouTube setup and see if I could replicate the old-timey, “synchronous” TV-watching experience, so I literally told [`piclaw`](https://rcarmo.github.io/projects/piclaw/?utm_campaign=unsolicited_traffic&utm_medium=web&utm_source=taoofmac.com):

>
>
> *I want you to create a Debian 13 LXC in radxax4 to host Jellyfin, mounting `smb://zfs/video` as a read-only remote media library (so keep the LXC filesystem small, please). You can pick the best way to deploy Jellyfin as long as you manage to get hardware video processing working and document it in Obsidian. After that is done install `jellyfin-plugin-livechannels` or a similar TV simulation channel and create appropriate “channels” based on the contents of the media library.*
>
>

Fifteen minutes later, I had the entire thing *working*. Not half-assed or poorly installed, *working*, with the media mounted read-only (twice, once on the [Proxmox](/space/os/linux/distributions/proxmox#proxmox-ve) host and again inside the LXC), QSV hardware transcoding and a full installation and configuration brief in [Obsidian](/space/apps/obsidian) (the output is a tad long, but here’s the last part):

<img src="/space/notes/2026/08/08/1200/jellyfin-installation-summary.png?v=37d5e6903420" alt="Jellyfin installation and hardware transcoding summary" width="1178" height="1156">Jellyfin installation and hardware transcoding summary

Of course Jellyfin immediately filled the filesystem with artwork and people metadata, so that was (automatically) upgraded, but hey, it was a valiant effort.

Then I went to town on [the original plugin](https://github.com/JPKribs/jellyfin-plugin-livechannels?utm_campaign=unsolicited_traffic&utm_medium=web&utm_source=taoofmac.com) and decided to bolt on [Invidious](https://invidious.io/?utm_campaign=unsolicited_traffic&utm_medium=web&utm_source=taoofmac.com) as a YouTube source:

<img src="/space/notes/2026/08/08/1200/jellyfin-livetube-guide.jpg?v=70abc2aa0860" alt="Jellyfin LiveTube channel guide on a television" width="1280" height="960">Jellyfin LiveTube channel guide on a television

I call it [`jellyfin-livetube`](https://github.com/rcarmo/dotnet-jellyfin-livetube?utm_campaign=unsolicited_traffic&utm_medium=web&utm_source=taoofmac.com), and it’s been working pretty well–even the standard library-backed channels have been a surprising amount of fun (I ended up rewatching [Flash Gordon](https://www.imdb.com/title/tt0080745?utm_campaign=unsolicited_traffic&utm_medium=web&utm_source=taoofmac.com) purely by chance).

[

`wrdp`’s 15 Seconds of Fame
----------

](/space/notes/2026/08/08/1200#wrdp-s-15-seconds-of-fame)

Speaking of YouTube, [Wendell Wilson](https://twitter.com/@tekwendell?utm_campaign=unsolicited_traffic&utm_medium=web&utm_source=taoofmac.com) (hi there!) featured my new [`wrdp`](https://github.com/rcarmo/wrdp?utm_campaign=unsolicited_traffic&utm_medium=web&utm_source=taoofmac.com) project in [the latest Linux weekly video](https://www.youtube.com/watch?utm_campaign=unsolicited_traffic&utm_medium=web&utm_source=taoofmac.com&v=C9ZPOg8lK6o?is), which was fun to see (especially since I found out over breakfast while checking my messages, before coffee kicked in).

Right now it is *mostly* working, even though I am still waiting on a critical PR to make it into [IronRDP](https://github.com/Devolutions/IronRDP?utm_campaign=unsolicited_traffic&utm_medium=web&utm_source=taoofmac.com) to improve internal session management. But login and Wayland session creation both work, it’s all hardware-accelerated (both EGL desktop acceleration and VA-API video encoding), and… there are all sorts of edge cases to sort through.

I will be poking at it irregularly over the next few weeks–I want to do ARM/Vulkan acceleration next and set up two separate remote desktops I use “regularly”, but first I need a bit of digital detoxing, which is something I am very much failing at.

[

Moar Agents! Minis Agents! Moar
----------

](/space/notes/2026/08/08/1200#moar-agents-minis-agents-moar)

Because I was clearly left unsupervised and can’t really stop doing agent-related stuff, I went down the rabbit hole of setting up [Open Minis](/space/links/2026/07/20/2213#open-minis-is-the-ios-agent-i-wish-siri-ai-could-be) on my iPad Pro, and I did it in the most “me” way possible–I got it to connect to [Memento](https://rcarmo.github.io/projects/memento/?utm_campaign=unsolicited_traffic&utm_medium=web&utm_source=taoofmac.com) and “learn” from the accumulated knowledge of all my [`piclaw`](https://rcarmo.github.io/projects/piclaw/?utm_campaign=unsolicited_traffic&utm_medium=web&utm_source=taoofmac.com) agents, which is *awesome* because it proves two points:

* [Memento](https://rcarmo.github.io/projects/memento/?utm_campaign=unsolicited_traffic&utm_medium=web&utm_source=taoofmac.com) works *perfectly* for the purpose it was designed for.
* *It doesn’t matter* which agent harness you use as long as you document things properly.

Thirty minutes after I began, I already had most of the `SKILL.md` files and scripts ported across, and an hour later I had “native” equivalents to manage [Proxmox](/space/os/linux/distributions/proxmox#proxmox-ve) and [Portainer](/space/os/linux/docker/portainer) and was doing various shenanigans to generate and post screenshots along with my link post drafts, which these days are posted using the GitHub API directly (again, refactoring an existing `SKILL.md`).

I can now confirm that [Open Minis](/space/links/2026/07/20/2213#open-minis-is-the-ios-agent-i-wish-siri-ai-could-be) is, indeed, the Siri I have been wishing for. It’s by no means perfect, but with a SOTA model driving it, it can build its own tools, and… I really should stop now and go read a book or something.