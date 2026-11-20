+++
title = "Notes for November 9–13"
description = "Boy, what a week.To begin with, thanks to the inauspicious alignment of [a couple of depressions](https://observador.pt/2026/11/09/charles-a-nova-tempestade-que-se-aproxima-de-portugal-pode-ser-mais-intensa-que-bruna-e-os-dois-sistemas-vao-sobrepor-se/?utm_campaign=unsolicited_tr"
date = "2026-11-13T20:34:00Z"
url = "https://taoofmac.com/space/notes/2026/11/13/2034?utm_content=atom"
author = "Rui Carmo"
text = ""
lastupdated = "2026-11-19T14:05:19.597415849Z"
seen = false
+++

Boy, what a week.

To begin with, thanks to the inauspicious alignment of [a couple of depressions](https://observador.pt/2026/11/09/charles-a-nova-tempestade-que-se-aproxima-de-portugal-pode-ser-mais-intensa-que-bruna-e-os-dois-sistemas-vao-sobrepor-se/?utm_campaign=unsolicited_traffic&utm_medium=web&utm_source=taoofmac.com) (weather ones, for a change), the weather was miserable enough that I barely left the house, which I am only rating positively because it prevented me from attending [Web Summit](https://websummit.com/?utm_campaign=unsolicited_traffic&utm_medium=web&utm_source=taoofmac.com) and its sycophantic, utterly divorced from reality hype fest.

[

WetSummit Was The Best Summit
----------

](/space/notes/2026/11/13/2034#wetsummit-was-the-best-summit)

As it turns out, [the Portuguese government decided to shutter schools and non-essential public services](https://www.abola.pt/noticias/depressao-charles-escolas-e-servicos-nao-essenciais-fechados-na-quarta-feira-2026111009151420961?utm_campaign=unsolicited_traffic&utm_medium=web&utm_source=taoofmac.com) and we all stayed home on Wednesday. Luckily, depression Charles [took a more southerly track than forecast](https://www.ipma.pt/pt/media/noticias/news.detail.jsp?f=Depressao_charles.html&utm_campaign=unsolicited_traffic&utm_medium=web&utm_source=taoofmac.com&y=2026) (making for a day of intense but otherwise very much non-tropical rainstorms here), but by that time “WetSummit” had shut down for the day, and it was probably its best yet.

This may sound harsh given it was indeed a great event when it came to Lisbon and that (if I had made it there) it would be a rare opportunity to actually meet some people I haven’t seen in years, but I just can’t sit through another talk on how X is going to transform the world (for any value of X, especially AI). It has become genuinely impossible to sort out the wheat from the chaff in startup land over the past couple of years unless a) you know their team or b) you know, from your personal experience, that they are trying to solve an actual problem.

[

Civic Responsibility Is Cool
----------

](/space/notes/2026/11/13/2034#civic-responsibility-is-cool)

Either way, I don’t blame the government for doing the responsible thing–the forecasts on Tuesday looked *really* bad (to the point where we battened down the hatches and I planned for both Internet and power outages):

<img src="/space/notes/2026/11/13/2034/image.png?v=3206e04428b5" alt="Windy weather forecast the day before, showing a depression off Lisbon and strong winds along the coast" width="1805" height="1097"> I don’t care about the politics, but watching commentators complain that the economy was shut down for a day is both predictable and proof that we have the worst kind of *intelligentsia* in the political sphere–the exact same people would be gleefully harping on about floods and disaster response failures if the worst had come to pass.

The trend over the past decade (as I perceive it) is that the weather here is becoming sub-tropical in the unstable sense (i.e., bigger swings in rainfall, temperature, etc.), so I’m happy to see prevention being enacted.

As an aside, a part of this trend I am increasingly concerned with is that my back and neck certainly *feel* it when this kind of weather swings by, and it’s only likely to get worse.

[

Work and Industry
----------

](/space/notes/2026/11/13/2034#work-and-industry)

Work-wise, like atmospheric pressure, things were also highly unstable: I got involved in a pretty amazing new project even as other things reached an astonishing new low (with barely a glimmer of light at the end of any of those tunnels), and that was just, well, Monday.

Fortunately, [the Jensen Huang soap opera](https://www.theverge.com/podcast/1032866/jensen-huang-nvidia-china-trump-vergecast?utm_campaign=unsolicited_traffic&utm_medium=web&utm_source=taoofmac.com) has provided ample entertainment of the most fascinating kind. What other industry might even dream of attaining such peak intensity of scandal and drama week upon week, I do not know, but this timeline is *even better* than a William Gibson novel right now: (checks notes) wars, mad dictators, almighty industrialists, critical technology developments, minor cataclysms, we have it all. Sometimes two of each!

And, of course, [the M365 outage](https://edition.cnn.com/2026/11/12/business/live-news/microsoft-global-outage-intl-hnk?utm_campaign=unsolicited_traffic&utm_medium=web&utm_source=taoofmac.com) was a somewhat apt way to both start Friday 13th and make it obvious that in between that and a touch of fever/migraines, should just pack it in early and throw these notes together.

[

Older Toys Are The Best
----------

](/space/notes/2026/11/13/2034#older-toys-are-the-best)

With all this, my brain felt an unusually high compulsion to do a bit of exploration, so I tinkered late into a couple of evenings and built [`rexweb`](https://github.com/rcarmo/rexweb?utm_campaign=unsolicited_traffic&utm_medium=web&utm_source=taoofmac.com), which combines ideas from [Rex](https://superlogical.com/?utm_campaign=unsolicited_traffic&utm_medium=web&utm_source=taoofmac.com) and [`webterm`](https://github.com/rcarmo/webterm?utm_campaign=unsolicited_traffic&utm_medium=web&utm_source=taoofmac.com) and gives you a web front-end to multiple persistent terminal sessions using a vaguely compliant approximation of the `rex` protocol, specced out to my agents by means of what I can only classify as interpretive dance.

In short, I felt compelled to flip some of the assumptions of both on their heads and figure out if terminal multiplexing was a thing I actually needed done in that particular way, but at least I had a good design to mimic.

The jury is still out on how useful it all is, but back in the early 90s, I would dial into my college VAX using a 2400 bps modem and multiplex LAT sessions using some long-forgotten abomination that allowed me to do Kermit file transfers and have independent terminal windows (not too many, obviously) on Windows/286–so I highly appreciate how far we’ve come, but at the same time it’s fascinating to see how we keep reinventing some wheels…