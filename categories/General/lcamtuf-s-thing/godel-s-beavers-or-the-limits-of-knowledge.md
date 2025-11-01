---
title = "Gödel's beavers, or the limits of knowledge"
description = "Can you examine infinitely many integers in finite time? Are there numbers you're not allowed to know? Can a monkey beat a beaver in a fair fight?"
date = "2025-06-30T03:29:31Z"
url = "https://lcamtuf.substack.com/p/monkeys-typewriters-and-busy-beavers"
author = "lcamtuf"
text = ""
lastupdated = "2025-10-22T08:57:30.084067964Z"
seen = true
---

If you follow geeky news, you might have came across a computer science concept known as *busy beavers.* That said, unless you’re a mathematician by training or trade, the articles make it hard to understand what the concept means and why you should (or shouldn’t) care.

In today’s article, I’d like to take a stab at answering this in an accessible way — and in the process of doing so, dive into some of the mind-bending limits of algorithmic knowledge. If you have some experience with software, it should be easy to follow along, and I think it’ll be worth your time.

### Quick recap: the halting problem ###

The halting problem is the most famous concept in theoretical computer science. Most simply, it states that there in an idealized computing environment, there are algorithms whose outcomes can’t be decided by another algorithm. This is usually reduced to the question of whether a program ever terminates. That said, halting is not special: we could be as well asking whether it can reach any other state.

The basic proof by contradiction is to imagine that we have a function called *halts(x)*. Its implementation doesn’t concern us; let’s say we found it in an ancient book of forbidden lore. The function, given the specification of an arbitrary program *x,* returns *true* if the program halts or *false* if it doesn’t. If such an algorithmic oracle exists, we can construct the following code:

>
>
> ```
> function foo() {
>   if (halts(foo)) loop_forever();
> }
> ```
>
>

This is akin to asking a fortune-teller if you’re going to tip them and then doing the opposite. This program doesn’t halt if and only if the oracle deems it to be a halting program, so the existence of *halts(x)* creates a paradox. We must conclude that, just like our tip-predicting clairvoyant, an infallible halting oracle can’t exist.

Note that the proof doesn’t deal with computational complexity; it deals with logical impossibility. It also doesn’t say that *your* program is undecidable — just that a mean-spirited programmer could theoretically create one.

### A constrained-memory computer ###

Fundamentally, a computing environment consists of “state” at time *t,* along with a fixed set of rules used to derive a new state for *t + 1.* Although there are several ways to slice and dice it, we could say that the state is a combination of RAM contents, CPU registers, and so on; while the rulebook for state transitions (*state[t]* *→ state[t + 1]*) is the instruction set of the CPU.

Regardless of the size of that instruction set, in the absence of external input, any deterministic computer with finite memory can only enter a limited number of states. For example, a toy architecture equipped with 16 bits’ worth of registers and RAM can only be in one of 2<sup>16</sup> distinct runtime states. A “maximal” execution environment can cycle through all 2<sup>16</sup> possibilities, but after that, the machine must either halt or re-enter one of its prior configurations. In the latter case, because the system is deterministic and because it can’t see anything outside its universe of 16 bits, the computer becomes stuck in an endless loop. If all the parameters are the same, it must necessarily make the exact same control-flow decisions over and over again.

This allows us to make an interesting observation: any computer algorithm with a state entirely contained in *n* bits of memory will either stop within 2*<sup>n </sup>*cycles or it will never terminate. In a finite-memory setup, the halting problem is conceptually decidable — albeit not always in a reasonable time.

Practicalities aside, that seems to give us a plausible implementation of *halts(x):* we just need to emulate any given program for 2*<sup>n </sup>*cycles, returning *true* if the emulator terminated in that finite time window or *false* if it didn’t. The possibility sounds like a way to revive the earlier paradox:

>
>
> ```
> function foo() {
>   if (halts(foo)) loop_forever();
> }
> ```
>
>

Luckily, such an implementation of *halts(x)*, running on a machine with *n* bits of total state, can only emulate programs that require fewer than *n* bits. After all, we need some extra memory to actually keep track of the number of execution cycles and bail out once they exceed 2*<sup>n</sup>*. In other words, recursive emulation of *foo()* is not possible and the contradiction is neatly averted… for now.

### A constrained-instruction-set computer ###

In the preceding section, we talked about a computer with a limited amount of memory but an arbitrarily large rulebook for state transitions. We can also approach it the other way round: we can envision a machine with unbounded memory but a limited CPU instruction set.

