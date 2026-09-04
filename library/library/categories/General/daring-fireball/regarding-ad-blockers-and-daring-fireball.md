+++
title = "★ Regarding Ad Blockers and Daring Fireball"
description = "Ultimately, when you install a content blocker extension, you take responsibility for any overzealousness in what they block."
date = "2026-07-24T20:57:20Z"
url = "https://daringfireball.net/2026/07/regarding_ad_blockers_and_daring_fireball"
author = "John Gruber"
text = ""
lastupdated = "2026-08-10T22:24:07.365650745Z"
seen = true
+++

Following up on the previous item today, re: [content blockers and ad-blocking](https://daringfireball.net/linked/2026/07/24/coiner-of-enshittification-endorses-dickover), I ran into a weird situation a few weeks ago with my column “[John Ternus Should Reverse Apple’s Slide Down the Advertising Slippery Slope](https://daringfireball.net/2026/07/ternus_apple_slippery_slope)”. That article contains this sentence, in Markdown:

```
And -- at this writing, still "coming soon" -- Apple is
launching [ads on Apple Maps][🗺️].

[🗺️]: https://ads.apple.com/maps

```

The problem is that anyone reading that article in NetNewsWire saw it rendered like this, with the words “ads on Apple Maps”<sup id="fnr1-2026-07-24"><a href="#fn1-2026-07-24">1</a></sup> omitted:

[<img src="https://daringfireball.net/misc/2026/07/nnw-ad-blocking.png" alt="Screenshot of article text from NetNewsWire." width="550">](https://daringfireball.net/misc/2026/07/nnw-ad-blocking.png)

It looks like I forgot to finish writing that sentence. NetNewsWire simply omits the hyperlinked words. After a few readers reported this, I immediately suspected the problem was the “ads.apple.com” domain. I’ve never linked to that domain before, and many ad blockers just block any domain that starts with a domain prefix like `ads.*`.

And that’s exactly what the problem is. I had no idea that NetNewsWire filtered any content whatsoever (and I sort of think it shouldn’t), but DF reader Antonio Germano searched through NetNewsWire’s open-source code and found it in [the `core.css` file](<https://github.com/Ranchero-Software/NetNewsWire/blob/main/Shared/Article Rendering/core.css>), line 49:

```
38  /*Block ads and junk*/
39  
40  iframe[src*="feedads" ],
41  iframe[src*="doubleclick"],
42  iframe[src*="plusone.google"] {
43      display: none !important;
44  }
45  
46  a[href*=".ads."],
47  a[href*="feedads" ],
48  a[href*="doubleclick"],
49  a[href*="//ads."],

```

The culprit identified, I dutifully pinged my friend [Brent Simmons](https://inessential.com/) to report the problem. But then I had to decide what to do about it. I have no idea which feed readers are being used to read Daring Fireball’s [feeds](https://daringfireball.net/feeds/), but NetNewsWire is surely one of the most popular, and probably *the* most popular. It’s the feed reader I use personally. I can’t change the contents of NetNewsWire’s `core.css` file, so I can’t keep NetNewsWire from stripping out words that link to Apple’s `ads.apple.com` domain. What I could do is not link to `ads.apple.com`, like, say by changing my link from `ads.apple.com/maps` to a shorten-and-redirect URL like `bit.ly/4wmXFSE` that [points back](https://bit.ly/4wmXFSE) to Apple’s original URL.

But I didn’t do that. I don’t like playing whack-a-mole to work around bugs in other software. I have enough trouble fixing my own mistakes. I also don’t like the idea of showing everyone a “Click it and find out where it actually goes” mystery URL from Bitly rather than the direct URL. It’s a general principle thing, and also a much better policy for links that are meant to last for decades.

What I really don’t like about NetNewsWire’s ad-blocking here is that it just *omits* the linked text. It doesn’t remove the link but leave the words; it removes the words that are hyperlinked to the blocked domain. I’ve run into this with other content blocking extensions. For example, the Banish extension for Safari, [which I recommended back in 2022](https://daringfireball.net/linked/2022/08/02/banish). At some point a year or two ago, Banish started blocking links to Apple’s App Store domain, and it did so by removing the words that link to the App Store. That’s crazy. I linked to the App Store in my own post recommending Banish, which means if you have Banish installed and read that post, you won’t see the headline of the post (nor be able to follow the link). I think there are other content blockers that do the same thing with text that links to the App Store.<sup id="fnr2-2026-07-24"><a href="#fn2-2026-07-24">2</a></sup>

So what do I do about that? Do I stop linking to the App Store? That’s dumb. Do I create custom URL redirects for every single link I make to the App Store? That’s work I don’t need or want to do, and adds a layer of abstraction that confuses everyone who isn’t using a content blocker with such a stupid rule. So I just ignore it. But that means an untold number of readers, who are using such content blockers, are just missing words in my articles whenever I link to the App Store. Well, so be it. Ideally, content blockers “just work” — blocking only things you want blocked, never things you don’t want blocked. Nothing is perfect however. What’s pernicious about blockers that remove the actual words that link to certain domains is that that’s not expected behavior. From the reader’s perspective, it really just looks like an editing error on the part of the website, not a content blocker with an overzealous pattern-matching rule.

Ultimately, though, when you install a content blocker extension, you take responsibility for any overzealousness in what it blocks.

---

Let me use this opportunity to make a small personal request. The display ads on Daring Fireball are unobtrusive and limited to one per page. They are also entirely private, and always have been. There not only are no cookies or JavaScript that attempt to track you, but the ads themselves are served from the `daringfireball.net` domain. I turn down advertisers who request to serve images (or “tracking pixels”, which are just invisible images) from *their* domains. (Such requests are infrequent, thankfully.) I don’t display the ads in between paragraphs mid-article, a common practice that to me is disrespectful both to the writer *and* reader. In short, I try to keep the ads on Daring Fireball not merely unobjectionable, but something that actually adds to the site. I actually like the ads in certain high-quality print magazines, like The New Yorker. My goal for the ads on DF is for them to be like that.

In short, I hope they’re the sort of ads readers don’t want to block. I’m pleased to say that most of the ad-blocking content blocking extensions I’ve personally tried do not block ads on Daring Fireball by default. In other cases, they do, but it’s easy to adjust the per-domain settings to allow them. In [the previous post](https://daringfireball.net/linked/2026/07/24/coiner-of-enshittification-endorses-dickover), I recommended [uBlock Origin Lite](https://apps.apple.com/us/app/ublock-origin-lite/id6745342698) (free, a bit complex) and [Magic Lasso](https://www.magiclasso.co/) (paid, much simpler). Magic Lasso does not block ads on DF by default. I don’t remember what uBlock Origin does by default, but it’s trivial to change it to allow them.

If you use an ad blocker and it currently blocks the ads on DF, I humbly ask you to consider taking a moment to tweak the settings to permit them. (If you are using a blocker that strips the ads from DF by default, you can do me an additional favor and [shoot me a short email](https://daringfireball.net/contact/) telling me which one. I’m curious.) If you are the developer of an ad blocker, I ask you to consider allowlisting Daring Fireball *by default*.

If you are a reader and you really do want to block DF’s ads, please, go right ahead. I find that an odd mindset, but it’s your web browser and your call. No hard feelings. (Please further note that I have no JavaScript code that attempts to detect whether you’re blocking DF’s ads in order to nag you.)

---

1. I omitted the Markdown creating a link on the words “still ‘coming soon’” for clarity, to emphasize only the problematic link in my original prose. (Also, it’s fun to use emoji as named link definitions, like in this example.) [↩︎︎](#fnr1-2026-07-24)

2. I of course reported this to the developer of Banish, twice, but he never responded. I, err, banished Banish from my own devices, and upon finishing this article, I’m going to update my 2022 recommendation of Banish to un-recommend it. [↩︎](#fnr2-2026-07-24)