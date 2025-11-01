---
title = "IDA Summer of Code 2014: Summary"
description = "This is a wrap-up post of my entry to IDA Summer of Code this year.Quick stats`65 merged commits6790 lines added2822 lines deleted36 pull requests, 34 merged12 pull requests directly fixing issuesrest either documentation or cleanup1 RFC submi"
date = "2024-07-17T19:35:07Z"
url = "http://jonashietala.se/blog/2014/10/06/ida_summer_of_code_2014_summary/index.html"
author = "Jonas Hietala"
text = ""
lastupdated = "2025-10-22T08:58:11.605089167Z"
seen = true
---

This is a wrap-up post of my entry to [IDA Summer of Code](/blog/2014/06/11/isoc) this year.

Quick stats
==========

```
65 merged commits
6790 lines added
2822 lines deleted

36 pull requests, 34 merged
12 pull requests directly fixing issues
rest either documentation or cleanup

1 RFC submitted (postponed)

Worked ~160 hours

```

Initial work
==========

Before this summer I had never contributed anything to open source. Inspired by the [open source gardener](http://words.steveklabnik.com/how-to-be-an-open-source-gardener) my first steps was to read through *all* issues labeled `A-doc`, `E-easy`, `E-mentor` and `I-papercut` mainly to find some easy issues I could work with. [Issue #15780](https://github.com/rust-lang/rust/issues/15780) was for example the first issue I fixed. Before fixing issues it’s good to read through information for contributors, see for example [rust guidelines](https://github.com/rust-lang/rust-guidelines), [contributing](https://github.com/rust-lang/rust/blob/master/CONTRIBUTING.md) and [development policy](https://github.com/rust-lang/rust/wiki/Note-development-policy) but there may be more scattered about.

I contacted Steve Klabnik, who wrote the [open source gardener](http://words.steveklabnik.com/how-to-be-an-open-source-gardener) and who’s [been hired by Mozilla to work on rust](http://words.steveklabnik.com/rusts-documentation-is-about-to-drastically-improve) and asked how I best could contribute and he thought documentation was an excellent way to contribute. I had also heard that documentation was low-hanging fruit so I figured it was a good way to start.

Documentation
==========

The approach I took with documentation was to pick a part of the standard library, specifically [collections](http://doc.rust-lang.org/collections/index.html), and I wanted to make sure everything had runnable examples. Personally the most useful thing when learning a new language is examples.

For example [`Vec::as_mut_ptr`](http://doc.rust-lang.org/collections/vec/struct.Vec.html#method.as_mut_ptr) has the type signature `fn as_mut_ptr(&mut self) -> *mut T` and the documentation is basically a copy of the signature with some descriptive text. But the text says nothing of how to actually *use* the function. I just want to know how I use the pointer. A descriptive example is gold worth as it saves you so much time:

```
use std::ptr;

let mut v = vec![1i, 2, 3];
let p = v.as_mut_ptr();
unsafe {
    ptr::write(p, 9i);
    ptr::write(p.offset(2), 5i);
}
assert_eq!(v, vec![9i, 2, 5]);

```

You don’t even have to be that familiar with rust to see what the function does and how to use it with little more than a glance.

[My first rust contribution](/blog/2014/07/19/my_first_rust_contribution/) was a main example for [HashSet](http://doc.rust-lang.org/std/collections/struct.HashSet.html) and my [last accepted pull request](https://github.com/rust-lang/rust/pull/17339) documented [Result](http://doc.rust-lang.org/std/result/enum.Result.html) and [Option](http://doc.rust-lang.org/std/option/enum.Option.html) which is quite fitting as most of my contributions were documentation related. When finished I had made sure [collections](http://doc.rust-lang.org/collections/index.html) had runnable examples for everything except deprecated items and some which should be reworked (like btree). I made larger examples for [priority\_queue](http://doc.rust-lang.org/std/collections/priority_queue/index.html) and [rand](http://doc.rust-lang.org/std/rand/index.html) using [Dijkstra’s algorithm](/blog/2014/07/23/dijkstras_algorithm/) and a [Monty Hall simulation](/blog/2014/07/30/monty_hall/) which turned out quite decent and some documentation for other things.

Writing examples was more fun than I had initially thought and the reviewers seemed very happy with my contributions, which feels good. I might do something more in the future.

Issues
==========

[rust](http://rust-lang.org/) uses [issues](https://github.com/rust-lang/rust/issues) for everything from bugs to smaller feature requests. I fixed some easier ones like [preventing failure with non-UTF8 formatting](https://github.com/rust-lang/rust/issues/16877) and [JSON decoding fails on trailing comma](https://github.com/rust-lang/rust/issues/16945). Even though the issues and the fixes are small, a lot of time went into fixing them. Time searching for issues and time spent familiarizing with the code base easily trumps time actually writing the resulting code.

For example when I tried to fix [#12794](https://github.com/rust-lang/rust/issues/12794), to modify json decoder to handle optional fields, a lot of time was spent reading about `#[deriving(Decodable)]` and how it’s implemented and I hoped to introduce a general way for all types deriving `Decodable` to handle optional types. This led me to investigate syntax extension and fairly deep compiler hooks, but this led me to a bit of a dead end and the final pull request is a simpler hard-coded `Option` handling for json.

[My issues and pull requests](https://github.com/rust-lang/rust/pulls?q=author:treeman+).

Bug triage
==========

Another way to contribute is to enter rust’s [bug triage program](http://www.reddit.com/r/rust/comments/1w10ip/bug_triage_program/) where you receive a random set of old issues (I got 10 each week) and your task is to solve, bump, close or clarify them to the best of your ability.

I don’t think I actually managed solve a lot of issues, maybe a couple, but I did try to. At the very least I tried to replicate old issues to see if they’re still relevant and if so make an up to date test case. If not I’d usually just bump the issue.

RFC
==========

[rust](http://rust-lang.org/) uses the [RFC](https://github.com/rust-lang/rfcs) process which all “substantial” changes to the language have to go through. Changing semantics, adding keywords or changes to the standard library are typical examples which requires an RFC.

Early on when reading rust’s old tutorial I cringed a bit of the use of Newtypes:

```
struct Inch(int);
let length = Inch(10);
let Inch(integer_length) = length;
println!("it's {} long!", integer_length);

```

But this isn’t very ergonomic and it just feels like a big hack to call a one element tuple for a newtype. So I wrote an [RFC](https://github.com/rust-lang/rfcs/pull/186) which proposed to introduce a `newtype` keyword which automatically derives the underlying traits of a type:

```
newtype Inch = int;
let length: Inch = 10;
println!("it's {} long!", length);

```

The feedback was positive overall, but it’s currently postponed until after 1.0 as it could be implemented with backwards compatibility in mind. There was also discussion about possibly favouring [Generalized Newtype Deriving](https://www.haskell.org/ghc/docs/7.8.1/html/users_guide/deriving.html#newtype-deriving) over a new keyword:

```
#[deriving(Sub, Show)]
struct Inches(int);

```

Which gives the ability to skip unwanted traits, for example multiplication might not make sense for an `Inch` as the resulting type would be `Inch^2`.

What it meant to me
==========

I had a blast doing summer of code! It has long been a wish of mine to contribute to open source and rust has fascinated me a long time and I’m really happy I got the chance to work *and to get paid* doing this. Having a summer job doing something you might do anyway is per definition a great summer job.

It was more than just getting paid, it also gave me a push to becoming a contributor to [rust](http://rust-lang.org/) which is big confidence boost for me and hopefully it gives me a good starting point to contribute more in the future. And of course it gave me a nice excuse to play with [rust](http://rust-lang.org/), which is really shaping up to be a nice language.