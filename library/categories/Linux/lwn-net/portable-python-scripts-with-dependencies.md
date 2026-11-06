+++
title = "[$] Portable Python scripts with dependencies"
description = 'A basic Python script is portable: it can be copied between machines with little concern about compatibility. A script that depends on third-party packages requires quite a bit more care and consideration, however. In 2023, PEP 723 ("Inline sc'
date = "2026-11-04T14:45:02Z"
url = "https://lwn.net/Articles/1104646/"
author = "jake"
text = ""
lastupdated = "2026-11-05T13:08:21.681146548Z"
seen = false
+++

A basic Python script is portable: it can be copied between machines with little concern about compatibility. A script that depends on third-party packages requires quite a bit more care and consideration, however. In 2023, [PEP 723](https://peps.python.org/pep-0723/) ("Inline script metadata") introduced a standard for declaring a Python script's dependencies inside the script itself. Several third-party tools can now automatically install and manage those dependencies, but there is still little official support for this standard within Python itself.