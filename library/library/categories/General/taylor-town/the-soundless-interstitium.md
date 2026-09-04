+++
title = "the soundless interstitium"
description = "Programmers sometimes care about correctness."
date = "2024-09-24T00:00:00Z"
url = "https://taylor.town/soundless"
author = "Taylor Troesh"
text = ""
lastupdated = "2026-04-20T13:20:40.253326875Z"
seen = true
+++

I received a very fun email from [Kartik Agaram](http://akkartik.name) in response to my rant on ["irresponsible" servers](https://taylor.town/irresponsible-servers):

>
>
> I'm reminded of a chapter from Godel, Escher, Bach where Achilles and the Tortoise are arguing some point of logic. From memory, Achilles writes down:
>
>
>
> 1. A -\> B
> 2. A
>
>
>
> Therefore B. But the Tortoise is not persuaded. He says, "where does it say that A and A -\> B =\> B?" So Achilles writes down a new rule:
>
>
>
> 1. A and (A -\> B) -\> B
>
>
>
> But now the Tortoise refuses to accept the next proposition. And on and on.
>
>
>
> It seems valuable to create infrastructure for specifying contracts. But a contract also requires good faith and/or an enforcement mechanism…
>
>

semantics
----------

A formal system is *unsound* if a contradiction can be constructed from a blank slate.

 More precisely, a [formal system](https://en.wikipedia.org/wiki/Formal_system) is [*sound*](https://en.wikipedia.org/wiki/Soundness) [iff](https://en.wikipedia.org/wiki/If_and_only_if) all its provable formulas are valid.

[When Gödel murdered math](https://taylor.town/bang-bang), he proved that any formal system that [can derive all true statements](https://en.wikipedia.org/wiki/Completeness_(logic)) is guaranteed to be unsound.

And so we know that every sound system has [holes](https://en.wikipedia.org/wiki/Independence_(mathematical_logic)).

 A [sound](https://en.wikipedia.org/wiki/Soundness) [system](https://en.wikipedia.org/wiki/Formal_system) is not a [sound system](https://en.wikipedia.org/wiki/Sound_reinforcement_system).

I call these holes "soundless" [(in its system)](https://lobste.rs/s/f9fzeu/soundless_interstitium#c_vrnr3d), since they are neither sound nor unsound.

 The fancy term for unprovable/undecidable sentences is ["independence"](https://en.wikipedia.org/wiki/Independence_(mathematical_logic)), e.g. [choice *is independent of* ZF](https://en.wikipedia.org/wiki/Axiom_of_choice)

applied semantics
----------

Programmers sometimes care about correctness. Good compilers ensure that their programs won't break in obvious ways, i.e. the tree falls in the forest and makes a big sound.

Programming languages offer varying combinations of expressiveness and soundness. Many folks [choose languages like Elm](https://taylor.town/elm-2023) for its correctness; many also make equally good arguments for vanilla Javascript's ease/flexibility.

While these languages may be sound, much of the interesting interstitium between clients/servers remains soundless.

Lately, I've been tilting at ["irresponsible" servers](https://taylor.town/irresponsible-servers). If servers could offer guarantees about uptime/protocol, correctness could percolate down to my program *at compile time*.

 Seriously, wouldn't it be nice to deploy a program and be certain that its network dependencies won't break for a few months? Or at least be able to blame a service provider with computational certainty?

Gödel's incompleteness theorems guarantee that soundlessness creeps into sound systems, and that's totally okay; a tattered shirt can still protect you from your nearest star.

Well, this seems rosy and [maybe even possible](https://taylor.town/irresponsible-servers), but who will enforce contracts? Good question! [Cryptocurrency is probably dead](https://www.youtube.com/watch?v=EiZhdpLXZ8Q), but trustless contracts might be salvageable -- or, even better, embrace [cheap](https://potato.cheap) tech and trust more.

 For [scrapscript](https://scrapscript.org), the architecture is federated, which means you have to trust *somebody*, but you can choose which somebodies you deem trustworthy. This becomes valuable if, for example, your e-mail provider becomes [not not-evil](https://en.wikipedia.org/wiki/Don't_be_evil).

I don't know what "enough" soundness sounds like, but REST/gRPC/SOAP/etc. seem subpar. [Traffic doubles every 18 months](https://en.wikipedia.org/wiki/Edholm's_law), yet the internet highway experts insist that these paper guardrails are sufficient. Good protocols protect people.

I don't need fancy typeclasses; I don't need smart contracts nor intermediate contract-checkers. I just want my programs to fail loudly as soon as I do something stupid, and especially when that stupidity spans multiple computers.

Anyway, it sometimes seems like trillions of trees are silently falling between every forest. Somebody should probably do something.