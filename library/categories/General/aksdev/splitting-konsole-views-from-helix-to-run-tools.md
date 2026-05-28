+++
title = "Splitting Konsole views from Helix to run tools"
description = "I have been tinkering with Helix editor lately since I quite like it.It's a fun little editor. Can recommend for those who like modal editing. I do not know if it'll ever replace Kate editor for me, but I'm challenging myse"
date = "2026-05-25T19:39:00Z"
url = "https://akselmo.dev/posts/splitting-konsole-views-from-helix-to-run-tools/"
author = "Akseli"
text = ""
lastupdated = "2026-05-27T23:22:56.943242373Z"
seen = true
+++

I have been tinkering with [Helix](https://helix-editor.com/) editor lately since I quite like it.

It's a fun little editor. Can recommend for those who like modal editing. I do not know if it'll ever replace [Kate](https://kate-editor.org/) editor for me, but I'm challenging myself to try new tools, just for the fun of it.

With Helix, I've used this git tool called [gitu](https://github.com/altsem/gitu/) that is rather quick and easy to work with. Though I still use [lazygit](https://github.com/jesseduffield/lazygit/) for more complex tasks.

Main pain point for me has been how to use some of these tools like gitu within Helix. Lazygit could be done with some [magic](https://github.com/helix-editor/helix/discussions/12045), but I was never really satisfied with it.

I also tried [Zellij](https://zellij.dev/) for terminal multiplexing and running commands between two splits and so on. It was a bit cumbersome to get it to work as I wanted, since Zellij has tons of features I'll never need. This also caused my fingers to get entangled since I had to remember all sorts of shortcuts. Just not for me.

In [Konsole](https://apps.kde.org/konsole/) terminal, there is a shortcut for splitting views easily and automatically to a fitting size. I use it a bunch. But because I'm lazy, I would have to press the shortcut, go to the other splitview, type the command for other tool, do things and then close commands. I wanted something a bit more automated.

I found that Konsole can be set to allow scripting over dbus commands: [Scripting Konsole](https://docs.kde.org/stable_kf6/en/konsole/konsole/scripting.html).

So I made myself a little shell script that I placed in my path: [konsole-split.sh](https://git.sr.ht/~akselmo/dotfiles/tree/main/item/konsole/konsole-split.sh)!

Here's what it does:

```
#!/usr/bin/env bash

# In konsole settings, make sure
# - run all konsole windows in single process is disabled
# - enable the security sensitive parts is enabled

if [ $# -eq 0 ]; then
    echo "Command is missing!"
    exit
fi

# Split the view automagically. We can use MainWindow_1 since we have only one process
qdbus6 "$KONSOLE_DBUS_SERVICE" /konsole/MainWindow_1 org.kde.KMainWindow.activateAction split-view-auto >/dev/tty

# Get the session of the current terminal window
CURRENTSESSION=$(qdbus6 "$KONSOLE_DBUS_SERVICE" "$KONSOLE_DBUS_WINDOW" org.kde.konsole.Window.currentSession) >/dev/tty

# Run the given arguments as a command in that session
qdbus6 "$KONSOLE_DBUS_SERVICE" /Sessions/"${CURRENTSESSION}" org.kde.konsole.Session.runCommand "$@" >/dev/tty

```

It's really simple, but now I can use this in my helix config like this:

```
[keys.normal."+"]
b = ":sh git log -L %{cursor_line},+1:%{buffer_name}" #This is git log for a line, also useful, kinda like git blame
s = ":sh konsole-split.sh 'exec scooter'" # Scooter is a search and replace in multiple files tool, very handy
g = ":sh konsole-split.sh 'exec gitu'"

```

In practice, what happens is:

1. In helix, i press `+`

2. Then I select the command, in this case `gitu`, so `g`

3. Konsole splits itself automatically to a comfortable size

4. It then gets the session of that new split

5. And runs the `gitu` command with `exec`

   * So if the execution stops/fails, it just closes the split instantly

This works really well for my needs, and I was surprised to see how simple it was to create something like this. I think the error handling when command does not work could be better, but oh well, works for me for now.

Let me know if you do anything similar or have any improvement ideas! :)

[](https://brid.gy/publish/mastodon)