+++
title = "Unix As a Tool Forge"
description = "Wikipedia cites a few different sources on what “Unix Philosophy” is. Peter Salus summarizes it as: Write programs that do one thing and do it well. Write programs to work together.* Write programs to handle text streams, because"
date = "2022-11-07T00:00:00Z"
url = "https://lambdaland.org/posts/2022-11-07_unix_philosophy/"
author = """

            
              Ashton Wiersdorf
            
          """
text = ""
lastupdated = "2026-07-21T09:22:07.273235877Z"
seen = false
+++

[Wikipedia](https://en.wikipedia.org/wiki/Unix_philosophy) cites a few different sources on what “Unix Philosophy” is. Peter Salus summarizes it as:

* Write programs that do one thing and do it well.
* Write programs to work together.
* Write programs to handle text streams, because that is a universal interface.

That second bullet point is my favorite: making *composable* programs rather than monolithic systems. In this way, Unix is designed to be a forge for easily building new tools. The first rule—writing programs that do one thing well—is largely a means to the second. When you have building blocks that take simple shapes, you can compose them easily like Lego pieces.

I think that second goal is what makes Unix win: instead of providing you with every tool under the sun, you get a set of composable tools that allow you to construct better tools perfectly tailored to your problem. No one hacking on a PDP-11 thought to make an easy way to publish a blog like this one, but they put the framework in place to let *me* put together the tools I need to deploy this very post with a single command.

How Emacs fits inside of Unix philosophy
----------

One might argue that Emacs goes against Unix philosophy, for it can quite literally do pretty much everything. But that only violates the first rule—if you consider Emacs to be a tool forge, then Emacs is quite in line with the Unix philosophy. Emacs provides functions that all work on the buffer or bits of text, and these can all be composed to craft a work environment to fit your needs. [I use](https://git.sr.ht/~ashton314/.dotfiles) over 100 different packages, and they all play nice together!

Emacs once ran Germany’s flight control software ([source](https://www.reddit.com/r/emacs/comments/lly7po/comment/gnvzisy)). Please don’t try this at home.

I have come to view Emacs as my primary forge. It’s my layer on top of Unix, if you will. If I have Emacs customized how I like it, it doesn’t matter too much what operating system lives underneath: I can get a lot of work done. I used to view Emacs just as a tool, and I used it exclusively as a text editor. As time went on, though, I began to value the extreme keyboard-centric control Emacs gave me over my system. That’s why I [moved from the terminal to the GUI](/posts/2020-07-22-gui-emacs/) version of Emacs: I wanted to have more modifiers available to bind functions to.

Many people use Emacs exclusively as a text editor, and that’s fine. Usually these people have gotten comfortable with the command line, which is just another kind of tool forge. The great thing is both places make building new tools easy. Whatever your toolkit (though I do recommend you add Emacs to it if it’s not already there!) make sure you can build new tools with ease.

Further Reading
----------

* [Discussion on Hacker News](https://news.ycombinator.com/item?id=33522735)
* A kind chap sent me a link to [this blog post](https://tilde.town/~ramin_hal9001/articles/emacs-fulfills-the-unix-philosophy.html) as well as [their own thoughts](https://amodernist.com/texts/emacs-unix.html), which seemed like good things to link to.