+++
title = "Just, Nix Shell and Podman are a Killer Combo"
description = 'Let’s say, for some unclear reasons, you need to compile the “Hello World” C program using a variety of C compilers.include <stdio.hint main() {    printf("Hello World");    return 0;} hello.cLet’s also say that your dev machine is a MacBook, and some of these C compilers'
date = "2022-10-05T00:00:00Z"
url = "https://abhinavsarkar.net/posts/just-nix-podman-combo/"
author = "Abhinav Sarkar"
text = ""
lastupdated = "2026-07-21T09:17:41.578732751Z"
seen = false
+++

Let’s say, for some unclear reasons, you need to compile the “Hello World” C program using a variety of C compilers.

```
#include <stdio.h>

int main() {
    printf("Hello World");
    return 0;
}
```

 hello.c

Let’s also say that your dev machine is a MacBook, and some of these C compilers run only on Linux.

Thanks to the advancements made in Nix, everything in this post is completely unnecessary now. Just setup a [Linux builder](https://nixos.org/manual/nixpkgs/stable/#sec-darwin-builder) on Macos by following [this tutorial](https://nixcademy.com/posts/macos-linux-builder/), and mark the Linux-only packages so in their Nix config using the `system` parameter for the nixpkgs config. Rest is taken care by Nix automatically.

Let’s start with [Clang](https://web.archive.org/web/20221005/https://clang.llvm.org/). Clang is the default C compiler on macOS, and you probably have it already installed. Let that be the case, and you compile `hello.c` by running:

```
clang -o hello-clang hello.c
```

Well and good. But you don’t want to be typing all that every time you need to compile (your unusual circumstances compell you to compile the file again and again). So you put it in a `justfile`:

```
build-clang:
    clang -o hello-clang hello.c
```

 justfile

Great! Now you use [Just](https://just.systems/), a modern command runner, to run Clang, like so:

```
just build-clang
```

Just when you think you troubles are over, you remember that you need to compile the file using [GCC](https://gcc.gnu.org/) as well. macOS does not come with GCC installed, and now you need to figure out how to install it and its dependencies. You can [Homebrew](https://brew.sh/) that stuff, but you know better.

Enter [Nix](https://nixos.org/). Nix is [a lot of things](https://www.haskellforall.com/2022/08/stop-calling-everything-nix.html), but for the purpose of this post, it is a way to easily create reproducible development environments. So after installing Nix, you quickly put together the `shell.nix` file that gathers your dependencies, and makes them present your shell’s `$PATH`:

```
with (import <nixpkgs> { });
mkShell {
  buildInputs = [ just gcc ];
}
```

 shell.nix

Next, you expand the `justfile` so that it compiles `hello.c` with GCC:

```
in_nix_shell := env_var_or_default("IN_NIX_SHELL", "false")
root_dir := justfile_directory()

_run-in-nix-shell cmd *args:
    #!/usr/bin/env -S sh -eu
    if [ "{{ in_nix_shell }}" = "false" ]; then
        nix-shell "shell.nix" --run "just \"{{ root_dir }}/{{ cmd }}\" {{ args }}"
    else
        just "{{ root_dir }}/{{ cmd }}" {{ args }}
    fi

_build-gcc:
    gcc -o hello-gcc hello.c

build-gcc: (_run-in-nix-shell "_build-gcc")
```

 justfile

With this setup, you compile `hello.c` with GCC by running:

```
just build-gcc
```

The `_run-in-nix-shell` Just command takes care of automatically starting the `nix-shell` if required. `nix-shell` downloads GCC and its dependencies for you, and sets them up correctly, so that you don’t have to care about a thing in the world.

Except one thing: now you also need to compile `hello.c` with [TinyCC](https://web.archive.org/web/20221005/https://www.bellard.org/tcc/), and for some bizzare reasons, it so happens that TinyCC runs only on Linux, and not on macOS. You can spin up a [Docker](https://www.docker.com/) container, but again, you know better.

You decide to use [Podman](https://podman.io/).

First you alter `shell.nix` to set up Podman et al., and TinyCC:

```
with (import <nixpkgs> { });
mkShell {
  buildInputs =
    # packages available on both linux and macos
    [ just gcc ]
    # packages available only on linux
    ++ (lib.optionals stdenv.isLinux [ tinycc ])
    # macos tooling to run linux packages
    ++ (lib.optionals stdenv.isDarwin [ podman qemu ]);
}
```

 shell.nix

Then you write the Just commands to create and operate a Podman container:

```
container_name := "demo"

_create-vm:
    podman machine init --cpus 12 --memory 8192 --disk-size 50 \
      --volume $HOME:$HOME || true

_start-vm: _create-vm
    podman machine start || true

_stop-vm:
    podman machine stop

_create-container: _start-vm
    podman container ls -a | grep {{ container_name }} > /dev/null || \
        podman create -t --name {{ container_name }} -w /workdir \
            -v {{ root_dir }}:/workdir nixos/nix

_start: _create-container
    podman start {{ container_name }}

_stop: && _stop-vm
    podman stop {{ container_name }} || true
```

 justfile

And the helper commands to run Just commands in the Podman container:

```
_podman-exec cmd *args: _start && _stop
    podman exec -it {{ container_name }} nix-shell \
      --command "just {{ cmd }} {{ args }}"

_run-in-podman cmd *args:
    #!/usr/bin/env -S sh -eu
    if [ "{{ os() }}" = "macos" ]; then
        just _podman-exec "{{ cmd }}" {{ args }}
    else
        just "{{ cmd }}" {{ args }}
    fi
```

 justfile

And finally, the commands to run TinyCC on `hello.c`:

```
__build-tcc:
    tcc -o hello-tcc hello.c

_build-tcc: (_run-in-podman "__build-tcc")

build-tcc: (_run-in-nix-shell "_build-tcc")
```

 justfile

Finally, you compile `hello.c` with TinyCC by running[<sup>1</sup>](#fn1):

```
just build-tcc
```

You watch in amazement as Nix downloads Podman and QEMU, Just sets up and runs the container, Nix downloads TinyCC within the container, and TinyCC finally compiles the file. Everything cleans up afterwards, and you are left with a `hello-tcc` binary file in your directory, which you cannot run because it was compiled on Linux, and you are on macOS[<sup>2</sup>](#fn2). But whatever. You job was to compile, not to run. You pack up your laptop, move to the living room, and open it again to browse [Reddit](https://www.reddit.com/r/ProgrammerAnimemes/). A day well spent[<sup>3</sup>](#fn3).

 If you have any questions or comments, please leave a comment below. If you liked this post, please share it. Thanks for reading!

---

1. If you have Just installed at the OS level, you can run Just commands from other directories as well, like this:

   ```
   just ~/Projects/just-nix-podman-demo/build-tcc
   ```

   [↩︎](#fnref1)
2. This `justfile` runs fine on a Linux machine as well, except the `build-clang` command.[↩︎](#fnref2)

3. The use-case described in this post is a rather trivial and contrived example, but this pattern has served me well in real-world use-cases.[↩︎](#fnref3)

---

Thanks for reading this post via feed. Feeds are great, and you're great for using them. ♥

This post was originally published on [abhinavsarkar.net](https://abhinavsarkar.net/posts/just-nix-podman-combo/?mtm_campaign=feed).

### Like, repost, or comment on: ###

* [Fediverse](https://fantastic.earth/@abnv/112581642096571950)
* [Lobsters](https://lobste.rs/s/eenfdg)
* [Reddit](https://www.reddit.com/r/NixOS/comments/xwmx6o/)
* [My website](https://abhinavsarkar.net/posts/just-nix-podman-combo/?mtm_campaign=feed#comment-container)

Read more of my [posts](https://abhinavsarkar.net/posts/) and [notes](https://abhinavsarkar.net/notes/).

![](https://anna.abhinavsarkar.net/matomo.php?idsite=1&rec=1)