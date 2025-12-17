+++
title = "Should I multi-task?"
description = "LLMs take time to generate code. I’ve set things up so I can switch to another task while I wait. But, surprisingly, I’ve found this is usually the wrong idea.First, if I switch, the context I had on the first task drains away. When I return, I’ll need to load that context back.S"
date = "2025-11-01T07:00:00Z"
url = "https://maryrosecook.com/blog/post/should-i-multi-task"
author = ""
text = ""
lastupdated = "2025-12-10T15:24:06.087778005Z"
seen = false
+++

LLMs take time to generate code. I’ve set things up so I can switch to another task while I wait. But, surprisingly, I’ve found this is usually the wrong idea.

First, if I switch, the context I had on the first task drains away. When I return, I’ll need to load that context back.

Second, if the first task has a high cognitive load, I won’t be able to think coherently about anything else.

Third, if the first task is my main task, I’m mostly doing other things besides generation. Drawing diagrams, thinking, reading code, composing prompts. So switching would parallelize just a fraction of my time.

However, there are some cases where parallel generation is worthwhile.

First, a generation that will take a long time. For example, implementing a spec.md I’ve created. Or a task where I have an end-to-end process where the agent can self-verify to a correct solution. Or my colleague, Simon, pasting in a to-do list of items and then going to lunch.

Second, a generation for the same task I’m already working on. For example, sending an agent off to research a question about the code base.

Third, fire and forget ideas with a low cost of failure. For example, giving an agent a link to a bug report it might be able to fix autonomously. Or sending the agent off to try implementing an idea I had for a new tool.

Parallelizing these things works well, and is manageable. But the hectic mode of keeping several plates spinning isn’t worth it.