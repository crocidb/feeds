+++
title = "I Want It Darker"
description = "Winter is closing in, the number of exploited security vulnerabilities is doubling, and I've built an emergency USB stick and an offline library in case the Internet goes down. On asceticism and benign masochism, Hesse's 'love your suffering,' tools as extensions of the body, and"
date = "2026-11-22T02:00:00Z"
url = "https://brennan.day/i-want-it-darker/"
author = "mail@brennanbrown.ca (Brennan Kenneth Brown)"
text = ""
lastupdated = "2026-11-23T10:53:38.757410451Z"
seen = true
+++

It's only a few weeks until the winter solstice—the shortest day of the year. Right now, we only get eight hours of daylight per day up here, as well as over [20cm of snow](https://www.cbc.ca/news/canada/calgary/calgary-weather-9.7426172) in a few days after weeks of blonde grass and warm chinook winds. Solstice represents a turning point toward light, hope, fresh starts, and a new cycle, sure. But it's dark right now. It's dark, but I want it darker.

You see, in addition to finishing the curation and compilation of the work I've been doing for the past year into a couple books, I also took a few days to set up an "in case of emergency" USB stick. It's a \~100 GB stick built for three situations: emergency reference, rebuilding after losing every computer I own, and a handoff for my family if something happens to me. There's a plain-text `START HERE.txt` file explaining everything, and it's all just files that open in a browser or editor. It holds an offline copy of my personal wiki (including a medical and emergency card), my website, my ebook library, and a mirror of my important project folders with their full git history. There's medicine, iFixit repairs, and survival guides, plus installers for what you'd need on a new machine, and an Ubuntu .ISO. There's also the sensitive stuff—keys, secrets, config—in an encrypted archive. And there are letters for my family, explaining what everything is and how to get into it.

As someone who's always aware of the [finite limited time we have](https://brennan.day/you-must-you-must-you-must/), it is hard for me to separate practical preparedness from morbidity.

And then there's also the offgrid project I've been working on—I'm gathering a terabyte of film, television, music, and other entertainment on a 1 TB external drive attached to Nitro, my Acer desktop (i5-12400F, GTX 1650) running Xubuntu. It runs Jellyfin for films and shows, Navidrome for music, and Audiobookshelf for audiobooks and podcasts, all reachable from any device on my home network. I've got Radarr for films, Sonarr for television, and Lidarr for music, all using Prowlarr and a torrent client.

