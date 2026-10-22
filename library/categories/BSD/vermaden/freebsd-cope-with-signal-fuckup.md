+++
title = "FreeBSD Cope with Signal Fuckup"
description = "The main credit for this article goes – Signal Desktop on FreeBSD Using Linux Binary Compatibility – here. I used linux-browser-installer all this time on FreeBSD with Ubuntu system at /compat/ubuntu … but when I tried to install Signal Desktop there it said that its too old vers"
date = "2026-10-10T17:47:42Z"
url = "https://vermaden.wordpress.com/2026/10/10/freebsd-cope-with-signal-fuckup/"
author = "vermaden"
text = ""
lastupdated = "2026-10-21T11:46:07.861054731Z"
seen = false
+++

The main credit for this article goes – [Signal Desktop on FreeBSD Using Linux Binary Compatibility](https://unixdigest.com/tutorials/how-to-install-signal-desktop-on-freebsd-using-the-linux-binary-compatibility.html) – here. I used [linux-browser-installer](https://github.com/mrclksr/linux-browser-installer) all this time on FreeBSD with Ubuntu system at **/compat/ubuntu** … but when I tried to install Signal Desktop there it said that its too old version of Ubuntu – because it was **focal**. The mentioned guide opened my eyes that I can use something more recent like **trixie** for example.

When I first got Signal Desktop working in this Debian system I really hated how ugly the fonts look – kinda like [XKCD:1015](https://xkcd.com/1015/) curse.

![](https://vermaden.wordpress.com/wp-content/uploads/2026/10/xkcd.kerning.png)

So with some tinkering I was able to fix that.

One may also joke that this type of article title will convert into a series as [FreeBSD Cope with WiFi Fuckup](https://vermaden.wordpress.com/2022/09/14/freebsd-cope-with-wifi-fuckup/) already happened in the past ![🙂](https://s0.wp.com/wp-content/mu-plugins/wpcom-smileys/twemoji/2/72x72/1f642.png)

Lets start the configuration.

Debian
==========

Enable and start Linux Binary Compatibility mode on FreeBSD.

```
freebsd # service enable linux

freebsd # service linux start

```

We need debootstrap(8) to install Debian system in **/compat/debian** dir.

```
freebsd # pkg install debootstrap

```

The default path for Linux Compatibility Layer on FreeBSD is **/compat/linux** so to not interfere with that as its RHEL clone based – we will use **/compat/debian** instead.

```
freebsd # echo compat.linux.emul_path=/compat/debian >> /etc/sysctl.conf

```

We need something more recent then **focal** that is used with [linux-browser-installer](https://github.com/mrclksr/linux-browser-installer) project – and as shown in the mentioned article the **trixie** is proven to work. Lets populate **/compat/debian** with it.

```
freebsd # debootstrap trixie /compat/debian
```

It will take some time – on my 2018 ThinkPad T480 laptop and 30Mbps network connection it took less then 5 minutes.

As we will want to run X11 apps some additional dirs needs to be mounted with **/etc/fstab** config – that is on the FreeBSD host side – not inside the Linux **/compat/debian** dir.

```
freebsd # cat << FSTAB >> /etc/fstab

# DEBIAN
  linprocfs       /compat/debian/proc           linprocfs  rw,failok,late                    0 0
  linsysfs        /compat/debian/sys            linsysfs   rw,failok,late                    0 0
  devfs           /compat/debian/dev            devfs      rw,failok,late                    0 0
  fdescfs         /compat/debian/dev/fd         fdescfs    rw,failok,late,linrdlnk           0 0
  tmpfs           /compat/debian/dev/shm        tmpfs      rw,failok,late,size=1g,mode=1777  0 0
  /tmp            /compat/debian/tmp            nullfs     rw,failok,late                    0 0
  /var/run/dbus   /compat/debian/run/dbus       nullfs     rw,failok,late                    0 0

FSTAB

```

I added **failok** option so if anything ‘bad’ happens FreeBSD system will just ignore it and boot normally.

Now create dirs that does not already exist and mount these filesystems.

```
freebsd # mkdir -p /compat/debian/run/dbus

freebsd # mount -val
linsysfs on /compat/debian/sys (linsysfs, local, fsid 1eff008a8a000000, vnodes: count 2 )
devfs on /compat/debian/dev (devfs, fsid 1fff007171000000, vnodes: count 2 )
fdescfs on /compat/debian/dev/fd (fdescfs, fsid 20ff005959000000, vnodes: count 2 )
tmpfs on /compat/debian/dev/shm (tmpfs, local, fsid 21ff008787000000, vnodes: count 2 )
/tmp on /compat/debian/tmp (nullfs, local, fsid 22ff002929000000, vnodes: count 2 )
/var/run/dbus on /compat/debian/run/dbus (nullfs, local, fsid 23ff002929000000, vnodes: count 2 )

```

We also need to make sure of proper permissions for some of them.

```
freebsd # chmod 1777 /compat/debian/dev/shm

```

We will now update and upgrade our Debian system.

```
freebsd # chroot /compat/debian apt update

freebsd # chroot /compat/debian apt upgrade
Summary:                        
  Upgrading: 0, Installing: 0, Removing: 0, Not Upgrading: 0

```

We will also need some libraries for GPU stuff – along with their deps.

```
freebsd # chroot /compat/debian apt install -y libgl1 \
                                               libegl1 \
                                               libgl1-mesa-dri \
                                               libglx-mesa0 \
                                               libgbm1 \
                                               libvulkan1
```

We will also need to add **messagebus** group for DBus … and (re)configuration about it.

```
freebsd # chroot /compat/debian groupadd --system messagebus

freebsd # chroot /compat/debian getent group messagebus

freebsd # chroot /compat/debian dpkg --configure dbus

freebsd # chroot /compat/debian dpkg --configure -a

```

Signal Desktop
==========

Now lets try to install Signal Desktop … the official instructions use too much **sudo(8)** so we will simplify them.

![](https://vermaden.wordpress.com/wp-content/uploads/2026/10/singal-install-linux-instructions.png)

Simplified steps below.

```
freebsd # fetch -o - https://updates.signal.org/desktop/apt/keys.asc \
            | gpg --dearmor > /compat/debian/usr/share/keyrings/signal-desktop-keyring.gpg

freebsd # fetch -o /compat/debian/etc/apt/sources.list.d/signal-desktop.sources \
            https://updates.signal.org/static/desktop/apt/signal-desktop.sources

```

Now we can update the repos and install **signal-desktop** package.

```
freebsd # chroot /compat/debian apt update
Get:1 https://updates.signal.org/desktop/apt xenial InRelease [5963 B]
Hit:2 https://deb.debian.org/debian trixie InRelease   
Get:3 https://updates.signal.org/desktop/apt xenial/main amd64 Packages [101 kB]
Fetched 107 kB in 0s (362 kB/s)
All packages are up to date.    

freebsd # chroot /compat/debian apt install -y signal-desktop

```

Next we need to prepare the Signal Desktop start script. Most of it is taken from the [linux-browser-installer](https://github.com/mrclksr/linux-browser-installer) project. I will also notify its maintainer that newer **trixie** seems to work correctly – maybe he will move to it from older **focal** release.

```
freebsd # cat /usr/local/bin/linux-signal-desktop
#!/bin/sh

get_pa_sock_path()
{
  PA_SOCK_PATH=$( sockstat \
    | awk -v me=$(whoami) -F'[ \t]+' '
        $1 == me && $2 == "pulseaudio" && $6 ~ /native/ {
          print $6;
          exit 0
        }' )
}

get_pa_sock_path

if [ ! -S "${PA_SOCK_PATH}" ]
then
  while killall pulseaudio
  do
    sleep 0.5
  done
  pulseaudio --start
  get_pa_sock_path
fi

[ -S "${PA_SOCK_PATH}" ] && export PULSE_SERVER=unix:${PA_SOCK_PATH}

/compat/debian/opt/Signal/signal-desktop --no-sandbox \
                                         --disable-gpu \
                                         --no-zygote \
                                         --in-process-gpu \
                                         --use-tray-icon \
                                         --disable-font-subpixel-positioning \
                                         --disable-lcd-text \
                                         --font-render-hinting=none

```

Also in colored form below.

![](https://vermaden.wordpress.com/wp-content/uploads/2026/10/script-signal-desktop.png)

Now the Signal Desktop should run – but fonts look like shit on my system.

![](https://vermaden.wordpress.com/wp-content/uploads/2026/10/signal-fonts-ugly.png)

To fix that we need to install some stuff and configure it also.

```
freebsd # chroot /compat/debian apt install fontconfig

```

Next we need to create simple and working font rendering config because the default one makes things only worse.

```
freebsd # ls /compat/debian/etc/fonts/conf.d
10-hinting-slight.conf                          50-user.conf
10-scale-bitmap-fonts.conf                      51-local.conf
10-sub-pixel-none.conf                          57-dejavu-sans-mono.conf
10-yes-antialias.conf                           57-dejavu-sans.conf
11-lcdfilter-default.conf                       57-dejavu-serif.conf
20-unhint-small-dejavu-lgc-sans-mono.conf       58-dejavu-lgc-sans-mono.conf
20-unhint-small-dejavu-lgc-sans.conf            58-dejavu-lgc-sans.conf
20-unhint-small-dejavu-lgc-serif.conf           58-dejavu-lgc-serif.conf
20-unhint-small-dejavu-sans-mono.conf           60-generic.conf
20-unhint-small-dejavu-sans.conf                60-latin.conf
20-unhint-small-dejavu-serif.conf               65-fonts-persian.conf
20-unhint-small-vera.conf                       65-nonlatin.conf
30-metric-aliases.conf                          69-unifont.conf
40-nonlatin.conf                                70-no-bitmaps-except-emoji.conf
45-generic.conf                                 80-delicious.conf
45-latin.conf                                   90-synthetic.conf
48-spacing.conf                                 README
49-sansserif.conf

```

Yep … way too much – lets fix that.

```
freebsd # cd /compat/debian/etc/fonts

freebsd # pwd
/compat/debian/etc/fonts

freebsd # mv conf.d conf.d.OFF

freebsd # mkdir conf.d

freebsd # cp /compat/debian/usr/share/fontconfig/conf.avail/10-hinting-none.conf   conf.d/

freebsd # cp /compat/debian/usr/share/fontconfig/conf.avail/10-sub-pixel-none.conf conf.d/

freebsd # cp /compat/debian/usr/share/fontconfig/conf.avail/10-unhinted.conf       conf.d/

freebsd # cp /compat/debian/usr/share/fontconfig/conf.avail/10-yes-antialias.conf  conf.d/

freebsd # cp /compat/debian/usr/share/fontconfig/conf.avail/11-lcdfilter-none.conf conf.d/

freebsd # chroot /compat/debian fc-cache -fsv

freebsd # chroot /compat/debian fc-cache -fv

```

Lets check how NOW the Signal Desktop font rendering looks like.

![](https://vermaden.wordpress.com/wp-content/uploads/2026/10/signal-fonts-nice.png)

Yep … much better.

Google Chrome
==========

Now … I was using the [linux-browser-installer](https://github.com/mrclksr/linux-browser-installer) project to use Google Chrome – the one with ugly DRM stuff like Widevine just to watch paid F1 TV stream … I know that its possible to watch Widevine stuff on Chromium on FreeBSD with compiled **www/linux-widevine-cdm** port … and it works – but its slower in full screen mode – like not even able to play it without hiccups.

… but my Google Chrome install is in the **/compat/ubuntu** and now Signal Desktop is in the **/compat/debian** … and I do not want to start playing with FreeBSD Linux Jails for such simple things as ‘desktop’ to provide two different Jails for just two apps … so I will just add Google Chrome inside that new **/compat/debian** place.

First keys and repos.

```
freebsd # fetch -o - https://dl.google.com/linux/linux_signing_key.pub \
            | gpg --dearmor -o /compat/debian/usr/share/keyrings/linux_signing_key.gpg

freebsd # echo "deb [signed-by=/usr/share/keyrings/linux_signing_key.gpg] http://dl.google.com/linux/chrome/deb/ stable main" \
            > /compat/debian/etc/apt/sources.list.d/google-chrome.list

freebsd # chroot /compat/debian apt update

freebsd # chroot /compat/debian apt install -y google-chrome-stable

```

Next the Google Chrome start script – also based on the same script.

```
freebsd # cat /usr/local/bin/linux-google-chrome
#!/bin/sh

get_pa_sock_path()
{
  PA_SOCK_PATH=$( sockstat \
    | awk -v me=$(whoami) -F'[ \t]+' '
        $1 == me && $2 == "pulseaudio" && $6 ~ /native/ {
          print $6;
          exit 0
        }' )
}

get_pa_sock_path

if [ ! -S "${PA_SOCK_PATH}" ]
then
  while killall pulseaudio
  do
    sleep 0.5
  done
  pulseaudio --start
  get_pa_sock_path
fi

[ -S "${PA_SOCK_PATH}" ] && export PULSE_SERVER=unix:${PA_SOCK_PATH}

/compat/debian/opt/google/chrome/chrome --no-sandbox \
                                        --test-type \
                                        --no-zygote \
                                        --in-process-gpu \
                                        --disable-dev-shm-usage

```

Also in colored form below.

![](https://vermaden.wordpress.com/wp-content/uploads/2026/10/script-google-chrome.png)

Lets try how it works.

![](https://vermaden.wordpress.com/wp-content/uploads/2026/10/google.chrome.f1tv.jpg)

Seems to work … and if it works with F1 TV it means it will also work with Spotify and Netflix and other things like that.

Summary
==========

So after some frustrations with lack of native recent Signal Desktop on FreeBSD the official Linux version seems to work well in that Debian environment. That also shows how good and mature the FreeBSD implementation of Linux Binary Compatibility feature is. I now run FreeBSD with Linux GPU drivers with some additional [Linux KPI](https://wiki.freebsd.org/LinuxKPI) (or Yippee Ki-Yay maybe?) interface … same for many WiFi drivers. I now added Linux version of Signal Desktop to the Linux version of Google Chrome that I already run earlier … I do not like where this is going.

One could ask … why just not use Linux instead? … and that is a valid question. I use FreeBSD for my reasons described here in [Quare FreeBSD?](https://vermaden.wordpress.com/2020/09/07/quare-freebsd/) article and I know that FreeBSD project is not ‘big enough’ to do all these things the proper and native way – that is why some ‘shortcuts’ are needed.

I wish we all would live in a better world – both FreeBSD and not FreeBSD related … but we have what we have. I remember quite interesting quote about this from **J. Robert Oppenheimer** which goes like *“The Optimist thinks this is the best of all possible worlds, the Pessimist fears it is true.”*

Take care.