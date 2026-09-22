+++
title = "Oldnets and Altnets: A Guide to Building a Low-Spec Daily Internet Out of Gemini, Gopher, and Terminal Tools"
description = "Reacting to the Omarchy and DigitalOcean news, I set out a curated low-spec, text-first alternative to the modern web: Gemini, Gopher, Spartan, Lynx-friendly sites, terminal readers, public Unix communities, and peer-to-peer networks like Yggdrasil, I2P, and Hyphanet."
date = "2026-09-10T02:00:00Z"
url = "https://brennan.day/oldnets-and-altnets-a-guide-to-building-a-low-spec-daily-internet-out-of-gemini-gopher-and-terminal-tools/"
author = "mail@brennanbrown.ca (Brennan Kenneth Brown)"
text = ""
lastupdated = "2026-09-21T09:42:43.419817912Z"
seen = false
+++

With news of [DigitalOcean deciding to give $3 million dollars to Omarchy and DHH](https://omarchy.org/news/2026/09/digitalocean-joins-as-founding-corporate-patron/), I thought it would be fitting to once again take a look at alternative visions of what our Internet can be.

For after writing about the Internet *on the Internet* for almost an entire year straight, I think I need a change. The IndieWeb is wonderful, and I'm so thankful for the viable, well-populated people-oriented alternatives that exist to replace nearly all facets of corporate social media—but I would be lying if I said this version of the Internet wasn't without its own flaws, too.

Our Internet is cluttered, bloated with complex systems and scripts for the sake of visual interest, interactivity, and social engagement. I am no better myself, for even my own website, [Brennan.day](https://brennan.day), which could be pared down to only a list of plain-text essays, is full of unnecessary additional functionality and styles which would cause it to load slowly on older or lower-powered devices.

With this complexity comes reliance on systems created by others as well. Mastodon, the most successful and popular decentralized social networking and microblogging platform, is a ["a Ruby on Rails application with a React.js front-end."](https://docs.joinmastodon.org/dev/overview/) RoR being the [product created by DHH](https://brennan.day/normalized-fascism-in-open-source-12-million-given-to-dhh/), and React being the [product created by Meta](https://www.aljazeera.com/features/2026/8/27/metas-18bn-settlement-how-social-platforms-will-change-for-child-users).

As someone who never used a microblogging social network service prior to signing up for [social.lol](https://social.lol) on the [Fediverse](https://jointhefediverse.net/?lang=en-us), I have to say that I love Mastodon. I've already [made over 1,000 posts](https://social.lol/@brennan) and follow over 1,500 accounts which gives me a busy but high-quality feed thanks to the wonderful curation of [Fedi Directory](https://fedi.directory/). And it would be a massive undertaking to change the stack which Mastodon uses.

But I'll point out that there are alternatives, such as [Misskey](https://misskey-hub.net/en/), which uses ["Node.js. TypeScript is used on both the frontend and backend. PostgreSQL is used as its database. Vue.js is used for the frontend."](https://kai-you.net/article/86094).

Really, though, I want to distance myself from the entire paradigm of these complex technical stacks, the boiling-frog Internet that cleverly uses HTML, CSS, and (mostly) JavaScript to build things on top of the same technologies which have existed for decades.

I think of Orson Welles, who wrote "if you give somebody constraints, it's easier to be creative." And I believe that is exactly what I need. Constraint.

I've written before about [Gemini](https://brennan.day/gemini-gophers-and-fingers-oh-my-alternative-internets-beyond-https/) and alternative Internets, I've set up a [smolpub](https://smol.pub) and a gemini-only [tilde.pink](https://tilde.pink) account. I've configured one of my ThinkPads to be terminal-only with [no desktop environment or graphical user-interface](https://brennan.day/i-would-have-written-a-shorter-blog-post-but-i-didn-t-have-the-time-creating-a-writerdeck/), but I still haven't reached where I want to go.

It's easy to set up an old machine to be offline-only, and it's also easy to set up a headless Linux distro. It's much harder to make such a limited device your daily driver, let alone being the exclusive device you use.

This is where I realize I want to journey towards: the fraction of the Internet that will not only load but function well on low-end, cheap hardware paired with lean, modern software.

I have the hardware, and I know the software and tools required for this. The main issue is curation, and the lack of other participants. It's wonderful that we have the choice to use these alternative protocols, and that software exists to interface with them for all desktop operating systems, but the problem of discovery remains. Therefore, I need to research and make lists, and I am on a journey to collect anything that falls within the following:

* Interesting and recently updated websites using alternative protocols, including [Gemini](https://geminiprotocol.net/) capsules, [Gopher](https://cheapskatesguide.org/articles/gopherspace.html) holes, [Spartan](https://portal.mozz.us/spartan/spartan.mozz.us/) servers, and similar protocols
* Sites on the [Yggdrasil network](https://yggdrasil-network.github.io/)
* Websites that display well in the [Lynx](https://lynx.invisible-island.net/) text browser
* Plain-text, text-only websites
* Any and all terminal-based programs

There are also other peer-to-peer networks and protocols I'm interested in and don't know a lot about, including the [Invisible Internet Project](https://i2p.net/en/), the [Lokinet](https://lokinet.org/), the [Hyphanet](https://www.hyphanet.org/index.html), and the [GNUnet](https://www.gnunet.org/en/index.html). I want to emphasize I'm not interested in the privacy or security of these networks (although that certainly is important, please don't get me wrong) but rather the low-spec, accessible nature of them.

What I Found [](#what-i-found)
----------

A useful low-spec Internet already exists, but it's scattered across several ecosystems. There are **Gemini and Gopher aggregators**, **server-rendered discussion sites**, **plain-text libraries**, **terminal readers**, and **public Unix communities**. These resources are practical as they minimize page weight, reduce client-side dependencies, or expose content directly as text.

The most immediately usable route is a layered one. For ordinary HTTP(S), I use a text browser like **[Lynx](https://lynx.invisible-island.net/)**, for RSS and Atom, **[Newsboat](https://newsboat.org/)**, for Gemini, a client such as **[Lagrange](https://gmi.skyjake.fi/lagrange/)**, and for Gopher, either a native client or **[Floodgap's Gopher proxy](https://gopher.floodgap.com/gopher/)**. Add a public shell community such as **[SDF](https://sdf.org/)** and your machine becomes a social and publishing tool.

And there's activity in these places! CAPCOM showed Gemini entries dated 2026-09-09, and the Gemini BBS had posts from hours earlier. Midnight Pub lists a 2026-09-09 post, Bongusta aggregated Gopher posts from 2026-09-08, and Bitreich's news was dated 2026-09-04. I checked pages and selected native endpoints on 2026-09-09. The Gemini checks returned successful Gemini status `20`; the Spartan check returned status `2`; and selected Gopher endpoints returned menus over TCP port 70.

**[Stéphane Bortzmeyer's Lupa crawler](https://gemini.bortzmeyer.org/software/lupa/)** recently counted 5,218 known capsules, of which 3,548 were reachable, serving up around 717,000 pages of Gemtext between them. Veronica-2's most recent index of Gopherspace put it at 411 active servers and just under 5.9 million unique selectors as of January 2026.

The limitation is not that these networks are empty. Rather, it is that they are small, intermittently maintained, and hard to find without indexes, and hosting is ironically rather centralized: Flounder, Yesterweb, and Smol Pub alone account for something like 60% of all reachable Gemini capsules. This is exactly why we need more **curation, feed-making, and clear status labeling**.

**⚠️ Important note:** After I first published this piece, a reader wrote in to say that Bitreich and [suckless.org](http://suckless.org) are "absolutely fash-oriented, if not openly neo-Nazi," pointing to torch-lit processions and "old German folk tunes" sung at their annual congress. They also noted that a significant number of the USians active in Gopher lean far-right more broadly.

Small, low-bandwidth, technically-constrained spaces are absolutely not inherently virtuous just because they reject the mainstream Internet. Constraint and simplicity can just as easily be used to build a clubhouse that keeps people out as one that lets people in. If you go looking in Gopherspace (or IRC, or any of the other corners in this list), go in with your eyes open, and please tell me if you run into the same thing. This is the labelling I meant when I said discovery needs "ongoing human curation."

Gemini, Gopher, Spartan, and Similar Protocols [](#gemini-gopher-spartan-and-similar-protocols)
----------

**[Project Gemini](gemini://geminiprotocol.net/)** is the canonical protocol documentation, still led by its pseudonymous creator [Solderpunk](https://brennan.day/gemini-gophers-and-fingers-oh-my-alternative-internets-beyond-https/). **[Gemini Quickstart](gemini://geminiquickst.art/)** is the onboarding guide and directory for newcomers, built and maintained by Jason McBrayer since 2021; an [HTTPS mirror](https://geminiquickst.art/) is available if you don't have a native client yet.

**[CAPCOM](gemini://gemini.circumlunar.space/capcom/)** was the very first Gemini feed aggregator, written by Solderpunk himself and modeled directly on the Gopher phlog aggregator Bongusta below. It's currently aggregating 76 Atom feeds, and it randomly rotates 100 URLs into its output each month, so you're not guaranteed to see the same capsule twice; an HTTPS portal exists at [portal.mozz.us](https://portal.mozz.us/gemini/gemini.circumlunar.space/capcom/).

**[Gemini BBS](gemini://bbs.geminispace.org/)** provides participation rather than only reading, with discussion, microblogging, and issue tracking, all running on Jaakko Keränen's (of Lagrange fame) software called Bubble. You register with a TLS client certificate instead of a password, and as of a 2025 survey, about 100 people post or comment there every month.

**[Midnight Pub](gemini://midnight.pub/)** is small-scale personal publishing with a human-scale social feel, run by m15o since roughly 2020 as a "virtual pub." Every member gets their own `username.midnight.pub` homepage. While there's no way to post directly over Gemini yet (Gemini's URI length limits make long posts awkward), there's a shell script called `midnight.sh`. The publishing interface is at [speakeasy.midnight.pub](https://speakeasy.midnight.pub).

**[Kennedy](gemini://kennedy.gemi.dev/)** provides discovery, historical snapshots, backlinks, and health information, built by acidus99 using the same architecture ideas as early web crawlers like Mercator and the Internet Archive. It has a "Delorean Time Machine" (basically a Wayback Machine for Geminispace), a capsule-health report, a certificate validator, and backlink lookup.

The **[Spartan homepage](spartan://spartan.mozz.us/)** is a simple sibling protocol combining ideas from Gemini, Gopher, and HTTP, designed by Michael Lazar. It sends plain ASCII requests over TCP on port 300 (referencing the 300 Spartans of Thermopylae) and it uses Gemtext as its default document format, with only four single-digit status codes. Check out the [repository](https://github.com/michael-lazar/spartan).

**[Veronica-2](gopher://gopher.floodgap.com/1/v2)** makes search possible in a distributed menu-based network, and is the only Veronica search engine still operating, run by Cameron Kaiser at Floodgap. Its welcome page claims coverage of roughly 5.1 million selectors, about 80% of all of Gopherspace by Floodgap's own estimate; an HTTPS gateway is at [Floodgap Veronica-2](https://gopher.floodgap.com/gopher/gw?gopher.floodgap.com/1/v2).

The **[Floodgap World directory](gopher://gopher.floodgap.com/1/world)** lists servers and crawler-derived activity information. Kaiser has run Floodgap since around 1999–2000 (it started life as `gopher.ptloma.edu`), and the public proxy alone reportedly handles over 26 million requests a year. An [HTTPS gateway](https://gopher.floodgap.com/gopher/gw?gopher.floodgap.com/1/world) is available.

**[SDF Gopherspace](gopher://sdf.org/1/)** connects shell access, personal Gopherspace, phlogs, and community tools. SDF, the Super Dimension Fortress, has run continuously since 1987, when Ted Uhlemann started it as an anime-themed BBS on an Apple IIe. Its historical society reports over 707,000 accounts created across 36 years. The [SDF homepage](https://sdf.org/) exposes shell, Gopher, SSH, telnet, IRC, and Git services.

**[Bongusta](gopher://i-logout.cz/1/bongusta/)** is a current stream of distributed Gopher writing, written in Perl since summer 2017 by the operator of [i-logout.cz](http://i-logout.cz). The name is Esperanto for "tasty, luscious, palatable," and it currently aggregates around 85 active phlogs, pruning ones that have gone quiet and only adding new writers once they've kept it up for about three months.

**[gopher.black](gopher://gopher.black/1/)** shows Gopher's expressive side through fiction, recipes, games, interactive writing, and a book-review search.

**[Gopherpedia](gopher://gopherpedia.com/1/)** is a Wikipedia-style reference through a low-bandwidth menu and search interface, created by Colin Mitchell and released in June 2013. At launch, Mitchell claimed it was probably the largest gopher site in existence, at roughly 4.2 million pages and over 10 GB. An HTTPS gateway is at [Gopherpedia](https://gopher.floodgap.com/gopher/gw?gopherpedia.com/1/).

**[quux.org archive](gopher://gopher.quux.org/1/)** preserves software, books, Internet history, and other collections. It's run by John Goerzen, who registered the domain in 2000 specifically to host "obscure old technology" under an "obscure old name"—RFCs, Project Gutenberg mirrors, Kermit, old operating systems, even a mirror of Usenet posts from 1981.

Lynx-Friendly and Plain-Text Web Resources [](#lynx-friendly-and-plain-text-web-resources)
----------

**[Lynx](https://lynx.invisible-island.net/)** is the direct tool for browsing HTML without a graphical interface, and it's often called the oldest web browser still under active maintenance. Lou Montulli, Michael Grobe, and Charles Rezac built it in 1992 at the University of Kansas as a campus hypertext and Gopher browser; today it's maintained by Thomas Dickey, with the most recent stable version at 2.9.3.

**[Hacker News](https://news.ycombinator.com/)** is server-rendered stories and comments that remain useful on a terminal (news and discussion). Rather infamous now, Paul Graham launched it in February 2007 as "Startup News" to road-test Arc, the Lisp dialect he co-created; the server-side code is still written in Arc today.

**[Lobste.rs](https://lobste.rs/)** offers compact story listings, tags, and comments without a mandatory JavaScript application (technology discussion). Joshua Stein launched it in 2012, with no JavaScript for logged-out visitors and minimal CSS that works in old and experimental browsers alike.

**[CBC Lite](https://www.cbc.ca/lite/)** is a lighter Canadian and world news interface (low-bandwidth news), built for the more than one million Canadians without high-speed Internet access.

**[68k News](https://68k.news/)** is a headline/source stream that is practical on constrained hardware (a text-first headline aggregator). It's built by Sean of the YouTube channel Action Retro, marketed with the tagline "Headlines from the Future," and rendered to load on a Mac SE/30 running Netscape from the 1990s. Sadly, a reader ,let me know that click-through has been broken for a while now. I confirmed it myself with `curl`, and every article link routes through `article.php?a=` to a Google News RSS redirect, which the site then tries to scrape with its Readability port and fails on ("Failed to get the article 😦 Sorry - working on it!"). Headlines still load fine but you can't read full stories.

If you want something that works, **[plaintext.report](https://plaintext.report/)** and **[PlaintextHeadlines](https://plaintextheadlines.com/)** are both replacements. Rather than proxying through Google News, they link to the publisher's own URL, so `curl -L` (or any browser) You can use the following command:

```
curl -L --max-time 15 -o /dev/null -w "%{http_code} %{url_effective}\n" https://plaintext.report/

```

and then follow any headline link the same way.

**[FrogFind](https://frogfind.de/)** adapts search results for old browsers and low-resource systems (a vintage-computer search). Also from Sean/Action Retro, it strips DuckDuckGo results and article pages down through a PHP port of Readability, stripping out ads and JavaScript, allowing pages to render on ancient browsers.

**[Marginalia old interface](https://old-search.marginalia.nu/)** offers an older layout for text-browser users and surfaces small-web material (a non-commercial search). It's an independent, open-source search engine built and run solo by Viktor Lofgren in Sweden, with no investors or loans, deliberately favouring text-heavy, non-commercial pages over mainstream web design.

**[Wiby](https://wiby.me/)** has sparse search and "surprise me" discovery to support exploration of simpler pages (a small-web search). Built by the pseudonymous developer wibyweb in 2018, it relies on human submissions rather than crawling the whole web.

**[SourceHut](https://sourcehut.org/)** provides Git/Mercurial hosting, mailing lists, CI, wikis, and static hosting without a mandatory JavaScript front end (a software forge). Drew DeVault opened it to public alpha in November 2018 after two years of private development. A typical page loads at around 57 KB, versus roughly 780 KB for a comparable GitHub page.

**[Project Gutenberg text edition](https://www.gutenberg.org/files/1342/1342-0.txt)** is a direct text book that can be downloaded, searched, cached, and read with a pager (a plain-text book). Michael Hart founded the project in 1971 by typing the U.S. Declaration of Independence into a university mainframe. The catalogue now holds nearly 78,000 free ebooks. The main catalogue is at [gutenberg.org](https://www.gutenberg.org/).

**[RFC Editor text edition](https://www.rfc-editor.org/rfc/rfc9110.txt)** provides durable technical documents without HTML rendering requirements (a plain-text standards reference). The RFC series dates to April 1969 and Steve Crocker's RFC 1, written to help design the ARPANET, and it's been the internet's archival technical record ever since. Text-only download help is at the [RFC download page](https://www.rfc-editor.org/series/rfc-download/).

**[TEXTFILES.COM](http://www.textfiles.com/)** is a large cultural archive of ASCII art, BBS material, mailing lists, and historical text (an ASCII and BBS archive). Jason Scott has run it since 1998 to preserve text files from the 1980s BBS scene, and by 2017 it was drawing 350,000 to 450,000 unique visitors a month.

**[Online Books Page](https://onlinebooks.library.upenn.edu/)** is a searchable catalog of free books, authors, subjects, and serials (a free-book index). John Mark Ockerbloom started it in 1993 while a student at Carnegie Mellon, and it moved to the University of Pennsylvania in 1999, now indexing more than 3 million titles.

**[Low-tech Magazine solar site](https://solar.lowtechmagazine.com/about/)** is a visible example of designing a publication around limited energy and offline reading (an energy-conscious publication). Kris De Decker launched it in September 2018, running on a tiny board that draws one to two and a half watts off a 30-watt solar panel and lead-acid battery. The page background shifts from yellow to blue as the battery drains, and the site goes dark below 12 volts, until the sun comes back. The offline-reading guide is at [solar.lowtechmagazine.com/offline-reading](https://solar.lowtechmagazine.com/offline-reading/).

**[txt.fyi](https://txt.fyi/)** is a constrained publishing form for text-oriented pages (plain-text micro-publishing), created by Boing Boing co-editor Rob Beschizza. There are no accounts, comments, likes, analytics, or search indexing. The only way anyone finds your post is if you link yourself.

**[DuckDuckGo HTML](https://html.duckduckgo.com/html/?q=low+bandwidth+web)** provides search results, forms, URLs, and snippets that work without the graphical interface (a text search endpoint). There's an even lighter version at [lite.duckduckgo.com](https://lite.duckduckgo.com).

Terminal-Based Programs and Services [](#terminal-based-programs-and-services)
----------

**[Newsboat](https://newsboat.org/)** turns the open Web into a local, keyboard-driven reading queue and avoids repeatedly loading heavy homepages (an RSS/Atom reader). It's a fork of Andreas Krennmair's Newsbeuter by Alexander Batischev when Newsbeuter was abandoned in September 2017.

**[Lagrange](https://gmi.skyjake.fi/lagrange/)** is a compact client with a curses interface and multi-protocol support (a Gemini/Gopher reader). Jaakko Keränen built it starting in 2020; besides Gemini, Gopher, and Finger it can play inline audio, view images, and hold TLS client certificates for sites like Gemini BBS above, and there's a terminal-only build called `clagrange`.

**[Lynx](https://lynx.invisible-island.net/)** is mature, portable, and appropriate for reading rather than rendering visual design (an HTTP text browser). Several of its original 1992 contributors went on to work at Netscape.

**[w3m](https://github.com/tats/w3m)** supports text browsing and is widely packaged on Unix-like systems (a terminal web browser). Akinori Ito built it in Japan around 1995 as a successor to his earlier pager `fm`—the name is short for "WWW wo miru," or "to see the WWW." It can also run inside Emacs as `emacs-w3m`.

**[ELinks](https://elinks.or.cz/)** is a featureful text browser for HTML, forms, and links (a terminal browser). It began in late 2001 as Petr Baudiš's fork of Mikuláš Patočka's Links browser, the E standing for "Experimental."

**[Bombadillo](https://github.com/aaronjanse/bombadillo)** is designed for Gemini, Gopher, Finger, and related text-first browsing (a terminal client for small protocols). It's built by Sloum on tildegit, calls itself a "non-web browser," treats Gopher as its default protocol, and collects no telemetry or history of its own.

**[Offpunk](https://offpunk.net/)** is an offline-first Gemini/Gopher/Spartan/Web/RSS client. Written by [Ploum](https://ploum.net) as a friendly fork of Solderpunk's AV-98, it caches everything you visit as plain `.gmi`/`.html` files under `~/.cache/offpunk/`. There's no database, so the cache can be edited or scripted with other tools. You can sync hourly or daily and then read, follow links, and subscribe to RSS/Atom feeds entirely offline; anything you try to open that isn't cached just gets queued for the next sync.

**[wttr.in](https://wttr.in/)** returns a text forecast from a direct HTTP request that can be read with `curl` (a console weather service), created by Igor Chubin as a small wrapper originally built to demonstrate `wego` below. It handles tens of millions of queries a day. For example, try `curl https://wttr.in/Denver` or another location.

**[wego](https://github.com/schachmat/wego)** supports text, Markdown, JSON, caching, several backends, and keyless Open-Meteo or SMHI configurations (a local terminal weather client). Unlike [wttr.in](http://wttr.in), which is a hosted service you query, wego runs on your own machine.

**[Irssi](https://irssi.org/)** is one of the most resource-efficient forms of live group communication, a terminal IRC client. Finnish programmer Timo Sirainen first released it in January 1999, and it's remained a staple of IRC culture, especially among channel operators, for more than 25 years since.

**[senpai](https://sr.ht/~delthas/senpai/)** is a modern terminal IRC client built to pair with a bouncer rather than keep its own logs, built by delthas and hosted on SourceHut. It leans on newer IRCv3 extensions—fetching history from the server via `CHATHISTORY`, connecting to all your networks at once via `BOUNCER`, and even uploading files via `FILEHOST`, so the client is lightweight while the heavy lifting happens server-side.

**[catgirl](https://git.causal.agency/catgirl/about/)** is a TLS-only, ncurses-based terminal IRC client built by June McEnroe of causal.agency, with tab-complete, nick colouring, and split scrolling but deliberately little else. It exits on disconnect rather than reconnecting itself, expecting to be run in a loop or, better, paired with a bouncer. That bouncer is typically McEnroe's own **[pounce](https://git.causal.agency/pounce/about/)**, part of a suite of purpose-built IRC tools alongside the full-text logger **[litterbox](https://git.causal.agency/litterbox/about/)**.

**[SDF shell access](https://sdf.org/?signup)** provides a social and productive environment for SSH, telnet, Gopher, Gemini, IRC, Git, and vintage systems (a public Unix shell community). Beyond a free account, its paid MetaARPA tier (around $11 a quarter) unlocks cron jobs, background processes, SSH tunneling, and more. The homepage is generated with `ksh`, `sed`, and `awk`; current access and membership details are on the site.

**[Gopher proxy](https://gopher.floodgap.com/gopher/)** lets a browser or Lynx sample Gopherspace before installing a native client (an HTTP bridge to Gopher). Floodgap warns that the public gateway is rate-limited and not anonymous; native clients are preferable for regular use.

**[curl](https://curl.se/)** lets a low-spec machine fetch text, feeds, APIs, Gemini gateways, and weather without a browser (a minimal network retrieval tool). Daniel Stenberg started it in 1996 as a tool to fetch currency exchange rates for an IRC bot; it now ships on billions of devices, from phones to cars to game consoles. Use it with `less`, `grep`, `lynx -dump`, `w3m`, or a local cache.

**[Git over SSH](https://git-scm.com/)** enables offline work, local history, and synchronization over low-overhead transports (distributed publishing and software exchange). Because a clone carries the repository history and Git only ever transfers the deltas it actually needs, you can work fully offline and push or pull later, suiting low-bandwidth or intermittent connections well. Useful with SourceHut, SDF, Codeberg, or a self-hosted forge.

Other Alternative Networks [](#other-alternative-networks)
----------

These networks are not all "websites" in the same sense as Gemini or Gopher. Several require a local client, a running node, a tunnel, or a network-specific address book. They're included because they can carry small web sites, IRC, code, files, and peer-to-peer publishing.

### Yggdrasil [](#yggdrasil) ###

**[Yggdrasil](https://yggdrasil-network.github.io/)** is an end-to-end encrypted IPv6 overlay network built by Neil Alexander and Arceliar, with its first public release in December 2018. Rather than routing by geography, it builds a global spanning tree and a distributed hash table so nodes get a flat, name-independent address derived straight from its public key—you only need two or three peers to join the mesh. The **[Yggdrasil services directory](https://yggdrasil-network.github.io/services.html)** exposes concrete IPv6-style Yggdrasil destinations, and is a community-maintained catalogue of Web, IRC, DNS, code, torrents, VoIP, Nostr, Iroh, and other services).

The **[Yggdrasil Web directory](http://[21e:a51c:885b:7db0:166e:927:98cd:d186]/)** is a starting point after joining the network. It requires Yggdrasil connectivity and is not reachable from an ordinary clearnet browser. The **[Yggdrasil search engine](http://[200:b48d:469e:c7c7:3e13:c41d:ba4d:d2b8]/)** and the **[Yggdrasil Forum](http://[21a:34aa:c782:3ad2:1bf8:73f8:141:66e8]/)** are also available inside the overlay.

**[BonoboNET IRC over Yggdrasil](https://yggdrasil-network.github.io/services.html#irc)** combines a lightweight chat protocol with an overlay network. After joining Yggdrasil, use the preferred hostname `y.irc.bnet.eu.org` on port 6667.

**[Yggdrasil Radicle nodes](https://radicle.xyz/)** are useful for software exchange without depending on centralized forges. Radicle was founded in Berlin in 2018 by Eleftherios Diakomichalis and Alexis Sellier, originally built on IPFS before the team wrote their own peer-to-peer Git protocol. Version 1.0 shipped in September 2024 with 40 seed nodes already running, no central server anywhere, with issues and patches stored directly as objects inside the Git repository itself.

### I2P [](#i2p) ###

**[I2P documentation](https://i2p.net/en/docs/)** provides a route to local `.i2p` services and self-hosted sites. The Invisible Internet Project began in 2001 as the Invisible IRC Project before jrandom renamed and relaunched it in 2003. Unlike Tor's three-hop circuits, I2P is packet-switched and routes traffic through separate unidirectional inbound and outbound tunnels, with recent estimates putting the network at around 55,000 active routers and 35,000 hidden `.i2p` "eepsites."

The official eepsite guide documents a built-in Jetty server and a local console at [http://127.0.0.1:7657](http://127.0.0.1:7657).

**[I2P eepsite guide](https://i2p.net/en/docs/guides/creating-an-i2p-eepsite/)** shows how to publish a small site inside I2P using the preconfigured web server.

### Hyphanet (formerly Freenet) [](#hyphanet-formerly-freenet) ###

**[Hyphanet](https://www.hyphanet.org/)** supports personal websites, microblogging, forums, media sharing, blogs, and version tracking. It began in 1999 as Ian Clarke's undergraduate project at the University of Edinburgh, splitting content into small encrypted chunks that get distributed, cached, and replicated across peers based on demand, and so node operators can't tell what they're storing.

In March 2023, the original codebase was spun off and renamed Hyphanet, while Clarke took the Freenet name for a ground-up rewrite. The official homepage reported Hyphanet 0.7.5 build 1506 on 2026-02-21. It's more demanding than Gemini/Gopher, but is an interesting publishing network. The **[Hyphanet documentation](https://www.hyphanet.org/pages/documentation.html)** is necessary for understanding how to publish and browse inside the network.

### GNUnet, Lokinet, and Reticulum [](#gnunet-lokinet-and-reticulum) ###

**[GNUnet](https://www.gnunet.org/en/index.html)** is a foundation for distributed applications, naming, routing, resource discovery, and content distribution. Christian Grothoff has led it since it started in 2001 as "GNet" before becoming an official GNU package; the codebase now exceeds 400,000 lines of C, and it's spawned the GNU Name System, the GNU Taler payment framework, and PSYC, a messaging substrate used by the SecuShare social network project. It's a development framework, not a ready-made content directory.

**[Lokinet](https://lokinet.org/)** grew out of the Loki Project (rebranded Oxen in 2021) starting in 2018, and it's an onion router that runs across more than a thousand staked Oxen Service Nodes, so it shares infrastructure directly with the Session messenger app.

The **[Reticulum community node list](https://github.com/markqvist/Reticulum/wiki/Community-Node-List)** is relevant for peer-to-peer text, messaging, and intermittent connectivity. Mark Qvist designed Reticulum between 2014 and 2022 and dedicated the protocol to the public domain. It's built to run over almost anything, including LoRa radio and packet radio, down to around 5 bits per second, and projects like Nomad Network and MeshChat use it to run entirely off-grid.

A Daily Driver [](#a-daily-driver)
----------

1. Use a minimal Linux or BSD installation with a text browser such as **[Lynx](https://lynx.invisible-island.net/)**, **[w3m](https://github.com/tats/w3m)**, or **[ELinks](https://elinks.or.cz/)**.

2. Use **[Newsboat](https://newsboat.org/)** as the home screen for current reading. Add feeds from CAPCOM, news sites, personal blogs, project release feeds, and any publication that exposes RSS or Atom.

3. Use **[Lagrange](https://gmi.skyjake.fi/lagrange/)** for Gemini and a Gopher client or the **[Floodgap proxy](https://gopher.floodgap.com/gopher/)** for Gopher.

4. Bookmark **[CAPCOM](https://portal.mozz.us/gemini/gemini.circumlunar.space/capcom/)**, **[Bongusta](https://gopher.floodgap.com/gopher/gw?i-logout.cz/1/bongusta/)**, **[Veronica-2](https://gopher.floodgap.com/gopher/gw?gopher.floodgap.com/1/v2)**, **[Marginalia](https://old-search.marginalia.nu/)**, and **[Wiby](https://wiby.me/)** as discovery tools.

5. Cache durable material locally. Use `curl`, `wget`, `git`, `less`, `grep`, and a small directory of downloaded books, RFCs, manuals, and feeds.

6. Add **[SDF](https://sdf.org/)** or another public Unix account for shell-based community, publishing, IRC, and experimentation.

7. Yggdrasil, I2P, Hyphanet, GNUnet, Lokinet, and Reticulum are second-stage projects. They can add valuable peer-to-peer spaces, but setup and network reachability are more complicated than just opening a Gemini or Gopher client.

How to Test and Save Content [](#how-to-test-and-save-content)
----------

A quick HTTP text check is:

```
lynx -dump -nolist https://example.com/

```

A lightweight retrieval check is:

```
curl -L --max-time 20 -sS https://example.com/ | less

```

For a plain-text resource, save a local copy and search it:

```
curl -L -sS https://www.rfc-editor.org/rfc/rfc9110.txt -o rfc9110.txt
less rfc9110.txt
grep -n "HTTP Semantics" rfc9110.txt

```

A Few Notes [](#a-few-notes)
----------

This is a curated starting list by a beginner. Native-protocol networks are dynamic, and some small services may disappear or move without redirects. I directly tested Gemini, Gopher, and Spartan endpoints, and tested availability of most Yggdrasil, I2P, Hyphanet, GNUnet, Lokinet, and Reticulum pages.

The term “low-spec” has multiple meanings. A page can be visually simple but still be large, like the solar Low-tech Magazine site. A terminal program can be lightweight locally while depending on a heavy remote API. Conversely, an ordinary HTML page can be highly usable if it is server-rendered, cacheable, and free of JavaScript requirements.

Security and privacy are important but are not the organizing principle here. The relevant question for this article is whether a person with inexpensive hardware, a slow connection, and a preference for text can actually read, participate, publish, and discover material.

Discovery and continuity require ongoing human curation. I will keep checking, re-labelling, and adding to these lists as I go. If you have any suggestions for contributions, please let me know!

None of this is about DigitalOcean, or DHH, or Omarchy, or even Mastodon's stack—those are just the prompt that got me writing again. The actual point is the constraint. A smaller, text-shaped, low-powered version of the Internet isn't a downgrade. I don't think the oldnet and the altnets will ever replace the IndieWeb, or Mastodon, or Brennan.day as it stands today, but they're proof that the boiling-frog Internet we default to isn't the only option. It really isn't.

---

>
>
> **About Brennan Kenneth Brown**
>
>
>
> Queer Métis writer, cultural critic, and web developer based in Mohkínstsis (Calgary), Treaty 7 territory. Author of nine books and counting, the founder of Fireweed Writing School and Berry House Studio, and of Write Club at Mount Royal University. His work has been cited in Le Monde and other publications.
>
>
>
> **Enjoy this content?** Support my work and help me create more:
>
>
>
> [Patreon](https://patreon.com/brennankbrown) | [Ko-fi](https://ko-fi.com/brennan) | [GitHub Sponsors](https://github.com/sponsors/brennanbrown)
>
>