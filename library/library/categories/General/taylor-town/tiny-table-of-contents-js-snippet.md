+++
title = "Tiny Table-of-Contents JS Snippet"
description = """const toc = document.getElementById('table-of-contents');for (const x of document.querySelectorAll('h2, h3')) {  const id = x.innerText.replaceAll(/[^a-z0-9]/gi,'');  x.id = id;  const item = <li<a href="${id}"${x.innerText}</a</li`;  switch (x.tagName.toLowerCase()) {  """
date = "2023-05-04T00:00:00Z"
url = "https://taylor.town/toc-snippet"
author = "Taylor Troesh"
text = ""
lastupdated = "2026-04-20T13:20:40.574135529Z"
seen = true
+++

```
const toc = document.getElementById('table-of-contents');
for (const x of document.querySelectorAll('h2, h3')) {
  const id = x.innerText.replaceAll(/[^a-z0-9]/gi,'');
  x.id = id;
  const item = `<li><a href="#${id}">${x.innerText}</a></li>`;
  switch (x.tagName.toLowerCase()) {
    case "h2": toc.insertAdjacentHTML('beforeend', `${item}<ul></ul>`); break;
    case "h3": [...toc.querySelectorAll('ul')]?.pop()?.insertAdjacentHTML('beforeend', item); break;
  }
}
```

---

Example
----------

The following markdown…

```
# Title
lorem ipsum

<ul id="table-of-contents"></ul>

## Chapter 1
lorem ipssum

### Section A
lorem ipssum

## Chapter 2
lorem ipssum

### Section B
lorem ipssum

### Section C
lorem ipssum
```

…produces this HTML…

```
<h1>Title</h1>
<p>lorem ipsum</p>
<ul id="table-of-contents"></ul>
<h2>Chapter 1</h2>
<p>lorem ipsum</p>
<h3>Section A</h3>
<p>lorem ipsum</p>
<h2>Chapter 2</h2>
<p>lorem ipsum</p>
<h3>Section B</h3>
<p>lorem ipsum</p>
<h3>Section C</h3>
<p>lorem ipsum</p>
```

…and JS transforms it on page load.

```
<h1>Title</h1>
<p>lorem ipsum</p>
<ul id="table-of-contents">
  <li><a href="#chapter1">Chapter 1</a></li>
  <ul>
    <li><a href="#sectiona">Section A</a></li>
  </ul>
  <li><a href="#chapter2">Chapter 2</a></li>
  <ul>
    <li><a href="#sectionb">Section B</a></li>
    <li><a href="#sectionc">Section C</a></li>
  </ul>
</ul>
<h2 id="chapter1">Chapter 1</h2>
<p>lorem ipsum</p>
<h3 id="sectiona">Section A</h3>
<p>lorem ipsum</p>
<h2 id="chapter2">Chapter 2</h2>
<p>lorem ipsum</p>
<h3 id="sectionb">Section B</h3>
<p>lorem ipsum</p>
<h3 id="sectionc">Section C</h3>
<p>lorem ipsum</p>
```