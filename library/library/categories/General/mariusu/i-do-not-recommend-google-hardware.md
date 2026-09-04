+++
title = "I Do Not Recommend Google Hardware"
description = '''After several years of buying \_Pixel\_ phones and a \_Pixel Tablet\_ solely because \_GrapheneOS\_ runs on them, I've come to the conclusion that \_Google\_'s consumer hardware is really bad.'''
date = "2026-06-22T10:05:58Z"
url = "https://xn--gckvb8fzb.com/i-do-not-recommend-google-hardware/"
author = "marius@xn--gckvb8fzb.com (Marius)"
text = ""
lastupdated = "2026-06-29T12:19:28.422778097Z"
seen = false
+++

I’ve been a [*GrapheneOS*](https://grapheneos.org) user for years now. Back in 2022 I [switched away](/reclaiming-mobile-privacy-with-grapheneos/) from */e/OS* on a *Samsung Galaxy S10* to a *Google Pixel 6a* that I had bought, because at the time it happened to be one of the cheapest devices on the [short list of officially supported Pixels](https://grapheneos.org/faq#device-support). However, my history with *Google phones* goes way past the *6a* and ever since I got my first *Nexus*, every single piece of *Google* (branded and manufactured) hardware that has passed through my hands has eventually broken on a hardware level, way quicker than expected. At this point I have run out of patience with *Google*’s consumer electronics and have decided to stop giving the company any more of my money.

This post is part personal post-mortem, part survey of the wider *Pixel* landscape, and part forward-looking note on what I’m going to do instead.

**Disclosure:** The opinions in here are entirely my own, formed from years of using *Google* hardware as a paying customer.

Why a *Pixel* to begin with?
----------

To be very clear up-front, I have never been a fan of *Google* as a company, and I have certainly never been a fan of their [hardware design](/smartphones-are-designed-to-fail-us/) language. I normally do not run *Google*’s [software on any of my devices](/reclaiming-mobile-privacy-with-grapheneos/), I [avoid *Google* services](/be-your-own-privacy-respecting-google-bing-duckduckgo-search-engine/), and I would prefer not to give the company a single cent.

The only reason I have nevertheless ended up with a stack of *Pixel* devices on my desk is *GrapheneOS*. *Graphene*, to this day, requires *Pixel* hardware because *Google*’s phones are essentially the only consumer Android devices that ship with a verified-boot chain, a relockable bootloader after flashing, and a security coprocessor (*Titan M2*) that the project considers sufficient for its threat model. There is no other Android manufacturer in this market that offers a comparable hardware security surface for an alternative OS. So if you want the strongest privacy- and security-hardened Android, you buy a *Pixel*. That’s literally the only reason.

In my original write-up of the switch to *GrapheneOS* I went into the *why* in much more detail. The short version is that, I no longer trusted any stock smartphone OS, and after years of bouncing between *CyanogenMod*, *LineageOS*, and */e/OS*, *GrapheneOS* was the first ROM that felt like **actual** engineering rather than a community *paint-job* over a vendor blob.

In my [follow-up post about the *Pixel 8*](/google-pixel-9-released-the-best-time-to-upgrade-to-the-pixel-8-and-grapheneos/) I went so far as to call the *Pixel 8* *“a solid piece of hardware, if you happen to find a fully functional device”*. In hindsight, I have to admit that I was wrong.

Google hardware graveyard
----------

Let me start with the actual *Google* devices that I have owned, in chronological order.

### Nexus 5 ###

The [*Nexus 5*](https://en.wikipedia.org/wiki/Nexus_5) was the first *Google*-branded phone I bought, back when the device was still being manufactured by *LG* and *GrapheneOS* was not yet a thing. I ran it for a while on *Google*’s stock *Android* and, after the initial honeymoon period, switched it over to [*CyanogenMod*](https://en.wikipedia.org/wiki/CyanogenMod), the project that, [years later](https://en.wikipedia.org/wiki/LineageOS), would be reborn as *LineageOS*.

For its first year or so, the *Nexus 5* was actually a likeable phone, as it was compact, light, with a clean software experience that, at the time, felt refreshing compared to the bloated *OEM* skins on competing Android devices. Then the hardware started giving up. The battery, which had been mediocre to begin with, became unreliable and the phone would report 40% charge one moment and shut off entirely the next, and over time it began to randomly reboot and power off without any obvious trigger. The decline was not gradual either and once the battery started misbehaving, the device was effectively unusable within a matter of weeks. Combined with a charging port that became increasingly finicky about which cables it would accept, the phone went from *likeable* to *unusable* in well under two years of moderate use.

### Nexus 6 (Motorola) ###

The [*Nexus 6*](https://en.wikipedia.org/wiki/Nexus_6), which, ironically given where this post is heading, was actually built by *Motorola* rather than by *Google* itself, replaced the *Nexus 5* once the latter had given up on life. As with its predecessor, *GrapheneOS* was still years away, so I alternated between *Google*’s stock firmware, *CyanogenMod*, and eventually *LineageOS* over the course of owning it.

What made the *Nexus 6* particularly memorable was the way in which its internals seemed to fail *one component at a time*, almost like a series of unfortunate but separate events. First, the microphone began cutting out during calls, with the other end of the line hearing nothing or only a faint, crackling signal. Then the loudspeaker and earpiece started developing distortion, eventually to the point where music and call audio were barely intelligible. Finally, true to the pattern that would later repeat on every subsequent *Google*/*Pixel* device I owned, the battery rapidly lost capacity and started misbehaving, with the phone shutting off at high reported charge levels and refusing to hold a charge during light use. All of this happened within the first few years of ownership, well before any reasonable expectation of obsolescence.

In retrospect, the *Nexus 6* also gave me my first real taste of what *Motorola* hardware *can* feel like. It’s worth keeping that in mind for the later section on *Motorola*’s [planned *GrapheneOS*-compatible devices](https://9to5google.com/2026/03/01/motorola-confirms-grapheneos-partnership-for-a-future-smartphone-porting-features/).

### Pixel 2 XL ###

The [*Pixel 2 XL*](https://en.wikipedia.org/wiki/Pixel_2) was my first phone branded purely as a *Google* device, with all the responsibility for design, hardware integration, and support sitting with *Google* itself. *GrapheneOS* still didn’t exist as it does today (the project’s early predecessor, *CopperheadOS*, was in the middle of [its very public implosion](https://www.androidpolice.com/2018/06/05/copperheados-feud-andoid-rom-developer-claims-ceo-locked-source-code-development-servers/) right around this time), so the device once again spent its life running *Google*’s stock firmware as well as *LineageOS*.

The *Pixel 2 XL* disappointed me from essentially day one, and only got worse from there. The two main themes were performance, which, even fresh out of the box, felt sluggish for a flagship that was supposed to be competing with the *Galaxy S8* and the *iPhone 8*, as well as battery, which, as with every *Google* device before, deteriorated rapidly.

The *Pixel 2 XL* was a particularly bad, with animations stuttered, app launches being inconsistent, and the whole experience feeling half a generation behind what *Samsung* and *Apple* were shipping that year. As the device aged, this only got worse. Within the first year I was already noticing significant drops in standby and active runtime, and by the second year I was forced to carry a power bank everywhere and even basic tasks like opening the camera app or switching between recent apps became noticeably slow.

In addition, the *Pixel 2 XL* shipped with [a notoriously bad display](https://www.theverge.com/2017/10/22/16517344/google-pixel-2-xl-screen-display-issues-blue-tint-burn-in) that suffered from blue-tint shifting, screen burn-in within months of light use, and uneven color rendering. All of which were defects that *Google*, in classic form, [partially acknowledged with software workarounds](https://www.androidpolice.com/2017/10/26/google-issuing-software-update-pixel-2-xl-display-quality-improvements/) rather than hardware replacements for most affected owners.

The *Pixel 2 XL* was the phone that, at the time, made me seriously question whether I wanted to keep buying *Google* hardware at all. The answer, sadly, turned out to be *yes*, but only because of the eventual emergence of *GrapheneOS* and the absence of viable alternatives on comparable hardware.

### Pixel 6a ###

The [*Pixel 6a*](/phone/#n3m0) was [purchased on sale](/updates-2022-q4/) for $299 in late 2022. It came with the *Tensor G1*, served as my primary *GrapheneOS* device for roughly a year and a half, and was eventually relegated to *“spyware phone”* duty after I [upgraded to the *Pixel 8*](/updates-2024-q2/#nu-phone-who-dis).

As with every *Google* phone prior, the Pixel 6a battery life declined noticeably and the device eventually became part of *Google*’s *Battery Performance Program*, which, depending on how you look at it, was either a voluntary repair offer or an [opaque battery nerf](https://www.androidauthority.com/pixel-6a-battery-overheating-warning-3566640/) forced on owners via a mandatory update. In addition, the the charging port developed an [unstable connection](/updates-2026-q2/), which made charging frustrating and unreliable.

After roughly two years of daily use, the device became unusable enough for me to *downgrade* it to a backup device, only to finally toss it after only two more years.

**Note:** *Google*’s entire *A-series* has a documented track record of battery problems. The [*Pixel 4a*](https://consumerrights.wiki/w/User:Louis/Google_Pixel_4a_Battery_Performance_Program_eligibility_reversal) has been the subject of [a UK Office for Product Safety and Standards alert](https://www.nationalworld.com/business/consumer/google-pixel-smartphones-alert-4a-and-6a-risk-fire-battery-fault-5402640) for overheating and fire risk, the *Pixel 6a* has been the subject of multiple [melted-device reports](https://www.androidauthority.com/google-pixel-6a-battery-fire-3558501/) and was [pulled from *Google*’s refurbished store](https://www.androidpolice.com/google-quietly-pulls-fiery-pixel-6a-from-refurb-store/) after fire incidents, and the *Pixel 7a* has had its own [battery swelling repair program](https://www.androidpolice.com/pixel-7-7-pro-battery-swelling-more-reports/). *Google* has not initiated a proper recall in any of these cases.

### Pixel 8 ###

The [*Pixel 8*](/phone/#n4u7i1u5) replaced the *Pixel 6a* in mid-2024 after I came across [an unusually good tax-refunded deal](/updates-2024-q2/#nu-phone-who-dis). I have been running *GrapheneOS* on it from day one.

Within less than two years of moderate, careful use, this phone developed the [now-infamous *Pixel 8* *green-screen-of-death*](/updates-2026-q1/#google-pixel-8), a display defect that causes the screen to glitch with vertical green lines and flicker until you physically [squeeze the lower part of the chassis](https://piunikaweb.com/2024/04/08/pixel-8-green-screen-issue-workaround-hints-at-a-bigger-problem/). *Google* has, in a rare admission, extended the warranty on *Pixel 8* displays to three years specifically because of how widespread this defect is, while pointedly [not extending it to the *Pixel 8 Pro*](https://www.androidpolice.com/google-warranty-display-issues-pixel-8/) despite reports of the same problem on that model. However, because my device suffered a drop and hence has its backside glass shattered, as well as the adjacent corner scratched open, *Google* will blame the screen issue (in my case) on the impact and won’t grant me a free repair.

It’s also important to note that the lower portion of the device gets noticeably and uncomfortably hot under normal load, which is a known issue with the *Tensor G3* SoC and its [*Samsung Exynos 5300* modem](https://www.androidauthority.com/pixel-8-battery-drain-connectivity-issues-3381576/). In addition, the *Pixel* suffers from the [family’s connectivity issues](https://www.androidheadlines.com/2023/11/pixel-8-battery-drain-connectivity-issues.html), that had plagued the *Pixel 7* series already.

When I sat down to research a possible replacement (a *Pixel 9* or *Pixel 10*), the picture only got bleaker, but more on this in a moment.

**Note:** Probably the most maddening pet peeve that I have with the *Pixel 8* is its slippery surface. It is the only phone that I ever had that, no matter on what surface I put it, will eventually slide down without me interacting with it. Without stickers or protectors on its back the phone is **so** slippery that it will glide away from virtually any surface material. Put the *Pixel 8* on a smooth wooden table and it will move by itself over time. Put it on a rough wooden speaker box and it will fall over the edge halfway through the first song that’s playing. Put it on top of another smartphone and it will fall off sideways. Whenever I hear a hollow knock I already know that it was the *Pixel 8* randomly falling off of whatever surface I had put it on.

![The Marshall is made out of a rubbery material](/i-do-not-recommend-google-hardware/images/pixel-8-slide.gif)The Marshall is made out of a rubbery material

### Pixel Tablet ###

The [*Pixel Tablet*](/computer/#c4l1c0) joined the line-up in late 2024 specifically because it is the only tablet that *GrapheneOS* supports. I wrote a [relatively positive review](/de-googled-pixel-tablet-with-grapheneos-a-review/) of it at the time, with the significant caveat that it’s *“underpowered”* and not really suitable for anything more demanding than media consumption and light note-taking.

A year and a half later, that already-modest assessment has aged poorly. The device’s *Tensor G2*, which was already *two generations old* at the point *Google* shipped the tablet, has become noticeably sluggish as apps have continued to grow heavier. *Lightroom Mobile*, which was one of my primary reasons for buying it, runs with [random glitches, crashes and odd behaviour](/updates-2024-q4/), to the point where I’m looking to migrate my photography workflow once again to something else.

Also, it seems like the device developed some WiFi connectivity issue leading to specifically streamed content pausing/stuttering for around half a second before resuming for maybe another half a minute, only to then repeat this behavior. I don’t know whether this is a hardware issue or a *GrapheneOS* bug, but I’ve noticed this issue for now over a year.

Additionally, the battery life has degraded faster than anticipated, with editing workloads draining a full charge in under three hours even with the screen way below maximum brightness, and overall the tablet has [aged significantly faster than anticipated](/updates-2026-q2/), rendering it largely useless for any of the things I originally bought it for.

In short, *Google* shipped a 2023 tablet with a 2021 chip and a sealed battery, and in 2026 this has become **very** noticeable.

**Note:** These were only the *Google*-branded and -made devices that I owned, alongside a long list of other *Android* devices from *HTC*, *Sony*, *Samsung*, *OnePlus*, and even *OPPO*, that in all honesty weren’t exponentially better with regard to reliability and longevity.

It’s not just me
----------

It would be easy to write all of the above off as bad luck, so let me back up the personal experience with what is documented elsewhere.

### Battery (a.k.a. *the gift that keeps on giving*) ###

*Google*’s *A-series* phones in particular have, by now, a multi-generation track record of batteries that swell, overheat, or catch fire. The [*Pixel 4a*](https://www.youtube.com/watch?v=r6_1NxlvePU) was [included](https://www.nationalworld.com/business/consumer/google-pixel-smartphones-alert-4a-and-6a-risk-fire-battery-fault-5402640) in the UK *Office for Product Safety and Standards* alert for fire risk. *Google*’s *Battery Performance Program* nerfed the device’s battery via a mandatory update rather than acknowledging a hardware defect. The *Pixel 6* had reports of [battery swelling and off-gassing](https://farzanlaw.com/google-pixel-6-battery-swelling-and-off-gassing-reported-as-fire-hazard-risk/), with some users describing flame and smoke incidents. The *Pixel 6a* saw [multiple fire incidents](https://www.androidauthority.com/google-pixel-6a-battery-fire-3558501/), was [pulled from the refurbished store](https://www.androidpolice.com/google-quietly-pulls-fiery-pixel-6a-from-refurb-store/), and was subjected to the same *Battery Performance Program* as the *4a*. *Google* [restricted charge rate and capacity after 400 cycles](https://www.androidpolice.com/google-quietly-pulls-fiery-pixel-6a-from-refurb-store/) via forced OTA on July 8, 2025. The *Pixel 7* and *7 Pro* had [widespread swelling reports](https://www.androidpolice.com/pixel-7-7-pro-battery-swelling-more-reports/) less than three years post-launch. *Google*’s response has been described as *“inconsistent”* by [*Android Central*](https://www.androidcentral.com/phones/google-pixel/pixel-7-and-7-pro-battery-swelling-problem), with some users receiving free replacements and others being told to pay out of pocket. Oh, and the *Pixel 7a* has its [own repair program](https://www.androidpolice.com/pixel-7-7-pro-battery-swelling-more-reports/) for swollen batteries.

When the same failure mode shows up across five consecutive versions/generations of phones from the same vendor, *and* the vendor’s first response is to throttle charging rather than replace the cells, you’re no longer looking at bad luck but at a structural problem with battery sourcing, cell qualification, or thermal design.

### Green screen of death ###

I’ve mentioned my own *Pixel 8* display dying above. The [*Extended Repair Program*](https://support.google.com/pixelphone/answer/15009955?hl=en) that *Google* published in response covers *Pixel 8* devices that exhibit *“a vertical line running from the bottom of the display to the top or a display flicker”*, with coverage extended to three years post-purchase. *Pixel 8 Pro* owners with the [same vertical line defect](https://support.google.com/pixelphone/thread/413388200/) have not been so lucky and are largely on their own.

Manufacturers don’t extend warranties on a whim. *Google* extending warranties on the *Pixel 8* display by a factor of three is, in itself, the admission-of-a-defect that the company has otherwise tried to avoid in public.

### Modem and connectivity ###

Since the *Tensor G2*, *Google*’s *Pixel* flagships have been using a [*Samsung Exynos 5300* modem](https://www.androidauthority.com/pixel-8-battery-drain-connectivity-issues-3381576/) (and its successors) for cellular connectivity. This is the same modem family that has, generation after generation, been criticised for worse signal stability than the *Qualcomm* modems used by competitors, as well as significantly higher power consumption, especially on 5G, and [battery drain bugs](https://www.androidheadlines.com/2023/11/pixel-8-battery-drain-connectivity-issues.html) that essentially trade-off endurance for modem efficiency.

*Google*’s answer in the *Pixel 10* generation has been to switch to a [*MediaTek T900*](https://www.androidauthority.com/pixel-10-tensor-g5-benchmarks-3591999/), which according to early benchmarks is an improvement, but does not retroactively help any of the millions of *Pixel 6 / 7 / 8 / 9* owners who paid flagship prices for what was, by industry standards, a sub-par modem.

### Performance ###

*Google*’s *Tensor* chips were seemingly never designed to compete head-to-head with *Qualcomm* or *Apple* on raw CPU or GPU throughput, despite the pricing being in a similar range.

For example, the [*Snapdragon 8 Gen 3*](https://nanoreview.net/en/soc-compare/qualcomm-snapdragon-8-gen-3-vs-google-tensor-g3) is roughly 68% faster than the *Tensor G3* in *Geekbench 6* multi-core, and about 32% faster in single-core. In some graphics workloads, it’s roughly *twice* as fast.

The [*Apple A17 Pro*](https://nanoreview.net/en/soc-compare/google-tensor-g4-vs-apple-a17-pro) is nearly 50% faster than the *Tensor G4* in multi-core, and the *Pixel 9 Pro XL*’s *Tensor G4* [loses up to 50% of its sustained CPU performance](https://www.notebookcheck.net/Google-Pixel-9-Pro-XL-testing-reveals-Tensor-G4-thermal-throttling-with-50-performance-loss.876871.0.html) under thermal throttling, with the throttling kicking in within [three to four minutes of full load](https://wccftech.com/tensor-g4-in-pixel-9-pro-xl-poor-thermal-performance-throttles-easily/).

The *Pixel 10* and *Pixel 10 Pro*, powered by the *Tensor G5*, [score 3,707 in the Vulkan GPU benchmark](https://www.phonearena.com/news/pixel-10-pro-tensor-g5-gpu-benchmark_id173440), compared to 26,333 for the *Samsung Galaxy S25+*, which is a difference of roughly *7x*. Even the *Pixel 9 Pro*’s outgoing chip outperforms its successor at 9,023 points. In [*3DMark Wild Life Extreme*](https://www.androidauthority.com/pixel-10-tensor-g5-benchmarks-3591999/), neither the *Pixel 10* nor the *Pixel 10 Pro* break 20 FPS, while a *Snapdragon 8 Elite* device comfortably clocks 38 FPS. Hence, the *Snapdragon 8 Elite*-based *Galaxy S25* comfortably outscores the *Pixel 10* in [both single- and multi-core CPU performance](https://www.androidcentral.com/phones/google-pixel/google-tensor-g5), with the *S25* posting roughly *75% higher* multi-core scores.

If you want a single chart that summarises this, *Geekbench*’s [Android benchmarks page](https://browser.geekbench.com/android-benchmarks) is a good overview and shows that *Pixel* flagships do not appear anywhere near the top.

What this means in practice is that when you buy a *Pixel*, you are paying roughly the same money as you would for a *Samsung*, *OnePlus*, *Xiaomi*, or *Apple* flagship, but you are getting an SoC that is one and a half to two generations behind on raw compute, and even further behind on graphics. The phone *feels* snappy because Android is optimized for these chips and because *Google*’s AI use cases are accelerated by the *TPU*, but once you actually push the device, e.g. with raw photo editing, gaming, prolonged camera use, or pretty much anything that requires sustained performance, it falls behind quickly.

### Quality control ###

Beyond the *flagship* failures, *Pixel* devices have, generation after generation, shipped with a steady stream of quality-control issues that read more like *early-access hardware* than *flagship*. E.g. with the [*Pixel 8*](https://www.reddit.com/r/GooglePixel/comments/18zgmza/pixel_8_pro_factory_unlocked_bootloader_recall/), Google shipped a batch of factory-unlocked phones without the ability to relock the bootloader, requiring a return. Then we had the *Pixel 8* [*green screen* recall](https://www.reddit.com/r/GooglePixel/comments/1c3gcnz/pixel_8_green_screen_and_recall_terrible_customer/), which had been the precursor to the extended-warranty program, as well as the [*phantom touches*](https://support.google.com/pixelphone/thread/373191316/pixel-8-screen-lag-and-phantom-touches-seeking-help) issue, where intermittent ghost- touches were frequently dismissed by support as user error before being diagnosed as actual hardware problems.

The *Pixel 9 Pro XL* had its infamous *camera tilt* issue, where some users reported the 5x telephoto lens shipping physically tilted out of the box, and the *Pixel Tablet* had the *“check charging accessory”* issue, where the [charging dock dies surprisingly often](https://www.androidpolice.com/google-pixel-tablet-problems-solutions/), with troubleshooting steps that boil down to *“clean the contacts and hope for the best”*.

You can find an essentially endless stream of similar reports on [`r/GooglePixel`](https://www.reddit.com/r/GooglePixel/) and the official [*Pixel Phone Community*](https://support.google.com/pixelphone/community) forums and the pattern is always the same: A defect is reported, *Google*’s official support insists on app-uninstalls and factory resets, and after enough public outcry the defect is eventually quietly acknowledged via a support page, hidden so deep that probably won’t people won’t bother to look.

Why do people still buy them?
----------

Honestly, in my circle of people who care about privacy, the answer is almost always the same as mine, namely *because of GrapheneOS*. For everyone else, the answer is the camera and the *“AI features”*, plus a vague brand-loyalty to *Google* that exists for reasons I truly struggle to understand.

The camera is, to be fair, very good. *Google*’s computational photography pipeline is one of the few areas where the company’s *ML-first* approach to silicon pays off in a way the user actually notices. If you primarily care about point-and-shoot photography out of a phone, the *Pixel* camera is still near the top of the pile, even on the cheaper *A-series*.

Everything else, in my view, is not competitive with what *Samsung*, *Xiaomi*, *OnePlus*, *Nothing*, or *Apple* ship for the same money or, in some cases, less. You can [verify that](https://browser.geekbench.com/android-benchmarks) for yourself.

Hold off
----------

After my *Pixel 8* green-screened on me, my initial instinct was to do what I’ve always done and just replace it with the next *Pixel*. I spent a few weeks looking at deals on the *Pixel 9* and *Pixel 10*, reading through their respective issue threads on *Reddit*, looking at the benchmarks above, and decided that I simply don’t want to give *Google* any more of my money for what is, charitably put, garbage hardware sold at flagship prices.

The interesting development that makes this decision possible is that, on [March 2, 2026](https://motorolanews.com/motorola-three-new-b2b-solutions-at-mwc-2026/), at *MWC 2026*, [*Motorola* officially announced a partnership with the *GrapheneOS Foundation*](https://9to5google.com/2026/03/01/motorola-confirms-grapheneos-partnership-for-a-future-smartphone-porting-features/). This is the first time *GrapheneOS* will officially support a non-*Pixel* vendor, with availability expected to begin in 2027.

There is some uncertainty in all of this, though, as hardware schedules often slip and partnerships sometimes dissolve, and there’s no guarantee that the eventual *Motorola* device will meet *Graphene*’s requirements (verified boot, relockable bootloader, etc.) at a price point that’ll be remotely interesting to the average *GrapheneOS* user. There is also the risk that *Android 17* [turns into](https://www.youtube.com/watch?v=dXCCleAddEA) more of an *Intelligence System* launcher than an actual OS.

However, I’d rather wait six to twelve months and roll the dice on *Motorola* than spend another $800-$1000 on a phone that, by all available evidence, is statistically likely to develop a hardware defect shortly past its warranty window.

### Is Motorola any good? ###

The obvious follow-up question is whether existing *Motorola* hardware, like the *Edge* series, or the current *razr* line-up, is any good to begin with, since these broadly resemble what the eventual *GrapheneOS*-compatible devices are likely to be. Frankly, I have no idea.

The reviews of the [*Motorola Razr Ultra (2025)*](https://hothardware.com/reviews/motorola-razr-ultra-2025-review) seem relatively positive on durability. [*Android Central*’s one-year follow-up](https://www.androidcentral.com/phones/motorola/motorola-razr-ultra-2025-one-year-later) describes the display still looking *“like the day it was received”* after a year of regular use, with the major caveat that the *vegan leather* on the back has been peeling. Reviewers have called it *“Motorola’s best and most popular flagship phone thus far”*.

The [*Motorola Edge 60*](https://www.gsmarena.com/motorola_edge_60-review-2831.php) is even more interesting from a durability perspective. It carries an [*IP69* rating](https://www.notebookcheck.net/The-premium-smartphone-that-s-shifting-the-mid-range-benchmark-Motorola-Edge-60-review.1033195.0.html), which is above the *IP68* on the latest *Pixels* and means the device is certified against high-pressure, high-temperature water jets in addition to sustained submersion. *Motorola* also commits to three OS updates and four years of [security updates](https://www.techradar.com/phones/motorola-phones/motorola-edge-60-review), which is a little behind *Google*’s nominal *seven years* on the *Pixel*, but in line with the rest of the Android industry, and arguably more honest given that *Google*’s *seven years* are seemingly predicated on the device not [physically falling apart](https://www.androidpolice.com/pixel-7-7-pro-battery-swelling-more-reports/) in years two and three.

**Note:** I’ve started to believe that *Google*’s 7 years of updates is simply a marketing stunt and that the company knows that most of its hardware will fail well before users get even close to the seventh year. If you look up (used) offers for e.g. the now almost 7-year-old *Pixel 4a* on marketplaces like *eBay* you’ll find the offer to be surprisingly thin. Similarly, the slightly younger *5a* is also relatively hard to come by in good shape.

Older smartphones sustained above 80% of their original battery capacity for up to 500 charging cycles, which amounts to less than 3 years if you assume a full charge every two days, which is unrealistically generous especially for an *Android* device. Even if we assume that modern smartphones sustain 80% capacity for up to 1000 recharges and we use the generous two-day cycle, the phone will likely drop below 80% battery capacity within 5 and a half years. Again, that’s a very positive calculation that doesn’t take into account prolonged charging cycles (over night), environmental impacts (high heat or freezing cold) and arbitrary battery deterioration. A more realistic outlook is a drop below 80% within the device’s first three years.

It is also worth noting that at some point past the 80% mark degradation speeds up sharply and becomes roughly exponential, as Lithium plating, electrolyte depletion, and loss of active material compound on each other. This means that the drop from 80% capacity to 60% will happen significantly faster than the initial drop from 100% to 80%.

The 80% mark was deliberately chosen by manufacturers as it kind of marks the practical end of the stable region of the battery. Past that point, the phone will become less stable and show effects like sudden reboots, or at some point even shutdowns at around 30% indicated charge.

Compared to the *Pixel* line, *Motorola*’s 2025 hardware appears to have notably better water- and dust-ingress protection (*IP69* vs *IP68*), use *Qualcomm Snapdragon* silicon, which means, per the benchmarks above, meaningfully better raw performance and meaningfully better modem efficiency, have a build quality that holds up better through year-one stress tests, even on the foldable form factors that are notoriously hard to engineer, and are priced lower than the equivalent *Pixel Pro*, with the obvious caveat that the *razr ultra* at $1,300 is, in fact, [*a tough pill to swallow*](https://www.androidfaithful.com/motorola-razr-ultra-review-one-killer-feature-and-one-fatal-flaw/).

What it doesn’t appear to offer, at least yet, is the *Pixel*’s camera quality. Reviews of the *Edge 60* and *Edge 50 Ultra* are competent but not class-leading on the photography front. For someone who [uses a dedicated camera](/camera/) for serious photography and reserves the phone for documentary snapshots, this is a perfectly acceptable trade-off, but your mileage may vary.

In the meantime
----------

Until *GrapheneOS*-compatible *Motorola* hardware is actually on shelves, I’m going to keep using the *Pixel 8* with its [hardware workaround](https://piunikaweb.com/2024/04/08/pixel-8-green-screen-issue-workaround-hints-at-a-bigger-problem/) (yes, I’m literally squeezing the lower part of the chassis whenever the screen starts glitching) and avoid spending any more money on *Google* hardware. Unless the *Pixel 8* will **completely** die or become otherwise unusable I won’t be purchasing another *Google* device.

For anyone in a similar situation, my recommendation is to not upgrade if your current *Pixel* still works, and instead [hold on to it](/hold-on-to-your-hardware/). *Pixel* to *Pixel* generational improvements are marginal at best, and you’re almost certainly going to inherit a fresh set of defects with each new model. Also, [E-waste is a real concern](/google-pixel-9-released-the-best-time-to-upgrade-to-the-pixel-8-and-grapheneos/#ewaste), especially with [repairability scores](https://www.ifixit.com/repairability/smartphone-repairability-scores#smartphone-scores) below most *Apple* devices, particularly because of the extensive use of adhesives within *Pixel* phones.

If you **have to** get a replacement in the meantime, buy used or discounted. The *Pixel 8a* is occasionally available below *$300* refurbished, the *Pixel 9* is now in the same price band as the *Pixel 8* was a year ago, and the *Pixel 9a* is probably the best *affordable* entry point. Keep in mind that none of the historical hardware-defect patterns have spared the *Pro* models, but the *Pro* pricing has consistently included an *Apple*-level markup for what amounts to a bigger screen and one extra camera sensor. Hence I would avoid those variants.

If you can hold off on a phone purchase for another year or so, see how the *Motorola*/*GrapheneOS* situation develops. If the first compatible devices land at a reasonable price with an acceptable build quality, that will be the first *competitive* alternative to the *Pixel* line for privacy-conscious users.

If you’re a tech power-user, however, maybe consider Linux on mobile as a more radical alternative. I’ve been eyeing [*postmarketOS* on the *Fairphone 6*](/updates-2025-q3/#mobile-devices) for a while, as it appears to be making meaningful progress, but it is not yet a daily-driver experience and probably won’t be for another year or two. The *Pinephone* is [a dead end](/phone/#j0l1y), imho, but it seems like [*Ubuntu Touch*](https://www.youtube.com/watch?v=7rtuxo1Bw04) [is coming](https://www.youtube.com/watch?v=wTK6TS3pXgc) along nicely.

Bottom line
----------

*Google*’s consumer hardware is, in my unscientific but consistent personal experience, garbage. The *A-series* has a multi-generation track record of batteries that swell or catch fire. The *Pixel 8* has a display defect serious enough to introduce an extended warranty program. The *Pixel Tablet* shipped with a chip that was already two generations old. *Tensor*-based flagships are routinely outperformed by competitors at the same price point, and thermal-throttle hard enough under sustained load that the silicon is barely delivering half of its rated performance for any task longer than a few minutes.

I have given *Google* enough of my money over the past years. The only reason I have kept doing so is because of the community ROMs and, in the recent past, because of *GrapheneOS*, which I consider one of the most important pieces of consumer software in the privacy and security space today, that has been *Pixel*-only by hardware necessity. As of *MWC 2026*, that constraint has an end date however.

Until either *GrapheneOS*-compatible *Motorola* hardware actually ships, or *Linux on Mobile* becomes actually usable on a halfway modern device like the *Fairphone* (with replaceable battery), I am holding on to my *squeezable* *Pixel 8* and not buying anything else from *Google*. After that, I expect to never own another *Pixel* ever again.

**Note:** I deliberately picked the same title format as my [*I Do Not Recommend Bitwarden*](/i-do-not-recommend-bitwarden/) and [*I Do Not Recommend Proton Mail*](/i-do-not-recommend-proton-mail/) posts. The reason is the same in all three cases, which is that I used the product, in many cases over the course of years, recommended it to others in writing on this site, and have since come to a different conclusion. If your own experience has been different and you’re happily using a *Pixel* without issues, that’s great. This post is, in part, an updated honest disclosure of where I personally landed, and a counterweight to my own earlier, more positive reviews of these devices.