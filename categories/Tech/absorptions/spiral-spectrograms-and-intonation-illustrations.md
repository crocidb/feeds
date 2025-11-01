---
title = "Spiral spectrograms and intonation illustrations"
description = "I've been experimenting with methods for visualising harmony, intonation (tuning), and overtones in music. Ordinary spectrograms aren't very well suited for that as the harmonic relations are not intuitively visible. Let's see what could be done about this. I'll try to sprinkle t"
date = "2021-11-28T16:02:00.009Z"
url = "tag:blogger.com,1999:blog-5096278891763426276.post-4869134420402865795"
author = "Oona Räisänen"
text = ""
lastupdated = "2025-10-22T08:59:03.871177545Z"
seen = true
---

I've been experimenting with methods for visualising harmony, intonation (tuning), and overtones in music. Ordinary spectrograms aren't very well suited for that as the harmonic relations are not intuitively visible. Let's see what could be done about this. I'll try to sprinkle the text with Wikipedia links in order to immerse ([nerd snipe](https://en.wikipedia.org/wiki/Nerd_sniping)?) the reader in the subject.

### Equal temperament cents against time ###

We can examine how tuning evolves during a recording by choosing a reference pitch and plotting all frequencies relative to it modulo 100 [cents](https://en.wikipedia.org/wiki/Cent_(music)). This is similar to what an [electronic tuner](https://en.wikipedia.org/wiki/Electronic_tuner) does, but instead of just showing the fundamental frequency, we'll plot the whole spectrum. Information about the absolute frequencies is lost. This "zoomed-in" plot visualises how the distribution of frequencies fits the 12-tone [equal temperament](https://en.wikipedia.org/wiki/Equal_temperament) system (12-TET) common in Western music.

Here's the first 20 seconds of Debussy's *Clair De Lune* as found on YouTube, played with a well-tuned ([video](https://www.youtube.com/watch?v=CvFH_6DNRCY#t=7s)) and an out-of-tune piano ([video](https://www.youtube.com/watch?v=xgkWOcLT0Lw#t=7s)). The second piano sounds out of tune because there are relative differences in tuning between the strings. The first piano looks to be a few cents sharp as a whole, but consistently so, so it's not perceptible.

[![](https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEitcu6_yTFzFwmNwpEV8KFKefpfG4kILVbRoBMjoYw5b0qXJnWab3aMCmvhrFGOKs3J-EvJi6DiXJI1hzzBAXSdY19HBoeYrwj35nKpqjhtVutYaMHJ4riEuE_wg5p3BbN5tfonWsQ__1F2/s500/debussy.png)](https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEitcu6_yTFzFwmNwpEV8KFKefpfG4kILVbRoBMjoYw5b0qXJnWab3aMCmvhrFGOKs3J-EvJi6DiXJI1hzzBAXSdY19HBoeYrwj35nKpqjhtVutYaMHJ4riEuE_wg5p3BbN5tfonWsQ__1F2/s1000/debussy.png)

The vertical axis is the same that electronic tuners use. All the notes of a chord will appear in the middle, as long as they are well tuned against the reference pitch of, say, [A = 440 Hz](https://en.wikipedia.org/wiki/A440_(pitch_standard)). The top edge of the graph is half a semitone sharp (quarter tone = 50c), and the bottom is half a semitone flat.

Overtones barely appear in the picture because the first three conveniently hit other notes in tune. But from f5 onwards the [harmonic series](https://en.wikipedia.org/wiki/Harmonic_series_(music)) starts deviating from 12-TET and the harmonics start to look out-of-tune (f5 = −14c, f7 = −31c, ...). These can be cut out by filtering, or hoping that they're lower in volume and setting the color range accordingly.

Six months later...

You know how you sometimes accidentally delete a project and have to rewrite it from scratch much later, and it's never exactly the same? That's what happened at this point. It's a little scuffed, but here's some piano music that utilises quarter tones (by Wyschnegradsky). I used the same scale on purpose, so the quarter tones wrap around from the top and bottom.

[![](https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEg_w_F10RjlAfFh2dfoUk6n_cghhzaPR7sYG45J9gtehVncrO-nY1fL4ZGizUo4j41b781dzUBwj60-EkX9L_fpin0Ma-GnSGl_7ZFZcb6Upbzt2V-AL7HPCpy6y0NaFkeh1oJx7yVj9XkQ/s500/quartertones.png)](https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEg_w_F10RjlAfFh2dfoUk6n_cghhzaPR7sYG45J9gtehVncrO-nY1fL4ZGizUo4j41b781dzUBwj60-EkX9L_fpin0Ma-GnSGl_7ZFZcb6Upbzt2V-AL7HPCpy6y0NaFkeh1oJx7yVj9XkQ/s1056/quartertones.png)

More examples of these "intonation plots" in [a tweet](https://twitter.com/windyoona/status/1401573702165204997).

This suits well for piano music. However, not even all western classical music is tuned to equal temperament; for instance, solo strings may be played with Pythagorean intonation[[1]](#Loosen1994), whereas vocal ensembles[[2]](#DAmario2020) and string quartets may tune some intervals closer to just intonation. Unlike the piano, these wouldn't look too good in the equal-note plot.

### Octave spiral ###

If we instead plot the spectrum modulo 1200 cents (1 octave) we get an interesting interval view. We could even ditch the time scale and wind the spectrogram into a spiral to make it prettier and preserve the overtones and absolute frequency information. Now each note is represented by an angle in this spiral; in 12-TET, they're separated by 30 degrees. At any point in the spiral, going 1 turn outwards doubles the frequency.

Here's a C major chord on a piano. Note how the harmonic content adds several high-frequency notes on top of the C, E, and G of the triad chord, and how multiple notes can contribute to the same overtone:

[![](https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEhFURiTfZMg_rFGPBD2invqT_bFHNGfpc-pstZCR6IpeZR1w7-K9MkfK6Rp-MnyBlwzypV5nDOfqsIgszWvjMXPEvVZlVGUUg8JRdYuLf85kAKjJdJ6Slgs8ipm39oEEQuZOga-nIv_Ex4h/s390/cduuri-plot.gif)](https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEhOtGHKCQtsO7AQgTY9WlITvIKzB11TGNt6oZBNDLNCaeSd0YWBrHRNO5Vvyjmo_pL-9PfU0vnPwQEAIVmwE-XIa7hNoI6WYiF8HnJE8PpQIqPjAC44W-Ygiu5jgDTo_kEyXTwKLb_QHbSi/s797/cduuri-plot.gif)

I had actually hoped I would get an *Ultimate Chord Viewer* where any note, regardless of frequency, would have all its harmonics neatly stacked on top of it. But it's not what has happened here: the harmonic series is not a stack of octaves (2^n), but instead of integer multiples (n). Some harmonics appear at seemingly unrelated angles. But it's still a pretty interesting visualisation, and perhaps makes more sense musically.

This plot is also better at illustrating different tuning systems. Let's look at a [major third](https://en.wikipedia.org/wiki/Major_third) interval F-A in equal temperament and [just intonation](https://en.wikipedia.org/wiki/Just_intonation), with a few more harmonics.

[![](https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEhXFPWrnuz599rW3Yw5TrOFUGmj9cAHK7c2eBYwS0kZzKvo1OP6uTcwPsuUu_NyD5esMk04cn4n1Xjkg7mu8bWF17ssjIgS4l-FKAKo23_2AjHmS_XC32NmbVdmlOTTRVb99BVFetsdzgqM/s500/just-equal-optimized.gif)](https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEhXFPWrnuz599rW3Yw5TrOFUGmj9cAHK7c2eBYwS0kZzKvo1OP6uTcwPsuUu_NyD5esMk04cn4n1Xjkg7mu8bWF17ssjIgS4l-FKAKo23_2AjHmS_XC32NmbVdmlOTTRVb99BVFetsdzgqM/s1000/just-equal-optimized.gif)

The intuition from this plot is that equal temperament aims for equal distances (angles) between notes and just intonation tries to make more of the harmonics match instead.

Even though the *Ultimate Chord Viewer* was not achieved I now have ideas for Christmas lights...

### Live visualization ###

Here's what a cappella music with some reverb looks like on the spiral spectrogram.

[![Embedded YouTube video](https://img.youtube.com/vi/VeC8TIu8c5M/0.jpg)](https://www.youtube.com/watch?v=VeC8TIu8c5M)

### A shader toy ###

[This little real-time GLSL demo](https://www.shadertoy.com/view/ftKGRc) on shadertoy draws a spiral FFT from microphone audio. But don't get your hopes up: The spectrograms in this blog post were made with a 65536-point FFT. Shadertoy's 512px microphone texture offers a lot less in terms of frequency range and bins. This greatly blurs the frequency resolution, especially towars the low end. Could it be improved with the right colormap? Or a custom FFT with the waveform texture as its input?

### References ###

* Loosen, F. (1994): [Tuning of diatonic scales by violinists, pianists, and nonmusicians](https://link.springer.com/content/pdf/10.3758/BF03213900.pdf). Perception & Psychophysics 56(2): 221–226.
* D'Amario, S., Howard, D.M., Daffern, H., Pennill, N. (2020): [A Longitudinal Study of Intonation in an *a cappella* Singing Quintet](<  https://www.sciencedirect.com/science/article/pii/S0892199718302418>). Journal of Voice 34(1): 159.e13–159.e27.