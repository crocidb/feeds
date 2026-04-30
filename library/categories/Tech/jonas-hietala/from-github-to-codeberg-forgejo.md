+++
title = "From GitHub to Codeberg/Forgejo"
description = "Respect your users and their confidence in you, “Microsoft” GitHub.Ethkuil, Updates to your GitHub Feed 65343After years of waffling"
date = "2026-04-28T17:04:03Z"
url = "http://jonashietala.se/blog/2026/04/28/from_github_to_codebergforgejo/index.html"
author = "Jonas Hietala"
text = ""
lastupdated = "2026-04-29T14:23:25.416663141Z"
seen = false
+++

>
>
> Respect your users and their confidence in you, “Microsoft” GitHub.
>
>
>
> [Ethkuil](https://github.com/orgs/community/discussions/65343#discussioncomment-6937004), Updates to your GitHub Feed [#65343](https://github.com/orgs/community/discussions/65343)
>
>

After years of waffling around I finally bit the bullet and migrated away from [GitHub](https://github.com/) onto [Codeberg](https://codeberg.org/) and a private [Forgejo](https://forgejo.org/) instance. If [Codeberg](https://codeberg.org/) is [good enough for Gentoo](https://www.gentoo.org/news/2026/02/16/codeberg.html) then it’s good enough for me.

[What’s the problem with GitHub?](#Whats-the-problem-with-GitHub)
----------

One part of my [GitHub](https://github.com/) aversion is me being anti the big American tech corporations for ideological reasons. I’d like to reduce my usage and dependence of Google/Facebook/Apple/Microsoft/Amazon etc where I can and moving away from [GitHub](https://github.com/) fits that goal nicely.

The other reason is GitHub’s enshittification. [GitHub](https://github.com/) has been slow and slightly buggy for years and it’s not getting better. They push out [badly planned features](https://github.com/orgs/community/discussions/65343) while shipping [this kind of code in GitHub actions runner](https://github.com/actions/runner/issues/3792):

```
#!/bin/bash

SECONDS=0
while [[ $SECONDS != $1 ]]; do
    :
done

```

(This apparently broke Zig and [caused them to leave for Codeberg](https://web.archive.org/web/20251127021007/https://ziglang.org/news/migrating-from-github-to-codeberg/).)

>
>
> You may not like it but this is what peak vibe coding looks like
>
>
>
> [mawkler](https://github.com/actions/runner/issues/3792#issuecomment-3234548632)
>
>

I know it’s a snarky comment, but with a CEO that says “[embrace AI or get out](https://web.archive.org/web/20251127034621/https://www.businessinsider.com/github-ceo-developers-embrace-ai-or-get-out-2025-8)” then it’s hard to resist.

There’s empirical data to back up GitHub’s unreliability; just check out these uptime logs (taken 2026-04-27 from third party sites since the official status page predictably lies):

![](/images/gh_codeberg/uptime_mrshu.png) Screenshot from [https://mrshu.github.io/github-statuses/](https://mrshu.github.io/github-statuses/) ![](/images/gh_codeberg/damrnelson_uptime.png) Screenshot from [https://damrnelson.github.io/github-historical-uptime/](https://damrnelson.github.io/github-historical-uptime/)

They don’t call it “Microslop” for nothing.

[Self-hosted + managed](#Self-hosted-managed)
----------

[Codeberg](https://codeberg.org/) is based on [Forgejo](https://forgejo.org/), which is great to self-host. I’ve had it running a few weeks when I’ve been playing with my homelab and it feels *exceptionally* fast. The web UI is super responsive and I frequently have to double-check that I pushed as it finished so quickly.

I would love to have the speed and privacy for all my repositories but I’ve got some that I want to be public (the [source for this site](https://codeberg.org/treeman/jonashietala) for example). I considered a few different setups:

1. Sync back changes to GitHub via Forgejo’s built-in GitHub sync?

   (Keeping GitHub active would defeat the point a little though.)

2. Sync changes from my [Forgejo](https://forgejo.org/) instance to [Codeberg](https://codeberg.org/)?

   (Maybe annoying to manage multiple repos?)

3. Only use [Codeberg](https://codeberg.org/)?

   (I’d lose speed and privacy for my private repos.)

4. Expose my [Forgejo](https://forgejo.org/) instance running in my homelab?

   (The internet is a scary place.)

5. Setup a public [Forgejo](https://forgejo.org/) on my Hetzner VPS?

   (I’d still have to protect it and manage traffic.)

In the end I decided to use [Codeberg](https://codeberg.org/) as for my public-facing repositories and [Forgejo](https://forgejo.org/) as my main interface (for both public and private repos).

Some of my public repos are close to read-only ([this site’s source](https://codeberg.org/treeman/jonashietala) for instance) so I’ve [setup a mirror](https://forgejo.org/docs/next/user/repo-mirror/) where [Forgejo](https://forgejo.org/) will push changes to [Codeberg](https://codeberg.org/) automatically. However, it’s weird to *also* pull changes from [Codeberg](https://codeberg.org/) to [Forgejo](https://forgejo.org/). I guess I could setup a script to do it, but pull requests from others are rare enough that I can do it manually. Other repos (such as [tree-sitter-djot](https://codeberg.org/treeman/tree-sitter-djot)) are left alone as they’re more collaborative in nature and I can’t be bothered to keep two sources in sync.

[Is it good?](#Is-it-good)
----------

Yes, both [Codeberg](https://codeberg.org/) and [Forgejo](https://forgejo.org/) are very good. They are snappy and speedy and there are no features I miss from either [GitHub](https://github.com/) or [GitLab](https://about.gitlab.com/) (and plenty I’m glad to avoid—getting AI shoved into every crevice for instance).  
 (Yes, I used an em-dash on purpose.)

At the moment [Codeberg](https://codeberg.org/) is admittedly having periods with pretty bad performance issues. This is because they’ve been under a DDOS attack for quite some time, which has been frustrating.

I frequently switch between my laptop and desktop, and sync my work by pushing/pulling git repos. The performance of my private [Forgejo](https://forgejo.org/) has been fantastic for this purpose, and as a bonus allows me to dodge the negative DDOS effects.

[The migration](#The-migration)
----------

The migration wasn’t difficult, just a bit repetitive.

For private repositories I just deleted them from [GitHub](https://github.com/) and pushed them to [Forgejo](https://forgejo.org/).

Public repositories had a few more steps:

1. Push them to [Forgejo](https://forgejo.org/)

2. Push them to [Codeberg](https://codeberg.org/)

3. Add a header redirecting to [Codeberg](https://codeberg.org/) similar to this:

   This repository has moved to [https://codeberg.org/treeman/jonashietala](https://codeberg.org/treeman/jonashietala).

   This GitHub copy is a frozen archive. New commits, issues, and pull requests should go to Codeberg.

4. Archive them on [GitHub](https://github.com/)