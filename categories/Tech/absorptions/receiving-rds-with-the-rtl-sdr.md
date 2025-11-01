---
title = "Receiving RDS with the RTL-SDR"
description = "redsea is a command-line RDS decoder. I originally wrote it as a script to decode RDS from demultiplexed FM stereo sound. Later I've experimented with other ways to read the bits, and the latest addition is to support t"
date = "2015-02-08T19:10:00.001Z"
url = "tag:blogger.com,1999:blog-5096278891763426276.post-816383728626550138"
author = "Oona Räisänen"
text = ""
lastupdated = "2025-10-22T08:59:03.908144974Z"
seen = true
---

redsea is a command-line RDS decoder. I originally wrote it as a script to decode RDS from [demultiplexed FM stereo sound](http://www.windytan.com/2013/04/how-i-discovered-rds.html). Later I've experimented with other ways to read the bits, and the latest addition is to support the RTL-SDR television receiver via the rtl\_fm tool.

Redsea is on [GitHub](https://github.com/windytan/redsea). It has minimal dependencies (perl core modules, C standard library, rtl-sdr command-line tools) and has been tested to work on OSX and Linux with good enough FM reception. All test results, ideas, and pull requests are welcome.

**Update 12/2016:** Redsea has seen a lot of development since this post was written; see [Redsea 0.7, a lightweight RDS decoder](http://www.windytan.com/2016/10/redsea-07-lightweight-rds-decoder.html).

### What it says ###

The program prints out decoded RDS groups, one group per line. Each group will contain a PI code identifying the station plus varying other data, depending on the group type. The below picture explains the types of data you'll probably most often encounter.

[![[Image: Screenshot of textual output from redsea, with some parts explained.]](https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEghDSuLUBhcKfHe0dEKhePRSEWFhrKu3tNkSLDL7rHZQUfMFDTcbS2AhNSlM2HRToqNGoq6YSdk3fIxa3fcF2cgGkfCmpmNA_QVIfaYgLN21JJ-LwF-Avf__oVdquGFti67-DKlqYrqZj6T/s520/rds-groups.png)](https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEghDSuLUBhcKfHe0dEKhePRSEWFhrKu3tNkSLDL7rHZQUfMFDTcbS2AhNSlM2HRToqNGoq6YSdk3fIxa3fcF2cgGkfCmpmNA_QVIfaYgLN21JJ-LwF-Avf__oVdquGFti67-DKlqYrqZj6T/s1600/rds-groups.png)

A more verbose output can be enabled with the -l option (it contains the same information though). The -t option prefixes all groups with an ISO timestamp.

### How it works ###

The DSP side of my program, named rtl\_redsea, is written in C99. It's a synchronous DBPSK receiver that first bandpass filters ① the multiplex signal. A PLL locks onto the 19 kHz stereo pilot tone; its third harmonic (57 kHz) is used to regenerate the RDS subcarrier. Dividing it by 16 also gives us the 1187.5 Hz clock frequency. Phase offsets of these derived signals are adjusted separately.

[![[Image: Oscillograms illustrating how the RDS subcarrier is gradually processed in redsea and finally reduced to a series of 1's and 0's.]](https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEi0-32woZW6BB5JDgpyzAf3g6a9QG30gFenMBF9dyxaWlwVDJs3tcnuvOY8W47uLsHahxks2255_giLHj6AP7uDGm_o8CWR0JKg0EniI5Zq50bzKexdQ5PD1zwSSEasGilj7iEj0x8zg7a2/s500/redsea-waves-all.png)](https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEi0-32woZW6BB5JDgpyzAf3g6a9QG30gFenMBF9dyxaWlwVDJs3tcnuvOY8W47uLsHahxks2255_giLHj6AP7uDGm_o8CWR0JKg0EniI5Zq50bzKexdQ5PD1zwSSEasGilj7iEj0x8zg7a2/s1600/redsea-waves-all.png)

The local 57 kHz carrier is synchronized so that the constellation lines up on the real axis, so we can work on the real part only ②. Biphase symbols are multiplied by the square-wave clock and integrated ③ over a clock period, and then dumped into a delta decoder ④, which outputs the binary data as bit strings into stdout ⑤.

Signal quality is estimated a couple of times per second by counting the number of "suspicious" integrated biphase symbols, i.e. symbols with halves of opposite signs. The symbols are being sampled with a 180° phase shift as well, and we can switch to that stream if it seems to produce better results.

This low-throughput binary string data is then handled by redsea.pl via a pipe. Synchronization and error detection/correction happens there, as well as decoding. Group data is then displayed on the terminal, in semi-human-readable form.

### Future ###

My ultimate goal is to have a tool useful for FM DX, i.e. pretty good noise resistance.