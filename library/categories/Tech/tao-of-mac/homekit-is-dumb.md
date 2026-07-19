+++
title = "HomeKit Is Dumb"
description = "I’m going to get on my soapbox again and call out Apple once more on the extremely limited HomeKit automation experience–and how they can fix 80% of the gripes I have with it by just cloning a small subset of the [Shortcuts](https"
date = "2026-07-17T16:01:00Z"
url = "https://taoofmac.com/space/blog/2026/07/17/1601?utm_content=atom"
author = "Rui Carmo"
text = ""
lastupdated = "2026-07-18T14:48:32.019734702Z"
seen = false
+++

I’m going to get on my soapbox again and call out [Apple](/space/com/apple) once more on the *extremely* limited [HomeKit](/space/com/apple/homekit) automation experience–and how they can fix 80% of the gripes I have with it by just cloning a small subset of the [Shortcuts](https://support.apple.com/guide/shortcuts/welcome/ios?utm_source=taoofmac.com&utm_medium=web&utm_campaign=unsolicited_traffic&utm_content=external_link) user experience.

The most infuriating, they-are-so-close annoyance I have with it is that *automations can only have one trigger, and extremely basic conditions*, to the point where they are effectively useless in real life.

Right now, HomeKit automation is effectively as simple as this pseudo-code:

```
if office.presence = true
then scenes.office_ambient.light = on

```

One trigger, one outcome. There are some conditionals, but they are *extremely* limited:

```
if office.presence = true
   and schedule = "daytime"
then scenes.office_ambient.light = on

```

Conditionals are just a schedule and somebody (optionally me) being home, which is not enough for the way people *actually* live in a house. For instance, I can’t set up logic like this:

```
if office.temperature.celsius > 27
   and office.presence = true
   and office_window.closed = true
then
   office.heatpump.target = 25
   office.heatpump.mode = cool
   office.heatpump.fan = 50%

```

This is the sane way to automate a heatpump (obviously), but there is zero way for this to be configured in HomeKit in any way whatsoever. I can, of course, do it “out of band” in [Node-RED](/space/dev/javascript/node-red), but the moment I do that it becomes unfathomable to anyone else in the house.

And yet, it would be pretty much trivial to add both to the Home app (by just stealing the visual `if` construct from [Shortcuts](https://support.apple.com/guide/shortcuts/welcome/ios?utm_source=taoofmac.com&utm_medium=web&utm_campaign=unsolicited_traffic&utm_content=external_link)) and to any home hub.

You also can’t have alternate triggers without duplicating the entire thing (or creating scenes for the common outcome, which clutters your scene list):

```
if office.presence == true
   "I have two presence sensors that actually don't overlap"
   or office.desk.presence == true
then
   office_desk.light = on

```

And, finally, there is no way to chain automations after a period of time:

```
if office.presence == true
   and schedule = 'nighttime'
then
   for 3m
      "Turn on the light so I can search for stuff on my desk"
      office_ceiling.light = on
      office_ceiling.light.intensity = 0.5
   then
      "Make it dim enough so I can still find things if I linger"
      office_ceiling.light.intensity = 0.25
   until office.presence == false
      then office_ceiling.light = off

```

I don’t have any garage doors (so this is a bit of a contrived example), but I can’t tell you how many times I had to step into the office in the late evening for a little while and needed to adjust the lights.

The basic principle would translate to much better and more useful automation overall–if you replace lights with space heaters and times with temperature thresholds, you can cut your power bill by up to 50% (which is what I did last winter with [Node-RED](/space/dev/javascript/node-red)).

Complex triggers alone would make HomeKit tremendously more useful:

```
if tv.power = on
   and input = "apple tv"
   and schedule = "night time"
   and sofa.presence = on
then
   tv.soundbar.volume = 6
   sofa_lamp.intensity = 0.7

```

And, of course, something like this:

```
if office.presence = on
   and schedule == "nighttime"
then office_homepod.Siri("Will you be staying long?")
   if answer == true
      ...

```

…etc. Again, this is not rocket science, and I think the real cause is that nobody at Apple who works on HomeKit actually uses it beyond the basics. I’m willing to bet they use [Home Assistant](https://www.home-assistant.io/?utm_source=taoofmac.com&utm_medium=web&utm_campaign=unsolicited_traffic&utm_content=external_link) instead…