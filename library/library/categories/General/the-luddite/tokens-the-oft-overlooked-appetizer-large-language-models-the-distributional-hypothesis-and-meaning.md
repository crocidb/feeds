---
title = "Tokens, the oft-overlooked appetizer: Large language models, the distributional hypothesis, and meaning"
description = " It takes many people to make The Luddite happen. Many of these people also do cool things outside The Luddite. With all the AI hype, we are crossposting one of those things — a paper on tokenization in Large Language Models. Hopefully, this will be a nice counterbalance to a"
date = "2025-01-01T00:00:00Z"
url = "https://theluddite.org/post/tokenization.html"
author = ""
text = ""
lastupdated = "2025-10-22T08:57:31.373606164Z"
seen = true
---

 It takes many people to make *The Luddite* happen. Many of these people also do cool things outside *The Luddite*. With all the AI hype, we are crossposting one of those things — a paper on tokenization in Large Language Models. Hopefully, this will be a nice counterbalance to all the bad AI research that I've covered.

### Abstract ###

 Tokenization is a necessary component within the current architecture of many language models, including the transformer-based large language models (LLMs) of Generative AI, yet its impact on the model's cognition is often overlooked. We argue that LLMs demonstrate that the Distributional Hypothesis (DH) is sufficient for reasonably human-like language performance, and that the emergence of human-meaningful linguistic units among tokens motivates linguistically-informed interventions in existing, linguistically-agnostic tokenization techniques, particularly with respect to their roles as (1) semantic primitives and as (2) vehicles for conveying salient distributional patterns from human language to the model. We explore tokenizations from a BPE tokenizer; extant model vocabularies obtained from Hugging Face and tiktoken; and the information in exemplar token vectors as they move through the layers of a RoBERTa (large) model. Besides creating sub-optimal semantic building blocks and obscuring the model's access to the necessary distributional patterns, we describe how tokenization pretraining can be a backdoor for bias and other unwanted content, which current alignment practices may not remediate. Additionally, we relay evidence that the tokenization algorithm's objective function impacts the LLM's cognition, despite being meaningfully insulated from the main system intelligence.

### [ Full paper on arxiv ](https://arxiv.org/abs/2412.10924#) ###

---

 *Thanks for reading! If you liked it, consider [subscribing](https://theluddite.org/subscribe.html) or leaving a tip: [BuyMeACoffee.com](https://buymeacoffee.com/theluddite), [Stripe](https://buy.stripe.com/00g5le0GY2cEaooeUU), [all options](/support.html).*