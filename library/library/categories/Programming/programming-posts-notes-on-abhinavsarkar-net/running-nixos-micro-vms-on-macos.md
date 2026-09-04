+++
title = "Running NixOS Micro VMs on MacOS"
description = "microvm.nix is a framework to run NixOS based micro VMs on various platforms. In particular, it can use vfkit to run micro VMs on macOS that use the [macOS virtualization fra"
date = "2026-04-09T00:00:00Z"
url = "https://abhinavsarkar.net/notes/2026-microvm-nix/"
author = "Abhinav Sarkar"
text = ""
lastupdated = "2026-07-21T09:17:41.433834703Z"
seen = false
+++

microvm.nix is a framework to run [NixOS](https://nixos.org) based micro [VMs](https://en.wikipedia.org/wiki/Virtual_machine) on various platforms. In particular, it can use [vfkit](https://github.com/crc-org/vfkit) to run micro VMs on macOS that use the [macOS virtualization framework](https://developer.apple.com/documentation/virtualization) to provide a more performant VM than [QEMU](https://www.qemu.org).

[microvm.nix](https://github.com/microvm-nix/microvm.nix) works well but the documentation is a bit lacking. I had to figure out some gotchas while setting this up on my MacBook Pro M4, so I decided to write this note.

This tutorial requires Nix and [Nix Darwin](https://github.com/nix-darwin/nix-darwin) to be installed on the macOS machine.

To build a micro VM, we need a NixOS builder machine running [AArch64](https://en.wikipedia.org/wiki/AArch64) Linux. Thankfully, it is really easy to set up one with Nix Darwin. Assuming we have Nix Darwin set up with a Nix flake like:

```
{
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-25.11-darwin";
    nix-darwin = {
      url = "github:LnL7/nix-darwin";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    inputs@{
      self,
      nixpkgs,
      nix-darwin,
      ...
    }:
    let
      system = "aarch64-darwin";
      pkgs = import nixpkgs { inherit system; };
    in
    {
      darwinConfigurations."Abhinavs-M4-MacBook-Pro" = nix-darwin.lib.darwinSystem {
        inherit system;
        specialArgs = { inherit inputs; };
        modules = [
          ./configuration.nix
        ];
      };
    };
}
```

First, we add Nix Linux builder config:

```
darwinConfigurations.${hostname} = nix-darwin.lib.darwinSystem {
  inherit system;
  modules = [
    ./configuration.nix
    {
      nix = {
        distributedBuilds = true;
        linux-builder = {
          enable = true;
          package = pkgs.darwin.linux-builder;
          systems = [ "aarch64-linux" ];
        };
      };
    }
  ];
};
```

Now, we switch the system config to build and start the Linux builder:

```
nix build .#darwinConfigurations.Abhinavs-M4-MacBook-Pro.system
sudo ./result/sw/bin/darwin-rebuild switch --flake .
```

We should verify that the builder is working:

```
sudo ssh linux-builder "uname -a"
# Should show "aarch64-linux"
```

It may take up to a minute for the builder to start. Once SSH works, we can proceed.

We create a `microvm.nix` file with the micro VM configuration:

```
{
  inputs,
  lib,
  pkgs,
  ...
}:
{
  networking.hostName = "my-microvm";
  services.getty.autologinUser = "root";
  microvm = {
    hypervisor = "vfkit";
    vcpu = 4;
    mem = 8192; # 8GB
    # graphics.enable = true;
    writableStoreOverlay = "/nix/.rw-store";
    volumes = [
      {
        image = "nix-store-overlay.img";
        mountPoint = "/nix/.rw-store";
        size = 40960; # 40GB
      }
    ];
    shares = [
      {
        proto = "virtiofs";
        tag = "ro-store";
        source = "/nix/store";
        mountPoint = "/nix/.ro-store";
      }
      {
        proto = "virtiofs";
        tag = "projects";
        source = "/Users/abhinav/Projects";
        mountPoint = "/projects";
      }
    ];
    interfaces = [
      {
        type = "user";
        id = "usernet";
        mac = "02:00:00:01:01:01";
      }
    ];
  };

  networking.interfaces.eth0.useDHCP = true;

  systemd.tmpfiles.rules = [
    "d /nix/.rw-store/nix-build 0755 root root -"
  ];

  nix = {
    settings = {
      sandbox = false;
      build-dir = "/nix/.rw-store/nix-build";
    };
    registry.nixpkgs.flake = inputs.nixpkgs;
  };
  system.stateVersion = "25.11";
}
```

This configures a micro VM with 4 VCPU, 8GB RAM and 40 GB disk. The disk image is used to store the Nix packages downloaded within the VM. It is mounted at `/nix/.rw-store`. The host’s Nix store is mounted read-only at `/nix/.ro-store`. The `writableStoreOverlay` option combines these two with overlays to create the VM’s Nix store at `/nix/store`.

We can share additional directories from the host and mount them in the VM, as we do here for the `/Users/abhinav/Projects` directory from the macOS host.

Next couple of lines set up networking in the VM. The vfkit hypervisor supports only NAT networking. This means:

* The VM can make outgoing connections to the host/internet.
* The host cannot initiate connections to the VM.

There are ways to work around this using [gvisor-tap-vsock](https://github.com/containers/gvisor-tap-vsock) and [vmnet-helper](https://github.com/nirs/vmnet-helper), but we are not going into it here.

We can uncomment the `graphics.enable = true;` line if we want a graphical NixOS VM.

Finally, the workaround for the big gotcha! By default Nix does builds in a sandbox and the sandbox is created (and deleted) on the root filesystem. However, microvm.nix uses a temporary filesystem residing in RAM for the root filesystem. This means that the Nix builds may cause the root FS and RAM to fill up, causing out-of-memory or out-of-disk-space errors. To prevent that, we disable the sandbox and set the build directory to be at `/nix/.rw-store/nix-build` on the disk image we mounted.

Next, we integrate the VM config with the Nix Darwin flake:

```
{
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-25.11-darwin";
    nix-darwin = {
      url = "github:LnL7/nix-darwin";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    microvm = {
      url = "github:microvm-nix/microvm.nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    inputs@{
      self,
      nixpkgs,
      nix-darwin,
      microvm,
      ...
    }:
    let
      system = "aarch64-darwin";
      microvm-system = builtins.replaceStrings [ "-darwin" ] [ "-linux" ] system;
      pkgs = import nixpkgs { inherit system; };
      microvm-run =
        let
          runner = self.nixosConfigurations.microvm.config.microvm.declaredRunner;
        in
        pkgs.writeShellScriptBin "microvm-run" ''
          cleanup() { stty "$(stty -g)"; }
          trap cleanup EXIT
          stty intr ^] susp ^] quit ^]
          exec ${runner}/bin/microvm-run
        '';
    in
    {
      darwinConfigurations."Abhinavs-M4-MacBook-Pro" = nix-darwin.lib.darwinSystem {
        inherit system;
        specialArgs = { inherit inputs; };
        modules = [
          ./configuration.nix
          {
            nix = {
              distributedBuilds = true;
              linux-builder = {
                enable = true;
                package = pkgs.darwin.linux-builder;
                systems = [ "aarch64-linux" ];
              };
            };
            environment.systemPackages = [ microvm-run ];
          }
        ];
      };
      nixosConfigurations.microvm = nixpkgs.lib.nixosSystem {
        system = microvm-system;
        specialArgs = { inherit inputs; };
        modules = [
          microvm.nixosModules.microvm
          ./microvm.nix
          { microvm.vmHostPackages = nixpkgs.legacyPackages.${system}; }
        ];
      };
    };
}
```

Let’s go over the tricky bits. The `microvm-run` wrapper script rebinds Ctrl + ] to send the interrupt, suspend and quit signals instead of the usual Ctrl + C so that we can use Ctrl + C inside the VM without it causing the VM to shut down. We add the script to our system packages. Lastly, the `nixosConfigurations.microvm` defines the actual micro VM using the `microvm.nix` file.

Finally, we build and install the micro VM:

```
nix build .#darwinConfigurations.Abhinavs-M4-MacBook-Pro.system
sudo ./result/sw/bin/darwin-rebuild switch --flake .
```

And, now we can run it from any directory:

```
microvm-run
```

Note that the disk image file will be created in the directory in which we run the above command.

After this, we can remove the Linux builder config and switch again to stop and delete it.

Now we have a performant micro VM running NixOS to play around with in our macOS machine. That’s all I had for this note. I hope this helps.

 If you have any questions or comments, please leave a comment below. If you liked this post, please share it. Thanks for reading!

---

Thanks for reading this post via feed. Feeds are great, and you're great for using them. ♥

This post was originally published on [abhinavsarkar.net](https://abhinavsarkar.net/notes/2026-microvm-nix/?mtm_campaign=feed).

### Like, repost, or comment on: ###

* [Fediverse](https://fantastic.earth/@abnv/116375850385760707)
* [Lobsters](https://lobste.rs/s/jqwrhe)
* [Reddit](https://www.reddit.com/r/NixOS/comments/1sgvqmi/)
* [Discourse](https://discourse.nixos.org/t//76939)
* [My website](https://abhinavsarkar.net/notes/2026-microvm-nix/?mtm_campaign=feed#comment-container)

Read more of my [posts](https://abhinavsarkar.net/posts/) and [notes](https://abhinavsarkar.net/notes/).

![](https://anna.abhinavsarkar.net/matomo.php?idsite=1&rec=1)