---
title = "Flashing a different firmware for the Atreus keyboard"
description = 'I just bought an Atreus keyboard and I’m now configuring my own firmware. To do that, I’m using the qmk\_firmware. I’m adding a new file as a layout (link here) and I have to change tmk\_core/common/avr/bootloader.c to be able to compile it: -uint32\_t reset\_key \_\_attribute\_\'
date = "2018-10-22T00:00:00Z"
url = "https://pothix.com/atreus-firmware/"
author = ""
text = ""
lastupdated = "2025-10-22T08:59:09.086920786Z"
seen = true
---

I just bought an Atreus keyboard and I’m now configuring my own firmware. To do that, I’m using the qmk\_firmware. I’m adding a new file as a layout (link here) and I have to change tmk\_core/common/avr/bootloader.c to be able to compile it: -uint32\_t reset\_key \_\_attribute\_\_ ((section (".noinit"))); +uint32\_t reset\_key \_\_attribute\_\_ ((section (".noinit,\\"aw\\",@nobits;"))); After that, I just had to get the keyboard to the reset mode via fn + ESC (to change the layout) and then pressed the RESET button.