Before we proceed, we ought to define the terms a bit more precisely: *“one extra bit of internal state”* was pretty clear, but *“one extra instruction”* is not. The complexity of CPU instructions that are invented in an ad hoc way can vary a great deal, so we need to rein in our creativity to make the problem tractable.

The usual method is to turn to what’s known as the Turing machine. The specifics aren’t important, but briefly: the machine consists of a read-write head positioned over a potentially endless run of tape. The machine has a single internal register that can take one of *m* values. The tape itself is divided into cells; each cell stores a symbol from some finite alphabet (here, just “0” or “1”). For the purpose of this particular experiment, the cells are assumed to be all zeroes at the start.

In this model, instructions are entries in the rulebook that specify what to do based on the contents of the internal register together with the symbol read from tape. For each entry, the rulebook specifies just three things: the new value to put in the internal register, the symbol to write to the current tape location, and the direction to advance the head in (one cell to the left or to the right). Further, one of the instructions is designated as “halt”.

Because there’s no user input, each machine constructed this way can only execute a single, static algorithm specified by the rulebook. The rulebook can encode arithmetic operations and conditional branching, so the model is good enough to handle any calculation we can do with a real computer (albeit very inefficiently).

Recall that in the earlier case of a machine with limited memory but an unbounded number of instructions, we could easily argue that a terminating algorithm can’t run for more than *2<sup>n</sup>* cycles, where *n* was the amount of memory (in bits). But is there a similar limit for a machine designed the other way round — with unlimited memory and a fixed instruction set?

Well, it would seem so: the effective size of the instruction set is capped by the tape alphabet (2) and the possible states of an internal register (*m*), because these are the selectors used to look up the next instruction to execute; the complexity of each instruction is capped too. It follows that for each chosen *m*, there’s a finite number of algorithms we can encode in the instruction set of the CPU. The number of possible combinations is not worth deriving or memorizing, but if you’re curious, it’s *(4m+4)<sup>2m</sup>*.

Now, some of the constructed algorithms will loop forever and some will terminate — but because the overall cohort has a finite size, there ought to be a specific terminating algorithm that runs the longest of the bunch. We call this winning entry the *m-th* “busy beaver” and denote the execution time as *BB(m)*. Any algorithm in the same size class that runs longer than *BB(m)* is a non-terminating endless loop.

For very small values of *m*, the worst-case terminating program can be found by brute force: we simply need to enumerate all possible CPU configurations, quickly reject the ones that obviously halt or loop forever, and then zero in on a comparatively small number of ambiguous cases to prove if they terminate. That said, this approach is successful only for *m ≤* 5; past that point, the complexity gets out of hand. Worse, in contrast to the simple *2<sup>n</sup>* rule for limited-memory scenarios, there can be no algorithm to find *BB(m)* for an arbitrary *m.*

This claim might sound suspect, but it can be thought of as a straightforward consequence of the halting problem. If we had an algorithmic way to compute *BB(m)* for any *m*, this would give us a general — if impractical — way to implement *halts(x)*: we could simply simulate any given algorithm of size *m* for *BB(m)* cycles. If it halts, we return *true*; if it doesn’t halt in the allotted time, it must belong to the subset of programs of length *m* that do not terminate, so we can return *false*. But we know that the existence of *halts(x)* creates a paradox, and in this instance, the issue isn’t resolved by the presence of a memory limit. We conclude that a general method of calculating *BB(m)* must be out of reach of a computer algorithm.

This observation, in itself, doesn’t stop us from reasoning about busy beaver numbers to *some* extent. For example, we can always establish the lower bound; we can organize a contest where people try to one-up each other with terminating programs that can be reasoned to run longer than the previous winning entry. Because of such competitions, we know that as *m* increases, the maximum number of execution cycles explodes quite dramatically. In fact, *BB(6)* is known to have far more digits than could fit in the physical universe.

But again, let’s not concern ourselves with practicality. Fundamentally, if *BB(m)* is a number, does its existence have any interesting implications for life, the universe, and everything?

### A monkey with a typewriter ###

It does, in a way! Assuming that memory is no object, it’s not particularly hard to write a small program that would numerically probe an unsolved mathematical problem for all eternity, halting only if an inconsistency is found. In particular, we know that a Turing machine with *m* = 25 register values is enough to implement an algorithm that iteratively tests the Goldbach conjecture. The conjecture is that every even natural number greater than 2 is a sum of two primes.

The program sequentially checks every even positive integer to confirm this property. Common sense dictates that this approach can’t prove the Goldbach conjecture in finite time: there are infinitely many numbers to examine! But here’s where it gets wacky: if we *somehow* knew the value of *BB(25)*, we could argue that the verifier program only needs to be executed for that many cycles. After all, if it doesn’t stop in at most *BB(25)* steps, it necessarily belongs to the subset of *m = 25* programs that never terminate. And if we can show that the checker never halts, the Goldbach conjecture must be true. At that point, we can unplug the Turing machine and take a victory lap.

