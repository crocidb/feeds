+++
title = "The geometric model of maintenance"
description = " James Shore posits that each person-month spent writing code results in 10 days of maintenance in the first year, then 5 days every year after that. Naïvely interpreted, this is a threshold-based model for induced maintenance, and its interesting because it’s so simple. If it "
date = "2026-10-12T22:00:00Z"
url = "https://entropicthoughts.com/geometric-model-of-maintenance"
author = "a@xkqr.org (kqr)"
text = ""
lastupdated = "2026-10-21T11:46:08.085525097Z"
seen = false
+++

 James Shore posits that each person-month spent writing code results in 10 days of maintenance in the first year, then 5 days every year after that. Naïvely interpreted, this is a *threshold*-based model for induced maintenance, and its interesting because it’s so simple.

 If it could be shown to be true, that’d be useful. The argument Shore is making about the effects of robot-generated code does not depend on the specific numbers, so Shore’s numbers come from a hypothetical wisdom-of-the-crowds aggregation rather than concrete data. But no hypotheticals are necessary here. We have a thing called git.

 Let’s say we have a way of labeling each commit as either “new development” or “maintenance”. Then we can count how many commits of each type there are in a month. Possibly better, we can count how much complexity has been handled in a month.

 The following plot shows the cumulative effort that has gone into the development of tmux since its beginning to the day I start writing this article.

[(Continue reading the full article on the web.)](https://entropicthoughts.com/geometric-model-of-maintenance)