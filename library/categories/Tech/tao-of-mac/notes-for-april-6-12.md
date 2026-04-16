+++
title = "Notes for April 6-12"
description = 'Thanks to a bit of spillover from Easter break, this was a calmer, more satisfying week where I could actually get stuff done and even have a bit of fun.<img alt="My idea of fun, apparently, is to do 3D visualizations in piclaw" src="https://taoofmac.com/media/notes/2026/04/12/17'
date = "2026-04-12T17:00:00Z"
url = "https://taoofmac.com/space/notes/2026/04/12/1700?utm_content=atom"
author = "Rui Carmo"
text = ""
lastupdated = "2026-04-15T10:42:49.390884153Z"
seen = true
+++

Thanks to a bit of spillover from Easter break, this was a calmer, more satisfying week where I could actually get stuff done and even have a bit of fun.

<img alt="My idea of fun, apparently, is to do 3D visualizations in piclaw" src="https://taoofmac.com/media/notes/2026/04/12/1700/SaT1uVe8kVrbx0ni3kbPwykAGWE=/piclaw-3d-visualization.png" width="2040" height="1210" style="max-width: 100% !important;height: auto !important;">My idea of fun, apparently, is to do 3D visualizations in piclaw

[](/space/notes/2026/04/12/1700#getting-organized)

[Getting Organized](/space/notes/2026/04/12/1700#getting-organized)
----------

Now that [`piclaw`](https://github.com/rcarmo/piclaw?utm_source=taoofmac.com&utm_medium=web&utm_campaign=unsolicited_traffic&utm_content=external_link) is in cruise mode, I’ve started focusing on actually *using it*.

So I created an instance called Flint, which manages not only my [Obsidian](/space/apps/obsidian) vault but also all of my personal pursuits and most of my homelab: I gave it the API tokens for my [Proxmox](/space/os/linux/distributions/proxmox) cluster and [Portainer](/space/os/linux/docker/portainer), and over the past week it’s been busy:

* It re-tagged most of my notes and drafts (as well as adding reference URLs for ongoing drafts), quizzing me on what to do with specific notes as it went
* It rebuilt and redeployed my GPU `sandbox` (which I broke last week): recreated the VM, mounted the Ubuntu ISO, prompted me to run the installer, and installed the latest NVIDIA drivers, `nvidia-docker` and a baseline set of utilities.
* I then asked it to look at the [Portainer](/space/os/linux/docker/portainer) stacks in my `gitea` instance, my [Obsidian](/space/apps/obsidian) notes, and what needed to be set up, and it installed the [Portainer](/space/os/linux/docker/portainer) agent and brand new versions of the stacks with tweaked network and volume settings, updated my notes, and upgraded the pinned image versions (troubleshooting as it went).
* It developed and published an [OPDS server](https://github.com/rcarmo/bun-opds?utm_source=taoofmac.com&utm_medium=web&utm_campaign=unsolicited_traffic&utm_content=external_link) and an [EPUB read later service](https://github.com/rcarmo/bun-epub?utm_source=taoofmac.com&utm_medium=web&utm_campaign=unsolicited_traffic&utm_content=external_link) so I can fetch interesting web pages and read them later on the [XteInk X4](https://xteink.com/?utm_source=taoofmac.com&utm_medium=web&utm_campaign=unsolicited_traffic&utm_content=external_link), including monitoring the CI pipeline and redeploying the containers
* It audited [my Cudy OpenWRT config](/space/os/linux/distributions/openwrt) and set up centralized stats collection in [Graphite](/space/apps/graphite), which I had been meaning to do for ages (and I intend to have it set up [Telegraf](https://www.influxdata.com/time-series-platform/telegraf/?utm_source=taoofmac.com&utm_medium=web&utm_campaign=unsolicited_traffic&utm_content=external_link) on other machines to collect metrics).

So far, Flint is a resounding success (it’s using GPT-5.4, a fairly sensible and stable model), but it doesn’t just do notetaking and operations.

[

Site Hackery
----------

](/space/notes/2026/04/12/1700#site-hackery)

Flint has also become quite useful to help me tidy up my workflow—I was already using a [`piclaw`](https://github.com/rcarmo/piclaw?utm_source=taoofmac.com&utm_medium=web&utm_campaign=unsolicited_traffic&utm_content=external_link) instance to convert ancient [Textile](/space/markup/textile) and raw HTML posts into [Markdown](/space/markup/markdown) in batches, but there are a few things that have been nagging at me for years and that I can finally make significant progress on:

* Adding links to my resource pages
* Drafting link blog entries
* Streamlining static site builds

I’ve had [Shortcuts](/space/apps/shortcuts) to do the first two for ages, but they both relied on adding bits of text to Reminders that were then post-processed and added to `git` using either the CLI or [WorkingCopy](https://workingcopy.app/?utm_source=taoofmac.com&utm_medium=web&utm_campaign=unsolicited_traffic&utm_content=external_link). That worked OK for a while, but my iPad mini’s increasing slowness has made them quite frustrating, especially since I tend to do that kind of quick posting over breakfast and it was taking up too much time.

As it happens, GitHub has [a REST API for Git Trees](https://docs.github.com/en/rest/git/trees?apiVersion=2026-03-10&utm_source=taoofmac.com&utm_medium=web&utm_campaign=unsolicited_traffic&utm_content=external_link), and what that means in practice is that I can update a JSON changeset with these minor changes, let it accumulate over breakfast, and then apply them in batches–or, rather, have Flint do that, with all the guidance and steps in a `SKILL.md` file.

So my new breakfast workflow is to just send links to Flint using the iOS sharing pane or a bookmarklet (still experimenting with both), have it create a JSON changeset for links, and occasionally ask it to screenshot a page and create a blank Markdown document for linkblog posts. That is pre-filled with a title, likely tags and the appropriate image reference, and I just pop open the built-in editor tab in [`piclaw`](https://github.com/rcarmo/piclaw?utm_source=taoofmac.com&utm_medium=web&utm_campaign=unsolicited_traffic&utm_content=external_link), finish the post and ask it to add the files to the changeset and post them via the API.

So far, it’s been going swimmingly: zero `git` fetches/commits/pushes, all handled server side, and very little friction–*and* it works on my iPad mini, albeit still slowly.

[

A New Hope
----------

](/space/notes/2026/04/12/1700#a-new-hope)

Another thing I’ve been working on is porting the [Python](/space/dev/python) site builder to [Go](/space/dev/golang) for both speed and maintainability—the current codebase has some 20-year old hangovers that I wanted to get rid of, and some kind of reset has been long overdue, so I have been slowly poking at this for the past few months.

As it happens, the overall indexing and rendering process was pretty trivial—the real challenge has been to make sure that it looks *exactly the same*, especially given that my engine has some pretty specific Wiki-linking rules and I’ve accumulated a bunch of rendering helpers and custom plugins over the years.

Plus everything related to HTML rendering has changed: parsing, link resolution, templating, the works. And that’s enough to juggle already, so I don’t want to change the front-end design at all (yet).

I decided to be ambitious and aim for full rendering parity. So what did my little army of AI helpers do?

It converged on doing *visual diffs* out of random sampled pages: Take a locally rendered version, look at the public page, and generate an image that it can easily rate as “close” or “broken” by just counting the ratio of red pixels:

<img alt="This is both brilliant and scary at the same time" src="https://taoofmac.com/media/notes/2026/04/12/1700/gQWQkx4YNonfUJ6IAAhi7dz6LUc=/visual-diff-comparison.png" width="1528" height="1382" style="max-width: 100% !important;height: auto !important;">This is both brilliant and scary at the same time

The process is greatly streamlined: sample 100 pages out of the nearly 10,000 we have now, render, batch compare, show me the worst ones, and then discuss and generalize the fixes (which is the only part the LLM is actively involved in). I could probably use [`autoresearch`](https://github.com/karpathy/autoresearch?utm_source=taoofmac.com&utm_medium=web&utm_campaign=unsolicited_traffic&utm_content=external_link) to automate this, but some of the fixes have to do with legacy rendering logic that no AI could ever figure out.

Still, this has converged very quickly to minor typography and spacing differences, and once I’m happy with the engine I’ll start looking at optimizing the actual blob uploading part–which I aim to standardize via `rclone` to remove my current dependency on [Azure](/space/com/microsoft/azure) storage accounts, but greatly optimize with deltas.

[

Remember, AIs Are Still Dumb
----------

](/space/notes/2026/04/12/1700#remember-ais-are-still-dumb)

It turns out that if you tell an AI that empty `catch` blocks are forbidden, the thing will just… go and add comments inside them, instead of doing something useful like a warning log message…

I’m now doing another code audit pass over the entire [`piclaw`](https://github.com/rcarmo/piclaw?utm_source=taoofmac.com&utm_medium=web&utm_campaign=unsolicited_traffic&utm_content=external_link) codebase, and this kind of mechanical fix is trivial to set up and do reliably with [`autoresearch`](https://github.com/karpathy/autoresearch?utm_source=taoofmac.com&utm_medium=web&utm_campaign=unsolicited_traffic&utm_content=external_link):

<img alt="An autoresearch session doing a code audit pass" src="https://taoofmac.com/media/notes/2026/04/12/1700/9iRdjZ89ILYVPuTFXlZ4v-SLkjo=/autoresearch-code-audit.png" width="1756" height="838" style="max-width: 100% !important;height: auto !important;">An autoresearch session doing a code audit pass

Now to see if I can get some reading and 3D printing done as well, since the whole point of using AI in the first place was to have more free time… right?