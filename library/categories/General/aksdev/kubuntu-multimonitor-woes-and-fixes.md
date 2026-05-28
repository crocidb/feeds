+++
title = "Kubuntu multimonitor woes and fixes"
description = "I have had some problems with Kubuntu working well with multimonitor setup. I use X11 so the reason is most likely there, not just Kubuntu's fault.When booting up my PC and ending up in SDDM, I see the login screen in both screens. Bit weird, but fine. I can live with that.Howeve"
date = "2021-11-27T00:00:00Z"
url = "https://akselmo.dev/posts/kubuntu-multimonitor-woes-fixes/"
author = "Akseli"
text = ""
lastupdated = "2026-05-27T23:22:57.135960819Z"
seen = true
+++

I have had some problems with Kubuntu working well with multimonitor setup. I use X11 so the reason is most likely there, not just Kubuntu's fault.

When booting up my PC and ending up in SDDM, I see the login screen in both screens. Bit weird, but fine. I can live with that.

However after logging in, my first screen would always reset to 60hz and my second would be 144hz. Saving my first monitor to 144hz and restarting the PC would reset that.

I feel like the problem is that the SDDM doesn't remember my settings or something, but I managed to fix it so I don't have to think about it anymore and here's how.

[First, the fix](#first-the-fix)
----------

First, set your monitor settings correct with the Kubuntu display settings.

Then open terminal and do the following command

```
xrandr'

```

You should be getting something like this:

```
Screen 0: minimum 320 x 200, current 3840 x 1080, maximum 16384 x 16384
DisplayPort-0 connected 1920x1080+1920+0 (normal left inverted right x axis y axis) 521mm x 293mm
   1920x1080     60.00 + 143.85*  119.98    99.93    50.00    59.94
   1680x1050     59.95
   1280x1024     75.02    60.02
   1440x900      59.89
   1280x960      60.00
   1280x800      60.00
   1152x864      75.00
   1280x720      60.00    50.00    59.94
   1440x576      50.00
   1024x768      75.03    70.07    60.00
   1440x480      60.00    59.94
   800x600       72.19    75.00    60.32    56.25
   720x576       50.00
   720x480       60.00    59.94
   640x480       75.00    72.81    66.67    60.00    59.94
   720x400       70.08
DisplayPort-1 disconnected (normal left inverted right x axis y axis)
HDMI-A-0 disconnected (normal left inverted right x axis y axis)
HDMI-A-1 disconnected (normal left inverted right x axis y axis)
DVI-D-0 connected primary 1920x1080+0+0 (normal left inverted right x axis y axis) 531mm x 298mm
   1920x1080     60.00 + 144.00*  119.98    99.93    59.94
   1680x1050     60.00
   1280x1024    119.96    75.02    60.02
   1440x900     119.85
   1280x800      60.00
   1152x864      75.00
   1280x720      60.00
   1024x768     119.99    75.03    60.00
   832x624       74.55
   800x600      119.97    75.00    60.32
   640x480       75.00    60.00    59.94
   720x400       70.08

```

Copy this part somewhere, you will base your settings to this text. The start behind the hz rating is what you're using at the moment. It will list all the resolutions and hz available to all ports you have connected. Notice that even if your monitor may be marked 144hz, it can be a bit different. Like for me it is 143.85 for my other monitor.

Open Xsetup file for editing

```
sudo nvim /usr/share/sddm/scripts/Xsetup

```

(Use your editor of choice :P )

In there, add the following to end of the file

```
xrandr --output FirstMonitor --mode resolution --post 0x0 --rate hz --primary
xrandr --output SecondMonitor --mode resolution --rate hz

```

So for me, that is

```
xrandr --output DVI-D-0 --mode 1920x1080 --pos 0x0 --rate 144 --primary
xrandr --output DisplayPort-0 --mode 1920x1080 --rate 143.85

```

Save the file, then move on to next file:

```
sudo nvim /etc/sddm.conf

```

In there, add following under the `[XDisplay]`, and if it doesn't exist, you can just add it there.

```
[XDisplay]
DisplayCommand=/usr/share/sddm/scripts/Xsetup

```

This will make the SDDM load the script you just edited. It may already be there, so you don't necessarily have to add anything.

Reboot and see if it helps.

[Second, the groaning](#second-the-groaning)
----------

I totally agree I shouldn't have to do anything like this to set up my multimonitor setup. Computer should automatically do this when I save my settings in the GUI.

I think this may just be a bug somewhere, because it did work before I updated to Kubuntu 21.10, and I have reported it as well as I could.

Anyways, part of Linux is doing tinkering like this. I don't *mind* it, but I am slightly groaning that I had to do this manually.

And please, **report all the bugs you find.** That's the best way we can get these issues solved, since in the end it's a community run system.

I firmly believe that what I get in free software, I pay in having to fill in bug reports. And I am totally fine with that, personally.

\+++

PS. I'm writing this on my birthday!

Woop!