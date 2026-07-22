+++
title = "Make an Emacs Buffer Open the Way You Want"
description = "Are you tired of having a particular buffer pop open in the wrong direction? Do you wish, for example, that the Racket REPL buffer showed up on the right in a vertical split, rather than below in a horizontal one? Look"
date = "2022-12-27T00:00:00Z"
url = "https://lambdaland.org/posts/2022-12-27_repl_buffer_on_the_right/"
author = """

            
              Ashton Wiersdorf
            
          """
text = ""
lastupdated = "2026-07-21T09:22:07.266426115Z"
seen = false
+++

Are you tired of having a particular buffer pop open in the wrong direction? Do you wish, for example, that the [Racket REPL](https://www.racket-mode.com/#Edit-buffers-and-REPL-buffers) buffer showed up on the right in a vertical split, rather than below in a horizontal one? Look no further. I give you, `display-buffer-alist`:

```
(add-to-list 'display-buffer-alist
             '("\\*Racket REPL </>\\*"
               (display-buffer-in-direction)
               (direction . right)))
```

That little snippet will make sure when you hit `C-c C-k` inside of a `racket-mode` buffer, a REPL will pop up on the right-side instead of on the bottom. I find that much more comfortable to use.

The variable `display-buffer-alist` is a fantastically useful variable. There’s so much to it that I can’t write it up in a blog post. Fortunately, the indomitable Mickey Petersen has written up a [fantastic article about how Emacs manages windows](https://www.masteringemacs.org/article/demystifying-emacs-window-manager) which you should definitely check out. Here are just some of the settings that I use:

Configuration for dedicated Eshell buffers
----------

If you don’t use [Eshell](https://www.masteringemacs.org/article/complete-guide-mastering-eshell) already, it’s definitely worth a look. You might justly wonder, “why should I use something that’s inferior to `$TERMINAL_EMULATOR_OF_CHOICE`?” Good question. I still make heavy use of my terminal, but I *really* like how I can use completion frameworks like [Vertico](https://github.com/minad/vertico) or [Corfu](https://github.com/minad/corfu) with [Orderless](https://github.com/oantolin/orderless) to search through history. If you’ve put a bunch of effort into configuring Emacs in those ways, it’s really nice to port that across.

I also used Eshell to great effect when I was debugging my implementation of Raft for a class. I had a ton of log messages getting dumped out to the screen, and on my terminal, the lines always wrap. Maybe there’s a setting to enable horizontal scrolling, but I couldn’t find it. With Eshell, that just comes right out of the box.

On top of getting long lines to play nice, I can also use the powerful search and filtering operations that I’m used to using to navigate my code to navigate through my terminal history.

There’s a lot more, but those features have intrigued me enough that I wanted to make it easy to pop open to Eshell whenever I could. Here’s what I use:

```
;; Don't forget to bind these functions to convenient keys
(defun startup-eshell ()
  "Fire up an eshell buffer or open the previous one"
  (interactive)
  (if (get-buffer-window "*eshell*<42>")
      (delete-window (get-buffer-window "*eshell*<42>"))
    (eshell 42)))

(defun tab-to-eshell ()
  "Open a tab with eshell. If that tab doesn't exist, create it. If already in that tab, switch to previous tab."
  (interactive)
  (if (equal (tab-bar-tab-name-current) "*eshell*<43>")
      (tab-bar-switch-to-prev-tab)
    (eshell 43)))

(add-to-list 'display-buffer-alist
             '("\\*eshell\\*<43>"
               (display-buffer-in-tab)
               (tab-name . "*eshell*<43>")))
(add-to-list 'display-buffer-alist
             '("\\*eshell\\*<42>"
               (display-buffer-in-side-window)
               (side . left)
               (window-width . 0.5)
               (window-height . fit-window-to-buffer)))
```

I wanted to be able to open an Eshell buffer on the left side of the window whenever, and I also wanted to be able to make a dedicated tab that I could toggle between easily. With `startup-eshell` and `tab-to-eshell` respectively, I can do just that.

Org-Roam
----------

I like using [Org-roam](https://www.orgroam.com) for note taking. I wanted to make the backlinks buffer always appear in a narrow-ish window on the right. Here’s all the config needed:

```
;; Dedicated side window for backlinks
(add-to-list 'display-buffer-alist
             '("\\*org-roam\\*"
               (display-buffer-in-side-window)
               (side . right)
               (window-width . 0.4)
               (window-height . fit-window-to-buffer)))
```

Things to note
----------

There’s a difference between `display-buffer-in-side-window` and `display-buffer-in-direction`: the first, if I’m not mistaken, makes a *dedicated window*, which you can read about on [Mickey Petersen’s site](https://www.masteringemacs.org/article/demystifying-emacs-window-manager). The short of it is, that buffer will stay in that space and will not move, even if you’re used to your windows automatically re-laying out with e.g. `evil-mode` enabled.

The second is a little gentler, at least in my mind. It asks Emacs to open the buffer in one direction rather than another, and it’s just as if you had done `C-x 2` or `C-x 3` for up/down or left/right respectively.

Yet again, this is another testament to the fantastic power and flexibility of Emacs. This isn’t a *life-changing* configuration *per se*, but it definitely makes Emacs more comfortable to use for me.