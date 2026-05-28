+++
title = "KURLNavBar and me"
description = "I made a change to the KURLNavBar according to old mockup, since we hoped it would be easier to use.This was a bad idea and made many people angry, at least on [Reddit](https://old.reddit.com/r/kde/comments/1jdpafa/ne"
date = "2025-03-22T00:00:00Z"
url = "https://akselmo.dev/posts/visual-woes/"
author = "Akseli"
text = ""
lastupdated = "2026-05-27T23:22:57.045880783Z"
seen = true
+++

I made a change to the [KURLNavBar according to old mockup](https://invent.kde.org/frameworks/kio/-/merge_requests/1793), since we hoped it would be easier to use.

This was a bad idea and made many people angry, at least on [Reddit](https://old.reddit.com/r/kde/comments/1jdpafa/new_dolphin_location_bar_is_really_bad/).

Seems to be a [recurring theme](https://akselmo.dev/posts/you-dont-need-to-yell/) with my visual changes, though this time wasn't nearly as bad as that was.

Anyway, I wanted to go over the process around it. Maybe someone else than me can learn something from this.

[So, what happened](#so-what-happened)
==========

When implementing this [mockup](https://phabricator.kde.org/T12308), I was expecting this was something people had been waiting for. It looked good to me, and since we've been wanting to freshen up Dolphin a bit, it felt like a good way to start. (This change wasn't to Dolphin, but our framework, so any apps that would use this navbar would get the changes.)

Another reasoning for changes was that there has been many many instances where people didn't even know this field could be clicked! They didn't know these items are buttons, for example on touch devices. That's where the background idea came from. And then make the folders look like clickable items, so people know that, well, they're not there just to look pretty.

The work started well enough, though I spent tons of time refactoring and trying to understand the old codebase. On top of that, we wanted to make sure it was as close to perfect as possible.

So I added a background first, which was relatively easy, then started modifying the buttons.

I wanted to use chevron `>` style separators between the folders, but there was no easy way to create a button with this shape. Sure, we could do it well for Breeze but any other Qt theme might render it weird and wrong, and that will just cause people report more bugs. So I settled with regular separators. It was a compromise, but I admit it was a rather bad one in the end.

I worked so much on this part, trying to figure out a good way to make the new buttons work, following the mockup as close as possible, and I couldn't see the usability issues. This was because I was so entrenched in the work I couldn't practically "see the forest for the trees."

I had tons of good feedback, from visual designers and the like. I wanted to follow everyones advice, but had to make compromises at some places.

Eventually I got somewhere where we all just liked it enough to push it out to the world.

And yeah, the whole process took \~1 month. You would think this is a simple change, but *it never is that simple.*

[The feedback](#the-feedback)
==========

I was expecting some pushback, as it always happens with visual changes, but I didn't expect it to be this.. energetic?

Sadly, most of the feedback was "it ugly" which *gives me nothing actionable to work on!*

Saying "it looks bad" doesn't help me work on it. It doesn't help me fix anything. I think that frustrated me the most: I wanted to help to fix the situation, but this kind of feedback just makes me wonder endlessly how to fix it.

Then I saw some actually actionable feedback:

* The arrows showed the hierarchy better than the separators
  * I actually agreed with this afterwards, but I couldn't get the chevron thing working as mentioned above
  * I opted for separators because I wanted to keep the button look.

* Some thought they were tabs and kept misclicking them instead of tabs
  * This was very good feedback and made me rethink the situation

I am glad I saw those two things in the sea of "it ugly." It helped me to restructure the whole thing in my mind and start fixing.

So yeah I do read your feedback. :P

[Out with the new, in with the new but old](#out-with-the-new-in-with-the-new-but-old)
==========

Here's the new iteration: [KUrlNavigatorButton: Use arrow as separators ](https://invent.kde.org/frameworks/kio/-/merge_requests/1842)

I saw the value in the old navbar with the arrows, so I brought them back. I wanted to keep the icons, because I liked the visual flair they added, but they also added clutter. If I could have had the chevron style buttons as shown in the mockups, I would have likely kept the icons.

Instead of reworking the old code, I decided to refactor it to best of my abilities: There was some things we didn't need anymore, and some things were a bit buggy due to miscalculations, so I changed things around and got them into good place.

I wanted to remove some items I thought people wouldn't use, but in fact I was told quickly that these are very good things to have, so I kept them around. And this is also the kind of feedback I like to see!

We're creating custom button components here, so we couldn't utilize more "standard" buttons. That's why there was a lot of math and tinkering with padding involved. I did try to utilize the QStyle methods here though so that it would look okay on any theme, not just Breeze. There will likely be cases where it won't look perfect in custom themes, but utilizing QStyle allows us to at least try.

After the refactoring, it got easier to work on this and I started to wrap it up with rapid pace. Instead of a month, it took me around a week.

It's not merged yet, but hopefully will be soon. I've been daily driving this iteration on my system and haven't had issues so far.

[So what's the big deal?](#so-what-s-the-big-deal)
==========

Yeah, so, why the big deal? Why write a blogpost about this?

I didn't expect this change affect so much to my psyche, so I wanted to talk about this. Maybe some other FOSS devs can relate. I think it's something we should discuss more often, than just the raw results.

I like to think I am good at taking feedback. But after working on something for a month, then having to throw it all away even I was told it was ok.. It hurt! It was a lot of time spent on a thing that I hoped would make people happy.

I care about the stuff I do. A lot. So yeah, I'm gonna feel hurt when my work is disliked. And that's okay. Anyone who tells me otherwise can pound sand. Rejecting emotions like these just gets you in worse state over time. I speak from experience here.

It's easy to say "just ignore the negative feedback" but I literally can't. I am so into working on these things, I love working on KDE applications.. So it does hurt when something that has become such an extension of my own creativity and passion gets disliked... *Even when I haven't directly worked on it!*

Sure, this all is my problem to work on and I don't expect anyone to treat me with silk gloves and pat my head. Just wanted to explain it, that's all. Maybe someone can relate to this and doesn't feel so alone with the problem. I had the same thing when my games got insulted, where I was even more emotionally attached to the things, because I had made them myself completely.

Sadly, I kept dwelling on it a bit longer than I wished.. But working on the new version was a great outlet. I noticed old problems, fixed them and the new version is better in many ways.

I've noticed that I am not annoyed/upset about negative feedback itself, but how it's conveyed. Negative feedback will always be demotivating and bothersome, but when the negative feedback is written politely and has actually actionable items, it can be rather motivating as well. The "it ugly" feedback has stronger demotivating feedback, because it's not actionable.

I think the key takeaway from all of this is that **mockups can get stale!** If people like some older mockup, then you change to it suddenly, people may get very frustrated about it: They either forgot the old mockup, had never seen it, or they ended up disliking it in actual use.

So it's good idea to freshen the mockup before iterating on it: Ask the visual designers about it one more time, maybe share it with the users and ask their opinion on it. Sure you can't gauge everyone's opinion on it, but at least it shouldn't be that sudden to everyone.

This whole ordeal has been very tiring, but that's my own fault for not really allowing myself to take a break from it. I get hyperfixated easily, but again, that's my own problem.

So yeah, slight burnout by all of this. I'm sure I'll be fine, especially after this is merged so it can stop living rent free in my head.

I'm not blaming anyone for anything. Not even myself. Things happened and we all need to chill.

[Hopes for future](#hopes-for-future)
==========

There will be many many other times where I or someone else will get it wrong the first time.

So, share your feedback, but don't immediatelly go for the nuclear option of removing it all. With FOSS stuff, we don't have these huge QA teams that go yay/nay for something.. But everyone is welcome to join help in that regard!

Help us help you with actionable, polite feedback.

And thank you so much for everyone who has done so!

Now I'm going to try to just let go of this all. It's weekend anyway and I got bunch of games waiting to be played.

Thanks for reading as always!