+++
title = "Skills That I Needed When I Started My PhD"
description = "I’m starting my third year as a PhD student. I thought it would be good to look back on some of the things that have helped me to this point. I study programming languages, but I imagine these things will help anyone in computer science—and some might have application to other ST"
date = "2024-07-09T00:00:00Z"
url = "https://lambdaland.org/posts/2024-07-09_phd_tools/"
author = """

            
              Ashton Wiersdorf
            
          """
text = ""
lastupdated = "2026-07-21T09:22:07.224196497Z"
seen = false
+++

I’m starting my third year as a PhD student. I thought it would be good to look back on some of the things that have helped me to this point. I study programming languages, but I imagine these things will help anyone in computer science—and some might have application to other STEM fields as well.

There are *many* softer skills that you need as a PhD student: curiosity, good work ethic, organization, etc. These are essential and nothing can replace them. (Note: that was *not* an exhaustive list.) I’m going to focus on some of the tools and hard skills that made the ride a little more comfortable. These compliment, rather than compete with, the softer skills that one develops as a beginning researcher.

This is a rough list, and not a how-to article. This is mostly just a collection of things I’ve seen other people *lacking* that have caused them to struggle. If you are considering doing a PhD, you might want to pick up some of these skills as you get ready to start to help you hit the ground running.

Software engineering
----------

I recommend reading *The Pragmatic Programmer* (Thomas, David and Hunt, Andrew, 2019). It’s written primarily for industry programmers, but there’s a lot in there that applies to anyone in CS research. All of the things I mention in this section are covered in detail in there.

### Version Control ###

You have got to know Git. If you cannot wrangle versions of your software and papers (yes, put the papers you write under version control) you will waste much time shooting yourself in the foot and trying to recover work you lost. You will also be laughed to scorn should you ever depart academia for a stint in industry if you do not know Git.

In all of the papers I have worked on, we have used Git to collaborate. We’ve typically used GitHub, which is fine as forges go, but I’ve also worked with a self-hosted GitLab instance, and that was fine too.

### Scripting ###

It is incredibly helpful to know a scripting language. I grew up on Perl, which makes munging large amounts of text a piece of cake. You don’t have to learn Perl; you should get really comfortable with a language that makes it easy to manipulate text and files.

Makefiles are also super helpful. I like using Makefiles to simply give names to a particular workflow. A Makefile for building a paper might look like this:

```
paper.pdf: paper.tex
    latexmk -lualatex paper

.PHONY: clean
clean:
    @echo Cleanup time
    latexmk -c
    rm -f paper.pdf
```

Now, instead of remembering all the incantations necessary to do some task, I have given that task a *name* by which I can call it.

### Command line ###

