+++
title = "Explainer: Tree-sitter vs. LSP"
description = "I got asked a good question today: what is the difference between Tree-sitter) and a language server? I don’t understand how either of these tools work in dept"
date = "2026-01-21T00:00:00Z"
url = "https://lambdaland.org/posts/2026-01-21_tree-sitter_vs_lsp/"
author = """

            
              Ashton Wiersdorf
            
          """
text = ""
lastupdated = "2026-07-21T09:22:07.172485855Z"
seen = false
+++

I got asked a good question today: what is the difference between [Tree-sitter](https://en.wikipedia.org/wiki/Tree-sitter_(parser_generator)) and a [language server](https://en.wikipedia.org/wiki/Language_Server_Protocol)? I don’t understand how either of these tools work in depth, so I’m just going to explain from an *observable*, *pragmatic* point of view.

Tree-sitter
----------

Tree-sitter is a *parser generator*. What this means is that you can hand Tree-sitter a description for a programming language and it will create a program that will parse that language for you. What’s special about Tree-sitter is that it is a.) fast, and b.) can tolerate *syntax errors* in the input. These two properties make Tree-sitter ideal for creating syntax highlighting engines in text editors. When you’re editing a program, *most of the time* the program will be in a syntactically invalid state. During that time, you don’t want your colors changing or just outright breaking while you’re typing. Naïve regex-based syntax highlighters frequently suffer from this issue.

Tree-sitter also provides a query language where you can make queries against the parse tree. I use this in the Emacs [package I’m trying to develop](https://codeberg.org/ashton314/citar-typst) to add [Typst](https://typst.app/) support to the [Citar](https://github.com/emacs-citar/citar) citation/bibliography tool: I can ask Tree-sitter to find a particular syntax object; it is safer and more robust than using a regular expression because it can do similar parsing to the Typst engine itself.

In short, Tree-sitter provides syntax highlighting that is faithful to how the language implementation parses the program, instead of relying on regular expressions that incidentally come close.

Language server
----------

A *language server* is a program that can analyze a program and report interesting information about that program to a text editor. A standard, called the [Language Server Protocol (LSP)](https://en.wikipedia.org/wiki/Language_Server_Protocol), defines the kinds of JSON messages that pass between a text editor and the server. The protocol is an open standard; any language and any text editor can take advantage of the protocol to get nice smart programming helps in their system. Language servers can provide information like locating the definition of a symbol, possible completions at the cursor point, etc. to a text editor which can then decide how and when to display or use this information.

Language servers solve the “N \\times M problem” where N programming languages and M text editors would mean there have to be N \\times M implementations for language analyzers. Now, every language just needs a language server, and every editor needs to be able to speak the LSP protocol.

Language servers are powerful because they can hook into the language’s runtime and compiler toolchain to get *semantically correct* answers to user queries. For example, suppose you have two versions of a `pop` function, one imported from a `stack` library, and another from a `heap` library. If you use a tool like the [dumb-jump](https://github.com/jacktasia/dumb-jump) package in Emacs and you use it to jump to the definition for a call to `pop`, it might get confused as to where to go because it’s not sure what module is in scope at the point.<sup class="footnote-reference" id="fr-2-1"><a href="#fn-2">1</a></sup> A language server, on the other hand, should have access to this information and would not get confused.

### Using a language server for highlighting ###

It *is* possible to use the language server for syntax highlighting. I am not aware of any particularly strong reasons why one would want to (or *not* want to) do this. The language server can be a more complicated program and so could surface particularly detailed information about the syntax; it might also be slower than tree-sitter.

Emacs’ built-in LSP client, [Eglot](https://github.com/joaotavora/eglot), recently added `eglot-semantic-tokens-mode` to support syntax highlighting as provided from the language server. I have tried this a little bit in Rust code and it seems fine; the Tree-sitter-based syntax highlighting has been working just fine for me, so I will probably stick to that unless I find a compelling reason to use the LSP-based highlighting.

**Update:** Thanks to [a comment on HN](https://news.ycombinator.com/item?id=46721842), I now know of a good reason why you would want to use a language server for syntax highlighting: the Rust language server [rust-analyzer](https://rust-analyzer.github.io/) can tell your text editor when a variable reference is mutable or not, which means you could highlight `mut` references differently than non-`mut` ones. Thanks to [David Barsky](https://davidbarsky.com) for the tip!

Meta aside: the LLM angle
----------

I wrote all of the above article. I did not ask an LLM to generate any portion of it. Please know that whenever you read something on my blog, it comes 100% from a human—me, Ashton Wiersdorf.

I am not so anti-AI to say that LLMs are worthless or should never be used. I’ve used LLMs a little bit. I think they’re fantastic at translating between languages; this seems to be something that they should be good at doing. They’re helpful at writing some boring parts of the code I write. However, most of the time I find that I can typically write the tricky bits of the code about as fast as I could specify to an LLM what I want.

I know that an LLM could have generated a facile pile of text much like the above, and honestly it would probably be decently helpful. However, know that what you have just read came directly from the fingers of a person who thought about the topic and bent his effort to helping you understand. This is from *real* human who understands the meaning behind each word here. I do not play games with syntax and generate answer-shaped blog posts. There is real meaning here. Enjoy it, and go forth and make more of it.

1. I just want to say that I think dumb-jump is very cool and I am not trying to knock it down at all. It’s honest about its limitations and can be handy when you do not have a language server available. [↩](#fr-2-1)