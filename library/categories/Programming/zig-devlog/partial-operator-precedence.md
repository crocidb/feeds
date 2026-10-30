+++
title = "Partial Operator Precedence"
description = "Partial Operator PrecedenceAuthor: Ryan LiptakAs of yesterday, the second oldest open proposal for the Zig language was issue 114: require parentheses sometimes to disambiguate confusing operator precedence, o"
date = "2026-10-24T00:00:00Z"
url = "https://ziglang.org/devlog/2026/#2026-10-24"
author = ""
text = ""
lastupdated = "2026-10-27T22:33:13.252521080Z"
seen = false
+++

[Partial Operator Precedence](#2026-10-24)
==========

Author: Ryan Liptak

As of yesterday, the second oldest open proposal for the Zig language was [issue #114: require parentheses sometimes to disambiguate confusing operator precedence](https://github.com/ziglang/zig/issues/114), opened February 8, 2016. Ten years later, that proposal [has been implemented](https://codeberg.org/ziglang/zig/pulls/30160) in the master branch version of Zig thanks to contributor [CMDRZero](https://cmdrzero.github.io/).

This means that some combinations of operators no longer have a defined precedence, and for those that don’t, the compiler will now require parentheses:

```
const a = x orelse y == z;

```

```
test.zig:1:22: error: ambiguous operator precedence with operators ... orelse ... == ...; use parentheses to disambiguate
const a = x orelse y == z;
                     ^~
test.zig:1:13: note: previous ambiguous operator here
const a = x orelse y == z;
            ^~~~~~
test.zig:1:22: note: in zig 0.17.x, this was evaluated as (... orelse ...) == ...

```

However, common cases can remain parenthesis-free:

```
const a = x + y * z;

```

The idea behind this is to reduce the number of rules a programmer needs to know when reading and writing Zig code. For example, no matter how experienced you are with Zig, it’s unlikely that you’d be able to explain the evaluation order of the following expression without looking up the precedence rules:

```
a & b + c * d >> e | f orelse g() catch h + i == j or k and l

```

With the now-required parentheses added (while maintaining the same evaluation order as the Zig 0.17.x precedence rules), that expression would look like this:

```
((((a & ((b + c * d) >> e)) | f) orelse g()) catch (h + i)) == j or (k and l);

```

Still quite hairy, and not something I’d like to see in the wild, but nonetheless it’s understandable without knowing any precedence rules beyond arithmetic and comparison. Outside of this contrived example, though, the expressions that will now require parentheses are relatively rare (353 lines needed changes out of the million+ lines of code in the Zig codebase).

What you need to know
----------

In practice, going forward, you will only need to remember the rules around operator combinations that *still have* a defined/unambiguous precedence. For example, when reading or writing code involving arithmetic operators, you’ll only need to remember the following precedence table:

```
* / *% *| %
+ - +% -% +| -|
== != < > <= >=
and or

```

You might notice that there isn’t anything too surprising there, and that lack of surprise was a (subjective) guiding principle for what should and should not require parentheses. As an example, while `%` has unambiguous precedence with regards to addition/subtraction operators, parentheses must be used when mixing `%` with multiplication/division operators, and with itself. However, this, and other ambiguous operator combinations, aren’t something you’ll need to commit to memory. Any (future) code you read will already have parentheses to disambiguate, and for any code you write, the compiler will let you know when you need parentheses.

For the full explanation, and to see the relevant precedence tables pertaining to other operators, see [the updated Precedence section of the language reference](https://ziglang.org/documentation/master/#Precedence).

Upgrading existing code
----------

There are two possible approaches here:

1. Manually fix each “ambiguous operator precedence” error as they are surfaced by the compiler (this might be a good opportunity to try out [incremental compilation](https://ziglang.org/download/0.17.0/release-notes.html#Incremental-Compilation) if it’s supported on your platform)
2. Use `zig fmt --upgrade` (the `--upgrade` flag was added for this purpose). This will cause `zig fmt` to add parentheses automatically, maintaining the evaluation order from the previous precedence rules (note: the `--upgrade` flag will be removed after one release cycle)

My personal recommendation would be option 1, as the process of redetermining the intended evaluation order for these uncommon precedence scenarios can occasionally serve to uncover bugs ([here’s an example of that](https://github.com/Vexu/arocc/pull/1117)).

If you go with option 2, I’d still recommend perusing the diff afterwards to ensure that nothing looks unusual, or is different than you expected/intended. A potentially common example of that is something like `a orelse b() catch c` which previously evaluated to `(a orelse b()) catch c`, but changing that to `a orelse (b() catch c)` likely makes more sense, even if the end result is unaffected. Also worth noting that in some scenarios, redundant parentheses will be added by `zig fmt --upgrade` (e.g. you might see something like `a orelse ((b + c) - d)` where the parentheses around `b + c` are unnecessary), so avoiding that will take a bit of manual cleanup.

That’s about it. I’m hopeful that this change will make bugs stemming from misremembered precedence rules much less likely, and that it will put some attention onto any of those bugs that may currently exist.

Thanks again to CMDRZero for the implementation, and to Isaac Freund for help with the corresponding grammar changes.