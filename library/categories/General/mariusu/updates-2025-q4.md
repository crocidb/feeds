+++
title = "Updates 2025/Q4"
description = "Life and project updates from the current consecutive three-month period. You might find this interesting in case you're using any of my open source tools or you just want to read random things. :-)"
date = "2025-12-31T12:24:38Z"
url = "https://xn--gckvb8fzb.com/updates-2025-q4/"
author = "marius@xn--gckvb8fzb.com (Marius)"
text = ""
lastupdated = "2026-02-11T20:16:58.787247258Z"
seen = false
+++

This post includes personal updates and some open source project updates.

Personal things
----------

As the year comes to a close, I’d like to begin this update by sharing a [famous](https://news.ycombinator.com/item?id=32975173) (and sadly [now gone](https://x.com/foone/status/1572260363764400129)) [tweet](https://web.archive.org/web/20220930061140/https://twitter.com/foone/status/1572260363764400129). My goal is not only to remind those who have seen it before, but also to introduce it to those who haven’t, along with the thoughts it inevitably sparks. It’s a way to preserve this *rare gem* of social media for posterity. Below is the original post, with added speaker information for easier reading.

**Warning:** This text is a bit long. If you’d rather skip ahead to the next part of the update, [click/tap here](#coffee).

>
>
> Someday aliens are going to land their saucers in a field somewhere in New Jersey and everything is going to go just fine right up until we try to explain our calendar to them.
>
>
>
> Humans: “yeah we divide our year into a number of sub units called ‘months’ made up a number of days, and they’re not all the same length”
>
>
>
> Aliens: “I guess that’s unavoidable, if your rotations-count per orbit is a prime number”
>
>
>
> Humans: “yeah, our’s isn’t prime”
>
>
>
> Aliens: “but surely you have most of these ‘months’ the same length and just make the last one shorter or longer?”
>
>
>
> Humans: “No… They’re different lengths following no logical pattern”
>
>
>
> Aliens: “what”
>
>
>
> Humans: “and we further subdivide the months into ‘weeks’, which is 7 days.”
>
>
>
> Aliens: “ahh, so each month is an integer multiple of weeks?”
>
>
>
> Humans: “that would make sense, but no. Only one is, sometimes”
>
>
>
> Aliens: “SOMETIMES?!”
>
>
>
> Humans: “yeah our orbit around the sun isn’t an integer number of days, so we have to change the number of days to in a year from time to time”
>
>
>
> Aliens: “oh yes, a similar thing happens on Epsilon Indi 7, where they have to add an extra day every 39 years to keep holidays on track”
>
>
>
> Humans: “yeah that’s how ours work! Although the ratio doesn’t work out cleanly, so we just do every 4 years, except every 100 years, except except every 400 years”
>
>
>
> Aliens: “oh, you number your years? What’s the epoch?”
>
>
>
> Humans: “uh, it’s supposed to be the birth of a religious leader, but they got the math wrong so it’s off by 4 years, if he existed at all.”
>
>
>
> Aliens: “if? You based your calendar off the birth date of someone you’re not sure exists?”
>
>
>
> Humans: “yeah. He’s written about in a famous book but historical records are spotty.”
>
>
>
> Aliens: “interesting. I didn’t realize your planet was one of the ones with a single universal religion, that usually only happens in partial or complete hive minds.”
>
>
>
> Humans: “uhh, we’re not.”
>
>
>
> Aliens: “You’re not?!”
>
>
>
> Humans: “yeah we have multiple religions.”
>
>
>
> Aliens: “oh but they all have a common ancestor, which agrees on the existence of that leader, right?”
>
>
>
> Humans: “uh, no. Two of the big ones do, but most of the others don’t believe in him”
>
>
>
> Aliens: “YOUR CALENDAR IS BASED ON A RELIGIOUS LEADER THAT NOT EVERYONE BELIEVES IN?”
>
>
>
> Humans: “well, on his birth. And yeah, we got it wrong by a couple years.”
>
>
>
> Aliens: “OK, fine. So, you have somewhat complicated rules about when you change the length of your years, and I’m scared to ask this, but… You definitely just add or subtract that extra day at the end, right?”
>
>
>
> Humans: “…. Nope.”
>
>
>
> Aliens: “At the start of the year? "
>
>
>
> Humans: “nah. The end of the second month”
>
>
>
> Aliens: “WHY WOULD IT BE THE SECOND MONTH?”
>
>
>
> Humans: “I’m not sure, really.” Aliens: “huh. So at this point I’m dreading asking this, but how do you measure time within each day?”
>
>
>
> Humans: “oh that’s much simpler. Each day is divided into hours, each hour has minutes, and each minute has seconds.”
>
>
>
> Aliens: “ok. And 10 of each?”
>
>
>
> Humans: “10 hours? No. There’s 24 hours, 60 minutes, 60 seconds”
>
>
>
> Aliens: “…. I thought you said you used a base-10 counting system”
>
>
>
> Humans: “we do! Mostly. But our time system came from some long gone civilization that liked base-60 like 5000 years ago”
>
>
>
> Aliens: “and you haven’t changed it since?”
>
>
>
> Humans: “No.”
>
>
>
> Aliens: “huh. Okay, so why 24? That’s not a divisor of 60”
>
>
>
> Humans: “oh because it’s actually 12!”
>
>
>
> Aliens: “what”
>
>
>
> Humans: “yeah each day is 24 hours but they are divided into two sets of 12.”
>
>
>
> Aliens: “and that’s 5 12s, right, I see the logic here, almost. So like, after hour 12, it becomes the second half, which is 1?”
>
>
>
> Humans: “No, after 11.”
>
>
>
> Aliens: “oh, you zero-index them! So it’s hours 0-11 in the first half, then 12-23 in the second half?”
>
>
>
> Humans: “No. 12 to 11 in the first half, and again in the second half”
>
>
>
> Aliens: “please explain that before my brain melts out my mouth”
>
>
>
> Humans: “the first hour is 12. Then the next one is 1, then it goes back up to 11, then 12 again”
>
>
>
> Aliens: “that is not how numbers work. And how do you tell first 12 apart from second 12?”
>
>
>
> Humans: “oh we don’t use numbers for that!”
>
>
>
> Aliens: “you don’t number the two halves of your day?”
>
>
>
> Humans: “nah, we call them AM and PM”
>
>
>
> Aliens: “WHAT DOES THAT MEAN”
>
>
>
> Humans: “I think it’s ante-meridian and post-meridian? But I’m not sure, I dont know much Latin”
>
>
>
> Aliens: “Latin?”
>
>
>
> Humans: “yeah it’s an ancient language from an old empire which controlled a lot of the world and we still use some of their terms”
>
>
>
> Aliens: “oh, and that was the civilization that liked base-60 and set up your time system?”
>
>
>
> Humans: “that would make sense, but… No, completely different one.”
>
>
>
> Aliens: “okay, and what do you do to if you want to measure very short times, shorter than a second?”
>
>
>
> Humans: “oh we use milliseconds and microseconds”
>
>
>
> Aliens: “ahh, those are a 60th of a second and then 60th of the other?”
>
>
>
> Humans: “No. Thousandths.”
>
>
>
> Aliens: “so you switch to base-10 at last, but only for subdivisions of the second?”
>
>
>
> Humans: “yeah.”
>
>
>
> Aliens: “but at thousands, ie, ten tens tens”
>
>
>
> Humans: “yeah. Technically we have deciseconds and centiseconds, which are 1/10 of a second, and 1/100 of a second, but no one really uses them. We just use milli.”
>
>
>
> Aliens: “that seems more like a base-1000 system than a base-10 system.”
>
>
>
> Humans: “it kinda is? We do a similar thing with measures of volume and distance and mass.”
>
>
>
> Aliens: “but you still call it base-10?”
>
>
>
> Humans: “yeah”
>
>
>
> Aliens: “so let me see if I get this right: Your years are divided in 10 months, each of which is some variable number of days, the SECOND of which varies based on a complex formula… and each day is divided into two halves of 12 hours, of 60 minutes, 60 seconds, 1000 milliseconds?”
>
>
>
> Humans: “12 months, actually.”
>
>
>
> Aliens: “right, because of the ancient civilization that liked base-60, and 12 is a divisor of 60.”
>
>
>
> Humans: “No, actually, that came from the civilization that used latin. Previously there were 10.”
>
>
>
> Aliens: “what”
>
>
>
> Humans: “yeah the Latin guys added two months part of the way through their rule, adding two more months. That’s why some are named after the wrong numbers”
>
>
>
> Aliens: “you just said two things I am having trouble understanding. 1. Your months are named, not numbered? 2. THE NAMES ARE WRONG?”
>
>
>
> Humans: “yep! Our 9th month is named after the number 7, and so on for 10, 11, and 12.”
>
>
>
> Aliens: “your 12th month is named… 10?”
>
>
>
> Humans: “yeah.”
>
>
>
> Aliens: “what are the other ones named after?!”
>
>
>
> Humans: “various things. Mainly Gods or rulers”
>
>
>
> Aliens: “oh, from that same religion that your epoch is from?”
>
>
>
> Humans: “uh… No. Different one.”
>
>
>
> Aliens: “so you have an epoch based on one religion, but name your months based on a different one?”
>
>
>
> Humans: “yeah! Just wait until you hear about days of the week.”
>
>
>
> Aliens: “WHAT”
>
>
>
> Humans: “so yeah we group days into 7-day periods-”
>
>
>
> Aliens: “which aren’t an even divisor of your months lengths or year lengths?”
>
>
>
> Humans: “right. Don’t interrupt”
>
>
>
> Aliens: “sorry”
>
>
>
> Humans: “but we name the days of the week, rather than numbering them. Funny story with that, actually: there’s disagreement about which day starts the week.”
>
>
>
> Aliens: “you have a period that repeats every 7 days and you don’t agree when it starts?”
>
>
>
> Humans: “yeah, it’s Monday or Sunday.”
>
>
>
> Aliens: “and those names come from…”
>
>
>
> Humans: “celestial bodies and gods! The sun and moon are Sunday and Monday, for example”
>
>
>
> Aliens: “but… I looked at your planet’s orbit parameters. Doesn’t the sun come up every day?”
>
>
>
> Humans: “yeah.”
>
>
>
> Aliens: “oh, do you have one of those odd orbits where your natural satellite is closer or eclipsed every 7 days, like Quagnar 4?”
>
>
>
> Humans: “no, the sun and moon are the same then as every other day, we just had to name them something.”
>
>
>
> Aliens: “and the other days, those are named after gods?”
>
>
>
> Humans: “yep!”
>
>
>
> Aliens: “from your largest religion, I imagine?”
>
>
>
> Humans: “nah. That one (and the second largest, actually) only has one god, and he doesn’t really have a name.”
>
>
>
> Aliens: “huh. So what religion are they from? The Latin one again?”
>
>
>
> Humans: “nah, they only named one of the God-days”
>
>
>
> Aliens: “only on… SO THE OTHER DAYS ARE FROM A DIFFERENT RELIGON ENTIRELY?”
>
>
>
> Humans: “Yep!”
>
>
>
> Aliens: “the third or forth biggest, I assume?”
>
>
>
> Humans: “nah, it’s one that… Kinda doesn’t exist anymore? It mostly died out like 800 years ago, though there are some modern small revivals, of course”
>
>
>
> Aliens: “so, let me get confirm I am understanding this correctly. Your days and hours and seconds and smaller are numbered, in a repeating pattern. But your years are numbered based on a religious epoch, despite it being only one religion amongst several.”
>
>
>
> Humans: “correct so far”
>
>
>
> Aliens: “and your months and days of the week are instead named, although some are named after numbers, and it’s the wrong numbers”
>
>
>
> Humans: “exactly”
>
>
>
> Aliens: “and the ones that aren’t numbers or rulers or celestial objects are named after gods, right?”
>
>
>
> Humans: “yup!”
>
>
>
> Aliens: “but the months and the days of the week are named after gods from different religons from the epoch religion, and indeed, each other?”
>
>
>
> Humans: “yeah! Except Saturday. That’s the same religion as the month religion”
>
>
>
> Aliens: “and the month/Saturday religion is also from the same culture who gave you the 12 months system, and the names for the two halves of the day, which are also named?”
>
>
>
> Humans: “right! Well, kinda.”
>
>
>
> Aliens: “please explain, slowly and carefully”
>
>
>
> Humans: “yeah so cultures before then had a 12 month system, because of the moon. But they had been using a 10 month system, before switching to 12 and giving them the modern names”
>
>
>
> Aliens: “the… Moon? Your celestial body?”
>
>
>
> Humans: “yeah, it completes an orbit about every 27 days, so which is about 12 times a year, so it is only natural to divide the year into 12 periods, which eventually got called months”
>
>
>
> Aliens: “ok, that makes sense. Wait, no. Your orbital period is approximately 365.25 days, right?”
>
>
>
> Humans: “yeah. That’s why we do 365 or 366 based on the formula”
>
>
>
> Aliens: “but that doesn’t work. 365 divided by 27 is \~13.5, not 12”
>
>
>
> Humans: “yeah I’m not sure why 12 was so common then. Maybe it goes back to the base 60 people?”
>
>
>
> Aliens: “okay so one final check before I file this report: Years are numbered based on a religious leader. Years always have 12 months, but the lengths of those months is not consistent between each other or between years.”
>
>
>
> Humans: “don’t forget the epoch we number our years from is wrong!”
>
>
>
> Aliens: “right, yes. And your months are named, some after a different religion, and some after numbers, but not the number the month is in the year.”
>
>
>
> Humans: “right. And when we change the month lengths, it’s the second one we change”
>
>
>
> Aliens: “how could I forget? After months you have a repeating ‘week’ of 7 days, which is named after gods from two religons, one of which is the month-naming one, and a nearly extinct one. And you don’t agree when the week starts.”
>
>
>
> Humans: “nope! My money is on Monday.”
>
>
>
> Aliens: “that’s the Monday that’s named after your moon, which supposedly influenced the commonality of the 12 months in a year cycle, despite it orbiting 13 times in a year?”
>
>
>
> Humans: “correct!”
>
>
>
> Aliens: “and as for your days, they split into two halves, named after a phrase you don’t really understand in the long dead language of the same culture that named the months and Saturday.”
>
>
>
> Humans: “Yep. I took some in college but all I remember is like, ‘boy’, ‘girl’, ‘stinky’, ‘cocksucker’”
>
>
>
> Aliens: “charming. And then each half is divided into 12 hours, but you start at 12, then go to 1, and up to 11”
>
>
>
> Humans: “all I can say is that it makes more sense on analog clocks.”
>
>
>
> Aliens: “i don’t know what that is and at this point I would prefer you not elaborate. So each of those hours is divided into 60 minutes and then 60 seconds, and this comes from an ancient civilization, but not the one that gave you the month names”
>
>
>
> Humans: “yep. Different guys. Different part of the world.”
>
>
>
> Aliens: “ok. And then after seconds, you switch to a ‘base-10’ system, but you only really use multiples of a thousand? Milliseconds and microseconds?”
>
>
>
> Humans: “right. And there’s smaller ones beyond that, but they all use thousands”
>
>
>
> Aliens: “right. Got it. All written down here. Now if you’ll excuse me, I just gotta go make sure I didn’t leave my interociter on, I’ll be right back.”
>
>
>
> The tall alien walks back into their saucer without a wave. The landing ramp closes.
>
>
>
> The ship gently lifts off as gangly landing legs retract. There’s a beat, then a sudden whooshing sound as air rushes back into the space that previously held the craft, now suddenly vacuum.
>
>
>
> NORAD alarms go off briefly as an object is detected leaving the earth’s atmosphere at a significant fraction of the speed of light.
>
>
>
> In the years to come, many technological advances are made from what was left behind, a small tablet shaped object made of some kind of artifical stone/neutrino composite material.
>
>
>
> The alien message left on screen is eventually translated to read “Untitled Document 1 has not been saved, are you sure you wish to quit? (yes) (no) (cancel)”
>
>
>
> Many years have passed, and we await the day the aliens return. They have not.
>
>

### Coffee ###

As I mentioned in the previous update ([here](/updates-2025-q3/#coffee)), my beloved [9barista coffee brewer](/coffee/#9barista) started malfunctioning at the end of Q3, likely due to the age of the O-ring sealing the water chamber and the descaling process I performed. However, I was able to fix the *machine* using the official 9barista *repair kit* and have been using it daily ever since.

In recent months, though, I’ve almost entirely switched to [decaf coffee](/coffee/#beans) in an effort to reduce some recurring headaches I’ve been dealing with for a while. It doesn’t seem to be the constant consumption of caffeine causing the issue; rather, the headaches mostly appeared whenever I skipped a cup, making it seem more like a caffeine withdrawal effect.

Although I continued to experience headaches in Q4, those were likely linked to being sick rather than coffee, [see below](#covid). That said, both the frequency and intensity of the headaches have noticeably decreased.

Toward the end of Q4, I also began experimenting with *additions* to my coffee, specifically [*Lion’s Mane*](https://en.wikipedia.org/wiki/Hericium_erinaceus), a well-known component of traditional Chinese medicine that’s often advertised as an alternative to caffeine. It’s believed to enhance focus without the jitters or cold sweats that usually come with high caffeine consumption.

### SARS-CoV-2 ###

[![](/updates-2025-q4/images/covid_hu_ff9d8fd1c55390e7.webp)](/updates-2025-q4/images/covid.jpg)

In mid-October, I unfortunately got hit with a heavy dose of *COVID-19*, which knocked me out for three weeks and has had (once again) a lasting impact on my overall health. Since I was mostly bedbound during that time, I spent some of it exchanging *COVID* anecdotes with the friendly folks in the [community channel](/contact/#xmpp). I was surprised to find that many people there had similar negative experiences, particularly in relation to post-vaccine infections.

#### 2020 ####

My first encounter with *COVID* was back in 2020, and for me, it turned out to be little more than a bad flu, with two days of fever and some headaches. I didn’t lose my sense of smell or taste, nor did I experience any long-term effects. In fact, the most troubling part of the whole *COVID* experience for me back then wasn’t the sickness itself, but the fear of being picked up by local authorities for having an elevated body temperature. This was especially concerning because I was still [traveling the world](/travel/) at the time, enjoying the eerie quiet of empty airports and cities.

#### 2021/2022 ####

Due to increasing social pressure, especially from governments imposing heavy travel restrictions, I was eventually *pushed* into getting vaccinated shortly after that. Unfortunately, my body didn’t handle the two doses very well. I experienced extreme muscle pain and a general sense of being *under the weather*. While those side effects faded after a few days, in the months that followed, I felt more tired and inflamed than usual, with recurring flu-like symptoms and headaches. At some point, *COVID* hit me again, but this time it was **really** bad.

I ended up battling a fever around 40°C/104°F for over a week, and I was completely knocked out for almost two months. On top of that, I began experiencing cardiovascular symptoms, which persisted for months and even years afterward. The adverse effects I’d never experienced before didn’t just show up with subsequent *COVID* infections, but also with regular flu. There was one point when a strain of *Influenza B* hit me so hard that I had to visit the emergency room, which is something I’d never done before, even though I’d never received the annual flu vaccine.

To this day, it feels like ever since I got the *Pfizer* shots (for which I had to sign a liability waiver), my health has been in a constant decline, especially whenever influenza or *COVID* strikes. No matter how healthy my diet or activity level, it doesn’t seem to make much of a difference. In fact, the ongoing inflammation and regular flu-like symptoms have made it especially hard to push myself during a [workout](/workout/) or a run.

#### 2023 - Today ####

At some point, I started digging deeper into the issue, with regular bloodwork and visits to specialists, particularly cardiologists. Unfortunately, as is often the case, no medical expert has been able to diagnose the underlying issue(s) or propose meaningful solutions. Society seems [quick to ridicule](https://www.theguardian.com/technology/2025/aug/12/us-man-bromism-salt-diet-chatgpt-openai-health-information) those who seek to improve their health through unconventional methods, yet most people fail to recognize the globally poor state of healthcare, which leaves people stranded, regardless of how much private money they’re willing to spend to solve their problems.

Long story short, will I continue to get the *battletested* shots for *Hepatitis*, *Tetanus*, and other dangers humanity faces? **Definitely.** But will I be significantly more skeptical of vaccines that didn’t undergo year-long trials and were fast-tracked by every government on Earth to curb an allegedly man-made virus that escaped a biological research facility, all while *creating shareholder value*? **You bet!**

**Note:** This is a complex topic, and everyone has their own personal experience. For many, the COVID shots seem to have had no negative side effects. For some, however, they did. This doesn’t mean that COVID doesn’t exist, nor that *lizard overlords* used it as an excuse to inject us with *nanobots*. Medicine certainly has its flaws, and financial interests were prioritized over absolute safety, something that’s happened in other areas as well over the past few years (e.g., *Boeing*).

If, however, you think there’s a *pLaNdEmIc* or some intentional, *eViL gEnEtIc ExPeRiMeNt* at play, there’s **no need at all** to launch your *XLibre Xserver* to reach out to me with *fUrThEr iNfO oN tHiS tOpIc*. Thank you.

### Site updates ###

You might have noticed that the main menu at the top of this website has grown, now including a [*now page*](/now/), as well as a link to Codeberg, but more on that [in a second](#codeberg).

The *now page* is exactly what the name suggests: a [now page](https://nownownow.com/about). Given the failure of social media, I’ve pretty much given up on maintaining a public profile for posting status updates.

Up until the end of 2021, I was still actively maintaining a [Mastodon account alongside a TUI client](/updates-2021-q3/#gomphotherium), but that eventually fell apart for multiple reasons. After that, I used [Nostr](https://primal.net/e/nevent1qqswpk90sg2c2jkmks2vzz990wt6hhyczvfgrtffvcynfv86n850y5sl8x7q5) for a while, but eventually gave it up too. These days, I’m somewhat active on [Bluesky](https://bsky.app/profile/xn--gckvb8fzb.com), though my account isn’t publicly available. I don’t have high hopes for Bluesky either, and I’ll probably delete my account there one day, at the latest when Bluesky inevitably becomes *enshittified*.

The *now page*, however, is here to stay. It will continue to feature short, *tweet*-like updates about all sorts of things. If you’re interested, feel free to check it every once in a while. I might even activate a dedicated RSS feed for it at some point.

### Infrastructure & hardware ###

#### GitHub -\> Codeberg ####

For the past few months I’ve been silently moving most private project repositories away from GitHub towards privately hosted instances of [*Forgejo*](https://forgejo.org) – a terrible name, btw – as well as many of my public [GitHub](https://github.com/mrusme) projects to [Codeberg](https://codeberg.org/mrus). One reason to do so is… well, let me just [quote Andrew Kelley](https://ziglang.org/news/migrating-from-github-to-codeberg/) here, who probably put it best:

>
>
> […] the engineering excellence that created GitHub’s success is no longer driving it. Priorities and the engineering culture have rotted, leaving users inflicted with some kind of bloated, buggy JavaScript framework in the name of progress. Stuff that used to be snappy is now sluggish and often entirely broken.
>
>
>
> Most importantly, Actions has [inexcusable bugs](https://github.com/actions/runner/issues/3792#issuecomment-3182746514) while being [completely neglected](https://github.com/actions/runner/issues/385). After the [CEO of GitHub said to “embrace AI or get out”](https://www.businessinsider.com/github-ceo-developers-embrace-ai-or-get-out-2025-8), it seems the lackeys at Microsoft took the hint, because GitHub Actions started “vibe-scheduling”; choosing jobs to run seemingly at random. Combined with other bugs and inability to manually intervene, this causes our CI system to get so backed up that not even master branch commits get checked.
>
>

However, unlike [most people](https://lobste.rs/s/cni8ze/github_codeberg_my_experience) [who decided](https://news.ycombinator.com/item?id=46096800) to migrate from GitHub to Codeberg, I won’t be deleting my repositories on GitHub just yet. Instead, I’ve updated all my local clones to point toward Codeberg, and I’ve enabled synchronized pushes from Codeberg to GitHub, as I plan to continue using GitHub’s workflows.

*“But why?!”* you might ask. The reason is simple: Because I’m happy to waste Microsoft’s resources on automated tests and build actions. While I could use Codeberg’s Woodpecker CI or even set up my own, I’m more than content to keep using GitHub’s CPU cycles for free to build my *silly little projects*, while hosting the primary source code repositories on Codeberg.

Since there doesn’t seem to be a way to disable *Pull Requests* on GitHub for my respective projects, I’ve added pull request templates that warn against opening PRs there. I’ve also disabled the *Issues* tab and updated the short descriptions to link to Codeberg. Additionally, my [overview page on GitHub](https://github.com/mrusme) now links to Codeberg, with the GitHub repositories listed explicitly as *GitHub mirrors*.

#### Chromium / libc++ ####

At the end of October I encountered an issue with [ungoogled-chromium](https://github.com/ungoogled-software/ungoogled-chromium) on my [Gentoo laptop](/computer/#f0g6) that prevented it from compiling successfully. [Upon further investigation](https://github.com/PF4Public/gentoo-overlay/issues/456) I learned that, quote:

>
>
> Using the system libc++ is no longer supported
>
>

This change was driven by the Chromium project and affected my, along with many others’, Gentoo installation, due to the use of system libraries instead of the in-tree ones provided by Chromium.

As [mentioned here](https://github.com/PF4Public/gentoo-overlay/issues/456#issuecomment-3484840399), this is a security concern, as users will need to trust the Chromium-provided libraries over those from their distribution. In case you’ve ever wondered why anyone in 2025 would still *compile from source* when *tHe PeRfOrMaNcE bEnEfItS aRe NeGlIgIbLe*, this is one of the key reasons why compiling from source still makes sense and, in fact, is more important than ever. The same projects that have historically taken a controversial stance on sensible default settings are now the ones seemingly rejecting security-critical system components in favor of their own.

**Tl;dr:** If you’re using Chromium or a Chromium-based browser (other than [ungoogled-chromium](https://github.com/ungoogled-software/ungoogled-chromium) on Gentoo through *PF4Public*’s repository), it’s highly likely that your browser is not using your system maintainer’s libraries, but rather Chromium’s in-tree ones with whatever versions and features the Chromium developers deem necessary and sensible.

#### Break a leg ####

[![](/updates-2025-q4/images/switch_hu_49dd6ab380f540ea.webp)](/updates-2025-q4/images/switch.jpg)

In what to this day remains a mystery the keyboard switch of my `Ctrl` key has decided that it rejects its existence and seemingly removed one of its legs, presumably in an effort to escape and start a new live. I had [documented](https://www.keebtalk.com/t/whats-on-your-workbench-today/12656/2608) the [whole](https://www.keebtalk.com/t/whats-on-your-workbench-today/12656/2611) [incident](https://www.keebtalk.com/t/whats-on-your-workbench-today/12656/2615) on Keebtalk for anyone who’s equally as puzzled by this as I am.

Open source projects
----------

I invested quite some time in pursuing [my open source projects](https://github.com/mrusme) in the past quarter, hence there are a few updates to share.

### Zeit ###

At the beginning of November I released [*Zeit* v1.0.0](https://codeberg.org/mrus/zeit), a full rewrite of my command line time tracking tool. In case you missed it, I summed up everything in a [dedicated post](/zeit-v1/) and have also published a [dedicated project website](https://zeit.observer) that will soon act as more than just a landingpage.

### Overpush ###

With [📨🚕 (MSG.TAXI)](https://msg.taxi) continuing to grow and evolve, [*Overpush*](https://codeberg.org/mrus/overpush) has received a few important updates improving its stability with long-running XMPP connections. One thing that made me very happy throughout the debugging phase was the fact that despite stability of *Overpush* not being *perfect*, no messages ever got lost whatsoever and were always successfully delivered the moment the service would be able to reach the target platforms (specifically XMPP in this case). :-)

If you haven’t yet tried *Overpush* yourself, I encourage you to sign up on [📨🚕](https://msg.taxi) and give it a go. If you find the service useful you’ll be able to easily spin up your own *Overpush* instance further down the line and won’t have to depend on any closed-source proprietary platfrom.

### ▓▓▓▓▓▓▓▓▓▓▓ ###

As those of you idling in the [community channel](/contact/#xmpp) might know, I’ve been actively working on an internet forum software [for some time now](https://bsky.app/profile/xn--gckvb8fzb.com/post/3m5wkotemhk2v). What kick-started my efforts was the desire to set up a support and discussion forum for [📨🚕](https://msg.taxi), among other things, but I was dissatisfied with the existing options.

I was looking for an internet forum that…

* Can use an existing database to authenticate users and/or…
* Supports simple email/username signups.
* Ideally supports notifications **and** replies via email.
* Is lightweight and doesn’t require a ton of runtime dependencies.
* Does not require users to have [JavaScript enabled](https://disable-javascript.org).
* Does not overwhelm me with administrative features.
* Is somewhat easily themeable.

The first thing that came to mind was *phpBB*, which has been around for decades and appears to be one of the few options that (unlike *Discourse* and *Lemmy*) doesn’t require users to have JavaScript enabled. Sadly, *phpBB* is a *monster*. It has **too many** features, takes a lot of time to properly install and configure, and, more importantly, when looking at its runtime dependencies and extensions, it requires *some* recurring effort to keep it safe and sound.

Don’t get me wrong, unlike *Discourse*, which is frankly terrible, *phpBB* is a solid piece of software. However, for my use cases, I wanted something more lightweight that is easy to set up and run. None of the existing solutions, with maybe one or two exceptions like [DFeed](https://github.com/CyberShadow/DFeed), came close to what I was looking for. And those that seemed like a good fit sadly lacked some functionalities, which would have required me to extend them in ways that would significantly alter core functionality. These changes would have likely not been merged upstream, meaning I’d probably end up maintaining my own fork anyway.

The bulletin board I’m working on is built in Go, as a single executable binary (without *CGO*) for all major platforms (*Linux*, \**BSD*, (maybe) *Plan 9*, *macOS*, and (maybe) *Windows*) that doesn’t require a runtime (like *Erlang*/*Elixir*, *PHP*, *Ruby*, *Python*, or worse, *Node.js*) or even assets (e.g., HTML/CSS files) anywhere in `/var/www`. It renders modern HTML on the server-side and doesn’t require any user-side JavaScript to be enabled.

The forum will support only *PostgreSQL* (single- and multi-node setups), require a Redis/Valkey instance or cluster, and use S3-compatible storage for user content (e.g., profile pictures, file uploads, etc.). The platform will allow sign-ups via email and *XMPP* addresses, supporting notifications and replies through both services. But don’t worry: OAuth authentication via popular providers will also be available.

Additionally, the forum will feature a dedicated REST API that, unlike *Lemmy*’s or *Discourse*’s APIs, will be much easier to work with. One mid-term goal is to integrate this API into [Neon Modem Overdrive](https://neonmodem.com), which will become its official TUI client.

Short story long: I’ve been working on this project for a little while now and expect to release a first live demo around February ‘26. While many basic features are already implemented, there are still details I’d like to perfect before publishing the first version. I’ll set up a live online demo for people to try out first, and only after fine-tuning the code based on feedback will I wrap up the actual source release.

The forum will be open-source and available under the [SEGV](/segv/) license. If this sounds interesting to you and you’d like to participate in development or testing, [reach out to me](/contact/)!

EOF
----------

With that said, I sincerely hope you’re enjoying a wonderful holiday season and gearing up for a great new year! As we wrap up 2025, I’ll be taking a well-deserved break from posting here on the site. The start of 2026 is shaping up to be quite hectic, and I’m looking forward to diving into some exciting projects, especially focusing on the ▓▓▓▓▓▓▓▓▓▓▓ bulletin board system I’m building.

I hope this season brings you moments of joy, relaxation, and time well spent with those who matter most. May the new year be filled with new opportunities, exciting adventures, and personal growth. I look forward to reconnecting with all of you *next year*!

Stay safe, take care of yourselves, and I’ll see you in 2026!