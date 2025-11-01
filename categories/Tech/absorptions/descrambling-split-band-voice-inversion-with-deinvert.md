---
title = "Descrambling split-band voice inversion with deinvert"
description = "Voice inversion is a primitive method of rendering speech unintelligible to prevent eavesdropping of radio or telephone calls. I wrote about some simple ways to reverse it in a previous post. I've since written "
date = "2017-09-12T20:31:00.007Z"
url = "tag:blogger.com,1999:blog-5096278891763426276.post-9058513434720041728"
author = "Oona Räisänen"
text = ""
lastupdated = "2025-10-22T08:59:03.888312927Z"
seen = true
---

Voice inversion is a primitive method of rendering speech unintelligible to prevent eavesdropping of radio or telephone calls. I wrote about some simple ways to reverse it in [a previous post](http://www.windytan.com/2013/05/descrambling-voice-inversion.html). I've since written a software tool, deinvert ([on GitHub](https://github.com/windytan/deinvert)), that does all this for us. It can also descramble a slightly more advanced scrambling method called split-band inversion. Let's see how that happens behind the scenes.

### Simple voice inversion ###

Voice inversion works by inverting the audio spectrum at a set maximum frequency called the inversion carrier. Frequencies near this carrier will thus become frequencies near zero Hz, and vice versa. The resulting audio is unintelligible, though familiar sentences can easily be recognized.

(HTML5 audio: Inverted speech.)

*Deinvert* comes with 8 preset carrier frequencies that can be activated with the -p option. These correspond to a list of carrier frequencies I found in an actual scrambler's manual, dubbed "the most commonly used inversion carriers".

The algorithm behind *deinvert* can be divided into three phases: 1) pre-filtering, 2) mixing, and 3) post-filtering. Mixing means multiplying the signal by an oscillation at the selected carrier frequency. This produces two *sidebands*, or mirrored copies of the signal, with the lower one frequency-inverted. Pre-filtering is necessary to prevent this lower sideband from aliasing when its highest components would go below zero Hertz. Post-filtering removes the upper sideband, leaving just the inverted audio. Both filters can be realized as low-pass FIR filters.

[![[Image: A spectrogram in four steps, where the signal is first cut at 3 kHz, then shifted up, producing two sidebands, the upper of which is then filtered out.]](https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEgN5_Zy6ARkoMhJuBl96gzNm3WDMRfEiBqZzb1_E1eQqlQdBvClPr6LvjqGyHfxHVIs88Z0ly9zzGswfkGgqwNsYxwHSZRJ_bMmfq8NKyqaWhM8PeYDYFqKUCeTSPKL72VISb-vycG-6KAL/s500/invert-spectro.png)](https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEgN5_Zy6ARkoMhJuBl96gzNm3WDMRfEiBqZzb1_E1eQqlQdBvClPr6LvjqGyHfxHVIs88Z0ly9zzGswfkGgqwNsYxwHSZRJ_bMmfq8NKyqaWhM8PeYDYFqKUCeTSPKL72VISb-vycG-6KAL/s1600/invert-spectro.png)

This operation is its own inverse, like ROT13; by applying the same inversion again we get intelligible speech back. Indeed, *deinvert* can also be used as a scrambler by just running unscrambled audio through it. The same inversion carrier should be used in both directions.

### Split-band inversion ###

The split-band scrambling method adds another carrier frequency that I call the split point. It divides the spectrum into two parts that are inverted separately and then combined, preventing ordinary inverters from fully descrambling it.

[![](https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEhY40JBjWSghrzwYrHUbHu4r13JVfqKz_8xqYwnwiMiAyqU15wtV2r8WPUeYjgmN_8MbJwPxoVhzfEo8typwXG6GP_BlaA08jF9WC5lSa9ApVT3jH28bPxbEg4YtqkxJlr85Fw9PVSyZEzU/s420/dspchain.png)](https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEhY40JBjWSghrzwYrHUbHu4r13JVfqKz_8xqYwnwiMiAyqU15wtV2r8WPUeYjgmN_8MbJwPxoVhzfEo8typwXG6GP_BlaA08jF9WC5lSa9ApVT3jH28bPxbEg4YtqkxJlr85Fw9PVSyZEzU/s1600/dspchain.png)

A single filter-inverter pair may already bring back the low end of the spectrum. Descrambling it fully amounts to running the inversion algorithm twice, with different settings for the filters and mixer, and adding the results together.

The problem here is to find these two frequencies. But let's take a look at an example from audio scrambled using the CML CMX264 split-band inverter (from [a video by GBPPR2](https://www.youtube.com/watch?v=6qLFTf_T1JI)).

