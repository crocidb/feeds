+++
title = "Brainstorming site name changes in web readers"
description = "Recently, one of the websites I follow (not this one!) changed their name. Artemis, the web reader I maintain, was still using the old name for the feed. This makes sense in the case of Artemis because users can choose their own names for an author; if the author name were synced"
date = "2026-08-20T00:00:00Z"
url = "https://jamesg.blog/2026/08/20/site-name-changes-web-readers"
author = "with words, wonder"
text = ""
lastupdated = "2026-08-24T15:49:16.967017106Z"
seen = false
+++

Recently, one of the websites I follow (not this one!) changed their name. [Artemis](https://artemis.jamesg.blog/), the web reader I maintain, was still using the old name for the feed. This makes sense in the case of Artemis because users can choose their own names for an author; if the author name were synced with what was published in the feed, a user’s preferences would be overwritten.

With that said, I think this logic could be extended a bit. I was thinking that Artemis could track the names of a feed every time a feed is polled. If the name changes – perhaps across more than three polling jobs, so as to avoid scenarios where a feed name is accidentally updated for whatever reason – Artemis could inform a user that the name has changed, and offer the option to either change the name of the feed, or dismiss the notification. If the notification is dismissed, it would not appear again unless the site changed its name again.

Perhaps the notification could appear inline next to an entry in a user's Artemis feed, like this:

![An entry in Artemis with a post title on one line and the author name on the next line. Next to the author name is a button that says "[site name updated; review?]"](https://editor.jamesg.blog/content/images/2026/08/sitenamechange.png)

When clicked, the link could take the user to a page with a list of posts from the feed, a paragraph showing the new name for the site, and a text box with the existing name for the site that the user can optionally change.

I have been thinking about this more this week because I recently changed the name of my website from “James’ Coffee Blog” to “with words, wonder”. I don’t know how other web readers handle scenarios where a site name – and the name of a feed – change, but as a site author I am hoping you see my new site name rather than the old one. I have changed my site name in my feed, so the change could be picked up automatically; whether this is true across popular readers, however, is unclear (indeed, as aforementioned, Artemis doesn’t have any particular affordance this scenario right now).

I am likely not going to build this feature for a while since it will take quite a bit of engineering, but I did want to write down the idea.