+++
title = "Wintering: On Hiatus, Bill C-22, and Why I Don't Block People"
description = "Why I'm putting folk.zone's social services on hiatus? 500 spam users, my embarrassing WriteFreely database blunder, and the legal weight of self-hosting in a Canada without Section 230. On Bill C-22 and Psiphon's planned exodus, slowing down to a wintering and a beginner's mind,"
date = "2026-10-08T02:00:00Z"
url = "https://brennan.day/wintering-on-hiatus-bill-c-22-and-why-i-dont-block-people/"
author = "mail@brennanbrown.ca (Brennan Kenneth Brown)"
text = ""
lastupdated = "2026-10-08T09:34:20.288667182Z"
seen = false
+++

Earlier today, [I announced](https://folk.zone/blog/putting-services-on-hiatus/) that I'm putting a fair number of [folk.zone](https://folk.zone) services on hiatus. There were a few reasons for this. Primarily, it is due to a lack of capability to responsibly moderate and manage so many different services.

Around two months ago I checked and found that [the WriteFreely instance](https://write.folk.zone) I set up had [over 500 spam users and posts](https://folk.zone/blog/security-audit-august-2026/). Even worse than that, though, is that when I tried to deal with it, I embarrassingly ran a database query that removed not only the spam accounts, but the legitimate ones too. There were only a small handful, and they had their writing saved elsewhere, but it is still incompetent of me to run a destructive command like that as a sysadmin. Thankfully, I've been a lot more careful and enacted much better practices with [fanfiction.lol](https://fanfiction.lol), where there are over 300 users, and I can at least take solace in that.

[The idea for folk.zone](https://brennan.day/announcing-folk-zone-an-attempt-to-build-the-indieweb-commons-myself/) is rather simple, in theory. It isn't hard to follow a couple tutorials and, if you're lucky with your ISP, port forward a couple of Docker containers from a spare computer and *bam!* You're suddenly providing important services to people independently. And I'm still doing that! There are many parts of folk.zone remaining online, including IRC, WriteFreely, the wiki, RSS, Etherpad, PrivateBin, Linkding, Kutt, and Opengist.

But the services that are more social, such as Mastodon or Lemmy or Pixelfed, require far more supervision and care. Not only to guard against bad actors and spammers, but to foster a good community ethos in general. That sort of thing isn't inherent, you have to proactively cultivate it in order for it to be maintained. Beyond that, since I'm not using a VPS and instead running the servers directly, I have a legal responsibility for whatever is posted. There isn't any [Section 230](https://www.internetsociety.org/blog/2026/02/30-years-of-section-230-why-we-still-need-it-for-a-safer-internet/) in Canada.

Bill C-22 [](#bill-c-22)
----------

In fact, there's a rather worrying bill in Canada, Bill C-22, that may be passed. Toronto-based VPN provider Psiphon [is planning to leave the country](https://www.theglobeandmail.com/politics/article-psiphon-vpn-provider-plans-to-quit-canada-over-lawful-access-bill/) if it does.

>
>
> "The lawful-access bill, known as Bill C-22, would require telecoms, internet companies and other electronic service providers to make changes to their systems to give surveillance and monitoring capabilities to police services and the Canadian Security Intelligence Service."
>
>

The services that companies like Psiphon offer are fundamentally important, "in February, during a crackdown by Tehran against protestors, it had 21 million users in Iran" and they have "3.5 million users a month in Myanmar, formally [sic] Burma, where the military junta has used internet blackouts to cut off communication channels."

When we talk about free speech, these are the people we need to keep in mind. Those who are marginalized and oppressed by violent authoritarian regimes and need our help and support to get the truth out. *Not* libertarian techbros who already have a comfortable, privileged platform indefinitely.

As [The Citizen Lab](https://citizenlab.ca/research/analysis-of-proposed-surveillance-law-expansion-under-bill-c-22/) wrote on Bill C-22:

>
>
> The bill’s sweeping scope, significant constitutional and human rights risks, transparency and accountability deficits, and dangers to encryption and Canada’s cybersecurity. We recommend entirely withdrawing several elements of the bill and suggest amendments to mitigate harms.
>
>

Talk Less, Smile More [](#talk-less-smile-more)
----------

Beyond sysadmin work, I have also been thinking about my writing and publishing in general. I ran an [impromptu poll](https://social.lol/@brennan/117367903673226292) on Mastodon and found that, while I have many wonderful readers, they only read a fraction of what I put out.

This makes sense, and after nearly a year of posting on a daily basis I am also going to be pulling back here. Somebody could look at my blog and think this rate is never-ending, but it certainly is finite. I will most likely transition to posting once or twice a week. One man can only have so many opinions, after all.

I would give the advice to read through my archive, but to be honest I'm a little embarrassed by it—and I think that's a good thing! I think I've grown as both a writer and editor, and as such my writing from 2025 does not feel up to par now. That said, I'm not going to be removing anything. I've always thought that it's important to allow your past self to exist freely and not try to sweep it under the rug.

Regardless, though, perhaps I'm in for [a wintering](https://nesslabs.com/wintering).

It's funny, all the complexity of my life is completely arbitrary and caused solely by me. It is easy for me to get caught up in ambitious, idealistic plans that scope-creep and become unrealistic for a single person. But it is also easy for me to wind down and simplify, because I have full autonomy over what I do.

2027 is only a few months away, and I want to have a blank slate once again. I want to practice [a beginner's mind](https://psyche.co/guides/how-to-cultivate-shoshin-or-a-beginners-mind) and assume nothing. Start from the basics and fundamentals once again.

On Axe Sharpening [](#on-axe-sharpening)
----------

There is a saying, attributed to Lincoln ([incorrectly](https://quoteinvestigator.com/2014/03/29/sharp-axe/)), that if you have six hours to cut down a tree, the best practice is to spend the first four sharpening your axe. This stands in contradiction to my idea of [the inertia effect](https://brennan.day/the-inertia-effect-stop-optimizing/), where I argue that pre-optimization and planning typically stop you from actually doing the damn thing.

But you can do both. You can [show your work](https://austinkleon.com/show-your-work/), have the process of the axe-sharpening be public, rather than endlessly waiting in private for the non-existent perfect time to finally begin.

One small way I'm doing this is with [an Indigenous sci-fi story](https://cosmic.voyage/ships/Genawaaboonagak/) I'm writing on [Cosmic Voyage](https://cosmic.voyage). Just a little bit contributed to a longform story, day after day.

And I encourage anybody to do the same! Start a new hobby and log your progress in public. It holds you accountable, puts you in the community, and you'll have a tangible archive you can look back on. You can prepare and focus carefully while still doing. I don't believe these are mutually exclusive. And if you do so with your heart and good intentions, you'll already be so far ahead.

>
>
> “Sucking at something is the first step to being sorta good at something.”  
>  ― Jake the Dog
>
>

On Blocking People [](#on-blocking-people)
----------

I'm going to end this post with a bit of a hot take related to being an admin and leading a community: whenever I find myself feeling like I should block someone, *I reach out and try to talk to them instead.* I never block anybody, and I think I'm far better off for it. Let me try to explain.

When I was running [Write Club](https://writeclub.netlify.app/about), during our weekly meetings there were often a couple individuals who you could say were bad at reading the room—or who stuttered, or took too long to speak—or were obliviously self-absorbed.

And I know that a lot of people felt irritated or annoyed, I won't pretend otherwise. And I'm sure many of them would have simply found an excuse to make these people leave or, more likely, passively changed the time and location of meetings and tell everyone except them.

When I graduated and left, I got an email saying this:

>
>
> "I watched the way you made each and every person feel embraced. I listened as others whispered degrading things about those who came and were different. But you listened to those people with truly open ears, and a warmth that let them feel seen."
>
>

Now, I don't think I actually did that good of a job, but I certainly did try. It is easy to get annoyed by others on the Internet. For someone that is repeatedly annoying, what are you to do?

Sometimes compassion works, sometimes tough love works, and sometimes nothing works. Sometimes they're just like that.

And you know what? That's okay. Not everyone can be likeable or socially fluid and to ask them to change is to ask them to mask, or to tone-police them. I've seen moderators of other sites and forums ban people I enjoy for arbitrary reasons, because of the above. I think that's so cruel.

And it's also so unproductive. You can't mute and block your coworkers or your roommates or customers. You will deal with annoying people throughout your entire life, and not learning how to see the human and actually deal with them stunts you, and the annoyance only continues to grow and metastasize.

I appreciate administrators who try to manage, without removing or ostracizing these individuals.

I believe people are inherently good, and if we do not provide a positive social environment and grace towards difficult, annoying people, then they will continue to spiral downward. Increasingly isolated and hurt. Candidly, they'll either end up dead or seriously hurting others. Feeling invisible, or like a freak, is exactly the kind of vulnerable hopelessness that leads people towards lonely isolation and dangerous radicalization.

It is a serious and unfair burden to perform the labour required to stop that from happening, but I think it's the responsibility you take up when you start any community.

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