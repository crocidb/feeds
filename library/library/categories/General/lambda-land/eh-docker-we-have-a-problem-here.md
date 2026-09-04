+++
title = "Eh, Docker, we have a problem here…"
description = "Quick note for those who don’t know about Docker: Docker is a program that lets me take packaged-up programs (called images or containers) and run them without having to worry much about dependencies.Today I decided to upgrade my versio"
date = "2017-10-26T00:00:00Z"
url = "https://lambdaland.org/posts/2017-10-26-eh-blog-we-have-a-problem-here/"
author = """

            
              Ashton Wiersdorf
            
          """
text = ""
lastupdated = "2026-07-21T09:22:07.345725789Z"
seen = false
+++

*Quick note for those who don’t know about Docker:* [Docker](https://www.docker.com/what-docker) is a program that lets me take packaged-up programs (called *images* or *containers*) and run them without having to worry much about dependencies.

Today I decided to upgrade my version of [Ghost Blog](https://ghost.org/). I’m using the [Docker image](https://hub.docker.com/_/ghost/) on a Digital Ocean droplet. Updating should be simple, I thought. I would take down the blog then spin it back up again after pulling down the latest Docker image. I ran `docker stop ghost-blog`, removed the container with `docker rm ghost-blog` then ran `docker pull ghost:latest`. The container came down without a problem.

Then the trouble began.

I tried restarting the image:

```
docker run -d --name ghost-blog -p 80:2368 -v /home/ghost/blog-data:/var/lib/ghost/content ghost
```

But when I ran `docker ps`, no docker containers were running. I tried looking at the log of the `ghost-blog` container and was greeted with this message:

```
tar: /var/lib/ghost/content.orig: Cannot open: No such file or directory
tar: Error is not recoverable: exiting now
tar: This does not look like a tar archive
tar: Exiting with failure status due to previous errors
```

Hhmmm… I tried creating `/var/lib/ghost/content.orig`, but that didn’t help. I then copied my `blog-data/` folder, blew the old folder away, then tried running again, but to no avail.

I was out of ideas, so I decided to inquire at the great oracle of [DuckDuckGo](https://duckduckgo.com/?q=docker+ghost+tar:+/var/lib/ghost/content.orig:+Cannot+open:+No+such+file+or+directory+tar:+Error+is+not+recoverable:+exiting+now+tar:+This+does+not+look+like+a+tar+archive+tar:+Exiting+with+failure+status+due+to+previous+errors&bext=msl&atb=v43-6_s&ia=web). The [first result](https://github.com/docker-library/ghost/issues/69) was this lovely issue on GitHub that covered *exactly* the problem I was facing.

I created the directory specified and was able to fire up the docker container without a problem. I think I must have made an incompatible upgrade. ¯\_(ツ)\_/¯

Backup Woes
----------

Running around as the root user of a system is always dangerous. I was painfully reminded of that today when I accidentally deleted my backup folder instead of moving its contents to the original location. 🤦🏻‍♂️Oops.

*Fortunately*, I had made another backup of all my content saved as a JSON file on my laptop. I fired up the docker container, opened to the website in a web browser, and imported all my old files. Day saved. 😌

*Unfortunately* I lost all my configurations. Not that there was a *lot*, but I did loose the Disqus integration as well as some settings for me as an administrator. Alas. I’ll fix the comments sometime later. Probably *after* midterms…

So, lessons: make backups. Then don’t delete the backups.

I *am* enjoying the Ghost blog. It’s pretty minimal and doesn’t get in my way. I just wish I had been a little more careful today.