[![[Image: A spectrogram showing a narrow band of speech-like harmonics, but with a constant dip in the middle of the band.]](https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEg6QjzxPReF6UXcSlkUZ0Q6w0MW2SC8M7Z6NdGfBFrBPZxoYtTQu0N8Wtk5Df5IVeVxpsjZ8K3k7Lp6HH4GzhaYGJS1Jnhu6fFOO58QrGqaF_j6rbLyPKoSqAS6vj8x2Qe2PaMRIIkY7Egl/s500/split-point.jpg)](https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEg6QjzxPReF6UXcSlkUZ0Q6w0MW2SC8M7Z6NdGfBFrBPZxoYtTQu0N8Wtk5Df5IVeVxpsjZ8K3k7Lp6HH4GzhaYGJS1Jnhu6fFOO58QrGqaF_j6rbLyPKoSqAS6vj8x2Qe2PaMRIIkY7Egl/s1600/split-point.jpg)

In this case the filter roll-off is clearly visible in the spectrogram and it's obvious where the split point is. The higher carrier is probably at the upper limit of the full band or slightly above it. Here the full bandwidth seems to be around 3200 Hz and the split point is at 1200 Hz. This could be initially descrambled using deinvert -f 3200 -s 1200; if the result sounds shifted up or down in frequency this could be refined accordingly.

### Performance ###

On a single core of an i7-based laptop from 2013, deinvert processes a 44.1 kHz WAV file at 60x realtime speed (120x for simple inversion). Most of the CPU cycles are spent doing filter convolution, i.e. calculating the signal's vector dot product with the low-pass filter kernels:

[![[Image: A graph of the time spent in various parts of the call tree of the program, with the subtree leading to the dot product operation highlighted. It takes well over 80 % of the tree.]](https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEilLXBUcWihSX70UpUUDN5MiA7N5j7kQMppYG43xzuJpYdZH0c0k-19GC5e7_5TfivSeOle408E0WPlnJPe1dEbMMe2OhVBfVw5Jq8ojSq5v8M59cyWGWp46-oUngwwlus8N8VY28HarmeX/s470/deinvert-perf.png)](https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEilLXBUcWihSX70UpUUDN5MiA7N5j7kQMppYG43xzuJpYdZH0c0k-19GC5e7_5TfivSeOle408E0WPlnJPe1dEbMMe2OhVBfVw5Jq8ojSq5v8M59cyWGWp46-oUngwwlus8N8VY28HarmeX/s1600/deinvert-perf.png)

For this reason deinvert has a quality setting (0 to 3) for controlling the number of samples in the convolution kernels. A filter with a shorter kernel is linearly faster to compute, but has a low roll-off and will leave more unwanted harmonics.

A quality setting of 0 turns filtering off completely, and is very fast. For simple inversion this should be fine, as long as the original doesn't contain much power above the inversion carrier. It's easy to ignore the upper sideband because of its high frequency. In split-band descrambling this leaves some nasty folded harmonics in the speech band though.

Here's a descramble of the above CMX264 split-band audio using all the different quality settings in deinvert. You will first hear it scrambled, and then descrambled with increasing quality setting.

\#cmlwave \> div { word-wrap: break-word; word-break: normal; }  const regions\_cml = WaveSurfer.Regions.create(); const wavesurfer\_cml = WaveSurfer.create({ container: '#cmlwave', waveColor: 'rgb(25, 100, 200)', progressColor: 'rgb(0, 100, 100)', mediaControls: true, plugins: [regions\_cml], }); wavesurfer\_cml.load('https://oona.windytan.com/blogfiles/cml-filters.mp3'); wavesurfer\_cml.on('decode', () =\> { regions\_cml.addRegion({ start: 0.6, content: 'Original', drag: false, }) regions\_cml.addRegion({ start: 5.3, content: 'q=0', drag: false, }) regions\_cml.addRegion({ start: 10.2, content: 'q=1', drag: false, }) regions\_cml.addRegion({ start: 15.1, content: 'q=2', drag: false, }) regions\_cml.addRegion({ start: 20, content: 'q=3', drag: false, }) });  \<div class="audiodiv"\>\<audio controls=""\>\<source src="https://oona.windytan.com/blogfiles/cml-filters.mp3" id="cmlaudio"\>(HTML5 audio: Inverted speech.)\</audio\>\</div\>

The default quality level is 2. This should be enough for real-time descrambling of simple inversion on a Raspberry Pi 1, still leaving cycles for an FM receiver for instance:

|(RasPi 1)|Simple inversion|Split-band inversion|
|---------|----------------|--------------------|
|  \-q 0  |  16x realtime  |   5.8x realtime    |
|  \-q 1  | 6.5x realtime  |   3.0x realtime    |
|  \-q 2  | 2.8x realtime  |   1.3x realtime    |
|  \-q 3  | 1.2x realtime  |   0.4x realtime    |

The memory footprint is less than four megabytes.

### Future developments ###

There's a variant of split-band inversion where the inversion carrier changes constantly, called variable split-band. The transmitter informs the receiver about this sequence of frequencies via short bursts of data every couple of seconds or so. This data seems to be FSK, but it shall be left to another time.

I've also thought about ways to automatically estimate the inversion carrier frequency. Shifting speech up or down in frequency breaks the relationships of the harmonics. Perhaps this fact could be exploited to find a shift that would minimize this error?

### Links ###

* [deinvert is on GitHub](https://github.com/windytan/deinvert) - please also see the [wiki](https://github.com/windytan/deinvert/wiki) for detailed instructions on how to compile and use it.