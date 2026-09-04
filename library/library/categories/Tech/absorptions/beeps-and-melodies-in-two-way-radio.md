---
title = "Beeps and melodies in two-way radio"
description = "Lately my listening activities have focused on two-way FM radio. I'm interested in automatic monitoring and visualization of multiple channels simultaneously, and classifying transmitters. There's a lot of in-band signaling to be decoded! This post shall demonstrate this diversit"
date = "2019-03-15T19:48:00.003Z"
url = "tag:blogger.com,1999:blog-5096278891763426276.post-1418493712353182225"
author = "Oona Räisänen"
text = ""
lastupdated = "2025-10-22T08:59:03.881429667Z"
seen = true
---

Lately my listening activities have focused on two-way FM radio. I'm interested in automatic monitoring and visualization of multiple channels simultaneously, and classifying transmitters. There's a lot of in-band signaling to be decoded! This post shall demonstrate this diversity and also explain how my listening station works.

### Background: walkie-talkies are fun ###

The frequency band I've recently been listening to the most is called PMR446. It's a European band of radio frequencies for short-distance UHF walkie-talkies. Unlike ham radio, it doesn't require licenses or technical competence – anyone with 50€ to spare can get a pair of walkie-talkies at the department store. It's very similar to FRS in the US. It's quite popular where I live.

![[Image: Photo of three different walkie-talkies.]](https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEhcIlePrhv4X5zhlMjS3-NXPCemkiHAFKtk0XImsucTQCD6s0RVHzqB2y0uBpP1JTCF6DSyrI074B8qr-PxEvvZ497giDNJo9Z28XZAxVG7AFhENmV93bcWDAqpeXmwfwj-2ZD5Q7Q05zs5/s400/puhelimet-tausta.jpg)

The short-distance nature of PMR446 is what I find perhaps most fascinating: in normal conditions, everything you hear has been transmitted from a 2-kilometer (1.3-mile) radius. Transmitter power is limited to 500 mW and directional antennas are not allowed on the transmitter side. But I have a receive-only system and a my only directional antenna is for 450 MHz, which is how I originally found these channels.

### Roger beep ###

The *roger beep* is a short melody sent by many hand-held radios to indicate the end of transmission.

The end of transmission must be indicated, because two-way radio is 'half-duplex', which means only one person can transmit at a time. Some voice protocols solve the same problem by mandating the use of a specific word like 'over'; others rely on the short burst of static (squelch tail) that can be heard right after the carrier is lost. Roger beeps are especially common in consumer radios, but I've heard them in ham QSOs as well, especially if repeaters are involved.

### Other signaling on PMR ###

PMR also differs from ham radio in that many of its users don't want to hear random people talking on the same frequency; indeed, many devices employ tones or digital codes designed to silence unwanted conversations, called CTCSS, DCS, or **coded squelch**. They are very low-frequency tones that can't usually be heard at all because of filtering. These won't prevent others from listening to you though; anyone can just disable coded squelch on their device and hear everyone else on the channel.

<img border="0" src="https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEjL-59-NNh_0_JU-hGwxZLiTlGp3x3e5ROOEcgsLsGIEuJC-Kdt4s4L9-wXVWbIR-SxyLjP5wRWvmu2oy2FdHC2NOQo2d0Syb3MLRelVpYIObdvdngAwwV4iicgsgHjcokZxyF0HYRvfQGz/s401/baofeng-ste.jpg" srcset="https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEjL-59-NNh_0_JU-hGwxZLiTlGp3x3e5ROOEcgsLsGIEuJC-Kdt4s4L9-wXVWbIR-SxyLjP5wRWvmu2oy2FdHC2NOQo2d0Syb3MLRelVpYIObdvdngAwwV4iicgsgHjcokZxyF0HYRvfQGz/s802/baofeng-ste.jpg 2x" width="401" height="245" data-original-width="802" data-original-height="490">

