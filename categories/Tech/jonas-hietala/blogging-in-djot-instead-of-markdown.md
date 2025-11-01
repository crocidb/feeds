---
title = "Blogging in Djot instead of Markdown"
description = "What if we weren’t chained to the past? What if we tried to create a light markup syntax that keeps what is good about Markdown, while revising some of the features that have led to bloat and complexity in the CommonMark spec?John Macfarlane, [Beyond Markdown](https://jo"
date = "2024-07-17T19:35:07Z"
url = "http://jonashietala.se/blog/2024/02/02/blogging_in_djot_instead_of_markdown/index.html"
author = "Jonas Hietala"
text = ""
lastupdated = "2025-10-22T08:58:11.270075306Z"
seen = true
---

>
>
> What if we weren’t chained to the past? What if we tried to create a light markup syntax that keeps what is good about Markdown, while revising some of the features that have led to bloat and complexity in the CommonMark spec?
>
>
>
> John Macfarlane, [Beyond Markdown](https://johnmacfarlane.net/beyond-markdown.html)
>
>

I recently happened to see an offhand comment on [Hacker News](https://news.ycombinator.com/item?id=33867636) about a markup language called [Djot](https://github.com/jgm/djot). I don’t really have any large issues with the ~~Markdown~~ [CommonMark](https://commonmark.org/) I use to generate the posts for this website, but my brain saw a chance to get sidetracked yet again, and here we are.

The creator of [Djot](https://github.com/jgm/djot) is John MacFarlane, the same philosophy professor that also created [Pandoc](https://pandoc.org/) and [CommonMark](https://commonmark.org/). These might be two of the most influential projects in the markup space, so you’d get the feeling that maybe there’s something to this [Djot](https://github.com/jgm/djot) thing.

[The devil is in the details](#The-devil-is-in-the-details)
----------

I was going to give a few examples of what Djot looks like, but honestly, 95% of the Djot I write looks very similar to Markdown, with only minor differences.

So what’s the point?

The point is to try to take the good parts of CommonMark (the standard, unambiguous syntax specification for Markdown) and improve it in two ways:

1. Make it easier to parse.
2. Extend the feature set.

I’m sympathetic to the parsing problem, as it doesn’t sound that fun:

>
>
> There are 17 principles governing emphasis, for example, and these rules still leave cases undecided. The rules for list items and HTML blocks are also very complex. All of these rules lead to unexpected results sometimes, and they make writing a parser for CommonMark a complex affair. I despair, at times, of getting to a spec that is worth calling 1.0.
>
>
>
> John Macfarlane, [Beyond Markdown](https://johnmacfarlane.net/beyond-markdown.html)
>
>

For this alone I’d be willing to at least try Djot, but there are some added features I’d like to use. It’s true that I probably won’t have much use for things like definition lists or math for my blog posts, but the native support for divs and the ability to add attributes to any element is something I’ve been missing.

[Tools](#Tools)
----------

Given that Djot is a relatively young project, I expected the tooling to be lacking. There are things missing, but it wasn’t so bad for my use-case.

I found a Djot Sublime Text grammar I can use for syntax highlighting the blog, and there is Vim syntax highlighting in the [Djot repo](https://github.com/jgm/djot).

(Sad for those who don’t use Vim I guess.)

More annoying is that there’s no treesitter implementation for Djot. This is unfortunate, as with treesitter for Markdown I get proper syntax highlighting inside code blocks and I have a general treesitter jump command that, for Markdown, jumps between headers with `]g` and `[g`. (In Rust it jumps between structs, implementations, enums, and functions. It’s a general treesitter mapping.)

Not a deal-breaker of course. Using the Markdown treesitter for Djot works well enough for the time being. (Maybe I need to explore how treesitter grammars work one day, and create one for Djot.)

As for parsing I found [Jotdown](https://github.com/hellux/jotdown), which is a Rust library with an API inspired by [pulldown-cmark](https://crates.io/crates/pulldown-cmark), the library I use to parse CommonMark.

[Abstracting away markup parsing](#Abstracting-away-markup-parsing)
----------

I didn’t want to convert my existing Markdown files as I have more than 250 posts. (Yeah, I don’t know how that happened.)

So to add Djot support I had to refactor my site generator a bit and support both Djot and Markdown parsing. I’ve been lazy so this wasn’t as straightforward as I hoped; I had sprinkled calls to Markdown parsing all over the place.

When I don’t really know where to begin unwinding such a mess, I like to begin by modeling the data types in the domain. If I get the data modeling right, the rest has a tendency to fall into place fairly quickly.

One of the things I love about Rust is the enums (or sum types for you fancy people) which makes it easy to model an “either this or that” type:

```
#[derive(Debug, Copy, Clone)]
pub enum MarkupType {
    Markdown,
    Djot,
}

```

You can also add data to each variant, like so:

```
#[derive(Debug, Clone)]
pub enum Markup {
    Markdown(String),
    Djot(String),
}

```

This is nice because now the type system prevents you from accidentally using the wrong format, which would be easier if you stored a `MarkupType` and a `String` separately.

I did indeed store untagged data previously:

```
pub struct PostItem {
  // Is this in markdown or already parsed to html?
  // Wait, maybe it's in djot!
  pub content: String,
}

```

To make this harder we should probably create a newtype for html as well:

```
#[derive(Debug, Clone, PartialEq, Eq)]
pub struct Html(pub String);

```

Then to parse the markup you can add a `parse` method to `Markup`, that delegates to the right parser:

```
impl Markup {
    pub fn parse(&self) -> Result<Html> {
        match self {
            Self::Markdown(s) => markdown_to_html(&s),
            Self::Djot(s) => djot_to_html(&s),
        }
    }
}

```

Now posts can hold `Markup` and `Html` structs and we can rely on the compiler to ensure we don’t accidentally mix them:

```
pub struct PostItem {
    pub content: Html,
    pub markup: Markup,
    // Many other fields omitted..
}

```

With the right types in place the rest of the refactoring follows naturally. Just hide any Markdown and Djot specific implementation behind these types, follow the compile errors, and you’re soon done. Thinking and designing with types is usually a pleasure.

(Yeah, maybe it’s not *quite* that simple, but it’s a very helpful approach nevertheless.)

See the [source for the website](https://github.com/treeman/jonashietala) for more details.

[Customized markup](#Customized-markup)
----------

For the blog I have some [markup transformations](/blog/2022/08/29/rewriting_my_blog_in_rust_for_fun_and_profit/#Markdown-transformations) I apply to Markdown. This includes demoting headers, embedding bare YouTube links, transforming image collections, syntax highlighting, and more.

It’s a bit hacky though.

### [Epigraphs](#Epigraphs) ###

For example, I want to be able to turn a quote into an epigraph by wrapping it inside a div:

```
<div class="epigraph">
  <blockquote>
    <p>This is an epigraph</p>
  </blockquote>
</div>

```

But the CommonMark parser doesn’t process markdown inside html, so I [added an attribute parser](/blog/2022/08/29/rewriting_my_blog_in_rust_for_fun_and_profit/#Extending-pulldown_cmark) to wrap a quote in an epigraph:

```
> This is an epigraph
{ :epigraph }

```

The implementation isn’t pretty, and only works for specific elements such as a blockquote. But Djot has a built-in syntax for divs, so I can just write this to produce the same epigraph html output:

```
::: epigraph
> This is an epigraph
:::

```

### [Asides](#Asides) ###

I still need to do a bunch of transformations to reproduce existing functionality.

For instance, I want html output like this:

```
<aside>
  <p>This is a notice</p>
</aside>

```

There isn’t a native way to do this (other than inserting raw html, *ew*). For my own transformations the `div` system works well as a starting point, so I can use this kind of input:

```
::: note
This is a note
:::

```

And then match on the `note` class to transform the `div` into `aside`, and we’re done.

In [Jotdown](https://github.com/hellux/jotdown), like with [pulldown-cmark](https://crates.io/crates/pulldown-cmark), transformations are made by transforming iterators over events. Here I’m looking for `Event::Start(Container::Div, attrs)` and `Event::End(Container::Div)` (I ignore nesting). Transforming with iterators instead of an AST structure is awkward, so keeping the transformations as small as possible is nice.

### [Images](#Images) ###

I used the same `div` syntax in Markdown to create collections of images:

```
::: Flex
/images/configura14/octree1.png{ height=300 }
/images/configura14/octree2.png{ height=300 }
:::

```

This would wrap the images in a flex container to display them side-by-side:

[<img height="300" alt="" src="/images/configura14/octree1.png">](/images/configura14/octree1.png) [<img height="300" alt="" src="/images/configura14/octree2.png">](/images/configura14/octree2.png)

```
<figure class="flex-50">
  <a href="/images/configura14/octree1.png"><img height="300" src="/images/configura14/octree1.png"></a>
  <a href="/images/configura14/octree2.png"><img height="300" src="/images/configura14/octree2.png"></a>
</figure>

```

I (naturally) used to do this with Regex in a preprocessor step, and had some fun adding attribute parsing.

Now all I do is transform the `div` to a `figure` with the proper class. Even something like this with references outside and attributes works, without any special handling on my end:

```
::: flex
![][one]{ height=300 }
![][two]{ height=300 }
:::

[one]: /images/configura14/octree1.png
[two]: /images/configura14/octree2.png

```

(Yeah maybe I gloss over the gross implementation a little.)

### [Blockquote citations](#Blockquote-citations) ###

Quotes are nice, but I want to be able to add author attribution to them sometimes.

The html I want looks something like this:

```
<blockquote>
  <p>With author attribution</p>
  <footer>
    <span class="author">John Doe</span>
  </footer>
</blockquote>

```

With Markdown, I used custom attribute parsing to add author metadata:

```
> With author attribution
{ author=John Doe }

```

I could’ve done the same thing with Djot, or piggyback on Djot’s general attribute parsing and match on that (the attributes go before the quote, but otherwise looks similar).

But I got inspired by an ongoing discussion on the Djot repo about [adding blockquote attribution support](https://github.com/jgm/djot/issues/198) where this clean syntax was suggested:

```
> With author attribution
> ^ John Doe

```

There’s no support for this yet, so I had to do the transformation myself. But on the upside, by passing through the [Jotdown](https://github.com/hellux/jotdown) events after `^` during the iteration transformation we can easily support links or other Djot markup in the author field.

So this example:

```
> With author attribution
> ^ [John Doe](#) ~31/1~

```

Would produce:

```
<blockquote>
  <p>With author attribution</p>
  <footer>
    <span class="author"><a href="#">John Doe</a> <sub>31/1</sub></span>
  </footer>
</blockquote>

```

### [Other transformations](#Other-transformations) ###

There are other transformations I do with Djot as well:

```
pub fn djot_to_html(djot: &str) -> Result<String> {
    let transformed = Parser::new(djot);
    // Demote headers (eg h1 -> h2) and give them an "a" tag.
    let transformed = TransformHeaders::new(transformed);
    // Convert standalone images to figures.
    let transformed = AutoFigures::new(transformed);
    // Embed raw youtube links using iframes.
    let transformed = EmbedYoutube::new(transformed);
    // Syntax highlighting.
    let transformed = CodeBlockSyntaxHighlight::new(transformed);
    let transformed = InlineCodeSyntaxHighlight::new(transformed);
    // Transform divs, such as asides and figures.
    let transformed = DivTransforms::new(transformed);
    // Add a <footer> with author info to quotes.
    let transformed = QuoteTransforms::new(transformed);
    // Warn if any broken links are detected.
    let transformed = BrokenLink::new(transformed, context);

    let mut body = String::new();
    Renderer::default().push(transformed, &mut body)?;
    Ok(body)
}

```

The ones I didn’t bring up in the blog are pretty similar to their corresponding Markdown implementation. I’m not going to go through them in detail, see [the source code](https://github.com/treeman/jonashietala) if you’re interested.

[The future is bright](#The-future-is-bright)
----------

[Djot](https://github.com/jgm/djot) is a young project but with the more expressive custom markup it has improved my blogging experience. But more improvements are upcoming, with [ongoing discussions](https://github.com/jgm/djot/issues) on quite a few topics that would remove the need for many of my custom transformations, for example:

1. [Native blockquote attributions](https://github.com/jgm/djot/issues/198)
2. [Auto block-level figures](https://github.com/jgm/djot/issues/87)
3. [Captions for figures/tables](https://github.com/jgm/djot/issues/31)
4. [Custom tags support](https://github.com/jgm/djot/issues/240) (convert `div` into `aside`)

While I don’t currently use most of the added features compared to CommonMark, in the future I might start making use of the other types of lists (who doesn’t love a good list?) and footnotes might be a good addition to the more long-form blog posts I’ve been gravitating towards.

[Complaints about Djot](#Complaints-about-Djot)
----------

I’ve seen some people dismiss Djot because of its handling of sublists:

>
>
> Exactly, the sublist newline stuff is a total nonstarter for me. Sorry, I guess I’ll run a markdown parser that takes an extra second or whatever to run.
>
>
>
> [qbasic\_forever](https://news.ycombinator.com/item?id=33871415)
>
>

In Djot you have to surround a sublist with newlines. You can’t write this:

```
- List
  - This is fine in Markdown, but not in Djot

```

You have to do this:

```
- List

  - This is fine in both Djot an Markdown

```

It is indeeed more annoying at times, especially if you use the markup for smaller pieces of text, or use it to maintain a todo list with subtasks. But for more long-form content I don’t think it’s a big deal (which is what Djot targets more I guess).

Another complaint I’ve seen is that Djot doesn’t represent enough of an improvement compared to the different Markdown flavors to overtake them in popularity. This is a fair take—but I don’t care if it ever dethrones Markdown/CommonMark/whatever. It’s useful for me, and that’s all that really matters.