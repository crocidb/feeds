+++
title = "TIL: Noctalia Shell Lock on Suspend"
description = "This is a little bit of follow-up to my MiniBook X review – I keep using it routinely (especially when we travel for leisure) and love the little thing to bits, but I’ve been wanting to run it mostly on power saving mode to reap the most benefit "
date = "2026-05-20T22:40:00Z"
url = "https://taoofmac.com/space/til/2026/05/20/2240?utm_content=atom"
author = "Rui Carmo"
text = ""
lastupdated = "2026-05-21T08:46:45.576802209Z"
seen = false
+++

This is a little bit of follow-up to my [MiniBook X review](/space/reviews/2025/05/15/2230) – I keep using it routinely (especially when we travel for leisure) and love the little thing to bits, but I’ve been wanting to run it mostly on power saving mode to reap the most benefit out of the hardware (and battery, of course), so I started looking at desktop environment alternatives.

Yes, I could already get a full afternoon (and then some) out of it, but Apple Silicon has spoiled me as far as battery life expectations go, and [GNOME](/space/apps/gnome) has a little bit too much baggage for that kind of extended use.

Since I spend 90% of my time on it writing or coding and still have a penchant for keyboard-driven desktops, I initially switched to [Fedora Sway Atomic](https://fedoraproject.org/atomic-desktops/sway/?utm_source=taoofmac.com&utm_medium=web&utm_campaign=unsolicited_traffic&utm_content=external_link) (gotta love being able to swap environments with a single command…), but later installed [Niri](https://github.com/YaLTeR/niri?utm_source=taoofmac.com&utm_medium=web&utm_campaign=unsolicited_traffic&utm_content=external_link) and [Noctalia Shell](https://gitlab.com/nicofee/noctalia-shell?utm_source=taoofmac.com&utm_medium=web&utm_campaign=unsolicited_traffic&utm_content=external_link) because I *really* like both the idea of a scrolling window environment and the sheer polish of the whole thing–even if there are some rough edges here and there.

The one thing that annoyed me to no end, though, was locking on suspend, which [Noctalia Shell](https://gitlab.com/nicofee/noctalia-shell?utm_source=taoofmac.com&utm_medium=web&utm_campaign=unsolicited_traffic&utm_content=external_link) should do but apparently doesn’t in [Fedora](/space/os/linux/distributions/fedora), so I had to resort to two hacks:

[

Locking on Lid Close
----------

](/space/til/2026/05/20/2240#locking-on-lid-close)

The first was adding a `switch-events` block to the [Niri](https://github.com/YaLTeR/niri?utm_source=taoofmac.com&utm_medium=web&utm_campaign=unsolicited_traffic&utm_content=external_link) config to trigger the lock screen when the lid closes:

```
switch-events {
    lid-close {
        spawn "qs" "-c" "noctalia-shell" "ipc" "call" "lockScreen" "lock"
    }
}

```

[

Idle Lock via swayidle
----------

](/space/til/2026/05/20/2240#idle-lock-via-swayidle)

The second was setting up a `swayidle` systemd user service to lock after 5 minutes of inactivity and suspend after 10:

```
[Unit]
Description=SwayIdle Service
After=graphical-session.target

[Service]
Type=simple
ExecStart=/usr/sbin/swayidle -w \
    timeout 300 'qs -c noctalia-shell ipc call lockScreen lock' \
    timeout 600 'qs -c noctalia-shell ipc call sessionMenu lockAndSuspend'
Restart=on-failure
TimeoutSec=30

[Install]
WantedBy=graphical-session.target

```

This last one feels extremely gauche and I hope to find a better way, but I guess this comes with the territory. I don’t really care about having a trendy Wayland desktop (I just want a *dead simple* one with a bit of polish), but I hope this kind of hacks won’t be necessary for much longer.

Oh, and of course I set `gsettings set org.gnome.desktop.wm.preferences button-layout 'close,minimize,maximize:appmenu'` to match macOS decorations.