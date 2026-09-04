---
title = "My chip collection"
description = "Old IC (integrated circuit) packages are fun and I collect them. This involves going to flea markets to look for cheap vintage electronics like telephones, answering machines, radios or toys, and then desoldering and salvaging all the ICs and other interesting parts. Selected pac"
date = "2015-01-16T17:54:00.001Z"
url = "tag:blogger.com,1999:blog-5096278891763426276.post-4516334154923618454"
author = "Oona Räisänen"
text = ""
lastupdated = "2025-10-22T08:59:03.910312302Z"
seen = true
---

Old IC (integrated circuit) packages are fun and I collect them. This involves going to flea markets to look for cheap vintage electronics like telephones, answering machines, radios or toys, and then desoldering and salvaging all the ICs and other interesting parts. Selected packages from my disorganized pile of chips follow. Most are [POTS](https://en.wikipedia.org/wiki/Plain_old_telephone_service)-related.

### Sony CXA1619BS ###

![[Image: Photo of package]](https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEgLzWDjhxrtaQkYMEY5mWA64DopVUjJg2XKcYjY1wq9Tnf0JfnlnYT_jAhJjGfJhRdvGty4qnwiQBiG7M0KVHlzKGHFMCP0Kh7UdX9Yg6Hzl9k-fO9ThClrQx5Vrh-fQMQiRudLJA6iyIbb/s160/IMG_3605-1.jpg)

A "one-chip-wonder", this is an FM/AM radio in a small package. It takes an RF signal (from the antenna) and an IF oscillator frequency as inputs and outputs demodulated monaural audio.

### Sanyo LA2805 ###

![[Image: Photo of package]](https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEh0WZVUi88LlKBhiBmlw3DnJugciSIWORU48FXUIk5_OBp1aMvzDUV0-xC1ftarqhxy1zLKTWOSrsB3Nn8L79WGSzlZm5x68X4zXqfLjK-IkVnupFn57kA-HR3OIHDwYRm7gQ5CwFJw3OP0/s160/IMG_3667-1.jpg)

This chip does general answering machine related tasks. It has a tape preamp for recording and playback; voice detector logic; beep detection using zero-crossing comparation; power amplifier; line amplifier; and pins for interfacing with a microcontroller.

### Unicorn Microelectronics UM91215C ###

![[Image: Photo of package]](https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEjo_JNMkqcclx0ZYVhiY4y7q9hYhsxxlI6IdFT9td71lWQnXbYoAQeFvc0E0hwF65HQqF6vjRuYlW4Z3PAcv9bmHjv7eI4-zEqTA_0xvONXgwIy6cqK4jriaE5KS93vjk3WiZ3DoyQ5QD9f/s160/IMG_3609-1.jpg)

The UM91215C is a tone/pulse dialer. A telephone keyboard matrix is connected to the input pins, and the chip outputs DTMF-encoded audio or pulsed digits, depending on the selected dialing mode. An external oscillator needs to be connected as well. It can do a one-key redial of the last dialed number, and it can also flash the phone line.

### Holtek HT9170 ###

![[Image: Photo of package]](https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEhgh1m8g62zYfyKiLAosd0IbONX1i9vvzrd9Dk7BwbDSYA6HSjZ752s3M6ReVSFwJTKi2bMAGui4z_Q-hfYS8YUavkB_a1ZMEXukM6HyAB1QEWw3mtRAbcMn9abimPJX038No6raNod5J8g/s160/IMG_3606-1.jpg)

A DTMF receiver, reversing the operation of UM91215C above. The chip, employing filters and zero-crossing detectors, is fed an external oscillator frequency and telephone line audio, and it outputs a four-bit code corresponding to the DTMF digit present in the signal. The use of external components is minimal, but a crystal oscillator is needed in this case as well.

### SGS-Thomson TDA1154 ###

![[Image: Photo of package]](https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEgu_hnwUfVbB91VIe0rcD9YcP0NM8urUYE2qNN6ZCmT2umiEm8k_b68-eiBrvZmsBRt489NmFWFzyh-EE2OpJxcQwrIvGeYvmGDPfWH4AzqkKxCJ1LFv_wG9xmrCkmOs6eJiFJfC2jbETfV/s160/IMG_3617-1.jpg)

A speed regulator for DC motors, this chip can keep a motor running at a very stable speed under varying load conditions. In an answering machine, it is needed to keep [distortions in tape audio](http://www.windytan.com/2013/03/beyond-hiss.html) in the minimum.

### Toshiba TC8835AN ###

![[Image: Photo of package]](https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEjGCGn7_I2GlylRc5oc6ogAu3W8TE7GczyLw2sKrx4CrTzmw5zJc1n__lnSgtn2-Klpg9GAwF6sB75wX9K06DMDadP8LFehYXKcLjU1FtWGpYRAnBMKMSsTFkwgTkyUKs2glNtP2rXo6bgK/s160/IMG_3602-1.jpg)

This chip can store and play back a total of 16 audio recordings of 512 kilobits in size. It also contains a lot of command logic, explained in a 40-page datasheet. Type of audio encoding is not specified, but the bitrate can be chosen between 22kbps and 16kbps. The analog output must be filtered prior to playback.

### Intel 8049 ###

![[Image: Photo of package]](https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEg9XkAxP9Pu088raQuCmkEIIFDwEcYwfb6G8japeR98RK5Kiku0S3FekMBIJi5gb3jIs7SKCVJ7QxutJ8GGUoAmHQvaJgNk3f1fNZmId51AGa3gsd9J-gkRKagi2PQiV_VLX4g2hP7Wlsri/s320/IMG_3623-1.jpg)

This monster of a chip is a 6 MHz, 8-bit microcontroller with 17 registers, 2 kilobytes ROM, 128 bytes RAM, and an instruction set of 90 codes. It's used in many older devices, from telephones to digital multimeters.