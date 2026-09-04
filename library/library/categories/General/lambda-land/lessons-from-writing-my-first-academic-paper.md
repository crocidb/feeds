+++
title = "Lessons From Writing My First Academic Paper"
description = "I got a paper published at ECOOP this year! This is my first big paper published at a big conference. As such, I wanted to write down some things that I learned so that in the future I can remember a bit better what was hard for me. That way, should I o"
date = "2024-06-21T00:00:00Z"
url = "https://lambdaland.org/posts/2024-06-21_writing_a_paper/"
author = """

            
              Ashton Wiersdorf
            
          """
text = ""
lastupdated = "2026-07-21T09:22:07.227428966Z"
seen = false
+++

I got a paper published at [ECOOP](https://2024.ecoop.org/) this year! This is my first big paper published at a big conference. As such, I wanted to write down some things that I learned so that in the future I can remember a bit better what was hard for me. That way, should I one day advise PhD students working on *their* first papers, I can help them through the learning curve better.

For us, this artifact took the form of a Docker container with a bash script that ran all the code examples from our paper to support the claims we made. I really like that reproducibility like this is often an option in CS.

Conference deadlines may be flexible if you talk to the right people.

We submitted an artifact along with our paper But some of the deadlines were *really* close. My advisor reached out to the folks in charge of the conference<sup class="footnote-reference" id="fr-fn:1-1"><a href="#fn-fn:1">1</a></sup> and asked if the artifact submission date could be moved back. The organizers agreed, and everyone got a little more breathing room between when the paper was due and when the artifact was supposed to be submitted.

Conferences are run by humans—you can talk to them.

Along the same lines, the conferences are run by *people*, and you can talk to the organizers to request clarification. You shouldn’t be a whiny jerk, of course, but the people running these things *want* people to submit good papers and will work to help you overcome blockers.

The Call for Papers has everything you need.

The “Call for Papers” describes what kinds of submissions fit the conference, as well as *how* to format and submit your paper. You can see the CfP for ECOOP [here](https://2024.ecoop.org/track/ecoop-2024-papers#Call-for-Papers). Absorbing everything in the CfP can be challenging for first-timers. I was unclear about something and my advisor asked me if I had read the CfP. I had, but that didn’t mean that I remembered *everything* from it. It takes time and experience to absorb the salient parts of the CfP.

Papers get easier to read as time goes on.

When I first started research, I struggled to make it through a single paper. Moreover, I had a hard time understanding the point the paper was trying to make.

I think part of the difficulty stems from the sheer amount of new terminology and dense technical material present in a typical paper. Everything is new and therefore requires effort to comprehend. As you get familiar with the field, however, previously arcane concepts become easy to grasp. This also makes it easier to see the main idea of the paper: you can tune out the noise and focus on what is novel.

Part of it comes from how unfamiliar the *form* of papers is. When I started research, papers felt arbitrarily formulaic. Now, I can recognize common structures in papers and use these patterns to understand the paper quicker. I actually find that papers are an efficient way for me to learn about cutting-edge research. I hoped, but did not know, that that would eventually be the case when I started.

Keep track of where *every* claim comes from.

I did not do a very good job keeping a lab notebook for this paper. When I started writing the paper, I had to go back to my work and try and remember where I got a particular number or why I made a particular claim. I am doing a lot better with my current project, I think. I hope the next paper is a little smoother in this regard.

Writing takes a long time!

We started working on this paper about 7 months ago, according to `git log`. There were so many drafts, edits, and revisions.

Get your contributions clear.

Simon Peyton-Jones [gives this advice](https://simon.peytonjones.org/great-research-paper/): your list of contributions should drive the paper. Moreover, writing the paper drives the research. Research is useless unless shared!

Collaboration is challenging.

Writing joint papers can be tricky. I am really glad we were using `git` to track changes. I met with my advisor twice a week in person, as well as a few times remotely to hammer out the ideas and drafts in the paper. We sent lots of messages in Slack.

Asking for feedback can be hard—and I don’t just mean in the emotional pride-bruising sense: prompting the people you ask for feedback can be tricky. I asked someone for some help on a different piece of writing, and they weren’t able to give me much useful help and instead focused on trivial issues. Part of that is on me: I should have prompted better. But it is hard to prompt well.

I find it a little curious that different kinds of people have different affinities to methods of giving feedback. With this paper, there’s a flag in LaTeX that adds line numbers to the PDF. So, if someone wants to comment on something, they can write:

```
l 42: "that" → "which"; the phrase is not essential, so use "which" instead of "that"
l 46: "rocks are a kind of vegetable" do we have a citation for this?
…
```

This seems natural to me. I like that it’s software-agnostic. I guess some fields are tied to particular technologies (e.g. suggested edits in Word) and that seems burdensome to me.

1. Specifically, the program chair. [↩](#fr-fn:1-1)