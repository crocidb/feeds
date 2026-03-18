+++
title = "Converting infix to RPN (shunting-yard algorithm)"
description = "IntroductionIf you’ve ever tried to write your own calculator, you’ve probably needed a way to convert mathematical expressions written in the usual infix notation into Reverse Polish Notation (RPN). This post walks "
date = "2010-10-05T00:00:00Z"
url = "https://andreinc.net/2010/10/05/converting-infix-to-rpn-shunting-yard-algorithm/"
author = "Andrei Ciobanu"
text = ""
lastupdated = "2026-03-18T21:57:49.258654552Z"
seen = false
+++

---

Introduction
==========

If you’ve ever tried to write your own calculator, you’ve probably needed a way to convert mathematical expressions written in the usual *infix* notation into [Reverse Polish Notation (RPN)](http://en.wikipedia.org/wiki/Postfix_notation). This post walks through that conversion using the classic **shunting-yard algorithm**, and shows a (hopefully) compact Java implementation.

Before we jump into the algorithm, let’s make sure we’re on the same page about the terminology: *infix notation* and *rpn*.

[Infix notation](http://en.wikipedia.org/wiki/Infix_notation): this is the “normal” notation you use every day: operators are written *between* operands (e.g. `A + B`, `3 * (4 + 5)`). It’s natural for humans, but surprisingly annoying to parse for computers because you need to consider parentheses and operator precedence.