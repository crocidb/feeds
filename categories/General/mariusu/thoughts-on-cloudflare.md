---
title = "Thoughts on Cloudflare"
description = "Thoughts on its role and impact on the web's landscape."
date = "2025-09-22T08:46:32Z"
url = "https://xn--gckvb8fzb.com/thoughts-on-cloudflare/"
author = "marius@xn--gckvb8fzb.com (Marius)"
text = ""
lastupdated = "2025-10-24T09:36:19.646228414Z"
seen = true
---

As many of you know, I am skeptical of the concept of relying on *someone else’s computer*, especially when a service grows to the point where it becomes an oligopoly, or worse, a monopoly. Cloudflare is, in my view, on track to becoming precisely that. As a result, I would argue they are a net negative for the internet and society at large.

Besides the frustration they cause to VPN and Tor users through incessant captchas, Cloudflare’s infamous *one more step* pages have dulled users' vigilance, making them more vulnerable to [even the most blatant malware attacks](https://www.bleepingcomputer.com/news/security/new-latrodectus-malware-attacks-use-microsoft-cloudflare-themes/#google_vignette).

Moreover, under the guise of *iNnOvAtIvE cLoUd InFrAsTrUcTuRe*, Cloudflare not only enable [phishermen to phish](https://thehackernews.com/2024/05/new-tricks-in-phishing-playbook.html) and [tunnelers to tunnel](https://www.csoonline.com/article/649000/attackers-use-cloudflare-tunnel-to-proxy-into-victim-networks.html):

Ironically, the very security measures they sell can be [bypassed by bad actors using Cloudflare itself](https://www.bleepingcomputer.com/news/security/cloudflare-ddos-protections-ironically-bypassed-using-cloudflare/). It’s a similar irony that their systems, designed to shield clients from threats, sometimes struggle to [defend their own infrastructure](https://www.bleepingcomputer.com/news/technology/cloudflare-website-downed-by-ddos-attack-claimed-by-anonymous-sudan/).

Incidents like these highlight not only weaknesses in Cloudflare’s offerings but a broader issue: Cloudflare has become [a highly attractive target for state-sponsored attacks](https://www.securityweek.com/cloudflare-hacked-by-suspected-state-sponsored-attacker/), suffering from [recurring breaches](https://www.msspalert.com/news/cloudflare-hit-again-by-okta-breach-atlassian-server-compromised). Their sheer scale, considering that they are serving a substantial portion of the internet, means that an outage or compromise could have widespread, costly consequences.

Another major concern is, that in many cases, Cloudflare acts as a man-in-the-middle SSL-terminating proxy between users and websites. They have visibility into everything users do on these sites, from browsing habits to submitting sensitive personal information. This makes Cloudflare a prime target for any actor seeking to harvest massive amounts of data. The [Cloudbleed incident](https://en.wikipedia.org/wiki/Cloudbleed) clearly demonstrated the risks:

>
>
> Tavis Ormandy posted the issue on his team’s issue tracker and said that he informed Cloudflare of the problem on February 17. In his own proof-of-concept attack he got a Cloudflare server to return “private messages from major dating sites, full messages from a well-known chat service, online password manager data, frames from adult video sites, hotel bookings. We’re talking full https requests, client IP addresses, full responses, cookies, passwords, keys, data, everything.”
>
>

I stand with [Hugo](https://www.devever.net/~hl/cloudflare) in considering Cloudflare harmful and recommend that websites avoid relying on it whenever possible. Cloudflare’s origins in [*Project Honeypot*](https://web.archive.org/web/20100517055332if_/http://www.projecthoneypot.org:80/cloudflare_beta.html), and its early ties to the US Department of Homeland Security, are troubling to say the least:

>
>
> Five years later Mr Prince was doing a Master of Business Administration (MBA) at Harvard Business School, and the project was far from his mind, when he got an unexpected phone call from the US Department of Homeland Security asking him about the information he had gathered on attacks.
>
>
>
> Mr Prince recalls: “They said ‘do you have any idea how valuable the data you have is? Is there any way you would sell us that data?’. “I added up the cost of running it, multiplied it by ten, and said ‘how about $20,000 (£15,000)?’.
>
>
>
> “It felt like a lot of money. That cheque showed up so fast.”
>
>
>
> Mr Prince, who has a degree in computer science, adds: “I was telling the story to Michelle Zatlyn, one of my classmates, and she said, ‘if they’ll pay for it, other people will pay for it’.”
>
>

[Source: BBC](<https://www.bbc.com/news/business-37348016#:~:text=got an unexpected phone call from the US Department of Homeland Security>)

Furthermore, Cloudflare has been [criticized as an employer](https://www.glassdoor.com/Overview/Working-at-Cloudflare-EI_IE430862.11,21.htm), reportedly fostering a [hire-and-fire culture](https://www.benzinga.com/markets/equities/24/01/36621316/cloudflare-ceo-says-viral-firing-video-is-painful-we-were-far-from-perfect-we-dont-always-get-it) among its [sales staff](https://fortune.com/2023/07/10/cloudflare-ceo-says-exclusionary-culture-hurts-utahs-tech-status-but-admits-mormon-missionaries-grow-up-to-be-great-salespeople-youre-selling-the-toughest-thing-in-the-world/). Even its CEO has attracted controversy, such as [suing neighbors over their dogs](https://www.theregister.com/2024/04/29/cloudflare_ceo_dog_lawsuit/) following objections to [his plans](https://parkcityut.portal.civicclerk.com/event/342/files/attachment/2421) to build an 11,300-square-foot estate. Plans that required lobbying to [overcome local zoning laws](https://archive.ph/tGptp).

Given all this, it is time to reconsider Cloudflare’s [dominant market position](https://6sense.com/tech/content-delivery-network-cdn), controlling [over 20% of the internet](https://blog.cloudflare.com/cloudflares-annual-founders-letter-2022/). Cloudflare has shown a pattern of [equivocating on politically sensitive issues](https://arstechnica.com/tech-policy/2022/03/cloudflare-wont-cut-off-russia-says-it-needs-more-internet-access-not-less/), perhaps to maintain its status as [the world’s largest botnet operator](https://www.spamhaus.org/resource-hub/botnet-c-c/botnet-threat-update-q1-2020/), and they appear to defend “free speech” [when it is profitable](https://www.jwz.org/blog/2017/12/cloudflare-really-wants-that-sweet-sweet-nazi-cash-to-return/), but not [when it isn’t](https://www.vice.com/en/article/8xk78x/switter-down-cloudflare-banned-sex-workers-sesta-fosta). Cloudflare has also been accused of [providing services to terrorists and drug traffickers](https://cyberscoop.com/cloudflare-ipo-terrorism-narcotics/) while [skirting international sanctions](https://www.wsj.com/articles/cloud-services-company-cloudflare-discloses-potential-sanctions-violations-11568152033). Meanwhile, [open-source developers](https://www.coindesk.com/policy/2024/05/14/tornado-cash-developer-alexey-pertsev-found-guilty-of-money-laundering/) have been harshly punished for less.

Despite the brilliance of many engineers at Cloudflare, they are not infallible. They, too, experience [recurring downtime](https://www.datacenterdynamics.com/en/news/cloudflare-suffers-second-power-outage-at-flexential-data-center-in-oregon-in-six-months/) and [preventable mistakes](https://www.theverge.com/2022/6/21/23176519/cloudflare-outage-june-2022-discord-shopify-fitbit-peleton). Cloudflare, like any other company, [puts its pants on](https://blog.cloudflare.com/deep-dive-into-cloudflares-sept-12-dashboard-and-api-outage/) [one leg at a time](https://www.fastly.com/blog/debunking-cloudflares-recent-performance-tests/). There is no reason it should be treated as the default, or sole, solution for content delivery.

*So what can I do?*
----------

If running your own [Varnish](https://varnish-cache.org) instances isn’t feasible, and you need a global CDN, consider these alternatives to support competition and balance the scales:

* BlazingCDN
* BunnyCDN
* CDN77
* CDNetworks
* CacheFly
* DigitalOcean Spaces
* Fastly CDN
* KeyCDN
* Netlify Edge
* Vultr CDN
* … or just any other cloud provider’s CDN

**Info:** Some hosting services might use Cloudflare without disclosing it openly/obviously, e.g. *Render*. Make sure to check whatever hosting service that you’re using whether it employs Cloudflare’s infrastructure in the background.

If you currently have domains registered with Cloudflare, move them elsewhere immediately. As a general rule, never allow your CDN or hosting provider to also hold your domain registrations. Should the hosting provider cut you off, you’ll want the freedom to quickly redirect your domains to another provider without disruption.

For more info, visit the [cloud](/infrastructure/#cloud) and [domains](/infrastructure/#domains) sections of the [infrastructure](/infrastructure/) page.

If, however, you’re running Cloudflare’s more advanced service offers, like Cloudflare Workers, you will likely have a harder time moving away. While some frameworks support different providers, like Vercel, Fastly, AWS, Azure, or Akamai, it is likely that most *simple* implementations will be heavily reliant on Cloudflare’s architecture. There’s unfortunately no easy path out of this, other than rewriting the specific components and infrastructure deployment configuration to support a different provider.

If you wish to identify or avoid websites that make use of Cloudflare, you can use this browser extension for [Firefox](https://addons.mozilla.org/en-US/firefox/addon/cloudflare-optics/) and [Chrome](https://chromewebstore.google.com/detail/cloudflare-optics/mdjgbjnbdnhneejmmaabmccfehigbjbe) (ironically created by Cloudflare). Beware that these extensions *might* transfer information about your browsing behavior to Cloudflare. Configure them to be active only when manually clicked on specific websites that you want investigate. There are third-party alternatives like [this](https://chromewebstore.google.com/detail/cloudbleed-indicator/kpemamadacmlpafjkboflojhlhcjekli) and [this](https://chromewebstore.google.com/detail/claire/fgbpcgddpmjmamlibbaobboigaijnmkl), as well as older/unmaintained extensions like [this](https://github.com/traktofon/cf-detect) and [this](https://github.com/lilydjwg/cf-pop).

PS: [Decentraleyes](https://decentraleyes.org) is a solid option to enhance browsing privacy; check the [browser](/infrastructure/#browsing) section for other helpful extensions.

All that said, you might think *“Come on, Cloudflare isn’t that bad!”*, and you’d be right: Every now and then, they [do *some* good](https://torrentfreak.com/serie-a-legal-action-claims-cloudflare-helps-pirates-evade-piracy-shield-240528/). *\*smirk\** Still, we have to recognize that Cloudflare has grown into a cornerstone of modern digital infrastructure, which is a role that could eventually render it [*too big too fail*](https://en.wikipedia.org/wiki/Too_big_to_fail), to borrow a term from the financial world.

**Footnote:** The artwork was generated using AI and further botched by me using the [*greatest image manipulation program*](https://www.gimp.org).