+++
title = "4 integers are enough to write a Snake Game"
description = "… actually you can use only 2, but this will make your life a little more miserable.Contents Introduction The code The memory layout   map   vars   shape* [The game loop](t"
date = "2022-05-01T00:00:00Z"
url = "https://andreinc.net/2022/05/01/4-integers-are-enough-to-write-a-snake-game/"
author = "Andrei Ciobanu"
text = ""
lastupdated = "2026-03-18T21:57:49.194680106Z"
seen = false
+++

>
>
> … actually you can use only 2, but this will make your life a little more miserable.
>
>

Contents
----------

* [Introduction](#introduction)
* [The code](#the-code)
* [The memory layout](#the-memory-layout)
  * [`map`](#map)
  * [`vars`](#vars)
  * [`shape`](#shape)

* [The game loop](#the-game-loop)
* [The function that moves the snake:](#the-function-that-moves-the-snake)
* [The function that displays the snake](#the-function-that-displays-the-snake)
* [After the macros expand](#after-the-macros-expand)
* [Final thoughts](#final-thoughts)

Introduction
==========

![](./images/2022-05-01-4-integers-are-enough-to-write-a-snake-game/snake.gif)

After *not* implementing a game of Snake in ages, I decided to do my best today, but with some strange and absurd limitations in mind, you know, to spice things up: