+++
title = "s/Neovim/Helix/g"
description = "I have recently replaced Neovim with Helix globally on my computer as well as most of the other systems that I use. This is a write-up of my experience with the new editor so far."
date = "2026-09-06T07:46:48Z"
url = "https://xn--gckvb8fzb.com/s-neovim-helix-g/"
author = "marius@xn--gckvb8fzb.com (Marius)"
text = ""
lastupdated = "2026-09-08T09:44:05.117556712Z"
seen = false
+++

A while ago I decided that I’d like to challenge my muscle-memory (and by that my brain) a little by pushing it out of its comfort zone. Last time I did that was back in 2024 with the switch from my [endgame M60](/keyboard/#rama-m60-a) to the [Corne v3](https://xn--gckvb8fzb.com/corne-v3/) and ultimately to the [Kunai](https://xn--gckvb8fzb.com/kunai-corne-v3/), which required me to re-learn to type, in a way. I remember how dreadfully inconvenient the experience had been in the first days/weeks, but over two years down the line I’m glad I made the move, and I feel like it has definitely improved my typing and my abilities, let alone my wrist posture.

This time, I decided to challenge myself to switch away from the editor that I migrated to [five years ago](/updates-2021-q3/), Neovim, to [Helix](https://helix-editor.com), the *post-modern text editor*. I had wanted to do this for a long time, and it just so happened that [yet](https://github.com/neovim/neovim.github.io/pull/502) [another](https://github.com/neovim/neovim.github.io/pull/503) [troubling](https://github.com/neovim/neovim.github.io/issues/501#issuecomment-5455572223) story unfolded within the Neovim community that had once again put the unprofessionalism of the core team on full display. And after years of the project being infiltrated and virtually taken over by ~~[bullshitters](/the-rise-of-the-bullshittery/)~~ *content creators*, I decided that it was about time to move along and start this challenge.

Options
----------

Despite many people in the [community channel](/contact/#xmpp) seemingly being loyal members of the [*Church of Emacs*](https://en.wikipedia.org/wiki/Editor_war), I didn’t want to go back to an editor that required a GUI, because I enjoy the ability to fire up the exact same editor on any (remote) host (via [Mosh](/automatically-upgrade-ssh-connections-to-mosh-when-available/)) and feel at home right away. After all that was one of the reasons that pushed me to leave the impeccable editor that is *Sublime Text*.

**Note:** I know that there’s a TUI version of Emacs, but from what I read online, as well as in the community channel, it is inferior to GUI Emacs and people only use it when they have no other choice. For remote editing it appears that [TRAMP](https://www.eldelto.net/articles/emacs-tramp-is-awesome) is the way to go in Emacs.

Anyhow, with Emacs being predominantly GUI-based, it didn’t quite check the boxes for me. I wanted something that is primarily a text editor and not an almost complete operating system. In addition, while I was never particularly fond of Neovim’s Lua, I’m even less so of Lisp, which would have added another layer of reluctance to the whole challenge.

After scouring the web for a capable alternative to Vim that would ideally be written in Zig, I ended up with two options, neither of which is Zig-based though: [Kakoune](https://kakoune.org) and [Helix](https://helix-editor.com).

Kakoune seemed like a very good candidate for something that is similar in spirit to Vim but offers a handful of differentiating features that would make it an interesting pick. However, because it is so similar to Vim, it also has similar requirements with regard to its configuration, making the ramp-up curve relatively steep. For example, just like Vim/Neovim requires you to spend a few hours/days/weeks to properly and thoroughly configure language servers, Kakoune, too, ships those as an [external plugin](https://github.com/kakoune-lsp/kakoune-lsp) that runs alongside the `kak` process and is in fact not even written on top of the same C++ stack that Kakoune uses, but in Rust. Kakoune is practically the same assembly of little bits and pieces that Vim/Neovim had always been, which comes with the same benefits, like endless extensibility, but also with the exact same drawbacks with regard to configuration complexity, breaking changes/incompatibilities, and a noticeable hit in terms of efficiency. My [final Neovim config](https://tty.fail/mrus/dotfiles/commit/a16dfdb62d594f10bf3f9d8b1c6ec8267127ea4b) wasn’t as bad as what setups like LazyVim, LunarVim, SpaceVim, et al. usually deliver, but as soon as I was working with large files I could definitely feel the editor and, more precisely, its plugins, putting some load on my system.

Helix it is then!
----------

Hence I found the value proposition of Helix very interesting. One editor, one binary, with complex features like language-specific autocompletion and syntax highlighting built right into the core. Not only does this mean that the efficiency aspect might be noticeably better (*spoiler: it is!*), but also that it doesn’t take me hours/days/weeks to set up what I would call absolute basics in 2026. The only true downside of Helix seemed to be that it’s a Rust project, meaning that compiling takes almost the same time as building the Linux kernel, and that it might be yet another project that’s one wrong pronoun shy of falling apart.

Nevertheless, I caved in to the curiosity and decided to try Helix.

The good (a.k.a. what works but just needs getting used to)
----------

Both of the things that I had to unlearn first come from the same design decision, namely that Helix puts the selection before the action, so that every motion produces a selection and every command works on whatever is selected at that moment. In Vim I press `d` and the editor waits for a motion that tells it how much to delete, while in Helix `d` deletes what is already selected, and because a resting cursor is a selection of exactly one character, `d` cuts a single character. There is no `dd`, because `d` is not an operator that takes a motion. Instead, removing a line is `x` to select it and `d` to delete it.

The same principle explains why the cursor moves to the next line when I press `l` at the end of the current one. Helix treats a buffer as one sequence of characters instead of a list of lines, and moving right asks for the next grapheme boundary in that sequence, which after the last character of a line is the line break itself, and after that the first character of the line below. Vim stops at the last character unless `whichwrap` is configured otherwise, but Helix has no equivalent option to switch the behavior off.

What also follows from the selection-first model is that multiple cursors are built-in. `%` selects the entire file, `s` prompts for a regular expression and turns every match inside the current selection into its own cursor, `C` copies the selection to the next line, `A-s` splits a selection on line breaks and `,` reverts back to a single cursor. In Neovim I would have renamed something using `:%s/old/new/g`, but in Helix it is `%`, `s`, the pattern, and then `c` and the new text, with every occurrence visible and editable while I type. Frankly I didn’t mind the way Neovim did it, but Helix’ approach is definitely more *visual*.

Speaking of which, Helix ships by default with another visual feature that makes discoverability a lot better. In Neovim I had to manually configure the `which-key` plugin for that, but in Helix pressing a prefix key automatically shows an infobox listing every continuation together with a description of what it does. Also, `:` completes typable commands and shows their documentation and their flags while I type, and `:tutor` opens an interactive introduction that ships inside the binary.

The list of things that work without configuration in Helix is frankly longer than I expected. The `languages.toml` that ships with 25.07 defines 342 languages, pulls in 303 tree-sitter grammars and preconfigures language servers for 189 of those languages. Helix also supports `.editorconfig` files. Syntax highlighting, autocompletion, diagnostics, fuzzy pickers, a git diff gutter and a debug adapter client are all there without a single line of configuration, where my Neovim setup needed three dozen plugs (that would break at least once a quarter) to support roughly the same feature set.

And it’s not like Helix’ configuration is some interpreted Lua glued on top of Vimscript. It is a set of easy to read and understand TOML files, and consists of a `config.toml`, a `languages.toml` and, optionally, a `<theme-name>.toml`.

The Neovim setup I linked above was 35 plugins and 1,787 lines of Lua across 21 files, plus another 678 lines for my Netrunner theme, which, reading it, makes it even more absurd. What replaced it is a 65-line [`config.toml`](https://tty.fail/mrus/dotfiles/src/branch/master/.config/helix), a `languages.toml` that includes everything upstream has plus a few overrides, and a 264-line `netrunner.toml`, which is my own theme. And let’s not forget that each of those 35 Neovim plug repositories is maintained by someone else and can change at any time, and each of them could hit me with malware at any moment.

The `config.toml` contains the general editor configuration, as well as the custom keybindings. Those can be nested, they can call typable commands, and when they start with `@` they replay a key sequence, which means that the simple but stubborn muscle-memory can be satisfied, at least in some cases:

```toml
V = ["extend_line_below", "select_mode"]
G = "@ge"

```

**Note:** Commands and key sequences sadly cannot be mixed, which means that a binding like `V = ["extend_line_below", "@ge", "select_mode"]` is not possible.

Whatever feature the core does not implement is left to the shell, for which `|` can be used to pipe the selection through a command and replace it with the output. Similarly, `!` can be used to insert the output of a command before the selection, and `$` can be used to only keep the selections for which a command exits with a zero status.

`sort` can sort a block of lines, `column` can align a table, and `fmt` can reflow a paragraph. And as with most command line tools, you can use `C-z` to suspend the editor and type `fg` to bring it back.

**Speaking of muscle-memory:** There is a fork called [Evil Helix](https://github.com/usagi-flow/evil-helix) that restores the Vim keymap for people who want the new core without having to re-learn the motions and commands. While I understand the appeal, installing it would have defeated the point of the exercise for me. However, if you’re on the lookout for an alternative editor to escape [the rollercoaster](https://news.slashdot.org/story/26/06/13/0524209/vim-classic-83-launched-as-an-ai-free-vim-fork) that the Vim ecosystems have become, this might be the thing for you.

### Efficiency ###

To put the efficiency claim that I mentioned earlier into actual numbers, I built Markdown files by concatenating the last 180 posts of this site and cutting the result down to 100 KB, 1 MB, 5 MB and 25 MB, the largest of which is 543,015 lines. I ran Neovim with my old configuration, with all 35 plugins and the 70 tree-sitter parsers compiled. Both editors ran on the same 8-vCPU/16GB RAM KVM virtual machine that I used to simulate a resource-strapped environment on my [Intel Core Ultra X7 368H](/computer/#b4r45u). Both used a terminal window of 50 by 200 characters, and every number is the median of three runs after a warm-up. *First screen* describes the point at which the initial paint completed, and *redraws done* is when the editor stopped writing to the terminal.

| File |Editor|First screen|Redraws done|Peak RSS|CPU |
|------|------|------------|------------|--------|----|
|100 KB|Helix |   0.47s    |   0.85s    | 38 MB  |0.5s|
|100 KB|Neovim|   0.13s    |   0.73s    | 65 MB  |0.8s|
| 1 MB |Helix |   0.62s    |   1.00s    | 76 MB  |0.6s|
| 1 MB |Neovim|   0.12s    |   1.31s    | 117 MB |1.4s|
| 5 MB |Helix |   0.63s    |   1.01s    | 85 MB  |0.6s|
| 5 MB |Neovim|   0.14s    |   0.85s    | 300 MB |2.9s|
|25 MB |Helix |   0.68s    |   1.06s    | 111 MB |0.7s|
|25 MB |Neovim|   0.12s    |   2.13s    | 329 MB |4.1s|

As you can see, Neovim paints its first full screen roughly five times faster, in 0.12s against 0.62s on the 1 MB file, because Helix appears to read and parse the whole file before it draws anything. Neovim, instead, draws immediately and keeps working in the background. So much for my assumption that the Rust binary would win the efficiency duel, huh?

Well, not so fast, cowboy! As you can see in the next columns everything after that initial load/first paint goes the opposite way. Opening the 5 MB file costs Neovim 300 MB of resident memory and 2.9 seconds of CPU, against 85 MB and 0.6 seconds for Helix, and at 25 MB it is 329 MB and 4.1 seconds against 111 MB and 0.7 seconds. Helix stays close to flat across a 250-fold range in file size, while Neovim’s cost grows with every step.

As for the syntax parser, both editors have a deadline and drop highlighting when it is missed, which I measured by counting the distinct foreground colors on a rendered screen whose content is identical in every file. Helix highlights reliably up to about 1.02 MB, intermittently up to 1.12 MB and not at all above 1.13 MB, while Neovim is solid at 2 to 3 MB but stops at 4 MB. That is also why Neovim finishes redrawing the 5 MB file faster than the 1 MB one, since past its own deadline there is a lot less left to do.

On the 100 KB file, where both editors highlight the entire screen, Helix needs 38 MB against 65 MB and 0.5 seconds of CPU against 0.8. Jumping to the last line redraws consistently in about 43 ms in Helix, and between 21 and 111 ms in Neovim, so neither of them is really sluggish at that, but Neovim can, at times, take almost three times the time to redraw. My `spelllang` of six languages in Neovim, which I had assumed to be one of the expensive parts, doesn’t really cost anything, as Neovim with and without spell checking is within the presented numbers.

#### Single line of death ####

Many lines are one problem, however a single line of extreme width is a very different one, and it is one of the things that would normally bring Vim down to its knees. I joined the same 180 posts into one line of 5,201,084 characters, 5 MB in total, and ran the same session in both editors: search for `keyboard`, step through the matches, replace all of them with `trackball`, jump to the last character with `A` and to the first one with `I`, and then insert single characters at the very beginning. Every number is the time from the keystroke until the editor stopped drawing and stopped using CPU.

|              Operation               |Helix |    Neovim    |
|--------------------------------------|------|--------------|
|            Open the file             |0.65s |    5.76s     |
|        Search for the pattern        |0.08s |    0.24s     |
|        Jump to the next match        |0.01s |    0.09s     |
|       Replace all 471 matches        |5.68s |    1.70s     |
|  `A`, insert at the last character   |5.11s |    7.91s     |
|  `I`, insert at the first character  |0.59s |    1.01s     |
|Insert one character at the beginning |0.26s |never finished|
|Peak RSS while searching and replacing|112 MB|    354 MB    |
|Peak RSS while inserting at the start |114 MB|    9.1 GB    |

Helix opens that file almost nine times faster and finds the pattern quicker. Neovim, however, beats Helix in the replacement task by a wide margin, because `:%s/../../g` is a single operation while Helix builds 471 cursors and then edits every one of them.

Inserting a single character at the beginning of that line costs Helix about a quarter of a second. Neovim pegs one core at 100 percent and allocates roughly 25 MB of memory per second while drawing absolutely nothing, and it kept doing that for the two minutes after which I cut the measurement off. By that time the session was at 9.1 GB of resident memory, but the character still hadn’t made it into the buffer.

To be fair to Neovim, this one is not its direct fault, though. The exact same file and the exact same keystroke in `nvim --clean` inserts the character in well under a second and drops back to zero CPU at 150 MB, so what melts down here is my configuration, which is most likely the combination of spell checking and tree-sitter on a line that is five million characters wide.

The bad (a.k.a. missing quality of life)
----------

If you think that what I wrote about Helix so far reads too good to be true, and that there’s definitely a catch *somewhere*, then your intuition still works.

For example, one thing I run into every day is the front matter of the posts on this site. In Neovim, [a small plugin](https://github.com/mrusme/vim-hugo-helper) rewrote the `lastmod` field of the Markdown file on every write, and `:HugoHelperDateIsNow` set the `date` of a post I had just created. Helix, on the other hand, does not have a built-in feature like that, nor does it offer a user-facing API to custom build this.

The only thing that runs on write is the `formatter` that is configured for the language, which takes the buffer on standard input and writes it back on standard output. A front matter updater therefore has to be a filter over the entire document, and it has to coexist with whatever formatter is already configured for Markdown. Inserting a timestamp by hand is `!date -Iseconds`, which is fine for the `date` of a new post, but definitely more cumbersome for a `lastmod` that is supposed to be maintained without me thinking about it.

Another example concerns the keybindings. A binding made of two subsequent combinations works, so a `[keys.normal."C-q"]` section that contains `"C-q" = ":quit-all!"` gives me a `C-q C-q` chord. Pressing the first half pops up the infobox that shows the second half. What doesn’t work, however, is having the same key bound on its own and as the prefix of a longer sequence, which is what I had in Neovim:

```lua
vim.keymap.set("n", "<C-q>", ":qa<CR>", { silent = true, desc = "Quit" })
vim.keymap.set(
  "n",
  "<C-q><C-q>",
  ":qa!<CR>",
  { silent = true, desc = "Force quit" }
)

```

The keymap’s nodes can be either commands or submaps, but Helix doesn’t support a timeout that would disambiguate the two the way Vim’s `timeoutlen` does. Hence a key is either a binding or a prefix, and `<C-q>` for quitting next to `<C-q><C-q>` for quitting without saving is sadly not something one can express in Helix.

A handful of smaller things from Vim have no equivalent either. There are no marks, and [the “Marks” issue](https://github.com/helix-editor/helix/issues/703) has been open since September 2021. Getting back to a position therefore requires a search or the jumplist.

There is also no persistent undo, which means that closing a buffer discards its history. Two attempts at adding this feature were closed without being merged. There is also no session restore, and `.` repeats only the last insert, not the last change the way it does in Vim, so a delete or a replace can’t be repeated with it. What’s left is `A-.` to repeat the last motion and `g.` to jump to the last modification.

Spell checking is another thing that’s missing entirely. Vim and Neovim ship `:set spell` with dictionaries, but Helix has nothing of the sort, so the only way to get my typos underlined is via a language server such as [codebook](https://github.com/blopker/codebook) or `harper-ls`, configured per language in `languages.toml`.

Then there’s the Git support, which is basically just the diff gutter. Helix marks added, modified and deleted lines against `HEAD` by default and `[g` and `]g` jump between the changes, however there is no blame and no staging of individual hunks. `C-z` and `fg` or a second pane can cover for that, but for people who would like to avoid the context switch for adding files or committing, an integration of the most basic Git functions would make sense.

Speaking of files, the file picker gained a directory-browsing mode in 25.07 ([#11285](https://github.com/helix-editor/helix/pull/11285)), but a persistent tree sidebar of the neo-tree kind still doesn’t exist in Helix. I know that you’re not supposed to navigate via the sidebar and that fuzzy-finding and buffers are theoretically superior, but I also know how a big project structure can sometimes become increasingly difficult to efficiently fuzzy-find through.

Lastly, the plugin system. There is no plugin system. Steel, the Scheme dialect that might become one, has been a draft pull request ([#8675](https://github.com/helix-editor/helix/pull/8675)) since October 2023, and it has 491 commits and 334 comments without being merged. It appears that in various forks it is already in use, which makes it even weirder. But that is essentially why there are no user-defined commands, no scripting and no ecosystem. However, it is also why nothing in my configuration has broken since the day I wrote it. Both things are consequences of the lack of plugins, and I am not sure yet which of the two I value more.

The ugly (a.k.a. missing essentials)
----------

Now to some more essential things that I would argue are crucial for many engineers and developers, but that are nowhere to be found in Helix.

Amongst the most important features is continuous hard wrap. Helix does soft-wrap, at `text-width` when `soft-wrap.wrap-at-text-width` is set, and it does hard-wrap on demand with `:reflow`, which rewraps the selected lines to the width given as an argument or to the configured `text-width`. What it doesn’t do is wrap while I type, the way `textwidth=80` together with `formatoptions+=t` does in Vim, and [the issue](https://github.com/helix-editor/helix/issues/2274) has been open since April 2022. Selecting a paragraph and calling `:reflow` from a keybinding works but it is obviously very cumbersome. What I have settled on for now is an on-save formatter such as `deno fmt` or `prettier --prose-wrap always`, which however means that the formatter rewraps the whole file including the paragraphs that I never touched, which turns a three-line edit into a diff over an entire file.

Another essential that’s missing is the file watcher. Helix doesn’t watch the files it has open. When a buffer changes on disk, after a `git checkout`, a rebase, a formatter that ran in a different window or a sync over Syncthing, the editor keeps showing the old content until I run `:reload` or `:reload-all`. It does at least reject the write with `file modified by an external process, use :w! to overwrite`, so nothing gets overwritten by accident, however all of the reloading is manual, while Neovim covers this with `autoread` and `checktime`. [The pull request that implements file watching](https://github.com/helix-editor/helix/pull/14544) was opened in October 2025 and is still open.

Then, there is the overtype mode, which also doesn’t exist at all. In Vim, `R` replaces characters as I type until I press escape, which is how a fixed-width table, a box drawing or a column-aligned configuration file gets edited without pushing everything to the right. Helix uses `r` to replace every character of the selection with a single one and `R` to paste over the selection from a register. However, neither of them is sticky. [The request](https://github.com/helix-editor/helix/issues/5843) has been open since February 2023 and [a pull request implementing it](https://github.com/helix-editor/helix/pull/14120) since July 2025, and until that is merged, the workaround is selecting exactly as many characters as I am about to type and then replacing them.

Speaking of selections, a line-wise selection mode is missing as well. Vim’s `V` selects whole lines and `j` and `k` then extend the selection in both directions, while Helix has `x` to extend the selection one line downward, `X` to snap whatever is selected to whole lines and `A-x` to shrink it back to them, none of which extends upward. Binding `V = ["extend_line_below", "select_mode"]` covers most of it, however extending upward still means entering select mode, moving with `k` and pressing `X` to put the selection back on line boundaries.

Lastly, code folding doesn’t exist, and it is the one complaint I came across most often while reading through the issue tracker, although to be fair I personally don’t use this feature as extensively, so it’s not as much of a big deal for me. [The issue](https://github.com/helix-editor/helix/issues/1840) has been open since March 2022 and has 48 comments, and [a pull request](https://github.com/helix-editor/helix/pull/14593) has been open since October 2025. Vim has been folding since version 6.0 in 2001 and Neovim added tree-sitter-based folds on top of that, while Helix offers neither automatic nor manual folds, which for navigating a long file leaves the jumplist, the symbol picker and scrolling.

Verdict
----------

With all that said, I’m going to stick to Helix for the time being, despite its [bad](#bad) and [ugly](#ugly) parts. It is an overall solid piece of software, it has a relatively big community around it, and it is available on every platform that I care about. On top of that, it uses a fraction of the [memory and CPU](#efficiency) of the Neovim setup that I had in place before. It is also far easier to build on my [Gentoo machine](/lenovo-x1-carbon-gen-14-aura/) than Neovim.

However, I do hope that Helix will continue to evolve into something that is able to offer slightly more flexibility than it does today, without compromising too much on its approach of delivering an editor with batteries included. I, too, hope that we’re not going to witness similarly poor stewardship as has been the case with Neovim, and that the Helix project can continue living somewhat in the shadows, overlooked by most *content creators*.