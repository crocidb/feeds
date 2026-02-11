+++
title = "Notifying users of page updates"
description = "Some time in January, I was going through my browser tabs and came across an Artemis tab that had been opened a while ago. But it took me a moment to realise that the tab might be out of date. My eyes went first to the posts from authors to which I have subscribed, then to the da"
date = "2026-02-11T08:58:40Z"
url = "https://jamesg.blog/2026/02/11/notifying-users-of-page-updates/"
author = "James' Coffee Blog"
text = ""
lastupdated = "2026-02-11T20:17:01.775334214Z"
seen = false
+++

Some time in January, I was going through my browser tabs and came across an Artemis tab that had been opened a while ago. But it took me a moment to realise that the tab might be out of date. My eyes went first to the posts from authors to which I have subscribed, then to the dates associated with those posts. When I read the date at the top of the page, I thought: oh, the page is showing posts from a previous day. I need to refresh to see the latest posts.

This experience was a bit jarring: the page looked like what I expected in form, but was out of date.

This made me think: how can I notify users that their tab may be out of date without creating something that is likely to distract? I have seen variants of “this page has updated” on other websites before and have often found them distracting. The two reasons for this I surmise are: (i) the banner appears too often, and; (ii) the banner appears when there is not a material change in the page.

I decided to implement a banner that appears ten minutes after midnight in a user’s timezone. This banner tells the user that there may be new posts to see:

![A blue banner at the top of Artemis that reads "Your reader may have updated since you last refreshed this page." with a link that says "Refresh" that, when clicked, refreshes the page.](https://editor.jamesg.blog/content/images/2026/02/artemis_refresh_banner.png)

This banner is necessary because Artemis doesn’t update in real-time. A user must refresh the page to see updates.

The banner is implemented entirely with client-side logic. In the current implementation, Artemis does not check if there are actually new posts. Instead, it shows the banner ten minutes after midnight in a user’s timezone, when it is likely new posts would be available if any new posts were found.

Here is the code, verbatim, as it is in Artemis right now:

```
// this code shows the #inactive message when midnight elapses in a user's timezone
// this feature is to ensure people who leave Artemis open overnight know that there may
// be new posts available.
// this message relies exclusively on client-side logic, which you can read below.
​
var page_opened_time = new Date();
​
setInterval(function () {
    var page_opened_timestamp = `${page_opened_time.getFullYear()}-${page_opened_time.getMonth()}-${page_opened_time.getDate()}`;
​
    var current_time = new Date();
    var current_timestamp = `${current_time.getFullYear()}-${current_time.getMonth()}-${current_time.getDate()}`;
​
    var minutes_since_midnight = (60 * current_time.getHours()) + current_time.getMinutes();
​
    // only show 10 mins after midnight, because some feed polling jobs may take a few minutes
    if (current_timestamp > page_opened_timestamp && minutes_since_midnight > 10) {
        document.getElementById("inactive").style.display = "block";
    }
}, 5000);

```

Every five seconds, this code checks to see how many minutes have elapsed since midnight in the user’s timezone. If it is ten minutes past midnight and the current day is greater than the day the user opened the page (calculated by comparing `YYYY-MM-DD` of the day the page was opened to the `YYYY-MM-DD` at the time when the check runs), the banner appears.

I added comments to this feature because, on first inspection, a reader may ask why Artemis cares about the user’s time. Importantly, Artemis is not constantly checking for new posts, and the site back-end doesn’t know for how long the page has been open. Indeed, the back-end doesn’t need to know how long a user has been looking at any page.

In a future version, I may update my code to make a web request to check if there actually are new posts before showing the banner. This would involve one web request. Doing a check to see if there are actually new posts would prevent any confusion that may arise from a user refreshing the page after being encouraged to and seeing no updates. With that said, I thought I’d start with a more simple implementation first; I can always add to it later.