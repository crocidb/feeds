+++
title = "A breakthrough in C/C++ dependency management"
description = "Are you a C or C++ programmer?"
date = "2026-04-25T23:55:00Z"
url = "https://lcamtuf.substack.com/p/a-breakthrough-in-cc-dependency-management"
author = "lcamtuf"
text = ""
lastupdated = "2026-04-27T12:43:05.393363138Z"
seen = true
+++

Are you a C or C++ programmer? Are you envious that other languages keep hogging the limelight when it comes to supply chain attacks?

If you answered “yes” to both questions, I bring you revolutionary new technology — remote, on-demand includes in GCC and clang:

>
>
>
>
> ```
> #include <https://lcamtuf.coredump.cx/leftpad.h>
>
> int main() {
>   char* x = leftpad("Hello world!", 16);
>   printf("[%s]\n", x);
> }
> ```
>
>
>
>

To use this exciting functionality, simply download the official *[remote\_includes.tgz](https://lcamtuf.coredump.cx/soft/remote_includes.tgz)* package from my website, compile it with *./build.sh*, and then start compiling programs with:

>
>
>
>
> ```
> LD_PRELOAD=./remote_includes.so gcc demo_program.c
> ```
>
>
>
>

…or:

>
>
>
>
> ```
> LD_PRELOAD=./remote_includes.so clang demo_program.c
> ```
>
>
>
>

Of course, this technology is protected by military-grade security, as signified by the following symbol: 🔒.

Thank you and God bless!

[Subscribe now](https://lcamtuf.substack.com/subscribe?)

---

*PS. It works, but don’t use this! PPS. If you do, you will die, and it will hurt the whole time you’re dying.*