---
title = "In pursuit of Otama's tone"
description = "It would be fun to use the Otamatone in a musical piece. But for someone used to keyboard instruments it's not so easy to play cleanly. It has a touch-sensitive (resistive) slider that spans roughly two octaves in just 14 centimeters, which makes it very sensitive to finger pla"
date = "2017-11-25T14:03:00.004Z"
url = "tag:blogger.com,1999:blog-5096278891763426276.post-3263486808318225207"
author = "Oona Räisänen"
text = ""
lastupdated = "2025-10-22T08:59:03.886130720Z"
seen = true
---

It would be fun to use the *Otamatone* in a musical piece. But for someone used to keyboard instruments it's not so easy to play cleanly. It has a touch-sensitive (resistive) slider that spans roughly two octaves in just 14 centimeters, which makes it very sensitive to finger placement. And in any case, I'd just like to have a programmable virtual instrument that sounds like the Otamatone.

What options do we have, as hackers? Of course the slider could be replaced with a MIDI interface, so that we could use a piano keyboard to hit the correct frequencies. But what if we could synthesize a similar sound all in software?

### Sampling via microphone ###

We'll have to take a look at the waveform first. The Otamatone has a piercing electronic-sounding tone to it. One is inclined to think the waveform is something quite simple, perhaps a sawtooth wave with some harmonic coloring. Such a primitive signal would be easy to synthesize.

[![[Image: A pink Otamatone in front of a microphone. Next to it a screenshot of Audacity with a periodic but complex waveform in it.]](https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEheF9HQ5A_3NXK-RZkItzL19UQsYH19clTdD9zIwcqeYbYWLDmuYtQcu08wrquO59vbbdyedkzN7Tx_ZEdHp9Rw2s8b-VlmZNVvOFn6OBEctWfa1qXjbj0qKJpcyWbZNv5eW_JdosnzZ-jA/s500/popfilter.jpg)](https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEheF9HQ5A_3NXK-RZkItzL19UQsYH19clTdD9zIwcqeYbYWLDmuYtQcu08wrquO59vbbdyedkzN7Tx_ZEdHp9Rw2s8b-VlmZNVvOFn6OBEctWfa1qXjbj0qKJpcyWbZNv5eW_JdosnzZ-jA/s1600/popfilter.jpg)

A friend lended me her Otamatone for recording purposes. Turns out the wave is nothing that simple. It's not a sawtooth wave, nor a square wave, no matter how the microphone is placed. But it sounds like one! Why could that be?

I suspect this is because the combination of speaker and air interface filters out the lowest harmonics (and parts of the others as well) of square waves. But the human ear still recognizes the residual features of a more primitive kind of waveform.

### We have to get to the source! ###

Sampling the input voltage to the Otamatone's speaker could reveal the original signal. Also, by recording both the speaker input and the audio recorded via microphone, we could perhaps devise a software filter to simulate the speaker and head resonance. Then our synthesizer would simplify into a simple generator and filter. But this would require opening up the instrument and soldering a couple of leads in, to make a Line Out connector. I'm not doing this to my friend's Otamatone, so I bought one of my own. I named it *TÄMÄ*.

[![[Image: A Black Otamatone with a cable coming out of its mouth into a USB sound card. A waveform with more binary nature is displayed on a screen.]](https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEha-l4G4z3zvNaB_4UpCaVp3G-JkeZgIYI_7q0dfXYQwygBWYMBfXmQsDt1Qvpw0hkwMNTXLjaJE2xz9U7dv-S1yTNSVL8TSH9PhVSNMhZlCCN0QH4aeilTxxOl96IHU22LsseUR7nJ0Yad/s420/otamalineout.jpg)](https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEha-l4G4z3zvNaB_4UpCaVp3G-JkeZgIYI_7q0dfXYQwygBWYMBfXmQsDt1Qvpw0hkwMNTXLjaJE2xz9U7dv-S1yTNSVL8TSH9PhVSNMhZlCCN0QH4aeilTxxOl96IHU22LsseUR7nJ0Yad/s1600/otamalineout.jpg)

I soldered the left channel and ground to the same pads the speaker is connected to. I had no idea about the voltage range in advance, but fortunately it just happens to fit line level and not destroy my sound card. As you can see in the background, we've recorded a signal that seems to be a square wave with a low duty cycle.

