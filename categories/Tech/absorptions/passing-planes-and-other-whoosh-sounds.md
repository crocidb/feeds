---
title = "Passing planes and other whoosh sounds"
description = '''I always assumed that the recognisable 'whoosh' sound a plane or helicopter makes when passing overhead simply comes from the famous Doppler effect. But when you listen closely, this explanation doesn't make complete sense.\planepassingwave \div { word-wrap: break-word; word'''
date = "2025-04-16T20:14:00.027Z"
url = "tag:blogger.com,1999:blog-5096278891763426276.post-2080249921577037368"
author = "Oona Räisänen"
text = ""
lastupdated = "2025-10-22T08:59:03.860427507Z"
seen = true
---

I always assumed that the recognisable 'whoosh' sound a plane or helicopter makes when passing overhead simply comes from the famous *Doppler effect*. But when you listen closely, this explanation doesn't make complete sense.

\#planepassingwave \> div { word-wrap: break-word; word-break: normal; }  const regions = WaveSurfer.Regions.create(); const wavesurfer\_whoosh = WaveSurfer.create({ container: '#planepassingwave', waveColor: 'rgb(25, 100, 200)', progressColor: 'rgb(0, 100, 100)', mediaControls: true, plugins: [regions], }); wavesurfer\_whoosh.load('https://oona.windytan.com/blogfiles/plane-chopper-passing.mp3'); wavesurfer\_whoosh.on('decode', () =\> { // Regions regions.addRegion({ start: 6, content: 'Plane', drag: false, }) regions.addRegion({ start: 25, content: 'Helicopter', drag: false, }) });  \<div class="audiodiv"\>\<audio controls=""\>\<source src="https://oona.windytan.com/blogfiles/plane-chopper-passing.mp3" id="planepassingaudio"\>\</audio\>\</div\>

