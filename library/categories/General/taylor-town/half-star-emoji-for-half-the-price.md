+++
title = "Half-Star Emoji (for Half the Price)"
description = "The emoji gods have not yet etched a half-star emoji into the emoji bible."
date = "2024-03-07T00:00:00Z"
url = "https://taylor.town/half-stars"
author = "Taylor Troesh"
text = ""
lastupdated = "2026-04-20T13:20:40.322306180Z"
seen = true
+++

The [emoji gods](https://www.unicode.org/consortium/utc.html) have not yet etched a half-star emoji into [the emoji bible](https://emojipedia.org).

 The gods decreed [a unicode half-star](https://symbl.cc/en/2BEA/) in 2018, but it's still awaiting widespread adoption.

And so folks [like Johnny Webber](https://johnnywebber.com/rating-system/) settle for ratings like "⭐⭐⭐1/2". It's uglier than [some popular icon fonts](https://fontawesome.com/icons/star-half?s=solid), but beautiful in its [solarpunk](https://en.wikipedia.org/wiki/Solarpunk) simplicity. Standard unicode is [cheap](https://potato.cheap). It improves accessibility, saves energy, prevents [link rot](https://en.wikipedia.org/wiki/Link_rot), etc. -- great work, Johnny!

```
# It even works in potato browsers!
w3m 'https://johnnywebber.com/rating-system'
```

Here are some more *cheap* symbologies with "half-stars":

```
●●●◐○
■■■◧□
▲▲▲◭△
▼▼▼⧨▽
◆◆◆⬖◇
♡ 4.5
💖4.5
⭐4.5
```

Half-moons can be half-stars, too.

[Thanks for the idea, Reddit!](https://www.reddit.com/r/Notion/comments/pcss42/finally_found_the_perfect_emojis_for_ratings/)

|     |
|-----|
|🌕🌕🌕🌑🌑|
|🌕🌕🌕🌘🌑|
|🌕🌕🌕🌗🌑|
|🌕🌕🌕🌖🌑|
|🌕🌕🌕🌕🌑|
|🌝🌝🌝🌜🌚|

You can use unicode ratings in JS:

```
const rate = n => {
  const xs = ["🌑","🌘","🌗","🌖","🌕"];
  return [
    ..."🌕".repeat(Math.floor(n)),
    xs[Math.round(xs.length*(n-Math.floor(n)))],
    ..."🌑".repeat(Math.floor(5-n)),
  ].join("");
}

rate(0.60) // "🌖🌑🌑🌑🌑"
rate(3.40) // "🌕🌕🌕🌗🌑"
rate(4.25) // "🌕🌕🌕🌕🌘"
```

CSS, too:

```
.star-0-0::before { content: "○○○○○"; }
.star-0-5::before { content: "◐○○○○"; }
.star-1-0::before { content: "●○○○○"; }
.star-1-5::before { content: "●◐○○○"; }
.star-2-0::before { content: "●●○○○"; }
.star-2-5::before { content: "●●◐○○"; }
.star-3-0::before { content: "●●●○○"; }
.star-3-5::before { content: "●●●◐○"; }
.star-4-0::before { content: "●●●●○"; }
.star-4-5::before { content: "●●●●◐"; }
.star-5-0::before { content: "●●●●●"; }
```

Anyway, back to playing [party babyz](https://taylor.town/babyz.jpeg) (⭐7.5).