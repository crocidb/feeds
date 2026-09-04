+++
title = "My changes to saving Konsole tab layouts"
description = "I recently made a patch to Konsole terminal emulator, that adds to the current tab layout saving system couple more things: Working directory Size of splits* Optional command to runYou can find the patch here: [ViewManager: Save columns, lines and wo"
date = "2025-05-18T14:47:10Z"
url = "https://akselmo.dev/posts/konsole-layout-changes/"
author = "Akseli"
text = ""
lastupdated = "2026-05-27T23:22:57.031396471Z"
seen = true
+++

I recently made a patch to [Konsole](https://konsole.kde.org/) terminal emulator, that adds to the current tab layout saving system couple more things:

* Working directory
* Size of splits
* Optional command to run

You can find the patch here: [ViewManager: Save columns, lines and working directory to tabLayout (!1095)](https://invent.kde.org/utilities/konsole/-/merge_requests/1095)

It's a feature I've seen in other terminal editors, so I wanted to add it to Konsole as well.

**Note that this is not in current version of Konsole, but it will be in the next one: 25.07**. Unless it gets backported, of course.

[Current tab layouts](#current-tab-layouts)
----------

In Konsole, you can even in current version save your tab layout:

1. Open Konsole
2. Split the current view into multiple ones
3. Go to Menu -\> View -\> Save tab layout...

This produces a JSON file like this:

```
{
    "Orientation": "Vertical",
    "Widgets": [
        {
            "SessionRestoreId": 0
        },
        {
            "SessionRestoreId": 0
        }
    ]
}

```

Now, as it is currently, it's not that useful. The split sizes won't be saved, for example.

[My changes](#my-changes)
----------

My changes now allow you to save the size of the splits and the working directories, like this:

```
{
    "Orientation": "Horizontal",
    "Widgets": [
        {
            "Columns": 88,
            "Command": "",
            "Lines": 33,
            "SessionRestoreId": 0,
            "WorkingDirectory": "/home/akseli/Repositories"
        },
        {
            "Orientation": "Vertical",
            "Widgets": [
                {
                    "Columns": 33,
                    "Command": "",
                    "Lines": 21,
                    "SessionRestoreId": 0,
                    "WorkingDirectory": "/home/akseli/Documents"
                },
                {
                    "Columns": 33,
                    "Command": "",
                    "Lines": 10,
                    "SessionRestoreId": 0,
                    "WorkingDirectory": "/home/akseli"
                }
            ]
        }
    ]
}

```

As you can see, it saves the Columns, Lines, WorkingDirectory. It also adds empty Command item, which you can write any command in, like `ls -la`, or keep it empty.

You can try to use the columns and lines sections to modify the size manually, but I've noticed it's easier just to do it inside Konsole.

Now the old layout file will work too, if the field doesn't exist Konsole won't do anything about it.

Note about the command: Konsole basically pretends to type that command in when it loads, so the commands don't need a separate Parameter field or anything like that. You could make the command something like `foo && bar -t example && baz --parameter`. Konsole then just types that in and presses enter for you. :)

### [More concrete example](#more-concrete-example) ###

I made this change because I wanted to run Konsole in following layout:

```
{
    "Orientation": "Horizontal",
    "Widgets": [
        {
            "Orientation": "Vertical",
            "Widgets": [
                {
                    "Columns": 139,
                    "Command": "hx .",
                    "Lines": 50,
                    "SessionRestoreId": 0
                },
                {
                    "Columns": 139,
                    "Command": "",
                    "Lines": 14,
                    "SessionRestoreId": 0
                }
            ]
        },
        {
            "Columns": 60,
            "Command": "lazygit",
            "Lines": 66,
            "SessionRestoreId": 0
        }
    ]
}

```

With these items I can get the layout splits as I want, with any commands I want.

Then I have a bash script to run this layout in the directory the script is run at:

```
#!/usr/bin/env bash
konsole --separate --hold --workdir "$1" --layout "$HOME/Documents/helix-editor.json" &

```

Now when I go to any project folder and run this script, it will open the [Helix](https://helix-editor.com/) text editor, [lazygit](https://github.com/jesseduffield/lazygit) and empty split the way I want it, without having to make these splits manually every time.

[![Preview of Konsole and splits of editor and git](/assets/images/konsole/splits.png)](/assets/images/konsole/splits.png)

Sure I could use something like [Zellij](https://zellij.dev/) for this but they have so much things I don't need, I just wanted to split the view and save/load that arrangement.

[In future](#in-future)
----------

I would like to add a small GUI tool inside Konsole that allows you to customize these layout easily during save process, such as changing the WorkingDirectory and Command parameters.

But for now, you'll have to do it inside the JSON file, but chances are when you want to do layouts like this, you're comfortable editing these kind of files anyway.

I hope some others will find this useful as well, for things like system monitoring etc.

Hope you like it!