[![[Image: Oscillogram of a square wave.]](https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEjpR7HiGi6gtLxjIOXF1q109KtIkKXlX7cN7OAuUa27KLATtKaz0qJ0PxVN3lt3Uf7WvUWo2I3SMpPUV056zLbiDCDhlupMJot1bjHwxWs40sc7jc-x32deNcM0VZariy8N1lW6pb4AK5kk/s450/Screen+Shot+2017-11-24+at+17.24.36.png)](https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEjpR7HiGi6gtLxjIOXF1q109KtIkKXlX7cN7OAuUa27KLATtKaz0qJ0PxVN3lt3Uf7WvUWo2I3SMpPUV056zLbiDCDhlupMJot1bjHwxWs40sc7jc-x32deNcM0VZariy8N1lW6pb4AK5kk/s1600/Screen+Shot+2017-11-24+at+17.24.36.png)

This square wave seems to be superimposed with a much quieter sinusoidal "ring" at 584 Hz that gradually fades out in 30 milliseconds.

Next we need to map out the effect the finger position on the slider has on this signal. It seems to not only change the frequency but the duty cycle as well. This happens a bit differently depending on which one of the three octave settings (LO, MID, or HI) is selected.

The Otamatone has a huge musical range of over 6 octaves:

![[Image: Musical notation showing a range from A1 to B7.]](https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEgV30yNuAN8hCumOCKRSM6a1eySsZbX25hZMl-irAbnntWoNPyfCxa1mB1RrRYp4ekcFdxgKsDBmTV4n1k1bOxE5RP3yMlJQNuerZxHXdZ22VBA_wsWzEMfEoKeBcDv5EWW77ZDqTlDn7BM/s400/otamatone-range.png)

In frequency terms this means roughly 55 to 3800 Hz.

The duty cycle changes according to where we are on the slider: from 33 % in the lowest notes to 5 % in the highest ones, on every octave setting. The frequency of the ring doesn't change, it's always at around 580 Hz, but it doesn't seem to appear at all on the HI setting.

So I had my Perl-based software synth generate a square wave whose duty cycle and frequency change according to given MIDI notes.

### FIR filter 1: not so good ###

Raw audio generated this way doesn't sound right; it needs to be filtered to simulate the effects of the little speaker and other parts.

Ideally, I'd like to simulate the speaker and head resonances as an impulse response, by feeding well-known impulses into the speaker. The generated square wave could then be convolved with this response. But I thought a simpler way would be to create a custom FIR frequency response in REAPER, by visually comparing the speaker input and microphone capture spectra. When their spectra are laid on top of each other, we can read the required frequency response as the difference between harmonic powers, using the cursor in baudline. No problem, it's just 70 harmonics until we're outside hearing range!

[![[Image: Screenshot of Baudline showing lots of frequency spikes, and next to it a CSV list of dozens of frequencies and power readings in the Vim editor.]](https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEjtmPUtBeb_Dr02WSuLA8rcxRlnvZa5aOl2ajaE2kD8i4DtsKFPihJbEkH4f3rpfEsDldTuqv_bqfHEqgyX8yi_xTANmuzXneUIKPYn6EgLJiIXqzeN2RiV5WdgzNMtQsHeXxzuz1rGu2Qz/s480/harmopowers.png)](https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEjtmPUtBeb_Dr02WSuLA8rcxRlnvZa5aOl2ajaE2kD8i4DtsKFPihJbEkH4f3rpfEsDldTuqv_bqfHEqgyX8yi_xTANmuzXneUIKPYn6EgLJiIXqzeN2RiV5WdgzNMtQsHeXxzuz1rGu2Qz/s1600/harmopowers.png)

I then subtracted one spectrum from another and manually created a ReaFir filter based on the extrema of the resulting graph.

