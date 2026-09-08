+++
title = "AI programming: a layered model"
description = '<img width="150" height="150" src="https://lemire.me/blog/wp-content/uploads/2026/09/Gemini_Generated_Image_km32u4km32u4km32-150x150.jpg" class="webfeedsFeaturedVisual wp-post-image" alt="" style="display: block; margin-bottom: 5px; clear:both;max-width: 100%;" link_thumbnail="" '
date = "2026-09-05T14:02:12Z"
url = "https://lemire.me/blog/2026/09/05/ai-programming-a-layered-model/"
author = "Daniel Lemire"
text = ""
lastupdated = "2026-09-08T09:44:08.851585249Z"
seen = false
+++

<img width="150" height="150" src="https://lemire.me/blog/wp-content/uploads/2026/09/Gemini_Generated_Image_km32u4km32u4km32-150x150.jpg" class="webfeedsFeaturedVisual wp-post-image" alt="" style="display: block; margin-bottom: 5px; clear:both;max-width: 100%;" link_thumbnail="" decoding="async">

In the late 1960s and 1970s, people like David Parnas faced a problem. A decade earlier there were almost no programmers. Suddenly there were hordes of inexperienced ones. What could have been a golden era was turning into a mess: far more software, much of it falling apart.

It sent Edsger Dijkstra into a depression. Does this sound familiar?

AI-assisted coding is producing far more code. Whether the projects will work or crumble remains to be seen. There is a danger.

I’d like to propose the layered model.

Keep a small core that changes slowly and on purpose. For that part you actually read the code. You insist on tests. You can use AI assistance, but there is no vibe coding allowed.

Everything else can move fast. There will be bugs, but the AI fixes them quickly.

Dependencies should be one way: the outer layers depend on the core. The core cannot depend on the outer layers.