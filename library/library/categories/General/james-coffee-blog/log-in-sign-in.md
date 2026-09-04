+++
title = "Log in, sign in"
description = "Log in, sign in I recently experimented with writing a new 401 page for the IndieWeb wiki to replace the default nginx page we have. My experiment is not live yet, but I wanted to document a few of the decisions I made while writing the page. First, I chose the title “You need to"
date = "2026-05-01T00:00:00Z"
url = "https://jamesg.blog/2026/05/01/log-in-sign-in"
author = "James' Coffee Blog"
text = ""
lastupdated = "2026-05-05T08:24:55.706921651Z"
seen = true
+++

**Log in, sign in**
----------

I recently experimented with writing a new [401 page for the IndieWeb wiki](https://jamesg.blog/401-iwc) to replace the default nginx page we have. My experiment is not live yet, but I wanted to document a few of the decisions I made while writing the page.

First, I chose the title “You need to be logged in to see this page” which both conveys that the user cannot view the page and why (they need to be signed in). Second, the log in button is prominently placed on the page so that a reader can navigate to the log in page. Third, I used “logged in” and “log in” consistently, instead of also using “sign in”.

In my first draft of the page, I used “sign in” in the document title and “log in” on the document. I did this primarily because both terms are so similar and they happened to come to mind as I was writing each section. But then I realised that using two terms to convey the same thing was not necessary – why use two terms when one will do?

This got me thinking about the design of Artemis. Artemis uses “Log in” consistently <sup class="footnote-reference" id="f-1"><a href="https://jamesg.blog/longform-feed#1">1</a></sup> instead of also using “sign in”. In addition, if you encounter a page that you need to be signed in to view, Artemis will show a page with the title “You must be signed in to view this page” and a link to sign in. Previously, this page had the title “Unauthorised” which, while technically accurate, was unnecessarily complicated.

Using either “log in” or “sign in” may seem small, but these things add up. The more consistent the text in the interface, the easier it is to understand a page. And the fewer jargon words like “unauthorised” that someone encounters, the more comfortable they will feel navigating through the interface. <sup class="footnote-reference" id="f-2"><a href="https://jamesg.blog/longform-feed#2">2</a></sup>

<sup class="footnote-definition-label" id="f-3">1</sup>

This blog post encouraged me to replace a few instances of “login” with “log in” to ensure absolute consistency.

[[↩]](https://jamesg.blog/longform-feed#f-1)

<sup class="footnote-definition-label" id="f-4">2</sup>

 This also has me thinking of error messages more generally. An error should help someone understand that something went wrong and how to fix it. To do so, the language used should be helpful, specific, and approachable; jargon makes errors feel even more intimidating. I still need to work on this in Artemis: there are a few error messages`ges that are more technical than they need to be.

[[↩]](https://jamesg.blog/longform-feed#f-2)

[401 page for the IndieWeb wiki](https://jamesg.blog/401-iwc) [1](https://jamesg.blog/longform-feed#1) [2](https://jamesg.blog/longform-feed#2) [[↩]](https://jamesg.blog/longform-feed#f-1) [[↩]](https://jamesg.blog/longform-feed#f-2)