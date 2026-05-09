+++
title = "Artemis changelog #9"
description = "I have been working on a few new features for Artemis, the calm web reader I maintain. You can read a summary of what’s new below. See, sort, rename, and delete folders You can now view a list of the folders you have created, specify in what order folders should appear in your re"
date = "2026-05-06T00:00:00Z"
url = "https://jamesg.blog/2026/05/06/artemis-changelog-9"
author = "James' Coffee Blog"
text = ""
lastupdated = "2026-05-08T13:34:21.932520362Z"
seen = false
+++

I have been working on a few new features for [Artemis](https://artemis.jamesg.blog/), the calm web reader I maintain. You can read a summary of what’s new below.

See, sort, rename, and delete folders
----------

You can now view a list of the folders you have created, specify in what order folders should appear in your reader, rename folders, and delete folders from the “[Manage folders](https://artemis.jamesg.blog/account/folders)” page in your [account preferences](https://artemis.jamesg.blog/account).

![A page with the heading "Manage folders" with two sub-sections. The first section, "Your folders" lists folders a user has created. The second section provides a text area where you can arrange how folders are sorted.](https://editor.jamesg.blog/content/images/2026/05/folders.png)

ALT

A page with the heading "Manage folders" with two sub-sections. The first section, "Your folders" lists folders a user has created. The second section provides a text area where you can arrange how folders are sorted.

From the "Manage folders" page, you can click on a folder name in the list of your folders to see all websites that are in that folder:

![A page with the title "Authors in the "indieweb" folder" which lists the two authors in that folder.](https://editor.jamesg.blog/content/images/2026/05/infolderlist.png)

ALT

A page with the title "Authors in the "indieweb" folder" which lists the two authors in that folder.

New option in Artemis Labs
----------

Artemis Labs lists experimental features that you can enable at any time. You can access Artemis Labs from your [Reader Preferences](https://artemis.jamesg.blog/account/reader) page.

I have added a new option:

* Show a label under an author's name if they have posted for the first time in over 30 days?

This feature adds a little note under an author's name if they publish a blog post for the first time in over thirty days. It is designed to give you a little cue that someone who you may not have seen in your reader for a while wrote a blog post.

If you decide to experiment with this option, I am keen to hear your feedback! You can email me at any time at artemis@jamesg.blog.

Bug fixes
----------

* The page to add a website to your reader sometimes returned an error when trying to retrieve a URL with a query string. This has now been fixed. This included the [Artemis blog](https://artemis.jamesg.blog/blog), so you can now add the Artemis blog to your reader if you have had trouble doing so recently. This bug did not affect URLs already added to Artemis.

[account preferences](https://artemis.jamesg.blog/account) [Manage folders](https://artemis.jamesg.blog/account/folders) [Reader Preferences](https://artemis.jamesg.blog/account/reader) [Artemis blog](https://artemis.jamesg.blog/blog)