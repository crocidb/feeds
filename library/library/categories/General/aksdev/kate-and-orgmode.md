+++
title = "Kate and OrgMode"
description = "I have a very.. unusual notetaking and task setup with Kate, using Orgmode files. I wanted to showcase it and explain how it works, maybe someone else has similar needs.Here's a small screenshot of my journal notes, I blurred ou"
date = "2024-07-07T00:00:00Z"
url = "https://akselmo.dev/posts/kate-and-orgmode/"
author = "Akseli"
text = ""
lastupdated = "2026-05-27T23:22:57.061372629Z"
seen = true
+++

I have a very.. unusual notetaking and task setup with [Kate](https://kate-editor.org/), using [Orgmode](https://orgmode.org/) files. I wanted to showcase it and explain how it works, maybe someone else has similar needs.

Here's a small screenshot of my journal notes, I blurred out some things I didn't want to share.

![Screenshot of my Journal 2024 org mode notes where many items are blurred out](/assets/images/kateorg.png)

[Why OrgMode?](#why-orgmode)
==========

I actually prefer markdown much more. I enjoy writing markdown files and it just works in most editors. However, there is zero markdown note taking apps on android, that allow me to **sync from my nextcloud** *and* have **notifications**.

I write very journal style notes. I have one big journal file (used to be a file per day before), where I write down all the interesting things that happened, plus most importantly, my work tasks.

I tried to use calendar with tasks before.. But theres way too much context switching between notetaking apps, calendars, tasks (and on android you have to have two apps for tasks and calendar!!!). I was drowning in various apps and windows, constantly hopping around..

All I wanted to do was write down a task in my journal, then have that task notify me on my phone and on my desktop whenever it was scheduled.

So eventually I found an app called [Orgzly Revived](https://github.com/orgzly-revived/orgzly-android-revived/). It lets me take the outline style notes where everything is a bulletpoint, with tasks and such, timers, repeats.. And it has the dang phone notifications no other note taking app has. So it's perfect. Works awesome for my needs.

Only thing is that it requires Orgmode files. Okay, I can do that. I first used [Logseq](https://logseq.com/) with both markdown and orgmode files, but it's quite slow app, even on my nice PC. And no notifications on mobile of course.

I then realised that I am trying to overcomplicate things. I live a lot of my work life in Kate editor, so I decided to start using that. I had to update the Orgmode Kate syntax file a bit to make it work better for me (it's been upstreamed now yay), but other than that it works really nicely.

*And why not Emacs? I need an editor, not an OS.* Well, jokes aside, I am just not really into learning yet another tool for something like note taking. Last time I tried to set up Neovim config that works for me, I just ended up doing everything in Kate.. I wager same would happen with emacs. I am very happy with Kate, that's all. And I contribute to it now and then, so it just makes sense to use it. :)

Now I just sync all my note files through my Nextcloud to my phone and my computers. I have couple scripts that make figuring out my agenda and have notifications on my PC as well.

[My Kate setup](#my-kate-setup)
==========

My setup took some time to get together and with couple scripts and snippets it works pretty well.

* First, you need to `git clone https://codeberg.org/akselmo/kate-orgmode.git`
  * In there I have couple python and shell scripts, and snippets for Kate
  * You need to create a `.venv` for it with `python -m venv .venv` and then `pip install -r requirements.txt`
  * Check the Readme file for how to use the snippets

* Create session called Notes.
  * In Plasma, you can just search "Notes" in KRunner and open the Notes session, that just opens the files.

* Symlink the org mode snippets to `~/.local/share/ktexteditor_snippets/data/` and make sure they work in Kate
  * Snippets are incredibly powerful in Kate, i recommend using them for many things!
  * These snippets automate stuff like "worktask" entries.
  * Unfortunately any timestamps need to be modified by hand, i have not yet had time to make an external tool that spawns a calendar view and spits out a timestamp.
  * For example, "worktask" adds a following item.

```
* TODO [#ABC] task_name :work:
SCHEDULED: <2024-07-07 Sun 21:12> DEADLINE: <2024-07-07 Sun 21:12>
  :PROPERTIES:
  :CREATED: [2024-07-07 Sun 21:12]
  :product: product
  :kdebug: [[https://bugs.kde.org/show_bug.cgi?id=bugid][bugid]]
  :merge-request: UPDATE_ME
  :END:

```

* Add an "external tool" entry for the `run-orgagenda.sh` item in the files.
  * Set the "Output" setting to "Display in a panel"
  * For the scripts, make sure they're reading right folder (where your notes are)
  * Now you can press `ctrl+alt+i` and type `Org Agenda` and it shows you a fun lil overview in a panel of all your items in agenda

* In your DE's autostart, add the `run-orgnotifier.sh` script.
  * This will send notification for anything you have set as scheduled or deadline before 30 min, and before/after 5 min of the timestamp.

That should be it for the setup, **the code for these scripts is absolutely horrid** but you should check that all filepaths match yours etc. I need to clean up the code when I feel like it but honestly it Just Works:tm: for now.. lol.

[Journaling?](#journaling)
==========

I have one single file that is called `Journal-2024` and I create new journal every year. In this journal file, I **prepend** new items on top of the file, like this.

```

* Daily notes 2024-07-07
  :PROPERTIES:
  :CREATED:  [2024-07-07 Sun 21:20]
  :END:
Some notes for this day
** Some specific subnote for this daily note
blabla

* TODO [#A] do this task ples :personal:
SCHEDULED: <2024-07-06 Sat 21:22> DEADLINE: <2024-07-07 Sun 21:23>
  :PROPERTIES:
  :CREATED: [2024-07-05 Fri 21:22]
  :END:
blalbla

* DONE [#B] ancient task :work:
  :PROPERTIES:
  :CREATED: [2000-01-01 someDayIdk 21:23]
  :END:
its been 24 years
#+BEGIN_SRC code
ancient code
#+END_SRC

```

This means that you can just quickly see all the new items. Also in Kate, there's a handy feature for folding all toplevel nodes when you press `ctrl+alt+i` so you get just list of all headers. I use it all the time. Folding the nodes only works with the newest ksyntaxhighlighting since i recently updated the orgmode syntax file to support that lol.

[Anything else](#anything-else)
==========

Any other items go to their respective note files.

For example anything related to programming goes to "Programming notes" file. Then I use tags for those items to categorize them based on language, framework, etc..

Instead of having many small files, I have multiple big files, where I categorize items with tags. I can then easily search for items by typing `:tag:` in the search field in Kate, and it shows me all items related to that tag. Just, well, remember to tag your items! :D

[Wrap up](#wrap-up)
==========

To wrap it up, this system has made things much easier to remember for me, and I can handle more complicated tasks like repeating workout tasks with my phone. (I can do it in Kate too but it requires manual number changing).

I wouldn't mind changing back to markdown if there was a **markdown app for phone that has actual notifications**.

Sorry this post is a bit all over the place, but there's really not much more interesting things to share about this. It's just couple scripts reminding me or showing all the items in my agenda, and the rest is snippets in Kate and writing orgmode files.

And I am quite happy with my system. Maybe it'll help you to get some ideas too!

Also please tell me about any markdown note taking apps that have notifications on mobile and desktop, if you know any. You can ping me on fedi, which you can find on my about section.

Thanks for reading!