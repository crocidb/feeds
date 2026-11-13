+++
title = "Stack canaries – Quack Quack"
description = "This is a challenge from the Hack The Box cyber apocalypse CTF (2025). The goal of this challenge is to exploit a stack overflow. However, this binary has stack canaries protection so we need to leak the canary in order to avoid this : Stack canaries Stack canaries were implement"
date = "2025-10-31T15:46:00Z"
url = "https://p0pcycle.com/2025/10/31/stack-canaries-quack-quack/"
author = "P0pcycle"
text = ""
lastupdated = "2026-11-12T00:42:28.167859919Z"
seen = true
+++

This is a challenge from the Hack The Box cyber apocalypse CTF (2025).

The goal of this challenge is to exploit a stack overflow. However, this binary has stack canaries protection so we need to leak the canary in order to avoid this :

<img data-recalc-dims="1" loading="lazy" decoding="async" width="552" height="53" data-attachment-id="775" data-permalink="https://p0pcycle.com/2025/10/31/stack-canaries-quack-quack/image12-2/" data-orig-file="https://i0.wp.com/p0pcycle.com/wp-content/uploads/2025/10/image12-1.png?fit=552%2C53&amp;ssl=1" data-orig-size="552,53" data-comments-opened="1" data-image-title="image12" data-image-description="" data-image-caption="" data-large-file="https://i0.wp.com/p0pcycle.com/wp-content/uploads/2025/10/image12-1.png?fit=552%2C53&amp;ssl=1" src="https://i0.wp.com/p0pcycle.com/wp-content/uploads/2025/10/image12-1.png?resize=552%2C53&amp;ssl=1" alt="" class="wp-image-775">

##### Stack canaries #####

Stack canaries were implemented to prevent buffer overflow attacks. The way it works is a random value is placed on the stack and assigned to a variable. This value changes every time the program starts, so it will always be different. At the end of the function, that value is compared to the initial value, and if it’s the same, then the function will return.

```
int main(){
    uint64_t canary = *(uint64_t*)((char*)fbase + 0x28)
    [function does stuff]
    if (canary == *(uint64_t*)((char*)fbase + 0x28))
        return [something]
}
```

Another thing to know about stack canaries is that they are a 8 bytes and end in 00. Binaries on Linux are usually little-endian so we would start by reading the 00 and then the rest of the bytes.

Example:

```
Big endian     0xc5 30 e6 da 6f ff 6e 00
Little endian  0x00 6e ff 6f da e6 30 c5
```

We can say that the stack canaries are then 7 bytes long and null terminated. This makes them easier to spot in, for example, a pwndbg dump. However, this also means that if you try to read the canary with any sort of string function (printf, strcpy, strlen), it will stop at the first occurrence of a null-terminated string. Later on I will explain how we can circumvent this issue.

##### Leak the canary #####

First we need to leak the canary.

Analysing the code, we see that we are required to enter up to 0x66 (102) bytes into buf. Then, it’s performing a string search of the string “Quack Quack ” in *all* of our input. That means we can write AAAAQuack Quack AAA and we will satisfy the `if` condition.

<img data-recalc-dims="1" loading="lazy" decoding="async" width="669" height="353" data-attachment-id="780" data-permalink="https://p0pcycle.com/2025/10/31/stack-canaries-quack-quack/image10-copy/" data-orig-file="https://i0.wp.com/p0pcycle.com/wp-content/uploads/2025/10/image10-copy.png?fit=669%2C353&amp;ssl=1" data-orig-size="669,353" data-comments-opened="1" data-image-title="image10 copy" data-image-description="" data-image-caption="" data-large-file="https://i0.wp.com/p0pcycle.com/wp-content/uploads/2025/10/image10-copy.png?fit=669%2C353&amp;ssl=1" src="https://i0.wp.com/p0pcycle.com/wp-content/uploads/2025/10/image10-copy.png?resize=669%2C353&amp;ssl=1" alt="" class="wp-image-780">

This is where we have to start paying attention. As you notice on the above image, we have a printf which will print a string as of `rax_1[0x20]` until it meets a null byte. Reminder that `strstr` returns a pointer to the beginning of the substring, or `NULL` if the substring is not found.

This is where we will be able to leak the canary. Basically, we can ensure to have our `strstr` pointer point right next to the value of the canary (in memory). Once we have that set-up, we will start reading as of `rax_1[0x20]` (`rax_1[32]`).

<img data-recalc-dims="1" loading="lazy" decoding="async" width="1255" height="706" data-attachment-id="798" data-permalink="https://p0pcycle.com/buffer-drawing-2/" data-orig-file="https://i0.wp.com/p0pcycle.com/wp-content/uploads/2025/10/buffer-drawing-edited.png?fit=1255%2C706&amp;ssl=1" data-orig-size="1255,706" data-comments-opened="1" data-image-title="buffer drawing" data-image-description="" data-image-caption="" data-large-file="https://i0.wp.com/p0pcycle.com/wp-content/uploads/2025/10/buffer-drawing-edited.png?fit=1024%2C576&amp;ssl=1" src="https://i0.wp.com/p0pcycle.com/wp-content/uploads/2025/10/buffer-drawing-edited.png?resize=1255%2C706&amp;ssl=1" alt="" class="wp-image-798">

In order to circumvent the string termination issue, we can make sure that our `rax_1[0x20]` starts reading one byte into the canary. To do that, we simply add one more byte to our buffer of A’s to perfectly place the `rax_1` pointer and overwrite the null byte of the canary.

