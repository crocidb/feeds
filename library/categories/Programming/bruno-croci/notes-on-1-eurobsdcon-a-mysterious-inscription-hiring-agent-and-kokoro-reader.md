+++
title = "Notes On #1: EuroBSDCon, a mysterious inscription, Hiring Agent, and Kokoro Reader"
description = "A lot of my time is spent in reading technical blogs and news. Mostly from my RSS feeds and Hacker News, Lobsters, and Reddit. My browser has dozens of open tabs of articles I want to read, but think they’re too deep for just a quick scan. A lot of these texts require some furthe"
date = "2026-08-06T00:00:00Z"
url = "https://crocidb.com/post/notes-on/1-eurobsdcon-mysterious-inscription-hiring-agent-kokoro-reader/"
author = "Bruno Croci"
text = ""
lastupdated = "2026-08-06T09:52:33.774216591Z"
seen = true
+++

A lot of my time is spent in reading technical blogs and news. Mostly from my RSS feeds and Hacker News, Lobsters, and Reddit. My browser has dozens of open tabs of articles I want to read, but think they’re too deep for just a quick scan. A lot of these texts require some further research on the subject or new concepts I’ve never heard before. So I realized that taking notes of these articles is the best way of understanding it, along with the further links I’ll follow, improving my chances of actually learn something.

Then I thought that posting some of these notes can be one more motivation for me to do it consistently, improving my writing further than just notes to myself. So I created this some sort of *newsletter*. So far, it’s just gonna be another category here, but if I see it’s working well, I’ll probably make a separate RSS feed just for it. The name is **Notes On**, especially because those are basically my *notes on* stuff that I’m reading or doing, but also because of midi messages `note on`/`note off`. Expect it to be more a stream of thought rather than carefully elaborated text (as if I ever do it anyway). :)

