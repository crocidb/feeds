+++
title = "Host an indie-web yardsale on your /junk page"
description = "You can give that wish a second life."
date = "2024-11-18T00:00:00Z"
url = "https://taylor.town/junk-guide"
author = "Taylor Troesh"
text = ""
lastupdated = "2026-04-20T13:20:40.236581581Z"
seen = true
+++

img { border: 2px solid white; }

[![Taylor's /junk page](https://taylor.town/junk.jpeg)](https://taylor.town/junk)

When I arrived at university, I purchased a brakeless black bicycle from a departing senior. After inaugurating its handlebars with fresh white grip tape, that bike became a trusty steed indeed.

When it sat outside the engineering building, friends knew to find me working in the math library or sleeping on that one disgusting computer lab couch. When it sat outside my apartment, friends knew Coors-branded cans awaited them in the fridge.

When I departed university, I sold that brakeless black bicycle to a sophomore. I taught him how to "safely" ride down hills. I told him to avoid ice in front of the cafeteria. There's a shortcut on the North side of campus if you're willing to take the bike down some stairs. Oh, and the roof of the biology building is always unlocked, so you can sneak in after-hours if you climb the tree in the parking lot. Sure, you can have my mini-fridge too -- consider it a gift.

How wishes become junk
----------

[Make a /wish page!](https://taylor.town/wish-manifesto)

And of course you eventually become somebody else. Every fulfilled wish transforms you into a person you thought you wanted to be. And when you realize that those old wishes have rotted into junk, you can wield that junk to grant others' wishes. You can give that wish a second life.

But you have much more than simple wishes to give. Every fulfilled wish confers wisdom. Tricks, mistakes, tips, quirks -- your stories enchant an object into its afterlife. You can share that better part of yourself you've worked so hard to curate.

Protocols matter. Platforms matter. Neither eBay nor Craigslist nor OfferUp seem to spark human connection. Of course thrifting doesn't *need* to be social, but maybe I'm a bit miffed with endless listings scrubbed and sanitized for strangers' search bars.

I want to be where the people are
----------

Every Sunday morning, I want to browse /junk pages on crappy websites across [the cheap web](https://potato.cheap). I want to creep on my friends, and to guess what kind of people they're becoming. I want to stumble upon cool strangers with common (and uncommon) interests -- what kind of books would other Björk fans sell on their /junk pages? I want to see if that one blogger in my RSS feed can actually wrap a tennis racket and ship it to my doorstep. I want to publicly share my shameful history of late-night impulse purchases, and to tempt others into similar mistakes. I want yardsales on 𝓉𝒽𝑒 𝒾𝓃𝓉𝑒𝓇𝓃𝑒𝓉.

Build your /junk page
----------

To host a yardsale on 𝓉𝒽𝑒 𝒾𝓃𝓉𝑒𝓇𝓃𝑒𝓉, create an HTML file and give it a public web address. Your HTML can look something like this:

```
<body>
  <ul>
    <li>
      <img href="https://taylor.town/engineering.jpg" alt="Taylor Troesh, connoisseur of crap"/>
      <h1>Taylor's junk</h1>
      <p>Hello! Welcome to my internet yardsale.</p>
      <p>You can email me at <a href="mailto:hello@taylor.town"/>hello@taylor.town</a></p>
    </li>
    <li>
      <a href="https://taylor.town/baby-shoes-1" target="_blank">
        <img href="https://taylor.town/baby-shoes-1" alt="actual photo"/>
      </a>
      <a href="https://taylor.town/baby-shoes-2" target="_blank">
        <img href="https://taylor.town/baby-shoes-2" alt="official product photo from manufacturer"/>
      </a>
      <h2><a href="mailto:hello@taylor.town?subject=baby%20shoes">$2</a> Baby shoes</h2>
      <p>for sale: baby shoes, never worn</p>
    </li>
  </ul>
  <style>
    * {
      box-sizing: border-box;
    }
    img {
      width: 100%;
      display: block;
    }
    body > ul {
      padding-left: 0;
      columns: auto 40ch;
      gap: 1rem;
    }
    body > ul > li {
      padding: 1rem;
      display: inline-block;
      width: 100%;
      margin-bottom: 1rem;
    }
    body > ul > li:first-child {
      border: 2px solid black;
    }
  </style>
</body>
```

 You can paste arbitrary HTML into most markdown-based static-site generators.

You may also opt for a website builder like Squarespace.

Don't overthink it! Stay [slippy](https://www.todepond.com) and use sane defaults:

* **Location:** In-person exchanges are underrated. Sellers can forgo packaging; buyers can inspect quality before purchase. Consider listing your approximate geographic region and travel plans to spark serendipity/convenience.
* **Pricing:** LLMs are pretty good at estimating fair prices for used goods. I generally try to aim for 10%-20% below market prices for my baseline "friend discount".
* **Auctions:** For difficult-to-price items, consider running an auction! If the sale is not urgent, a [Dutch auction](https://en.wikipedia.org/wiki/Dutch_auction) minimizes effort (and inbound emails). Simply post a time-table of date vs. price; the first person to commit to a price at a realized date wins the auction.
* **Photos:** Don't skimp on pics! Find a bedsheet, gather up all the lamps/lights around your house, and snap loads of pictures.
* **Payment:** PayPal, Venmo, Apple Cash, Zelle, Doge, etc. Remember that the money is not yours until (1) it's in your bank account and (2) the transfer is outside its return/chargeback window.
* **Bartering:** Bartering is great! But try not to suggest a trade if you're unwilling to pay its listed cash price -- as a seller, these requests can become relentless and annoying.
* **Haggling:** It's okay to haggle, and it's okay to remain firm on prices.
* **Contact:** Consider using `mailto:hi@example.com?subject=tag` `mailto:hi+tag@example.com` links to sort your inbound requests.
* **Disputes:** I hate returns and conflict, so my default policy for disputes is "buyer pays shipping, but buyer keeps item with optional 50% refund (no-questions-asked)".
* **Timing:** I think there's merit to artificially capping your yardsale at one week. It also seems smart to list items indefinitely. Either way, the best time to start is now.