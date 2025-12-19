+++
title = "A concept for a two-panel web reader settings page"
description = "For a while, I have had an idea for Artemis – the calm web reader I maintain – to have a page that shows your feed and feed settings on the same page. I am interested in this idea because there is presently a distance between the settings to customise your reader and the reader i"
date = "2025-12-09T13:34:44Z"
url = "https://jamesg.blog/2025/12/09/two-panel-reader-settings-page/"
author = "James' Coffee Blog"
text = ""
lastupdated = "2025-12-10T15:23:59.435902197Z"
seen = true
+++

For a while, I have had an idea for [Artemis](https://artemis.jamesg.blog) – the calm web reader I maintain – to have a page that shows your feed and feed settings on the same page.

I am interested in this idea because there is presently a distance between the settings to customise your reader and the reader itself. You need to click back-and-forth to see the impact of a change in settings to your feed.

As a user, I would prefer to be able to immediately preview the impact of changing my feed and reader interface, before I actually save my changes, and without changing between pages.

Here is a design I came up with that shows both a preview of the user's feed and the settings to customise the feed:

![The Artemis interface showing two columns: a list of posts in the user's reader feed in the left column and a list of reader preferences like feed order, how many days worth of posts to show in the feed, and more in the right column.](https://editor.jamesg.blog/content/images/2025/12/reader.png)

I think this design could be enhanced by creating a two-column layout in the "Design Your Reader" so that more options can be on the screen at once. I also think this interface could let you preview and apply keyword filters, too.

I haven't built this yet because it involves a bit of a refactor: to make this work, I would need to abstract the logic that calculates a user's feed such that I can pass in any combination of values rather than relying on the user's account values. This is definitely possible, but will take a bit of time. I would also need the ability to dynamically repopulate the feed in the browser as you change settings, something for which I don't have any existing code.

With that said, I thought I would document this as a pattern in case anyone finds it interesting or inspiring for their own work!