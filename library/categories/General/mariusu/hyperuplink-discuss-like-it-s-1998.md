+++
title = "Hyperuplink: Discuss like it's 1998"
description = 'Introducing \_Hyperuplink\_, a modern HTML5/CSS3 and 100% JavaScript-free internet bulletin board software, as a single binary, available for most popular platforms, without any runtime dependencies, and using PostgreSQL.'
date = "2026-08-28T09:32:54Z"
url = "https://xn--gckvb8fzb.com/hyperuplink-discuss-like-its-1998/"
author = "marius@xn--gckvb8fzb.com (Marius)"
text = ""
lastupdated = "2026-09-01T19:33:13.848389216Z"
seen = false
+++

Between the screeching handshake of a 2400-baud modem, the steady hum of a computer in *Turbo* mode, and the pale flicker of a CRT glowing at three in the morning, the internet seemed to have had something that, over the past two decades or so, it has completely lost: A *soul*. Communities made up of actual humans gathered around bulletin boards that loaded in a single request, where regular hardware could bring an entire world to your screen without borrowing half your CPU just to show you a list of topics. If you happened to have lived through that brief and peculiar moment in history, you probably still carry a fondness for those days, and you remember the strange little corners of the internet that you discovered, the hours you spent exploring them, and perhaps the friends you made along the way.

*Hyperuplink* is my attempt at bottling those memories and the feelings attached to them, and pouring them into something that makes sense in 2026. It is a modern internet bulletin board that doesn’t require Telnet and works inside your browser, that renders proper, modern HTML5 and CSS on the server-side, that runs 100% JavaScript-free, and that ships as a single statically linked binary with no external runtime, no interpreter, no *FastCGI*, no `/var/www`, no `node_modules`, and not a single loose file spilled across your disk. It can talk to a *PostgreSQL* server or an entire cluster, it makes use of any *Redis*-compatible cache, and it comes with a whole set of nostalgic as well as modern themes.

More importantly, *Hyperuplink* is fun, it doesn’t take itself too seriously, and it is the forum software for everyone who’s done wrangling with *phpBB*’s runtime environment or *Discourse*’s broken JavaScript UI. And yes, *Hyperuplink*, too, really whips the llama’s ass.

```
===========================================================================
                     NOW DIALING ...  ::  CARRIER DETECTED
===========================================================================

     █   █ █   █ ████  █████ ████  █   █ ████  █     █████ █   █ █   █
     █   █ █   █ █   █ █     █   █ █   █ █   █ █       █   ██  █ █  █
     █████  ███  ████  ███   ████  █   █ ████  █       █   █ █ █ ███
     █   █   █   █     █     █  █  █   █ █     █       █   █  ██ █  █
     █   █   █   █     █████ █   █  ███  █     █████ █████ █   █ █   █

    ::: A SUPER HIGH SPEED INTERNET BULLETIN BOARD AS SINGLE BINARY :::

===========================================================================

```

But…. *why?*
----------

