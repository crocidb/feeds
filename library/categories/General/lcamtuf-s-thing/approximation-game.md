+++
title = "Approximation game"
description = "The number 22/7 and the pigeon flock of Peter Gustav Lejeune Dirichlet."
date = "2026-02-28T02:26:51Z"
url = "https://lcamtuf.substack.com/p/approximation-game"
author = "lcamtuf"
text = ""
lastupdated = "2026-03-18T21:57:45.306489043Z"
seen = false
+++

In some of the earlier articles on this blog, we talked about the [nature of real numbers](https://lcamtuf.substack.com/p/unreal-numbers) and the [meanings of infinity](https://lcamtuf.substack.com/p/how-has-mathematics-gotten-so-abstract). The theory outlined in these posts is interesting but also hopelessly abstract. It’s as if we’re inventing make-believe worlds that have no discernible connection to reality.

In today’s post, we’ll examine a cool counterexample: an outcome of an numerical experiment that can be backed up with fairly simple proofs, but that makes sense only if you take a step back to consider the construction of real numbers and rationals.

We start by picking a real number *r*. Your job is to approximate it as closely as possible using a rational fraction *a / b* with a reasonably small denominator. The approximation can’t be the same as *r.* Is this task easier if *r* itself is rational or irrational?

Make a guess and let’s dive in. For simplicity, we’ll stick to a positive *r* and positive fraction denominators throughout the article.

### Defining “good” ###

For a chosen denominator *b*, it’s pretty easy to find the value of *a* that gets us the closest to the target *r*. We must consider two cases: the largest “low-side” fraction that’s still less than *r*; and the smallest “high-side” fraction greater than *r.* If there’s a rational fraction that matches *r* exactly, that solution is prohibited by the rules of the game; we need to pick one of the nearby values instead.

If you *wanted to* find an exact match, you could try *a<sub>ideal</sub> = r · b*; this makes the *a / b* fraction equal to *r · b / b =* *r*. That said, *r · b* might not be an integer (or even a rational number), so even without the added constraint, the approach is usually a bust.

If we round the value up (⌈*r · b*⌉), we get a number that is equal or greater than *a<sub>ideal</sub>*; if it’s greater, the difference between the two values will be less than 1. In other words, we can write the following inequality:

This is saying that the rounded-up number may be equal to the ideal solution needed to match *r* exactly, or it might overshoot the target, but always by less than the minimum possible increment of the numerator in the *a / b* fraction.

The result is *almost* what we need, but once more, the rules prohibit approximations that are exactly equal to *r*. The workaround is to subtract 1 from all sides of the inequality:

The effectively tells us that the middle term — ⌈*r · b*⌉ - 1 *—* is always less than the value needed to match *r*, but the difference is never greater than a single tick of the numerator. We’re as close as we can be; the value of *a* for the optimal low-side approximation (*a / b* \< *r)* is:

We can follow the same thought process to find the high-side estimate (*a / b* \> *r)*; this time, we round the product down and then add 1:

Finally, the error (*ε*) associated with any *a / b* can be easily calculated as:

We have previously established that if we pick *a<sub>low </sub>*or *a<sub>high</sub>*, the error can’t exceed one tick of the numerator, which works out to ± 1/*b*. As a practical example, if we’re trying to approximate *r =* 2 using *b =* 5, the best inexact solutions are 9/5 = 1.8 on the low side and 11/5 = 2.2 on the high side; they both have an error of 1/*b* = 0.2*.*

Next, we’ll try to examine if the error can be less. If we find any approximations that are better than the worst-case scenario — i.e., that satisfy *ε* \< 1/*b* — we’re gonna call them 1-*good.*

As an inspection aid, we can also define a normalized score *s* calculated by multiplying *ε* by *b*:

The equation keeps the maximum error at 1 regardless of the denominator we’ve chosen. By that metric, a 1-good approximation is associated with *s* \< 1.

### The rational test case ###

Now that we have the mechanics spelled out, let’s take *r =* 1/4 and analyze the optimal solutions for some initial values of *b:*

We find that many approximations are 1-good (*ε* \< 1/*b*, *s* \< 1) and outperform their peers; for example, 1/5 = 0.2 is better than 2/6 ≈ 0.333. Nevertheless, the results are underwhelming: the values diverge from the 1/*b* baseline by small factors that are stuck on repeat. If we plot a larger sample, we get:

[

<img src="https://substackcdn.com/image/fetch/$s_!ZWwG!,w_1456,c_limit,f_auto,q_auto:good,fl_progressive:steep/https%3A%2F%2Fsubstack-post-media.s3.amazonaws.com%2Fpublic%2Fimages%2F0009ed6d-03a4-4777-973b-afcb6457f9dd_2500x1250.png" width="1456" height="728" data-attrs="{&quot;src&quot;:&quot;https://substack-post-media.s3.amazonaws.com/public/images/0009ed6d-03a4-4777-973b-afcb6457f9dd_2500x1250.png&quot;,&quot;srcNoWatermark&quot;:null,&quot;fullscreen&quot;:null,&quot;imageSize&quot;:null,&quot;height&quot;:728,&quot;width&quot;:1456,&quot;resizeWidth&quot;:null,&quot;bytes&quot;:151620,&quot;alt&quot;:null,&quot;title&quot;:null,&quot;type&quot;:&quot;image/png&quot;,&quot;href&quot;:null,&quot;belowTheFold&quot;:true,&quot;topImage&quot;:false,&quot;internalRedirect&quot;:&quot;https://lcamtuf.substack.com/i/189104530?img=https%3A%2F%2Fsubstack-post-media.s3.amazonaws.com%2Fpublic%2Fimages%2F0009ed6d-03a4-4777-973b-afcb6457f9dd_2500x1250.png&quot;,&quot;isProcessing&quot;:false,&quot;align&quot;:null,&quot;offset&quot;:false}" class="sizing-normal" alt="" srcset="https://substackcdn.com/image/fetch/$s_!ZWwG!,w_424,c_limit,f_auto,q_auto:good,fl_progressive:steep/https%3A%2F%2Fsubstack-post-media.s3.amazonaws.com%2Fpublic%2Fimages%2F0009ed6d-03a4-4777-973b-afcb6457f9dd_2500x1250.png 424w, https://substackcdn.com/image/fetch/$s_!ZWwG!,w_848,c_limit,f_auto,q_auto:good,fl_progressive:steep/https%3A%2F%2Fsubstack-post-media.s3.amazonaws.com%2Fpublic%2Fimages%2F0009ed6d-03a4-4777-973b-afcb6457f9dd_2500x1250.png 848w, https://substackcdn.com/image/fetch/$s_!ZWwG!,w_1272,c_limit,f_auto,q_auto:good,fl_progressive:steep/https%3A%2F%2Fsubstack-post-media.s3.amazonaws.com%2Fpublic%2Fimages%2F0009ed6d-03a4-4777-973b-afcb6457f9dd_2500x1250.png 1272w, https://substackcdn.com/image/fetch/$s_!ZWwG!,w_1456,c_limit,f_auto,q_auto:good,fl_progressive:steep/https%3A%2F%2Fsubstack-post-media.s3.amazonaws.com%2Fpublic%2Fimages%2F0009ed6d-03a4-4777-973b-afcb6457f9dd_2500x1250.png 1456w" sizes="100vw" loading="lazy">

](https://substackcdn.com/image/fetch/$s_!ZWwG!,f_auto,q_auto:good,fl_progressive:steep/https://substack-post-media.s3.amazonaws.com/public/images/0009ed6d-03a4-4777-973b-afcb6457f9dd_2500x1250.png)*Approximation scores for r = 1/4.*

In this log-scale plot, I also included a diagonal line that represents error values decreasing with the *square* of the denominator (1/*b*²). Approximations for which the error dips below this line would be markedly better than the ones that merely dip below 1/*b*. We can label these 1/*b*² solutions as *2-good*.

In the plot, we see two trivial approximations below the 2-good line, but for a rational *r,* we can prove that the effect can’t last. We start by rewriting *r* as a fraction of two integers: *r* = *p* / *q*. The 2-goodness criteria is *ε* \< 1/*b*². We’ve previously defined *ε* = | *r - a/b* | and per the rules of the game, valid solutions must have *ε* greater than zero. Putting it all together, we can write this inequality that spells out the requirements for 2-good approximations of rationals:

To tidy up, we can bring the middle part to a common denominator:

The denominator is positive, so there’s no harm in taking it out of the absolute-value section and multiplying all sides of the inequality by it:

All the variables here are integers. If *b ≥ q*, the fraction on the right is necessarily ≤ 1. That creates an issue because it implies the following:

Again, the middle section comprises of integers, so it can’t possibly net fractions. In effect, the equality says: 0 *\< integer \<* 1; there’s no integer that satisfies this criterion, so the assumption of *b ≥ q* leads to a contradiction. If any inexact 2-good approximations of rational numbers exist, they can only exist for *b \< q.*

That’s where we look next. If *r* = *p / q* is given at the start, then *q* doesn’t change and the *b* \< *q* condition restricts the solutions to integer *a / b* fractions with smaller denominators. There’s only a finite number of these.

To address one natural objection, we can’t get more latitude for *b* by increasing *q* in tandem with *p* — that is, we can’t rewrite *r* = 1/2 as *r* = 4/8. If we do, we go from the original inequality:

…to:

If you divide all sides by 4, you end up where you started, so the trick accomplished nothing at all. In effect, if any 2-good approximations of a rational number *r* exist, there can’t be more of them than allowed by the *b \< q* criteria for the lowest-denominator representation of *r = p / q.* And these solutions, if any, will be clustered on the left side of the plot.

This is about as much as we can squeeze out of that stone. The bottom line is that rational numbers are difficult to approximate using other rationals; in fact, the simpler the number, the fewer good approximations we get.

### Approximating irrationals ###

If rationals tend to be relatively resistant to approximations, it might be tempting to assume that the situation with irrational numbers is going to be worse. But, to cut to the chase, here’s the plot of approximations for *r* = *π*:

[

<img src="https://substackcdn.com/image/fetch/$s_!LOrW!,w_1456,c_limit,f_auto,q_auto:good,fl_progressive:steep/https%3A%2F%2Fsubstack-post-media.s3.amazonaws.com%2Fpublic%2Fimages%2Fd00a99e4-9662-4741-ab87-e875937230b7_2500x1250.png" width="1456" height="728" data-attrs="{&quot;src&quot;:&quot;https://substack-post-media.s3.amazonaws.com/public/images/d00a99e4-9662-4741-ab87-e875937230b7_2500x1250.png&quot;,&quot;srcNoWatermark&quot;:null,&quot;fullscreen&quot;:null,&quot;imageSize&quot;:null,&quot;height&quot;:728,&quot;width&quot;:1456,&quot;resizeWidth&quot;:null,&quot;bytes&quot;:201334,&quot;alt&quot;:null,&quot;title&quot;:null,&quot;type&quot;:&quot;image/png&quot;,&quot;href&quot;:null,&quot;belowTheFold&quot;:true,&quot;topImage&quot;:false,&quot;internalRedirect&quot;:&quot;https://lcamtuf.substack.com/i/189104530?img=https%3A%2F%2Fsubstack-post-media.s3.amazonaws.com%2Fpublic%2Fimages%2Fd00a99e4-9662-4741-ab87-e875937230b7_2500x1250.png&quot;,&quot;isProcessing&quot;:false,&quot;align&quot;:null,&quot;offset&quot;:false}" class="sizing-normal" alt="" srcset="https://substackcdn.com/image/fetch/$s_!LOrW!,w_424,c_limit,f_auto,q_auto:good,fl_progressive:steep/https%3A%2F%2Fsubstack-post-media.s3.amazonaws.com%2Fpublic%2Fimages%2Fd00a99e4-9662-4741-ab87-e875937230b7_2500x1250.png 424w, https://substackcdn.com/image/fetch/$s_!LOrW!,w_848,c_limit,f_auto,q_auto:good,fl_progressive:steep/https%3A%2F%2Fsubstack-post-media.s3.amazonaws.com%2Fpublic%2Fimages%2Fd00a99e4-9662-4741-ab87-e875937230b7_2500x1250.png 848w, https://substackcdn.com/image/fetch/$s_!LOrW!,w_1272,c_limit,f_auto,q_auto:good,fl_progressive:steep/https%3A%2F%2Fsubstack-post-media.s3.amazonaws.com%2Fpublic%2Fimages%2Fd00a99e4-9662-4741-ab87-e875937230b7_2500x1250.png 1272w, https://substackcdn.com/image/fetch/$s_!LOrW!,w_1456,c_limit,f_auto,q_auto:good,fl_progressive:steep/https%3A%2F%2Fsubstack-post-media.s3.amazonaws.com%2Fpublic%2Fimages%2Fd00a99e4-9662-4741-ab87-e875937230b7_2500x1250.png 1456w" sizes="100vw" loading="lazy">

](https://substackcdn.com/image/fetch/$s_!LOrW!,f_auto,q_auto:good,fl_progressive:steep/https://substack-post-media.s3.amazonaws.com/public/images/d00a99e4-9662-4741-ab87-e875937230b7_2500x1250.png)*Approximation scores for r = π.*

Note that the plot keeps dipping below the 2-good line over and over again. And there are some really nice approximations in there! The first arrow points to 22 / 7 ≈ 3.143 (*s* ≈ 0.009). The second arrow points to an even better one: 355 / 113 ≈ 3.141593 (*s* ≈ 0.00003). What’s up with that?

Before we investigate, let’s confirm that *π* is not special. Surely enough, these patterns crop up for other irrationals too. And it’s not just famous transcendental constants; here’s √42:

[

<img src="https://substackcdn.com/image/fetch/$s_!ooof!,w_1456,c_limit,f_auto,q_auto:good,fl_progressive:steep/https%3A%2F%2Fsubstack-post-media.s3.amazonaws.com%2Fpublic%2Fimages%2F1460307a-d3c9-4c7c-a17b-0c29d0524eed_2500x1250.png" width="1456" height="728" data-attrs="{&quot;src&quot;:&quot;https://substack-post-media.s3.amazonaws.com/public/images/1460307a-d3c9-4c7c-a17b-0c29d0524eed_2500x1250.png&quot;,&quot;srcNoWatermark&quot;:null,&quot;fullscreen&quot;:null,&quot;imageSize&quot;:null,&quot;height&quot;:728,&quot;width&quot;:1456,&quot;resizeWidth&quot;:null,&quot;bytes&quot;:195935,&quot;alt&quot;:null,&quot;title&quot;:null,&quot;type&quot;:&quot;image/png&quot;,&quot;href&quot;:null,&quot;belowTheFold&quot;:true,&quot;topImage&quot;:false,&quot;internalRedirect&quot;:&quot;https://lcamtuf.substack.com/i/189104530?img=https%3A%2F%2Fsubstack-post-media.s3.amazonaws.com%2Fpublic%2Fimages%2F1460307a-d3c9-4c7c-a17b-0c29d0524eed_2500x1250.png&quot;,&quot;isProcessing&quot;:false,&quot;align&quot;:null,&quot;offset&quot;:false}" class="sizing-normal" alt="" srcset="https://substackcdn.com/image/fetch/$s_!ooof!,w_424,c_limit,f_auto,q_auto:good,fl_progressive:steep/https%3A%2F%2Fsubstack-post-media.s3.amazonaws.com%2Fpublic%2Fimages%2F1460307a-d3c9-4c7c-a17b-0c29d0524eed_2500x1250.png 424w, https://substackcdn.com/image/fetch/$s_!ooof!,w_848,c_limit,f_auto,q_auto:good,fl_progressive:steep/https%3A%2F%2Fsubstack-post-media.s3.amazonaws.com%2Fpublic%2Fimages%2F1460307a-d3c9-4c7c-a17b-0c29d0524eed_2500x1250.png 848w, https://substackcdn.com/image/fetch/$s_!ooof!,w_1272,c_limit,f_auto,q_auto:good,fl_progressive:steep/https%3A%2F%2Fsubstack-post-media.s3.amazonaws.com%2Fpublic%2Fimages%2F1460307a-d3c9-4c7c-a17b-0c29d0524eed_2500x1250.png 1272w, https://substackcdn.com/image/fetch/$s_!ooof!,w_1456,c_limit,f_auto,q_auto:good,fl_progressive:steep/https%3A%2F%2Fsubstack-post-media.s3.amazonaws.com%2Fpublic%2Fimages%2F1460307a-d3c9-4c7c-a17b-0c29d0524eed_2500x1250.png 1456w" sizes="100vw" loading="lazy">

](https://substackcdn.com/image/fetch/$s_!ooof!,f_auto,q_auto:good,fl_progressive:steep/https://substack-post-media.s3.amazonaws.com/public/images/1460307a-d3c9-4c7c-a17b-0c29d0524eed_2500x1250.png)*Approximating r = √42.*

To understand what’s going on, we need to build a lengthier proof, although we’ll still stay within the realm of middle-school math.

First, we make a simple observation: given some number *r*, we can always split it into an integer part *v* and a fractional part *x* that satisfies 0 ≤ *x* \< 1. In other words, we’re saying that *x* always lies in the interval [0, 1).

We can also apply this logic to any multiple of *r*. In particular, for each integer *k* between 0 and some arbitrary upper bound *K* greater than zero, we can calculate *k · r* and then split the result to obtain a sequence of integer parts (*v*<sub>0 </sub>to *v*<sub>K</sub>) and fractional parts (*x*<sub>0 </sub>to *x*<sub>K</sub>). A simple illustration for *π* is:

The resulting sequence of fractional parts has K + 1 elements because we started counting at zero; again, each of these elements falls somewhere in the interval [0, 1).

Next, we divide the [0, 1) interval into K sub-intervals (“buckets”) of equal size:

We have K buckets and *K +* 1 fractional parts tossed into them; no matter how we slice and dice it, at least two elements will necessarily end up in the same bucket. This is the *pigeonhole principle.*

Again, the reasoning implies that there’s at least one pair of indices, *g* \< *h,* such that *x<sub>g </sub>*and *x<sub>h</sub>* both ended up in the same bucket. We don’t know anything about the underlying values, except that by the virtue of where they landed, they must be spaced less than 1 / *K* apart:

The existence of a pair of elements with spacing of less than 1 / *K* is the crux of the proof. The rest is just a bit of manipulation to relate these elements to a rational approximation of the starting number *r.*

We show this in a couple of steps. First, as a consequence of how we constructed these fractional parts, we can rewrite any *x<sub>k </sub>*as the difference between the *k-*th multiple of *r* and the associated integer part *v<sub>k</sub>*. After making these substitutions for indices *h* and *g*, we get:

Next, we rearrange the terms and split out the expressions that appear to form two independent integers: (*v<sub>h </sub>*- *v<sub>g</sub>*) and (*h - g*). We label these *a* and *b:*

We don’t need to dwell on the possible values of *a;* it’s enough that the number can exist. We’re also not concerned about the exact value of *b*, although we ought to note that it’s always positive (because we specified *g \< h*) and that it’s necessarily less than or equal to *K* (because it represents the difference of indices in a list with *K* + 1 elements).

We’ll lean on these properties soon, but for now, we make these substitutions to obtain:

Remember the flag for later and divide both sides by *b* to obtain:

Huh — the left-hand portion of the expression is the same as the formula for the error *ε* of approximating *r* using a rational fraction *a / b.* In other words, the inequality seems to be saying that, as a consequence of the pigeonhole principle, we can pick any *r* and any *K* \> 0, and there’s always some integer *a / b* that approximates *r* with an error of less than 1 / (*K · b*).

We haven’t picked any specific *K*, but we know that *b* is always less or equal than *K*; again, this is because we defined *b* as a substitution for *h - g*, the delta between two indices in a sequence of *K + 1* elements. Therefore, the expression in the denominator — K *· b —* involves multiplying *b* by a value that’s equal or greater than *b.* In effect, we have proof that for any real *r,* some *a / b* that satisfies *ε \<* 1/*b²*.

This proof is known as *Dirichlet’s approximation theorem*. At first blush, it only guarantees a single 2-good approximation for every real. Worse yet, the solution guaranteed by the proof might not comply with the rules of our game, because nothing stops it from producing exact approximations (*ε =* 0). So, what did we achieve?

Well, that’s where we come back to an intermediate equation marked with ⚑:

In the earlier course of the proof, we divided the left-hand side of this inequality by *b* to arrive at the formula identical to *ε.* Equivalently, we can say that the current form is equal to *ε · b*. We already have a name for this parameter: *s.* Further, looking at the formula, we can assert that for any irrational *r*, the value of *s* must be greater than zero.

To prove that last property, it’s sufficient to show that we’d end up with a contradiction if multiplying *r* by a positive integer (*b*) produced some ad-hoc rational number *h / j*. That would allow us to represent *r* itself as a fraction of two integers, making it rational:

In other words, if *r* is irrational, so is *r · b*, which also means it’s not an integer; subtracting another integer (*a*) from *r · b* will always leave a non-zero fractional part.

To take the next step — and we’re close to the finish line! — note that Dirichlet’s proof doesn’t put any constraint on the upper value on the number of buckets (*K*)*.* If we choose some definite *K*<sub>1</sub>, the proof establishes the existence of a single 2-good pair, which we can label *a*<sub>1 </sub>and *b*<sub>1</sub>. If we choose another value *K*<sub>2</sub>, it proves the existence of a pair we’ll call *a*<sub>2 </sub>and *b*<sub>2</sub>; that pair may or may not produce a functionally different approximation of *r.* Maybe there’s just a single solution that repeats for every *K*?

Let’s assume that’s the case; that would mean that *s*<sub>1</sub> *= s*<sub>2</sub> regardless of our choice of *K*<sub>2</sub>. However, in the irrational case, we’ve established that s<sub>1</sub> is necessarily a positive number. We can make the 1 / *K*<sub>2 </sub>fraction arbitrarily small by increasing *K*<sub>2</sub>, so no matter what *s*<sub>1</sub> we start with, the right-hand fraction can be made smaller to flip the inequality. Constant *s* produces a contradiction. It must be that for a given irrational *r* and some chosen *K*<sub>2 </sub>\> *K*<sub>1</sub>*,* the equation will produce a new, distinct *a*<sub>2 </sub>/ *b*<sub>2</sub> such that *s*<sub>2</sub> \< *s*<sub>1</sub>.

This new approximation is vulnerable to the same fate as the *a*<sub>1 </sub>/ *b*<sub>1</sub> solution it replaced; that’s to say, we can keep incrementing *K* to conjure as many distinct 2-good pairs as we want. The proof doesn’t guarantee that it’s going to happen on any specific cadence, but it says that it will if we try long enough.

As a postscript, we ought to ask if the same reasoning applies to rationals; if it does, that would contradict our earlier argument that rational numbers can only have a handful of 2-good solutions. To show that there is no contradiction, note that in the rational case, *s* can conceivably reach zero (i.e., *a / b* can be an exact approximation). Next, rewrite *r* as *p / q* in the left-hand portion of the earlier inequality:

The numerator of the fraction on the right is an integer (because so are *a*, *b*, *p*, and *q*). The denominator is also an integer that stays constant for a given *r.* It follows that when approximating rationals, there is a fixed, minimum decrement for *s*: 1/*q*. We might start from a non-zero *s*<sub>1</sub>*,* but if we keep ramping up *K*, the system *must* reach the degenerate *s<sub>n</sub> =* 0 case after producing a finite number of inexact approximations. From that point on, *s* \< 1 / *K* is satisfied for any *K* and the generation of distinct 2-good pairs ceases.

As before, increasing *p* in tandem with *q* (*r* = 1/2 to *r =* 4/8) buys us nothing, as the trick increments the nominator and the denominator by the same factor, still producing the same effective step; the solution is predicated on the lowest-denominator representation of *r = p / q.*

In other words, you get an infinite supply of surprisingly accurate solutions for irrational numbers, but a limited (often *very* limited) number of decent results for rationals.

### But… why? ###

Right. The proofs are interesting but don’t offer an intuitive explanation of why these patterns emerge. This is where we go back to my opening remark: it’s easier to grasp the outcome if you look at how rational numbers and reals are “made”.

From the construction of rationals, we know that the spacing between them is arbitrarily close, but at any “magnification level” — for any chosen denominator *b* — the values divide the continuum into uniform intervals. Uniform spacing also implies *maximal* spacing: even though there is no upper or lower bound to the values of *a / b*, they are as far apart as they can be. Any new value inserted onto the number line will necessarily sit “closer” to an existing rational.

The gaps between rationals is where we find irrational numbers. This comes with a lot of weird baggage explored in the [previous article](https://lcamtuf.substack.com/p/unreal-numbers), but it also means that for any given irrational *r,* we have an inexhaustible supply of unexpectedly accurate rational approximations in the vicinity.

Although the puzzle we started with might seem silly, the study of these structures — known as *Diophantine approximations* — is taken seriously and gets complicated fast. For example, it’s possible to construct so-called *Liouville numbers* that have an infinite irrationality exponent (endless *n-good* approximations for any *n)*, but it’s a lot harder to prove that there’s any commonly-encountered number with an irrationality exponent greater than two. In the same vein, algebraic irrationals (e.g., √2) all have an irrationality measure of two, but the proof of this is fiendishly difficult and netted its discoverer the Fields Medal back in 1958.

---

*You might also enjoy my other articles about math, including:*

*I write well-researched, original articles about geek culture, electronic circuit design, algorithms, and more. If you like the content, please subscribe.*

[Subscribe now](https://lcamtuf.substack.com/subscribe?)