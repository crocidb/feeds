+++
title = "Working on My Website in 2025"
description = "Looking back at 2025, I spent a lot of time working on my website. I did nearly 500 commits focused on content diversification, feature expansion, and performance optimization. Let me walk through what I did chronologically by months."
date = "2025-12-26T00:00:00Z"
url = "https://abhinavsarkar.net/notes/2025-website-work/"
author = "Abhinav Sarkar"
text = ""
lastupdated = "2026-08-24T15:49:20.767599805Z"
seen = false
+++

Looking back at 2025, I spent a lot of time working on my website. I did nearly 500 commits focused on content diversification, feature expansion, and performance optimization. Let me walk through what I did chronologically by months.

This post was originally published on [abhinavsarkar.net](https://abhinavsarkar.net/notes/2025-website-work/?mtm_campaign=feed).

January–March[#](#januarymarch)
----------

January started with adding [MathJax](https://www.mathjax.org) support in blog posts and code syntax highlighting in the [Microblog](https://abhinavsarkar.net/microblog/?mtm_campaign=feed). I migrated the [Changelog](https://abhinavsarkar.net/changelog/?mtm_campaign=feed) from Markdown to YAML, enabling easier updates. I also added a dedicated Changelog feed and support for pulling post likes from Discourse.

In February I focused on tagging improvements: tag stemming and aggregation to reduce duplication in the Microblog, and updating the tag cloud algorithm to use logarithmic scaling for better visual hierarchy. In March I worked mostly on the frontend: enabling JS and CSS minification, removing unnecessary polyfills, cleaning up unused CSS code, and fixing print styles.

April–June[#](#apriljune)
----------

In April I launched the [Blogroll](https://abhinavsarkar.net/blogroll/?mtm_campaign=feed) page with posts from my friends’ blogs. In June I started the [Link Blog](https://abhinavsarkar.net/linkblog/?mtm_campaign=feed) to aggregate all my favourite links. I refactored the feed generation to be more modular, so that I could reuse it to create feeds for all new pages.

In May I added [Sitemap](https://abhinavsarkar.net/sitemap/?mtm_campaign=feed) and [Search](https://abhinavsarkar.net/search/?mtm_campaign=feed) to the site navigation, integrated the [IndieWeb Webring](https://xn--sr8hvo.ws/), and improved the reading time estimate algorithm for posts. I also added tags for polls and media in the Microblog.

Throughout this period, I made substantial improvements to the [Shake](https://shakebuild.com/) build system infrastructure of my static site generator. I added Shake linting to catch common build mistakes, and refactored Shake rules and targets for better organization. I migrated file change detection from modification time-based to digest-based checking, and configured the site builder to run more frequently but more smartly, regenerating the files only when content actually changed. These improvements reduced the build time by about 30%.

July–September[#](#julyseptember)
----------

September was the big consolidation month. I migrated my notes from [notes.abhinavsarkar.net](https://notes.abhinavsarkar.net?mtm_campaign=feed) to [this website](https://abhinavsarkar.net/notes/?mtm_campaign=feed)—a project planned since early 2024 that required two throwaway prototypes before getting it right. The migration involved careful preservation of all links, functionality, and files. I also implemented dead link checking for all post links, which replaces all broken links with their archived versions.

Immediately after the migration, one of my notes unexpectedly went viral on [Hacker News](https://news.ycombinator.com/). So, I added support for [backfeeding](https://indieweb.org/backfeed) HN comments to my site. I also implemented WebP image variant generation, allowing browsers to more efficiently load images on my website.

October–December[#](#octoberdecember)
----------

October was the month of adding new features. I added tag-wise Microblog feeds, launched the [Photography](https://abhinavsarkar.net/photography/?mtm_campaign=feed) page with full-screen viewing, and created the [EVERYTHING feed](https://abhinavsarkar.net/everything.atom?mtm_campaign=feed) as a comprehensive feed containing all content on this website.

I improved accessibility throughout the website by adding [ARIA](https://developer.mozilla.org/en-US/docs/Web/Accessibility/ARIA) attributes, added feeds for the [Activities](https://abhinavsarkar.net/activities/?mtm_campaign=feed) and [Readings](https://abhinavsarkar.net/readings/?mtm_campaign=feed) pages, added the latest photo on the homepage, and created pages for popular [posts](https://abhinavsarkar.net/posts/popular/?mtm_campaign=feed) and [notes](https://abhinavsarkar.net/notes/popular/?mtm_campaign=feed), and post [series](https://abhinavsarkar.net/series/?mtm_campaign=feed). I also added support for pulling likes for posts from Reddit, Lobsters and Hacker News.

In December, I added links to similar and dissimilar posts in post footers, implemented using the [TF-IDF](https://en.wikipedia.org/wiki/Tf–idf) algorithm with [cosine similarity](https://en.wikipedia.org/wiki/Cosine_similarity). I also implemented lazy loading for post comments, reducing page load times by roughly 50% for comment-heavy posts.

What I Wrote in 2025[#](#what-i-wrote-in-2025)
----------

I mostly wrote posts focused on programming language implementation: a three-part series on building a fast bytecode VM for arithmetic in Haskell ([parser](https://abhinavsarkar.net/posts/arithmetic-bytecode-vm-parser/?mtm_campaign=feed), [compiler](https://abhinavsarkar.net/posts/arithmetic-bytecode-vm-compiler/?mtm_campaign=feed), [virtual machine](https://abhinavsarkar.net/posts/arithmetic-bytecode-vm/?mtm_campaign=feed)), and a post on [interpreting Brainfuck](https://abhinavsarkar.net/posts/brainfuck-interpreter/?mtm_campaign=feed) with multiple approaches.

My notes were more eclectic. Significant ones included personal reflections on [how I got into programming](https://abhinavsarkar.net/notes/2025-into-programming/?mtm_campaign=feed), [changing my mind about writing a book](https://abhinavsarkar.net/notes/2025-change-of-mind/?mtm_campaign=feed), and [my writing process insights](https://abhinavsarkar.net/notes/2025-writing-process/?mtm_campaign=feed). I also wrote some posts on the prompts given in the [local IndieWebClub](https://blr.indiewebclub.org) about [totems](https://abhinavsarkar.net/notes/2025-totems/?mtm_campaign=feed) and [unfinished business](https://abhinavsarkar.net/notes/2025-unfinished-business/?mtm_campaign=feed). I wrote a post about [customizing Miniflux with similarity sorting](https://abhinavsarkar.net/notes/2025-customizing-miniflux/?mtm_campaign=feed), surveyed [compiler targets](https://abhinavsarkar.net/notes/2025-compiler-backend-survey/?mtm_campaign=feed), and created guides for tools I use ([GoAccess on NixOS](https://abhinavsarkar.net/notes/2025-goaccess-server-on-nixos/?mtm_campaign=feed), [Pandoc reading time estimation](https://abhinavsarkar.net/notes/2025-pandoc-reading-time/?mtm_campaign=feed)). I also started writing [weekly notes](https://abhinavsarkar.net/notes/tags/weeknotes/?mtm_campaign=feed) starting October.

Tech Stack for the Website[#](#tech-stack-for-the-website)
----------

The website generator continues to be written in Haskell using the [Shake](https://shakebuild.com/) build system. Templates are in [Mustache](https://mustache.github.io/)-based, content is in Markdown, processed with [Pandoc](https://pandoc.org/) and many homegrown filters, and styling is in [SCSS](https://sass-lang.com/).

The site is self-hosted on a [Hetzner](https://www.hetzner.com/) VPS running Nginx. It used to be behind the [Cloudflare](https://www.cloudflare.com) proxy for caching, but I removed it after the [outage](https://blog.cloudflare.com/18-november-2025-outage/). I use [Nix](https://nixos.org/) for building the site generator. See the [colophon](https://abhinavsarkar.net/colophon/?mtm_campaign=feed) for more details.

---

Nearly 500 commits, countless hours of thinking and tinkering, the notes migration, several new pages and features, and significant performance improvements. That’s been 2025 on the website front. Quite a year.

 If you have any questions or comments, please leave a comment below. If you liked this post, please share it. Thanks for reading!

---

Thanks for reading this post via feed. Feeds are great, and you're great for using them. ♥

This post was originally published on [abhinavsarkar.net](https://abhinavsarkar.net/notes/2025-website-work/?mtm_campaign=feed).

### Like, repost, or comment on: ###

* [Fediverse](https://fantastic.earth/@abnv/115786307865298534)
* [My website](https://abhinavsarkar.net/notes/2025-website-work/?mtm_campaign=feed#comment-container)

Read more of my [posts](https://abhinavsarkar.net/posts/) and [notes](https://abhinavsarkar.net/notes/).

![](https://anna.abhinavsarkar.net/matomo.php?idsite=1&rec=1)