[![[Image: Screenshot of REAPER's FIR filter editor, showing a frequency response made out of nodes and lines interpolated between them.]](https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEinekeR8qdGsDJ5sWXxH_9G9jPzvQonFuC2tCSUu5GFzDFCfUW2T93QEIAYoTQ9gWDq-ps4YT6tw_0cK8ePiRheRynLOTBQ511rDIt62Zh5Jt2AJKW0wxbcw168nQqNWTkZzvRoPdAOYbku/s480/Screen+Shot+2017-11-19+at+10.21.26.png)](https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEinekeR8qdGsDJ5sWXxH_9G9jPzvQonFuC2tCSUu5GFzDFCfUW2T93QEIAYoTQ9gWDq-ps4YT6tw_0cK8ePiRheRynLOTBQ511rDIt62Zh5Jt2AJKW0wxbcw168nQqNWTkZzvRoPdAOYbku/s1600/Screen+Shot+2017-11-19+at+10.21.26.png)

Because the Otamatone's mouth can be twisted to make slightly different vowels I recorded two spectra, one with the mouth fully closed and the other one as open as possible.

But this method didn't quite give the sound the piercing nasalness I was hoping for.

### FIR filter 2: better ###

After all that work I realized the line connection works in both directions! I can just feed any signal and the Otamatone will sound it via the speaker. So I generated a square wave in Audacity, set its frequency to 35 Hz to accommodate 30 milliseconds of response, played it via one sound card and recorded via another one:

[![[Image: Two waveforms, the top one of which is a square wave and the bottom one has a slowly decaying signal starting at every square transition.]](https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEjYJqCo1whmphJf0z81cYQFYl1fEZUGrMwVWOX0Hj9tmWNOEvgSAflGjXj7KlwFm4o7glpza3Q5EWV_CIas05s6WRXcth5O8Qjq8Z0s6iRLghEmTA_UW_QaTFiidiYknipr48taEvLcroZg/s450/Screen+Shot+2017-11-22+at+8.19.33.png)](https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEjYJqCo1whmphJf0z81cYQFYl1fEZUGrMwVWOX0Hj9tmWNOEvgSAflGjXj7KlwFm4o7glpza3Q5EWV_CIas05s6WRXcth5O8Qjq8Z0s6iRLghEmTA_UW_QaTFiidiYknipr48taEvLcroZg/s1600/Screen+Shot+2017-11-22+at+8.19.33.png)

The waveform below is called the step response. One of the repetitions can readily be used as a FIR convolution kernel. Strictly, to get an *impulse* response would require us to sound a unit impulse, i.e. just a single sample at maximum amplitude, not a square wave. But I'm not redoing that since recording this was hard enough already. For instance, I had to turn off the fridge to minimize background noise. I forgot to turn it back on, and now I have a box of melted ice cream and a freezer that smells like salmon. The step response gives pretty good results.

One of my favorite audio tools, sox, can do FFT convolution with an impulse response. You'll have to save the impulse response as a whitespace-separated list of plaintext sample values, and then run sox original.wav convolved.wav fir response.csv.

Or one could use a VST plugin like FogConvolver:

[![[Image: A screenshot of Fog Convolver.]](https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEix0nl71C6FiN1Gal1S3F8aETwyyR4KlLG3AmKv9ULa2XqbK63uBWSvNlYSxeGoCyRPfN4Es_9MEw3qNCEdMr8RxEHuSwZfqqjrf_L4Tt8cQYMPm46JzLeScF3klY3U0ssLoKgiArTfrbia/s450/screenshot-fogbank.jpg)](https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEix0nl71C6FiN1Gal1S3F8aETwyyR4KlLG3AmKv9ULa2XqbK63uBWSvNlYSxeGoCyRPfN4Es_9MEw3qNCEdMr8RxEHuSwZfqqjrf_L4Tt8cQYMPm46JzLeScF3klY3U0ssLoKgiArTfrbia/s1600/screenshot-fogbank.jpg)

### A little organic touch ###

There's more to an instrument's sound than its frequency spectrum. The way the note begins and ends, the so-called attack and release, are very important cues for the listener.

The width of a player's finger on the Otamatone causes the pressure to be distributed unevenly at first, resulting in a slight glide in frequency. This also happens at note-off. The exact amount of Hertz to glide depends on the octave, and by experimentation I stuck with a slide-up of 5 % of the target frequency in 0.1 seconds.

It is also very difficult to hit the correct note, so we could add some kind of random tuning error. But turns out this is would be too much; I want the music to at least be in tune.

Glides (glissando) are possible with the virtual instrument by playing a note before releasing the previous one. This glissando also happens in 100 milliseconds. I think it sounds pretty good when used in moderation.

I read somewhere (Wikipedia?) that vibrato is also possible with Otamatone. I didn't write a vibratio feature in the code itself, but it can be added using a VST plugin in REAPER (I use MVibrato from MAudioPlugins). I also added a slight flanger with inter-channel phase difference in the sample below, to make the sound just a little bit easier on the ears (but not too much).

(HTML5 audio: Synthesized Otamatone sample.)

Sometimes the Otamatone makes a short popping sound, perhaps when finger pressure is not firm enough. I added a few of these randomly after note-off.

### Working with MIDI ###

We're getting on a side track, but anyway. Working with MIDI used to be straightforward on the Mac. But GarageBand, the tool I currently use to write music, amazingly doesn't have a MIDI export function. However, you can "File -\> Add Region To Loop Library", then find the AIFF file in the loop library folder, and use a tool called GB2MIDI to extract MIDI data from it.

I used mididump from [python-midi](https://github.com/vishnubob/python-midi) to read MIDI files.

### Tyna Wind - lucid future vector ###

Here's *TÄMÄ*'s beautiful synthesized voice singing us a song.

[![Embedded YouTube video](https://img.youtube.com/vi/X3k7HD28RbQ/0.jpg)](https://www.youtube.com/watch?v=X3k7HD28RbQ)