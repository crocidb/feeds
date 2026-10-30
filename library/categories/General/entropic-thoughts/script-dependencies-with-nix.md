+++
title = "Script dependencies with Nix"
description = " In the theme of NixOS enabling fearlessness, here’s a way I use Nix on other Linux distributions to sleep better at night: managing dependencies of simple scripts. This way of using Nix is for everyone, not just those willing to try NixOS. We’ll look at it first for a Python s"
date = "2026-10-21T22:00:00Z"
url = "https://entropicthoughts.com/python-dependencies-with-nix"
author = "a@xkqr.org (kqr)"
text = ""
lastupdated = "2026-10-27T22:33:08.501268926Z"
seen = false
+++

 In the theme of NixOS enabling fearlessness, here’s a way I use Nix on *other* Linux distributions to sleep better at night: managing dependencies of simple scripts.

 This way of using Nix is for everyone, not just those willing to try NixOS. We’ll look at it first for a Python script, and then see how it can be adapted to any other language.

 I wanted to create a script that would read the verbatim content of my articles out loud to me with a synthesised voice. One of the more convenient ways to do this is with Python, where I’ve heard good things about Trafilatura for extracting the contents out of a web page, filtering on types of content, etc.

 But Trafilatura is a third-party Python dependency. Those suck because they break your scripts when you so much as glance sideways at `pip`. The code also ended up depending on `aplay`, which is a system dependency, making it two different sources of future breakage. A couple of years ago, I would probably have judged that to be too much maintenance, so I wouldn’t have created the script. Fortunately, now I know about Nix.

[(Continue reading the full article on the web.)](https://entropicthoughts.com/python-dependencies-with-nix)