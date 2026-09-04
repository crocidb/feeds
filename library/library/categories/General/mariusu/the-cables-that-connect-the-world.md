+++
title = "The Cables that Connect the World"
description = "We treat the internet as if it were air, ambient and ownerless, when in reality, however, it is the exact opposite. This is a look at what connects the world, and who builds and owns that infrastructure."
date = "2026-08-24T12:12:00Z"
url = "https://xn--gckvb8fzb.com/the-cables-that-connect-the-world/"
author = "marius@xn--gckvb8fzb.com (Marius)"
text = ""
lastupdated = "2026-08-24T15:49:16.024689159Z"
seen = false
+++

At the northeastern edge of *La Línea de la Concepción*, on a scrubby Mediterranean beach called *El Burgo–Torrenueva*, there is an old battlement-tower, *La Torre Nueva*, and not much else. It was part of the system of coastal watchtowers during the 16th century that would defend the area against the incursion of the [Barbary corsairs](https://en.wikipedia.org/wiki/Barbary_corsairs). The coordinates are `36°12′36″N, 5°19′27″W`. Walk the tideline and you would never know that buried two metres beneath the sand, a fibre-optic cable comes out of the sea here and turns into the internet. It’s the start of a line that runs across the *Strait of Gibraltar* to *Ceuta*, on the African coast, and on toward two continents. Nearly everything you do online that crosses an ocean passes through a cable like this, ending, in most cases, underneath a similarly unremarkable patch of coast.

**Note:** *Ceuta* is an interesting place by itself, that has recently gained some attention and that would also make for an interesting write-up of its own. However, the tl;dr is that it is an autonomous Spanish city of some 85,000 people sitting on the North African coast, bordering *Morocco*, which means the *European Union* has one of its very few land borders with the African continent running straight through a peninsula most people could probably not even point to on a map.

It has been held by the Spanish crown since 1668, it had been Portuguese before that, and *Morocco* seemingly never stopped claiming it. For our purposes, though, what matters is that the small enclave, until very recently, hung off the mainland’s network by a single ageing link.

[![](/the-cables-that-connect-the-world/images/img_1566_hu_638bfc7e967fb066.webp)](/the-cables-that-connect-the-world/images/img_1566.jpg)

When we talk about *the internet* we do so as if it were air. Ambient, ownerless, and everywhere. In reality, however, it is the exact opposite, because international data doesn’t (normally) travel by, let’s say, satellite, despite what most people might assume. It travels through roughly 1.5 million kilometres of very real (and very owned) fibre-optic cable lying on the seabed, surfacing at a small number of carefully chosen landing points.

For these landing points you normally need a gently sloping seabed, mild currents, and little marine traffic, so that anchors and trawlers don’t sever the line. Suitable spots are scarce enough that the same beach usually becomes the shared landfall for several cable systems at once.

Cables? What cables?
----------

[![](/the-cables-that-connect-the-world/images/submarine_cable_hu_b5edf3d9cb318f08.webp)](https://en.wikipedia.org/wiki/File:Submarine_cable_cross-section_3D_plain.svg)

Unlike what you might be thinking of at first, [submarine cables](https://en.wikipedia.org/wiki/Submarine_communications_cable) aren’t your run-of-the-mill Ethernet or fibre cable. The hardware that does the heavy lifting out in the deep ocean is about as thick as a garden hose with roughly 25mm across and weighing in at around 1.4 tonnes for every kilometre. The part that carries your data is a small bundle of glass fibres, each one around the same thickness as human hair, sitting in the very middle.

Everything else wrapped around those fibres is there to keep them alive in a deeply hostile environment. Working outward from the core, the fibres sit in a water-blocking gel inside a thin copper or aluminium tube, which is sheathed in polycarbonate, then an aluminium water barrier, then a layer of stranded steel wires that give the cable its tensile strength, then a wrap of mylar tape, and finally an outer skin of polyethylene. The copper is for power, because the cable doubles as a very long extension lead, which we will get to in a moment. Closer to shore, where trawlers and anchors roam, the whole thing gets one or two further jackets of galvanised steel armour wire, swelling it to 50mm or more in diameter and several times the weight. Hence, the cable that surfaces on our Spanish beach is buried a couple of metres down and not simply left lying on the sand.

The reason a copper conductor runs the entire length is that light, no matter how pure the glass, slowly fades as it travels, and so every 50 to 80 kilometres the cable is interrupted by a *repeater*, which is an optical amplifier that boosts the signal back up before passing it along. Each repeater needs electricity, and because the fish sadly still didn’t manage to install power sockets on the ocean floor, the shore stations at either end have to feed a direct current of anywhere between 3,000 and 15,000 volts down that copper core, to literally power the cable from both ends at once.

On top of the amplification, modern systems lean on a stack of clever tricks to keep the signal intelligible across thousands of kilometres of glass, including wavelength-division multiplexing to cram many separate colours of light down a single fibre, coherent detection to read them back out, and forward error correction to repair whatever gets garbled along the way.

Length, then, is mostly a question of power and amplification rather than of the glass itself. Shorter hops can dispense with repeaters entirely, hence an *unrepeatered* span will happily run to around 250 kilometres on amplifiers at each end alone, which is roughly the length of the line we started this post with. At the other extreme, a single system can stretch across an ocean, and the longest of them, like the *2Africa* cable encircling the continent it is named after, run to tens of thousands of kilometres.

Who is laying cables?
----------

[![](/the-cables-that-connect-the-world/images/img_1569_hu_2057cf0d1d7940c4.webp)](/the-cables-that-connect-the-world/images/img_1569.jpg)

The actual manufacturing and laying of these cables is, perhaps a little surprising for something the entire global economy rests on, the business of only a small handful of companies. The bulk of the world’s submarine cable is built and installed by just four suppliers, namely the American *SubCom*, the French *Alcatel Submarine Networks*, the Japanese *NEC*, and the Chinese *HMN Technologies*. They own and operate the specialised fleet of cable-laying ships, which aren’t exactly the kind of boat you would recognise from a harbour, but more like a purpose-built vessel carrying thousands of kilometres of cable coiled in enormous tanks below deck, rolling it out over the stern at a steady walking pace as they crawl across the ocean.

Deploying a new system is a multi-year effort that begins long before any ship leaves port. First somebody, these days increasingly a content giant rather than a phone company, decides a route is worth having and assembles the money for it, either alone or as a consortium of several owners sharing the bill. Then comes a marine survey, in which a ship maps the intended path along the seabed to find the gentlest, safest route around wrecks, trenches, and other people’s cables, followed by the permitting, which is the paperwork of securing landing rights and concessions from every jurisdiction the cable so much as touches. As we are about to see on the Spanish beach, this can generate a remarkable quantity of [bureaucracy](/bureaucracy-is-eating-the-world/).

Only once all that is settled does the cable get manufactured to length, loaded onto the ship, and laid, with the vessel simply lowering it onto the seabed in deep water and a sea plough burying it a metre or two beneath the sediment closer to shore, where the danger from fishing and anchors is greatest. A working ship covers somewhere in the region of 100 to 200 kilometres a day, so an ocean crossing takes several weeks at sea.

A transatlantic system running some 7,000 kilometres typically costs in the order of 250 million USD, while a longer trans-Pacific route can easily climb towards 400 million, and the cable itself runs anywhere from roughly 6,000 to 20,000 dollars per kilometre, depending on how many fibre pairs it carries and how heavily it is armoured. Keep in mind that the spending does not stop once the cable is lit, because a submarine cable has a design life of only around 20 to 25 years and on top of that there are somewhere between 150 and 200 faults occurring across the world’s cables in a typical year. The overwhelming majority of them are not caused by sabotage or sharks, but by the combination of fishing gear and dragged ship anchors. Each break has to be mended by sending out one of a small number of dedicated repair ships, that are on permanent standby under regional maintenance agreements, to grapple the cable up off the seabed, haul both severed ends to the surface, splice them back together, and lower the repaired thing back down. This is slow and weather-dependent work that is quite expensive.

[![](/the-cables-that-connect-the-world/images/taste_hu_4b3d7cf7c6852046.webp)](/the-cables-that-connect-the-world/images/taste.jpg)

Who owns the cables?
----------

With the data provided by [*TeleGeography*’s *Submarine Cable Map*](https://www.submarinecablemap.com) I have put together a list of the (co-)owners of undersea cables and sorted it by the number of cables each individual company has a stake in. The full dataset runs to some 473 distinct owners, the overwhelming majority of which are obscure national and regional carriers you will never have heard of, so rather than just dumping the entire list here, I limited it to the hundred most prolific (co-)owners:

|                    (Co-)Owner                    |\# of Cables|
|--------------------------------------------------|------------|
|                      Google                      |     34     |
|                      Orange                      |     29     |
|                        BT                        |     22     |
|                     Sparkle                      |     22     |
|                     Vodafone                     |     20     |
|                       Meta                       |     19     |
|                 Telekom Malaysia                 |     19     |
|                 Liberty Networks                 |     18     |
|                     Singtel                      |     18     |
|               Tata Communications                |     18     |
|                 Telkom Indonesia                 |     18     |
|                       AT&T                       |     17     |
|                    Telefonica                    |     17     |
|                  China Telecom                   |     16     |
|                 Chunghwa Telecom                 |     16     |
|                       NTT                        |     15     |
|                     Telstra                      |     15     |
|                  Telecom Egypt                   |     14     |
|                     XLSmart                      |     14     |
|                   China Mobile                   |     13     |
|                   China Unicom                   |     13     |
|                  GlobalConnect                   |     13     |
|                     Arelion                      |     12     |
|                EXA Infrastructure                |     12     |
|                     Verizon                      |     12     |
|                        e&                        |     11     |
|                        KT                        |     10     |
|                   Moratelindo                    |     10     |
|                     Softbank                     |     10     |
|                     Telxius                      |     10     |
|                 Altice Portugal                  |     9      |
|                     center3                      |     9      |
|                       KDDI                       |     9      |
|                 National Telecom                 |     9      |
|                       PCCW                       |     9      |
|                  Bharti Airtel                   |     8      |
|                  Globe Telecom                   |     8      |
|                       PLDT                       |     8      |
|                      Telin                       |     8      |
|            Zain Omantel International            |     8      |
|                 Djibouti Telecom                 |     7      |
|              GCI Communication Corp              |     7      |
|                 Indosat Ooredoo                  |     7      |
|                Mauritius Telecom                 |     7      |
|                    Microsoft                     |     7      |
|                    Rostelecom                    |     7      |
|                       Colt                       |     6      |
|      Entidade Administradora da Faixa (EAF)      |     6      |
|                 Hawaiian Telcom                  |     6      |
|                      Setar                       |     6      |
|                    TDC Group                     |     6      |
|                   TIME dotCom                    |     6      |
|                    Triasmitra                    |     6      |
|               Viettel Corporation                |     6      |
|                       Zayo                       |     6      |
|               Amazon Web Services                |     5      |
|                     Bayobab                      |     5      |
|                      Camtel                      |     5      |
|                       Cyta                       |     5      |
|                     Dhiraagu                     |     5      |
|                    euNetworks                    |     5      |
|                       FLAG                       |     5      |
|                   Grid Telecom                   |     5      |
|         Liquid Intelligent Technologies          |     5      |
|                  Maroc Telecom                   |     5      |
|                     Ooredoo                      |     5      |
|                       OPT                        |     5      |
|               OPT French Polynesia               |     5      |
|                Sri Lanka Telecom                 |     5      |
|               Telkom South Africa                |     5      |
|              América Móvil (Claro)               |     4      |
|                  Antel Uruguay                   |     4      |
|                   Bell Canada                    |     4      |
|         Bharat Sanchar Nigam Ltd. (BSNL)         |     4      |
|               Bulk Infrastructure                |     4      |
|     Lebanese Ministry of Telecommunications      |     4      |
|  Libya International Telecommunications Company  |     4      |
|                      Mobily                      |     4      |
|                Okinawa Prefecture                |     4      |
|                 Ooredoo Maldives                 |     4      |
|     Pakistan Telecommunications Company Ltd.     |     4      |
|              Reliance Jio Infocomm               |     4      |
|                     Starhub                      |     4      |
|                      SUBCO                       |     4      |
|     Syrian Telecommunications Establishment      |     4      |
|                     Tampnet                      |     4      |
|                    TeleYemen                     |     4      |
|         Unified National Networks (UNN)          |     4      |
|                VNPT International                |     4      |
|               Vocus Communications               |     4      |
|                 Whidbey Telecom                  |     4      |
|                 Algerie Telecom                  |     3      |
|                  Angola Cables                   |     3      |
|Australia’s Academic and Research Network (AARNET)|     3      |
|        Bahamas Telecommunications Company        |     3      |
|        Bandwidth and Cloud Services (BCS)        |     3      |
|Bangladesh Submarine Cable Company Limited (BSCCL)|     3      |
|                    BW Digital                    |     3      |
|             Cabo Verde Telecom (CVT)             |     3      |
|                      CANTV                       |     3      |

**Note:** These figures are derived from the public *Submarine Cable Map* data, counting both, systems already in service, and those still planned or under construction (603 of the former, 91 of the latter, at the time of writing). The `owners` field is free-form text, so a few owners turn up under more than one spelling, and I had to do a little manual untangling of company names.

What jumps out, at least to me, is the name sitting right at the top. For most of the history of this infrastructure the owners were telephone companies, the \_BT\_s and \_AT&T\_s and \_NTT\_s of the world, laying cables to carry one another’s calls and, later, traffic. *Google* now has a stake in more submarine cables than any traditional carrier on the planet, with *Meta* not far behind, and *Microsoft* and *Amazon* both slowly accumulating their own share. The companies that fill those cables with traffic have, over the past decade or so, decided that they would rather own the pipes than rent them.

The other thing the numbers tell you is just how long the tail is. Of those 473 owners, some 260 appear on exactly one cable, and more than 340 of them, north of seventy percent, on no more than two. These are the world’s national telecoms, each one buying a slice of the handful of consortium cables that happen to land on its particular stretch of coast, which is also why so many of the big international systems list a dozen or more co-owners apiece. The internet, seen from this angle, is less of a single network and more of a mix of local operators, all chipping in for a share of the same few very expensive ropes across the ocean.

Going back to the beach in Spain
----------

[![](/the-cables-that-connect-the-world/images/img_1567_hu_3ab6e65e7da5b843.webp)](/the-cables-that-connect-the-world/images/img_1567.jpg)

To see what it looks like where the cable actually meets the land, let’s head back to that beach in *La Línea*.

The cable that surfaces there is called *Dos Continentes*, it belongs to [*GTD*, a Chilean telecoms group](https://es.wikipedia.org/wiki/Grupo_Gtd), and it’s a relatively small regional system consisting of two armoured fibre cables looping across the *Strait of Gibraltar* to *Ceuta*, the Spanish enclave on the African coast that depended on a single ageing link before this one was built.

I went looking for exactly where it comes ashore, and the paper trail gives an idea about how *invisible* this infrastructure actually is. The cable lands in Spain, but the [public Spanish government map of coastal concessions](https://sig.miteco.gob.es/dpmt/) doesn’t seem to show it, because it looks like coastal permits in *Andalusia* are devolved to the regional government. The landfall instead shows in a [regional registry](http://www.juntadeandalucia.es/medioambiente/publiweb/RCL), in a signed resolution buried under an *expediente* number. That document pinpoints where the cable enters the public maritime domain, at grid reference `X=290,935, Y=4,009,603`, just seaward of the beach manhole. The cable then runs inland, buried as the permit insists (*“no exterior element above ground level”*) to what is presumably a network node, where traffic is fed into *GTD*’s pre-existing terrestrial dark-fibre network, from where it’ll eventually travel to one of the actual *GTD* data centres in *Madrid*, *Barcelona*, *Bilbao/Sopelana*, and *Sevilla*.

On its way out to sea it crosses three older cables already lying on the seabed, namely *Europe India Gateway*, *ATLAS*, and *FLAG*. As can be seen (or, well, actually not) even an empty-looking patch of water off a Spanish beach is layered with other people’s infrastructure.

**Note:** When *GTD* applied, it seems that the town council of *La Línea* formally objected and asked them to drop the project. The cable, the council said, cut straight through the main local fishing ground, *“splitting it literally in two”*, threatening the small shellfish and *trasmallo* boats that work those waters, and a protected limpet that lives on the rocks, in a town whose fleet was already squeezed by run-ins with Gibraltar over fishing rights. However, they were overruled and the concession was granted anyway, with mitigation conditions attached, for an initial fifteen years.

The *Dos Continentes* cable (*Segment I*, *La Línea - Ceuta Sur ramal*), owned by *GTD Cableado de Redes Inteligentes, S.L.U.*, the Spanish arm of the Chilean *GTD group*, has a total length of \~105 km and is in service since 2020 under the signed concession resolution from the *Junta de Andalucía* (*Dirección General de Calidad Ambiental y Cambio Climático*), *expediente* `CNC02/19/CA/0009`, dated 14 January 2020.

The two key points, as given in the resolution’s coordinate table are:

|                           Point                           | UTM X |  UTM Y  |
|-----------------------------------------------------------|-------|---------|
|    Arqueta / beach manhole (BMH, in servidumbre zone)     |290,929|4,009,602|
|Entrada en DPMT (cable crosses into public maritime domain)|290,935|4,009,603|

**Note:** The resolution’s prose text gives a slightly different value that disagrees with its own table by approximately 140m.

To convert the UTM coordinates I used the official *Instituto Geográfico Nacional* (*IGN*) [*Calculadora Geodésica*](https://ign.es/web/calculadora-geodesica) with the following settings:

* Transformation type: *Transformación de Datum*
* Reference system: *ETRS89*
* Input coordinates: *UTM*
* *Huso* (zone): *30*

`ETRS89` and `WGS84` differ by only centimetres in practice, so the resulting coordinates (WGS84-equivalent) can be dropped straight into any consumer map or GPS app:

|                                  Point                                   |          Lat/long (DMS)           |       Decimal        |                                                                                 Map links                                                                                 |
|--------------------------------------------------------------------------|-----------------------------------|----------------------|---------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
|Beach manhole *(the buried structure, navigate here to stand on the spot)*|`36° 12′ 31.25″ N, 5° 19′ 32.41″ W`|`36.208681, −5.325669`|[Google Maps](https://www.google.com/maps?q=36.208681,-5.325669) · [OpenStreetMap](https://www.openstreetmap.org/?mlat=36.208681&mlon=-5.325669#map=18/36.208681/-5.325669)|
|  DPMT entry point *(waterline crossing, \~6 m seaward of the manhole)*   |`36° 12′ 31.29″ N, 5° 19′ 32.17″ W`|`36.208692, −5.325603`|[Google Maps](https://www.google.com/maps?q=36.208692,-5.325603) · [OpenStreetMap](https://www.openstreetmap.org/?mlat=36.208692&mlon=-5.325603#map=18/36.208692/-5.325603)|

Both points sit on *Playa de El Burgo–Torrenueva*, beside the *Punta de Torrenueva* tower, at the northeastern (*Levante* / Mediterranean-facing) edge of *La Línea de la Concepción*, against the municipal boundary. The resolution describes the route as passing *“muy cerca de la torre-faro existente en la Punta de Torre Nueva”*.

[![](/the-cables-that-connect-the-world/images/img_1568_hu_ce15d2677b371430.webp)](/the-cables-that-connect-the-world/images/img_1568.jpg)

As you can see, however, you see nothing. :-) The permit requires the whole installation to be subterranean (*“no exterior element above ground level: No manholes, splices, connections or terminals.”*), hence you can stand exactly on the landfall, but it’s a point in the sand by a tower, and not a structure. On the afternoon I was there, a couple of dozen people were spread out on that stretch of sand under parasols, probably not even knowing that somewhere underneath them the link that carries an entire enclave’s traffic to another continent came out of the sea.

It is interesting to see that what has changed most over the past decade isn’t the technology itself, but who pays for it. For a century these systems were built by carriers selling capacity to one another, which made the network something close to a shared utility with many owners. Today, however, the largest (co-)owner of submarine cable on the planet is an advertising company. It probably makes sense in their position, however it is a change in how the network is governed, and, more importantly, it seems to have happened almost entirely out of public view, which is worrying.

If you live anywhere near a coast, there is a decent chance one of these things lands within driving distance of you, and the *TeleGeography* map will get you to roughly the right bay. Getting from there to the actual patch of sand takes some amount of digging through concession resolutions, planning registers, environmental reports, and sometimes the local newspaper archive. It took me an evening of reading to narrow it down, but I can recommend to do this exercise if you’re curious about the world that you’re living in and, more importantly, the hidden infrastructure surrounding you.

**PS:** Maybe we picked the wrong word and should have called it *the trench* rather than *the cloud*?