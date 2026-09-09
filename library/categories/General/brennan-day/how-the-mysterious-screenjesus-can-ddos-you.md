+++
title = "How the Mysterious ScreenJesus can DDoS You"
description = "How a bug in my own CI/CD accidentally uncovered a novel vulnerability in NeoCities: ScreenJesus, the undocumented screenshot bot behind thumbnail previews, has no rate limits and will happily visit thousands of your pages—and anything they embed—in minutes. Notes on accidental D"
date = "2026-09-09T02:00:00Z"
url = "https://brennan.day/how-the-mysterious-screenjesus-can-ddos-you/"
author = "mail@brennanbrown.ca (Brennan Kenneth Brown)"
text = ""
lastupdated = "2026-09-08T23:03:49.925294805Z"
seen = false
+++

Buckle up. As I'm sure you can already tell by the title of this article, this one is a weird one. I (with the help of [Adam of omg.lol](https://neatnik.omg.lol)) accidentally uncovered a rather concerning—and novel—vulnerability when it comes to beloved website-maker [NeoCities](https://neocities.org).

Those who use NeoCities are aware that whenever you upload or change a file on your site, it's registered as [an event](https://neocities.org/site/brennanday?event_id=7552135), which can be understood as a status update. This is a large part of the social aspect of the platform: you can follow others and their site updates will display in your feed so you can see people's brand new creative web designs as soon as they happen, and have a way to leave a comment.

A feature of these "events" is that NeoCities grabs a thumbnail of each page that's added or changed. This gives the status update a visual element and a way for people to easily see what the new pages look like quickly.

But *how* does NeoCities get those thumbnails? The answer is [ScreenJesus](https://screenjesus.neocities.org/)—and it's also the issue that I'm going to be discussing here today.

There are two reasons why I became aware of ScreenJesus in the first place: one is my own terrible code and CI/CD, and the other is due to a [status embed](https://status.lol) that appears on every page of my site in the sidebar.

To start, I wrote about how I use [GitLab CI to mirror my site to NeoCities](https://brennan.day/deploying-an-eleventy-site-to-neocities-with-gitlab-ci-cd/) quite a few months ago, now. This platform is the [primary mirror](https://brennanday.neocities.org) of my website in the event my main domain goes down for whatever reason.

Unfortunately, there's a bug in my code (shocker) that causes the entire site to be uploaded rather than only pages that have been added or changed, and I haven't been able to figure out how to fix this. Though to be fair, I haven't really spent time trying, since what I do instead is [manually uncomment](https://gitlab.com/brennankbrown/brennan.day/-/blob/main/.gitlab-ci.yml?ref_type=heads) the CI script once a week to do a full upload to the site.

Unfortunately, my site has grown and continues to keep growing—if it was just text files and writing, that'd be fine, but I just *have* to have a featured image for every article I write, and these images are resized to multiple different sizes. As a result, while there are around 600 total pages in my generated `_site` folder, there are over 2,000 files in total that get uploaded to NeoCities each time.

On its own, this isn't that big of a deal. It just means I do a manual weekly upload that takes a bit of time instead of, you know, actual continuous deployment.

However—and you can probably see where this is headed—ScreenJesus takes a screenshot of *each* page during this upload process.

But wait, what even is ScreenJesus, and what does it do? That's actually difficult to answer. Despite NeoCities being [open-sourced](https://github.com/neocities), there is no mention of [ScreenJesus in any of its codebase](https://github.com/search?q=org:neocities+screenjesus&type=code). Being a screenshot bot and API service used by NeoCities to capture thumbnail previews of user websites, it visits the sites directly.

The [NeoCities site documenting ScreenJesus](https://screenjesus.neocities.org/), created by [airu](https://arandomsite.neocities.org/), guesses that "Kyle Drake (founder of Neocities) uses Vultr, a cloud server provider with KVM's [sic] (Kernal based virtual machines)" to operate ScreenJesus. Like I said, there's no official documentation on this.

The problem is, like real Jesus probably, ScreenJesus has no rate limits. This means that all 4,000 pages I uploaded were visited and screenshotted in the span of only fifteen minutes.

This is fine for my static site behind a CDN, but Adam saw my little status.lol embed get visited 4,000 times in 15 minutes. And, according to the logs, there were 18 different IP addresses from the Vultr boxes he had to block.

Before I explained all of the above, Adam assumed this was a small DDoS attempt—because it kind of is. Even though this was a total accident and a result of my own bad coding, it's clear that I accidentally stumbled upon a worryingly effective way to overload a small server if used maliciously.

I don't know the current state of development on NeoCities, and it seems to be more in a maintenance mode now in 2026—[Kyle Drake](https://kyledrake.com/) hasn't written a blog post since 2023. But I certainly hope I can get an administrator of some sort to see this post and change the way ScreenJesus operates, such as using caching and rate limiting, to alleviate the problematic nature I've described here.

If you want to avoid this for yourself, this [handy guide](https://control-neocities-thumbnail.neocities.org/) about controlling NeoCities thumbnails is actually really helpful. Since ScreenJesus always declares itself in the user agent, it is easy to block and will honour the block.

There are still a lot of unknowns, but this is my best attempt at explaining how things are right now.

---

>
>
> **About Brennan Kenneth Brown**
>
>
>
> Queer Métis writer, cultural critic, and web developer based in Mohkínstsis (Calgary), Treaty 7 territory. Author of nine books and counting, the founder of Fireweed Writing School and Berry House Studio, and of Write Club at Mount Royal University. His work has been cited in Le Monde and other publications.
>
>
>
> **Enjoy this content?** Support my work and help me create more:
>
>
>
> [Patreon](https://patreon.com/brennankbrown) | [Ko-fi](https://ko-fi.com/brennan) | [GitHub Sponsors](https://github.com/sponsors/brennanbrown)
>
>