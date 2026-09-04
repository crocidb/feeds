+++
title = 'We Call It "Weather" Here'
description = "Even as my colleagues around Europe complain of a heat wave, things have been pretty much normal here–35<supo</supC outside, 27-ish inside, made tolerable only by the fact that I have minimized the number of active devices in my office (where the hottest things are probably my "
date = "2026-07-02T22:00:00Z"
url = "https://taoofmac.com/space/notes/2026/07/02/2200?utm_content=atom"
author = "Rui Carmo"
text = ""
lastupdated = "2026-07-03T12:11:18.796932722Z"
seen = false
+++

Even as my colleagues around Europe complain of a heat wave, things have been pretty much normal here–35<sup>o</sup>C outside, 27-ish inside, made tolerable only by the fact that I have minimized the number of active devices in my office (where the hottest things are probably my monitors and the ageing [Surface Pro 3](/space/links/2014/09/09/0706) that I use at my standing desk).

[

Borg Thermals
----------

](/space/notes/2026/07/02/2200#borg-thermals)

Which doesn’t mean things don’t get *too* hot. I woke up the other day to find that [`borg`](/space/blog/2023/02/18/1845) had halted at around 5AM, and I immediately suspected thermals, so, [again](/space/notes/2023/04/30/2130), I popped it open, swapped out the CPU fan (some things are so predictable I keep spares) and, while I did that, asked one of my agents to check telemetry–which, despite my best efforts, I’ve been neglecting to turn into alarms:

![That last spike is clearly where the fan started failing](https://taoofmac.com/media/notes/2026/07/02/2200/RxZjnkDGzs-oSBRHkRUJykPAy6Y=/chart.svg)That last spike is clearly where the fan started failing

It’s pretty obvious, even looking at the monthly data (which I pulled out to get an idea of the overall trend), that one of the fans started failing over the weekend–and it was the [Noctua NF-A9x14](https://www.amazon.es/gp/product/B009NQM7V2/ref=as_li_tl?_encoding=UTF8&tag=taoofmac-21&linkCode=ur2&camp=3638&creative=24630&utm_source=taoofmac.com&utm_medium=web&utm_campaign=unsolicited_traffic&utm_content=external_link) that I’ve been using for the CPU cooler.

[

Only Fans
----------

](/space/notes/2026/07/02/2200#only-fans)

Since those slim profile fans seem to die on me around every 18 months or so, this time I got an [Artic P9 Max](https://www.amazon.es/gp/product/B0D4YZFKP5/ref=as_li_tl?_encoding=UTF8&tag=taoofmac-21&linkCode=ur2&camp=3638&creative=24630&utm_source=taoofmac.com&utm_medium=web&utm_campaign=unsolicited_traffic&utm_content=external_link), on the spurious grounds that:

* It has a *much* higher CFM
* I can still fit a 25mm fan into the [B660](<https://www.asrock.com/Nettop/Intel/DeskMeet B660 Series/index.asp?utm_source=taoofmac.com&utm_medium=web&utm_campaign=unsolicited_traffic&utm_content=external_link>) (there’s enough clearance below the PSU)

It is, of course, *much* noisier, but we are in the middle of a heat wave and I expect it to throttle down eventually. Either way, I did get [another Noctua](https://www.amazon.es/gp/product/B07ZP6KKKZ/ref=as_li_tl?_encoding=UTF8&tag=taoofmac-21&linkCode=ur2&camp=3638&creative=24630&utm_source=taoofmac.com&utm_medium=web&utm_campaign=unsolicited_traffic&utm_content=external_link) to keep around as a spare, because fans are probably the only PC part that is cheap enough to keep a spare of these days…

While I waited for the new fan to arrive, I decided to whip up a [stupidly visible temperature monitor](https://gist.github.com/rcarmo/e82804e068751586b947ae7ad075c00a?utm_source=taoofmac.com&utm_medium=web&utm_campaign=unsolicited_traffic&utm_content=external_link) to keep an eye on it, and the results were… dramatic:

<img src="https://taoofmac.com/media/notes/2026/07/02/2200/VJ5KggUtsZAfyKArKMtI1QeoLIU=/beforeandafter.jpg" title="Before and after swapping the CPU fan." alt="Before and after swapping the CPU fan." width="2048" height="550" style="max-width: 100% !important;height: auto !important;">  Before and after, *and* it was hotter after.

I don’t expect this to be the last time I do this, but I hope it will at least be a while before I have to do it again. The [B660](<https://www.asrock.com/Nettop/Intel/DeskMeet B660 Series/index.asp?utm_source=taoofmac.com&utm_medium=web&utm_campaign=unsolicited_traffic&utm_content=external_link>) is an amazing motherboard/case combo, but it is not designed for high-performance cooling–or Portuguese weather.