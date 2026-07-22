+++
title = "Typst for Your Code Blocks"
description = "I started using Typst about a month ago to write my dissertation proposal. I had seen Typst before and decided to keep an eye on it as it matured. While it still is very much in development, it is mature enough that I was able to rewrite my dissertation propo"
date = "2025-11-20T00:00:00Z"
url = "https://lambdaland.org/posts/2025-11-20_typst_your_codeblocks/"
author = """

            
              Ashton Wiersdorf
            
          """
text = ""
lastupdated = "2026-07-21T09:22:07.178444047Z"
seen = false
+++

I started using [Typst](https://typst.app) about a month ago to write my dissertation proposal. I had seen Typst before and decided to keep an eye on it as it matured. While it still is very much in development, it is mature enough that I was able to rewrite my dissertation proposal from an org-mode → LaTeX pipeline to pure Typst in about an hour with *no* major hiccups. In fact, most things got *simpler* as a consequence of using Typst.

[Typst](https://typst.app) is a typesetting system written in [Rust](https://rust-lang.org) designed to be a replacement for [LaTeX](https://en.wikipedia.org/wiki/LaTeX). LaTeX is the de-facto standard for typesetting technical documents thanks to its unsurpassed support for rendering mathematical formulae and its attention to [excellent typography](https://ctan.org/pkg/microtype). Both LaTeX and Typst operate by transforming a markup language into an output format like PDF.

I am working on a presentation to give as part of my oral defense of my dissertation proposal. (**Note:** I am not defending my dissertation yet—first I have to justify my plan of research to my PhD committee.) I found a way to use Typst to get gorgeous source code blocks at minimal cost.

Classic ways to get syntax highlighting
----------

I like having good syntax highlighting in my technical presentations, but getting properly highlighted code was either shoddy or labor-intensive. The tradeoff is:

Good-quality source code I have often typed the source code into my slide and then manually highlighted each word the appropriate color. This is pretty time-consuming, but it has the best results since the font can be scaled as large as I want, and I can manipulate the text as I see fit. Having things like a pre-defined color palette in my color picker and selecting non-contiguous regions with `⌘-click`: I can select all keywords and highlight them with the color I want. Quick screenshots Of course, taking a screenshot of an IDE is always an option. This is nice because you don’t have to spend any time manually highlighting each word. The downside is that it’s fundamentally a pixellated image and that becomes evident as you scale the picture.

I will still be using the highlight-each-word technique when I need to show some code and simulate editing it; the “Magic Move” transition in Keynote makes these kinds of code-editing demos easy to build and easy for the audience to follow. However, the majority of the time I’m just displaying code on the screen.

Typst to the rescue
----------

I built a [Typst template](/files/code_template.typ) and associated [theme file](/files/Nord.tmTheme) for code blocks. Now, if I have some code I want to put on a slide, I write a Typst file like the following and put into e.g. `example.typ`:

```
#import "code_template.typ": conf
#show: conf.with(cols: 92)

```elixir
# Receive from the client <- client_proof
valid? = SRP.valid_client_proof?(client_proof, password_verifier,
                                 server_key_pair, client_public_key)

if valid? do
  # Send back to client the server's proof -> server_proof
else
  # Send back unauthorized
end
```
```

Then I run `typst compile example.typ` and I get a PDF file with a transparent background that looks like this:

![](/img/typst_render_demo.png)

(That’s obviously a PNG file so that it displays nicely here on the web. The real output of that command is a PDF file.)

I can take that PDF file with a transparent background and drop it straight into my Keynote presentation. Typst takes care of all the syntax highlighting and it’s been good enough for my needs.

I am really excited about Typst
----------

Typst is still pretty new software. It has some rough edges and I will not be asking conferences to support Typst for their submissions until all those corners have been smoothed out. However, I am hopeful for Typst’s future, and anywhere where I can get away with just submitting a PDF without the source, I will be using Typst.

The things that Typst does better than LaTeX right now:

* Incredibly friendly syntax and rendering model. I went from not knowing anything about Typst to reproducing my résumé perfectly in an *hour*. I even made use of fancy things like functions.
* Excellent documentation. Did I mention how quickly I learned how to use Typst? It is easy to find the thing you want to customize.
* Instantaneous build times. Anyone who works with LaTeX will be familiar with 20+ second build times. Typst is so fast that it can live-rerender documents multiple times a second.

Typst has good typography and bibliography support. It can work with BibLaTeX `.bib` files, so you can start using Typst without having to rewrite your whole bibliography. Citation syntax is simple and easy to figure out.

Typst sill has a bit of a way to go before it does everything that the venerable LaTeX [Microtype](https://ctan.org/pkg/microtype) package does, but it’s making progress in this area.

Typst is free and open-source; you can contribute on their [GitHub](https://github.com/typst/typst) repository. It’s written in Rust and the code seems to be well-organized. They have a hosted collaboration platform that is proprietary; you can subscribe to this, and the funds spent here go towards paying a few full-time developers to work on both the closed-source collaboration platform *and* improving the open-source compiler. I think this is a neat model and I hope it lets Typst get off the ground and get the adoption it will need to survive and (hopefully!) supplant LaTeX as the typesetting system of choice for technical audiences.