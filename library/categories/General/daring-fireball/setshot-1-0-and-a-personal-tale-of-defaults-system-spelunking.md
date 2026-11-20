+++
title = "SetShot 1.0 (and a Personal Tale of Defaults System Spelunking)"
description = "Adam Engst, writing at TidBITS:This past August, I did something I had never done before: released a full-fledged Mac app. Prompted by tech ghost stories about settings mysteriously changing during operating system updates, I spent months working with Claude Code to create a "
date = "2026-11-17T18:41:12Z"
url = "https://tidbits.com/2026/11/13/setshot-1-0-tracks-even-more-macos-settings/"
author = "John Gruber"
text = ""
lastupdated = "2026-11-19T14:05:14.058219409Z"
seen = false
+++

Adam Engst, writing at TidBITS:

>
>
> This past August, I did something I had never done before: released a full-fledged Mac app. Prompted by tech ghost stories about settings mysteriously changing during operating system updates, I spent months working with Claude Code to create a utility called SetShot that would reveal what settings change during macOS updates (see “[SetShot Tracks macOS Settings Changes](https://tidbits.com/2026/08/19/setshot-tracks-macos-settings-changes/),” 19 August 2026). So far, I haven’t caught Apple red-handed, although I still hear chatter about configuration changes after users install updates.
>
>
>
> Practically speaking, SetShot offers something never previously available to Mac users: the capability to identify and log settings changes over time, whether made by you, macOS, or some app. To that end, it takes and compares snapshots of numerous settings deep within macOS, reporting on what changed between them. It never changes any settings, so the worst it can do is tell you something you didn’t want to know.
>
>

[SetShot](https://tidbits.com/setshot/) is a very cool app, and so very Adam Engst-flavored. Free of charge and [open source](https://github.com/adamengst/setshot-app) to boot.

There’s an anecdote involving me in Engst’s post, and while SetShot couldn’t fix my problem directly, it was very helpful in showing me where to look to fix it myself. The backstory: I set a custom “Text highlight color” in System Preferences: Appearances many years ago — I mean like maybe 20 years ago — and had not changed it in years. It’s just the perfect shade of blue. But one night two months ago I went screwing around to see what the modern default text highlight colors are, and, son of a bitch, when I tried to change my color back to the custom one I’d been using for decades, I couldn’t. The way the color picker stores color values from the modern Appearance settings panel must have changed. It still honors the old value I had if it’s in the `defaults` system that way, but it writes a different style of value if you change it in the Appearance panel in System Settings.

Here’s a short version of how I got my old color back. Using System Settings, I changed the custom color to the exact RGB values 0.2 / 0.4 / 0.6. Then I read them from the command line:

```
❯ defaults read -g AppleHighlightColor
0.200000 0.400000 0.600000 Other

```

That’s not the color I wanted; I just wanted to prove that that’s the global key for a custom text highlight color. When I read those same values from a backup version of my *\~/Library/Preferences/.GlobalPreferences.plist* file (always have backups, kids), with my beloved custom color, it looked liked this:

```
❯ defaults read /path/to/.GlobalPreferences.plist AppleHighlightColor
0.698039 0.760784 0.835294

```

So the old value was a string with three floating point RGB values. The new value was a string with those three values *plus* the word “Other”. This command, writing back my custom RGB values without the word “Other”:

```
❯ defaults write -g AppleHighlightColor "0.698039 0.760784 0.835294"

```

restored the color I’ve been using since George W. Bush was still president. It’s a really good color, trust me.

[ ★ ](https://daringfireball.net/linked/2026/11/17/setshot-1-0)