+++
title = "Twenty-Four Years Of Wiki Engines"
description = "Yesterday morning I switched this site to its fourth major engine, a little over twenty years after sketching out the core idea behind it. The new generator is called sashimi, is written in Go, an"
date = "2026-08-02T11:30:00Z"
url = "https://taoofmac.com/space/blog/2026/08/02/1130?utm_content=atom"
author = "Rui Carmo"
text = ""
lastupdated = "2026-08-06T09:52:38.187500726Z"
seen = false
+++

Yesterday morning I switched this site to its fourth major engine, a little over twenty years after sketching out the core idea behind it. The new generator is called [`sashimi`](/space/notices/2026/08/01/1130#new-site-generator), is written in [Go](/space/dev/golang#go-lang), and runs almost entirely inside GitHub Actions–which is mildly amusing because the first [Sashimi](/space/blog/2006/06/15/1700#building-the-anti-wiki), in 2006, was also meant to batch-render this same filesystem tree using dependency tracking.

Reusing the name is… confusing, but it fits my overall theme, and the underlying concepts have held up rather well.

[

Always Has Been… a Wiki
----------

](/space/blog/2026/08/02/1130#always-has-been-a-wiki)

The site has always been a Wiki disguised as a blog, and I’ve been fortunate enough that its content has outlived every engine underneath it.

With this post, there are now 9,287 source pages: 6,640 in Markdown (after a ruthless campaign of LLM-assisted format conversion that converted around 3,000 while preserving the content verbatim) and 2,647 older files still containing a mix of Textile, raw HTML and assorted historical quirks, with images and other attachments stored alongside them.

[

PhpWiki (2002-2007)
----------

](/space/blog/2026/08/02/1130#phpwiki-2002-2007)

I’m still somewhat amazed that I hosted the site from home for around five years, running [PhpWiki](/space/dev/php/phpwiki). It was weird enough to run a conventional PHP Wiki backed by MySQL, but *I ran it on Windows NT* for at least part of that time (I forget exactly when) and I hacked its themes and plugins extensively.

But it was essentially an on-demand server–requests, rendering, editing and storage still went through an application and database stack, with varying degrees of caching.

![PhpWiki request, rendering and database architecture](/space/blog/2026/08/02/1130/phpwiki-architecture.svg?v=44f24d4b9e6c) Every PhpWiki page view traversed the web application and database stack.

In retrospect, it’s a wonder it worked at all, but it both spoiled me and made it obvious that a conventional CMS would never fit my needs. Around 2005 I decided to switch to [Python](/space/dev/python), and a year later started a thing (also called `sashimi`) to try to build a lighter, raw engine, but it never really went anywhere because I realized I could leverage [Snakelets](/space/dev/python/snakelets) to build a somewhat less half-baked solution.

[

Yaki (2007-2016)
----------

](/space/blog/2026/08/02/1130#yaki-2007-2016)

[Yaki](/space/projects/yaki) replaced the database with plain files, fixing my annoyances with [PhpWiki](/space/dev/php/phpwiki)’s versioning, database maintenance, and a bunch of other gripes (cof cof *[PHP](/space/dev/php)*). It was a dynamic [Python](/space/dev/python) Wiki engine running on [Snakelets](/space/dev/python/snakelets), with pre-rendered HTML, aggressive caching and a filesystem content store–all finely tuned for the days when this site lived on hardware where every megabyte and system call counted.

The biggest improvements for me were around ease of publishing–durable metadata moved to the filesystem, I could use “proper” markup, semi-automated Wiki links, backlinks, generated tables and feeds, and I had [Dropbox](/space/apps/dropbox) running on my VPS, so publishing was *instant*–I only needed to fire up `vim`, draft and save, and it would be indexed and go live as soon as the metadata allowed for it.

[Yaki](/space/projects/yaki) was the first engine where I decided that markup was *a second-class citizen*–I didn’t care what format content came in, since it was all rendered into HTML and transformed using an `lxml` pipeline into the finished page.

This not only made it possible to go *way* beyond the primitive [PhpWiki](/space/dev/php/phpwiki) plugin system, it also gave me full control over the output, allowing me to render tailored mobile content depending on what kind of browser visited the site. Yeah, remember [WML](/space/telco/wml) and [WAP](/space/telco/wap)?

But it also gave me proper full-text search and full control over HTTP caching, which became more and more important as I had to deal with the occasional [Slashdotting](/space/blog/2004/08/29#sunday-tidbits):

![Yaki indexing, pre-rendering, caching and request architecture](/space/blog/2026/08/02/1130/yaki-architecture.svg?v=9aa06a262939) Yaki separated indexing and pre-rendering from its fast cached request path.

Its biggest downside was that it accumulated enough custom rendering behaviour to make moving to a conventional static generator needlessly painful. For instance, I tried [Hugo](/space/blog/2018/05/31/2003#static-considerations) more than once, but its assumptions about content layout, images and markup never matched mine, largely because I am a staunch believer that a page is not just the markup but a bundle of the assets inside it, and the vast majority of site generators just dump images into an `assets` folder and never bother ensuring that you can reorganize your content logically.

In short, none of the static generators I tried could, ironically, really *scale* beyond a few thousand pages and still allow me to manage content sanely, And given the huge [content tree](https://taoofmac.com/static/graph?utm_campaign=unsolicited_traffic&utm_medium=web&utm_source=taoofmac.com) I had built over the years, I was not about to refactor thousands of pages just to fit someone else’s opinions about how a site should be structured.

It would always have been more work than maintaining the code I already had–especially since preserving URLs and permalinks dating back to 2002 is one of the few parts of this exercise I take *very* seriously.

So that never really happened.

[

Sushy (2016-2026)
----------

](/space/blog/2026/08/02/1130#sushy-2016-2026)

[Yaki](/space/projects/yaki) replaced [PhpWiki](/space/dev/php/phpwiki) in May 2007 and ran the site for nearly nine years. But in April 2016 I replaced it with [Sushy](/space/blog/2016/04/25/1400#some-breakage-may-ensue), initially written in [Hy](https://hylang.org?utm_campaign=unsolicited_traffic&utm_medium=web&utm_source=taoofmac.com) and deployed through [`piku`](https://github.com/piku/piku?utm_campaign=unsolicited_traffic&utm_medium=web&utm_source=taoofmac.com), to “fix” two things:

* First of all, CDNs were just not cutting it anymore. Maintaining a VPS is hardly economical when you get past a certain traffic volume, and 10GB and even 20GB outbound caps just weren’t cutting it.
* Second, I wanted to make `git` an integral part of the workflow, since [Dropbox](/space/apps/dropbox) did not provide decent versioning.

By this time the iPhone and Android had arrived, and the need for custom rendering was effectively zero. So I gradually went all-out on turning this into a vanilla HTML static site, with as little dynamic content as possible. This meant my nice photo galleries had to go as well, but to be honest most of my photography has become private (or social), so that wasn’t really an issue–but publishing long-form pieces and my (sometimes daily) link posts in a sane way still was.

Static publishing takes longer, and the original engine had grown around dynamic HTTP handling, local search, automatic redirects and years of plugin behaviour, while the content had accumulated enough special cases to make a clean rewrite unattractive.

By late 2020, however, running a public web process merely to serve mostly immutable HTML no longer made any sort of sense (the asymmetry between the compute needed to render and the compute needed to serve, in particular, was off the charts), so I just gritted my teeth and did it. [Sushy](/space/blog/2016/04/25/1400#some-breakage-may-ensue) made code and layout updates a `git push` away, shrank the engine considerably (yay LISP) and kept all the useful Wiki behaviour. [Hy](https://hylang.org?utm_campaign=unsolicited_traffic&utm_medium=web&utm_source=taoofmac.com) had kept changing underneath me and I got annoyed at the constant breakage, so by 2018 Sushy had become pure Python 3.

When I moved things over in [March 2021](/space/blog/2021/03/06/1130#living-the-static-life), it was mostly an ingenious hack that fit into a single file–I kept Sushy’s indexer and rendering logic but added a small static generator that ran the rest of the engine on demand and wrote directly to Azure Storage.

That was triggered via webhook and ran on a tiny VM, where a [SQLite](/space/db/sqlite) index determined which pages and backlinks had changed, and my `lxml` engine rendered and uploaded only that delta. It usually published in under ten seconds and ran happily for over five years, which is not bad for what began as a bolt-on:

![Sushy dynamic and static publishing eras](/space/blog/2026/08/02/1130/sushy-architecture.svg?v=59c8b95bf712) Sushy reused the same core while moving from dynamic serving to static delta publishing. [

`sashimi` (2026-)
----------

](/space/blog/2026/08/02/1130#sashimi-2026)

However, I had three remaining annoyances:

* Maintenance overhead (I still had to run a server/container to do the static rendering and uploading)
* Security (I have been painstakingly removing every single public endpoint from my services, and the GitHub webhook was pretty much the last one)
* Speed, especially when doing large layout changes (the engine had grown to a point where it was no longer trivial to parse and render thousands of pages in a single run).

[Python](/space/dev/python) was perfectly adequate for incremental updates, but parsing and rebuilding more than 9,000 pages was taking forever and made layout changes slow, not to mention that the old code still carried assumptions inherited from all the (by now ancestral) engines that had once served pages dynamically.

I started a TypeScript port on [`bun`](/space/notes/2025/11/16/1800#notes-for-november-1-16) in late 2025 and got surprisingly far, but [Go](/space/dev/golang#go-lang) proved a much better target and allowed me to have *very* fast `lxml`-like transforms, preserving most of the logic and parallelizing it effectively.

Since around that time I began porting other tools with test-driven AI assistance, the next logical step was to follow [my usual TDD workflow](/space/blog/2026/03/08/2130#so-you-want-to-do-agentic-development): the content tree itself became the test suite, with thousands of real pages covering Markdown, Textile, raw HTML, malformed legacy markup, plugins, tables, images and every strange Wiki-linking rule I had accumulated.

And since [Go](/space/dev/golang#go-lang) is not that far away from the way I write [Python](/space/dev/python), the first working Go core took only a couple of hours.

Of course, after that quick port I had to spend months making it render *everything* correctly. Unit tests could cover parsers and individual transformations, but visual parity needed a different approach.

[`piclaw`](https://github.com/rcarmo/piclaw?utm_campaign=unsolicited_traffic&utm_medium=web&utm_source=taoofmac.com) and Codex built a harness that sampled pages, rendered them with both [Python](/space/dev/python) and [Go](/space/dev/golang#go-lang), and generated [visual diffs](/space/notes/2026/06/28/1200#notes-for-june-21-28), making spacing, typography and structural regressions obvious without my having to inspect thousands of screenshots–the LLM figured out that just counting red pixels in an otherwise monochrome visual diff was a great proxy for rendering accuracy, and I just ran with that.

By late June, [`sashimi` was producing a complete staging site](/space/notes/2026/06/28/1200#notes-for-june-21-28) inside GitHub Actions with near-total parity and incremental builds measured in seconds.

[

### Rube Goldberg Actions ###

](/space/blog/2026/08/02/1130#rube-goldberg-actions)

The trick I use now will be familiar to anyone who uses durable objects (or functions, or workflows), and it relies mostly on clever GitHub Actions asset caching.

A push to `master` now starts a planner that separates content changes from static assets, builds the [Go](/space/dev/golang#go-lang) binary if needed, restores the indexed state (which is cached as a [SQLite](/space/db/sqlite) artifact) and computes the affected pages before and after updating the dependency graph.

That last “after” bit is important, since it catches former backlinks as well as new ones–since all my pages have backlinks, removing a link is still a change to the page that used to receive it, and that `href` has to go.

The workflow then renders only the required pages (plus a small fixed set of global outputs like the homepage and Atom feed), uploads the resulting delta to Azure Storage and purges the corresponding Cloudflare URLs:

![Sashimi GitHub Actions publishing workflow](/space/blog/2026/08/02/1130/sashimi-actions-workflow.svg?v=d16eec6a0c1f) The current workflow separates page and asset changes before applying both deltas to storage.

It also takes pains not to abuse the Actions subsystem, with copious caching and cleanups–and since on average I do *less* than one commit a day, it’s actually more efficient overall than having a VM sitting around waiting for a webhook to land.

I also get a few “forward looking” side benefits out of this arrangement:

* Both content and engine now live in the same monorepo, which makes it easier to test things locally
* I can run *exactly* the same thing locally (by hand) or in [Gitea](/space/apps/gitea), which means I am not really tied to [GitHub](https://github.com/?utm_campaign=unsolicited_traffic&utm_medium=web&utm_source=taoofmac.com) (the Actions hackery is completely transferable)
* I can upload my content literally *anywhere*–migrating from Azure Storage to any other blob storage (like Cloudflare’s R2) is pretty much trivial, since I made it a point to ensure the renderer generates a delta manifest to pipe into a generic uploader (which knows nothing about the rest of the engine)
* I can port the whole thing to durable runtimes like Azure Functions or Cloudflare Workers if the need arises (although I don’t really want to–nothing beats a hot CPU core with direct I/O to the markup).

So I expect this setup to last me quite some time.

[

Post-Migration
----------

](/space/blog/2026/08/02/1130#post-migration)

There is still quite a bit of cleanup to do, though–everything from trivia like site credits, FAQ, footer and other places around the site still need updating to reflect the new arrangement, and the cutover broke a few things: legacy gallery assumptions, missing assets on indirectly affected pages, year-long CSS caches and a few Atom formatting things I forgot about.

For instance, I insist on inlining table formatting in Atom feeds for readability, as well as image dimensions, and visual diffs weren’t covering that. Although regular posting for a month exposed some of those bugs in staging, I still missed quite a few corner cases.

And I’m definitely going to review [the 3D graph](https://taoofmac.com/static/graph?utm_campaign=unsolicited_traffic&utm_medium=web&utm_source=taoofmac.com) as well–it’s about time I made it easier to render on low-end hardware.

But the fun part is that after twenty years, the machinery is still very close to what I described in 2006: a filesystem tree, a dependency graph and a batch renderer that produces static HTML and feeds before tossing them out into the Internet more or less adroitly, even if only held together with Wiki links and duct tape.

And I somehow got back to [raw fish](/space/projects/sashimi), even though I still have some [weird ideas](/space/projects/tempura) I might revisit some day.

[Go](/space/dev/golang#go-lang) figure, right?