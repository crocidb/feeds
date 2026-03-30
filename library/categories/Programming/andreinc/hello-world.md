+++
title = "Hello world!"
description = 'My first blog post, in which I am writing Hello World!.include <stdio.hint main() {    long long h = 0x0A646C726F57206FLL;    long long e = 0x6C6C6548;    printf("%.4s%s", (char)&e, (char)&h);    return 0;}'
date = "2010-08-09T00:00:00Z"
url = "https://andreinc.net/2010/08/09/hello-world/"
author = "Andrei Ciobanu"
text = ""
lastupdated = "2026-03-18T21:57:49.264947497Z"
seen = true
+++

My first blog post, in which I am writing `Hello World!`.

```
#include <stdio.h>

int main() {
    long long h = 0x0A646C726F57206FLL;
    long long e = 0x6C6C6548;
    printf("%.4s%s", (char*)&e, (char*)&h);
    return 0;
}

```