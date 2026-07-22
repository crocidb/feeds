+++
title = "What is a type system, really?"
description = "BackgroundThis is a question I’ve been wrestling with for a little bit. My first experience with a type system was with Java, and I didn’t like it. It just felt like an annoying constraint on the kinds of programs I could write. I was coming from Perl, which sports weak"
date = "2023-01-23T00:00:00Z"
url = "https://lambdaland.org/posts/2023-01-17_what_is_a_type_system_really/"
author = """

            
              Ashton Wiersdorf
            
          """
text = ""
lastupdated = "2026-07-21T09:22:07.264702394Z"
seen = false
+++

Background
----------

This is a question I’ve been wrestling with for a little bit. My first experience with a type system was with Java, and I didn’t like it. It just felt like an annoying constraint on the kinds of programs I could write. I was coming from Perl, which sports weak dynamic typing, so Java’s rigidity came as a bit of a shock.

After Java I learned some C, which too has types. C’s types are different from Java’s in a big way: in C they’re really just directives to the compiler on how to interpret some bytes. “Everything is just `void *`” is kind of true. In C, bytes can be interpreted however you wish.

As I matured as a developer, I realized that sometimes I *wanted* constraints on what I could program. I wanted to have some way to narrow the scope of possibilities of things my program could do. While that may sound bad at first glance, consider if you could narrow the scope of ways your program would go *wrong*. That’s what types are designed to do.

Not all type systems are equally powerful: while Java’s type system prevents certain classes of errors, a `NullPointerException` crops up here and there to blow your (well-typed!) program out of the water. Languages like Rust or Kotlin sport type systems that prevent `NullPointerExceptions` or segfaults from ever cropping up. The trade-off is that these type systems often take a little more time to get used to, and might make it harder to write certain kinds of programs.

New advances in type systems are mitigating those trade-offs, however. Kotlin’s type system does away with `NullPointerExceptions` without being too much more complex than Java’s, and things like *gradual typing*<sup class="footnote-reference" id="fr-fn:1-1"><a href="#fn-fn:1">1</a></sup> make the cost curve of adding static types to a dynamically typed codebase much smoother. The more I learn, the more I see that I can do with types.

What is a type system?
----------

In one sense types are just sets of values that an expression can take on. Suppose I have a variable of type `Int`: this implies the values it will be bound to belong to the set ℤ. This view of types is really good for thinking about how algebraic types work: when I take the *product* of two types (e.g. `Int × Bool`), I’m describing values that belong to the set of ordered pairs `{(n,b) | n ∈ ℤ, b ∈ 𝔹}` or the *cross-product* of the sets `ℤ × 𝔹`. Tuples and structs are usually how product types are realized in a programming language.

