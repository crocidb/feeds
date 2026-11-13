+++
title = "Shellcoding like a pro"
description = "I went on a small pwning adventure. The course has different modules on program security, and the first module is shellcoding. I’ve always tried to stay away from assembly and shellcoding. I’ve only done one challenge before (refer to a previous blogpost). I remember the first ti"
date = "2025-11-24T12:59:22Z"
url = "https://p0pcycle.com/2025/11/24/shellcoding-like-a-pro/"
author = "P0pcycle"
text = ""
lastupdated = "2026-11-12T00:42:28.164704893Z"
seen = true
+++

I went on a small pwning adventure. The course has different modules on program security, and the first module is shellcoding.

I’ve always tried to stay away from assembly and shellcoding. I’ve only done one challenge before (refer to a previous [blogpost](https://p0pcycle.com/2025/09/24/encode-decode-shellcode-htb-execute/)). I remember the first time I had to do this challenge with no prior knowledge of assembly & shellcoding, I couldn’t understand shit. I ended up abandoning it.

Then I did a couple of ROP challenges, and got more familiar with ASM due to having to use gadgets and storing values in the correct registers. This helped me over time understand shellcoding a lot better.

Fast forward a few months, and eventually I try the shellcoding challenge again, and everything was clear to me. I knew about instructions, registers, etc. Eventually I figured out how to solve that challenge and I was super happy.

Fast forward a few months and here’s me starting this shellcoding challenge. I was like, ok, module 1, challenge 1, should be easy, right? Right?????? Well, it took me like 3 days to solve it…

I remember thinking “I will **NOT** use AI for this, I will work hard, I will take the struggles & the grind and turn it into skills”. Two days go by, and I am hopeless. I thought “fine I will try to debug with AI”, but it wasn’t helping me. We could say it was a skill issue on my side, but yeah ChatGPT was unable to help me solve this challenge (I feel useful again).

**Table of contents**

1. [The challenge](https://p0pcycle.com/2025/11/24/shellcoding-like-a-pro/#the-challenge)
2. [The first mistake](https://p0pcycle.com/2025/11/24/shellcoding-like-a-pro/#the-first-mistake)
3. [Moving values to the stack](https://p0pcycle.com/2025/11/24/shellcoding-like-a-pro/#moving-values-to-stack)
4. [Moving imm64 doesn’t work](https://p0pcycle.com/2025/11/24/shellcoding-like-a-pro/#moving-imm64-doesn-t-work)
5. [A byte budget](https://p0pcycle.com/2025/11/24/shellcoding-like-a-pro/#a-byte-budget)
6. [Living off the land](https://p0pcycle.com/2025/11/24/shellcoding-like-a-pro/#living-off-the-land)

##### The challenge #####

The challenge required us to produce shellcode that avoided a certain byte. It took me a while to figure out that certain registers & instructions caused that byte.

##### The first mistake #####

My first big mistake was that I was using syscalls for 32 bit ABI instead of 64 bit ABI…![🤦🏻‍♀️](https://s.w.org/images/core/emoji/17.0.2/72x72/1f926-1f3fb-200d-2640-fe0f.png) You can verify these values with [https://syscall.sh/](https://syscall.sh/).

x86-64

|NR |SYSCALL NAME|references|RAX|  ARG0 (rdi)   |ARG1 (rsi)| ARG2 (rdx)  |
|---|------------|----------|---|---------------|----------|-------------|
| 0 |    read    | man/ cs/ | 0 |unsigned int fd|char \*buf|size\_t count|

x86

|NR |SYSCALL NAME|references|RAX|  ARG0 (ebx)   |ARG1 (ecx)| ARG2 (edx)  |
|---|------------|----------|---|---------------|----------|-------------|
| 3 |    read    | man/ cs/ | 3 |unsigned int fd|char \*buf|size\_t count|

I was trying to do a open, read, write shellcode. I ended up going with a shorter shellcode and just doing a chmod of the flag, since the flag was read-only by the root user.

##### Moving values to the stack #####

```
    mov dword [rsp], 0x616C662F  ; alf/
    mov dword [rsp+4], 0x00000067 ; g
    push rsp
    pop rdi
```

I learned that I could MOV values on the stack by moving the little endian hex value of my string into [rsp] (instead of using tricks like .data db string: “string”, 0). Brackets mean “memory access.” The brackets `[]` are used to dereference the register, meaning the instruction accesses the value stored at the memory address that RSP points to.

```
mov  rdx, 0x67616c662f        RDX => 0x67616c662f
mov  qword ptr [rsp], rdx    [0x7fffffffe840] <= 0x67616c662f
```

Notice here that we don’t modify the address of RSP, but the value stored at address of RSP, i.e. `0x7fffffffe840`.

##### Moving imm64 doesn’t work #####

I want to go over something I ran into and couldn’t figure out what the rule was for a long time. I couldn’t understand why I couldn’t just MOV my whole string of 5 bytes in [rsp]. I kept thinking “it should work, it’s \<= 8 bytes”, but I kept getting errors of data exceeding bounds and immediate exceeding bounds.

```
cat chmod.s        
    mov qword [rsp], 0x67616C662F ; galf/
```

```
chmod.s:6: warning: signed dword immediate exceeds bounds [-w+number-overflow]
chmod.s:6: warning: dword data exceeds bounds [-w+number-overflow]
```

>
>
>
>
>

I kept trying to build my flag in one go, because I figured rsp is 64 bit register, I’m moving a 5 byte value, should work right? No.

>
>
> 64-bit mode doesn’t allow 64-bit encoding of immediates – [NASM forum](https://forum.nasm.us/index.php?topic=2502.0&utm_source=chatgpt.com)
>
>

“But, I’ve moved 64-bit values into other registers before !!” I thought.

>
>
>  […] except for MOV-ing to a 64-bit register. 
>
>

<img data-recalc-dims="1" loading="lazy" decoding="async" width="1368" height="200" data-attachment-id="897" data-permalink="https://p0pcycle.com/2025/11/24/shellcoding-like-a-pro/image-89/" data-orig-file="https://i0.wp.com/p0pcycle.com/wp-content/uploads/2025/11/image-9.png?fit=1368%2C200&amp;ssl=1" data-orig-size="1368,200" data-comments-opened="1" data-image-title="image" data-image-description="" data-image-caption="" data-large-file="https://i0.wp.com/p0pcycle.com/wp-content/uploads/2025/11/image-9.png?fit=1024%2C150&amp;ssl=1" src="https://i0.wp.com/p0pcycle.com/wp-content/uploads/2025/11/image-9.png?resize=1368%2C200&amp;ssl=1" alt="" class="wp-image-897">

*source: Intel® 64 and IA-32 Architectures, Software Developer’s Manual  
Combined Volumes:  
1, 2A, 2B, 2C, 2D, 3A, 3B, 3C, 3D, and 4  
Page Vol. 2B 4-28*

Yes I pulled out the Intel manual. Here is proof that we cannot move an imm64 into a r/m64 (*An operand that can be either a 64-bit register (`r64`) OR a 64-bit memory location (`m64`)*).

So, it would work if I moved a value to a register, and then from that register to the [rsp] memory location, it should work? Let’s try.

```
mov rdx, 0x67616C662F
mov qword [rsp], rdx
```

<img data-recalc-dims="1" loading="lazy" decoding="async" width="1374" height="52" data-attachment-id="902" data-permalink="https://p0pcycle.com/2025/11/24/shellcoding-like-a-pro/image-91/" data-orig-file="https://i0.wp.com/p0pcycle.com/wp-content/uploads/2025/11/image-11.png?fit=1374%2C52&amp;ssl=1" data-orig-size="1374,52" data-comments-opened="1" data-image-title="image" data-image-description="" data-image-caption="" data-large-file="https://i0.wp.com/p0pcycle.com/wp-content/uploads/2025/11/image-11.png?fit=1024%2C39&amp;ssl=1" src="https://i0.wp.com/p0pcycle.com/wp-content/uploads/2025/11/image-11.png?resize=1374%2C52&amp;ssl=1" alt="" class="wp-image-902">allowed to move imm64 to r64

<img data-recalc-dims="1" loading="lazy" decoding="async" width="1362" height="44" data-attachment-id="903" data-permalink="https://p0pcycle.com/2025/11/24/shellcoding-like-a-pro/image-92/" data-orig-file="https://i0.wp.com/p0pcycle.com/wp-content/uploads/2025/11/image-12.png?fit=1362%2C44&amp;ssl=1" data-orig-size="1362,44" data-comments-opened="1" data-image-title="image" data-image-description="" data-image-caption="" data-large-file="https://i0.wp.com/p0pcycle.com/wp-content/uploads/2025/11/image-12.png?fit=1024%2C33&amp;ssl=1" src="https://i0.wp.com/p0pcycle.com/wp-content/uploads/2025/11/image-12.png?resize=1362%2C44&amp;ssl=1" alt="" class="wp-image-903">allowed to move r64 to m64

Nice, no errors here. Let’s check pwndbg:

<img data-recalc-dims="1" loading="lazy" decoding="async" width="1382" height="616" data-attachment-id="883" data-permalink="https://p0pcycle.com/2025/11/24/shellcoding-like-a-pro/image-87/" data-orig-file="https://i0.wp.com/p0pcycle.com/wp-content/uploads/2025/11/image-7.png?fit=1382%2C616&amp;ssl=1" data-orig-size="1382,616" data-comments-opened="1" data-image-title="image" data-image-description="" data-image-caption="" data-large-file="https://i0.wp.com/p0pcycle.com/wp-content/uploads/2025/11/image-7.png?fit=1024%2C456&amp;ssl=1" src="https://i0.wp.com/p0pcycle.com/wp-content/uploads/2025/11/image-7.png?resize=1382%2C616&amp;ssl=1" alt="" class="wp-image-883" style="aspect-ratio:2.243455645389269;width:468px;height:auto"> <img data-recalc-dims="1" loading="lazy" decoding="async" width="1376" height="160" data-attachment-id="885" data-permalink="https://p0pcycle.com/2025/11/24/shellcoding-like-a-pro/image-88/" data-orig-file="https://i0.wp.com/p0pcycle.com/wp-content/uploads/2025/11/image-8.png?fit=1376%2C160&amp;ssl=1" data-orig-size="1376,160" data-comments-opened="1" data-image-title="image" data-image-description="" data-image-caption="" data-large-file="https://i0.wp.com/p0pcycle.com/wp-content/uploads/2025/11/image-8.png?fit=1024%2C119&amp;ssl=1" src="https://i0.wp.com/p0pcycle.com/wp-content/uploads/2025/11/image-8.png?resize=1376%2C160&amp;ssl=1" alt="" class="wp-image-885" style="aspect-ratio:8.598049837486457;width:468px;height:auto">Success!

Anyways, I used gdb / strace to debug my shellcode, and it was quite nice because I found out about the layout ASM in gdb, which is cool. The reason why I didn’t just use pwntools & pwndbg is that I wanted to take time to learn other tools, write & compile shellcode myself, and debug it using more “raw” tools.

<img data-recalc-dims="1" loading="lazy" decoding="async" width="2028" height="866" data-attachment-id="878" data-permalink="https://p0pcycle.com/2025/11/24/shellcoding-like-a-pro/image-86/" data-orig-file="https://i0.wp.com/p0pcycle.com/wp-content/uploads/2025/11/image-6.png?fit=2028%2C866&amp;ssl=1" data-orig-size="2028,866" data-comments-opened="1" data-image-title="image" data-image-description="" data-image-caption="" data-large-file="https://i0.wp.com/p0pcycle.com/wp-content/uploads/2025/11/image-6.png?fit=1024%2C437&amp;ssl=1" src="https://i0.wp.com/p0pcycle.com/wp-content/uploads/2025/11/image-6.png?resize=2028%2C866&amp;ssl=1" alt="" class="wp-image-878">

Once I got pretty familiar with these tools, I reverted back to pwndbg & pwntools for ease.

##### A byte budget #####

Another challenge was to write a shellcode \<= 18 bytes. WHAT? okay… I think the current shellcode I have for chmoding the flag is like 36 bytes… We’ve got some work to do here.

We already know that “/flag” takes 5 bytes, so we could reduce it by creating a symlink “a” to flag:

```
ln -s /flag a
```

Now we can just chmod the file “a”! We just saved a few bytes.

We can also use smaller registers. For example, if RAX is empty, we can just use the low 8 bits of the register called AL to put our 0x5a byte (this [website](<https://www.cs.uaf.edu/2017/fall/cs301/lecture/09_11_registers.html#:~:text=al and ah are the,the 8008 back in 1972.>) shows it nicely):

```
 mov al, 0x5a
 mov si, 0x1bc
```

##### Living off the land #####

What happens when your shellcode needs to be… 10 bytes?

Yeah you already thought you were a shellcode pro when you managed to get 36 bytes down to 18 bytes. But no, that’s not enough!

Living off the land is the idea of using things that are around you. What data is in the registers when the program is running, at the moment right before your shellcode gets executed?

How can you see that, you may ask? Well, with the int3 instruction, of course!

Int3 generates a software interrupt and sends a SIGTRAP which is caught by the debugger. Then, we can inspect registers, stacks, and see what we have at our disposal. We can use this technique in a scenario such as, we don’t know where to put a breakpoint in the main program and we don’t want to start stepping into each instruction since the start of the program.

We know that the challenge’s program will eat our shellcode, so we can just have our shellcode be the breakpoint (if that makes sense).

<img data-recalc-dims="1" loading="lazy" decoding="async" width="1462" height="648" data-attachment-id="911" data-permalink="https://p0pcycle.com/2025/11/24/shellcoding-like-a-pro/image-93/" data-orig-file="https://i0.wp.com/p0pcycle.com/wp-content/uploads/2025/11/image-13.png?fit=1462%2C648&amp;ssl=1" data-orig-size="1462,648" data-comments-opened="1" data-image-title="image" data-image-description="" data-image-caption="" data-large-file="https://i0.wp.com/p0pcycle.com/wp-content/uploads/2025/11/image-13.png?fit=1024%2C454&amp;ssl=1" src="https://i0.wp.com/p0pcycle.com/wp-content/uploads/2025/11/image-13.png?resize=1462%2C648&amp;ssl=1" alt="" class="wp-image-911">Program received a signal SIGTRAP, Trace/breakpoint trap.

Here, an easy win would be to use the RCX value of “H=” as a filename, using the same symlink technique we used previously for our chmod.

```
push rcx
pop rdi
```

I harnessed this technique to get my shellcode down to 10 bytes.