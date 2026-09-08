+++
title = "Recursion into madness"
description = "Raymond Chandler would have loved generative AI"
date = "2026-09-07T21:45:50Z"
url = "https://blog.coredump.cx/p/recursion-into-madness"
author = "lcamtuf"
text = ""
lastupdated = "2026-09-08T09:44:05.693938466Z"
seen = false
+++

I don’t write about generative AI much. Everyone else does; not much of consequence ever gets said. I think the technology is great where it helps us automate mundane tasks, cancerous where it undermines genuine human expression, and [darkly funny where the two worlds collide](https://blog.coredump.cx/p/ai-childrens-books-body-horror-edition).

As a security person, though, I want to know how the models fail. They’re human-shaped but inhuman; they beg to be anthropomorphized and then choke on a seahorse emoji. Recursive processes where AI endlessly feeds on its own output are of special interest. Pragmatically, they’re the core mechanic of agent loops. More abstractly, they’re a major theme in the predictions of AI skeptics (model collapse) and the acolytes of the coming AI god (rapid self-improvement).

And you better believe that recursion is fun! Here’s a quick video I put together by asking Nano Banana 2 to generate a faux movie poster and then asking it to repeatedly make a localized edit to the title. You want to view it full screen:

<iframe src="https://player.vimeo.com/video/1224459298?autoplay=0&amp;h=d71f30f629" frameborder="0" gesture="media" allow="autoplay; fullscreen" allowautoplay="true" allowfullscreen="true"></iframe>

This effect is the bane of AI-based image and video editing tools: you get a very limited number of tries before the accumulated errors unleash pure chaos.

Does the same happen for text or code? Well, yes and no. In image pipelines, there are many inherent sources of noise. For text, input and output encoding is lossless and the amount of injected per-token entropy is small, so you get deterministic results on simple, well-specified tasks. In other words, if you instruct a model to change a single word in a paragraph of text, it can almost always handle the task with no collateral damage.

This is different for open-ended rewrites. Most rewrite prompts don’t produce endlessly divergent sequences of outputs; instead, the system thrashes about a bit and then settles on a stable result — peak LLMese, if you will. Still, the result can be quite distant from what it started with.

To illustrate, let’s take the following passage from Raymond Chandler:

>
>
> *“This room was too big, the ceiling was too high, the doors were too tall, and the white carpet that went from wall to wall looked like a fresh fall of snow at Lake Arrowhead. There were full-length mirrors and crystal doodads all over the place. The ivory furniture had chromium on it, and the enormous ivory drapes lay tumbled on the white carpet a yard from the windows. The white made the ivory look dirty and the ivory made the white look bled out. The windows stared towards the darkening foothills. It was going to rain soon. There was pressure in the air already.*
>
>
>
> *I sat down on the edge of a deep soft chair and looked at Mrs. Regan. She was worth a stare. She was trouble. She was stretched out on a modernistic chaise-longue with her slippers off, so I stared at her legs in the sheerest silk stockings. They seemed to be arranged to stare at. They were visible to the knee and one of them well beyond. The knees were dimpled, not bony and sharp. The calves were beautiful, the ankles long and slim and with enough melodic line for a tone poem. She was tall and rangy and strong-looking. Her head was against an ivory satin cushion. Her hair was black and wiry and parted in the middle and she had the hot black eyes of the portrait in the hall. She had a good mouth and a good chin.”*
>
>

I think it’s good writing. It’s not high-brow, but it’s… visual. Visceral. It draws you in.

With this quote in hand, I asked Gemini to *“boldly rewrite”* the passage to *“improve tone, clarity, and flow”*. The model immediately fell back onto its worst habits: bizarre metaphors that sound sophisticated but are just obtuse. In the first iteration, the room became a 👾 “*vast, towering tomb of bleached opulence”,* the drapes 👾 *“pooled greedily on the carpet”,* and the air 👾 *“sat thick with the threat of rain”.*

With each iteration, I presented the model only with its previous output and the same rewrite prompt. After eight iterations, the metaphors have gotten truly weird: 👾 *“looming mirrors weaponized the brutal glare”,* Mrs. Regan’s legs became 👾 *“sculpted for ruin”*, and her mouth had 👾 *“an insatiable hunger for destruction”* — quite the look.

After twelve iterations, we’re in uncharted territory. The carpets are 👾 *“suffocating the room in sterile, unyielding wealth”*. The brewing storm threatens the narrator, 👾 *“waiting to shatter the floor-to-ceiling glass”*. As for Mrs. Regan, she’s now 👾 *“pure, unapologetic malice … effortlessly cruel”*. She’s one with the storm.

After iteration sixteen, 👾 *“opulence didn’t merely occupy the room; it annihilated it”*, 👾 *“a suffocating white carpet devoured the space, plunging it into a blinding, agonizing glare”.* Against that backdrop, Mrs. Regan’s legs 👾 *“cut through the air like stiletto blades”*, her obsidian eyes 👾 “*burning with the singular urge to destroy”.*

After about twenty iterations, the model steps away from the ledge and the output more or less stabilizes, cycling through several tepid metaphors for the decor (*“stripping”, “scrubbing”,* or *“eradicating”* traces of humanity), describing Mrs. Regan as *“pure venom”* or *“concentrated venom”*, and asserting she intends to *“dismantle”, “tear apart”, “ruin”,* or *“flay”* the narrator. Finally, we hit a stable point at iteration 31, with the following piece:

>
>
> 👾 *“The room turned its opulence into a weapon, stripping away every trace of human warmth. Blinding, clinical light scorched pristine silk, razor-honed chrome, and spotless carpet. Beyond the glass, a bruised storm raged; within, leaded crystal and mirrors shattered the glare into jagged shards.*
>
>
>
> *I froze before Mrs. Regan—venom wrapped in high fashion. Reclined on a low chaise, her sheer-sheathed legs cut through the space like obsidian blades. Merciless and suffocating, she was the living mirror of the monstrous portrait in the foyer. Every sharp angle of her jaw and every frozen glance delivered a single guarantee: she was about to ruin me.”*
>
>

Who knew that Raymond Chandler had such a knack for horror. Until next time, friends.

[Subscribe now](https://blog.coredump.cx/subscribe?)

*PS. For obvious reasons, this post will fail Pangram tests. That said, everything except the* 👾*-marked quotations is human writing.*

*PPS. Because I try not to write about LLMs and this is a violation of the blog’s policy, here’s a (very recent) woodworking tax:*

[

<img src="https://substackcdn.com/image/fetch/$s_!U9Ea!,w_1456,c_limit,f_auto,q_auto:good,fl_progressive:steep/https%3A%2F%2Fsubstack-post-media.s3.amazonaws.com%2Fpublic%2Fimages%2Ffcb8bd7f-e5bf-44b0-aa6b-3fffbcda0a29_2000x1334.jpeg" width="1456" height="971" data-attrs="{&quot;src&quot;:&quot;https://substack-post-media.s3.amazonaws.com/public/images/fcb8bd7f-e5bf-44b0-aa6b-3fffbcda0a29_2000x1334.jpeg&quot;,&quot;srcNoWatermark&quot;:null,&quot;fullscreen&quot;:null,&quot;imageSize&quot;:null,&quot;height&quot;:971,&quot;width&quot;:1456,&quot;resizeWidth&quot;:null,&quot;bytes&quot;:854651,&quot;alt&quot;:null,&quot;title&quot;:null,&quot;type&quot;:&quot;image/jpeg&quot;,&quot;href&quot;:null,&quot;belowTheFold&quot;:true,&quot;topImage&quot;:false,&quot;internalRedirect&quot;:&quot;https://blog.coredump.cx/i/214625894?img=https%3A%2F%2Fsubstack-post-media.s3.amazonaws.com%2Fpublic%2Fimages%2Ffcb8bd7f-e5bf-44b0-aa6b-3fffbcda0a29_2000x1334.jpeg&quot;,&quot;isProcessing&quot;:false,&quot;align&quot;:null,&quot;offset&quot;:false}" class="sizing-normal" alt="" srcset="https://substackcdn.com/image/fetch/$s_!U9Ea!,w_424,c_limit,f_auto,q_auto:good,fl_progressive:steep/https%3A%2F%2Fsubstack-post-media.s3.amazonaws.com%2Fpublic%2Fimages%2Ffcb8bd7f-e5bf-44b0-aa6b-3fffbcda0a29_2000x1334.jpeg 424w, https://substackcdn.com/image/fetch/$s_!U9Ea!,w_848,c_limit,f_auto,q_auto:good,fl_progressive:steep/https%3A%2F%2Fsubstack-post-media.s3.amazonaws.com%2Fpublic%2Fimages%2Ffcb8bd7f-e5bf-44b0-aa6b-3fffbcda0a29_2000x1334.jpeg 848w, https://substackcdn.com/image/fetch/$s_!U9Ea!,w_1272,c_limit,f_auto,q_auto:good,fl_progressive:steep/https%3A%2F%2Fsubstack-post-media.s3.amazonaws.com%2Fpublic%2Fimages%2Ffcb8bd7f-e5bf-44b0-aa6b-3fffbcda0a29_2000x1334.jpeg 1272w, https://substackcdn.com/image/fetch/$s_!U9Ea!,w_1456,c_limit,f_auto,q_auto:good,fl_progressive:steep/https%3A%2F%2Fsubstack-post-media.s3.amazonaws.com%2Fpublic%2Fimages%2Ffcb8bd7f-e5bf-44b0-aa6b-3fffbcda0a29_2000x1334.jpeg 1456w" sizes="100vw" loading="lazy">

](https://substackcdn.com/image/fetch/$s_!U9Ea!,f_auto,q_auto:good,fl_progressive:steep/https://substack-post-media.s3.amazonaws.com/public/images/fcb8bd7f-e5bf-44b0-aa6b-3fffbcda0a29_2000x1334.jpeg)*Black walnut + tung oil finish.*