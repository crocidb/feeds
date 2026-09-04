---
title = "Virtual music box"
description = "A little music project I was writing required a melody be played on a music box. However, the paper-programmable music box I had (pictured) could only play notes on the C major scale. I couldn't easily find a realistic-sounding synthesizer version either. They all seemed to be mi"
date = "2017-07-17T12:36:00.001Z"
url = "tag:blogger.com,1999:blog-5096278891763426276.post-6592031198153579571"
author = "Oona Räisänen"
text = ""
lastupdated = "2025-10-22T08:59:03.892381174Z"
seen = true
---

A little music project I was writing required a melody be played on a music box. However, the paper-programmable music box I had (pictured) could only play notes on the C major scale. I couldn't easily find a realistic-sounding synthesizer version either. They all seemed to be missing something. Maybe they were too perfectly tuned? I wasn't sure.

Perhaps, if I digitized the sound myself, I could build a flexible virtual instrument to generate just the perfect sample for the piece!

[![[Image: A paper programmable music box.]](https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEi3dtNWvQ6egqAgWx-_k9__beJ6HvB4UPg6nS5DVTClY1ytN56t9x6Sw2mZdZI9eJPwpxWXi3DSd9ywFSd3jyTErBQoprIybZ1rr7c6blyFotHO5uV0JsYiJ-rulJfua0sYJhN6VkCr_VSS/s450/IMG_6798.jpg)](https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEi3dtNWvQ6egqAgWx-_k9__beJ6HvB4UPg6nS5DVTClY1ytN56t9x6Sw2mZdZI9eJPwpxWXi3DSd9ywFSd3jyTErBQoprIybZ1rr7c6blyFotHO5uV0JsYiJ-rulJfua0sYJhN6VkCr_VSS/s1600/IMG_6798.jpg)

I haven't really made a sampled instrument before, short of perhaps using Impulse Tracker clones with terrible single-sample ones. So I proceeded in an improvised manner. Below I'll post some interesting findings and sound samples of how the instrument developed along the way. There won't be any source code as for now.

