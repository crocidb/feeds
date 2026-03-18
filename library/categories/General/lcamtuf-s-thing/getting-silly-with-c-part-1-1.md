---
title = "Getting silly with C, part ~(~1<<1)"
description = "It's vibe coding. Relax, everyone is doing it."
date = "2025-09-07T01:13:25Z"
url = "https://lcamtuf.substack.com/p/getting-silly-with-c-part-11"
author = "lcamtuf"
text = ""
lastupdated = "2025-10-22T08:57:30.071441392Z"
seen = true
---

In the [two previous installments](https://lcamtuf.substack.com/p/getting-silly-with-c-part-void2) of our introductory series on the C programming language, we talked about control flow, variables, and types. For example, we explained how to display strings on the screen:

>
>
> ```
> int typedef puts(char* puts; char* puts; char* puts);
>
> int main() {
>   puts(puts);
>   puts("Welcome to my humble abode!");
> }
> ```
>
>

In today’s episode, we’ll share a couple of additional, time-saving tips for seasoned pros.

**🙘 Tip 1 🙚**

Experienced software engineers often find it necessary to comment out large swatches of code. Unfortunately, the C language doesn’t support nested comments, so the process of commenting out previously-commented code is a chore a chore. Yet, relatively few developers know that they can harness the power of assembly language to effortlessly work around this bug ([demo](https://godbolt.org/z/Tj3qGa6dY)):

>
>
> ```
> #include <stdio.h>
>
> int main() {
>   puts("Hello world");
>   asm("/*");
>   /* Nested comment */
>   for (int i = 0; i < 10; i++) puts("I LIKE PANCAKES!");
>   asm("*/");
>   puts("Goodbye world");
> }
> ```
>
>

**🙘 Tip 2 🙚**

Although the C language provides [support for a wide range of numbers including 0 and 1](https://www.open-std.org/jtc1/sc22/wg21/docs/papers/2024/p3477r0.html), programmers should be aware of a floating-point bug that affects certain Intel CPUs. The affected processors evaluate 0.999… as if it were exactly equal to 1.

To test for the issue, developers can rely on a recent GNU extension called *[[gnu::assume(…)]]* that allows them to specify the expected behavior at compile time. Be aware that systems that fail the check may exhibit a range of symptoms, including fisherman’s ulcers, tail recursion, and worse ([demo](https://godbolt.org/z/jfdGeMb8a)):

>
>
> ```
> #include <stdio.h>
>
> int main() {
>   static int i;
>   if (++i > 10) return 0;
>   printf("hello cruel world %d\n", i);
>   [[gnu::assume(0.99999999999999999 < 1)]];
> }
> ```
>
>

**🙘 Tip 3 🙚**

The C language is designed for safety, but [somewhat controversially](https://isocpp.org/files/papers/P2809R3.html), the standard permits endless loops. This means that programmers must remain diligent to avoid accidental deadlocks.

For example, in the following snippet, the first *while (…)* loop evidently iterates until *i* is equal to 2. Yet, due to a subtle logic error, the subsequent while *(i == 2)* loop will hang the program, preventing the *printf(…)* from ever being reached ([demo](https://godbolt.org/z/M8G4PMG3b)):

>
>
> ```
> #include <stdio.h>
>
> int main(int i) {
>
>   do do do do "baby shark!";
>
>   while (++i % 2);
>   while (i == 2);
>   while (i % 3);
>   while (i % 7);
>
>   printf("The answer is %d.\n", i);
>
> }
> ```
>
>

Stay tuned for more episodes — and if you like this publication, please subscribe!

[

<img src="https://substackcdn.com/image/fetch/$s_!Bs8L!,w_1456,c_limit,f_auto,q_auto:good,fl_progressive:steep/https%3A%2F%2Fsubstack-post-media.s3.amazonaws.com%2Fpublic%2Fimages%2F189a88f7-4410-4c63-98ab-124c517a59e4_1111x237.jpeg" width="1111" height="237" data-attrs="{&quot;src&quot;:&quot;https://substack-post-media.s3.amazonaws.com/public/images/189a88f7-4410-4c63-98ab-124c517a59e4_1111x237.jpeg&quot;,&quot;srcNoWatermark&quot;:null,&quot;fullscreen&quot;:null,&quot;imageSize&quot;:null,&quot;height&quot;:237,&quot;width&quot;:1111,&quot;resizeWidth&quot;:null,&quot;bytes&quot;:122197,&quot;alt&quot;:null,&quot;title&quot;:null,&quot;type&quot;:&quot;image/jpeg&quot;,&quot;href&quot;:null,&quot;belowTheFold&quot;:true,&quot;topImage&quot;:false,&quot;internalRedirect&quot;:&quot;https://lcamtuf.substack.com/i/166337096?img=https%3A%2F%2Fsubstack-post-media.s3.amazonaws.com%2Fpublic%2Fimages%2F189a88f7-4410-4c63-98ab-124c517a59e4_1111x237.jpeg&quot;,&quot;isProcessing&quot;:false,&quot;align&quot;:null,&quot;offset&quot;:false}" class="sizing-normal" alt="" srcset="https://substackcdn.com/image/fetch/$s_!Bs8L!,w_424,c_limit,f_auto,q_auto:good,fl_progressive:steep/https%3A%2F%2Fsubstack-post-media.s3.amazonaws.com%2Fpublic%2Fimages%2F189a88f7-4410-4c63-98ab-124c517a59e4_1111x237.jpeg 424w, https://substackcdn.com/image/fetch/$s_!Bs8L!,w_848,c_limit,f_auto,q_auto:good,fl_progressive:steep/https%3A%2F%2Fsubstack-post-media.s3.amazonaws.com%2Fpublic%2Fimages%2F189a88f7-4410-4c63-98ab-124c517a59e4_1111x237.jpeg 848w, https://substackcdn.com/image/fetch/$s_!Bs8L!,w_1272,c_limit,f_auto,q_auto:good,fl_progressive:steep/https%3A%2F%2Fsubstack-post-media.s3.amazonaws.com%2Fpublic%2Fimages%2F189a88f7-4410-4c63-98ab-124c517a59e4_1111x237.jpeg 1272w, https://substackcdn.com/image/fetch/$s_!Bs8L!,w_1456,c_limit,f_auto,q_auto:good,fl_progressive:steep/https%3A%2F%2Fsubstack-post-media.s3.amazonaws.com%2Fpublic%2Fimages%2F189a88f7-4410-4c63-98ab-124c517a59e4_1111x237.jpeg 1456w" sizes="100vw" loading="lazy">

](https://substackcdn.com/image/fetch/$s_!Bs8L!,f_auto,q_auto:good,fl_progressive:steep/https://substack-post-media.s3.amazonaws.com/public/images/189a88f7-4410-4c63-98ab-124c517a59e4_1111x237.jpeg)

[Subscribe now](https://lcamtuf.substack.com/subscribe?)