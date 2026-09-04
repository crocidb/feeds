+++
title = "Why JavaScript's Secret Comma Operator is So Darn Useful"
description = 'Did you know you could do this in JS?let n = (0, 1);console.log(n); // 1And this?let n = 0;n = (n++, n++, n);console.log(n); // 2And this?// 😒if (x) {  foo();  return bar();} else {  return "baz";}// 😍return x ? (foo(), bar()) : "baz";And this?`// 😒const f = x'
date = "2021-12-28T00:00:00Z"
url = "https://taylor.town/js-comma-operator"
author = "Taylor Troesh"
text = ""
lastupdated = "2026-04-20T13:20:40.717925706Z"
seen = true
+++

Did you know you could do this in JS?

```
let n = (0, 1);

console.log(n); // 1
```

And this?

```
let n = 0;

n = (n++, n++, n);

console.log(n); // 2
```

And this?

```
// 😒
if (x) {
  foo();
  return bar();
} else {
  return "baz";
}

// 😍
return x ? (foo(), bar()) : "baz";
```

And this?

```
// 😒
const f = x => { x[0]=42; return x; };

// 😍
const g = x => (x[0]=42, x);
```

At first glance, this seems pretty useless outside of [code golf](https://en.wikipedia.org/wiki/Code_golf). But I personally find it helpful for a few cases.

Quick Logging
----------

Sometimes I want to log something deep in the code without disturbing the general structure:

```
// before
function f(x) {
  return x ? "left" : "right";
}

// after
function f(x) {
  return x ? (console.log("left", x), "left") : "right";
}
```

Without the comma-operator, we would've had to completely disassemble the ternary-statement into an equivalent if-statement.

Making Returnable If-Statements
----------

```
// before
let x;
if (n > 0) {
  f();
  x = "left";
} else {
  x = "right";
}

// after
const x = n > 0
  ? (f(), "left")
  : "right";
```

It's nice that the code is smaller, but the *real* benefit of this example is that we don't need a mutable `x` variable polluting our scope! I personally find the ternary much safer and easier to read here.