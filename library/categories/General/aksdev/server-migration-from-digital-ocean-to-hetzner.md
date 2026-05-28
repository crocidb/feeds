+++
title = "Server migration, from Digital Ocean to Hetzner"
description = "Well that took a while.After 6 hours I am finally done with this. It was hell but I feel accomplished. However I'm still tying up lose ends.Why?I wanted to move my stuff from Digital Ocean to Hetzner for few reasons:* Digital Ocean is american owned company, Het"
date = "2022-08-05T00:00:00Z"
url = "https://akselmo.dev/posts/migrating-servers-from-digital-ocean-to-hetzner/"
author = "Akseli"
text = ""
lastupdated = "2026-05-27T23:22:57.115422083Z"
seen = true
+++

Well that took a while.

After 6 hours I am finally done with this. It was hell but I feel accomplished. However I'm still tying up lose ends.

[Why?](#why)
==========

I wanted to move my stuff from Digital Ocean to Hetzner for few reasons:

* Digital Ocean is american owned company, Hetzner is german
* They have datacenters in Finland, where I live, thus I have lower ping
* They are cheaper and have better specs for the prices (as of writing this)

I just feel safer when my data recides in same country I live in. Also supporting European companies just feels nice.

That and the cheaper price of course.

[Gitea and my blog](#gitea-and-my-blog)
==========

This was the least painful thing to move.

First I moved my blog. It was pretty easy, just install apache2 and copy the files to `/var/www/` and set up the config.

However I could not get Gitea `dump` command to work to make a proper backup. So I gave up.

Since I already had the most repos on my PC, I just copied the bare repos from gitea's folders to my PC, reinstalled Gitea completely and just.. Pushed the repos back there. Didn't take too long.

[Matrix](#matrix)
==========

This was also a hassle but.. Eh? I don't really even remember what I did.

I just basically reinstalled the whole thing like I mentioned in my older post: [Matrix stuff]({% post\_url 2022-04-01-Playing-with-Matrix-Conduit-and-Synapse %})

But instead of creating all the files from scratch, I copied the homeserver.db over with scp from the other server.

I was dumb at first and tried to copy the file to my own PC then back to the new server but that would've taken ages.

Use `scp` for between server transfers. It's great. Or `rsync`.

[Nextcloud](#nextcloud)
==========

Argh. This took some time.

Again, installed it as usual. Tried to follow this here [forum post](https://help.nextcloud.com/t/migrate-nextcloud-snap-installation-from-one-vps-to-another/85297/9).

It mostly worked, but I had copied my data to wrong place and I had to move it. Then I had to run `nextcloud.occ maintenance:repair` so that everything clicked in the right places.

So when using commands from internet like that, double check them.

[DNS](#dns)
==========

Luckily I didn't have that much problems with DNS. Hetzner has a cool automatic way to get all the DNS stuff, except for my e-mail settings. That I just copy-pasted all the rest.

It just takes time for nameservers to switch around so I had to set both Nextcloud DNS and Hetzner DNS to point in same things.

[Why did it take so long?](#why-did-it-take-so-long)
==========

It took so long because everything is scattered in million places, there's barely any information for your specific problems, etc.

I had to basically take all information on the internet and slap them together in a giant mess, then parse that mess for all the relevant stuff.

I don't want to ever migrate my stuff ever again. If I have to change cloud providers, I'll just download all my shit to my PC and reinstall everything, then reupload back.

Urgh.

Now excuse me while I reinstall Jekyll and all the fun stuff for this blog to the server so I can upload this post.