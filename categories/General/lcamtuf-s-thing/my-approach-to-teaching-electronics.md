---
title = "My approach to teaching electronics"
description = "Explaining the reasoning behind my series of articles on electronics -- and asking for your thoughts."
date = "2025-04-19T17:53:07Z"
url = "https://lcamtuf.substack.com/p/my-approach-to-teaching-electronics"
author = "lcamtuf"
text = ""
lastupdated = "2025-10-22T08:57:30.123969968Z"
seen = true
---

On occasion, I quip about the way we teach electronics to hobbyists. We start with hydraulic analogies that compare electricity to water running through pipes. I think it’s a [pretty bad teaching tool](https://lcamtuf.substack.com/p/against-the-hydraulic-analogy) that overstays its welcome, but don’t close the tab just yet: today’s article isn’t going to be about that.

My more substantive gripe is that even as the hydraulic model starts springing leaks, we don’t offer better explanations of inductors, p-n junctions, or voltage sources. Instead, we jump straight to cryptic formulas and ready-made circuit recipes. *“Here’s a non-inverting op-amp with a gain of 1 + R1/R2”*, *“here’s an RC circuit with a cutoff frequency of 1/(2πRC)”*, *“here’s a run of wire with a characteristic impedance of Z<sub>0 </sub>= √(L/C)”*. Where do all these ideas and equations come from? *“Oh, it’s grownup calculus, don’t you worry your pretty little head.”*

I detest this approach. Electronics is by far the most popular and accessible of STEM hobbies; it’s one of the few crafts you can experiment with in an urban apartment without spending big bucks or running afoul of zoning laws. To nourish it, we ought to offer a curriculum that lets determined hobbyists gain deeper insights without needing a college degree.

Of course, complaining on the internet is worthless, so I decided to do a bit better: I embarked on mission to develop and popularize simple explanations of many of the more opaque axioms one needs to understand to get ahead. For example:

* **The behavior of capacitors and inductors:** I [explore the origins](https://lcamtuf.substack.com/p/primer-core-concepts-in-electronic) of the *X<sub>C </sub>= 1/(2πfC)* and *X<sub>L </sub>= 2πfL* equations that underpin much of analog signal processing. The usual textbook derivation of these formulas involves Laplace transforms or phasors. You don’t need any of that!

* **Radio receivers:** I [offer a simple trigonometric proof](https://lcamtuf.substack.com/p/radios-how-do-they-work) for why you can tune a radio by mixing RF signal with a locally-generated sine wave. You’d be hard-pressed to find this covered in any accessible intro to radio theory.

* **Combinations of passive components:** why do we subtract the contributions of capacitors and inductors, but then mess around with square roots to account for resistors? Wikipedia answers this with complex exponentiation — but to show why the math makes sense, you [just need to tilt a triangle](https://lcamtuf.substack.com/p/impedance-part-2-why-do-lcr-meters). This also offers a gentle explanation why complex numbers are a valid representation for impedance in the first place.

* **The math of op-amps:** popular accounts of op-amp theory are often incoherent, with claims such as that *A<sub>OL</sub>* can be assumed to be infinite, or that external resistors set the device’s gain. I derive op-amp equations in a series of articles: [part 1](https://lcamtuf.substack.com/p/the-basics-of-signal-amplification) (general principles of signal amplification), [part 2](https://lcamtuf.substack.com/p/deep-dive-the-instability-of-op-amps) (op-amp stability), [part 3](https://lcamtuf.substack.com/p/building-a-decent-microphone-amplifier) (transimpedance circuits), and [part 4](https://lcamtuf.substack.com/p/johnson-nyquist-and-nvhz) (noise, with a cool tie-in to statistics).

* **Sine wave RMS:** root-mean-square voltages are occasionally useful, but almost never explained in an accessible way. I show that for sine waves, the formula can be derived by [simply rearranging an arithmetic mean](https://lcamtuf.substack.com/p/whats-root-mean-square-voltage).

* **RC voltage curve:** when charging a capacitor through a resistor, the voltage follows a pattern given by an oddball formula: *1 - e<sup>-t/(RC)</sup>*. Why? The answer is tricky, but [you can get surprisingly far](https://lcamtuf.substack.com/p/the-101-of-analog-signal-filtering) without serious calculus.

* **Higher-order filters:** this is where novices are bombarded with exotic lingo of poles, zeroes, Q factors, and *s*-domains. I offer a [gentle intro](https://lcamtuf.substack.com/p/analog-filters-part-2-let-it-ring) that’s rooted in real numbers and understandable circuit mechanics.

* What’s up with the **characteristic impedance** of long wires (*Z<sub>0 </sub>= √(L/C))*? Wikipedia explains it with complex-number differential equations; for comparison, here’s [my take](https://lcamtuf.substack.com/p/signal-reflections-in-electronic).

* **Other circuit-adjacent topics:** I have articles exploring why [sine waves](https://lcamtuf.substack.com/p/why-are-sine-waves-so-common) crop up so often, why the [Fourier transform](https://lcamtuf.substack.com/p/not-so-fast-mr-fourier) actually works, whether [square waves](https://lcamtuf.substack.com/p/is-the-frequency-domain-a-real-place) exist at all, where do [magnetic fields](https://lcamtuf.substack.com/p/whats-the-deal-with-magnetic-fields) come from, what’s the [deal with transistors](https://lcamtuf.substack.com/p/how-do-transistors-work-anyway), and so on. I write whenever I see a gap between pop explanations and reality. It’s not that I can always bridge the divide — but making the gap a bit smaller is still a worthy pursuit.

The most interesting takeaway from this exercise is that the articles seem to be well-received by hobbyists, but are met with a mix of apprehension and indifference from many EE folks. From their perspective, there is a smooth path from elementary school explanations to PhD-level knowledge. Based on my experiences, it never felt that way.

[Subscribe now](https://lcamtuf.substack.com/subscribe?)