That’s… a bit mind-blowing. It’s as if our concept of infinity is broken in some way.

At the same time, I’m tempted to counter this with a less glamorous thought experiment: let’s imagine a monkey with a typewriter. The monkey is taught to write every possible string, starting from length 1 and moving up:

>
>
> **Length 1:** *a, b, c, … z*  
> **Length 2:** *aa, ab, ac, … ba, bb, bc, … zz*  
> **Length 3:** *aaa, aab, aac, … aba, abb, abc, … zzz*
>
>

And so on. If the monkey keeps typing, and if the Goldbach conjecture is provably true, we can be sure that the monkey — despite being engaged in an endless task — will produce a verifiable proof in finite time.

Is that equally mind-blowing? If not, why?

### Well, but hold on… ###

One natural objection to the monkey experiment is that the busy beaver approach seems to be giving us more information: a specific number of cycles we need to wait to declare success. It’s akin to being able to tell in advance that the monkey-produced Goldbach proof is going to be exactly 6,783 words long.

Except, not really? *BB(25)* is not a number we can reason about: it appears to be essentially unknowable. We could perhaps stumble across it by some non-algorithmic means; until then, the concept feels about as meaningful as saying that the monkey proof will be “potato purple” words long. It’s a label, but the label doesn’t mean anything beyond a tautology: *“keep going as long as needed to prove the Goldbach conjecture and not a single CPU cycle more”.*

That might seem like a weak objection, but the issues run deeper than *temporarily* not knowing what the number might be. Past a certain point, these values just get a tad too spicy for our system of mathematics. To explain the issue, imagine a Turing machine programmed to verify standard math, the most common foundation of which is the Zermelo–Fraenkel set theory (ZFC). ZFC is just a small collection of axioms about sets (e.g. *“two sets are equal if and only if they contain the same elements”*); it’s good enough to formalize virtually all of mathematics and it avoids some known paradoxes that plagued several of the earlier attempts.

If you want to prove that ZFC is 100% paradox-free and if you’re not in a hurry, you can just write another Turing machine algorithm can iterates through every axiom of ZFC, then applies every available rule of inference to derive a collection of second-order mathematical truths that follow from the starting axioms. The program can then repeat the process for the resulting corpus, continuing forever and halting only if it finds a pair of statements that contradict each other. An implementation that does something analogous actually exists: the current version requires a Turing machine with 643 register values, but many folks believe that the number — let’s call it *z* — can be much lower than that.

As before, if ZFC is consistent, this algorithm will never halt, because among other things, it will need to check the properties of every natural number. But if ZFC is busted, the machine must stop after finding a contradiction in at most *BB(z)* steps.

Yet… we can’t have an algorithm like that.

### You can’t Gödel away with this! ###

The issue is that if the value of *BB(z)* is even theoretically knowable in ZFC, we can argue that an exhaustive proof of the consistency of the axiom system can be executed “from within” the system in finite time. Again, we have no obvious way to find the value of *BB(z)*, but that’s irrelevant. In principle, if a race of spacefaring aliens showed up and handed the number to us, and if we could prove within ZFC that we’ve been given the correct value, there’d be nothing else standing in the way.

However we obtain the number, the possibility of constructing the proof clashes with another seminal thought experiment: Gödel’s incompleteness theorem. Kurt Gödel started with a seemingly idle philosophical question; simplifying a bit, he asked if it’s possible to have a system of mathematics (*T)* that is simultaneously internally consistent, expressive enough to be useful, and complete in the sense of being able to prove or disprove every well-formed statement expressed in the language of logic.

This is interesting to ponder because if such an axiom system exists, we probably want to use it in lieu of any lesser systems that may contain unprovable statements! Yet, Gödel showed that there can be no such thing. He started by outlining a scheme for encoding formal logic statements as natural numbers in a way that preserved a numerical relationship between the statement and its constituent parts. That is to say, if number *p* encoded a statement along the lines of *“if \<a\> then \<b\>”,* then the numbers representing sub-statements *\<a\>* and *\<b\>,* along with the *“if … then …”* construction, would embedded in it and unambiguously distinguishable. If you need a crude analogy, think of how we use ASCII codes to represent text.

