+++
title = "Staging banners"
description = "When I run the Artemis codebase, one of the first things it does is look for an environment variable that indicates what “environment” the application is running in. There are two modes: development and production. If no mode is specified, development mode is set by default. Whet"
date = "2026-02-07T13:23:36Z"
url = "https://jamesg.blog/2026/02/07/staging-banners/"
author = "James' Coffee Blog"
text = ""
lastupdated = "2026-02-11T20:17:01.806449702Z"
seen = false
+++

When I run the Artemis codebase, one of the first things it does is look for an environment variable that indicates what “environment” the application is running in. There are two modes: development and production. If no mode is specified, development mode is set by default.

Whether or not the application is in development or production mode determines the path of the database, what user agent to use when making web requests, and several other pieces of information.

This variable is also used to show a “staging” banner:

![The Artemis web interface with a yellow banner at the top that says "This is a staging environment."](https://editor.jamesg.blog/content/images/2026/02/staging.png)

This banner lets me know that the page I am looking at is running locally. While this information is also determinable in other ways (i.e. the URL of the page I am looking at) this banner makes it unambiguously clear that my software is running locally. I don't look at it often, but it stands out so I know it's there.

*(Vocabulary note: "staging" and "development" modes are technically different things. "development" is often your local machine, whereas "staging" may be an intermediary environment before production. In any case, I say "staging" on my banner because my local environment also acts as the staging environment.)*

If you are developing web software, such a banner may be helpful so you know whether the page you are looking at is production (where you would have no such banner) or development (where there is such a banner).