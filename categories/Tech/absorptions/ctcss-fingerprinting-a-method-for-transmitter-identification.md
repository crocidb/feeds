---
title = "CTCSS fingerprinting: a method for transmitter identification"
description = "Identifying unknown radio transmitters by their signals is called radio fingerprinting. It is usually based on rise-time signatures, i.e. characteristic differences in how the transmitter frequency fluctuates at carrier power-up. Here, instead, I investigate the fingerprintabilit"
date = "2016-10-07T13:17:00.006Z"
url = "tag:blogger.com,1999:blog-5096278891763426276.post-5807076314064390779"
author = "Oona Räisänen"
text = ""
lastupdated = "2025-10-22T08:59:03.894513152Z"
seen = true
---

Identifying unknown radio transmitters by their signals is called radio fingerprinting. It is usually based on rise-time signatures, i.e. characteristic differences in how the transmitter frequency fluctuates at carrier power-up. Here, instead, I investigate the fingerprintability of another feature in hand-held FM transceivers, known as [CTCSS](https://en.wikipedia.org/wiki/Continuous_Tone-Coded_Squelch_System) or Continuous Tone-Coded Squelch System.

### Motivation & data ###

I came across a long, losslessly compressed recording of some walkie-talkie chatter and wanted to know more about it, things like the number of participants and who's talking with who. I started writing a transcript – a fun pastime – but some voices sounded so similar I wondered if there was a way to tell them apart automatically.

[![[Image: Screenshot of Audacity showing an audio file over eleven hours long.]](https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEgjyjQ5aQ5C_WSBEMIuM7R_1CZyvc4zMoPWt4Egna3qhWYNKJN2iZZB-NciG3Efy8Qo-utByS1Wr6fzGtkfg8omYo2BK7JfNT-EzKHfwmSEpQBLOfQ8SaLvbqj98DLt49nnxJye2G-u6n25/s520/Screen+Shot+2016-09-26+at+0.19.53.png)](https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEgjyjQ5aQ5C_WSBEMIuM7R_1CZyvc4zMoPWt4Egna3qhWYNKJN2iZZB-NciG3Efy8Qo-utByS1Wr6fzGtkfg8omYo2BK7JfNT-EzKHfwmSEpQBLOfQ8SaLvbqj98DLt49nnxJye2G-u6n25/s1600/Screen+Shot+2016-09-26+at+0.19.53.png)

The file comprises several thousand short transmissions as FM demodulated audio lowpass filtered at 4500 Hz. Signal quality is variable; most transmissions are crisp and clear but some are buried under noise. Passages with no signal are squelched to zero.

I considered several potentially fingerprintable features, many of them unrealistic:

* Carrier power-up; but many transmissions were missing the very beginning because of squelch
* Voice identification; but it would probably require pretty sophisticated algorithms (too difficult!) and longer samples
* Mean audio power; but it's not consistent enough, as it depends on text, tone of voice, etc.
* Maximum audio power; but it's too sensitive to peaks in FM noise

I then noticed all transmissions had a very low tone at 88.5 Hz. It turned out to be CTCSS, an inaudible signal that enables handsets to silence unwanted transmissions on the same channel. This gave me an idea inspired by [mains frequency analysis](https://en.wikipedia.org/wiki/Electrical_network_frequency_analysis): Could this tone be measured to reveal minute differences in crystal frequencies and modulation depths? Also, knowing that these were recorded using a cheap DVB-T USB stick – would it have a stable enough oscillator to produce consistent measurements?

### Measurements ###

I used the [liquid-dsp](https://github.com/jgaeddert/liquid-dsp/) library for signal processing. It has several methods for measuring frequencies. I decided to use a phase-locked loop, or PLL; I could have also used FFT with peak interpolation.

In my fingerprinting tool, the recording is first split into single transmissions. The CTCSS tone is bandpass filtered and a PLL starts tracking it. When the PLL frequency stops fluctuating, i.e. the standard deviation is small enough, it's considered locked and its frequency is averaged over this time. The average RMS power is measured similarly.

Here's one such transmission:

[![[Image: A graph showing frequency and power, first fluctuating but then both stabilize for a moment, where text says 'PLL locked'. Caption says 'No, I did not copy'.]](https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEhwIys3UsSSN0416QgmaXwvwEQ15s17O6sFWs9AJ0nkeKszasjvgzaEZ3dzqNAb-rlvsduwGU3yNl_1621sPnOtUE_wsdCfuAVCB8sONadQBuueNtjaJKKLU1nfBKmbvZuyfCRrthlBw68Q/s480/plot-lock.png)](https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEhwIys3UsSSN0416QgmaXwvwEQ15s17O6sFWs9AJ0nkeKszasjvgzaEZ3dzqNAb-rlvsduwGU3yNl_1621sPnOtUE_wsdCfuAVCB8sONadQBuueNtjaJKKLU1nfBKmbvZuyfCRrthlBw68Q/s1600/plot-lock.png)

### Results ###

At least three clusters are clearly distinguishable by eye. Zooming in to one of the clusters reveals it's made up of several smaller clusters. Perhaps the larger clusters correspond to three different models of radios in use, and these smaller ones are the individual transmitters?

[![[Image: A plot of RMS power versus frequency, with dots scattered all over, but mostly concentrated in a few clusters.]](https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEhrhYz0_IxabL_QLPuN0Rt8QzJ1uy_bkd1tLC4q1cpRzh_mMREjKb7UUnLU1Ri-rFyaWydXCrnEYymsKnkQDed51EaPYmIumgb-W8BK5KqaUOfuMq83HzPsFSDfr5wWub56L73O_heotwK5/s520/plot12.png)](https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEhrhYz0_IxabL_QLPuN0Rt8QzJ1uy_bkd1tLC4q1cpRzh_mMREjKb7UUnLU1Ri-rFyaWydXCrnEYymsKnkQDed51EaPYmIumgb-W8BK5KqaUOfuMq83HzPsFSDfr5wWub56L73O_heotwK5/s1600/plot12.png)

A heat map reveals even more structure:

[![[Image: The same clusters presented in a gradual color scheme and numbered from 1 to 12.]](https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEixlW3cmPy8YU5-c8M8OLOs1GlGhyphenhyphenebaTp6Xc7WzVmi9goQbEYPD-CLhE6aQGfhVcLIpdkMGUrfh-Ri-ehUplQraoz8ag2Rn4r3VyVT-D35i1Oxbv14qrf6rFFrKQ76bBHmZkOwm_XxxWDD/s420/heatmap3.png)](https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEixlW3cmPy8YU5-c8M8OLOs1GlGhyphenhyphenebaTp6Xc7WzVmi9goQbEYPD-CLhE6aQGfhVcLIpdkMGUrfh-Ri-ehUplQraoz8ag2Rn4r3VyVT-D35i1Oxbv14qrf6rFFrKQ76bBHmZkOwm_XxxWDD/s1600/heatmap3.png)

It seems at least 12 clusters, i.e. potential individual transmitters, can be distinguished.

Even though most transmissions are part of some cluster, there are many outliers as well. These appear to correspond to a very noisy or very short transmission. (Could the FFT have produced better results with these?)

### Use as transcription aid ###

My goal was to make these fingerprints useful as labels aiding transcription. This way, a human operator could easily distinguish parties of a conversation and add names or call signs accordingly.

I experimented with automated k-means clustering, but that didn't immediately produce appealing results. Then I manually assigned 12 anchor points at apparent cluster centers and had a script calculate the nearest anchor point for all transmissions. Prior to distance calculations the axes were scaled so that the data seemed uniformly distributed around these points.

This automatic labeling proved quite sensitive to errors. It could be useful when listing possible transmitters for an unknown transmission with no context; distances to previous transmissions positively mentioning call signs could be used. Instead I ended up printing the raw coordinates and colouring them with a continuous RGB scale:

[![[Image: A few lines from a conversation between Boa 1 and Cobra 1. Numbers in different colors are printed in front of each line.]](https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEjy9wyge-5pOtq7REJyPPznqfHLZSsuvleHEhGm5XVN9iLpGL2gN9Th6nBiedVP2iple9fuMPfF_tX6JSz-yYVjcevReNuE_Pnj5YrAm4YYc3ZeYWpMJV1XNWauB6ccyrhbeNl-KfZNN3Zn/s520/snakes.png)](https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEjy9wyge-5pOtq7REJyPPznqfHLZSsuvleHEhGm5XVN9iLpGL2gN9Th6nBiedVP2iple9fuMPfF_tX6JSz-yYVjcevReNuE_Pnj5YrAm4YYc3ZeYWpMJV1XNWauB6ccyrhbeNl-KfZNN3Zn/s1600/snakes.png)

Here the colours make it obvious which party is talking. Call signs written in a darker shade are deduced from the context. One sentence, most probably by "Cobra 1", gets lost in noise and the RMS power measurement becomes inaccurate (463e-6). The PLL frequency is still consistent with the conversation flow, though.

### Countermeasures ###

If CTCSS is not absolutely required in your network, i.e. there are no unwanted conversations on the frequency, then it can be disabled to prevent this type of fingerprinting. In Motorola radios this is done by setting the CTCSS code to 0. (In the menus it may also be called a PT code or Interference Eliminator code.) In many other consumer radios it's doesn't seem to be that easy.

### Conclusions ###

CTCSS is a suitable signal for fingerprinting transmitters, reflecting minute differences in crystal frequencies and, possibly, FM modulation indices. Even a cheap receiver can recover these differences. It can be used when the signal is already FM demodulated or otherwise not suitable for more traditional rise-time fingerprinting.