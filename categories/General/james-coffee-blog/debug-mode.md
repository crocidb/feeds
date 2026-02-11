+++
title = "Debug mode"
description = "One of the areas of the Artemis codebase that I update the most is the logic that relates to the list of posts published by authors to which a user is subscribed. Because Artemis works with so many different formats of information – web feeds like RSS or h-feed, Mastodon posts, B"
date = "2026-02-07T13:41:14Z"
url = "https://jamesg.blog/2026/02/07/debug-mode/"
author = "James' Coffee Blog"
text = ""
lastupdated = "2026-02-11T20:17:01.803077602Z"
seen = false
+++

One of the areas of the Artemis codebase that I update the most is the logic that relates to the list of posts published by authors to which a user is subscribed. Because Artemis works with so many different formats of information – web feeds like RSS or h-feed, Mastodon posts, Bluesky posts – there can often be subtle bugs that appear every so often.

Early on in the development of the project, I added a “debug” mode which lets me see the JSON record for a post in my reader. This JSON record is used to display the post. The debug mode is only available to me and accessible via a switch that I can toggle on and off.

Here is an example of one of the records:

![The Artemis debug mode showing the JSON record with information about a post.](https://editor.jamesg.blog/content/images/2026/02/debug_mode.png)

By having this JSON view, I can quickly identify many issues in the reader interface. The reader interface is one of the most complex parts of the software, so tools that can help me find the source of a bug faster are have great significance in terms of the developer experience.

For instance, earlier today I noticed that the summaries of Mastodon and Bluesky posts that contained an image sometimes were allowed to exceed the \~10-15 word limit for summaries in the user interface. The debug mode let me see that the `title` itself calculated was incorrect, so I could narrow the bug down to the back-end. I then kept following my nose to get to the source of the bug.

My debug flow for bugs related to the list of posts often is as follows:

1. I notice a bug, or a bug is reported.
2. I try to replicate it on staging.
3. Go into debug mode.
4. Read through the codebase to identify the issue, and work on a fix.
5. Test and deploy the fix.

I wanted to write this down in case the idea of a “debug mode” is helpful for anyone new to building web applications who hasn’t encountered this concept yet.