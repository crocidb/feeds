+++
title = "Negative resistance"
description = "Hello! The blog you’re trying to reach is currently unavailable."
date = "2026-07-23T22:55:51Z"
url = "https://lcamtuf.substack.com/p/negative-resistance"
author = "lcamtuf"
text = ""
lastupdated = "2026-07-28T12:42:20.771081701Z"
seen = false
+++

*Hello! The blog you’re trying to reach is currently unavailable. I am Skippy, your friendly blog assistant. How can I help you today?*

`> quit `

*I’m sorry. This function is currently available only to Skippy Premium and Premium+ subscribers. Would you like to talk about ✨ **negative resistance** instead?*

`> nope`

*I’m sorry. This function is currently available only to Skippy Premium and Premium+ subscribers.*

Welcome. Welcome again. If you tinker with analog electronics, you might have heard that some circuits can exhibit *negative resistance*. This is usually followed by a current-to-voltage plot featuring some sort of a kinked curve and an assertion that this property might help the circuit designer in some way.

But what does it mean, exactly? The concept of negative resistance is interesting, counterintuitive, and explained on Wikipedia in a rather rambling way. If you’re up for it, I think we can do better than that.

*The article assumes familiarity with voltage, current, and the behavior of operational amplifiers. If you need a refresher, [start with this primer](https://lcamtuf.substack.com/p/primer-core-concepts-in-electronic), then read up about transistors [here](https://lcamtuf.substack.com/p/how-do-transistors-work-anyway) and signal amplification [here](https://lcamtuf.substack.com/p/the-basics-of-signal-amplification).*

### Defining resistance ###

As a quick recap, resistance (R) can be understood as the opposition to the flow of steady current through some portion of the circuit. The quantity describes the relationship between the applied electromotive force — that’s voltage — and the amount of charge moving per second (that’s current).

In contrast to some other phenomena in electronic circuits, resistance is not inherently dependent on time or signal frequency. If you know the voltage (V) applied to a purely-resistive component, the current (I) flowing at that exact moment is simply:

In *resistors,* the parameter remains constant across a wide range of operating conditions. This means that if we plot I in relation to V, we get a straight line that crosses through the center of the coordinate system. The slope of the line depends only on the component’s resistance:

[

<img src="https://substackcdn.com/image/fetch/$s_!O5bP!,w_1456,c_limit,f_auto,q_auto:good,fl_progressive:steep/https%3A%2F%2Fsubstack-post-media.s3.amazonaws.com%2Fpublic%2Fimages%2Fed4a3f2b-4a55-4043-b5c2-d51cff396d46_2346x1563.png" width="1456" height="970" data-attrs="{&quot;src&quot;:&quot;https://substack-post-media.s3.amazonaws.com/public/images/ed4a3f2b-4a55-4043-b5c2-d51cff396d46_2346x1563.png&quot;,&quot;srcNoWatermark&quot;:null,&quot;fullscreen&quot;:null,&quot;imageSize&quot;:null,&quot;height&quot;:970,&quot;width&quot;:1456,&quot;resizeWidth&quot;:null,&quot;bytes&quot;:85893,&quot;alt&quot;:null,&quot;title&quot;:null,&quot;type&quot;:&quot;image/png&quot;,&quot;href&quot;:null,&quot;belowTheFold&quot;:true,&quot;topImage&quot;:false,&quot;internalRedirect&quot;:&quot;https://lcamtuf.substack.com/i/205698096?img=https%3A%2F%2Fsubstack-post-media.s3.amazonaws.com%2Fpublic%2Fimages%2Fed4a3f2b-4a55-4043-b5c2-d51cff396d46_2346x1563.png&quot;,&quot;isProcessing&quot;:false,&quot;align&quot;:null,&quot;offset&quot;:false}" class="sizing-normal" alt="" srcset="https://substackcdn.com/image/fetch/$s_!O5bP!,w_424,c_limit,f_auto,q_auto:good,fl_progressive:steep/https%3A%2F%2Fsubstack-post-media.s3.amazonaws.com%2Fpublic%2Fimages%2Fed4a3f2b-4a55-4043-b5c2-d51cff396d46_2346x1563.png 424w, https://substackcdn.com/image/fetch/$s_!O5bP!,w_848,c_limit,f_auto,q_auto:good,fl_progressive:steep/https%3A%2F%2Fsubstack-post-media.s3.amazonaws.com%2Fpublic%2Fimages%2Fed4a3f2b-4a55-4043-b5c2-d51cff396d46_2346x1563.png 848w, https://substackcdn.com/image/fetch/$s_!O5bP!,w_1272,c_limit,f_auto,q_auto:good,fl_progressive:steep/https%3A%2F%2Fsubstack-post-media.s3.amazonaws.com%2Fpublic%2Fimages%2Fed4a3f2b-4a55-4043-b5c2-d51cff396d46_2346x1563.png 1272w, https://substackcdn.com/image/fetch/$s_!O5bP!,w_1456,c_limit,f_auto,q_auto:good,fl_progressive:steep/https%3A%2F%2Fsubstack-post-media.s3.amazonaws.com%2Fpublic%2Fimages%2Fed4a3f2b-4a55-4043-b5c2-d51cff396d46_2346x1563.png 1456w" sizes="100vw" loading="lazy">

](https://substackcdn.com/image/fetch/$s_!O5bP!,f_auto,q_auto:good,fl_progressive:steep/https://substack-post-media.s3.amazonaws.com/public/images/ed4a3f2b-4a55-4043-b5c2-d51cff396d46_2346x1563.png)*Resistor I = V/R plots for R = 0.2, 1, and 5* Ω.

For example, in a 5 Ω resistor (blue line), the current is 200 mA if the voltage across the terminals is 1 V, rising to 1 A if the electromotive force increases to 5 V.

Some other components, such as diodes and transistors, oppose the flow of current in a manner that depends on the applied voltage. We can still model their behavior using the concept of resistance, but we don’t get a constant reading. In an [earlier article](https://lcamtuf.substack.com/p/things-you-can-do-with-diodes), I provided a V-I curve for a small diode; if we take these measurements and calculate the effective R by rearranging the earlier equation (*I = V / R* ⇒ *R = V / I*), we obtain the log-scale V-to-R plot shown on the right:

[

<img src="https://substackcdn.com/image/fetch/$s_!ZJJx!,w_1456,c_limit,f_auto,q_auto:good,fl_progressive:steep/https%3A%2F%2Fsubstack-post-media.s3.amazonaws.com%2Fpublic%2Fimages%2F06eae046-7700-4bce-862a-8b120dcf0edb_2969x1250.png" width="1456" height="613" data-attrs="{&quot;src&quot;:&quot;https://substack-post-media.s3.amazonaws.com/public/images/06eae046-7700-4bce-862a-8b120dcf0edb_2969x1250.png&quot;,&quot;srcNoWatermark&quot;:null,&quot;fullscreen&quot;:null,&quot;imageSize&quot;:null,&quot;height&quot;:613,&quot;width&quot;:1456,&quot;resizeWidth&quot;:null,&quot;bytes&quot;:140665,&quot;alt&quot;:null,&quot;title&quot;:null,&quot;type&quot;:&quot;image/png&quot;,&quot;href&quot;:null,&quot;belowTheFold&quot;:true,&quot;topImage&quot;:false,&quot;internalRedirect&quot;:&quot;https://lcamtuf.substack.com/i/205698096?img=https%3A%2F%2Fsubstack-post-media.s3.amazonaws.com%2Fpublic%2Fimages%2F06eae046-7700-4bce-862a-8b120dcf0edb_2969x1250.png&quot;,&quot;isProcessing&quot;:false,&quot;align&quot;:null,&quot;offset&quot;:false}" class="sizing-normal" alt="" srcset="https://substackcdn.com/image/fetch/$s_!ZJJx!,w_424,c_limit,f_auto,q_auto:good,fl_progressive:steep/https%3A%2F%2Fsubstack-post-media.s3.amazonaws.com%2Fpublic%2Fimages%2F06eae046-7700-4bce-862a-8b120dcf0edb_2969x1250.png 424w, https://substackcdn.com/image/fetch/$s_!ZJJx!,w_848,c_limit,f_auto,q_auto:good,fl_progressive:steep/https%3A%2F%2Fsubstack-post-media.s3.amazonaws.com%2Fpublic%2Fimages%2F06eae046-7700-4bce-862a-8b120dcf0edb_2969x1250.png 848w, https://substackcdn.com/image/fetch/$s_!ZJJx!,w_1272,c_limit,f_auto,q_auto:good,fl_progressive:steep/https%3A%2F%2Fsubstack-post-media.s3.amazonaws.com%2Fpublic%2Fimages%2F06eae046-7700-4bce-862a-8b120dcf0edb_2969x1250.png 1272w, https://substackcdn.com/image/fetch/$s_!ZJJx!,w_1456,c_limit,f_auto,q_auto:good,fl_progressive:steep/https%3A%2F%2Fsubstack-post-media.s3.amazonaws.com%2Fpublic%2Fimages%2F06eae046-7700-4bce-862a-8b120dcf0edb_2969x1250.png 1456w" sizes="100vw" loading="lazy">

](https://substackcdn.com/image/fetch/$s_!ZJJx!,f_auto,q_auto:good,fl_progressive:steep/https://substack-post-media.s3.amazonaws.com/public/images/06eae046-7700-4bce-862a-8b120dcf0edb_2969x1250.png)*Apparent resistance of a small diode (1N4148), log vertical scale.*

For a chosen point of the *V-I* curve, we can also calculate so-called *differential resistance*. This parameter doesn’t tell us anything about the overall relationship between voltage and current; instead, it models the relative response to small deviations from the chosen baseline. For example, in the vicinity of 1.2 V on the plot above, the slope of the V-I curve is such that a change of Δ*v* = +/- 10 mV causes the current to change by Δ*i =* +/- 20 mA. If we divide Δ*v* by Δ*i* and squint our eyes hard enough, we can say that the “local” resistance is 500 mΩ. Again, that number has nothing to do with the bulk resistance of the diode at 1.2 V, but it’s a useful abstraction for modeling what happens to small signals that are piggybacking on top of a constant bias voltage.

In physical terms, resistance is associated with the consumption of energy. We’re making an effort to push charges through; some of the energy is absorbed by the medium and then taken out of the picture — turned into heat, light, motion, or captured in chemical bonds.

To model these dynamics, we need to tap into the official definition of voltage. It’s the amount of energy (E, in joules) we’re willing to expend to move the unit of electrical charge (Q, in coulombs, equal to about 6.2 quintillion electrons):

We also need the definition of current; as noted earlier, it’s the amount of charge that’s moved per second through a point in the circuit:

We can rearrange the second equation to solve for Q (*Q = I · t*), and then shuffle the first one to solve for E (*E = V · Q*). Combining these forms, we get *E = V · I · t*.

Finally, we tap into the physical definition of power (P, watts); it’s the rate at which energy is expended:

If we plug the earlier *E = V · I · t* formula into the fundamental power equation, we obtain:

That’s to say, the amount of electrical power consumed by an electronic circuit depends on the supplied voltage, the resulting current, and nothing else. For resistive circuits, we can further substitute *I = V / R* and get:

So, a resistive element consumes energy provided by the power supply at a rate that’s proportional to the square of the applied voltage, and inversely proportional to the component’s resistance. For example, a 220 Ω resistor subjected 10 V will dissipate about 455 mW as heat.

### True negative resistance ###

This brings us to an interesting question: what would it mean for a component to have a resistance of less than 0 ohms?

Well, we can start by stating the obvious: if R is negative and *I = V / R*, then the current-to-voltage plot will have a downward slope. For example, for R = -5 Ω, we’d get the following:

[

<img src="https://substackcdn.com/image/fetch/$s_!XEAb!,w_1456,c_limit,f_auto,q_auto:good,fl_progressive:steep/https%3A%2F%2Fsubstack-post-media.s3.amazonaws.com%2Fpublic%2Fimages%2Fffc0d1d9-328f-4964-968b-a01e21686cca_2346x1252.png" width="1456" height="777" data-attrs="{&quot;src&quot;:&quot;https://substack-post-media.s3.amazonaws.com/public/images/ffc0d1d9-328f-4964-968b-a01e21686cca_2346x1252.png&quot;,&quot;srcNoWatermark&quot;:null,&quot;fullscreen&quot;:null,&quot;imageSize&quot;:null,&quot;height&quot;:777,&quot;width&quot;:1456,&quot;resizeWidth&quot;:null,&quot;bytes&quot;:62292,&quot;alt&quot;:null,&quot;title&quot;:null,&quot;type&quot;:&quot;image/png&quot;,&quot;href&quot;:null,&quot;belowTheFold&quot;:true,&quot;topImage&quot;:false,&quot;internalRedirect&quot;:&quot;https://lcamtuf.substack.com/i/205698096?img=https%3A%2F%2Fsubstack-post-media.s3.amazonaws.com%2Fpublic%2Fimages%2Fffc0d1d9-328f-4964-968b-a01e21686cca_2346x1252.png&quot;,&quot;isProcessing&quot;:false,&quot;align&quot;:null,&quot;offset&quot;:false}" class="sizing-normal" alt="" srcset="https://substackcdn.com/image/fetch/$s_!XEAb!,w_424,c_limit,f_auto,q_auto:good,fl_progressive:steep/https%3A%2F%2Fsubstack-post-media.s3.amazonaws.com%2Fpublic%2Fimages%2Fffc0d1d9-328f-4964-968b-a01e21686cca_2346x1252.png 424w, https://substackcdn.com/image/fetch/$s_!XEAb!,w_848,c_limit,f_auto,q_auto:good,fl_progressive:steep/https%3A%2F%2Fsubstack-post-media.s3.amazonaws.com%2Fpublic%2Fimages%2Fffc0d1d9-328f-4964-968b-a01e21686cca_2346x1252.png 848w, https://substackcdn.com/image/fetch/$s_!XEAb!,w_1272,c_limit,f_auto,q_auto:good,fl_progressive:steep/https%3A%2F%2Fsubstack-post-media.s3.amazonaws.com%2Fpublic%2Fimages%2Fffc0d1d9-328f-4964-968b-a01e21686cca_2346x1252.png 1272w, https://substackcdn.com/image/fetch/$s_!XEAb!,w_1456,c_limit,f_auto,q_auto:good,fl_progressive:steep/https%3A%2F%2Fsubstack-post-media.s3.amazonaws.com%2Fpublic%2Fimages%2Fffc0d1d9-328f-4964-968b-a01e21686cca_2346x1252.png 1456w" sizes="100vw" loading="lazy">

](https://substackcdn.com/image/fetch/$s_!XEAb!,f_auto,q_auto:good,fl_progressive:steep/https://substack-post-media.s3.amazonaws.com/public/images/ffc0d1d9-328f-4964-968b-a01e21686cca_2346x1252.png)*A plot of constant negative resistance.*

It would appear that if we apply a positive voltage to a “negistor”, we should get a current that’s proportional to the voltage but with an opposite sign. The natural flow of conventional current is from the more positive side to the more negative one, but in this instance, it must be flowing the other way round.

Alas, a negistor can’t exist unless it’s equipped with an external power source. Recall our derivation of the power dissipation formula: *P = V<sup>2</sup>* */* *R*. In this equation, if *R* is negative, so is the consumed power. This implies that the component would need to extract energy from its surroundings and put it back into the circuit.

On the other hand, if we allow an external power supply, a circuit with constant negative resistance can be constructed pretty easily:

[

<img src="https://substackcdn.com/image/fetch/$s_!W9Zv!,w_1456,c_limit,f_auto,q_auto:good,fl_progressive:steep/https%3A%2F%2Fsubstack-post-media.s3.amazonaws.com%2Fpublic%2Fimages%2Fe3c7915c-c715-4e08-98bf-9e584d29db88_2450x1495.jpeg" width="1456" height="888" data-attrs="{&quot;src&quot;:&quot;https://substack-post-media.s3.amazonaws.com/public/images/e3c7915c-c715-4e08-98bf-9e584d29db88_2450x1495.jpeg&quot;,&quot;srcNoWatermark&quot;:null,&quot;fullscreen&quot;:null,&quot;imageSize&quot;:null,&quot;height&quot;:888,&quot;width&quot;:1456,&quot;resizeWidth&quot;:null,&quot;bytes&quot;:815356,&quot;alt&quot;:null,&quot;title&quot;:null,&quot;type&quot;:&quot;image/jpeg&quot;,&quot;href&quot;:null,&quot;belowTheFold&quot;:true,&quot;topImage&quot;:false,&quot;internalRedirect&quot;:&quot;https://lcamtuf.substack.com/i/205698096?img=https%3A%2F%2Fsubstack-post-media.s3.amazonaws.com%2Fpublic%2Fimages%2Fe3c7915c-c715-4e08-98bf-9e584d29db88_2450x1495.jpeg&quot;,&quot;isProcessing&quot;:false,&quot;align&quot;:null,&quot;offset&quot;:false}" class="sizing-normal" alt="" srcset="https://substackcdn.com/image/fetch/$s_!W9Zv!,w_424,c_limit,f_auto,q_auto:good,fl_progressive:steep/https%3A%2F%2Fsubstack-post-media.s3.amazonaws.com%2Fpublic%2Fimages%2Fe3c7915c-c715-4e08-98bf-9e584d29db88_2450x1495.jpeg 424w, https://substackcdn.com/image/fetch/$s_!W9Zv!,w_848,c_limit,f_auto,q_auto:good,fl_progressive:steep/https%3A%2F%2Fsubstack-post-media.s3.amazonaws.com%2Fpublic%2Fimages%2Fe3c7915c-c715-4e08-98bf-9e584d29db88_2450x1495.jpeg 848w, https://substackcdn.com/image/fetch/$s_!W9Zv!,w_1272,c_limit,f_auto,q_auto:good,fl_progressive:steep/https%3A%2F%2Fsubstack-post-media.s3.amazonaws.com%2Fpublic%2Fimages%2Fe3c7915c-c715-4e08-98bf-9e584d29db88_2450x1495.jpeg 1272w, https://substackcdn.com/image/fetch/$s_!W9Zv!,w_1456,c_limit,f_auto,q_auto:good,fl_progressive:steep/https%3A%2F%2Fsubstack-post-media.s3.amazonaws.com%2Fpublic%2Fimages%2Fe3c7915c-c715-4e08-98bf-9e584d29db88_2450x1495.jpeg 1456w" sizes="100vw" loading="lazy">

](https://substackcdn.com/image/fetch/$s_!W9Zv!,f_auto,q_auto:good,fl_progressive:steep/https://substack-post-media.s3.amazonaws.com/public/images/e3c7915c-c715-4e08-98bf-9e584d29db88_2450x1495.jpeg)*Negative resistance converter.*

If you’re rusty on operational amplifiers, now would be the time to [revisit an earlier feature](https://lcamtuf.substack.com/p/the-basics-of-signal-amplification) on this blog. Otherwise, the analysis can be simplified by assuming that R<sub>1</sub> is large enough so that both the op-amp output pin and the signal source can supply worst-case currents via this path without causing their voltages to sag.

This assumption allows us to ignore R<sub>1</sub> for the initial part of the analysis: on a voltage basis, the circuit is just a textbook non-inverting amplifier with the gain determined by the bottom 22 kΩ / 22 kΩ voltage divider. You can find the derivation of the circuit’s gain in the linked article, but the bottom line is that if the resistors in the divider are the same, then the amplifier’s gain is 2×, so *V<sub>out</sub>* ≈ 2 · *V<sub>signal</sub>*.

We can now come back to R<sub>1</sub>: the left terminal of the resistor is connected to *V<sub>signal </sub>*while the right terminal sits at *V<sub>out</sub>* ≈ 2 · *V<sub>signal</sub>*. From this, we can apply the fundamental *I = V / R* formula to calculate the current flowing through the component:

This current must be flowing into or out of the signal source because there’s nowhere else for it to go: the input of the op-amp has a very high impedance.

The placement of the minus sign is inconsequential, we can also rewrite the equation as:

In other words, the circuit behaves the same as a negative resistance -R<sub>1</sub> placed between *V<sub>signal</sub>* and the ground. We can confirm this on the following empirical V-I plot, captured for R<sub>1</sub> = 220 Ω and an op-amp supply of 5 V:

[

<img src="https://substackcdn.com/image/fetch/$s_!nLIh!,w_1456,c_limit,f_auto,q_auto:good,fl_progressive:steep/https%3A%2F%2Fsubstack-post-media.s3.amazonaws.com%2Fpublic%2Fimages%2F76d2e96e-e8e6-4f80-b2e7-6e24089da934_2344x1563.png" width="1456" height="971" data-attrs="{&quot;src&quot;:&quot;https://substack-post-media.s3.amazonaws.com/public/images/76d2e96e-e8e6-4f80-b2e7-6e24089da934_2344x1563.png&quot;,&quot;srcNoWatermark&quot;:null,&quot;fullscreen&quot;:null,&quot;imageSize&quot;:null,&quot;height&quot;:971,&quot;width&quot;:1456,&quot;resizeWidth&quot;:null,&quot;bytes&quot;:88040,&quot;alt&quot;:null,&quot;title&quot;:null,&quot;type&quot;:&quot;image/png&quot;,&quot;href&quot;:null,&quot;belowTheFold&quot;:true,&quot;topImage&quot;:false,&quot;internalRedirect&quot;:&quot;https://lcamtuf.substack.com/i/205698096?img=https%3A%2F%2Fsubstack-post-media.s3.amazonaws.com%2Fpublic%2Fimages%2F76d2e96e-e8e6-4f80-b2e7-6e24089da934_2344x1563.png&quot;,&quot;isProcessing&quot;:false,&quot;align&quot;:null,&quot;offset&quot;:false}" class="sizing-normal" alt="" srcset="https://substackcdn.com/image/fetch/$s_!nLIh!,w_424,c_limit,f_auto,q_auto:good,fl_progressive:steep/https%3A%2F%2Fsubstack-post-media.s3.amazonaws.com%2Fpublic%2Fimages%2F76d2e96e-e8e6-4f80-b2e7-6e24089da934_2344x1563.png 424w, https://substackcdn.com/image/fetch/$s_!nLIh!,w_848,c_limit,f_auto,q_auto:good,fl_progressive:steep/https%3A%2F%2Fsubstack-post-media.s3.amazonaws.com%2Fpublic%2Fimages%2F76d2e96e-e8e6-4f80-b2e7-6e24089da934_2344x1563.png 848w, https://substackcdn.com/image/fetch/$s_!nLIh!,w_1272,c_limit,f_auto,q_auto:good,fl_progressive:steep/https%3A%2F%2Fsubstack-post-media.s3.amazonaws.com%2Fpublic%2Fimages%2F76d2e96e-e8e6-4f80-b2e7-6e24089da934_2344x1563.png 1272w, https://substackcdn.com/image/fetch/$s_!nLIh!,w_1456,c_limit,f_auto,q_auto:good,fl_progressive:steep/https%3A%2F%2Fsubstack-post-media.s3.amazonaws.com%2Fpublic%2Fimages%2F76d2e96e-e8e6-4f80-b2e7-6e24089da934_2344x1563.png 1456w" sizes="100vw" loading="lazy">

](https://substackcdn.com/image/fetch/$s_!nLIh!,f_auto,q_auto:good,fl_progressive:steep/https://substack-post-media.s3.amazonaws.com/public/images/76d2e96e-e8e6-4f80-b2e7-6e24089da934_2344x1563.png)*Circuit behavior. Dashed line is the ideal behavior of -220 Ω.*

The circuit does nothing at *V<sub>signal</sub>* = 0 V, but as the voltage increases, it backfeeds more and more current into the signal source.

The plot also exposes a shortcoming of this design: because the process depends on keeping the output pin of the op-amp at twice the input voltage, we eventually run out of range; in a 5 V circuit, this happens a bit shy of 2.5 V. Past that point, the op-amp is maxed out and the voltage across the terminals of R<sub>1</sub> begins to decrease; so must the reverse current, eventually reaching zero at 5 V.

A potential workaround is to change the voltage divider to achieve lower voltage gain and then use a proportionately smaller R to get the same reverse current; for example, if we dial in 1.1× gain with a 2.2 kΩ / 22 kΩ divider and then use R<sub>1</sub> = 22 Ω, we’ll still get a simulated resistance of -220 Ω, but this time, the circuit works to about 4 V:

[

<img src="https://substackcdn.com/image/fetch/$s_!502q!,w_1456,c_limit,f_auto,q_auto:good,fl_progressive:steep/https%3A%2F%2Fsubstack-post-media.s3.amazonaws.com%2Fpublic%2Fimages%2F97bfeedd-a9ee-44e8-917b-13e89fbba4d1_2344x1563.png" width="1456" height="971" data-attrs="{&quot;src&quot;:&quot;https://substack-post-media.s3.amazonaws.com/public/images/97bfeedd-a9ee-44e8-917b-13e89fbba4d1_2344x1563.png&quot;,&quot;srcNoWatermark&quot;:null,&quot;fullscreen&quot;:null,&quot;imageSize&quot;:null,&quot;height&quot;:971,&quot;width&quot;:1456,&quot;resizeWidth&quot;:null,&quot;bytes&quot;:92697,&quot;alt&quot;:null,&quot;title&quot;:null,&quot;type&quot;:&quot;image/png&quot;,&quot;href&quot;:null,&quot;belowTheFold&quot;:true,&quot;topImage&quot;:false,&quot;internalRedirect&quot;:&quot;https://lcamtuf.substack.com/i/205698096?img=https%3A%2F%2Fsubstack-post-media.s3.amazonaws.com%2Fpublic%2Fimages%2F97bfeedd-a9ee-44e8-917b-13e89fbba4d1_2344x1563.png&quot;,&quot;isProcessing&quot;:false,&quot;align&quot;:null,&quot;offset&quot;:false}" class="sizing-normal" alt="" srcset="https://substackcdn.com/image/fetch/$s_!502q!,w_424,c_limit,f_auto,q_auto:good,fl_progressive:steep/https%3A%2F%2Fsubstack-post-media.s3.amazonaws.com%2Fpublic%2Fimages%2F97bfeedd-a9ee-44e8-917b-13e89fbba4d1_2344x1563.png 424w, https://substackcdn.com/image/fetch/$s_!502q!,w_848,c_limit,f_auto,q_auto:good,fl_progressive:steep/https%3A%2F%2Fsubstack-post-media.s3.amazonaws.com%2Fpublic%2Fimages%2F97bfeedd-a9ee-44e8-917b-13e89fbba4d1_2344x1563.png 848w, https://substackcdn.com/image/fetch/$s_!502q!,w_1272,c_limit,f_auto,q_auto:good,fl_progressive:steep/https%3A%2F%2Fsubstack-post-media.s3.amazonaws.com%2Fpublic%2Fimages%2F97bfeedd-a9ee-44e8-917b-13e89fbba4d1_2344x1563.png 1272w, https://substackcdn.com/image/fetch/$s_!502q!,w_1456,c_limit,f_auto,q_auto:good,fl_progressive:steep/https%3A%2F%2Fsubstack-post-media.s3.amazonaws.com%2Fpublic%2Fimages%2F97bfeedd-a9ee-44e8-917b-13e89fbba4d1_2344x1563.png 1456w" sizes="100vw" loading="lazy">

](https://substackcdn.com/image/fetch/$s_!502q!,f_auto,q_auto:good,fl_progressive:steep/https://substack-post-media.s3.amazonaws.com/public/images/97bfeedd-a9ee-44e8-917b-13e89fbba4d1_2344x1563.png)*Negative resistance circuit for R = 22* Ω *and 1.1× gain.*

The price we pay for this trick is slightly worse linearity.

### Negative differential resistance ###

The arrangement discussed earlier has some niche uses, but most of the time, “negative resistance” is a reference to a somewhat different phenomenon: a V-I curve that looks normal in parts, but has a section with a downward slope.

The simplest example of this phenomenon is a situation where, past a certain point, an increase in voltage causes a relative constriction of the admitted current. A model of this behavior is shown on the left:

[

<img src="https://substackcdn.com/image/fetch/$s_!iapI!,w_1456,c_limit,f_auto,q_auto:good,fl_progressive:steep/https%3A%2F%2Fsubstack-post-media.s3.amazonaws.com%2Fpublic%2Fimages%2F123a0447-f7f5-4622-8380-1c9c8d4449e7_2969x1252.png" width="1456" height="614" data-attrs="{&quot;src&quot;:&quot;https://substack-post-media.s3.amazonaws.com/public/images/123a0447-f7f5-4622-8380-1c9c8d4449e7_2969x1252.png&quot;,&quot;srcNoWatermark&quot;:null,&quot;fullscreen&quot;:null,&quot;imageSize&quot;:null,&quot;height&quot;:614,&quot;width&quot;:1456,&quot;resizeWidth&quot;:null,&quot;bytes&quot;:91504,&quot;alt&quot;:null,&quot;title&quot;:null,&quot;type&quot;:&quot;image/png&quot;,&quot;href&quot;:null,&quot;belowTheFold&quot;:true,&quot;topImage&quot;:false,&quot;internalRedirect&quot;:&quot;https://lcamtuf.substack.com/i/205698096?img=https%3A%2F%2Fsubstack-post-media.s3.amazonaws.com%2Fpublic%2Fimages%2F123a0447-f7f5-4622-8380-1c9c8d4449e7_2969x1252.png&quot;,&quot;isProcessing&quot;:false,&quot;align&quot;:null,&quot;offset&quot;:false}" class="sizing-normal" alt="" srcset="https://substackcdn.com/image/fetch/$s_!iapI!,w_424,c_limit,f_auto,q_auto:good,fl_progressive:steep/https%3A%2F%2Fsubstack-post-media.s3.amazonaws.com%2Fpublic%2Fimages%2F123a0447-f7f5-4622-8380-1c9c8d4449e7_2969x1252.png 424w, https://substackcdn.com/image/fetch/$s_!iapI!,w_848,c_limit,f_auto,q_auto:good,fl_progressive:steep/https%3A%2F%2Fsubstack-post-media.s3.amazonaws.com%2Fpublic%2Fimages%2F123a0447-f7f5-4622-8380-1c9c8d4449e7_2969x1252.png 848w, https://substackcdn.com/image/fetch/$s_!iapI!,w_1272,c_limit,f_auto,q_auto:good,fl_progressive:steep/https%3A%2F%2Fsubstack-post-media.s3.amazonaws.com%2Fpublic%2Fimages%2F123a0447-f7f5-4622-8380-1c9c8d4449e7_2969x1252.png 1272w, https://substackcdn.com/image/fetch/$s_!iapI!,w_1456,c_limit,f_auto,q_auto:good,fl_progressive:steep/https%3A%2F%2Fsubstack-post-media.s3.amazonaws.com%2Fpublic%2Fimages%2F123a0447-f7f5-4622-8380-1c9c8d4449e7_2969x1252.png 1456w" sizes="100vw" loading="lazy">

](https://substackcdn.com/image/fetch/$s_!iapI!,f_auto,q_auto:good,fl_progressive:steep/https://substack-post-media.s3.amazonaws.com/public/images/123a0447-f7f5-4622-8380-1c9c8d4449e7_2969x1252.png)*A simple model of differential negative resistance.*

This inverted section is called *negative differential resistance* (NDR). At first blush, the term makes no sense: if you look at the plot of voltage to apparent resistance (right), the value stays positive (and in fact, goes up). To make sense of the terminology, recall the idea of calculating differential resistance as the “local” ratio of step change in voltage to step change in current: *r =* Δ*v* / Δ*i*. In the downward portion of the V-I curve, Δ*v \>* 0 while Δ*i \<* 0, so the differential value is negative. But really, a simpler mnemonic is just that it’s an inverted slope.

In this scenario, because “real” resistance remains positive, such V-I kinks can manifest without the need for an additional power supply. An easily-constructed example of a negative differential resistance is the following arrangement of two complementary JFETs:

[

<img src="https://substackcdn.com/image/fetch/$s_!4eW2!,w_1456,c_limit,f_auto,q_auto:good,fl_progressive:steep/https%3A%2F%2Fsubstack-post-media.s3.amazonaws.com%2Fpublic%2Fimages%2F075e5b09-15f4-44a3-be82-7af65fa9478a_2450x1232.jpeg" width="1456" height="732" data-attrs="{&quot;src&quot;:&quot;https://substack-post-media.s3.amazonaws.com/public/images/075e5b09-15f4-44a3-be82-7af65fa9478a_2450x1232.jpeg&quot;,&quot;srcNoWatermark&quot;:null,&quot;fullscreen&quot;:null,&quot;imageSize&quot;:null,&quot;height&quot;:732,&quot;width&quot;:1456,&quot;resizeWidth&quot;:null,&quot;bytes&quot;:678179,&quot;alt&quot;:null,&quot;title&quot;:null,&quot;type&quot;:&quot;image/jpeg&quot;,&quot;href&quot;:null,&quot;belowTheFold&quot;:true,&quot;topImage&quot;:false,&quot;internalRedirect&quot;:&quot;https://lcamtuf.substack.com/i/205698096?img=https%3A%2F%2Fsubstack-post-media.s3.amazonaws.com%2Fpublic%2Fimages%2F075e5b09-15f4-44a3-be82-7af65fa9478a_2450x1232.jpeg&quot;,&quot;isProcessing&quot;:false,&quot;align&quot;:null,&quot;offset&quot;:false}" class="sizing-normal" alt="" srcset="https://substackcdn.com/image/fetch/$s_!4eW2!,w_424,c_limit,f_auto,q_auto:good,fl_progressive:steep/https%3A%2F%2Fsubstack-post-media.s3.amazonaws.com%2Fpublic%2Fimages%2F075e5b09-15f4-44a3-be82-7af65fa9478a_2450x1232.jpeg 424w, https://substackcdn.com/image/fetch/$s_!4eW2!,w_848,c_limit,f_auto,q_auto:good,fl_progressive:steep/https%3A%2F%2Fsubstack-post-media.s3.amazonaws.com%2Fpublic%2Fimages%2F075e5b09-15f4-44a3-be82-7af65fa9478a_2450x1232.jpeg 848w, https://substackcdn.com/image/fetch/$s_!4eW2!,w_1272,c_limit,f_auto,q_auto:good,fl_progressive:steep/https%3A%2F%2Fsubstack-post-media.s3.amazonaws.com%2Fpublic%2Fimages%2F075e5b09-15f4-44a3-be82-7af65fa9478a_2450x1232.jpeg 1272w, https://substackcdn.com/image/fetch/$s_!4eW2!,w_1456,c_limit,f_auto,q_auto:good,fl_progressive:steep/https%3A%2F%2Fsubstack-post-media.s3.amazonaws.com%2Fpublic%2Fimages%2F075e5b09-15f4-44a3-be82-7af65fa9478a_2450x1232.jpeg 1456w" sizes="100vw" loading="lazy">

](https://substackcdn.com/image/fetch/$s_!4eW2!,f_auto,q_auto:good,fl_progressive:steep/https://substack-post-media.s3.amazonaws.com/public/images/075e5b09-15f4-44a3-be82-7af65fa9478a_2450x1232.jpeg)*Negative differential resistance with JFETs.*

This circuit, known as the lambda diode, should be fairly easy to understand if you’re familiar with the behavior of junction field-effect transistors; if not, a quick refresher can be found [here](https://lcamtuf.substack.com/p/how-do-transistors-work-anyway). In a nutshell, the JFET drain-source path is conductive by default, but the flow of current can be constricted by making the gate-source voltage difference (*V<sub>GS</sub>*) sufficiently negative in n-channel devices, or sufficiently positive in p-channel ones. In this circuit, the cut-off point is around *V<sub>GS </sub>*= -4 to -5 V for the n-channel transistor (J111) and *V<sub>GS </sub>*= +4 to +5 V for its p-channel counterpart (J175).

To simplify the analysis, let’s assume that the transistors have identical characteristics except for the polarity of the gate voltage; that is, let’s say that the top one conducts exactly as well at *V<sub>GS </sub>*= -2 V as the bottom one conducts at *V<sub>GS </sub>*= +2 V. That assumption is not quite true, but it’s good enough for a qualitative result.

Next, let’s use *V<sub>mid</sub>* to denote the unknown voltage at the midpoint of the circuit (as marked in the schematic) and note that the gate of the n-channel transistor is wired to the ground. With this in mind, we can express the gate-source voltage delta for the top JFET as:

The bottom transistor has its gate hardwired to the positive supply, so the corresponding formula is:

The transistors are connected in series, so the same current must be flowing through both. This current is decided chiefly by *V<sub>GS</sub>*, and we’ve made the assumption that both JFETs have the same characteristics except for the flipped sign for the gate voltage. So, equal currents would call for *V<sub>GS (bottom)</sub>* = -*V<sub>GS (top)</sub>*, which further expands to:

This puts the transistors’ *V<sub>GS </sub>*at half the input voltage, priming both to cut off once the input voltage crosses about 8 V.

And indeed, we can see this on the following empirical plot:

[

<img src="https://substackcdn.com/image/fetch/$s_!SB76!,w_1456,c_limit,f_auto,q_auto:good,fl_progressive:steep/https%3A%2F%2Fsubstack-post-media.s3.amazonaws.com%2Fpublic%2Fimages%2Fbd9715af-50a5-4920-8b63-a77ed83cbbda_2344x1563.png" width="1456" height="971" data-attrs="{&quot;src&quot;:&quot;https://substack-post-media.s3.amazonaws.com/public/images/bd9715af-50a5-4920-8b63-a77ed83cbbda_2344x1563.png&quot;,&quot;srcNoWatermark&quot;:null,&quot;fullscreen&quot;:null,&quot;imageSize&quot;:null,&quot;height&quot;:971,&quot;width&quot;:1456,&quot;resizeWidth&quot;:null,&quot;bytes&quot;:98461,&quot;alt&quot;:null,&quot;title&quot;:null,&quot;type&quot;:&quot;image/png&quot;,&quot;href&quot;:null,&quot;belowTheFold&quot;:true,&quot;topImage&quot;:false,&quot;internalRedirect&quot;:&quot;https://lcamtuf.substack.com/i/205698096?img=https%3A%2F%2Fsubstack-post-media.s3.amazonaws.com%2Fpublic%2Fimages%2Fbd9715af-50a5-4920-8b63-a77ed83cbbda_2344x1563.png&quot;,&quot;isProcessing&quot;:false,&quot;align&quot;:null,&quot;offset&quot;:false}" class="sizing-normal" alt="" srcset="https://substackcdn.com/image/fetch/$s_!SB76!,w_424,c_limit,f_auto,q_auto:good,fl_progressive:steep/https%3A%2F%2Fsubstack-post-media.s3.amazonaws.com%2Fpublic%2Fimages%2Fbd9715af-50a5-4920-8b63-a77ed83cbbda_2344x1563.png 424w, https://substackcdn.com/image/fetch/$s_!SB76!,w_848,c_limit,f_auto,q_auto:good,fl_progressive:steep/https%3A%2F%2Fsubstack-post-media.s3.amazonaws.com%2Fpublic%2Fimages%2Fbd9715af-50a5-4920-8b63-a77ed83cbbda_2344x1563.png 848w, https://substackcdn.com/image/fetch/$s_!SB76!,w_1272,c_limit,f_auto,q_auto:good,fl_progressive:steep/https%3A%2F%2Fsubstack-post-media.s3.amazonaws.com%2Fpublic%2Fimages%2Fbd9715af-50a5-4920-8b63-a77ed83cbbda_2344x1563.png 1272w, https://substackcdn.com/image/fetch/$s_!SB76!,w_1456,c_limit,f_auto,q_auto:good,fl_progressive:steep/https%3A%2F%2Fsubstack-post-media.s3.amazonaws.com%2Fpublic%2Fimages%2Fbd9715af-50a5-4920-8b63-a77ed83cbbda_2344x1563.png 1456w" sizes="100vw" loading="lazy">

](https://substackcdn.com/image/fetch/$s_!SB76!,f_auto,q_auto:good,fl_progressive:steep/https://substack-post-media.s3.amazonaws.com/public/images/bd9715af-50a5-4920-8b63-a77ed83cbbda_2344x1563.png)*Current through the J111-J175 lambda diode.*

In our lambda diode, the admitted current decreases sharply in the region between 5 V and 9 V; the stretch between 7 to 8.5 V, which coincides with the dashed line representing a delta of about -2 mA per volt, is quite linear.

Another flavor of negative differential resistance can arise if we’re supplying a controlled current to some circuit, but past a certain point, by some mechanism, the voltage needed to sustain it takes a nosedive. A conceptual illustration of this effect can be found below:

[

<img src="https://substackcdn.com/image/fetch/$s_!ANCV!,w_1456,c_limit,f_auto,q_auto:good,fl_progressive:steep/https%3A%2F%2Fsubstack-post-media.s3.amazonaws.com%2Fpublic%2Fimages%2F87bc0e2d-e516-457f-add7-6e3c8059ef3c_2969x1252.png" width="1456" height="614" data-attrs="{&quot;src&quot;:&quot;https://substack-post-media.s3.amazonaws.com/public/images/87bc0e2d-e516-457f-add7-6e3c8059ef3c_2969x1252.png&quot;,&quot;srcNoWatermark&quot;:null,&quot;fullscreen&quot;:null,&quot;imageSize&quot;:null,&quot;height&quot;:614,&quot;width&quot;:1456,&quot;resizeWidth&quot;:null,&quot;bytes&quot;:99576,&quot;alt&quot;:null,&quot;title&quot;:null,&quot;type&quot;:&quot;image/png&quot;,&quot;href&quot;:null,&quot;belowTheFold&quot;:true,&quot;topImage&quot;:false,&quot;internalRedirect&quot;:&quot;https://lcamtuf.substack.com/i/205698096?img=https%3A%2F%2Fsubstack-post-media.s3.amazonaws.com%2Fpublic%2Fimages%2F87bc0e2d-e516-457f-add7-6e3c8059ef3c_2969x1252.png&quot;,&quot;isProcessing&quot;:false,&quot;align&quot;:null,&quot;offset&quot;:false}" class="sizing-normal" alt="" srcset="https://substackcdn.com/image/fetch/$s_!ANCV!,w_424,c_limit,f_auto,q_auto:good,fl_progressive:steep/https%3A%2F%2Fsubstack-post-media.s3.amazonaws.com%2Fpublic%2Fimages%2F87bc0e2d-e516-457f-add7-6e3c8059ef3c_2969x1252.png 424w, https://substackcdn.com/image/fetch/$s_!ANCV!,w_848,c_limit,f_auto,q_auto:good,fl_progressive:steep/https%3A%2F%2Fsubstack-post-media.s3.amazonaws.com%2Fpublic%2Fimages%2F87bc0e2d-e516-457f-add7-6e3c8059ef3c_2969x1252.png 848w, https://substackcdn.com/image/fetch/$s_!ANCV!,w_1272,c_limit,f_auto,q_auto:good,fl_progressive:steep/https%3A%2F%2Fsubstack-post-media.s3.amazonaws.com%2Fpublic%2Fimages%2F87bc0e2d-e516-457f-add7-6e3c8059ef3c_2969x1252.png 1272w, https://substackcdn.com/image/fetch/$s_!ANCV!,w_1456,c_limit,f_auto,q_auto:good,fl_progressive:steep/https%3A%2F%2Fsubstack-post-media.s3.amazonaws.com%2Fpublic%2Fimages%2F87bc0e2d-e516-457f-add7-6e3c8059ef3c_2969x1252.png 1456w" sizes="100vw" loading="lazy">

](https://substackcdn.com/image/fetch/$s_!ANCV!,f_auto,q_auto:good,fl_progressive:steep/https://substack-post-media.s3.amazonaws.com/public/images/87bc0e2d-e516-457f-add7-6e3c8059ef3c_2969x1252.png)*Negative differential resistance via horizontal snapback.*

In this plot, the circuit behaves like a 6 Ω resistance up to a point, but then “snap backs” in the horizontal axis; currents above about 1.2 A can be apparently sustained with a markedly lower applied voltage.

This scenario is qualitatively different from what we’ve talked about before; in the earlier V-I plot, there were multiple voltages that could produce the same current. In the snapback scenario, we have multiple currents that can be sustained by the same voltage.

As it turns out, you can get that behavior out of a single bipolar transistor; we talked about an example of a circuit that exploited that pattern in an earlier article on this blog:

---

*Error code 400: daily token limit exceeded. Higher limits are available to Skippy Premium and Premium+ subscribers.*

*Other articles you might like:*

[Subscribe now](https://lcamtuf.substack.com/subscribe?)