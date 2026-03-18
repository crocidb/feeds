---
title = "Packing Neovim with Fennel"
description = " I’ve got lots of stuff to do but I ended up rewriting my Neovim config instead.… anyone can do any amount of work, provided it isn’t the work he is supposed to be doing at that moment.Robert Benchley, in Chips off the Old Benchley, 1949"
date = "2025-10-29T14:50:28Z"
url = "http://jonashietala.se/blog/2025/10/29/packing_neovim_with_fennel/index.html"
author = "Jonas Hietala"
text = ""
lastupdated = "2025-10-31T14:47:15.416255398Z"
seen = true
---

![](/images/new_config_meme.jpg) I’ve got lots of stuff to do but I ended up rewriting my Neovim config instead.
>
>
> … anyone can do any amount of work, provided it isn’t the work he is supposed to be doing at that moment.
>
>
>
> Robert Benchley, in Chips off the Old Benchley, 1949
>
>

My partner Veronica is amazing as she’ll listen to my bullshit and random whims (or at least, pretend to). That’s a big benefit to having a blog: so I have an outlet for rambling about my weird projects and random fixations and spare Veronica’s sanity a little.

I know that Veronica won’t be impressed by another Neovim config rewrite (even when done in Lisp!) so I’ll simply write a big blog post about it.

