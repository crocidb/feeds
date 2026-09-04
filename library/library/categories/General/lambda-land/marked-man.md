+++
title = "Marked Man"
description = "Marked Man (mm) is a little program I wrote to view Markdown files like UNIX man pages. (Because who wants to leave their terminal just to open a file?)It uses Pandoc to convert between Markdown and the groff format. As a happy side-effect, this program ca"
date = "2019-01-24T00:00:00Z"
url = "https://lambdaland.org/posts/2019-01-24-marked-man/"
author = """

            
              Ashton Wiersdorf
            
          """
text = ""
lastupdated = "2026-07-21T09:22:07.331643710Z"
seen = false
+++

Marked Man (mm) is a little program I wrote to view Markdown files like UNIX man pages. (Because who wants to leave their terminal just to open a file?)

It uses [Pandoc](https://pandoc.org) to convert between Markdown and the `groff` format. As a happy side-effect, this program can read basically *anything* as a man page: HTML, LaTeX, Word files (seriously), ePub, etc. Anything that Pandoc can read, Marked Man can handle.

Installing
----------

I’m working on getting this set up with [Homebrew](https://lambdaland.org/posts/2019-01-24-marked-man/brew.sh). For now, check out my GitHub repository [here](https://github.com/ashton314/homebrew-mm).