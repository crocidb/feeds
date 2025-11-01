---
title = "A 255 byte web page"
description = "Tantek, in celebration of 8-Bit Day (the 265th day of the year), published a blog post with the following challenge: […] build an entire website where each resource fits into at most 8-bits worth of bytes. 255 bytes maximum size HTML, and maximum size of any linked external style"
date = "2025-09-15T17:20:21Z"
url = "https://jamesg.blog/2025/09/15/a-255-byte-web-page/"
author = "James' Coffee Blog"
text = ""
lastupdated = "2025-10-22T08:57:31.801271437Z"
seen = true
---

Tantek, [in celebration of 8-Bit Day (the 265th day of the year)](https://tantek.com/2025/257/t1/happy-8bitday-255-bytes-max), published a blog post with the following challenge:

> […] build an entire website where each resource fits into at most 8-bits worth of bytes. 255 bytes maximum size HTML, and maximum size of any linked external stylesheet, image, or even script file.

Alongside the challenge, Tantek has a demo showing [a web page whose HTML is under 255 bytes](https://tantek.com/8bit.html), with an external CSS stylesheet that is also under 255 bytes. This inspired me to try and see what I could make with such a small number of bytes.

[Here is what I made:](https://jamesg.blog/8bit)

![A web page with a paragraph of text, the titles of my most recent three blog posts, my blog icon, and a search form input.](https://editor.jamesg.blog/content/images/2025/09/Screenshot-2025-09-15-at-11.55.06.png)

*(I’m not sure if my submission is fully valid because it contains an image whose size is greater than 255 bytes, but I wanted to include my mascot anyway. The HTML source itself still falls within the rules!)*

My page has a brief introduction to my website, a list of my three most recent blog posts, a favicon, and a search box. The page is 253 bytes. The page is [styled by an external CSS file](https://jamesg.blog/8.css) that is 220 bytes long.

The HTML looks like this:

```
<style>@import "8.css"</style><img src=/favicon.ico>
<p>Hello! I'm James (he/him/his, capjamesg). I live in Scotland. This is my blog.
Writing (search for):
   Second person birds
   Rain
   Walking
search: <form action=/search-pages><input name=q>

```

[My CSS is:](https://jamesg.blog/8.css)

```
* { background-color: #410d3d; color: #d295d1; font-family: system-ui; border-color: #d295d1; }

{ max-width: 45em; white-space: pre-wrap; margin: 0.5rem 1rem; }
img { max-height: 3em; float: right; margin-top: 1rem; }

```

In designing my HTML, I considered what the browser would do for me. Browsers try their best to render HTML documents even if they aren’t syntactically valid. This is a wonderful attribute of HTML. You can make a mistake or leave something out and still get a page that opens and renders.

I left out the `html`, `head`, and `body` tags. I also left out all the quotation marks for HTML attributes like the `src` of the image.

Initially, I had all of my text in paragraphs, until I realised every p tag was a character I could be using elsewhere. I really wanted to see if I could fit a form element on the page. I opted to use only one opening `p` tag and apply the `white-space: pre-wrap` rule so that the document would preserve the spacing in the source file.

My page doesn’t include links to my most recent blog posts; I thought the titles were enough. You could find the blog posts with my search page (although it looks like some of my most recent posts aren’t showing up on the search page, something I need to fix). The list of titles doesn’t update automatically, although if it did I would likely cut off each title after 3-4 words with `[…]` and make sure I had enough space on the page to accommodate that.

I skipped as many HTML attributes as I could; my `input` doesn’t have an `id` or a `name`. As a result, this page likely has some accessibility considerations. This has me thinking about another challenge: to take the same 255 byte limit but impose the requirement for a website to be fully usable and understandable with a screen reader. (See also: [Whimsica11y](https://slides.sarajoy.dev/whimsica11y-sotb2025/?full#5).)

This was a fun project that reminded me of how hard the browser tries to take your code and render it to a user, even if it is missing some pieces.

I encourage you to try and make a 255 byte web page! Remember, you also get 255 bytes for your stylesheet. If you make one, let me know!