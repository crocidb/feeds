+++
title = "Boilerplate Busting in Functional Languages"
description = "This is the story of how I solved a problem (ugly, cumbersome boilerplate code) that I ran into while writing a program in a functional language (Elixir). Functional programming languages often pride themselves on expressiveness and elegance; but occasionally they are not amenabl"
date = "2024-05-06T00:00:00Z"
url = "https://lambdaland.org/posts/2024-05-01_definitely_not_about_monads/"
author = """

            
              Ashton Wiersdorf
            
          """
text = ""
lastupdated = "2026-07-21T09:22:07.234619072Z"
seen = false
+++

This is the story of how I solved a problem (ugly, cumbersome boilerplate code) that I ran into while writing a program in a functional language (Elixir). Functional programming languages often pride themselves on expressiveness and elegance; but occasionally they are not amenable to the most obvious solutions to the problems we wish to solve. In this case, the simplest solution to my problem would have been to have a global mutable variable. But no one likes those.

The solution most programmers would have found obviates mutation, but the code ends up being rather clunky. This inelegance stems from two intertwined issues pulling the code in different directions. However, the two concerns are *so* intertwined that it can be difficult to see them as separate issues at all! In this blog post, I hope I can show you a new way of looking at this class of problem that will let you see what those two issues are, and how to cleanly split them apart to get nice, maintainable, functional code.

>
>
> You take your analytic knife, put the point directly on the term Quality and just tap, not hard, gently, and the whole world splits, cleaves, right in two… and the split is clean. There’s no mess. No slop. No little items that could be one way or the other. Not just a skilled break but a very lucky break. Sometimes the best analysts, working with the most obvious lines of cleavage, can tap and get nothing but a pile of trash. And yet here was Quality; a tiny, almost unnoticeable fault line; a line of illogic in our concept of the universe; and you tapped it, and the whole universe came apart, so neatly it was almost unbelievable.
>
>
>
>
>
> *Zen and the Art of Motorcycle Maintenance*, Robert M. Pirsig
>
>
>
>

The Setup
----------

I will use a concrete example to describe my specific problem, though the issue is general enough that you likely have encountered it. After I walk through the example I’ll cover the essential elements that make my solution work, and how it generalizes to similar problems.

Suppose that you are writing an application that lets people track their workout habits. Every time that they succeed in meeting a goal, they register what they accomplished. Now you have a database full of logged events like “went to the gym” or “swam 1000 m” or “ran a mile”, etc. Now you need some way to convert this set of events into reward points—preferably in a way that the user finds motivating.

Table 1: An example of such habit records for a user.

|`user_id`|  `date`  |`event_type`|`event_amount`|
|---------|----------|------------|--------------|
|  69105  |2024-05-01|    gym     |      1       |
|  69105  |2024-05-02|    swim    |     1000     |
|  69105  |2024-05-03|    gym     |      1       |
|  69105  |2024-05-04|    run     |     1.61     |

But every user is different, so let’s say that you make it so that users can customize exactly how goal completions translate into reward points. Somewhere in your app you let users write a little equation that your program will then evaluate against the events that they have logged. In the end, the user gets a single point value.

Surface syntax

```
points = get("gym") * 10 + get("swim") * (get("run") + get("gym"))
```

Parsed AST

```
{ "op": "+",
  "args": [
    { "op": "*",
      "args": [
        { "query": "gym" },
        { "num": 10 }
      ] },
    { "op": "*",
      "args": [
        { "query": "swim" },
        { "op": "+",
          "args": [
            { "query": "run" },
            { "query": "gym" }
          ] }
      ] }
  ] }
```

Evaluation result

```
points = get("gym") * 10 + get("swim") * (get("run") + get("gym"))
       =      2     * 10 +     1000    * (   1.16    +      2    )
       = 3180
```

```
def interpret(user_id, {op: op, args: [arg1, arg2]}) do
  arg1_eval = interpret(user_id, arg1)
  arg2_eval = interpret(user_id, arg2)
  case op do
    "+" -> arg1_eval + arg2_eval
    "*" -> arg1_eval * arg2_eval
  end
end

def interpret(_user_id, {num: n}), do: n

def interpret(user_id, {query: q}), do: query_db(user_id, q)
```

Sample interpreter for the simple language

