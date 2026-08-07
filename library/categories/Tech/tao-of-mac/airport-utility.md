+++
title = "AirPort Utility"
description = "Apple is removing AirPort Utility from iOS 27 and macOS Golden Gate, eight years after discontinuing the hardware it manages. That is an unusually long run, but it still leaves working AirPort Express, [AirPort E"
date = "2026-08-05T14:16:00Z"
url = "https://taoofmac.com/space/apps/airport_utility?utm_content=atom"
author = "Rui Carmo"
text = ""
lastupdated = "2026-08-06T09:52:38.169921046Z"
seen = false
+++

Apple is [removing AirPort Utility](/space/links/2026/06/24/0725) from iOS 27 and macOS Golden Gate, eight years after discontinuing the hardware it manages. That is an unusually long run, but it still leaves working [AirPort Express](/space/com/apple/airport/express), [AirPort Extreme](/space/com/apple/airport/extreme) and [Time Capsule](/space/com/apple/time_capsule) devices without Apple’s configuration software.

[`airport-utility`](https://github.com/jackhumphries/airport-utility?utm_campaign=unsolicited_traffic&utm_medium=web&utm_source=taoofmac.com) is an MIT-licensed reimplementation for macOS 27 and later, with a Swift interface and a Python backend for the AirPort Configuration Protocol. It supports both ACP generations and has been tested against several models from all three product lines, so it should let people keep configuring their AirPorts after Apple’s utility disappears.

<img src="/space/apps/airport_utility/screenshot.jpg?v=3f2eed964369" alt="AirPort Utility showing an AirPort network topology" width="1600" height="900"> The open-source AirPort Utility displaying a network topology

The project is still in beta, requires macOS 13 or later, Swift 6 and Python 3.10, and some devices and features have not been tested yet. It has no third-party Swift or Python dependencies.