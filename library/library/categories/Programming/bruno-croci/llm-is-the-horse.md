+++
title = "LLM is the Horse"
description = "Recently someone posted on Hacker News about the Claude Code source code that got leaked, and the first comment was pointing out how they have a [regex to detect a negative sentiment](https://github.com/chatgptprojects/claude-c"
date = "2026-03-31T00:00:00Z"
url = "https://crocidb.com/post/llm-is-the-horse/"
author = "Bruno Croci"
text = ""
lastupdated = "2026-03-31T22:16:02.648442713Z"
seen = true
+++

Recently someone posted on [Hacker News](https://news.ycombinator.com/item?id=47584540) about the **Claude Code** source code that got leaked, and the first comment was pointing out how they have a [regex to detect a negative sentiment](https://github.com/chatgptprojects/claude-code/blob/642c7f944bbe5f7e57c05d756ab7fa7c9c5035cc/src/utils/userPromptKeywords.ts#L8) in the code. Then one comment got me thinking:

![Claude Code uses regex to analyze the sentiment of the user prompt](images/Pastedimage20260331143833.png)

Claude Code uses regex to analyze the sentiment of the user prompt

More specifically that last one, reproducing here:

>
>
> An LLM company using *regexes* for sentiment analysis? That’s like a truck company using horses to transport parts. Weird choice.
>
>

I think the analogy couldn’t be more wrong. In fact, it makes more sense inverted. **The LLM is the horse**, and the regex is the truck. In the sense that regex are more *efficient* in parsing text than an LLM is, but it requires a person driving it, like the truck. While the horse can do it by itself, it’s a more complicated system that is slower and more expensive (well, not in terms of money, but horses are animals that have needs and can’t work all the time).

That reminds me of a similar discussion I saw years ago when autonomous cars became a thing. So much research and engineering into a car to make it drive by itself and avoid obstacles, when the very previous *thing* we used for transportation already did all of this! Yes, the same horses!

Of course, in the case of autonomous cars, we’re talking about speed and conformation to the current transportation infrastructure we have in our cities. And in the LLM analogy, needless to say that it can perform sentiment analysis very well, but I guess everything has their own use case. Or as [Hacker News user draxil posted](https://news.ycombinator.com/item?id=47585709): *“Good to have more than a hammer in your toolbox!”*

What are your thoughts on it?