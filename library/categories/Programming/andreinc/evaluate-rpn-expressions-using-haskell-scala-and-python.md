+++
title = "Evaluate RPN expressions using Haskell, Scala, and python"
description = "Contents Introduction The Algorithm Implementations   Scala   Python   HaskellIntroductionOne of the earlier challenges from Programming Praxis was the RPN Calculator"
date = "2011-01-03T00:00:00Z"
url = "https://andreinc.net/2011/01/03/evaluate-rpn-expressions-using-haskell-scala-and-python/"
author = "Andrei Ciobanu"
text = ""
lastupdated = "2026-03-18T21:57:49.255320179Z"
seen = false
+++

Contents
----------

* [Introduction](#introduction)
* [The Algorithm](#the-algorithm)
* [Implementations](#implementations)
  * [Scala](#scala)
  * [Python](#python)
  * [Haskell](#haskell)

Introduction
==========

One of the earlier challenges from Programming Praxis was the RPN Calculator. The goal is to create a module that evaluates Reverse Polish Notation (RPN) expressions. RPN is a mathematical notation where operators follow their operands, eliminating the need for parentheses. This makes expressions easier for computers to parse and execute.

The specific requirement for this challenge was:

>
>
> Implement an RPN calculator that takes an expression like `19 2.14 + 4.5 2 4.3 / - *` (which represents `(19 + 2.14) * (4.5 - 2 / 4.3)`) and returns 85.2974. The program should read from standard input, print the result when a newline is encountered, and maintain the state of the operand stack between expressions.
>
>