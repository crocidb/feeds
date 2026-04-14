+++
title = "Pluralistic: Don't Be Evil (11 Apr 2026)"
description = "Today's links Don't Be Evil: Evil genius is just a lack of shame. Hey look at this: Delights to delectate. Object permanence: FBI x Trotsky; Jakob Nielsen x headlines; Floppy disk stained glass; Zero tolerance for mismatched socks; EFF v DOGE. Upcoming appearances: Toronto, San F"
date = "2026-04-11T13:34:48Z"
url = "https://pluralistic.net/2026/04/11/obvious-terrible-ideas/"
author = "Cory Doctorow"
text = ""
lastupdated = "2026-04-12T21:28:45.072685752Z"
seen = true
+++

[![](https://i0.wp.com/craphound.com/images/11Apr2026.jpg?w=840&ssl=1)](https://pluralistic.net/2026/04/11/obvious-terrible-ideas/)

Today's links
==========

* [Don't Be Evil](https://pluralistic.net/2026/04/11/obvious-terrible-ideas/#bayesian-terrorism): Evil genius is just a lack of shame.
* [Hey look at this](https://pluralistic.net/2026/04/11/obvious-terrible-ideas/#linkdump): Delights to delectate.
* [Object permanence](https://pluralistic.net/2026/04/11/obvious-terrible-ideas/#retro): FBI x Trotsky; Jakob Nielsen x headlines; Floppy disk stained glass; Zero tolerance for mismatched socks; EFF v DOGE.
* [Upcoming appearances](https://pluralistic.net/2026/04/11/obvious-terrible-ideas/#upcoming): Toronto, San Francisco, London, Berlin, NYC, Hay-on-Wye, London.
* [Recent appearances](https://pluralistic.net/2026/04/11/obvious-terrible-ideas/#recent): Where I've been.
* [Latest books](https://pluralistic.net/2026/04/11/obvious-terrible-ideas/#latest): You keep readin' em, I'll keep writin' 'em.
* [Upcoming books](https://pluralistic.net/2026/04/11/obvious-terrible-ideas/#upcoming-books): Like I said, I'll keep writin' 'em.
* [Colophon](https://pluralistic.net/2026/04/11/obvious-terrible-ideas/#bragsheet): All the rest.

---

<a name="bayesian-terrorism"></a>  
![A sci-fi pulp robot holding a grotesque inverted severed head of a beared man aloft, zapping it with rays from its eye-visor. Behind the robot is a scene of collapsing Roman pillars.](https://i0.wp.com/craphound.com/images/dont-be-evil.jpg?w=840&ssl=1)

Don't Be Evil ([permalink](https://pluralistic.net/2026/04/11/obvious-terrible-ideas/#bayesian-terrorism))
==========

How I knew I was officially Old: I stopped being disoriented by the experience of meeting with grown-ass adults who wanted to thank me for the books of mine they'd read in their childhoods, which helped shape their lives. Instead of marveling that a book that felt to me like it was ten seconds old was a childhood favorite of this full-grown person, I was free to experience the intense gratification of knowing I'd helped this person find their way, and intense gratitude that they'd told me about it (including you, Sean – it was nice to meet you last night at Drawn and Quarterly in Montreal!).

Now that I am Old, I find myself dwelling on key junctures from my life. It's not nostalgia ("Nostalgia is a toxic impulse" – J. Hodgman) – rather, it's an attempt to figure out how I got here ("My god! What have I done?" – D. Byrne), and also, how the *world* got this way.

There's one incident I return to a lot, a moment that didn't feel momentous at the time, but which, on reflection, seems to have a lot to say about *this* moment – both for me, and for the world we live in.

Back in the late 1990s, I co-founded a dotcom company, Opencola. It was a "free/open, peer-to-peer search and recommendation system." The big idea was that we could combine early machine learning technology with Napster-style P2P file sharing and a web-crawler to help you find things that would interest you. The way it was gonna work was that you'd have a folder on your desktop and you could put things in it that you liked and the system would crawl other users' folders, and the open web, and copy things into your folder that it found that seemed related to the stuff you liked. You could refine the system's sensibilities by thumbs-up/thumbs-downing the suggestions, and it would refine its conception of your preferences over time. As with Napster and its successors, you could also talk to the people whose collections enriched your own, allowing you to connect with people who shared even your most esoteric interests.

Opencola didn't make it. Our VCs got greedy when Microsoft offered to buy us and tried to grab all the equity away from the founders. I quit and went to EFF, and my partners got very good jobs at Microsoft, and the company was bought for its tax-credits by Opentext, and that was that.

(Well, not quite – several of the programmers who worked on the project have rebooted it, which is very cool!)

[https://opencola.io/](https://opencola.io/)

But back in the Opencola days, we three partners would have these regular meetings where we'd brainstorm ways that we could make money off of this extremely cool, but frankly very noncommercial idea. As with any good brainstorming session, there were "no bad ideas," so sometimes we would veer off into fanciful territory, or even very *evil* territory.

It's one of those evil ideas that I keep coming back to. Sometimes, during these money-making brainstorm sessions, we'd decompose the technology we were working on into its component parts to see if any subset of them might make money ("Be the first person to not do something no one has ever not done before" – B. Eno).

We had a (by contemporary standards, primitive) machine-learning system; we had a web crawler; and we had a keen sense of how the early web worked. In particular, we were really interested in a new, Linux-based search tool that used citation analysis – a close cousin to our own collaborative filter, harnessing latent clues about relevance implicit in the web's structure – to produce the best search results the web had ever seen. Like us, this company had no idea how to make money, so we were watching it very carefully. That company was called "Google."

That's where the evil part came in. We were pretty sure we could extract a list of the 100,000 most commonly searched terms from Google, and then we could use our web-crawler to capture the top 100 results for each. We could feed these to our Bayesian machine-learning tool to create statistical models of the semantic structure of these results, and then we could generate thousands of pages of word-salad for each of those keywords that matched those statistical models, along with interlinks that could trick Google's citation analysis model. Plaster those word-salad pages with ads, and voila – free cash flow!

Of course, we didn't do it. But even as we developed this idea, the room crackled with a kind of dark, excited dread. We weren't any smarter than many other rooms full of people who were engaged in exercises just like this one. The difference was, we *loved* the web. The idea of someone deliberately poisoning it this way churned our stomachs. The whole point of Opencola was to connect people with each other based on their shared interests. We *loved* Google and how it helped you find the people who wrote the web in ways that delighted and informed you. This kind of spam, aimed at wrecking Google's ability to help people make sense of the things we were all posting to the internet, was…*grotesque*.

I didn't know the term then, but what we were doing amounted to "red-teaming" – thinking through the ways that attackers could destroy something that we valued. Later, we tried "blue-teaming," trying to imagine how our tools might help us fight back if someone else got the same idea and went through with it.

I didn't know the term "blue-teaming" then, either. Once I learned these terms, they brought a lot of clarity to the world. Today, I have another term that I turn to when I am trying to rally other people who love the internet and want it to be good: "Tron-pilled." Tron "fought for the user." Lots of us technologists are Tron-pilled. Back in the early days, when it wasn't clear that there was ever going to be any money in this internet thing, being Tron-pilled was pretty much the only reason to get involved with it. Sure, there were a few monsters who fell into the early internet because it offered them a chance to torment strangers at a distance, but they were vastly outnumbered by the legion of Tron-pilled nerds who wanted to make the internet better because we wanted all our normie friends to have the same kind of good time we were having.

The point of this is that there were *lots* of people back then who had the capacity to imagine the kind of gross stuff that Zuckerberg, Musk, and innumerable other scammers, hustlers and creeps got up to on the web. The thing that distinguished these monsters wasn't their genius – it was their callousness. When *we* brainstormed ways to break the internet, we felt scared and were inspired to try to save it. When *they* brainstormed ways to break the internet, they created pitch-decks.

And still: the old web was good in so many ways for so long. The Tron-pilled amongst us held the line. When we build a new, good, post-American internet, we're going to need a multitude of Tron-pilled technologists, old and young, who build, maintain – and, above all, *defend* it.

---

<a name="linkdump"></a>

Hey look at this ([permalink](https://pluralistic.net/2026/04/11/obvious-terrible-ideas/#linkdump))
==========

![](https://i0.wp.com/craphound.com/images/heylookatthis3.jpg?w=840&ssl=1)

* Apple signs meaningless deal to make some less-important parts in America [https://www.theregister.com/2026/03/26/apple\_expands\_list\_of\_bits/](https://www.theregister.com/2026/03/26/apple_expands_list_of_bits/)

* Public Service Decline and Support for the Populist Right [https://catherinedevries.eu/NHS.pdf](https://catherinedevries.eu/NHS.pdf)

* Another Court Rules Copyright Can’t Stop People From Reading and Speaking the Law [https://www.eff.org/deeplinks/2026/04/another-court-rules-copyright-cant-stop-people-reading-and-speaking-law](https://www.eff.org/deeplinks/2026/04/another-court-rules-copyright-cant-stop-people-reading-and-speaking-law)

* Yikes, Encryption’s Y2K Moment is Coming Years Early [https://www.eff.org/deeplinks/2026/04/yikes-encryptions-y2k-moment-coming-years-early](https://www.eff.org/deeplinks/2026/04/yikes-encryptions-y2k-moment-coming-years-early)

* Vertical Vertigo [https://prospect.org/2026/04/10/apr-2026-magazine-vertical-vertigo-franchise-deregulation-antitrust-law/](https://prospect.org/2026/04/10/apr-2026-magazine-vertical-vertigo-franchise-deregulation-antitrust-law/)

---

<a name="retro"></a>  
![A shelf of leatherbound history books with a gilt-stamped series title, 'The World's Famous Events.'](https://i0.wp.com/craphound.com/images/worlds-famous-events.png?w=840&ssl=1)

Object permanence ([permalink](https://pluralistic.net/2026/04/11/obvious-terrible-ideas/#retro))
==========

\#25yrsago Trotsky’s assassination – according to the FBI [https://web.archive.org/web/20010413212536/http://foia.fbi.gov/trotsky.htm](https://web.archive.org/web/20010413212536/http://foia.fbi.gov/trotsky.htm)

\#25yrsago Online headline-writing guidelines from Jakob Nielsen [https://memex.craphound.com/2001/04/09/headline-writing-guidelines-from-legendary-usability/](https://memex.craphound.com/2001/04/09/headline-writing-guidelines-from-legendary-usability/)

\#25yrsago Floppy-disk stained-glass windows [https://web.archive.org/web/20010607052511/http://www.acme.com/jef/crafts/bathroom\_windows.html](https://web.archive.org/web/20010607052511/http://www.acme.com/jef/crafts/bathroom_windows.html)

\#15yrsago English school principal announces zero tolerance for mismatched socks [https://nationalpost.com/news/u-k-school-cracks-down-on-bad-manners](https://nationalpost.com/news/u-k-school-cracks-down-on-bad-manners)

\#1yrago EFF's lawsuit against DOGE will go forward [https://pluralistic.net/2025/04/09/cases-and-controversy/#brocolli-haired-brownshirts](https://pluralistic.net/2025/04/09/cases-and-controversy/#brocolli-haired-brownshirts)

---

<a name="upcoming"></a>

Upcoming appearances ([permalink](https://pluralistic.net/2026/04/11/obvious-terrible-ideas/#upcoming))
==========

![A photo of me onstage, giving a speech, pounding the podium.](https://i0.wp.com/craphound.com/images/appearances3.jpg?w=840&ssl=1)

* Toronto: DemocracyXchange, Apr 16  
  [https://www.democracyxchange.org/news/cory-doctorow-to-open-dxc26-on-april-16](https://www.democracyxchange.org/news/cory-doctorow-to-open-dxc26-on-april-16)

* San Francisco: 2026 Berkeley Spring Forum on M&A and the Boardroom, Apr 23  
  [https://www.theberkeleyforum.com/#agenda](https://www.theberkeleyforum.com/#agenda)

* London: Resisting Big Tech Empires (LSBU), Apr 25  
  [https://www.tickettailor.com/events/globaljusticenow/2042691](https://www.tickettailor.com/events/globaljusticenow/2042691)

* NYC: Enshittification at Commonweal Ventures, Apr 29  
  [https://luma.com/ssgfvqz8](https://luma.com/ssgfvqz8)

* NYC: Techidemic with Sarah Jeong, Tochi Onyibuchi and Alia Dastagir (PEN World Voices), Apr 30  
  [https://worldvoices.pen.org/event/techidemic/](https://worldvoices.pen.org/event/techidemic/)

* Berlin: Re:publica, May 18-20  
  [https://re-publica.com/de/news/rp26-sprecher-cory-doctorow](https://re-publica.com/de/news/rp26-sprecher-cory-doctorow)

* Berlin: Enshittification at Otherland Books, May 19  
  [https://www.otherland-berlin.de/de/event-details/cory-doctorow.html](https://www.otherland-berlin.de/de/event-details/cory-doctorow.html)

* Hay-on-Wye: HowTheLightGetsIn, May 22-25  
  [https://howthelightgetsin.org/festivals/hay/big-ideas-2](https://howthelightgetsin.org/festivals/hay/big-ideas-2)

* SXSW London, Jun 2  
  [https://www.sxswlondon.com/session/how-big-tech-broke-the-internet-b3c4a901](https://www.sxswlondon.com/session/how-big-tech-broke-the-internet-b3c4a901)

---

<a name="recent"></a>  
![A screenshot of me at my desk, doing a livecast.](https://i0.wp.com/craphound.com/images/recentappearances3.jpg?w=840&ssl=1)

Recent appearances ([permalink](https://pluralistic.net/2026/04/11/obvious-terrible-ideas/#recent))
==========

* The internet is getting worse (CBC The National)  
  [https://youtu.be/dCVUCdg3Uqc?si=FMcA0EI\_Mi13Lw-P](https://youtu.be/dCVUCdg3Uqc?si=FMcA0EI_Mi13Lw-P)

* Do you feel screwed over by big tech? (Ontario Today)  
  [https://www.cbc.ca/listen/live-radio/1-45-ontario-today/clip/16203024-do-feel-screwed-big-tech](https://www.cbc.ca/listen/live-radio/1-45-ontario-today/clip/16203024-do-feel-screwed-big-tech)

* Launch for Cindy's Cohn's "Privacy's Defender" (City Lights)  
  [https://www.youtube.com/watch?v=WuVCm2PUalU](https://www.youtube.com/watch?v=WuVCm2PUalU)

* Chicken Mating Harnesses (This Week in Tech)  
  [https://twit.tv/shows/this-week-in-tech/episodes/1074](https://twit.tv/shows/this-week-in-tech/episodes/1074)

* The Virtual Jewel Box (U Utah)  
  [https://tanner.utah.edu/podcast/enshittification-cory-doctorow-matthew-potolsky/](https://tanner.utah.edu/podcast/enshittification-cory-doctorow-matthew-potolsky/)

---

<a name="latest"></a>  
![A grid of my books with Will Stahle covers..](https://i0.wp.com/craphound.com/images/recent.jpg?w=840&ssl=1)

Latest books ([permalink](https://pluralistic.net/2026/04/11/obvious-terrible-ideas/#latest))
==========

* "Canny Valley": A limited edition collection of the collages I create for Pluralistic, self-published, September 2025 [https://pluralistic.net/2025/09/04/illustrious/#chairman-bruce](https://pluralistic.net/2025/09/04/illustrious/#chairman-bruce)

* "Enshittification: Why Everything Suddenly Got Worse and What to Do About It," Farrar, Straus, Giroux, October 7 2025  
  [https://us.macmillan.com/books/9780374619329/enshittification/](https://us.macmillan.com/books/9780374619329/enshittification/)

* "Picks and Shovels": a sequel to "Red Team Blues," about the heroic era of the PC, Tor Books (US), Head of Zeus (UK), February 2025 ([https://us.macmillan.com/books/9781250865908/picksandshovels](https://us.macmillan.com/books/9781250865908/picksandshovels)).

* "The Bezzle": a sequel to "Red Team Blues," about prison-tech and other grifts, Tor Books (US), Head of Zeus (UK), February 2024 ([thebezzle.org](http://thebezzle.org)).

* "The Lost Cause:" a solarpunk novel of hope in the climate emergency, Tor Books (US), Head of Zeus (UK), November 2023 ([http://lost-cause.org](http://lost-cause.org)).

* "The Internet Con": A nonfiction book about interoperability and Big Tech (Verso) September 2023 ([http://seizethemeansofcomputation.org](http://seizethemeansofcomputation.org)). Signed copies at Book Soup ([https://www.booksoup.com/book/9781804291245](https://www.booksoup.com/book/9781804291245)).

* "Red Team Blues": "A grabby, compulsive thriller that will leave you knowing more about how the world works than you did before." Tor Books [http://redteamblues.com](http://redteamblues.com).

* "Chokepoint Capitalism: How to Beat Big Tech, Tame Big Content, and Get Artists Paid, with Rebecca Giblin", on how to unrig the markets for creative labor, Beacon Press/Scribe 2022 [https://chokepointcapitalism.com](https://chokepointcapitalism.com)

---

<a name="upcoming-books"></a>  
![A cardboard book box with the Macmillan logo.](https://i0.wp.com/craphound.com/images/upcoming-books.jpg?w=840&ssl=1)

Upcoming books ([permalink](https://pluralistic.net/2026/04/11/obvious-terrible-ideas/#upcoming-books))
==========

* "The Reverse-Centaur's Guide to AI," a short book about being a better AI critic, Farrar, Straus and Giroux, June 2026 ([https://us.macmillan.com/books/9780374621568/thereversecentaursguidetolifeafterai/](https://us.macmillan.com/books/9780374621568/thereversecentaursguidetolifeafterai/))

* "Enshittification, Why Everything Suddenly Got Worse and What to Do About It" (the graphic novel), Firstsecond, 2026

* "The Post-American Internet," a geopolitical sequel of sorts to *Enshittification*, Farrar, Straus and Giroux, 2027

* "Unauthorized Bread": a middle-grades graphic novel adapted from my novella about refugees, toasters and DRM, FirstSecond, 2027

* "The Memex Method," Farrar, Straus, Giroux, 2027

---

<a name="bragsheet"></a>  
![](https://i0.wp.com/craphound.com/images/colophon2.jpg?w=840&ssl=1)

Colophon ([permalink](https://pluralistic.net/2026/04/11/obvious-terrible-ideas/#bragsheet))
==========

Today's top sources:

**Currently writing: "The Post-American Internet," a sequel to "Enshittification," about the better world the rest of us get to have now that Trump has torched America. Third draft completed. Submitted to editor.**

* "The Reverse Centaur's Guide to AI," a short book for Farrar, Straus and Giroux about being an effective AI critic. LEGAL REVIEW AND COPYEDIT COMPLETE.

* "The Post-American Internet," a short book about internet policy in the age of Trumpism. PLANNING.

* A Little Brother short story about DIY insulin PLANNING

---

![](https://i0.wp.com/craphound.com/images/by.svg.png?w=840&ssl=1)

This work – excluding any serialized fiction – is licensed under a Creative Commons Attribution 4.0 license. That means you can use it any way you like, including commercially, provided that you attribute it to me, Cory Doctorow, and include a link to pluralistic.net.

[https://creativecommons.org/licenses/by/4.0/](https://creativecommons.org/licenses/by/4.0/)

Quotations and images are not included in this license; they are included either under a limitation or exception to copyright, or on the basis of a separate license. Please exercise caution.

---

How to get Pluralistic:
==========

Blog (no ads, tracking, or data-collection):

[Pluralistic.net](http://pluralistic.net)

Newsletter (no ads, tracking, or data-collection):

[https://pluralistic.net/plura-list](https://pluralistic.net/plura-list)

Mastodon (no ads, tracking, or data-collection):

[https://mamot.fr/@pluralistic](https://mamot.fr/@pluralistic)

Bluesky (no ads, possible tracking and data-collection):

[https://bsky.app/profile/doctorow.pluralistic.net](https://bsky.app/profile/doctorow.pluralistic.net)

Medium (no ads, paywalled):

[https://doctorow.medium.com/](https://doctorow.medium.com/)

Tumblr (mass-scale, unrestricted, third-party surveillance and advertising):

[https://mostlysignssomeportents.tumblr.com/tagged/pluralistic](https://mostlysignssomeportents.tumblr.com/tagged/pluralistic)

"*When life gives you SARS, you make sarsaparilla*" -Joey "Accordion Guy" DeVilla

READ CAREFULLY: By reading this, you agree, on behalf of your employer, to release me from all obligations and waivers arising from any and all NON-NEGOTIATED agreements, licenses, terms-of-service, shrinkwrap, clickwrap, browsewrap, confidentiality, non-disclosure, non-compete and acceptable use policies ("BOGUS AGREEMENTS") that I have entered into with your employer, its partners, licensors, agents and assigns, in perpetuity, without prejudice to my ongoing rights and privileges. You further represent that you have the authority to release me from any BOGUS AGREEMENTS on behalf of your employer.

ISSN: 3066-764X