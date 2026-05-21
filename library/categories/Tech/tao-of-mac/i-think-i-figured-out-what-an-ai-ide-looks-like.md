+++
title = "I Think I Figured Out What an AI IDE Looks Like"
description = "I’ve been mulling the UX arc I’ve been going through over the past couple of years, and I think it was mostly the same for everybody: Copy/paste into a chat web UI IDE with a chat sidebar (VS Code, Zed, etc.)* TUI chat (Mistral Vibe, [pi"
date = "2026-05-12T07:20:00Z"
url = "https://taoofmac.com/space/blog/2026/05/12/0720?utm_content=atom"
author = "Rui Carmo"
text = ""
lastupdated = "2026-05-20T09:23:14.791505589Z"
seen = false
+++

I’ve been mulling the UX arc I’ve been going through over the past couple of years, and I think it was mostly the same for everybody:

* Copy/paste into a chat web UI
* IDE with a chat sidebar ([VS Code](/space/apps/code), [Zed](/space/apps/zed), etc.)
* TUI chat (Mistral Vibe, [`pi`](https://pi.dev?utm_source=taoofmac.com&utm_medium=web&utm_campaign=unsolicited_traffic&utm_content=external_link), Codex CLI, Claude CLI, etc.)
* Rich chat in a native app (Codex desktop, Claude desktop)
* Web chat with rich interactive widgets ([`piclaw`](https://rcarmo.github.io/projects/piclaw/?utm_source=taoofmac.com&utm_medium=web&utm_campaign=unsolicited_traffic&utm_content=external_link))

Since I spend *a lot* of time on my iPad, [`piclaw`](https://rcarmo.github.io/projects/piclaw/?utm_source=taoofmac.com&utm_medium=web&utm_campaign=unsolicited_traffic&utm_content=external_link)’s web timeline has become my default–I can pop open the terminal or the editor at will, but coding is still a game of balancing drudgery with creativity, and the “creative” part works well in chat.

At least for me, using AI for my projects has been a matter of [speeding up the review cycle](/space/blog/2026/03/08/2130). If you open a new chat thread for every feature or fix, going back to the editor takes you away from the flow–it’s *much* easier to have the model spew the changes *in the chat*, highlight the bits you want changed, and iterate directly in it.

And I’ve just realised, after adding [iPad](/space/com/apple/ipad) text highlighting and annotation support to the [`piclaw`](https://rcarmo.github.io/projects/piclaw/?utm_source=taoofmac.com&utm_medium=web&utm_campaign=unsolicited_traffic&utm_content=external_link) timeline (to make it easier to point out specific things to the model), that what I’m building is a [Mathematica](/space/apps/mathematica) notebook for code.

I’m sure Stephen Wolfram would be delighted to be proven right, even if this paradigm isn’t really for everybody.

Of course, this scales poorly when refactoring and you have a zillion modified files, but other than refactors I am the kind of person who likes small, testable iterations and still looks at the code.

I also think that being able to scroll back up, fish out an older interaction and re-use it (or riff on it) is powerful, and what I am planning to do next is to inject an editor pane *into* the web chat to directly review and edit code inline–not as a separate tab, but as part of the conversation flow.

There’s something about this that irks my [`vim`](/space/cli/vim)-addicted brain, of course, but it’s tantalising, and I quite enjoy sitting on the couch with my iPad after a long day in front of my desktop–and yes, using handwriting recognition to prompt it works great; I love living in the future.