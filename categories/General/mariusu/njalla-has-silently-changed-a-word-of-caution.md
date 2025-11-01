---
title = "Njalla Has Silently Changed: A Word of Caution"
description = '''sh $ nslookup -type=ns xn--gckvb8fzb.com | rg '.\n.\r = (.\*)\\.' -r '$1' | sort 1-you.njalla.no 2-can.njalla.in 3-get.njalla.fo  \\ ... or can you?'''
date = "2025-09-14T19:28:56Z"
url = "https://xn--gckvb8fzb.com/njalla-has-silently-changed-a-word-of-caution/"
author = "marius@xn--gckvb8fzb.com (Marius)"
text = ""
lastupdated = "2025-10-24T09:36:19.651216870Z"
seen = true
---

I’ve been using *Njalla* as my primary domain service for the past few years, and I’ve had nothing but good things to say about them. Their website is simple yet functional, their support is quick and efficient, and the company offers its services in a way that should be the global standard when it comes to data and privacy protection.

*Njalla* made sense for me on many different levels:

They’re a domain provider headquartered on a former pirate island nation in the Caribbean, which is home to countless offshore trust funds, that registers **your** domain in **their** name, so none of **your personal information** appears in the mandatory ICANN registration data. All of this is offered without any KYC requirements, and with the option to pay using Monero.

