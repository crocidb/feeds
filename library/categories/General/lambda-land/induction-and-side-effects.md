+++
title = "Induction and Side-Effects"
description = "Today in my proofs class (MATH 290 at BYU) we talked about the concept induction. I like this, because it sounds a lot like recursion.On the Wikipedia article, there’s an excerpt from a book that illustrates the principle wi"
date = "2018-10-08T00:00:00Z"
url = "https://lambdaland.org/posts/2018-10-08-induction-and-side-effects/"
author = """

            
              Ashton Wiersdorf
            
          """
text = ""
lastupdated = "2026-07-21T09:22:07.338660914Z"
seen = false
+++

Today in my proofs class (MATH 290 at BYU) we talked about the concept [induction](https://en.wikipedia.org/wiki/Mathematical_induction). I like this, because it sounds a lot like recursion.

On the Wikipedia article, there’s an excerpt from a book that illustrates the principle with an analogy using a ladder:

>
>
> Mathematical induction proves that we can climb as high as we like on a ladder, by proving that we can climb onto the bottom rung (the basis) and that from each rung we can climb up to the next one (the step).  
>  — *[Concrete Mathematics](https://en.wikipedia.org/wiki/Concrete_Mathematics)*, page 3 margins
>
>

The problem with this, however, is that climbing a ladder has side-effects! Namely, when you climb up a step, you get tired. Eventually, there comes a point where you get so tired that you collapse from exhaustion, fall off the ladder and smack into the hard, uncaring ground of reality below.

This will happen to you too if your recursive functions have side effects: you code will be *really* hard to debug, and eventually, a bug somewhere in the state of your system will deftly shove your process off the call stack to crash on the cold, hard, uncaring silicon below.