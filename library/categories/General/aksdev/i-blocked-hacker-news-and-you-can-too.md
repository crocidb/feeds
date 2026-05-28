+++
title = "I blocked Hacker News and you can too"
description = "No, not april fools.Hacker News is one of those websites where the commenters are often very angry people. Note, I said commenters not lurkers/passive browsers/link clickers. Anyone who uses Hacker News just as a website to find links on, I have no beef with.But most people"
date = "2023-04-01T00:00:00Z"
url = "https://akselmo.dev/posts/i-blocked-hacker-news-and-you-can-too/"
author = "Akseli"
text = ""
lastupdated = "2026-05-27T23:22:57.091993186Z"
seen = true
+++

*No, not april fools.*

Hacker News is one of those websites where the commenters are often very angry people. Note, I said **commenters** not lurkers/passive browsers/link clickers. Anyone who uses Hacker News just as a website to find links on, I have no beef with.

But most people who comment on it.. I don't want anything to do with them.

So I used link referrer to "block" the site: If someone sees a link to my blog on there and clicks it, depending if your browser sends a referral header or not, it gets 403 forbidden warning and stops there.

Easy to circumvent of course, but average HN commenter likely doesn't care enough to copy paste links and open sites in privacy mode or w/e. They're too busy making money, being intelligent and having stimulating discussions over the newest fad in tech.

[How-to](#how-to)
----------

Enough dumb ranting, here's how to do it if you run Apache 2. Unfortunately I do not know how to do this with nginx.

1. Open `/etc/apache2/apache2.conf`

2. Scroll to bottom of the file

3. Add following

   ```
   <if "%{http_referer} =~ /ycombinator.com/">
           deny from all
   </if>

   ```

4. Save file

5. Restart apache2: `systemctl restart apache2`

6. Done!

You can test if the blocking works with curl:

`curl -e ycombinator.com your_site_url_here`

You can add other sites as well with same way! However, if you have massive blocklists, there's likely a better way to do this, like using `.htaccess` file or something like that.

Anyhow, hope this helps others, just wanted to share how it's done since I saw people asking about it. Again, it's not foolproof, very easy to circumvent (literally copy-paste the link to another window), but it should at least deter some.

Have fun "blocking!"