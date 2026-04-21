+++
title = "An Antidote to Subscription Fatigue"
description = "It's lifetime licenses."
date = "2024-02-12T00:00:00Z"
url = "https://taylor.town/lifetime-licenses"
author = "Taylor Troesh"
text = ""
lastupdated = "2026-04-20T13:20:40.330841487Z"
seen = true
+++

**tl;dr:** It's lifetime licenses.

I like [Fastmail](https://www.fastmail.com). They charge [$50/year for their "standard" package](https://www.fastmail.com/pricing/); I'm a happy customer.

I expect to be a Fastmail customer in 10-20 years, which is *forever* in SaaS time. To remove another subscription from my list, I'd easily consider paying $500+ for a lifetime license.

Surprise: Fastmail [once doled out "lifetime" licenses for $14.95](http://jhoward.fastmail.fm.user.fm/media/slicker_wheel.html), which [they reneged on in 2017](https://news.ycombinator.com/item?id=14357859). But this is not an essay about digital ownership, contracts, etc.

Subscriptions Reduce Risk
----------

Subscriptions minimize risk for both parties. Businesses don't have to worry about supporting dead-weight customers; customers can stop paying whenever they stop using the product.

Both parties can use a simple equation to convert between subscription vs. lifetime prices:

```
lifetime price = monthly price * expected months subscribed
```

For example, a $4/month subscription should be worth $144 if you expect to use the service for 3 years.

Note that both parties' "expected value" part of the equation becomes less important as the deal period decreases.

Tangent: money *now* is not equal to money *later*. Here's a more accurate formula, which accounts for inflation and ROI opportunity costs:

```
lifetime:
  $future = $present * (1 + r)^n

monthly:
  $future = $present * ((1 + r)^n - 1) / r
```

For a $4/month subscription over 3 years:

```
lifetime:
  $186.48 = $144 * (1 + 0.09)³

 monthly:
  $164.61 = $4 * ((1 + 0.0075)^36 - 1) / 0.0075
```

Indeed, compound interest is the "8th wonder of the world":

```
$186.48 - $164.61 = $21.87

~11% = $21.87 / $186.48
```

Theoretically, for the same dollar amount, subscriptions favor customers.

But Subscriptions Enshittify
----------

>
>
> Monthly service costs / subscriptions are a feature. This happens all the time with mobile apps, for example. You find a nice new shiny todo app that costs $5 and invest heavily in it, lo and behold, 6 months later the 2k people that bought it isn't enough to sustain the creator indefinitely and it dies a slow and neglectful death. But if just 500 of those people paid $5/mo that would be much more likely for the developer to continue supporting it.
>
>
>
> \-- [infogulch](https://news.ycombinator.com/item?id=14359045)
>
>

The math doesn't capture how incentives shape product development.

**Subscription:** *"build until rate of profits exceeds rate of spend"*

**Lifetime licenses:** *"build once, then sell marginal units until profits exceed wages invested"*

Subscriptions encourage short-term thinking over a long period. Lifetime licenses encourage long-term thinking over a short period.

Subscription models underpin today's weird Ponzi VC Hail Mary enshittified business cycles. When businesses focus on rates/projections, growth becomes king. In the pursuit of growth, businesses acquire debt to acquire consumers that won't pay forever. After management sobers up, they cull 80% of the team in the middle of another indefinite product deathloop. The remaining employees (1) raise more money and/or (2) sell the company and/or (3) sell the user-data they've collected.

Figma will employ their [200+ engineers](https://coding-time.co/figma) ad infinitum. Meanwhile, a lone engineer could build a P2P version of Figma with 90% of its featureset in \~11 months. If that lone engineer resists the temptation to endlessly ship "improvements", they can sustainably sell lifetime licenses. 90% of a featureset is plenty if you prioritize interoperability/extensions. Adobe, if you're listening, I'm willing to do all of this for a measly 1% of [your $20B offer](https://news.adobe.com/news/news-details/2022/Adobe-to-Acquire-Figma/default.aspx).

In other words, if customers are willing to purchase *lifetime* licenses, it's probably time to stop adding features.

My 123/4 Plan
----------

I recently built [frugly](https://taylor.town/frugly) software that I sell for $123 (lifetime) or $4 per month. My "123/4" plan is cool, because consumers can trial the product on a monthly plan until they're (1) tired of subscription fatigue and/or (2) confident enough in the future/stability of the product.

The entire product took me \~100 hours to build, and will probably demand \~10 hours of maintenance per year. I spend \~$0.00005 on monthly server costs per consumer. None of this was accidental. I purposefully designed the product to minimize upfront development, ongoing maintenance, etc. It is unclear to me why larger organizations can't/won't do the same.

Computation-per-second grows more affordable with time. In theory, it should become *cheaper* to run software every year.

How many [woman months](https://taylor.town/woman-month) *should* it take to develop your product? How much money *should* you spend on computation per consumer per month? Every time I do napkin math, I end up with numbers that wildly diverge from common averages.

For example, for server costs alone, most SaaS apps should only cost between $0.000005 and $0.005 per month per consumer. Yet AWS hands out $100K+ compute credits like candy. What is all the compute being spent on? If you're willing to share some real-world numbers with me, please email me at [hello@taylor.town](mailto:hello@taylor.town) and help me figure out what I'm missing.

This is a long way of saying that modern software economics is baffling.

To nobody's surprise, an antidote to subscription fatigue is lifetime licenses. But something happened and suddenly the ancient art of "selling a complete product" appears economically inviable.