This post will contain wild Lisp code and random Neovim references. Please consult the [Fennel safety manual](https://fennel-lang.org/reference) and your nearest [Neovim :help station](https://neovim.io/doc/user/helphelp.html) for assistance.

[The rewrite](#The-rewrite)
----------

I wanted to rewrite my Neovim configuration in [Fennel](https://fennel-lang.org/) (a Lisp that compiles to Lua) and while doing so I wanted to migrate from [lazy.nvim](https://github.com/folkqe/lazy.nvim) to Neovim’s new built-in package manager [vim.pack](https://neovim.io/doc/user/pack.html#vim.pack).

This included bootstrapping [Fennel](https://fennel-lang.org/) compilation for Neovim; replicating missing features from [lazy.nvim](https://github.com/folkqe/lazy.nvim) such as running build scripts and lazy loading; modernizing my LSP and treesitter config; and trying out some new interesting plugins.

Please see [my new Neovim config here](https://github.com/treeman/nvim-conf).

### [Why Fennel?](#Why-Fennel) ###

Lua has been a fantastic boon to Neovim and it’s a significant improvement over Vimscript, yet I can’t help but raise an eyebrow when I hear people describe Lua as a *great* language. It’s definitely great at being a simple and fast embeddable language but the language itself leaves me wanting more.

[Fennel](https://fennel-lang.org/) doesn’t solve all issues as some of Lua’s quirks bleeds through but it should make it a little bit nicer. I particularly like the destructuring; more functional programming constructs; macros for convenient DSL; and the amazing pipe operator.

But the biggest reason is that I’m simply a bit bored and trying out new programming languages is fun.

### [Why ](#Why-vimpack)[vim.pack](https://neovim.io/doc/user/pack.html#vim.pack)? ###

>
>
> I don’t rewrite my config often. But when I do, I do it properly.
>
>
>
> Ancient Neovim wisdom
>
>

Folke, maker of many popular plugins such as [lazy.nvim](https://github.com/folkqe/lazy.nvim) and [snacks.nvim](https://github.com/folke/snacks.nvim), recently had a \~5 month break from working on his plugins. Of course, they continued to work and anyone working on open source projects can (and should) take a break whenever they want.

But it exemplifies that core Neovim features will likely be better maintained than standalone plugins and should probably be preferred (if they provide the features you need).

While [Neovim’s built-in plugin manager](https://neovim.io/doc/user/pack.html#vim.pack) is a work in progress and still a bit too simplistic for my needs I wanted to try it out.

[Structuring the config](#Structuring-the-config)
----------

If you’ve got a small configuration having it all inside a single `init.lua` is probably fine. Somehow I’ve gathered almost 6k lines of Lua code under `~/.config/nvim` so showing it all in one file isn’t that appealing.

I first wanted to separate the configuration into a `core`/`plugin` split, where non-plugin configuration happens in `core` and plugin configuration lives under `plugin`. However, to support lazy loading with a single call to [vim.pack.add](https://neovim.io/doc/user/pack.html#vim.pack.add()) I decided to go back to letting the files under `plugin/` return plugin specs, like [lazy.nvim](https://github.com/folkqe/lazy.nvim) does for you.

With Fennel support under `fnl/` this is how my configuration is structured:

```
init.lua                ; Minimal bootstrap to load Fennel files
fnl                     ; All Fennel source in the `fnl/` folder
├── config
│   ├── init.fnl        ; Loaded by `init.lua` and loads the rest
│   ├── colorscheme.fnl
│   ├── keymaps.fnl
│   ├── lsp.fnl         ; Config may reference plugins
│   └── ...
├── macros.fnl          ; Custom Fennel macros goes here
└── plugins
    ├── init.fnl        ; Loads everything under `plugins/`
    ├── appearance.fnl
    ├── coding.fnl
    └── ...
lua                     ; Lua stuff is still loaded transparently
ftplugin
└── djot.lua            ; nvim-thyme doesn't load `ftplugin/`

```

It’s not a perfect system as I’d ideally want the `plugins/` to only add packages while I would configure the plugins in `config/`. But some plugins use lazy loading making it more convenient to do it together with the plugin spec.

[Bootstrapping Fennel](#Bootstrapping-Fennel)
----------

There are a handful of different plugins that allows you to easily write your Neovim config in Fennel. I ended up choosing [nvim-thyme](https://github.com/aileot/nvim-thyme) because it’s fast (it hooks into `require` and only compiles on-demand) and it allows you to mix Fennel and Lua source files.

[nvim-thyme](https://github.com/aileot/nvim-thyme) compiles Fennel sources to Lua files and adds them to Neovim’s runtimepath. This is how it allows you to seamlessly mix Fennel and Lua, where some parts may be written in Fennel and others in Lua. On my machine they’re located at `~/.cache/nvim/thyme/compile/lua/`.

[nvim-thyme](https://github.com/aileot/nvim-thyme) contains installation instructions for [lazy.nvim](https://github.com/folkqe/lazy.nvim) and it references a bootstrapping function to run `git` to manually clone packages. But we’re going to use [vim.pack](https://neovim.io/doc/user/pack.html#vim.pack) and it makes the bootstrap a bit cleaner:

```
vim.pack.add({
  -- Fennel environment and compiler.
  "https://github.com/aileot/nvim-thyme",
  "https://git.sr.ht/~technomancy/fennel",
  -- Gives us some pleasant fennel macros.
  "https://github.com/aileot/nvim-laurel",
  -- Enables lazy loading of plugins.
  "https://github.com/BirdeeHub/lze",
}, { confirm = false })

```

(I added [lze](https://github.com/BirdeeHub/lze) to my bootstrapping too as I’ll use it later [when adding lazy loading support](#Lazy-loading-with-lze), it was simpler having it in the bootstrap.)

[nvim-thyme](https://github.com/aileot/nvim-thyme) also instructs us to override `require()` calls (so it can compile on demand) and to setup the cache path (where it’ll store the compiled Lua files):

```
-- Override package loading so thyme can hook into `require` calls
-- and generate lua code if the required package is a fennel file.
table.insert(package.loaders, function(...)
  return require("thyme").loader(...)
end)

-- Setup the compile cache path for thyme.
local thyme_cache_prefix = vim.fn.stdpath("cache") .. "/thyme/compiled"
vim.opt.rtp:prepend(thyme_cache_prefix)

```

And now we’re ready to write the rest of the config with Fennel!

```
-- Load the rest of the config with transparent fennel support.
require("config")

```

Now we can continue with Fennel `fnl/config.fnl` or `fnl/config/init.fnl`:

```
;; Load all plugins
(require :plugins)

;; Load the other config files
(require :config.colorscheme)
(require :config.keymaps)
(require :config.lsp)
;; etc...

```

Keep in mind that we don’t have to stay with Fennel all the time.  
`(require :config.lsp) ` can load either `fnl/config/lsp.fnl` or `lua/config/lsp.lua`.

There’s one last thing we should do to make the bootstrap complete: we should call `:ThymeCacheClear` when `nvim-laurel` or `nvim-thyme` changes. The recommended way is to use the [PackChanged](https://neovim.io/doc/user/pack.html#PackChanged) event, with something like this:

```
vim.api.nvim_create_autocmd("PackChanged", {
  callback = function(event)
    local name = event.data.spec.name

    if name == "nvim-thyme" or name == "nvim-laurel" then
      require("thyme").setup()
      vim.cmd("ThymeCacheClear")
    end
  end,
  group = vim.api.nvim_create_augroup("init.lua", { clear = true }),
})

vim.pack.add(...)

```

But if we for example force an update for `nvim-laurel` (by deleting it with `vim.pack.del({"nvim-laurel"})` and restart Neovim) we get this error:

```
Error in /home/tree/code/nvim-conf/init.lua..PackChanged Autocommands for "*":
Lua callback: /home/tree/code/nvim-conf/init.lua:12: module 'thyme' not found:
        no field package.preload['thyme']
        cache_loader: module 'thyme' not found
        cache_loader_lib: module 'thyme' not found
        no file './thyme.lua'
        ...

```

There is no order guarantee for the packages and so `PackChanged` for `nvim-laurel` may run before `thyme` has been loaded. I worked around this with a variable that I check after `vim.pack.add`, which will guarantee that all packages have been added before we try to require a package:

```
local rebuild_thyme = false

vim.api.nvim_create_autocmd("PackChanged", {
  callback = function(event)
    local name = event.data.spec.name

    if name == "nvim-thyme" or name == "nvim-laurel" then
      rebuild_thyme = true
    end
  end,
  group = vim.api.nvim_create_augroup("init.lua", { clear = true }),
})

vim.pack.add(...)

table.insert(package.loaders, function(...)
  return require("thyme").loader(...)
end)

local thyme_cache_prefix = vim.fn.stdpath("cache") .. "/thyme/compiled"
vim.opt.rtp:prepend(thyme_cache_prefix)

require("thyme").setup()

-- Rebuild thyme cache after `vim.pack.add` to avoid dependency issues
-- and to make sure all packages are loaded.
if rebuild_thyme then
  vim.cmd("ThymeCacheClear")
end

```

[nvim-thyme](https://github.com/aileot/nvim-thyme) recommends `require("thyme").setup()` to be done in `VimEnter` for speed reasons but I haven’t noticed any slowdown so I’ll just keep it in `init.lua` for simplicity.

[Building a convenient plugin management system](#Building-a-convenient-plugin-management-system)
----------

I wanted to migrate to [vim.pack](https://neovim.io/doc/user/pack.html#vim.pack) but it’s missing a few key features from [lazy.nvim](https://github.com/folkqe/lazy.nvim):

* It can’t automatically require all files under a directory.
* There’s no lazy loading support.
* It can’t run build scripts (such as `make` after install or update).

I could’ve given up and gone back to [lazy.nvim](https://github.com/folkqe/lazy.nvim) but that just wouldn’t do.

### [Source pack specs from files](#Source-pack-specs-from-files) ###

I want to be able to create a file under `plugins/`, have it return a [vim.pack.Spec](https://neovim.io/doc/user/pack.html#vim.pack.Spec), and have it automatically added. This is similar to the [structured plugins](https://lazy.folke.io/usage/structuring) approach of [lazy.nvim](https://github.com/folkqe/lazy.nvim).

To build this I first list all files under `plugins/` like so:

```
;; List all files, with absolute paths.
(local paths (-> (vim.fn.stdpath "config")
                 (.. "/fnl/plugins/*")
                 (vim.fn.glob)
                 (vim.split "\n")))

```

This uses Fennel’s `->` [threading macro](https://fennel-lang.org/reference#------and---threading-macros), Fennel’s version of the pipe operator. It’s one of my favorite features of Elixir and was stoked to discover that Fennel has it too. (Fennel actually has even more power with the `->>`, `-?>`, and `-?>>` operators!)

Now we need to loop through and transform the paths to relative paths and evaluate the files to get our specs. (I’m using [accumulate](https://fennel-lang.org/reference#accumulate-iterator-accumulation) to explicitly build a list instead of [collect](https://fennel-lang.org/reference#icollect-collect-table-comprehension-macros) as we’ll soon expand on it):

```
;; Make the paths relative to plugins and remove extension, e.g. "plugins/snacks"
;; and require those packages to get our pack specs.
(local specs (accumulate [acc [] _ abs_path (ipairs paths)]
               (do
                 (local path (string.match abs_path "(plugins/[^./]+)%.fnl$"))
                 (if (and path (not= path "plugins/init"))
                     (do
                       (local mod_res (require path))
                       (table.insert acc mod_res))
                       acc)
                     acc))))

```

Now we can populate `specs` from files under `plugins/`, for example like this that returns a single spec:

```
{:src "https://github.com/romainl/vim-cool"}

```

Fennel’s table syntax felt a bit weird for me at first. `:src ` is the same as `"src" ` and the above code translates to this Lua:

```
return { src = "https://github.com/romainl/vim-cool" }

```

But I also want to be able to return multiple specs:

```
[{:src "https://github.com/nvim-lua/popup.nvim"}
 {:src "https://github.com/nvim-lua/plenary.nvim"}]

```

To support this we can match on the return value to see if it’s a list, and then loop and insert each spec in the list, otherwise we do as before:

```
(local specs (accumulate [acc [] _ abs_path (ipairs paths)]
               (do
                 (local path (string.match abs_path "(plugins/[^./]+)%.fnl$"))
                 (if (and path (not= path "plugins/init"))
                     (do
                       (local mod_res (require path))
                       (case mod_res
                         ;; Flatten return if we return a list of specs.
                         [specs]
                         (each [_ spec (ipairs mod_res)]
                           (table.insert acc spec))
                         ;; Can return a string or a single spec.
                         _
                         (table.insert acc mod_res))
                       acc)
                     acc))))

```

Now all that’s left is to call [vim.pack.add](https://neovim.io/doc/user/pack.html#vim.pack.add()) with our list of specs and our plugins are now automatically added from files under `plugins/`:

```
(vim.pack.add specs {:confirm false})

```

### [Lazy loading with ](#Lazy-loading-with-lze)[lze](https://github.com/BirdeeHub/lze) ###

[lze](https://github.com/BirdeeHub/lze) is a nice and simple plugin to add lazy-loading to [vim.pack](https://neovim.io/doc/user/pack.html#vim.pack).

We’ve already added it as a dependency in our `init.lua` so all we need to do is modify the `load` parameter to `vim.pack.add` like so:

```
;; Override loader when adding to let lze handle lazy loading
;; when specified via the `data` attribute.
(vim.pack.add specs {:load (fn [p]
                             (local spec (or p.spec.data {}))
                             (set spec.name p.spec.name)
                             (local lze (require :lze))
                             (lze.load spec))
                     :confirm false})

```

Now we can specify lazy loading via the `data` parameter in our specs:

```
{:src "https://github.com/romainl/vim-cool"
 :data {:event ["BufReadPost" "BufNewFile"]}}

```

It relies on wrapping configuration under `data` but that’s annoying, so let’s simplify things a little.

### [Simplified specifications](#Simplified-specifications) ###

The idea here is to transform the specs before we call [vim.pack.add](https://neovim.io/doc/user/pack.html#vim.pack.add()).

We can do it easily when we collect our specs by calling the `transform_spec` function:

```
(local specs (accumulate [acc [] _ abs_path (ipairs paths)]
               (do
                 (local path (string.match abs_path "(plugins/[^./]+)%.fnl$"))
                 (if (and path (not= path "plugins/init"))
                     (do
                       (local mod_res (require path))
                       (case mod_res
                         [specs]
                         (each [_ spec (ipairs mod_res)]
                           (table.insert acc (transform_spec spec)))
                         _
                         (table.insert acc (transform_spec mod_res)))
                       acc)
                     acc))))

```

I want `transform_spec` to transform this:

```
{:src "https://github.com/romainl/vim-cool"
 :event ["BufReadPost" "BufNewFile"]}

```

Into this:

```
{:src "https://github.com/romainl/vim-cool"
 :data {:event ["BufReadPost" "BufNewFile"]}}

```

By storing keys other than `src`, `name`, and `version` under a `data` table. This is what I came up with:

```
(λ transform_spec [spec]
  "Transform a vim.pack spec and move lze arguments into `data`"
  (case spec
    {}
    (do
      ;; Split keys to vim.pack and rest into `data`.
      (local pack_args {})
      (local data_args {})
      (each [k v (pairs spec)]
        (if (vim.list_contains [:src :name :version] k)
            (tset pack_args k v)
            (tset data_args k v)))
      (set pack_args.data data_args)
      pack_args)
    ;; Bare strings are valid vim.pack specs too.
    other
    other))

```

Another quality of life feature I’d like is to make it simpler to call `setup` functions. [lazy.nvim](https://github.com/folkqe/lazy.nvim) again does this well and it’s pretty convenient.

For example, this is how it looks like with [lze](https://github.com/BirdeeHub/lze) to add an `after` hook and call a `setup` function:

```
{:src "https://github.com/A7Lavinraj/fyler.nvim"
 :on_require :fyler
 :after (λ []
          (local fyler (require :fyler))
          (fyler.setup {:icon_provider "nvim_web_devicons"
                        :default_explorer true}))}

```

What if we could instead do:

```
{:src "https://github.com/A7Lavinraj/fyler.nvim"
 :on_require :fyler
 :setup {:icon_provider "nvim_web_devicons" :default_explorer true}}]

```

But this is just data and we can transform the second case to the first one fairly easily. In the `transform_spec` function:

```
(λ transform_spec [spec]
  "Transform a vim.pack spec and move lze arguments into `data`
   and create an `after` hook if `setup` is specified."
  (case spec
    {}
    (do
      ;; Split keys to vim.pack and rest into `data`.
      (local pack_args {})
      (local data_args {})
      (each [k v (pairs spec)]
        (if (vim.list_contains [:src :name :version] k)
            (tset pack_args k v)
            (tset data_args k v)))

      (λ after [args]
        ;; Call `setup()` functions if needed.
        (when spec.setup
          (local pkg (require spec.on_require))
          (pkg.setup spec.setup))
        ;; Load user specified `after` if it exists.
        (when spec.after
          (spec.after args)))

      (set data_args.after after)
      (set pack_args.data data_args)
      pack_args)
    ;; Bare strings are valid vim.pack specs too.
    other
    other))

```

How to figure out the package name to require (since it may differ from the path)? [lazy.nvim](https://github.com/folkqe/lazy.nvim) has a bunch of rules to try to figure this out automatically but I chose to be explicit. [lze](https://github.com/BirdeeHub/lze) uses the `on_require` argument so it can load on a require call (on `(require :fyler) ` for example), which seems like a good idea to reuse.

And just to prevent me from making mistakes, I added a sanity check:

```
;; `:setup` needs to know what package to require,
;; therefore we use `:on_require`
(when (and spec.setup (not spec.on_require))
  (error (.. "`:setup` specified without `on_require`: "
             (vim.inspect spec))))

(λ after [args]
  ;; ...

```

### [Build scripts via PackChanged events](#Build-scripts-via-PackChanged-events) ###

There’s one last feature I really want from [lazy.nvim](https://github.com/folkqe/lazy.nvim) and that’s to automatically run build scripts after a package is installed or updated.

I basically want to specify this in my specs:

```
{:src "https://github.com/eraserhd/parinfer-rust"
 :build ["cargo" "build" "--release"]}

```

Again, we’ll rely on [PackChanged](https://neovim.io/doc/user/pack.html#PackChanged) for this:

```
;; Before `vim.pack.add` to capture changes.
(augroup! :plugin_init (au! :PackChanged pack_changed))

```

The above code uses macros from [nvim-laurel](https://github.com/aileot/nvim-laurel) to define an autocommand that calls the `pack_changed` function. That function will then run `pack_changed` when the package is updated or installed:

```
(λ pack_changed [event]
  (when (vim.list_contains [:update :install] event.data.kind)
    (execute_build event.data))
  ;; Return false to not remove the autocommand.
  false)

(λ execute_build [pack]
   ;; `?.` will prevent crashing if any field is nil.
  (local build (?. pack :spec :data :build))
  (when build
    (run_build_script build pack)))

```

To run the scripts I use [vim.system](https://neovim.io/doc/user/lua.html#vim.system()) with some simple printing:

```
(λ run_build_script [build pack]
  (local path pack.path)
  (vim.notify (.. "Run `" (vim.inspect build) "` for " pack.spec.name)
              vim.log.levels.INFO)
  (vim.system build {:cwd path}
              (λ [exit_obj]
                (when (not= exit_obj.code 0)
                  ;; If I use `vim.notify` it errors with:
                  ;; vim/_editor.lua:0: E5560: nvim_echo must not be called in a fast event context
                  ;; Simply printing is fine I guess, it doesn't have to be the prettiest solution.
                  (print (vim.inspect build) "failed in" path
                         (vim.inspect exit_obj))))))

```

This will now allow us to run build scripts like `cargo build --release` or `make` after a package is installed or updated. It’s a bit too basic as there’s no visible progress bar for long running builds (Rust, I’m looking at you!) and it doesn’t handle build errors that well but it works well enough I guess.

But what about user commands or requiring a package? For example with [nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter) you’d want to run `:TSUpdate` after an update, something like this:

```
{:src "https://github.com/nvim-treesitter/nvim-treesitter"
 :version :main
 :build #(vim.cmd "TSUpdate")}

```

Let’s try it by allowing functions in the `build` parameter (and bare strings because why not):

```
(λ execute_build [pack]
  (local build (?. pack :spec :data :build))
  (when build
    (case (type build)
      ;; We can specify either "make" or ["make"]
      "string" (run_build_script [build] pack)
      "table" (run_build_script build pack)
      ;; Run a callback instead.
      "function" (call_build_cb build pack))))

(λ call_build_cb [build pack]
  (vim.notify (.. "Call build hook for " pack.spec.name) vim.log.levels.INFO)
  (build pack))

```

If we run this though it doesn’t work:

```
Error in /home/tree/code/nvim-conf/init.lua..PackChanged Autocommands for "*":
Lua callback: vim/_editor.lua:0: /home/tree/code/nvim-conf/init.lua..PackChanged Autocommands for "*"..script nvim_exec2() called
at PackChanged Autocommands for "*":0, line 1: Vim:E492: Not an editor command: TSUpdate

```

The problem is that `PackChanged` is run before the pack is loaded. Maybe we could work around this by calling [packadd](https://neovim.io/doc/user/repeat.html#:packadd) ourselves but that would shortcut lazy loading. In this instance we’d like to run `TSUpdate` after the pack is loaded but only if it’s been updated or installed so we don’t run it after every restart.

Yeah I know that [nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter) shouldn’t be lazy loaded anyway so it might be a bad example.

What I did was introduce an `after_build` parameter to the spec that’s run after load if a `PackChanged` event was seen before:

```
{:src "https://github.com/nvim-treesitter/nvim-treesitter"
 :version :main
 :after_build #(vim.cmd "TSUpdate")}

```

Then in `plugins/init.fnl` I use a local variable `packs_changed` that’s updated on [PackChanged](https://neovim.io/doc/user/pack.html#PackChanged) like so:

```
;; Capture packs that are updated or installed.
(g! :packs_changed {})

(λ set_pack_changed [name event]
  ;; Maybe there's an easier way of updating a table global...?
  (var packs vim.g.packs_changed)
  (tset packs name event)
  (g! :packs_changed packs))

(λ pack_changed [event]
  (when (vim.list_contains [:update :install] event.data.kind)
    (local pack event.data)
    (set_pack_changed pack.spec.name event)
    (execute_build pack))
  false)

```

Then we’ll call `after_build` from the `after` hook we setup before:

```
(λ transform_spec [spec]
  (case spec
    {}
    (do
      ;; Split keys to vim.pack and rest into `data`.
      ;; ...

      (λ after [args]
        (local pack_changed_event (. vim.g.packs_changed args.name))
        (set_pack_changed args.name false)
        (when spec.setup
          (local pkg (require spec.on_require))
          (pkg.setup spec.setup))
        ;; Run `after_build` scripts if a `PackChanged` event
        ;; was run with `install` or `update`.
        (when (and spec.after_build pack_changed_event)
          (spec.after_build args))
        (when spec.after
          (spec.after args)))

      (set data_args.after after)
      (set pack_args.data data_args)
      pack_args)
    other
    other))

```

With this we can finally specify build actions such as these:

```
{:build "make"
 :build ["cargo" "build" "--release"]
 :after_build #(vim.cmd "TSUpdate")}

```

While the build system mostly works, once in a while it’ll break and fail to run the build scripts. Maybe there was a weird build error or something. For these cases I have a `:BuildPacks ` user command that runs `build` and `after_build` for all packs like so:

```
(command! :BuildPacks
          (λ []
            (each [_ pack (ipairs (vim.pack.get))]
              (execute_build pack)
              (local after_build (?. pack :spec :data :after_build))
              (when after_build
                (execute_after_build after_build pack.spec.name)))))

```

I really hope that proper build script support will land in core Neovim one day so I can rid myself of my crappy implementation. It makes me feel icky.

[Some Fennel examples](#Some-Fennel-examples)
----------

You’ve already seen how Fennel code looks like but what about configuration with Fennel? One of the negative things of moving my configuration from Vimscript to Lua was that simple things such as settings options or simple keymaps is more verbose.

So how does Fennel compare for the simpler, more declarative stuff?

### [Options](#Options) ###

```
set relativenumber
set clipboard^=unnamed,unnamedplus
set backupdir=~/.config/nvim/backup
let mapleader=" "

```

```
vim.opt.relativenumber = true
vim.opt.clipboard:append({ "unnamed", "unnamedplus" })
vim.opt.backupdir = vim.fn.expand("~/.config/nvim/backup")
vim.g.mapleader = [[ ]]

```

```
(set! :relativenumber true)
(set! :clipboard + ["unnamed" "unnamedplus"])
(set! :backupdir (vim.fn.expand "~/.config/nvim/backup"))
(g! :mapleader " ")

```

With [nvim-laurel](https://github.com/aileot/nvim-laurel) macros I think Fennel is decent. Slightly better than Lua but not as convenient as Vimscript.

### [Keymaps](#Keymaps) ###

```
local map = vim.keymap.set
map("n", "<localleader>D", vim.lsp.buf.declaration,
  { silent = true, buffer = buffer, desc = "Declaration" }
)
map("n", "<leader>ep", function() find_org_file("projects") end,
  { desc = "Org projects" }
)
map("n", "]t", function()
  require("trouble").next({ skip_groups = true, jump = true })
end, {
  desc = "Trouble next",
  silent = true,
})

```

```
(bmap! :n "<localleader>D" vim.lsp.buf.declaration
       {:silent true :desc "Declaration"})
(map! :n "<leader>ep" #(find_org_file "projects")
      {:desc "Org projects"})
(map! :n "]t" #(do
                 (local trouble (require :trouble))
                 (trouble.next {:skip_groups true :jump true}))
      {:silent true :desc "Trouble next"})

```

Not a huge difference to be honest. I like the `#(do_the_thing)` shorthand for anonymous functions fennel has. Having to (sometimes) split up `require` and method calls on separate lines in Fennel is annoying.

Update 2025-10-29

[A comment on Reddit](https://www.reddit.com/r/neovim/comments/1oj1unx/packing_neovim_with_fennel/nm04511/) pointed out that you can simplify `require` and method calls with a macro:

```
(fn m [m func ...]
  "Call a function on a module"
  (assert-compile (sym? m) "expected module name")
  (assert-compile (sym? func) "expected function name")
  `((. (require ,(tostring m)) ,(tostring func)) ,...))

```

And then use it like so:

```
(map! :n "]t" #(m trouble next {:skip_groups true :jump true})
      {:silent true :desc "Trouble next"})

```

### [Overriding highlight groups](#Overriding-highlight-groups) ###

One example that was a big step up with Fennel is overriding highlight groups. I’m using [melange](https://github.com/savq/melange-nvim) which is a fantastic and underrated color scheme but I’ve collected a fair bit of overrides for it.

In Lua you use [nvim\_set\_hl](https://neovim.io/doc/user/api.html#nvim_set_hl()) to add an override, for example like this:

```
vim.api.nvim_set_hl(0, "@symbol.elixir", { link = "@label" })

```

When you do this 100 times this is *annoying* so I made an override table to accomplish the job:

```
local overrides = {
  { name = "@symbol.elixir", val = { link = "@label" } },
  { name = "@string.special.symbol.elixir", val = { link = "@label" } },
  { name = "@constant.elixir", val = { link = "Constant" } },
  -- And around 100 other overrides...
}

for _, v in pairs(overrides) do
  vim.api.nvim_set_hl(0, v.name, v.val)
end

```

In [Fennel](https://fennel-lang.org/) with the [hi!](https://github.com/aileot/nvim-laurel/blob/main/docs/reference.md#highlight) macro this all becomes as simple as:

```
(hi! "@symbol.elixir" {:link "@label"})
(hi! "@string.special.symbol.elixir" {:link "@label"})
(hi! "@constant.elixir" {:link "Constant"})

```

### [Autocommands](#Autocommands) ###

Here are some autocommands to enable [cursorline](https://neovim.io/doc/user/options.html#'cursorline') only in the currently active window (while skipping buffers such as the dashboard):

```
local group = augroup("my-autocmds", { clear = true })
autocmd({ "VimEnter", "WinEnter", "BufWinEnter" }, {
  group = group,
  callback = function(x)
    if string.len(x.file) > 0 then
      vim.opt_local.cursorline = true
    end
  end,
})
autocmd("WinLeave", {
  group = group,
  callback = function()
    vim.opt_local.cursorline = false
  end,
})

```

```
(augroup! :my-autocmds
          (au! [:VimEnter :WinEnter :BufWinEnter]
               #(do
                  (when (> (string.len $1.file) 0)
                    (let! :opt_local :cursorline true))
                  false))
          (au! :WinLeave #(do
                            (let! :opt_local :cursorline false)
                            false)))

```

### [Plugin specs](#Plugin-specs) ###

One thing I like more in Lua compared to Fennel is how readable tables are. The Fennel formatter [fnlfmt](https://git.sr.ht/~technomancy/fnlfmt) might be partly to blame as it has a tendency to use very little whitespace. Regardless, I prefer this Lua code:

```
return {
  "https://github.com/stevearc/conform.nvim",
  { src = "https://github.com/mason-org/mason.nvim", dep_of = "mason-lspconfig.nvim" },
  { src = "https://github.com/neovim/nvim-lspconfig", dep_of = "mason-lspconfig.nvim" },
  "https://github.com/mason-org/mason-lspconfig.nvim",
  {
    src = "https://github.com/nvim-treesitter/nvim-treesitter",
    version = "main",
    after = function()
      vim.cmd("TSUpdate")
    end,
  },
}

```

Over this corresponding Fennel code:

```
["https://github.com/stevearc/conform.nvim"
 {:src "https://github.com/mason-org/mason.nvim" :dep_of :mason-lspconfig.nvim}
 {:src "https://github.com/neovim/nvim-lspconfig" :dep_of :mason-lspconfig.nvim}
 "https://github.com/mason-org/mason-lspconfig.nvim"
 {:src "https://github.com/nvim-treesitter/nvim-treesitter"
  :version :main
  :after #(vim.cmd "TSUpdate")}

```

To me the Lua code is for some reason easier to read.

Similarly I don’t have a problem with this [lazy.nvim](https://github.com/folkqe/lazy.nvim) spec:

```
return {
  "folke/snacks.nvim",
  priority = 1000,
  lazy = false,
  opts = {
    indent = {
      indent = {
        enabled = true,
        char = "┆",
      },
      scope = {
        enabled = true,
        only_current = true,
      },
    },
    scroll = {
      animate = {
        duration = { step = 15, total = 150 },
      },
    },
    explorer = {},
  },
}

```

But with this new Fennel spec I use—even though it’s simpler in some ways—it’s harder for me to quickly see what table the keys belong to:

```
{:src "https://github.com/folke/snacks.nvim"
 :on_require :snacks
 :lazy false
 :setup {:indent {:indent {:enabled true :char "┆"}
                  :scope {:enabled true :only_current true}}
         :scroll {:animate {:duration {:step 15 :total 150}}}
         :explorer {}}}

```

Maybe it’s something you’ll get used to?

A big plus with the setup I use is that I can mix Funnel and Lua, so if I get tired of the [Fennel](https://fennel-lang.org/) tables I could keep them in Lua and have the more “codey” parts in Fennel.

[Notable plugin updates](#Notable-plugin-updates)
----------

Neovim is moving quickly and I’ve had a bit of catching up to do in the plugin department. I won’t bore you with an exhaustive list; just a few highlights.

### [Native undotree](#Native-undotree) ###

I’ve been using [undotree](https://github.com/jiaoshijie/undotree) a long time and it’s excellent. [This feature](https://neovim.io/doc/user/plugins.html#_builtin-plugin:-undotree) was [recently merged into Neovim](https://github.com/neovim/neovim/pull/35627):

```
;; It's optional so we need to use packadd to activate the plugin:
(vim.cmd "packadd nvim.undotree")
;; Then we can add a keymap to open it:
(map! :n "<leader>u" #(: (require :undotree) :open {:command "topleft 30vnew"}))

```

### [Simplified LSP config](#Simplified-LSP-config) ###

Neovim routinely gets shit on for LSPs being so hard to setup. Yes, it could probably be easier but Neovim has recently made some changes to streamline LSP configuration and it’s not nearly as involved as it used to be.

Here’s how my base config looks like:

```
(require-macros :macros)

;; Convenient way of installing LSPs and other tools.
(local mason (require :mason))
(mason.setup)

;; Convenient way of automatically enabling LSPs installed via Mason.
(local mason-lspconfig (require :mason-lspconfig))
(mason-lspconfig.setup {:automatic_enable true})

;; Show diagnostics as virtual lines on the current line.
;; It's pretty cool actually, you should try it out.
(vim.diagnostic.config {:virtual_text false
                        :severity_sort true
                        :virtual_lines { :current_line true })

;; I like inlay hints.
(vim.lsp.inlay_hint.enable true)

(augroup! :my-lsps
          (au! :LspAttach
               (λ [_]
                 (local snacks (require :snacks))
                 (bmap! :n "<localleader>D" snacks.picker.lsp_declarations
                        {:silent true :desc "Declaration"})
                 (bmap! :n "<localleader>l"
                        #(vim.diagnostic.open_float {:focusable false})
                        {:silent true :desc "Diagnostics"})
                ;; etc

```

I also use [nvim-lspconfig](https://github.com/neovim/nvim-lspconfig) but it doesn’t do anything magical (anymore). It’s basically a [collection of LSP configs](https://github.com/neovim/nvim-lspconfig/tree/master/lsp), so I don’t have to fill my config with things like this:

```
(vim.lsp.config "expert"
                {:cmd ["expert"]
                 :root_markers ["mix.exs" ".git"]
                 :filetypes ["elixir" "eelixir" "heex"]})

(vim.lsp.enable "expert")

```

If you don’t want to change the keymaps (Neovim comes with defaults that I personally dislike) or customize specific LSPs then there’s not that much left. [Mason](https://github.com/mason-org/mason.nvim) is also totally optional and if you want to manage your LSPs outside of Neovim you can totally do that. The only thing missing is autocomplete, which [blink.cmp](https://github.com/Saghen/blink.cmp) provides out of the box.

### [Automatically install and enable treesitter grammars](#Automatically-install-and-enable-treesitter-grammars) ###

Another thing that has changed since my last config overhaul is [nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter) being rewritten and is now a much simpler plugin. The new version lives on the [main branch](https://github.com/nvim-treesitter/nvim-treesitter/tree/main) and the old archived one on `master` and it contains a bunch of breaking changes.

For example, it no longer supports installing and activating grammars automatically. I think I saw a plugin for that somewhere but here’s some Fennel code that sets it up:

```
(require-macros :macros)

(local nvim-treesitter (require :nvim-treesitter))

;; Ignore auto install for these filetypes:
(local ignored_ft [])

(augroup! :treesitter
          (au! :FileType
               (λ [args]
                 (local bufnr args.buf)
                 (local ft args.match)
                 ;; Auto install grammars unless explicitly ignored.
                 (when (not (vim.list_contains ignored_ft ft))
                   (: (nvim-treesitter.install ft) :await
                      (λ []
                        ;; Enable highlight only if there's an installed grammar.
                        (local installed (nvim-treesitter.get_installed))
                        (when (and (vim.api.nvim_buf_is_loaded bufnr)
                                   (vim.list_contains installed ft))
                          (vim.treesitter.start bufnr))))))))

```

If you use [nvim-treesitter-textobjects](https://github.com/nvim-treesitter/nvim-treesitter-textobjects/tree/main) (which you should) remember to migrate to the `main` branch there too.

### [Some new fun plugins](#Some-new-fun-plugins) ###

1. [fyler.nvim](https://github.com/A7Lavinraj/fyler.nvim), edit a file explorer like a buffer

   [oil.nvim](https://github.com/stevearc/oil.nvim) is a great plugin that allows you to manage files by simply editing text. [fyler.nvim](https://github.com/A7Lavinraj/fyler.nvim) takes it to the next level by combining it with a tree-style file explorer.

   You may wonder, how in the world does it work?

   It’s both smart and simple: the plugins use unique identifiers together with Neovim’s conceal feature to hide them. If you go into an [oil.nvim](https://github.com/stevearc/oil.nvim) or [fyler.nvim](https://github.com/A7Lavinraj/fyler.nvim) buffer and remove the conceal with `:set conceallevel=0` you can see this for yourself:

   ```
   /00008 drafts
     /00037 my_first_homelab_rack.dj
     /00038 nvim_fennel_pack_rewrite.dj
     /00041 leftie.dj

   ```

   So if I would rename `leftie` to `rightie` in the buffer above and save:

   ```
   /00041 rightie.dj

   ```

   The plugin would see the `/00041` identifier and recognize the rename.

2. [blink.cmp](https://github.com/Saghen/blink.cmp), faster autocomplete

   I’ve been using [nvim-cmp](https://github.com/hrsh7th/nvim-cmp) as my completion plugin but I migrated to [blink.cmp](https://github.com/Saghen/blink.cmp) as it’s faster and more actively maintained. It’s too bad that it broke [my custom nvim-cmp source for my blog](/blog/2024/05/26/autocomplete_with_nvim-cmp/) but it wasn’t too hard to migrate.

3. [snacks.nvim](https://github.com/folke/snacks.nvim), a better picker

   [telescope.nvim](https://github.com/nvim-telescope/telescope.nvim) has been a solid picker but it’s no longer actively developed and the [snacks.nvim](https://github.com/folke/snacks.nvim) is the replacement I settled on.

   I tried [fff.nvim](https://github.com/dmtrKovalenko/fff.nvim) for file picking but surprisingly it felt really slow compared to [snacks.nvim](https://github.com/folke/snacks.nvim). [fzf-lua](https://github.com/ibhagwan/fzf-lua) is another great alternative that I haven’t given enough attention to.

4. [grug-far.nvim](https://github.com/MagicDuck/grug-far.nvim), global query replace

   I’ve been happy with Neovim’s regular `%s/foo/bar` for single files (aided by [search-replace.nvim](https://github.com/roobert/search-replace.nvim) for easy population). But query replace in multiple files has always felt lacking. I used to use [telescope.nvim](https://github.com/nvim-telescope/telescope.nvim) to populate the quickfix window and then use [replacer.nvim](https://github.com/gabrielpoca/replacer.nvim) to make it editable, updating multiple files.

   It worked but was a bit annoying so now I’m trying [grug-far.nvim](https://github.com/MagicDuck/grug-far.nvim) as a more “over engineered” solution. I haven’t used it that long to say for sure but I’m hopeful.

   Yes, LSP backed rename exists and it’s great. But sometimes you want to operate on text.

[Ending thougths](#Ending-thougths)
----------

It would be better to gradually evolve your Neovim config over time instead of doing these large rewrites. But afterwards it feels pretty good as I can once more try to claim with a straight face that I know what’s in my configuration and what it’s doing.

The [vim.pack](https://neovim.io/doc/user/pack.html#vim.pack) migration was more painful than I had expected. It’s still an experimental nightly feature and it’s missing a lot of nice features that [lazy.nvim](https://github.com/folkqe/lazy.nvim) has. I’ll keep using [vim.pack](https://neovim.io/doc/user/pack.html#vim.pack) as I think I’ve gotten it to a state of good enough but I’m looking forward to [vim.pack](https://neovim.io/doc/user/pack.html#vim.pack) becoming more feature complete.

[Fennel](https://fennel-lang.org/) is fun to write in and I will keep using it where I can. To be honest though, for basic configuration I was expecting [Fennel](https://fennel-lang.org/) to make a bigger difference than it did. It’s nicer for sure but it’s nothing revolutionary.

Then again, it’s the little things in life that matters.

[Link to my new Neovim config on GitHub](https://github.com/treeman/nvim-conf)