+++
title = "Warp Factor Refactoring in Emacs"
description = 'Here’s a nifty Emacs workflow for doing a project-wide search-and-replace on steroids. While I do use refactor tools that come with language servers,<sup class="footnote-reference" id="fr-fn:1-1"<a href="fn-fn:1"1</a</supsometimes those aren’t enough. Consider the case wher'
date = "2023-06-01T00:00:00Z"
url = "https://lambdaland.org/posts/2023-05-31_warp_factor_refactor/"
author = """

            
              Ashton Wiersdorf
            
          """
text = ""
lastupdated = "2026-07-21T09:22:07.249356970Z"
seen = false
+++

Here’s a nifty Emacs workflow for doing a project-wide search-and-replace on steroids. While I do use refactor tools that come with language servers,<sup class="footnote-reference" id="fr-fn:1-1"><a href="#fn-fn:1">1</a></sup> sometimes those aren’t enough. Consider the case where you not only need to change the name of a function, but also e.g. need to swap the order of two of its arguments. Or you’ve broken one function out into two that need to be chained together. Whatever—there are plenty of ways where the IDE won’t be able to do everything that you need. Enter: Emacs.

Here is what it looks like in action:

Here’s what I did:

* I searched for lines matching `set_` and `_config` in my project, and got over 90 matches.
* I moved all the matches to their own buffer.
* I used a regex replace on the buffer to transform patterns matching `/set_([a-z]+)_config!/` into `config_\1!`.
* I saved those changes back into the files where the came from.

Note that this replaced *two* symbols simultaneously: `set_logger_config!` and `set_injector_config!`. Moreover, this updated all the documentation as well, because I *wasn’t* relying on my language server to find instances of that symbol in the source code: I could look inside of doc strings and README files as well! (That can be a two-edged sword, so you’ll want to be careful with this.)

**Here is why this workflow rocks:** Once you’ve dumped the search results into a buffer, you have the *full power* of Emacs at your disposal. I have recorded keyboard macros, used regex replace from `evil-mode`, and done other zany things to effect large-scale edits with elegance and speed. You’re not limited to dumb exact-match symbol replacement—you’ve got a lot of tools that you already know at your disposal.

Engage the editor
----------

You will need the following third-party packages to make this work, as well as [ripgrep](https://github.com/BurntSushi/ripgrep) installed on your system:

* [Vertico](https://github.com/minad/vertico)<sup class="footnote-reference" id="fr-fn:2-1"><a href="#fn-fn:2">2</a></sup>
* [Consult](https://github.com/minad/consult)
* [Embark](https://github.com/oantolin/embark) (also `embark-consult`, but that ships with Embark anyway)
* [wgrep](https://github.com/mhayashi1120/Emacs-wgrep)

All except wgrep are available from [GNU ELPA](https://elpa.gnu.org/), and you can get wgrep [Non-GNU ELPA](https://elpa.nongnu.org/), so you shouldn’t have trouble finding and installing these—especially if you’re running Emacs 28 or newer.

Why all the packages? That sure seems like a lot (4 whole packages!) for something that seems pretty complicated for a single feature. Well, Vertico, Consult, and Embark are *mostly* there for the slick UI. wgrep does all the heavy lifting. I’d recommend installing Vertico, Consult, and Embark<sup class="footnote-reference" id="fr-fn:3-1"><a href="#fn-fn:3">3</a></sup> anyway for how much they improve discoverability and add really useful ways of interacting with Emacs.

Here’s the short of what each package contributes:

Vertico Turns the default minibuffer completion UI into an auto-updating list of candidates. This lets us interact with “candidates”—or more specifically in our case, lines matching a pattern across our entire project—in a fast and accessible way. Consult Adds a bunch of [`completing-read`](https://www.gnu.org/software/emacs/manual/html_node/elisp/Minibuffer-Completion.html)-based functions. This lets us use ripgrep with Vertico’s UI. Embark Kind of like a generalized keyboard-focused right-click on crazy steroids. This lets us export our list of matches out of Vertico’s UI and into a buffer that wgrep can use. wgrep Takes a buffer of search results, *lets us edit that buffer*, and then *reflect* those changes back into the files from the lines that they came from.

### Installing and configuring ###

Here are some sample configurations you can use.

If use [use-package](https://github.com/jwiegley/use-package),<sup class="footnote-reference" id="fr-fn:4-1"><a href="#fn-fn:4">4</a></sup> here is how you can set it up to automatically install next time you evaluate your `init.el`:

```
(use-package vertico
  :ensure t
  :config
  (vertico-mode))

(use-package consult
  :ensure t
  :bind
  (("C-c r" . consult-ripgrep)))

(use-package embark
  :ensure t
  :bind
  (("C-c a" . embark-act)))

(use-package embark-consult
  ;; comes bundled with Embark; no `:ensure t' necessary
  :after (embark consult))

(use-package wgrep
  :ensure t)
```

Alternatively, you can install the packages with `M-x package-install-package`, and your config should look like this:

```
;; make sure all your packages are installed before using these

(vertico-mode)
(define-key global-map (kbd "C-c a") 'embark-act)
(define-key global-map (kbd "C-c r") 'consult-ripgrep)
```

If you use fancy package managers like [Elpaca](https://github.com/progfolio/elpaca) (what I use) or [Quelpa](https://github.com/quelpa/quelpa), I trust that you know how to modify the above to suit your needs.

Make it so
----------

Once you have the packages installed, here are the steps you take to do this:

1. Invoke `consult-ripgrep`. (Bound to `C-c r` in the sample config.)
2. Type your search query. Note that space-separated patterns can match different parts of the line in different orders.
3. Invoke `embark-act`. (Bound to `C-c a` in the sample config.) This will open a buffer with a list of keys you can press next.
4. Hit `E` for `embark-export`. This opens up a new buffer with all the matches. Note that you should be able to further filter results with something like `consult-keep-lines`.
5. Hit `C-c C-p` to run `wgrep-change-to-wgrep-mode`.
6. Make your edits.
7. Hit `C-c C-c` to finish editing, then hit `q` to close the buffer.
8. Hit `C-x s` to run `save-some-buffers` to make sure writes are committed.<sup class="footnote-reference" id="fr-fn:5-1"><a href="#fn-fn:5">5</a></sup>

That’s it. Happy hacking!

1. Julia’s language server, for instance, comes with a nice “rename symbol” feature. I know lots of other IDEs and language servers offer this sort of thing. [↩](#fr-fn:1-1)

2. This one isn’t *strictly* necessary with Emacs 28 and beyond thanks to enhancements made to the [default minibuffer interface](https://www.masteringemacs.org/article/understanding-minibuffer-completion), but I can’t think of a good reason to *not* use Vertico: it is small, well-maintained, and it never ceases to impress me with how robust and flexible it is. [↩](#fr-fn:2-1)

3. Let’s not forget also the excellent [Marginalia](https://github.com/minad/marginalia/) and [Orderless](https://github.com/oantolin/orderless) packages too! [↩](#fr-fn:3-1)

4. Now built-in to Emacs 29! So many excellent features in Emacs 29! [↩](#fr-fn:4-1)

5. There is, of course, a way to do this automatically. Per the wgrep docs, put `(setq wgrep-auto-save-buffer t)` in your config. [↩](#fr-fn:5-1)