The same goes for sum types and set unions. A *sum type* is the union of two or more types; if I have a variable of type `Nat + Bool`, then it can be a number *or* a boolean. Tagged unions and [enums](https://en.wikipedia.org/wiki/Enumerated_type) are typically how you see sum types in programming languages.

If you consider the [cardinality](https://en.wikipedia.org/wiki/Cardinality) of a type, the metaphor continues to work.<sup class="footnote-reference" id="fr-fn:2-1"><a href="#fn-fn:2">2</a></sup> For example, if I have a type called a `Byte` that holds an integer between 0 and 255, and I pair it with a boolean in a tuple to produce the type `Byte × Bool`, then there will be 256 × 2 = 512 different values that inhabit the type `Byte × Bool`. Likewise with a sum type, where a value can be either `Byte` or `Bool`, then there are 256 + 2 = 258 different inhabitants of the type.

Every type system that I know of has some set of *primitive types* along with ways of combining those types into bigger structures. Primitive types typically include numbers, booleans, and strings, while combining structures usually include records (or structs, i.e. product types) and enumerations (i.e. sum types).

### Static typing, dynamic typing, and type inference ###

Languages with a *static type system* are ones where the type of an expression—be it a variable, literal, compound expression, function call, etc.—is discernible without running the program. Haskell, Rust, Java, C, C++, Go, etc. are all statically typed languages.

In contrast, in a *dynamic type system*, the types of expressions are not knowable until runtime. The language implementation has to insert checks before e.g. performing an addition to make sure the types line up right. Perl, Python, Ruby, JavaScript, Scheme, Clojure, etc. are dynamically typed languages.

Some static languages like Java require you to write down the type of every variable, expression, and function. Others, like Rust and Haskell, do something called *type inference*: this is where the type checker is able to infer, based off of the types of literal data as well as the operators in use, what the types for a program should be. This is different than a dynamic type system: just because you didn’t write down what type a variable was, doesn’t mean it is now dynamically typed. In Rust, Haskell, etc., every expression still has a type—it’s just inferred rather than explicitly given by you, the programmer.

### Nominal vs. Structural ###

Some types are *nominal* and others are *structural*. These notions describe how two types are considered equal. Nominal types are what you get all over in Java: for two objects to be of the same type, they must both be of the same class. It doesn’t matter if you have two classes like:

```
public class Foo {
  int thing_1;
  boolean thing_2;
}

public class Bar {
  int thing_1;
  boolean thing_2;
}
```

Even though the members of `Foo` and `Bar` have the same interface and even the same names, a value of type `Foo` will never be the same as type `Bar`.

Structural types determine equivalence based off of their algebraic structure. Most types in Haskell, ML, Typed Racket, and others work this way. This is kind of like a generalization of interfaces: if two types “implement” the “same interface” of having the same structure, they can be considered equivalent and interchangeable. However, some types in Typed Racket, like those based off of structures, are nominal—you don’t have to be all structural or all nominal in your language.

Most of the time I find it easier to think in terms of structural types. There are times when nominal types make more sense, though. It’s nice when your language gives you the flexibility to choose.

Why do we care about type systems?
----------

I think most computer scientists are familiar with [the Halting Problem](https://en.wikipedia.org/wiki/Halting_problem), but [Rice’s Theorem](https://en.wikipedia.org/wiki/Rice's_theorem) is *slightly* less well-known.<sup class="footnote-reference" id="fr-fn:3-1"><a href="#fn-fn:3">3</a></sup> Rice’s theorem states:

>
>
> All non-trivial semantic properties of programs are undecidable.
>
>
>
> [Wikipedia](https://en.wikipedia.org/wiki/Rice's_theorem)
>
>

What is a semantic property? In contrast with a *syntactic property*, which is aspect apparent in the text of the program, a *semantic property* deals with what happens when the program runs. For example, “does this program halt?” is a semantic property, and the same semantic property covered by Turing’s Halting Problem. “Does this program contain any `if` statements?” is a syntactic property. “Does control reach this point in the program?” or “What values flow here?” are both semantic questions.

Type systems can turn certain semantic properties into syntactic ones: we can turn questions about the program’s runtime behavior (e.g. “Does a function taking integers get applied to a boolean causing a type error?”) into questions we can answer by examining the syntax of our program—if we have a statically typed language, we can tell—without running the program itself—whether or not no type errors ever occur.

There will still be programs when it’s impossible to decide whether or not the program has a type error:

```
(+ (if (goldbach-conjecture-true?)
      "not a number"
      42))
```

but in these cases we can restrict ourselves to programs that *definitely* do not have any type errors.

Beyond sets: types as a meta language
----------

Something I’ve learned recently is that “type system” is just what we call meta-languages for our programming languages. The language of types describes the behavior of a program written in another language.

Consider the following program in Typed Racket:

```
(: add1 (-> Number Number))
(define (add1 n)
  (+ 1 n))
```

The annotation `(: add1 (-> Number Number))` is a proposition that `add1` is a function that takes some value belonging to the set ℕ and gives back another thing in the set ℕ.

Now if we call that function:

```
(let ([seven : Number 7])
  (add1 seven))
```

the `: Number` bit on the first line is a proposition that the variable `seven` will take on a value in the set ℕ.<sup class="footnote-reference" id="fr-fn:4-1"><a href="#fn-fn:4">4</a></sup>

Now, in the meta-language of types, we can check that the type of the argument `seven` matches with the type of the parameter `n` in `add1`. In this case, the types match, so we proceed. If the declared or inferred type of the argument did *not* line up, our type checker would complain that we had violated the rules of the meta-language. These rules in the meta-language, of course, correspond to the actual runtime properties of Racket. More on that later in [§ Erasure](https://lambdaland.org/posts/2023-01-17_what_is_a_type_system_really/#erasure).

### Types other than values ###

Many object-oriented (OO) languages have a notion of `public` and `private` variables. Visibility is another thing type systems enforce. Annotating a variable as being `private` is a proposition that it is only accessed in certain parts of the program, which is something the type checker can then ensure is enforced.

Tainting is another thing you might want from a type system: *tainting* refers to marking user-supplied data as “tainted”, and any attempt to e.g. modify this data or branch off of the value is prohibited, unless the data has been “sanitized” by e.g. explicitly parsing well-formed data with regular expressions or the like. This is supposed to help protect against injection attacks.

A type system could have a wrapper type `Tainted<A>` that takes some data of any type and protects it from dangerous operations. Then you’d have functions like `regex_sanitize :: Tainted<String>, Regex → String` for when you want to parse a tainted string to get some data out of it.

Erasure
----------

There is usually some kind of check to make sure that the propositions in the meta-language correspond to the program we’re describing. Without this check, there wouldn’t be anything stopping me from writing:

```
(let ([seven : Number "definitely not a number!"])
  (add1 seven))
```

and the program would still type check if it just blindly trusted the type annotations. Of course, as soon as the program *runs*, the runtime would explode at the `add1` exception. Removing the types after checking is called “type erasure”, as the types are erased after type checking and the program gets run as if they had never been there.

Some languages like Haskell and Java do this. This is safe to do because we’re only running programs that we’ve proven are well-typed. The upside to this is that we can save a lot of overhead by removing type checks. The downside is that certain kinds of runtime introspection might not be possible. Java, for example, doesn’t keep type parameters around on generics. [Wikipedia has a good example](https://en.wikipedia.org/wiki/Generics_in_Java#Problems_with_type_erasure) of where `ArrayList<Integer>` and `ArrayList<Float>` both report the same thing under `.getClass()` at runtime.

One place to be careful is when typed and untyped code mix. This is where *gradual typing* comes in. Most languages are either statically typed or dynamically typed, but a growing number of languages are either being adapted to support or are being developed out of the box with support for gradual types. In these languages, like Typed Racket, you have to insert runtime checks to make sure code coming from an untyped module into a typed module agrees with the type guarantees.

There’s a lot of hidden complexity around gradual typing. [Ben Greenman](https://cs.brown.edu/people/bgreenma/publications/publications.html) has many papers outlining some of the intricacies around the semantics of gradual typing.

### Wat can go wrong ###

TypeScript is a bit of an odd language. The main page proclaims “TypeScript becomes JavaScript via the delete key” and just erases all types after type checking. You can call TypeScript modules from JavaScript, and TypeScript doesn’t put in any runtime checks. For example, you can do:

```
function add2(a : number, b number) : number {
  return a + b;
}

console.log(add2(2, 7));
console.log(add2("foo", "bar"));
```

and get the result:

```
9
foobar
```

TypeScript’s type guarantees are only locally sound. As soon as your typed and untyped parts mix, your program will fall back on the very [wat-worthy](https://www.destroyallsoftware.com/talks/wat) typing rules of JavaScript.

When layers mix
----------

How much can you program in this meta language of types? I’m still trying to understand this. *Dependent types* allow types to depend on values; i.e. you can have a type for “list with three integers”. Dependent typing, as I understand it, opens up complete programmability of the type system, at the cost of type checking becoming undecidable. These type systems allow you describe the behavior of your programs with incredible precision.

I’ve done a little work with [Coq](https://en.wikipedia.org/wiki/Coq), which supports dependent types. I haven’t done enough yet to really understand it well though!

Types as a design tool
----------

Beyond the neat safety properties that type systems give me, I really like using types as a design tool. So often I’ll be working on transforming some data or pulling together information from multiple different sources to decide something, and it’s easy to get lost in the lines of code. What helps is for me to think of a function in terms of the shape of its inputs and the shape of the needed output. (This is part of the reason why I like [structural type systems](https://lambdaland.org/posts/2023-01-17_what_is_a_type_system_really/#nominal-vs-dot-structural) so much.) With the types in hand, the program almost writes itself.

Indeed, there are times when the program *can* write itself! If you write down the type of a function, it’s not hard for an editor to suggest programs that satisfy that type. With more expressive types, the better the suggestions will be. To see an example of this in action, check out [the type checker I made with μKanren](https://git.sr.ht/~ashton314/microKanren), which can accept a type and generate expressions that satisfy it.

One thing that I like about this kind of program generation is the programs will definitely be *correct*, in the sense they’ll be well-typed. ML systems like GitHub Copilot are very impressive, but there’s always some chance that they’ll go completely wrong. Type-driven code suggestions can always be safe!

Despite how cool type-driven code generation is, and how valuable the safety guarantees that types provide are, I find types to be of greatest aid as a tool for thinking and reasoning about my programs.

Again, what are type systems?
----------

Type systems provide a way of writing down properties of our programs that we would like to be true, and then mechanically checking that those properties hold. Type systems come in all shapes and sizes; some are more expressive than others. Types are also a great tool to use when actually writing code.

Static type systems provide strong guarantees about program behavior at the expense of some friction in programming: dynamic languages make it easy to throw together a prototype, but can become unwieldy or difficult to maintain once the codebase grows. Gradual typing is an increasingly popular method to get the best of both worlds.

Further reading
----------

I’d recommend checking out the [Lambda Cube](https://en.wikipedia.org/wiki/Lambda_cube). Other books that I’ve read or am reading that have helped me understand types a bit better include:

* *Practical Foundations for Programming Languages*, by Robert Harper
* *Types and Programming Languages*, by Benjamin Pierce
* *Semantics Engineering with PLT Redex*, by Matthias Felleisen, Robert Findler, and Matthew Flatt
* *Programming Languages: Application and Interpretation*, by Shriram Krishnamurthi<sup class="footnote-reference" id="fr-fn:5-1"><a href="#fn-fn:5">5</a></sup>

I’ve also written a post about [how to write a type checker](/posts/2022-07-27_how_to_write_a_type_checker/) that hopefully should be pretty easy to follow.

Acknowledgments
----------

Thanks to my advisor [Ben Greenman](https://cs.brown.edu/people/bgreenma/) for reading a draft and correcting some inaccuracies in the erasure and gradual typing portions. Thanks also to [Scott Wiersdorf](https://solitum.net/) and [Alex Larsen](https://github.com/alex0112) for providing feedback and some much-needed polishing.

1. Gradual typing was first proposed by Jeremy Siek. The [Wikipedia page on Gradual Typing](https://en.wikipedia.org/wiki/Gradual_typing) has a decent introduction. [↩](#fr-fn:1-1)

2. This should suggest the relationship between sums and products in types and algebra is a deep one! [↩](#fr-fn:2-1)

3. Next time someone asks you to write a program that does some static analysis of a semantic property, you can say to them (in your best Vizzini voice of course), “you fell for one of the classic blunders! The first is never get involved in a Turing-machine halting problem. The second which is *slightly* less well-known, never attempt to use static analysis when semantics are on the line!”

   At this point it’s generally appropriate to laugh manically before falling over dead from iocane poisoning. [↩](#fr-fn:3-1)

4. Typed Racket would actually derive the type `Positive-Byte` for `seven` which is a subtype of Number. Typed Racket’s [numeric type hierarchy](https://docs.racket-lang.org/ts-reference/type-ref.html#(part._.Numeric_.Types)) is quite impressive! [↩](#fr-fn:4-1)

5. The book is available online here: [https://www.plai.org/](https://www.plai.org/) The sections on types and type checking are quite excellent. [↩](#fr-fn:5-1)