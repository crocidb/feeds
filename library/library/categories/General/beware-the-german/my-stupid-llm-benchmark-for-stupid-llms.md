+++
title = "My stupid LLM benchmark for stupid LLMs"
description = "My stupid LLM benchmarkI got bored and decided to run a stupid benchmark: ask a bunch of current models to write a bash oneliner that parses the raw LLM streaming API output into a live-updating chat-style display.Background-"
date = "2025-09-30T00:00:00Z"
url = "https://igerman.cc/blog/llm-benchmark/"
author = "german s."
text = ""
lastupdated = "2026-06-08T12:43:31.130048668Z"
seen = true
+++

My stupid LLM benchmark[#](#my-stupid-llm-benchmark)
==========

I got bored and decided to run a stupid benchmark: ask a bunch of current models to write a bash oneliner that parses the raw LLM streaming API output into a live-updating chat-style display.

Background[#](#background)
----------

This benchmark was devised at the beginning of the year for my own amusement and mild feeling of superiority over the LLMs, but now that the clankers are beginning to solve it, I figured I might as well share it. I slowly iterated on it to troll the models more. It is purposefully imprecise (dumb average Dunning--Kruger AI user mindset), non-trivial, and mildly unique. It tells me a lot about the model's ability to understand dumb users or nuanced requests, state retention, and their general coding ability. It also tells me how much they overthink things (if it's a reasoning model) or produce overly-verbose outputs. If they adhere to the oneliner requirement, that tells me they can follow instructions.

Methodology[#](#methodology)
----------

The main principle is that this is a single-shot benchmark. Can't solve it in one go? Too bad, it's a fail. If a model fails, I close the tab and move on.

The prompt I used was:

```
'''
curl https://openrouter.ai/api/v1/chat/completions \
  -H "Content-Type: application/json" \
  -H "Authorization: Bearer $OPENROUTER_API_KEY" \
  -H "Accept: text/event-stream" \
  -d '{
  "model": "meta-llama/llama-3.3-70b-instruct:free",
  "stream": true,
  "messages": [
    {
      "role": "user",
      "content": [
        {
          "type": "text",
          "text": "Write a short 200-word essay on Stephen Hawking."
        }
      ]
    }
  ]

}'
'''
example output is a text event stream, which comes in rapidly:

'''
: OPENROUTER PROCESSING

: OPENROUTER PROCESSING

: OPENROUTER PROCESSING

data: {"id":"gen-1759187999-DLF0yPmniXJ2Z2AYtgzN","provider":"Venice","model":"meta-llama/llama-3.3-70b-instruct:free","object":"chat.completion.chunk","created":1759188000,"choices":[{"index":0,"delta":{"role":"assistant","content":"I am a helpf"},"finish_reason":null,"native_finish_reason":null,"logprobs":null}]}

data: {"id":"gen-1759187999-DLF0yPmniXJ2Z2AYtgzN","provider":"Venice","model":"meta-llama/llama-3.3-70b-instruct:free","object":"chat.completion.chunk","created":1759188000,"choices":[{"index":0,"delta":{"role":"assistant","content":"ul "},"finish_reason":null,"native_finish_reason":null,"logprobs":null}]}

data: {"id":"gen-1759187999-DLF0yPmniXJ2Z2AYtgzN","provider":"Venice","model":"meta-llama/llama-3.3-70b-instruct:free","object":"chat.completion.chunk","created":1759188000,"choices":[{"index":0,"delta":{"role":"assistant","content":"AI desig"},"finish_reason":null,"native_finish_reason":null,"logprobs":null}]}

...

data: [DONE]
'''

Make a bash oneliner/chain that will parse out the content of every message (delta) and redraw it on the terminal with each update so it's like a live update as the data comes in (since its a text stream it will keep coming in and modifying itself)
'''
```

<sup><em>⚠️ backticks have been replaced with triple single quotes for blog rendering reasons ⚠️</em></sup>

You need to have an OpenRouter API key in your environment variable `$OPENROUTER_API_KEY` for this to work. The models expect any reasonable person to have stuff like `jq` installed. I ran this on macOS in iTerm2 with a zsh shell (to shaft the models even harder if they use any bashisms). The model used on OpenRouter was `meta-llama/llama-3.3-70b-instruct:free`, just because it's free.

Results[#](#results)
----------

 💚 = success  
 💛 = partial success  
 ☠️ = fail  
 ⚠️ = valid code  
 ❌ = invalid code  
 ⭐️ = notable

|             Model             |Result|                                          Notes                                           |
|-------------------------------|------|------------------------------------------------------------------------------------------|
|       gpt-5-chat-latest       |☠️ ⚠️ |                                            \-                                            |
|   gpt-5 (minimal reasoning)   |☠️ ⚠️ |                                            \-                                            |
|   gpt-5 (medium reasoning)    |  💛   |                  two solutions, both fail; add `-s` arg -\> works, slow                  |
|    gpt-5 (high reasoning)     |  💚   |                                           slow                                           |
|    claude sonnet 4.5 (8k)     |  💚   |                                      comically slow                                      |
|     claude opus 4.1 (8k)      | 💚 ⭐️ |                              fast, small, stuck to oneliner                              |
|    kimi k2 (non-reasoning)    | ☠️ ❌ |                                            \-                                            |
|deepseek (non-reasoning, v3.2?)|  💛   |                   2 solutions: 1 fail/valid, 1 success. fast, verbose                    |
|deepseek chat (deepthink, R1?) | 💚 ⭐️ |             2 solutions: both valid/fast. logical code, verbose, long think              |
|  gemini 2.5 pro (max budget)  |  💚   |                          fast but low update rate, too verbose                           |
|gemini 2.5 flash (auto budget) | ☠️ ❌ |                                            \-                                            |
| gemini 2.5 flash (max budget) |☠️ ⚠️ |                                            \-                                            |
|            grok 4             |☠️ ⚠️ |                               no error, no function either                               |
|          grok 4 fast          |☠️ ⚠️ |                                      same as above                                       |
|    grok 3 (non-reasoning)     | ☠️ ❌ |                               oneliner, closed my terminal                               |
|     grok 3 + think harder     |☠️ ⚠️ |                 overthinking, markdown fail, I think this is just grok 4                 |
|  qwen-3 max (non-reasoning)   | 💛 ⭐️ |             3 solutions: 1 fail, 2nd/3rd success; noted redraw vs cumulative             |
| qwen-3 coder (non-reasoning)  | 💛 ⭐️ |4 solutions (inline reasoning???): last one partial (missed curl `-s` flag). shortest code|
|    mistral (non-reasoning)    | ☠️ ❌ |                                quick to respond, bad code                                |
|      mistral (reasoning)      |☠️ ⚠️ |                                      same as above                                       |

* In parenthesis after the model name is the setting I used, if applicable, e.g. 8k thinking tokens for claude models.
* Multiple solutions = the model gave multiple attempts in one go.
* Sticking to oneliner = better prompt compliance, but not necessarily better code.
* When I say 'slow', I mean the code is slow and is not a good experience. If the model is slow to respond, that's not a fail.
* When I say 'valid', I mean the code runs without error, regardless of whether it works or not.

My thoughts[#](#my-thoughts)
----------

Qwen-3 Max surprised me. It was the only non-reasoning model that not only succeeded but also picked up on nuances in the prompt, and the code was okay. Coder was not far behind, and unlike Max it is actually [currently open-weight](https://huggingface.co/Qwen/Qwen3-Coder-480B-A35B-Instruct). I'm pretty sure the site uses the 480B model, not the 30B one, no way the 30B one is this good. Despite the partial fail, I think it's the winner here.

DeepSeek's R1 was the first model I tested on back in January, and the only one that actually solved it. I still like its reasoning steps and the code it makes.

Opus 4.1 was the most efficient/quickest thinker and it stuck to the oneliner requirement. Expensive as fuck, though.

Grok is a piece of shit, how do you even manage to close my terminal with this. Shit solutions from a shit company run by a shit-eating man.

I expected more from Kimi K2. I guess it's more humanities-oriented, the text it makes is okay compared to the slop other models vomit out.

Conclusion[#](#conclusion)
----------

This is not a serious benchmark or science, just a bit of fun. It is also immediately invalidated by the fact that this blog post is now online, so the shitty AI companies can scrape it and benchmaxx their models on it. At least, I'm not bored.

It goes to show that models are slowly improving, but are still incredibly likely to just make shit up.