+++
title = "Bash Scripting - Best Practices"
description = "A list of best practices for writing bash scripts:Use a portable shebangIn computing, a shebang is the character sequence consisting of the characters number sign and exclamation mark (!) at the beginning of a script. (source [wikipedia](https://en.wikipedia.org/wi"
date = "2011-09-04T00:00:00Z"
url = "https://andreinc.net/2011/09/04/bash-scripting-best-practices/"
author = "Andrei Ciobanu"
text = ""
lastupdated = "2026-03-18T21:57:49.249829404Z"
seen = true
+++

A list of best practices for writing bash scripts:

Use a portable shebang
==========

>
>
> In computing, a shebang is the character sequence consisting of the characters number sign and exclamation mark (#!) at the beginning of a script. (source [wikipedia](https://en.wikipedia.org/wiki/Shebang_(Unix)))
>
>

Use:

```
#!/usr/bin/env bash

```

instead of

```
#!/bin/bash

```

`bash` can have various locations Eg.: `/sbin/bash` , `/usr/local/bin/bash`, `/usr/bin/bash`

*Note: This is not only to be applied to `bash`, but to other shells or scripting languages.*