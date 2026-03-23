+++
title = "std::ranges may not deliver the performance that you expect"
description = '<img width="150" height="150" src="https://lemire.me/blog/wp-content/uploads/2025/10/Capture-decran-le-2025-10-05-a-17.34.45-150x150.png" class="webfeedsFeaturedVisual wp-post-image" alt="" style="display: block; margin-bottom: 5px; clear:both;max-width: 100%;" link_thumbnail="" '
date = "2025-10-05T21:35:07Z"
url = "https://lemire.me/blog/2025/10/05/stdranges-may-not-deliver-the-performance-that-you-expect/"
author = "Daniel Lemire"
text = ""
lastupdated = "2026-03-19T16:26:22.851135728Z"
seen = false
+++

<img width="150" height="150" src="https://lemire.me/blog/wp-content/uploads/2025/10/Capture-decran-le-2025-10-05-a-17.34.45-150x150.png" class="webfeedsFeaturedVisual wp-post-image" alt="" style="display: block; margin-bottom: 5px; clear:both;max-width: 100%;" link_thumbnail="" decoding="async" loading="lazy">

Good engineers seek software code that is ‘simple’ in the sense that we can read and understand it quickly. But they they also look for highly performant code.

For the last 20 years, we have been offering programmers the possibility to replace conventional for loops with a more functional approach. To illustrate, suppose that you want to extract all even integers from a container and create a new container. In conventional C++, you would proceed with a loop, as follows.

```
std::vector<int> even_numbers;
for (int n : numbers) {
  if (n % 2 == 0) {
    even_numbers.push_back(n);
  }
}
```

In recent versions of C++, we have std::ranges which allows us to rewrite the code without a for loop.

```
auto even_numbers = numbers
    | std::views::filter([](int n) { return n % 2 == 0; })
    | std::ranges::to<std::vector>();

```

The magic underneath is that the filter is lazy, it does not go through the whole input and generate a temporary result before passing it out. This allows you to pipe a whole lot of transformations, one after the other. You can also sum up the results, and, in the near future, we are even getting parallel execution. One could probably write a whole book on std::ranges and maybe someone did.

C++ is not at all unique in this respect. Even Java has been offering similar constructs for many years.

The principle underneath abstractions like std::ranges is that we get the full performance without compromise. Sadly such promises should be taken with caution.

I gave a talk at a local C++ company this week. One of the questions I was asked was about the performance overhead of C++ ranges. When they switched their compiler to C++20, some engineers tried out std::ranges and triggered performance degradation.

Within our fast C++ JSON parser (simdjson), we have, thus far, limited std::ranges support to specific portions of the library… not because we could not make it work, but because it led to performance degradation. To be clear, I am confident that we will make it work, but it is not trivial. Importantly, we benchmarked the code before releasing it.

To illustrate the potential performance pitfalls, I picked the first example I found online: how to trim the spaces at the beginning and at the end of a string.

```
s | std::views::drop_while(is_space)
                    | std::views::reverse
                    | std::views::drop_while(is_space)
                    | std::views::reverse;
```

This C++ code snippet processes a string s to trim whitespace characters from both ends without modifying the original string, returning a lazy view of the trimmed result. It begins by applying std::views::drop\_while(is\_space) to remove any leading whitespace. Then, std::views::reverse inverts the remaining content, transforming the original trailing whitespace into leading whitespace. Next, another std::views::drop\_while(is\_space) discards this new leading whitespace (effectively the original trailing part), and a final std::views::reverse restores the original order.

To be clear, that is just one way to get the job done with std::ranges, I just happened to pick it because it is what I first found online. Instead of this functional code, we can use a messier looking approach with two loops.

```
while (!input.empty() &&
         is_space(input.front())) {
    input.remove_prefix(1);
}
while (!input.empty() && is_space(input.back())) {
    input.remove_suffix(1);
}

```

So how does the performance vary? [I wrote a benchmark to compare these functions](https://github.com/lemire/Code-used-on-Daniel-Lemire-s-blog/blob/master/2025/10/05/README.md). I use random strings that do not contain spaces. I record the number of instructions required per string processed. I use two distinct C++ compilers and two distinct processors.

|  function  |LLVM 17/Apple M4|GCC 15/Intel IceLake|
|------------|----------------|--------------------|
|std::ranges |       24       |         70         |
|conventional|       18       |         16         |

In my case, I find that the conventional function is faster as it generates fewer instructions. In the case of GCC, the difference is large. [You can look at how GCC compiles these functions if you are interested](https://godbolt.org/z/dazWEn1cT).

Does it mean that std::ranges are a bad idea or that they are poorly designed? No. It means that there is no magical faeries giving you the best performance out of the box. Use std::ranges, but benchmark, benchmark and benchmark again.