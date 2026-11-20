+++
title = "OpenStick"
description = "OpenStick projects repurpose inexpensive Qualcomm MSM8916-based 4G LTE USB modems as small Linux devices. These sticks combine an ARM processor, cellular modem and onboard storage; some variants also have Wi-Fi. Boards and flash layouts vary, so software and recovery instructions"
date = "2026-11-13T15:31:00Z"
url = "https://taoofmac.com/space/hw/openstick?utm_content=atom"
author = "Rui Carmo"
text = ""
lastupdated = "2026-11-19T14:05:19.601303407Z"
seen = false
+++

OpenStick projects repurpose inexpensive Qualcomm MSM8916-based 4G LTE USB modems as small Linux devices. These sticks combine an ARM processor, cellular modem and onboard storage; some variants also have Wi-Fi. Boards and flash layouts vary, so software and recovery instructions are specific to the device.

[

Firmware and recovery
----------

](/space/hw/openstick#firmware-and-recovery)

The resources below include a Debian installer and an [OpenWrt](/space/os/linux/distributions/openwrt) port for supported LTE sticks and pocket routers. Check the exact board and the project’s compatibility list before choosing an image. Back up the original eMMC and device-specific calibration data before flashing: an incorrect image or interrupted flash can cause data loss, loss of cellular service or permanent damage.

[

Resources
----------

](/space/hw/openstick#resources)

|  Category  |Date|                                                                     Link                                                                     |                                                                                                 Notes                                                                                                 |
|------------|----|----------------------------------------------------------------------------------------------------------------------------------------------|-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
|  Firmware  |2026|   [MSM8916 OpenWrt](https://github.com/akbar-npj/msm8916-openwrt?utm_campaign=unsolicited_traffic&utm_medium=web&utm_source=taoofmac.com)    |              OpenWrt port for supported Qualcomm MSM8916/MSM8939 LTE dongles and pocket routers, with ModemManager, Wi-Fi and USB networking; check board compatibility before flashing.              |
|Installation|2026|[OpenStick Installer](https://github.com/Basistiy/openstick-installer?utm_campaign=unsolicited_traffic&utm_medium=web&utm_source=taoofmac.com)|Cross-platform tool for backing up and flashing Debian images onto supported MSM8916 USB modems via Qualcomm EDL, preserving device calibration data; flashing carries a risk of data loss or bricking.|