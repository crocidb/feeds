+++
title = "How I use Kate Editor"
description = "I love the Kate Text editor. I use it for pretty much all the programming projects I do. Kate has been around for long time now, about 20 years! At least earliest blog post for it I could find was [written in 2004.](https://kate-editor.org/2004/01/06/w"
date = "2025-04-20T00:00:00Z"
url = "https://akselmo.dev/posts/how-i-use-kate-editor/"
author = "Akseli"
text = ""
lastupdated = "2026-05-27T23:22:57.043961177Z"
seen = true
+++

I love the [Kate Text editor](https://kate-editor.org/). I use it for pretty much all the programming projects I do. Kate has been around for long time now, about 20 years! At least earliest blog post for it I could find was [written in 2004.](https://kate-editor.org/2004/01/06/writing-a-kate-plugin/)

I wanted to go over my workflow with it, why I like it so much and hopefully get more people to try it out.

[![My Kate setup](/assets/images/kate/kate-view.png)](/assets/images/kate/kate-view.png)

[How I set up my editor](#how-i-set-up-my-editor)
----------

Here's some settings I find important for my workflow. There's tons more settings to fiddle with, but most of the defaults suffice for me very well.

### [Plugins I use](#plugins-i-use) ###

Here's a list of the plugins I have enabled. Some of them are self-explanatory, some I will go more in detail later.

* Build & Run
* Color Picker
* Colored Brackets
* Document Preview
* Docment Switcher
* External Tools
* Formatting
* Git Blame
* Kate Debugger
* LSP Client
* Open Link
* Project Plugin
* Search & Replace
* Snippets
* Terminal

### [Move and split views](#move-and-split-views) ###

In Kate, most views are in their own little tabs. You can right click these tabs and select "Own section" which splits them into their own areas. In the screenshot I provided at start, you can see my Projects and Git view being split like this, so they can both be open at the same time.

![Context menu for splitting panels](/assets/images/kate/split-context-menu.png)

Do note that these are saved per session, so sessions can have different splits.

### [Language server](#language-server) ###

In LSP Client settings, you can toggle multiple things I won't go into detail in here. What I do want to mention is the User Server Settings file, which can be edited from this menu. To override some defaults, you can just copy the default setting from the default tab, put it in your own settings tab and then just change the values.

Here's my LSP settings: [dotfiles/kate/lspclient/settings.json](https://codeberg.org/akselmo/dotfiles/src/branch/main/kate/lspclient/settings.json)

### [Debug adapters](#debug-adapters) ###

Debugger settings work similarly to LSP setting, however you may have to restart Kate to recognize any new changes.

Here's my DAP settings: [dotfiles/kate/debugger/dap.json](https://codeberg.org/akselmo/dotfiles/src/branch/main/kate/debugger/dap.json)

### [Formatters](#formatters) ###

For code formatting, there's also it's own setting menu, however as of writing this *only the languages mentioned in default settings* are supported.

If you want to tell formatter to stop autoformatting, you can set it like this, using clang-formatter as example:

```
{
  "clang-format": {
    "command": [
      "clang-format"
    ],
    "formatModifiedLinesOnly": true,
    "formatOnSave": false
  }
}

```

Here's my formatting settings: [dotfiles/kate/formatting/settings.json](https://codeberg.org/akselmo/dotfiles/src/branch/main/kate/formatting/settings.json)

### [Shortcuts](#shortcuts) ###

Shortcuts are very personal thing and I encourage learning the defaults if at all possible. I have changed mine around a bit, for example `Ctrl+Shift+Space` for Quick Open and `Ctrl+Space` for Find action. More of these two later!

### [Path setting](#path-setting) ###

Kate can't always find language servers for example, if it can't resolve your path. Use this path setting to load binaries from paths like `~/.local/bin`. You can find this under Behavior settings at least on Kate 25.04.

[Sessions](#sessions)
----------

Sessions are basically group of projects. Do not treat sessions as projects themselves, that will only cause sadness.

I have separated my Work and Personal projects in their own sessions. This means that during work day, I can right click the Kate icon, select Work session, and then Kate will always open for me in that session until I choose Personal session.

In session settings I have set Kate to always open the last used session because of this.

I highly recommend this way of working. You could also have sessions for differently themed projects: Gamedev, web, etc..

Just make sure to create at least one session when starting out, then you can use that as a template for the other sessions in Kate session manager.

When I used to write more notes with Kate, I had it's own Notes session with both my Notes folder as a project folder and my blog.

[Colorschemes](#colorschemes)
----------

Kate uses [KColorScheme](https://invent.kde.org/frameworks/kcolorscheme) library for it's colorscheme needs. You can very easily to copy a ready colorscheme and then start modifying your own changes on top of it.

You can also create a completely new colorscheme if you wish, like I have done here: [Revontuli/Kate](https://codeberg.org/akselmo/Revontuli/src/branch/main/Kate)

The colorscheme files in the library are their own XML format which is not ideal IMO but it gets the job done. It would be awesome if Kate supported [tree-sitter](https://tree-sitter.github.io/tree-sitter/) but so far I haven't heard anyone trying to implement that.

[File quick switching](#file-quick-switching)
----------

I mentioned this earlier in shortcuts section. If you're like me and have multiple projects open, you can use the Quick switcher and start typing the filename you need to open.

![Quickswitcher being used](/assets/images/kate/quickswitch.png)

If you just want to open a specific project, you can type `project bla` and it will find that project for you from your project list.

This is why I have it bound to `Ctrl+Shift+Space`, so I can just press it and quickly find the file I need.

[Action search](#action-search)
----------

This is more interesting: Instead of searching for files, you can search for any action Kate has.

For example, if you want to look for terminal related actions, you can type "Terminal" and it lists everything plus any potential shortcuts.

![Action search being used](/assets/images/kate/actionsearch.png)

**Fun fact, you can use this in other KDE apps too, like Dolphin or Konsole!** The default key combination for it is `ctrl+alt+i` but I use it so frequently I set it to `ctrl+space`.

[Build and Run](#build-and-run)
----------

The name of this plugin is a bit misleading IMO because it can do so much more than just build.

![Build and run view](/assets/images/kate/build-and-run.png)

In essence, it's a command runner. You can give the command a name, then build command and run command.

For example in the above image, my game project has only one command called `build` which has build command `odin build ./src -collection:src=src -debug -out:./build/ArtificialRage` and run command `odin run ./src -collection:src=src -debug -out:./build/ArtificialRage`.

I can then just use the action search to build and run my game project.

For your projects, you can then add file called `.kateproject.build` in your project root folder, so Kate will pick that up. They're just JSON files that look like this:

```
{
    "target_sets": [
        {
            "cmake_config": "",
            "directory": "/home/akseli/Repositories/artificial-rage/",
            "loaded_via_cmake": false,
            "name": "artificial-rage",
            "targets": [
                {
                    "build_cmd": "odin build ./src -collection:src=src -debug -out:./build/ArtificialRage",
                    "name": "build",
                    "run_cmd": "odin run ./src -collection:src=src -debug -out:./build/ArtificialRage"
                }
            ]
        }
    ]
}

```

The `.kateproject` files can store much more information about the project, but they are not very user facing yet sadly. Something on my eternal to-do list.

Also when running the commands, there's "Output" tab that shows the results. It's basically view to your terminal, but if you encounter an error or warning, and the output panel can parse the file and location from it, you can click that item and it will open code at that position where the error/warning appeared.

[Language server](#language-server-1)
----------

As I mentioned above in the settings, Kate does have support for [Language Server Protocol](https://microsoft.github.io/language-server-protocol/), as long as they're found from the path Kate looks for them and are configured properly. It's very much the same support one would expect in any modern editor.

One thing I do use a bunch thanks to it is looking for references to specific symbol, searching symbols across all my open projects and symbol overview.

[Debugger](#debugger)
----------

Kate has support for [Debug Adapter Protocol](https://microsoft.github.io/debug-adapter-protocol/), which is the lesser known cousin of Language Server Protocol.

This allows you to debug applications visually with breakpoints, check the stacktrace by using `Locals and stack` panel, and so on.

As long as the configuration is correct, debug adapter is found in path, and the executable, working directory, etc are given to Kate correctly, it can debug things rather well. The debugger plugin has undergone bunch of polish lately so it's rather good for my use, especially with my game projects.

[![Debugging my game](/assets/images/kate/debug.png)](/assets/images/kate/debug.png)

For bigger things like debugging whole Plasma desktop, I still use gdb in terminal.

[Terminal](#terminal)
----------

Speaking of terminal, the terminal is just Konsole running inside it's own view. The terminal can be made to follow the folder of the file you're editing, and it will share the settings with Konsole. You can also split the terminal from Kate if you need more views. Terminal tabs also work.

So it's essentially just Konsole embedded in Kate.

[Git integration](#git-integration)
----------

The git integration in Kate is simple-but-works. You can diff, stage and discard lines/hunks directly from the editor (I use this a lot).

![Git diffing](/assets/images/kate/git-diff.png)

Then of course, you can stage and unstage, commit, push, pull etc. directly from Kate. As of writing this, you can't rebase yet, but for more complex tasks I tend to often use something like [lazygit](https://github.com/jesseduffield/lazygit), which I highly recommend.

![Git staging](/assets/images/kate/git-staging.png)

All of this has inline git blame, so you can see per line who did what and where. This is very handy in projects with multiple devs.

[Snippets](#snippets)
----------

Kate has a snippet plugin that allows one to create simple or super complex snippets, for example for boilerplate.

![Snippets tool](/assets/images/kate/snippet.png)

Here's example for my blog header snippet (don't mind the bad JS I wrote it very tired)

The snippet text, that will be pasted into a markdown file:

```
+++
title = "${title}"
date = ${justDate()}
aliases = ["/${dateUrl()}/${lowerFilename()}.html"]
[taxonomies]
tags = ["${tag}",]
+++

```

My ugly javascript mess for creating dynamic items:

```
function fileName() { return document.fileName(); }
function fileUrl() { return document.url(); }
function encoding() { return document.encoding(); }
function selection() { return view.selectedText(); }
function year() { return new Date().getFullYear(); }
function upper(x) { return x.toUpperCase(); }
function lower(x) { return x.toLowerCase(); }
function today() {
    var date = new Date();
    return formatDate(date);
}

function padTo2Digits(num) {
  return num.toString().padStart(2, '0');
}

function getDateName(date){
    var names = ['Sun', 'Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat'];
    return names[date.getDay()];
}

// 2024-06-13 Thu 10:00
function formatDate(date) {
    var dateString =     [
      date.getFullYear(),
      padTo2Digits(date.getMonth() + 1),
      padTo2Digits(date.getDate()),
    ].join('-');

    var dayName = getDateName(date);

    var time =     [
      padTo2Digits(date.getHours()),
      padTo2Digits(date.getMinutes())
    ].join(':');

    var timeString = dateString + " " + dayName + " " + time;
  return timeString;
}

function justDate() {
    var date = new Date();
    var dateString =     [
      date.getFullYear(),
      padTo2Digits(date.getMonth() + 1),
      padTo2Digits(date.getDate()),
    ].join('-');
    return dateString;
}

function dateUrl() {
    var date = new Date();
    var dateString =     [
      date.getFullYear(),
      padTo2Digits(date.getMonth() + 1),
      padTo2Digits(date.getDate()),
    ].join('/');
    return dateString;
}

function lowerFilename() {
	return lower(fileName());
}

```

So yes, you can write Javascript to generate snippets for you, like here I've done with date and time, filename, etc.. It's super useful.

You can then use code-completion shortcut and type `snippet-namespace:snippet-name` and press enter, and it will run the snippet for you. You can make the snippets only appear for files in specific language.

It's a very very powerful tool for generating simple boilerplate code. Requires some upfront work but after that's done, it works wonders.

Here's also some of my markdown snippets: [dotfiles/kate/Markdown Snippets.xml](<https://codeberg.org/akselmo/dotfiles/src/branch/main/kate/Markdown Snippets.xml>)

[But why do I love it so](#but-why-do-i-love-it-so)
----------

Kate has basically all the features I need, out of the box, without having to download random extensions or plugins. Sometimes I just have to enable plugins, maybe write and change some configurations.. But when that's done, it's all just there and I can start using it.

I tend to back up my configs to my dotfiles git, so I can just in subsequent installs use them immediately.

>
>
> Hang on, VSCode has all of this and more!
>
>

You're right, VSCode has a lot of these things too. However with VSCode I've noticed that you have to sometimes download whole language as an extension. Then, the extensions may clash with each other, especially if you have two extensions that do different things for the same thing: I remember having two CMake extensions where both had something I needed, but they both also overlap in some basic features, so it got very confusing.

That's probably all skill-issue of course. But I like that I don't have to download any extensions or plugins or whatever.. I can just import my settings and start working.

VSCode being electron and Microsoft doesn't really help my feelings either, especially since some of their extensions like C# and Python are proprietary, and they're working on more extensions to be like that:

* [Matt "msw" Wilson: "The latest proprietary #VSCode extension that no…" - Mastodon 🐘](https://mstdn.social/@msw/114281012370795980)
  * [Archive.org link](https://web.archive.org/web/20250420193838/https://mstdn.social/@msw/114281012370795980)

So yeah, I rather use something like Kate that I know will be around for long time and won't turn into proprietary mush, nor try to tell me to use their newest "AI" slop tools.

Kate is very much the embodiment of KDE tagline: Simple by Default, Powerful when Needed. It does all I need and allows me to modify it as I need.

I've contributed to Kate bunch of times, and every time it has been nice. The maintainers of Kate are very lovely patient people who deal with my nonsense. :)

And that's why I love it so much: The people around it, the out of the box experience, the simplicity yet powerfulness..! ❤️

[Give Kate a try today!](https://kate-editor.org/get-it/) :)

If you have any issues with it, report them on [bugs.kde.org](https://bugs.kde.org/). You can also send wishlist items there. There is also wishlist of things on [KDE Discuss](https://discuss.kde.org/t/kate-hopes-and-dreams-wishlist/582), feel free to chat there about it or ask for help in general.

PS. For the modal text editor lovers, Kate does have Vi mode. I use it from time to time, but I prefer Kate as it is to be honest. For my terminal/modal editing needs I use [Helix](https://helix-editor.com/) editor, but most of the time I'm using Kate.