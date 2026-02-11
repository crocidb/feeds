+++
title = "Cursed circuits #3: true mathematics"
description = "Op-amp arithmetics, explained in a more accessible way"
date = "2025-12-22T02:38:09Z"
url = "https://lcamtuf.substack.com/p/cursed-circuits-3-true-mathematics"
author = "lcamtuf"
text = ""
lastupdated = "2026-02-11T20:17:01.334855414Z"
seen = false
+++

In the previous installments of *Cursed Circuits*, we looked at two switched capacitor circuits: the [voltage halver](https://lcamtuf.substack.com/p/cursed-circuits-charge-pump-voltage) and the [capacitor lowpass filter](https://lcamtuf.substack.com/p/cursed-circuits-2-switched-capacitor).

In today’s episode, I’d like to talk about the use of operational amplifiers to do something other than amplification: to solve analog math. Analog computing at a scale is wildly impractical because errors tend to accumulate every step along the way; nevertheless, individual techniques find a number of specialized uses, perhaps most prominently in [analog-to-digital converters](https://lcamtuf.substack.com/p/dacs-and-adcs-or-there-and-back-again). Let’s have a look at how it’s done.

*The following assumes familiarity with [core concepts in electronic circuits](https://lcamtuf.substack.com/p/primer-core-concepts-in-electronic) and with the [fundamentals of signal amplification](https://lcamtuf.substack.com/p/the-basics-of-signal-amplification). If you need a refresher, start with the two linked articles first.*

### Op-amps at a glance ###

Before we get to less obvious circuits, let’s start with a brief recap: operational amplifiers are to analog electronics what logic gates are to digital logic. They are simple but remarkably versatile building blocks that let you accomplish far more than appears possible at first blush.

Unfortunately, in introductory texts, their operation is often explained in confusing ways. All that an op-amp does is taking two input voltages — *V<sub>in-</sub>* (“inverting input”) and *V<sub>in+</sub>* (“non-inverting input”) — and then outputting a voltage that’s equal to the difference between the two, amplified by a huge factor (*A<sub>OL</sub>*, often 100,000 or more) and then referenced to the midpoint of the supply (*V<sub>mid</sub>*). You can write it the following way:

That’s all the chip does. Because the gain is massive, there is a very narrow linear region near *V<sub>in-</sub>* = *V<sub>in+</sub>*; a difference greater than a couple of microvolts will send the output toward one of the supply rails. The chip doesn’t care about the absolute value of *V<sub>in-</sub>* or *V<sub>in+</sub>* it can’t “see” any external components you connect to it, and its internal gain can’t be changed.

To show the versatility of the component, we can have a quick look at the following circuit that you might be already familiar with — a non-inverting amplifier:

[

<img src="https://substackcdn.com/image/fetch/$s_!ELK3!,w_1456,c_limit,f_auto,q_auto:good,fl_progressive:steep/https%3A%2F%2Fsubstack-post-media.s3.amazonaws.com%2Fpublic%2Fimages%2Fbac0ada9-3028-4bf9-a258-c0a11688efde_2000x1177.jpeg" width="1456" height="857" data-attrs="{&quot;src&quot;:&quot;https://substack-post-media.s3.amazonaws.com/public/images/bac0ada9-3028-4bf9-a258-c0a11688efde_2000x1177.jpeg&quot;,&quot;srcNoWatermark&quot;:null,&quot;fullscreen&quot;:null,&quot;imageSize&quot;:null,&quot;height&quot;:857,&quot;width&quot;:1456,&quot;resizeWidth&quot;:null,&quot;bytes&quot;:231290,&quot;alt&quot;:null,&quot;title&quot;:null,&quot;type&quot;:&quot;image/jpeg&quot;,&quot;href&quot;:null,&quot;belowTheFold&quot;:true,&quot;topImage&quot;:false,&quot;internalRedirect&quot;:&quot;https://lcamtuf.substack.com/i/182245394?img=https%3A%2F%2Fsubstack-post-media.s3.amazonaws.com%2Fpublic%2Fimages%2Fbac0ada9-3028-4bf9-a258-c0a11688efde_2000x1177.jpeg&quot;,&quot;isProcessing&quot;:false,&quot;align&quot;:null,&quot;offset&quot;:false}" class="sizing-normal" alt="" srcset="https://substackcdn.com/image/fetch/$s_!ELK3!,w_424,c_limit,f_auto,q_auto:good,fl_progressive:steep/https%3A%2F%2Fsubstack-post-media.s3.amazonaws.com%2Fpublic%2Fimages%2Fbac0ada9-3028-4bf9-a258-c0a11688efde_2000x1177.jpeg 424w, https://substackcdn.com/image/fetch/$s_!ELK3!,w_848,c_limit,f_auto,q_auto:good,fl_progressive:steep/https%3A%2F%2Fsubstack-post-media.s3.amazonaws.com%2Fpublic%2Fimages%2Fbac0ada9-3028-4bf9-a258-c0a11688efde_2000x1177.jpeg 848w, https://substackcdn.com/image/fetch/$s_!ELK3!,w_1272,c_limit,f_auto,q_auto:good,fl_progressive:steep/https%3A%2F%2Fsubstack-post-media.s3.amazonaws.com%2Fpublic%2Fimages%2Fbac0ada9-3028-4bf9-a258-c0a11688efde_2000x1177.jpeg 1272w, https://substackcdn.com/image/fetch/$s_!ELK3!,w_1456,c_limit,f_auto,q_auto:good,fl_progressive:steep/https%3A%2F%2Fsubstack-post-media.s3.amazonaws.com%2Fpublic%2Fimages%2Fbac0ada9-3028-4bf9-a258-c0a11688efde_2000x1177.jpeg 1456w" sizes="100vw" loading="lazy">

](https://substackcdn.com/image/fetch/$s_!ELK3!,f_auto,q_auto:good,fl_progressive:steep/https://substack-post-media.s3.amazonaws.com/public/images/bac0ada9-3028-4bf9-a258-c0a11688efde_2000x1177.jpeg)*The basic non-inverting voltage amplifier.*

One input of the op-amp is connected to the external signal source: *V<sub>in+ </sub>*= *V<sub>signal</sub>*. The other input is hooked up to a two-resistor voltage divider that straddles the ground and the output leg; the divider’s midpoint voltage is:

As discussed earlier, the only way for the op-amp to output voltages other than 0 V or *V<sub>supply </sub>*is for *V<sub>in+ </sub>*to be very close to *V<sub>in-</sub>*. We can assume that we’re operating near that equilibrium point, combine the equations for the voltages on the two input legs, and write:

Solving this for *V<sub>out</sub>*, we get:

In other words, the output voltage is the input signal amplified by a factor of *1 + R<sub>f</sub>/R<sub>g</sub>*. We have a near-ideal single-ended voltage amplifier with a configurable gain. Again, the circuit is probably familiar to most folks dabbling in analog electronics, but it’s worth pondering that we implemented it by adding a couple of resistors to a chip that does something conceptually quite different.

*Note: there’s a bit more to op-amp lore when dealing with high-frequency signals; a more rigorous analysis of their frequency characteristics can be found in [this article](https://lcamtuf.substack.com/p/deep-dive-the-instability-of-op-amps).*

### Addition ###

Now that we have the basics covered, we can show that op-amps can do more than just amplify signals. The first contender is the following summing layout that differs from what’s usually covered in textbooks, but that’s well-suited for single-supply use:

[

<img src="https://substackcdn.com/image/fetch/$s_!N-qA!,w_1456,c_limit,f_auto,q_auto:good,fl_progressive:steep/https%3A%2F%2Fsubstack-post-media.s3.amazonaws.com%2Fpublic%2Fimages%2Faa8e2a97-1a44-44fc-8724-4b6615b3a19b_2000x1225.jpeg" width="1456" height="892" data-attrs="{&quot;src&quot;:&quot;https://substack-post-media.s3.amazonaws.com/public/images/aa8e2a97-1a44-44fc-8724-4b6615b3a19b_2000x1225.jpeg&quot;,&quot;srcNoWatermark&quot;:null,&quot;fullscreen&quot;:null,&quot;imageSize&quot;:null,&quot;height&quot;:892,&quot;width&quot;:1456,&quot;resizeWidth&quot;:null,&quot;bytes&quot;:268468,&quot;alt&quot;:null,&quot;title&quot;:null,&quot;type&quot;:&quot;image/jpeg&quot;,&quot;href&quot;:null,&quot;belowTheFold&quot;:true,&quot;topImage&quot;:false,&quot;internalRedirect&quot;:&quot;https://lcamtuf.substack.com/i/182245394?img=https%3A%2F%2Fsubstack-post-media.s3.amazonaws.com%2Fpublic%2Fimages%2Faa8e2a97-1a44-44fc-8724-4b6615b3a19b_2000x1225.jpeg&quot;,&quot;isProcessing&quot;:false,&quot;align&quot;:null,&quot;offset&quot;:false}" class="sizing-normal" alt="" srcset="https://substackcdn.com/image/fetch/$s_!N-qA!,w_424,c_limit,f_auto,q_auto:good,fl_progressive:steep/https%3A%2F%2Fsubstack-post-media.s3.amazonaws.com%2Fpublic%2Fimages%2Faa8e2a97-1a44-44fc-8724-4b6615b3a19b_2000x1225.jpeg 424w, https://substackcdn.com/image/fetch/$s_!N-qA!,w_848,c_limit,f_auto,q_auto:good,fl_progressive:steep/https%3A%2F%2Fsubstack-post-media.s3.amazonaws.com%2Fpublic%2Fimages%2Faa8e2a97-1a44-44fc-8724-4b6615b3a19b_2000x1225.jpeg 848w, https://substackcdn.com/image/fetch/$s_!N-qA!,w_1272,c_limit,f_auto,q_auto:good,fl_progressive:steep/https%3A%2F%2Fsubstack-post-media.s3.amazonaws.com%2Fpublic%2Fimages%2Faa8e2a97-1a44-44fc-8724-4b6615b3a19b_2000x1225.jpeg 1272w, https://substackcdn.com/image/fetch/$s_!N-qA!,w_1456,c_limit,f_auto,q_auto:good,fl_progressive:steep/https%3A%2F%2Fsubstack-post-media.s3.amazonaws.com%2Fpublic%2Fimages%2Faa8e2a97-1a44-44fc-8724-4b6615b3a19b_2000x1225.jpeg 1456w" sizes="100vw" loading="lazy">

](https://substackcdn.com/image/fetch/$s_!N-qA!,f_auto,q_auto:good,fl_progressive:steep/https://substack-post-media.s3.amazonaws.com/public/images/aa8e2a97-1a44-44fc-8724-4b6615b3a19b_2000x1225.jpeg)*A three-way non-inverting summing amplifier.*

Assuming well-behaved signal sources that can supply and sink currents, it should be pretty intuitive that the voltage on the *V<sub>in+</sub>* leg is just an average of three input signals:

For readers who are unpersuaded, we can show this from Kirchoff’s current law (KCL); the law essentially just says “what comes in must come out” — i.e., the currents flowing into and out of the three-resistor junction must balance out. If we use *V<sub>jct </sub>*to denote the voltage at the junction, then from Ohm’s law, we can write the following current equations for each resistor branch:

Further, from KCL, we can assert that the currents must balance out: *I<sub>1 </sub>*+ *I<sub>2 </sub>*+ *I<sub>3 </sub>*= 0 A. Combining all these equations and multiplying both sides by R, we get:

Solving for *V<sub>jct</sub>*, we get (*V<sub>A </sub>*+ *V<sub>B</sub>* + *V<sub>C</sub>*) / 3. We have a confirmation that the input-side resistor section averages the input voltages.

To be fair, the averaging portion of the circuit has a minor weakness: it depends some inputs sinking current while others source it. Some signal sources might not have that ability. That said, compared to the alternative design, it has the benefit of being more useful in single-supply circuits, so let’s stick with that.

Moving on to the op-amp section: this is just another sighting of the non-inverting amplifier. The gain of the amplifier circuit is set by the *R<sub>f</sub>* and *R<sub>g</sub>* resistors, and in this instance, works out to A = 1 + *R<sub>f</sub>/R<sub>g</sub>* = 3. In other words, the signal on the output leg is:

That looks like a sum! But it also feels like we cheated in some way: it just so happens that we could implement averaging using passive components, and then tack on an amplifier for some gain. Surely, resistor magic can’t get us much further than that?

### Subtraction ###

It can! The next stop is subtraction, which can be achieved with the following circuit topology:

[

<img src="https://substackcdn.com/image/fetch/$s_!QnTs!,w_1456,c_limit,f_auto,q_auto:good,fl_progressive:steep/https%3A%2F%2Fsubstack-post-media.s3.amazonaws.com%2Fpublic%2Fimages%2F7f412f17-8062-4912-9146-8f5522be8e49_2000x1100.jpeg" width="1456" height="801" data-attrs="{&quot;src&quot;:&quot;https://substack-post-media.s3.amazonaws.com/public/images/7f412f17-8062-4912-9146-8f5522be8e49_2000x1100.jpeg&quot;,&quot;srcNoWatermark&quot;:null,&quot;fullscreen&quot;:null,&quot;imageSize&quot;:null,&quot;height&quot;:801,&quot;width&quot;:1456,&quot;resizeWidth&quot;:null,&quot;bytes&quot;:228331,&quot;alt&quot;:null,&quot;title&quot;:null,&quot;type&quot;:&quot;image/jpeg&quot;,&quot;href&quot;:null,&quot;belowTheFold&quot;:true,&quot;topImage&quot;:false,&quot;internalRedirect&quot;:&quot;https://lcamtuf.substack.com/i/182245394?img=https%3A%2F%2Fsubstack-post-media.s3.amazonaws.com%2Fpublic%2Fimages%2F7f412f17-8062-4912-9146-8f5522be8e49_2000x1100.jpeg&quot;,&quot;isProcessing&quot;:false,&quot;align&quot;:null,&quot;offset&quot;:false}" class="sizing-normal" alt="" srcset="https://substackcdn.com/image/fetch/$s_!QnTs!,w_424,c_limit,f_auto,q_auto:good,fl_progressive:steep/https%3A%2F%2Fsubstack-post-media.s3.amazonaws.com%2Fpublic%2Fimages%2F7f412f17-8062-4912-9146-8f5522be8e49_2000x1100.jpeg 424w, https://substackcdn.com/image/fetch/$s_!QnTs!,w_848,c_limit,f_auto,q_auto:good,fl_progressive:steep/https%3A%2F%2Fsubstack-post-media.s3.amazonaws.com%2Fpublic%2Fimages%2F7f412f17-8062-4912-9146-8f5522be8e49_2000x1100.jpeg 848w, https://substackcdn.com/image/fetch/$s_!QnTs!,w_1272,c_limit,f_auto,q_auto:good,fl_progressive:steep/https%3A%2F%2Fsubstack-post-media.s3.amazonaws.com%2Fpublic%2Fimages%2F7f412f17-8062-4912-9146-8f5522be8e49_2000x1100.jpeg 1272w, https://substackcdn.com/image/fetch/$s_!QnTs!,w_1456,c_limit,f_auto,q_auto:good,fl_progressive:steep/https%3A%2F%2Fsubstack-post-media.s3.amazonaws.com%2Fpublic%2Fimages%2F7f412f17-8062-4912-9146-8f5522be8e49_2000x1100.jpeg 1456w" sizes="100vw" loading="lazy">

](https://substackcdn.com/image/fetch/$s_!QnTs!,f_auto,q_auto:good,fl_progressive:steep/https://substack-post-media.s3.amazonaws.com/public/images/7f412f17-8062-4912-9146-8f5522be8e49_2000x1100.jpeg)*A simple difference amplifier (A - B).*

We can start the analysis with the non-inverting input of the amplifier. The signal on this leg is generated by a voltage divider consisting of two identical resistances connected in series between V<sub>A</sub> and the ground. In other words, the voltage here is *V<sub>in+</sub> = ½ · V<sub>A</sub>.*

The inverting input is a voltage divider too, except it produces a voltage that’s halfway between *V<sub>B</sub>*<sub> </sub>and *V<sub>out</sub>*: *V<sub>in-</sub>* = ½ · (*V*<sub>B </sub>+ *V<sub>out</sub>*).

As with any op-amp topology, linear operation can happen only when *V<sub>in- </sub>≈ V<sub>in+</sub>*. In other words, we can assert that for the circuit to function, the following must be true:

We can cancel out the repeated ½ term on both sides, and then reorder the equation to:

Neat: that’s precisely what we’ve been trying to do.

To be fair, not all is roses: in a single-supply circuit, an op-amp can’t output negative voltages, so the topology we’ve just analyzed works only if *V<sub>A</sub> \> V<sub>B</sub>*; otherwise, *V<sub>out </sub>*just hits the lower rail and stays there until the input voltages change.

To accommodate use cases where *V<sub>A</sub> \< V<sub>B</sub>*, we’d need to use a higher output voltage as the “zero” point (*V<sub>zero</sub>*). For example, if *V<sub>zero </sub>*= 2.5 V, then a computed difference of -1 V could be represented by *V<sub>out </sub>*= *V<sub>zero </sub>*- 1 V = 1.5 V; in the same vein, a difference of +2 V could correspond to *V<sub>out </sub>*= 4.5 V.

To do this, we just need to disconnect the bottom voltage divider from the ground and replace 0 V with a fixed “zero” voltage of our choice. This changes the equation for the positive leg to *V<sub>in+</sub>* = ½ · (*V*<sub>A </sub>+ *V<sub>zero</sub>*). The overall equilibrium condition becomes:

After tidying up and solving for the output signal, we get:

A common choice of a reference point would be the midpoint of the supply (*V<sub>mid</sub>* = ½ · *V<sub>supply</sub>*).

### Multiplication and division ###

The concept of analog computation can be also extended to multiplication and division. The most common and mildly mind-bending approach hinges on the fact that any positive number can be rewritten as a constant base *n* raised to some power; for example, 8 can be written as 2<sup>3</sup>, while 42 is approximately 2<sup>5.3924</sup>.

From the basic properties of exponentiation, it’s easy to show that *n<sup>a </sup>· n<sup>b </sup>*is the same as *n<sup>a+b</sup>*; it follows that if we have two numbers represented as exponents of a common base, we can reduce the problem of multiplication to the addition of these exponents.

We already know how to build a summing circuit, so all we’re missing is a way to convert a number to an exponent. We don’t really care what base we’re using, as long as the base remains constant over time.

This brings us to the following design:

[

<img src="https://substackcdn.com/image/fetch/$s_!v48I!,w_1456,c_limit,f_auto,q_auto:good,fl_progressive:steep/https%3A%2F%2Fsubstack-post-media.s3.amazonaws.com%2Fpublic%2Fimages%2Fb2dfc829-5c95-4bdd-9136-13cae83e63f8_2000x682.jpeg" width="1456" height="496" data-attrs="{&quot;src&quot;:&quot;https://substack-post-media.s3.amazonaws.com/public/images/b2dfc829-5c95-4bdd-9136-13cae83e63f8_2000x682.jpeg&quot;,&quot;srcNoWatermark&quot;:null,&quot;fullscreen&quot;:null,&quot;imageSize&quot;:null,&quot;height&quot;:496,&quot;width&quot;:1456,&quot;resizeWidth&quot;:null,&quot;bytes&quot;:143958,&quot;alt&quot;:null,&quot;title&quot;:null,&quot;type&quot;:&quot;image/jpeg&quot;,&quot;href&quot;:null,&quot;belowTheFold&quot;:true,&quot;topImage&quot;:false,&quot;internalRedirect&quot;:&quot;https://lcamtuf.substack.com/i/182245394?img=https%3A%2F%2Fsubstack-post-media.s3.amazonaws.com%2Fpublic%2Fimages%2Fb2dfc829-5c95-4bdd-9136-13cae83e63f8_2000x682.jpeg&quot;,&quot;isProcessing&quot;:false,&quot;align&quot;:null,&quot;offset&quot;:false}" class="sizing-normal" alt="" srcset="https://substackcdn.com/image/fetch/$s_!v48I!,w_424,c_limit,f_auto,q_auto:good,fl_progressive:steep/https%3A%2F%2Fsubstack-post-media.s3.amazonaws.com%2Fpublic%2Fimages%2Fb2dfc829-5c95-4bdd-9136-13cae83e63f8_2000x682.jpeg 424w, https://substackcdn.com/image/fetch/$s_!v48I!,w_848,c_limit,f_auto,q_auto:good,fl_progressive:steep/https%3A%2F%2Fsubstack-post-media.s3.amazonaws.com%2Fpublic%2Fimages%2Fb2dfc829-5c95-4bdd-9136-13cae83e63f8_2000x682.jpeg 848w, https://substackcdn.com/image/fetch/$s_!v48I!,w_1272,c_limit,f_auto,q_auto:good,fl_progressive:steep/https%3A%2F%2Fsubstack-post-media.s3.amazonaws.com%2Fpublic%2Fimages%2Fb2dfc829-5c95-4bdd-9136-13cae83e63f8_2000x682.jpeg 1272w, https://substackcdn.com/image/fetch/$s_!v48I!,w_1456,c_limit,f_auto,q_auto:good,fl_progressive:steep/https%3A%2F%2Fsubstack-post-media.s3.amazonaws.com%2Fpublic%2Fimages%2Fb2dfc829-5c95-4bdd-9136-13cae83e63f8_2000x682.jpeg 1456w" sizes="100vw" loading="lazy">

](https://substackcdn.com/image/fetch/$s_!v48I!,f_auto,q_auto:good,fl_progressive:steep/https://substack-post-media.s3.amazonaws.com/public/images/b2dfc829-5c95-4bdd-9136-13cae83e63f8_2000x682.jpeg)*A logarithmic amplifier.*

As before, the linear equilibrium condition requires *V<sub>in-</sub> ≈ V<sub>in+</sub>.* Let’s assume that the initial input voltage is about equal to *V<sub>zero</sub>*; in this case, the output settles in the same vicinity.

Next, let’s analyze what would happen if the input voltage increased by *v<sub>s</sub>* *=* 100 mV. In such a scenario, for the op-amp to stay at an equilibrium of *V<sub>in-</sub> ≈ V<sub>in+</sub>*, we would need a sufficient current to flow through the resistor to create a 100 mV voltage drop:

The op-amp has a very high input impedance, so the current must flow through the diode; if it doesn’t, that’d move the circuit toward a condition of *V*<sub>in-</sub> ≫ *V*<sub>in+</sub>, which would cause *V<sub>out</sub>* to move toward the negative supply rail. That would forward-bias the diode and thus motivate it to conduct better. In other words, the circuit has an automatic mechanism that coerces the diode to admit the current matching *I*<sub>R</sub>, and the amount of convincing is reflected in how much the output voltage has been reduced from the midpoint. We can denote this relative shift as *v<sub>o</sub>*.

From an [earlier feature about diodes](https://lcamtuf.substack.com/p/things-you-can-do-with-diodes), you might recall that although the relationship between the applied diode voltage and the resulting current is complicated, there is an initial region where the component’s V-I curve is exponential. In the following plot for a 1N4148 diode, this property holds up for currents up to about 1 mA:

[

<img src="https://substackcdn.com/image/fetch/$s_!1YT_!,w_1456,c_limit,f_auto,q_auto:good,fl_progressive:steep/https%3A%2F%2Fsubstack-post-media.s3.amazonaws.com%2Fpublic%2Fimages%2Fcc911561-42ea-431b-b5c9-a1bdd10c2eaa_2969x1250.jpeg" width="1456" height="613" data-attrs="{&quot;src&quot;:&quot;https://substack-post-media.s3.amazonaws.com/public/images/cc911561-42ea-431b-b5c9-a1bdd10c2eaa_2969x1250.jpeg&quot;,&quot;srcNoWatermark&quot;:null,&quot;fullscreen&quot;:null,&quot;imageSize&quot;:null,&quot;height&quot;:613,&quot;width&quot;:1456,&quot;resizeWidth&quot;:null,&quot;bytes&quot;:106864,&quot;alt&quot;:&quot;&quot;,&quot;title&quot;:null,&quot;type&quot;:&quot;image/jpeg&quot;,&quot;href&quot;:null,&quot;belowTheFold&quot;:true,&quot;topImage&quot;:false,&quot;internalRedirect&quot;:&quot;https://lcamtuf.substack.com/i/182245394?img=https%3A%2F%2Fsubstack-post-media.s3.amazonaws.com%2Fpublic%2Fimages%2Fcc911561-42ea-431b-b5c9-a1bdd10c2eaa_2969x1250.jpeg&quot;,&quot;isProcessing&quot;:false,&quot;align&quot;:null,&quot;offset&quot;:false}" class="sizing-normal" alt="" title="" srcset="https://substackcdn.com/image/fetch/$s_!1YT_!,w_424,c_limit,f_auto,q_auto:good,fl_progressive:steep/https%3A%2F%2Fsubstack-post-media.s3.amazonaws.com%2Fpublic%2Fimages%2Fcc911561-42ea-431b-b5c9-a1bdd10c2eaa_2969x1250.jpeg 424w, https://substackcdn.com/image/fetch/$s_!1YT_!,w_848,c_limit,f_auto,q_auto:good,fl_progressive:steep/https%3A%2F%2Fsubstack-post-media.s3.amazonaws.com%2Fpublic%2Fimages%2Fcc911561-42ea-431b-b5c9-a1bdd10c2eaa_2969x1250.jpeg 848w, https://substackcdn.com/image/fetch/$s_!1YT_!,w_1272,c_limit,f_auto,q_auto:good,fl_progressive:steep/https%3A%2F%2Fsubstack-post-media.s3.amazonaws.com%2Fpublic%2Fimages%2Fcc911561-42ea-431b-b5c9-a1bdd10c2eaa_2969x1250.jpeg 1272w, https://substackcdn.com/image/fetch/$s_!1YT_!,w_1456,c_limit,f_auto,q_auto:good,fl_progressive:steep/https%3A%2F%2Fsubstack-post-media.s3.amazonaws.com%2Fpublic%2Fimages%2Fcc911561-42ea-431b-b5c9-a1bdd10c2eaa_2969x1250.jpeg 1456w" sizes="100vw" loading="lazy">

](https://substackcdn.com/image/fetch/$s_!1YT_!,f_auto,q_auto:good,fl_progressive:steep/https://substack-post-media.s3.amazonaws.com/public/images/cc911561-42ea-431b-b5c9-a1bdd10c2eaa_2969x1250.jpeg)*V-I curve for 1N4148, normal (left) and log scale current (right). By author.*

In other words, if the input resistor is large enough (10 kΩ or so), we can say that *v<sub>o</sub>* will be dictated by the magnitude of an exponent of some constant base *n* that yields the correct diode current*: I<sub>D </sub>= n<sup>vₒ</sup>*.

We also know that the current that must flow through the diode is proportional to the shift in the input signal (*v<sub>s</sub>*) divided by *R.* This means that we’ve accomplished the number-to-exponent conversion between *v<sub>s </sub>*and *v<sub>o</sub>*. Or, in the mathematical parlance, we’ve calculated a logarithm.

To implement multiplication, we need two logarithmic converters on the input side, a summing amplifier to add the exponents, and then an exponential converter that goes from the summed exponent back to a normal value. That last part can be accomplished by switching the location of the diode and the resistor in the log converter circuit we already have.

### Integration ###

Integration is just a fancy word for summing values over time; if you want to sound posh, you can say that a bucket in your backyard “integrates” rainfall over the duration of a storm.

Although integration is important in calculus, analog integrators have down-to-earth uses too. For example, the circuits can convert square waves into triangular shapes that are useful in electronic musical instruments. The circuit’s ability to produce very linear up and down slopes also comes in handy in [slope-based and delta-sigma ADCs](https://lcamtuf.substack.com/p/dacs-and-adcs-or-there-and-back-again).

The simplest, textbook integrator is shown below:

[

<img src="https://substackcdn.com/image/fetch/$s_!-t1B!,w_1456,c_limit,f_auto,q_auto:good,fl_progressive:steep/https%3A%2F%2Fsubstack-post-media.s3.amazonaws.com%2Fpublic%2Fimages%2F95fd2219-a871-4cf7-a1ac-0fc9a54f2912_2000x682.jpeg" width="1456" height="496" data-attrs="{&quot;src&quot;:&quot;https://substack-post-media.s3.amazonaws.com/public/images/95fd2219-a871-4cf7-a1ac-0fc9a54f2912_2000x682.jpeg&quot;,&quot;srcNoWatermark&quot;:null,&quot;fullscreen&quot;:null,&quot;imageSize&quot;:null,&quot;height&quot;:496,&quot;width&quot;:1456,&quot;resizeWidth&quot;:null,&quot;bytes&quot;:143899,&quot;alt&quot;:null,&quot;title&quot;:null,&quot;type&quot;:&quot;image/jpeg&quot;,&quot;href&quot;:null,&quot;belowTheFold&quot;:true,&quot;topImage&quot;:false,&quot;internalRedirect&quot;:&quot;https://lcamtuf.substack.com/i/182245394?img=https%3A%2F%2Fsubstack-post-media.s3.amazonaws.com%2Fpublic%2Fimages%2F95fd2219-a871-4cf7-a1ac-0fc9a54f2912_2000x682.jpeg&quot;,&quot;isProcessing&quot;:false,&quot;align&quot;:null,&quot;offset&quot;:false}" class="sizing-normal" alt="" srcset="https://substackcdn.com/image/fetch/$s_!-t1B!,w_424,c_limit,f_auto,q_auto:good,fl_progressive:steep/https%3A%2F%2Fsubstack-post-media.s3.amazonaws.com%2Fpublic%2Fimages%2F95fd2219-a871-4cf7-a1ac-0fc9a54f2912_2000x682.jpeg 424w, https://substackcdn.com/image/fetch/$s_!-t1B!,w_848,c_limit,f_auto,q_auto:good,fl_progressive:steep/https%3A%2F%2Fsubstack-post-media.s3.amazonaws.com%2Fpublic%2Fimages%2F95fd2219-a871-4cf7-a1ac-0fc9a54f2912_2000x682.jpeg 848w, https://substackcdn.com/image/fetch/$s_!-t1B!,w_1272,c_limit,f_auto,q_auto:good,fl_progressive:steep/https%3A%2F%2Fsubstack-post-media.s3.amazonaws.com%2Fpublic%2Fimages%2F95fd2219-a871-4cf7-a1ac-0fc9a54f2912_2000x682.jpeg 1272w, https://substackcdn.com/image/fetch/$s_!-t1B!,w_1456,c_limit,f_auto,q_auto:good,fl_progressive:steep/https%3A%2F%2Fsubstack-post-media.s3.amazonaws.com%2Fpublic%2Fimages%2F95fd2219-a871-4cf7-a1ac-0fc9a54f2912_2000x682.jpeg 1456w" sizes="100vw" loading="lazy">

](https://substackcdn.com/image/fetch/$s_!-t1B!,f_auto,q_auto:good,fl_progressive:steep/https://substack-post-media.s3.amazonaws.com/public/images/95fd2219-a871-4cf7-a1ac-0fc9a54f2912_2000x682.jpeg)*Basic integrator.*

Once again, we can note that the linear operation condition is *V<sub>in- </sub>≈ V<sub>in+</sub>.* Further, let’s assume that the input signal is equal to *V<sub>zero </sub>*and the capacitor is discharged, so both op-amp inputs and the output are at about the midpoint.

Next, similarly to the analysis we’ve done for the log amplifier, let’s assume that the input signal shifts up by *v<sub>s</sub> =* 100 mV. For the op-amp to stay at an equilibrium, we would need a sufficient current to flow through the resistor to create a 100 mV voltage drop: *I<sub>R</sub> = v<sub>s</sub>/R.*

The only possible path for this current is the capacitor; a capacitor doesn’t admit steady currents, but it will allow the movement of charges during the charging process, which will kick off when the op-amp’s output voltage begins to drop; this drop causes a voltage differential appears across the capacitor’s terminals.

From the fundamental capacitor equation, charging the capacitor with a constant current *I<sub>R</sub>* for a time *t* will produce the following voltage across its terminals:

To keep *V<sub>in-</sub>* steady, the voltage to which the capacitor gets charged must be accounted for by a directionally opposite shift of the output voltage (*v<sub>o</sub>*). The shift will persist after *V<sub>signal </sub>*returns to the midpoint, because with no charging or discharging current, the capacitor just retains charge. The shift can be undone if *v<sub>s </sub>*swings the other way around.

From the earlier formula for the capacitor voltage, it should be clear that the circuit keeps a sum of (midpoint-relative) input voltages summed over time.

The textbook integrator we’ve been working with has an inverted output: *V<sub>out </sub>*moves down whenever *V<sub>signal </sub>*moves up; this makes it somewhat clunky to use in single-supply applications. The problem can be addressed in a couple of intuitive ways, but a particularly efficient — if positively cursed — solution is shown below:

[

<img src="https://substackcdn.com/image/fetch/$s_!eTfw!,w_1456,c_limit,f_auto,q_auto:good,fl_progressive:steep/https%3A%2F%2Fsubstack-post-media.s3.amazonaws.com%2Fpublic%2Fimages%2F5d8d61dd-aabb-4a58-a723-420459983405_2000x1193.jpeg" width="1456" height="869" data-attrs="{&quot;src&quot;:&quot;https://substack-post-media.s3.amazonaws.com/public/images/5d8d61dd-aabb-4a58-a723-420459983405_2000x1193.jpeg&quot;,&quot;srcNoWatermark&quot;:null,&quot;fullscreen&quot;:null,&quot;imageSize&quot;:null,&quot;height&quot;:869,&quot;width&quot;:1456,&quot;resizeWidth&quot;:null,&quot;bytes&quot;:252797,&quot;alt&quot;:null,&quot;title&quot;:null,&quot;type&quot;:&quot;image/jpeg&quot;,&quot;href&quot;:null,&quot;belowTheFold&quot;:true,&quot;topImage&quot;:false,&quot;internalRedirect&quot;:&quot;https://lcamtuf.substack.com/i/182245394?img=https%3A%2F%2Fsubstack-post-media.s3.amazonaws.com%2Fpublic%2Fimages%2F5d8d61dd-aabb-4a58-a723-420459983405_2000x1193.jpeg&quot;,&quot;isProcessing&quot;:false,&quot;align&quot;:null,&quot;offset&quot;:false}" class="sizing-normal" alt="" srcset="https://substackcdn.com/image/fetch/$s_!eTfw!,w_424,c_limit,f_auto,q_auto:good,fl_progressive:steep/https%3A%2F%2Fsubstack-post-media.s3.amazonaws.com%2Fpublic%2Fimages%2F5d8d61dd-aabb-4a58-a723-420459983405_2000x1193.jpeg 424w, https://substackcdn.com/image/fetch/$s_!eTfw!,w_848,c_limit,f_auto,q_auto:good,fl_progressive:steep/https%3A%2F%2Fsubstack-post-media.s3.amazonaws.com%2Fpublic%2Fimages%2F5d8d61dd-aabb-4a58-a723-420459983405_2000x1193.jpeg 848w, https://substackcdn.com/image/fetch/$s_!eTfw!,w_1272,c_limit,f_auto,q_auto:good,fl_progressive:steep/https%3A%2F%2Fsubstack-post-media.s3.amazonaws.com%2Fpublic%2Fimages%2F5d8d61dd-aabb-4a58-a723-420459983405_2000x1193.jpeg 1272w, https://substackcdn.com/image/fetch/$s_!eTfw!,w_1456,c_limit,f_auto,q_auto:good,fl_progressive:steep/https%3A%2F%2Fsubstack-post-media.s3.amazonaws.com%2Fpublic%2Fimages%2F5d8d61dd-aabb-4a58-a723-420459983405_2000x1193.jpeg 1456w" sizes="100vw" loading="lazy">

](https://substackcdn.com/image/fetch/$s_!eTfw!,f_auto,q_auto:good,fl_progressive:steep/https://substack-post-media.s3.amazonaws.com/public/images/5d8d61dd-aabb-4a58-a723-420459983405_2000x1193.jpeg)*The single-supply, non-inverting integrator.*

As in all other cases, the prerequisite for linear operation is *V<sub>in-</sub>* ≈ *V<sub>in+</sub>*.

We can start the analysis with the two-resistor divider on the top: it simply ensures that *V<sub>in-</sub>* is equal to ½ · *V<sub>out</sub>*. As the bottom portion of the circuit, the instantaneous voltage on the non-inverting input is decided by the capacitor’s charge state (*V<sub>cap</sub>*). The bottom resistors will influence the charge of the capacitor over time, but if we’re living in the moment, we can combine the equations and write the following equilibrium rule:

Equivalently, we can say that *V<sub>out </sub>≈* 2 · *V<sub>cap</sub>*.

We have established that *V<sub>out</sub>* is equal to twice the value of *V<sub>cap</sub>*, but if so, the resistor on the bottom right is subjected to a voltage differential between these two points (always equal to *V<sub>cap</sub>*). From Ohm’s law, the resistor will admit the following current:

If the input voltage is zero, the neighboring resistor to the left is subjected to the same voltage differential, so the current flowing into the junction (*I<sub>1</sub>*) is the same as the current flowing out (*I<sub>2</sub>*). With the currents in balance, the capacitor holds its previous charge and the output voltage doesn’t change.

That said, if the input voltage (*V<sub>signal</sub>*) is non-zero, the voltage differential across the terminals of the resistor on the left is different, and the formula for *I<sub>2</sub>* becomes:

In this case, there is a non-zero balance of the currents flowing in and out via the resistors:

This current is flowing in via the resistor on the right but not flowing out via the resistor on the left, so it necessarily charges the capacitor. Note that the capacitor charging current is independent of *V<sub>cap</sub>*; it remains constant as long as the input voltage is constant too.

As before, from the fundamental capacitor equation (V = I·t/C), we can tell that a constant charging current will cause the voltage on the output leg to ramp up in a straight line. Of course, this will come to an end once we hit the output voltage limit of the amplifier. To reset the circuit, we’d need to short the terminals of the capacitor.

*👉 For another installment of the series, [click here](https://lcamtuf.substack.com/p/cursed-circuits-4-pll-frequency-multiplier).*

[Subscribe now](https://lcamtuf.substack.com/subscribe?)

*If you enjoy the content, please subscribe. I don’t sell anything; it’s just a good way to stay in touch with the authors you like.*