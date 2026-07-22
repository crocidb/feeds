+++
title = "Complete and Liveness, Safe and Sound"
description = "I have a hard time keeping these terms straight: liveness vs. safety soundness vs. completenessThis is intended as a short guide for myself; maybe someone else will find it useful too! Note that this is all to the best of my knowledge and understanding at the present time; if t"
date = "2022-03-02T00:00:00Z"
url = "https://lambdaland.org/posts/2022-03-02_sound_complete_and_duals/"
author = """

            
              Ashton Wiersdorf
            
          """
text = ""
lastupdated = "2026-07-21T09:22:07.286954602Z"
seen = false
+++

I have a hard time keeping these terms straight:

* liveness vs. safety
* soundness vs. completeness

This is intended as a short guide for myself; maybe someone else will find it useful too! Note that this is all to the best of my knowledge and understanding at the present time; if there be faults, they be the faults of myself. I welcome correction and clarification if I am wrong.

Liveness vs. Safety
----------

Liveness and safety deal with *properties* of a system. Contrast that with soundness and completion, which are adjectives about analyses.

### Liveness ###

A *liveness* property of a system is of the form “something good will eventually happen.” One example is eventual consistency in a concurrent system: we want to know that, after some finite number of steps, our system comes to a consistent state of the world.

Another example might be with a bank: I want it to be the case that when I move money between accounts, the correct amount of money makes it to the destination account. That is something we want to eventually happen, and that’s what makes it a liveness property.

### Safety ###

*Safety* is the dual of *liveness*: in contrast to liveness, a safety property states that “something bad does not occur”. One example of a safety property is in an operating system, nothing prevents the kernel from preempting a task. We never want to get stuck in a state where the kernel cannot regain control of the processor. If our operating system is safe in this regard, we know that we’ll never have the case where a program supersedes the kernel.

Extending the bank analogy, a safety property might be that we never want money lost in a transaction. The program might occasionally fail to deliver money, but no value is accidentally destroyed during a transfer.

Soundness vs. Completeness
----------

Soundness and completeness refer to whole systems that make some kind of decision, e.g. a type system or some kind of a static analysis.

### Soundness ###

From [Wikipedia](https://en.wikipedia.org/wiki/Soundness):

>
>
> [A]n argument is sound if it is both valid in form and its premises are true. Soundness also has a related meaning in mathematical logic, wherein logical systems are sound if and only if every formula that can be proved in the system is logically valid with respect to the semantics of the system.
>
>

*Soundness* means the system is trustworthy. A sound type system, for example, will never tell you that a program is devoid of type errors when there are in fact type errors. Most type systems typically are sound. This means, however, that there are programs which may not contain a type error but that the type checker cannot prove to be devoid of errors.

Another term that may be used for soundness is *correct*. (Though, I believe, this may be highly context-dependent.)

### Completeness ###

The dual of *soundness*: if a system is complete, it means the system can give an answer for every input. It might make some mistakes in reasoning. E.g. with a complete type system, there is no program which it cannot assign a type to (even if it’s a divergent type) but an assertion that a program is type-safe is not necessarily true.

Why can’t we have both soundness and completeness at the same time? Gödel is to blame for that.