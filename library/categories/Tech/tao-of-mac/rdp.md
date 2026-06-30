+++
title = "RDP"
description = '<img src="https://taoofmac.com/media/protocols/rdp/ucop_gjfG-lg2bDi5kFC01ZObUM=/rdc.jpg" style="max-width: 100%;height: auto;float: right;padding-left: 1em" width="125" height="121"The [Remote Desktop Protocol](http://en.wikipedia.org/wiki/Remote_Desktop_Protocol?utm_source=taoo'
date = "2003-03-02T15:24:13Z"
url = "https://taoofmac.com/space/protocols/rdp?utm_content=atom"
author = "Rui Carmo"
text = ""
lastupdated = "2026-06-29T12:19:41.641374629Z"
seen = false
+++

<img src="https://taoofmac.com/media/protocols/rdp/ucop_gjfG-lg2bDi5kFC01ZObUM=/rdc.jpg" style="max-width: 100%;height: auto;float: right;padding-left: 1em" width="125" height="121">

The [Remote Desktop Protocol](http://en.wikipedia.org/wiki/Remote_Desktop_Protocol?utm_source=taoofmac.com&utm_medium=web&utm_campaign=unsolicited_traffic&utm_content=external_link), which has a long and colorful history. I much prefer it over [VNC](/space/protocols/vnc) due to its vastly superior performance and extra features.

[

H.264/AVC Acceleration up to 60 fps (The Short Version)
----------

](/space/protocols/rdp#h-264/avc-acceleration-up-to-60-fps-the-short-version)

On Windows 10/Server 2016 and above, you can enable nearly 60fps connections between clients using H.264, which considerably improves the user experience. To do that, on the server:

1. Run `gpedit.msc` (Windows 10 Pro or above, although there are ways to enable it on Home)
2. Go to `Computer Configuration -> Administrative Templates -> Windows Components -> Remote Desktop Services -> Remote Desktop Session Host -> Remote Session Environment`
3. Enable `Prioritize H.264/AVC 444 Graphics mode for Remote Desktop`
4. Enable `Configure H.264/AVC hardware encoding for Remote Desktop`
5. If your machine has a discrete GPU, enable also `Use hardware graphics adapters for all Remote Desktop Services sessions`
6. Run `gpupdate /force`
7. Create a `DWMFRAMEINTERVAL` `DWORD` (32-bit) under `HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Terminal Server\WinStations` with the value 15 (decimal) to set fps to 60.

Modern versions of [Remmina](/space/apps/gnome/remmina) support this as `GFX AVC 444`, although the results will greatly vary depending on the client.

[

The Long Version
----------

](/space/protocols/rdp#the-long-version)

This is a more detailed version of the above which I gleaned from various sources when I needed to re-tune a server and had to re-do the whole thing.

>
>
> If you intend to use UDP, make sure you can receive traffic on port 3391.
>
>

[

### Server Policy Changes ###

](/space/protocols/rdp#server-policy-changes)

Run `gpedit.msc` and configure these settings, using `gpupdate /force` in an admin prompt afterwards:

```
Computer Configuration:
  Administrative Templates:
    Windows Components:
      Remote Desktop Services:
        Remote Desktop Session Host:
          Connections:
            - Select RDP Transfer Protocols = Enabled, Use both UDP and TCP
          Device and Resource Redirection:
            - Do not allow supported Plug and Play device redirection = Disabled
          Remote Session Environment:
            - Configure compression for Remote FX data = Enabled, Do not use an RDP compression algorithm
            - Configure H.264/AVC Hardware encoding for Remote Desktop Connections = Enabled,  Prefer AVC hardware encoding = Always attempt
            - Configure image quality for RemoteFX Adaptive Graphics = Enabled, High
            - Configure Remote FX Adaptive Graphics = Enabled, Optimize for server scalability
            - Enable RemoteFX encoding for RemoteFX clients designed for Windows Server 2008 R2 SP1 = Enabled
            - Prioritize H.264/AVC 444 graphics mode for Remote Desktop Connections = Enabled
            - Remote FX Adaptive Graphics = Enabled
            - Use hardware graphics adapters for all Remote Desktop Services sessions = Enabled
            - Use WDDM graphics display driver for Remote Desktop Connections = Disabled
            Remote FX for Windows Server 2008 R2:
              - Configure Remote FX = Enabled
              - Optimize visual experience when using Remote FX = Enabled, Highest (Best Quality) for both Screen Capture Rate and Screen Image Quality
              - Optimize visual experience for remote desktop sessions = Enabled, Rich Multimedia

```

[

### Server Registry Changes ###

](/space/protocols/rdp#server-registry-changes)

Save this out to a `.reg` file, edit to taste, import and reboot.

```
Windows Registry Editor Version 5.00

;Sets 60 FPS limit on RDP.
;Source: https://support.microsoft.com/en-us/help/2885213/frame-rate-is-limited-to-30-fps-in-windows-8-and-windows-server-2012-r
;YMMV, since policies also have an impact on this
[HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Terminal Server\WinStations]
"DWMFRAMEINTERVAL"=dword:0000000f

;Increase Windows Responsiveness
;Source:https://www.reddit.com/r/killerinstinct/comments/4fcdhy/an_excellent_guide_to_optimizing_your_windows_10/
;Not really sure how much this helps in Windows 11
[HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile]
"SystemResponsiveness"=dword:00000000

;Sets the flow control for Display vs Channel Bandwidth (aka RemoteFX devices, including controllers.)
;May not be very useful if your client negotiates other protocols.
[HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\TermDD]
"FlowControlDisable"=dword:00000001
"FlowControlDisplayBandwidth"=dword:0000010
"FlowControlChannelBandwidth"=dword:0000090
"FlowControlChargePostCompression"=dword:00000000

;Removes the artificial latency delay for RDP.
;Again, not sure how much this helps in Windows 11
[HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Terminal Server\WinStations\RDP-Tcp]
"InteractiveDelay"=dword:00000000

;Disable Windows Network Throttling.
[HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\LanmanWorkstation\Parameters]
"DisableBandwidthThrottling"=dword:00000001

;Enable large MTU packets. Might cause some issues over VPNs, so if things start acting funny, revert this.
"DisableLargeMtu"=dword:00000000

;Disables WDDM Drivers and goes back to legacy XDDM drivers (theoretically better for performance on NVIDIA cards, you might want to change this setting for AMD cards.)
;Of dubious effect in Windows 11 given policy settings.
[HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows NT\Terminal Services]
"EnableWddmDriver"=dword:00000000

```

Also, if you have a dual GPU system, open the NVIDIA control panel and set it as the preferred graphics processor (Windows 11 has somewhat deprecated this, but it worked for me).

[

### Client Policy Changes ###

](/space/protocols/rdp#client-policy-changes)

If you need to share USB devices (including webcams, although those rely on your client having UVC pass-through support), do this:

Run `gpedit.msc` and configure these settings, using `gpupdate /force` in an admin prompt afterwards:

```
Computer Configuration:
  Administrative Templates:
    Windows Components:
      Remote Desktop Services:
        Remote Desktop Connection Client:
          RemoteFX USB Device Redirection:
            - Allow RDP redirection of other supported RemoteFX USB devices from this computer = Enabled, Users and Administrators

```

`gpupdate /force`

[

### Mac Client .rdp tweaks ###

](/space/protocols/rdp#mac-client-rdp-tweaks)

Since the official Mac Remote Desktop clients lack a lot of settings, I’ve found that these may help for LAN connections in some regards:

```
networkautodetect:i:0
connection type:i:6
videoplaybackmode:1

```

However, Jump Desktop tends to do a better job connecting to `xrdp` in Mac OS. On iOS, the official RD Client is often better.

[

### Fixing The Black Square Cursor when connecting to `xrdp` ###

](/space/protocols/rdp#fixing-the-black-square-cursor-when-connecting-to)

Add this to `/etc/xrdp/xrdp.ini` as a workaround:

```
new_cursors=false

```

[

Resources
----------

](/space/protocols/rdp#resources)

|                                                                              Category                                                                               |                                                                                   Date                                                                                    |                                                                                Link                                                                                 |                                            Notes                                            |
|---------------------------------------------------------------------------------------------------------------------------------------------------------------------|---------------------------------------------------------------------------------------------------------------------------------------------------------------------------|---------------------------------------------------------------------------------------------------------------------------------------------------------------------|---------------------------------------------------------------------------------------------|
|                                                                            Alternatives                                                                             |                                                                                   2025                                                                                    |      [Kasm](https://docs.linuxserver.io/images/docker-kasm?utm_source=taoofmac.com&utm_medium=web&utm_campaign=unsolicited_traffic&utm_content=external_link)       |           A set of pre-baked containers that provide web-based (non-RDP) desktops           |
|                                                                                2024                                                                                 |[selkies-gstreamer](https://github.com/selkies-project/selkies-gstreamer?utm_source=taoofmac.com&utm_medium=web&utm_campaign=unsolicited_traffic&utm_content=external_link)|                                                                 A WebRTC desktop streaming platform                                                                 |                                                                                             |
|                                                                                2023                                                                                 |                   [rdesktop](http://www.rdesktop.org?utm_source=taoofmac.com&utm_medium=web&utm_campaign=unsolicited_traffic&utm_content=external_link)                   |                                                               The old classic open-source RDP client.                                                               |                                                                                             |
|            [rdpy](https://github.com/citronneur/rdpy?utm_source=taoofmac.com&utm_medium=web&utm_campaign=unsolicited_traffic&utm_content=external_link)             |                                                           A set of Python tools to access and test RDP servers.                                                           |                                                                                                                                                                     |                                                                                             |
|                                                                               Clients                                                                               |                                                                         [CoRD](/space/apps/CoRD)                                                                          |                                                              My favorite Mac client around 2009 or so.                                                              |                                                                                             |
|         [IronRDP](https://github.com/Devolutions/IronRDP?utm_source=taoofmac.com&utm_medium=web&utm_campaign=unsolicited_traffic&utm_content=external_link)         |                                                                 A Rust-based RDP client with RFX support                                                                  |                                                                                                                                                                     |                                                                                             |
|         [Rustdesk](https://github.com/rustdesk/rustdesk?utm_source=taoofmac.com&utm_medium=web&utm_campaign=unsolicited_traffic&utm_content=external_link)          |                                                                       A new cross-platform client.                                                                        |                                                                                                                                                                     |                                                                                             |
|    [Thincast Client](https://thincast.com/en/products/client?utm_source=taoofmac.com&utm_medium=web&utm_campaign=unsolicited_traffic&utm_content=external_link)     |                                                   A cross-platform RDP client that supports GPU acceleration and ARM64.                                                   |                                                                                                                                                                     |                                                                                             |
|                                                                              Gateways                                                                               |                                                                                   2026                                                                                    |[lamco-rdp-server](https://github.com/lamco-admin/lamco-rdp-server?utm_source=taoofmac.com&utm_medium=web&utm_campaign=unsolicited_traffic&utm_content=external_link)|Wayland-native RDP server for Linux desktop sharing with hardware encoding and clipboard sync|
|                                                                                2025                                                                                 |             [rdpgw](https://github.com/bolkedebruin/rdpgw?utm_source=taoofmac.com&utm_medium=web&utm_campaign=unsolicited_traffic&utm_content=external_link)              |                                                      an implementation of the Remote Desktop Gateway protocol.                                                      |                                                                                             |
|         [myrtille](https://github.com/cedrozor/myrtille?utm_source=taoofmac.com&utm_medium=web&utm_campaign=unsolicited_traffic&utm_content=external_link)          |                                                         A Windows-based simple and fast web Remote Desktop client                                                         |                                                                                                                                                                     |                                                                                             |
|        [rdp-html5](https://github.com/kulaginds/rdp-html5?utm_source=taoofmac.com&utm_medium=web&utm_campaign=unsolicited_traffic&utm_content=external_link)        |                                                                         A simple HTML5 RDP client                                                                         |                                                                                                                                                                     |                                                                                             |
|           [guacozy](https://github.com/paidem/guacozy?utm_source=taoofmac.com&utm_medium=web&utm_campaign=unsolicited_traffic&utm_content=external_link)            |                                              a HTML5 browser based VNC/RDP/SSH remote connection manager based on Guacamole                                               |                                                                                                                                                                     |                                                                                             |
|                [guac](https://github.com/wwt/guac?utm_source=taoofmac.com&utm_medium=web&utm_campaign=unsolicited_traffic&utm_content=external_link)                |                                                                   Apache Guacamole client ported to Go                                                                    |                                                                                                                                                                     |                                                                                             |
|                                                                                2023                                                                                 |                    [Guacamole](http://guac-dev.org/?utm_source=taoofmac.com&utm_medium=web&utm_campaign=unsolicited_traffic&utm_content=external_link)                    |                                                  A Java-based gateway providing HTML5 access to RDP, VNC, and SSH.                                                  |                                                                                             |
|[FreeRDP WebConnect](https://github.com/FreeRDP/FreeRDP-WebConnect?utm_source=taoofmac.com&utm_medium=web&utm_campaign=unsolicited_traffic&utm_content=external_link)|                                                         A C++ gateway providing HTML5 access for FreeRDP servers.                                                         |                                                                                                                                                                     |                                                                                             |
|                                                                                Mods                                                                                 |                 [Duo](https://github.com/DuoStream/Duo?utm_source=taoofmac.com&utm_medium=web&utm_campaign=unsolicited_traffic&utm_content=external_link)                 |                                           A multi-seat solution that uses RdpWrap and Moonlight to enable remote gaming.                                            |                                                                                             |
|          [rdpwrap](https://github.com/stascorp/rdpwrap?utm_source=taoofmac.com&utm_medium=web&utm_campaign=unsolicited_traffic&utm_content=external_link)           |                                                A library wrapper to enable multiple remote desktop connections on Windows.                                                |                                                                                                                                                                     |                                                                                             |
|                                                                                Ports                                                                                |                    [FreeRDP](http://www.freerdp.com?utm_source=taoofmac.com&utm_medium=web&utm_campaign=unsolicited_traffic&utm_content=external_link)                    |                                           A well-maintained open-source RDP implementation, including a DirectFB client.                                            |                                                                                             |
|                                                                                Tools                                                                                |                                                                                   2025                                                                                    |         [BetterRDP](https://github.com/Upinel/BetterRDP?utm_source=taoofmac.com&utm_medium=web&utm_campaign=unsolicited_traffic&utm_content=external_link)          |           a Windows Registry file that optimizes RDP server settings in Windows.            |
|                                                                                2023                                                                                 |        [RemoteApp Tool](http://www.kimknight.net/remoteapptool?utm_source=taoofmac.com&utm_medium=web&utm_campaign=unsolicited_traffic&utm_content=external_link)         |                                                         Manages application access for RemoteApp sessions.                                                          |                                                                                             |
| [X11RDP-o-Matic](https://github.com/scarygliders/X11RDP-o-Matic?utm_source=taoofmac.com&utm_medium=web&utm_campaign=unsolicited_traffic&utm_content=external_link)  |                                                      An automated installer to set up a native X11-based RDP server.                                                      |                                                                                                                                                                     |                                                                                             |