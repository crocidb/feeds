+++
title = "Fedora"
description = "Fedora is the consumer-oriented (i.e., free) flavor of RedHat. Throughout the years it has been (on and off) my distribution of choice for "
date = "2006-04-08T20:22:00Z"
url = "https://taoofmac.com/space/os/linux/distributions/fedora?utm_content=atom"
author = "Rui Carmo"
text = ""
lastupdated = "2026-10-29T10:49:00.800638091Z"
seen = false
+++

[Fedora](https://fedoraproject.org?utm_campaign=unsolicited_traffic&utm_medium=web&utm_source=taoofmac.com) is the consumer-oriented (i.e., free) flavor of [RedHat](/space/os/linux/distributions/redhat). Throughout the years it has been (on and off) my distribution of choice for desktop purposes, since it is extremely well organized and easy to maintain.

It is not, however, perfect, and I am a bit weary of its semi-annual release cycles, which are more prone to breakage than [Ubuntu](/space/os/linux/distributions/ubuntu).

[

Resources
----------

](/space/os/linux/distributions/fedora#resources)

|  Category  |                                                         Date                                                         |                                                       Link                                                       |                                                                                                                                           Notes                                                                                                                                            |
|------------|----------------------------------------------------------------------------------------------------------------------|------------------------------------------------------------------------------------------------------------------|--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
|Repositories|                                                         2025                                                         |   [Terra](https://terra.fyralabs.com/?utm_campaign=unsolicited_traffic&utm_medium=web&utm_source=taoofmac.com)   |A complementary package repository that has a number of useful off-beat packages (including MS Core and Cleartype fonts), which can be installed in Silverblue using `curl -fsSL https://github.com/terrapkg/subatomic-repos/raw/main/terra.repo | pkexec tee > /etc/yum.repos.d/terra.repo`|
|  Variants  |                                                         2026                                                         |[Luma](https://github.com/SimplyLuma/luma?utm_campaign=unsolicited_traffic&utm_medium=web&utm_source=taoofmac.com)|                                             Open-source OS with a shared application platform for desktop, tablet and mobile; the current x86\_64 desktop composition is Fedora-based, while device profiles do not establish release support                                              |
|    2023    |[Bazzite](https://github.com/ublue-os/bazzite?utm_campaign=unsolicited_traffic&utm_medium=web&utm_source=taoofmac.com)|                      A gaming-oriented distribution that aims to be a SteamOS replacement.                       |                                                                                                                                                                                                                                                                                            |

[

Legacy Notes
----------

](/space/os/linux/distributions/fedora#legacy-notes)

Legacy content follows.

* Fedora Core 5

  * [Toshiba M100](/space/com/toshiba/m100) - [First impressions](/space/blog/2006/03/22).
  * [Toshiba Tecra 8000/8100](/space/com/toshiba/tecra_8000/8100) - Installs and runs without a hitch with [SELinux](SELinux) disabled. Suspend/resume seems to work, but still somewhat inconsistently. [Cisco](Cisco) Aironet, Audio, all OK.
  * [VMware](VMware), Desktops - Flawless installs. The minimal server install is a great way to get started (provided you’re used to managing boxes via the [CLI](/space/cli)).

* Fedora Core 4:

  * Updated Core 3 install on two desktops flawlessly
  * All the package manager’s prompts to insert a CD are named “untitled window”. And it asked me for the *same* CD time and time again. Is this dumb or what?
  * [Evolution](/space/apps/evolution) still crashes around 30 seconds into normal use (and the [Exchange](/space/com/microsoft/exchange) connector still doesn’t work.)
  * [Gnome](/space/apps/gnome) 2.10, sure, but without the clever bits: [Beagle](/space/apps/gnome/beagle), [TomBoy](apps/gnome/applications/tomboy), wireless-applet, etc.
  * [Toshiba/M100]:
    * [CPU](/space/Wikipedia:CPU) speed scaling worked (but no hibernation or suspend options visible, or enabled on the default install)
    * Built-in [Wi-Fi](/space/networking/wi-fi) support sucks (the ipw2100 [Wi-Fi](/space/networking/wi-fi) card is listed but as a *standard* [Ethernet](/space/networking/ethernet) interface, and cannot be configured via the [GUI](https://en.wikipedia.org/wiki/GUI?utm_campaign=unsolicited_traffic&utm_medium=web&utm_source=taoofmac.com)). Had to download the [card’s firmware](http://atrpms.net/dist/common/ipw2100-firmware/?utm_campaign=unsolicited_traffic&utm_medium=web&utm_source=taoofmac.com), install it manually, edit the relevant ifcfg-ethX file to set the interface type to Wireless and reboot. For how long are we going to put up with this idiotic nonsense?
    * Inserting a second battery freezes the machine – hard. A **major** bug that I had come across earlier on other distros, and the kind that some kernel developer ought to be flogged over.

[

### Codec Notes ###

](/space/os/linux/distributions/fedora#codec-notes)

To get [MP3](/space/audio/mp3) support in Fedora Core 4, install `gstreamer-plugins-mp3` from the following [yum](/space/cli/yum) repository:

```
$ cat /etc/yum.repos.d/livna.repo
[livna]
name=Livna.org Fedora Compatible Packages
baseurl=http://rpm.livna.org/fedora/$releasever/$basearch/RPMS.lvn
gpgcheck=1

```

[](/space/os/linux/distributions/fedora#fedora-core-3-4-and-apache-s-userdir)

### [](/space/os/linux/distributions/fedora#fedora-core-3-4-and-apache-s-userdir)[Fedora](/space/os/linux/distributions/fedora) Core 3/4 and Apache‘s UserDir: ###

* Symptom: getting 403 Forbidden errors on \~user pages.
* Cause: `mod_userdir` will not work out of the box due to `SELinux` paranoia.
* Cure: do `chcon -R -t httpd_user_content_t public_html/`, or, if you’re running a development box, use `system-config-securitylevel` to disable `SELinux` on `httpd` and *reboot*. Yes, welcome to the wonderful world of runtime paranoia.
* Stupidity Rating: 20/20. It should at least be mentioned in the default `httpd.conf`.

[](/space/os/linux/distributions/fedora#fedora-core-1-and-yum)

[](/space/os/linux/distributions/fedora#fedora-core-1-and-yum)[Fedora](/space/os/linux/distributions/fedora) Core 1 and [yum](/space/cli/yum)
----------

Fedora Legacy repositories require manual updates to your `yum.conf`.