This is, in essence, a little interpreter. I will not go over how to build an interpreter here, but the gist of it is that you walk down the AST of the equation and evaluate the leaves and nodes recursively until you wind up with a single number of points at the end.

Now let’s say that you are processing a large number of such requests, and you would like to batch all of the database calls. In the previous example, there were four database queries, one of which (`"gym"`) was a duplicate. (Each `get` in the surface syntax or `query` node in the AST induces a database query.) To improve performance, you could batch all of these database calls—thereby also eliminating duplicate queries—and then have this data on hand as you walk the AST.

So here is the new operation we would like to perform: we want to walk through AST, collect all of the database calls into a set, and replace each instance of a database query (`query` nodes) in the expression to a *reference* (`query_ref` nodes) that we can link to the batched results. We will create a fresh identifier every time we encounter a new query; duplicate queries will use the first reference.

Before optimization

```
{ "op": "+",
  "args": [
    { "op": "*",
      "args": [
        { "query": "gym" },
        { "num": 10 }
      ] },
    { "op": "*",
      "args": [
        { "query": "swim" },
        { "op": "+",
          "args": [
            { "query": "run" },
            { "query": "gym" }
          ] }
      ] }
  ] }
```

After optimization

```
{ "op": "+",
  "args": [
    { "op": "*",
      "args": [
        { "query_ref": 0 },
        { "num": 10 }
      ] },
    { "op": "*",
      "args": [
        { "query_ref": 1 },
        { "op": "+",
          "args": [
            { "query_ref": 2 },
            { "query_ref": 0 }
          ] }
      ] }
  ] }

{ "queries": ["gym", "swim", "run"] }
```

Now we need to implement it.

### First attempt ###

We could just create a variable that we can mutate as we walk down the tree: every time we encounter a node that looks like `{ "query": _ }`, we generate a fresh identifier (or look up an old one if it’s a duplicate query) and replace it with `{ "query_ref": _id }`. Once we’re done walking the tree, we have a new AST with `query_ref` nodes instead of `query` nodes, and a list of queries that we can execute in one go.

This could work, but the fact that we are using *global mutable state* should ring alarm bells for *anyone*—not just functional programmers. Whenever we call our transform function, we would have to ensure that we clear out the old list of accumulated information. Don’t forget about all the *other* problems that global mutable state brings. There must be a better way.

### Second attempt ###

How might our function be more pure? Instead of just returning a modified tree, we can return a tuple of the new AST node plus a list of queries. (I’ll call this specific shape an *AST-queries-tuple* throughout.) This eliminates the need for a global variable, and now every call to our optimization function is pure. It’s easier to test and reason about.

```
def transform_queries({:query, query_text}) do
  query_id = fresh_query_id()
  {{:query_ref, query_id}, [{query_id, query_text}]}
end

def transform_queries({:+, lhs, rhs}) do
  {new_ast_l, queries_l} = transform_queries(lhs)
  {new_ast_r, queries_r} = transform_queries(rhs)
  {{:+, new_ast_l, new_ast_r}, queries_l ++ queries_r}
end

…
```

However, this means that we have to take care to combine this information whenever we do a recursive call. It becomes even more cumbersome when we recur over elements in a list and we need to combine all their results together. A well-crafted `reduce` makes things work OK, but I think you can agree the following code isn’t the most *straightforward* to read and understand what’s going on.

```
def transform_queries({:max, args}) do # args is a list
  args
  |> Enum.map(&transform_queries)
  |> Enum.reduce(fn {x, qs}, {max_acc, q_acc} ->
                      {max(x, max_acc), qs ++ q_acc} end)
end
```

This is quite a bit of boilerplate. It’s not the *worst* code ever—it’s certainly better than our first solution with a global variable—but we seem to be saying more than we need to here.

Finding the cleavage point
----------

How can we clean up this code? The code is messy because there are actually *two competing concerns* here: we have some *main computation* that we care about (transforming the tree) and some *side information* (the set of database queries) that we’d like to collect in parallel. If we can separate these concerns, our code will improve.

Now that we see the two intertwined issues, how do we go about separating them? We will still carry around the AST-queries-tuple, but we are going to pull out the logic that governs how we keep track of the list of queries and keep it separate from the AST transformation logic.

