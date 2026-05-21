+++
title = "Tailscale"
description = "Tailscale is a centrally-managed overlay network VPN service that provides seamless connectivity across your devices no matter where they reside, with a fe"
date = "2024-03-28T17:30:00Z"
url = "https://taoofmac.com/space/apps/tailscale?utm_content=atom"
author = "Rui Carmo"
text = ""
lastupdated = "2026-05-20T09:23:14.744478244Z"
seen = false
+++

[Tailscale](https://tailscale.com?utm_source=taoofmac.com&utm_medium=web&utm_campaign=unsolicited_traffic&utm_content=external_link) is a centrally-managed overlay network `VPN` service that provides seamless connectivity across your devices no matter where they reside, with a few interesting features:

* Support for direct access to other LANs (and outbound Internet connections) via “exit nodes”
* Support for every single operating system I use (including both major mobile platforms)
* Ability to run an exit node on the [Apple TV](/space/com/apple/tv)
* Availability of an alternate central management service.

I have been using it for a couple of years as a way to remotely access my home machines (and other stuff) when traveling, and have been very happy with it.

[

Resources
----------

](/space/apps/tailscale#resources)

|                                                                            Category                                                                             |                                   Date                                    |                                                                         Link                                                                         |                                        Notes                                         |
|-----------------------------------------------------------------------------------------------------------------------------------------------------------------|---------------------------------------------------------------------------|------------------------------------------------------------------------------------------------------------------------------------------------------|--------------------------------------------------------------------------------------|
|                                                                             Server                                                                              |                                   2024                                    | [headscale](https://github.com/juanfont/headscale?utm_source=taoofmac.com&utm_medium=web&utm_campaign=unsolicited_traffic&utm_content=external_link) |                        a self-hosted Tailscale control server                        |
|                                                                              Tools                                                                              |                                   2026                                    |[tailsnitch](https://github.com/Adversis/tailsnitch?utm_source=taoofmac.com&utm_medium=web&utm_campaign=unsolicited_traffic&utm_content=external_link)|a security auditor that scans tailnets for misconfigurations and risky access controls|
|      [microlink](https://github.com/CamM2325/microlink?utm_source=taoofmac.com&utm_medium=web&utm_campaign=unsolicited_traffic&utm_content=external_link)       |a Tailscale-compatible VPN client for ESP32 with Wi-Fi and cellular support|                                                                                                                                                      |                                                                                      |
|                                                                               UI                                                                                |                                   2024                                    |[trayscale](https://github.com/DeedleFake/trayscale?utm_source=taoofmac.com&utm_medium=web&utm_campaign=unsolicited_traffic&utm_content=external_link)|                        a system tray icon for Linux desktops                         |
|[tailscale-systray](https://github.com/mattn/tailscale-systray?utm_source=taoofmac.com&utm_medium=web&utm_campaign=unsolicited_traffic&utm_content=external_link)|                another system tray icon for Linux desktops                |                                                                                                                                                      |                                                                                      |