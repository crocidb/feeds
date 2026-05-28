+++
title = "Frustrations with CalDAV tasks"
description = "I tried to use CalDAV tasks again. It did not go well.The problem with CalDAV tasks is often that every client only implements a portion of the massive spec. Sure, makes sense, nobody wants to implement all the stuff it has.But then you try to use different apps with it, and they"
date = "2026-04-04T16:11:52Z"
url = "https://akselmo.dev/posts/frustrations-with-caldav/"
author = "Akseli"
text = ""
lastupdated = "2026-05-27T23:22:56.982421329Z"
seen = true
+++

I tried to use CalDAV tasks again. It did not go well.

The problem with CalDAV tasks is often that every client only implements a portion of the massive spec. Sure, makes sense, nobody wants to implement all the stuff it has.

But then you try to use different apps with it, and they all expect different things for such simple thing as marking a task done.

For example, one app can mark task 100% done, but it doesn't set its status as "COMPLETED". Then other app does not care about the 100% done, but expects the "COMPLETED" to be there.

Then both apps just desync the whole thing and it's pain.

Why did I move from [todo.txt](http://todotxt.org/) to CalDAV tasks? Mostly FOMO and boredom, I just wanted to see how it works again. But due to above mentioned issues, I recalled why I moved to todo.txt in the first place..

So I am back with todo.txt, using [KomoDo](https://akselmo.dev/posts/komodo-my-first-kde-app/) and [ntodotxt](https://github.com/tmaegel/ntodotxt). Works fine. Does all I need them to do. And I have [Todo2ical](https://akselmo.dev/notes/todo2ical/) for adding notifications to my calendar.

Simple. Efficient. And best of all.. Works.

*(Well, there's some issues with python todo.txt parsing but anyway.)*

[](https://brid.gy/publish/mastodon)