On an older machine, I have [Kiwix](https://kiwix.org/en/) installed, along with other survival, medical, and practical information and utility. It's an HP 8200 Elite mini desktop with an i5-2400S, 8 GB of RAM, and a 1 TB SSD. It has all of Wikipedia, wikiHow, iFixit repair guides, Project Gutenberg, Wikibooks, Wikivoyage, Stack Exchange communities like outdoors, DIY, and mechanics, and developer docs. There's also public-domain survival archives like [Survivor Library](https://www.survivorlibrary.com/) and CD3WD, plus PDF manuals for every device I own.

Why now? The answer is a little dark, if I'm being honest. Countries are issuing [worrying statements in response to the substantial increase of security vulnerabilities](https://www.theglobeandmail.com/canada/article-tech-outages-apple-microsoft-canadian-emergency-preparedness/) being announced:

>
>
> “Countries including Japan and Britain have recently pushed national campaigns encouraging residents to plan ahead for unexpected events, such as extreme weather and cyberattacks. Britain’s “Be Ready” checklist includes stocking up on water, food, hygiene items, as well as communication technology such as a battery-powered radio and back-up chargers for devices.”
>
>

How does that sound to you? We are in a season of preparation, as in, prepping. You should have [90 days worth of supplies](https://www.rd.com/article/should-you-keep-90-days-of-supplies/), as many cities are [updating their emergency readiness](https://www.newsweek.com/major-cities-update-emergency-advice-as-mass-outages-weather-events-hit-us-12742371).

And what are these security vulnerabilities? [PHP2shell](https://www.wiz.io/blog/php2shell-php-rce), for example, affected “70% of websites whose server-side programming language is known,” with quite a few of those sites running versions of PHP too old to patch, or not actively maintained. It was [two critical bugs that sat dormant for years](https://techcrunch.com/2026/10/24/php-ocalypse-how-two-critical-web-bugs-almost-broke-the-internet/), until frontier genAI models figured out how to exploit them. Banks, hospitals, retailers, and some government agencies [took their servers offline to patch](https://techcrunch.com/2026/10/24/php-ocalypse-how-two-critical-web-bugs-almost-broke-the-internet/), and Palo Alto Networks found [more than 22 million exposed instances](https://www.techtarget.com/news/PHP2Shell-22M-exposed-servers-at-risk-as-emergency-patches-released/836071/). But, really, have you actually seen any hackers take advantage of such a massive exploit?

Maybe not that one, so far. But PHP2shell is one of many. According to Google's threat intelligence group, the number of [vulnerabilities disclosed per month doubled](https://cloud.google.com/blog/topics/threat-intelligence/vulnerability-discovery-and-exploitation-trends-in-the-ai-era) between January and July of this year, and the number being actively exploited is nearly double, too. By July, [Bloomberg reported](https://www.bloomberg.com/news/articles/2026-07-27/ai-hunts-for-cyber-flaws-finding-record-numbers-in-tech-sector) that 2026 was on pace to roughly double the number of software flaws found in all of 2025, driven by increasingly capable genAI systems.

Just this month, an [unsafe reflection bug in Apache Axis](https://www.rapid7.com/blog/post/etr-rapid7-detected-exploitation-of-cve-2026-90436-against-atlassian-confluence-data-center-n-able-n-central-also-exploited/) was disclosed on November 6th, and within a week it was being exploited in the wild against Atlassian Confluence. Yesterday, Broadcom patched a [VMware vCenter zero-day that China-linked hackers had been exploiting since September](https://www.hbs.net/cybersecurity-weekly/this-week-in-cybersecurity-november-20-2026). Months of access, and nobody knew. That one is an administrator login for anyone who can reach the server. [CISA added 24 exploited vulnerabilities](https://patchsonar.com/reports/2026-11) to its catalogue in November alone.

And there's a vertigo in the dissonance between these emergency readiness messages and the news headlines about [how rich the initial public offering of Claude's Anthropic is going to be making people](https://www.cbc.ca/news/business/anthropic-first-day-trading-9.7428367). Though, that's already being [tarnished by the stock market continuing to plunge](https://www.theguardian.com/business/2026/nov/20/global-stock-markets-slump-anthropic-ipo-ai-sell-off).

Anyways, right now, I think it’s really hard to tell if this brave new world of continuous, technological exploitation and vulnerability will be manageable or not.

We are informed to take heed, and to be prepared for a worst-case scenario: the Internet, at a fundamental and infrastructure level, being taken down. And that’s why I’ve downloaded all of Wikipedia, Gutenberg, [Hesperian First Aid](https://languages.hesperian.org/pages/en/pdf.html), iFixit manuals, and other resources with Kiwix to my spare drives.

And I don't need to make note that this is happening when we are expected to [own nothing and be happy](https://thred.com/culture/youll-own-nothing-and-be-happy-the-subscription-crisis/). At a time when having physical copies of things is at an all time low, and nearly every person alive is reliant on the Internet for nearly every single thing.

At the same time, I'm aware of how naïve it is to assume having an offline knowledge base and entertainment would help anything if the Internet did go down for a long period of time.

Six years ago, when we were all confined to our houses during the lockdown, here in Canada, our government [gave us thousands of dollars a month](https://www.canada.ca/en/services/benefits/ei/cerb-application.html). How would such a response work without the infrastructure of the Internet? It wouldn't.

Love Thy Suffering [](#love-thy-suffering)
----------

It's times like this that I think about a quote from German-Swiss poet and novelist Hermann Hesse, from [Wer lieben kann, ist glücklich. Über die Liebe](https://www.goodreads.com/quotes/123327-you-know-quite-well-deep-within-you-that-there-is):

>
>
> “You know quite well, deep within you, that there is only a single magic, a single power, a single salvation...and that is called loving. Well, then, love your suffering. Do not resist it, do not flee from it. It is your aversion that hurts, nothing else.”
>
>

Similarly, from [Romans 5:3](<https://www.biblegateway.com/verse/en/Romans 5:3>):

>
>
> "Not only that, but we rejoice in our sufferings"
>
>

I get it, I want it darker. Is masochism a virtue? Yes, it's called asceticism. The self-denial, the chaste, the deliberate physical hardship certain religious sects put themselves through, to become associated with purity, devotion, and transcendence over earthly desires.

We push ourselves towards [benign masochism](https://www.cambridge.org/core/journals/judgment-and-decision-making/article/glad-to-be-sad-and-other-examples-of-benign-masochism/48C0EC2F04412F3CB6EBC18B5E539BE8) all the time. We eat [spicy food](https://brennan.day/spice-our-antifragile-biology/), watch sad films, and endure intense workouts. We learn to practice when we learn there is no real danger.

And the Stoics practice voluntary, secular discomfort—fasting, cold exposure, sleeping on hard surfaces—as a means to build resilience. Discomfort is a tool to strip away fear and achieve inner freedom.

There is a privilege and luxury here though, isn't there? When the suffering is by choice and voluntary. I know many of us have gone through life and trauma with suffering that was the opposite. Instead, it was a status quo existence we didn't have control or say over. I grew up with a lot of my basic needs being a question mark, sometimes burning DVDs of pirated films when we didn't have cable. Sometimes boiling water in the dark of the morning before school when there was a lack of electricity and hot water in winter.

And, too, what's the difference between the ascetic and the self-destructive?

Some early Christian and desert ascetics chained themselves to rocks, walled themselves into cells or caves, or abandoned hygiene and lived in harsh isolation. Known as [stationarii or hesychasts in Syria](https://en.sermig.org/ideas-and-projects/our-magazine-nuovo-progetto/articles/the-monk-in-chains.html), the ascetics used heavy iron chains to tether themselves to boulders or cave walls.

Tapas appears across Hindu, Jain, and Buddhist traditions as a way to build spiritual power, purify the mind, or detach from worldly desires. Urdhva Bahu, for example, is where a tapasvin holds [one or both arms raised vertically for years](https://greekreporter.com/2026/08/30/indian-ascetic-holding-arm-up-world-peace/) until the muscles atrophy and the limbs become rigid and immobile.

[Everything Falling Apart](https://www.cnet.com/tech/services-and-software/outages-and-cyberattacks-everything-is-breaking-is-it-ai/?utm_source=firefox-newtab-en-ca) [](#everything-falling-apart)
----------

While some of us never asked for suffering, and others walk freely into it, we shall all suffer nonetheless. People endure chronic, low-intensity suffering in exchange for the safety and control of routine. The creature comforts and vices we turn towards when everything else is shitty, or outright falling apart.

And, I guess, I don't know how much of that we've been taking for granted. We are being thrust into the dark of a future we didn't ask for, of darker unknown unknowns. People with no comprehension of the horror they're enabling will continue pushing the horror of generative artificial so-called intelligence, and tell you that the horror is for the good of the company, and the horror will do nothing but increase the quarterly earnings.

The black glass slab in our pockets has been there for years, now. Did you know research shows that using a tool [updates the brain's internal body schema](https://thereader.mitpress.mit.edu/when-objects-become-extensions-of-you/)? As in, our mind cannot separate our hands from the things we use with them. The tool is embodied as an extension of the limb.

The preparedness and the voluntary suffering and the routine we depend on that is slowly killing us are all the same—to maintain a sense of control, of identity, to have something to hold onto beyond our arm's length.

All we truly have is whatever is in our arm's reach. Today, that is the infinity of the Internet, sure. But one day it might only be the paperback on the shelf you've forgotten, or the cup of instant noodles, or the warm hand of a loved one.

And that day might be tomorrow, so do not think that the problem can wait until tomorrow to be solved. The treadmill you've been running on is not infinite. One day, there is going to be more than the boulder to push uphill. As I wrote earlier, I think of how naïve it is to assume prepping for emergency will save me, but it is far more naïve to think *any* of this is going to last for a prolonged period of time.

We can only try our best to realize what's important to focus on in the present, and shrug off the rest.

I'm not made for any of this. I am a deeply flawed hairless ape with a brain adapted for the Pleistocene epoch, with a dozen vital organs keeping me alive protected only with soft, warm skin. You are, too. We have always been far more vulnerable and fragile than we allow ourselves to think. We are inherently built out of a soft, tender desire to be loved and to love, and many of us try to replace that with hardened fear and control, instead. And those attempts will always fail. So maybe it's less about trying to embrace the inevitable suffering, and more surrendering to it.

This too shall pass, and nothing gold can stay.

>
>
> There's a lullaby for suffering  
>  And a paradox to blame  
>  But it's written in the scriptures  
>  And it's not some idle claim  
>  You want it darker
>
>
>
> —[Leonard Cohen](https://www.leonardcohen.com/video/you-want-it-darker-lyric)
>
>

---

>
>
> **About Brennan Kenneth Brown**
>
>
>
> Queer Métis writer, cultural critic, and web developer based in Mohkínstsis (Calgary), Treaty 7 territory. Author of nine books and counting, the founder of Berry House Studio, and of Write Club at Mount Royal University. He's also the creator of the transformative works archive fanfiction.lol, and the IndieWeb commons folk.zone. His work has been cited in Le Monde, The Register, and other publications.
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