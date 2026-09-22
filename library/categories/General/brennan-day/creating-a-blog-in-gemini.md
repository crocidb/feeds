+++
title = "Creating a Blog in Gemini://"
description = "Creating your own corner of Geminispace: why you'd want to blog on a protocol with no JavaScript, no CSS, and no AI slop; where to host a capsule (SmolPub, the Tildeverse, flounder, Gemcities); how the community's gemlog conventions work; and the surprising social life of Gemini "
date = "2026-09-19T02:00:00Z"
url = "https://brennan.day/creating-a-blog-in-gemini/"
author = "mail@brennanbrown.ca (Brennan Kenneth Brown)"
text = ""
lastupdated = "2026-09-21T09:42:43.407889557Z"
seen = false
+++

Welcome to my third post on Gemini and the alternative Internets and smallnets! This is going to be my most helpful and detailed article on the topic yet—and it's something I'm excited to get into.

If you'd like a history and explanation of what Gemini is, read my first post, ["Gemini, Gophers, and Fingers. Oh My! Alternative Internets Beyond HTTPS"](https://brennan.day/gemini-gophers-and-fingers-oh-my-alternative-internets-beyond-https/). My second article, ["Oldnets and Altnets: A Guide to Building a Low-Spec Daily Internet Out of Gemini, Gopher, and Terminal Tools"](https://brennan.day/oldnets-and-altnets-a-guide-to-building-a-low-spec-daily-internet-out-of-gemini-gopher-and-terminal-tools/) was aimed more at resources that would allow people to use older hardware to connect to the Internet in general.

