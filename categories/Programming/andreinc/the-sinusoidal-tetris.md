---
title = "The sinusoidal tetris"
description = "A tetris game with a twist"
date = "2024-02-06T00:00:00Z"
url = "/2024/02/06/the-sinusoidal-tetris"
author = "Andrei Ciobanu"
text = ""
lastupdated = "2025-10-22T08:59:05.791458362Z"
seen = true
---

Let’s play Tetris, but with a twist. No geometrical figures will *fall from the sky*. Instead, you control a [sinusoid](https://en.wikipedia.org/wiki/Sine_wave), defined by: \\(f(x)=A\*sin(\\omega x + \\varphi)\\):

---

|   |Free suggestions in the beginning. If you follow all of them, you win.|
|---|----------------------------------------------------------------------|
|   |      Turn-Based Mode (the sinusoid doesn’t drop automatically)       |

<sup><sup><a href="/assets/js/2024-02-06-the-sinusoidal-tetris/tetris.js">(Source code)</a></sup></sup>

---

Controls

* To increase the angular frequency, \\(\\omega\\), press: `s`;
* To decrease the angular frequency, \\(\\omega\\), press: `x`;
* To increase the amplitude, \\(A\\), press: `a`;
* To decrease the amplitude, \\(A\\), press: `z`;
* To increase the phase: \\(\\varphi\\), press: `q`;
* To decrease the phase: \\(\\varphi\\), press: `w`;
* To *drop* the sinusoid, press `p`;

---

To win the game, you need to reduce the signal as close to zero as possible. It’s hard but not impossible. There’s a current threshold of `unit * 0.3`. Surviving is not winning. The *Path of the Alternating Phases* is boredom.

You lose if the original signal spikes outside the game buffer (canvas).

A professional player turns off the suggestions, now enabled by default. If you are a savant, you can compute the [*Fourier Series Coefficients*](https://en.wikipedia.org/wiki/Fourier_series) in your head. Cancel that noise!

To better understand what is happening, check out [this first article of a series](/2024/04/24/from-the-circle-to-epicycles).

---

The game was developed using [p5js](https://p5js.org/).

The source code [(here)](/assets/js/2024-02-06-the-sinusoidal-tetris/tetris.js) is not something I am particularly proud of.

---

Some discussion from around the web:

* [Hacker News](https://news.ycombinator.com/item?id=39275715)
* [Lobste.rs](https://lobste.rs/s/h1y3ql/sinusoidal_tetris)
* [Museum Of Screens](https://museumofscreens.wordpress.com/2024/02/07/web-game-of-the-day-sinusoidal-tetris/)
* [hackaday - tetris goes full circle](khttps://hackaday.com/2024/02/07/tetris-goes-full-circle/#comments)
* [microsiervos](https://www.microsiervos.com/archivo/juegos-y-diversion/tetris-sinusoidal-existe-encanto-matematicamente-especial.html)

---

<sup>This game is a joke I put together during a weekend. I’m sorry for the graphics.</sup>