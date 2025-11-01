---
title = "Redsea 0.7, a lightweight RDS decoder"
description = "I've written about redsea, my RDS decoder project, many times before. It has changed a lot lately; it even has a version number, 0.7.6 as of this writing. What follows is a summary of its current state and possible future developments.Inp"
date = "2016-10-02T19:10:00.002Z"
url = "tag:blogger.com,1999:blog-5096278891763426276.post-2639573648176576204"
author = "Oona Räisänen"
text = ""
lastupdated = "2025-10-22T08:59:03.896869518Z"
seen = true
---

I've written about [redsea](https://github.com/windytan/redsea), my RDS decoder project, many times before. It has changed a lot lately; it even has a version number, 0.7.6 as of this writing. What follows is a summary of its current state and possible future developments.

### Input formats ###

Redsea can decode several types of data streams. The command-line switches to activate these can be found in the readme.

Its main use, perhaps, is to demodulate an FM multiplex carrier, as received using a cheap rtl-sdr radio dongle and demodulated using rtl\_fm. The multiplex is an FM demodulated signal sampled at 171 kHz, a convenient multiple of the RDS data rate (1187.5 bps) and the subcarrier frequency (57 kHz). There's a convenience shell script that starts both redsea and the rtl\_fm receiver. For example, ./rtl-rx.sh -f 88.0M would start reception on 88.0 MHz.

It can also decode an "ASCII binary" stream (--input-ascii):

```
0001100100111001000101110000101110011000010010110010011001000000100001
1010010000011010110100010000000100000001101110000100010111000010111001
1001000010110000111111011101101011001010101110100011111101000011100010
100000011010010001011100001
```

