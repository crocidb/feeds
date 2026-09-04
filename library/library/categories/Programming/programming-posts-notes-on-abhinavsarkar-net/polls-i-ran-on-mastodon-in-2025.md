+++
title = "Polls I Ran on Mastodon in 2025"
description = "In 2025, I ran ten polls on Mastodon exploring various topics, mostly to outsource my research to the hivemind. Here are the poll results organized by topic, with commentary.Contents 1. General Programming   1. [JSON Pronunciation](json-pronunciati"
date = "2025-12-31T00:00:00Z"
url = "https://abhinavsarkar.net/notes/2025-mastodon-polls/"
author = "Abhinav Sarkar"
text = ""
lastupdated = "2026-07-21T09:17:41.445046413Z"
seen = false
+++

In 2025, I ran ten polls on Mastodon exploring various topics, mostly to outsource my research to the hivemind. Here are the poll results organized by topic, with commentary.

### Contents ###

1. [General Programming](#general-programming)
   1. [JSON Pronunciation](#json-pronunciation)

2. [Compilers](#compilers)
   1. [Compiler Backend Targets](#compiler-backend-targets)
   2. [Haskell Parsing Libraries](#haskell-parsing-libraries)
   3. [Compiler in Haskell with Lenses](#compiler-in-haskell-with-lenses)

3. [Blogging & Web](#blogging-web)
   1. [Blog Post Length Preferences](#blog-post-length-preferences)
   2. [Blog Post Print Support](#blog-post-print-support)
   3. [Résumés on Personal Website](#résumés-on-personal-website)
   4. [“Writing a C Compiler” Blog Series](#writing-a-c-compiler-blog-series)

4. [Self-hosting](#self-hosting)
   1. [Service Packaging Preferences](#service-packaging-preferences)
   2. [Hetzner Backup Strategy](#hetzner-backup-strategy)

General Programming[#](#general-programming)
----------

### JSON Pronunciation[#](#json-pronunciation) ###

How do you pronounce JSON? [January 15, 2025](https://fantastic.earth/@abnv/113833659378419242)

[![](data:image/svg+xml,%3Csvg%20xmlns='http://www.w3.org/2000/svg'%20viewBox='0%200%20700%20400'%3E%3C/svg%3E) \<img src="/images/plots/pandocplot3164786941848027006.svg" class="w-100pct mw-95pct"\>\</img\>](https://abhinavsarkar.net/images/plots/pandocplot3164786941848027006.svg)   
<details> <summary> See as table </summary>

|        Option         | Votes |
|-----------------------|-------|
|Jay-Son, O as in Otter |  66   |
|Jay-Son, O as in Utter |  27   |
|  Jay-Son, O as in Oh  |   5   |
|something else, comment|   5   |
|      Jay-Ess-On       |   1   |
|       **Total**       |**104**|

</details>

I’m in the “Jay-Son, O as in Otter” camp, which is the majority response. It seems like most Americans prefer the “Jay-Son, O as in Utter” option. Thankfully, only one person in the whole world says “Jay-Ess-On”.

Compilers[#](#compilers)
----------

### Compiler Backend Targets[#](#compiler-backend-targets) ###

If someone were to write a new compiler book today, what would you prefer the backend to emit? [October 31, 2025](https://fantastic.earth/@abnv/115466785165400484)

[![](data:image/svg+xml,%3Csvg%20xmlns='http://www.w3.org/2000/svg'%20viewBox='0%200%20700%20400'%3E%3C/svg%3E) \<img src="/images/plots/pandocplot5449835710266572255.svg" class="w-100pct mw-95pct"\>\</img\>](https://abhinavsarkar.net/images/plots/pandocplot5449835710266572255.svg)   
<details> <summary> See as table </summary>

|   Option   | Votes |
|------------|-------|
|    LLVM    |  42   |
|    WASM    |  22   |
|Arm assembly|  14   |
|     C      |  12   |
|X86 assembly|   6   |
|    Lua     |   5   |
| JavaScript |   4   |
|JVM bytecode|   3   |
|    QBE     |   2   |
|    CIL     |   2   |
| **Total**  |**112**|

</details>

[LLVM](https://web.archive.org/web/20251231/https://llvm.org/) wins this poll hands down. It is interesting to see [WASM](https://webassembly.org/) beating other targets.

### Haskell Parsing Libraries[#](#haskell-parsing-libraries) ###

Which is your favourite Haskell parsing library? [November 3, 2025](https://fantastic.earth/@abnv/115485923285298769)

[![](data:image/svg+xml,%3Csvg%20xmlns='http://www.w3.org/2000/svg'%20viewBox='0%200%20700%20400'%3E%3C/svg%3E) \<img src="/images/plots/pandocplot12713424775692310149.svg" class="w-100pct mw-95pct"\>\</img\>](https://abhinavsarkar.net/images/plots/pandocplot12713424775692310149.svg)   
<details> <summary> See as table </summary>

|   Option   |Votes |
|------------|------|
| Attoparsec |  7   |
| Megaparsec |  7   |
|   Parsec   |  5   |
|   ReadP    |  3   |
|Alex + Happy|  1   |
| Flatparse  |  1   |
|  Streamly  |  1   |
| Polyparse  |  1   |
|   Earley   |  0   |
|  Parsley   |  0   |
| **Total**  |**26**|

</details>

I didn’t expect [Attoparsec](https://hackage.haskell.org/package/attoparsec) to go toe-to-toe with [Megaparsec](https://hackage.haskell.org/package/megaparsec). I did some digging, and it seems like Megaparsec is the clear winner when it comes to parsing programming languages in Haskell. However, for parsing file formats and network protocols, Attoparsec is the most popular one. I think that’s wise, and I’m inclined to make the same choice.

### Compiler in Haskell with Lenses[#](#compiler-in-haskell-with-lenses) ###

If you were to write a compiler in Haskell, would you use a lens library to transform the data structures? [July 11, 2025](https://fantastic.earth/@abnv/114833912109975907)

[![](data:image/svg+xml,%3Csvg%20xmlns='http://www.w3.org/2000/svg'%20viewBox='0%200%20700%20400'%3E%3C/svg%3E) \<img src="/images/plots/pandocplot2723371269594031164.svg" class="w-100pct mw-95pct"\>\</img\>](https://abhinavsarkar.net/images/plots/pandocplot2723371269594031164.svg)   
<details> <summary> See as table </summary>

| Option  |Votes |
|---------|------|
|  maybe  |  10  |
|   no    |  8   |
|   yes   |  5   |
| comment |  0   |
|**Total**|**23**|

</details>

This one has mixed results. Personally, I’d like to use a minimal lens library if I’m writing a compiler in Haskell.

Blogging & Web[#](#blogging-web)
----------

### Blog Post Length Preferences[#](#blog-post-length-preferences) ###

What do you think is the right length of programming related blog posts (containing code) in terms of reading time? [May 18, 2025](https://fantastic.earth/@abnv/114527640393756385)

[![](data:image/svg+xml,%3Csvg%20xmlns='http://www.w3.org/2000/svg'%20viewBox='0%200%20700%20400'%3E%3C/svg%3E) \<img src="/images/plots/pandocplot9683151945008465882.svg" class="w-100pct mw-95pct"\>\</img\>](https://abhinavsarkar.net/images/plots/pandocplot9683151945008465882.svg)   
<details> <summary> See as table </summary>

|   Option    |Votes |
|-------------|------|
|\~ 5 minutes |  15  |
|\~ 10 minutes|  37  |
|\~ 20 minutes|  28  |
|\~ 30 minutes|  5   |
|\~ 45 minutes|  0   |
|  \~ 1 hour  |  3   |
|  **Total**  |**88**|

</details>

As a writer of programming related blog posts, this poll was very informative for me. 10 minute long posts seem to be the most popular option, but my own posts are a bit longer, usually between 15–20 minutes.

### Blog Post Print Support[#](#blog-post-print-support) ###

Do you print blog posts or save them as PDFs for offline reading? [March 8, 2025](https://fantastic.earth/@abnv/114125219928606867)

[![](data:image/svg+xml,%3Csvg%20xmlns='http://www.w3.org/2000/svg'%20viewBox='0%200%20700%20400'%3E%3C/svg%3E) \<img src="/images/plots/pandocplot2068475801659465854.svg" class="w-100pct mw-95pct"\>\</img\>](https://abhinavsarkar.net/images/plots/pandocplot2068475801659465854.svg)   
<details> <summary> See as table </summary>

|        Option         |Votes |
|-----------------------|------|
|         Never         |  38  |
|       Sometimes       |  12  |
|Other, comment in reply|  3   |
|         Often         |  1   |
|       **Total**       |**54**|

</details>

Most people do not seem to care about saving or printing blog posts. But I went ahead and added (decent) printing support for my blog posts anyway.

### Résumés on Personal Website[#](#résumés-on-personal-website) ###

If you have a personal website and you do not work in academia, do you have your résumé or CV on your website? [August 30, 2025](https://fantastic.earth/@abnv/115116650535989980)

[![](data:image/svg+xml,%3Csvg%20xmlns='http://www.w3.org/2000/svg'%20viewBox='0%200%20700%20400'%3E%3C/svg%3E) \<img src="/images/plots/pandocplot13139194146379020766.svg" class="w-100pct mw-95pct"\>\</img\>](https://abhinavsarkar.net/images/plots/pandocplot13139194146379020766.svg)   
<details> <summary> See as table </summary>

|         Option         |Votes |
|------------------------|------|
|           No           |  25  |
|Yes, with a public link |  6   |
|Yes, with a private link|  1   |
|       **Total**        |**32**|

</details>

I don’t have a public résumé on my website either. I’d like to, but I don’t think anyone visiting my website would read it.

### “Writing a C Compiler” Blog Series[#](#writing-a-c-compiler-blog-series) ###

Would people be interested in a series of blog posts where I implement the C compiler from “Writing a C Compiler” book by Nora Sandler in Haskell? [November 11, 2025](https://fantastic.earth/@abnv/115530941197451127)

[![](data:image/svg+xml,%3Csvg%20xmlns='http://www.w3.org/2000/svg'%20viewBox='0%200%20700%20400'%3E%3C/svg%3E) \<img src="/images/plots/pandocplot10114955776563792520.svg" class="w-100pct mw-95pct"\>\</img\>](https://abhinavsarkar.net/images/plots/pandocplot10114955776563792520.svg)   
<details> <summary> See as table </summary>

|          Option           |Votes |
|---------------------------|------|
|            Yes            |  21  |
|            No             |  3   |
|I hate book implementations|  1   |
|         **Total**         |**25**|

</details>

Well, 84% people voted “Yes”, so this is (most certainly) happening in 2026!

Self-hosting[#](#self-hosting)
----------

### Service Packaging Preferences[#](#service-packaging-preferences) ###

If I were to release a service to run on servers, how would you prefer I package it? [December 30, 2025](https://fantastic.earth/@abnv/115808894154205916)

[![](data:image/svg+xml,%3Csvg%20xmlns='http://www.w3.org/2000/svg'%20viewBox='0%200%20700%20400'%3E%3C/svg%3E) \<img src="/images/plots/pandocplot8362179729081146183.svg" class="w-100pct mw-95pct"\>\</img\>](https://abhinavsarkar.net/images/plots/pandocplot8362179729081146183.svg)   
<details> <summary> See as table </summary>

|           Option            | Votes |
|-----------------------------|-------|
|        Docker image         |  35   |
| Source + build instructions |  30   |
|Statically linked executable |  22   |
|    Nix package + module     |   8   |
|Dynamically linked executable|   6   |
|       Something else?       |   4   |
|          **Total**          |**105**|

</details>

Well, people surely love their Docker images. Surprisingly, many are okay with just source code and build instructions. Statically linked executable are more popular now, probably because of the ease of deployment. Many also commented that they’d prefer OS specify package like deb or rpm. However, my personal preference is Nix package and NixOS module.

### Hetzner Backup Strategy[#](#hetzner-backup-strategy) ###

If you run services on Hetzner, do you keep a backup of your data entirely off Hetzner? [August 9, 2025](https://fantastic.earth/@abnv/114997801730976239)

[![](data:image/svg+xml,%3Csvg%20xmlns='http://www.w3.org/2000/svg'%20viewBox='0%200%20700%20400'%3E%3C/svg%3E) \<img src="/images/plots/pandocplot3612553550619110191.svg" class="w-100pct mw-95pct"\>\</img\>](https://abhinavsarkar.net/images/plots/pandocplot3612553550619110191.svg)   
<details> <summary> See as table </summary>

|               Option               |Votes |
|------------------------------------|------|
|I have a backup entirely off Hetzner|  19  |
|     I have a backup on Hetzner     |  8   |
|         I have no backups          |  5   |
|             **Total**              |**32**|

</details>

It is definitely wise to have an offsite backup. I’m still figuring out the backup strategy for my VPS.

---

That’s all for this year. Let’s see what polls I come up with in 2026.

 If you have any questions or comments, please leave a comment below. If you liked this post, please share it. Thanks for reading!

---

Thanks for reading this post via feed. Feeds are great, and you're great for using them. ♥

This post was originally published on [abhinavsarkar.net](https://abhinavsarkar.net/notes/2025-mastodon-polls/?mtm_campaign=feed).

### Like, repost, or comment on: ###

* [Fediverse](https://fantastic.earth/@abnv/115814651964798526)
* [My website](https://abhinavsarkar.net/notes/2025-mastodon-polls/?mtm_campaign=feed#comment-container)

Read more of my [posts](https://abhinavsarkar.net/posts/) and [notes](https://abhinavsarkar.net/notes/).

![](https://anna.abhinavsarkar.net/matomo.php?idsite=1&rec=1)