By the way, there is [a great explanatory video](https://www.youtube.com/watch?v=COty6_oDEkk) by engineerguy about the workings of music boxes that will explain some terminology ("pins" and "teeth") used in this post.

### Recording samples ###

[![[Image: A recording setup with a microphone.]](https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEhFI67wIrNfYfUA4m244LiKXFxr1ua_6ZbA3w3B911IJX40ZcckRT5L_pl-SqgnDjIq00wqbROQQiKr3WY-h5B5K6yTHpsumwsvHI09rtyXre6pOOj5TdWQm1rUyZQlFX_sxzdz322Z09jw/s240/IMG_7607.JPG)](https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEhFI67wIrNfYfUA4m244LiKXFxr1ua_6ZbA3w3B911IJX40ZcckRT5L_pl-SqgnDjIq00wqbROQQiKr3WY-h5B5K6yTHpsumwsvHI09rtyXre6pOOj5TdWQm1rUyZQlFX_sxzdz322Z09jw/s1600/IMG_7607.JPG)

The first step was, obviously, to record the sound to be used as samples. I damped my room using towels and mattresses to minimize room echo; this could be added later if desired, but for now it would only make it harder to cleanly splice the audio. The microphone used was the Audio Technica AT2020, and I digitized it using the Behringer Xenyx 302 USB mixer.

I perforated a paper roll to play all the possible notes in succession, and rolled the paper through. The sound of the paper going through the mechanism posed a problem at first, but I soon learned to stop the paper at just the right moment to make way for the sound of the tooth.

Now I had pretty decent recordings of the whole two-octave range. I used Audacity to extract the notes from the recording, and named the files according to the actual playing MIDI pitch. (The music box actually plays a G# major scale, contrary to what's marked on the blank paper rolls.)

### The missing notes ###

Next, we'll need to generate the missing notes that don't belong in the scale of this music box. Because pitch is proportional to the speed of vibration, this could be done by simply speeding up or slowing down an adjacent note by just the right factor. In equal temperament tuning, this factor would be the 12th root of 2, or roughly 1.05946. Such scaling is straightforward to do on the command line using SoX, for instance (sox c1.wav c\_sharp1.wav speed 1.05946).

![[Image: Musical notation explaining transposition by multiplication by the 12th root of 2.]](https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEhcfWi9CVTYXztYkPcGYsJzxJg9ZLbXvg5ZjInnFWXMW0EHcng-N394B2myUJju5mKhEY54OB4g9ZeOatQXe0cX-VOAdCuLecez_uLibvqIFuv4KoP_KIwHI1jaqJFdx0IFBkmJ2VegCLVK/s380/notes_12root_t.png)

This method can also be used to generate whole new octaves; for example, a transposition of +8 semitones would have a ratio of (<sup>12</sup>√2)<sup>8</sup> ≈ 1.5874. Inter-note variance could be retained by using a random source file for each resampled note. But large-interval transpositions would probably not sound very good due to coloring in the harmonic series.

Here's a table of some intervals and the corresponding speed ratios in equal temperament:

|–3 |\= (<sup>12</sup>√2)<sup>–3</sup>|≈ 0.840896|
|---|---------------------------------|----------|
|–2 |\= (<sup>12</sup>√2)<sup>–2</sup>|≈ 0.890899|
|–1 |\= (<sup>12</sup>√2)<sup>–1</sup>|≈ 0.943874|
|\+1|\= (<sup>12</sup>√2)<sup>1</sup> |≈ 1.059463|
|\+2|\= (<sup>12</sup>√2)<sup>2</sup> |≈ 1.122462|
|\+3|\= (<sup>12</sup>√2)<sup>3</sup> |≈ 1.189207|

### First test! ###

Now I could finally write a script to play my melody!

(HTML5 audio: Music box notes.)

It sounds pretty good already - there's no obvious noise and the samples line up seamlessly even though they were just naively glued together sample by sample. There's a lot of power in the lower harmonics, probably because of the big cardboard box I used, but this can easily be changed by EQ if we want to give the impression of a cute little music box.

### Adding errors ###

The above sound still sounded quite artificial, I think mostly because simultaneous notes start on the same exact millisecond. There seems to be a small timing variance in music boxes that is an important contributor to their overall delicate sound. In the below sample I added a timing error from a normal distribution with a standard deviation of 11 milliseconds. It sounds a lot better already!

(HTML5 audio: Music box notes.)

### Other sounds from the teeth ###

If you listen to recordings of music boxes you can occasionally hear a high-pitched screech as well. It sounds a bit like stopping a tuning fork or guitar string with a metal object. That's why I thought it must be the sound of the pin stopping a vibrating tooth just before playing another note on the same tooth.

[![[Image: Spectrogram of the beginning of a note with the characteristic screech, centered around 12 kilohertz.]](https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEjJ5FEUZCR7qcTWZglyBnW7MmpAGYuN_19HRlgJPM7BQfHMrPkt2lDX_mwrmwVdZeB2MUO1KH-xUBbgRs0vpBjT5zLwyTo1ZDHpdPwHiOjRhdR3h0qNoE0QIKQLgsC0qA4Y7VK03HLxfTGt/s470/screech.jpg)](https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEjJ5FEUZCR7qcTWZglyBnW7MmpAGYuN_19HRlgJPM7BQfHMrPkt2lDX_mwrmwVdZeB2MUO1KH-xUBbgRs0vpBjT5zLwyTo1ZDHpdPwHiOjRhdR3h0qNoE0QIKQLgsC0qA4Y7VK03HLxfTGt/s1600/screech.jpg)

Sure enough, this sound could always be heard by playing the same note twice in quick succession. I recorded this sound for each tooth and added it to my sound generator. The sound will be generated only if the previous note sample is still playing, and its volume will be scaled in proportion to the tooth's envelope amplitude at that moment. Also, it will silence the note. The amount of silence between the screech and the next note will depend on a tempo setting.

Adding this resonance definitely brings about a more organic feel:

(HTML5 audio: Music box notes.)

### The wind-up mechanism ###

For a final touch I recorded sounds from the wind-up mechanism of another music box, even though this one didn't have one. It's all stitched up from small pieces, so the number of wind-ups in the beginning and the speed of the whirring sound can all be adjusted. I was surprised at the smoothness of the background sound; it's a three-second loop with no cross-fading involved. You can also hear the box lid being closed in the end.

(HTML5 audio: Music box notes.)

### Notation ###

[![[Image: VIM screenshot of a text file containing music box markup.]](https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEg0Rm4-UqZZbjeo4nVT9jXakV-VhqLzrOg7N_h0NU-P8VTbNLgX6WiZqpTPAbe5BZYWDxxAehgdQKiKHxyX8oTyHZ5psG4mD3zDc7wTFw4bcOnetXIUnTzhkAWP2MqDFjsqVaXvR7n_tDTV/s320/Screen+Shot+2017-07-17+at+15.22.27.png)](https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEg0Rm4-UqZZbjeo4nVT9jXakV-VhqLzrOg7N_h0NU-P8VTbNLgX6WiZqpTPAbe5BZYWDxxAehgdQKiKHxyX8oTyHZ5psG4mD3zDc7wTFw4bcOnetXIUnTzhkAWP2MqDFjsqVaXvR7n_tDTV/s1600/Screen+Shot+2017-07-17+at+15.22.27.png)

The native notation of a music box is some kind of a perforated tape or drum, so I ended up using a similar format. There's a tempo marking and tuning information in the beginning, followed by notation one eighth per line. Arpeggios are indicated by a pointy bracket \>. I also wrote a script to convert MIDI files into this format; but the number of notes in a music box loop is usually so small that it's not very hard to write manually.

This format could include additional information as well, perhaps controlling the motor sound or box size and shape (properties of the EQ filter).

This format could also potentially be useful when producing or transcribing music from music drums.

### Future developments ###

Currently the music box generator has a hastily written "engineer's UI", which means I probably won't remember how to use it in a couple months' time. Perhaps it could it be integrated into some music software, as a plugin.

Possibilities for live performances are limited, I think. It wouldn't work exactly like a keyboard instrument usually does. At least there should be a way to turn on the background noise, and the player should take into account the 300-millisecond delay caused by the pin slowly rotating over the tooth. But it could be used to play a roll in an endless loop and the settings could be modified on the fly.

As such, the tool performs best at pre-rendering notated music. And I'm happy with the results!

[![Embedded YouTube video](https://img.youtube.com/vi/_JbUFpZtRiE/0.jpg)](https://www.youtube.com/watch?v=_JbUFpZtRiE)