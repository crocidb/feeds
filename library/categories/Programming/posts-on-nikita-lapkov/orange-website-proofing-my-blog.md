---
title = "Orange-Website-Proofing My Blog"
description = "Discussion on HackerNews and Lobsters.Over the course of one year this website is deployed, I did not pay a penny for hosting it. Sure, I pay for renting the domai"
date = "2023-07-01T11:00:00Z"
url = "https://laplab.me/posts/orange-website-proofing-my-blog/"
author = "Posts on Nikita Lapkov"
text = ""
lastupdated = "2025-10-22T08:59:06.981314059Z"
seen = true
---

>
>
> Discussion on [HackerNews](https://news.ycombinator.com/item?id=36549434) and [Lobsters](https://lobste.rs/s/reu7qa/orange_website_proofing_my_blog).
>
>

Over the course of one year this website is deployed, I did not pay a penny for hosting it. Sure, I pay for renting the domain itself, but everything else is free and quite honestly I like it this way. So when I woke up to a 10$ bill from DigitalOcean, I immediately knew something was amiss.

Orange Website
----------

Last month I wrote [an article](https://laplab.me/posts/family-photos-vs-256-kb-ram/) that reached the front page of HackerNews. This happened before, but this specific article included a couple of high-res photos and I made a mistake of not checking their size before uploading. There were 4 images in total, each roughly 2MB in size. With all the page visits from the Orange Website, this resulted in **82.76GB** of bandwidth spent. Lazy loading would have reduced this number by a factor, but it was still much more than I expected.