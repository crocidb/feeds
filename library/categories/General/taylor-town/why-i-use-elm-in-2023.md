+++
title = "Why I Use Elm in 2023"
description = "Building UIs in HTML+CSS can be untenable. When making complex frontend experiences, I reach for Elm."
date = "2023-05-22T00:00:00Z"
url = "https://taylor.town/elm-2023"
author = "Taylor Troesh"
text = ""
lastupdated = "2026-04-20T13:20:40.562464903Z"
seen = true
+++

![elm mario example code](https://taylor.town/elm-mario.png)

![elm debugger](https://taylor.town/elm-debug.png)

If you look at some of my [recent projects](https://taylor.town/about#projects), you'll notice I enjoy building lean websites with pure HTML+CSS.

But building UIs in HTML+CSS can be untenable. When making complex frontend experiences, I reach for [Elm](https://elm-lang.org). Here's why:

1. [incredible API design](#design)
2. [fearless refactoring](#types)
3. [extreme predictability](#predictability)
4. [minimal cognitive overhead](#simplicity)
5. [solid tooling](#tooling)
6. [great performance](#performance)
7. [community packages that work](#packages)

7. Community Packages That Work
----------

Modern web development seems hellish for some organizations.

For the past 10 years, I've watched teams struggle against NPM packages. I've been part of multiple migrations between [moment.js](https://momentjs.com), [Luxon](https://moment.github.io/luxon/#/), and [day.js](https://github.com/iamkun/dayjs). React applications drown in [state management libraries](https://fe-tool.com/awesome-react-state-management) that perpetually break something important. And don't get me started on [React hooks](https://fe-tool.com/awesome-react-hook).

Every package on NPM seems (1) inundated with breaking changes or (2) completely abandoned. Codebase upgrades are terrifying after your team finds the perfect `package.lock` that works for everybody.

The poor quality of NPM also leaks into the devops-side of frontend. Every Webpack/Babel/Vite/EsBuild/Parcel ecosystem feels like a delicate mess on stilts. I've witness countless engineering hours wasted on JS source maps, polyfills, and build errors.

Outside of React, the situation seems equally bleak. Frontend frameworks in JS, Python, Elixir, etc. look riddled with similar quality problems. There's a lot of software out there, so please [email me](mailto:hello@taylor.town) if there are any ecosystems I should reconsider.

[Elm's packages](https://package.elm-lang.org) are generally well-documented, focused, appropriately named, and bug-free. But don't take my word for it -- pick any of these packages at random and see the quality for yourself:

|                                                                                                              |
|--------------------------------------------------------------------------------------------------------------|
|         [elm-explorations/test](https://package.elm-lang.org/packages/elm-explorations/test/latest/)         |
|        [elm-explorations/webgl](https://package.elm-lang.org/packages/elm-explorations/webgl/latest/)        |
|             [rtfeldman/elm-css](https://package.elm-lang.org/packages/rtfeldman/elm-css/latest/)             |
|               [rtfeldman/hex](https://package.elm-lang.org/packages/rtfeldman/elm-hex/latest/)               |
|   [lukewestby/elm-http-builder](https://package.elm-lang.org/packages/lukewestby/elm-http-builder/latest/)   |
|        [mdgriffith/elm-codegen](https://package.elm-lang.org/packages/mdgriffith/elm-codegen/latest/)        |
|[mdgriffith/elm-style-animation](https://package.elm-lang.org/packages/mdgriffith/elm-style-animation/latest/)|
|             [mdgriffith/elm-ui](https://package.elm-lang.org/packages/mdgriffith/elm-ui/latest/)             |
|              [w0rm/elm-physics](https://package.elm-lang.org/packages/w0rm/elm-physics/latest/)              |
|            [BrianHicks/elm-csv](https://package.elm-lang.org/packages/BrianHicks/elm-csv/latest/)            |
|            [terezka/elm-charts](https://package.elm-lang.org/packages/terezka/elm-charts/latest/)            |
|         [tesk9/accessible-html](https://package.elm-lang.org/packages/tesk9/accessible-html/latest/)         |
| [robinheghan/elm-phone-numbers](https://package.elm-lang.org/packages/robinheghan/elm-phone-numbers/latest/) |
|     [ianmackenzie/elm-geometry](https://package.elm-lang.org/packages/ianmackenzie/elm-geometry/latest/)     |
|        [ianmackenzie/elm-units](https://package.elm-lang.org/packages/ianmackenzie/elm-units/latest/)        |

6. Great Performance
----------

[This piece from Rakuten](https://engineering.rakuten.today/post/elm-at-rakuten/) matches my own experiences with Elm:

>
>
> * The performances of Elm applications are among the fastest. Internally Elm uses the concept of a virtual DOM, similar to React. The speed of the Elm virtual DOM is comparable to Svelte, which uses a different mechanism to update the DOM.
> * The Elm compiler produces smaller assets compared to other frameworks. Among the various optimizations to achieve this result, there is the dead code elimination with granularity to the single function that works across the entire ecosystem. If you import a large package and use only one of the functions contained, the compiler will ensure that only that function ends up in your generated code.
> * The Elm compiler per se is also fast. Our bigger codebase contains \~66,500 lines of Elm code, and it compiles incrementally in 0.3 seconds and from scratch in 2.5 seconds.
>
>

I want to add that Elm's virtual DOM will obviously be strictly worse than an equivalent optimized vanilla JS program. But for modern browsers, Elm seems to offer the best balance of developer ergonomics and runtime speed.

5. Solid Tooling
----------

Writing [Elm in Neovim](https://github.com/elm-tooling/elm-language-server) is wonderful. Everything feels snappy regardless of file sizes: types hints, tests, errors, autoformatting, and recompilation.

Thanks to the speedy and simple Elm compiler, I can keep my tooling extremely simple during development. Here's my entire live webdev setup:

```
http-server dist \
& watch -p "**/*.elm" -c "elm make src/Main.elm --debug --output=dist/elm.js"
```

Debugging is straightforward. When my code behaves strangely, I use Elm's time-travelling debugger to inspect the model at each state-change. From there, pure functions make errors obvious.

4. Minimal Cognitive Overhead
----------

Most languages are too powerful for my palate.

Don't get me wrong -- I love Rust and many other languages! But sometimes they're just too much for me.

When writing Rust or JS or Haskell or Python or Lisp, I'm overwhelmed by opportunity. Should I make this generic? Should I use classes or structs? Immutable or mutable? Macros? Functional or imperative array manipulation?

I try to please compilers and coworkers and customers, but all are disappointed. Give me a woodshop and I'm lost, but give me a simple chisel and I intuitively know what to do. There's a certain freedom in restricted toolsets.

Languages like Go and Elm spurn extravagance. They resist overcomplication. They force me to solve real problems instead of fighting compiler errors and stylistic differences.

Furthermore, consistent code makes portable mental-models. Go and Elm codebases tend to be extremely readable.

3. Extreme Predictability
----------

I like shiny new features *and* predictability.

Unfortunately, there are tradeoffs. For compiler teams, bug-hunting steals time from feature-development.

I can live with landmines if they don't change positions. Releasing patches reduces predictability. If a bug has a known workaround, I want the devs to focus all efforts on their next release instead of old errors.

But I'm also a patient person who loves ambitious visions. I would rather wait years for tightly-integrated featuresets than months for haphazard improvements.

Elm 0.19.1 has been the latest version since 2019. I've heard rumors of some new stuff coming in 2023, which is super exciting, but 0.19.1 remains wonderfully stable. I'll be happy with future releases as long as they're predictable, holistically designed, and relatively infrequent.

2. Fearless Refactoring
----------

When it comes to building software, my first guesses are generally wrong.

In most languages, changing things is a brutal process. I tend to live with my mistakes because refactoring is too tiresome.

With Elm, I experiment and change everything with little resistance. As long as I watch wildcard matches in my `case` statements, the compiler quickly guides me back to a working program from any change.

Theoretically, all static type systems should be able to do this, but they just don't. I don't know why, but my major changes in Haskell/Rust/Go always end up with unintended results. Elm's error messages are really in a class of their own, and it has nothing to do with pretty formatting.

1. Incredible API Design
----------

Elm's mental models made me a better programmer.

If you haven't already, take some time to browse Elm's 1st-party libraries: [core](https://package.elm-lang.org/packages/elm/core/latest/), [html](https://package.elm-lang.org/packages/elm/html/latest/), [json](https://package.elm-lang.org/packages/elm/json/latest/), [browser](https://package.elm-lang.org/packages/elm/browser/latest/), [url](https://package.elm-lang.org/packages/elm/url/latest/), [http](https://package.elm-lang.org/packages/elm/http/latest/), [bytes](https://package.elm-lang.org/packages/elm/bytes/latest/), [file](https://package.elm-lang.org/packages/elm/file/latest/), [parser](https://package.elm-lang.org/packages/elm/parser/latest/), [random](https://package.elm-lang.org/packages/elm/random/latest/), [regex](https://package.elm-lang.org/packages/elm/regex/latest/), and [time](https://package.elm-lang.org/packages/elm/time/latest/).

All the main libraries contain gems. They're easy yet strict; simple yet powerful.

For example, consider the [parser](https://package.elm-lang.org/packages/elm/parser/latest/) library. Parser pipelines are delightful to use, and teach you to think in terms of non-backtracking flows. When you're ready, you can upgrade to `Parser.Advanced` for extra contextual powers, but the complexity doesn't get in the way when you don't need it.

Even if you never seriously use Elm, study its libraries and build some toys with them. There's plenty of wisdom to glean from its careful design.