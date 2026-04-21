+++
title = "Frugly vs. Freemium"
description = "uglify the UI for non-paying consumers"
date = "2024-02-07T00:00:00Z"
url = "https://taylor.town/frugly"
author = "Taylor Troesh"
text = ""
lastupdated = "2026-04-20T13:20:40.333895216Z"
seen = true
+++

![](https://taylor.town/frugly.png)

![](https://taylor.town/frugly-overcast.jpg)

I recently built [an education tool](https://flashcasts.com).

Like other enterprising folk, I stumbled into a ethical dilemma: (1) my product probably shouldn't be paywalled, but (2) I also don't want to be poor.

My solution: uglify the UI for non-paying consumers.

* [Selling Sustainably](#1)
* [Getting an A+ (50% Off)](#2)
* [No Cookies](#3)
* [No Soliciting](#4)
* [Skins in the Games](#5)
* [Cosmetic Crippleware](#6)

Selling Sustainably
----------

I'm a self-described [nontrepeneur](https://taylor.town/nontrepeneur). I want to secure [enough](https://taylor.town/enough) to purchase freedom, and then exercise that freedom to build nifty junk.

Until I have the financial means to donate my brain and body to the public, I need to build nifty junk whose profits exceed my employable salary.

Getting an A+ (50% Off)
----------

In the US, [education smells like a pay-to-play scheme.](https://www.nytimes.com/interactive/2023/10/23/upshot/sat-inequality.html)

While many excellent resources are free, affluent students can purchase better tools: [GPT-4](http://chat.openai.com), [textbooks](https://en.wikipedia.org/wiki/Textbook#Market), [WolframAlpha](https://www.wolframalpha.com/pro/pricing/students), [Chegg](https://www.chegg.com), [Khanmigo](https://www.khanacademy.org/khan-labs), [private tutors](https://www.henrikkarlsson.xyz/p/childhoods), etc.

Despite their contributions to inequal education, I adore Wolfram Research, OpenAI, and Khan Academy. They make stellar products and may even contribute to the [the Flynn effect](https://en.wikipedia.org/wiki/Flynn_effect). But engineering is expensive -- I doubt they could give their best services away for free even if they wanted to.

I'm [obviously] not Stephen Wolfram, Sam Altman, or Sal Khan. I don't have stakeholders nor a giant heavy brain to weigh me down. In theory, I could keep my costs low enough to make an equitable education tool.

If so, are there any viable alternatives to [freemium](https://en.wikipedia.org/wiki/Freemium) pricing? How do you give something away for free without giving it away for free?

No Cookies
----------

Many organizations employ ads (and worse) to betray the attention and privacy of their consumers. I chose not to entertain these options.

No Soliciting
----------

My education tool is totally finished. I'm not going to pursue "growth" via venture capital. I'm not going to add features. I'm not going to continuously announce updates. My product will sit on its shelf like an immortal N64 cartridge. Maybe I'll consider a "sequel" one day, but don't expect much.

Patreon proves that donation-based income is viable for endless feeds of entertainment, but the strategy doesn't seem to work well for boring tools. I want to build invisible infrastucture for the mind; I don't want to be forever chained to hype synthesis and Wikipedia-esque fundraising campaigns.

In other words, it's hard to solicit donations without recurring effort. I am allergic to recurring effort, and I will continue to avoid it.

Skins in the Games
----------

Pay-to-play gaming is unpalatable for many folks, so many video game studios employ a simple pricing strategy that remains fair to its players: [skins](https://en.wikipedia.org/wiki/Theme_(computing)#Video_gaming).

To maintain a level playing-field, the following games profit solely from aesthetic upgrades: Rocket League, Fortnite, CS:GO, Path of Exile, League of Legends. In these games, players purchase outfits for in-game avatars that do not impact the competitive balance.

AAA video games cost \~$100M to produce and \~$10M to maintain each year thereafter. To fund these exorbitant investments, game studios employ artists and marketers to manufacture trends. See for yourself: [browse Fortnite skins by "season", rarity, etc.](https://fortnite.gg/cosmetics?type=outfit)

*[It's called fashion, Brenda, look it up.](https://taylor.town/fashion-brenda.jpg)*

But synthetic digital fashion trends aren't enough. To maximize sales, many studios deliver skins via gambling mechanics called ["loot boxes"](https://en.wikipedia.org/wiki/Loot_box). Just look at the size of that Wikipedia page, folks.

Anyway, aesthetic upgrades (without gambling predation) suggest a pricing strategy that meet my fairness/ethics criteria. But without peer effects and seasonal content, this model will inevitably fail for my unsexy education software.

Cosmetic Crippleware
----------

Not to toot my own horn, but I am very good at making things uglier.

To work with my natural skillset, I focused on aesthetic *downgrades* over aesthetic upgrades. I call this "frugly pricing", AKA "cosmetic [crippleware](https://en.wikipedia.org/wiki/Crippleware)".

It's simple: I plaster the word "free" everywhere until consumers pay for a license. I'm not the first to do this, and I certainly won't be the last.

Frugly pricing demands little planning and maintenance. Here is all of the code in flashcasts that govern my ugly messages:

```
<section style="position: sticky; top: 0; background: rgba(255,255,255,0.8);">
  ${props.is_pro ? "" : html`
  <p
    style="font-size: 1.1rem; max-width: 100%; margin-left: -1rem; margin-top: 2rem; transform: rotate(0.5deg); text-align: center; font-family: serif; font-style: italic; color: green;">
    This is a free account. Remove this ugly message<br />for
    <a href="https://taylor.town/pro?lifetime">$123 for life</a> or
    <a href="https://taylor.town/pro">$4 per month</a>.
  </p>
  `}
</section>
```

```
xmlelement(name "itunes:image", xmlattributes((select case when is_pro is false then 'https://flashcasts.com/cover-free.jpg' else coalesce(image_url,'https://flashcasts.com/cover.jpg') end from feed_) as "href")),
xmlelement(name "title", (select (case when is_pro is false then '[FREE] ' else '' end) || title from feed_)),
xmlelement(name "description", (select (case when is_pro is false then '[FREE] ' else '' end) || description from feed_)),
```

 Yes, I used SQL to dynamically build podcast XML for flashcasts. I am unsure whether to be impressed or horrified with myself.

Beware: cosmetic crippleware is easy to implement, but also easy to circumvent. For example, the following snippet thwarts my plot on web. I believe that citizens of the web have every right to modify incoming webpages, so I will do nothing to prevent folks from throwing this into [Tampermonkey](https://www.tampermonkey.net):

```
[...document.querySelectorAll("section")]
  .filter(x => x.textContent.includes("This is a free account."))
  .forEach(x => x.remove());
```

Anyway, here's the moral of my story: there needn't be so much conflict between ethics and profits. Carefully consider your constraints, and use [design thinking](https://en.wikipedia.org/wiki/Design_thinking) to make the world a better (and possibly uglier) place.