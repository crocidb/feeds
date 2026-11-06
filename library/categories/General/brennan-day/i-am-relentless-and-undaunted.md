+++
title = "I Am Relentless and Undaunted"
description = "AO3 went dark after a security breach, and fanfiction.lol doubled overnight. On the blur of breaches and Sam Altman calling it 'terrible' that people have RAM in their PCs. On the end of affordable hardware and DDR4 prices quintupling, 2026 hard drive production sold out to hyper"
date = "2026-11-01T02:00:00Z"
url = "https://brennan.day/i-am-relentless-and-undaunted/"
author = "mail@brennanbrown.ca (Brennan Kenneth Brown)"
text = ""
lastupdated = "2026-11-02T23:26:59.569126827Z"
seen = false
+++

The past few days, I have been a little busy. Two days ago, [Archive of Our Own](https://archiveofourown.org/), the largest fanfiction website on the net, announced [unexpected maintenance](https://www.otwstatus.org/), which then turned out to be [a security breach](https://www.404media.co/archive-of-our-own-ao3-down-maintenance/) resulting in the site being down for the next two to four weeks.

As some of you may be aware, I run my own transformative works archive, [fanfiction.lol](https://fanfiction.lol), using the open-source [OTWArchive codebase](https://github.com/otwcode/otwarchive). I've [written about this before](https://brennan.day/announcing-fanfiction-lol-a-manifesto-on-human-creativity-and-ao3/) on my blog. By chance, I audited and upgraded the software on the server a day before AO3's outage, and was prepared for the influx of new users.

We doubled in size and went from around 300 users to over 600 as of writing, and are currently the only AO3-fork with open registration. Fandom and fanfiction may seem like a small thing to some, but this unplanned, prolonged outage [was covered by *The New York Times*](https://www.nytimes.com/2026/10/30/arts/ao3-fan-fiction-site-down.html). It is no small thing.

Fanfiction.lol *is* a small thing, however. And I'm glad I can provide a handful of AO3 users a place to write and read works until the site is back online. For perspective: the much more popular and longstanding [SquidgeWorld Archive](https://squidgeworld.org) gained over 12,000 new users in the same time frame.

With this, I've been taking stock of what I have and what I can offer the world.

The End of an Era [](#the-end-of-an-era)
----------

The headlines of security breaches are speeding by in a blur, aren't they? Only yesterday, [6 billion dollars was stolen from Binance](https://www.npr.org/2026/10/31/nx-s1-6024426/binance-crypto-heist-cyber-criminals-north-korea), and there was yet [another critical vulnerability, this one found in the Linux kernel](https://www.bleepingcomputer.com/news/security/critical-linux-kernel-flaw-allows-remote-root-attacks-on-mptcp-servers/).

And hardware has been affected even more than software. OpenAI CEO Sam Altman went on record saying [it's "terrible" that people have RAM in their PCs instead of in data centres](https://finance.yahoo.com/technology/ai/articles/quite-terrible-sam-altman-says-184500058.html). As though they still somehow don't have enough.

The rich and ruling class consistently push the envelope, seeing what exploitation and degradation will be accepted and normalised. It was only a couple of years ago that consumer hardware costs were at an all-time low. [My idealistic call-to-action](https://brennan.day/homelab-for-the-beginner-you-can-self-host-your-own-server-on-50-hardware/) that anybody could start their own server with a spare computer has become increasingly unfathomable.

I decided to compare the all-time low price to the most recently tracked price (USD) for several popular DDR4 SODIMM modules—the laptop-sized sticks that fit old ThinkPads and mini PCs:

|                                              Product (DDR4 SODIMM)                                              | Historical Low  |   Recent Price   |Increase|
|-----------------------------------------------------------------------------------------------------------------|-----------------|------------------|--------|
|[Crucial 8GB 2400MHz](https://pangoly.com/en/price-history/crucial-8gb-single-ddr4-2400-pc4-19200-260-pin-sodimm)|$14.99 (Jun 2025)|$58.04 (Sep 2026) | \~3.9x |
|           [Lexar 8GB 3200MHz](https://pricehistory.app/p/lexar-sodimm-ddr4-ram-8gb-3200-mhz-UXV79Ace)           |$17.00 (Mar 2025)|$79.99 (Sep 2026) | \~4.7x |
|               [Crucial 16GB Kit (2x8GB) 2400MHz](https://camelcamelcamel.com/product/B01BIWMWVS)                |$28.99 (Feb 2025)|$138.79 (Mar 2026)| \~4.8x |
|               [Crucial 32GB Kit (2x16GB) 3200MHz](https://camelcamelcamel.com/product/B08C4X9VR5)               |$44.99 (Mar 2025)|$228.98 (Oct 2026)| \~5.1x |

The price of a single DDR4 memory module [went from $12.18 to $47.00](https://capitalandcompute.net/memory-prices/history/) between November 2025 and this past week.

And storage? I know five months ago, I told you to budget $20–$40 for a used SATA SSD like the Crucial MX500. Here are prices now:

|                                   Product                                    | Historical Low  |   Recent Price   |Increase|
|------------------------------------------------------------------------------|-----------------|------------------|--------|
| [Crucial MX500 1TB SATA SSD](https://camelcamelcamel.com/product/B077SF8KMG) |$47.99 (Feb 2024)|$364.99 (Oct 2026)| \~7.6x |
|[Samsung 870 EVO 1TB SATA SSD](https://camelcamelcamel.com/product/B08QBJ2YMG)|$49.11 (Jul 2023)|$334.76 (Oct 2026)| \~6.8x |
| [WD Blue SN580 2TB NVMe SSD](https://camelcamelcamel.com/product/B0C8WPRM9T) |$89.07 (Oct 2023)|$313.70 (Oct 2026)| \~3.5x |
| [Seagate BarraCuda 2TB HDD](https://camelcamelcamel.com/product/B07H2RR55Q)  |$44.00 (Sep 2023)|$148.47 (Oct 2026)| \~3.4x |
|  [WD Red Plus 4TB NAS HDD](https://camelcamelcamel.com/product/B0BDXSK2K7)   |$69.99 (Apr 2023)|$273.99 (Oct 2026)| \~3.9x |

Western Digital and Seagate have [both confirmed their 2026 production is sold out](https://www.heise.de/en/news/WD-and-Seagate-confirm-Hard-drives-for-2026-sold-out-11178917.html), to the hyperscalers building AI data centres, with capacity [allocated through 2027](https://www.tomshardware.com/pc-components/ssds/enterprise-ssds-now-cost-18-times-more-than-hard-drives-per-terabyte).

Manufacturers are also systematically pulling cheaper models and phasing out lower-spec machines because [their already thin profit margins can no longer absorb the component costs](https://www.theguardian.com/business/2026/may/06/ramageddon-cheap-phones-laptops-macbooks-ps5s-ai-chips). Micron has stated that there is ["no line of sight to when supply and demand will return to balance"](https://www.tradingview.com/news/gurufocus:f7e600da5094b:0-micron-has-surprising-message-on-memory-demand-through-2028/).

It is clear that the era of affordable, accessible hardware has come to an end. The cost of living continues to get worse. We will increasingly be expected to surrender ownership and autonomy, and will be compelled to rent and lease and borrow. This is only one example of many. And, in sick irony, many of us are compelled to use the generative artificial intelligence at our jobs—the very thing causing this economic catastrophe in the first place.

We must use what we have, and we must use it for the sake of others. If you are lucky enough to have bought hardware before the shortage, or simply have disposable income, consider how you can contribute to the commons.

Windows 10 extended support [ends on October 12, 2027](https://www.techradar.com/computing/windows/microsoft-extends-windows-10-support-out-of-the-blue-consumers-now-get-updates-for-another-year-to-october-2027), and as a result, millions of computers that can't run Windows 11 are headed for landfill. Put Linux on them instead! [End of 10](https://endof10.org/) lists people and shops near you who'll help. If you'd rather be the one helping, then Repair Café offers a [Linux Repair Café starter kit](https://www.repaircafe.org/en/linux-repair-cafe/).

Next, empty your junk drawer. Any hardware you have is most likely worth more now than the day you bought it, and someone needs it. Post it to your local [Buy Nothing](https://buynothingproject.org/) group, or bring it to a [Repair Café](https://www.repaircafe.org/en/visit/).

Donate your bandwidth by installing things like the [Snowflake](https://snowflake.torproject.org/) browser extension, which lets people in censored countries reach Tor through your connection. If you have a spare computer, [run a relay](https://community.torproject.org/relay/).

Help archive what's disappearing. The [ArchiveTeam Warrior](https://wiki.archiveteam.org/index.php/ArchiveTeam_Warrior) is a virtual machine you can use that downloads at-risk websites and uploads them to the Internet Archive. And donate to projects like [the OTW](https://donate.transformativeworks.org/campaign/donate-to-the-organization-for-transformative-works/c519319) and [the Internet Archive](https://archive.org/donate).

In the meantime, I've been lucky enough to find two additional computers in my basement electronic junk bin to add to my humble server farm. A ThinkPad L512 and an HP Compaq 8200 Elite USDT. Both only have 4GB of DDR3 RAM and 7200RPM HDDs for storage. And yet even this is enough and so capable of giving.

It is clear we are in a weird twilight now—awkwardly set between two different times, and I cannot tell if we are watching a sunrise or sunset.

But I do not shudder or despair. In fact, I'm more hopeful and optimistic for the future than I ever have been in my entire life. This is really not just about websites and computers. Many of us are being pushed into a corner, and a fire is being lit under us. The status quo will no longer be viable, let alone compelling. Nothing scares me anymore. For what do we have to lose at this point? We can work on a better future together, and I know I am relentless and undaunted.

You know, the HP's [spec sheet](https://www.manualshelf.com/manual/hp/8200-elite/quickspecs-english/page-10.html) has one rule about memory: the black socket must always be filled. Leave it empty and the computer refuses to start.

East of Montreal, in Vallée-du-Richelieu, [the world's 4,000th Repair Café](https://www.repaircafe.org/en/the-worlds-4000th-repair-cafe-is-in-canada/) opened on October 4th. Volunteer electricians, aeronautical specialists, seamstresses, and upholsterers all help others.

Most of us drawer what we don't use, collecting dust. But you can offer so much to strangers with what you already have. They want our memory in their data centres? Let them want it. Mine is in the filled black socket. I will keep writing, keep creating, keep offering as much as I can to the world. I did not ask for anybody's permission to do so. No amount of defeat felt by others will stop me.

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