<img data-recalc-dims="1" loading="lazy" decoding="async" width="600" height="243" data-attachment-id="799" data-permalink="https://p0pcycle.com/2025/10/31/stack-canaries-quack-quack/image-72/" data-orig-file="https://i0.wp.com/p0pcycle.com/wp-content/uploads/2025/10/image-6.png?fit=600%2C243&amp;ssl=1" data-orig-size="600,243" data-comments-opened="1" data-image-title="image" data-image-description="" data-image-caption="" data-large-file="https://i0.wp.com/p0pcycle.com/wp-content/uploads/2025/10/image-6.png?fit=600%2C243&amp;ssl=1" src="https://i0.wp.com/p0pcycle.com/wp-content/uploads/2025/10/image-6.png?resize=600%2C243&amp;ssl=1" alt="" class="wp-image-799">Realistic visualization of our buffer & canary in memory

We inspect the `rsi` register because that is where our values are stored.

Cool, let’s make a script to retrieve this shall we?

```
with conn() as p:

    buf = b'A' * (101 - len('Quack Quack '))

    p.sendlineafter(b'> ', buf + b'Quack Quack ')
    p.recvuntil(b'Quack Quack ')
    canary = u64(p.recv(7).rjust(8, b'\0'))
    print(hex(canary))
```

If you’ve noticed this line `canary = u64(p.recv(7).rjust(8, b'\0'))`, this is basically because we are unpacking `7 bytes` but `u64` needs to be aligned so we need to unpack `8 bytes`. This is fine, we can use rjust (adjust to the right), which will add ‘0’ byte until it reaches the size of `8 bytes`. In this case, it will only add one `0 byte`. If you’ve noticed, this is also the byte that we truncated when we calculated the size of `buff`.

<img data-recalc-dims="1" loading="lazy" decoding="async" width="475" height="66" data-attachment-id="806" data-permalink="https://p0pcycle.com/2025/10/31/stack-canaries-quack-quack/image-75/" data-orig-file="https://i0.wp.com/p0pcycle.com/wp-content/uploads/2025/10/image-9.png?fit=475%2C66&amp;ssl=1" data-orig-size="475,66" data-comments-opened="1" data-image-title="image" data-image-description="" data-image-caption="" data-large-file="https://i0.wp.com/p0pcycle.com/wp-content/uploads/2025/10/image-9.png?fit=475%2C66&amp;ssl=1" src="https://i0.wp.com/p0pcycle.com/wp-content/uploads/2025/10/image-9.png?resize=475%2C66&amp;ssl=1" alt="" class="wp-image-806">

For the second vulnerability, we have a classic stack buffer overflow where we can overwrite the return address to the `duck_attack` function, which will print the flag. This is called a ret2win.

On the second read, we can read `0x6a bytes` (106 decimal).  
If we calculate how far the canary is on the second read call, we count `0x58 bytes`.  
Soooo, we can see this in the stack view in Binja:

<img data-recalc-dims="1" loading="lazy" decoding="async" width="1197" height="673" data-attachment-id="810" data-permalink="https://p0pcycle.com/image-77/" data-orig-file="https://i0.wp.com/p0pcycle.com/wp-content/uploads/2025/10/image-10-edited.png?fit=1197%2C673&amp;ssl=1" data-orig-size="1197,673" data-comments-opened="1" data-image-title="image" data-image-description="" data-image-caption="" data-large-file="https://i0.wp.com/p0pcycle.com/wp-content/uploads/2025/10/image-10-edited.png?fit=1024%2C576&amp;ssl=1" src="https://i0.wp.com/p0pcycle.com/wp-content/uploads/2025/10/image-10-edited.png?resize=1197%2C673&amp;ssl=1" alt="" class="wp-image-810">

We can see here we have `0x58 bytes` (88 decimal) before we need to put the stack canary back, and then we have to overwrite the rbp and then we can overwrite the return address. So that means we need `0x58 bytes` of A, then canary, then 8 bytes for the rbp and then when can finally overwrite the return address, so then we add the `duck_attack` symbol (classic ret2win).

```
buff2 = b'A' * 0x58
overwrite_rbp = b'A' * 8

payload = flat([buff2, canary, overwrite_rbp, elf.symbols.duck_attack])
```

<img data-recalc-dims="1" loading="lazy" decoding="async" width="810" height="88" data-attachment-id="819" data-permalink="https://p0pcycle.com/2025/10/31/stack-canaries-quack-quack/image-79/" data-orig-file="https://i0.wp.com/p0pcycle.com/wp-content/uploads/2025/10/image-12.png?fit=810%2C88&amp;ssl=1" data-orig-size="810,88" data-comments-opened="1" data-image-title="image" data-image-description="" data-image-caption="" data-large-file="https://i0.wp.com/p0pcycle.com/wp-content/uploads/2025/10/image-12.png?fit=810%2C88&amp;ssl=1" src="https://i0.wp.com/p0pcycle.com/wp-content/uploads/2025/10/image-12.png?resize=810%2C88&amp;ssl=1" alt="" class="wp-image-819">We successfully overwrote the return address

Running the script, we see we retrieve the flag (I created a test flag for this challenge as this did not come with one).

<img data-recalc-dims="1" loading="lazy" decoding="async" width="584" height="172" data-attachment-id="812" data-permalink="https://p0pcycle.com/2025/10/31/stack-canaries-quack-quack/image-78/" data-orig-file="https://i0.wp.com/p0pcycle.com/wp-content/uploads/2025/10/image-11.png?fit=584%2C172&amp;ssl=1" data-orig-size="584,172" data-comments-opened="1" data-image-title="image" data-image-description="" data-image-caption="" data-large-file="https://i0.wp.com/p0pcycle.com/wp-content/uploads/2025/10/image-11.png?fit=584%2C172&amp;ssl=1" src="https://i0.wp.com/p0pcycle.com/wp-content/uploads/2025/10/image-11.png?resize=584%2C172&amp;ssl=1" alt="" class="wp-image-812">