+++
title = "Simple Arduino Temperature meter"
description = "I decided it was time to dust off my Arduino starter kit I got like.. over 5 years ago? I had also bought a tiny AM2301 temperature and humidity meter, so why not combine that and the LCD display that came with the starter kit. N"
date = "2022-08-13T00:00:00Z"
url = "https://akselmo.dev/posts/simple-arduino-temperature-meter/"
author = "Akseli"
text = ""
lastupdated = "2026-05-27T23:22:57.112286619Z"
seen = true
+++

I decided it was time to dust off my Arduino starter kit I got like.. over 5 years ago? I had also bought a tiny [AM2301](https://sonoff.tech/product/accessories/am2301/) temperature and humidity meter, so why not combine that and the LCD display that came with the starter kit. No idea if it's the same I linked but it has same part number.. Idk. Could be cheap clone.

Anyway I'm happy I did try this! The project was super simple, I was basically following the directions [here](https://docs.arduino.cc/learn/electronics/lcd-displays) to make the LCD display work.

Here's an image of it in action:

![Arduino Temp Meter](https://codeberg.org/akselmo/ArduinoTempMeter/media/branch/main/in_action.jpg)

I pretty much followed it to the T. Only problem was that I had my breadboard "glued wrong-way-around" on the tiny thing that holds both the arduino and the breadboard, so I had to put the negative wire to the rail that's marked positive on the breadboard.

Not that it's an issue at all, but that's why it's "wrong" in the image.

I got the thing working, but I had some wires wrong as well, so the display tried to draw characters all wrong ways. What was kind of cool was when removing the green wires while the display was on, it would get corrupted and show all kinds of characters. Kinda got a kick out of that.

After I got the LCD monitor to work, I just hooked the wires of the sensor to 5V and GND, and the yellow wire to Arduino's digital pin, in my case pin 7.

Then I could use the arduino to read it, following these directions: [Electropeak.com tutorial](https://electropeak.com/learn/interfacing-dht21-am2301-temperature-humidity-sensor-with-arduino/)

After I got the serial port to read the values, I could just feed them to the LCD screen.

You can find the code for this project here: [https://codeberg.org/akselmo/ArduinoTempMeter](https://codeberg.org/akselmo/ArduinoTempMeter)

I'm still astonished how super simple this was. I felt like I was cheating somehow: Surely this must be more complicated than this!

But nope, Arduino is super simple thanks to people making a lot of good tutorials and libraries. I'm glad I gave it a try and I think I will try to extend this by getting a Wifi module, which then would yell to my Raspberry Pi which would host the values in our local network.

Sure, I *could* just use Raspberry Pi to do all of that, but I kinda wanna do it the "hard way" to learn how to interface between Arduino and RPi.

Just may take another 5 years.. Lol.

I was also thinking of getting a proper PCB and soldering the thing so I could have this in smaller form factor, but also I think I shouldn't waste Arduino Uno just for this small project. Maybe there is some smaller Arduino I could sacrifice for dead simple project like this.

Wonder what else I could make.. Maybe a Discord bot that tells arduino to spin a motor or something?

Anyhow, this was just a small post of me being happy about something tiny I made. Gotta celebrate those small successes as well! :)