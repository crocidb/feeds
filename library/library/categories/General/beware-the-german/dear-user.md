+++
title = "Dear user,"
description = """Dear user,Am I missing some meme? Why is it that when you ask ChatGPT or the models directly via API (gpt-5-chat-latest only, it seems), it addresses you as "Dear user"? It's really funny.It seems to work with the query "what are some softwares using """
date = "2025-09-14T00:00:00Z"
url = "https://igerman.cc/blog/dear-user/"
author = "german s."
text = ""
lastupdated = "2026-06-08T12:43:31.131502638Z"
seen = true
+++

Dear user,[#](#dear-user)
==========

Am I missing some meme? Why is it that when you ask ChatGPT or the models directly via API (`gpt-5-chat-latest` only, it seems), it addresses you as "Dear user"? It's really funny.

It seems to work with the query **"what are some softwares using imgui"**, or with close variations, but every time it responds like so:  
[![gpt-5-chat-latest (via LibreChat) addressing user as "Dear user"](https://igerman.cc/blog/dear-user/dear-user-1.png)](https://igerman.cc/blog/dear-user/dear-user-1.png) [![GPT-5 (probably chat-latest, via chatgpt.com) addressing user as "Dear user"](https://igerman.cc/blog/dear-user/dear-user-2.png)](https://igerman.cc/blog/dear-user/dear-user-2.png)  
 I've tested this around 20 times and every time it responded with "dear user", "dear friend" or similar, across various frontends and clients, including the official ChatGPT website and apps.

T3 Chat is quite funny as well:  
[![Gemini 2.5 Flash (via T3 Chat) addressing user as "Dear user"](https://igerman.cc/blog/dear-user/dear-user-3.png)](https://igerman.cc/blog/dear-user/dear-user-3.png)  
 The model selected here is `Gemini 2.5 Flash` and I am not logged in. Not only does it refuse, but it also addresses me as "Dear user".

`Gemini 2.5 Flash Lite` (also via T3 Chat) does not do that and neither do 2.0 Flash or its Lite version.

Curiously, I wasn't able to reproduce the Gemini behavior directly via Google's AI Studio on any models, reasoning or not, so maybe it's a quirk of T3 Chat, or their system prompts.  
 ...or it secretely uses the `gpt-5-chat-latest` model, who knows with these proprietary frontends hosted on "the cloud" (some dude's computer). 🤷

Sycophancy or just pattern prediction?[#](#sycophancy-or-just-pattern-prediction)
----------

A lot of these models are trained to be sycophantic, encouraging users to dedicate as much time and attention to them as possible. They often address people as "the user" in their reasoning process and telling people [they're "Absolutely right"](https://absolutelyright.lol) in responses. With no particular evidence other than "vibes" (\*shudders\*), perhaps this is a side effect of that training?

Because ImGui is actually called "Dear ImGui", maybe the model initially "wants" to write "Dear ImGui is a popular library...". However, with the slop chat training, the biggest probability is now to continue it as "Dear user, ...".

This doesn't happen with every model, I could not reproduce it with Claude, bigger Gemini models, or even regular `gpt-5`, so maybe it's OpenAI's fine-tuning for the ChatGPT product that causes this. Regardless, this is pretty funny. Imagine all users of a forum responding to any query about ImGui with "Dear user, \<actual answer here\>...", LOL.