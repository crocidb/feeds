+++
title = "Be Careful What You Measure"
description = "Goodhart’s Law states that, “when a measure becomes a target, it ceases to be a good measure.” A corollary to this that I thought of today is:Only measure that which you are comfortable turning into a target.Some targets are u"
date = "2026-10-01T00:00:00Z"
url = "https://lambdaland.org/posts/2026-10-01-measure/"
author = """

            
              Ashton Wiersdorf
            
          """
text = ""
lastupdated = "2026-10-05T09:04:49.740255034Z"
seen = false
+++

[Goodhart’s Law](https://en.wikipedia.org/wiki/Goodhart's_law) states that, “when a measure becomes a target, it ceases to be a good measure.” A corollary to this that I thought of today is:

>
>
> Only measure that which you are comfortable turning into a target.
>
>

Some targets are useful, some are not, and they often have [unforeseen consequences](https://en.wikipedia.org/wiki/Perverse_incentive#Examples_of_perverse_incentives). So be very careful with what you measure: what you measure easily becomes a target, and what you make a target changes incentives.

I think this is a useful way to steer organizations: you can often tell what an organization is going to do by considering its *access to information* as well as its *incentives*.<sup class="footnote-reference" id="fr-1-1"><a href="#fn-1">1</a></sup> If you alter what kind of information an organization has, you will naturally alter its behavior as well.

This isn’t a silver bullet to all the ills of perverse incentives by any means. But I think there is some good you can accomplish by keeping this in mind.

A personal anecdote
----------

I once worked for a company where of the higher-ups posted in the general engineering channel a celebration that, relative to the previous year, commits were up 2×, pull requests were up 5×, and lines of code changed were also up 5×.

This disturbed me. It’s been well known for decades now that tracking lines-of-code added is a great way to torpedo the quality of your software: if programmers are paid by the line, you will quickly have an unmaintainable mess on you hands. Therefore, why celebrate these numbers? I called this out as a *bad idea*. I asked, if we’re submitting 5× the PRs, does that mean that we understand our codebase ⅕ as well as we used to? The original poster backed down a little bit and said that they were happy to see that we were experimenting with AI so much. That’s a fair thing to celebrate, I think, but that was not what they said originally.

These numbers are *easy* to measure—I think there might be a place on GitHub where you can see statistics like the above for an organization. It’s tempting to make a target out of figures like that. The best way to avoid that happening is to **not measure it in the first place**.

What I said was appreciated—several of my fellow engineers thanked me personally. I doubt this will be the last time they will have to fend off metric encroachment. What you choose measure has consequences: be careful.

1. I heard this first from [Mike Munger](https://thedailyeconomy.org/article/look-with-two-is/). [↩](#fr-1-1)