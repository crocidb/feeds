+++
title = "The kind of thinking computer science enables"
description = "I believe computer science plays as integral of a part to a well-rounded liberal arts education as does mathematics and linguistics. Why? A liberal arts education is designed to help you think in new and better ways. Computer science teaches novel ways of thinking, reasoning, and"
date = "2023-05-11T00:00:00Z"
url = "https://lambdaland.org/posts/2023-05-11_thinking_cs/"
author = """

            
              Ashton Wiersdorf
            
          """
text = ""
lastupdated = "2026-07-21T09:22:07.254789965Z"
seen = false
+++

I believe computer science plays as integral of a part to a well-rounded liberal arts education as does mathematics and linguistics. Why? A liberal arts education is designed to help you think in new and better ways. Computer science teaches novel ways of thinking, reasoning, and approaching problems that are hard to get anywhere else.

I took a class on pedagogy when I encountered this puzzle. I answered the question easily, and I caught myself using reasoning patterns from work in programming coming to the forefront.

Consider the following problem: suppose you have four cards, each of which has a letter on one side, and a number on the other. The cards are arranged like so:

```
+-------+  +-------+  +-------+  +-------+
|       |  |       |  |       |  |       |
|   A   |  |   2   |  |   B   |  |   3   |
|       |  |       |  |       |  |       |
+-------+  +-------+  +-------+  +-------+
```

Suppose the cards follow the rule that, if a card has a vowel on one side, the other side *must* be an even number. What is the smallest number of cards you need to turn over to verify that the rule holds for these cards? Which cards?

Give yourself a second to think about it, and try and figure it out.

<details><summary>Answer</summary> The answer is 2, and the cards are A and 3 </details>

Did you get that? I translated the rule into the logical implication *if vowel → then even number*. It says nothing about the opposite side of a card if the number is even. Thus, we only need to check cards `A` and `3`.

The point of the exercise that we were doing was to showcase how difficult reasoning with abstract symbols is. After showing this example with the cards, our instructor gave us another equivalent problem, but this time using familiar terms around conditions on the legal drinking age. The point was that familiar analogies reduce cognitive load, thereby freeing the students’ minds for grasping bigger and more important ideas.

Yet *I* found it easy to answer the first and more abstract problem. I’m not a genius or anything—I’ve just practiced this kind of reasoning with computer science. Anyone can do that.

Computer science teaches abstract reasoning in a way that nothing else can. I suppose once you get far enough into mathematics you get to experience a lot of the same sorts of ideas—but only math majors ever make it that far. Programming forces you to confront abstract reasoning about conditions and rules and how they combine from the outset.

Moreover, teaching programming can be fun! You don’t have to go all out into gamification to elicit delight in seeing a computer follow your instructions. The feedback loop between writing code and getting a response is so tight; I think students have an easier time in computer science pushing themselves to reason through problems because they can get fast immediate and real feedback from the computer.

I think more people should learn programming to learn how to think like a programmer. We also need to do a better job designing our CS courses in high school and university to focus on this kind of transferable skill, and we need to de-emphasize whatever `$hot_new_framework` is being pushed by industry in the classroom.