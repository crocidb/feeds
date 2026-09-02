+++
title = "Two Ends of Programming"
description = "Some years ago I worked with a software developer from Germany. I was an intern at the time. More than once, after I asked this engineer for a review of a pull-request, he’d tell me, “Hauptsache es funktioniert” (translated: as long as it works). I have heard this sentiment rep"
date = "2026-08-31T00:00:00Z"
url = "https://lambdaland.org/posts/2026-08-31-two-ends-of-programming/"
author = """

            
              Ashton Wiersdorf
            
          """
text = ""
lastupdated = "2026-09-01T19:33:15.009023766Z"
seen = false
+++

Some years ago I worked with a software developer from Germany. I was an intern at the time. More than once, after I asked this engineer for a review of a pull-request, he’d tell me, “Hauptsache es funktioniert” (translated: *as long as it works*). I have heard this sentiment repeated more times than I can count by developers I’ve met in person as well as by people online: *the point of the code is to solve a problem.* You might see this mentality articulated as “maintainable code is good because it lets us ship more features faster” or [the grug-brained developer](https://grugbrain.dev/). This sentiment certainly isn’t wrong: if you can focus on making sure that your code reliably solves a problem for its users and that it improves their lives—great!

But something rubbed me the wrong way with *Hauptsache es funktioniert*, and it still does. It’s been several years since then, and I think I can finally articulate why: when I asked for a code review, I wanted some advice from a senior developer that could help *me* become a better programmer. Getting push-back on code style, organization, testing methodology, etc. is a phenomenal way to get better. I think, therefore, that there are really *two separate ends* arise in software engineering, which I will provisionally label *product* and *people*.

The two viewpoints
----------

The *product* viewpoint sees the result for the end-user as the primary objective. Quality code is one that solves a problem in a cost-effective and reliable way. Tests exist in as much as they make the software more reliable for the end user. Code quality matters only to the extent that we can maintain our codebase long-term and continue to develop features that users care about. The developer’s experience in the codebase is secondary: they can grit their teeth and bear the messiness. This matters because end-users are the ones paying for the software and are the ones enabling the developers (as well as everyone else at the company) to earn a living.

The *people* viewpoint looks at how the developers themselves treat with the software and what becomes of them from writing it. Of course, end-users are people too and this viewpoint doesn’t discard that; considering the developers as people involved with the software makes the internals of the code matter a lot more. A codebase that is messy or a slog to work on makes developers miserable, even if it is generating a lot of value for their users. This viewpoint also sees software development as an art—good code is valuable in and of itself.

I think *both* perspectives are valuable. Unfortunately I see the *people* viewpoint looked down on by people who subscribe primarily to the more “realistic” *product* viewpoint—*especially* the last part about good code being an art and a worthy goal in and of itself. Pretty source code doesn’t pay the bills, after all. But if you think of yourself as being more in the *product* camp, consider this: developers get better when they have a chance to exercise their skills by crafting better source code. Better developers write code that is more maintainable and works better for the users. There are good *pragmatic* reasons to encourage developers to care about and work on the quality of their software.

On the other hand, very developer-oriented folks would do well to keep the user’s experience in mind. I’ve seen good-quality code that was awkward to use because the developers lacked empathy with their end-users. The tool was technologically laudable, but still lacked quality because it was difficult to use.

Academia and AI
----------

I’m an academic, and the product of a university are students who are made better thinkers.<sup class="footnote-reference" id="fr-2-1"><a href="#fn-2">1</a></sup> Engaging in student-building naturally places all the emphasis on challenging students to write the best software they can. Kerninghan’s Law states:

>
>
> Debugging is twice as hard as writing the code in the first place. Therefore, if you write the code as cleverly as possible, you are, by definition, not smart enough to debug it.
>
>

In a university setting, this means that students *ought* to write clever code so that they can get smarter by debugging it! If you are a student, always remember that *you* are the product of your education, not your diploma or certification or whatever. You should not cheat yourself of an opportunity to grow. Take it while it’s available and while you have a support network of teachers, TAs, counselors, and friends to help you!

I think that generative AI can help with both goal if used *extremely* carefully. An LLM can produce source code so fast that it becomes very easy for the human to rubber-stamp everything it puts out and to slip into cognitive atrophy. We are seeing this unfold on an alarmingly short time-frame. I think it is bad if we prioritize the output to the point that we neglect the workers responsible for its construction and maintenance.

I’m running out of time to write, so I’ll conclude with this suggestion: **companies should adopt a “gym day” for developers where everyone writes and debugs code by hand.** I think developers should ask for this if management does not implement it themselves. Developers should have time to sharpen their own skills. It will both improve the long-term sustainability of the company as well as the skills and well-being of the developers.

This is, of course, my opinion as of August 31st, 2026, and I reserve the right to change or amend it. But I think it’s a decent opinion and I would like to see this idea carried out.

1. If you are of the persuasion that a university ought to exist primarily to train students for the workspace, oh boy do we have a lot to talk about… That’s a nice by-product, but it shouldn’t be the end-goal. Job training is cheap; creating a society of good thinkers is what is really valuable. [↩](#fr-2-1)