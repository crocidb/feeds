+++
title = "The inverted index pattern"
description = "In “Build a search index in Python”, I walked through how to create a search index using the “inverted index” structure. This structure is commonly used in document search. This week I was thinking about “inverting” data is more broadly applicable in software engineering than in "
date = "2026-02-11T13:39:00Z"
url = "https://jamesg.blog/2026/02/11/the-inverted-index-pattern/"
author = "James' Coffee Blog"
text = ""
lastupdated = "2026-02-11T20:17:01.763988194Z"
seen = false
+++

In “[Build a search index in Python](https://jamesg.blog/2024/07/16/build-a-search-index)”, I walked through how to create a search index using the “inverted index” structure. This structure is commonly used in document search.

This week I was thinking about “inverting” data is more broadly applicable in software engineering than in search. I wanted to write the concept down on its own because it is so useful. Let me share an example from this week where I used the “inverting” idea.

I was working on improvements to my website edit button logic. As part of the code, I have a data structure that maps web page paths to their corresponding internal IDs. The structure looks like this:

```
path2id = {
  "/about": "bb960cd9-dc2e-423a-8a0f-01774e143d06"
}

```

I am using a dictionary to allow for fast lookups (O(1)).

I was working on a task where I wanted to go from the post ID to its corresponding web page path. My current data structure, `path2id`, doesn’t let me look up entries by post ID. This meant I needed a new data structure so I could efficiently find the path associated with a post ID.

To create my new data structure, I “inverted” the data structure I already had, like so:

```
id2path = {
  "bb960cd9-dc2e-423a-8a0f-01774e143d06": "/about"
}

```

Now I have two data structures: one that lets me look up post IDs by path (`path2id`) and another that lets me look up paths by post ID (`id2path`).

In my project, I created a new `id2path` dictionary by reversing the keys and values in `path2id`. This worked because the index was being recalculated with every web request. In many cases, however, you will build these two indices incrementally: when you add an entry to `path2id`, for example, you would also add the corresponding, reversed entry to `id2path`. This will ensure both dictionaries stay in sync.

While the code above is Python, the concept applies whenever you are working with a language that has a "map" or "dictionary" (i.e. in JavaScript when working with JSON objects).