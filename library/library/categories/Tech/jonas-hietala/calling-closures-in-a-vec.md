---
title = "Calling closures in a Vec"
description = 'In rust one might want to have a list of closures, for example as a list of callbacks.let mut fs: Vec<||= Vec::new();fs.push(|| { println!("imma firing my lazer"); });for f in fs.iter() {    f(); // error: expected function but found &||};Maybe if we borrow f?`for &f '
date = "2024-07-17T19:35:07Z"
url = "http://jonashietala.se/blog/2014/06/21/calling_closures_in_a_vec/index.html"
author = "Jonas Hietala"
text = ""
lastupdated = "2025-10-22T08:58:11.643480374Z"
seen = true
---

In rust one might want to have a list of closures, for example as a list of callbacks.

```
let mut fs: Vec<||> = Vec::new();
fs.push(|| { println!("imma firing my lazer"); });

for f in fs.iter() {
    f(); // error: expected function but found `&||`
};

```

Maybe if we borrow f?

```
for &f in fs.iter() { // error: cannot move out of dereference of `&`-pointer```
    f();
};

```

But then if we dereference f?

```
for f in fs.iter() {
    (*f)(); // error: closure invocation in a `&` reference
};

```

That’s not very helpful. Thanks to some friendly guys over at `#rust` at `irc.mozilla.org` I found something which works:

```
for f in fs.mut_iter() {
    (*f)(); // ok!
};

```

A note is that the closure types must be `&mut ||` and not `&||`.

In the end I think that the error messages could be more clear. But now we have a running example and all is well in the world!

```
// Print "imma firing my lazer"
fn main() {
    let mut fs: Vec<||> = Vec::new();
    fs.push(|| { println!("imma firing my lazer"); });

    for f in fs.mut_iter() {
        (*f)(); // ok!
    };
}

```