+++
title = "Brainstorming a loginless web reader"
description = "At IndieWebCamp Nürnberg, Tilman worked on a “feedroll”, a collection of feeds aggregated on a single page that demonstrates the capability of following different websites with a web reader. This, and a discussion with friends, got me thinking about what a “loginless” web reader "
date = "2026-07-05T00:00:00Z"
url = "https://jamesg.blog/2026/07/05/brainstorming-a-loginless-web-reader"
author = "James' Coffee Blog"
text = ""
lastupdated = "2026-07-06T19:13:25.335842200Z"
seen = false
+++

At IndieWebCamp Nürnberg, [Tilman worked on a “feedroll”](https://tilman.me/feedroll/), a collection of feeds aggregated on a single page that demonstrates the capability of following different websites with a web reader. This, and a discussion with friends, got me thinking about what a “loginless” web reader experience would look like for Artemis, the web reader I maintain.

To see a site in the Artemis reader, you need to:

1. Decide you want to use a web reader.
2. Sign up.
3. Add a website to your reader.
4. Preview the corresponding web feed to make sure it is correct.
5. Confirm that you want to add the feed to your reader.

Especially for someone unfamiliar with the concept of a web reader, convincing them to sign up to a service before demonstrating the capabilities of web feeds may not be ideal. Tilman’s feedroll does a good job of showing what web feeds let you do – aggregate and follow your favourite blogs. What if a web reader could offer a similarly intuitive experience?

I am thinking that Artemis could have a view that lets you add a feed and skip the sign up, preview, and confirmation stages. This could be tied to a random, ephemeral account that expires after 24 hours unless the user clicks a button to sign up. If the user signs up, the feeds and posts they have added will be preserved.

The loginless view could ideally encourage people to add 2-3 websites so they can see what it feels like to have a web reader, and maybe even have a few curated feeds from which a user could select. Indeed, following one website in isolation may beg the question "why do I need a reader?"; following multiple sites shows the value of a web reader.

The loginless view could also have many of the reader preferences made available, so people who haven’t created an account yet could still experiment with different features like keyword filters and visual display preferences (i.e. whether to show Artemis in a serif or sans-serif font).

This would be a lot of work to build and I’d need to sketch out the idea, so I thought I’d write it up in a brainstorming blog post as a means to get the idea on paper and see if anyone else has ideas.

[Tilman worked on a “feedroll”](https://tilman.me/feedroll/)