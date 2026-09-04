---
title = "The cinch"
description = "When generating code with an LLM, sometimes a task is so laborious to specify that you may as well do it manually. But, sometimes, you can find just the right information to cinch together to enable the model to do the work.Here’s an example. At Notion, I had built some UI for a "
date = "2025-10-14T07:00:00Z"
url = "https://maryrosecook.com/blog/post/the-cinch"
author = ""
text = ""
lastupdated = "2025-10-22T08:59:04.579728876Z"
seen = true
---

When generating code with an LLM, sometimes a task is so laborious to specify that you may as well do it manually. But, sometimes, you can find just the right information to cinch together to enable the model to do the work.

Here’s an example. At Notion, I had built some UI for a new feature. Ken, my designer colleague, reviewed the working software and updated his Figma mocks with some refinements he wanted. I needed to implement those refinements.

The Figma mocks provided all the necessary information about how the UI should look and work. And the existing code represented the current state. But I couldn’t just point the LLM at the mocks and tell it to implement the differences. The comparison between code and mocks was too noisy. The mocks included things we were planning for the farther future, things that were out of date, things that another engineer was implementing. But, it wasn’t worth the effort of directing the LLM to do each change, one by one.

Which brings me to the cinch: I realized I could combine the mocks and the current UI code with just a little bit of extra context: a terse bullet point list of the revisions. The mocks provided the full context of each change, but the bullets directed the model’s attention to the relevant information. This cinch took me maybe fifteen minutes to compile, but saved hours of writing code.

Seeing how to draw together the crucial information to let an LLM understand what to do. The cinch.