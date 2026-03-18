---
title = "Decibels are ridiculous"
description = "Celebrating a rare dumpster fire in the kingdom of science."
date = "2025-05-22T04:14:20Z"
url = "https://lcamtuf.substack.com/p/decibels-are-ridiculous"
author = "lcamtuf"
text = ""
lastupdated = "2025-10-22T08:57:30.099999838Z"
seen = true
---

I don’t have many pet peeves. That said, no matter how hard I try, I just can’t get over the sheer madness of the scientific “unit” we call the decibel (dB).

<iframe src="https://player.vimeo.com/video/257122744?autoplay=0" frameborder="0" gesture="media" allow="autoplay; fullscreen" allowautoplay="true" allowfullscreen="true"></iframe>

What’s a decibel? Well, the most common answer is “uhh". The second most common answer is that it’s “a way to measure loudness”. But it isn’t! A decibel is not a unit in any conventional sense: it’s more akin to a prefix such as *mega-* in *megabyte.* It describes a change in magnitude.

On the face of it, the idea makes sense. We sometimes want to say that some quantity has increased 10× or 1,000× — and in engineering, such ratios can get large. In principle, we have several types of shorthand notations for big numbers; for example, instead of “300,000” we can write “3e5”. That said, I don’t know how to pronounce “3e5”, so it’s not unreasonable to come up with a name for the exponent. “An increase of five *clerts*” could mean that something has grown by a factor of 10<sup>5</sup>. As a bonus, splitting out exponents reduces multiplication to addition (10*<sup>a </sup>*· 10*<sup>b </sup>*= 10*<sup>a+b</sup>*), simplifying some of the magnitude-related math.

This brings us to a pseudo-unit called the *bel*. At first blush, it works just like our clert: it’s specifies the exponent of a 10*<sup>n </sup>*multiplier. In other words, +1 bel is a 10× increase (10*<sup>+1</sup>*); meanwhile, -2 bels means a decrease of 100× (10*<sup>-2</sup>*). The bel is named in honor of Alexander Bell; this is in the same tradition that prompted us to name the “wat” in honor of James Watt.

But wait, there’s a twist! The bel was originally devised for measuring power in electronic circuits. In some cases, the dissipated power has a quadratic relationship to the applied voltage; for example, for resistive loads, we have [Joule’s law](https://lcamtuf.substack.com/p/primer-core-concepts-in-electronic):

In this scenario, if the applied voltage increases by a factor of *x<sup>1</sup>*, the consumed power increases by a factor of *x<sup>2</sup>*. More generally, if the voltage applied to a resistor increases *n* clerts, then power dissipation jumps up *2n* clerts. This is because (*x<sup>n</sup>)<sup>2</sup> = x<sup>2n</sup>*.

Seeing this, some madman decided that 1 bel should always describe a hypothetical 10× increase in power, *even if it’s applied to another base unit*. This means that if you’re talking about watts, +1 bel is an increase of 10×; but if you’re talking about volts, it’s an increase of √10×. This is nuts: it’s akin to saying that the *milli-* prefix should have different meanings depending on whether we’re talking about meters or liters. And what if you want to express some other ratio using this scale — is frequency more like power or more like voltage?

The weirdness didn’t end there. For some reason, the bel — again, what started as a sensible 10× increment — was soon deemed too big to use, but only *slightly* so. Instead of putting up with the occasional fraction or switching to base 2, we divided the bel into ten steps known as *decibels*. In effect, we started raising 10 to fractional powers, producing irrational per-dB multipliers:

The original unit is long-forgotten; we use decibels exclusively.

What didn’t change from bels to decibels is that the concept describes nothing more than a ratio between two quantities; the value is meaningless unless we know the base unit and the reference point (e.g., 1 V). As a matter of custom, however, both of these are often underspecified; in many fields, the decibel evolved into a standalone unit (or an entire collection thereof). This makes it an *“if you know, you know”* kind of a deal.

For example, in acoustics, the “dB” unit actually corresponds to air pressure in pascals (quick quiz: is that a power-like or a voltage-like quantity?). As for the meaning of 0 dB, the measurement is usually indexed to a 1 kHz sound wave that exerts 20 μPa of pressure. This makes some sense: it’s roughly the threshold of human hearing. That said, no part of the “dB” label hints at any of that.

From this 0 dB origin, we derive two parallel acoustic scales. One measures the absolute sound pressure level with no regard to frequency; another is weighted to mimic human hearing. The hearing-compensated scale peaks at 3 kHz, then tapers off sharply below 200 Hz and above 10 kHz.

Now, let’s imagine you’re trying to buy a microphone; the spec will give you a sensitivity figure such as -45 dB. Is that one of the two acoustic decibels? Fat chance! Here, the real unit is volts. The zero point on that scale describes a hypothetical microphone that outputs 1 V ([root-mean-square](https://lcamtuf.substack.com/p/whats-root-mean-square-voltage)) in response to a reference sound level. If the microphone you’re looking at is specified at -45 dB, it means that the measured swing is 1 V · 10*<sup>-45/20</sup>*, or about 6 mV.

But hold on: what’s that reference sound level? “Oh, I know,” you exclaim, “it’s the threshold of human hearing”. Nope! It’s 94 dB higher, roughly the loudness of a gas-powered lawnmower. We can play that game for a long time.

Even in situations where a decibel “unit” has a suffix to hint at what it describes, the naming schemes make little sense. For example, in radio applications, you can come across “dBm”. Is that decibel-meters? No, that would be silly: it’s a measurement of power relative to 1 milliwatt. So, it must follow that “dBμ” is related to 1 microwatt? Hah! The “μ” actually stands microvolts. And you *really* don’t want to confuse that with “dBu”…

---

*I write [well-researched, original articles](https://lcamtuf.coredump.cx/offsite.shtml) about geek culture, algorithms, and electronic circuit design (+ comparatively few rants about decibels). **If you like the content, please subscribe.** It’s increasingly difficult to stay in touch with readers via social media; my typical post on X is shown to less than 5% of my followers and gets a \~0.2% clickthrough rate.*

[Subscribe now](https://lcamtuf.substack.com/subscribe?)