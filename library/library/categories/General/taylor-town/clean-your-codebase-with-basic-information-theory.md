+++
title = "Clean your codebase with basic information theory"
description = "Cut out everything that's not surprising."
date = "2024-02-16T00:00:00Z"
url = "https://taylor.town/compress-code"
author = "Taylor Troesh"
text = ""
lastupdated = "2026-04-20T13:20:40.326370799Z"
seen = true
+++

![](https://taylor.town/bug9o4g3fx531.jpg)

>
>
> Cut out everything that's not surprising.
>
>
>
> \-- [Derek Sivers](https://sive.rs/d22)
>
>

Surprise
----------

The following equation measures ["surprise"](https://en.wikipedia.org/wiki/Entropy_(information_theory)):

[![](https://wikimedia.org/api/rest_v1/media/math/render/svg/ff26f81edc1f4bb204793a52b2430c77f6633203) ](https://en.wikipedia.org/wiki/Entropy_(information_theory))

It's easy to estimate the surprise of text files:

```
const rx = /[\s,\]\[\(\)]+/g;
const counts = {};
for (const file of Deno.args)
  for (const x of (await Deno.readTextFile(file)).split(rx))
    counts[x] = 1 + counts[x] || 1;
const total = Object.values(counts).reduce((a, b) => a + b, 0);
let entropy = 0;
for (const c of Object.values(counts)) {
  const p = c / total;
  entropy -= p * Math.log2(p);
}
console.log(entropy);
```

 Note: this script calculates surprise at the level of *words*. You can do similar estimates at the character level, but it's not as useful for improving readability.

Running the script on a few random markdown files:

```
$ ./entropy src/enough.md
6.371408749206546

$ ./entropy src/two-toucans-canoe.md
6.452173798618295

$ ./entropy src/enough.md src/two-toucans-canoe.md
7.1796868604897295

$ ./entropy src/music.md
8.172144309119338

$ ./entropy src/pardoned.md
8.180170381663272
```

[/enough](https://taylor.town/enough), [/two-toucans-canoe](https://taylor.town/two-toucans-canoe), [/music](https://taylor.town/music), [/pardoned](https://taylor.town/pardoned)

If you look at the examples, you'll see that entropy generally increases with file size, excluding files with a lot of repetition, e.g. [my music ratings](https://taylor.town/music).

Compression
----------

To compress text at the word-level, substitute repeated phrases with shorter phrases, e.g. replace "for the purpose of" with "for". Note that replacing "gargantuan" with "big" may improve surprise at the character-level, but not necessarily at the word-level.

 This is a consequence of [Shannon's source coding theorem](https://en.wikipedia.org/wiki/Shannon's_source_coding_theorem). The theorem also provides calculable upper-bounds for text compression.

In theory, you could use something like [Huffman coding](https://en.wikipedia.org/wiki/Huffman_coding) to shrink the size of your code. [Minifiers](https://en.wikipedia.org/wiki/Minification_(programming)) use related strategies to produce unreadable-yet-valid gibberish.

 You can also [estimate upper-bounds for compressed programs](https://en.wikipedia.org/wiki/Kolmogorov_complexity#Compression). Implement something like `gzip` in a target language and extract the program with its decompressor to a new file. The number of bits in the [self-extracting archive](https://en.wikipedia.org/wiki/Self-extracting_archive) approximates the size of the smallest possible program.

In practice, compressing programs for humans means replacing larger snippets with smaller functions, variables, etc.

Here's an example from a real-world Elm file with 2.2k LOC:

```
$ ./entropy BigProject.elm
8.702704507769093

# `Css.hex "#ddd"` -> `ddd`
$ sed -i 's/Css.hex "#ddd"/"ddd"/g' BigProject.elm

# less repetition creates more surprise
$ ./entropy BigProject.elm
8.706398741147163
```

 How would this number change over the life of a project? I'd like a script to compare the total entropy of all files in a repo at each release and throw it in a chart. Please email me at [hello@taylor.town](mailto:hello@taylor.town) if you have any implementation suggestions.

To find compression candidates, look for frequent sequences of words, i.e. [code collocates](https://taylor.town/code-collocates).

Although it's possible to automate long-sequence identification, I prefer to list frequent words and then compress in conceptual chunks. This script calculates frequencies at the word-level, but also weights words based on their character length:

```
const rx = /[\s,\]\[\(\)]+/g;
const len = {};
for (const file of Deno.args)
  for (const x of (await Deno.readTextFile(file)).split(rx))
    len[x] = x.length + len[x] || x.length;
console.log(
  Object.entries(len)
    .filter(a => a[1] >= 10 && a[0].length > 2)
    .sort((a, b) => b[1] - a[1])
    .map(a => `${a[1]} ${a[0]}`)
    .join("\n")
);
```

Running the script on my Elm project:

```
$ ./freq-lengths BigProject.elm
1467 Attrs.css
1295 Css.rem
732 Css.fontSize
616 Html.div
594 Html.text
570 Css.backgroundColor
455 Css.hex
391 Maybe.withDefault
360 import
354 Css.px
336 Css.fontWeight
322 Css.lineHeight
304 Css.borderRadius
297 Css.color
297 Html.span
273 Css.marginTop
266 Nothing
252 String
231 Css.int
225 Css.solid
```

Based on these results, my first instinct is to pull out some of the CSS stuff into helper functions, especially for font-related styling. *C'est la vie.*

Readability
----------

[Code golf](https://codegolf.stackexchange.com) is entertaining, but my boss would be pissed to find a program like [“t,ȧṫÞċḅ»Ḳ“¡¥Ɓc’ṃs4K€Y](https://codegolf.stackexchange.com/a/117845) in our repo.

While [readability formulas exist for text](https://en.wikipedia.org/wiki/Readability#Popular_Readability_Formulas), "readable code" remains controversial.

In my experience, the key to maintaining readability is developing a healthy respect for locality:

1. coarsely structure codebases around CPU timelines and dataflow
2. don't pollute your namespace -- [use blocks](https://taylor.town/code-blocks) to restrict variables/functions to the smallest possible scope
3. group related concepts together

The hardest part of this process is deciding what "related concepts" mean. For example, should you group all CSS in one file, or should you group styles next to their HTML structures? Should you group all your database queries together, or inline them where they're used?

I don't have all the answers, but it's abundantly clear that we have a [thirty million line problem](https://www.youtube.com/watch?v=kZRE7HIO3vk) and that [complex ideas fit on t-shirts](https://youtu.be/ubaX1Smg6pY?si=OA3djEHTEywrW_oU&t=746). When I see [an entire compositor and graphics engine in 435 LOC](https://youtu.be/ubaX1Smg6pY?t=3183), I expect many surprises from [the future of coding](https://futureofcoding.org).