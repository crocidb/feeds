+++
title = "Taming the Thundering Herd with Redis"
description = 'This article inspired me to write this python pseudo-code to solve the thundering herd problem with redis.`__RETRY = "::RETRY::"def get(key, exp'
date = "2019-06-13T00:00:00Z"
url = "https://abhinavsarkar.net/notes/2019-redis-promises/"
author = "Abhinav Sarkar"
text = ""
lastupdated = "2026-07-21T09:17:41.668210768Z"
seen = false
+++

[This article](https://web.archive.org/web/20190613/https://instagram-engineering.com/thundering-herds-promises-82191c8af57d) inspired me to write this python pseudo-code to solve the thundering herd problem with [redis](https://redis.io/).

```
__RETRY = "::RETRY::"

def get(key, expiry_ms, min_wait_ms, max_wait_ms):
  val = do_get(key, expiry_ms, min_wait_ms, max_wait_ms)
  while val == __RETRY:
    val = do_get(key, expiry_ms, min_wait_ms, max_wait_ms)
  return val

def do_get(key, expiry_ms, min_wait_ms, max_wait_ms):
  val = redis.GET(key)
  if val is not None:
    return val
  else:
    set = redis.SET("promise." + key, 1, "PX " + max_wait_ms, "NX")
    if set:
      val = backend.get(key)
      redis.SET(key, val, "PX " + expiry_ms)
      return val
    else:
      val = redis.GET(key)
      if val is None:
        sleep_ms = min_wait_ms + random.randint(0, int(min_wait_ms/10))
        time.sleep(sleep_ms/1000)
        return __RETRY
      else:
        return val

val = get("some_key", 300_000, 1_000, 10_000)
```

 If you have any questions or comments, please leave a comment below. If you liked this post, please share it. Thanks for reading!

---

Thanks for reading this post via feed. Feeds are great, and you're great for using them. ♥

This post was originally published on [abhinavsarkar.net](https://abhinavsarkar.net/notes/2019-redis-promises/?mtm_campaign=feed).

### Like, repost, or comment on: ###

* [My website](https://abhinavsarkar.net/notes/2019-redis-promises/?mtm_campaign=feed#comment-container)

Read more of my [posts](https://abhinavsarkar.net/posts/) and [notes](https://abhinavsarkar.net/notes/).

![](https://anna.abhinavsarkar.net/matomo.php?idsite=1&rec=1)