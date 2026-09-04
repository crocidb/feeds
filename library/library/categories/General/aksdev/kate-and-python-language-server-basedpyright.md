+++
title = "Kate and Python Language Server: Basedpyright"
description = "This post is somewhat an update for my older post: Kate and Python language serverThere seems to be a lot of different Python language servers.. And I just want one that does all and stays out of the way.So after moaning about that I "
date = "2025-08-14T00:06:09Z"
url = "https://akselmo.dev/posts/kate-and-basedpyright/"
author = "Akseli"
text = ""
lastupdated = "2026-05-27T23:22:57.017684400Z"
seen = true
+++

This post is somewhat an update for my older post: [Kate and Python language server](https://akselmo.dev/posts/kate-python-lsp/)

There seems to be a lot of different Python language servers.. And I just want one that does all and stays out of the way.

So after moaning about that I was pointed towards [basedpyright](https://docs.basedpyright.com/latest/) on Fedi.

Despite the silly name, it works really well, so I set it up for [Kate](https://kate-editor.org/) editor as I do. Here's how.

[Install basedpyright](#install-basedpyright)
----------

You may want to use something like [pipx](https://pipx.pypa.io/latest/) for this, that's at least what I did.

```
pipx install basedpyright

```

[pylsp\_in\_env.sh](#pylsp-in-env-sh)
----------

Then add `pylsp_in_env.sh` to PATH (such as `~/.local/bin/`) Kate can see:

```
#!/usr/bin/env bash

path="$1"
cd $path
if [ -d ./.venv ]; then
  source ./.venv/bin/activate
elif [ -d ./venv ]; then
  source ./venv/bin/activate
elif [ -f ./Pipfile ]; then
  exec pipenv run basedpyright-langserver --stdio
  exit 0
fi

exec basedpyright-langserver --stdio

```

As mentioned in the previous post, this is needed to get the proper virtual environment. I also updated the script to work with Pipfiles.

[Kate lsp settings](#kate-lsp-settings)
----------

Then add this to Kate LSP settings.

I have also kept the `pylsp` settings there. It doesn't harm anything to have them there, in case you want to change the language server back to `python-lsp-server`.

```
{
	"python": {
		"command": [
			"pylsp_in_env",
			"%{Project:NativePath}"
		],
		"root": ".",
		"url": "https://docs.basedpyright.com/latest/",
		"highlightingModeRegex": "^Python$",
		"settings": {
			"basedpyright": {
				"analysis": {
					"typeCheckingMode": "off"
				}
			},
			"pylsp": {
				"plugins": {
					"pycodestyle": {
						"enabled": false
					},
					"ruff": {
						"enabled": true
					}
				}
			}
		}
	}
}

```

You can change the `typeCheckingMode` to different values like `basic` and `recommended` if project demands it. I set it `off` because with `recommended` there's *A LOT* of diagnostics that I usually don't need, unless again, the project expects proper type checking.

[Done!](#done)
----------

And that's it. Restart Kate or the Language server inside Kate and as long as Kate can find the file, it should just start up `basedpyright-langserver` and work.

I like this language server a lot, but if there's other challengers in future, expect me to make a post about them too.

Until next time!