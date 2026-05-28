+++
title = "Easy way to open Discord through Firefox without address bar!"
description = """Since the Electron wrapper of Discord is so bad and outdated, especially on Linux, here's a way to start Discord through Linux in a "single page app" way.I got the help f"""
date = "2022-06-05T00:00:00Z"
url = "https://akselmo.dev/posts/discord-firefox-window/"
author = "Akseli"
text = ""
lastupdated = "2026-05-27T23:22:57.120622735Z"
seen = true
+++

Since the Electron wrapper of Discord is so [bad and outdated](https://theevilskeleton.gitlab.io/2022/05/29/a-letter-to-discord-for-not-supporting-the-linux-desktop.html), especially on Linux, here's a way to start Discord through Linux in a "single page app" way.

I got the help for it from [here](https://old.reddit.com/r/firefox/comments/li2lqg/now_that_mozilla_killed_the_ssb_feature_what/) but I wanted to write this down in step-by-step way. (Honestly mostly for myself so I dont have to find it again lol)

[1. Create Discord profile](#1-create-discord-profile)
----------

Open `about:profiles` in Firefox, and create a new profile called Discord.

Set the default profile as the one you're currently using, it should say "This is the profile in use and it cannot be deleted" on top of it.

[2. Set up the profile to hide address bar](#2-set-up-the-profile-to-hide-address-bar)
----------

Open the new profile through terminal with

```
firefox --no-remote -P "Discord"

```

And check you're using the correct profile by opening `about:support` and checking the Profile Directory.

Then you can click the "Open Directory" button.

In that folder, create new folder called `chrome` and in that folder, create file `userChrome.css`.

Paste the following in the file, this will hide the address bar:

```
TabsToolbar {
  visibility: collapse;
}

:root:not([customizing]) #navigator-toolbox:not(:hover):not(:focus-within) {
  max-height: 1px;
  min-height: calc(0px);
  overflow: hidden;
}

#navigator-toolbox::after {
  display: none !important;
}

#main-window[sizemode="maximized"] #content-deck {
  padding-top: 8px;
}

```

Save the file and go back to Firefox.

In Firefox, open `about:config` and set `toolkit.legacyUserProfileCustomizations.stylesheets` to `true`.

It should save automatically. You can now close Firefox.

[3. Create a shortcut](#3-create-a-shortcut)
----------

Go to `~/.local/share/applications` and create a new `discordfirefox.desktop` file.

Open that file and paste the following:

```
[Desktop Entry]
Comment[en_GB]=Opens Discord in Firefox
Comment=Opens Discord in Firefox
Exec=firefox --no-remote -P "Discord" https://discord.com/channels/@me\n
GenericName[en_GB]=Opens Discord in Firefox
GenericName=Opens Discord in Firefox
MimeType=
Name[en_GB]=Discord (Firefox)
Name=Discord (Firefox)
Path=
StartupNotify=true
Terminal=false
TerminalOptions=
Type=Application
X-DBUS-ServiceName=
X-DBUS-StartupType=
X-KDE-SubstituteUID=false
X-KDE-Username=

```

You may want to add icon to it, but you should be able to do that by right clicking the desktop file and going properties. You can also type `Icon=icon/path/here.svg` to the desktop file.

[Done](#done)
----------

That should be it! Now you should have a Discord faux-single-page-app.

A good idea is to also install Ublock Origin to the same profile, so you can also block any ads if you are shared links.

If you move your mouse on top of the window, the address bar should pop up so you can use it like normal Firefox instance if needed.