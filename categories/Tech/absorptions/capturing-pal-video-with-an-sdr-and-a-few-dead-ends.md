---
title = "Capturing PAL video with an SDR (and a few dead-ends)"
description = "I play 1980s games, mostly Super Mario Bros., on the Nintendo NES console. It would be great to be able to capture live video from the console for recording speedrun attempts. Now, how to make the 1985 NES and the 2013 MacBook play together, preferably using hardware that I alrea"
date = "2019-08-24T18:30:00.010Z"
url = "tag:blogger.com,1999:blog-5096278891763426276.post-4329815788254877404"
author = "Oona Räisänen"
text = ""
lastupdated = "2025-10-22T08:59:03.878111516Z"
seen = true
---

I play 1980s games, mostly Super Mario Bros., on the Nintendo NES console. It would be great to be able to capture live video from the console for recording speedrun attempts. Now, how to make the 1985 NES and the 2013 MacBook play together, preferably using hardware that I already have? This project diary documents my search for the answer.

Here's a spoiler – it did work:

[![[Image: A powered-on NES console and a MacBook on top of it, showing a Tetris title screen.]](https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEgI12MLq_5qagdxwQXzc8WOzE-N5cgtWXGSheXiG3H6qnkCWZMuGhQh_Fn88YSbqr7Owrqz8kppdC_p_I88_lEqBUj7fDoYI7-I0dy8yP7WdbcuHv62FKNssU7lpg2eNDtRV42E1WnhmxQD/s400/IMG_6228.jpg)](https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEgI12MLq_5qagdxwQXzc8WOzE-N5cgtWXGSheXiG3H6qnkCWZMuGhQh_Fn88YSbqr7Owrqz8kppdC_p_I88_lEqBUj7fDoYI7-I0dy8yP7WdbcuHv62FKNssU7lpg2eNDtRV42E1WnhmxQD/s1600/IMG_6228.jpg)

### Things that I tried first ###

#### A capture device ####

Video capture devices, or capture cards, are devices specially made for this purpose. There was only one cheap (\~30€) capture device for composite video available locally, and I bought it, hopingly. But it wasn't readily recognized as a video device on the Mac, and there seemed to be no Mac drivers available. Having already almost capped my budget for this project I then ordered a 5€ EasyCap device from eBay, as there was some evidence of Mac drivers online. The EasyCap was still making its way to Finland as of this writing, so I continued to pursure other routes.

PS: When the device finally arrived, it sadly seemed that the EasyCapViewer-Fushicai software only supports opening this device in NTSC mode. There's PAL support in later commits in the GitHub repo, but the project is old and can't be compiled anymore as Apple has deprecated QuickTime.

[![](https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEjuhuYPWvBeDhXq5EAFBaEC3N6jsSIXM-3ocFVW2fydkeJ4mjZodZipeYOSqcCz27KJMri_SwsFgw7u1ORbACWoEkfu7V-iDzohuOffmcBWxg3fKsBUku60hv2UzLztC1ANOzr9ayid-9RM/s450/usbtv-screenshot.jpg)](https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEjuhuYPWvBeDhXq5EAFBaEC3N6jsSIXM-3ocFVW2fydkeJ4mjZodZipeYOSqcCz27KJMri_SwsFgw7u1ORbACWoEkfu7V-iDzohuOffmcBWxg3fKsBUku60hv2UzLztC1ANOzr9ayid-9RM/s1600/usbtv-screenshot.jpg)

Even when they do work, a downside to many cheap capture devices is that they can only capture at half the true framerate (that is, at 25 or 30 fps).

#### CRT TV + DSLR camera ####

The cathode-ray tube television that I use for gaming could be filmed with a digital camera. This posed interesting problems: The camera must be timed appropriately so that a full scan is captured in every frame, to prevent temporal aliasing (stripes). This is why I used a DSLR camera with a full manual mode (Canon EOS 550D in this case).

