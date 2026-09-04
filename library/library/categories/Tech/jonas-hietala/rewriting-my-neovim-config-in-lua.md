---
title = "Rewriting my Neovim config in Lua"
description = " This screenshot betrays just how much productive time was wasted setting this up.I’ve got tons of things to do; clean the bathrooms, prototype an idea for a SaaS and ponder world peace. So naturally the procrastination took over and I re"
date = "2025-01-18T19:19:09Z"
url = "http://jonashietala.se/blog/2023/10/01/rewriting_my_neovim_config_in_lua/index.html"
author = "Jonas Hietala"
text = ""
lastupdated = "2025-10-22T08:58:11.337250463Z"
seen = true
---

![](/images/rewrite_neovim_lua/splash.png) This screenshot betrays just how much productive time was wasted setting this up.

I’ve got tons of things to do; clean the bathrooms, prototype an idea for a SaaS and ponder world peace. So naturally the procrastination took over and I rewrote my Neovim configuration in Lua.

![](/images/rewrite_neovim_lua/cool_kids_lua.jpg)

[But why?](#But-why)
----------

No, but seriously, I’ve had my Neovim configuration since before Neovim existed and it’s been working fine. Why would I then rewrite it, and using Lua to boot?

My config has collected a lot of cruft over the years, and it was about time to do a cleanup. So I figured the best way was to do it all from scratch, only adding things from the old config if I really needed them (and if I knew what they were doing there!).

I was also curious on how well it would work to configure Neovim using Lua instead of Vimscript, and if there were some new fancy things I was missing.

[Just a few plugins or many?](#Just-a-few-plugins-or-many)
----------

As is common knowledge, there are these great divides in the developer community. Issues so great that it makes the Israeli-Palestinian conflict feel like kids fighting in the sandbox.

I’m of course talking about the age-old questions of Vim vs Emacs, if you should use an IDE or a Text Editor and **gasp** if you should use tabs or spaces.

And even inside the Vim community we have our own great question: should you amass as many plugins as possible, pimping out your Vim so it can be mistaken for an IDE, or should you keep it minimalistic, staying true to the Raw Vim experience?

So where do I stand in this? On which hill will I die on?

As I’m writing this I’m up to 77 plugins, with a bunch more on my “plugins to check” list, so I guess I’m dying on the “**use all the plugins**” hill.

If that makes you feel like I’ve betrayed Bram the creator, then my only defense is this:

I tried, but I failed.

[Where to start?](#Where-to-start)
----------

The inspiration for this was ThePrimeagen’s video on [0 to LSP: Neovim RC From Scratch](https://www.youtube.com/watch?v=w7i4amO_zaE) that I watched several months ago.

While ThePrimeagen’s video was great as inspiration (look how easy it is!), I don’t think it’s the best configuration to reference. I instead used other sources:

* [LazyVim](https://github.com/LazyVim/LazyVim/tree/main) is a popular Neovim distro that you can use if you don’t want to configure everything from scratch or—the horror—anything at all.

  A distro is absolutely not my thing, but the [LazyVim](https://github.com/LazyVim/LazyVim/tree/main) source was quite useful as a reference for me.

* Distros may be overkill, a better alternative might be the small configurations that are made to help you get going with your own config.

  Take a look at [kickstart.nvim](https://github.com/nvim-lua/kickstart.nvim) and [TinyVim](https://github.com/NvChad/tinyvim) for example.

* There are lots of people who have their configs on GitHub.

  I used [catgoose](https://github.com/catgoose/nvim) as the config was really clean, including lots of plugins to inspire me.

* Speaking of plugins, [neovimcraft](https://neovimcraft.com/) is a good site to find plugins.

* [dotfyle](https://dotfyle.com/) is another great site with plugins, configurations and the fantastic [This Week in Neovim](https://dotfyle.com/this-week-in-neovim) newsletter.

[Structured configuration](#Structured-configuration)
----------

One of the big problems with my previous setup was that `init.vim` was huge and it was hard to organize it. I tried using folds and having a logical grouping, but it never felt good.

With lua and [lazy.nvim](https://github.com/folke/lazy.nvim) you can organize settings and plugins in different files quite nicely. This is how I did it:

I wanted to have a split of `config/` and `plugins/`, so `~/.config/nvim/init.lua` just loads `~/.config/nvim/lua/config/init.lua`:

```
require("config")

```

Then in `~/.config/nvim/lua/config/init.lua` I load the configurations and plugin manager:

```
-- Setup <leader> and <localleader> before loading plugins
require("config.leader")

-- Use lazy.nvim for plugin management
require("config.lazy")

-- Continue with the configuration, possibly overriding settings that some
-- plugins might set.
require("config.options")
require("config.colorscheme")
require("config.keymaps").init()
require("config.commands")

```

With [lazy.nvim](https://github.com/folke/lazy.nvim) you can split up plugin specifications into separate files:

```
-- Basic lazy.nvim setup as copied from the readme
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- Load plugin specs from lua/plugins/*.lua
require("lazy").setup("plugins", {
  defaults = {
    lazy = true, -- Default to lazy loading, optional
  },
  change_detection = {
    notify = false, -- I find the config changed notification super annoying
  },
})

```

This will automatically load any `.lua` file in the `lua/plugins` folder. For example this is `lua/plugins/replacer.lua`:

```
return {
  "gabrielpoca/replacer.nvim",
  opts = { rename_files = false },
  keys = require("config.keymaps").replacer,
}

```

Incredibly nice when you have lots of plugins, and some have large configurations (like [lspconfig](https://github.com/neovim/nvim-lspconfig), [treesitter](https://github.com/nvim-treesitter/nvim-treesitter) or [cmp](https://github.com/hrsh7th/nvim-cmp)).

One last big thing is I wanted to have all global keymaps in one single file. [lazy.nvim](https://github.com/folke/lazy.nvim) supports adding keymaps in the plugin specification using `keys = { }` option. I accomplished this by simply returning a “module” table from `config/keymaps.lua`:

```
M = {}

M.replacer = {
  {
    "<leader>rq",
    function()
      require("replacer").run()
    end,
    silent = true,
    desc = "Make quickfix editable for replacing in",
  },
}

-- And other plugin keymaps like this
M.trouble = {
  ...
}

return M

```

Not all keymaps can be defined using the [lazy.nvim](https://github.com/folke/lazy.nvim) specification, in which case I returned a function and called that where applicable. For instance for LSP:

```
M.buf_lsp = function(_, buffer)
  local map = vim.keymap.set
  map("n", "<localleader>D", vim.lsp.buf.declaration, { silent = true, buffer = buffer, desc = "Declaration" })
  map("n", "<localleader>d", vim.lsp.buf.definition, { silent = true, buffer = buffer, desc = "Definition" })
  -- etc
end

```

And set it up in `plugins/lspconfig.lua` in the `on_attach` callback:

```
local on_attach = function(client, buffer)
  keymaps.buf_lsp(client, buffer) -- Will add the keymaps when LSP attaches to the buffer
  lsp_status.on_attach(client)
end

```

One last thing; for the regular mappings you don’t want to just remap them in `config/keymaps.lua` because multiple files will run `require("config.keymaps")`, so I wrapped it in an init function:

```
M.init = function()
  local map = vim.keymap.set
  map("n", "<leader>p", '"*p', { silent = true, desc = "Paste from mouse" })
  map("n", "<leader>P", '"*P', { silent = true, desc = "Paste before from mouse" })
  -- etc
end

```

Which is why `config/init.lua` looked a bit weird:

```
require("config.options")
require("config.colorscheme")
require("config.keymaps").init() -- Notice the weird init() call here
require("config.commands")

```

It’s true that `keymaps.lua` has grown quite large and isn’t super easy to read. Maybe I’ll break it out into more keymap files (`config/keymaps/lsp.lua` etc) in the future, but right now I think it’s nice to have all the maps in one single file.

[Favorite new-to-me plugins](#Favorite-new-to-me-plugins)
----------

While doing the rewrite I went through my existing plugins to see if they were still relevant, or if I could replace or just remove them. And of course, if I could add some new ones.

I won’t create a list of my favorite plugins, as it would be boring to see yet another list with [LSP](https://github.com/neovim/nvim-lspconfig), [treesitter](https://github.com/nvim-treesitter/nvim-treesitter) and [cmp](https://github.com/hrsh7th/nvim-cmp), I’ll instead highlight some good plugins that were new to me:

### [](#lazynvim-A-modern-plugin-manager)[lazy.nvim](https://github.com/folke/lazy.nvim): A modern plugin manager ###

![](/images/rewrite_neovim_lua/lazy.png) Observe the glory of a modern package manager

I’ve been using [vim-plug](https://github.com/junegunn/vim-plug) as my plugin manager since forever. It’s been working well, but I figured I should try one of these newer managers to see if I was missing something. And boy, did I. [lazy.nvim](https://github.com/folke/lazy.nvim) has some really nice features that I now can’t live without:

* Split plugin specifications in separate files as I wrote about [earlier in the post](#Structured-configuration).
* Specify plugin dependencies.
* Pin plugin versions.
* Track plugin versions in `lazy-lock.json`, so you can identify what plugin version breaks your setup so you can pin it to a known good version.
* Lazy loading. It’s nice to have for those rarely used but heavy plugins.

### [](#melange-nvim-An-amazing-colorscheme)[melange-nvim](https://github.com/savq/melange-nvim): An amazing colorscheme ###

![](/images/rewrite_neovim_lua/melange2.png) It’s just pleasing to my eyes. ![](/images/rewrite_neovim_lua/melange3.png) The design idea is that control flow should use warm colors and data should use cold colors. So here, functions are warm yellow and strings and data are colder purple and green.

I’ve been a gruvbox user since I started using Vim almost 15 years ago. I’ve tried tons of different colorschemes but nothing has ever come close to gruvbox for me. Most of the popular colorschemes are just too blue, or have too little (or too much) contrast or I just don’t like them for some random reason.

I had almost resigned to becoming a gruvbox-lifer, unable to ever change colorscheme.

And then, [melange-nvim](https://github.com/savq/melange-nvim) appeared. And it’s glorious! Now after many long years, I’ve finally switched to a new colorscheme, and I’m content.

(No, switching from the original [gruvbox](https://github.com/morhetz/gruvbox) to [gruvbox.nvim](https://github.com/ellisonleao/gruvbox.nvim) to [gruvbox-material](https://github.com/sainnhe/gruvbox-material) and back again doesn’t count.)

Also a shout-out to [kanagawa](https://github.com/rebelot/kanagawa.nvim) (dragon, the dark variant without blue background) which is the only colorscheme I’ve found that I didn’t eject in horror after 5 minutes, except for gruvbox and melange.

![](/images/rewrite_neovim_lua/kanagawa.png) Sorry [kanagawa](https://github.com/rebelot/kanagawa.nvim). It’s not you, it’s me.

### [](#vim-cool-Turn-off-search-highlight)[vim-cool](https://github.com/romainl/vim-cool): Turn off search highlight ###

Forget `<C-l>`, this plugin will turn off search highlight when you move your cursor away from it. Simple, but raises the quality of life a **lot**.

### [](#conform-Format-on-save)[conform](https://github.com/stevearc/conform.nvim): Format on save ###

I’ve used [neoformat](https://github.com/sbdchd/neoformat) before, but had some issues where I saved then quickly stared modifying something, but then formating kicked in and removed my changes.

With [conform](https://github.com/stevearc/conform.nvim) I haven’t had these issues, and configuration was quick and easy and LSP fallback is super sweet. Excellent plugin.

### [](#nvim-treesitter-textobjects)[nvim-treesitter-textobjects](https://github.com/nvim-treesitter/nvim-treesitter-textobjects) ###

A common misconception about treesitter is that it only adds semantics to syntax highlighting:

![](/images/rewrite_neovim_lua/base_layout.png) BASE and REPEAT are enum members, while the other keycodes are defined as macros.

I think that’s very nice, but treesitter is more than that. And a great example of that is [nvim-treesitter-textobjects](https://github.com/nvim-treesitter/nvim-treesitter-textobjects) where you can operate on treesitter nodes. I have for example:

* `]f` jump to next function.
* `]c` jump to next class.
* `]g` jump to next function or class.
* `<leader>s` swap next parameter.
* `if` textobject for inner function. So `cif` would delete the function body and enter insert mode.
* `ax` textobject for outer comment, to easily delete/change comments.

The beauty is that these work on treesitter nodes, so they work equally well across languages for functions like `fn myfun() { }`, `function myfun() ... end` or a `def myfun() do .. end`. (Given that the treesitter implementation supports these options. Markdown doesn’t have the concept of a function for instance.)

### [](#Neogit-Git-management)[Neogit](https://github.com/NeogitOrg/neogit): Git management ###

[magit](https://magit.vc/) is widely regarded as the best Git client/integration there is. When I used Emacs for work (oh yes, the horrors) I did use [magit](https://magit.vc/) and yes it was great (although too slow on Windows).

I don’t think I need to say more than that [Neogit](https://github.com/NeogitOrg/neogit) is [magit](https://magit.vc/), but for Neovim, and it is also great. (It doesn’t have feature parity with [magit](https://magit.vc/) yet, but it’s good enough to have replaced [fugitive](https://github.com/tpope/vim-fugitive) for me.)

### [](#alpha-nvim-Dashboard)[alpha-nvim](https://github.com/goolord/alpha-nvim): Dashboard ###

![](/images/rewrite_neovim_lua/alpha.png) My startup screen

I’m going to be honest here: I’ve always thought that a dashboard was unnecessary fluff and people who used them were just pimping Neovim for the sake of pimping.

And now, I also use a dashboard.

While it’s something I could absolutely live without, by now I’d rather have it than not.

Okay, saving a keypress by using `f` instead `<leader>f` isn’t a big deal. And yeah, showing [lazy.nvim](https://github.com/folke/lazy.nvim) stats is probably unnecessary.

But having a list of keymaps that I should internalize is actually really nice. It helps remind me of these cool new keymaps I’ve added, so they don’t get forgotten for years until my next config rewrite.

Yes, the list of keymaps is currently just hardcoded in the dashboard config. But I would like to implement keymap tracking and use it for spaced repetition. Maybe even have a floating window on startup that you need to clear every day, similar to “flashcards”. This is a nice idea for a plugin that I may or may not write in the future…

### [](#flashnvim-Navigational-plugin)[flash.nvim](https://github.com/folke/flash.nvim): Navigational plugin ###

Once upon a time there was [vim-sneak](https://github.com/justinmk/vim-sneak) that added the motion `s` to jump to any location by specifying two characters. It was great, and it spawned a slew of other similar plugins that expanded on the idea. (I’m not sure this is completely historically accurate, but it felt like a good narrative.)

The plugin I’ve landed on is [flash.nvim](https://github.com/folke/flash.nvim). What I really like about it is the idea of typing as many characters as possible. Even with sneak I didn’t always arrive where I wanted, so having the option of typing out more things felt good for me.

Extra functionality such as doing a “remote yank” (search, yank something, then cursor goes back to where it was) and enhancing `f`/`F`/`t`/`T`/`/` is just gravy.

### [](#nvim-colorizer-Colorizer-plugin)[nvim-colorizer](https://github.com/NvChad/nvim-colorizer.lua): Colorizer plugin ###

![](/images/rewrite_neovim_lua/colorizer.png) What are these colors again? It’s the palette of [melange-nvim](https://github.com/savq/melange-nvim) of course!

After [vim-hexokinase](https://github.com/RRethy/vim-hexokinase) got archived I had a minor panic. It was a neat little plugin that highlighted colors inline, but without altering the highlight of the colors themselves, which is what all the other colorizer plugins seemed to do.

Luckily I found [nvim-colorizer](https://github.com/NvChad/nvim-colorizer.lua) that does the same, and without having to build an external binary like hexokinase that always managed to break for some weird reason.

I love when things just work.

[Custom behavior](#Custom-behavior)
----------

Becoming a Pokémon master by collecting all the plugins is great, but one of the benefits of Lua over Vimscript is that it’s a much nicer language for general programming. While I haven’t really taken advantage of it that much yet, I’ve made a small addition that worked quite well for me.

I’m trying out [neorg](https://github.com/nvim-neorg/neorg) as my knowledge base and note taking and I’ve separated it into four folders:

```
~/norg/projects
~/norg/areas
~/norg/resources
~/norg/archive

```

I don’t remember where I saw this recommendation, but it made some sense to me at the time.

What I want to do with this is either:

1. Open a file in one of these folders
2. If no file exists, create and open one

I could make shell scripts and use fzf as a fuzzy finder, but as I kind of live in Neovim I wanted to do this from within Neovim.

Using [telescope](https://github.com/nvim-telescope/telescope.nvim) (fuzzy finder) and [plenary](https://github.com/nvim-lua/plenary.nvim) (path helpers) this is what I came up with:

```
-- Find files using telescope in a subfolder of `~/norg`.
-- @param base_folder: string: base folder
M.open_norg = function(base_folder)
  local action_state = require("telescope.actions.state")
  local actions = require("telescope.actions")
  local Path = require("plenary.path")

  local folder = vim.fn.expand("~/norg/") .. base_folder .. "/"

  require("telescope.builtin").find_files({
    attach_mappings = function(prompt_bufnr, map)
      -- Creates a file using the telescope input prompt.
      -- Useful to quickly create a file if nothing exists.
      local create_file = function()
        -- It ain't pretty... But maybe it's good enough...? T.T
        local current_picker = action_state.get_current_picker(prompt_bufnr)
        local input = folder .. current_picker:_get_prompt() .. ".norg"

        local file = Path:new(input)
        if file:exists() then
          return
        end
        file:touch({ parents = true })

        actions.close(prompt_bufnr)
        vim.cmd("e " .. file .. "| w")
      end

      map("i", "<C-e>", create_file)
      return true
    end,
    cwd = folder,
  })
end

```

I’m sure this can be improved upon in many ways, but it serves the purpose at least. `<C-e>` is used to create the file, as sometimes telescope finds similar files so creating a new file if telescope is empty doesn’t really work.

Another related function I wanted is to create a weekly journal file. There is support for a daily journal in [neorg](https://github.com/nvim-neorg/neorg), but I specifically wanted a weekly one. This is how I made it:

```
-- Open a weekly journal in `~/norg/areas/weekly_journal/`.
-- Create using a template from `~/norg/areas/weekly_journal/template.norg` unless it exists.
M.open_weekly_journal = function()
  local Path = require("plenary.path")

  -- Should probably make this more general in the future.
  local pwd = vim.fn.expand("~/norg/areas/weekly_journal/")
  local journal_file = pwd .. os.date("w%W") .. ".norg"

  local file = Path:new(journal_file)
  if not file:exists() then
    local template = Path:new(pwd .. "template.norg")
    template:copy({ destination = file, override = false })
  end

  vim.cmd("e " .. journal_file .. "| w")
end

```

As a bonus here’s how I created a fish alias to start Neovim and call the above functions that are defined in `~/.config/nvim/lua/config/norg.lua`:

```
alias ep "nvim -c \":lua require('config.norg').open_norg('projects')\""
alias ej "nvim -c \":lua require('config.norg').open_weekly_journal()\""

```

The weird mnemonics are the same I use from within Neovim, so `<leader>ep` opens telescope in `~/norg/projects` for example.

[Is lua worth it?](#Is-lua-worth-it)
----------

One reason why I didn’t convert to Lua until now is that to me it looked fairly verbose.

Even though Vimscript isn’t a good programming language, it’s still a DSL specifically for Vim so it’s quite easy to do common things like set options or add autocommands. And Lua is nice, but it doesn’t support adding a custom DSL on quite that level, so I was worried I’d have to bend over too much to accomplish things.

```
-- Having to specify `vim.opt` isn't too bad
vim.opt.relativenumber = true
vim.opt.number = true

-- Autocommand creation is slightly more verbose,
-- but they're also a bit more readable than the Vim equivalent in my opinion.
local autocmd = vim.api.nvim_create_autocmd
local augroup = vim.api.nvim_create_augroup

autocmd("TextYankPost", {
  callback = function()
    vim.highlight.on_yank()
  end,
  desc = "Briefly highlight yanked text",
  group = augroup("yank", { clear = true }),
})
-- Hide statusline on dashboard
autocmd("FileType", {
  pattern = "alpha",
  group = augroup("filegroup", { clear = true }),
  command = "setlocal laststatus=0 noruler",
})

-- It's true that keymaps are also a more verbose, and having to wrap things
-- in strings here and there is slightly annoying.
local map = vim.keymap.set
map("n", "(", "[", { remap = true })
map("n", "]q", ":cnext<cr>", { desc = "Next quickfix" })
map("n", "<leader>ej", require("config.norg").open_weekly_journal, { desc = "This weeks journal" })

```

While the above examples are more verbose than the Vimscript alternatives, it doesn’t feel **that** bad.

And the upside of Lua is that you don’t have to bash your head in when you battle with Vimscript’s idiosyncrasies, which more than makes up for the added verbosity during simple configuration. Easily being able to access the Lua API of important plugins anywhere is also pleasant.

You could of course mix Vimscript and Lua, but for me the consistency of having everything in the same language, using the same file structure and the same development environment makes it worth using Lua all the time.

[Was the rewrite worth it?](#Was-the-rewrite-worth-it)
----------

The million dollar question: was rewriting my entire configuration worth the time I spent doing it?

If you view it from a cold efficiency point-of-view, where every minute needs to pay itself back in the future thanks to increased productivity…

It’s debatable.

Maybe if I don’t touch the configuration file for many years, it’ll pay off. But I admit I spent far too much time on this for it to be considered truly productive time.

To be fair, a lot of this time was spent evaluating +100 plugins to see if I wanted to use them or not, and then fiddling with them to see if I could tweak them to my liking.

If all you want to do is convert your existing Vimscript config to a Lua config, it would be much faster. And if you only need to setup LSP or Treesitter or whatever, just [look](https://github.com/catgoose/nvim) at [an](https://github.com/ThePrimeagen/init.lua) existing [config](https://github.com/LazyVim/LazyVim/tree/main) and you’ll get setup in no time. You can also reference [my config files](https://github.com/treeman/dotfiles/tree/master/.config/nvim), but do so on your own risk. (Seriously, with [lspconfig](https://github.com/neovim/nvim-lspconfig), [mason](https://github.com/williamboman/mason.nvim) and [mason-lspconfig](https://github.com/williamboman/mason-lspconfig.nvim) configuring LSP doesn’t take that much time.)

But let’s be real here. The joy of fiddling with configurations and tweaking small things until they’re **just right** will always be worth it.

I’ve spent far too much time being productive and producing value, it was about time I spent some time alone.

Just me and my config.