+++
title = "Notes for July 13-19"
description = "Finally, a relatively quiet and very productive week at work, by the simple dint of many people going to an annual event in the US and thus being unavailable to annoyhelp me.Seriously now, it was pretty OK even if my back has been troubling me again, which I tried to counter with"
date = "2026-07-19T15:00:00Z"
url = "https://taoofmac.com/space/notes/2026/07/19/1500?utm_content=atom"
author = "Rui Carmo"
text = ""
lastupdated = "2026-07-21T09:22:24.784339225Z"
seen = false
+++

Finally, a relatively quiet and very productive week at work, by the simple dint of many people going to an annual event in the US and thus being unavailable to annoyhelp me.

Seriously now, it was pretty OK even if my back has been troubling me again, which I tried to counter with daily outings to run errands and “run” about. Carrying loads is not a problem, so even relatively prosaic affairs like leaving the house right after stand-ups (while it’s still cool), trotting over to the market and carrying back a dozen milk cartons are quite welcome.

Sitting around in lengthy meetings, however, is not, nor is doing slow, gratingly ineffective agile rituals to appease the backlog gods as a group… But I digress.

As far as my personal endeavours go, this was another oddly fragmented week, but somewhat productive: I bounced between embedded hardware, classic Mac emulation, agent infrastructure and an unexpectedly deep investigation into the ongoing mess with Portugal’s national-exam platform.

[

A Tiny Macintosh, Repeatedly
----------

](/space/notes/2026/07/19/1500#a-tiny-macintosh-repeatedly)

I am still poking at the AArch64 JIT in my [Mac emulation fork](https://github.com/rcarmo/macemu-jit?utm_source=taoofmac.com&utm_medium=web&utm_campaign=unsolicited_traffic&utm_content=external_link), which has now moved well past merely getting it to run fast and into the much less glamorous business of making it actually *behave*.

I’ve had an agent slowly wading through various 68k instruction families–arithmetic, shifts, branches, effective-address handling and exception semantics–and, just like the PowerPC version, things began erroring out when FPU tests were involved because the criteria for “proper” floating-point precision have evolved over the years.

Classic Mac software has had decades to develop opinions about obscure 68k behaviour, and an emulator can appear perfectly healthy until this kind of thing crops up–not that I expect to run anything taxing on my emulators, but I would very much like to avoid surprises, and I haven’t yet gone back to live graphics hardware tests…

[

Agents, Providers and Memory
----------

](/space/notes/2026/07/19/1500#agents-providers-and-memory)

[`piclaw`](https://rcarmo.github.io/projects/piclaw/?utm_source=taoofmac.com&utm_medium=web&utm_campaign=unsolicited_traffic&utm_content=external_link) took up entirely too much of my time this week (again), for two reasons:

* I spent the first half of the week poking at context compaction (including filing [#6676](https://github.com/earendil-works/pi/issues/6676?utm_source=taoofmac.com&utm_medium=web&utm_campaign=unsolicited_traffic&utm_content=external_link) upstream, because Codex native compaction is very “cheap” code-wise)
* `pi` had another core update that forced me to refactor most of the core agentic runtime, just *hours* after I finished the above.

None of this was glamorous, fun or even that useful except that it removed special cases that had accumulated as new providers and dynamic model catalogues were added, but… Yeah, I just want to *use* the thing now.

Anyway, halfway through that second pass I realized that my current instances had no recollection of some of the design choices I’d made in the past, so I went down *another* rabbit-hole: I took some of the concepts I have been using in enterprise agent designs and started [Memento](https://github.com/rcarmo/memento?utm_source=taoofmac.com&utm_medium=web&utm_campaign=unsolicited_traffic&utm_content=external_link), a small cross-agent memory system.

The immediate goal is to keep durable facts and operational knowledge I keep having to repeat like “no, Portainer’s endpoint is not that” separate from chat transcripts, but with proposal and review workflows rather than letting every agent write directly into shared memory and cram it with useless factoids.

It’s a tad overkill in that regard, though, so I’m also considering it an experiment on whether I can get useful embedding, vector search and intent-driven queries running on tiny hardware (it’s going to be running on an Atom CPU, so of course I rolled my own inference…)

[

RISCy Stuff
----------

](/space/notes/2026/07/19/1500#riscy-stuff)

Since Google updated Gemma 4 (but did not actually change the version number and effectively only tweaked some of the templating), I set it up again on the [Milk-V](/space/reviews/2026/06/11/1830), and compared it to a couple of new models–including the 35B Ornith mixture-of-experts model.

In short, the results were mostly the same as during the review: You can run Ornith with a 256K context at roughly 7.5 tokens per second, but it’s too slow for any practical use, and Gemma is definitely still not a useful coding model in anything but Go, so I still need better hardware.

[

The Portuguese National Exams Flop
----------

](/space/notes/2026/07/19/1500#the-portuguese-national-exams-flop)

Since my eldest is about to enter college, the ongoing failure of Portugal’s new national-exam platform has been… interesting. And what better way to test [Memento](https://github.com/rcarmo/memento?utm_source=taoofmac.com&utm_medium=web&utm_campaign=unsolicited_traffic&utm_content=external_link) than by assembling a source-led dossier covering the Ministry, IAVE, JNE, schools, unions, procurement records and shifting grade publication deadlines?

I asked [`piclaw`](https://rcarmo.github.io/projects/piclaw/?utm_source=taoofmac.com&utm_medium=web&utm_campaign=unsolicited_traffic&utm_content=external_link) to build a timeline, and… it did, maybe even going a bit overboard, as I now have:

* a 50-page PDF with a detailed timeline of events
* a claim-to-source ledger
* procurement material for all contracts apparently pertaining to the new platform
* transcripts of the Minister’s main television, radio and parliamentary appearances for the past few months
* matching testimony from the teacher unions and the main opposition party

And having it check for inconsistencies was fascinating. For instance:

>
>
> In a 7 July RTP interview, Fernando Alexandre said that exams were digitised by teachers on Ministry equipment and then “treated and placed on the platform by Ministry of Education staff”. That supports internal handling, but it does *not* establish that the software itself was Ministry-owned–a distinction that does not agree with government procurement records and coverage in (references elided).
>
>

`gpt-5.6-sol` was pretty tenacious: it tracked down and downloaded original video clips, recorded their URLs, durations and hashes, generated timestamped transcripts and cross-referenced them into a dense PDF that I might use as a basis for a little rant on the topic.

Fortunately, my kid’s grades were posted in the late evening, but there are “hundreds” or “thousands” of students (depending on whom you interview) who were not so lucky.

Although I have always had very little (OK, zero) faith in the Portuguese government’s ability to cultivate, manage, or even *use* technology effectively, this might be an interesting thing for me to write about.

We are, after all, in the silly season, as my journalist friends usually referred to it until the US, well… never mind.