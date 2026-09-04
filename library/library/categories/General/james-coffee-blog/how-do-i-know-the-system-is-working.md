+++
title = "How do I know the system is working?"
description = "A few weeks ago, I received a bug report for Artemis that indicated a user’s reader was not being updated as expected. This error was caused by a feed that caused the polling code to error out and stop. My code assumed a value was present and, if it wasn’t, the program would stop"
date = "2026-07-05T00:00:00Z"
url = "https://jamesg.blog/2026/07/05/how-do-i-know-the-system-is-working"
author = "James' Coffee Blog"
text = ""
lastupdated = "2026-07-06T19:13:25.330577370Z"
seen = false
+++

A few weeks ago, I received a bug report for Artemis that indicated a user’s reader was not being updated as expected. This error was caused by a feed that caused the polling code to error out and stop. My code assumed a value was present and, if it wasn’t, the program would stop running.

To understand this bug, you need to know how Artemis retrieves feeds. Artemis polls feeds once per hour. A feed is only polled if there is at least one user for whom it is midnight in their time zone. This works because Artemis is scheduled to update user feeds once per day. Assuming the hourly job runs, every user’s feed will update (roughly) once per day, at midnight in their time zone.

The broken feed had a subscriber in a time zone that was not my own. This meant that I didn’t observe the bug because the polling code didn’t retrieve the feed in my time zone. But others in the time zone in which there was at least one user subscribing to the feed may notice their feed did not contain all the posts that were expected.

This led me to realise that, as a web reader operator, one of the situations I really want to avoid is when someone subscribes to a feed but posts from that feed do not show up as expected, or at all. The experience also led me to a question that is based on a discussion I had earlier this year about coding: how do I know the system is working? (I think [Joe](https://artlung.com/) noted a question to this effect in an IndieWeb meetup.)

Through this lens, there are several opportunities for improvement in the Artemis polling logic. I fixed the immediate bug – making my code more robust by not assuming a specific value was present – but there is more work to do. Ideally, I should have a dashboard that tells me if the polling script fails for any reason so I can investigate. And I should be able to do a re-poll for all users in that time zone, something for which I have not yet written logic.

I test Artemis myself before I release updates but as the codebase becomes more complex this is not as sufficient as it once was: a user might subscribe to a specific feed or have account preferences set that do not match my testing environment. I rely on bug reports from users to help me identify issues that I can’t replicate myself.

As a side project that I work on in my free time, Artemis doesn’t have a test suite. With that said, I definitely want to think through more of how I can ensure I have clear visibility into when polling jobs fail. Just because the polling script had been running okay for months, this doesn’t mean that there will not be an issue in the future. Such was the case when one feed caused the issue I mentioned at the beginning of this blog post.

Similarly, I need more visibility into why feed requests fail. I already record when and why feed requests fail (i.e. feed URL is now a 404, feed was blocked by Cloudflare, and more), but it would be nice to have a dashboard so I can track these issues over time.

While I haven’t started work on this project yet, I did want to write this note both to document what I am thinking as well as to more closely reflect on the question “how do I know the system is working?”

[Joe](https://artlung.com/)