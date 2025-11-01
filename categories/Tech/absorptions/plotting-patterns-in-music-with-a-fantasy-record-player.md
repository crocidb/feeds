---
title = "Plotting patterns in music with a fantasy record player"
description = '[<img alt="" border="0" width="220" data-original-height="779" data-original-width="852" src="https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEgIK350lA9fMo-Z9PohL6SBuT_Xkl7mOGVsHRblgbnNBp7cLfnTWTXkWSJmiwMy5KD7PVhJGnISfBLfKrNTj8oR9-x5Qb33xGyx3Gs0Te13Aa-6jfWw1gLq5kMI936vJ'
date = "2020-12-08T21:42:00.038Z"
url = "tag:blogger.com,1999:blog-5096278891763426276.post-2669501989505458873"
author = "Oona Räisänen"
text = ""
lastupdated = "2025-10-22T08:59:03.875410961Z"
seen = true
---

[<img alt="" border="0" width="220" data-original-height="779" data-original-width="852" src="https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEgIK350lA9fMo-Z9PohL6SBuT_Xkl7mOGVsHRblgbnNBp7cLfnTWTXkWSJmiwMy5KD7PVhJGnISfBLfKrNTj8oR9-x5Qb33xGyx3Gs0Te13Aa-6jfWw1gLq5kMI936vJF30xCzpzVKtjMf8/s320/BlackPink.jpg">](https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEgIK350lA9fMo-Z9PohL6SBuT_Xkl7mOGVsHRblgbnNBp7cLfnTWTXkWSJmiwMy5KD7PVhJGnISfBLfKrNTj8oR9-x5Qb33xGyx3Gs0Te13Aa-6jfWw1gLq5kMI936vJF30xCzpzVKtjMf8/s852/BlackPink.jpg)

Back in April I bought a vinyl record that had a weird wavy pattern near the outer edge. I though I may have broken it somehow but couldn't even test this because I don't own a record player. \*) But when I took a closer look at the pattern it seemed to somehow follow changes in the music. That doesn't look like damage at all.

