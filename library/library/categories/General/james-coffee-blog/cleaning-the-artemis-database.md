+++
title = "Cleaning the Artemis database"
description = "If you are a user of Artemis, the calm web reader I maintain, you may have noticed that there has been more downtime than usual lately. This is largely because of a difficult database task on which I have been working. If you are not interested in the technical details but are an"
date = "2025-12-15T12:23:18Z"
url = "https://jamesg.blog/2025/12/15/cleaning-the-artemis-database/"
author = "James' Coffee Blog"
text = ""
lastupdated = "2025-12-17T22:54:13.153358925Z"
seen = true
+++

If you are a user of [Artemis](https://artemis.jamesg.blog), the calm web reader I maintain, you may have noticed that there has been more downtime than usual lately. This is largely because of a difficult database task on which I have been working.

If you are not interested in the technical details but are an Artemis user and would like a summary, the TL;DR is that the database should be more reliable now and less maintenance will be needed. If you want the lesson I learned about maintaining web services, skip to the end.

Now, onto the story.

An idea: An in-app reading experience
----------

Earlier this year, I was working on a feature that would let you read posts in Artemis (rather than clicking through to the author's site). I was planning on offering a more calm reading experience for Mastodon threads and a YouTube embedded viewer that uses their `no cookie` website for some additional privacy, as well as offline reading support.

To make this work, I stored the data for posts in a Sqlite Full Text Search (FTS) virtual table. This would also enable full-text search that powers the Artemis search feature.

As part of the feature to read a full post in Artemis and to enable richer search features, I structured Artemis database with two tables for posts: `posts` and `post_contents`. A `posts` record would contain the title of a post, its Activity Streams 2.0 representation (the underlying data format Artemis uses), and the associated `post_contents` record would contain the contents of a post, indexed in an FTS table.

The database is growing!
----------

The `post_contents` table was *huge*. The database in total was over 100 GB large, a result of running the service for a year for many users. But when I ran the numbers, only \~5-10% of the database was being used to store data from feeds to which a user was subscribed in the `posts` column; the rest was this huge FTS table for post contents.

The large database was had meaningful effects. First, I had to pay for additional storage, which made the service less sustainable as a free tool. Second, tasks like deleting an account were starting to take significant amounts of time and had to be done manually because of the size of the `post_contents` table. Third, any maintenance on the `post_contents` table was hard. Fourth, all these problems made Artemis less enjoyable to maintain. I thought I had a huge maintenance task ahead of me which made it harder to focus on the joys of being able to run a service that I am proud of building.

A feature, unused and without support
----------

I never ended up launching the in-app post reading experience (I prefer reading posts on authors’ own websites), and the search feature could run fine using a `LIKE` query on the `posts` table which stored an often-abbreviated but still useful AS2 representation of a post. Artemis could continue offering search without the `post_contents` table, even if it wasn’t full-text search over every word in every post.

Thus, I decided I should drop the `post_contents` table; this change would have minimal impact on users, save for the search feature mainly offering search results for the titles and introductions of posts (which were stored in the AS2 record associated with each post in the `posts` table).

Reducing the database size
----------

Because the `post_contents` table was so big, running a `DROP TABLE` query to remove the table was taking a significant amount of time. Thus, this weekend I wrote a migration script that copied the database into a new Sqlite file, except for the `post_contents` table. This migration took several hours: at first, making a list of all the tables to copy, and writing and checking the migration script, then running the script, and finally manually adding the indexes I needed (the old database had several indexes that were not needed).

After validating that my database copy was working as expected, I fully migrated the project over to the new, smaller database without the `post_contents` table. The resulting database table is over 90% smaller than the old one, with no compromise in user features.

Launch features when you can (and have committed to) supporting them
----------

I have learned a lot from this experience, but the main one was that you shouldn’t launch a feature until you know you can, and want to, fully support it.

I hope to move Artemis to PostgreSQL at some point to get around another database-related problem: because Sqlite only supports one writer at a time, user actions can be blocked while new posts are being saved to the database. This is only a problem for a few seconds an hour to the extent I understand, but is still an issue. With that said, for now, Artemis is now both cheaper to run, easier to maintain, and there are no large pending database tasks.

If you run into any problems using the service, please email me at artemis [at] jamesg [dot] blog.