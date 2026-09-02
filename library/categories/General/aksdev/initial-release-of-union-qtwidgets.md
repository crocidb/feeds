+++
title = "Initial Release of Union QtWidgets"
description = "It has begun.After couple months of work, I have now finally managed to cobble together the QtWidgets side of Union.This means that your QtWidgets apps, such as Dolphin, KMail, Kate etc. can "
date = "2026-08-28T18:34:45Z"
url = "https://akselmo.dev/posts/union-qtwidgets/"
author = "Akseli"
text = ""
lastupdated = "2026-09-01T19:33:12.595878730Z"
seen = false
+++

It has begun.

After couple months of work, I have now finally managed to cobble together the [QtWidgets side of Union](https://invent.kde.org/plasma/union/-/commit/0131e503787c77620e5bad2390165247590d1cf7).

This means that your QtWidgets apps, such as Dolphin, KMail, Kate etc. can now use the Union CSS files as the source of their styling.

**However, temper your expectations, as this is the first initial release!**

[<img src="https://akselmo.dev/assets/images/unionwidgets/dolphin.png" width="300"> ](https://akselmo.dev/assets/images/unionwidgets/dolphin.png)[ <img src="https://akselmo.dev/assets/images/unionwidgets/demo1.png" width="300"> ](https://akselmo.dev/assets/images/unionwidgets/demo1.png)[ <img src="https://akselmo.dev/assets/images/unionwidgets/demo2.png" width="300"> ](https://akselmo.dev/assets/images/unionwidgets/demo2.png)[ <img src="https://akselmo.dev/assets/images/unionwidgets/demo3.png" width="300"> ](https://akselmo.dev/assets/images/unionwidgets/demo3.png)

![My lizard fursona making an smile face.](/assets/images/emotes/smile.png)

Do note that there are visual bugs and oddities! I'm still working on things!

So yes, as you can see, some things look off. Not Breeze at all! Some things are just different, some other things have wrong colors.

These are all fixable and I will do my best to get as many things as possible fixed for the Plasma 6.8 release.

But some other oddities are kind of expected: This is the first time ever Breeze QtWidgets and QtQuick style have **same shared source-of-truth** as an easily editable file! (Excluding colorschemes.) So some of these designs are made with QtQuick in mind, so they can look a bit off in QtWidgets.

I'll go through here what I did and what still needs to be done, but this was a huge undertaking, so I'm having a small celebration for the very first release of this. :)

[Hold on, can I try it!?](#hold-on-can-i-try-it)
----------

Yes! It should be released in Plasma 6.8, unless someone tells me no. As of writing this, nobody has said no.

You can make your own CSS files and see them affect QtWidgets apps too. Just expect some breakage and report all the bugs!

Go crazy with the themes. Try everything. Bring back whimsy to computers. Tell us about the theming experience in general.

**Have fun.** Your computer should be just as cool as you are.

The rest of this blogpost is more a technical rant and ramble as I am venting all the exhaustion over this thing, lol.

[QStyle is difficult](#qstyle-is-difficult)
----------

QStyle themes, which are the styles that modify the look of QtWidgets applications, are not easy to work on. Most themes I've seen take an existing one, such as Fusion or Breeze and make their changes on top of those.

But for Union, we had to start from scratch. I took the very basic base of QStyle, which is called QCommonStyle (kind of a fallback theme), and began building on top of that.

Then, there was multiple parts:

* Figure out a way for the QStyle to paint things using CSS
* Build a hierarchy of the style by reading the CSS data and applying it to QStyle world
* Create a completely new set of element files we use
  * The QStyle themes are very unwieldy and hard to work on otherwise

* Go through *every single element* and ensure they read all data from the CSS correctly
  * And ensure the style stays backwards compatible!
  * This is still ongoing process, most bugs lurk here. :P

* Figure out how to use Union layouting system within QStyle elements
  * This is also buggy, as QStyle is more "rigid" with layouting
  * Applications expect very specific layouting from QStyles over the years it has existed
  * So any application that deviates from those expectations will look broken

* Caching so that the style is performant
  * Here Arjen helped me a lot, thank you!

* And a lot of other stuff I have already forgotten..

Thankfully [redstrate](https://redstrate.com/) had already made the painting part for the very simplified proxystyle (which took Breeze and modified it a bit), so I did not have to modify that too much. I mostly had to poke at it to make it work with my hierarchy system. So thanks! \<3

It's hard to put it into words how much work there was involving the actual QStyle itself and creating a sort of "framework within a framework" so that the Union rules would translate better for the QStyle rules.

For example, when a widget, such as a PushButton, wants to be styled, it informs the QStyle about it with something called `QStyleOptionButton`. This class holds bunch of information about the button, and the style can use that information to decorate it better. But of course, the styleoption does not necessarily need to exist. If there is no styleoption, the style can use the `QWidget` itself for style information. But even that can be empty! And at that point, you do not know how to style something, since you do not even know what it is.

What made matters even worse was that the documentation just Does Not Exist.

Sure, there is the [QStyle](https://doc.qt.io/qt-6/qstyle.html) documentation, but it is more about "what" and not "why" or "how." I could have used somekind of tutorial for how to make a QStyle from scratch, but I could not really find anything, except super old information from Qt4 times. So very very often I resorted to just reading the raw source code itself, which is also not very easy to read. There is a lot of variables that are just named `pw` or `w`. So even the codebase is very undocumented..!

Most of the work had to be done with trial and error! "What happens if I change this value?" "What if I use debugger to follow this variable, where will it lead?" I also used Breeze as my information bank a lot, as it had gone through it all before. That was very helpful.

But the lack of documentation and old codebase nobody seems to really touch anymore, much less document, was the thing that made this all take so long time.

![My lizard fursona making an grumpy face.](/assets/images/emotes/grumpy.png)

Not to forget the completely misleading names in the API. "PM\_MenuPanelWidth" is not the width of the panel, but actually "Border width (applied on all sides) for a QMenu."

The total work was 9000 lines of code. Yes. And all of it is required. Lot's of boilerplate, as QStyle seems to love boilerplate. Pretty much all of it is artisanal, handwritten slop by yours truly.

I had to painstakingly go through all the elements we're drawing and sizes we're calculating, then turning it into an `Element` that we can easily modify without modifying the whole style.

If you have managed to make a working QStyle theme completely from scratch, going through every little detail, I salute you. **This is some of the toughest stuff I've ever worked on.**

So in summary: I had to backwards engineer a lot of stuff to figure out what order we even draw some things, or what size affects what in the actual application. Then make it work with Union core and CSS.

![My lizard fursona making an scream face.](/assets/images/emotes/scream.png)

DOCUMENT YOUR API PLEASE I BEG YOU

[Next steps](#next-steps)
----------

Next up is testing and bugfixing.

There's already a lot of bugs being found here: [https://invent.kde.org/plasma/union/-/work\_items/205](https://invent.kde.org/plasma/union/-/work_items/205) And more will be found. There will be weird edgecases where application expects everything to work like in Fusion style, as it's the default Qt style, but Union does not handle that situation yet well.

So here's what I need from you, dear reader: See what breaks. Document it. Make a [bugreport](https://bugs.kde.org/). Let's find these weird things and figure them out, so that the QtWidgets side can finally be themed without so much pain.

Of course, there's also the design side: Like I mentioned earlier, the Breeze CSS we have now is very QtQuick oriented, so QtWidgets applications can look and feel odd.

Something to keep in mind though is that QtQuick and QtWidgets applications will likely never look the exact same, due to the way how they work and are drawn. But we can try to make the QtWidgets style work reliably first and then try to make it look as close to QtQuick side as possible.

My todo list is pretty much following:

* Fix as many bugs as I can before 6.8 release
* Figure out a layouting system for the QStyle that is robust
  * Even if it can't do all the tricks QtQuick can

* Make sure the QStyle is backwards compatible with as many applications as possible

So, more work. A lot of work.

But at least we can now properly start that work, which is what this first release is about. Getting the tedium out of the way, so the interesting parts can begin.

And boy how much tedium that was. I would never do it again, but honestly.. It was *fun* at times. Super interesting to figure out. Like a very tough puzzle game. I'm happy with what I've achieved here, even if it's not perfect yet. And I hope all this work is useful for you too, dear users. I really want to see the crazy things you all will come up with.

Thanks for reading!

*ps. Again sorry if this reads all over the place, I just needed to get it out of my system.* *I don't like writing drafts much, so I just write a braindump and go.*

[](https://brid.gy/publish/mastodon)