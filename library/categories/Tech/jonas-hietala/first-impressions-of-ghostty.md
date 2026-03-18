---
title = "First impressions of Ghostty"
description = "There are two conflicting forces in play in setting up your computer environment:1. It’s worthwhile to pursue small improvements in frequently used tools.2. It’s not productive to get stuck tweaking your setup endlessly.It’s common to find people get stuck at the extreme ends of "
date = "2025-01-18T19:06:46Z"
url = "http://jonashietala.se/blog/2025/01/06/first_impressions_of_ghostty/index.html"
author = "Jonas Hietala"
text = ""
lastupdated = "2025-10-22T08:58:11.123042772Z"
seen = true
---

There are two conflicting forces in play in setting up your computer environment:

1. It’s worthwhile to pursue small improvements in frequently used tools.
2. It’s not productive to get stuck tweaking your setup endlessly.

It’s common to find people get stuck at the extreme ends of the spectrum; some programmers refuse to configure or learn their tools at all, while others get stuck re-configuring their setups constantly without any productivity gains to show for it.

Finding a balance can be tricky. With regards to terminals I’ve been using [alacritty](https://github.com/alacritty/alacritty) for many years. It gets the job done but I don’t know if I’m missing out on anything? I’ve been meaning to look at alternatives like [wezterm](https://github.com/wez/wezterm) and [kitty](https://github.com/kovidgoyal/kitty) but I never got far enough to try them out.

On one hand it’s just a terminal, what difference could it make?  
 On the other hand, I spend countless of hours every day inside a terminal so even a small improvement should pay off in the long run.

Enter [Ghostty](https://github.com/ghostty-org/ghostty), a terminal so hyped up it made me drop any useful things I was working on and see what the fuzz was about. I don’t quite get why people hype up a terminal of all things but here we are.

[Ghostty](https://github.com/ghostty-org/ghostty) didn’t revolutionize my setup or anything but I admit that [Ghostty](https://github.com/ghostty-org/ghostty) is quite nice and it has replaced [alacritty](https://github.com/alacritty/alacritty) as my terminal.

[I just want a blank canvas without any decorations](#I-just-want-a-blank-canvas-without-any-decorations)
----------

One of the big selling points of [Ghostty](https://github.com/ghostty-org/ghostty) is its [native platform integration](https://gpanders.com/blog/ghostty-is-native-so-what/). It’s supposed to integrate well with your window manager so it looks the same and gives you some extra functionality… But I don’t know why I should care—I just want a big square without decorations of any kind.

You’re supposed to to be able to simply turn off any window decorations:

```
window-decoration = false

```

At the moment [there’s a bug](https://github.com/ghostty-org/ghostty/issues/2023) that requires you set some weird GTK settings to fully remove the borders:

```
gtk-titlebar = false
gtk-adwaita = false

```

It’s unfortunate as I haven’t done any GKT configuration on my machine (I use [XMonad](https://xmonad.org/) as my window manager and I don’t have any window decorations anywhere).

There might some useful native features I don’t know about. The password input style is neat for instance, although I’m not sure it does anything functionally different compared to other terminals:

![](/images/ghostty_password.png)

[Cursor invert](#Cursor-invert)
----------

```
cursor-invert-fg-bg = true

```

In [alacritty](https://github.com/alacritty/alacritty) I’ve had the cursor invert the background and foreground and you can do that in [Ghostty](https://github.com/ghostty-org/ghostty) too.

I ran into an issue where it interferes with [indent-blankline.nvim](https://github.com/lukas-reineke/indent-blankline.nvim) making the cursor very hard to spot in indents (taking the color of the indent guides, which is by design low contrast with the background).

Annoying but it gave me the shove I needed to try out different plugins to see if the problem persisted. I ended up with (an even nicer) setup using [snacks.nvim](https://github.com/folke/snacks.nvim/tree/main) that doesn’t hide the cursor:

![](/images/ghostty_indent_differences.png) Left: [indent-blankline.nvim](https://github.com/lukas-reineke/indent-blankline.nvim) (cursor barely visible)  
 Right: [snacks.nvim](https://github.com/folke/snacks.nvim/tree/main) (cursor visible and it highlights scope).

[Minimum contrast](#Minimum-contrast)
----------

Unreadable `ls` output is a staple of the excellent Linux UX. It might look like this:

![](/images/ls_unreadable.png)

Super annoying.

You can of course configure the `ls` output colors but that’s just for one program and it won’t automatically follow when you `ssh` to another server.

[Ghostty](https://github.com/ghostty-org/ghostty)’s `minimum-contrast` option ensures that the text and background always has enough contrast to be visible:

```
minimum-contrast = 1.05

```

![](/images/ls_readable.png)

Most excellent.

This feature has the potential to break “eye candy” features, such the Neovim indent lines plugins if you use a low contrast configuration. I still run into minor issues from time to time.

[Hide cursor while typing](#Hide-cursor-while-typing)
----------

```
mouse-hide-while-typing = true

```

A small quality-of-life feature is the ability to hide the cursor when typing. I didn’t know I needed this in my life.

[Consistent font sizing between desktop and laptop](#Consistent-font-sizing-between-desktop-and-laptop)
----------

With [alacritty](https://github.com/alacritty/alacritty) I have an annoying problem where I need to use a very different font size on my laptop and my desktop (`8` and `12`). This wasn’t always the case and I think something may have changed in [alacritty](https://github.com/alacritty/alacritty) but I’m not sure.

[Ghostty](https://github.com/ghostty-org/ghostty) doesn’t have this problem and I can now use the same font settings across my machines ( `font-size = 16 `).

[Ligature support](#Ligature-support)
----------

The [issue for adding ligatures to alacritty](https://github.com/alacritty/alacritty/issues/50) was closed eight years ago and even though I wanted to try ligatures I couldn’t be bothered to “run a low quality fork”.

[Ghostty](https://github.com/ghostty-org/ghostty) seems like the opposite of “low quality” and it renders [Iosevka](https://github.com/be5invis/Iosevka)’s ligatures very well:

![](/images/iosevka_ligatures.png) My configured ligatures of Iosevka, rendered in Ghostty.

Overall I feel that the font rendering in [Ghostty](https://github.com/ghostty-org/ghostty) is a little better than in [alacritty](https://github.com/alacritty/alacritty), although that might be recency bias. I’m still undecided on ligatures but I love that I don’t have to feel limited by the terminal.

I use a [custom Iosevka build](/iosevka) with these [Ghostty](https://github.com/ghostty-org/ghostty) settings:

```
font-family = IosevkaTreeLig Nerd Font
font-style = Medium
font-style-bold = Bold
font-style-italic = Medium Italic
font-style-bold-italic = Bold Italic
font-size = 16

```

[Colorscheme](#Colorscheme)
----------

While [Ghostty](https://github.com/ghostty-org/ghostty) has an absolutely excellent theme selector with a bunch of included themes (`ghostty +list-themes`) [melange-nvim](https://github.com/savq/melange-nvim) wasn’t included, so I had to configure the colorscheme myself. It was fairly straightforward even though the `palette = 0=` syntax was a bit surprising:

```
# The dark variant of melange
background = #292522
foreground = #ECE1D7
palette = 0=#867462
palette = 1=#D47766
palette = 2=#85B695
palette = 3=#EBC06D
palette = 4=#A3A9CE
palette = 5=#CF9BC2
palette = 6=#89B3B6
palette = 7=#ECE1D7
palette = 8=#34302C
palette = 9=#BD8183
palette = 10=#78997A
palette = 11=#E49B5D
palette = 12=#7F91B2
palette = 13=#B380B0
palette = 14=#7B9695
palette = 15=#C1A78E
# I think it's nice to colorize the selection too
selection-background = #403a36
selection-foreground = #c1a78e

```

[I’m happy with Ghostty](#Im-happy-with-Ghostty)
----------

In the end [Ghostty](https://github.com/ghostty-org/ghostty) has improved my setup and I’m happy I took time to try it out. It took a little more time than “just launch it” but it absolutely wasn’t a big deal. The reward was a few pleasant improvements that have improved my life a little.

And perhaps most important of all: I’m now an alpha Nerd that uses a terminal written in Zig.

Did I create a custom highlighter for the Ghostty configuration file just to have proper syntax highlighting for this one blog post?

[You bet I did](https://github.com/treeman/tree-sitter-ghostty).

(It’s a simple [treesitter grammar](/blog/2024/03/19/lets_create_a_tree-sitter_grammar).)