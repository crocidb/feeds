+++
title = "Ryabitsev: Creepy crawlies"
description = "Konstantin Ryabitsev has written a blog post with hard numbers about the impact of AI crawlers on the Linux kernel repositories at git.kernel.org:Today, git.kernel.org receives about 6M daily"
date = "2026-08-29T09:32:34Z"
url = "https://lwn.net/Articles/1091203/"
author = "jzb"
text = ""
lastupdated = "2026-09-01T19:33:14.073345122Z"
seen = false
+++

Konstantin Ryabitsev has written a [blog post with hard numbers](https://people.kernel.org/monsieuricon/creepy-crawlies) about the impact of AI crawlers on the Linux kernel repositories at [git.kernel.org](https://git.kernel.org/):

>
>
> Today, git.kernel.org receives about 6M daily requests demanding to see random commits. Of these, 66% are still immediately batted away with the Anubis challenge, but 33% are now solving the math and getting through to the main site — because apparently what we have to offer is worth spending a ton of cycles to calculate the Anubis challenge.
>
>
>
> It's impossible to tell with certainty which of these are bots and which are real humans — but chances are, if it's asking for an old commit in a random old fork, it's probably not a real developer trying to do their work.
>
>
>
> With a bunch of generous assumptions, legitimate requests are only about 2% of git.kernel.org traffic — everything else are scrapers.
>
>