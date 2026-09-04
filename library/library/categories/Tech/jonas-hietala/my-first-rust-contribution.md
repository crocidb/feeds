---
title = "My first rust Contribution"
description = "The problem with open-source for most people isn’t writing code, but it’s all the other things.How shall I push my changes? How do I handle git? What should I do?I was the same and I actually dreaded my awesome summer job, ju"
date = "2024-07-17T19:35:07Z"
url = "http://jonashietala.se/blog/2014/07/19/my_first_rust_contribution/index.html"
author = "Jonas Hietala"
text = ""
lastupdated = "2025-10-22T08:58:11.624157841Z"
seen = true
---

The problem with open-source for most people isn’t writing code, but it’s all the other things.

>
>
> How shall I push my changes? How do I handle [git](http://git-scm.com/)? What should I do?
>
>

I was the same and I actually dreaded [my awesome summer job](/blog/2014/06/11/isoc/), just a little bit, because now I’m supposed to contribute and preferrably a non-trivial amount. Although I’ve been programming several years, I’ve never contributed a large open-source project. Or a small one for that matter.

But this has now officially changed. 3 days ago [my first pull request](https://github.com/rust-lang/rust/pull/15667) got merged into [rust](http://www.rust-lang.org/)! Here are some useful steps and resources which might be useful for someone in my shoes:

I assume you’re going to contribute to [rust](http://www.rust-lang.org/), but the essence could be generalized for other projects as well.

Build
==========

Firstly we should try to [build rust](https://github.com/rust-lang/rust/wiki/Note-getting-started-developing-Rust). There are some useful things about building inside the root `Makefile` and in the [test suite notes](https://github.com/rust-lang/rust/wiki/Note-testsuite).

For making the documentation:

```
make docs NO_REBUILD=1

```

And making other things:

```
make -j<num-cores> NO_REBUILD=1 NO_BENCH=1 CFG_DISABLE_VALGRIND=1

```

The process can be very slow though, especially if you do `make clean` (try not to!).

Git workflow
==========

Before we start hacking it’s good to have an idea of the git workflow we’re going to use.

Firstly, clone `git@github.com:rust-lang/rust.git` and push that repo into your github account. I have that as my `origin`. Then create an `upstream` branch:

```
git remote add upstream https://github.com/rust-lang/rust

```

For me it looks like this:

```
$ git remote -v
origin      git@github.com:treeman/rust.git (fetch)
origin      git@github.com:treeman/rust.git (push)
upstream    https://github.com/rust-lang/rust (fetch)
upstream    https://github.com/rust-lang/rust (push)

```

When we want to start working on something new, always create a new branch:

```
$ git checkout master -b mybranch

```

While we’re working we need to update from `upstream`, to get new changes.

```
$ git checkout mybranch
$ git fetch upstream
$ git rebase upstream/master

```

When done, push locally to github:

```
$ git push origin mybranch

```

To file a pull request we can use github’s interface. Just be sure to target the `master` integration branch.

If we want to make some changes to our pull request, simply make the changes in `mybranch` and push towards your github profile.

If you have a lot of commits in your pull request, or if they aren’t very descriptive, you may be asked to squash your commits. Sounds scary, but it’s fairly straightforward:

1. `git log` and check how many commits you have (or check via github).
2. `git rebase -i HEAD~2` will rebase the 2 latest commits.

When satisfied:

```
$ git push origin mybranch -f

```

And that’s it! Make sure to switch branch when you’re done. I accidentally pushed another commit on top of my already reviewed, and accepted, pull request. Quite embarrassing but I’ll live =)

Actual work
==========

With that taken care of, we can finally do some work. But [what to do](https://github.com/rust-lang/rust/wiki/Note-guide-for-new-contributors)? Here are some tips:

1. Document the [library](http://doc.rust-lang.org/std/).

   At the time of my writing, the library lacks a lot of documentation, and that’s what I’m doing. And don’t be scared, it’s not as dry as it’s sounds. My contributions are basically just adding code examples.

2. Write unit tests.

3. Proofread the [tutorial](http://doc.rust-lang.org/tutorial.html).

   I did this, but the tutorial is currently getting a complete rewrite, so I’m not sure how useful that was.

4. Find and fix some [bugs](https://github.com/rust-lang/rust/issues?direction=desc&sort=created&state=open).

   rust organizes everything as issues. Feature request, updates and bugs. If you look for them, you might find an [easy bug](https://github.com/rust-lang/rust/issues/15780) to work on. Which is what [I did](https://github.com/rust-lang/rust/pull/15785).

And you can always simply start hacking on something interesting. Or find and fix a bug yourself.