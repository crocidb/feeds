+++
title = "Xcode 27.2 Now Supports a New JSON Project File Format"
description = "Apple Developer:Xcode now supports a JSON-based project format (.xcproj) that’s more readable, merge-friendly, and easier for coding agents to edit. Enable it in the file inspector. Projects using .xcproj also open in earlier versions of Xcode 27.Apple released, on GitHub, "
date = "2026-09-22T19:25:52Z"
url = "https://developer.apple.com/documentation/xcode-release-notes/xcode-27_2-release-notes"
author = "John Gruber"
text = ""
lastupdated = "2026-09-23T18:24:54.712860496Z"
seen = false
+++

Apple Developer:

>
>
> Xcode now supports a JSON-based project format (.xcproj) that’s more readable, merge-friendly, and easier for coding agents to edit. Enable it in the file inspector. Projects using .xcproj also open in earlier versions of Xcode 27.
>
>

Apple released, on GitHub, [a Swift library (and CLI tool)](https://github.com/apple/xcode-project-format) for reading, writing, and manipulating this new project format. [Michael Tsai has a list of developer reactions](https://mjtsai.com/blog/2026/09/17/xcodes-new-xcproj-files-are-json/), where are universally positive. A sampling:

[Simon B. Støvring](https://mastodon.social/@simonbs/117282260955657402):

>
>
> Developers have been screaming for a friendlier Xcode project format for years. I’m one of them.
>
>

[Tony Arnold](https://mastodon.social/@tonyarnold/117283237592284302):

>
>
> I’ve been waiting for something like this for most of my career! 🎉
>
>

[Rob Napier](https://mastodon.social/@cocoaphony/117284198012341992):

>
>
> It does feel like another case of “we’ve quickly done a thing to help AI that we’ve been unwilling to do for years to help humans.” I’m seeing that happen across the industry.
>
>
>
> It is very welcome and appreciated, and lots of thanks to the teams involved. It’s also frustrating that it took “it can help AI” to make it happen.
>
>

The old .pbxproj project format was *not* XML; it was an old [NeXT-style “ASCII” property list](https://daringfireball.net/misc/2026/09/PropertyLists.pdf) — a file format that is surprisingly JSON-like considering that it predates not only JSON, but JavaScript (JSON = [JavaScript Object Notation](https://www.json.org/json-en.html)). The problem developers have long had with the old .pbxproj project file isn’t about the old plist format, but instead the way the object graph was represented in it. Everything was represented by opaque ID values; one small change in Xcode often resulted in multiple changes on different lines in the .pbxproj file. While technically that format is a human-readable (and thus LLM-readable) text file, it effectively needed to be treated as a binary file.

[ ★ ](https://daringfireball.net/linked/2026/09/22/xcode-json-project-files)