You must become proficient with the command line. If you are doing research, you will likely need to run software that other researchers have produced. And more likely than not, this will be *rough* software with bugs and sharp edges that is meant to demonstrate some research concept than be some practical tool ready for developers who only know how to code through YouTube videos and ChatGPT. That this software is rough is a [feature of research software](https://matt.might.net/articles/crapl/), not a bug. **There is *rarely*, if ever, a GUI available.** You are going to have to do stuff on the command line, so get used to it.

Getting used to the command line helps with [Scripting](https://lambdaland.org/posts/2024-07-09_phd_tools/#scripting) as well. Any task you do on the command line, you can write a script to automate. Building little scripts to e.g. build your paper, your homework, your experiments, etc. will save you time in the long run.

### Know thy editor ###

Emacs or Vim—pick one and learn it *really* well. VS Code is flashy and all, but it doesn’t have the same depth and breadth of customizations that Emacs and Vim give you. Also, Emacs and Vim are free software. You are in control!

I, of course, [love Emacs](/tags/emacs/) and I even made a [starter kit called Bedrock](https://codeberg.org/ashton314/emacs-bedrock) to help some of my friends in my research lab get started with Emacs. I use Emacs to program, write papers, take notes, manage email, track tasks, and more. I made a list of [my top Emacs packages](/posts/2024-05-30_top_emacs_packages/) a few weeks ago if you’d like more ideas on what is possible.

Vim is fine too and I will still respect you if you choose to go that route. ;)

Authoring papers
----------

### LaTeX ###

Familiarity with LaTeX has definitely helped me. Fighting with LaTeX is no fun, but you *will* have to do a little bit of it at some point. Lots of people like using Overleaf; I prefer the command line. Don’t get me wrong: Overleaf is awesome and makes collaborating in a Google Docs sort of way possible, but you loose some flexibility, and if something goes wrong on Overleaf right before your deadline, you’re toast.

### Bibliographies ###

There is a lovely computer science bibliography hosted at [dblp.org](https://dblp.org/). When I was going through the bibliography for [my last paper](/posts/2024-06-21_writing_a_paper/) I was able to find lots of missing DOIs simply by putting in the title of the paper into the search bar; DBLP found all the bibliographic information that I needed.

Organization and communication
----------

### Note taking ###

Take notes whenever you learn how to do something that wasn’t obvious to you when you started out doing it. I like the [Zettelkasten](https://en.wikipedia.org/wiki/Zettelkasten) method for taking notes: whenever I learn how to e.g. do some complex layout in LaTeX or learn a neat Makefile trick, I write it down. You can think of it as writing your own personal `man` pages

If you don’t know what a `man` page is, this is the standard manual system available on UNIX-like systems (e.g. FreeBSD, macOS, and Linux). Open a terminal and run `man man` to read the manual page for `man` itself. You really need to get comfortable with the [Command line](https://lambdaland.org/posts/2024-07-09_phd_tools/#command-line).

Some of these notes I rarely look back at. Others I revisit regularly. But even though I might not review some notes that frequently, there are cases where something on my system will break and a years-old note comes to my rescue from the *last* time I had to solve that problem. For example, I took notes on how to upgrade my language server for Elixir. I don’t upgrade that thing very often, but there is a little tweak I need to do just because of how my system is set up that is not obvious. It took me a few hours of debugging the first time, but, because I took notes, it now only takes me a few minutes.

### Email ###

Academics generally love email. It’s simple, robust, and doesn’t change its UI every few weeks, unlike *some* popular chat platforms. Unfortunately many universities are forcing everyone to move to Outlook. [This is a very bad thing.](/posts/2022-08-28_keep_email_federated/) Fortunately, there are [some workarounds](/posts/2023-05-03_email_with_outlook/) that you can use to reclaim some control over your email.

I have a sweet workflow with my email. That’s right, I do it all from Emacs. Now, while I *do* recommend you learn how to use Emacs, I understand that not everyone will start using Emacs. Everyone *should* get proficient with their email client and know how to use it well. I recommend anything that you can control entirely from the keyboard.

You should also get comfortable with editing replies. You know how, when you reply to an email, you usually see something like this:

Some mail clients will make the `>` at the beginning of the line pretty with different colored lines and whatnot. It’s all angle brackets under the hood, and you can still edit it as described here.

```
Hey here is my reply!

On Tuesday, 9 July 2024, Slartibartfast said:
> Hey,
>
> You were asking me where I found that elvish blade of great
> antiquity. Turns out it was just sitting on a shelf in the living
> room the whole time! I had the darndest time escaping the theif
> though; I think he locked me into the cellar as soon as I went down
> there. …
```

Just typing your reply above the email is called “top-posting”, and it’s considered bad form. You can actually edit the bit that was sent to interleave your reply with bits of the prior email. This makes it easier for people to know what you’re replying to.

```
Hey Slarti

> Turns out it was just sitting on a shelf in the living room the
> whole time!

What!? No way! I must have missed it. I'll grab it once I figure out
how to get up this chimney in the art studio.

> I had the darndest time escaping the theif though; I think he locked
> me into the cellar as soon as I went down there.

Yeah, I cornered the guy in his hideout. I won the knife fight though.
```

When used appropriately, this makes emails much more pleasant to read. It doesn’t break the email thread either; you can still see the chain of replies.

### Task tracking ###

You need some way to keep track of tasks. I have a workflow based off of [Org-mode](https://orgmode.org/), which I will not detail here. The short of it is that you need to be spending at least a little time with some regularity “sharpening the saw”<sup class="footnote-reference" id="fr-fn:1-1"><a href="#fn-fn:1">1</a></sup> by making sure that whatever tool you use to keep track of tasks is working for you.

References
----------

Thomas, David and Hunt, Andrew (2019). *The Pragmatic Programmer*, Addison-Wesley.

1. [https://en.wikipedia.org/wiki/The\_7\_Habits\_of\_Highly\_Effective\_People](https://en.wikipedia.org/wiki/The_7_Habits_of_Highly_Effective_People) [↩](#fr-fn:1-1)