+++
title = "rootshell"
description = '[<img class="quicklook" src="https://taoofmac.com/thumb/links/2026/05/03/1030/640,480/M_OB7A4ZB2bvrSOC8P3Z2uwJnqE=/large.jpg" width="320" height="240" style="max-width: 100% !important;height: auto !important;"](https://rootshell.com?utm_source=taoofmac.com&utm_medium=web&utm_ca'
date = "2026-05-03T10:30:00Z"
url = "https://taoofmac.com/space/links/2026/05/03/1030?utm_content=atom"
author = "Rui Carmo"
text = ""
lastupdated = "2026-05-05T08:25:09.937610385Z"
seen = true
+++

[<img class="quicklook" src="https://taoofmac.com/thumb/links/2026/05/03/1030/640,480/M_OB7A4ZB2bvrSOC8P3Z2uwJnqE=/large.jpg" width="320" height="240" style="max-width: 100% !important;height: auto !important;">](https://rootshell.com?utm_source=taoofmac.com&utm_medium=web&utm_campaign=unsolicited_traffic&utm_content=external_link)

This has pretty much replaced [Blink](https://blink.sh?utm_source=taoofmac.com&utm_medium=web&utm_campaign=unsolicited_traffic&utm_content=external_link) for me. [`rootshell`](https://rootshell.com?utm_source=taoofmac.com&utm_medium=web&utm_campaign=unsolicited_traffic&utm_content=external_link) is a Metal-accelerated terminal for iPhone, iPad, Vision Pro (ha!) and, surprisingly, the Mac, built on [Ghostty](/space/apps/ghostty)’s rendering engine.

It is buttery smooth, and has proper `mosh` support, which means my sessions survive Wi-Fi handoffs and network changes without dropping.

The [Ghostty](/space/apps/ghostty) bit matters because it means the rendering is fast, the font handling is good (it has Fira Code Nerd which has become by default), and the whole thing *feels* like a proper terminal rather than the usual iOS compromise. There’s also a built-in AI assistant that can execute shell commands locally, which sounds gimmicky but is surprisingly useful for one-off tasks when you can’t be bothered to type out a long `find` or `awk` invocation on a phone keyboard (I got it to work with a Gemini API key).

The one thing I’m missing is the ability to install my own commands like I do with [A-Shell](/space/apps/a-shell) lets you–local binaries, custom scripts, that sort of thing. A-Shell’s approach of bundling a minimal Unix userland inside the app sandbox is still unmatched for offline tinkering, but it’s nice to have alternatives.