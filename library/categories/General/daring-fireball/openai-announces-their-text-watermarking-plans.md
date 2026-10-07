+++
title = "OpenAI Announces Their Text Watermarking Plans"
description = "OpenAI, today:The EU AI Act requires generative AI providers to make generated text identifiable in a machine-readable way. Text watermarking and detection remain early technologies with significant limitations, and views about their benefits and responsible uses are still de"
date = "2026-10-05T22:59:14Z"
url = "https://openai.com/index/eu-text-provenance/"
author = "John Gruber"
text = ""
lastupdated = "2026-10-06T13:46:49.073775304Z"
seen = false
+++

OpenAI, today:

>
>
> The EU AI Act requires generative AI providers to make generated text identifiable in a machine-readable way. Text watermarking and detection remain early technologies with significant limitations, and views about their benefits and responsible uses are still developing. Our phased approach reflects both the EU AI Act requirements as well as the technology’s limitations, with an emphasis on transparency about what a text watermark can and cannot tell people:
>
>
>
> * Starting today, API customers globally will be able to opt in to text watermarking for select models. Text watermarking will remain off by default in the API.
> * Over the coming weeks, we will add an invisible watermark to eligible ChatGPT and Codex text output in the European Union.
> * We’re opening applications to access our text watermark detector. Access will initially be limited to approved researchers and expert organizations that can help us evaluate and improve the technology.
>
>

First, unlike Anthropic, OpenAI is only forcing this upon users in the EU, where it’s mandated by their ill-considered 2024 regulation. Second, also unlike Anthropic, OpenAI has made this available via an API so developers should be able to actually see if this adulterates text output with real-world usage.

Third, none of these companies have yet made their watermark detectors publicly accessible. I remain highly skeptical that they will work as advertised in the real world. I think this is all somewhat of a sham to claim compliance with the EU AI Act without actually providing anything that anyone can actually use in a practical way.

>
>
> Our text watermarking technology, textGrain, adds an invisible statistical signal to the model’s word choices. Our detector looks for that signal to assess whether a passage contains an OpenAI watermark. More details about how textGrain works can be found in our [technical report](https://cdn.openai.com/pdf/e9508624-d767-41b6-a26d-e34ca798ada6/textgrain-entropy-calibrated-watermarking-for-language-model-text.pdf), which will be updated with additional details in the coming weeks. We also plan to make the technology available in open source so that others can build on it.
>
>
>
> In our evaluations, textGrain matched or exceeded the performance of other approaches we tested, including SynthID for text. Even so, strong performance under ideal conditions does not guarantee reliable detection in everyday use.
>
>

[SynthID-Text](https://www.nature.com/articles/s41586-024-08025-4) is the Google algorithm that Anthropic says they’re using too.

Maybe I’m all wet, but I think what they mean in that last sentence quoted above is that it only performs usefully in ideal conditions, with simplistic prompts, and will prove to be unusable in practical everyday use, especially if the user’s prompt contains instructions designed to circumvent it.

[ ★ ](https://daringfireball.net/linked/2026/10/05/openai-announces-their-text-watermarking-plans)