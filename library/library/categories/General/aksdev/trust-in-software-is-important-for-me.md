+++
title = "Trust in software is important for me"
description = "Preface: What is trust to me?To make it clear what trust means to me: Can I trust my privacy, no matter how miniscule part of information you want, in your hands?   (my PTSD plays heavily in this lol) Can I trust your software or whatever be around long enough for me?   Basic"
date = "2023-07-09T00:00:00Z"
url = "https://akselmo.dev/posts/trust-in-software-is-important/"
author = "Akseli"
text = ""
lastupdated = "2026-05-27T23:22:57.077927580Z"
seen = true
+++

Preface: What is trust to me?

To make it clear what trust means to me:

* Can I trust my privacy, no matter how miniscule part of information you want, in your hands?
  * (my PTSD plays heavily in this lol)

* Can I trust your software or whatever be around long enough for me?
  * Basically, is it worth my time to learn this?

* Can I trust you to listen to me when I have something to say?
  * I don't know many things I could trust in this matter. Moneymen tend to ignore often.

* Can I trust you to **not** lure me in with nice promises and then pull the rug under me?
  * Honestly, this happens way more than I'd like.

Now since that's clear..

[Trust musings](#trust-musings)
==========

There has been, once again, turmoil and drama in FOSS spheres.

First, [Red Hat did a trick](https://www.redhat.com/en/blog/furthering-evolution-centos-stream) with their open source code, so that if anyone who uses their GPL rights to share the Red Hat code, loses their subscription. (Well, that's how I understood it. Please give it a read yourself to make sure.)

It's a complicated matter, where complicated opinions bubble on top, at least for me. I do not comment on it since I just do not know enough. I've never used RHEL for anything, anyway.

But it has certainly affected the user trust.

Now, [Fedora got recently a proposal to add opt-out telemetry](https://discussion.fedoraproject.org/t/f40-change-request-privacy-preserving-telemetry-for-fedora-workstation-system-wide/85320).

Considering Fedora and Red Hat are tied to each other on some level, it again has affected the user trust. Mainly negatively.

Gaining trust is hard, losing it is easy. And it does seem this has been quite a blow to Red Hat and Fedora, but maybe it shows positively in other ways. Who knows.

I shared my opinions on their forum, but yes, I'm cynical enough to think my voice doesn't really matter. I could've been less "sharp-tongued" about it in those posts, but *dude im just so tired.*

My personal feelings on the matter is that I hope all goes well, but I will try other distro offerings in the meanwhile and see how it goes. I am tired of worrying over such things anyway, so it's easier for me to move.

*Now, I use Arch. And no, I'm not gonna.. Ok, fine: Btw.*

[Telemetry musings](#telemetry-musings)
==========

I do have some commentary on telemetry however, and how I feel like it should be implemented. It is fine to disagree with me, for if I disagree the way you implement telemetry, I just do not use the software, unless there is no other alternative nor choice.

First off, the telemetry data in that proposal is fine by me. System info, whatever. Steam asks me for system information as well. And I always say "yes, show the world im a linux gamerrr"

What the proposal wants to do, is to use the opt-out method of acquiring telemetry.

To briefly first mention what this means:

* Opt-in: Setting is toggled off by default, user has to explicitly say yes.
* Opt-out: Setting is toggled on by default, user has to explicitly say no.

I understand the rationale behind opt-out: Most people won't enable it, due to people being used to the "just click next next next" pattern that Windows has hoisted on many us. And I think that's a dark pattern, since it's easy to trick user to agree on something they do not want. Remember the malware bundled with installing Windows apps, if you didn't remember to remove the default checkbox.

This is essentially that, but for sending your data away. Yes, it's your data, despite it being "meaningless" to you maybe, it is *still your data.*

Utilizing this "dark pattern" feels wrong to me. Maybe it's my morals, or maybe I'm a silly person. I think users should know exactly what they're getting into.

**So, please, ask for consent.** Do not go "You consent to this, right?" and when the user goes "Huh what? Yeayeayea." you have already moved on, decided this.

What I want to see is following pattern:

* Software: "Alright user, we have some data we'd like to collect, here is what data: blableblelba."
* User: "next next next-"
* Software: "You must *explicitly* choose, yes or no? Please read."
* User: "Oh, data! Hmm, ok, seems good to me!"

Of course, this can annoy the user. They just want to click next next next.

But that tiny bit of annoyance is good price to pay instead of possible regret in future.

And I think it's a good goal to teach the common users to read the popups again. This causes many issues in the current software world, such as people falling for scams since they do not properly read things, accepting all kinds of bad deals..

**"Just click next next next" is an anti-pattern that must be stopped.**

And FOSS has the chance to help stop that pattern, since I think not many of us are in this for the quick buck, but instead for creating fun, free software for all. Just **stop the user and ask the question**. Then you never need to ask it again.

Of course, alternatively you can do what KDE is doing. They show you a telemetry slider in the welcome app, and you can set it to how much data you want to send.

Since they *ask me first* I always max it out. :)

[Bottom line in opt-in opt-out](#bottom-line-in-opt-in-opt-out)
==========

This is how I personally have *always dealt with* opt-in/opt-out checks. No matter what OS I have used, but especially on Windows, you could not trust anything so you had to read and stop. Way before of my Linux days, as well.

* Opt-in: I read what it does, then opt-in. Thanks for asking nicely, I reward you with my data.
* Opt-out: Even if I don't mind the data being sent, I feel it's bit rude to assume what I want, thus I opt-out immediately.
* Exclusively ask me: I stop, I read, and usually opt-in to sending the data.

Again, I've **always** done this, even before my Linux days.

I guess it's because my parents told me to always ask first. :)

Thanks for reading this yet-another-ramble from me. I know my writing style is all over the place but I hope it helps understand why these trust matters are important to me.

If nothing else, just remember this: *Gaining trust is hard, losing trust is super easy.*