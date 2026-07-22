+++
title = "Nix for Haskell: Getting Started"
description = "So, you’ve heard of the new hotness that is Nix, for creating reproducible and isolated development environments, and want to use it for your new Haskell project? But you are unclear about how to get started? Then this is the guide you are looking for."
date = "2024-08-29T00:00:00Z"
url = "https://abhinavsarkar.net/posts/nix-for-haskell/"
author = "Abhinav Sarkar"
text = ""
lastupdated = "2026-07-21T09:17:41.507556067Z"
seen = false
+++

So, you’ve heard of the new hotness that is [Nix](https://nixos.org), for creating reproducible and isolated development environments, and want to use it for your new Haskell project? But you are unclear about how to get started? Then this is the guide you are looking for.

This post was originally published on [abhinavsarkar.net](https://abhinavsarkar.net/posts/nix-for-haskell/?mtm_campaign=feed).

This post is a part of the series: **Nix for Haskell**.

1. **Getting Started** 👈
2. [Static Builds](https://abhinavsarkar.net/posts/nix-for-haskell-static-builds/?mtm_campaign=feed)

### Contents ###

1. [Nix for Haskell](#nix-for-haskell)
2. [Shelling Out](#shelling-out)
3. [Bonus Round: Flakes](#bonus-round-flakes)
4. [Conclusion](#conclusion)

Nix is notoriously hard to get started with. If you are familiar with Haskell, you may have an easier time learning the [Nix language](https://nix.dev/manual/nix/2.24/language/), but it is still difficult to figure out the various toolchains and library functions needed to put your knowledge of the Nix language to use. There are [some](https://github.com/pwm/nixkell) [frameworks](https://github.com/srid/haskell-flake) for setting up Haskell projects with Nix, but again, they are hard to understand because of their large feature scopes. So, in this post, I’m going to show a really easy way for you to get started.

Nix for Haskell[#](#nix-for-haskell)
----------

But first, what does it mean to use Nix for a Haskell project? It means that all the dependencies of our projects — Haskell packages, and non-Haskell ones too — come from [Nixpkgs](https://github.com/NixOS/nixpkgs/), a repository of software configured and managed using Nix[<sup>1</sup>](#fn1). It also means that all the tools we use for development, such as builders, linters, style checkers, LSP servers, and everything else, also come from Nixpkgs[<sup>2</sup>](#fn2). And all of this happens by writing some configuration files in the Nix language.

Start with creating a new directory for the project. For the purpose of this post, we name this project `ftr`:

```
$ mkdir ftr
$ cd ftr
```

The first thing to do is to set up the project to point to the Nixpkgs repo — more specifically, a particular fixed version of the repo — so that our builds are reproducible[<sup>3</sup>](#fn3). We do this by using [Niv](https://github.com/nmattia/niv).

Niv is a tool for pinning/locking down the version of the Nixpkgs repo, much like `cabal freeze` or `npm freeze`. But instead of pinning each dependency at some version, we pin the entire repo (from which all the dependencies come) at a version.

Run the following commands:

```
$ nix-shell -p niv
$ niv init
```

Running `nix-shell -p niv` drops us into a nested shell in which the `niv` executable is available. Running `niv init` sets up Niv for our project, creating `nix/sources.{json|nix}` files. The `nix/sources.json` file is where the Nixpkgs repo version is pinned[<sup>4</sup>](#fn4). If we open it now, it may look something like this:

```
{
    "nixpkgs": {
        "branch": "nixos-unstable",
        "description": "Nix Packages collection",
        "homepage": null,
        "owner": "NixOS",
        "repo": "nixpkgs",
        "rev": "6c43a3495a11e261e5f41e5d7eda2d71dae1b2fe",
        "sha256": "16f329z831bq7l3wn1dfvbkh95l2gcggdwn6rk3cisdmv2aa3189",
        "type": "tarball",
        "url": "https://github.com/NixOS/nixpkgs/archive/6c43a3495a11e261e5f41e5d7eda2d71dae1b2fe.tar.gz",
        "url_template": "https://github.com/<owner>/<repo>/archive/<rev>.tar.gz"
    }
}
```

 nix/sources.json

By default, Niv sets up the Nixpkgs repo, pinned to some version. Let’s pin it to the latest stable version as of the time of writing this post: 24.05. Run:

```
$ niv drop nixpkgs
$ niv add NixOS/nixpkgs -n nixpkgs -b nixos-24.05
```

Now, `nix/sources.json` may look like this:

```
{
    "nixpkgs": {
        "branch": "nixos-24.05",
        "description": "Nix Packages collection & NixOS",
        "homepage": "",
        "owner": "NixOS",
        "repo": "nixpkgs",
        "rev": "36bae45077667aff5720e5b3f1a5458f51cf0776",
        "sha256": "0mkbsp2f07lrqcnlsnybi6kbxdr7sjs3hiz4kf4jkqirk4qgswfi",
        "type": "tarball",
        "url": "https://github.com/NixOS/nixpkgs/archive/36bae45077667aff5720e5b3f1a5458f51cf0776.tar.gz",
        "url_template": "https://github.com/<owner>/<repo>/archive/<rev>.tar.gz"
    }
}
```

 nix/sources.json

Pinning is done. Now, let’s get some stuff from the repo. But wait, first we have to configure Nixpkgs. Create a file `nix/nixpkgs.nix`:

```
{ system ? builtins.currentSystem }:
let
  sources = import ./sources.nix;
in import sources.nixpkgs {
  inherit system;
  overlays = [ ];
  config = { };
}
```

 nix/nixpkgs.nix

Well, I lied. We *could* configure Nixpkgs if we had to[<sup>5</sup>](#fn5), but for this post, we leave all the settings empty, and just import it from Niv sources.

At this point, we could start pulling things from Nixpkgs manually, but to make it declarative and reproducible, let’s create our own Nix shell.

Shelling Out[#](#shelling-out)
----------

Create a file named `shell.nix`:

```
{ system ? builtins.currentSystem, devTools ? true }:
let
  pkgs = import ./nix/nixpkgs.nix { inherit system; };
  myHaskellPackages = pkgs.haskellPackages;
in myHaskellPackages.shellFor {
  packages = p: [ ];
  nativeBuildInputs = with pkgs;
    [ ghc cabal-install ] ++ lib.optional devTools [
      niv
      hlint
      ormolu
      (ghc.withPackages (p: [ p.haskell-language-server ]))
    ];
}
```

 shell.nix

Ah! Now, the Nix magic is shining through. What `shell.nix` does is, it creates a custom Nix shell with the things we mention already available in the shell. `pkgs.haskellPackages.shellFor` is how we create the custom shell, and `nativeBuildInputs` are the tools we want available.

We make `ghc` and `cabal-install` mandatorily available, because they are necessary for doing any Haskell development; and `niv`, `hlint`, `ormolu` and `haskell-language-server`[<sup>6</sup>](#fn6)[<sup>7</sup>](#fn7) optionally available (depending on the passed `devTools` flag), because we need them only when writing code.

Exit the previous Nix shell, and start a new one to start working on the project[<sup>8</sup>](#fn8):

```
$ nix-shell --arg devTools false
```

Okay, I lied again, we are still setting up. In this new shell, `hlint`, `ormoulu` etc are not available but we can run `cabal` now. We use it to initialize the Haskell project:

```
$ cabal init -p ftr
```

After answering all the questions Cabal asks us, we are left with a `ftr.cabal` file, along with some starter Haskell code in the right directories. Let’s build and run the starter code:

```
$ cabal run
Hello, Haskell!
```

It works!

Edit the `ftr.cabal` file now to add some new Haskell dependency (without a version), such as [`extra`](https://hackage.haskell.org/package/extra). If we run `cabal build` now, Cabal will start downloading the `extra` package. Cancel that! We want our dependencies to come from Nixpkgs, not Hackage. For that we need to tell Nix about our Haskell project.

Create a file `package.nix`:

```
{ system ? builtins.currentSystem }:
let
  pkgs = import ./nix/nixpkgs.nix { inherit system; };
  hlib = pkgs.haskell.lib.compose;
in pkgs.lib.pipe
(pkgs.haskellPackages.callCabal2nix "ftr" (pkgs.lib.cleanSource ./.) { })
[ hlib.dontHaddock ]
```

 package.nix

The `package.nix` file is the Nix representation of the Cabal package for our project. We use [`cabal2nix`](https://github.com/NixOS/cabal2nix) here, a tool that makes Nix aware of Cabal files, making it capable of pulling the right Haskell dependencies from Nixpkgs. We also configure Nix to not run [Haddock](http://www.haskell.org/haddock/) on our code by setting the `hlib.dontHaddock` option[<sup>9</sup>](#fn9), since we are not going to write any doc for this demo project.

Now, edit `shell.nix` to make it aware of our new Nix package:

```
{ system ? builtins.currentSystem, devTools ? true }:
let
  pkgs = import ./nix/nixpkgs.nix { inherit system; };
  myHaskellPackages = pkgs.haskellPackages.extend
    (final: prev: { ftr = import ./package.nix { inherit system; }; });
in myHaskellPackages.shellFor {
  packages = p: [ p.ftr ];
  nativeBuildInputs = with pkgs;
    [ ghc cabal-install ] ++ lib.optional devTools [
      niv
      hlint
      ormolu
      (ghc.withPackages (p: [ p.haskell-language-server ]))
    ];
}
```

 shell.nix

We extend Haskell packages from Nixpkgs with our own package `ftr`, and add an entry in the previously empty `packages` list. This makes all the Haskell dependencies we mention in `ftr.cabal` available in the Nix shell. Exit the Nix shell now, and restart it by running:

```
$ nix-shell --arg devTools false
```

We can run `cabal build` now. Notice that nothing is downloaded from Hackage this time.

Even better, we can now build our project using Nix:

```
$ nix-build package.nix
```

This builds our project in a truly isolated environment outside the Nix shell, and puts the results in the `result` directory. Go ahead and try running it:

```
$ result/bin/ftr
Hello, Haskell!
```

Great! Now we can quit and restart the Nix shell without the `--arg devTools false` option. This will download and set up all the fancy dev tools we configured. Then we can start our favorite editor from the terminal and have access to all of them in it[<sup>10</sup>](#fn10).

This is all we need to get started on a Haskell project with Nix. There are some inconveniences in this setup, like we need to restart the Nix shell and the editor every time we modify our project dependencies, but these days most editors come with some extensions to do this automatically, without needing restarts. For more seamless experience in the terminal, we could install [`direnv`](https://direnv.net/) and [`nix-direnv`](https://github.com/nix-community/nix-direnv) that refresh the Nix shells automatically[<sup>11</sup>](#fn11).

Bonus Round: Flakes[#](#bonus-round-flakes)
----------

As a bonus, I’m going to show how to easily set up a [Nix Flake](https://nix.dev/concepts/flakes.html) for this project. Simply create a `flake.nix` file:

```
{
  description = "ftr is demo project for using Nix to manage Haskell projects";
  inputs.flake-utils.url = "github:numtide/flake-utils";

  outputs = { self, flake-utils }:
    flake-utils.lib.eachDefaultSystem (system:
      let ftr = import ./package.nix { inherit system; };
      in rec {
        devShells.default = import ./shell.nix { inherit system; };
        packages.default = ftr;
        apps.default = {
          type = "app";
          program = "${ftr}/bin/ftr";
        };
      });
}
```

 flake.nix

We reuse the package and shell Nix files we created earlier. We have to commit everything to our VSC at this point. After that, we can run the newfangled Nix commands such as[<sup>12</sup>](#fn12):

```
$ nix develop # same as: nix-shell
$ nix build # same as: nix-build package
$ nix shell # builds the package and starts a shell with the built executable available
$ nix run # builds the package and runs the built executable
$ nix profile install # builds the package and installs the built executable in our Nix profile
```

If we upload the project to a public Github repo, anyone with Nix set up can run and/or install our package executable by running single commands:

```
$ nix run github:username/ftr # downloads, builds and runs without installing
$ nix profile install github:username/ftr # downloads, builds and installs
```

If that not super cool then I don’t know what is.

Bonus Round 2: Statically Linked Executable[#](#bonus-round-2-statically-linked-executable)
----------

Create a file `package-static.nix` and `nix-build` it to create a statically linked executable on Linux[<sup>13</sup>](#fn13), which can be run on any Linux machine without installing any dependency libraries or even Nix[<sup>14</sup>](#fn14):

```
{ system ? builtins.currentSystem }:
let
  sources = import ./nix/sources.nix;
  nixpkgs = import sources.nixpkgs {
    inherit system;
    overlays = [
      (final: prev: {
        haskellPackages = prev.haskellPackages.override {
          ghc = prev.haskellPackages.ghc.override {
            enableRelocatedStaticLibs = true;
            enableShared = false;
            enableDwarf = false;
          };
          buildHaskellPackages =
            prev.haskellPackages.buildHaskellPackages.override
            (old: { ghc = final.haskellPackages.ghc; });
        };
      })
    ];
    config = { };
  };
  pkgs = nixpkgs.pkgsMusl;
  hlib = pkgs.haskell.lib.compose;
in pkgs.lib.pipe
(pkgs.haskellPackages.callCabal2nix "ftr" (pkgs.lib.cleanSource ./.) { }) [
  hlib.dontHaddock
  hlib.justStaticExecutables
  hlib.disableSharedLibraries
  hlib.enableDeadCodeElimination
  (hlib.appendConfigureFlags [
    "-O2"
    "--ghc-option=-fPIC"
    "--ghc-option=-optl=-static"
    "--extra-lib-dirs=${pkgs.gmp6.override { withStatic = true; }}/lib"
    "--extra-lib-dirs=${
      pkgs.libffi.overrideAttrs (old: { dontDisableStatic = true; })
    }/lib"
    "--extra-lib-dirs=${pkgs.ncurses.override { enableStatic = true; }}/lib"
    "--extra-lib-dirs=${pkgs.zlib.static}/lib"
  ])
]
```

 package-static.nix

Conclusion[#](#conclusion)
----------

This post shows a quick and easy way to get started with using Nix for managing simple Haskell projects. Unfortunately, if we have any complex requirements, such as custom dependency versions, patched dependencies, custom non-Haskell dependencies, custom configuration for Nixpkgs, multi-component Haskell projects, using a different GHC version, custom build scripts etc, this setup does not scale. In such case you can either grow this setup by learning Nix in more depth with the help of the official [Haskell with Nix docs](https://wiki.nixos.org/w/index.php?title=Haskell) and this [great tutorial](https://github.com/Gabriella439/haskell-nix), or switch to using a framework like [Nixkell](https://github.com/pwm/nixkell) or [haskell-flake](https://github.com/srid/haskell-flake).

This post only scratches the surface of all things possible to do with Nix. I hope I was able to showcase some benefits of Nix, and help you get started. Happy Haskelling and happy Nixing!

 If you have any questions or comments, please leave a comment below. If you liked this post, please share it. Thanks for reading!

---

1. One big advantage that Nix has over using Cabal for managing Haskell projects is the [Nix binary cache](https://cache.nixos.org/) that provides pre-built libraries and executable for download. That means no more waiting for Cabal to build scores of dependencies from sources.[↩︎](#fnref1)

2. Search Nixpkgs for packages at [search.nixos.org](https://search.nixos.org/).[↩︎](#fnref2)

3. I’m assuming that you’ve already set up Nix at this point. If you have not, follow [this guide](https://nix.dev/manual/nix/2.24/installation/).[↩︎](#fnref3)

4. Of course, we can use Niv to manage any number of source repos, not just Nixpkgs. But we don’t need any other for this post.[↩︎](#fnref4)

5. We could do all sort of interesting and useful things here, like patching some Nixpkgs packages with our own patches, reconfiguring the build flags of some packages, etc.[↩︎](#fnref5)

6. [`hlint`](https://github.com/ndmitchell/hlint) is a Haskell linter, [`ormolu`](https://github.com/tweag/ormolu) is a Haskell file formatter, and [`haskell-language-server`](https://github.com/haskell/haskell-language-server/) is an LSP server for Haskell. Other tools that I find useful are [`stan`](https://kowainik.github.io/projects/stan), the Haskell static analyzer, [`just`](https://just.systems/), the command runner, and [`nixfmt`](https://github.com/NixOS/nixfmt), the Nix file formatter. All of them and more are available through Nixpkgs. You can start using them by adding them to `nativeBuildInputs`.[↩︎](#fnref6)

7. If you are wondering why we need to wrap only `haskell-language-server` with all the `ghc` stuff, that’s because, to work correctly `haskell-language-server` is required to be compiled with same version of `ghc` that your project is going to used. The other tools do not have this restriction.[↩︎](#fnref7)

8. You may notice Nix downloading a lot of stuff from Nixpkgs. It may occasionally need to build a few things as well, if they are not available in the binary cache.

   You may need to tweak the `connect-timeout` and `download-attempts` settings in the [`nix.conf`](https://nix.dev/manual/nix/2.24/command-ref/conf-file.html) file if you are on a slow network.[↩︎](#fnref8)

9. There are many more options that we can set here. These options roughly correspond to the command line options for the `cabal` command. See a comprehensive list [here](https://ryantm.github.io/nixpkgs/languages-frameworks/haskell/#haskell-development-helpers).[↩︎](#fnref9)

10. To update the tools and dependencies of the project, run `niv update nixpkgs`, and restart the Nix shell.[↩︎](#fnref10)

11. Use this `.envrc` file to configure `direnv` for automatic refreshes for this project:

   ```
   #!/usr/bin/env bash
   use nix
   watch_file shell.nix
   watch_file nix/sources.json
   watch_file ftr.cabal
   ```

   [↩︎](#fnref11)
12. First, we would have to modify our `nix.conf` file to enable these commands by adding the line:

   ```
   experimental-features = nix-command flakes
   ```

   [↩︎](#fnref12)
13. This might take several hours to finish when run for the first time. Also, the `enableDwarf = false` config requires GHC \>= 9.6.[↩︎](#fnref13)

14. Another benefit of statically linked executables is, if you package them in Docker/OCI containers, the container sizes are much smaller than ones created for dynamically linked executables.[↩︎](#fnref14)

This post is a part of the series: **Nix for Haskell**.

1. **Getting Started** 👈
2. [Static Builds](https://abhinavsarkar.net/posts/nix-for-haskell-static-builds/?mtm_campaign=feed)

---

Thanks for reading this post via feed. Feeds are great, and you're great for using them. ♥

This post was originally published on [abhinavsarkar.net](https://abhinavsarkar.net/posts/nix-for-haskell/?mtm_campaign=feed).

### Like, repost, or comment on: ###

* [Fediverse](https://fantastic.earth/@abnv/113045814982790638)
* [Lobsters](https://lobste.rs/s/7puewz)
* [Reddit](https://www.reddit.com/r/NixOS/comments/1f44v98/)
* [My website](https://abhinavsarkar.net/posts/nix-for-haskell/?mtm_campaign=feed#comment-container)

Read more of my [posts](https://abhinavsarkar.net/posts/) and [notes](https://abhinavsarkar.net/notes/).

![](https://anna.abhinavsarkar.net/matomo.php?idsite=1&rec=1)