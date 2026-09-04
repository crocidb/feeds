+++
title = "Cursed circuits #6: reverse avalanche oscillator"
description = "An oscillator so bad it's actually good. But seriously, it's still bad. But in a good way?"
date = "2026-07-09T06:50:21Z"
url = "https://lcamtuf.substack.com/p/cursed-circuits-6-reverse-avalanche"
author = "lcamtuf"
text = ""
lastupdated = "2026-07-09T12:05:17.095458863Z"
seen = false
+++

Last year, I published an article titled *“It’s hard to build an oscillator”*:

The title alluded to the fact that there’s no shortage of oscillator circuits on the internet, but many of them use unusual parts, need weird supply voltages, or don’t work well (if at all).

But sometimes, *bad* rises to an art form. Here’s probably the most puzzling bad oscillator you can assemble today with the parts you have at hand:

[

<img src="https://substackcdn.com/image/fetch/$s_!sRjx!,w_1456,c_limit,f_auto,q_auto:good,fl_progressive:steep/https%3A%2F%2Fsubstack-post-media.s3.amazonaws.com%2Fpublic%2Fimages%2F9f963d5f-ebc6-46e4-8324-983e69374080_2000x1487.jpeg" width="1456" height="1083" data-attrs="{&quot;src&quot;:&quot;https://substack-post-media.s3.amazonaws.com/public/images/9f963d5f-ebc6-46e4-8324-983e69374080_2000x1487.jpeg&quot;,&quot;srcNoWatermark&quot;:null,&quot;fullscreen&quot;:null,&quot;imageSize&quot;:null,&quot;height&quot;:1083,&quot;width&quot;:1456,&quot;resizeWidth&quot;:null,&quot;bytes&quot;:648997,&quot;alt&quot;:null,&quot;title&quot;:null,&quot;type&quot;:&quot;image/jpeg&quot;,&quot;href&quot;:null,&quot;belowTheFold&quot;:false,&quot;topImage&quot;:true,&quot;internalRedirect&quot;:&quot;https://lcamtuf.substack.com/i/206003669?img=https%3A%2F%2Fsubstack-post-media.s3.amazonaws.com%2Fpublic%2Fimages%2F9f963d5f-ebc6-46e4-8324-983e69374080_2000x1487.jpeg&quot;,&quot;isProcessing&quot;:false,&quot;align&quot;:null,&quot;offset&quot;:false}" class="sizing-normal" alt="" srcset="https://substackcdn.com/image/fetch/$s_!sRjx!,w_424,c_limit,f_auto,q_auto:good,fl_progressive:steep/https%3A%2F%2Fsubstack-post-media.s3.amazonaws.com%2Fpublic%2Fimages%2F9f963d5f-ebc6-46e4-8324-983e69374080_2000x1487.jpeg 424w, https://substackcdn.com/image/fetch/$s_!sRjx!,w_848,c_limit,f_auto,q_auto:good,fl_progressive:steep/https%3A%2F%2Fsubstack-post-media.s3.amazonaws.com%2Fpublic%2Fimages%2F9f963d5f-ebc6-46e4-8324-983e69374080_2000x1487.jpeg 848w, https://substackcdn.com/image/fetch/$s_!sRjx!,w_1272,c_limit,f_auto,q_auto:good,fl_progressive:steep/https%3A%2F%2Fsubstack-post-media.s3.amazonaws.com%2Fpublic%2Fimages%2F9f963d5f-ebc6-46e4-8324-983e69374080_2000x1487.jpeg 1272w, https://substackcdn.com/image/fetch/$s_!sRjx!,w_1456,c_limit,f_auto,q_auto:good,fl_progressive:steep/https%3A%2F%2Fsubstack-post-media.s3.amazonaws.com%2Fpublic%2Fimages%2F9f963d5f-ebc6-46e4-8324-983e69374080_2000x1487.jpeg 1456w" sizes="100vw" fetchpriority="high">

](https://substackcdn.com/image/fetch/$s_!sRjx!,f_auto,q_auto:good,fl_progressive:steep/https://substack-post-media.s3.amazonaws.com/public/images/9f963d5f-ebc6-46e4-8324-983e69374080_2000x1487.jpeg)*Reverse avalanche oscillator. Other small NPN transistors should also work.*

At first blush, *nothing here makes sense*. The transistor is upside down and its base terminal is not connected. And yet, the circuit works: hook it to a supply of about 14-20 V and watch the LED blink.

If you connect an oscilloscope to the terminals of the capacitor, you’ll see that the cap is repeatedly charging to about 10 V, then rapidly dumping some of the charge, all the way down to 9.1 V:

[

<img src="https://substackcdn.com/image/fetch/$s_!Dckq!,w_1456,c_limit,f_auto,q_auto:good,fl_progressive:steep/https%3A%2F%2Fsubstack-post-media.s3.amazonaws.com%2Fpublic%2Fimages%2F74991a47-2b02-469c-8c08-2f7a5e5c60b1_2346x1252.png" width="1456" height="777" data-attrs="{&quot;src&quot;:&quot;https://substack-post-media.s3.amazonaws.com/public/images/74991a47-2b02-469c-8c08-2f7a5e5c60b1_2346x1252.png&quot;,&quot;srcNoWatermark&quot;:null,&quot;fullscreen&quot;:null,&quot;imageSize&quot;:null,&quot;height&quot;:777,&quot;width&quot;:1456,&quot;resizeWidth&quot;:null,&quot;bytes&quot;:111859,&quot;alt&quot;:&quot;&quot;,&quot;title&quot;:null,&quot;type&quot;:&quot;image/png&quot;,&quot;href&quot;:null,&quot;belowTheFold&quot;:false,&quot;topImage&quot;:false,&quot;internalRedirect&quot;:&quot;https://lcamtuf.substack.com/i/206003669?img=https%3A%2F%2Fsubstack-post-media.s3.amazonaws.com%2Fpublic%2Fimages%2F74991a47-2b02-469c-8c08-2f7a5e5c60b1_2346x1252.png&quot;,&quot;isProcessing&quot;:false,&quot;align&quot;:null,&quot;offset&quot;:false}" class="sizing-normal" alt="" title="" srcset="https://substackcdn.com/image/fetch/$s_!Dckq!,w_424,c_limit,f_auto,q_auto:good,fl_progressive:steep/https%3A%2F%2Fsubstack-post-media.s3.amazonaws.com%2Fpublic%2Fimages%2F74991a47-2b02-469c-8c08-2f7a5e5c60b1_2346x1252.png 424w, https://substackcdn.com/image/fetch/$s_!Dckq!,w_848,c_limit,f_auto,q_auto:good,fl_progressive:steep/https%3A%2F%2Fsubstack-post-media.s3.amazonaws.com%2Fpublic%2Fimages%2F74991a47-2b02-469c-8c08-2f7a5e5c60b1_2346x1252.png 848w, https://substackcdn.com/image/fetch/$s_!Dckq!,w_1272,c_limit,f_auto,q_auto:good,fl_progressive:steep/https%3A%2F%2Fsubstack-post-media.s3.amazonaws.com%2Fpublic%2Fimages%2F74991a47-2b02-469c-8c08-2f7a5e5c60b1_2346x1252.png 1272w, https://substackcdn.com/image/fetch/$s_!Dckq!,w_1456,c_limit,f_auto,q_auto:good,fl_progressive:steep/https%3A%2F%2Fsubstack-post-media.s3.amazonaws.com%2Fpublic%2Fimages%2F74991a47-2b02-469c-8c08-2f7a5e5c60b1_2346x1252.png 1456w" sizes="100vw">

](https://substackcdn.com/image/fetch/$s_!Dckq!,f_auto,q_auto:good,fl_progressive:steep/https://substack-post-media.s3.amazonaws.com/public/images/74991a47-2b02-469c-8c08-2f7a5e5c60b1_2346x1252.png)*Capacitor charge state with a 14 V supply (5.8 Hz oscillation). By author.*

It’s no mystery that the capacitor must be charging via the 1 kΩ resistor from the positive supply rail. It’s also clear that the energy is dumped into the LED via the upside-down NPN transistor. But why?

To answer this, you’ll need a basic grasp of semiconductor junctions. If you’re rusty on how they work, this earlier article should jog your memory:

As a quick recap, a conventional diode consists of a *p-n* junction formed from two distinct types of semiconducting materials. At the boundary between these materials forms a non-conductive region known as the depletion layer. In forward bias — when a small positive voltage is applied to the *p*-side in relation to the *n*-side — the depletion layer is disrupted and charge carriers can cross.

In reverse bias, in contrast, the depletion region remains notionally impassable. That said, if the applied reverse voltage is high enough, the electrostatic field grows so strong that it can accelerate charges with sufficient force to knock electrons in the depletion region into the conduction band in an avalanche-like effect. This makes the junction conductive again:

[

<img src="https://substackcdn.com/image/fetch/$s_!LPd6!,w_1456,c_limit,f_auto,q_auto:good,fl_progressive:steep/https%3A%2F%2Fsubstack-post-media.s3.amazonaws.com%2Fpublic%2Fimages%2F45820cd0-c8c7-4f71-9da9-a424e2553b4e_2346x1563.png" width="1456" height="970" data-attrs="{&quot;src&quot;:&quot;https://substack-post-media.s3.amazonaws.com/public/images/45820cd0-c8c7-4f71-9da9-a424e2553b4e_2346x1563.png&quot;,&quot;srcNoWatermark&quot;:null,&quot;fullscreen&quot;:null,&quot;imageSize&quot;:null,&quot;height&quot;:970,&quot;width&quot;:1456,&quot;resizeWidth&quot;:null,&quot;bytes&quot;:73755,&quot;alt&quot;:null,&quot;title&quot;:null,&quot;type&quot;:&quot;image/png&quot;,&quot;href&quot;:null,&quot;belowTheFold&quot;:true,&quot;topImage&quot;:false,&quot;internalRedirect&quot;:&quot;https://lcamtuf.substack.com/i/206003669?img=https%3A%2F%2Fsubstack-post-media.s3.amazonaws.com%2Fpublic%2Fimages%2F45820cd0-c8c7-4f71-9da9-a424e2553b4e_2346x1563.png&quot;,&quot;isProcessing&quot;:false,&quot;align&quot;:null,&quot;offset&quot;:false}" class="sizing-normal" alt="" srcset="https://substackcdn.com/image/fetch/$s_!LPd6!,w_424,c_limit,f_auto,q_auto:good,fl_progressive:steep/https%3A%2F%2Fsubstack-post-media.s3.amazonaws.com%2Fpublic%2Fimages%2F45820cd0-c8c7-4f71-9da9-a424e2553b4e_2346x1563.png 424w, https://substackcdn.com/image/fetch/$s_!LPd6!,w_848,c_limit,f_auto,q_auto:good,fl_progressive:steep/https%3A%2F%2Fsubstack-post-media.s3.amazonaws.com%2Fpublic%2Fimages%2F45820cd0-c8c7-4f71-9da9-a424e2553b4e_2346x1563.png 848w, https://substackcdn.com/image/fetch/$s_!LPd6!,w_1272,c_limit,f_auto,q_auto:good,fl_progressive:steep/https%3A%2F%2Fsubstack-post-media.s3.amazonaws.com%2Fpublic%2Fimages%2F45820cd0-c8c7-4f71-9da9-a424e2553b4e_2346x1563.png 1272w, https://substackcdn.com/image/fetch/$s_!LPd6!,w_1456,c_limit,f_auto,q_auto:good,fl_progressive:steep/https%3A%2F%2Fsubstack-post-media.s3.amazonaws.com%2Fpublic%2Fimages%2F45820cd0-c8c7-4f71-9da9-a424e2553b4e_2346x1563.png 1456w" sizes="100vw" loading="lazy">

](https://substackcdn.com/image/fetch/$s_!LPd6!,f_auto,q_auto:good,fl_progressive:steep/https://substack-post-media.s3.amazonaws.com/public/images/45820cd0-c8c7-4f71-9da9-a424e2553b4e_2346x1563.png)*Breakdown in a 1N4148 diode. By author.*

An NPN transistor, as the name implies, is an *n-p-n* semiconductor structure that resembles two conjoined diodes. No matter whether we make the collector terminal or the emitter terminal more positive, one of these diodes is always reverse-biased; it follows that in the circuit we’re looking at, conduction should not occur.

At the same time, the reverse-biased junction that’s standing in the way is susceptible to avalanche breakdown if we supply a sufficiently high voltage. If the transistor is oriented the usual way — if the collector is more positive — the breakdown voltage for 2N2222 is around 50 V. But if we connect the component the other way around, the emitter-collector threshold is only a bit over 8 V. This is because the emitter area is doped more heavily (*n++)*. The depletion region formed in a heavily-doped semiconductor is thinner and easier to disrupt, so the emitter-side *n++-p* junction is an easier fight.

But that’s not all: this circuit won’t oscillate with an ordinary reverse-biased diode. There’s a point on the diode V-I curve where the charging current admitted through the 1 kΩ resistor matches the discharge current flowing through the diode, so the circuit would simply settle at that voltage.

The essence of what makes our circuit different is the following V-I plot painstakingly obtained for a reverse-biased NPN transistor with a floating base:

[

<img src="https://substackcdn.com/image/fetch/$s_!tiNK!,w_1456,c_limit,f_auto,q_auto:good,fl_progressive:steep/https%3A%2F%2Fsubstack-post-media.s3.amazonaws.com%2Fpublic%2Fimages%2F66819af7-57e7-441c-b17f-3edcc649a51b_2344x1563.png" width="1456" height="971" data-attrs="{&quot;src&quot;:&quot;https://substack-post-media.s3.amazonaws.com/public/images/66819af7-57e7-441c-b17f-3edcc649a51b_2344x1563.png&quot;,&quot;srcNoWatermark&quot;:null,&quot;fullscreen&quot;:null,&quot;imageSize&quot;:null,&quot;height&quot;:971,&quot;width&quot;:1456,&quot;resizeWidth&quot;:null,&quot;bytes&quot;:94351,&quot;alt&quot;:null,&quot;title&quot;:null,&quot;type&quot;:&quot;image/png&quot;,&quot;href&quot;:null,&quot;belowTheFold&quot;:true,&quot;topImage&quot;:false,&quot;internalRedirect&quot;:&quot;https://lcamtuf.substack.com/i/206003669?img=https%3A%2F%2Fsubstack-post-media.s3.amazonaws.com%2Fpublic%2Fimages%2F66819af7-57e7-441c-b17f-3edcc649a51b_2344x1563.png&quot;,&quot;isProcessing&quot;:false,&quot;align&quot;:null,&quot;offset&quot;:false}" class="sizing-normal" alt="" srcset="https://substackcdn.com/image/fetch/$s_!tiNK!,w_424,c_limit,f_auto,q_auto:good,fl_progressive:steep/https%3A%2F%2Fsubstack-post-media.s3.amazonaws.com%2Fpublic%2Fimages%2F66819af7-57e7-441c-b17f-3edcc649a51b_2344x1563.png 424w, https://substackcdn.com/image/fetch/$s_!tiNK!,w_848,c_limit,f_auto,q_auto:good,fl_progressive:steep/https%3A%2F%2Fsubstack-post-media.s3.amazonaws.com%2Fpublic%2Fimages%2F66819af7-57e7-441c-b17f-3edcc649a51b_2344x1563.png 848w, https://substackcdn.com/image/fetch/$s_!tiNK!,w_1272,c_limit,f_auto,q_auto:good,fl_progressive:steep/https%3A%2F%2Fsubstack-post-media.s3.amazonaws.com%2Fpublic%2Fimages%2F66819af7-57e7-441c-b17f-3edcc649a51b_2344x1563.png 1272w, https://substackcdn.com/image/fetch/$s_!tiNK!,w_1456,c_limit,f_auto,q_auto:good,fl_progressive:steep/https%3A%2F%2Fsubstack-post-media.s3.amazonaws.com%2Fpublic%2Fimages%2F66819af7-57e7-441c-b17f-3edcc649a51b_2344x1563.png 1456w" sizes="100vw" loading="lazy">

](https://substackcdn.com/image/fetch/$s_!tiNK!,f_auto,q_auto:good,fl_progressive:steep/https://substack-post-media.s3.amazonaws.com/public/images/66819af7-57e7-441c-b17f-3edcc649a51b_2344x1563.png)*V-I plot for 2N2222 at I<sub>B</sub> = 0. Dashed line: what we’d expect of a diode.*

The *n++-p-n* structure remains non-conductive until we reach about 8.2 V. But as soon as the “hump” is cleared, the conduction path begins to open up more in response to the current we’re pushing through. With 5 mA flowing through the junction, we need about 8 V to sustain the process; at 40 mA, we only need 7 V.

This curve rules out the possibility of a stable equilibrium for the circuit. The capacitor charges until it reaches the “hump”; at that point, some small discharge current starts flowing through the transistor, but the resistor, which lets through 10 mA, still more than makes up for the loss. The capacitor is decisively pushed into “dip” where the current skyrockets while allowing the voltage to taper off. But eventually, the capacitor voltage is too low to sustain the current, and because of the shape of the curve, that voltage is *even less able* to sustain lower currents. The transistor cuts off.

Some old-timers may recall that there’s another component that behaves the same way: the neon lamp. The lamp requires a higher starting (“striking”) voltage to ionize the gas, but once plasma is formed, you don’t need nearly as much. Neon lamps are uncommon today, but you can build a nearly-identical oscillator with one.

To be clear, everything about this oscillator is terrible! It requires a fairly high supply voltage, it’s inefficient, it requires a beefy capacitor, and it has awful duty cycle and frequency stability. But it’s a good reminder that semiconductors are complicated beasts: the circuit is using the part of the V-I curve that isn’t even shown in most books.

---

*Some other articles in the series:*

*I write about electronics, [the foundations of mathematics](https://lcamtuf.substack.com/p/monkeys-typewriters-and-busy-beavers), [the history of technology](https://lcamtuf.substack.com/p/a-brief-history-of-counting-stuff), and other geek interests. If you like it, please subscribe.*

[Subscribe now](https://lcamtuf.substack.com/subscribe?)