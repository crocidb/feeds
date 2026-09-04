+++
title = "Notes for June 1–7"
description = "I decided to take a couple of days off and generally tune out, thanks to a few strategically placed bank holidays – which meant my usual mix of relaxing and dealing with a few chores.For starters, I replaced the battery on our A1466 MacBook Air, which just keeps on trucking – it’"
date = "2026-06-07T19:30:00Z"
url = "https://taoofmac.com/space/notes/2026/06/07/1930?utm_content=atom"
author = "Rui Carmo"
text = ""
lastupdated = "2026-06-08T12:50:10.474209450Z"
seen = false
+++

I decided to take a couple of days off and generally tune out, thanks to a few strategically placed bank holidays – which meant my usual mix of relaxing and dealing with a few chores.

For starters, I replaced the battery on our A1466 MacBook Air, which just keeps on trucking – it’s now on its third battery (I swapped the factory one some four, or was it five, years ago). For around EUR 80, keeping that rather nice keyboard/screen/trackpad combination in use was a no-brainer, and it too now runs a [Niri](https://github.com/YaLTeR/niri?utm_source=taoofmac.com&utm_medium=web&utm_campaign=unsolicited_traffic&utm_content=external_link) desktop, having been [converted to Fedora](/space/blog/2025/11/05/2200) a few months ago.

[

Putting Pi on the Desktop
----------

](/space/notes/2026/06/07/1930#putting-pi-on-the-desktop)

And since I quite like having an AI assistant that can actually do something useful on my desktop, I did a [quick hack](https://github.com/rcarmo/pi-noctalia-shell-plugin?utm_source=taoofmac.com&utm_medium=web&utm_campaign=unsolicited_traffic&utm_content=external_link) to wire [Pi](https://pi.dev?utm_source=taoofmac.com&utm_medium=web&utm_campaign=unsolicited_traffic&utm_content=external_link) into [Noctalia](https://gitlab.com/nicofee/noctalia-shell?utm_source=taoofmac.com&utm_medium=web&utm_campaign=unsolicited_traffic&utm_content=external_link):

<img src="https://taoofmac.com/media/notes/2026/06/07/1930/19W6y2setoojuM9T1DR0JvD4FQ8=/noctalia-pi.png" alt="The Pi assistant panel running inside the Noctalia desktop shell" style="max-width: 100%;width: 100%;height: auto;border-radius: 8px" width="720" height="940"> Pi running inside Noctalia -- here, mid-task on the shell plugin itself.

This took around 30 minutes to become useful, and gave me a couple of ideas for improvements to [`piclaw`](https://rcarmo.github.io/projects/piclaw/?utm_source=taoofmac.com&utm_medium=web&utm_campaign=unsolicited_traffic&utm_content=external_link)’s UX – I had forgotten how flexible QML is.

[

AI Can Be Entertaining Too
----------

](/space/notes/2026/06/07/1930#ai-can-be-entertaining-too)

I’ve been automating away a fairly large chunk of VM and container management – I have a dedicated agent that knows how to manage my Portainer stacks and version them in Gitea, for instance – but as it turns out, LLMs are also pretty good at a few other things, like setting up emulators under Steam (creating nice icons, fixing controller input mappings, tuning upscaling and shaders, and the rest of it).

But I hadn’t let an LLM loose on my [Calibre](https://calibre-ebook.com?utm_source=taoofmac.com&utm_medium=web&utm_campaign=unsolicited_traffic&utm_content=external_link) and music collections yet, and – with the right safeguards – it’s been *awesome* at tidying up metadata. I had dozens of ancient books with slightly broken Calibre metadata, so I’ve been putting together an [MCP](/space/blog/2026/04/29/2341) server that sits next to my library to fix them – mostly because I don’t want to give a model full filesystem access to my NAS, and this way I can snapshot the database whenever it tries anything more extensive. I may well make something more generic, given time.