+++
title = "Restrict mouse to first screen on Linux"
description = 'If there is alternative, better ways, do tell!Edit: I figured out that this problem may arise mostly when alt+tabbing out of the game. Sometimes, the alt key gets "stuck" and you have to either press it again, or alt+tab to the game again. I managed to fix this issue by cha'
date = "2021-08-12T00:00:00Z"
url = "https://akselmo.dev/posts/restrict-mouse-to-first-screen-on-linux/"
author = "Akseli"
text = ""
lastupdated = "2026-05-27T23:22:57.148006627Z"
seen = true
+++

**If there is alternative, better ways, do tell!**

Edit: I figured out that this problem may arise mostly when alt+tabbing out of the game. Sometimes, the alt key gets "stuck" and you have to either press it again, or alt+tab to the game again. **I managed to fix this issue by changing the alt+tab hotkey to meta+tab!** Games usually ignore the meta key completely.

I had some problems with mouse cursor escaping fast paced games such as Quake Champions and Splitgate when playing them and doing flick shots, so I searched for some solutions. I am using Kubuntu so it has KWin window manager.

I could really not find much except a script someone used for their drawing tablet and to restrict the input in that.

That script works well for gaming as well, so I decided to save it as a gist:

[Github Gist: Restrict mouse to screen](https://gist.github.com/Akselmo/d4f35798a222b9af5d0c0f1b4021d11d)

**NOTE**: I didn't make this script or modify it in any way! If there are any improvements that could be done to it, feel free to comment on the Gist!

It doesn't affect your mouse any other ways than keeping it inside the coordinates what you give to it.

[How to:](#how-to)
----------

First, just download the script and put it in some folder.

Then, download **xdotool**, the script needs that to work:

```
sudo apt install xdotool

```

Inside the folder the script is, run this inside terminal:

```
bash ./restrictmouse.sh 1 1 1919 1079

```

This restricts the mouse inside your first 1080p monitor: First from left to right. Also, it's a good idea to set the coordinates 1 pixel less (or more if on the left side) so your mouse wont even accidentally go to other screens.

It's good idea to run the script from terminal so it's easier to close as well. You can close it from task manager (subprocess of bash) or htop if you run it without terminal, of course.

Optional: I also made a desktop file for it and added it to my KDE app launcher, so I can just click it and it'll run the script inside a terminal to restrict the mouse. This way I don't forget using it easier.

[My dumb opinion](#my-dumb-opinion)
----------

This is just unnecessary opinions about this, but I wish **I wouldn't have to do this.** Unfortunately some games have trouble on Linux keeping the mouse inside the game, especially if it's fast paced enough that you move the mouse faster than the game can "keep" it inside the window. It's a really weird.. Bug? Feature? Anyways, hope this helps you.