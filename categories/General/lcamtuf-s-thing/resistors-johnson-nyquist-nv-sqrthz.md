---
title = "Resistors, Johnson-Nyquist, nV/√Hz"
description = "A major source of noise in electronic circuits is easy to understand. The unit we use to measure it is not."
date = "2025-04-16T19:01:16Z"
url = "https://lcamtuf.substack.com/p/johnson-nyquist-and-nvhz"
author = "lcamtuf"
text = ""
lastupdated = "2025-10-22T08:57:30.127318910Z"
seen = true
---

*This article assumes familiarity with the physics of conduction and core concepts in electronics. If you need a refresher, start [here](https://lcamtuf.substack.com/p/but-good-sir-what-is-electricity) and [here](https://lcamtuf.substack.com/p/primer-core-concepts-in-electronic).*

Back in January, in an [article on choosing op-amps](https://lcamtuf.substack.com/p/choosing-an-op-amp-for-your-project), I talked about a way of expressing electronic noise using a peculiar unit: nV/√Hz. The mechanics of working with this concept, known as “noise density”, are fairly simple. You take the number and multiply it by the square root of the bandwidth you’re interested in. The result is a voltage noise figure you should expect.

The application of the idea is simple, but the reasons why we do it this way are not at all clear. It’s not hard to imagine that if there’s a source of noise in a circuit, we’d measure its contribution in volts. Further, if the noise is distributed evenly across some range of frequencies, it’s only a bit of a leap to assume that we could calculate its strength in volts per hertz. But where the heck did that square root come from?

You’d be hard-pressed to find a good explanation on the internet. I think we can fix this — but first, let’s have a look at the physical phenomenon that makes the noise appear in the first place.

### Making friends with Johnson and Nyquist ###

In any conductor, random thermal fluctuations can produce momentary shifts in the distribution of charge carriers. In classical terms, we could say that the atoms vibrate and occasionally toss some of the free electrons around.

In good conductors, this stochastic process doesn’t result in noteworthy voltage fluctuations because the resulting electrostatic fields are equalized nearly instantly and can’t build up over time. In resistive materials, on the other hand, the equalization is hindered. This means we can observe a degree of inherent voltage noise; the amount of this noise grows in relation to resistance and to temperature.

In most cases, the magnitude of the effect is too small too matter; the voltages are barely measurable with standard lab instruments and are usually eclipsed by other sources of interference, such as radio transmissions and power supply ripple. That said, in precision amplifiers designed to work with faint signals, large resistances placed in the signal path can severely compromise circuit performance. Resistor noise is an issue in [radio receivers](https://lcamtuf.substack.com/p/radios-how-do-they-work), [microphone amplifiers](https://lcamtuf.substack.com/p/building-a-decent-microphone-amplifier), and more.

These thermally-induced voltage fluctuations appear uniform at all frequencies that matter in everyday electronic circuits: they look the same if we sample the signal at 10 kHz or 10 MHz. Because of this, if we consider the [frequency domain](https://lcamtuf.substack.com/p/not-so-fast-mr-fourier), we can model the phenomenon as a series of independent, “fractional” noise generators operating in different frequency bands, each pumping out a signal with the same (narrow) bandwidth and amplitude.

If we take this approach, depending on the bandwidth admitted by the amplifier, we end up with a varying number of these fractional noise sources adding up to a voltage that can be observed on the oscilloscope screen. What remains is to figure what’s the actual voltage swing produced if we add *n* such sources.

### Modeling independent noise sources ###

The behavior of the sum of noise signals can be analyzed with different degrees of mathematical rigor. That said, to build basic intuition, we can imagine a pair of independent, uniform signals that only take two values: *-a* or *+a*. When adding these signals together, there are four possible signal addition patterns, each occurring with equal probability:

To make progress, we need to figure out how to describe the overall effect of the summed voltages with a single number. The most obvious answer is the arithmetic mean — except the arithmetic mean of any uniform noise is zero, so we don’t learn anything by calculating that:

The peak value seems more promising, but the folly of this approach is evident if we consider a larger number signals (or of possible voltage levels). For example, if we have ten of our two-value signals summed together, the number of rows in the table would grow to 1024 — yet, the peak values would appear only in the two outlying rows, when all the component signals being all negative or all positive.

In that scenario, the peak value would only have a 0.2% chance of occurring. As we get away from discrete-value models and move toward continuous phenomena in the real world, the probability of hitting the theoretical peak becomes vanishingly low and the value becomes meaningless.

### RMS to the rescue ###

Earlier in the series, we introduced the concept of [root-mean-square voltage](https://lcamtuf.substack.com/p/whats-root-mean-square-voltage). The RMS value is calculated by taking the square root (R) of the mean value (M) of the squared waveform. That is to say, if we take our earlier two-signal example, the RMS voltage would be:

In physical terms, *Vrms* describes the equivalent voltage that would deliver the same electrical power to a load as the averaged waveform does. The derivation of the method from fundamental circuit equations is discussed in the [aforementioned article](https://lcamtuf.substack.com/p/whats-root-mean-square-voltage).

On the surface of it, it’s not well-suited for measuring voltage noise, because in most applications, we aren’t interested in the actual power delivered by the noise; instead, we want to know the amount of distortion superimposed on top of a voltage signal we care about. That said, RMS has three useful properties: the value is non-zero for symmetrical waveforms; the parameter it corresponds to — power — is broadly applicable and plays nicely with other equations in physics; and the way we calculate RMS voltages has a serendipitous similarity to *standard deviation* in statistics. We’ll circle back to that last part soon.

Again, for the two-signal scenario outlined above, regardless of the order the summed values might appear in the waveform, the RMS voltage will be *√2 · a*. We can also try this for a three-signal scenario:

In this case, the RMS value works out to √3 times *a*:

More generally, for any number *n* of independent signal sources*,* we arrive at an RMS value equal to the amplitude of the component signal (*a*) multiplied by *√n.*

This is the origin of the nV/√Hz construct: to get the RMS figure for a particular scenario, we take the amplitude of “fractional” noise contributed by a hypothetical noise generator running in a nominal chunk of the spectrum (one hertz), and we then multiply it by the **square root** of the number of generators (*n*) that would be present in the slice of the bandwidth we’re admitting through our circuit.

The remaining question is the utility of this construct: again, we typically don’t care about the average power delivered by noise; we care about the amplitude on the oscilloscope screen. It’s not clear that the *Vrms* reading useful for that.

Luckily, as noted earlier, the way we calculate *Vrms* is identical to how we calculate the standard deviation in statistics. The standard deviation describes the probability that a measurement of a random process would fall within some distance of the baseline. The parameter is calculated by taking the square root of the mean of squared “errors” from the arithmetic mean (here, 0 V). That’s to say, for the signal we’re analyzing, the deviation (*σ*) is exactly the same as *Vrms.*

In a random process such as thermal noise, the laws of statistics tell us that more than 99.7% of measurements should fall within +/- three standard deviations (*3σ,* or 3 × *V<sub>RMS</sub>*) of 0 V. This means that the highest peak-to-peak voltage noise you’re likely to see on the oscilloscope should be less than 6 × V<sub>RMS</sub>.

### Sir, what about resistors? ###

Right. We’ve previously noted that the amount of thermal noise contributed by a resistor is a function of its resistance and temperature. More specifically, this describes the *power* of thermal noise; to get to the voltage spectral density, we need to take a square root. The formula for a given resistor at a given temperature in kelvins (*T<sub>K</sub>*) is:

In the equation, *k<sub>B</sub>* is the physical Boltzmann constant that relates particle energy to temperature; it’s equal to about 1.381 × 10<sup>-23 </sup> joules per kelvin.

At first glance, the units here don’t make any sense: it feels like we’re mashing together random concepts in electronics and thermodynamics. Not so! As should be obvious from the preceding paragraph, the unit for *k<sub>B </sub>*× *T<sub>K </sub>*is joules. A joule is the energy equivalent to one watt × one second. From [Joule’s law](https://lcamtuf.substack.com/p/primer-core-concepts-in-electronic), watts are equivalent to V² / Ω. The ohms in this expansion cancel out with the unit of R, so the expression under the square root boils down to just V² × s. After taking the square root, we end up with V × √s. The reciprocal of a second is one hertz, so we can also write this as V / √Hz. Phew!

At room temperature, if we’re willing to play fast and loose with units, the formula can be simplified to:

As a practical example, for a 10 kΩ resistor, thermal noise density is around 13 nV / √Hz. In a microphone amplifier designed to let through a bandwidth of 20 kHz, the RMS input noise contributed by that resistor in the signal will be in the vicinity of 1.3 µV (typically less than 7.8 µV peak-to-peak).

The formula is the theoretical noise floor. In practice, depending on their construction method, resistors will also exhibit some amount of excess noise above this baseline, which is not necessarily distributed uniformly across all frequencies. In particular, carbon resistors fare worse than wirewound or metal film.

*👉 For a catalog of other articles on electronics, [click here](https://lcamtuf.coredump.cx/offsite.shtml). In particular, you might like the recent posts on [ceramic capacitors](https://lcamtuf.substack.com/p/real-mlccs-and-inductors-have-curves) or [lemon batteries](https://lcamtuf.substack.com/p/why-do-lemon-batteries-work).*

---

*I write well-researched, original articles about geek culture, electronic circuit design, and more. **If you like the content, please subscribe.** It’s increasingly difficult to stay in touch with readers via social media; my typical post on X is shown to less than 5% of my followers and gets a \~0.2% clickthrough rate.*

[Subscribe now](https://lcamtuf.substack.com/subscribe?)