+++
title = "My Top Emacs Packages"
description = "If you ask anyone what the best Emacs packages are, you’ll almost definitely hear Magit (the only Git porcelain worth using) and Org Mode (a way to organize anything and everything in plain text) listed as 1 and 2. And they’re right!"
date = "2024-05-30T00:00:00Z"
url = "https://lambdaland.org/posts/2024-05-30_top_emacs_packages/"
author = """

            
              Ashton Wiersdorf
            
          """
text = ""
lastupdated = "2026-07-21T09:22:07.230921978Z"
seen = false
+++

If you ask anyone what the best Emacs packages are, you’ll almost definitely hear [Magit](https://magit.vc/) (the only Git porcelain worth using) and [Org Mode](https://orgmode.org/) (a way to organize anything and everything in plain text) listed as #1 and #2. And they’re right! I use those packages extensively every day.

Besides those two powerhouses, there are a handful of packages that make using Emacs a delight. If I had to ever use something else, I would miss these packages most:

[Avy](https://github.com/abo-abo/avy) Jump around your screen crazy fast. Teleport to any character with \~5 key presses. See [this blog post by Karthink](https://karthinks.com/software/avy-can-do-anything/) for more reasons why it’s awesome. I almost exclusively rely on `avy-goto-char-timer` and have it bound to `s-j`. [Embark](https://github.com/oantolin/embark) Kind of like a super-charged right-click for Emacs. Works beautifully in dired, when selecting files in the minibuffer. There’s an easy way to make it play well with Avy which is just the best. [Eat](https://codeberg.org/akib/emacs-eat) Eat is a terminal emulator that’s faster almost all the other terminal emulators for Emacs.<sup class="footnote-reference" id="fr-1-1"><a href="#fn-1">1</a></sup> Additionally, it can make a terminal emulator *in a particular region*, so if you use Eshell, you can get a little terminal emulator for every command you run. Normally, if you run, say, `cal`, you see the ugly terminal escape characters printed as text. With Eat, however, those terminal escape characters get interpreted correctly. Interactive programs (e.g. the Julia and Elixir REPLs) work flawlessly with it. [Jinx](https://github.com/minad/jinx) Best spellchecking ever. It can spellcheck based off of the fontlock face; I keep this on when I program to get on-the-fly spellchecking of code comments and strings. I keep `jinx-correct` bound to `C-;` à la flyspell because it is so darn helpful. Supports checking documents with mixed languages. This is one of the packages I miss most when I’m editing text outside of Emacs. [Citar](https://github.com/emacs-citar/citar) The best way to add citations in Emacs, hands-down. Reads bibtex, inserts in org-mode, LaTeX, whatever.

User interface enhancement
----------

These next packages are all by [Daniel Mendler](https://github.com/minad). These packages improve selecting commands, buffers, files, etc. from the `completing-read` and `completion-at-point` interfaces. These make Emacs insanely ergonomic and excellent.

These replace packages like [Helm](https://github.com/emacs-helm/helm), [Ivy/Counsel/Swiper](https://github.com/abo-abo/swiper), and [Company](https://github.com/company-mode/company-mode). In comparison to these packages, Vertico + Consult + Corfu are lighter-weight, faster, less buggy (in my experience; I’ve tried them all!), and work better with other Emacs packages because they follow the default built-in APIs.

[Vertico](https://github.com/minad/vertico) Lighter-weight, less buggy vertical completing-read interface. Replaces Ivy. Incredibly flexible. Works out-of-the-box with everything that has a `completing-read` interface, so you don’t need special `*-ivy` packages to make it play nice. Recommend adding [Marginalia](https://github.com/minad/marginalia/) as well by the same author to add extra infos. [Consult](https://github.com/minad/consult) Better than counsel. The live preview is amazing; I use `consult-buffer` instead of `switch-to-buffer`, `consult-line` instead of Swiper. `consult-ripgrep` is :fire: for searching large projects with instant previewable results. Pairs well with Embark to save results to a buffer. [Corfu](https://github.com/minad/corfu) Lightweight pop-up library. Pairs well with [Cape](https://github.com/minad/cape) by the same author.

See also [Orderless](https://github.com/oantolin/orderless) which enhances everything from `M-x` to `consult-line` to the Corfu popup. Vertico + Consult + Orderless + Marginalia + Corfu + Cape + Embark is sometimes called the “minad stack”.<sup class="footnote-reference" id="fr-2-1"><a href="#fn-2">2</a></sup> It’s the new hotness—that said, it’s gotten really really stable over the past two years.

If you like these packages, consider sponsoring their maintainers! These are some of my favorite open-source projects and I try to support them when I can.

A starter kit built on these
----------

If you like these packages, you might like my [Emacs Bedrock](https://codeberg.org/ashton314/emacs-bedrock) starter kit which, unlike many other starter kits, is meant to be a no-nonsense no-fluff no-abstraction bare-bones start for you to fork and tinker with to your liking. The stock configuration only installs *one* package ([which-key](https://github.com/justbur/emacs-which-key), which is amazing) but includes some extra example configuration. The [extras/base.el](https://codeberg.org/ashton314/emacs-bedrock/src/branch/main/extras/base.el) file includes sample starter configuration for most of the above packages. (I should add `eat` to it, come to think of it…)

Errata
----------

* Eat is not the fastest terminal emulator, Vterm is. Thanks to a Redditor who pointed this out.

1. The only emulator it’s *not* faster than is Vterm, which is pretty dang speedy. Eat has been more than fast enough for all my needs however. [↩](#fr-1-1)

2. Embark and Orderless are both developed by [Omar Camarena](https://github.com/oantolin) (oantolin) who frequently collaborates with Daniel Mendler. When I asked Omar on Reddit about the name, Omar replied that “minad stack” is fine; another name they’ve tried for the stack is “iceberg”, which I think is a good name too. [↩](#fr-2-1)