The short version, for anyone who has been idling in the [community channel](/contact/#xmpp) or who already [read the back-story in an earlier status update](/updates-2025-q4/#hyperuplink), is that back at the time I wanted a community discussion forum for the people who use any of [the tools, programs and services I’m building](/projects/), and I could not find a single piece of software that I actually wanted to put up with.

I was looking for an internet forum that would resemble the *good old* BBS systems from back in the day, but that would allow people to use it from the comfort of their modern-day browsers. I also wanted something that …

* can either use an existing database table to authenticate users, and/or…
* supports simple signups, ideally with [XMPP JIDs instead of email addresses](/teaching-an-old-dog-new-tricks-forgejo-xmpp/)
* supports notifications and replies via email and ideally via XMPP
* is lightweight and does not drag along a mountain of runtime dependencies
* does not require users to have [JavaScript enabled](https://disable-javascript.org)
* does not bury me under administrative features I will likely never touch
* is reasonably easy to theme and, more importantly, to maintain long term

*phpBB* was the obvious first stop, because it has been around for decades and, unlike *Discourse* and *Lemmy*, it does not force JavaScript down the visitor’s throat. But *phpBB* is a *monster* that carries far too many features, takes time to install and configure, and, once you account for its extensions and runtime dependencies, demands a recurring maintenance ritual that I frankly do not have time for. *Discourse* and *Lemmy*, on the other hand, I won’t even consider to begin with, because they simply don’t work without JavaScript enabled. Everything else I looked at either missed something I needed, would have brought similar runtime headaches, or would have required me to fork it and maintain that fork forever, just to get a few of the features that I needed. So I did the reasonable, *well-adjusted* thing and started writing my own bulletin board software [at the end of last year](https://bsky.app/profile/xn--gckvb8fzb.com/post/3m5wkotemhk2v).

Technical mumbo-jumbo
----------

### Let’s *Go*! ###

Before writing a single line I sat down and weighed the usual suspects, *PHP* with *Laravel*, *Python* with *Django*, *Elixir* with *Phoenix*, *Go* with *Fiber*, and *Zig* with *Jetzig*. I did not consider server-side *TypeScript* for even a second, because the *Node.js* and *NPM* ecosystem is a dumpster fire of outright malware that I refuse to pick for even something as deliberately absurd as *Hyperuplink*.

The scripting stacks make web development pleasant, and they abstract away the tedious HTTP, session and form handling so you can focus on the thing you are building, but every one of them drags a runtime and a maintenance burden behind it. My one goal for *Hyperuplink* was for a hobbyist admin to be able to run a board without babysitting a whole stack. From an administrative perspective I wanted to be able to update one or two binaries every once in a while and be good, without having to subscribe to e.g. the PHP security announcements, and its mailing lists, and its security advisories on GitHub, and the NVD only to make sure I’m not missing a critical CVE of one of the gazillion of dependencies.

*Go* sits in the sweet spot between the low-level compiled languages like *C*, *C++* and *Zig* that hand you performance at the cost of development speed, and the interpreted languages like *PHP* and *Python*, that make data structures a joy to work with but that are expensive to run. The deciding factor was that *Go* compiles down to one statically linked binary that you copy to any VPS and simply launch. The one downside is that *Go* is not exactly a *“web native”* language and has nothing like *Django* or *Laravel* to accelerate the boring parts, so I built my own small [*web application framework*](https://tty.fail/mrus/glides) on top of the [*Fiber* v3 framework](https://gofiber.io) and went from there.

### Under the hood ###

*Hyperuplink* is a single static binary, compiled with *CGO* disabled, cross-compiled to Linux, macOS, FreeBSD, NetBSD, OpenBSD and a long tail of architectures, so that deployment is nothing more than copying that binary into place. It is PostgreSQL-native and cluster-friendly and it uses *materialised views* to optimize read performance. Schema migrations are embedded and run automatically on startup, which means there are no external migration files and upgrades should be as easy as simply firing up the new version.

In addition, a *Redis*-compatible service is used for caching, and sessions, and the async job queue. Profile pictures, attachments, and custom assets can either be uploaded to the local disk or into any S3-compatible object store (such as [MinIO](https://min.io)), which is useful when scaling the service horizontally.

*Hyperuplink* runs zero client-side JavaScript, meaning that every page is server-rendered HTML5 and CSS, and there is nothing that logs how your cursor drifts back towards that thread about whether pineapple belongs on pizza, just to collect data on your account.

Speaking of which, accounts can sign-up/-in via local password, with optional TOTP two-factor authentication, but *Hyperuplink* also supports login through OAuth providers for the friends you are trying to lure over from other platforms. And for anyone who finds email too *boomer*, sign-ups and notifications work over *XMPP*, too. As for authorization, accounts can be assigned to groups with per-category permissions so *the good stuff* stays available only to *the good people*.

*Hyperuplink* features a range of pre-built themes, some of which feature beautiful retro aesthetics that it owes to the [classic-stylesheets](https://github.com/nielssp/classic-stylesheets) project. There are also slightly more modern looks available, and with every theme the colour schemes are interchangeable, so a *Gruvbox*-tinted macOS 9 board is very much a thing.

The bulletin board supports Markdown in posts, it offers uploading profile pictures and attachments, it comes with reporting and moderation features for the admins, and the UI supports i18n.

*Hyperuplink* also ships with a REST API that I believe is friendlier to work with than what *Lemmy* or *Discourse* expose, and it even has its own TUI client with the official *Hyperuplink* integration into [Neon Modem Overdrive](https://neonmodem.com).

Getting started
----------

*Hyperuplink* is developed on [tty.fail](https://tty.fail/hyperuplink/hyperuplink) and mirrored to [GitHub](https://github.com/hyperuplink/hyperuplink), the mirror being where the pre-built binaries and container images are built and hosted (*thanks for the free CPU cycles!*). Regardless of how you decide to run your bulletin board, you will need a *PostgreSQL* and a *Redis*-compatible server reachable, plus, optionally, an S3-compatible store if you would rather keep uploads off the local disk.

### Native ###

The official repositories contain all the required documentation and configurations to get you started as quickly as possible, but the basic idea is that you can simply grab the binary for your platform from the [releases page](https://github.com/hyperuplink/hyperuplink/releases), drop it wherever you please, and run it:

```sh
$ ./hyperuplink -c "file:///etc/hyperuplink.toml"

```

### Docker / Podman ###

There’s a whole Docker and Podman (rootless!) setup available, if you would rather bring the entire stack up at once. The repository ships a `docker-compose.yml`/`podman-compose.yml` with *PostgreSQL* and *Valkey* and an optional *MinIO* profile:

```sh
$ docker compose up -d

```

### Quadlets ###

The Podman setup does everything the Docker setup does but rootless, and alongside the `podman-compose.yml` there is even a set of [Quadlet](https://docs.podman.io/en/latest/markdown/podman-systemd.unit.5.html) units if you prefer using *systemd*.

### K8s ###

Kubernetes works, too, and a minimal `Deployment` with a couple of replicas and the config handed in through a `Secret` is pretty much all you need. Since the uploads can use S3 the pods stay stateless.

### Gentoo ###

Ebuilds are available in the repository so you can compile it on your own Gentoo… server… I guess.

### NixOS / nixpkg ###

I tried including all that’s necessary for Nix but to be fair, I’m not actively using it anywhere so consider this more of a proof-of-concept rather than an actively maintained thing. If you feel like actively maintaining the Nix part of things I’d be happy for you to reach out.

### FreeBSD / OpenBSD / OpenRC / … ###

The repository also contain the required init scripts for FreeBSD, OpenBSD, OpenRC and even a Service definitions for *systemd*.

### Building from sauce ###

If you want to build *Hyperuplink* yourself, for which you need [Go](https://go.dev), it’s equally easy to do:

```sh
$ git clone https://tty.fail/hyperuplink/hyperuplink.git
$ cd hyperuplink
$ make build

```

The self-contained binary lands in `./build/hyperuplink`, ready to be moved wherever you please.

**Note:** Alright, alright, I lied, and you got me. *No runtime dependencies* was not 100% accurate and you’re probably staring at a forum that refuses to allow its users to upload profile pictures. The reason for that is that *Hyperuplink* has **one** runtime dependency, which is *ImageMagick*’s `convert` command. The service must be able to find that binary in its `$PATH` in order for profile pictures to work.

As for why, it’s a long story, but the tl;dr is that image processing is hard and there aren’t many people, me included, who feel like reinventing the wheel for, let’s say, the *WebP* compression algorithm, by building a native *Go* implementation. Because I explicitly didn’t want to use `CGO` for the sake of preserving *Go*’s easy cross-compiling, I decided that calling the `convert` binary was the most reasonable approach. After all, you’re likely to have *ImageMagick* on your system if you’ve ever hosted anything web related on there.

### Reverse proxy ###

However you end up running the process, put it behind a reverse proxy that terminates TLS, because in `Mode = "production"` the session cookie is HTTPS-only and you most definitely wouldn’t want to run the forum in `development` mode. Also, if you want the service supervised there are the aforementioned service files for *systemd*, *OpenRC* on Gentoo and Alpine, and rc.d on FreeBSD and OpenBSD waiting in the repository.

EOF
----------

*Hyperuplink* is open source under the [SEGV License](/segv/), the code is available on [tty.fail](https://tty.fail/hyperuplink/hyperuplink) with the mirror and the pre-built binaries over on [GitHub](https://github.com/hyperuplink/hyperuplink), and everything else you could want to read about it is either available at [hyperup.link](https://hyperup.link), or within its own embedded manual that you can find under *Help* -\> *Manual*.

If all of this sounds like your kind of thing, come and say hello in the [chatroom](/contact/#xmpp), show off your board once you have it set up, and if you would like to lend a hand with development or testing then [reach out](/contact/), because the best communities were always the ones with real people, putting in real work.