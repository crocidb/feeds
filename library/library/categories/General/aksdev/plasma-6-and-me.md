+++
title = "Plasma 6 and me"
description = "I'm bit late to the train of Plasma 6 related posts... But anyway. I will go through some things I did.For me working on Plasma 6 was pretty fun, I learned a lot of new things and fixed bunch of bugs and crashes.The most resourceful ones can find my merge requests, but I am too l"
date = "2024-03-31T00:00:00Z"
url = "https://akselmo.dev/posts/plasma-6-and-me/"
author = "Akseli"
text = ""
lastupdated = "2026-05-27T23:22:57.064516303Z"
seen = true
+++

I'm bit late to the train of Plasma 6 related posts... But anyway. I will go through some things I did.

For me working on Plasma 6 was pretty fun, I learned a lot of new things and fixed bunch of bugs and crashes.

The most resourceful ones can find my merge requests, but I am too lazy to link them all.

[Things I did](#things-i-did)
----------

Most of the things I did were a lot more in the background. I hunted down a lot of bugs and crashes, and tried to fix them myself or helped others fix them, in various projects, such as:

* Dolphin
* Plasmashell
* Kwin
* KNS
* And probably a lot of more I have already forgot... :D

But there was A LOT stuff: Around 100 merge requests in total! Pretty much all of them got in, thanks to all the reviews and education other KDE developers provided to me! :)

Again, **thanks to everyone who has helped me to work on KDE projects!** Thanks for your patience with me and all the knowledge you have parted to me. ❤️ I'll keep doing my best helping KDE projects, be it bug hunting or feature creation.

I have to say my software testing background has been very useful when it comes down to hunting down bugs, and I've learned a lot of things about Qt, C++ and QML. Still got much more to learn though, but that's what makes me so excited about programming!

I think one of the most useful things I've learned is how to use GDB. I can't provide anyone a crash course (at least in this blog post) but it is essential when hunting down weird bugs in plasmashell for example. I love debuggers integrated to editors like using LLDB-DAP in Kate, but sometimes GDB in terminal is all you can use, so it's good idea to learn to use it!

One big thing I worked on with others was fractional scaling related stuff: I didn't do any of the Kwin stuff around it, but I hunted down some weird bugs with window decorations having some weird gaps in them when windows are specific size. Hunting down all these bugs and weirdness took long time, and we're still looking into it, since it seems to be different in every system.. Floating point numbers and computers are very weird combo.

Another more visible thing I did was unifying separator colors and other items, you can find an issue about it here: [Frame and outline color consistency and high-contrast setting changes](https://invent.kde.org/teams/vdg/issues/-/issues/38). I have been bothered by the random differences between some elements, which can be especially noticeable in darker colorschemes, so I finally sat down and combed through related codebases. There's likely more to fix though, but there is now easy way for us to add high-contrast support for outlining elements! It just needs doing, and I haven't had the time.. Yet. :)

[Things I learned](#things-i-learned)
----------

* GDB is a life saver
* Write down notes. All the time.
  * Journaling is a good idea!

* Working in open source is a lot about the social aspects!
  * Be nice to people! Duh!
  * But also don't let people walk over you!
  * Listen to others, and don't be afraid to share your opinion.
  * Ask many questions and write down the answers.

* Be patient
* Bug triaging is tough, but very important!
* Remember to rest (I'm bad at this)

[Things I will do in future](#things-i-will-do-in-future)
----------

I will continue hunting down various bugs and crashes and fixing them whenever I spot some, or something is raised to me as "hey this looks like something you could do."

I have also started working on couple things related to remote desktop:

* [rdp: Proxy and Gateway settings](https://invent.kde.org/network/krdc/-/merge_requests/93)
* [Simple KCM for KRDP](https://invent.kde.org/plasma/krdp/-/merge_requests/16)

Last but not least, I have looked into facelifting our dear Breeze theme, just a lil bit. Nothing drastic, some tell me they don't see any change and some do. But hopefully it would make Breeze look just a lil bit "softer" and "friendlier." :) You can see them here: [Slightly rounder elements, slightly lighter outlines](https://invent.kde.org/plasma/breeze/-/merge_requests/449)

---

All in all I am very happy with my current job working on KDE projects, fixing bugs and creating new cool things. I also kind of enjoy being a jack-of-all-trades (master of none), since I get to do a lot of different kinds of stuff, from something more "background" like KWin and plasmashell to something more visible like Breeze and Dolphin. Maybe eventually I will specialize around something, but for now I am bit all over the place which is fine by me lol.

I hope that some of my work has helped you as well. :)

I'll keep doing my best and learning more. (And hopefully write more blogposts.. lol.)

Thanks for reading!