Or hex-encoded RDS groups one per line (--input-hex), which is the format used by [RDS Spy](http://rdsspy.com/):

```
6201 01D8 E704 594C
6201 01D9 2217 4520
6201 E1C1 594C 6202
6201 01DA 1139 594B
6201 21DC 2020 2020
```

### Output formats ###

The default output has changed drastically. There used to be no strict format to it, rather it was just a human-readable terminal display. This sort of output format will probably return at some point, as an option. But currently redsea outputs line-delimited JSON, where every group is a JSON object on a separate line. It is quite verbose but machine readable and well-suited for post-processing:

```
{"pi":"0x6201","group":"0A","tp":false,"prog_type":"Serious classical","ta":tru
e,"is_music":true,"alt_freqs":[87.9,88.5,89.2,89.5,89.8,90.9,93.2],"ps":"YLE YK
SI"}
{"pi":"0x6201","group":"14A","tp":false,"prog_type":"Serious classical","other_
network":{"pi":"0x6205","tp":false,"has_linkage":false}}
{"pi":"0x6201","group":"0A","tp":false,"prog_type":"Serious classical","ta":tru
e,"is_music":true,"partial_ps":"YL      "}
{"pi":"0x6201","group":"2A","tp":false,"prog_type":"Serious classical","partial
_radiotext":"Yöklassinen."}
{"pi":"0x6201","group":"0A","tp":false,"prog_type":"Serious classical","ta":tru
e,"is_music":true,"partial_ps":"YLE     "}
{"pi":"0x6201","group":"0A","tp":false,"prog_type":"Serious classical","ta":tru
e,"is_music":true,"partial_ps":"YLE YK  "}
{"pi":"0x6201","group":"2A","tp":false,"prog_type":"Serious classical","partial
_radiotext":"Yöklassinen."}
{"pi":"0x6201","group":"0A","tp":false,"prog_type":"Serious classical","ta":tru
e,"is_music":true,"alt_freqs":[87.9,88.5,89.2,89.5,89.8,90.9,93.2],"ps":"YLE YK
SI"}
```

Someone on GitHub [hinted](https://github.com/windytan/redsea/issues/24#issuecomment-247766780) about jq, a command-line tool that can color and filter JSON, among other things:

```
> ./rtl-rx.sh -f 87.9M | jq -c
{"pi":"0x6201","group":"0A","tp":false,"prog_type":"Serious classical","ta":tru
e,"is_music":true,"partial_ps":"YL      "}
{"pi":"0x6201","group":"14A","tp":false,"prog_type":"Serious classical","other_
network":{"pi":"0x6202","tp":false}}
{"pi":"0x6201","group":"0A","tp":false,"prog_type":"Serious classical","ta":tru
e,"is_music":true,"partial_ps":"YLE     "}
{"pi":"0x6201","group":"0A","tp":false,"prog_type":"Serious classical","ta":tru
e,"is_music":true,"partial_ps":"YLE YK  "}
{"pi":"0x6201","group":"1A","tp":false,"prog_type":"Serious classical","prog_it
em_started":{"day":9,"time":"23:10"},"has_linkage":false}
^C

> ./rtl-rx.sh -f 87.9M | grep "\"radiotext\"" | jq ".radiotext"
"Yöklassinen."
"Yöklassinen."
"Yöklassinen."
"Yöklassinen."
"Yöklassinen."
"Yöklassinen."
"Yöklassinen."
```

The output can be timestamped using the ts utility from moreutils.

Additionally, redsea can output hex-endoded groups, the same format mentioned above.

### Fast and lightweight ###

I've made an effort to make redsea fast and lightweight, so that it could be run real-time on cheap single-board computers like the Raspberry Pi 1. I rewrote it in C++ and chose [liquid-dsp](http://liquidsdr.org/) as the DSP library, which seems to work very well for the purpose.

Redsea now uses around 40% CPU on the Pi 1. Enough cycles will be left for the FM receiver, rtl\_fm, which has a similar CPU demand. On my laptop, redsea has negligible CPU usage (0.9% of a single core). Redsea only runs a single thread and takes up 1500 kilobytes of memory.

### Sensitivity ###

I've gotten several reports that redsea requires a stronger signal than other RDS decoders. This has been improved in recent versions, but I think it still has problems with even many local stations.

Let's examine how a couple of test signals go through the demodulator in [Subcarrier::​demodulateMoreBits()](https://github.com/windytan/redsea/blob/master/src/subcarrier.cc#L122) and list possible problems. The test signals shall be called the good one (blue) and the noisy one (magenta). They were recorded on different channels using different antenna setups. Here are their average demodulated power spectra:

[![[Image: Spectrum plots of the two signals superimposed.]](https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEjxJb8tfNcyfwlqRoibN9ffpl4QTwWtHbxI_XwUQURfVL9Sabkfj7MVufWlpiHT5q1bSgi13xowZ_YVcFHu82JkG3JcnUALlyf0qe_tMvqG7rPaAfOAp8kp8haCQfhysja4ITKwXE6j_bQn/s520/viker-puhe.png)](https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEjxJb8tfNcyfwlqRoibN9ffpl4QTwWtHbxI_XwUQURfVL9Sabkfj7MVufWlpiHT5q1bSgi13xowZ_YVcFHu82JkG3JcnUALlyf0qe_tMvqG7rPaAfOAp8kp8haCQfhysja4ITKwXE6j_bQn/s1600/viker-puhe.png)

The noise floor around the RDS subcarrier is roughly 23 dB higher in the noisy signal. Redsea recovers 99.9 % of transmitted blocks from the good signal and 60.1 % from the noisy one.

Below, redsea locks onto our good-quality signal. Time is in seconds.

[![[Image: A graph of several signal properties against time.]](https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEiWhUWCDPhsTT7vtVZJibWzn4K_2SoG9EOY75kRFeLXZgK7PN8ML5O33DeD43SGMKDcErB_dvzwmC7DhzV18pHLlrrEcLsRdjfQw8o964RBjAUVHDCLIiHhExYFocZDKAgMbMXfDPUWaa1f/s520/NZjst7F.png)](https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEiWhUWCDPhsTT7vtVZJibWzn4K_2SoG9EOY75kRFeLXZgK7PN8ML5O33DeD43SGMKDcErB_dvzwmC7DhzV18pHLlrrEcLsRdjfQw8o964RBjAUVHDCLIiHhExYFocZDKAgMbMXfDPUWaa1f/s1600/NZjst7F.png)

Out of the noisy signal, redsea could recover a majority of blocks as well, even though the PLL and constellations are all over the place:

[![[Image: A graph of several signal properties against time.]](https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEibHzljSbMrQw5VMB4ErTyv3bxmE5tFl4MKbu6Y7njkCOsF8cnY07FpLUynNBXQ5owOVwwvxaGEXI1xvcp7kciC5T9DXDfJUri1rGDixvq8FcnKYBgleIstRJ4ooUSkTywe8pXk_H9oQdkp/s520/wXmOjiN.png)](https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEibHzljSbMrQw5VMB4ErTyv3bxmE5tFl4MKbu6Y7njkCOsF8cnY07FpLUynNBXQ5owOVwwvxaGEXI1xvcp7kciC5T9DXDfJUri1rGDixvq8FcnKYBgleIstRJ4ooUSkTywe8pXk_H9oQdkp/s1600/wXmOjiN.png)

#### 1) PLL ####

There's some jitter in the 57 kHz PLL, especially pronounced when the signal is noisy. One would expect a PLL to slowly converge on a frequency, but instead it just fluctuates around it. The PLL is from the liquid-dsp library (internal PLL of the NCO object).

* Is this an issue?
* What could affect this? Loop filter bandwidth?
* What about the gain, i.e. the multiplier applied to the phase error?

#### 2) Symbol synchronizer ####

* Is liquid's symbol synchronizer being used correctly?
* What should be the correct values for bandwidth, delay, excess bandwidth factor?
* Do we really need a separate PLL and symbol synchronizer? Couldn't they be combined somehow? Afterall, the PLL already gives us a multiple of the symbol speed (57,000 / 48 = 1187.5).

#### 3) Pilot tone ####

The PLL could potentially be made to lock onto the pilot tone instead. It would yield a much higher SNR.

* According to the specs, the RDS subcarrier is phase-locked to the pilot, but can we trust this? Also, the phase difference is not defined in the standard.
* What about mono stations with no pilot tone?
* Perhaps a command-line option?

 See [redsea wiki](https://github.com/windytan/redsea/wiki/RDS-clock-recovery-from-pilot-tone?) for discussion.

#### 4) rtl\_fm ####

* Are the parameters for rtl\_fm (gain, filter) optimal?
* Is there a poor-quality resampling phase somewhere, such as the one mentioned in the [rtl\_fm guide](http://kmkeen.com/rtl-demod-guide/)? Probably not, since we don't specify -r
* Is the bandwidth (171 kHz) right?

### Other features (perhaps you can help!) ###

Besides the basic RDS features (program service name, radiotext, etc.) redsea can decode some Open Data applications as well. It receives traffic messages from the TMC service and prints them in English. These are partially encrypted in some areas. It can also decode RadioText+, a service used in some parts of Germany to transmit such information as artist/title tags, studio hotline numbers and web links.

If there's an interesting service in your area you'd like redsea to support, please tell me! I've heard eRT (Enhanced RadioText) being in use somewhere in the world, and RASANT is used to send DGPS corrections in Germany, but I haven't seen any good data on those.

A minute or two of example data would be helpful; you can get hex output by adding the -x switch to the redsea command in rtl-rx.sh.