Many devices also use a tone-based system for preventing the short burst of static, that classic walkie-talkie sound, from sounding whenever a transmission ends. Baofeng calls these **squelch tail elimination** tones, or STE for short. The practice is not standardized and I've seen several different sub-audible frequencies being used in the wild, namely 55, 62, and 260 Hz. (Edit: As correctly pointed out by several people, another way to do this is to reverse the phase of the CTCSS tone in the end, called a 'reverse burst'. Not all radios use it though; many opt to send a 55 Hz tone instead, even when they are using CTCSS.)

Some radios have a button called 'alarm' that sends a long, repeating melody resembling a 90s mobile phone ring tone. These melodies also vary from one radio to the other.

### My receiver ###

I have a system in place to alert me whenever there's a strong enough signal matching an interesting set of parameters on any of the eight PMR channels. It's based on a Raspberry Pi 3B+ and an Airspy R2 SDR receiver. The program can play the live audio of all channels simultaneously, or one could be selected for listening. It also has an annotated waterfall view that shows traffic on the band during the last couple of hours:

![[Image: A user interface with text-mode graphics, showing eight vertical lanes of timestamped information. The lanes are mostly empty, but there's an occasional colored bar with annotations like 'a1' or '62'.]](https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEizOo72Y8CO7jCOSswHCLK4csjiubXHra8cqXLAnK9Ri12eMUsp8q43PSo14DN8Oi0TzCHvr4MnpLagOZoN-d-jwQdbf-fO1zgB_5qx-rZ0eMHktmhLLV-TOM0FHnymSyKpWLSqqxtjvcRv/s527/screenshot-pmrsquash.png)

The computer is a headless Raspberry Pi with only SSH connectivity; that's why it's in text mode. Also, text-mode waterfall plots are cool!

The coloured bars indicate signal strength (colour) and the duty factor (pattern). The numbers around the bars are decoded squelch codes, STEs and roger beeps. Uncertain detections are greyed out. In this view we've detected roger beeps of type 'a1' and 'a2'; a somewhat rare 62 Hz STE tone; and a ring tone, or alarm (RNG).

Because squelch codes are designed to be read by electronic circuits and their frequencies and codewords are specified exactly, writing a digital decoder for them was somewhat straightforward. Roger beeps and ring tones, on the other hand, are only meant for the human listener and detecting them amongst the noise took a bit more trial-and-error.

### Melody detection algorithm ###

The melody detection algorithm in my receiver is based on a fast Fourier transform (FFT). When loss of carrier is detected, the last moments of the audio are searched for tones thusly:

![[Image: A diagram illustrating how an FFT is used to search for a melody. The FFT in the image is noisy and some parts of the melody can not be measured.]](https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEjS9JMtU94yhhuthNknNLnoMeR6IcUMyIeAIRdUae-iduSILXG_yBLBXbiS4DQZ7oTTTawxORfleB7eBTlbpUpXIDljXSP8nCPhB_eDf2Z2TFrAFYJpOHgYVI_V1WsV9mLVEyh22MExkHtW/s511/fft.jpg)

1. The audio buffer is divided up into overlapping 60-millisecond Hann-windowed slices.
2. Every slice is Fourier transformed and all peak frequencies (local maxima) are found. Their center frequencies are refined using Gaussian peak interpolation[ (Gasior & Gonzalez 2004)](#GasiorGonzalez2004). We need this, because we're only going to allow ±15 Hz of frequency error.
3. The time series formed by the strongest maxima is compared to a list of pre-defined 'tone signatures'. Each candidate tone signature gets a score based on how many FFT slices match (+) corresponding slices of the tone signature. Slices with too much frequency error subtract from the score (–).
4. Most tone signatures have one or more 'quiet zones', the quietness of which further contributes to the score. This is usually placed after the tone, but some tones may also have a pause in the middle.
5. The algorithm allows second and third harmonics (with half the score), because some transmitters may distort the tones enough for these to momentarily overpower the fundamental frequency.
6. Every possible time shift (starting position) inside the 1.5-second audio buffer is searched.
7. The tone signature with the best score is returned, if this score exceeds a set threshold.

This algorithm works quite well. It's not always able to detect the tones, especially if part of the melody is completely lost in noise, but it's good enough to be used for waterfall annotation. False positives are rare; most of them are detections of very short tone signatures that only consist of one or two beeps. My test dataset of 92 recorded transmissions yields only 5 false negatives and no false positives.

For example, this noisy recording:

was succesfully recognized as having a ringtone (RNG), a roger beep of type a1, and CTCSS code XA:

![](https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEhI4uDmgGguyNgRtLmp1T4V-_fGZrkPftBskmlkM1SBxZ7sU-hyAxZgCmjieiryMm_emDwtaaZWXG3mfSdJom1DRCemKstIFxg8JzW6tpCG09mr1m_a0XB0TW3za3Nk_kbe9ziHdSumIFXu/s204/Screenshot+2019-03-27+at+23.47.08.png)

### Naming and classification ###

Because I love classifying stuff I've had to come up with a system for naming these roger tones as well. My current system uses a lower-case letter for classifying the tone into a category, followed by a number that differentiates similar but slightly different tones. This is a work in progress, because every now and then a new kind of tone appears.

My goal would be to map the melodies to specific manufacturers. I've only managed to map a few. Can you recognise any of these devices?

|Class|   Identified model   |Recording|
|-----|----------------------|---------|
|  a  |   Cobra AM845 (a1)   |         |
|  c  |Motorola TLKR T40 (c1)|         |
|  d  |          ?           |         |
|  e  |          ?           |         |
|  h  |    Baofeng UV-5RC    |         |
|  i  |          ?           |         |

I didn't list them all here, but there are [even more samples](https://oona.windytan.com/blogfiles/pmrsounds/). I've added some alarm tones there as well, and [a list](https://oona.windytan.com/blogfiles/pmrsounds/tones.cc.txt) of all the tone signatures that I currently know of. *(Why no full source code? [FAQ](/p/about.html#sourcecode))*

In my rx log I also have an emoji classification system for CTCSS codes. This way I can recognize a familiar transmission faster. A few examples below (there are 38 different CTCSS codes in total):

![[Image: Two-character codes grouped into categories and paired with emoji. Four categories, namely fruit, sound, mammals, and scary. The fruit category has codes beginning with an M, and emoji for different fruit, etc.]](https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEg27GQuq2fxG2UrLqto-asPmTgLQkmh_WUJT4Il5P5N3pJdFpJ7xr7vuwxLnyKe799iDx_XTstPhtQBkUsftie-hBdZ6kiR2KIaa3l0E9IBFW32-Yc3V7FU1FrcbsOZTHWTScTwZvYCHrMt/s418/ctcss-emoji.png)

### Future directions ###

There are mainly just minor bugs in my project trello at the moment, like adding the aforementioned emoji. But as the RasPi is not very powerful the DSP chain could be made more efficient. Sometimes a block of samples gets dropped. Currently it uses a [bandpass-sampled](https://en.wikipedia.org/wiki/Undersampling) filterbank to separate the channels, exploiting aliasing to avoid CPU-intensive frequency shifting altogether:

![](https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEh92A8NSuKanYK1kedyocPmmRWhf8OvuirNx56ph_hHyYMCVkXOAobtA1Y-c4Bc6YCLMlHOIJtakQnQiUyya3wTHx1uYxZ7X3ASLA_oXxxFpJz_L0OXIw-GcD9Y2YR-aGiiTWBvAMYJ3Sfo/s520/dpschain.png)

This is quite fast. But the 1:20 decimation from the Airspy IQ data is done with SoX's 1024-point FIR filter and could possibly be done with fewer coefficients. Also, the RasPi has four cores, so half of the channels could be demodulated in a second thread. Currently all concurrency is thanks to SoX and pmrsquash being different processes.

### Related posts ###

* [CTCSS fingerprinting: a method for transmitter identification](/2016/10/ctcss-fingerprinting-method-for.html)

### References ###

* Gasior, M., Gonzalez, J.L. (2004): [Improving FFT frequency measurement resolution by parabolic and Gaussian interpolation](https://cds.cern.ch/record/720344/files/ab-note-2004-021.pdf).