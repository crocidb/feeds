+++
title = "Metric Worship, or: How a bad manager wrecked a (small) company"
description = "I once worked as a part of a company with four employees, all of us programmers. We formed a sort of daughter company with a bigger—though still modest-sized—company that handled our payroll and whatnot. Our work directly helped the parent company, but we were organizationally in"
date = "2023-02-21T00:00:00Z"
url = "https://lambdaland.org/posts/2023-02-21_metric_worship/"
author = """

            
              Ashton Wiersdorf
            
          """
text = ""
lastupdated = "2026-07-21T09:22:07.262626079Z"
seen = false
+++

I once worked as a part of a company with four employees, all of us programmers. We formed a sort of daughter company with a bigger—though still modest-sized—company that handled our payroll and whatnot. Our work directly helped the parent company, but we were organizationally independent development-wise. I really liked working with that small team: we had a one-hour meeting each week to plan out our work, and a short, casual stand-up each morning to get things rolling. Almost all my time was spent building features and squishing bugs. I got a lot of really good feedback on all my pull-requests, as everyone there really cared about making a good-quality product.

Then we got acquired by a big, old, ossified company.

We got a new manager. Corporate dictated that all teams follow a two-week sprint, orchestrated through JIRA, and that every minute of our work be tracked. We now had three or four “SCRUM ceremonies” a week, each of which lasted between one to three hours. Our new manager had a baroque system to track our velocity and carefully calculated how many story points our team could complete a week.

My team’s interactions with our manager could be summarized in this meme:

![](/img/jira_scrum_crap.jpeg)

Metric-worshiping SCRUM manager encounters a programmer who cares

Maybe I was (or am) a bit naïve, but it was such a deep shock for me to be forced to work at the cadence of someone who cared more about metrics than about the quality of the actual product. There were some funny moments we had with our new manager and company:

* Managers got worried about what the programmers would do in a three-hour window between the end of one sprint and the start of another. Clearly, work may only happen during a sprint!

* The new company bragged about having gotten their 4-week-long release cycle down to the blazing speed of only 2-weeks. Someone from my company asked, “but we do CI/CD and deploy multiple times a day!” Management didn’t know how to work with such a tight release cycle. This was a SaaS product, mind you, so daily deployments was an easy way to squish bugs quickly.

* I was working part-time, and over 50% of my work hours were now spent in meetings determining how the rest would go.

* I had to clock every minute I spent on a ticket, and my manager got visibly frustrated when I forgot, because now his spreadsheet would be broken.

* I once forgot to move a ticket into the “done” column, and my manager got visibly flustered. I guess I had wrecked his precious little metrics.

* My manager frequently bragged about having worked all weekend. What was this guy even doing? He’s a middle manager! Tweaking spread sheets and “grooming the backlog”, I guess.

Anyway, the profound amount of crap I and my team had to put up with (combined with other passive-aggressive hostility from HR and other parts of management) sent my *entire* team packing within a matter of weeks. I don’t know who they found to maintain that code base. I’m not sure if *anyone* is maintaining it now. I feel sorry for the customers who liked our product. Management didn’t care about the product. All they cared about were their stupid little metrics.

### How did this happen? ###

[Maslow’s Hammer](https://en.wikipedia.org/wiki/Law_of_the_instrument) suggests one reason why this happens:

>
>
> If all you have is a hammer, everything looks like a nail.
>
>

Management at this company had a huge hammer in the form of an overly-complicated JIRA setup. Every problem could be broken apart into little atomic pieces of work, scheduled into sprints, and orchestrated from afar.

There’s also [Goodhart’s Law](https://en.wikipedia.org/wiki/Goodhart's_law), which states:

>
>
> Any observed statistical regularity will tend to collapse once pressure is placed upon it for control purposes.
>
>

When management fixates so much on metrics and ties rewards, praise, and incentives to hitting metrics rather than shipping good things, stuff will go downhill quickly. In our case, it drove out the people who cared. In other cases, mediocrity sets in.

Monetary metrics are often a bad proxy for quality
----------

It is an incredible privilege to work on something that you care about with people that also care about it. There’s a big difference between people who care about the *quality* of something and the people who only know what the monetary value of things are. This isn’t to say that business needs and financial questions are always bad to ask: at one job, many of my bright ideas (so I thought) got shelved because there simply wasn’t enough time and/or programmers to get the thing done, and we were working really hard to give people what they wanted.

Now that I write that, the decision-makers in those instances were still completely different than that bad manager I had at the last company: the managers at the new company cared about the experiences that our users were having with our product and wanted to make that a high-quality experience. Their questions had a much better motivation than the bean-counting metric-chasing origins of the bad manager’s decisions.

Money can sometimes be an indicator for quality, but not always. Money just points you to what people are willing to pay for. Quality is multi-faceted and there can be many (sometimes competing) approaches to getting at quality. Maybe some of the complexity is why it’s tempting to move away from hard to quantify questions about quality and towards metrics that can be put on a linear scale and compared.

The two companies
----------

I wrote a little bit about [the differences between staff and line](/posts/2022-08-28_keep_email_federated/#headline-2) workers. I’ve been a line worker my whole life, and so I get frustrated when staff gets in my way to (in my view) the detriment of the end of the institution. There’s probably some needs of the staff that I don’t fully appreciate—I bet a lot of people are just trying to perfect the institution as a thing in itself, which could be a good and needed thing.

As I write this, I realize that I, a tool-lover, sometimes focus on making tools better *an und für sich*. It’s probably good that I’m in academia where researching and making better tools (e.g. better programming languages) is my objective, rather than trying to make a product to sell. Not that I’m *bad* at the latter—I shipped some pretty sweet stuff—it’s just that my decision making might be a little skewed at times. I’ll try and work on that.

In any case, focusing in metrics rather than the real quality of your product is bound to frustrate people who care. If you believe that JIRA and better metrics will be the key to making a better product, don’t: metrics have their place, but they can quickly get in the way.