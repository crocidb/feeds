---
title = "Bidirectional Instance Contexts"
description = "Just a quick one today, but I wanted to point out a little trick you can do with Haskell’s typeclass inference.Imagine we have some little class, the details of which matter not in the least:type Foo :: Type -Constraintclass Foo a where  ...We can give some instances of t"
date = "2025-02-15T02:15:00Z"
url = "blog/bidirectional-instance-contexts/index.html"
author = "Sandy Maguire"
text = ""
lastupdated = "2025-10-22T08:59:05.525456722Z"
seen = true
---

Just a quick one today, but I wanted to point out a little trick you can do with Haskell’s typeclass inference.

Imagine we have some little class, the details of which matter not in the least:

```
type Foo :: Type -> Constraint
class Foo a where
  ...
```

We can give some instances of this type:

```
instance Foo Int where ...
instance Foo Bool where ...
instance Foo () where ...
```

Regular, everyday stuff. But the instances for type constructors are more interesting, because they come with an instance context:

```
instance (Foo a, Foo b) => Foo (a, b) where ...
```

Then, of course, if we know both `Foo a` and `Foo b`, we can infer `Foo (a, b)`. To make this fact overwhelmingly explicit, we can reify the usual constraint-solving logic by using the `Dict` type, and thus the following program will typecheck:

```
import Data.Constraint

forwards
  :: Dict (Foo a)
  -> Dict (Foo b)
  -> Dict (Foo (a, b))
forwards Dict Dict = Dict
```

Perhaps tipped off by the name here, the gentle reader is asked to notice the asymmetry here, since the converse program will not typecheck:

```
backwards
  :: Dict (Foo (a, b))
  -> (Dict (Foo a), Dict (Foo b))
backwards Dict = (Dict, Dict)
```

But why should it not typecheck?[<sup>1</sup>](#fn1) Recall from the relevant instance definition that these instances must, in fact, exist:

```
instance (Foo a, Foo b) => Foo (a, b)
```

As a testament to *just* how good GHC is, we can support this bidirectionality via a minor tweak to the definition of class and its instances.

The trick is to add an associated type family to `Foo`, and to *use it as a superclass constraint:*

```
type Foo :: Type -> Constraint
class Evidence a => Foo a where
  type Evidence a :: Constraint
  type Evidence a = ()
  ...
```

Because we’ve given a default implementation of the type family, our existing simple instances work as before:

```
instance Foo Int where ...
instance Foo Bool where ...
instance Foo () where ...
```

with the only change required coming from the type constructor instances:

```
instance (Foo a, Foo b) => Foo (a, b) where
  type Evidence (a, b) = (Foo a, Foo b)
  ...
```

or, if we you want to be cute about it:

```
instance Evidence (a, b) => Foo (a, b) where
  type Evidence (a, b) = (Foo a, Foo b)
  ...
```

By sticking `Evidence` into the superclass constraint, GHC knows that this dictionary is always available when you’ve got a `Foo` dictionary around. And our earlier `backwards` program now typechecks as expected.

[This is all available in a play session](https://play.haskell.org/saved/YjCfxwNy) if you’d like to fool around with it.

---

1. Rhetorical question. I don’t want to hear about orphans or overlapping instances or whatever.[↩︎](#fnref1)