(Audio clipped from freesound - [here](https://freesound.org/people/bruno.auzet/sounds/706432/) and [here](https://freesound.org/people/TRP/sounds/572703/))

A classic example of the Doppler effect is the sound of a passing ambulance constantly descending in pitch. When a plane flies overhead the roar of the engine sometimes does that as well. But you can also hear a wider, breathier noise that does something different: it's like the pitch goes down at first, but when the plane has passed us, the pitch *goes up* again. That's not how Doppler works! What's going on there?

### Comb filtering. ###

Let's shed light on the mystery by taking a look at the sound in a time-frequency spectrogram. Here, time runs from left to right, frequencies from top (high) to bottom (low).

[<img alt="" border="0" width="500" data-original-height="607" data-original-width="808" src="https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEiMDViAV8nENqTXos9Py_NjQrrr0ZAYqZSCB6M9Zo2r_UZYljDL-TmH3_5qs0JTlX4DUBX4iNQDujpxu8_leamRKzfywNbvK6tTIXwbXjkfmj8peXD8qycS0ROeMUPNj45YmpW-4eUYq1ey4rlEYXxDh1Yh7tvXvHmQaLX6ShohmRGrsbi2VkfCDWLAhFze/s808/plane_pass.jpg">](https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEiMDViAV8nENqTXos9Py_NjQrrr0ZAYqZSCB6M9Zo2r_UZYljDL-TmH3_5qs0JTlX4DUBX4iNQDujpxu8_leamRKzfywNbvK6tTIXwbXjkfmj8peXD8qycS0ROeMUPNj45YmpW-4eUYq1ey4rlEYXxDh1Yh7tvXvHmQaLX6ShohmRGrsbi2VkfCDWLAhFze/s808/plane_pass.jpg)

We can clearly see one part of the sound (the one starting at 2500 Hz) sweeping downwards, or from high to low frequencies; this should be the Doppler effect. But there's something else happening at the bottom of the image – another pattern is moving down at first, then up again...

This sound's frequency distribution seems to form a series of moving peaks and valleys. This resembles what audio engineers would call ['comb filtering'](https://en.wikipedia.org/wiki/Comb_filter), due to its appearance in the spectrogram. When the peaks and valleys move about it causes a 'whoosh' sound; this is the same principle as in the [flanger](https://en.wikipedia.org/wiki/Flanging) effect used in music production. But these are just jargon for the electronically created version. We can call the acoustic phenomenon the whoosh.

The comb pattern is caused by two copies of the same exact sound arriving at a slightly different times, close enough that they form an interference pattern. It's closely related to what happens to light in the [double slit experiment](https://thefouriertransform.com/applications/diffraction3.php). In recordings this often means that the sound was captured by two microphones and then mixed together; you can sometimes hear this happen unintentionally in podcasts and radio shows. So my thought process is, are we hearing two copies of the plane's sound? How much later is the other one arriving, and why? And why does the 'whoosh' appear to go down in pitch at first, then up again?

### Into the cepstral domain. ###

The *cepstrum*, which is the inverse Fourier transform of the estimated log spectrum, is a fascinating plot for looking at delays and echoes in complex (as in complicated) signals. While the spectrum separates frequencies, the cepstrum measures time, or *quefrency* – see what they did there? It reveals cyclicities in the sound's structure even if it interferes with itself, like in our case. In that it's similar to autocorrelation.

It's also useful for looking at sounds that, experientially, have a 'pitch' to them but that don't show any clear spectral peak in the Fourier transform. Just like the sound we're interested in.

Here's a time-*quefrency cepstrogram* of the same sound (to be accurate, I used the *autocepstrum* here for better clarity):

[<img alt="" border="0" width="501" data-original-height="669" data-original-width="810" src="https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEglPx9GGgJKrToZ6b-NVWwXQPZjZ8oVqLCxS6uVqfQ2XxPfpbnPPemWc8qiG8j6zy4BYyjn_-o4J-7SObidRFfbFpslFLL_pUDfpqm0HbpitDpceF1MBzGJvM6mvyawn6O-8kZBorJdVXT4SyUxyzeDehNWM1cpb0nszNKZr3zFRr-VY8txR-y1J8ZMQuIz/s810/plane_pass_autocepstrum.jpg">](https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEglPx9GGgJKrToZ6b-NVWwXQPZjZ8oVqLCxS6uVqfQ2XxPfpbnPPemWc8qiG8j6zy4BYyjn_-o4J-7SObidRFfbFpslFLL_pUDfpqm0HbpitDpceF1MBzGJvM6mvyawn6O-8kZBorJdVXT4SyUxyzeDehNWM1cpb0nszNKZr3zFRr-VY8txR-y1J8ZMQuIz/s810/plane_pass_autocepstrum.jpg)

The Doppler effect is less prominent here. Instead, the plot shows a sweeping peak that seems to agree with the pitch change we hear. This delay time sweeps from around 4 milliseconds to 9 ms and back. Note that the scale: higher frequencies (shorter times) are on the bottom this time.

Now why would the sound be so correlated with itself with this sweeping delay time?

### Ground echo? ###

Here's my hypothesis. We are hearing not only the direct sound from the plane but also a delayed echo from a nearby flat surface. These two sound get superimposed and interfere before they reach our ears. The effect would be especially prominent with planes and helicopters because there is little in the way of the sound either from above or from the large surface. And what could be a large reflective surface outdoors? Well, the ground below!

Let's think about the numbers. The ground is around one-and-a-half metres below our ears. When a plane is directly overhead, the reflected sound needs to take a path that's three metres longer (two-way) than the direct path. Since sound travels 343 metres per second this translates to a difference of 9 milliseconds – just what we saw in the correlogram!

Below, I used GeoGebra to calculate the time difference (between the yellow and green paths) in milliseconds.

[<img alt="" border="0" width="520" data-original-height="366" data-original-width="1200" src="https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEiA4ggy0g82ccmz9ywX_sLR8Y8-DjRgFT1F9fuU1uz4Bouan-j9K63jWL7qnhFTOeQVI_qDh6gq897-_AOhw6UgGtz4aZJRjrGuuBRIyPsHeDBj62gvDTlYZGssXSTogxnBKZBXZtZkd-bfZiy_VYKfDmq82o6s3S1pZD8P3Cb6rMHqY_C6acR5iaKGsxLd/s520/delayed.png">](https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEiA4ggy0g82ccmz9ywX_sLR8Y8-DjRgFT1F9fuU1uz4Bouan-j9K63jWL7qnhFTOeQVI_qDh6gq897-_AOhw6UgGtz4aZJRjrGuuBRIyPsHeDBj62gvDTlYZGssXSTogxnBKZBXZtZkd-bfZiy_VYKfDmq82o6s3S1pZD8P3Cb6rMHqY_C6acR5iaKGsxLd/s1200/delayed.png)

When the plane is far away the angle is shallower, the two paths are more similar in distance, and the time difference is shorter.

It would follow that a taller person hears the sound differently than a shorter one, or someone in a tenth-floor window! If the ground is very soft, maybe in a mossy grove, you probably wouldn't hear the effect at all; just the Doppler effect. But this prediction needs to be tested out in a real forest.

Here's what a minimal acoustic simulation model renders. We'll just put a flying white noise source in the sky and a reflective surface as the ground. Let's only update the IR at 15 fps to prevent the Doppler phenomenon from emerging.

 WaveSurfer.create({ container: '#simulatedwave', waveColor: 'rgb(25, 100, 200)', progressColor: 'rgb(0, 100, 100)', url: 'https://oona.windytan.com/blogfiles/simulation1.mp3', mediaControls: true, })  \<div class="audiodiv"\>\<audio controls=""\>\<source src="https://oona.windytan.com/blogfiles/simulation1.mp3" id="simulatedaudio"\>\</audio\>\</div\>

Whoosh!

### Some everyday whooshes. ###

The whoosh isn't only associated with planes. When it occurs naturally it usually needs three things:

* a sound with a lot of structure (preferably a hissy or breathy noise)
* an unobstructed echo from a closeby surface
* and some kind of physical movement.

I've heard this outdoors when the sound of a waterfall was reflecting off a brick wall ([video](https://www.youtube.com/watch?v=Amj4UevyRfU)); and next to a motorway when the sound barrier provided the reflection. You can hear it in some films – for instance, in the original Home Alone when Kevin puts down the pizza box after taking a whiff ([video](https://youtu.be/H6M_mFUH35s?t=100))!

You can even hear it in the sound of [thunder](https://mastodon.social/@windytan/114372371301676870) when lightning hits quite close. Nothing is physically moving in this case; but it might be caused because a 'bang' is created simultaneously along a very long path but sound only travels so fast.

Try it yourself: move your head towards a wall – or a laptop screen – and back away from it, while making a continuous 'hhhh' or 'shhh' noise. Listen closely but don't close your eyes, you might bump your nose.

Where have you encountered the whoosh?

### A simple little plot. ###

Finally, if you have JavaScript turned on you'll see (and hear) some more stuff in this blog post. In the interactive graph below you can move the aeroplane and listener around and see how the numbers change. The 'lag' or time difference we hear (orange arrow) comes from how much farther away the reflected virtual image is compared to the real aeroplane. For instance, when it's right above, the copied sound travels 3 meters longer. In the lower right corner, the 'filter' spectrum up to 4.5 kHz is also drawn. The circles are there to visualize the direct distance.

.jxgbox {background-color: #222; } .JXGtext { color: #ddd !important; fill: #666; } body { background-color: black; } #jxgbox\_licenseText { fill: #eee !important; }

### FAQ ###

I get many questions that point out that planes have two of *something*: two engines, two ends in one engine, etc... I can see how this is an inviting chain of though, but it has two problems. 1) The sound is not just associated to jet engines or even planes at all; 2) The sounds would have to be nearly identical for interference to happen. Random wind noise wouldn't created phase-coherent sounds from two independent sources. Some discussion in the comments below.