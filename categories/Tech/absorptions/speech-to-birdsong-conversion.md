---
title = "Speech to birdsong conversion"
description = "I had a dream one night where a blackbird was talking in human language. When I woke up there was actually a blackbird singing outside the window. Its inflections were curiously speech-like. The dreaming mind only needed to imagine a bunch of additional harmonics to form phonemes"
date = "2021-03-29T18:37:00.008Z"
url = "tag:blogger.com,1999:blog-5096278891763426276.post-263559673272528771"
author = "Oona Räisänen"
text = ""
lastupdated = "2025-10-22T08:59:03.873102534Z"
seen = true
---

I had a dream one night where a blackbird was talking in human language. When I woke up there was actually a blackbird singing outside the window. Its inflections were curiously speech-like. The dreaming mind only needed to imagine a bunch of additional harmonics to form phonemes and words. One was left wondering if speech could be transformed into a blackbird song by isolating one of the harmonics...

One way to do this would be to:

* Find the instantaneous fundamental frequency and amplitude of the speech. For example, filter the harmonics out and use an FM demodulator to find the frequency. Then find the signal envelope amplitude by AM demodulation.
* Generate a new wave with similar amplitude variations but greatly multiplied in frequency.

![](https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEgwmcvy__Hyvsbyi0IJevIZvLV-1hFR93nJGg7NYk5W4p-pLFyL9nrJNbBfHapaSzIW896CeqjDUu5VyFbtblGwsk-hxLLg8oAm5CCkY68kUDwLHqTSra5sAOx3xolqG3L8lgcdZcyh_quF/s520/bird-dsp-2x.png)

A proof-of-concept script using the Perl-SoX-csdr command-line toolchain is available ([source code here](https://gist.github.com/windytan/80781ca72c357bb61de8a7b70faea48f)). The result sounds surprisingly blackbird-like. Even the little trills are there, probably as a result of FM noise or maybe vocal fry at the end of sentences. I got the best results by speaking slowly and using exaggerated inflection.

Someone hinted that the type of intonation used in certain automatic announcements is perfect for this kind of conversion. And it seems to be true! Here, a noise gate and reverb has been added to the result to improve it a little:

And finally, a piece of sound art where this synthetic blackbird song is mixed with a subtle chord and a forest ambience:

[![Embedded YouTube video](https://img.youtube.com/vi/vYguVHUlGCA/0.jpg)](https://www.youtube.com/watch?v=vYguVHUlGCA)

Think of the possibilities: A simultaneous interpreter for talking to birds. A tool for dubbing talking birds in animation or live theatre. Entertainment for cats.

What other birds could be done with a voice changer like this? What about croaky birds like a duck or a crow?

(I talked about this blog post a little on NPR: [Here's What 'All Things Considered' Sounds Like — In Blackbird Song](https://www.npr.org/2021/04/16/988200892/heres-what-all-things-considered-sounds-like-in-blackbird-song))