For the 50 Hz PAL television screen I used a camera frame rate of 25 fps and an exposure time of 1/50 seconds (set by camera limitations). The camera will miss every other frame of the original 50 fps video, but on the other hand, will get an evenly lit screen every time.

A Moiré pattern will also appear if the camera is focused on the CRT shadow mask. This is due to intererence between two regular 2D arrays, the shadow mask in the TV and the CCD array in the camera. I got rid of this by setting the camera on manual focus and defocusing the lense just a bit.

![[Image: A screen showing Super Mario Bros., and a smaller picture with Oona in it.]](https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEgjgHYuaIsECDkGGbtyVixRSGVw_Dh3ukjHRBxw2EBKtdDbOADwsEJWVeUUfo3BiJ2xP-Lu9W2XTAE7NAScuX3ZL8h2EEHKGqM2LBLfe9e4ogESKxNfmoYgI4EA39TNzHYEaDN0JXZNVPTG/s450/crt-capture.jpg)

This produced surprisingly good quality video, save for the slight jerkiness caused by the low frame rate ([video](https://www.youtube.com/watch?v=TbNo2ndoFag)). This setup was good for one-off videos; However, I could not use this setup for live streaming, because the camera could only record on the SD card and not connect to the computer directly.

#### LCD TV + webcam ####

An old LCD TV that I have has significantly less flicker than the CRT, and I could have live video via the webcam. But the Microsoft LifeCam HD-3000 that I have had only a binary option for manual exposure (pretty much "none" and "lots"). Using the higher setting the video was quite washed out, with lots of motion blur. The lower setting was so fast that it looked like the LCD had visible vertical scanning. Brightness was also heavily dependent on viewing angle, which caused gradients over the image. I had to film at a slightly elevated angle so that the upper part of the image wouldn't go too dark, and this made the video look like a bootleg movie copy.

[![[Image: A somewhat blurry photo of an LCD TV showing Super Mario Bros.]](https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEh_XzVzjsytlPbzIsOBJJSZgaDgbHVOi8v2waK0wMfLbhfvNsoSRqp_BjjuHYfRRYk7BKLJ1NygWGJAG_xUBnQPy2Kwi8bQJp3EaRtc4WurxPqR9CPae6oZEks2QT0zIwj0gntzH_W6u8-Y/s350/lcd-capture.jpg)](https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEh_XzVzjsytlPbzIsOBJJSZgaDgbHVOi8v2waK0wMfLbhfvNsoSRqp_BjjuHYfRRYk7BKLJ1NygWGJAG_xUBnQPy2Kwi8bQJp3EaRtc4WurxPqR9CPae6oZEks2QT0zIwj0gntzH_W6u8-Y/s1600/lcd-capture.jpg)

### Composite video ###

Now to capturing the actual video signal. The NES has two analog video outputs: one is composite video and the other an RF modulator, which has the same composite video signal modulated onto an AM carrier in the VHF television band plus a separate FM audio carrier. This is meant for televisions with no composite video input: the TV sees the NES as an analog TV station and can tune to it.

In composite video, information about brightness, colour, and synchronisation is encoded in the signal's instantaneous voltage. The bandwidth of this signal is at least 5 MHz, or 10 MHz when RF modulated, which would require a 10 MHz IQ sampling rate.

![[Image: Oscillogram of one PAL scanline, showing hsync, colour burst, and YUV parts.]](https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEgH_zqGuJdjJwVxXRLC3zSt1nIMly-zYw0_gOm2MGJftW623qdMAIHK4o6rufDWshKSfQGn2k4UGmJ1fzGCRzjVQy7uBJfNFzYq9iSvClbvI7a4s3q1882pmnRrP1EvU0KOojvrCnO2uPhr/s400/scanline.jpg)

I happen to have an Airspy R2 SDR receiver that can listen to VHF and take 10 million samples per second - could it be possible? I made a cable that can take the signal from the NES RCA connector to the Airspy SMA connector. And sure enough, when the NES RF channel selector is at position "3", a strong signal indeed appears on VHF television channel 3, at around 55 MHz.

### Software choices ###

There's already an analog TV demodulator for SDRs - it's a plugin for SDR# called TVSharp. But SDR# is a Windows program and TVSharp doesn't seem to support colour. And it seemed like an interesting challenge to write a real-time PAL demodulator myself anyway.

I had been playing with analog video demodulation recently because of my HDMI Tempest project ([video](https://www.youtube.com/watch?v=gJhRRTSDCa0)). So I had already written a C++ program that interprets a 10 Msps digitised signal as greyscale values and sync pulses and show it live on the screen. Perhaps this could be used as a basis to build on. (It was not published, but apparently there is a similar project written in Java, called [TempestSDR](https://github.com/martinmarinov/TempestSDR))

Data transfer from the SDR is done using airspy\_rx from airspy-tools. This is piped to my program that reads the data into a buffer, 256 ksamples at a time.

Automatic gain control is an important part of demodulating an AM signal. I used liquid-dsp's [AGC](http://liquidsdr.org/doc/agc/) by feeding it the maximum amplitude over every scanline period; this roughly corresponds to sync level. This is suboptimal, but it works in our high-SNR case. AM demodulation was done using std::abs() on the complex-valued samples. The resulting real value had to be flipped from 1, because TV is transmitted "inverse AM" to save on the power bill. I then scaled the signal so that black level was close to 0, white level close to 1, and sync level below 0.

I use SDL2 to display the video and OpenCV for pixel addressing, scaling, cropping, and YUV-RGB conversions. OpenCV is an overkill dependency inherited from the Tempest project and SDL2 could probably do all of those things by itself. This remains TODO.

### Removing the audio ###

The captured AM carrier seems otherwise clean, but there's an interfering peak on the lower sideband side at about –4.5 MHz. I originally saw it in the demodulated signal and thought it would be related to colour, as it's very close to the PAL chroma subcarrier frequency of 4.43361875 MHz. But when it started changing frequency in triangle-wave shapes, I realized it's the audio FM carrier. Indeed, when it is FM demodulated, beautiful NES music can be heard.

[![[Image: A spectrogram showing the AM carrier centered in zero, with the sidebands, chroma subcarriers and audio alias annotated.]](https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEjcdduLn81WyrXsmRsfs6ZD2RNUFx__hikxP8jDtbhAksiWF_76b2dSKONlzn60JpI-KPMAFa5J5_n91vxddlj5__bGMZWL-iddItLklaZETGaBz1G-bUsoUgBojxrGoJ1khV-x7xoYGwB6/s500/audiocarrier-annotated.jpg)](https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEjcdduLn81WyrXsmRsfs6ZD2RNUFx__hikxP8jDtbhAksiWF_76b2dSKONlzn60JpI-KPMAFa5J5_n91vxddlj5__bGMZWL-iddItLklaZETGaBz1G-bUsoUgBojxrGoJ1khV-x7xoYGwB6/s1600/audiocarrier-annotated.jpg)

The audio carrier is actually outside this 10 MHz sampled bandwidth. But it's so close to the edge (and so powerful) that the Airspy's anti-alias filter cannot sufficiently attenuate it, and it becomes folded, i.e. [aliased](https://en.wikipedia.org/wiki/Aliasing), onto our signal. This caused visible banding in the greyscale image, and some synchronization problems.

I removed the audio using a narrow FIR [notch filter](https://github.com/jgaeddert/liquid-dsp/blob/master/examples/firfilt_cccf_notch_example.c) from the liquid-dsp library. Now, the picture quality is very much acceptable. Minor artifacts are visible in narrow vertical lines because of a pixel rounding choice I made, but they can be ignored.

![[Image: Black-and-white screen capture of NES Tetris being played.]](https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEjwFvn_csWHfM4RW-1z0z8Qs2OWLsuQTo8H-Ks8apRdv0lc7l4E2fqfQJMtvDXcQPXy8R6lnAS0RQiHstD2QD-QVpctakfFVlg3Vc0DxktbK9z2cx0RLvhxgvLQHk0slV4LGCuLwXMjzWg6/s320/tetris-bw.jpg)

### Decoding colour ###

PAL colour is a bit complicated. It was designed in the 1960s to be backwards compatible with black-and-white TV receivers. It uses the YUV colourspace, the Y or "luminance" channel being a black-and-white sum signal that already looks good by itself. Even if the whole composite signal is interpreted as Y, the artifacts caused by colour information are bearable. Y also has a lot more bandwidth, and hence resolution, than the U and V (chrominance) channels.

U and V are encoded in a chrominance subcarrier in a way that I still haven't quite grasped. The carrier is suppressed, but a burst of carrier is transmitted just before every scanline for reference (so-called colour burst).

Turns out that much of the chroma information can be recovered by band-pass filtering the chrominance signal, mixing it down to baseband using a PLL locked to the colour burst, rotating it by a magic number (chroma \*= std::polar(1.f, deg2rad(170.f))), and plotting the real and imaginary parts of this complex number as the U and V colour channels. This is similar to how NTSC colour is demodulated.

[![](https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEjs50SBVMLHweIAz9fgk8VptoDsy0oZm0u2LXfH8k5YAUwq20Zh9RQCej5dzGzkjKUKc0YjXsNwsD4mrVtnAPhFIlHY0jW0YJtC2s1gKPm8GJWtwd0bVFqx4G5ZCUqzAnZHQx7dbvJZWIy4/s500/dspchain.png)](https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEjs50SBVMLHweIAz9fgk8VptoDsy0oZm0u2LXfH8k5YAUwq20Zh9RQCej5dzGzkjKUKc0YjXsNwsD4mrVtnAPhFIlHY0jW0YJtC2s1gKPm8GJWtwd0bVFqx4G5ZCUqzAnZHQx7dbvJZWIy4/s1600/dspchain.png)

In PAL, every other scanline has its chrominance phase shifted (hence the name, Phase Alternating [by] Line). I couldn't get consistent results demodulating this, so I skipped the chrominance part of every other line and copied it from the line above. This doesn't even look too bad for my purposes. However, there seems to be a pre-echo in UV that's especially visible on a blue background (most of SMB1 sadly), and a faint stripe pattern on the Y channel, most probably crosstalk from the chroma subcarrier that I left intact for now.

[![[Image: The three chroma channels Y, U, and V shown separately as greyscale images, together with a coloured composite of Mario and two Goombas.]](https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEgFPMVeaLGO-ll-fmPdHg7hka4GDK4dxAMxmCysom703v-_8r-Vf5zDdxMXolFrjsYdD6BR6v5J_YZ2tr7-oO3nD1ri8u48wcuwdFE5qmcXl-uOF-H9NJjURQ0GUImH9wQatyx4A6d_IzP9/s320/chroma-preecho.jpg)](https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEgFPMVeaLGO-ll-fmPdHg7hka4GDK4dxAMxmCysom703v-_8r-Vf5zDdxMXolFrjsYdD6BR6v5J_YZ2tr7-oO3nD1ri8u48wcuwdFE5qmcXl-uOF-H9NJjURQ0GUImH9wQatyx4A6d_IzP9/s1600/chroma-preecho.jpg)

I used liquid\_firfilt to band-pass the chroma signal, and liquid\_nco to lock onto the colour burst and shift the chroma to baseband.

### Let's play Tetris! ###

[![Embedded YouTube video](https://img.youtube.com/vi/3TeRvhMBqnE/0.jpg)](https://www.youtube.com/watch?v=3TeRvhMBqnE)

### Latency ###

It's not my goal to use this system as a gaming display; I'm still planning to use the CRT. However, total buffer delays are quite small due to the 10 Msps sampling rate, so the latency from controller to screen is pretty good. The laptop can also easily decode and render at 50 fps, which is the native frame rate of the PAL NES. Tetris is playable up to level 12!

Using a slow-mo phone camera, I measured the time it takes for a button press to make Mario jump. The latency is similar to that of a NES emulator:

|       Method       |Frames @240fps|Latency|
|--------------------|--------------|-------|
| RetroArch emulator |      28      |117 ms |
|PAL NES + Airspy SDR|      26      |108 ms |
|  PAL NES + LCD TV  |      20      | 83 ms |

Maybe you now notice that the CRT is not listed here. That's because before I could make these measurements a funny sound was heard from inside the TV and a picture has never appeared since.

### Performance considerations ###

A 2013 MacBook Pro is perhaps not the best choice for dealing with live video to begin with. But I want to be able to run the PAL decoder *and* a screencap / compositing / streaming client on the same laptop, so performance is even more crucial.

When colour is enabled, CPU usage on this quad-core laptop is 110% for palview and 32% for airspy\_rx. The CPU temperature is somewhere around 85 °C. Black-and-white decoding lowers palview usage to 84% and CPU temps to 80 °C. I don't think there's enough cycles left for a streaming client just yet. Some CPU headroom would be nice as well; a resync after dropped samples looks quite nasty, and I wouldn't want that to happen very often.

![[Image: htop screenshot show palview and airspy_rx on top, followed by some system processes.]](https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEhTTxyKTqsrUbgApxBxqtoaVRUvrj-uEXBkDHJFn1dvhGRLpmWsmtjbe3N8n9N_o0XnnALUpe5VsKpB-Qcc0uXpQQZsrGr-Lmb6nBzs-3EzM5CG6m7iFpwyCUqaQMy1rMXiaYvKXoerH6d9/s500/htop-screenshot.png)

Profiling reveals that the most CPU-intensive tasks are those related to FIR filtering. FIR filters are based on convolution, which is of high computational complexity, unless done in hardware. FFT convolution can also be faster, but only when the kernel is relatively long.

![[Image: Diagram shows the Audio notch FIR takes up 27 % and Chroma Bandpass FIR 12 % of CPU. Several smaller contributors mentioned.](https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEjGYO21h4_lDhrj-qK9YjPE2NhIyflFDD6mk1tWyMTyPmIt7M57gM-fpVqgWmbheLkuHrO0k7skNPKghZ2OKswmo4UkI_YxDJ5Ezuxy5UDoHh5vvxxS2qGHkvdkzRNqyIyy9xwh3OhnMMnt/s450/palview-profiling.png)

![](https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEhowkdKouKs3OcdI0VDXDLqh0mbSioxs_MHXk9akzb2ChqTYfN6betq04MUOsC54kP3P0EjniNOjM3CsI3R5fvBtXafW37BmaRmxyOecYDSZyjX3swAdrX3phcgztUlKEu41ciqmN0NAKTl/s400/dspchain-heat.jpg)

I've thought of having another computer do the Airspy transfer, audio notch filtering, and AM demodulation, and then transmit this preprocessed signal to the laptop via Ethernet. But my other computers (Raspberry Pi 3B+ and a Core 2 Duo T7500 laptop) are not nearly as powerful as the MacBook.

Instead of a FIR bandpass filter, a so-called chrominance comb filter is often used to separate chrominance from luminance. This could be realized very efficiently as a linear-complexity delay line. This is a promising possibility, but so far my experiments have had mixed results.

There's no source code release for now (Why? [FAQ](https://www.windytan.com/p/about.html#sourcecode)), but if you want some real-time coverage of this project, I did a multi-threaded tweetstorm: [one](https://twitter.com/windyoona/status/1160617331208458242), [two](https://twitter.com/windyoona/status/1162455012225835009), [three](https://twitter.com/windyoona/status/1165204552293015552).