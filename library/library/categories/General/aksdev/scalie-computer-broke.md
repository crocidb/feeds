+++
title = "scalie.computer broke"
description = "Update: Found the culprit, see here: https://akselmo.dev/posts/they-broke-my-server/My site https://scalie.computer/ just broke. I don't know what happened exactly.I was just minding my business and we"
date = "2026-03-03T23:35:43Z"
url = "https://akselmo.dev/posts/scaliecomputer-broke/"
author = "Akseli"
text = ""
lastupdated = "2026-05-27T23:22:56.987310517Z"
seen = true
+++

Update: Found the culprit, see here: [https://akselmo.dev/posts/they-broke-my-server/](https://akselmo.dev/posts/they-broke-my-server/)

My site [https://scalie.computer/](https://scalie.computer/) just broke. I don't know what happened exactly.

I was just minding my business and went to check on it. It had crashed for some reason, the postgresql server/docker/thing was erroring out like a lot.

Then I decided to fix that issue in the random file that broke it. I have no idea why it does that but whatever: [https://codeberg.org/akselmo/scaliecomputer/commit/57252f9cd0dceb84df089e39f89f48e1190db4a9](https://codeberg.org/akselmo/scaliecomputer/commit/57252f9cd0dceb84df089e39f89f48e1190db4a9)

I then ran `mix ecto.setup` as the guide says here: [https://docs.linkhut.org/installation.html](https://docs.linkhut.org/installation.html)

I have had to do that before. Then I restarted the server.

![My lizard fursona making an sad face.](/assets/images/emotes/sad.png)

And boom. Gone. All our links, gone. :(

I got the links back from a friend, since there wasn't many yet and added them back.

I am still open for inviting people here but I can't promise the app still works fine.

Now sure, I probably did something wrong but...

![My lizard fursona making an angry face.](/assets/images/emotes/angry.png)

Data should never be deleted like that???!

[Write my own maybe?](#write-my-own-maybe)
----------

If it breaks again (or I get super bored), I'll just write my own thing:

* Users can only send links
* Links need a title
* Links need tags
* Links can have notes
* Links can be liked
* Frontpage is just stream of links
* There is popular links tab
* Use sqlite as database because fuck anything more complicated
* Same link cant be posted twice
* Avoid JS like the plague it is (cant promise complete no-js but anyway)

Likely will use flask for it, since I actually know how to work with Python (usually).

Ugh, anyway, that's why things are weird if you use the site. Thanks for sticking with me. I'm better with native apps, this web stuff is scary.

![My lizard fursona making an grumpy face.](/assets/images/emotes/grumpy.png)

And yeah you'll need to create an account again, sorry..

[](https://brid.gy/publish/mastodon)