+++
title = "Redesigning the Artemis account deletion back-end"
description = "As I have been building Artemis, I have learned that the account deletion flow requires constant review. For example, whenever I add a new database table, I need to make sure that table is in the account deletion flow. I may also need to create an index in the database so I can e"
date = "2026-02-11T11:26:17Z"
url = "https://jamesg.blog/2026/02/11/artemis-account-deletion-back-end/"
author = "James' Coffee Blog"
text = ""
lastupdated = "2026-02-11T20:17:01.771140663Z"
seen = false
+++

As I have been building Artemis, I have learned that the account deletion flow requires constant review. For example, whenever I add a new database table, I need to make sure that table is in the account deletion flow. I may also need to create an index in the database so I can efficiently delete columns in a new database table. In addition, as the service has grown, I have realised that a synchronous account deletion process no longer works in many cases.

When I first designed the account deletion flow, I made all of the deletion steps happen as soon as the user submitted the form to delete their account. This worked for a time, but then growing pains set in. A user may be subscribed to over a hundred feeds. Each feed may have hundreds of posts that all need to be deleted. The more data there is to delete, the more time the deletion process takes.

This presents a potential problem: if it takes too long to delete a user’s data, the request they made to delete their data will time-out. This is both frustrating for the user, and adds a support burden for me when I receive an email saying the process failed.

I have now redesigned the account deletion flow. When the user submits the form to delete their account, a check happens to see how many posts are associated with the user’s account. If there are less than 1,000 posts, the deletion process happens immediately. This is because I estimate that the request should be processable in a timely manner. This exact number is an estimate: it prove to be too high. But for now I think it will be fine.

If there are more posts associated with a user’s account, a flag is set on their account scheduling it for deletion, rather than immediately deleting the account. Then, the user is signed out. The user will no longer be able to sign into their account. A cron-job runs every hour to delete accounts that have been scheduled for deletion. When a user’s account has been deleted, they will receive an email to indicate the process is complete.

By running the deletion step asynchronously, it doesn’t matter if it takes 30 seconds or a minute or longer to delete a user’s account. Longer deletion times would be expected especially for users that have created their account a long time ago and have more data associated with their account.

This new flow took a lot of work to implement, but it was necessary: moving the account deletion task to the background ensures accounts can be deleted without the risk of the deletion request timing out, and that users aren’t waiting too long for their account to delete.

I also need to implement asynchronous account data export for the same reason as above: account data export requests can time out. With that said, there are several additional design and engineering considerations for account export that I need to think about first.