+++
title = "Forgejo webhook to auto-update my blog and my frustrations"
description = "Preface: I am really bad with servers. I actually dislike working with them, most of the time. Setting up ports and proxies and other stuff just really frustrates me. It's like washing dishes by hand: I just want to get it over with.I wanted my blog to automagically update wh"
date = "2025-05-11T00:00:00Z"
url = "https://akselmo.dev/posts/forgejo-webhook-to-update-my-blog/"
author = "Akseli"
text = ""
lastupdated = "2026-05-27T23:22:57.036310600Z"
seen = true
+++

Preface: **I am really bad with servers.** I actually dislike working with them, most of the time. Setting up ports and proxies and other stuff just really frustrates me. It's like washing dishes by hand: I just want to get it over with.

I wanted my blog to automagically update whenever I make a git push.

My first iteration was "have a script poll the git repo every minute and then update." Works, but is bad for everyone involved.

So I looked into setting up [Forgejo webhooks](https://forgejo.org/docs/v1.19/user/webhooks/) to work with this on my own server. I know Codeberg has their own site thing, but I have my own setup for everything on my own server, since I don't want my blog repository and building and whatnot to be tied to singular git forge.

[Blog setup](#blog-setup)
----------

My blog runs in a random Debian 12 VPS somewhere in Germany. It uses [Zola](https://github.com/getzola/zola) for generating the site.

At some point I just may write my own generator because why not.

Anyhow, before this webhook automation, what I used to do is:

* Write article
* SSH to the server
* Run [./deploy.sh](https://codeberg.org/akselmo/aksdev_zola_blog/src/branch/main/deploy.sh)
* Logout

It's not really much work to do, but when I just want to write something, it was bit annoying to do that, so I often ended up not even writing.

I wanted to automate it so I can allow myself to write shorter posts, and encourage myself to write more often.

[Setting up my server](#setting-up-my-server)
----------

First I wanted to find out a thing that would allow me to listen for webhook and then run a command.

[Webhook](#webhook)
----------

I found this thing that is in Debian repos as well: [webhook](https://github.com/adnanh/webhook/)

It was pretty straightforward to set up. I ended up with a JSON file the webhook binary uses, which looks like this:

```
[
	{
		"id": "deploy-blog",
		"execute-command": "./deploy_blog.sh",
		"command-working-directory": "/root",
		"trigger-rule":
		{
			"match":
			{
				"type": "value",
				"value": "Alright then, keep your secrets",
				"parameter":
					{
						"source": "url",
						"name":"secret"
					}
			}
		}
	}
]

```

The `deploy_blog.sh` goes to the blog folder and runs the `./deploy.sh` I linked earlier.

Then, I run the webhook thing with `webhook -hooks hooks.json -verbose`. Of course, like a proper sysadmin I am, I am running this thing in `screen` because I'm super lazy and I haven't written systemd unit files yet for this.

After that, of course, I need to open the port the `webhook` tool uses: `sudo ufw allow 9000`.

[Apache2](#apache2)
----------

My server setup is ancient and uses Apache2 to set things up. I could move to Nginx, I don't really care what it's using, I equally dislike using either.

You have to understand that I *really really rather be doing anything else than this*. I don't care about what is the best tool. I care about what works with the least amount of pain and misery. I am not going to change shit around because of internet comments. So you can hold those in.

To make sure Apache2 can see the messages sent to this webhook program, this is what I did to it in my website config.

```
<VirtualHost *:9000>
	ServerName akselmo.dev
	ServerAlias www.akselmo.dev

	ProxyPreserveHost On

	ProxyPass "/"  "http://0.0.0.0:9000/"
	ProxyPassReverse "/"  "http://0.0.0.0:9000/"
</VirtualHost>

```

I had no idea if it works or not, but with trial and error I got it to working with the above. Yay!

[Codeberg hook](#codeberg-hook)
----------

In Codeberg, I added the new webhook to my repo settings:

* Target URL: `http://akselmo.dev:9000/hooks/deploy-blog?secret=Alright then, keep your secrets`
* HTTP method: `POST`
* POST content type: `application/json`

Rest I kept empty or in defaults. Everything than target URL is default, really.

The test delivery button in the webhook page made the webhook binary on my server print text. All is good.

I wanted to use the `Secret` field for the secret key but I couldn't figure out how.

[Ending rant](#ending-rant)
----------

And that's it. I am annoyed but I got it to work. This kind of stuff is really not for me, I rather pay someone else to do server stuff for me.

**Sysadmins are the unsung heroes of our industry.** I have no idea how you lot do this without wanting to punch a wall every five seconds. Even the most basic shit I just did here was really frustrating to me. You have all my respect, and more.

Maybe it's just me. I'm way happier writing native programs and not interacting with the web that much with them.

Setting this up took way longer than I wanted, but at least it's done now. Maybe this post will help equally frustrated person.

Thanks for reading this bad post. lol