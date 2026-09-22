+++
title = "AppleTalk"
description = "AppleTalk is Apple’s networking protocol suite for classic Macs, used for file sharing, network printing and service discovery. It ran over several network types, including LocalTalk serial networks and Ethernet via EtherTalk.[Protocols and Services](/space/protocols/ap"
date = "2026-09-13T09:12:00Z"
url = "https://taoofmac.com/space/protocols/appletalk?utm_content=atom"
author = "Rui Carmo"
text = ""
lastupdated = "2026-09-21T09:42:47.707073160Z"
seen = false
+++

AppleTalk is Apple’s networking protocol suite for classic Macs, used for file sharing, network printing and service discovery. It ran over several network types, including LocalTalk serial networks and Ethernet via EtherTalk.

[

Protocols and Services
----------

](/space/protocols/appletalk#protocols-and-services)

* LocalTalk is the original serial networking system, commonly connected through Macintosh printer ports.
* EtherTalk carries AppleTalk over Ethernet.
* AFP (Apple Filing Protocol) provides file sharing. Older implementations used AppleTalk; later versions also run over TCP/IP.
* AppleShare was Apple’s file-sharing software and server product family.
* PAP (Printer Access Protocol) provides AppleTalk printer communication, notably with LaserWriter printers.

[

Software and Resources
----------

](/space/protocols/appletalk#software-and-resources)

|  Category  | Date  |                                                                     Link                                                                      |                                                                                           Notes                                                                                           |
|------------|-------|-----------------------------------------------------------------------------------------------------------------------------------------------|-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
|File Sharing|2026-09|                   [Netatalk](https://netatalk.io/?utm_campaign=unsolicited_traffic&utm_medium=web&utm_source=taoofmac.com)                    |             AFP server for Unix-like systems. Check the release and configuration for classic Mac compatibility: AFP-over-TCP and AppleTalk support differ between versions.              |
|   Guides   |2026-09|[Pushing AppleTalk Across the Internet](https://biosrhythm.com/?p=2767&utm_campaign=unsolicited_traffic&utm_medium=web&utm_source=taoofmac.com)|                                   Connecting classic Macs through Apple Internet Router and IP tunnelling, including the GlobalTalk community network.                                    |
|   Stacks   |2026-09|         [TailTalk](https://github.com/FeralFirmware/TailTalk?utm_campaign=unsolicited_traffic&utm_medium=web&utm_source=taoofmac.com)         |Async Rust userspace AppleTalk stack for Linux, macOS and Windows, supporting EtherTalk and TashTalk LocalTalk, with AFP and printer-sharing services. Currently targets routerless setups.|

[

Related Notes
----------

](/space/protocols/appletalk#related-notes)

* [March 2024 notes](/space/notes/2024/03/10/1900#notes-for-march-4-10) – the Global AppleTalk Network.
* [May 2003 post](/space/blog/2003/05/17#dumb-moves-dumber-people) – running Netatalk under Cygwin.
* [Xcode and Expandrive/git Workaround](/space/blog/2011/03/11/1210#xcode-and-expandrive-git-workaround) – using Netatalk on a VM instead of Samba.

See also [SMB](/space/protocols/smb) and [Networking](/space/networking).