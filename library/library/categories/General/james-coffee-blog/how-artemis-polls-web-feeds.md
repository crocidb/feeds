---
title = "How Artemis polls web feeds"
description = """RSS readers mostly 1 work by "polling" web feeds to retrieve posts. At a specified interval, the server will try to download every feed to which a user is subscribed, and add any new posts to the database. These posts are then displayed in a user's reader. Building a web reader i"""
date = "2025-09-18T11:55:31Z"
url = "https://jamesg.blog/2025/09/18/how-artemis-polls-web-feeds/"
author = "James' Coffee Blog"
text = ""
lastupdated = "2025-10-22T08:57:31.798773041Z"
seen = true
---

RSS readers mostly <sup id="f-1">1</sup> work by "polling" web feeds to retrieve posts. At a specified interval, the server will try to download every feed to which a user is subscribed, and add any new posts to the database. These posts are then displayed in a user's reader.

Building a web reader is fun and technically interesting in part because there are many considerations for polling web feeds. With that said, there are many best practices to keep in mind so that you don't retrieve URLs more often than you need to.

I wanted to document the flow that [Artemis](https://artemis.jamesg.blog) – the calm web reader I maintain – follows to download web feeds. Artemis polls several thousand feeds on behalf of a few hundred users.

While there is still room to improve the logic, I wanted to document some of the steps I have taken to minimise the amount of time spent polling while ensuring users have a good experience. If you are building a polling mechanism, the documentation below may be helpful.

Finding candidate URLs
----------

Every hour, a script is run to retrieve new posts from feeds to which users are subscribed.

Perhaps uniquely, Artemis updates once per day, which means the reader doesn't need to poll every feed every hour. Instead, Artemis only polls a feed if it is midnight in the timezone of at least one user subscribed to the feed. This means that if there are people in every timezone subscribed to a feed, the feed will be polled hourly. Otherwise, the polling cadence will be much less.

If you are building a web reader, you will probably not need to implement that logic, but I thought it was worth sharing since it provides an insight into an essential design consideration when designing polling systems: reducing the amount of work your server needs to do whenever possible.

With this step, Artemis typically polls all URLs in a few minutes every hour. Without this step, Artemis would spend substantially more time polling URLs when it is not necessary for the function of the software (which is to show users an up-to-date view of their feed as of midnight in their time zone).

Making web requests
----------

With a list of URLs to poll, the next step is to make web requests.

First, a thread pool is opened. This thread pool concurrently makes web requests and processes the results. Concurrently processing URLs allows the polling system to retrieve URLs substantially faster than if requests were made one after the other.

This thread pool then follows a few steps:

1. The type of the web feed is determined. Artemis supports RSS, Atom, JSON Feed, h-feed, ActivityStreams 2.0 (partially), and AT Protocol (tested only against Bluesky). If a feed is ActivityStreams 2.0 or on the AT Protocol, separate processing steps have to happen. In the case of ActivityStreams 2.0, a user's inbox URL is discovered, and a signed GET request is made to retrieve a user's inbox. In the case of Bluesky, a username is appended to the `https://public.api.bsky.app/xrpc/app.bsky.feed.getAuthorFeed?actor=` URL to make a web requests to retrieve the author's feed.
2. If a feed type is RSS, Atom, JSON Feed, or h-feed, a HEAD request is made with `If-None-Match` and `If-Modified-Since` headers. The `If-None-Match` header lets the software provide an `Etag` that the feed's web server returned. If the server supports `If-None-Match`, the server will return a `304 Not Modified` code if the Etag my server supplies is the same as the current Etag for the document that the feed's server has computed. If Artemis sees a 304, the feed is no longer processed. This is because the feed's server is telling Artemis that the feed hasn't been updated. `If-Modified-Since` works in the same way, except using the time that the last web request was made to ask if there have been updates since then.
3. If a feed returns a 429, the feed will be retried after the `Retry-After` time provided by the server.
4. If there is any other error (i.e. 404, 500), the error will be logged. If the feed consistently cannot be retrieved, this is surfaced to the user so they can investigate.
5. At this point, a GET request is made with `If-None-Match` and `If-Modified-Since`. Requests are made with a `30` second timeout. If the request times out, the feed will be downloaded on its next poll.
6. If the request returns a 200, a hash of the feed contents is computed and compared to the last hash of the feed contents that Artemis computed. If the hashes are the same, no further processing occurs. A hash that is the same indicates the contents of the feed have not updated since the last time the feed was processed.
7. Using the `Content-Type` returned by the server, the feed contents are then converted into ActivityStreams 2.0 using Granary, an open source Python package for converting between different feed formats. This step allows me to unify all the data from different feed types into a single structure. Artemis uses ActivityStreams 2.0 as its primary data structure because of the richness of interactions that can be represented in the structure. Granary makes this conversion step *so easy*, for which I am sincerely grateful.
8. Sometimes, the Granary conversion step fails. One that has tripped me up is that a feed's `Content-Type` may not be correct. I have run into some feeds that advertise their `Content-Type` as RSS while being an Atom feed, and vice versa. Thus, if processing with the parser corresponding to the `Content-Type` fails, Artemis may try another parser. If Atom parsing fails, RSS parsing is tried. There may be considerations of which I am not aware here, but it has helped me ensure invalid content types do not cause the logic to fail.
9. After the data conversion stage, the ActivityStreams 2.0 data is processed. This involves calculating a "display title" that fits into Artemis (Artemis shows titles or the first few words of a post, not the full post in a user's feed; users are instead encouraged to click on a link to go to the author's site), adding `noopener` and `no-referrer` to the links of the contents of posts (the WIP offline mode lets a user read posts in their feed and I want the links within those posts to respect the privacy of the user so I add these attributes), and more.
10. A link graph is computed with all links in the post and saved to the system database. This is used to power the Artemis link graph extension.
11. The post data is then inserted into the database. This happens after all URLs have been processed. This allows me to keep the database open for writing once, which is more effective than opening the database once for every feed author. The data insertion stage happens within a transaction; if anything fails, the programme will be terminated.
12. The record for a feed is updated in the database to include the `Etag` returned by the server, the time the server was last polled successfully, and the hash of feed contents. It is essential this is the last step. If for some reason anything fails in the program, the feed record will not change until the very end. This means that a feed can be re-polled next time if something goes wrong. This doesn't happen often, but ensures that the program doesn't terminate half-way and record a feed has been successfully polled when its contents had not yet been saved to the database.

Artemis inserts an entry into a `posts` table for each URL published in a feed, for each user. This means that if there are two users subscribed to a feed, every URL in the feed will have two entries in the posts table: one for each user. While this could potentially be optimised to save space (an increasing consideration now that Artemis polls thousands of feeds and has processed over 1 million posts), the current setup allows the Artemis back-end to set various flags for a post-user combination.

Importantly, when a feed is polled, an entry for all posts in the feed is created in the database *for all users*, even if it is not midnight in their time zone. A flag is set in the record of the post in the `posts` table to say that the post should be hidden from the user until midnight in their timezone. Without this feature, a conditional GET (a GET request made with `If-Modified-Since` and `If-None-Match)` would return 304 after the first request, until the feed was updated. This means that users in any time zone other than the one where the feed was first polled would not see the post.

User agents, verified bot status, and retrying polling jobs
----------

All web requests are made with the Artemis user agent. This user agent is attached to all web requests that the server makes. The user agent contains a link to the [Artemis bot documentation](https://artemis.jamesg.blog/bot) which provides more information on the role of the bot.

Of note, the Artemis service has been registered with [Cloudflare's Verified Bots programme](https://developers.cloudflare.com/bots/concepts/bot/verified-bots/) to allow the software to make requests to websites that use Cloudflare JavaScript challenges for bot protection. This is essential for Artemis because we process several thousand feeds, but is less relevant if you are running a service exclusively for yourself.

In addition to the main polling job, Artemis will run separate jobs to retry polling feeds that asked the system to retry later. Web requests to a feed are only made after the `Retry-After` time specified when the feed asked the server to retry later.

Conclusion
----------

With this system, Artemis should, in most cases, make at most two requests per feed per hour: a HEAD request to determine if a feed has updated, and a GET request to retrieve the post contents <sup id="f-2">2</sup>. This assumes a feed has a subscriber in all time zones. In reality, I suspect most web feeds are subscribed to by users in a few timezones, so the number of web requests will be lower.

[**1**]: A web reader may also opt to use WebSub to receive push events from a WebSub hub when a feed has been updated. Artemis doesn't support WebSub yet, but may in the future.

[**2**]: (Additional intermediary requests are made for ActivityStreams 2.0 feeds; I need to add logic to cache inbox URLs to reduce the complexity of this step.

[Also posted on IndieNews](https://news.indieweb.org/en)