This time I have some notes from [the program EuroBSDCon 2026](#eurobsdcon-2026); a mysterious inscription in my recently-bought edition of [The Design and Implementation of the FreeBSD Operating System](#the-design-and-implementation-of-the-freebsd-operating-system); some quick tests [running my CV with an LLM Hiring Agent](#testing-my-cv-with-an-llm-hiring-agent); and how I set [Kokoro Model locally to read blog posts in different languages in my Firefox](#kokoro-reader). Let me know what you think of this type of post.

---

EuroBSDCon 2026
==========

The program for the [EuroBSDCon 2026](https://2026.eurobsdcon.org/), European BSD conference that is happening in Brussels this year, is finally out: [Schedule](https://events.eurobsdcon.org/2026/schedule/). There are interesting talks I’d love to watch, but unfortunately I can’t make because **€265.00** is a bit out of my budget at the time. Especially considering accommodation and the ungodly amount of Belgian beer I would have at **Delirium Café**. It would be interesting to come though, since my recent obsession with FreeBSD started after watching *a few BSD sessions* on FOSDEM this year, also in Brussels, in between sessions of heavy drinking.

I’d love to watch the two courses given by [Kirk McKusick](https://en.wikipedia.org/wiki/Marshall_Kirk_McKusick): [An Introduction to the Filesystems and Networking in the FreeBSD Open-Source Operating System](https://events.eurobsdcon.org/2026/talk/RNEMNV/) and [An Introduction to the Kernel Services and I/O System of the FreeBSD Open-Source Operating System](https://events.eurobsdcon.org/2026/talk/EYQSJR/). Along with these interesting talks:

* [Introduction to TUI Programming with bsddialog](https://events.eurobsdcon.org/2026/talk/MGL8PR/)
* [Managing FreeBSD jails with Sylve and Ansible](https://events.eurobsdcon.org/2026/talk/S3ULVJ/)
* [Running stock FreeBSD on Windows Subsystem for Linux 2](https://events.eurobsdcon.org/2026/talk/39G3BV/)
* [The Realities of Enterprise FreeBSD](https://events.eurobsdcon.org/2026/talk/HRXAHF/)
* [Input devices on OpenBSD for console, X11 and Wayland](https://events.eurobsdcon.org/2026/talk/YMR3ZF/)
* [Linux emulation on NetBSD: How broken is it?](https://events.eurobsdcon.org/2026/talk/WXCFYU/)
* [A Noob Goes OpenBSD](https://events.eurobsdcon.org/2026/talk/T3MDAC/)
* [Base system packages in Production: A Practical Overview](https://events.eurobsdcon.org/2026/talk/MBEDBM/)
* [UNIX Manpages, Then and Now](https://events.eurobsdcon.org/2026/talk/MDEE9H/)
* [make buildworld && make install-future: Why FreeBSD’s Adoption Story Runs Through Continuous Integration](https://events.eurobsdcon.org/2026/talk/EA98CK/)
* [Using modern \*BSD to get a 4.2BSD system from 1983 running](https://events.eurobsdcon.org/2026/talk/YGCH9Y/)
* [Looney Tunes: FreeBSD, rsync, and ZFS](https://events.eurobsdcon.org/2026/talk/JURFDY/).

In fact, a lot of them even overlap. If there was an online ticket with access to all the talks even after the event, I’d probably register myself.

---

The Design and Implementation of the FreeBSD Operating System
==========

Still on the theme of BSD, I finally got a copy of this book, after a user flagged that [I needed to get this instead of the MINIX book](https://www.reddit.com/r/freebsd/comments/1umc3yc/comment/ovax59d/). There’s a third edition in the making, so I got a used copy from eBay. And the coolest thing is that it came with a cute inscription:

![“It was a pleasure working on this book”](images/Pastedimage20260721164352.png)

“It was a pleasure working on this book”

I can’t read really what the signature says. Maybe *Sage*? Maybe *George*? If it’s George, what’s the chance that it’s **George V. Neville-Neil** writing to **Robert N. M. Watson**, two of the three coauthors. Especially considering the message. “it was a pleasure working **on this book**”. Of course, that could also *working through it*, like studying it. According to the book own’s description of the authors, Robert Watson lives in England, while the two other authors live in the US: I bought it from eBay from a seller in the UK. What if it was Dr Watson’s personal copy of the book sent by an editor **Sge**, **Sze** or **Sye**? Probably not, but it’s a good *possible* story.

Funny enough, out of all the listings of that book in eBay, I got that one specifically because it was the cheapest and it had this comment:

![a neat dedication](images/Pastedimage20260722225602.png)

a neat dedication

I usually love getting used books with handwritten inscriptions, dedications, notes, etc. Makes it more real, somehow.

---

Testing my CV with an LLM Hiring Agent
==========

Recently I heard about HackerRank releasing a tool to assign a score to a CV/Resumé, using LLM. First, I didn’t even know what HackerRank was, but apparently they do technical interviews for companies hiring developers. The tool is called [Hiring Agent](https://github.com/interviewstreet/hiring-agent). I wanted to give it a try on my resume, since I imagine all major companies nowadays are using some similar tool. Although I come the video game industry, having worked with it for the last 16 years, and it’s probably more tailored for fullstack developers, backend and maybe some system programming. If you want to check my resume before reading ahead, it’s available [here](https://bruno.croci.dev/resume/pdf/).

It’s annoying that it only supports ollama to run locally, but since I didn’t feel like burning api tokens from a service, I installed it with and ran with `gemma4`. First time executing took a long time, because it fetches my recent github projects, but there’s a specific limit that you have to work around, waiting like an hour or so to resume. Ok, by the end of it, I got a score: **57.0/100**.

It scores in multiple categories, then somehow consolidate into one single value for the whole document. There is also some comments on each of those categories. I decided to run it again, because I remember reading [this text](https://danunparsed.com/p/hackerrank-open-source-ats) where the author shows his own experience with multiple runs and how this whole way to checking CVs is just as luck-based as if you let a senior engineer, a junior engineer and the person who fixes the coffee machine check the CVs you get. The second run gave me **71.0/100**, which is considerably better.

Next run was **79.0/100**, then **61.0/100**, etc. It’s clear that the score alone, from a single run, says nothing about my carefully written CV. But if companies are actually using it to gate who gets the next call, I find it utterly disrespectful. And pretty harmful, because if CVs and Linkedin were already a place where people who spit more keywords and technical expressions get more attention, now it’s all about finding ways to exploit the LLM.

So I went to actually read what it says, since it’s a rather long report for every execution where it tries to justify the scores. The categories it uses are **Open Source**, **Self Projects**, **Production Experience** and **Technical Skill**. Here’s a plot of the scores on each category and overall:

![it’s only 6 runs, but it looks good in a graph](images/candidate_scores_boxplot.png)

it’s only 6 runs, but it looks good in a graph

The main weird thing for me here is that the description of the open source category always say that the score is low because all my projects are of type `self_project`. Which is partially true, since I don’t consistently contribute to open-source projects, but it completely ignore the eventual projects I submitted patches to, such as **BGFX**, **htop** and **btop**. Including some texts as:

>
>
> The most starred project (bulletty) has 435 stars, indicating some community interest, but it is still a personal project. No participation in programs like GSoC or Hacktoberfest mentioned.
>
>

At which point **bulletty**, a project that received many PRs on the last Hacktoberfest, is still considered a `self_project` and not count me as participating in the event as a maintainer? Another thing is how in almost all the reports, in the “AREAS FOR IMPROVEMENT” section, it suggested me add AWS, DevOps, AI, Redis, etc.

That all said, I get that one of the main suggestions I got was: try to focus on something for your resumé. But the reality is that I can’t focus on one thing for my career in general. I’m a gamedev with experience in Game Audio, but also very interested in operating systems, systems programming, hardware, engine development, indie games, art, etc. That’s just how I am.

Anyway, now it’s possible to test this `hiring-agent` online at [https://resume-reality-check-seven.vercel.app/](https://resume-reality-check-seven.vercel.app/).

---

Kokoro Reader
==========

Sometimes, I feel I get to focus better if I can listen to the text I’m reading at the same time. On Windows, Microsoft Edge is the browser that offers the best “read out loud” experience out of the box. While many plugins can offer this feature on Firefox or Chromium, it’s often with that classic robotic voice. So I’ve been looking for a good alternative that ran on Firefox, specifically.

I found out about [Kokoro Reader](https://addons.mozilla.org/en-US/firefox/addon/kokoro-reader/). Apparently it also runs on Chrome. It connects to a local running **Kokoro** model. It’s really easy to get it up running with [Kokoro-FastAPI](https://github.com/remsky/Kokoro-FastAPI), using docker:

```sh
sudo docker run --gpus all -p 8880:8880 ghcr.io/remsky/kokoro-fastapi-gpu:latest

```

I also tried running it on my old Intel NUC homelab, on the CPU instead, but unfortuntaly that’s not a good experience. It takes way too long to generate the sentences and got me sick of waiting at least 1 second between them. So I set it up on my old ““gamer”” laptop, which has a GTX 1050, and it runs pretty well. So all I have to do now is point all my other devices in my extended network to that laptop and get my articles read.

But there was a problem with it: it wouldn’t detect the language of the text automatically. Kokoro supports many languages, three of them that I am fluent (Portuguese and English) or can understand a bit (Spanish), but the extension was locked in English. So I forked the project and, in a very low-effort LLM session, got the multilingual support into it. My fork is here: [https://github.com/crocidb/kokoro-extension](https://github.com/crocidb/kokoro-extension). I didn’t do a PR because I didn’t validate any of the code that the LLM generated. For that reason I’m also not distributing it on the Firefox AddOn platform. But if you’re brave enough, I added the signed package of the extension in the repository as a Release.

![You can mix the voices. Works better when they’re from the same gender, though. :)](images/Pastedimage20260806012413.png)

You can mix the voices. Works better when they’re from the same gender, though. :)

That’s how it looks when reading:

![It auto-detects the language, but you can also manually pick in the dropbox](images/Pastedimage20260806012531.png)

It auto-detects the language, but you can also manually pick in the dropbox

It also supports EPUB reading. But I haven’t had the chance to actually use it past a test.

---

stuffy knows
==========

It’s been already a month, and it’s on my [/now](https://crocidb.com/now) section as well as the top, but I didn’t talk about it. It’s an EP with 4 tracks that were composed throughout some years, but finally recorded and produced in the last year, and finally made it out. It’s hard to describe what type of music it is, but it’s instrumental with guitar, bass, drums and synth. Something between some psychedelic rock with some latin-music references in the melodies?

![if_you_guessed_it_was_my_nose_you_are_right.jpg](images/ab67616d0000b273d6b6c5a86b8adda935e3e5a6.jpg)

if\_you\_guessed\_it\_was\_my\_nose\_you\_are\_right.jpg

Took me a long time to finish it because I was having serious issues with mixing. That’s rocket science, if you’re not into it. Some days, after spending countless hours, it might sound good, but then the very next day it would sound all unbalanced. I did ask some close friends who are professional audio engineers to give me some feedback and a some technical tips and tried to apply them, but I hit a wall. At some point, I just couldn’t understand the difference anymore of what I was doing and it become a serious burden. But after a while, I thought that if I didn’t let it go, I’d never finish it. Turns out mixing is not only a very technical role, but also an intuitive one. I don’t have a lot of intuition, although I spent many hours reading about it. So I rendered the project, tried on many devices and when it was *good enough*, I called it finished.

Now it’s available on [all digital streaming platforms](https://www.tapelink.io/share/rdfYQLYn) such as [Spotify](https://open.spotify.com/album/1MK8nsGeJjfNIVzzZbTinh), [YouTube Music](https://music.youtube.com/playlist?list=OLAK5uy_n3sY2wLynVzAKn-bcVefXtIuHLy7-8W08), [Apple Music](https://music.apple.com/us/album/6788463014) and [Tidal](https://tidal.com/album/541075038), as well as [Bandcamp](https://crocidb.bandcamp.com/album/stuffy-knows), if you feel like actually buying the non-DRM files.

It feels so refreshing to finally finishing a project that I’m already working on many new songs.

---

That was it, folks. Until next time!