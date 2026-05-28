+++
title = "Playing with Matrix: Conduit and Synapse"
description = '''I've been playing around with Matrix homeservers. I like the idea of running my own federated server to join random channels in.Here's the two I've played around with so far and what I've thought about them.My plan is also to create proper Space for my Aks\_Dev channels and bridg'''
date = "2022-04-01T00:00:00Z"
url = "https://akselmo.dev/posts/playing-with-matrix-conduit-and-synapse/"
author = "Akseli"
text = ""
lastupdated = "2026-05-27T23:22:57.127430880Z"
seen = true
+++

I've been playing around with Matrix homeservers. I like the idea of running my own federated server to join random channels in.

Here's the two I've played around with so far and what I've thought about them.

My plan is also to create proper Space for my Aks\_Dev channels and bridge them to my Discord "server."

[Conduit 0.2 and 0.3](#conduit-0-2-and-0-3)
----------

**Note**: I was testing the Conduit 0.2, 0.3 and Next versions. These are very much still in their early phase of development.

[Conduit.rs](https://conduit.rs) is a very simple, easy to set up Matrix homeserver. It's made in Rust if you're into that sort of thing, but that's not why I was using it.

Conduit promises very simple way to get a server up and running, which is why I wanted to try it. It also apparently takes very little space and resources, so it was perfect for a small 5€/month Digitalocean "droplet" I am running.

Setting up was a breeze. The manual they have in their [Gitlab](https://gitlab.com/famedly/conduit/-/blob/next/DEPLOY.md) was really good and to the point. I was up and running within an hour or so.

At first, it was promising. I joined servers just fine.. Until I tried to join bigger channels with thousands of people. That's where Conduit slowed down a lot, at least for me and my tiny cheap server. Maybe something beefier would've been fine.

I also used the default SQLite database with it, so that also slows it down. I prefer to roll with defaults when it comes to this stuff since I am very new to self-hosting things.

I had some weird problems where my account got stuck in somekind of limbo. I don't really remember it, but what I do remember is that the developer of Conduit helped me *a lot* in their Matrix channel. They even made a custom patch for me to get the situation fixed. That convinced me to keep trying. After all, my mishaps probably helped debug something so I hope it was some use! :D

After the problems were solved, it was pretty much smooth sailing from there. Bigger channels still took some time to join, smaller channels joined pretty much instantly.

But why switch to Synapse then? Well, I was missing couple of features I find personally important:

### [Spaces](#spaces) ###

Spaces are very important thing to me since I wanted to set up my own Discord space. Conduit, at the time of writing, supports spaces only partially: You can join spaces but you can't explore them. This makes it harder for me to set up the space I wanted since I would have to use another account to do that etc. etc.

On top of that, joining a new space with many channels to explore for was also difficult. Again I had to use two accounts.

### [Notifications](#notifications) ###

Edit: I will leave the old part below, but here is the clarified reason by Timo why the notifications aren't working: [Link to Mastodon Toot](https://mastodon.social/@timokoesters/108066689733053957)

>
>
> Timo: One clarification: Notifications don't work on Conduit v0.3.0 because we are sending nulls in the wrong places and the push gateway drops the messages. This is fixed on the 'next' branch and will make it into the v0.4.0 release soon hopefully. The /notifcations endpoint (used for optaining notification history) is not necessary for push notifications on any client I know.
>
>

(Old post below)

This is a bit funky, since Conduit does support notifications, but it doesn't have the /notifications endpoint that most clients lean on for all the notifs. Thus, some clients work with notifs and some don't.

Let's just say my fiancee wasn't terribly happy when I kept missing her messages! :'D

### [Unfamiliar with codebase](#unfamiliar-with-codebase) ###

I don't know anything about Rust. I can't help debug it. Sure this is not a big problem and it could maybe be a good way to learn but I wanted something simpler at first. Programming network/server stuff is something I'm not very familiar with.

I am sure in future Conduit will support the features I need and I will very likely go back!

[Synapse](#synapse)
----------

Synapse is kind of the opposite. Very complicated to set up, takes more resources... But it supports all the features I want and need. There's a lot of documentation and lots of it gives mixed signals. My first time setup went all kinds of bonkers, nothing worked so I just wiped the following off my server: Nginx, Apache2, Synapse... Purged and cleaned all kinds of wonky old configs I had laying about and then tried again.

Here's what I needed to do to get it to work.

### [Installation](#installation) ###

First off, the documentations give you all kinds of packages to install. I don't know which is the correct one for real, but this one worked for me:

```

sudo apt install matrix-synapse-py3

```

Note the -py3 in the end. That was important bit and mentioned in the official documentation: [Link](https://matrix-org.github.io/synapse/latest/setup/installation.html#matrixorg-packages)

Other guides, like the one offered by Digitalocean, didn't have that and caused me tear hair out of my head, and I don't have much of that left.

But there was one guide that helped me to continue: [HowToForge](https://www.howtoforge.com/tutorial/how-to-install-matrix-synapse-on-ubuntu-1804/)

I pretty much followed it, except I didn't change the HTTP and HTTPS listener ports at all.

I did add the `registration_shared_secret` however, and I had already set letsencrypt on this server since it was running a website before.

The guide asks you to add a configuration, but I didn't use that one. I used the one in official documentation, except I added the bits for my own website.

Here's the config I used:

```

server {
       listen 80;
       server_name matrix.akselmo.dev;
       return 301 https://$server_name$request_uri;
}

server {
    listen 443 ssl http2;
    listen [::]:443 ssl http2;

    # For the federation port
    listen 8448 ssl http2 default_server;
    listen [::]:8448 ssl http2 default_server;

    server_name matrix.akselmo.dev;

    ssl_certificate /etc/letsencrypt/live/matrix.akselmo.dev/fullchain.pem;
    ssl_certificate_key /etc/letsencrypt/live/matrix.akselmo.dev/privkey.pem;

    # If you don't wanna serve a site, comment this out
    root /var/www/html;

    location ~ ^(/_matrix|/_synapse/client) {
        # note: do not add a path (even a single /) after the port in `proxy_pass`,
        # otherwise nginx will canonicalise the URI and cause signature verification
        # errors.
        proxy_pass http://localhost:8008;
        proxy_set_header X-Forwarded-For $remote_addr;
        proxy_set_header X-Forwarded-Proto $scheme;
        proxy_set_header Host $host;

        # Nginx by default only allows file uploads up to 1M in size
        # Increase client_max_body_size to match max_upload_size defined in homeserver.yaml
        client_max_body_size 50M;
    }
}

```

And now both my website and the Synapse server started running!

Again, I didn't set up myself Postgresql, even I probably should have! I may do that later at some point.

Luckily when it came to the configs, I didn't really have to mess around with it.

### [Experience](#experience) ###

Again, the server is a bit slow when joining big channels, but once joined it works pretty fast. I believe this is issue with using SQLite, just like with Conduit.

All features that matrix.org homeserver has work for me too, so spaces and notifications etc. etc.

I am happy with this server and it fits in the 2gb of RAM my server has. I will update this post if I see any big issues with resources.

[Conclusion](#conclusion)
----------

**I do really like Conduit.** It was so, very painless to setup and the people working on it were super helpful and nice! But for now, the lacking features made me try Synapse, and I will stay in Synapse until Conduit is ready.

Early adopting just is not for me, I suppose.. :)

Synapse should have very simple and to the point installation guide for someone like me, who just wants to run a server for one or two accounts. But now that I got it working, I'll be using it.

[I am not an expert!](#i-am-not-an-expert)
----------

If there are some big oversights you see in this post, do share! I want to know more about this stuff. I am not a pro at all when it comes to server side software.

I also wanted to share my experience as someone who doesn't know what they're really doing! :D Maybe it'll be useful to someone.

Thanks for reading!