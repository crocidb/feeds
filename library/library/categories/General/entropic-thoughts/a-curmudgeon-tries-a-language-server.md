+++
title = "A curmudgeon tries a language server"
description = " I write code roughly the same way I did ten years ago: I make edits in my text editor, I switch over to a terminal window and I run a command to compile and execute the code. I look at the result, then switch back to my editor. If I am unsure of what happens, I either add tracer"
date = "2026-08-24T22:00:00Z"
url = "https://entropicthoughts.com/curmudgeon-tries-language-server"
author = "a@xkqr.org (kqr)"
text = ""
lastupdated = "2026-09-01T19:33:12.232347294Z"
seen = true
+++

I write code roughly the same way I did ten years ago: I make edits in my text editor, I switch over to a terminal window and I run a command to compile and execute the code. I look at the result, then switch back to my editor. If I am unsure of what happens, I either add tracer prints to the code and restart the program, or I restart the program in a debugger. If I hit an exception that crashes my program, I fix the problem and then restart it.

 I’m envious of what Lisp programmers do. Lisp development typically happens by typing code directly into the REPL to add, remove, and replace parts of the live, running system.

* A Lisp programmer does not need to “switch over” to something else because they are already inside their program process.
* They never “compile and execute” the code because the code is already running and they edit it by hot-swapping code.
* They never restart in a debugger because they are already inside their program process and can inspect anything they want.
* They don’t have to restart the program on exceptions, because the condition system allows resuming the crashing code *from anywhere in the stack* after the system has been patched with a fix.

[(Continue reading the full article on the web.)](https://entropicthoughts.com/curmudgeon-tries-language-server)