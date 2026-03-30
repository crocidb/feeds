+++
title = "Generic data structures in C"
description = " Update (2026): This was the first 'real article' I ever wrote. It actually dates back to before 2010, though I didn't publish it until later. I’ve made a few tweaks here and there, but the original 'old code' remains. Please judge it kindly!Contents [Introduction](in"
date = "2010-09-30T00:00:00Z"
url = "https://andreinc.net/2010/09/30/generic-data-structures-in-c/"
author = "Andrei Ciobanu"
text = ""
lastupdated = "2026-03-18T21:57:49.262060706Z"
seen = true
+++

Update (2026): This was the first 'real article' I ever wrote. It actually dates back to before 2010, though I didn't publish it until later. I’ve made a few tweaks here and there, but the original 'old code' remains. Please judge it kindly!

Contents
----------

* [Introduction](#introduction)
* [Generic Data Structures Using the C Preprocessor](#generic-data-structures-using-the-c-preprocessor)
  * [What is a Macro?](#what-is-a-macro)
    * [Example: Object-like Macros](#example-object-like-macros)
    * [Example: Function-like Macros](#example-function-like-macros)

  * [Token Concatenation (`##`)](#token-concatenation-)

* [Writing a Generic Stack Using Macros](#writing-a-generic-stack-using-macros)
  * [The Declaration Macro](#the-declaration-macro)
  * [The Definition Macro](#the-definition-macro)
    * [Visualizing the Expansion](#visualizing-the-expansion)

  * [Putting It All Together](#putting-it-all-together)
  * [Important Constraint: Type Naming](#important-constraint-type-naming)

* [Writing a Generic Stack Using `void*`](#writing-a-generic-stack-using-void)
  * [Defining the Typeless Struct](#defining-the-typeless-struct)
  * [Implementation: Push and Pop](#implementation-push-and-pop)
  * [Using the Generic Stack](#using-the-generic-stack)

* [Key Differences from the Macro Approach](#key-differences-from-the-macro-approach)

---

Introduction
==========

This tutorial assumes basic familiarity with **C macros**, **pointers**, and simple **data structures**. While the C language does not provide built-in generics or templates (like C++, C#, or Java), we can emulate them using a few specific techniques. In this post, we explore two primary approaches: