+++
title = "The Day WhatsApp Goes Dark"
description = "A thought experiment in what we built without noticing."
date = "2026-07-14T08:06:08Z"
url = "https://xn--gckvb8fzb.com/the-day-whatsapp-goes-dark/"
author = "marius@xn--gckvb8fzb.com (Marius)"
text = ""
lastupdated = "2026-07-16T14:36:54.188096768Z"
seen = false
+++

**Note:** As usual, [*tl;dr*](#summary) at the end.

Tomorrow morning, *WhatsApp* goes dark, and it’s not just a short downtime, but it is a termination of the service. The servers turn off, the domains don’t resolve anymore and no mobile client is able to connect. Have you ever asked yourself what would happen in that case? What if *WhatsApp* actually went dark?

Obviously, nobody really knows what would happen in such a case, because we haven’t experienced that situation (yet), but even though the closest analogues like the six-hour *Meta* outage in October 2021, and Brazil’s 12-hour court-ordered shutdown in December 2015 were measured in hours, not days, those already produced effects that journalists described as *“apocalyptic”*. We can try to extrapolate what happened throughout events like those to see what *“global catastrophe scenario”* could theoretically look like. Because whether you believe it or not, *WhatsApp* is more than *just a messenger*, and one example that makes this pretty obvious came from the *Forbes* editor *José Caparroso*, who wrote [during the 2021 blackout](https://www.newsweek.com/facebook-whatsapp-outage-down-latin-america-1635533) that …

>
>
> Latin America lives on *WhatsApp*. I am surprised by so many people underestimating how catastrophic this downfall has been.
>
>

But before we dive into this thought experiment, however, it’s worth establishing what we’re actually talking about, as readers in most of Europe and North America underestimate *WhatsApp* by an order of magnitude, primarily because in those markets it functions as one platforms among many. That is, however, not how the rest of the planet works.

**Note:** This thought experiment is not only based on some abstract numbers and studies, but upon my own experience of how *WhatsApp* is being used in e.g. the *global south* on a day to day basis. During my [travels](/travel/) I think I’ve pretty much *“seen it all”*, with for example broadband technicians taking photos of the stickers on the backside of WiFi routers/modems, that show the **hardware address and login credentials** (on their phones), and sending them via *WhatsApp* to themselves, only so they can open them on *WhatsApp Web* (on their work laptops), in order to upload them into the ISP’s technical service portal. It is frankly mind-boggling what sort of tasks *WhatsApp* has become a *Swiss army knife* for in those countries, whether it’s as a file transfer platform for sensitive documents, or as a full-blown hotline for critical services and infrastructure.

Scale
----------

[![Banana for scale](/the-day-whatsapp-goes-dark/images/banana_hu_e0909f59afb27016.webp)](/the-day-whatsapp-goes-dark/images/banana.jpg)Banana for scale

Let’s start by understanding the sheer scale of *WhatsApp*. The *Meta* owned and operated messenger has roughly [3.3 billion monthly active users](https://www.statista.com/statistics/1306022/whatsapp-global-unique-users/) as of early 2026, which is about 40% of every human alive, and somewhere north of 60% of every human with a smartphone. The platform processes [more than 100 billion messages per day](https://cxwizard.app/en/blog/whatsapp-statistics-and-news), out of which around 7 billion are voice messages. On top of that, users place around [5.5 billion voice calls and 2.4 billion video calls per month](https://www.infobip.com/blog/whatsapp-statistics), which boils down to more than 2 billion minutes of voice and video traffic every 24 hours.

To put this in perspective, the global SMS network, at its peak in 2012, handled about 23 billion messages per day across every carrier on Earth. *WhatsApp* does four to five times that volume on its own, every day, on a service that is (at least at the consumer layer) *“free”*.

However, if we look deeper into the country-level breakdown, it becomes clear that *WhatsApp* usage isn’t evenly distributed across the globe. India has between 535 million and 596 million [monthly active users](https://worldpopulationreview.com/country-rankings/whatsapp-users-by-country), and regardless of whether we pick the higher number or we stick with the more conservative estimate, it is the largest single national user base on any messaging platform anywhere. Brazil has about 148 million users, and the app is installed on roughly 99% of the country’s smartphones. And 93% of those users [open the app daily](https://brazilian.report/newsletters/brazil-daily/2021/10/05/whatsapp-evergrande-railway/).

Indonesia has about 112 million users, with *WhatsApp* being the leading messaging platform in the country, and in Zimbabwe *WhatsApp* alone accounts for roughly 44–50% of all [mobile internet traffic](https://qz.com/africa/1114551/in-zimbabwe-whatsapp-takes-nearly-half-of-all-internet-traffic). In Lebanon more than four in five adults [use it](https://www.washingtonpost.com/world/2021/10/05/whatsapp-global-outage-blackout/), making it the dominant communications channel during multiple national crises.

In a great many countries, *WhatsApp* is not simply a service on the internet, it actually *is* the internet for most practical purposes.

Business
----------

[![](/the-day-whatsapp-goes-dark/images/business_hu_ef3f6815a48a85b4.webp)](/the-day-whatsapp-goes-dark/images/business.jpg)

*WhatsApp Business* now has more than 200 million businesses on the [platform globally](https://www.useinvent.com/blog/the-usd45b-whatsapp-business-economy-how-to-capture-your-share-2026-guide), with around 50 million small and medium-sized enterprises using it as their primary customer channel. In India and Brazil, roughly 80% of small businesses use *WhatsApp* to communicate with customers. In Brazil specifically, 96% of businesses rate *WhatsApp* as their primary communication tool, and a joint study by *Fundação Getulio Vargas and Sebrae*, Brazil’s main small-business support organisation, found that [70% of Brazilian small companies](https://brazilian.report/newsletters/brazil-daily/2021/10/05/whatsapp-evergrande-railway/) rely on the *Meta*-owned trinity (*WhatsApp*, *Instagram*, *Messenger*) as their marketplace.

Globally, around $45 billion in commerce is expected to [flow through *WhatsApp* in 2026](https://www.useinvent.com/blog/the-usd45b-whatsapp-business-economy-how-to-capture-your-share-2026-guide). *Click-to-WhatsApp* advertisements alone generate roughly $10 billion per year for *Meta*. About 175 million customers send messages to *WhatsApp Business* accounts every single day. And then there’s payments.

In India, *WhatsApp Pay* is a small player in the [UPI](https://en.wikipedia.org/wiki/Unified_Payments_Interface) with about [67 million transactions per month](https://www.outlookbusiness.com/start-up/news/whatsapp-pay-sees-muted-17-rise-in-upi-volumes-post-cap-removal) against UPI’s 18 billion monthly volume, but in absolute terms, that’s still an enormous number of transactions. In Brazil, *WhatsApp Pay* is integrated with local [card and bank rails](https://www.infobip.com/blog/whatsapp-payments) and is used by transit operators (*Vai de Bus*, for instance, sells passes via *WhatsApp*), banks, and merchants. Across Africa, *fintech* overlays on *WhatsApp*, like *Finnova* in Nigeria, or *Azza* in Nigeria, Kenya, and South Africa, are processing crypto and conventional payments at significant volumes.

Healthcare
----------

[![](/the-day-whatsapp-goes-dark/images/healthcare_hu_fd62bcd5255c6b18.webp)](/the-day-whatsapp-goes-dark/images/healthcare.jpg)

Besides being a chat platform, a marketplace and a payment processor, *WhatsApp* is also being used as critical clinical infrastructure across the global south. A three-year programme at *UCLA’s David Geffen School of Medicine* paired subspecialists in Los Angeles with clinicians at *Partners in Hope Medical Center* in Lilongwe, Malawi, via *WhatsApp* groups. 89% of submitting clinicians and 71% of expert respondents [reported](https://www.ncbi.nlm.nih.gov/pmc/articles/PMC7894367/) that the case discussions improved medical education and patient outcomes.

In the [Eastern Cape of South Africa](https://www.ncbi.nlm.nih.gov/pmc/articles/PMC6739533/), *WhatsApp* groups serve as the primary continuing-medical-education channel for *HIV* and *TB* management in rural clinics where specialists are days away. In Haiti, *WhatsApp* groups coordinate emergency department operations at [*Hôpital Universitaire de Mirebalais*](https://www.ncbi.nlm.nih.gov/pmc/articles/PMC6551485/), including mass-casualty alerts, security updates, and clinical decisions. In Zambia, [*IntraHealth International*](https://www.intrahealth.org/vital/ready-whatsapp-revolution-health-care-communications) runs nurse and midwife mentoring networks over *WhatsApp*. In Brazil, the link between *Zika* virus infection and microcephaly was tracked partly through *WhatsApp* groups of paediatricians comparing cases.

Disaster response
----------

[![](/the-day-whatsapp-goes-dark/images/disasters_hu_ec26d97ee6d75c0d.webp)](/the-day-whatsapp-goes-dark/images/disasters.jpg)

Another critical field that runs on *Meta*’s infrastructure is disaster response. *The World Bank* documented that during 2014’s *Cyclone Hudhud* in [Andhra Pradesh, India](https://blogs.worldbank.org/en/endpovertyinsouthasia/emergency-response-whatsapp-era), the *Public Works Department* restored connectivity to a 1.8-million-person city primarily by coordinating engineers through a closed *WhatsApp* group with the District Magistrate in it, without any formal meetings and orders, which ultimately led to most roads becoming functional within three to four days.

During the 2023 Turkey earthquakes, volunteer-formed *WhatsApp* networks [processed 5,800+ messages in one week](https://www.chatarchitect.com/news/using-whatsapp-for-crisis-communications-emergency-notification-and-business-continuity) for needs assessment and rescue, and in Syria, the [*White Helmets*](https://restofworld.org/2024/whatsapp-lifeline-conflict-zone-natural-disaster/) have run an emergency dispatch system over *WhatsApp* since 2021, because the country’s emergency number infrastructure is largely destroyed and *WhatsApp*’s compression algorithms work where almost nothing else does.

Governments
----------

[![](/the-day-whatsapp-goes-dark/images/government_hu_d0053924d4de5d48.webp)](/the-day-whatsapp-goes-dark/images/government.jpg)

It’s not just individual organisations, but even whole governments are dependent on *Meta*. Buenos Aires for example ran a COVID-symptom triage chatbot on *WhatsApp*, and Lebanon’s public health ministry launched an automated *WhatsApp* service in April 2020 to disseminate updates on the pandemic. India, on the other hand, offers metro tickets, government services, and bill payments through [*WhatsApp* chat interfaces](https://techcrunch.com/2026/04/23/whatsapp-adds-prepaid-phone-recharges-in-india-as-its-payments-usage-still-lags/).

On top of that, for example, the Philippines’ UAE consulate operates consular emergency hotlines on, you guessed it, *WhatsApp*.

Migration
----------

[![](/the-day-whatsapp-goes-dark/images/migration_hu_e5fcd1e5ff891cde.webp)](/the-day-whatsapp-goes-dark/images/migration.jpg)

Last but not least, there’s migration. Roughly a quarter-billion people live outside their country of birth. Most of them use *WhatsApp* as their primary connection to family, because international SMS is expensive and unreliable and Skype is, well, dead. Multiple peer-reviewed studies on [Trinidadian](https://www.mdpi.com/2313-5778/3/2/15), Pakistani, [Ghanaian](https://link.springer.com/chapter/10.1007/978-3-031-15278-8_7), Polish, and [Kenyan](https://www.jstor.org/stable/10.18772/22023128646) diasporas also converge on the same finding of *WhatsApp* being the primary technology of transnational family life in 2026.

Let’s play a game
----------

[![](/the-day-whatsapp-goes-dark/images/game_hu_a8ce6cc08ef06a1e.webp)](/the-day-whatsapp-goes-dark/images/game.jpg)

So to go back to our initial thought, let’s imagine *WhatsApp* shutting down in an instant, with this dependency graph in mind.

What follows is a hypothetical scenario sketched from the documented impacts of past (shorter) outages, scaled up by the duration and finality of the event, and informed by the dependency layers described above. It’s a scenario and not an actual prediction.

### T + 1 hour ###

The shutdown hits during European afternoon, which means American morning, Indian evening, East African afternoon, and Indonesian late evening. The first signals show up on *Downdetector* and on non-*Meta* competitors. In 2021, the six-hour outage generated 14 million reports inside the first few hours, but this time the number is likely much larger.

Behaviour inside the first hour is uneven and largely confused. In most places, users assume it’s a routing problem, a local carrier issue, or a phone bug. They restart the app, then their phone, then their router, then they check ~~*Twitter*~~ *X*, *Instagram*, *TikTok*, *Telegram*, maybe *Signal*, or *Facebook Messenger*, depending on what they have installed. *Telegram* and *Signal* both see app-store download spikes within the first 30 minutes, as it happened during the 2021 outage, with *Signal* reportedly [adding “millions” of users that day](https://www.washingtonpost.com/world/2021/10/05/whatsapp-global-outage-blackout/).

The first noticeable failures show up in commerce. A food-truck operator in São Paulo who takes orders via *WhatsApp* can no longer receive them. A small clothing brand in Mumbai whose entire sales pipeline runs through *Click-to-WhatsApp* advertisements sees its ad spend continuing to bill while the conversation endpoint returns errors. In Hong Kong, a logistics coordinator who confirms container pickups via *WhatsApp* loses the day’s confirmation chain. In Idlib, Syria, the *White Helmets* dispatch room realises within minutes that emergency calls are not coming in, and civilians have no fallback channel.

### T + 12 hours ###

It is likely that three things start happening in parallel. First, *mass migration* to apps like *Telegram*, *Signal*, and to a lesser extent *Messages* (*iMessage*), *Viber*, and *Line*. *Signal*’s servers, which are run on a fraction of *WhatsApp*’s infrastructure, are not designed for an inrush of hundreds of millions of new accounts and start to degrade in some regions. *Telegram*, which has spent a decade preparing for exactly this scenario, holds up better but still struggles with its own issues. Ultimately none of the alternatives are suitable for the people who had built their workflows on *WhatsApp*.

The second thing that happens is *commercial collapse*, which is the biggest 12-hour story, but still largely invisible from Western media. In Brazil, Indonesia, Nigeria, India, Pakistan, Bangladesh, Vietnam, Mexico, and probably 50 other countries, the small businesses that route everything from orders and prices, and photos of goods, to delivery confirmations, and payments, through *WhatsApp* have lost their primary revenue channel. [A clothing brand in Ireland](https://ausdroid.net/news/oc/2023/07/29/whatsapp-outages-and-possible-economic-effects-on-global-businesses/) reportedly lost thousands of euros in a single afternoon during the 2021 six-hour outage. Multiply this by twelve hours and by the entire tail of informal commerce that lives on the platform and the figure runs into the billions.

The third thing is *health-system stress*. Group consults that normally take an hour over *WhatsApp* become almost impossible. The *Eastern Cape* HIV-management network in South Africa, the *Malawi-UCLA* clinical link, the Haitian ED coordination groups, the Zambian rural-nurse mentoring channels, all degrade simultaneously, and while mortality consequences are not yet visible, they are happening nonetheless.

In several countries, government officials begin issuing statements through whatever channel is still functioning.

### T + 1 day ###

After the first 24 hours it becomes clear that the impact this situation has is roughly inversely proportional to a country’s investment in alternative digital infrastructure. The United States and Western Europe are mildly inconvenienced, and India is moderately disrupted, mainly because the country has built duplicate rails, hence *UPI* runs over many apps. After all, SMS still works, alternative payment apps exist, and government services have their own portals. However, countries like Brazil, Argentina, Mexico, and most of sub-Saharan Africa, on the other hand, are in serious trouble.

In Brazil, by the end of day one, the financial press is comparing the situation to a partial shutdown of the national payments system. *Pix* transfers still work, as those run over the central bank’s infrastructure and not *WhatsApp*’s, but the merchant-customer communication layer that drives *Pix* transactions for millions of small operators is offline. The same is true in Argentina, where the inflation-driven culture of constant price renegotiation between vendors and customers happens, in practice, almost entirely on *WhatsApp*.

Another area that starts to fail is migrant remittance. People working in the Gulf, North America, or Europe typically coordinate transfers with their families via *WhatsApp*, where they confirm the recipient’s details, send screenshots of receipts, or sometimes route the money through informal *Hawala*-style networks where trust is established and maintained by daily messaging. These workflows don’t fail completely on day one, but they slow and break in ways that don’t show up in formal remittance statistics for another week or two.

In Latin America, the first major political consequence appears in the form of misinformation that previously circulated within [closed *WhatsApp* groups](https://dl.acm.org/doi/10.1145/3308560.3316738), which now has nowhere to go and starts spilling onto other platforms.

By the end of day one, more than 100 million people have created *Signal* or *Telegram* accounts. Both apps experience their first significant performance degradation events.

### T + 2 days ###

The labour-market consequences start showing up. In India, where *WhatsApp* is the de facto recruiting and onboarding tool for huge segments of the informal economy, gig workers can’t be reached for shifts. Delivery platforms like *Swiggy*, *Zomato*, *Dunzo*, and their international equivalents, see their dispatch coordination degrade. Some of these companies have parallel in-app messaging, but many have leaned hard on *WhatsApp* because it was cheaper.

Schools also begin to feel it, because in many countries, including India, Brazil, South Africa, Kenya, Nigeria, the Philippines, Indonesia, and much of the Middle East, parent-teacher communication runs over *WhatsApp* groups. Two days in, schools that have not made the switch to other channels are operating partially blind, and parents are not getting closure notifications, transport updates, fee reminders, or exam schedule changes. In countries with weak alternative communication infrastructure, the second-order effect is mid-week absenteeism as parents simply don’t know whether school is open.

On top of it all, Healthcare is also heavily impacted. For example, the Haiti emergency-department-style coordination groups have now had 48 hours to find alternatives, and they have, mostly, but the transition has costs. Case discussions that were asynchronous and 24/7 on *WhatsApp* are now synchronous and harder to schedule, and rural clinicians in places like the Eastern Cape, Lilongwe, or the highlands of Nepal are once again practising in the relative isolation that *WhatsApp*’s group-call and group-message features had alleviated. In several documented studies, isolation correlates with diagnostic delays and worse patient outcomes. In Syria, the *White Helmets* switch to a patchwork of *Signal*, SMS where it works, and physical runners, and response times degrade significantly.

### T + 3 days ###

At this point things start to get political. In a number of countries, including Brazil, India, Indonesia, Nigeria, the Philippines, and South Africa, the question stops being *“what is *Meta* doing”* and starts being *“why did we let one foreign company become this central”*.

Telecom operators in several countries pitch the moment as an opportunity to push their own messaging products, most of which have been moribund since 2014, but the pitches fail because nobody trusts the carriers, because those carriers have been quietly delighted to see *WhatsApp* gone, given that it eroded their SMS and voice revenue for a decade. In a few markets, regulators float emergency-decree-style proposals to nationalise messaging infrastructure or build sovereign alternatives. And while most of these proposals are clearly performative, some are not. India and Brazil both have working national digital identity and payments stacks that could, in principle, host a public messaging layer. It remains to be seen, though, whether the political will to build one persists past the first month.

Public health authorities in Lebanon, Buenos Aires, the Philippines, and several African countries are now running emergency communication operations across multiple fallback channels. None of them work as well as *WhatsApp* did and things like vaccination schedules are missed, and appointment reminders fail. Some clinics see patient no-show rates rise by 30–40% versus baseline. Not because *WhatsApp* is superior to its competitors, but simply because humans need a long time to adjust to the alternatives that are being put in place.

Also, crime patterns shift in interesting ways. A *Conflict Sensitivity Resource Facility* report on South Sudan, and *PeaceRep* work on Somalia, both [documented](https://restofworld.org/2024/whatsapp-lifeline-conflict-zone-natural-disaster/) that *WhatsApp* groups were used for both peace-building and for coordinating violence. Removing the platform doesn’t remove either function, as both migrate to other channels, but the migration takes time, and during the transition, coordination of all kinds becomes harder.

In several markets, online ad spend collapses because *Click-to-WhatsApp* ads (a $10B/year business) have no destination, and *Meta*’s stock price has already done what you’d expect it to do.

### T + 5 days ###

The migration to alternatives, mostly *Telegram* and *Signal*, with regional pockets going to *Line*, *KakaoTalk*, *WeChat*, *Messages* (*iMessage*), *RCS*, and a long tail of smaller apps, has now hit critical mass in most of the world. The migration has not been clean, and group chats with over 200 members have, in practice, often migrated as group chats with around 40 members, because not everyone moved at the same time or to the same app.

For business communication, the new world is as fragmented as it gets. A Brazilian shopkeeper who used to take all orders on *WhatsApp* now has to manage *Telegram*, *Signal*, *Instagram* DMs (still up, but reduced after *Meta*’s reputational damage), and SMS. Customer-acquisition costs rise, and customer-retention drops, and several reporters publish stories on small businesses that have permanently closed.

For healthcare, the migration is more orderly because the user base is smaller and more motivated. Most major peer-support networks, like the *Malawi-UCLA*, the *Eastern Cape HIV*, the *Zambia nursing*, and the *Haiti emergency* have stable new homes. The five-day disruption produced measurable degradation, and it is not yet possible to quantify the mortality and morbidity impact.

In Syria, the *White Helmets* have built a partial replacement on *Signal* and on a custom dispatching tool that their engineers had been prototyping. It works less well than what they had, because the compression behaviour that made *WhatsApp* viable in low-bandwidth, intermittently-connected environments is hard to replicate. Hence, some dispatches are now arriving via paper notes. Not because [decentralized mesh networks](https://meshtastic.org) don’t exist, but simply because nobody in these organizations has the expertise to implement these alternatives, especially within such a short period of time.

The first credible economic estimates of the shutdown’s cost reach the tens of billions of dollars and continue to rise. The estimates are dominated by long-tail effects in emerging markets that are hard to measure precisely.

### T + 7 days ###

A week in, the question has shifted from *“When does *WhatsApp* come back?”* to *“What does the world look like without it?”* and a growing fraction of the user base assumes it isn’t coming back, so behaviour begins adapting accordingly.

Several governments, including Brazil, India, and the EU as a bloc, have announced formal investigations or task forces into how to prevent this from happening again. As usual, however, none of them will produce anything actionable within years. The longer-term effects, that you can already see the shape of by day seven are a measurable productivity hit in emerging markets, particularly for informal-sector businesses, a consumer trust impact across the entire *Meta* product family, a wave of *WhatsApp-replacement* startups, most of which will fail due to network effects and generally bad engineering, and the painful realisation that a *free* product is not the same thing as a public good.

Some estimates from [prior outage studies](https://www.marketplace.org/story/2021/10/05/whatsapp-outage-highlights-the-scale-of-its-worldwide-use) suggest that a six-hour *WhatsApp* outage cost the global economy hundreds of millions of dollars per hour in lost *SME* activity, weighted heavily toward Latin America, South Asia, and Africa. Extrapolated over seven days and weighted for cascading effects, the seven-day damage is in the tens of billions, possibly higher.

Summary
----------

[![](/the-day-whatsapp-goes-dark/images/summary_hu_2b1fa986e72e1888.webp)](/the-day-whatsapp-goes-dark/images/summary.jpg)

This thought experiment is not about *Meta* eventually shutting down *WhatsApp*, as it almost certainly won’t do so on its own, given how big of a lever the platform is for the company. In fact, *Meta* is moving in the opposite direction, as it is building *WhatsApp Business* into a $45 billion commerce platform, integrating it with payments, and turning ads into one of its fastest-growing revenue lines. *WhatsApp* is too valuable to *Meta* to switch off voluntarily, and the regulatory regimes in the countries that depend on it most are nowhere near coordinated enough to force a switch away from it or even just ban it outright.

The point is that we have built a planet-spanning piece of communication infrastructure whose ownership, governance, and continuity are concentrated in a single American corporation, that is led by people with questionable values and beliefs, which all in all is a state of affairs that has no historical precedent. Sure, there are other US-based companies that *“own digital communications”*, like ~~*Twitter*~~ *X* and many others, albeit I’d argue that none of those platforms are so engrained into everyday life across many (predominantly developing) nations as *WhatsApp* is today. The closest analogue in scale is the global SMS network of the early 2000s, which, however, was federated, run by hundreds of carriers and governed by an open standard (GSM/3GPP). SMS was never under the unilateral control of any single entity, despite many carries enjoying a defacto monopoly in their respective home markets.

*WhatsApp*, on the other hand, is a single proprietary protocol, with a single operator, optimised increasingly for the commercial interests of that operator, and treated by the rest of the world (governments, hospitals, schools, small businesses, families separated by borders) as a public utility. The seven-day scenario above is an exercise in realising this dependency. *Meta* has no public-service mandate and *WhatsApp*’s terms of service explicitly disclaim any commitment to availability. Yet a meaningful fraction of the medical communication, emergency coordination, family contact, and small-business activity of the *global south* runs on top of this disclaimed-availability infrastructure.

At this point the [*LinkedIn* *thought-leadership* crowd](/the-rise-of-the-bullshittery/) would tell you the answer is *“diversification”* or *“resilience”* or *“multi-channel strategy”* and add an inspirational quote alongside the *ChatGPT*-inserted emojis. Telling a Karachi tailor with 14 customers in a *WhatsApp* group to *“diversify their customer-communication stack”* does nothing to solve the problem. The infrastructure they depend on was built and made free at the point of use by a corporation that calculated, correctly, that owning that infrastructure was worth more than charging for it. The bill is paid in attention, in advertising, in data, and in the asymmetric power *Meta* now holds over a substantial fraction of global communication.

While the shutdown will (sadly) not happen any time soon, the dependency, however, exists, and the thought experiment is worth running occasionally (with other services as well… looking at you, *Google Mail*!) because this exact dependency is what should push us to look for alternatives, and not the implausible event that would make it visible. Network effects may be the biggest drivers for this unhealthy dependency, but I believe that each and every person has the ability to make an impact within their families, their friend-circles and their communities, by choosing to use [anything but *WhatsApp*](/an-overview-of-privacy-focused-decentralized-instant-messengers/) as their main communications channel, ideally a [self-hosted alternative](/run-your-own-instant-messaging-service-on-freebsd/).

[![](/the-day-whatsapp-goes-dark/images/xmpp_hu_653577e2a8046229.webp)](/the-day-whatsapp-goes-dark/images/xmpp.jpg)

For almost three decades now we’ve had [*XMPP*](https://en.wikipedia.org/wiki/XMPP) available to us, with popular and capable implementations like [*ejabberd*](https://ejabberd.im), [*Prosody*](https://prosody.im/), and [*Snikket*](https://snikket.org) existing as open-source software that is ready to be used for communications platforms of any size. As a matter of fact, [*WhatsApp* uses *XMPP* behind the scenes](https://en.wikipedia.org/wiki/WhatsApp#Technical) and is in fact built upon the same [great technology stack](https://en.wikipedia.org/wiki/Erlang_(programming_language)) used by *ejabberd*.

For a *“lower-level”* alternative, there’s the [good ol’ *IRC*](https://en.wikipedia.org/wiki/IRC) that has been around for almost four decades and that is [still thriving](https://ircv3.net).

Both of these open standards would allow communities, organisations and even whole governments to build public infrastructure that could in large parts replace *WhatsApp*.

**PS:** Are you a *Jabber* user already? Come join the [community channel](/contact/#xmpp)!