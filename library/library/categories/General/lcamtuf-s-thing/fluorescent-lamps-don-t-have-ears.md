+++
title = "Fluorescent lamps (don’t) have ears"
description = "Welcome to this week’s edition of the Journal of Negative Results"
date = "2026-09-01T07:20:56Z"
url = "https://blog.coredump.cx/p/fluorescent-lamps-dont-have-ears"
author = "lcamtuf"
text = ""
lastupdated = "2026-09-01T19:33:13.868513806Z"
seen = false
+++

I never mentioned it publicly, but early in my career, I did a part-time stint in *technical surveillance countermeasures* (TSCM) — a fancy term for sweeping office environments in search of listening devices and other unauthorized spy gear. In practice, the job entailed getting several certifications, hauling around a bunch of costly suitcases, and above all, spending some time with ex-spooks, listening to stories that would make James Bond blush.

The discipline is rather hush-hush, so you never know what’s real. One of the more striking claims I remember from the training was that fluorescent lamps could be used to passively eavesdrop on conversations in the room. This makes some sense: the tubes are filled with glowing gas. A sound wave propagating through this medium could theoretically produce subtle luminosity fluctuations that could be picked from afar.

To be clear, long-distance optical audio pickup is real: if you shine a laser at a pane of glass or other reflective surface, sound-induced vibrations can be picked up by measuring the angle of the reflected beam; in favorable conditions, this supposedly works at distances in excess of 100 m (330 ft). Far less practically, a [Black Hat presentation in 2020](https://ad447342-c927-414a-bbae-d287bde39ced.filesusr.com/ugd/a53494_443addc922e048d89a664c2423bf43fd.pdf) demonstrated the ability to passively recover audio by placing a beefy speaker 1 cm away from a dangling lightbulb and then watching the motion of the lightbulb via a telescope from about 25 m (80 ft).

The lightbulb research made it to The Wall Street Journal; this blog post won’t. Never mind that, though: the claim about fluorescent lamps seems physically plausible, but is true? When you think about it, there are some red flags. First, the gas in the tube is kept at about 1/200th of atmospheric pressure. It’s nearly vacuum — not exactly a good medium for sound waves. Second, the glowing gas emits UV, which needs to be converted to visible light using an opaque phosphor layer that covers the inside of the tube and exhibits strong afterglow. Wouldn’t that coating mask any momentary, localized changes in luminosity?…

After two short decades, I couldn’t take it anymore and decided to run a test. My initial plan was to tape a photodiode directly to the tube, connect the sensor into a low-noise amplifier, and then view the resulting waveform on an oscilloscope. But that seemed like an overkill, so I eventually opted for a simpler approach: I placed the lamp next to a high-intensity sound source — a 200 W audio system hooked up to a signal generator and cranked all the way up — and then took a series of high-speed, up-close photos with a shutter of 1/8000 s. I figured that if powerful sound waves from a nearby source don’t produce visible artifacts in raw 14-bit images captured with a top-of-the-line camera, the odds of the scheme working in practice were minimal.

But first, I needed to power the tube. Traditional fluorescent lamps rely on thermionic emission to get going: there’s a pair of terminals on each end that connects to an internal heater coil. Once the coil is heated to a glow, it becomes easier for thermally-excited electrons to dart off into the void in response to an externally-applied electromotive force. In this respect, the device is similar to a vacuum tube.

[

<img src="https://substackcdn.com/image/fetch/$s_!hhet!,w_1456,c_limit,f_auto,q_auto:good,fl_progressive:steep/https%3A%2F%2Fsubstack-post-media.s3.amazonaws.com%2Fpublic%2Fimages%2Fbe78a92e-d913-463c-97a0-64c9bde133ca_2000x576.jpeg" width="1456" height="419" data-attrs="{&quot;src&quot;:&quot;https://substack-post-media.s3.amazonaws.com/public/images/be78a92e-d913-463c-97a0-64c9bde133ca_2000x576.jpeg&quot;,&quot;srcNoWatermark&quot;:null,&quot;fullscreen&quot;:null,&quot;imageSize&quot;:null,&quot;height&quot;:419,&quot;width&quot;:1456,&quot;resizeWidth&quot;:null,&quot;bytes&quot;:323981,&quot;alt&quot;:null,&quot;title&quot;:null,&quot;type&quot;:&quot;image/jpeg&quot;,&quot;href&quot;:null,&quot;belowTheFold&quot;:false,&quot;topImage&quot;:true,&quot;internalRedirect&quot;:&quot;https://blog.coredump.cx/i/212485160?img=https%3A%2F%2Fsubstack-post-media.s3.amazonaws.com%2Fpublic%2Fimages%2Fbe78a92e-d913-463c-97a0-64c9bde133ca_2000x576.jpeg&quot;,&quot;isProcessing&quot;:false,&quot;align&quot;:null,&quot;offset&quot;:false}" class="sizing-normal" alt="" srcset="https://substackcdn.com/image/fetch/$s_!hhet!,w_424,c_limit,f_auto,q_auto:good,fl_progressive:steep/https%3A%2F%2Fsubstack-post-media.s3.amazonaws.com%2Fpublic%2Fimages%2Fbe78a92e-d913-463c-97a0-64c9bde133ca_2000x576.jpeg 424w, https://substackcdn.com/image/fetch/$s_!hhet!,w_848,c_limit,f_auto,q_auto:good,fl_progressive:steep/https%3A%2F%2Fsubstack-post-media.s3.amazonaws.com%2Fpublic%2Fimages%2Fbe78a92e-d913-463c-97a0-64c9bde133ca_2000x576.jpeg 848w, https://substackcdn.com/image/fetch/$s_!hhet!,w_1272,c_limit,f_auto,q_auto:good,fl_progressive:steep/https%3A%2F%2Fsubstack-post-media.s3.amazonaws.com%2Fpublic%2Fimages%2Fbe78a92e-d913-463c-97a0-64c9bde133ca_2000x576.jpeg 1272w, https://substackcdn.com/image/fetch/$s_!hhet!,w_1456,c_limit,f_auto,q_auto:good,fl_progressive:steep/https%3A%2F%2Fsubstack-post-media.s3.amazonaws.com%2Fpublic%2Fimages%2Fbe78a92e-d913-463c-97a0-64c9bde133ca_2000x576.jpeg 1456w" sizes="100vw" fetchpriority="high">

](https://substackcdn.com/image/fetch/$s_!hhet!,f_auto,q_auto:good,fl_progressive:steep/https://substack-post-media.s3.amazonaws.com/public/images/be78a92e-d913-463c-97a0-64c9bde133ca_2000x576.jpeg)*A conceptual sketch of a fluorescent lamp.*

For the 9” tube I purchased, the heater needed a current of about 200 mA at 16 V. I opted for DC operation to minimize AC-induced flicker, so it was sufficient to heat just the negative side. With that done, the terminals on each end would be shorted and a voltage of roughly 70-80 V would be applied across the device. This voltage is enough for plasma to form; from that point on, the current must be capped to about 180 mA at \~35 V.

Here’s a quick video showing the process of manually starting the lamp:

<iframe src="https://player.vimeo.com/video/1222872992?autoplay=0&amp;h=cd9386f34a" frameborder="0" gesture="media" allow="autoplay; fullscreen" allowautoplay="true" allowfullscreen="true" loading="lazy"></iframe>

I’ll spare you the dozens of rapid-shutter photos I’ve taken while playing back different audio frequencies: they show nothing at all. These non-results are summarized more concisely in the following video of a wide-frequency audio sweep originating from an array of speakers directly to the right:

<iframe src="https://player.vimeo.com/video/1222872993?autoplay=0&amp;h=88fb9428e9" frameborder="0" gesture="media" allow="autoplay; fullscreen" allowautoplay="true" allowfullscreen="true" loading="lazy"></iframe>

I really wanted to believe the claim. Maybe someone else can still “prove” it; pump the volume up even higher, use a larger tube, take absurdly precise measurements. But in terms of a practical attack, I think the myth is busted. Sorry, Mr. Bond?

[Subscribe now](https://blog.coredump.cx/subscribe?)