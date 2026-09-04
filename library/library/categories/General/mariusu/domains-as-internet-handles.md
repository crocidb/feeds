+++
title = 'Domains as "Internet Handles"'
description = '''A few thoughts on the idea that domains should be everyone's \_"internet handles"\_.'''
date = "2025-12-10T10:51:27Z"
url = "https://xn--gckvb8fzb.com/domains-as-internet-handles/"
author = "marius@xn--gckvb8fzb.com (Marius)"
text = ""
lastupdated = "2025-12-10T15:23:56.753147867Z"
seen = true
+++

A little while ago I cam across [a post by *Dan Abramov*](https://bsky.app/profile/danabra.mov/post/3m6mxyn7grc2f), a name that until then didn’t ring a bell, but who appears to be a former *Meta* employee and member of the *React* core team. The post links to [a website](https://internethandle.org) made by *Abramov*, that addresses the issues of how, quote, *every time you sign up for a new social app, you have to rush to claim your username*, how, quote, *if someone else got there first, too bad* and how, quote, *that username only works on that one app anyway*.

The website goes on:

>
>
> This is silly. The internet has already solved this problem.
>
>
>
> **There already exists a kind of handle that works anywhere on the internet—it’s called a *domain***. A domain is a name you can own on the internet, like `wikipedia.org` or `google.com`.
>
>
>
> Most creators on the internet today don’t own a domain. Why not? Until recently, you could only use a domain for a website or custom email. But personal websites have mostly fallen out of fashion, and each social app sports its own kind of handles.
>
>
>
> However, open social apps are starting to change that. These apps let you use any internet domain you own as a handle
>
>

*Abramov* highlights a familiar pain point:

On every new platform, users must scramble to secure their preferred username, often discovering it was taken years ago. Domains, he suggests, solve this by offering a globally unique namespace. However, this solution introduces an even greater scarcity problem, amongst other more important issues.

*Handle* availability
----------

Short, meaningful domain names have been scarce for decades. Most desirable combinations of common words, short names, or initials were claimed long before modern social platforms even existed.

For example, just like our author, `danabra.mov` I, too, would have loved to use `ma.ru` or `mari.us` as my *handle* on e.g. *Bluesky*. Sadly, however, I’m more than two decades late for that, as the former seemingly *belongs* to a Russian company, and the latter to a namesake somewhere in Bavaria, Germany. Domain marketplaces and registries still [list alternatives](https://www.namecheap.com/domains/registration/results/?domain=marius), but these often come with premium or recurring fees far exceeding what the average user is willing to pay.

When platforms require domains as identity tokens, a user whose preferred domain is unavailable loses access to that identity **everywhere**, not just on a single platform. Unlike usernames, which can often be adapted with simple variations (e.g. adding punctuation), domains offer no such flexibility. TLD constraints mean that once a desirable domain is taken, there may be no practical semantic alternative.

Domain scarcity does not solve the *“handle availability”* problem, it instead exacerbates it by moving contention from individual platforms to the internet’s global naming infrastructure.

Ownership, control & sovereignty
----------

Usernames exist within individual platforms and their loss, while inconvenient, usually has contained consequences. Losing a username typically means losing access to a single isolated data silo (platform).

Domains, by contrast, are subject to a multilayered hierarchy of control involving domain registrars, TLD operators, ICANN-affiliated registries and the DNS root zone.

By using a domain as a cross-platform *handle*, users tie their entire online identity to this centralized, multi-stakeholder governance structure. Misconduct, even just alleged, on one platform could result in escalations to a registrar or registry, potentially leading to domain suspension. A suspended domain invalidates not just a *handle* on one platform, but an entire online identity across all services using that identifier.

The risks extend beyond platform moderation. A compromised mailbox, a malware incident on a web server, or an automated threat-intelligence flag from entities such as the [internet’s favorite bully Spamhaus](/be-your-own-privacy-respecting-google-bing-brave/#domain) can lead to domain suspension. In such scenarios, users may face lengthy appeals processes involving opaque third-party entities that wield far more power than a typical platform operator.

Domains were designed for hosting services, not for acting as the cornerstone of individual identity. Using them as universal *handles* places disproportionate power in the hands of infrastructure operators who were never intended to serve as arbiters of personal identity.

Privacy
----------

If you’re a long-time reader of this website you probably already knew that *privacy* must come up at some point. Well, here it is:

Traditional username-based systems allow users to separate their personal identity from their public persona. After all, not everyone might want others to know about their activity in the *Taylor Swift* forum of *FanForum.com*, and that’s fine.

Domains, however, increasingly erode this layer of privacy. While [privacy-respecting domain registrars](/infrastructure/#domains) still exist, the mainstream domain ecosystem overwhelmingly encourages or requires KYC, traceable payment methods and paid WHOIS privacy services to maintain the illusion of privacy.

Most users will register domains using a credit card or similar traceable payment method through large commercial registrars. Even if WHOIS privacy is enabled, metadata leakage and billing records remain. In the context of social identities, this creates an environment where domain-based *handles* can be correlated with real-world identities far more easily than pseudonymous usernames.

A user posting under a domain such as *time-to-get-swifty.com* could find their identity exposed not through any platform breach, but simply through the structural nature of domain registration.

Cost
----------

Usernames are free. Domains are not. Even the cheapest domains incur recurring costs. More desirable, short, memorable, or branded names often command high premiums or elevated renewal fees. While this financial burden may appear negligible to, let’s say, former well-paid *Meta* employees who consider their online presence a professional asset, the majority of internet users do not attach the same value to domain ownership.

For many, especially outside tech-centric circles, the ROI of maintaining a personal domain is negligible or non-existent. A farmer participating in an agricultural forum is unlikely to find value in purchasing and renewing a domain like `freshveggi.es` solely to participate in an online community. Any identity system that introduces ongoing financial requirements creates unfair barriers to participation and risks entrenching socioeconomic inequality in digital spaces.

Summary
----------

*Abramov*’s argument positions domains as a universal, user-controlled solution to fragmented identity systems. While his vision aligns with broader goals of data portability and user autonomy, domains introduce significant drawbacks that usernames do not suffer from: Greater scarcity and reduced availability, centralized infrastructure vulnerabilities and governance risks, reduced privacy and increased traceability, and recurring financial burdens for users.

With statements like *“You don’t have to squat *handles* anymore. Own a domain, and you can log into any open social app”* the author makes it sound like domain names are less exclusive than simple usernames, when it’s clearly the other way around, and they fail to recognize that [*squatting*](https://en.wikipedia.org/wiki/Cybersquatting) is far worse of an issue for domains than it is for simple usernames.

Moreover, the reliance of `did:web` on conventional DNS infrastructure undermines the self-sovereignty that [decentralized identifier systems](https://en.wikipedia.org/wiki/Decentralized_identifier) aspire to. Without a complementary decentralized naming layer (e.g. [Handshake](https://handshake.org)) domain-based identities merely exchange one set of constraints and issues for another (vastly more dangerous and impactful) one.

For these reasons, users and platform developers should think carefully before adopting domains as universal *“internet handles”*. Usernames, for all their imperfections, remain simpler, safer, more private, and more equitable for everyday identity on the web, at least until the truly decentralized future is here. While one might say that the *handle* is merely a representation of the underlying *decentralized ID*, a loss of the domain will nevertheless come with functional implications across every service that uses it. Luckily, platforms that implement *domain handles* continue to offer accounts under their own domains for the time being, so that at least for uninformed users nothing really changes (on the surface).

**Note:** I have an account on a platform that supports *domain handles* and I am using the feature in order to be able to make informed statements. The account is, however, nothing that is crucial to my existence on the internet. If my domain should *spontaneously combust* that account would be the least of my worries. Instead, I’d be more troubled about this site and its related services, which is why I have a [fallback domain](/faq/#domain).

Post Scriptum
----------

While I’m sure the author of *internethandle.org* didn’t intend to, some statements on the website *“sound”* somewhat out of touch, or at the very least *tone-deaf*, e.g.:

>
>
> Most creators on the internet today don’t own a domain. Why not? Until recently, you could only use a domain for a website or custom email. But personal websites have mostly fallen out of fashion […]
>
>

*Dan*, personal websites haven’t *fallen out of fashion*, but have suffered under the *World Wide Web* altered (dare I say *destroyed*?) by the very companies [you supported building](/on-resistance-from-the-tech-sector/) as part of your previous roles and, to some extent, [as part of](<https://ziglang.org/news/migrating-from-github-to-codeberg/#:~:text=Priorities and the engineering culture have rotted, leaving users inflicted with some kind of bloated, buggy JavaScript framework in the name of progress. Stuff that used to be snappy is now sluggish and often entirely broken.>) the [technologies](/disable-javascript-org/) you’re working with. Just because you, and the people you surround yourself with, seemingly don’t care about [*the small web*](/the-small-web-101/) it doesn’t mean it has *fallen out of fashion*; If anything, personal websites are [gaining popularity](https://news.ycombinator.com/item?id=46009894) and are the weapon of choice against the [*enshittification* of the web](https://react2shell.com) by companies like *Meta* and others.