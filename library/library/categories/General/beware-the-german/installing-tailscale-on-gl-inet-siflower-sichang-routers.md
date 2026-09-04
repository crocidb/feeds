+++
title = "Installing Tailscale on GL.iNet SiFlower (SiChang) routers"
description = '<subvia <a rel="external" href="https://gist.github.com/iGerman00/b45f78685f7db0fa264edf7a0d81bd50"https://gist.github.com/iGerman00/b45f78685f7db0fa264edf7a0d81bd50</a</subInstalling Tailscale on GL.iNet SiFlower (SiChang) routers[](installing-tailscale-on-gl-inet-siflower'
date = "2023-07-14T00:00:00Z"
url = "https://igerman.cc/blog/tailscale-siflower/"
author = "german s."
text = ""
lastupdated = "2026-06-08T12:43:31.139277148Z"
seen = true
+++

<sub>via <a rel="external" href="https://gist.github.com/iGerman00/b45f78685f7db0fa264edf7a0d81bd50">https://gist.github.com/iGerman00/b45f78685f7db0fa264edf7a0d81bd50</a></sub>

Installing Tailscale on GL.iNet SiFlower (SiChang) routers[#](#installing-tailscale-on-gl-inet-siflower-sichang-routers)
==========

I have no experience creating opkg packages for OpenWRT, so manual installation it is!

Automatic installation[#](#automatic-installation)
==========

[Lanrat's Tailscale Repository](https://lanrat.github.io/openwrt-tailscale-repo)[#](#lanrat-s-tailscale-repository)
----------

It's not compressed as of writing this, but it's much easier to install, and now supports our architecture

Manual compilation and installation[#](#manual-compilation-and-installation)
==========

### Prerequisites[#](#prerequisites)  ###

1. A GL.iNet SiFlower router, like the Opal (GL-SFT1200)
2. A Linux system (or WSL2 on Windows) to build Tailscale

### Building Tailscale[#](#building-tailscale)  ###

1. Clone the Tailscale repository:

```
git clone https://github.com/tailscale/tailscale.git
```

1. Install Golang: https://golang.org/doc/install

* Verify that Go is installed correctly:

```
go version
```

1. Install the latest (important!) version of UPX: https://github.com/upx/upx/releases/latest
2. Install `binutils-mipsel-linux-gnu`

```
sudo apt install binutils-mipsel-linux-gnu
mipsel-linux-gnu-strip --version
```

1. Build Tailscale:

```
# Change to the Tailscale directory:
cd tailscale

# Optionally switch to a specific version:
# git checkout tags/v1.44.0 -b v1.44.0

# Build the combined binary - mipsel, hardfloat (?), linked statically, stripped, verbose:
# Note: mipsel = mipsle for Golang
GOOS=linux GOARCH=mipsle GOMIPS=hardfloat CGO_ENABLED=0 go build -v -o tailscale.combined -tags ts_include_cli -trimpath -ldflags="-s -w" ./cmd/tailscaled
```

1. Compress the binary:

```
mipsel-linux-gnu-strip tailscale.combined
upx --lzma --best -o tailscale.upx ./tailscale.combined
```

### Installing Tailscale[#](#installing-tailscale)  ###

1. Copy the `tailscale.upx` binary to the router:

```
scp tailscale.upx root@192.168.8.1:/root # or whatever your router's IP is
```

1. SSH into the router:

```
ssh root@192.168.8.1 # or whatever your router's IP is
```

1. Make the binary executable:

```
chmod +x tailscale.upx
```

1. Verify that the binary works (keep in mind that it's UPX-compressed, so it will take a few seconds to decompress):

```
./tailscale.upx -version
```

1. [Create links](<https://tailscale.com/kb/1207/small-tailscale/#:~:text=By creating symlinks to the combined binary, you can see how it can run as both the daemon and the CLI:>):

```
ln -s tailscale.upx tailscale
ln -s tailscale.upx tailscaled
```

1. Create init script:

```
cat << EOF > /etc/init.d/tailscale
#!/bin/sh /etc/rc.common

# Copyright 2020 Google LLC.
# SPDX-License-Identifier: Apache-2.0

USE_PROCD=1
START=99
STOP=1

start_service() {
  procd_open_instance
  procd_set_param command /root/tailscaled

  # Set the port to listen on for incoming VPN packets.
  # Remote nodes will automatically be informed about the new port number,
  # but you might want to configure this in order to set external firewall
  # settings.
  procd_append_param command --port 41641

  # OpenWRT /var is a symlink to /tmp, so write persistent state elsewhere.
  procd_append_param command --state /etc/config/tailscaled.state

  # Persist files for TLS cert & Taildrop files
  procd_append_param command --statedir /etc/tailscale/

  procd_set_param respawn
  procd_set_param stdout 1
  procd_set_param stderr 1

  procd_close_instance
}

stop_service() {
  /root/tailscaled --cleanup
}
EOF
```

1. Make the init script executable:

```
chmod +x /etc/init.d/tailscale
```

1. Enable the init script:

```
/etc/init.d/tailscale enable
```

1. Verify that the service is enabled:

```
ls /etc/rc.d/S*tailscale*
```

1. Start the service:

```
/etc/init.d/tailscale start
```

1. Verify that the service is running:

```
ps | grep tailscaled
```

1. Hope for the best and try to up tailscale:

```
/root/tailscale up --accept-dns=false
```

If you get a segmentation fault, you might want to try skipping the UPX compression step altogether, but mind that the binary will be 30MB instead of 5.4MB. Mind the binary name being `tailscale.combined` instead of `tailscale.upx` in the steps.[#](#if-you-get-a-segmentation-fault-you-might-want-to-try-skipping-the-upx-compression-step-altogether-but-mind-that-the-binary-will-be-30mb-instead-of-5-4mb-mind-the-binary-name-being-tailscale-combined-instead-of-tailscale-upx-in-the-steps)
----------

>
>
> comment: Potential fix for the UPX segfault may be something like compiling 2 binaries separately - tailscale and tailscaled, and compressing them individually, but I haven't explored that yet.
>
>