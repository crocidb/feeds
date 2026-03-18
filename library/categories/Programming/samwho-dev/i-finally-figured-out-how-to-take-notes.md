---
title = "I finally figured out how to take notes!"
description = "I’ve never been good at taking notes. I’ve tried. Oh boy, have I tried. Name a piece of note taking software, odds are I’ve tried it. I’ve even tried going old school with pen and paper. Nothing sticks.Until recently.Some time ago, I learned about Apple’s [Shortcuts](https://apps"
date = "2022-02-14T00:00:00Z"
url = "/blog/note-taking/"
author = "Sam Rose"
text = ""
lastupdated = "2025-10-22T08:59:06.853842276Z"
seen = true
---

I’ve never been good at taking notes. I’ve tried. Oh boy, have I tried. Name a piece of note taking software, odds are I’ve tried it. I’ve even tried going old school with pen and paper. Nothing sticks.

Until recently.

Some time ago, I learned about Apple’s [Shortcuts](https://apps.apple.com/gb/app/shortcuts/id1462947752) app. It’s an app on iOS, iPadOS, and MacOS that allows you to automate actions between apps. It’s a little like [IFTTT](https://ifttt.com). I played with it and made a few fun things. I created a keyboard shortcut that could turn my lights on and off, for example. I didn’t take it much further than that.

Since the start of the new year, I’ve been taking on more responsibility at work. This has meant an increase in meetings, and an increase in me being responsible for making sure things are moving forward. This means I often have to follow up on things after a meeting, and I would sometimes forget to do this. This would not do, I thought, and decided it was time to start taking meeting notes.

I had some requirements in mind:

1. I want to be able to tag notes. I’d like to track things like date, who was there, what the key topics were, and be able to search based on these tags.
2. I need the ability to create action items, and be able to ask “what action items have I not yet done?”
3. It has to be super easy. I want to be able to jump into a meeting and have my meeting notes ready to go.

Turns out, combining Apple Shortcuts with [Bear](https://bear.app) hits all of these requirements.

[\#](#shortcuts) Shortcuts
----------

I have two Shortcuts I use to make my note taking life much easier:

1. A shortcut that creates a meeting note.
2. A shortcut that opens or creates a daily “scratch” note, for note taking outside of meetings.

The meeting note shortcut does the following:

1. Looks in my work calendar for the most recent meeting that started in the last 30 minutes.
2. It then creates a note with the meeting title as the note title, and it adds tags for each person who accepted the calendar invite. It also adds a tag for the current date, my current location, and the current temperature outside. Just a bit of fun.

I trigger this shortcut by typing cmd+ctrl+m. Any meeting I go in to, the first thing I do while I’m waiting for people to arrive is hit that shortcut, the note pops up a few seconds later, and I’m ready to take notes.

The daily scratch note shortcut is much simpler. It creates a note with the current date as the title, and all of the same non-meeting-specific tags as the meeting note: date, location, temperature. The only difference is it first searches for a note with the current date as the title, and if it finds it it opens that instead of creating a new one. I trigger this shortcut with cmd+ctrl+s.

[![My daily scratch note shortcut](/images/shortcut.png)](/images/shortcut.png)

After a second or two, a note that looks like this opens up on my screen:

[![A daily scratch note](/images/note.png)](/images/note.png)

[\#](#bear) Bear
----------

Other than being a beautiful demonstration of not implementing every single feature your user base asks for, the primary thing Bear excels at in my workflow is TODO management.

At any point in any note, you can create a TODO. This manifests as a list item with a checkbox, much like GitHub’s TODOs. You can have as many TODOs as you want in a note, and Bear has a section of its navigation menu that will show you all notes with outstanding TODOs.

[![A daily scratch note with TODOs](/images/note-with-todo.png)](/images/note-with-todo.png)

[\#](#conclusion) Conclusion
----------

I’ve been using this new system for about a week now, which is longer than I’ve been able to stick with any other note taking system. Nothing else has ever felt as natural to me as this does.

The key outcome, though, is that I feel more on top of things now. I’m not dropping the ball on things people ask me to do in meetings. People don’t have to chase me for things as much, which makes me feel good and I’m sure it makes them feel good as well.