This, however, is going to be only about Gemini (and a little of Gopher and Spartan, too). Because I realized that I only really explored the surface-level of what this protocol has to offer. While there are interesting things to read (which I'll be linking to), this guide is aimed more at creation, socialization, and interactivity that's possible on Gemini.

But if you want a tl;dr, Gemini is a modern, minimal Internet protocol alternative to `https://`, and requires a different Internet browser to use it. It was built in 2019 by a pseudonymous developer who goes by Solderpunk, and instead of HTML, every page is written in [Gemtext](https://geminiprotocol.net/docs/gemtext-specification.gmi), which is a stripped-down format with only headings, links, and lists. Every connection runs over TLS on port 1965, and it's one request, one response, then the connection closes.

Blogging on Gemini: Why? [](#blogging-on-gemini-why)
----------

First, I want to answer why someone would want to blog on Gemini compared to the widely-used, popular clearnet (which is `https://`).

To start, you may have read headlines about how [AI swarms could take over the Internet soon](https://www.popularmechanics.com/science/a73753782/ai-agent-taking-over-internet/), which sounds rather terrifying. While I think the wording is alarmist, I think we can all agree that there has been an annoying increase of generative AI and agents on the Internet lately. With Gemini, you avoid all of that. There's no real viable revenue (and it's also obscure in general) meaning there's just humans in that part of cyberspace.

Next, you don't need to worry about the technical complexity of JavaScript or CSS. Hell, you don't even need to worry about HTML. All your content will be in the [Gemtext format](https://gmi.sbgodin.fr/htmgem/docs/tutogemtext-en.gmi), which can be understood as being an even simpler version of Markdown. (I also created [an easy-to-use converter](https://gemtext.brennan.day) as well.) This means that you don't have to spend time and effort worrying about design or troubleshooting anything. This means you have a space where you're compelled to focus on the craft of writing, and to be more mindful of blogging. There's nothing else to distract you.

Of course, for some people that's the *fun* of creating things on the web. But if you want to have your work online before learning all of that, Gemini is a great place to start. As I've said before, being a webweaver means you wear a lot of different hats, and it can be overwhelming to try to learn how to be a better writer, web developer, and UX designer all at the same time, and starting with Gemini helps in that sense. You can always convert your files into Markdown and create a webpage proper with them at a later point in time.

Now, there's nothing you can't do on the clearnet that you can do in Gemini, but I like to make the comparison of the popular, small eink reader [Xteink](https://www.xteink.com/) which is designed to go on the back of your phone. Can you easily read the same content on your bigger phone screen? Yes, but the eink reader is limited by design. It's a different, and arguably better experience.

Or maybe you want more privacy while still being public. Your audience in the Geminispace is much smaller, and it's also much more intentional because of that.

Finally, as I've mentioned in my previous posts, Gemini is far less resource-intensive compared to the regular Internet. You can use Gemini entirely from a terminal-based browser, meaning that any hardware you have that can't handle the modern web still has a way to get online again.

Blogging Platforms for Gemini [](#blogging-platforms-for-gemini)
----------

There are a wonderfully surprising amount of places you can join and get started with your own Gemini capsule.

If you want a blog that's both on the clearnet and Gemini (and Gopher), then I recommend [SmolPub](https://smol.pub), which has a very simple interface and only costs $5 for a lifetime of the service.

The [Tildeverse](https://tildeverse.org/) is another great way to get started (and has so many other features!), though that does require getting a little familiar with the terminal and `ssh`. Servers like [Tilde.pink](https://tilde.pink) are Gemini-only and will give you a capsule automatically, whereas [Tilde.town](https://tilde.town) will require you to [use a command](https://tilde.town/wiki/editing-your-homepage/gemini.html) to set up a capsule, like `town request-gemini`. Similarly, [SDF/Freeshell.org](https://freeshell.org/) will give you a Gopher site.

There are Gemini-specific platforms too, such as [flounder.online](https://flounder.online) and the [Midnight Pub](https://midnight.pub), though these require manual approval to get into.

[Gemcities](https://gemcities.com) is another platform I stumbled upon. Although it looks a *little* vibecoded, it's also free and gives you instant access and a rather easy-to-use web interface to create and manage your capsule.

Of course, you can also [host your own Gemini server](https://kevinboone.me/gemini_vps.html), and there are [plenty of resources](https://html-chunder.neocities.org/posts/self-hosting-a-gemini-capsule/) on that, but that's outside the scope of this article.

What To Put In Your Capsule? [](#what-to-put-in-your-capsule)
----------

The answer is the same as [any webpage you make: anything you want!](https://brennan.day/webmaster-a-manifesto-for-everyone/) But here are some ideas to get you started:

Less is more here, more than almost anywhere else on the Internet. All you need is a folder and some plain text files. A flat folder structure like this is already enough to get going:

```bash
index.gmi    # root (the file served by default at a base URL,
             #       the Gemini equivalent of index.html)
about.gmi    # who you are
now.gmi      # what you're currently up to
hobbies.gmi  # what you're interested in
links.gmi    # interesting non-https links you've found
quotes.gmi   # quotes you want to keep and share
gemroll.gmi  # other people's capsules you want to share
gemlog/
      index.gmi  # the root file of the gemlog (see below)
      2026-09-15-thoughts.gmi   # a blog post
      2026-09-01-update.gmi     # another blog post
      etc...
```

The Gemlog [](#the-gemlog)
----------

Now, a blog in a Gemini capsule is usually called a gemlog, and although there's no official gemlog spec, the community has settled on some norms:

* File naming: dated posts, often `YYYY-MM-DD-slug.gmi` and/or organized under a `/posts/` or `/gemlog/` directory.
* Index page (index.gmi): a reverse-chronological list of posts as =\> links, each usually prefixed with the date:

```markdown
# My Gemlog

=> /gemlog/2026-09-15-thoughts.gmi 2026-09-15: Some thoughts
=> /gemlog/2026-09-01-update.gmi 2026-09-01: An update
```

* Atom feed: many gemlogs also publish an `atom.xml`, so people can subscribe with an RSS feed reader, since Gemini has no native subscription mechanism.
* First line as title: the convention (not spec) is that a post's first line is a `#` heading used as its title when aggregated elsewhere.

Other Goodies [](#other-goodies)
----------

Most browsers built for Gemini, such as Bombadillo, Lagrange, and Kristall—all can also interface with protocols like Gopher, Spartan, etc., and work with the older `finger://` protocol too. You can add a finger link into your capsule like any other:

```markdown
=> finger://brennan@omg.lol Finger me for my current status
=> finger://example.com/kenny .plan file
```

You can also have `.plan` and `.project` files, which can also live on a `now.gmi` page.

* `.plan` → current status, what you're working on right this week (the original microblog)
* `.project` → a one-line "what is this account/person about"

[Michael Lazar has a spec](https://portal.mozz.us/gemini/mozz.us/files/rfc_gemini_favicon.gmi?) for Gemini capsules to have a plain-text file named `favicon.txt` containing a single Unicode emoji. A supporting client resolves a favicon for any given page by checking that directory for `favicon.txt`, and if absent, looks in the parent directory (the same logic as looking for `robots.txt`). Having a /favicon.txt in your capsule's root (e.g. 🍇) enables it for your whole site, and you can override it with different ones in subdirectories. Support is optional, though, and client-dependent.

It's also good practice to add a `.well-known/security.txt` to your capsule just as on any other website, with something like:

```yaml
Contact: mailto:security@example.com
Contact: https://example.com
Expires: 2027-12-31T23:59:00.000Z
Encryption: https://example.com
Policy: https://example.com
Preferred-Languages: en, es
Canonical: https://example.com/.well-known/security.txt
```

Gemini also supports `robots.txt` files, but Gemini requests carry no user-agent string, so instead of naming specific bots, the convention defines virtual user-agents by purpose:

```bash
User-agent: archiver
Disallow: /private/

User-agent: indexer
Disallow: /drafts/

User-agent: researcher
Disallow:

User-agent: webproxy
Disallow: /

User-agent: *
Disallow: /cgi-bin/
```

### ASCII Art [](#ascii-art) ###

Because you're mostly limited to text, Gemini is a great excuse to dive into ASCII art. There are great [text-to-ASCII generators](https://patorjk.com/software/taag/), archives of [ASCII art made by others](https://www.asciiart.eu/), and tools to help you [draw your own ASCII art](https://www.asciiart.eu/ascii-draw-studio/app). Hell, even [WikiHow](https://www.wikihow.com/Create-ASCII-Art) has a pretty good tutorial.

Social Media and Interactivity on Gemini [](#social-media-and-interactivity-on-gemini)
----------

Now, I loved learning about this: despite how minimal Gemini is, there are still sites where you can sign up and interact with other users.

The two most popular examples of this are **Gemini BBS** and **Station**. There is also a wonderful plant game called **Astrobotany** which also operates similarly.

None of the interactivity breaks Gemini's design, rather, it's built from four small primitives in clever combinations. Instead of reading files off disk, a Gemini server can be configured to run scripts, which get a request URL (including query strings) and then gemtext is written to stdout:

* Client requests a URL.
* Server replies with status 10 (or 11 for sensitive input like a password) plus a prompt string instead of content.
* The client shows a single text field with that prompt.
* Whatever the user types gets URL-encoded and appended as a query string, and the client re-requests the same URL with that string attached.

Gemini has no cookies, so persistent state across visits is handled with TLS client certificates. A server can respond with status 60 ("certificate required") for a path, and the client either generates one (with the user's permission) or presents one it already has. The server then keys any stored state to that certificate's fingerprint. This is how a capsule "remembers you" between sessions without passwords or cookies.

For more information on this, I recommend looking at solderpunk's repository [gemcert](https://git.sr.ht/~solderpunk/gemcert).

Getting Started [](#getting-started)
----------

Now, it might be confusing to get started with Gemini. First things first, you'll need an actual Gemini browser, since your regular one can't speak the protocol. [Lagrange](https://github.com/skyjake/lagrange) is the one I use and recommend; one of the things I love about it is the sidebar, which has a "structure" option that lets you view the site you're on like a folder directory. But [Amfora](https://github.com/makew0rld/amfora) is a great terminal-based option.

Past that, some of the hosting options above require using the terminal and SSH, so if you've never generated a key pair before, [GitHub's guide to generating an SSH key](https://docs.github.com/en/authentication/connecting-to-github-with-ssh/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent) is a good walkthrough even if you're not using it for GitHub itself. And for actually writing gemtext, the [official specification](https://geminiprotocol.net/docs/gemtext-specification.gmi) is good, as there's not much to it.

In most cases, you'll have to use the terminal to edit and add to your capsule, unless you use a platform like [SmolPub](https://smol.pub) or [Gemcities](https://gemcities.com), which have web interfaces. That means getting comfortable with commands and a terminal-based editor, which I know sounds intimidating. For an editor, I recommend [Micro](https://micro-editor.github.io), which is far friendlier than vim or nano, as it has mouse support and familiar shortcuts like `ctrl+s` to save and `ctrl+q` to quit. And if you're new to the command line, [LinuxCommand.org's "Learning the Shell"](https://linuxcommand.org/lc3_learning_the_shell.php) walks you through the terminal specifically, while [The Missing Semester of Your CS Education](https://missing.csail.mit.edu) from MIT is a good broader crash course.

For more information and browser options, I recommend the [Awesome Gemini](https://github.com/kr1sp1n/awesome-gemini) repository.

CGI Scripting on Gemini [](#cgi-scripting-on-gemini)
----------

Gemini doesn't have anything like PHP or server-side JavaScript, but it does support old-school CGI (Common Gateway Interface) scripting. Instead of serving a static `.gmi` file, your server runs a script and pipes what it prints to stdout back to the client as the response.

The response format is: a status code and MIME type on the first line, a blank line, then the body. Here's an example in Python that says hello:

```python
#!/usr/bin/env python3
print("20 text/gemini")
print()
print("# Hello!")
print("Welcome to my little corner of Geminispace.")
```

Save that as `hello.cgi`, make it executable with the command `chmod +x`, and put it in the directory that your server uses as its cgi-bin. Most Gemini servers that support CGI, including [Jetforce](https://github.com/michael-lazar/jetforce) (the same server behind Astrobotany, mentioned earlier) pass along request details through environment variables like QUERY\_STRING and PATH\_INFO, so you can build search boxes, guestbooks, or anything else interactive. There are [plenty of CGI scripting tutorials](https://xitzin.readthedocs.io/en/latest/how-to/cgi-scripts/) out there if you're curious to learn more.

A Revivalist's Revival [](#a-revivalists-revival)
----------

Gemini isn't an old technology being dusted off, it was created in 2019. But it borrows heavily from Gopher's spirit, BBSes, and the decades-old phlogosphere. Yet, sadly, during my research and browsing of Geminispace, I came across nearly as many dead/abandoned links as I did active and alive ones. I get it. There's a lot of friction when it comes to using an entirely different protocol. I confess that it took me months until I finally got serious with it. I don't think Gemini will ever "take off" and I'm glad for that, really. It's a wonderfully peaceful and calm alternative to the Internet without having to unplug. I'm planning to use it a lot more, and I think I'm going to start adding some of my writing on the protocol exclusively.

But I do hope you consider trying it out, it may be the only place online where there aren't hordes of genAI bots pissing everyone off, who knows.

---

Links [](#links)
----------

Here are all the links I've collected in my journey across the smallnet so far. None of these use the `https://` protocol, so you'll have to use a Gemini protocol browser to visit any of them.

I tried to make sure each one is still active and operating, but please let me know if any aren't.

### The Gemini Project [](#the-gemini-project) ###

```
=> gemini://geminiprotocol.net/ Gemini Protocol, official project site
=> gemini://geminiquickst.art/ Gemini Quickstart guide
=> gemini://mozz.us/files/rfc_gemini_favicon.gmi Emoji favicons in Gemini, a spec proposal
=> gemini://gemi.dev/gemlog/2022-02-08-favicons.gmi On favicons and how to add one to your capsule

```

### Search & Discovery [](#search-and-discovery) ###

```
=> gemini://kennedy.gemi.dev Kennedy, Geminispace search engine: discovery, historical snapshots, backlinks, and capsule health
=> gemini://kennedy.gemi.dev/archive/ Delorean, the Geminispace time machine
=> gemini://gemini.thegonz.net/cdg/ Collaborative Directory of Geminispace
=> gemini://fediring.net/ Fediring, a Gemini webring
=> gemini://geminispace.info/ geminispace.info, public Gemini search provider
=> gemini://tlgs.one/ TLGS, another public Gemini search provider
=> gemini://gemplex.space/ Gemplex, experimental search engine
=> gemini://aurasearch.ddns.net/ Aura Search, covering Gemini, Nex, Spartan, and Scroll
=> gemini://medusae.space/ Medusae, hand-maintained capsule directory
=> gemini://geddit.glv.one Geddit, interactive link service with comments
=> gemini://fumble-around.mediocregopher.com Fumble-around, explore gemspace by hopping between random interesting pages
=> gopher://gopher.floodgap.com:70/1/v2 Veronica, Gopherspace search
=> gopher://gopher.icu:70/1/quarry Quarry, Gopherspace search

```

#### Aggregators [](#aggregators) ####

```
=> gemini://warmedal.se/~antenna/ Antenna
=> gemini://antenna.ucant.org/ Antenna, ucant.org instance
=> gemini://gemini.circumlunar.space/capcom/ CAPCOM
=> gemini://gemini.circumlunar.space/users/gemlog/ CircumLunar gemlog feed
=> gemini://skyjake.fi/~Cosmos/ Cosmos

```

#### Geminispace Statistics [](#geminispace-statistics) ####

```
=> gemini://gemini.bortzmeyer.org/software/lupa/stats.gmi Lupa's Geminispace Statistics
=> gemini://tlgs.one/statistics TGLS' Geminispace Statistics
=> gemini://botond.online/en/stats/ Botond's Geminispace Stats Visualized

```

### Communities [](#communities) ###

```
=> gemini://bbs.geminispace.org/ Gemini BBS: discussion, microblogging, and issue tracking
=> gemini://station.martinrue.com/ Station: status updates, capsuleers can hang out and socialise
=> gemini://midnight.pub/ Midnight Pub: small-scale personal publishing with a human-scale social feel
=> gemini://flounder.online Flounder
=> gemini://gemlog.blue Gemlog Blue
=> gemini://smol.pub Smol Pub
=> gemini://gemcities.com GemCities, capsule publisher
=> gemini://gemini.smallweb.space/ SmallWeb.Space, smol web host
=> gemini://gemini.circumlunar.space CircumLunar.Space, community capsule host
=> gemini://software-freedom.org Software Freedom
=> gemini://cities.yesterweb.org Yestercities (defunct)
=> gopher://gopher.club:70/ Internet Gopher Club Underground Syndicate
=> gopher://magical.fish:70/1/ magical.fish

```

#### Pubnixes & Tildes [](#pubnixes-and-tildes) ####

```
=> gemini://gem.sdf.org SDF Public Access UNIX System
=> gemini://gemini.ctrl-c.club/ Ctrl-C Club
=> gemini://envs.net Envs
=> gemini://breadpunk.club/ Breadpunk Club
=> gemini://heathens.club/ heathens.club
=> gemini://tanelorn.city/ tanelorn city
=> gemini://tilde.cafe/ Tilde Cafe
=> gemini://tilde.club/ Tilde Club
=> gemini://tilde.pink/ tilde.pink
=> gemini://tilde.team/ Tilde Team
=> gemini://tilde.town/ tilde.town
=> gemini://rawtext.club/ Raw Text Club (RTC) (defunct)

```

### Capsules of Interest [](#capsules-of-interest) ###

```
=> gemini://zaibatsu.circumlunar.space/~solderpunk/ solderpunk, creator of Gemini
=> gopher://zaibatsu.circumlunar.space/1/~solderpunk/ solderpunk's Gopherhole
=> gemini://athanasia.gemcities.com/ Athanasia
=> gemini://balloon.fusen.nya.je/ Balloon/Fusen
=> gemini://elektito.com/gemlog/ Elektito
=> gemini://nytpu.com Nytpu
=> gemini://sava.rocks sava.rocks
=> gemini://mozz.us mozz.us
=> gemini://cyberdreams.info CyberDreams
=> gemini://gem.acdw.net ACDW's Gemini Cottage
=> gemini://drewdevault.com/ Drew DeVault
=> gemini://hexdsl.co.uk HexDSL
=> gemini://gemini.lottalinuxlinks.com Lotta Linux Links
=> gemini://pennywhether.xyz PennyWhether's Place
=> gemini://gemini.circumlunar.space/users/hundredrabbits/ Hundred Rabbits
=> gemini://gemini.circumlunar.space/users/laur%C3%AB/ Laurë's capsule
=> gemini://skyjake.fi/ Skyjake, developer of Lagrange
=> gemini://alexschroeder.ch/ Alex Schroeder
=> gemini://freeshell.de/ JBanana
=> gemini://gmi.bacardi55.io/ bacardi55
=> gemini://warmedal.se/~bjorn/ ew0k
=> gemini://taoetc.org Tao Etc
=> gemini://caolan.uk/ Caolan
=> gemini://adele.work Adele's capsule
=> gemini://going-flying.com/~mernisse/ Mernisse
=> gemini://tobykurien.com/ Toby Kurien's capsule
=> gemini://friendo.monster/ Drew's capsule
=> gemini://rawtext.club/~ecliptik ecliptik
=> gemini://rawtext.club/~sloum/ sloum
=> gopher://zaibatsu.circumlunar.space/1/~sloum/ sloum's Gopherhole
=> gopher://gopher.black/ Tomasino's gopherhole
=> gopher://box.matto.nl:70/1/ Matto's gopherhole
=> gopher://tilde.pink/1/~bencollver/ bencollver's gopherhole
=> gemini://tilde.cafe/~spellbinding/ ~spellbinding's word games
=> gemini://corstar.flounder.online corstar
=> gemini://subphase.xyz/index.gmi subphase
=> gemini://pixeldreams.tokyo/ kyo
=> gemini://tilde.pink/~kaction kaction
=> gemini://sdf.org/clinquant/index.gmi clinquant
=> gemini://tilde.pink/~ali ali
=> gemini://devinprater.flounder.online devin
=> gemini://vignette.kalasarn.se/ mmww
=> gemini://republic.circumlunar.space/users/joneworlds/ joneworlds
=> gemini://tanelorn.city/~vidak/ vidak
=> gemini://tilde.town/~hush/ ~hush

```

#### Link curators [](#link-curators) ####

These capsules maintain the collections many of the links here were found through. Thank you!!

```
=> gemini://tilde.pink/~emily ~emily
=> gemini://gemini.ctrl-c.club/~aesophod/ ~aesophod
=> gemini://gemini.ctrl-c.club/~de_alchmst/ ~de_alchmst
=> gemini://gemini.ctrl-c.club/~edisondotme/ ~edisondotme
=> gemini://gemini.ctrl-c.club/~gzj/ ~gzj
=> gemini://gemini.ctrl-c.club/~w3bk3rn3l/ ~w3bk3rn3l
=> gemini://gemini.ctrl-c.club/~zenspace/ ~zenspace
=> gemini://eluum.net/ eluum
=> gemini://gmi.hedy.dev/ hedy

```

#### Active \~pink capsules [](#active-pink-capsules) ####

```
=> gemini://tilde.pink/~johl ~johl
=> gemini://tilde.pink/~kirch ~kirch
=> gemini://tilde.pink/~lacour ~lacour
=> gemini://tilde.pink/~m040601 ~m040601
=> gemini://tilde.pink/~para ~para
=> gemini://tilde.pink/~rebel1725 ~rebel1725
=> gemini://tilde.pink/~ssb22 ~ssb22

```

### Good Gemlogs [](#good-gemlogs) ###

```
=> gemini://degrowther.smol.pub/ Degrowther
=> gemini://idiomdrottning.org/sub Idiomdrottning
=> gemini://rawtext.club/~left_adjoint/ Left adjoint's free monoid microblog
=> gemini://gemini.ctrl-c.club/~lettuce/ Lettuce Gemlog
=> gemini://njms.ca/gemlog/ njms' gemlog
=> gemini://officialdonut.smol.pub/ Official Donut of the Small Web
=> gemini://ploum.net/index_en.gmi Ploum's English gemlog
=> gemini://rawtext.club/~ploum/ Ploum's Offline Typewriter
=> gemini://gemini.circumlunar.space/users/shufei/phlog/index.gmi Shufei's Gmiphlog
=> gemini://gemini.circumlunar.space/users/shufei/phlog/Shufei-ThisAndThat-Weiphlog.gmi Shufei's Weiphlog
=> gemini://arcanesciences.com/gemlog/ Sunset's gemlog
=> gemini://rawtext.club/~winter/gemlog/ Winter's gemlog
=> gemini://samsai.eu/gemlog.gemini Samsai's gemlog
=> gemini://perso.pw/blog/ Solene's gemlog
=> gemini://gemini.cyberbot.space/gemlog/ kelbot's gemlog
=> gemini://carcosa.net/journal prothetic conscience, a comrade's gemlog
=> gemini://zach.e-worm.club/ zach's frequently updated log
=> gemini://gmi.noulin.net/feed.gmi Remy Noulin's tech articles

```

### Documents & Libraries [](#documents-and-libraries) ###

```
=> gemini://library.inu.red Gemini mirror of the Anarchist Library
=> gemini://gemini.bortzmeyer.org/rfc-mirror/rfc-index.gmi Gemini mirror of all IETF RFCs
=> gemini://park-city.club/library/ Park City Library: collecting, categorizing, and preserving the works of internet communities
=> gemini://vault.transjovian.org TransJovian, a Gemini encyclopedia
=> gemini://gemini.cyberbot.space/smolzine/ smolzine
=> gopher://rawtext.club:70/1~cmccabe/pubnixhist/ A history of public unix systems
=> gopher://tilde.pink:70/1/~bencollver/dict/ Dictionary look-ups
=> gopher://tilde.pink:70/9/~bencollver/books/FederalPLGuidelines.pdf Federal Plain Language Guidelines (PDF)
=> gopher://tilde.pink:70/9/~bencollver/books/how-to-write-clearly.pdf How to Write Clearly (PDF)
=> gopher://tilde.pink:70/0/~bencollver/text/nato-alphabet.txt NATO phonetic alphabet
=> gopher://tilde.pink:70/1/~bencollver/effman/ Writing effective man pages
=> gopher://tilde.pink:70/1/~bencollver/dos/ DOS nostalgia
=> gopher://tilde.pink:70/1/~bencollver/ftp/ FTP sites
=> gopher://tilde.pink:70/1/~bencollver/gamefaqs/ GameFAQs archive
=> gopher://tilde.pink:70/1/~bencollver/books/basic-asanas/ Basic asanas
=> gopher://tilde.pink:70/1/~bencollver/books/surya-namaskar/ Surya namaskar
=> gopher://sdf.org:70/1/users/agk/1st First aid

```

### Arts & Fun [](#arts-and-fun) ###

```
=> gemini://cyberdreams.info/videos/index.gmi CyberDreams Video Archive
=> gemini://tilde.pink/~doriancodes/asciimoji.gmi ~doriancodes' ASCIImoji / Kaomoji Collection
=> gemini://mozz.us/cgi-bin/cowsay Mozz's Cowsay Generator
=> gemini://astrobotany.mozz.us/ Astrobotany
=> gemini://zaibatsu.circumlunar.space/~shufei/pnp/PikiAndPoko.gmi Shufei's Smolnet Piki and Poko Fancapsule
=> gemini://gemini.nasman.us/dad_tips.py Dad tips generator
=> gopher://workingpayphones.com:70/1/ Working phone booths

```

#### Games [](#games) ####

```
=> gemini://spell.mywire.org:1966/ Spellbinding, an addictive word game
=> gemini://tilde.cafe/~spellbinding/wordo/cgi? Wordo, a wordle-like game
=> gemini://tilde.cafe/~spellbinding/wall/cgi A public wall to leave messages on
=> gemini://tictactoe.lanterne.chilliet.eu Tic-tac-toe
=> gemini://rawtext.club/~sloum/cgi/othello/ Othello/Reversi against the computer

```

### Music [](#music) ###

```
=> gemini://gemini.circumlunar.space:1965/~sloum/ Drift Theory, a small collection of music released on Gemini
=> gemini://tilde.team/~jonathan/music/ Jonathan's noughties music reviews
=> gemini://konpeito.media The legendary Konpeito quarterly mixtapes
=> gemini://kovok.band/ Kovok, possibly the first band on Gemini
=> gemini://republicofsound.flounder.online/ Republic of Sound, free album downloads
=> gemini://rawtext.club/~sloum/musicmachine/ Music Machine, short album reviews
=> gemini://oberdada.pollux.casa/metal_intro.gmi Oberdada's Guide to Obscure Metal

```

### Photography [](#photography) ###

```
=> gemini://158.nu 158.nu's film photography hobby projects
=> gemini://kota.nz/pics/ Kota's pics

```

### Recipes [](#recipes) ###

```
=> gemini://rawtext.club/~sloum/cgi/recipes/ A searchable index of 1,000 recipes
=> gemini://breadpunk.club/~rye/ Rye, a collection of vegan, mostly soy-free recipes
=> gemini://gemini.circumlunar.space/users/hundredrabbits/recipes.gmi Vegan recipes from Hundred Rabbits

```

### Indigenous Language [](#indigenous-language) ###

```
=> gemini://taisui.space/tatis/index.gmi Siɂisim Tatis, a smol newsletter in Chinuk Wawa

```

### Permacomputing & Essays [](#permacomputing-and-essays) ###

```
=> gemini://perma.computer/letter Technological Futures: A Letter to the Smolnet
=> gemini://smol.earth/manifesto.gmi Personal computing in the Anthropocene with eyes, minds and hearts wide open
=> gemini://idiomdrottning.org/texts.gmi Idiomdrottning's collected texts
=> gemini://midnight.pub/posts/163 Nick Cave on finding good ideas

```

### Software & How-tos [](#software-and-how-tos) ###

```
=> gemini://skyjake.fi/lagrange/ Lagrange, a Gemini browser
=> gemini://makeworld.space/amfora-wiki Amfora Wiki
=> gemini://rawtext.club/~sloum/spacewalk.gmi Spacewalk
=> gemini://qwertqwefsday.eu/agate.gmi Agate, a Gemini server
=> gemini://gemini.smallweb.space/HOWTO/managing-your-own-capsule.gmi How to self-host a capsule
=> gemini://aelspire.info/posts/2022-07-28-dotfiles/post.gmi Managing dot files
=> gemini://srht.site/ SourceHut Gemini hosting
=> gemini://srht.site/quickstart.gmi SourceHut's quick start guide
=> gemini://glv.one glv.one, PaaS that runs any Gemini server in the cloud
=> gemini://gemini.omarpolo.com/cgi/gempkg/ gempkg, an interface to the OpenBSD ports collection

```

### Tools & Services [](#tools-and-services) ###

```
=> gemini://gemi.dev/cgi-bin/waffle.cgi NewsWaffle, read any news website via Gemini
=> gemini://gemi.dev/cgi-bin/wp.cgi Gemipedia, Gemini frontend to Wikipedia
=> gemini://gemi.dev/stargate.gmi Stargate, public Gemini-to-HTTP gateway
=> gemini://rawtext.club/~sloum/geminews/ Geminews, an NPR, CSM, and CNN mirror
=> gopher://nihirash.net:7000/1/ Gopher web proxy
=> gemini://ur.gs/ ur.gs, English-Spanish translator
=> gemini://rawtext.club/~sloum/cgi/weather US weather reports by zip code
=> gemini://tilde.cafe/~stack/weather Weather forecast powered by wttr.in
=> gopher://gopher.floodgap.com:70/1/groundhog/us/zipcode%3F97526 Takelma weather
=> gopher://tilde.pink:70/1/~bencollver/dir/ Gopher Google directions
=> gemini://houston.gmi.bacardi55.io Houston, check whether a capsule is up
=> gemini://hashnix.club:1958/ hashnix.club email service
=> gemini://kevachat.duckdns.org KevaChat clearnet node
=> gemini://kvazar.duckdns.org Observe the Kevacoin Universe
=> gemini://betahowto.duckdns.org Yggdrasil DokuWiki satellite

```

### Other Link Collections [](#other-link-collections) ###

```
=> gemini://rawtext.club/~winter/links/ Winter's link garden
=> gemini://hnr.fyi/research.gmi Honor Ash's collected resources on degrowth, communities & scale, and more
=> gopher://tilde.pink/1/~bencollver/links/ bencollver's links list
=> gemini://gemini.ctrl-c.club/~aesophod/bookmarks/bookmarks.gmi ~aesophod's bookmarks
=> gemini://gemini.ctrl-c.club/~zenspace/bookmarks.gmi ~zenspace's bookmarks
=> gemini://gmi.hedy.dev/blogroll.gmi hedy's blogroll
=> gemini://eluum.net/link-garden.gmi eluum's link garden
=> gemini://gemini.cyberbot.space/links.gmi kelbot's links
=> gemini://nytpu.com/feed.gmi nytpu's list of capsules and gopherholes
=> gopher://box.matto.nl:70/1/phlogroll phlogroll
=> gopher://box.matto.nl:70/1/burrows-of-interest Burrows of Interest
=> gemini://station.martinrue.com/softwarepagan/4f077db00e7541b082403650735d954d Station thread: everyone's coolest Gemini links

```

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