The trick reduced inference to simple arithmetic: if the number representing statement *\<a\>* was already on the pile labeled “truth”, we could put the number representing *\<b\>* on the same pile by just doing some mechanistic arithmetic on *p*. Note that I use “truth” in scare quotes: Gödel’s scheme wasn’t concerned with objective truth; it dealt with *demonstrability* — i.e., the ability to infer one thing from another to iteratively construct some universe of “demonstrated” numbers. His goal was simply to show that a complete apparatus for formal reasoning exists within the basic arithmetic capabilities of the parent system, *T*. This was the part you couldn’t really futz with if you wanted the resulting mathematics to have working addition, multiplication, and a full range of integers.

Gödel also showed how to mechanically construct numbers that encode the proof we just carried out (*“\<a\>; if \<a\> then \<b\>; therefore \<b\>”*). With this done, he pulled off his *coup de grace*: he presented a method to manipulate the resulting numbers in a way that amounted to replacing one portion of an expression with a chosen new term. This allowed him to construct an “evil” self-referential statement — let’s call it G — that effectively encoded “*this sentence has no proof in T”* (or, more precisely: *G* = *“G isn’t among the system’s demonstrated numbers“)*.

What are the implications of this evil construct? Well, if *T* isn’t consistent — if it already allows you to prove contradictory statements — then no harm, no foul. But if the system *T* is to be consistent, it must necessarily not allow that specific number to manifest through the application of arithmetic-based logic. Note that we don’t care *why* would anyone design the system to allow this to happen. The only point is that proving *G* within Gödel’s embedded logic system would create a contradiction — and thus, a loss of consistency. So, there you have it: any *T* that’s consistent and reasonably expressive can’t possibly be complete because one can always construct, but not prove, Gödel’s sentence. Philosophers weep.

This may seem insignificant, but Gödel didn’t stop there! He noted that if you’re a meta-mathematical creature on the outside that system of mathematics, and if you can establish to your satisfaction that system *T* is consistent, you must also conclude that Gödel’s sentence has no proof in *T*. It doesn’t matter how you figured out the consistency of *T*; all that matters is that, per the earlier discussion, only inconsistent systems would allow *G* to manifest.

This means that from your meta-mathematical vantage point, what the evil sentence says is indisputably correct: it says it has no proof in *T* **and** from the consistency of system *T*, you know the proof doesn’t exist. Your thought process can be formalized using Gödel’s syntax; that is, we can show that solely through the operation of arithmetic-based logic, any hypothetical proof of consistency *demonstrates* a new sentence: *“G has no proof in T”.* For now, this new sentence exists as a thought experiment in the meta-mathematical vacuum*,* alongside with you and the unspecified proof of consistency that you purportedly have.

But this gets us to Gödel’s second question: can *T* itself prove its own consistency? In other words, can a practically useful system of mathematics use its own axioms to establish with certainty that it contains no contradictions?

If it can, then by analogy to the earlier “outsider” scenario, the proof of consistency necessarily introduces a new sentence (*N*) into the system: *N =* *“G has no proof in T”.* In this case, the sentence is no longer stuck in a meta-mathematical vacuum; it becomes an internal part of *T.* At first blush, this is harmless: *N* merely provides evidence of what *G* already says about itself. But hold on — this proves *G* true and therefore contradicts the self-referential claim of unprovability that’s baked into the original Gödel’s sentence*.* Oops!

There’s only one way to fix this mess: we must conclude that systems in which *G* can be constructed can’t possibly show their own consistency.

### Back to beaver land ###

Gödel’s second proof tells us that if ZFC is consistent — we like to think so! — then we can’t be allowed to build an in-system proof of that exact property.

But before we took the scenic detour through Kurt Gödel’s mind, we were discussing an algorithm that evidently could prove the system’s consistency in finite time. Our solution was predicated on just two things: we needed a specific Turing machine program (done) and we needed to know the value of a certain integer, *BB(z)*. Again, the value can’t be found by a computer, but we figured that we could probably procure it on the intergalactic dark web. If so, we have to add a third requirement: we need to show under ZFC that we have the genuine article and not a knock-off product. For a valid in-system proof, we can’t just say *“this is BB(z), trust me bro”.*

This leads to the final disappointment: since the first part is done and the second is at least conceptually possible, it must be that we’re forbidden from ever completing the third step. That is to say, ZFC must have no way of verifying the correctness of the number if the value *comes to us in a dream.* A guaranteed enigma; the gods of mathematical abstraction clearly don’t like what we’re trying to do.

