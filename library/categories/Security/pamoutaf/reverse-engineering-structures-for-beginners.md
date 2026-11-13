+++
title = "Reverse engineering structures for beginners"
description = "This is something I always found voodoo, figuring out how to recognize structures in decompiled binary code. Table of contents Introduction A struct is a data structure in C/C++ that groups variables of different types. I will be using BinaryNinja in this demonstration. I chose l"
date = "2025-10-16T21:12:45Z"
url = "https://p0pcycle.com/2025/10/16/reverse-engineering-structs-for-beginners/"
author = "P0pcycle"
text = ""
lastupdated = "2026-11-12T00:42:28.169594142Z"
seen = true
+++

This is something I always found voodoo, figuring out how to recognize structures in decompiled binary code.

**Table of contents**

1. [Introduction](https://p0pcycle.com/2025/10/16/reverse-engineering-structs-for-beginners/#introduction)
2. [Inspecting the inflatePrime() function](https://p0pcycle.com/2025/10/16/reverse-engineering-structs-for-beginners/#inspecting-the-inflateprime-function)
3. [Recognizable struct patterns](https://p0pcycle.com/2025/10/16/reverse-engineering-structs-for-beginners/#recognizable-struct-patterns)
4. [Creating the structures](https://p0pcycle.com/2025/10/16/reverse-engineering-structs-for-beginners/#creating-the-structures)
5. [Comparing with original code](https://p0pcycle.com/2025/10/16/reverse-engineering-structs-for-beginners/#comparing-with-original-code)
6. [Note on alignment and padding](https://p0pcycle.com/2025/10/16/reverse-engineering-structs-for-beginners/#note-on-alignment-and-padding)

##### Introduction #####

A struct is a data structure in C/C++ that groups variables of different types.

I will be using BinaryNinja in this demonstration.

<img data-recalc-dims="1" loading="lazy" decoding="async" width="1024" height="1024" data-attachment-id="711" data-permalink="https://p0pcycle.com/2025/10/16/reverse-engineering-structs-for-beginners/binja-2/" data-orig-file="https://i0.wp.com/p0pcycle.com/wp-content/uploads/2025/10/binja-1.png?fit=1024%2C1024&amp;ssl=1" data-orig-size="1024,1024" data-comments-opened="1" data-image-title="binja" data-image-description="" data-image-caption="" data-large-file="https://i0.wp.com/p0pcycle.com/wp-content/uploads/2025/10/binja-1.png?fit=1024%2C1024&amp;ssl=1" src="https://i0.wp.com/p0pcycle.com/wp-content/uploads/2025/10/binja-1.png?resize=1024%2C1024&amp;ssl=1" alt="" class="wp-image-711" style="width:94px;height:auto">

I chose **libz.1.3.1.dylib** and also had access to the source code via [https://github.com/madler/zlib/blob/develop/inflate.c](https://github.com/madler/zlib/blob/develop/inflate.c).

We are going to be working with a 64-bit library, so a pointer is 8 bytes, `uint64_t` is 8 bytes, and a `uint32_t` is 4 bytes.

```
file libz.dylib 
libz.dylib: Mach-O 64-bit dynamically linked shared library arm64
```

##### Inspecting the inflatePrime() function #####

I chose (randomly) the inflatePrime function from the inflate.c file. The structure definitions are going to be in the inflate.h header file.

**Decompiled code**

<img data-recalc-dims="1" loading="lazy" decoding="async" width="1680" height="1102" data-attachment-id="714" data-permalink="https://p0pcycle.com/2025/10/16/reverse-engineering-structs-for-beginners/image-59/" data-orig-file="https://i0.wp.com/p0pcycle.com/wp-content/uploads/2025/10/image.png?fit=1680%2C1102&amp;ssl=1" data-orig-size="1680,1102" data-comments-opened="1" data-image-title="image" data-image-description="" data-image-caption="" data-large-file="https://i0.wp.com/p0pcycle.com/wp-content/uploads/2025/10/image.png?fit=1024%2C672&amp;ssl=1" src="https://i0.wp.com/p0pcycle.com/wp-content/uploads/2025/10/image.png?resize=1680%2C1102&amp;ssl=1" alt="" class="wp-image-714">

This decompiled code looks complicated, with lots of memory offset access, and many variables that are just making comprehension of what is going on more difficult. So to clean it up we will identify structures and create them using the correct struct members and offsets.

##### Recognizable struct patterns #####

Let’s start by pointing out some recognizable struct patterns.

```
void* x8_1 = *(uint64_t*)((char*)arg1 + 0x38);
```

*“Go to the memory address (arg1 + 0x38 bytes), read the 8 bytes stored there, and return that 8-byte value as a number.”* → Later on, we will uncover that the 8 bytes value is actually an address to another structure ![👀](https://s.w.org/images/core/emoji/17.0.2/72x72/1f440.png).

`Arg1` is a pointer to something (could be a structure or just a buffer). The fact that we have a fixed offset memory access like + `0x38` is already a hint that we are looking at a structure member.

Additionally, compilers refer to fields inside structs using fixed offsets after layout is decided. If we keep reading the code, we also notice how there are multiple consistent offsets (`0x38`, `0x50`, `0x58`), which could also suggest a defined memory layout, just like struct members.

**A structure in C**

```
struct Example {
    int a;         // offset 0x00
    char b[4];     // offset 0x04
    void *ptr;     // offset 0x08
};
```

**Decompiled**

```
*(int*)((char*)arg1 + 0x00)     // member 'a'
*(char*)((char*)arg1 + 0x04)    // member 'b'
*(uint64_t*)((char*)arg1 + 0x08) // member 'ptr'
```

If we return to the block of code (*I renamed` x8_1 `to `ptr_Struct`*), we can see the same pattern we noticed earlier. So it seems as though `ptr_Struct` points to another structure!

<img data-recalc-dims="1" loading="lazy" decoding="async" width="1008" height="700" data-attachment-id="723" data-permalink="https://p0pcycle.com/2025/10/16/reverse-engineering-structs-for-beginners/screenshot-2025-10-16-at-14-41-26/" data-orig-file="https://i0.wp.com/p0pcycle.com/wp-content/uploads/2025/10/screenshot-2025-10-16-at-14.41.26.png?fit=1008%2C700&amp;ssl=1" data-orig-size="1008,700" data-comments-opened="1" data-image-title="Screenshot 2025-10-16 at 14.41.26" data-image-description="" data-image-caption="" data-large-file="https://i0.wp.com/p0pcycle.com/wp-content/uploads/2025/10/screenshot-2025-10-16-at-14.41.26.png?fit=1008%2C700&amp;ssl=1" src="https://i0.wp.com/p0pcycle.com/wp-content/uploads/2025/10/screenshot-2025-10-16-at-14.41.26.png?resize=1008%2C700&amp;ssl=1" alt="" class="wp-image-723">

##### Creating the structures #####

Let’s then create two structs. One for `arg1`, and one for `ptr_Struct`.

Create `struct_1` of size `0x40`, because at offset `0x38` is our pointer to `struct_2`, and a struct pointer is `8 bytes`, so `0x40` (`0x38 = 56 bytes ; 0x40 = 64 bytes`).

<img data-recalc-dims="1" loading="lazy" decoding="async" width="1028" height="402" data-attachment-id="726" data-permalink="https://p0pcycle.com/2025/10/16/reverse-engineering-structs-for-beginners/image-61/" data-orig-file="https://i0.wp.com/p0pcycle.com/wp-content/uploads/2025/10/image-1-1.png?fit=1028%2C402&amp;ssl=1" data-orig-size="1028,402" data-comments-opened="1" data-image-title="image" data-image-description="" data-image-caption="" data-large-file="https://i0.wp.com/p0pcycle.com/wp-content/uploads/2025/10/image-1-1.png?fit=1024%2C400&amp;ssl=1" src="https://i0.wp.com/p0pcycle.com/wp-content/uploads/2025/10/image-1-1.png?resize=1028%2C402&amp;ssl=1" alt="" class="wp-image-726">

In `struct_2`, we know that we have a uint32\_t at offset `0x58`, so adding 4 bytes (`sizeof(uint32_t)`) we have a struct size of `0x5c`. We don’t specifically know the actual size of `struct_2`, but for now we can guess that it will be `0x5c`, and we can always adjust it later on if needed.

<img data-recalc-dims="1" loading="lazy" decoding="async" width="1034" height="412" data-attachment-id="748" data-permalink="https://p0pcycle.com/2025/10/16/reverse-engineering-structs-for-beginners/image-67/" data-orig-file="https://i0.wp.com/p0pcycle.com/wp-content/uploads/2025/10/image-1-7.png?fit=1034%2C412&amp;ssl=1" data-orig-size="1034,412" data-comments-opened="1" data-image-title="image" data-image-description="" data-image-caption="" data-large-file="https://i0.wp.com/p0pcycle.com/wp-content/uploads/2025/10/image-1-7.png?fit=1024%2C408&amp;ssl=1" src="https://i0.wp.com/p0pcycle.com/wp-content/uploads/2025/10/image-1-7.png?resize=1034%2C412&amp;ssl=1" alt="" class="wp-image-748"> <img data-recalc-dims="1" loading="lazy" decoding="async" width="530" height="172" data-attachment-id="728" data-permalink="https://p0pcycle.com/2025/10/16/reverse-engineering-structs-for-beginners/image-62/" data-orig-file="https://i0.wp.com/p0pcycle.com/wp-content/uploads/2025/10/image-1-2.png?fit=530%2C172&amp;ssl=1" data-orig-size="530,172" data-comments-opened="1" data-image-title="image" data-image-description="" data-image-caption="" data-large-file="https://i0.wp.com/p0pcycle.com/wp-content/uploads/2025/10/image-1-2.png?fit=530%2C172&amp;ssl=1" src="https://i0.wp.com/p0pcycle.com/wp-content/uploads/2025/10/image-1-2.png?resize=530%2C172&amp;ssl=1" alt="" class="wp-image-728" style="width:270px;height:auto">

We add padding until offset `0x38`, because we don’t know yet what will reside in this struct, but we do know that at offset `0x38` we have a pointer to another struct.

In our `struct_2`, we know we have two members, one `uint64_t` at offset `0x50`, and one `uint32_t` at offset `0x58`.

<img data-recalc-dims="1" loading="lazy" decoding="async" width="436" height="202" data-attachment-id="731" data-permalink="https://p0pcycle.com/2025/10/16/reverse-engineering-structs-for-beginners/image-64/" data-orig-file="https://i0.wp.com/p0pcycle.com/wp-content/uploads/2025/10/image-1-4.png?fit=436%2C202&amp;ssl=1" data-orig-size="436,202" data-comments-opened="1" data-image-title="image" data-image-description="" data-image-caption="" data-large-file="https://i0.wp.com/p0pcycle.com/wp-content/uploads/2025/10/image-1-4.png?fit=436%2C202&amp;ssl=1" src="https://i0.wp.com/p0pcycle.com/wp-content/uploads/2025/10/image-1-4.png?resize=436%2C202&amp;ssl=1" alt="" class="wp-image-731" style="width:231px;height:auto">

Now that we’ve created our two structs, our code looks a lot cleaner !

<img data-recalc-dims="1" loading="lazy" decoding="async" width="2082" height="1372" data-attachment-id="733" data-permalink="https://p0pcycle.com/2025/10/16/reverse-engineering-structs-for-beginners/screenshot-2025-10-16-at-23-00-12/" data-orig-file="https://i0.wp.com/p0pcycle.com/wp-content/uploads/2025/10/screenshot-2025-10-16-at-23.00.12.png?fit=2082%2C1372&amp;ssl=1" data-orig-size="2082,1372" data-comments-opened="1" data-image-title="Screenshot 2025-10-16 at 23.00.12" data-image-description="" data-image-caption="" data-large-file="https://i0.wp.com/p0pcycle.com/wp-content/uploads/2025/10/screenshot-2025-10-16-at-23.00.12.png?fit=1024%2C675&amp;ssl=1" src="https://i0.wp.com/p0pcycle.com/wp-content/uploads/2025/10/screenshot-2025-10-16-at-23.00.12.png?resize=2082%2C1372&amp;ssl=1" alt="" class="wp-image-733">

Over time, you will be able to understand what each struct member does, and you will be able to rename them appropriately. I didn’t do it here because the purpose of this exercise was first to understand what a struct looks like in a decompiled code.

Here is a visual layout showing how `arg1` at offset `0x38` contains another pointer to struct\_2.

<img data-recalc-dims="1" loading="lazy" decoding="async" width="1920" height="1080" data-attachment-id="743" data-permalink="https://p0pcycle.com/2025/10/16/reverse-engineering-structs-for-beginners/untitled-october-16-2025-23-49-3/" data-orig-file="https://i0.wp.com/p0pcycle.com/wp-content/uploads/2025/10/untitled-october-16-2025-23.49-3.jpg?fit=1920%2C1080&amp;ssl=1" data-orig-size="1920,1080" data-comments-opened="1" data-image-title="Untitled &amp;#8211; October 16, 2025 23.49 3" data-image-description="" data-image-caption="" data-large-file="https://i0.wp.com/p0pcycle.com/wp-content/uploads/2025/10/untitled-october-16-2025-23.49-3.jpg?fit=1024%2C576&amp;ssl=1" src="https://i0.wp.com/p0pcycle.com/wp-content/uploads/2025/10/untitled-october-16-2025-23.49-3.jpg?resize=1920%2C1080&amp;ssl=1" alt="" class="wp-image-743">

##### **Comparing with original code** #####

<img data-recalc-dims="1" loading="lazy" decoding="async" width="1152" height="658" data-attachment-id="746" data-permalink="https://p0pcycle.com/2025/10/16/reverse-engineering-structs-for-beginners/image-66/" data-orig-file="https://i0.wp.com/p0pcycle.com/wp-content/uploads/2025/10/image-1-6.png?fit=1152%2C658&amp;ssl=1" data-orig-size="1152,658" data-comments-opened="1" data-image-title="image" data-image-description="" data-image-caption="" data-large-file="https://i0.wp.com/p0pcycle.com/wp-content/uploads/2025/10/image-1-6.png?fit=1024%2C585&amp;ssl=1" src="https://i0.wp.com/p0pcycle.com/wp-content/uploads/2025/10/image-1-6.png?resize=1152%2C658&amp;ssl=1" alt="" class="wp-image-746">

By comparing our decompiled code, we notice **z\_streamp** **strm** as our arg1, which in the zlib manual is a pointer to **struct z\_stream\_s**.

```
typedef struct z_stream_s {
[...]
    struct internal_state FAR *state; /* not visible by applications */
[...]
} z_stream;

typedef z_stream FAR *z_streamp;
```

So, in the function defintion of `int ZEXPORT inflatePrime(z_streamp strm, int bits, int value)`, the **`z_streamp`** argument can be written as `int` `ZEXPORT inflateInit(**struct z_stream_s** *strm, int bits, int value)`;

##### Note on alignment and padding #####

Compilers sometimes add extra “padding” bytes between struct members to make data align better in memory. This means that the offsets you see in a binary might not exactly match the sizes of the fields you expect. Knowing this can help you accurately map memory when reverse engineering.

```
struct Example {
    char a;   // 1 byte
    int b;    // 4 bytes
};
```

```
Address:  0x00   0x01  0x02  0x03  0x04  0x05  0x06  0x07
Field:     a     pad   pad   pad    b    b    b    b
```