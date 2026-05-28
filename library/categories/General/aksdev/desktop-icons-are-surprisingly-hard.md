+++
title = "Desktop icons are surprisingly hard!"
description = "I spent past three weeks working on refactoring and fixing legacy code  (the oldest of which was from 2013) that handled positioning Plasma desktop icons, and how this data was saved and loaded.Here's the merge request if you're curious: [plasma-desktop: Refactor icon positioner "
date = "2024-11-08T00:00:00Z"
url = "https://akselmo.dev/posts/plasma-desktop-icons-positioning-refactor/"
author = "Akseli"
text = ""
lastupdated = "2026-05-27T23:22:57.047692069Z"
seen = true
+++

I spent past three weeks working on refactoring and fixing legacy code  (the oldest of which was from 2013) that handled positioning Plasma desktop icons, and how this data was saved and loaded.

Here's the merge request if you're curious: [plasma-desktop: Refactor icon positioner saving and loading](https://invent.kde.org/plasma/plasma-desktop/-/merge_requests/2607)

The existing code worked sometimes, but there were some oddities like race conditions (icon positioning happens in weird order) and backend code mixed in with frontend code.

Now I am not blaming anyone for this. Code has tendency to get a bit weird, especially over long periods of time, and *especially* in open source projects where anyone can tinker with it.

You know how wired earbuds always, *always* get tangled when you place them in a drawer or your pocket or something for few seconds? Codebases do the exact same thing, when there are multiple people writing on things, fixing each others' bugs. Everyone has a different way of thinking, so it's only natural that things over time get a bit tangled up.

So sometimes you need someone to look at the tangled codebase and try to clear it up a bit.

[Reading code is the hardest part](#reading-code-is-the-hardest-part)
==========

When going through old code, especially some that has barely any comments, it can take a very long time to understand what is actually going on. I honestly spent most of my time trying to understand how the thing even works, what is called when, where the icons positions are updated, and so on.

When I finally had some understanding of what was happening, I could start cleaning things up. I renamed a lot of the old methods to be hopefully more descriptive, and moved backend code — like saving icon positions — from the frontend back to backend.

[Screens and icons](#screens-and-icons)
==========

Every screen (PC monitor, TV…) tends to have it's own quirks. Some, when connected with display-port adapter, tell your PC it's disconnected if your PC goes to screen saving mode. Some stay connected, but show a blank screen.

One big issue with the icon positions was that when screen got turned off, it thought there was no screen anymore and started removing items from the desktop.

That's fair. Why show desktop icons on a screen that is non-existent? But when you have a monitor that tells your PC, "Okay I'm disconnecting now!" when the PC says it's time to sleep, wrong things would happen.

This condition is now handled by having a check that if the screen is in use or not. Now when screen is not in use, we just do nothing with the icons. No need to touch them at all.

[Stripes and screen resolution](#stripes-and-screen-resolution)
==========

Our icon positioning algorithm uses something called "stripes."

Every resolution has it's amount of stripes. Stripes contain an array of icons, or blank spots.

So if your screen resolution is, let's say, `1920x1080`, we calculate how many stripes and how many items per stripe will fit on that screen.

```
Stripe1: 1 2 3 4 5 6 7
Stripe2: 1 2 3 4 5 6 7
Stripe3: 1 2 3 4 5 6 7

And so on..

```

But when you change your screen resolution or scale factor, how many icon stripes you have and how many icons fit on each stripe will change.

So if you have one of those screens that looks to the system like it's been unplugged when it goes into sleep mode, previously the stripe amount would change to 1 row, 1 column. And the icon positioner would panics and shove all icons in that `1,1` slot.

Then when you'd turn the screen back on, the icon positioner would wonder what just happened and restore the proper stripe number and size. But by that point it would have lost all our positioning coordinate data during the shoving of icons in that one miniscule place, so instead it would reset the icon positions… and this leaves users wondering why their desktop icon arrangement is now gone.

Here we have to also check for the screen being in use or not. But there were other problems.

[Saving icon positions](#saving-icon-positions)
==========

The prior code saved the icon positions every time the positions changed. Makes sense.

But it didn't account for the screen being off… so the icon positions would get saved while the desktop was in a faulty state. This also causes frustration because someone arranges the icons how they wish, but then screen does something weird and they're now saved in wrong places again.

Our icon positions were updated after almost every draw call, if the positions changed. So this would mean the saving would happen rather often and no matter what moved them.

We had to separate the user action from computer action. If computer moves the icons, we ideally do not save their positions, unless something drastic has happened like resolution change.

The icon positions are saved per resolution, so if you move icons around while they're displayed on a `3440x1440` screen and then change the resolution to `1920x1080`, both will have their own arrangements. This part of the codebase did not previously work, and it would always override the old configuration, which caused headache.

So now we only save icon positions when:

* The user adds or removes a desktop icon
* The user moves a desktop icon
* The user changes the desktop resolution

This makes the icon position saving much less random, since it's done only after explicit user actions.

[Margin errors](#margin-errors)
==========

The last thing that caused headaches with the icon positioning was that the area available on the desktop for icons was determined before panels were loaded. When the panels loaded, they would reduce the amount of space for desktop icons, and that area would constantly resize until everything is ready.

In previous code, this would cause icons to move, which updates positions, which then saves their positions.

So let's say you arrange your icons nicely, but the next time you boot into plasma, your panels start shoving the poor icon area around and the icons have to move out of the way… and now they're all in the wrong places.

This was already partially fixed by not saving when the computer moves the icons around: we just load the icon positions when the screen is in use and we are done with listing the icons on the desktop. Part of the margin changes happen when screen is off.

We still need to fix the loading part; ideally we load the icon area last, so that it gets the margins it expects and doesn't shuffle around while panels are still appearing. But it was out of scope for this merge request.

[Conclusions](#conclusions)
==========

It may not sound like much, but this was a lot of work. I spent days just thinking about this problem, trying to understand what is happening now and how to improve it.

Luckily with a lot of help from reviewers and testers I got things to work much better than it used to. I am quite "all-over-the-place" when I solve problems so I appreciate the patience they had with me and my questions. :D

What I mostly wished for when working on this were more inline code comments. You don't need to comment the obvious things, but everything else could use something. It's hard to gauge what is obvious and what is not, but that kind of answers the question: If you don't know if it's obvious or not, it's likely not, so add some comment about it.

I do hope that the desktop icons act more reliably after all these changes. If you spot bugs, do report them at [https://bugs.kde.org](https://bugs.kde.org/enter_bug.cgi?product=plasmashell).

Thanks for reading! :)

*PS. The funniest thing to me about all of this is that I do not like having any icons on my desktop. :'D*