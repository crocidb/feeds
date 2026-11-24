+++
title = "Engine stall fix: Citroën 2.0 HDI 150"
description = " car maintenanceEngine stall fix: Citroën 2.0 HDI 150Simple, zero-cost fix https://khleedril.org/blog/2026-11-13--dirty-cam-sensor.html khleedril.org/2026-11-13--dirty-cam-sensorDale Mellor [ https://khleedril.org/dale-mellor ](https://khleedril.org/dale-mello"
date = "1970-01-01T00:00:00Z"
url = "https://khleedril.org/blog/2026-11-13--dirty-cam-sensor.html"
author = "Dale Mellor"
text = ""
lastupdated = "2026-11-19T14:05:13.751502388Z"
seen = true
+++

car maintenance

Engine stall fix: Citroën 2.0 HDI 150
==========

Simple, zero-cost fix
----------

 https://khleedril.org/blog/2026-11-13--dirty-cam-sensor.html

 khleedril.org/2026-11-13--dirty-cam-sensor

Dale Mellor [ https://khleedril.org/dale-mellor ](https://khleedril.org/dale-mellor)

 13th November, 2026

 .outbox { border: 2px solid #ff8888; border-width: 4px 0; padding: 1em; background: #eee; }

**Too long, donʼt read.** The car engine cut out without warning. The problem was iron filings on the Hall-Effect camshaft position sensor. While I dismantled half the engine investigating, it turned out I only needed to remove one retaining screw from the top of the engine block, extract the sensor, give it a good wipe, and then put it back in. Car is running perfectly again.

Recently the engine cut out on the car without any warning. Nothing dramatic, it just decided of its own accord to stop running. When I tried to get it started again, **all** the alarms went off including *Bad transmission* and *Failed ESP* (anti-skid)—the car has a tendency to do this when a nasty fault is detected to give the driver more reasons, hence more encouragement, to stop driving the car and get the damned thing fixed as soon as possible.

The diagnostic box told me there was a problem with the camshaft position sensor. Iʼve seen this before, but last time the problem was actually the crankshaft position sensor (which is on the same part of the harness), so this time around that part is fairly new. The fool me ignored the hint about the cam sensor.

I spent much of the following week dismantling all parts of the engine, checking wiring. The weather was quite cold, around 8°C in the middle of the day, but fortunately bone dry and actually sunny all week. To get to the crankshaft sensor I have to jack the car up (Iʼm working at the side of the road outside my house), remove the under-tray and the front wheels, and take the offside front wheel arch liner out, all just a huge faff. I gave the crankshaft sensor a good clean, reset the fault codes on the computer, and gave the engine a run. Good for half an hour, but as soon as the engine temperature got up to working, it cut out again.

So I investigated cam sensors and found that a new one would cost all of £10. So I look at how to remove the old one. While it is sitting right on top of the engine, it is very difficult to get to. I spend a day trying to move wiring aside—including the injector and glow-plug connectors—and extricating a piece of plastic which held all the wiring in place on top of the engine.

As it turned out, I neednʼt have bothered. When you know where to look, the sensor mounting screw is out of sight but accessible without moving anything else. ‘Accessible’ is doing some work there: the screw is in fact difficult to get to being tucked away underneath the overhanging windscreen (these cars have short bonnets and extraordinarily large windscreens). However, a little perseverance and I got the screw out, and with a little wiggle the camshaft sensor came out with surprising ease.

And then I see the problem. The sensor is Hall-Effect: embedded in a piece of plastic is a permanent magnet and a loop of current-carrying wire. When a metal object (the camshaft pulley) interferes with the magnetic field, spurious voltages are seen in the wire loop and the carʼs computer learns how to relate these to the position of the camshaft.

But this one came out of the engine block with a little bit of iron filings stuck by magnetism. Iʼm not too concerned with the presence of these, as the sensor has been in place, untouched, for nearly 120,000 miles. If it gets covered in filings again any time soon, then Iʼll worry.

However, my conjecture is that the iron filings were interfering with the operation of the Hall-Effect sensor, and that was confusing the computer, causing it to shut the engine down.

In the end the fix for the car was to undo a single screw, extract the camshaft position sensor, and give it a clean. The car has been running perfectly since this fix went in, and, in the end, it didnʼt cost me a thing!