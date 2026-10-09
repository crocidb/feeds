+++
title = "Unofficial Command-Line Tool Removes Apple Intelligence From MacOS 27"
description = "Scharon Harding, Ars Technica:Unlike with previous versions of macOS, macOS 27 Golden Gate doesn’t have a toggle for turning off Apple Intelligence. That makes disabling AI features that "
date = "2026-10-06T18:17:43Z"
url = "https://arstechnica.com/apple/2026/10/command-line-tool-quickly-removes-apple-intelligence-from-macos-27/"
author = "John Gruber"
text = ""
lastupdated = "2026-10-07T14:53:31.466197451Z"
seen = false
+++

Scharon Harding, Ars Technica:

>
>
> Unlike with previous versions of macOS, [macOS 27 Golden Gate](https://arstechnica.com/gadgets/2026/09/macos-27-golden-gate-the-ars-technica-review/) doesn’t have a toggle for turning off Apple Intelligence. That makes disabling AI features that you may not want more difficult. It also means that the AI models necessary for running Apple Intelligence will take up space on your disk[,](https://support.apple.com/en-us/102149) [even if you don’t use them](https://support.apple.com/en-us/102149) or if you go through your settings to individually find and disable AI capabilities.
>
>
>
> In response, a developer known as [Om Lahore](https://github.com/omlahore) on GitHub last week created RemoveMacAI, a command-line tool that allows macOS 27 users to “turn off Apple Intelligence on macOS 27” in a way that is “fully reversible,” per [the GitHub page](https://github.com/omlahore/RemoveMacAI). They said that Apple’s Intelligence models take up “about 12GB,” but the models can actually take up over 30GB, [The Verge](https://www.theverge.com/ai-artificial-intelligence/1004672/mac-delete-apple-intelligence-ai-tool?) noted.
>
>
>
> RemoveMacAI “turns off Siri, Writing Tools, Genmoji, Image Playground, the ChatGPT extension, and all the summaries, then it deletes the models and stops macOS from downloading them again. Dictation still works because it’s a separate setting,” the developer said in a [Reddit post](https://www.reddit.com/r/MacOS/comments/1ww1exr/macos_27_dropped_the_apple_intelligence_off/) first spotted by [MacRumors](https://www.macrumors.com/2026/10/05/apple-intelligence-removal-tool-frees-mac-storage/).
>
>

Sounds crazy but it’s not `rm`ing files in the */System/* folder — it uses techniques that work with System Integrity Protection remaining enabled. I mean, I wouldn’t do it on a production machine, but, I don’t want to disable Apple Intelligence.

I can see the reasons why some people are frustrated that MacOS 27 Golden Gate doesn’t have built-in support for disabling this and removing the local models, though. If your Mac only has 256 or even 512 GB of storage, a dozen GB (or more) is meaningful. And there are institutional groups that have rules against AI — these places aren’t allowing Golden Gate at all until and unless Apple Intelligence can be removed. And that means not buying new Mac hardware that *only* runs Golden Gate.

[ ★ ](https://daringfireball.net/linked/2026/10/06/cli-tool-removes-apple-intelligence-from-macos-27)