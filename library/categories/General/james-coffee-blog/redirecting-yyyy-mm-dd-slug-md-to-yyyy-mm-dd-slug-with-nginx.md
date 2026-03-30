+++
title = "Redirecting YYYY-MM-DD-slug.md to /YYYY/MM/DD/slug with Nginx"
description = "Earlier this week a reader pointed out that posts listed on my date archive pages were linking to the wrong URLs. For example, the link for /2026/01/25/kind-software would instead be /2026-01-25-kind-software.md. This was caused by my static site generator using the markdown file"
date = "2026-02-07T09:33:54Z"
url = "https://jamesg.blog/2026/02/07/nginx-yyyy-mm-dd-redirect/"
author = "James' Coffee Blog"
text = ""
lastupdated = "2026-02-11T20:17:01.809845432Z"
seen = true
+++

Earlier this week a reader pointed out that posts listed on my date archive pages were linking to the wrong URLs. For example, the link for `/2026/01/25/kind-software` would instead be `/2026-01-25-kind-software.md`. This was caused by my static site generator using the markdown file name instead of the post slug when creating the date archive pages.

After fixing the issue, I later had the idea to look for any broken URLs on my website. I went to Google Search Console, which, when set up, lets you see requests Google has made that returned a 404 error. This is a good way of finding broken URLs. *(NB: Search Console will also show 404s from pages others linked to, which means there are sometimes there URLs that never existed in the list because someone linked to the wrong URL)*

I noticed Google Search Console had picked up on these errors months ago, which made me think that I should at least add a redirect so that the broken URLs go to the correct ones. I can’t recall these URLs ever being active, but I thought I may as well add the redirect just in case.

This got me thinking: how can I make this redirect?

Nginx, the web server I use, lets you do redirects with regex. After much trial, error, web searching, and testing on [regex101](https://regex101.com), I eventually came up with the following directive:

```
location ~ "^\/([0-9]{4})-([0-9]{2})-([0-9]{2})-([A-Za-z0-9-]+)\.md$" {
   return 307 /$1/$2/$3/$4;
}
```

This code will run on a URL in the form `/YYYY-MM-DD-slug.md` and tells Nginx to return a 307 (temporary) redirect for the URL `/YYYY/MM/DD/slug.md`.

The slug can contain letters, numbers, and dashes, but not other special characters.

On writing this, one limitation with this rule is that it doesn’t acknowledge if a file ever exited. I realise the more precise thing to do would have been to programatically generate all of the redirects. With that said, I’ll keep it the way it is just in case any archive pages are cached in someone’s browser that still have the incorrect links, or in case something breaks again. And in any case, I think it’s worth documenting this redirect for anyone who wants to change their URL paths from `YYYY-MM-DD-slug.md` to `/YYYY/MM/DD/slug`.

*I am not an expert at Regex; if anything stands out to you that doesn't seem right, please let me know!*