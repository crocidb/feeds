+++
title = 'A Tiny HTML Snippet to "Discuss on HN"'
description = """<a id="hn-discuss" href="https://news.ycombinator.com/submitlink"Discuss this page on HackerNews.</aconst hn = document.getElementById('hn-discuss');// Set href to "share current URL and title".hn.setAttribute(  'href',  https://news.ycombinator.com/submitlink`    +"""
date = "2022-11-27T00:00:00Z"
url = "https://taylor.town/hn-discuss"
author = "Taylor Troesh"
text = ""
lastupdated = "2026-04-20T13:20:40.666785335Z"
seen = true
+++

```
<a id="hn-discuss" href="https://news.ycombinator.com/submitlink">
  Discuss this page on HackerNews.
</a>
```

```
const hn = document.getElementById('hn-discuss');

// Set href to "share current URL and title".
hn.setAttribute(
  'href',
  `https://news.ycombinator.com/submitlink`
    + `?u=${encodeURIComponent(window.location.href)}`
    + `&t=${encodeURIComponent(document.title)}`
);

setTimeout(
  () => {
    // Replace href with most popular HN link from the past 4 months.
    fetch(
      `https://hn.algolia.com/api/v1/search`
        + `?tags=story`
        + `&restrictSearchableAttributes=url`
        + `&numericFilters=created_at_i>`
          + Math.round(new Date().getTime()/1000 - 4*30*86400)
        + `&query=${encodeURIComponent(window.location.href)}`
    )
      .then(res => res.json())
      .then(data => {
        const id = data?.hits?.[0]?.objectID;
        if (id)
          hn.setAttribute(
            'href',
            `https://news.ycombinator.com/item?id=${id}`
          );
      })
      .catch(err => console.error(err));
  },
  // Wait 10 seconds before hitting Algolia!
  10*1000
);
```