+++
title = "Weekend trivia: your process' memory is a file"
description = "The underappreciated gem of /proc//mem"
date = "2026-06-01T02:59:52Z"
url = "https://lcamtuf.substack.com/p/weekend-trivia-your-process-memory"
author = "lcamtuf"
text = ""
lastupdated = "2026-06-01T21:30:16.789209015Z"
seen = true
+++

Some folks say that the design philosophy of Unix is that “everything is a file”. If you’re familiar with Unix-like platforms, you probably know that they don’t quite live up to the hype. It’s true that these systems allow convenient access to hardware through file-like objects in directories such as `/sys` or `/dev`. At the same time, there’s plenty of OS functionality that isn’t exposed via files; for example, you can’t connect to a remote webserver without using a dedicated system call.

This is something people would probably have liked to do! A popular shell called *bash* comes with a workaround: it special-cases certain file paths, letting you construct the following shell monstrosity:

>
>
>
>
> ```
> $ (echo -e 'GET / HTTP/1.0\nHost: coredump.cx\n' 1>&0; cat) </dev/tcp/coredump.cx/80
> HTTP/1.1 301 Moved Permanently
> Date: Mon, 01 Jun 2026 01:07:22 GMT
> Content-Type: text/html; charset=UTF-8
> Connection: close
> Location: https://coredump.cx/
> ...
> ```
>
>
>
>

That said, the `/dev/tcp/<server>/<port>` trick works only for the files opened by the shell itself. If you pass such a path to any other program, you won’t get the expected result:

>
>
>
>
> ```
> $ cat /dev/tcp/coredump.cx/80
> cat: /dev/tcp/coredump.cx/80: No such file or directory
> ```
>
>
>
>

If you complain about this inconsistency, you might get told that not everything is a file; instead, “everything is a *file* *descriptor*”. That is, you might need to do something special to initiate a TCP/IP connection, but once this is done, the returned connection identifier has file-like semantics and can be passed to standard file APIs such as *read(…)* and *write(…)*.

But then, not everything is a file descriptor! Some parts of the OS use separate namespaces and APIs; a good example are process identifiers (PIDs). You can’t call *read(…)* on a process identifier: both PIDs and file descriptors are just integers, but they use the same numbers to reference unrelated things. (Recent Linux kernels have a special system call that lets you convert a PID into a [limited-use file descriptor](https://www.man7.org/linux/man-pages/man2/pidfd_open.2.html), but there’s little you can currently do with that.)

At first blush, the closest you can get to interacting with PIDs via files is to peek at process metadata via a pseudo-filesystem called `/proc`. Alas, the data appears to be largely read-only and not particularly interesting. It’s the stuff you see in the output of *ps* or *top*:

>
>
>
>
> ```
> $ cat /proc/self/status
> Name:   cat
> Umask:  0077
> State:  R (running)
> ...
> Pid:    29329
> PPid:   17523
> ...
> Uid:    1000    1000    1000    1000
> Gid:    1000    1000    1000    1000
> ...
> VmSize:     2420 kB
> ...
> ```
>
>
>
>

But then… if you ever snooped around the `/proc/<pid>/` directory on Linux, you might have noticed a mysterious file that seemingly can’t be read:

>
>
>
>
> ```
> $ cat /proc/self/mem
> cat: /proc/self/mem: I/O error
> ```
>
>
>
>

To get anything out of that “file”, you need to *lseek(…)* to a specific offset before calling *read(…)* or *write(…)*; alternatively, you can pass the offset when calling *pread(…)* or *pwrite(…)*. If you follow that procedure, you can then seamlessly fetch or modify the memory of the target program in real time.

Here’s how it works in practice — a program that performs self-surgery by accessing the file-based interface ([demo link](https://godbolt.org/z/hsEfdqhhh)):

>
>
>
>
> ```
> #include <stdio.h>
> #include <unistd.h>
> #include <fcntl.h>
>
> #define  gcc_barrier() asm volatile ("" ::: "memory")
>
> volatile int my_val = 0;
>
> int main() {
>
>   /* Open the process' own memory file. */
>
>   int mem_fd = open("/proc/self/mem", O_RDWR);
>   if (mem_fd < 0) return 0;
>
>   /* Write '123' at the file offset associated with my_val. */
>
>   pwrite(mem_fd, &(int){123}, sizeof(int), (off_t)&my_val);
>
>   /* Display my_val, with compiler barrier to prevent reordering. */
>
>   gcc_barrier();
>   printf("my_val = %d\n", my_val);
>
> }
> ```
>
>
>
>

When I first discovered this API some 25 years ago, I found it to be remarkably elegant. The standard Unix debugging interface, *ptrace(…)*, supports a pair of better-known *PTRACE\_PEEKDATA* and *PTRACE\_POKEDATA* methods, but *ptrace(…)* is incredibly janky; in contrast, `/proc/<pid>/mem` is beautiful in its simplicity.

Anyway — in 2002, my fascination with this API prompted me to write a program called *memfetch*; the utility allowed you to grab a non-destructive “screenshot” of the memory of any process of your choice, be it to satiate curiosity, to work around anti-debugging features, or to recover data from a non-responsive app. This weekend, I dug it up and overhauled the code to work on modern 64-bit systems:

>
>
>
>
> ```
> $ ./memfetch 9742
> memfetch 1.02 by Michal Zalewski <lcamtuf@coredump.cx>
> [+] Attached to PID 9742 (/usr/bin/vim).
> [*] Processing memory maps (index: mf-index.txt)...
>     - Skipping read-only section from 'vim' (224 kB).
>     - Skipping read-only section from 'vim' (1832 kB).
>     - Skipping read-only section from 'vim' (464 kB).
>     - Skipping read-only section from 'vim' (72 kB).
>     + Dumping writable section from 'vim' (176 kB) to 'mf-map-005.bin'...
>     + Dumping anonymous memory (56 kB) to 'mf-mem-006.bin'...
>     + Dumping anonymous memory (4 kB) to 'mf-mem-007.bin'...
>     + Dumping anonymous memory (40 kB) to 'mf-mem-008.bin'...
> ...
> ```
>
>
>
>

The program gives you a collection of raw binary files that can be grepped, opened in an editor, and so forth. You can download the source [here](http://lcamtuf.coredump.cx/soft/memfetch.tgz).

Some readers might find it amusing that in the early 2000s, Linux 2.2 allowed you to call *mmap(…)* on the resulting `/proc/<pid>/mem` file descriptor, mirroring the memory of the target process to your address space. This was too good to be true: the initial version of *memfetch* would sometimes crash or hang the entire system due to page tables getting out of sync. Soon after, the entire *mmap(…)* logic was yanked out.

***Correction:** thanks to Jann Horn who pointed me to pidfds and spotted a mistake related to PTRACE\_ATTACH. I initially stated it’s necessary for accessing the file, but it isn’t.*

---

*If you are a software engineer, you might also enjoy:*

*I write original articles about electronics, math, and other stuff. If you like what you see, please subscribe.*

[Subscribe now](https://lcamtuf.substack.com/subscribe?)