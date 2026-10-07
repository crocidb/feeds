+++
title = "Here Is a Person: Enter the Tildeverse"
description = '''The essay I promised back in May. A history of public-access Unix from Dennis Ritchie's 'fellowship' and Grex's potluck dinners to Paul Ford's drunken tilde.club and \~vilmibm's birthday gift to themself; a tour of the seven tildes I call home (including the starship I captain on'''
date = "2026-10-06T02:00:00Z"
url = "https://brennan.day/here-is-a-person-enter-the-tildeverse/"
author = "mail@brennanbrown.ca (Brennan Kenneth Brown)"
text = ""
lastupdated = "2026-10-06T13:46:49.609623470Z"
seen = false
+++

In the fall of 2014, writer Paul Ford was a couple drinks in and reading [a 2004 Thanksgiving letter Stevie Nicks posted online](http://rockalittle.com/thanksgiving2004.htm), addressed "Dear all Armed Forces Members\~" (it's still up, and a great read).

Ford was perplexed by all the tildes she sprinkled throughout her writing. His wife Mo, who grew up in California, told him "that's a west coast thing... it's more like handwriting." If you asked me, I'd tell you that a tilde at the end of a sentence in informal online communication is supposed to signify a playful, flirty, cute, or sing-songy tone.\~

But a friend online had a different answer: "tildes are only ever properly used in front of usernames on shared hosting."

And that answer sent Ford back to the 90s, because back then, homepages existed at URLs like `CyberFox.net/~vixen`. In [the essay he wrote about what happened next](https://medium.com/message/tilde-club-i-had-a-couple-drinks-and-woke-up-with-1-000-nerds-a8904f0a2ebf), he put it like this.

>
>
> The "**\~**" is a little like the "@" on Twitter—a shortcut that says: "Here is a person."
>
>

**Here is a person.**

Back in May I promised an essay on the Tildeverse, when I [finished building `writer-cli`](https://brennan.day/introducing-writer-cli-a-bash-tool-i-built-from-scratch-to-blog-in-the-terminal/), which was a bash tool inspired by the blogging of [Tilde.town](https://tilde.town). And I wrote that the essay was on hold because the [Copy Fail](https://copy.fail/) kernel vulnerability had forced tilde admins to shut things down. It's October now. The doors are (mostly) open again.

I now have seven tilde accounts! Eight, technically, but we'll get to the locked one. This week, I mirrored every single one of my home directories onto my laptop and into [a git repository](https://github.com/brennanbrown/tilde), and wrote a little wiki to go along with it. This essay is what I learned doing that.

I also want to remind you that [Wikipedia deleted its article on the tildeverse](https://en.wikipedia.org/w/index.php?title=Special:Log&logid=102824464) because there was "[n]o coverage available in reliable sources, provided sources are non-independent." Never mind that [Hackaday covered it in 2024](https://hackaday.com/2024/09/14/taking-back-the-internet-with-the-tildeverse/), or that cosmic.voyage's founder James Tomasino gave [an entire talk on the small internet at MCH2022](https://media.ccc.de/v/mch2022-83-rocking-the-web-bloat-modern-gopher-gemini-and-the-small-internet). Consider this my contribution to attempting to legitimize the canon.

What Is a Tilde, Anyways? [](#what-is-a-tilde-anyways)
----------

On a Unix-like/Linux system, the `~` character is shorthand for your home directory. That's the folder that belongs to you, specifically. When web servers started letting each user publish a folder called public\_html, the tilde was visible in the URL and address bar, at `https://example.com/~username`.

A tilde became shorthand for the term for a computer shared by strangers. You apply for an account, send the admins an SSH public key, and once you're approved you log in via the terminal. You get a home directory, a homepage at `host/~you`, and sometimes also a [gopherhole and Gemini capsule](https://brennan.day/gemini-gophers-and-fingers-oh-my-alternative-internets-beyond-https/) as well.

You get a lot with this, actually. Like local mail, IRC chat, a bulletin board, community games, and small programs written by your neighbours for your neighbours. An older term for a shared computer is a pubnix, short for public-access Unix system.

Ford's definition is this:

>
>
> Tilde.club is one cheap, unmodified Unix computer on the Internet. That's it. That's all it is. It is no more than that. If you look for more for it to be you will find nothing.
>
>

There's no business model, no "community" in scare quotes disguising a growth strategy. It's a box. Strangers log in. Things happen!

When I first stumbled upon the tildeverse, I compared it to [public access television](https://brennan.day/announcing-my-new-radio-show-a-love-letter-to-public-access-television/), and I still think that's right. A tilde is a community media centre with the computer already set up. Nobody gives you notes, you just show up.

Ford also wrote that "as a human being reading Medium, you are not expected to worry about, write think-pieces about, or concern yourself with tilde.club." I am a human being who writes on Medium. Whoops. Sorry, Paul.

A System of Fellowship (Early UNIX) [](#a-system-of-fellowship-early-unix)
----------

Strangers sharing a computer is not a recent invention by any means. Really, it's why Unix exists at all.

In 1969, Ken Thompson, Dennis Ritchie and their colleagues at Bell Labs were losing access to Multics, the time-sharing system they'd been working on. In his history of those years, [*The Evolution of the Unix Time-sharing System*](https://cs.nyu.edu/~mwalfish/classes/15sp/ref/ritchie79evolution.html), Ritchie explains what they were actually trying to save:

>
>
> What we wanted to preserve was not just a good environment in which to do programming, but a system around which a fellowship could form. We knew from experience that the essence of communal computing, as supplied by remote-access, time-shared machines, is not just to type programs into a terminal instead of a keypunch, but to encourage close communication.
>
>

A fellowship! Not a faster compiler. This is why even the earliest Unix systems shipped with the social commands of who, write, and mail, and why the [finger command and its .plan files](https://brennan.day/gemini-gophers-and-fingers-oh-my-alternative-internets-beyond-https/) became the first social media profiles.

As researcher (and fellow tilde-dweller) `~cmccabe` writes in his [history of public access Unix systems](https://tilde.town/~cmccabe/online-communities.html), "at its core, Unix has a social architecture." The first two public systems, M-Net in Ann Arbor and Chinet in Chicago, both opened in 1982.

Users dialed in by modem, and because long-distance calls were expensive, everyone on a system tended to live in the same calling area. You might meet someone online and find they only live a few blocks away. By their peak in the early 1990s, the "nixpub" list of public Unix systems circulating on Usenet had well over a hundred entries. `~cmccabe` now maintains the [Pubnix History Project](https://github.com/cwmccabe/pubnixhist) to keep track of them all.

My favourite story from this era is the founding of [Grex](https://grex.org/history.xhtml). M-Net's owner at the time had a habit of threatening to shut the whole system down, forever, "on 3 hours notice or less" if user donations didn't cover the bills that month. So, a dozen users started meeting weekly for six months to plan an alternative. Founding member Valerie Mates remembers:

>
>
> A group of a dozen users met weekly for six months, planning a new system, owned by its members and founded on slow, group decisionmaking. We ate lots of pot luck dinners together and planned lots of idealistic ideas about how Grex would work.
>
>

She also remembers that one of those founders' meetings happened "on the night when the US first bombed Iraq. It was hard to concentrate on issues as mundane as a computer system." Grex opened in 1991 as a member-owned cooperative, and it's still online today.

This era is also what gave us [the Super Dimension Fortress](https://brennan.day/a-love-letter-to-the-super-dimension-fortress/), which I've written about, and has been running continuously since 1987.

Commercial services like AOL, Prodigy, and CompuServe brought millions of people online, and cmccabe identifies two consequences for the old pubnixes: online time became less precious (so people became less careful about how they behaved), and a small number of bad actors started abusing open systems for spam and attacks, forcing many to lock down services. Usenet veterans called this period the Eternal September.<sup class="footnote-ref"><a href="#fn1" id="fnref1">[1]</a></sup>

The World Wide Web adopted the tilde for itself (those `isp.net/~user` homepages were among the first personal webpages), and then it was gone when different services popped up like GeoCities, blogs, and eventually social media. As Ford observed, the servers never went anywhere:

>
>
> Fast forward 20 years: Your typical "cloud" Unix server, designed in the 1970s to be a very social place, is today a ghost town with one or two factories still clanking in the town square—factories that receive our email, or accept our Instagram photos and store them, and manage our data. But there's no one walking around and chatting downtown.
>
>

He continues:

>
>
> So: We collectively took a very social computing platform, papered over its social parts, and used it to build a social computing platform.  
>  Purely for kicks, I decided to turn the social part back on and throw a nerd party.
>
>

A Couple of Drinks and a Thousand Nerds (Tilde.Club) [](#a-couple-of-drinks-and-a-thousand-nerds-tilde-club)
----------

On September 29, 2014, Ford [tweeted](https://www.ftrain.com/tweet-516778930515476480): "i just registered tilde.club so if anyone wants a shell and public\_html (no CGI) lmk." A little later, [another](https://ftrain.com/tweet-516794729619787776): "okay tilde.club is up and i'm going to bed i'll make accounts in the next few days you're all getting doofy passwords."

He'd booted up "Amazon's cheapest and weakest fragment of a cloud computer," somewhere in Virginia. The next day, he woke up to a hundred people asking for accounts. Here's a couple excerpts from the welcome email he sent out:

>
>
> Who am I? I am the system administrator, Paul Ford. Like any system administrator, I will be slow to respond, will get everything wrong, and will act imperiously while never acknowledging wrongdoing. Consider this part of your authentic tilde.club experience!
>
>
>
> * No drama. What constitutes drama? There is a Mary J. Blige song called "No More Drama." If Mary J. Blige would think it was drama, it is drama.
> * This is a guilt-free project and total disaster is ALWAYS a possible outcome.
>
>

He also wrote that the server was already "a de-facto whitey sausagefest," and asked everyone to "be actively, aggressively cool and sweet." Small, technical, nostalgic spaces frustratingly have a way of becoming clubhouses for a narrow slice of people.

Within a few days, Ford had handed out around six hundred accounts, and the server "began to gasp and wheeze." At least a thousand more people were on the waitlist. People sent PayPal donations, and one member, `~danbri`, arranged to have $24 in an envelope slid under the door of Ford's Brooklyn apartment. ("More revenue than most websites I guess?") Volunteer sysadmins showed up. Users built webrings, a page listing who was logged in, a talking cow, and "an atomized version of Enya."

The project shifted, as Ford put it, "from 'I' to 'we,' and from 'mine' to 'ours.'"

Then reality set in. Writing years later [on his tilde.club page](https://tilde.club/~ford/), Ford described it as "a fun accident that became an all-consuming month of late-night labor, thousands of emails, a lot of overthinking, and at least one (somewhat joking) offer of acquisition." After that month, he said, "I sent it upstate to live on the shame farm with all the other projects that give me recurring guilt. And kept paying the server bills."

In September 2019, tildeverse sysadmin Mike Buchholz [offered to take tilde.club over](https://ftrain.com/tweet-1172545886968324098), along with a backlog of more than 10,000 people who'd asked for accounts. tilde.club reopened on September 20th, 2019, with `~deepend` and `~benharri` as its new admins. Ford noted that one of the very first conversations on the new server was about writing a code of conduct. And then he left the community with this:

>
>
> The lesson I take from tilde.club is that you can, at any time, for very little money and relatively little effort, stand up a tiny digital community that basically belongs to itself. And it's just as valid as any other community. I am certain we need more spaces like this, places where you can experiment and be both dumb and kind in equal measure and people either leave you to it, or help you along.
>
>

A Birthday Present (Tilde.Town) [](#a-birthday-present-tilde-town)
----------

Meanwhile, back in October 2014, `~vilmibm` had been enchanted by tilde.club, gotten an account, but it became full before any of their friends could join. A few days later was their birthday, October 11th. In a [retrospective written for the town's third birthday](https://tilde.town/~vilmibm/thoughts/year3.html), they describe it:

>
>
> I spent my birthday mostly alone. It was a nice day. I read in the graveyard, ate doughnuts, drank good coffee. I had wine with my friend at a nice bar. When we got home, I knew exactly what I really wanted for my birthday: a server just like tilde.club where anyone could come that would be as welcoming as possible to everyone. A place so unlike modern social media as to provide a bastion against the shit of the networked world.
>
>

`~vilmibm` and `~cmr` stayed up all night setting it up, "blasted ultrapop and j-pop and had color changing lights going." The goal, as `~vilmibm` wrote on their [town shrine](https://tilde.town/~vilmibm/town.html), was to "take the mechanical aspects and general spirit of tilde.club but make a place that was more inclusive of less technical folk and would never have a user limit." The [town FAQ](https://tilde.town/~wiki/faq.html) describes it as expanding tilde.club's mission "with a more expansive and radical vision."

That place became [tilde.town](https://tilde.town/). It now runs on a pink server covered in stickers, in a rack in Ottawa, hosted by [Colocataires](https://colocataires.dev/), a tiny "host with friends" company run by two Ottawa locals, one of whom is longtime townie `~insom`.

`~vilmibm` published a puppet module, so anyone could start their own tilde. And people did. Today, [the tildeverse](https://tildeverse.org/) has [thirteen member tildes](https://tildeverse.org/members/), each run by its own volunteers, and together they share a surprising amount of infrastructure: the [tilde.chat](https://tilde.chat/) IRC network, a Mastodon instance at [tilde.zone](https://tilde.zone/), a git forge at [tildegit](https://tildegit.org/), the cross-tilde [BBJ](https://bbj.tildeverse.org/) bulletin board, a link aggregator at [tilde.news](https://tilde.news/), [a zine](https://zine.tildeverse.org/), [a journal](https://journal.tildeverse.org/), a [BookWyrm](https://bookwyrm.tilde.zone/) instance, and (of course) a community radio station at [tilderadio.org](https://tilderadio.org/).

My Homes [](#my-homes)
----------

|                    Home                    |                What it is                |           What I do there            |
|--------------------------------------------|------------------------------------------|--------------------------------------|
| [tilde.town](https://tilde.town/~brennan/) |  the community-first tilde, since 2014   |my feels journal, a plant, a guestbook|
|     [tilde.pink](https://tilde.pink/)      | a NetBSD tilde with no web server at all |          my Gemini capsule           |
| [tilde.club](https://tilde.club/~brennan/) |         the original, since 2014         |          a bashblog weblog           |
|         [SDF](http://bren.sdf.org)         |         the ancestor, since 1987         |hand-written HTML and a Perl guestbook|
|  [cosmic.voyage](https://cosmic.voyage/)   |   a pubnix built around a sci-fi story   |         I captain a starship         |
|   [envs.net](https://envs.net/~brennan/)   |  a minimalist Debian tilde, since 2019   |        mail and chat (mostly)        |
|[tilde.green](https://tilde.green/~brennan/)|a 2022 tilde for "creativity and wildness"|    my newest and still exploring     |

I have an eighth account on [tilde.team](https://tilde.team/), but shell access there has been disabled since August, for reasons I'll get into below.

Each is a different machine, running different operating systems, defaulting to different shells, and each has their own quirks. I wrote a shell script that pulls my home directories onto my laptop:

```bash
rsync -az --timeout=60 --delete --exclude-from=sync.excludes brennan@tilde.town:~/ town/
rsync -az --timeout=60 --delete --exclude-from=sync.excludes brennan@tilde.pink:~/ pink/
rsync -az --timeout=60 --delete --exclude-from=sync.excludes brennan@tilde.club:~/ club/
# ...and so on

# SDF does not permit rsync, pulls via tar over SSH.
ssh sdf.org 'tar czf - -C ~ --exclude=./gopher --exclude=./html .' | tar xzf - -C sdf/
```

The `--delete` flag means anything removed on the server is removed locally, since the folders are mirrors, not archives. SDF doesn't allow rsync at my membership level, so I stream a tarball over SSH instead.

Let me take you on a brief tour of my tildes.

### tilde.town [](#tilde-town) ###

I joined in January of this year, and there was a welcome letter and a little poem:

```
It has come and gone  
he cut a thick slice from his loaf  
stopped when his father stopped

```

My home directory has a guestbook.txt file which any other user on the server can write to. The very first signature is from the town's founder: "hi, welcome!!!! `~vilmibm`." The second is from `~fruit`, who said my homepage was "pretty 🌈" and that they loved my "little ascii garden 😃". The third, from `~oxis`, is in [toki pona](https://tokipona.org/): mi jan Malin. ijo sina li musi a! (Roughly: "I'm Malin. Your thing is so fun!")

The town's commands use the launcher command `town`. There's `town feels` for journaling, `town bbj` for the forum, `town graffiti` for a communal web page anyone can edit, `town poem` and `town nicethings` for little daily texts, `town chess`, `town tron`, and an alarming number of other games. My favourite thing is the feels engine, [ttbp](https://github.com/modgethanc/ttbp), written by `~endorphant`. Its README describes it as "a little bit like livejournal or dreamwidth or tumblr," explaining why I [fell so hard for Dreamwidth](https://brennan.day/dreamwidth-and-yearning-for-humanity-on-the-web/) a few months later. You type `feels`, your editor opens to a plain text file for today's date, and when you save and quit, your entry shows up in the global feed for everyone on the server. In my very first entry, I wrote:

>
>
> This feels private and personal, but yet does have public access if you know how and where to look.
>
>

The [tildeverse wiki page for tilde.town](https://tilde.wiki/Tilde.town) is a "shrub" rather than a stub, and contains such vital facts as "On tilde.town, everyone is a jellyfish," and "If tilde.town were a plant, it would be a tree eating a bicycle that was tied up to it twenty years ago." I have nothing to add.

### tilde.pink [](#tilde-pink) ###

[tilde.pink](https://tilde.wiki/Tilde.pink) runs NetBSD, and is the only tilde with no `public_html` folder. It's a "web free tilde," serving only gopher and Gemini. The default shell is `csh`. Packages live in `/usr/pkg/bin` and it's been fun learning BSD with it.

My capsule at [`gemini://tilde.pink/~brennan/`](gemini://tilde.pink/~brennan/) has my Gemini guides, my gemlog, Gemini-only poetry, shelf pages for books and films and music, and a `.finger` card. Its emoji favicon (yes, [that's a thing in Gemini](https://brennan.day/creating-a-blog-in-gemini/)) is 🔆. If you've read my guide to blogging on Gemini, this capsule is where it was born.

### tilde.club [](#tilde-club) ###

The original! Today, it runs Fedora, which is why my home directory there was 106 megabytes, nearly all of it a package cache. My weblog on club runs on [bashblog](https://github.com/cfenollosa/bashblog), a blog engine that is a single bash script. My first and so-far-only post there reads, in part, "Let's see if I keep this updated! I have so many blogs now, hehe." (I have not kept it updated.)

### SDF [](#sdf) ###

SDF isn't a member of the tildeverse, it's an ancestor. My login is `bren`, and my files don't live in my home directory, but in paths elsewhere on the system that my home directory symlinks to. I've written [a love letter to SDF](https://brennan.day/a-love-letter-to-the-super-dimension-fortress/), including how I built a flat-file Perl CGI guestbook there, so I'll just add one thing: in that third-birthday retrospective, `~vilmibm` mentions having had an SDF account before founding the town, but finding it "kind of stark and overwhelming (no offense, I love y'all!)." I think every generation of these places is built by people who loved the last one, but wanted something a little warmer and more accessible.

### cosmic.voyage [](#cosmic-voyage) ###

[cosmic.voyage](https://cosmic.voyage/) is unique, in that it's both a pubnix and a collaborative science-fiction story! It was founded on [November 20, 2018](https://tilde.wiki/Cosmic.voyage) by James Tomasino, who, according to [his MCH2022 speaker bio](https://program.mch2022.org/mch2022/speaker/H3BRE7/), was once a nuclear electronics technician in the US Navy and "spent time as a Jesuit while exploring a religious vocation." The homepage sets the scene:

>
>
> Humanity has expanded to the stars. Earth is a distant memory.
>
>
>
> We journey into the darkness not in a great migration--as many thought--but in small communities, drifting far and traveling at relativistic speeds, dividing from each other by unfathomable distance and time. Our only connections are the thin tethers of the Quantum Entanglement Communicator (QEC). These precarious devices bridge the vast distances with near-instantaneous communication, but provide only enough bandwidth to the ancient relay hub for simple, plain-text messaging.
>
>

The limitation of a text-only Unix server *is the worldbuilding*. Of course every message is plain text, for the QEC can't carry anything else.

Every user claims a ship, colony, or outpost with the `ship` command, writes messages as plain text files in its directory, and publishes them to the relay with `log`, which pushes them out over the web, gopher, and Gemini at the same time. No line may be longer than 80 characters. And there are only a few rules, like don't entangle another author's storyline without asking first, don't break the system, and don't blow up Earth (or else your ship is from another reality and the crew all have goatees).

Let me tell you about the story I began. I wanted to write an Indigenous sci-fi story, so my ship is called *Genawaaboonagak*. I borrowed the name from the lead rescue vessel of the [Grand Portage Band's coast guard](https://ictnews.org/news/grand-portage-band-launches-first-indigenous-led-coast-guard-on-lake-superior/) on Lake Superior. When the US Coast Guard closed its Grand Marais station in 2022, the Grand Portage Band of Lake Superior Chippewa stepped in and launched the first Indigenous-led coast guard in the nation. Their first boat was christened in September 2025, and *Genawaaboonagak* is an Ojibwe word which translates as "Watchers Over the Water."

The sci-fi *Genawaaboonagak* is a tender on a centuries-long voyage. The mission is to seed and tend a chain of small, solar-powered observers (the "watchers") along its route, each carrying a small intelligence, dropped off to listen alone for decades. Think lighthouse tender, or buoy-layer, or firewatcher. The captain was born aboard, inherited the rank, and will die long before the destination. The logbook is handed from master to master, the way nautical age-of-sail logs were, which I researched in my [history of blogging](https://brennan.day/a-450-year-history-of-blogging/). Here's the start of my [first transmission](https://cosmic.voyage/Genawaaboonagak/001.html), published October 3rd as message #1079 on the relay:

```
REMARKS ON BOARD GENAWAABOONAGAK
Mission Day 4388, Book V of the continuous log
this entry: E. Brown-Okimakan, Master and Keeper

Ascension   07h 39m 22s     Declination    +19 deg 11'
Distance    2.87 ly         Fix            RS001 two-star
Solar flux  340 W/m2        Sail           main brailled for docking
Watchers afield: twelve

AM:  Watcher-12 separated clean at 0412. Antenna deployed,
     self-test nominal; she called home four minutes after.
     Fourth bird this year; the rack is down to three.
     Mustered the crew to see her off. She will burn alone
     for thirty years, and hear us no more than we hear
     her. There is no lonelier berth than a watcher's.

```

The [second](https://cosmic.voyage/Genawaaboonagak/002.html), "Fair Third Night," went out today as message #1080. When you read the relay, you notice there's a sparseness (which could be remedied by more people signing up) and a lot of messages are about the silence itself.

There's [*The Meridian*](<https://cosmic.voyage/The Meridian/entry001.html>), a horror story about a corporate cruiser sent to find life "not our equals out here among the stars, but our betters," whose surviving captain writes: "I don't even know if anyone is reading this, or if all this amounts to is a ... screaming into the void." There's a ship called [*DesignationUnknown*](https://cosmic.voyage/DesignationUnknown/journal.1.html) whose only message is an automated log of cascading failures. There's Azura, alone on a junk planet aboard [*Spiegel*](https://cosmic.voyage/Spiegel/transmission_attempt_3.html), who ends her transmission with: "If anyone has any information on 'yellow dragon trade-lines', please leave a message. Also, any life advice is appreciated." I might have plans.

### [envs.net](http://envs.net) and tilde.green [](#envs-net-and-tilde-green) ###

[envs.net](https://envs.net/) has been around since September 2019 and describes itself as "a minimalist, non-commercial shared linux system and will always be free to use." It has over 1,500 users and one of the longest service lists in the tildeverse: XMPP, Pleroma, a twtxt registry, a public DNS resolver, a SearXNG instance, and more. My `.bash_aliases` file there is full of helper functions for [twtxt](https://brennan.day/twtxt-simple-decentralized-microblogging-with-status-lol/) and the [0x0.st](http://0x0.st) file host.

[tilde.green](https://tilde.green/) launched in 2022 and calls itself "an open community that thrives of creativity and wildness." Its homepage says: "we don't mind if you register and stay idle, but we'd appreciate if possible if you could join our little community" and I'm excited to participate in that community!

### The Commonalities [](#the-commonalities) ###

The default `.plan` file on tilde.town reads "This is my .plan file. There are many like it, but this one is mine." On [envs.net](http://envs.net), the default gophermap for every new user reads, "this is my gopher page. there are many like it, but this one is mine." And my never-touched Gemini page on tilde.club reads, "this is my gemini page. there are many like it, but this one is mine." It's a riff on [the Rifleman's Creed](https://en.wikipedia.org/wiki/Rifleman's_Creed), via *Full Metal Jacket*, and apparently every sysadmin in the tildeverse appreciates it.

Asbestos in the Walls [](#asbestos-in-the-walls)
----------

On April 29th, 2026, security researchers at Theori disclosed [CVE-2026-31431](https://en.wikipedia.org/wiki/CopyFail), which they named [Copy Fail](https://copy.fail/). It's a logic bug in the Linux kernel that lets any unprivileged local user get root with a 732-byte Python script, on nearly every major Linux distribution. [Xint's write-up](https://xint.io/blog/copy-fail-linux-distributions) explains how the exploit corrupts the in-memory copy of a file without ever touching the disk, so integrity checks don't detect it.

For most servers, "unprivileged local user" isn't a concern. For a tilde, though? That's everything. A pubnix is a Linux machine that *hands shell accounts to strangers on the Internet*.

On [tilde.town's own web log](https://tilde.town/blog.html), on May 15th it's written "tilde.town is currently locked down. there is a very serious kernel vulnerability that has no mitigation and we can't allow user sessions until it's patched." The next day, when Debian shipped a fixed kernel, the doors reopened, but with a somber note:

>
>
> i don't know about you but these times have me thinking: are pubnixes viable anymore?
>
>
>
> i find myself wanting something *else*, something other than linux, to allow us to hang out on this little box in canada. but is that even a solution in an age of vulnerability conveyor belts for arbitrary codebases?
>
>

Then, on May 24th: "hey look, it happened again." Locked down again. On May 26th, open again: "we have crammed yet more asbestos into the town walls to ensure that the fire cannot read inside our cozy confines." By June, the admins had disabled kernel modules and `io_uring` entirely, just to be safe.

The town admins raised the question regarding "how to handle the files that older users put here in a more innocent age prior to moving on from town. what is our responsibility toward them? should we secret scan? archive and remove old home dirs?" Ten years of abandoned home directories, some containing sensitive information from a more innocent age, now vulnerable.

In August, [tilde.team got hacked](https://tilde.team/news/036_outage). Its admin, `~ben`, wrote that "someone was able to gain a root shell and ran `rm -rf /`. There's very little left to track down what happened or who did it." Thankfully, he takes daily backups, so users lost a couple hours of files at most. Sadly, several of the tildeverse's *shared* services, including tildegit, tilde.news, the BBJ forum, [write.tildeverse.org](http://write.tildeverse.org), and the zine, had been running on that same machine. He's been moving them, one by one, to a new server. Shell access is still disabled. That's my eighth, locked account.

Back in 2014, in the Hacker News thread about Ford's essay, [one commenter](https://news.ycombinator.com/item?id=8432703) laid out "a lot of good reasons why nobody runs shell servers anymore": the possibility of a secret FBI letter demanding access to users' accounts, becoming a host for spam and DDoS attacks, "spending the great majority of your time preventing 1% of your users from ruining the internet," and the takedown notices.

All of it true. People run them anyway.

A tilde is one computer that many people share. Assume little is private. Never store passwords, private keys, or API tokens on a shared host. Use one SSH key per device. Put a passphrase on every key. Turn on two-factor login where it's offered. Treat everything in `public_html`, `public_gopher` and `public_gemini` as public. It is.

I learned these lessons first-hand a couple weeks ago when my MacBook was wiped completely (a long, dumb story), and I lost one of my SSH keys. Because I'd already been using separate keys across different hosts, and kept copies of the others on my homelab, I could still get back into everything. The biggest casualty was my Gemini client certificate.

Who Tends the Commons? [](#who-tends-the-commons)
----------

The technical fragility gets the headlines. But the thing that actually kills small communities is human. The sysadmin burns out, the bills don't get paid, or the culture gets poisoned.

Remember Ford's "shame farm." Remember M-Net's owner threatening to pull the plug with three hours' notice. In August 2020, when tilde.town hit the front page of Hacker News, the town's founder [wrote a comment](https://news.ycombinator.com/item?id=24300907) about how they handled this:

>
>
> Certain users sign up to abuse resources; that's easy to catch and deal with. Other users want to import the wider culture war aspects of the internet into our space, using a variety of tactics to provoke anger and discomfort.  
>  I'm a generally conflict-avoidant person so this took getting used to. On the server, I had to learn to be willing to ban the persistent trolls.
>
>

They "made the signup intentionally cumbersome, wracked with nerves about the 'good' folks who might be intimidated." They credited two books: Howard Rheingold's [*The Virtual Community*](https://www.rheingold.com/vc/book/intro.html), and Mathieu O'Neil's [*Cyberchiefs: Autonomy and Authority in Online Tribes*](https://researchportalplus.anu.edu.au/en/publications/cyberchiefs-autonomy-and-authority-in-online-tribes/), which helped them "understand that all communities that manage to grow over time will hit an unsustainable point and either retract or dissipate." The town chose retraction. "In retrospect, it was the right choice."

I've written before [about tending the commons.](https://brennan.day/good-standard-work-creating-the-commons/) Elinor Ostrom won the Nobel Prize in Economics for demonstrating that communities can manage shared resources without either a corporation or a government running them, so long as they follow patterns. In *Governing the Commons*, she laid out [eight design principles](https://www.lincolninst.edu/app/uploads/2024/04/2076_1399_LP2008-ch02-Design-Principles-of-Robust-Property-Rights-Institutions_0.pdf) that long-lasting commons tend to share.

The healthiest tildes, whether they know it or not, follow a lot of them:

* **Clearly defined boundaries:** manual signups, where a human reads your application. Ostrom notes that when boundary rules aren't well defined, "strangers who discover a valuable resource may start to use it," and overuse it.
* **Collective-choice arrangements:** the people affected by the rules get a say in changing them. The tildeverse literally has [an RFC system](https://rfc.tildeverse.org/) for network decisions. Grex was founded on "slow, group decisionmaking."
* **Monitoring by the users themselves:** the admins are townies too.
* **Graduated sanctions:** a warning, a killed process, a temporary ban, and only then a permanent one.
* **Conflict resolution:** a code of conduct, which, remember, was one of the first things discussed when tilde.club came back in 2019.

A commons is not a place without rules. It's a place where the people who live there make the rules, not a profit-first amoral corporation, or a detached corrupt bureaucracy.

It's Okay to Not Log In for a Few Years [](#its-okay-to-not-log-in-for-a-few-years)
----------

In October 2023, `~vilmibm` wrote a post on the town's web log for its ninth birthday:

>
>
> I started the town for selfish reasons: I was lonely and I wanted some friends. It worked! As the years advanced, though, my meatworld social circumstances changed. I was spending less time online and was focusing less on the town. It's no longer my friendship honeypot. I see new users show up, though, and meet each other; in many of them I see my younger self stumbling out of the vicious nightmare of social media and groping for community in a post-facebook internet.
>
>

At that point, the town had over 3,000 registered accounts, but the homepage still said "population around 1,000," because "I don't think there is value in trying to have an 'accurate' number there." They described the town as "an old community center full of the scraps from art projects and parties... Also, the community center is floating in space and time." And then:

>
>
> We're all in this for the long haul. There's no VC exit, no runway. An algorithm is not going to shuffle any of this stuff out of view. There is no database that can go down. It's just a computer. Take your time. It's okay to not log in for a few years.
>
>

Looking at my feels entries, I wrote only nine this year. Several start with some version of "It's been awhile, hasn't it?" One, from April, includes: "I just connected to tilde.town via ssh for the first time in months, and my inbox is full! I wish I was better at the shortcut commands, I feel like such a zoomer not knowing how to navigate, but it is really good practice for terminal use."

And then there's my plant. tilde.town has a game called [botany](https://github.com/jifunks/botany), written by Jake Funke (`~curiouser`): "A command line, realtime, community plant buddy." You get a seed. You water it every day. "5 days without water = death. Your plant depends on you and your friends to live!" According to my save file, I watered my seed exactly once: on January 14th, the day I joined.

But there's also another file, `visitors.json`, that records who else came by to water it. `~fruit` (the same `~fruit` who signed my guestbook) watered it the very next day. And then again on May 1st. And again on May 11th. Months after I'd stopped checking. Long after it could have mattered to the plant. A stranger who kept showing up for my little ASCII seed.

Oh, and the epigraph at the top of botany's README? It's the same Alan Watts quote I used in [yesterday's essay](https://brennan.day/why-i-write-and-care-about-the-internet-and-what-so-many-people-get-wrong/): "We do not 'come into' this world; we come out of it, as leaves from a tree." Yesterday, I wrote that the Internet isn't a story, it's a place, and that places are only as good as the people who show up and care and tend. Howard Rheingold said something similar when he joked that a more accurate title for *The Virtual Community* would have been:

>
>
> "People who use computers to communicate, form friendships that sometimes form the basis of communities, but you have to be careful to not mistake the tool for the task and think that just writing words on a screen is the same thing as real community."
>
>

A tilde is just a computer, the tending is the community.

How To Join [](#how-to-join)
----------

If you've read this far, maybe you're tempted? Good. Here's how to move in.

**1. Pick a server.** Browse the [member list](https://tildeverse.org/members/).

**2. Make an SSH key.** This replaces passwords with a key pair. The private key never leaves your computer; you send the server only the public half.

```bash
ssh-keygen -t ed25519 -C "you@example.com"
cat ~/.ssh/id_ed25519.pub   # this is the part you send
```

Accept the default path, and set a passphrase. If you've never done this before, [GitHub's guide to generating an SSH key](https://docs.github.com/en/authentication/connecting-to-github-with-ssh/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent) is a good walkthrough, even if you're not using it for GitHub.

**3. Apply, and actually write something.** Most tildes ask for a username, an email, your public key, and a sentence or two about why you want to join. Approval is manual, so expect days, not minutes. And as `~vilmibm` noted in that birthday post, mostly-empty applications (or ones with a typo in the email address) often just can't be accepted. Tell them who you are. You're applying to join a digital neighbourhood, not signing up for an app.

**4. Log in and look around.**

```bash
ssh yourname@tilde.town
```

Type `yes` to trust the server the first time. Read the login message. Write a `.plan` file and a `.project` file, then check them with `finger yourname@host`. If your host has a wiki, read it. Then say hi on IRC; the [tilde.chat web client](https://tilde.chat/kiwi/) works in your web browser.

If you're nervous about terminal editors, use [micro](https://micro-editor.github.io/), which has mouse support and normal shortcuts like `ctrl+s` to save and `ctrl+q` to quit. It's always my default.

**5. Wander.** This is `~vilmibm`'s advice for new townies: "wander around. Use `town explore` or run `cd /home/$(ls /home | shuf | head -1)` to visit a random user. See what they've left behind and see if it inspires you." And then, maybe, water someone else's plant.

Here Is a Person [](#here-is-a-person)
----------

There's one more line in Ford's original essay I want to share, describing the emails he got from people who missed the old web, "that sense of quiet and intimacy and patient thought":

>
>
> Back in the 1990s—this will sound insane—some of us paid a lot of money for our tilde accounts, like $30 or $40 a month or sometimes much more. **We paid to reach strangers with our weird ideas.** Whereas now, as everyone understands, brands pay to know users.
>
>

That's what the tildeverse still is, except now it's free. Held together by volunteer sysadmins, donated rack space in Ottawa, and $24 slid under a door in Brooklyn. It's fragile, yes. Kernels will keep breaking. Servers will keep getting wiped. Admins will burn out and hand the keys to someone new. That's how it's always worked. Grex is still here. SDF is still here. The town is almost twelve years old, officially older than Google Plus was when it was killed off.

Every one of these places is a little computer full of tildes. And every tilde, in front of every username, says the same thing. *here is a person.* Here's another. And another. A person is writing a journal entry about their shitty job, or falling in love. A person is captaining a starship nobody else has hailed yet. A person is watering a stranger's plant.

Come say hi, my guestbook is open.

---

1. In [the Jargon File](http://catb.org/~esr/jargon/html/S/September-that-never-ended.html), it's written that AOL opened Usenet to its subscribers in September 1993 and the newcomers never stopped coming. But as Kevin Driscoll points out in [*Do we misremember Eternal September?*](https://www.flowjournal.org/2023/04/eternal-september/), AOL's Usenet gateway didn't actually open until February 28, 1994, and complaints about a "September that never ends" were circulating well before AOL was involved. Folk etymology strikes yet again. Tilde.town keeps the joke alive with a command, `town sdate`. By my count, today is September 12,088th, 1993. [↩︎](#fnref1)

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