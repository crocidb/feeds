+++
title = "Swift 6.4 Released"
description = '<img class="quicklook" src="/space/links/2026/09/15/1843/large.jpg?v=25db036f5d2f" alt="quicklook" width="320" height="213"Given how much time I’ve been spen'
date = "2026-09-15T18:43:00Z"
url = "https://taoofmac.com/space/links/2026/09/15/1843?utm_content=atom"
author = "Rui Carmo"
text = ""
lastupdated = "2026-09-21T09:42:47.683294770Z"
seen = false
+++

[<img class="quicklook" src="/space/links/2026/09/15/1843/large.jpg?v=25db036f5d2f" alt="quicklook" width="320" height="213">](https://www.swift.org/blog/swift-6.4-released/?utm_campaign=unsolicited_traffic&utm_medium=web&utm_source=taoofmac.com)

Given how much time I’ve been spending on small native apps and my [`swift-app-template`](https://github.com/rcarmo/swift-app-template?utm_campaign=unsolicited_traffic&utm_medium=web&utm_source=taoofmac.com), Swift Build becoming the default in SwiftPM is probably the bit of this release I will adopt soonest. Having the same build system on macOS, Linux and Windows is welcome, as is Subprocess finally reaching 1.0–I still have plenty of uses for Swift outside SwiftUI. Being able to `await` inside `defer` and shield cleanup from task cancellation also sounds useful for the sort of audio and background work I’ve been doing in [`swift-smart-prompter`](https://github.com/rcarmo/swift-smart-prompter?utm_campaign=unsolicited_traffic&utm_medium=web&utm_source=taoofmac.com), but to be honest that’s the kind of thing that I would prefer to do in other languages without weird idioms.

The WebAssembly and Embedded Swift improvements are tempting, though. The WASM SDK is now available directly from Swift.org, JavaScriptKit’s safe bridging is apparently up to 40 times faster than the older dynamic approach, and microcontrollers get more flexible types and error handling. None of this fixes [my complaints about SwiftUI](/space/links/2026/08/03/0810#swiftui-s-deeper-problem), but I would quite like to use more Swift without having to drag Apple’s frameworks along with it…