First, let’s define a module, a type to help us keep track of an AST-queries-tuple, and a function `wrap` that takes some AST and pairs it with an empty list of queries:

```
defmodule AstList do
  @type t() :: {Ast.t(), [Query.t()]}

  @spec wrap(Ast.t()) :: t()
  def wrap(v), do: {v, []}
end
```

Second, the clever bit: we write a function that lets us manipulate the AST value inside the tuple *without worrying about how to combine the sets of queries*. We’ll call this function `thread`, and it takes an AST-queries-tuple and gives it to a function argument that expects *just* the AST bit. That function argument should return a new AST-queries-tuple. Our function `thread` will then merge the two lists of queries together without the function parameter ever having to worry about it.

```
@spec thread(t(), (Ast.t() -> t())) :: t()
def thread({ast, queries}, f) do
  {new_ast, new_queries} = f.(ast)
  {new_ast, new_queries ++ queries}
end
```

Now we can use this to write our `transform_queries` function! Before we get there, remember that Elixir has a handy set of [customizable infix operators](https://hexdocs.pm/elixir/1.12/operators.html#custom-and-overridden-operators) that we can use as shorthand<sup class="footnote-reference" id="fr-1-1"><a href="#fn-1">1</a></sup>:

```
def m ~>> f, do: thread(m, f)
```

That means that instead of writing this:

```
def transform_queries({:+, lhs, rhs}) do
  {new_ast_l, queries_l} = transform_queries(lhs)
  {new_ast_r, queries_r} = transform_queries(rhs)
  {{:+, new_ast_l, new_ast_r}, queries_l ++ queries_r}
end
```

We can just write:

```
def transform_queries({:+, lhs, rhs}) do
  transform_queries(lhs) ~> fn new_lhs ->
    transform_queries(rhs) ~> fn new_rhs ->
      wrap({:+, new_lhs, new_rhs})
    end
  end
end
```

You might be able to see now how this would make writing this little optimization pass a lot cleaner. We can go a step further on the syntax though: with a little metaprogramming imagination, we can write some shorthand for the `~>` notation that looks more like variable assignment in a `with`. It’s not that hard to do.

```
defp transform_threading([{:<-, _, [var, expr]} | rst]) do
  quote do
    unquote(expr) ~>> fn unquote(var) -> unquote(transform_threading(rst)) end
  end
end

defp transform_threading([expr]), do: expr

defmacro threading (do: {:__block__, _, lines}) do
  transform_threading(lines)
end
```

Now we can write the handler for `+` like so:

```
def transform_queries({:+, lhs, rhs}) do
  threading do
    new_lhs <- transform_queries(lhs)
    new_rhs <- transform_queries(rhs)
    wrap({:+, new_lhs, new_rhs})
  end
end
```

And that gets transformed into the nested anonymous function notation we saw previously.

### What do we get? ###

Now we don’t have to think about merging the list of queries any more: the `~>>` operator handles all that for us. Bigger savings come if we think about making a version of `map` that works with our AST-queries-tuples. We’ll call it `mapM` since it’s like a `map` that we’re *mashing* the results together:

```
@spec mapM(vs :: [Ast.()], f :: (Ast.t() -> t())) :: t()
def mapM(vs, f) do
  results = vs |> Enum.map(f)

  {
    results
    |> Enum.map(&elem(&1, 0)),
    results
    |> Enum.map(&elem(&1, 1))
    |> Enum.reduce([], &++/2)
  }
end
```

Here we map over a list of `Ast` values, collect all the resulting sets of queries, and merge them together. This gives us a big savings when we write something like the `max` function:

New version

```
def transform_queries({:max, args}) do
  args |> mapM(&transform_queries) ~>> &wrap({:max, &1})
end
```

Old version

```
def transform_queries({:max, args}) do # args is a list
  args
  |> Enum.map(&transform_queries)
  |> Enum.reduce(fn {x, qs}, {max_acc, q_acc} ->
                      {max(x, max_acc), qs ++ q_acc} end)
end
```

Notice that all the handling of the extra information has been lifted out of our code. Not only does it make it clearer what the *core intent* of the functions are, but we also get some added flexibility around how we structure that extra data. If we wanted to use a map or a set instead of a list of tuples as the second element in the AST-queries-tuple, then with this refactoring we only have to modify the `wrap`, `thread`, and `mapM` functions. The rest of the code can stay the same!

So, with a little bit of work, we’ve gone from a solution using global mutable state 🤢 to passing around a AST-queries-tuple 😐 to abstracting out the tuple entirely, gaining clarity and flexibility along the way. 🤩 Our threading-related functions are actually generic enough that they don’t need to be about ASTs and lists of queries—as long as we are doing some main computation with a little extra data gathering on the side, this pattern should apply.

Wouldn’t it be nice if this pattern had a name?

It was a monad all along!
----------

Surprise! This is exactly the [writer monad](https://wiki.haskell.org/All_About_Monads#The_Writer_monad)! This whole post has been a monad tutorial in disguise!

If you’ve been exposed to monads before, you might recognize `wrap` as `return` and `thread` as `bind` or—as the Haskell programmers like to call it—`>>=`. The `thread do … end` macro is just [`do` notation](https://learnyouahaskell.com/a-fistful-of-monads#do-notation). (I couldn’t think of a clever name for `mapM`, so I just pretended the `M` stood for *mash* instead of *monad*.)

There are certain properties (called the “monad laws”—don’t worry, they’re not that scary even though the name sounds ominous) that these functions need to satisfy, but they’re pretty easy to hit. If you don’t satisfy these laws, your monad won’t behave predictably in certain circumstances. If you’re getting started with monads, don’t worry about it right now.

“Monad” is just an interface.<sup class="footnote-reference" id="fr-2-1"><a href="#fn-2">2</a></sup> That’s all there is to it. To make your data structure (like our AST-queries-tuple) conform to the Monad interface, you need functions like `wrap` and `thread`. Once you have those, you have a monad. That’s pretty much all there is to it.

### Different kinds of monads ###

There isn’t a fixed number of monads; there are however a set of more-or-less “standard” monads which have been discovered to be generally useful; the Haskell Wiki has a nice list [here](https://wiki.haskell.org/All_About_Monads#A_Catalog_of_Standard_Monads). Among these is the “maybe” monad, which lets you focus on the happy-path of computation and abstracts away the failure path. In Elixir, you can see this pattern with the `{:ok, term()} | :error` idiom. (The `with` notation commonly seen in this idiom closely follows Haskell’s `do` notation.) There are many other useful monads besides the writer and maybe monads. Some of these (like the [IO monad](https://wiki.haskell.org/All_About_Monads#The_IO_monad)) are pretty specific to Haskell and other pure functional languages that don’t support the same kinds of control flow or constructs; others have wider application.

### What monad tutorials get wrong ###

Most of the value (I think) of monads is not having `return` and `bind`, but all the helper functions like `mapM`, `do` notation, and friends. While I was [writing some Haskell](https://codeberg.org/ashton314/ysue), I got to know all the monad-related functions and how useful they were. These helper functions are what make programming with monads *natural* and *powerful*. The core functions `bind` and `return` are all you “need” to make a monad, but no one would actually program with just those.

If you ever find something that you think would work well modeled as a monad, be sure to implement additional functions *beyond* `bind` and `return`. You can see a list of functions Haskell implements for monads [here](https://hackage.haskell.org/package/base-4.19.0.0/docs/Control-Monad.html#g:4) if you want some inspiration.

Why Haskell uses monads so much
----------

You hear a lot about monads with languages like Haskell, but not so much with other functional languages like Elixir or Rust. Part of this is need, and part is because of ergonomics.

Haskell needs monads to implement effectful computation. Effects include exceptions (modeled by the maybe monad) or logging information (the writer monad). Languages that have these effects natively don’t strictly *need* these monads. (Though, as we’ve seen, writing a monad can help other languages, even when they have uncontrolled side-effects, like Elixir.)

Haskell makes using monads ergonomic through its *typeclass* mechanism. Other languages have more constrained method dispatching mechanisms, so you have to jump through some hoops to get monads to work as seamlessly as they do in Haskell.

### Typeclasses vs. interfaces ###

If you’re familiar with an OO language, you’ve almost certainly come across the idea of an interface: it’s just a specification of methods an object needs to implement. *Typeclasses* are similar: they specify a set of functions needed for a type to belong to a typeclass. There are a few key differences between typeclasses and interfaces however:

* Interfaces are *closed*, meaning, if an object doesn’t implement the interface, you can’t do anything about it, unless you modify the definition of the object itself.

  In contrast, typeclasses are *open*, meaning that I can implement the requisite functions to turn a datatype into a monad, even if I can’t modify the definition of the datatype itself.

* Interfaces specify methods that dispatch on their object. If I call `thing.dance()`, then I will look up the `dance` method in whatever class `thing` belongs to.

  Typeclass functions can dispatch on the *return type* of the function. For example, the `wrap` (i.e. `return`) function needs to dispatch on whatever type it’s expected to return. If I said something like:

  ```
  thing1 :: Robot = return "Marvin"
  thing2 :: Person = return "Arthur"
  ```

  `return` would dispatch to the version specified for the `Robot` type for `thing1`, and `Person`’s implementation for `thing2`. This makes the monad functions really generic; with a `return` that can dispatch on the expected return type, you can write `return` without thinking much about which monad exactly you’re using.

### Using monads in non-Haskell languages ###

In languages that don’t have typeclasses, you need to take special steps to ensure that you dispatch to the proper variant of the monad. Racket has a [monad library](https://docs.racket-lang.org/functional/interfaces.html) that works via a generics interface system, plus a few tricks to teach `return` (called `pure` in this library) what type it should return. I am sure the same tricks would apply to Elixir. Indeed, Elixir has [protocols](https://hexdocs.pm/elixir/protocols.html), which are like interfaces, but they are open. They still dispatch on the shape of the first argument passed to them, you would need to pull a trick like Racket’s `pure` function and pass an argument to ignore just to get the dispatch right.

Elixir has less need for monads than Haskell because its functions are impure. (A function can do arbitrary IO, send messages, throw exceptions, etc.) but there are still cases (as we have seen) where a monad can make life easier. Consider using a monad library the next time you need to avoid ugly side-effects!

Breaking boilerplate in your functional projects
----------

Functional languages are not immune to sprouting boilerplate. And while most of the design patterns in a certain OO cookbook are “invisible or simpler” in functional languages,<sup class="footnote-reference" id="fr-4-1"><a href="#fn-4">3</a></sup> some patterns crop up when similar problems arise.

Monads are a powerful tool for dividing the *essential* from the *incidental* in a program. Exactly what constitutes the essential versus incidental parts—along with how to separate them—can be tricky to see at first. I think this is because separating these concerns in mainstream functional languages get less visibility, and not because of any *inherent* difficulty of the problem. Perhaps if everyone started out programming by learning Racket and got comfortable with functional idioms, monads would be as natural as the Visitor pattern<sup class="footnote-reference" id="fr-5-1"><a href="#fn-5">4</a></sup>.

I was surprised and delighted when a monadic solution appeared as the most natural solution to a problem I was working on. Now, you might say that’s because I work as a programming languages researcher. *However*, the last *two* times I was working in industry, we had some sort of language interpreter, and I had to walk an AST. Knowing the writer monad would have saved me a lot of time and effort. I hope you can start seeing some monadic patterns in your code, and that you’ll be able to make a monad to make it easier to reason about and refactor your code as well.

Further reading
----------

* [https://wiki.haskell.org/All\_About\_Monads](https://wiki.haskell.org/All_About_Monads)
* [https://learnyouahaskell.com/a-fistful-of-monads](https://learnyouahaskell.com/a-fistful-of-monads)

Acknowledgements
----------

Thanks to Scott Wiersdorf for the initial impetus to write this, as well as some thoughtful feedback on the prose and outline. Thanks also to Mark Ericksen for some additional comments.

1. It would be nice if we could use `>>=` for this shorthand… but I’m getting ahead of myself. [↩](#fr-1-1)

2. There’s a subtle difference between interfaces and typeclasses, and I’ll get to that shortly. This is meant to build intuition. [↩](#fr-2-1)

3. Quote from Peter Norvig. See: [https://norvig.com/design-patterns/design-patterns.pdf](https://norvig.com/design-patterns/design-patterns.pdf) [↩](#fr-4-1)

4. Certainly it would be more comfortable than the `AbstractSingletonProxyFactoryBean`! [↩](#fr-5-1)