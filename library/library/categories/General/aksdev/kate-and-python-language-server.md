+++
title = "Kate and Python language server"
description = "As much as I love Kate editor, as I mentioned in my previous post, setting up Python language server has always been a bit fiddly if you want it to work with virtual environments.However thanks to Kate documentation and some Big"
date = "2025-05-03T00:00:00Z"
url = "https://akselmo.dev/posts/kate-python-lsp/"
author = "Akseli"
text = ""
lastupdated = "2026-05-27T23:22:57.040442337Z"
seen = true
+++

As much as I love Kate editor, as I mentioned in my [previous post](https://akselmo.dev/posts/how-i-use-kate-editor/), setting up Python language server has always been a bit fiddly if you want it to work with virtual environments.

However thanks to Kate documentation and some Big Think:tm:, I managed to figure it out, and now I wish to share it.

I could just show the code and that's it, but I wanted to write this so that someone new-ish has easier time to understanding what to do.

[Language server: python-lsp-server](#language-server-python-lsp-server)
----------

The language server I am talking about in this instance is the [python-lsp-server](https://github.com/python-lsp/python-lsp-server/#configuration). VSCode uses something called [Pylance](https://marketplace.visualstudio.com/items?itemName=ms-python.vscode-pylance), but that's proprietary and probably can't ever be made to work with any other editors. One thing I do miss from Pylance is the easy way to make it work with virtual environments.

*Also silly side tangent, I kinda find it weird people call them "LSP" and not "LS" or "language server."* *LSP means Language Server Protocol, which is how the language server talks to your editor..* *I mean I know it doesn't matter but it's a silly pet-peeve.*

### [Python language server plugins](#python-language-server-plugins) ###

I also want to utilize [ruff](https://docs.astral.sh/ruff/) which is a nice linter and formatter for Python. To use it with the language server, you need to use [python-lsp-ruff](https://github.com/python-lsp/python-lsp-ruff). This makes the language server use ruff instead of it's own built-in things.

[Configurations for virtual environments](#configurations-for-virtual-environments)
----------

Kate docs actually mention this part. Search the [documentation](https://docs.kde.org/stable5/en/kate/kate/kate-application-plugin-lspclient.html) for `pylsp_in_env`. It's a bash script which we will be making, but with a tiny twist.

### [Bash script](#bash-script) ###

We need to create a bash script called `pylsp_in_env` (or whatever you desire) which Kate will use to figure out the virtual environment before running the language server.

It's rather simple script:

```
#!/usr/bin/env bash

path=$1
cd $path
if [ -d "${path}/.venv" ]; then
  source $1/.venv/bin/activate
fi

if [ -d "${path}/venv" ]; then
  source $1/venv/bin/activate
fi

exec pylsp --check-parent-process

```

What we do here, instead of the documented example, is to check where the `activate` script actually is. Some people prefer having it `.venv` and some `venv` and there's other names too I'm sure.

So we get the path from the command, then source the virtual environment in right folder, and then execute the `pylsp --check-parent-process` as Kate would do by default.

Save this this to your `$PATH` somewhere so that Kate can see it, or alternatively add the path to your Kate settings. This PATH setting is in `Kate 25.04.0` at least. Don't forget to `chmod +x ./pylsp_in_env` so that it has the execution permissions

### [Kate LSP config](#kate-lsp-config) ###

Finally, just add this to your Kate LSP config file:

```
{
    "servers": {
        "python": {
            "command": [
                "pylsp_in_env", "%{Project:NativePath}"
            ],
            "root": ".",
            "url": "https://github.com/python-lsp/python-lsp-server",
            "highlightingModeRegex": "^Python$",
            "settings": {
                "pylsp": {
                    "plugins": {
                        "ruff": {
                            "enabled": true
                        }
                    }
                }
            }
        }
    }
}

```

Of course, if you have more language servers in your config, make sure to add the above part next to them.

If you don't want to use ruff, you can remove the whole `settings` bit.

What I wanted to note here is that Kate now gives the full path to the python project using the `%{Project:NativePath}` argument. There's more of these `%{}` items in Kate, which can be found by scouring the documentation.

[Done!](#done)
----------

That's pretty much it. Now restart the language servers from Kate menus, or restart Kate, and Kate is now aware of any of the virtual environments running inside your Python project.

Do note that I have no idea how `poetry` etc. do this. I think they may need some kind of different script. If I ever need to figure that out, I will extend this post or make new one.

If you read the Kate docs, you may have already understood what to do and done so. I however wanted to share my solution for this, which differs very slightly from the one in the documentation.

Thanks for reading, I hope this helps!