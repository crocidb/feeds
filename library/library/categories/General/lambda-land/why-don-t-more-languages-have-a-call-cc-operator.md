+++
title = "Why Don't More Languages Have a call/cc Operator?"
description = "Something I’ve wondered about for a little while: why don’t more languages have a call/cc operator? Having first-class continuations in your programming language gives your prog"
date = "2023-10-30T00:00:00Z"
url = "https://lambdaland.org/posts/2023-10-30_why_no_callcc/"
author = """

            
              Ashton Wiersdorf
            
          """
text = ""
lastupdated = "2026-07-21T09:22:07.242507057Z"
seen = false
+++

Something I’ve wondered about for a little while: why don’t more languages have a [`call/cc`](https://en.wikipedia.org/wiki/Call-with-current-continuation) operator? Having [first-class continuations](/posts/2022-11-17_continutations/) in your programming language gives your programmers a powerful construct. So why do only a handful of languages have it?

The short answer is: it’s tricky to implement efficiently. One way to get `call/cc` is to convert your code into continuation-passing style. Then, `call/cc` simply takes the continuation in that representation and binds it to a variable. Most languages don’t seem to go through a continuation-passing style conversion pass though, so there’s no continuation to grab.

I asked [Matthew Flatt](https://users.cs.utah.edu/~mflatt/) about this today, and his answer was that most languages use the C model of functions: when you call a function, you push the arguments to the function onto a stack along with the return address. Then, when you return, you pop those element back off the stack. To get `call/cc`, you’ve have to copy the entire stack and pass that around.