[

<img src="https://substackcdn.com/image/fetch/$s_!PksN!,w_1456,c_limit,f_auto,q_auto:good,fl_progressive:steep/https%3A%2F%2Fsubstack-post-media.s3.amazonaws.com%2Fpublic%2Fimages%2Ff7ca3d85-205f-47ca-b129-921a4ac7c6e6_2000x1249.jpeg" width="1456" height="909" data-attrs="{&quot;src&quot;:&quot;https://substack-post-media.s3.amazonaws.com/public/images/f7ca3d85-205f-47ca-b129-921a4ac7c6e6_2000x1249.jpeg&quot;,&quot;srcNoWatermark&quot;:null,&quot;fullscreen&quot;:null,&quot;imageSize&quot;:null,&quot;height&quot;:909,&quot;width&quot;:1456,&quot;resizeWidth&quot;:null,&quot;bytes&quot;:282901,&quot;alt&quot;:null,&quot;title&quot;:null,&quot;type&quot;:&quot;image/jpeg&quot;,&quot;href&quot;:null,&quot;belowTheFold&quot;:true,&quot;topImage&quot;:false,&quot;internalRedirect&quot;:&quot;https://lcamtuf.substack.com/i/167104601?img=https%3A%2F%2Fsubstack-post-media.s3.amazonaws.com%2Fpublic%2Fimages%2Ff7ca3d85-205f-47ca-b129-921a4ac7c6e6_2000x1249.jpeg&quot;,&quot;isProcessing&quot;:false,&quot;align&quot;:null,&quot;offset&quot;:false}" class="sizing-normal" alt="" srcset="https://substackcdn.com/image/fetch/$s_!PksN!,w_424,c_limit,f_auto,q_auto:good,fl_progressive:steep/https%3A%2F%2Fsubstack-post-media.s3.amazonaws.com%2Fpublic%2Fimages%2Ff7ca3d85-205f-47ca-b129-921a4ac7c6e6_2000x1249.jpeg 424w, https://substackcdn.com/image/fetch/$s_!PksN!,w_848,c_limit,f_auto,q_auto:good,fl_progressive:steep/https%3A%2F%2Fsubstack-post-media.s3.amazonaws.com%2Fpublic%2Fimages%2Ff7ca3d85-205f-47ca-b129-921a4ac7c6e6_2000x1249.jpeg 848w, https://substackcdn.com/image/fetch/$s_!PksN!,w_1272,c_limit,f_auto,q_auto:good,fl_progressive:steep/https%3A%2F%2Fsubstack-post-media.s3.amazonaws.com%2Fpublic%2Fimages%2Ff7ca3d85-205f-47ca-b129-921a4ac7c6e6_2000x1249.jpeg 1272w, https://substackcdn.com/image/fetch/$s_!PksN!,w_1456,c_limit,f_auto,q_auto:good,fl_progressive:steep/https%3A%2F%2Fsubstack-post-media.s3.amazonaws.com%2Fpublic%2Fimages%2Ff7ca3d85-205f-47ca-b129-921a4ac7c6e6_2000x1249.jpeg 1456w" sizes="100vw" loading="lazy">

](https://substackcdn.com/image/fetch/$s_!PksN!,f_auto,q_auto:good,fl_progressive:steep/https://substack-post-media.s3.amazonaws.com/public/images/f7ca3d85-205f-47ca-b129-921a4ac7c6e6_2000x1249.jpeg)

What did we learn? Well, it’s interesting that we’ve come full circle: we started with a proof that the halting problem can’t be decided. We then introduced busy beaver numbers as a way to circumvent the limitation and construct finite-time proofs; but in the end, we had to conclude that in the general case, such proofs can’t be carried out because Kurt Gödel’s ghost shows up and puts the requisite integer on a shelf we can’t reach.

The inescapable conclusion is that Gödel's incompleteness theorem and the halting problem are two sides of the same coin: they arrive at nearly the same underlying truth, even if they do so from different angles and using dissimilar terminology. If one of the proofs is easy to grasp and the other seems hard, it’s an indictment of the abstractions we use, not one’s intellect.

I suspect the most tangible result we might be getting out the busy beaver experiment is a fairly mundane hierarchy of computability for open problems in mathematics. If the best BB-style “solver” of the Goldbach conjecture needs *m* = 25, while the best approach to the Riemann hypothesis needs *m* = 744, this tells us… well, *something* new. That said, it’s not clear to me to which extent these scores are a fundamental reflection on computability, and to which extent they’re just an artifact of the incredible clunkiness of Turing machines.

*👉 For another article about the foundations of modern math, [click here](https://lcamtuf.substack.com/p/how-has-mathematics-gotten-so-abstract). For more algorithms and math trivia, head over [to this page](https://lcamtuf.substack.com/p/algorithms-and-math-trivia).*

[Subscribe now](https://lcamtuf.substack.com/subscribe?)