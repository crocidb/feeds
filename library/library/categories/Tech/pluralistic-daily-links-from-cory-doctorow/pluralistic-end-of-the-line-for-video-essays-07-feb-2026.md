+++
title = "Pluralistic: End of the line for video essays (07 Feb 2026)"
description = "Today's links End of the line for video essays: America's worst copyright law keeps getting even worse. Hey look at this: Delights to delectate. Object permanence: Payphone phaseout; Nvidia sock-puppets; Love picking; Fake locksmiths. Upcoming appearances: Where to find me. Recen"
date = "2026-02-07T08:12:57Z"
url = "https://pluralistic.net/2026/02/07/aimsters-revenge/"
author = "Cory Doctorow"
text = ""
lastupdated = "2026-02-11T20:16:52.206448555Z"
seen = true
+++

[![](https://i0.wp.com/craphound.com/images/07Feb2026.jpg?w=840&ssl=1)](https://pluralistic.net/2026/02/07/aimsters-revenge/)

Today's links
==========

* [End of the line for video essays](https://pluralistic.net/2026/02/07/aimsters-revenge/#effective-means-of-access-control): America's worst copyright law keeps getting even worse.
* [Hey look at this](https://pluralistic.net/2026/02/07/aimsters-revenge/#linkdump): Delights to delectate.
* [Object permanence](https://pluralistic.net/2026/02/07/aimsters-revenge/#retro): Payphone phaseout; Nvidia sock-puppets; Love picking; Fake locksmiths.
* [Upcoming appearances](https://pluralistic.net/2026/02/07/aimsters-revenge/#upcoming): Where to find me.
* [Recent appearances](https://pluralistic.net/2026/02/07/aimsters-revenge/#recent): Where I've been.
* [Latest books](https://pluralistic.net/2026/02/07/aimsters-revenge/#latest): You keep readin' em, I'll keep writin' 'em.
* [Upcoming books](https://pluralistic.net/2026/02/07/aimsters-revenge/#upcoming-books): Like I said, I'll keep writin' 'em.
* [Colophon](https://pluralistic.net/2026/02/07/aimsters-revenge/#bragsheet): All the rest.

---

<a name="effective-means-of-access-control"></a>  
![An image of a static-filled TV; centered in it is a distorted Youtube logo with the wordmark replaced by the word 'FairUse.'](https://i0.wp.com/craphound.com/images/youtube-fairuse.jpg?w=840&ssl=1)

End of the line for video essays ([permalink](https://pluralistic.net/2026/02/07/aimsters-revenge/#effective-means-of-access-control))
==========

What if there was a way for a business to transform any conduct it disliked into a felony, harnessing the power of the state to threaten anyone who acted in a way that displeased the company with a long prison sentence and six-figure fines?

Surprise! That actually exists! It's called Section 1201 of the Digital Millennium Copyright Act, the "anticircumvention" clause, which establishes five-year sentences and $500k fines for anyone who bypasses an "effective access control" for a copyrighted work.

Let's unpack that: every digital product has a "copyrighted work" at its core, because software is copyrighted. Digital systems are intrinsically very flexible: just overwrite, augment, or delete part of the software that powers the device or product, and you change how the product works. You can alter your browser to block ads; or alter your Android phone to run a privacy-respecting OS like Graphene; or alter your printer to accept generic ink, rather than checking each cartridge to confirm that it's the original manufacturer's product.

However, if the device is designed to prevent this – if it has an "access control" that restricts your ability to change the software – then DMCA 1201 makes those modifications into crimes. The act of providing someone with a tool to change how their own property works ("trafficking in circumvention devices") is a felony.

But there's a tiny saving grace here: for DMCA 1201 to kick in, the "access control" must be "effective." What's "effective?" There's the rub: no one knows.

The penalties for getting crosswise with DMCA 1201 are so grotendous that very few people have tried to litigate any of its contours. Whenever the issue comes up, defendants settle, or fold, or disappear. Despite the fact that DMCA 1201 has been with us for more than a quarter of a century, and despite the fact that the activities it restricts are *so* far-reaching, there's precious little case law clarifying Congress's vague statutory language.

When it comes to "effectiveness" in access controls, the jurisprudence is especially thin. As far as I know, there's just one case that addressed the issue, and boy was it a weird one. Back in 2000, a "colorful" guy named Johnny Deep founded a Napster-alike service that piggybacked on the AOL Instant Messenger network. He called his service "Aimster." When AOL threatened him with a trademark suit, he claimed that Aimster was his daughter Amiee's AOL handle, and that the service was named for her. Then he changed the service's name to Madster, claiming that it was *also* named after his daughter. At the time, a lot of people assumed he was BSing, but I just found his obituary and it turns out his daughter's name was, indeed, "Amiee (Madeline) Deep":

[https://www.timesunion.com/news/article/Madster-creator-Cohoes-native-who-fought-record-11033636.php](https://www.timesunion.com/news/article/Madster-creator-Cohoes-native-who-fought-record-11033636.php)

Aimster was one of the many services that the record industry tried to shut down, both by filing suit against the company and by flooding it with takedown notices demanding that individual tracks be removed. Deep responded by "encoding" all of the track names on his network in pig-Latin. Then he claimed that by "decoding" the files (by moving the last letter of the track name to the first position), the record industry was "bypassing an effective access control for a copyrighted work" and thus violating DMCA 1201:

[https://abcnews.go.com/Entertainment/story?id=108454&amp;page=1](https://abcnews.go.com/Entertainment/story?id=108454&amp;page=1)

The court didn't buy this. The judge ruled that pig Latin isn't an "effective access control." Since then, we've known that at least *some* access controls aren't "effective" but we haven't had any clarity on where "effectiveness" starts. After all, there's a certain circularity to the whole idea of "effective" access controls: if a rival engineer can figure out how to get around an access control, can we really call it "effective?" Surely, the fact that someone figured out how to circumvent your access control is proof that it's *not* effective (at least when it comes to that person).

All this may strike you as weird inside baseball, and that's not entirely wrong, but there's one unresolved "effectiveness" question that has some very high stakes indeed: is Youtube's javascript-based obfuscation an "effective access control?"

Youtube, of course, is the internet's monopoly video platform, with a commanding majority of video streams. It was acquired by Google in 2006 for $1.65b. At the time, the service was hemorrhaging money and mired in brutal litigation, but it had one virtue that made it worth nine figures: people liked it. Specifically, people liked it in a way they didn't like Google Video, which was one of the many, many, many failed internally developed Google products that tanked, and was replaced by a product developed by a company that Google bought, because Google sucks at developing products. They're not Willy Wonka's idea factory – they're Rich Uncle Pennybags, buying up other kids' toys:

[https://www.theatlantic.com/ideas/archive/2023/02/google-ai-chatbots-microsoft-bing-chatgpt/673052/](https://www.theatlantic.com/ideas/archive/2023/02/google-ai-chatbots-microsoft-bing-chatgpt/673052/)

Google operationalized Youtube and built it up to the world's most structurally important video platform. Along the way, Google added some javascript that was intended to block people from "downloading" its videos. I put "downloading" in scare-quotes because "streaming" is a consensus hallucination: there is no way for your computer to display a video that resides on a distant server without downloading it – the internet is not made up of a cunning series of paper-towel rolls and mirrors that convey photons to your screen without sending you the bits that make up the file. "Streaming" is just "downloading" with the "save file" button removed.

In this case, the "save file" button is removed by some javascript on every Youtube page. This isn't hard to bypass: there are dozens of "stream-ripping" sites that let you save any video that's accessible on Youtube. I use these all the time – indeed, I used one last week to gank the video of my speech in Ottawa so I could upload it to my own Youtube channel:

[https://www.youtube.com/watch?v=iZxbaCNIwg8](https://www.youtube.com/watch?v=iZxbaCNIwg8)

(As well as the Internet Archive, natch):

[https://archive.org/details/disenshittification-nation](https://archive.org/details/disenshittification-nation)

Now, all of this violates Youtube's terms of service, which means that someone who downloads a stream for an otherwise lawful purpose (like I did) is still hypothetically at risk of being punished by Google. We're relying on Google to be reasonable about all this, which, admittedly, isn't the best bet, historically. But at least the field of people who can attack us is limited to this one company.

That's good, because there's *zillions* of people who rely on stream-rippers, and many of them are Youtube's most popular creators. Youtube singlehandedly revived the form of the "video essay," popularizing it in many guises, from "reaction videos" to full-fledged, in-depth documentaries that make extensive use of clips to illuminate, dispute, and expand on the messages of other Youtube videos.

These kinds of videos are allowed under US copyright law. American copyright law has a broad set of limitation and exceptions, which include "fair use," an expansive set of affirmative rights to access and use copyrighted works, *even against the wishes of the copyright's proprietor*. As the Supreme Court stated in *Eldred*, the only way copyright (a government-backed restriction on who can say certain words) can be reconciled with the First Amendment (a ban on government restrictions on speech) is through fair use, the "escape valve" for free expression embedded in copyright:

[https://en.wikipedia.org/wiki/Eldred\_v.\_Ashcroft](https://en.wikipedia.org/wiki/Eldred_v._Ashcroft)

Which is to say that including clips from a video you're criticizing in your own video is canonical fair use. What else is fair use? Well, it's "fact intensive," which is a lawyer's way of saying, "it depends." One thing that is 100% true, though, is that fair use is *not* limited to the "four factors" enumerated in the statute and anyone who claims otherwise has no idea what they're talking about and can be safely ignored:

[https://pluralistic.net/2024/06/27/nuke-first/#ask-questions-never](https://pluralistic.net/2024/06/27/nuke-first/#ask-questions-never)

Now, fair use or not, there are plenty of people who get angry about their videos being clipped for critical treatment in other videos, because lots of people hate being criticized. This is precisely why fair use exists: if you had to secure someone's permission before you were allowed to criticize them, critical speech would be limited to takedowns of stoics and masochists.

This means that the subjects of video essays can't rely on copyright to silence their critics. They also can't use the fact that those critics violated Youtube's terms of service by clipping their videos, because only Youtube has standing to ask a court to uphold its terms of service, and Youtube has (wisely) steered clear of embroiling itself in fights between critics and the people they criticize.

But that hasn't stopped the subjects of criticism from seeking legal avenues to silence their critics. In a case called *Cordova v. Huneault*, the proprietor of "Denver Metro Audits" is suing the proprietor of "Frauditor Troll Channel" for clipping the former's videos for "reaction videos."

One of the plaintiff's claims here is that the defendant violated Section 1201 of the DMCA by saving videos from Youtube. They argue that Youtube's javascript obfuscator (a "rolling cipher") is an "effective access control" under the statute. Magistrate Judge Virginia K DeMarchi (Northern District of California) agreed with the plaintiff:

[https://torrentfreak.com/images/Cordova-v.-Huneault-25-cv-04685-VKD-Order-on-Motion-to-Dismiss.pdf](https://torrentfreak.com/images/Cordova-v.-Huneault-25-cv-04685-VKD-Order-on-Motion-to-Dismiss.pdf)

As Torrentfreak reports, this ruling "gives creators who want to sue rivals an option to sue for more than just simple copyright infringement":

[https://torrentfreak.com/ripping-clips-for-youtube-reaction-videos-can-violate-the-dmca-court-rules/](https://torrentfreak.com/ripping-clips-for-youtube-reaction-videos-can-violate-the-dmca-court-rules/)

Remember, DMCA 1201 applies *whether or not you infringe someone's copyright*. It is a blanket prohibition on the circumvention of *any* "effective access control" for *any* copyrighted work, even when no one's rights are being violated. It's a way to transform otherwise lawful conduct into a felony. It's what Jay Freeman calls "Felony contempt of business model."

If the higher court upholds this magistrate judge's ruling, then *all* clipping becomes a crime, and the subjects of criticism will have a ready tool to silence any critic. This obliterates fair use, wipes it off the statute-book. It welds shut copyright's escape valve for free expression.

Now, it's true that the US Copyright Office holds hearings every three years where it grants exemptions to DMCA 1201, and it has indeed granted an exemption for ripping video for critical and educational purposes. But this process is deceptive! The exemptions that the Copyright Office grants are "use exemptions" – they allow you to "make the use." However, they are not "tools exemptions" – they do not give you permission to acquire or share the tool *needed* to make the use:

[https://pluralistic.net/2024/10/28/mcbroken/#my-milkshake-brings-all-the-lawyers-to-the-yard](https://pluralistic.net/2024/10/28/mcbroken/#my-milkshake-brings-all-the-lawyers-to-the-yard)

Which means that you are allowed to rip a stream, but you're not allowed to use a stream-ripping service. If Youtube's rolling cipher is an "effective access control" then all of those stream-ripping services are wildly illegal, felonies carrying a five-year sentence and a $500k fine for a first offense under DMCA 1201.

Under the US Copyright Office's exemption process, if you want to make a reaction video, then you, *personally* must create your own stream-ripper. You are not allowed to discuss how to do this with anyone else, and you can't share your stream-ripper with anyone else, and if you do, you've committed a felony.

So this is a catastrophic ruling. If it stands, it will make the production of video essays, reaction videos, and other critical videos into a legal minefield, by giving everyone whose video is clipped and criticized a means to threaten their critics with long prison sentences, fair use be damned. The only people who will safely be able to make this kind of critical video are skilled programmers who can personally defeat Youtube's "rolling cipher." And unlike claims about stream-ripping violating Youtube's terms of service – which can only be brought by Youtube – DMCA 1201 claims can be brought by *anyone* whose videos get clipped and criticized.

Is Youtube's rolling cipher an "effective access control?" Well, *I* don't know how to bypass it, but there are *dozens* of services that have independently figured out how to get around it. That seems like good evidence that the access control is *not* "effective."

When the DMCA was enacted in 1998, this is *exactly* the kind of thing experts warned would happen:

[https://pluralistic.net/2025/05/13/ctrl-ctrl-ctrl/#free-dmitry](https://pluralistic.net/2025/05/13/ctrl-ctrl-ctrl/#free-dmitry)

And here we are, more than a quarter-century later, living in the prison of lawmakers' reckless disregard for evidence and expertise, a world where criticism can be converted into a felony. It's long past time we get rid of this stupid, stupid law:

[https://pluralistic.net/2026/01/01/39c3/#the-new-coalition](https://pluralistic.net/2026/01/01/39c3/#the-new-coalition)

(*Image: [Electronic Frontier Foundation](https://www.eff.org/wp/unfiltered-how-youtubes-content-id-discourages-fair-use-and-dictates-what-we-see-online), [CC BY 4.0](https://www.eff.org/copyright)*)

---

<a name="linkdump"></a>

Hey look at this ([permalink](https://pluralistic.net/2026/02/07/aimsters-revenge/#linkdump))
==========

![](https://i0.wp.com/craphound.com/images/heylookatthis3.jpg?w=840&ssl=1)

* 10 Reasons This Is the Worst Crypto Winter Ever [https://archive.is/U5ede#selection-1246.0-1246.1](https://archive.is/U5ede#selection-1246.0-1246.1)

* The Finance Industry Is a Grift. Let’s Start Treating It That Way. [https://www.nytimes.com/2026/02/06/opinion/capitalism-industry-financialization.html?unlocked\_article\_code=1.KFA.Vslp.8Xqe7KWGEwRu&amp;smid=nytcore-ios-share](https://www.nytimes.com/2026/02/06/opinion/capitalism-industry-financialization.html?unlocked_article_code=1.KFA.Vslp.8Xqe7KWGEwRu&amp;smid=nytcore-ios-share)

* Ron Wyden Only Talks Like This When The Spies Do Something *Real* Bad [https://www.forever-wars.com/ron-wyden-only-talks-like-this-when-the-spies-do-something-real-bad/](https://www.forever-wars.com/ron-wyden-only-talks-like-this-when-the-spies-do-something-real-bad/)

* Hollywood Is Losing Audiences to AI Fatigue [https://www.wired.com/story/hollywood-is-losing-audiences-to-ai-fatigue/](https://www.wired.com/story/hollywood-is-losing-audiences-to-ai-fatigue/)

* Waymo Exec Admits Remote Operators in Philippines Help Guide US Robotaxis [https://eletric-vehicles.com/waymo/waymo-exec-admits-remote-operators-in-philippines-help-guide-us-robotaxis/](https://eletric-vehicles.com/waymo/waymo-exec-admits-remote-operators-in-philippines-help-guide-us-robotaxis/)

---

<a name="retro"></a>  
![A shelf of leatherbound history books with a gilt-stamped series title, 'The World's Famous Events.'](https://i0.wp.com/craphound.com/images/worlds-famous-events.png?w=840&ssl=1)

Object permanence ([permalink](https://pluralistic.net/2026/02/07/aimsters-revenge/#retro))
==========

\#25yrsago Bellsouth phases out pay-phones [https://web.archive.org/web/20010211165636/http://dailynews.yahoo.com/h/ap/20010202/bs/bellsouth\_pay\_phones\_1.html](https://web.archive.org/web/20010211165636/http://dailynews.yahoo.com/h/ap/20010202/bs/bellsouth_pay_phones_1.html)

\#20yrsago Man who shattered museum vases asked not to come back [http://www.chinadaily.com.cn/english/doc/2006-02/07/content\_517885.htm](http://www.chinadaily.com.cn/english/doc/2006-02/07/content_517885.htm)

\#20yrsago Dozens of Web 2.0 companies’ logos [https://flickr.com/photos/torrez/95124293/](https://flickr.com/photos/torrez/95124293/)

\#20yrsago Did Nvidia hire an army of message-board sock-puppets? [https://web.archive.org/web/20060208045150/https://www.consumerist.com/consumer/evil/did-nvidia-hire-online-actors-to-promote-their-products-152874.php](https://web.archive.org/web/20060208045150/https://www.consumerist.com/consumer/evil/did-nvidia-hire-online-actors-to-promote-their-products-152874.php)

\#15yrsago Sarah Palin Circle-R wants a trademark on her name [https://www.loweringthebar.net/2011/02/sarah-palin-tm-having-trouble-with-registration.html](https://www.loweringthebar.net/2011/02/sarah-palin-tm-having-trouble-with-registration.html)

\#10yrsago Love Picking: Locksport meets love locks [https://toool.us/love-locks/](https://toool.us/love-locks/)

\#10yrsago Superb investigative report on the fake locksmith scam [https://www.nytimes.com/2016/01/31/business/fake-online-locksmiths-may-be-out-to-pick-your-pocket-too.html?\_r=1](https://www.nytimes.com/2016/01/31/business/fake-online-locksmiths-may-be-out-to-pick-your-pocket-too.html?_r=1)

\#5yrsago Klobuchar wants to bust her some fuckin' trusts [https://pluralistic.net/2021/02/06/calera/#fuck-bork](https://pluralistic.net/2021/02/06/calera/#fuck-bork)

---

<a name="upcoming"></a>

Upcoming appearances ([permalink](https://pluralistic.net/2026/02/07/aimsters-revenge/#upcoming))
==========

![A photo of me onstage, giving a speech, pounding the podium.](https://i0.wp.com/craphound.com/images/appearances3.jpg?w=840&ssl=1)

* Salt Lake City: Enshittification at the Utah Museum of Fine Arts (Tanner Humanities Center), Feb 18  
  [https://tanner.utah.edu/center-events/cory-doctorow/](https://tanner.utah.edu/center-events/cory-doctorow/)

* Montreal (remote): Fedimtl, Feb 24  
  [https://fedimtl.ca/](https://fedimtl.ca/)

* Victoria: 28th Annual Victoria International Privacy & Security Summit, Mar 3-5  
  [https://www.rebootcommunications.com/event/vipss2026/](https://www.rebootcommunications.com/event/vipss2026/)

* Berkeley: Bioneers keynote, Mar 27  
  [https://conference.bioneers.org/](https://conference.bioneers.org/)

* Berlin: Re:publica, May 18-20  
  [https://re-publica.com/de/news/rp26-sprecher-cory-doctorow](https://re-publica.com/de/news/rp26-sprecher-cory-doctorow)

* Berlin: Enshittification at Otherland Books, May 19  
  [https://www.otherland-berlin.de/de/event-details/cory-doctorow.html](https://www.otherland-berlin.de/de/event-details/cory-doctorow.html)

* Hay-on-Wye: HowTheLightGetsIn, May 22-25  
  [https://howthelightgetsin.org/festivals/hay/big-ideas-2](https://howthelightgetsin.org/festivals/hay/big-ideas-2)

---

<a name="recent"></a>  
![A screenshot of me at my desk, doing a livecast.](https://i0.wp.com/craphound.com/images/recentappearances3.jpg?w=840&ssl=1)

Recent appearances ([permalink](https://pluralistic.net/2026/02/07/aimsters-revenge/#recent))
==========

* Everything Wrong With the Internet and How to Fix It, with Tim Wu (Ezra Klein)  
  [https://www.nytimes.com/2026/02/06/opinion/ezra-klein-podcast-doctorow-wu.html](https://www.nytimes.com/2026/02/06/opinion/ezra-klein-podcast-doctorow-wu.html)

* How the Internet Got Worse (Masters in Business)  
  [https://www.youtube.com/watch?v=auXlkuVhxMo](https://www.youtube.com/watch?v=auXlkuVhxMo)

* Enshittification (Jon Favreau/Offline):  
  [https://crooked.com/podcast/the-enshittification-of-the-internet-with-cory-doctorow/](https://crooked.com/podcast/the-enshittification-of-the-internet-with-cory-doctorow/)

* Why Big Tech is a Trap for Independent Creators (Stripper News)  
  [https://www.youtube.com/watch?v=nmYDyz8AMZ0](https://www.youtube.com/watch?v=nmYDyz8AMZ0)

* Enshittification (Creative Nonfiction podcast)  
  [https://brendanomeara.com/episode-507-enshittification-author-cory-doctorow-believes-in-a-new-good-internet/](https://brendanomeara.com/episode-507-enshittification-author-cory-doctorow-believes-in-a-new-good-internet/)

---

<a name="latest"></a>  
![A grid of my books with Will Stahle covers..](https://i0.wp.com/craphound.com/images/recent.jpg?w=840&ssl=1)

Latest books ([permalink](https://pluralistic.net/2026/02/07/aimsters-revenge/#latest))
==========

* "Canny Valley": A limited edition collection of the collages I create for Pluralistic, self-published, September 2025

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

Upcoming books ([permalink](https://pluralistic.net/2026/02/07/aimsters-revenge/#upcoming-books))
==========

* "Unauthorized Bread": a middle-grades graphic novel adapted from my novella about refugees, toasters and DRM, FirstSecond, 2026

* "Enshittification, Why Everything Suddenly Got Worse and What to Do About It" (the graphic novel), Firstsecond, 2026

* "The Memex Method," Farrar, Straus, Giroux, 2026

* "The Reverse-Centaur's Guide to AI," a short book about being a better AI critic, Farrar, Straus and Giroux, June 2026

---

<a name="bragsheet"></a>  
![](https://i0.wp.com/craphound.com/images/colophon2.jpg?w=840&ssl=1)

Colophon ([permalink](https://pluralistic.net/2026/02/07/aimsters-revenge/#bragsheet))
==========

Today's top sources:

**Currently writing: "The Post-American Internet," a sequel to "Enshittification," about the better world the rest of us get to have now that Trump has torched America (1010 words today, 24701 total)**

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

Medium (no ads, paywalled):

[https://doctorow.medium.com/](https://doctorow.medium.com/)

Twitter (mass-scale, unrestricted, third-party surveillance and advertising):

[https://twitter.com/doctorow](https://twitter.com/doctorow)

Tumblr (mass-scale, unrestricted, third-party surveillance and advertising):

[https://mostlysignssomeportents.tumblr.com/tagged/pluralistic](https://mostlysignssomeportents.tumblr.com/tagged/pluralistic)

"*When life gives you SARS, you make sarsaparilla*" -Joey "Accordion Guy" DeVilla

READ CAREFULLY: By reading this, you agree, on behalf of your employer, to release me from all obligations and waivers arising from any and all NON-NEGOTIATED agreements, licenses, terms-of-service, shrinkwrap, clickwrap, browsewrap, confidentiality, non-disclosure, non-compete and acceptable use policies ("BOGUS AGREEMENTS") that I have entered into with your employer, its partners, licensors, agents and assigns, in perpetuity, without prejudice to my ongoing rights and privileges. You further represent that you have the authority to release me from any BOGUS AGREEMENTS on behalf of your employer.

ISSN: 3066-764X