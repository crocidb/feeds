---
title = "Pea whistle steganography"
description = "[[Image: Acme Thunderer 60.5 whistle]](https://blogger"
date = "2015-10-06T22:54:00.002Z"
url = "tag:blogger.com,1999:blog-5096278891763426276.post-2415257910460371615"
author = "Oona Räisänen"
text = ""
lastupdated = "2025-10-22T08:59:03.898936117Z"
seen = true
---

[![[Image: Acme Thunderer 60.5 whistle]](https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEjKdJ8jqWTJO_fS1ilnlhIRaRV4AYC-6mj0nVcE2udYbIZQrcnKZWdlLrOPrUVRiXXzQ-dYc3JDSQLxcHVGgxAqBdsEAng04JMQ_B-dFcIyQ9VOcjDCPd-SwVhKJT5gV1YXxr0N_tGMLCfL/s240/IMG_4864-1.jpg)](https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEjKdJ8jqWTJO_fS1ilnlhIRaRV4AYC-6mj0nVcE2udYbIZQrcnKZWdlLrOPrUVRiXXzQ-dYc3JDSQLxcHVGgxAqBdsEAng04JMQ_B-dFcIyQ9VOcjDCPd-SwVhKJT5gV1YXxr0N_tGMLCfL/s1600/IMG_4864-1.jpg)

Would anyone notice if a referee's whistle transmitted a secret data burst?

I do really follow the game. But every time the pea whistle sounds to start the jam I can't help but think of the possibility of embedding data in the frequency fluctuation. I'm sure it's alternating between two distinct frequencies. Is it really that binary? How random is the fluctuation? Could it be synthesized to contain data, and could that be read back?

I found a staggeringly detailed [Wikipedia article](https://en.wikipedia.org/wiki/Whistle) about the physics of whistles – but not a single word there about the effects of adding a pea inside, which is obviously the cause of the frequency modulation.

To investigate this I bought a metallic pea whistle, the Acme Thunderer 60.5, pictured here. Recording its sound wasn't straightforward as the laptop microphone couldn't record the sound without clipping. The sound is incredibly loud indeed – I borrowed a sound pressure meter and it showed a peak level of 106.3 dB(A) at a distance of 70 cm, which translates to 103 dB at the standard 1 m distance. (For some reason I suddenly didn't want to make another measurement to get the distance right.)

[![[Image: Display of a sound pressure meter showing 106.3 dB max.]](https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEhtsQ0g2nfQYkU_wODsX-TPDkTVARQ1cFJKzshhBrvGrdswsMmZBMlVYPA2_Sp_jsDselFLiXlqe7h5gOgBu16XAAvAa-k86D12YbPwF0hz3R92_86PyukNigOfPH9rj35yF86VqerS_Fj3/s320/IMG_4865-1.jpg)](https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEhtsQ0g2nfQYkU_wODsX-TPDkTVARQ1cFJKzshhBrvGrdswsMmZBMlVYPA2_Sp_jsDselFLiXlqe7h5gOgBu16XAAvAa-k86D12YbPwF0hz3R92_86PyukNigOfPH9rj35yF86VqerS_Fj3/s1600/IMG_4865-1.jpg)

Later I found a microphone that was happy about the decibels and got this spectrogram of a 500-millisecond whistle.

[![[Image: Spectrogram showing a tone with frequency shifts.]](https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEijskzqOQXlFFqsYmhyphenhyphenXNS45EpV7mbP0Vz0-9CSh8qWwKDseRnUfLx7zlB7tYR6lAU9LCAIcWLu_h2i6mCYU0ahBJk6_P8HWZbfv4GTWzek7wZXtaR0fC5LTcRKOlO6Y7I8pa6tRf7GN2Ln/s450/acme-spektri.jpg)](https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEijskzqOQXlFFqsYmhyphenhyphenXNS45EpV7mbP0Vz0-9CSh8qWwKDseRnUfLx7zlB7tYR6lAU9LCAIcWLu_h2i6mCYU0ahBJk6_P8HWZbfv4GTWzek7wZXtaR0fC5LTcRKOlO6Y7I8pa6tRf7GN2Ln/s1600/acme-spektri.jpg)

(HTML5 audio: The sound of a whistle.)

The whistle seems to contain a sliding beginning phase, a long steady phase with frequency shifts, and a short sliding end phase. The "tail" after the end slide is just a room reverb and I'm not going to need it just yet. A slight amplitude modulation can be seen in the oscillogram. There's also noise on somewhat narrow bands around the harmonics.

The FM content is most clearly visible in the second and third harmonics. And seems like it could very well fit FSK data!

### Making it sound right ###

I'm no expert on synthesizers, so I decided to write everything from scratch ([whistle-encode.pl](https://gist.github.com/windytan/d3bca32a22998dab962e)). But I know the start phase of a sound, called the attack, is pretty important in identification. It's simple to write the rest of the fundamental tone as a simple FSK modulator; at every sample point, a data-dependent increment is added to a phase accumulator, and the signal is the cosine of the accumulator. I used a low-pass IIR filter before frequency modulation to make the transitions smoother and more "natural".

Adding the harmonics is just a matter of measuring their relative powers from the spectrogram, multiplying the fundamental phase angle by the index of the harmonic, and then multiplying the cosine of that phase angle by the relative power of that harmonic. SoX takes care of the WAV headers.

Getting the noise to sound right was trickier. I ended up generating white noise (a simple rand()), lowpass filtering it, and then mixing a copy of it around every harmonic frequency. I gave the noise harmonics a different set of relative powers than for the cosine harmonics. It still sounds a bit too much like digital quantization noise.

### Embedding data ###

There's a limit to the amount of bits that can be sent before the result starts to sound unnatural; nobody has lungs that big. A data rate of 100 bps sounded similar to the Acme Thunderer, which is pretty much nevertheless. I preceded the burst with two bytes for bit and byte sync (0xAA 0xA7), and one byte for the packet size.

Here's "OHAI!":

(HTML5 audio: A data burst that sounds like a whistle.)

Sounds legit to me! Here's a slightly longer one, encoding "Help me, I'm stuck inside a pea whistle":

(HTML5 audio: A data burst that sounds like a whistle.)

### Homework ###

1. Write a receiver for the data. It should be as simple as receiving FSK. The frequency can be determined using atan2, a zero-crossing detector, or FFT, for instance. The synchronization bytes are meant to help decode such a short burst; the alternating 0s and 1s of 0xAA probably give us enough transitions to get a bit lock, and the 0xA7 serves as a recognizable pattern to lock the byte boundaries on.
2. Build a physical whistle that does this! (Edit: [example solution](https://lukelectro.wordpress.com/2015/12/28/continued-data-transmission-whistle-experiment-more-successful-this-time/)!)