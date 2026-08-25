+++
title = "Apple Papercuts Summer Edition"
description = "This is a short follow-up to my Apple Papercuts piece, wherein I bunched together a few more annoyances that I’ve come across while using my iPad Pro extensively on vacation.If you neede"
date = "2026-08-22T11:47:00Z"
url = "https://taoofmac.com/space/blog/2026/08/22/1147?utm_content=atom"
author = "Rui Carmo"
text = ""
lastupdated = "2026-08-24T15:49:20.645449788Z"
seen = false
+++

This is a short follow-up to my [Apple Papercuts](/space/blog/2026/05/18/1320#apple-papercuts) piece, wherein I bunched together a few more annoyances that I’ve come across while using my [iPad Pro](/space/blog/2022/09/11/1850#the-m1-ipad-pro) extensively on vacation.

If you needed any more proof that [Apple](/space/com/apple) doesn’t really do QA testing, I think just two of these would be enough. And I’ve confirmed they are all still there in 26.6.1, freshly released last week.

[

The Spotlight Near Miss
----------

](/space/blog/2026/08/22/1147#the-spotlight-near-miss)

At first, I thought this was a hardware problem. My brand new [iPad Keyboard Cover](/space/reviews/2026/05/23/2130#logitech-combo-touch-four-years-later) had been giving me some odd glitches of late (I keep having to physically reconnect it for keypresses to register), but after a few days of using a desktop Bluetooth keyboard I am positive that all the input glitches I’m having are a software problem.

One of the main symptoms is that invoking Spotlight with `Cmd+Space` works but then typing *inside* Spotlight fails to register. But *a second attempt works*, so my attempts at invoking Mail every day have the same outcome:

* First attempt at `Cmd+Space, M`… does nothing useful–Spotlight appears but doesn’t show “m”
* Hit `Cmd+Space, M` again–“m” appears and, lo and behold, “Mail (open)” is suggested (after an embarrassingly long pause, but hey, at least it happens)

Yes, I could tap the icon. But if the above doesn’t convince you that *nobody at Apple actually tested this*, then I don’t know what would. Oh, wait, I have a couple more:

[

The North Star Is Portrait Orientation
----------

](/space/blog/2026/08/22/1147#the-north-star-is-portrait-orientation)

Another interesting bug that has surfaced recently is that nearly every time I use a Bluetooth mouse with my iPad when it’s plugged into an external display, *iPadOS swaps the X and Y axes*, which is just… ridiculous.

The steps are always the same:

* Wake up the iPad while it’s plugged into an external display (typically by swiping the Home Screen up so that Face ID begrudgingly notices I’m here).
* Turn the mouse on, move it up
* Wonder why the cursor is moving left

You know why that happens? *Because my iPad is in landscape mode, not portrait*, and when the mouse is detected, iPadOS *does not take that into account*. But the Home Screen was in landscape mode. I swiped “up”. This is not fucking rocket science, guys.

And, again, for this one there are zero excuses.

[

SpringBoard Needs Frequent Breaks
----------

](/space/blog/2026/08/22/1147#springboard-needs-frequent-breaks)

Every now and then, while my iPad is plugged into an external display, my entire iPadOS “session” crashes–black screen, emergency spinner on the iPad display, everything *gone* (well, *fake* gone, just like the fake iPadOS multitasking).

Over my break, I mostly ran [Reeder](/space/apps/reeder), [Obsidian](/space/apps/obsidian), [Mail.app](/space/mail) and [Safari](/space/apps/safari), with some cameos by various terminal emulators and the usual social media garbage. None of them are particularly taxing, and the vast majority of my external display time was spent writing or looking up references.

This is not a stability story. It’s not even a reliability story. Having your session wipe out like this is simply unacceptable.

[

You Want to Do What With Your Windows?
----------

](/space/blog/2026/08/22/1147#you-want-to-do-what-with-your-windows)

This one’s a twofer: We all know iPad window management is sub-par–[it’s not news](/space/blog/2025/07/25/2200#my-take-on-the-ipados-26-beta)–but there are two things that annoy me to no end:

* Swiping up on your iPad display to flip through applications *completely kills keyboard input on the external screen* until you `Cmd+Tab` back to the application you were typing in
* You cannot even *think* about picking which windows get assigned to quarter screens.

This last one is tantamount to the [Odyssey](https://www.imdb.com/title/tt33764258/?utm_campaign=unsolicited_traffic&utm_medium=web&utm_source=taoofmac.com), and it should probably be on [IMAX](https://en.wikipedia.org/wiki/IMAX?utm_campaign=unsolicited_traffic&utm_medium=web&utm_source=taoofmac.com) due solely to its dramatic plot.

After painstakingly inching your mouse towards the almost invisible semaphores, clicking on them to make them actually usable *even though they pulse and expand when moused over just to tease you*, you then have to play the green button roulette.

That may, according to its internal whims and in a complete travesty of [Apple](/space/com/apple) UX polish (that we, the elders, remember from ancient times), either maximise the current window *or* (maybe) show you a menu.

If you are worthy of the gods (or just plain lucky), you will finally get a window layout menu and get to pick “Fill and Arrange”, which *has completely random behaviour*, making it impossible to figure out where your windows will end up, and leading you to believe you have any choice in the matter when you later try to arrange them manually.

And no, you can’t have a right-first half-screen arrangement, either. You are not *that* worthy.