When I played the CD version it became clear: this was an artifact of the tempo of the electronic track (100 bpm) being a multiple of the rotational speed (33 1/3 rpm), and these were probably drum hits! My [tweet](https://twitter.com/windyoona/status/1249999597315002373?s=20) sparked some interesting discussion and I've been pondering this ever since. Could we plot any song as a loop or grid based on its own tempo and see interesting patterns?

(\*) I know, it's a little odd. But I have a few unplayed vinyl records waiting for the day that I finally have the proper equipment. By the way, the song was Black Pink by RinneRadio from their wonderful album staRRk.

I wrote a little [script](https://gist.github.com/windytan/d46686709ff43cd679d52c17302f7736#file-plot_rpm-pl-L5) to do just this: to plot the amplitude of the FLAC into a grid with an adjustable width. The result looks very similar to the pattern on the vinyl surface! Note that this image is a "straightened out" version of the disc surface and it's showing three of those wavy patterns. The top edge corresponds to the outer edge of the vinyl.

[<img border="0" src="https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEgjfo5UWLOUu5REWu2Pywu_t1WgP6UJZ5W9DpzWU2NBuej4TthDHygkCXWka07TwdFMIpkroeqYT15OA3S19IcNU4nzb15WZ7fyyNmI6h0CE4A7VBTSXX-DhRDaGNlIYa2AG3NKQ9NGxO6_/s1024/blackpink2.png" alt="[Image: A plot showing similar patterns that were on the disc surface.]" width="500">](https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEgjfo5UWLOUu5REWu2Pywu_t1WgP6UJZ5W9DpzWU2NBuej4TthDHygkCXWka07TwdFMIpkroeqYT15OA3S19IcNU4nzb15WZ7fyyNmI6h0CE4A7VBTSXX-DhRDaGNlIYa2AG3NKQ9NGxO6_/s1024/blackpink2.png)

Later I wrote a little more ambitious plotter that shall be explained soon.

### Computer-conducted music gives best patterns ###

After plotting several different songs against their own tempo like this it seemed that in addition to electronic music a lot of pop and rock has this type of a pattern, too. The most striking and clear patterns can be seen in music that makes use of drum samples in a quantized time base (aka. a drum machine): the same kick drum sample, for example, repeats four times in each bar, perfectly timed by a computer so that they align in phase.

Somewhat similar patterns can be seen in live music that is played to a "click track": each band member hears a common computer-generated time signal in their earplug so that they won't sway from an average tempo. But of course the live beats won't be perfectly phase-aligned in this case, because the musicians are humans and there's also physics involved.

### 3D rendered video experiment ###

To demonstrate how the patterns on vinyl records are born I made a video showing a fantasy record player that can play an "e-ink powered optical record" and morph it into any RPM. I say fantasy because it's just that: imagination, science fiction, rendered 3D art - it would be quite unfeasible in real life. You can't actually make e-ink displays that fast and accurate. But of course it would be possible to have a live display of a digitally sampled audio file as a spiral and use some kind of physical controllers to change the RPM value in real time, and just play the sound from a digital file.

Making the video was really fun and I think the end result is equal parts weird and illustrating.

[![Embedded YouTube video](https://img.youtube.com/vi/mRi23ueU7Zk/0.jpg)](https://www.youtube.com/watch?v=mRi23ueU7Zk)

### Programming the disk surface and audio ###

The disc surface is based on a video texture: a different image was rendered for each changed frame using a purpose-written C++ program. The program uses an oversampled (8x) version of the original music that it then resamples at a variable rate based on the recorded RPM value (let's call it a morphing value). Oversampling and low-pass filtering beforehand makes variable-rate resampling simple: just take a sample at the appropriate time instant and don't worry about interpolation. It won't sound perfect but actually the artifact adds an interesting distortion, perhaps simulating pixel boundaries in the 'e-ink display'.

The amplitude sample at each time instant was projected into polar coordinates and plotted as an image. The image is fairly large - at least 2048 by 2048 pixels. I use this as a sort of image-space oversampling to get the polar projection to look a little better. I even tried 8192 x 8192 video but it was getting too heavy on my computer. But a new image must only be generated when the morphing value changes; the other frames can be copied.

[![[Image: A square image of the disc video texture.]](https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEjPisSQ0k9f16Mkoi7KOWCajT5YBDRJbUt0QjbR7mIWw3LZD22hyphenhyphenS9o4HTOCrkbjlEr9Q8la_GWX-CUZeotP9V8yBj7tdogf4dM351kjbrt1YTsMsc1E8vUf98ZophoMLD57qxwmPMv7vwn/s512/disc-pigpen-insync.jpg)](https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEjPisSQ0k9f16Mkoi7KOWCajT5YBDRJbUt0QjbR7mIWw3LZD22hyphenhyphenS9o4HTOCrkbjlEr9Q8la_GWX-CUZeotP9V8yBj7tdogf4dM351kjbrt1YTsMsc1E8vUf98ZophoMLD57qxwmPMv7vwn/s512/disc-pigpen-insync.jpg)

The sound track was made by continuously sampling the position of the "play head" 44100 times per second, whether the disk was moving or not. Which sample ends up in the audio depends on the current rotational angle and the morphing value of the disk surface. When either of those values change it moves the audio past the play head. A DC cancel filter was then applied because the play head would often stop on a non-zero sample, and it didn't look nice in the waveform. There's also a quiet hum in the background.

![[Image: Screenshot of C++ code with a list of events.]](https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEhWdBWR5I5I1mTXJs721g0ZtFf5ixXLtAqnh96HYgl_ICY1u_vgb_OmR5hqidOjSyOeo8lhomcHU6Kl4EGhHZVW7ItkV3Qx_VH0Pe8H9lThTNk0ekEKenZhRXx55glQ_mXYbsapu-uLmqGx/s479/events-screenshot.png)

I made an event-based system where I could input events simulating the button presses and other controls. The system responds to speed change events with a [smoothstep function](https://en.wikipedia.org/wiki/Smoothstep) so that the disc seems to have realistic inertia. Also, the slow startup and slowdown sounds kind of cool this way. Here's an extra-slow version of the effect -- you can hear the slight aliasing artifacts in the very beginning and end:

### 3D modeling, texturing, shading ###

The models were all made in Blender, a tool that I've slowly learned to use during the pandemic situation. Its modeling tools are pretty fun to use and once you learn it you can build pretty 3D models to look at that won't take up any room in your apartment.

[![[Image: A screenshot of Blender with the device without textures.]](https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEhZGeWmeXgvDoQaLk2DzbwzbB9gftTUJqL6fJP0KPXjMdMAtsKeFbcf9tEzkso-FJHZEnjhGU5gebXX-bJ6JOZrf7K2NrQbjKuapeGXzsfBfopsSjsl2ip6SR_iF5SqRJGEcUN-DqA4sjLA/s500/modeling-psyche4.jpg)](https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEhZGeWmeXgvDoQaLk2DzbwzbB9gftTUJqL6fJP0KPXjMdMAtsKeFbcf9tEzkso-FJHZEnjhGU5gebXX-bJ6JOZrf7K2NrQbjKuapeGXzsfBfopsSjsl2ip6SR_iF5SqRJGEcUN-DqA4sjLA/s1920/modeling-psyche4.jpg)

I love the retro aesthetic of old reel-to-reel players and other studio equipment. So I looked for inspiration by searching "reel-to-reel" on Google Images. Try it out, it's worth it! Originally I wanted for the disc to be transparent with some type of movable particles inside, and the laser to be shone through it, but this was computationally very expensive to render. So I made it and 'e-ink' display instead. (I regret this choice a little bit since some people, at first glance, apparently thought the video depicted actual existing technology. But I tried to make it clear it's a photorealistic render :)

I made use of the boolean workflow and bevel modifiers to cut holes and other small details in the hard surfaces. The cables are Bezier curves with the round bevel setting enabled.

The little red LCD is also a video texture on an emission shader – each frame was an SVG that was changed a little in time to add flicker and then exported using Inkscape from a batch script.

The wood textures, fingerprints, and the room environment photo are from HDRi Haven, Texture Haven and CC0 Textures. I'm especially proud of all the details on the disc surface -- here's the shader setup I built for the surface:

[![[Image: A Blender texture node map.]](https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEgIF0nbsZgcGp5_hTtXkrSDtcjcyTQ0p072dWDuut948V5VK1KbZQJk9LRs6CrsFiM3EPLtez-2a7cPeGIfI-hG9D_VfqWXyrGRcwx7UXDUBm4_Y-p9-oWW_kQFWqokP2Q03raDENghfyB5/s500/disc-shader.jpg)](https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEgIF0nbsZgcGp5_hTtXkrSDtcjcyTQ0p072dWDuut948V5VK1KbZQJk9LRs6CrsFiM3EPLtez-2a7cPeGIfI-hG9D_VfqWXyrGRcwx7UXDUBm4_Y-p9-oWW_kQFWqokP2Q03raDENghfyB5/s2016/disc-shader.jpg)

The video was rendered in Blender Eevee and it took maybe 10 hours at 720p60. It's sad that it's not in 1080p but I was impatient. I spent quite some time to make the little red LCD look realistic but it was completely spoiled by compression!

Here's a bigger still rendered in Cycles:

[![[Image: A render of the record player.]](https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEgCWvYWzuSFKzHBqwtb5aICiMpF1aJNpDntyNnTZOGh9FY4aObotdk4IB4MmasuG6uLPw2pOTtfVC4xJSTlHWrUpMPsEXQKMasaKnmDXoSHdb9TTHKtWcUIK0s6tyPR_Zu3cSNatrbaiLgw/s500/psyche-render1.jpg)](https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEgCWvYWzuSFKzHBqwtb5aICiMpF1aJNpDntyNnTZOGh9FY4aObotdk4IB4MmasuG6uLPw2pOTtfVC4xJSTlHWrUpMPsEXQKMasaKnmDXoSHdb9TTHKtWcUIK0s6tyPR_Zu3cSNatrbaiLgw/s1920/psyche-render1.jpg)

### Mapping rotation to the disc ###

Rotation angles from the C++ program were sampled 60 times per second and output as CSV. These were then imported to Blender as keyframes for the rotating disc, using the Python API:

![[Image: A screenshot of a Python script.]](https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEgoOUqggMM8fUV4EK7B4vh9P71EfJsgxbMDTzZbecqYHCO1GcFs2yPEoDCvdMP7jRljmO4wcMT8ru_mDjRZUOdFMcvj3h-UWXjvH0VX4anuZUmnHn4PYoCUTNq27zi_alHwsQeMF0etPAm_/s635/python-csv-import.jpg)

Here you only need to print a new keyframe when the speed of rotation changes, or is about to change; Blender will interpolate the rest.

A Driver was set up to make the Y rotation slightly follow the Z rotation with a very small factor to make the disc 'wobble' a bit.

### What's next? ###

It's endless fun to build and program functional fantasy electronics and I may need to do more of that. I'm currently also obsessed with 3D modeled dollhouses and who knows how those things will combine?

By the way, there is an actual device somewhat resembling this 3D model. It's called the Panoptigon, it's sort of an optical mellotrone ([video](https://www.youtube.com/watch?v=LhmvLNNFe6A)).