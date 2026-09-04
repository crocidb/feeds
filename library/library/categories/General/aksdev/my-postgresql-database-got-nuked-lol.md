+++
title = "My PostgreSQL database got nuked lol"
description = "So I was running my linkhut fork instance scalie.computer, and everything was fine at first. Then it was suddenly gone. This happened to me twice!My lizard fursona making an sad face.Note that I"
date = "2026-03-11T17:44:04Z"
url = "https://akselmo.dev/posts/they-broke-my-server/"
author = "Akseli"
text = ""
lastupdated = "2026-05-27T23:22:56.985706765Z"
seen = true
+++

So I was running my [linkhut](https://linkhut.org/) fork instance [scalie.computer](https://scalie.computer/), and everything was fine at first. Then it was suddenly gone. This happened to me twice!

![My lizard fursona making an sad face.](/assets/images/emotes/sad.png)

Note that I am not a sysadmin/webdev type of person. This whole world is scary and full of horrors to me. I am most comfortable writing native applications in my cave.

I wrote [this note](https://akselmo.dev/notes/scaliecomputer-broke/) about it when I was investigating, but found nothing. So I thought the app was faulty or something in my server was faulty. It's mostly useless note now.

Well, I learned what happened!

[My database was just out in the open lol](#my-database-was-just-out-in-the-open-lol)
----------

I ran my database in a docker container. Overnight, about the same time both times \~23:00, the site just broke when I tried to visit it.

![My lizard fursona making an grumpy face.](/assets/images/emotes/grumpy.png)

Okay, what, why?!

First I thought it was linkhut doing some migration stuff, since that's what the logs said. But it was not that, it was something else, linkhut was just doing the migrations in confusion.

What actually happened was that the port to my database docker container was just out there to the public. Sure, it was behind a password but in my laziness the admin and password were just `postgres:postgres` because that's what the original file came with.

So someone deleted them!

I found that out by eventually getting curious about what was happening and wondering if I could see any data in the database. Instead I find "readme" table, with one entry that goes *"pls give me ur bitcoin or i will sell your data!!"* type shit. Clearly by a bot, since it happened always around the same time of night.

![My lizard fursona making an laugh face.](/assets/images/emotes/laugh.png)

Ah. Right. My 5kb of bookmarks.

I then learned through this nice article that docker does dumb shit by default if you don't specify the address: [PSA: Docker Will Edit Host-Based Firewall Rules For You](https://geoff.tuxpup.com/posts/psa_docker_edits_firewall_rules/).

Jeez. I don't know anything about servers (obviously). But that feels like some bad design to me. Maybe there's some reason. Dunno.

So I made sure my docker-compose files have the ports like this:

```
ports:
	- "127.0.0.1:5432:5432"

```

Apparently this should work, according to the blogpost I linked.

[Oh and another thing...](#oh-and-another-thing)
----------

Seems that my VPS had no UFW preinstalled! UFW being the firewall.

So there was no firewall.

All ports were open to be poked at.

![My lizard fursona making an wheeze face.](/assets/images/emotes/wheeze.png)

Oops.

Well that has been fixed now. And learned the hard way: Install ufw, block the postgres port, open only 80 and 443 ports, make sure ufw is running and then run bunch of port sniffing tools to see what's up.

[To sum it all up](#to-sum-it-all-up)
----------

**Learn from my mistakes and check the following:**

* Check your docker compose files for the port and be explicit about it being localhost only if needed
* Make sure ufw is installed, running and blocking all the ports you don't need.

That's all folks. [scalie.computer](https://scalie.computer) has now been running for a while without an incident.

![My lizard fursona making an scream face.](/assets/images/emotes/scream.png)

Unless someone now sees this post and finds out something else!! (Please don't, I'll cry)

glhf.

[](https://brid.gy/publish/mastodon)