And if that’s not enough, *Njalla* sends every email encrypted with your GPG public key and can even forego email entirely in favor of XMPP notifications with OMEMO encryption. Yes, *Njalla* also provides an API (with access tokens that can be configured with granular permissions) which works seamlessly with tools like *Certbot*, *Lego*, and others to request *Let’s Encrypt* certificates via DNS validation. Heck, there are even [Terraform providers](https://registry.terraform.io/search/providers?q=njalla) that support it.

And if that still weren’t enough reasons to like *Njalla*, the [*Njalla blog*](https://njal.la/blog/) offered unrivaled transparency and entertainment for everyone, giving people the chance to **see with their own eyes** how *Njalla* was fighting for *the little guys*.

On top of that, I’ve always sympathized with [*brokep*](https://en.wikipedia.org/wiki/Peter_Sunde), *Njalla*’s founder, and his work and many of his views. If you’re unfamiliar with him or his history, I recommend the (relatively new) series [*The Pirate Bay*](https://www.imdb.com/title/tt27441473/), which premiered on *Sveriges Television* at the end of 2024.

Over the past few years, I’ve been quite vocal in my praise for *Njalla*. In fact, if you’re a regular reader of this site or have come across me on other platforms, you’ve probably seen me [plug *Njalla* the same way Jensen Huang plugs AI](https://www.youtube.com/watch?v=5q5JfLTcLdQ).

However, a recent interaction in the [VT100 community channel](/contact/) prompted me to do what I periodically do with every service I use: Check what’s new. This time, it was *Njalla*’s turn.

Goodbye Nevis, Hola Costa Rica?
----------

While browsing through various pages on their website, I came across the [*About*](https://njal.la/about/) page and was surprised to find the following statement:

>
>
> Njalla is run by njalla.srl based in Costa Rica.
>
>

Curious, I checked their [terms of service](https://njal.la/tos/) and confirmed that *Njalla* does indeed appear to have relocated its operations from Nevis to Costa Rica. I searched through my email history to see if there had been any announcement about this change, but found nothing. Wanting to know **when** this happened, I checked *Njalla*’s [Mastodon](https://njalla.social/@njalla) and [Bluesky](https://bsky.app/profile/njal.la) profiles, but again found no mention of the move.

I even went as far as looking at [*brokep*](https://mastodon.social/@peter@m.brokep.com)’s [social](https://bsky.app/profile/brokep.com) [profiles](https://x.com/brokep), only to find that they were either deleted or inactive.

At that point, I started to get a bad feeling. Had *Njalla* been sold to someone else? Before jumping to conclusions, I decided to contact *Njalla* support to clarify the situation.

>
>
> Subject: 1337 Services LLC -\> Njalla SRL?
>
>
>
> Hello,
>
>
>
> I just stumbled upon the fact that Njalla seemingly changed hands without any notice, and I would like to understand what happened to 1337 Services LLC on Nevis and who the new owner Njalla SRL is.
>
>
>
> I would appreciate further insights into this topic.
>
>
>
> Kind regards!
>
>

The support replied promptly:

>
>
> Internal restructuring. Nothing to worry about.
>
>

However, while it was *a response*, it wasn’t particularly satisfying, so I decided to be the *PITA* that I am somewhat known to be and ask again:

>
>
> Thank you for your reply and your re-assurance.
>
>
>
> I’d like to apoligize in advance for being a PITA, but with *brokep* seemingly having disabled his social media profiles (Bsky, Mastodon, X), discovering this change felt “off”.
>
>
>
> Also, as someone who has a relatively decent understanding of offshore jurisdictions and their governing laws, I am wondering about the motivation for this move.
>
>
>
> Costa Rica’s offshore landscape appears to have changed over the past years and their SRL/SA seemingly requires company books to reflect share ownership, which in turn list the owner’s name and ID numbers within the Central Bank of Costa Rica via the Registry of Transparency and Final Beneficiaries (RTBF). While UBO info is not publicly available unless explicitly listed as initial shareholders in the national registry, the information is still accessible and shareable by government entities and could make it easier for foreign entities to pressure the owners (and hence Njalla) into doing things it would otherwise not do.
>
>
>
> In addition, foreign court orders appear to be somewhat easier enforceable in Costa Rica’s jurisdiction, as opposed to Nevis, where foreign entities would *in theory* require dealing with local courts to obtain a local court order.
>
>
>
> While the trend towards transparency, information sharing and absurd KYC hasn’t passed Nevis/St. Kitts either (especially in terms of banking infrastructure) it appears that jurisdictions like Nevis or the Seychelles still seem to be “better” choices for operating a service like Njalla.
>
>
>
> I have been *very* vocal to recommend Njalla on different platforms, and I would like to update my recommendation based on this new reality. I would hence be curious to understand the rational behind the change, if you wouldn’t mind sharing a few insights.
>
>
>
> If preferrable you’re welcome to reach out via email to xxx (pubkey attached) or via XMPP/OMEMO to xxx.
>
>
>
> Thank you kindly and best regards!
>
>

While I wasn’t expecting *Njalla* to offer in-depth strategic reasoning for this move, I nevertheless hoped for them to provide solid arguments as for why they believe Costa Rica is a good option for their operations and maybe even an explanation on why they haven’t notified their customers of the change. However, the reply that I got back was disappointing, to put it mildly:

>
>
> Hi,
>
>
>
> We do understand your concerns, but the reasoning or insights is not something we share.  
>  If you feel you can’t recommend our services any more, then of course you shouldn’t. That is totally up to you.
>
>
>
> Kind regards, Njalla
>
>

It’s clear that *Njalla* is operating on a *take it or leave it* basis here. While they are entirely within their rights to do so, one could argue that using *Njalla* inherently requires a significant degree of trust. After all, they are the ones who **legally own your domain**. Given that, I think it’s fair to say that customers deserve at least *some* level of transparency in return. At least enough to feel confident that *Njalla* isn’t working against their interests.

**Note:** There are many reasons why moving the company might make sense. While we can draw up as many conspiracy theories as we’d like, the most banal explanation might have to do with *brokep* being a Swedish citizen and supposedly still residing in the EU.

Doing business within a place like Nevis, which the EU considers a tax haven and which is being grey-listed as non-cooperative tax jurisdiction every once in a while, can be *a bit of a PITA*. Not only is it unlikely for *brokep* to benefit from low-/no-tax advantages that the jurisdiction offers, it is on the contrary quite possible that EU CFC rules are intentionally hurting him, especially with a digital (low substance) business like *Njalla*, *especially* when dealing with cryptocurrency, **especially** with Monero, to discourage the *average ~~Joe~~ Peter* from doing business in jurisdictions that have historically been reserved for the bloc’s politicians and other elites. After all, the democractization of tax havens is certainly not something world leaders are in favor of.

Costa Rica has managed to escape the bloc’s Annex I (in 2023) and Annex II (in 2024, approved 2025) and is not considered a low-tax country or tax haven. With CR joining the OECD’s CRS, it has certainly become easier for EU residents to do business in the Latin American country, despite its territorial tax regime. As boring as this sounds, but it might just be that *brokep* got sick of dealing with the EU charade around offshore tax havens – *btw, hey, EU, how are things in Luxembourg, Cyprus and Monaco going?* – and chose a more viable solution.

I dug up [*Njalla*’s Terms of Service on the Internet Archive](https://web.archive.org/web/20240501000000*/https://njal.la/tos/) and found that the change seems to have occurred sometime between October 2, 2024, and December 16, 2024. Whether or not it’s legally permissible for a company to change something as fundamental as its jurisdiction or corporate registration without informing existing customers, I found the lack of communication troubling.

What concerned me even more was that, after I pointed out the change, *Njalla* didn’t seem interested in offering any further explanation. On the contrary, their responses came across as an attempt to quietly brush the matter aside and move on.

Long story short
----------

While the service continues to function as it always has, and I haven’t encountered any issues, I’m honestly uncertain about how to interpret the situation. As I’ve mentioned before, I deeply admire the work that *brokep* is doing, and I’m a strong supporter of *Njalla*’s mission. I’ve been recommending their service for years, and I likely will continue to do so, although with reservations.

That said, this situation has somewhat tarnished my perception of *Njalla*. Not only has their [blog](https://njal.la/blog/) become less insightful over the years, but it also appears that they are actively concealing information from those who trust them: Their customers.

Moving forward
----------

With *Njalla*’s lack of transparency and unsatisfactory responses, I’m uncertain about what to make of the situation. I’d assume that if you have a *normal* domain with *Njalla*, there’s probably little to worry about, provided the company hasn’t been sold to a new owner. The service seems to be operating as usual, and I haven’t heard of any malicious intent regarding domain ownership.

That said, if you’re considering registering a domain to poke fun at a logistics provider or other international entities that might take issue with it, I wouldn’t be so confident that *Njalla* will still have *Batman* handling the situation. As long as you don’t provide your [PII](https://en.wikipedia.org/wiki/Personal_data) and use untraceable payment methods, however, the worst-case scenario is that *Njalla* shuts down your domain and won’t return it to you.

I continue to hold several domains with *Njalla*. While I could migrate to another provider, I’m willing to wait, observe, and give *Njalla* the benefit of the doubt for now. That said, I will certainly be more cautious moving forward and think twice before registering any new domains with them.

Alternatives
----------

Frankly, there aren’t many trustworthy and reliable alternatives, especially ones backed by prominent figures with (for the most part) agreeable values.

If you’re seeking services based in offshore jurisdictions, there’s a non-exhaustive list in the [domains](/infrastructure/#domains) section of the [infrastructure](/infrastructure/) page. It’s important to note that when you allow someone else to register a domain on your behalf, you’re effectively entrusting them with **ownership of the domain**, meaning they could ultimately do whatever they wish with it. Therefore, trustworthiness is a critical factor when evaluating these services.

**Footnote:** The artwork was generated using AI and further botched by me using the [*greatest image manipulation program*](https://www.gimp.org).