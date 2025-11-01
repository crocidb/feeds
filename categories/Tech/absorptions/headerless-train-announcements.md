---
title = "Headerless train announcements"
description = "[![[Image: Information display onboard a Helsinki train, showing a transcript of an announcement along with the time of the day, current speed and other info.]](https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEh26Tjh5ugfGUsyQTOimb0w9ppvdoNxwEWdQhP4WtSHEYTQ1f8RDCfAonikNw"
date = "2014-06-16T18:55:00.002Z"
url = "tag:blogger.com,1999:blog-5096278891763426276.post-5151176713353659958"
author = "Oona Räisänen"
text = ""
lastupdated = "2025-10-22T08:59:03.916819204Z"
seen = true
---

[![[Image: Information display onboard a Helsinki train, showing a transcript of an announcement along with the time of the day, current speed and other info.]](https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEh26Tjh5ugfGUsyQTOimb0w9ppvdoNxwEWdQhP4WtSHEYTQ1f8RDCfAonikNw3n5pvlfB4JLvMg1Dpq35hJ0MMCOJi_EToLZ1fm85yRaXNZLaWSfkbTSaifvOGrmVVAgJ4HcX7NquaKy7NG/s200/Cv6TbdL.jpg)](https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEh26Tjh5ugfGUsyQTOimb0w9ppvdoNxwEWdQhP4WtSHEYTQ1f8RDCfAonikNw3n5pvlfB4JLvMg1Dpq35hJ0MMCOJi_EToLZ1fm85yRaXNZLaWSfkbTSaifvOGrmVVAgJ4HcX7NquaKy7NG/s1600/Cv6TbdL.jpg)

The Finnish state railway company just changed their automatic announcement voice, discarding old recordings from trains. It's a good time for some data dumpster diving for the old ones, don't you think?

A 67-megabyte ISO 9660 image is produced that once belonged to an older-type onboard announcement device. It contains a file system of 58 directories with five-digit names, and one called "yleis" (Finnish for "general").

Each directory contains files with three-digit file names. For each number, there's 001.inf, 001.txt and 001.snd. The .inf and .txt files seem to contain parts of announcements as ISO 8859 encoded strings, such as "InterCity train" and "to Helsinki". The .snd files obviously contain the corresponding audio announcements. There's a total of 1950 sound files.

### Directory structure ###

The file system seems to be structurally pointless; there's nothing apparent that differentiates all files in /00104 from files in /00105. Announcements in different languages are numerically separated, though (/001xx = Finnish, /002xx = Swedish, /003xx = English). Track numbers and time readouts are stored sequentially, but there are out-of-place announcements and test files in between. The logic connecting numbers to their meanings is probably programmed into the device for every train route.

Everything can be spliced together from almost single words. But many common announcements are also recorded as whole sentences, probably to make them sound more natural.

### Audio format ###

The audio files are headerless; there is no explicit information about the format, sample rate or sample size anywhere.

The byte histogram and Poincaré plot of the raw data suggest a 4-bit sample size; this, along with the fact that all files start with `0x80`, is indicative of an adaptive differential PCM encoding scheme.

![[Image: Byte histogram and Poincare plot of a raw audio file, characteristic of Gaussian-distributed data encoded as four-bit samples.]](https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEh8Q8-T2Qr_Ecur96iJTFcsfPvxSnhl1fqfwWRf2i5jkOxNmQZEjkgjwz29e3xhHumDGS6oZBZ7esLlV1aXv7YdbIoDnIuwZATKyB0QsAO3YJLg4bD42BOZEJs_Ksj5-o4isE0MNQhN3NJf/s450/poincare-plots.png)

Unfortunately there are as many variations to ADPCM as there are manufacturers of encoder chips. None of the decoders known by SoX produce clean results. But with the right settings for the OKI-ADPCM decoder we can already hear some garbled speech under heavy Brownian noise.

[HTML5 audio: Sound resembling garbled speech buried in noise.]

For unknown reasons, the output signal from SoX is spectrum-inverted. Luckily it's trivial to fix (see [my previous post on frequency inversion](https://www.windytan.com/2013/05/descrambling-voice-inversion.html)). The pitch sounds roughly natural when a 19,000 Hz sampling rate is assumed. A test tone found in one file comes out as a 1000 Hz sine when the sampling rate is further refined to 18,930 Hz.

This is what we get after frequency inversion, spectral equalization, and low-pass filtering:

[HTML5 audio: The Helsinki train announcement voice saying "This is an InterCity2 train to Helsinki."]

There's still a high noise floor due to the mismatch between OKI-ADPCM and the unknown algorithm used by the announcement device, but it's starting to sound alright!

### Peculiarities ###

There seems to be an announcement for every thinkable situation, such as:

* "Ladies and Gentlemen, as due to heavy snowfall, we are running slightly late. Please accept our apologies."
* "Ladies and Gentlemen, an animal has been run over by the train. We have to wait a while before continuing the journey."
* "Ladies and Gentlemen, the arrival track of the train having been changed, the platform is on your left hand side."
* "Ladies and Gentlemen, we regret to inform you that today the restaurant-car is exceptionally closed."

Also, there is an English recording of most announcements, even though only Finnish and Swedish are usually heard on commuter trains.

One file contains a long instrumental country song.

In an eerily out-of-place sound file, a small child reads out a list of numbers.

### Final words ###

This is something I've wanted to do with this almost melodically intonated announcement about ticket selling compartments.

[HTML5 audio: A musical piece made using an announcement in Finnish.]