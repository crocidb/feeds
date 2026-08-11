+++
title = "Fast Haskell Scripts on GitHub Actions"
description = "Magix is a neat tool that lets us run Haskell programs as scripts<sup1</sup. We put a shebang on top mentioning Magix, list the Haskell packages we need, and ./script.hs just works. This post is about running such a script fast(er) on [GitHub Ac"
date = "2026-08-10T00:00:00Z"
url = "https://abhinavsarkar.net/posts/fast-haskell-scripts-on-github-actions/"
author = "Abhinav Sarkar"
text = ""
lastupdated = "2026-08-10T12:13:32.935460151Z"
seen = false
+++

Magix is a neat tool that lets us run [Haskell](https://haskell.org) programs as scripts[<sup>1</sup>](#fn1). We put a shebang on top mentioning Magix, list the Haskell packages we need, and `./script.hs` just works. This post is about running such a script fast(er) on [GitHub Actions](https://github.com/features/actions).

This post was originally published on [abhinavsarkar.net](https://abhinavsarkar.net/posts/fast-haskell-scripts-on-github-actions/?mtm_campaign=feed).

### Contents ###

1. [The Setup](#the-setup)
2. [The Problem](#the-problem)
3. [The Idea](#the-idea)
4. [The Bundle](#the-bundle)
5. [The GitHub Actions Workflow](#the-github-actions-workflow)
6. [The Payoff](#the-payoff)
7. [The Conclusion](#the-conclusion)

The Setup[#](#the-setup)
----------

As our example, we’ll take the [static site generator](https://en.wikipedia.org/wiki/static_site_generator) (SSG) I wrote some time ago: [BlogShake](https://github.com/abhin4v/shake-blog). It is written as a single Haskell file. It uses [Shake](https://shakebuild.com/) to build the website, [Pandoc](https://pandoc.org/) to render posts, and [Mustache](https://hackage.haskell.org/package/mustache) for templates. The script starts with these Magix directives[<sup>2</sup>](#fn2):

```
#!/usr/bin/env magix
#!magix haskell
#!haskellPackages mustache pandoc shake feed yaml
#!ghcFlags -threaded -O2
```

Running the script is as simple as:

```
./blog.hs
```

[Magix](https://github.com/dschrempf/magix) compiles the script into an executable and runs it. Nothing else to install, no `cabal`, or `nix-shell` required.

Nix and Cabal can also run scripts by providing shebang directives[<sup>3</sup>](#fn3), so why reach for Magix instead? The `nix-shell` shebang reinterprets the script with `runhaskell` on every run, which is slow. Cabal compiles the script, but it fetches dependencies from Hackage and builds them from source, leading to very slow first build and rebuilds. Magix compiles the script once into a binary executable and caches it for the next runs. It also fetches dependencies from the prebuilt Nix cache. So running via Magix is faster than either case. But when running on GitHub Actions, we have a problem.

The Problem[#](#the-problem)
----------

[GitHub Actions](https://github.com/features/actions) gives us a fresh runner for every build, with no Nix store and no Magix cache. So every run, we have to install Nix and Magix, download all the dependencies, and compile the script. In one instance, the build from scratch took 105 seconds, with installation, dependency download, and compilation taking 92 seconds.

That is a lot of wasted work because the script and its dependencies change rarely. The actual run itself takes only a few seconds once the executable exists.

The Idea[#](#the-idea)
----------

What if we could persist the compiled executable across runs? Magix’s build is deterministic: the same script and the same nixpkgs revision produces the same executable. If we could stash that executable somewhere durable, a cache hit could skip Nix and Magix installation, as well as the script compilation entirely, and just run the executable.

Magix creates a Nix derivation for compiling the Haskell script with GHC and builds it. The resultant executable lives in Magix’s cache, as a symlink with a path like:

```
$ readlink -f ~/.cache/magix/*blog-result
/nix/store/<hash>-blog
```

GHC statically links all the Haskell libraries into the executable. The only dynamic dependencies are a handful of libraries—zlib, libffi, gmp etc. So if we have the executable plus those few libraries as a self-contained unit, we don’t need the hundreds of other packages in the Nix store[<sup>4</sup>](#fn4).

The Bundle[#](#the-bundle)
----------

I wrote a small script, `magix-bundle.sh`, with two subcommands:

```
$ magix-bundle.sh bundle blog.hs     # creates a bundle
$ magix-bundle.sh run blog.hs build  # runs a bundled script
```

The script works for any Magix script, not just `blog.hs`. Let’s go through it.

The script takes a command and a script file, derives the bundle name from the script file name, and resolves the directories it needs:

```
set -euo pipefail

if [ "$#" -lt 2 ]; then
  echo "usage: magix-bundle.sh <bundle|run> <script-file> [args...]" >&2
  exit 1
fi
CMD="$1"
shift
SCRIPT_FILE="$1"
shift

[ -f "$SCRIPT_FILE" ] || {
  echo "error: script not found: $SCRIPT_FILE" >&2
  exit 1
}

NAME=$(basename "$SCRIPT_FILE")
NAME=${NAME%.*}
HASH=$(sha256sum "$SCRIPT_FILE" | awk '{print $1}')
MAGIX_CACHE="${MAGIX_CACHE_DIR:-${XDG_CACHE_HOME:-$HOME/.cache}/magix}"
DEST="${MAGIX_BUNDLE_DIR:-$HOME/.cache/magix-bundles}/$HASH"
```

`NAME` is the script file name without its extension, and `HASH` is a SHA-256 hash of the script contents; together they key the bundle directory. `MAGIX_CACHE` mirrors how Magix itself resolves its cache directory: `$XDG_CACHE_HOME/magix` or `~/.cache/magix`, overridable with the `MAGIX_CACHE_DIR` environment variable. Bundles live under `~/.cache/magix-bundles` by default, overridable with the `MAGIX_BUNDLE_DIR` env var.

### Creating the Bundle[#](#creating-the-bundle) ###

The `bundle` function locates the script’s build result in Magix’s cache, copies the executable out of the Nix store, and gathers the libraries it links against:

```
copy_lib_deps() {
  local src="$1"
  local deps dep base
  deps=$(ldd "$src" | awk '/\/nix\/store\//{print $3}')
  for dep in $deps; do
    case "$dep" in
      */glibc-*/*) continue ;;
    esac
    [ -e "$dep" ] || {
      echo "error: dependency '$dep' of '$src' not found" >&2
      exit 1
    }
    base=$(basename "$dep")
    if [ ! -f "$DEST/lib/$base" ]; then
      cp -L "$dep" "$DEST/lib/$base"
      copy_lib_deps "$dep"
    fi
  done
}

bundle() {
  mkdir -p "$DEST/bin" "$DEST/lib"

  RESULT=""
  for f in "$MAGIX_CACHE/"*"-$NAME-result"; do
    [ -L "$f" ] || continue
    [ -e "$f" ] || continue
    if [ -z "$RESULT" ] || [ "$f" -nt "$RESULT" ]; then
      RESULT="$f"
    fi
  done
  [ -n "$RESULT" ] || {
    echo "error: no build result for '$SCRIPT_FILE' found in $MAGIX_CACHE" >&2
    exit 1
  }

  RESULT=$(readlink -f "$RESULT")
  BIN="$RESULT/bin/.$NAME-wrapped"
  cp "$BIN" "$DEST/bin/$NAME"
  chmod +w "$DEST/bin/$NAME"

  copy_lib_deps "$BIN"

  case "$(uname -m)" in
    x86_64)
      INTERPRETER=/lib64/ld-linux-x86-64.so.2
      ;;
    aarch64)
      INTERPRETER=/lib/ld-linux-aarch64.so.1
      ;;
    *)
      echo "error: unsupported architecture: $(uname -m)" >&2
      exit 1
      ;;
  esac

  patchelf \
    --set-interpreter "$INTERPRETER" \
    --set-rpath "\$ORIGIN/lib" \
    "$DEST/bin/$NAME"

  for lib in "$DEST"/lib/*; do
    [ -f "$lib" ] || continue
    chmod +w "$lib"
    patchelf --set-rpath "\$ORIGIN" "$lib"
  done
  echo "bundle created at $DEST"
}
```

Here is what it does:

1. It picks the latest `<hash>-<name>-result` symlink for the script by modified time, skipping dangling ones[<sup>5</sup>](#fn5).
2. It dereferences the symlink to a Nix store path, copies the compiled executable at `bin/.<name>-wrapped` from the Nix store path into the bundle[<sup>6</sup>](#fn6), and makes the copy writable.[<sup>7</sup>](#fn7).
3. It copies the dynamic library dependencies of the executable by calling the function `copy_lib_deps`. `copy_lib_deps` finds the dependencies with `ldd`, and copies the ones that live in `/nix/store` into the bundle’s `lib/` directory, skipping glibc. Note that it does this recursively, copying the dependencies of dependencies as well.
4. It rewrites the executable with `patchelf`, setting the interpreter and the library search path for it. It also sets the library search path for libraries themselves so that transitive dependencies work as well.

The two `patchelf` flags are the interesting part. The `--set-rpath` flag makes the dynamic loader find the bundled libraries, so we don’t need `LD_LIBRARY_PATH` or the Nix store at run time. The `--set-interpreter` flag is needed because Nix rewrites each executable’s dynamic loader to point at its own glibc inside the Nix store. Since we don’t bundle glibc, we reset the interpreter to the host’s loader according to the system’s architecture[<sup>8</sup>](#fn8).

### Bundling glibc?[#](#bundling-glibc) ###

We deliberately do not bundle glibc. Unlike the other libraries, glibc cannot simply be shipped alongside the executable[<sup>9</sup>](#fn9). The dynamic loader needs to be at an absolute path and needs to be matched with the glibc version. So we simply don’t bundle it and rely on the host’s glibc. One caveat here is that the host’s glibc must be at least as new as the one the executable was built against. That works because glibc is backwards-compatible[<sup>10</sup>](#fn10).

### Running the Bundle[#](#running-the-bundle) ###

The rest of the script is the `run` subcommand and the command dispatch:

```
run() {
  local bin="$DEST/bin/$NAME"
  if [ ! -f "$bin" ] || [ ! -d "$DEST/lib" ]; then
    echo "error: no bundle for '$SCRIPT_FILE' at $DEST" >&2
    exit 1
  fi
  exec "$bin" "$@"
}

case "$CMD" in
  bundle)
    if [ "$#" -gt 0 ]; then
      echo "error: 'bundle' takes no extra arguments" >&2
      exit 1
    fi
    bundle
    ;;
  run) run "$@" ;;
  *)
    echo "error: unknown command '$CMD' (expected 'bundle' or 'run')" >&2
    exit 1
    ;;
esac
```

`run` computes the same SHA-256 hash of the script, checks that the bundle exists, and [`exec`](https://en.wikipedia.org/wiki/Exec_(system_call))s the executable, passing the remaining arguments through untouched.

The GitHub Actions Workflow[#](#the-github-actions-workflow)
----------

The workflow uses Nix, Magix and the bundler script to execute the Haskell script.

First, we set the runner image and the nixpkgs branch we track[<sup>11</sup>](#fn11):

```
name: Build blog

on:
  push:
    branches: [main]
  workflow_dispatch:

jobs:
  build:
    name: build
    runs-on: ubuntu-26.04
    env:
      NIXPKGS_BRANCH: release-26.05
```

The next two steps compute the cache key and restore the bundle if we have one:

```
    steps:
      - name: checkout
        uses: actions/checkout@v6
        with:
          ref: main

      - name: resolve nixpkgs commit
        id: nixpkgs
        run: |
          set -euo pipefail
          SHA=$(git ls-remote https://github.com/NixOS/nixpkgs.git "refs/heads/$NIXPKGS_BRANCH" | cut -f1)
          echo "sha=$SHA" >> "$GITHUB_OUTPUT"

      - name: cache blog bundle
        id: cache-blog
        uses: actions/cache@v5
        with:
          path: ~/.cache/magix-bundles
          key: magix-bundles-${{ hashFiles('blog.hs') }}-${{ steps.nixpkgs.outputs.sha }}
```

We resolve the nixpkgs branch to its latest commit with `git ls-remote` at the start of the job, use that commit in the cache key, and pin the whole build to the same commit via `MAGIX_NIXPKGS_REF`, as we see below.

The cache key has two parts: the hash of the script and the resolved nixpkgs commit hash. When the branch moves or the script changes, the cache misses because of the key change, and we rebuild against the new commit and/or script. We also restore the previously cached bundle to `~/.cache/magix-bundles`, if found.

The next four steps run only on a cache miss:

```
      - name: install Nix
        if: steps.cache-blog.outputs.cache-hit != 'true'
        uses: DeterminateSystems/nix-installer-action@v22
        with:
          extra-conf: |
            extra-substituters = https://dschrempf-magix.cachix.org
            extra-trusted-public-keys = dschrempf-magix.cachix.org-1:cScG6NjZBiQvY7KjSPpQdUa9UXZVLz9rvUZHtuwdYwc=

      - name: install magix
        if: steps.cache-blog.outputs.cache-hit != 'true'
        run: nix profile install github:dschrempf/magix

      - name: compile blog
        if: steps.cache-blog.outputs.cache-hit != 'true'
        env:
          MAGIX_NIXPKGS_REF: github:NixOS/nixpkgs/${{ steps.nixpkgs.outputs.sha }}
        run: ./blog.hs

      - name: create bundle
        if: steps.cache-blog.outputs.cache-hit != 'true'
        run: ./scripts/magix-bundle.sh bundle blog.hs
```

`install Nix` adds Magix’s binary cache to Nix, so that we get the prebuilt packages for Magix. The `compile blog` step runs `./blog.hs` with no arguments[<sup>12</sup>](#fn12): This causes Magix to compile the script, but Shake has nothing to build, so it exits immediately. The build is pinned to the same nixpkgs commit that keys the cache, via the `MAGIX_NIXPKGS_REF` env variable used by Magix. Finally, `create bundle` packages the compiled executable by running the bash script we saw earlier.

The rest of the workflow runs on every run, cache hit or not:

```
      - name: build site
        run: ENV=PROD ./scripts/magix-bundle.sh run blog.hs -j4 build
```

I’ve cut down the rest of the workflow to the only step that is relevant to us: `build site` that runs the bundled executable with the script’s arguments. Other steps are specific to BlogShake.

The Payoff[#](#the-payoff)
----------

All of this work, what does it buy us? Here are two numbers:

* Build with no bundle: 1 min 45 sec.
* Build with cached bundle: 10 sec.

With the cached bundle, the runner just downloads it and runs the executable, skipping Nix and Magix installation and script compilation altogether.

The Conclusion[#](#the-conclusion)
----------

This post showed how to speed up a Haskell script running on GitHub Actions by caching a compact bundle of its compiled executable. The approach works for any Haskell script that runs on Linux: compile once using Magix, bundle the binary with its library dependencies, and let the cache do the rest. One caveat though: the bundler script uses the internal details of Magix, which may break if Magix changes how it works.

The full source code:

* [BlogShake Haskell script](https://github.com/abhin4v/shake-blog/blob/main/blog.hs)
* [Magix bundle script](https://github.com/abhin4v/shake-blog/blob/main/scripts/magix-bundle.sh)
* [GitHub Actions workflow](https://github.com/abhin4v/shake-blog/blob/main/.github/workflows/build.yml)

 If you have any questions or comments, please leave a comment below. If you liked this post, please share it. Thanks for reading!

---

1. At the point of writing this post, Magix supported Bash, Haskell, and Python.[↩︎](#fnref1)

2. Because the executable is compiled once and run many times, we build the script with `-O2`.[↩︎](#fnref2)

3. The shebang-based alternatives look like this:

   ```
   #! /usr/bin/env nix-shell
   #! nix-shell -p "haskellPackages.ghcWithPackages (p: [p.pandoc p.shake p.mustache p.feed p.yaml])"
   #! nix-shell -i runhaskell
   ```

   for Nix, and:

   ```
   #! /usr/bin/env cabal
   {- cabal:
   build-depends: base, pandoc, shake, mustache, feed, yaml
   -}
   ```

   for Cabal.[↩︎](#fnref3)

4. Why not cache the entire Nix store between runs? Because the size of the full Nix store closure required to build Haskell scripts is usually in GBs. Caching that per run would defeat the purpose of caching by taking way too much time to download the cache. You may also want to reach out for the [Nix bundle](https://nix.dev/manual/nix/2.35/command-ref/new-cli/nix3-bundle.html) feature, which produces self-contained compressed executables. But these executables are still too big: 45 MB compressed/178 MB uncompressed for BlogShake. Our approach in this post results in a 11 MB bundle, compressed.

   Another completely different option is to build a fully statically linked executable, which I wrote about in [Nix for Haskell: Static Builds](https://abhinavsarkar.net/posts/nix-for-haskell-static-builds/?mtm_campaign=feed). However, that requires a custom toolchain, running which on GitHub Action is too complex and/or slow.[↩︎](#fnref4)

5. A result symlink can be left dangling if the store path has been garbage-collected. We skip those and pick the newest live one.[↩︎](#fnref5)

6. Magix wraps the built executable with `wrapProgram`, which renames the real executable to `bin/.<name>-wrapped` and puts a wrapper script in its place. We copy the real executable.[↩︎](#fnref6)

7. Nix store files are read-only mode, and we are about to modify the file, so we make it writable.[↩︎](#fnref7)

8. We hardcode the loader paths here, but it should work on most mainstream Linux distributions with glibc.[↩︎](#fnref8)

9. Well, it can be actually. That’s what Nix bundle does. It copies the glibc in the Nix store to the bundle, and points the program interpreter at the bundled loader inside a [chroot](https://en.wikipedia.org/wiki/chroot).[↩︎](#fnref9)

10. An executable built against glibc 2.42 runs fine on a host with glibc 2.43, but not the other way around.[↩︎](#fnref10)

11. The glibc constraint dictates the runner image. Here we build against nixpkgs branch `release-26.05`, which has glibc 2.42. Ubuntu 26.04, the GitHub runner image we use, ships with glibc 2.43. So they are compatible.[↩︎](#fnref11)

12. That no-argument behavior is Shake-specific: with no actions given, Shake runs nothing, so a bare `./blog.hs` compiles the script and exits. A general script won’t do that by default. If you adapt this for a non-Shake script, give it a mode that does nothing, say a `--compile` flag, so running it bare just produces the executable. This step’s only job is to get Magix to build the script, not to run it.[↩︎](#fnref12)

---

Thanks for reading this post via feed. Feeds are great, and you're great for using them. ♥

This post was originally published on [abhinavsarkar.net](https://abhinavsarkar.net/posts/fast-haskell-scripts-on-github-actions/?mtm_campaign=feed).

### Like, repost, or comment on: ###

* [My website](https://abhinavsarkar.net/posts/fast-haskell-scripts-on-github-actions/?mtm_campaign=feed#comment-container)

Read more of my [posts](https://abhinavsarkar.net/posts/) and [notes](https://abhinavsarkar.net/notes/).

![](https://anna.abhinavsarkar.net/matomo.php?idsite=1&rec=1)