+++
title = "330: Happy Holidays, All(an)"
description = "Authentication Vulnerabilities in OpenBSD, NetBSD 9.0 RC1 is available, Running FreeNAS on a DigitalOcean droplet, NomadBSD 1.3 is here, at e2k19 nobody can hear you scream, and more.Headlines[Authentication vulnerabilities in OpenBSD](https://www.openwall.com/lists"
date = "2019-12-26T13:00:00Z"
url = "https://www.bsdnow.tv/330"
author = "feedback@bsdnow.tv (JT Pennington)"
text = ""
lastupdated = "2026-03-26T14:37:50.577610183Z"
seen = false
+++

Authentication Vulnerabilities in OpenBSD, NetBSD 9.0 RC1 is available, Running FreeNAS on a DigitalOcean droplet, NomadBSD 1.3 is here, at e2k19 nobody can hear you scream, and more.

Headlines
----------

### [Authentication vulnerabilities in OpenBSD](https://www.openwall.com/lists/oss-security/2019/12/04/5) ###

* We discovered an authentication-bypass vulnerability in OpenBSD's authentication system: this vulnerability is remotely exploitable in smtpd, ldapd, and radiusd, but its real-world impact should be studied on a case-by-case basis. For example, sshd is not exploitable thanks to its defense-in-depth mechanisms.
* From the manual page of login.conf:

>
>
> OpenBSD uses BSD Authentication, which is made up of a variety of authentication styles. The authentication styles currently provided are:  
>  passwd Request a password and check it against the password in the master.passwd file. See login\_passwd(8).  
>  skey Send a challenge and request a response, checking it with S/Key (tm) authentication. See login\_skey(8).  
>  yubikey Authenticate using a Yubico YubiKey token. See login\_yubikey(8).  
>  For any given style, the program /usr/libexec/auth/login\_style is used to  
>  perform the authentication. The synopsis of this program is:  
>  /usr/libexec/auth/login\_style [-v name=value] [-s service] username class
>
>

* This is the first piece of the puzzle: if an attacker specifies a username of the form "-option", they can influence the behavior of the authentication program in unexpected ways.

>
>
> ```
>  login_passwd [-s service] [-v wheel=yes|no] [-v lastchance=yes|no] user [class] The service argument specifies which protocol to use with the invoking program.  The allowed protocols are login, challenge, and response.  (The challenge protocol is silently ignored but will report success as passwd-style authentication is not challenge-response based).
>
> ```
>
>

* This is the second piece of the puzzle: if an attacker specifies the username "-schallenge" (or "-schallenge:passwd" to force a passwd-style authentication), then the authentication is automatically successful and therefore bypassed.
* Case study: smtpd
* Case study: ldapd
* Case study: radiusd
* Case study: sshd
* Acknowledgments: We thank Theo de Raadt and the OpenBSD developers for their incredibly quick response: they published patches for these vulnerabilities less than 40 hours after our initial contact. We also thank MITRE's CVE Assignment Team.

---

### [First release candidate for NetBSD 9.0 available!](https://blog.netbsd.org/tnf/entry/first_release_candidate_for_netbsd) ###

* Since the start of the release process four months ago a lot of improvements went into the branch - more than 500 pullups were processed!
* This includes usbnet (a common framework for usb ethernet drivers), aarch64 stability enhancements and lots of new hardware support, installer/sysinst fixes and changes to the NVMM (hardware virtualization) interface.
* We hope this will lead to the best NetBSD release ever (only to be topped by NetBSD 10 next year).
* Here are a few highlights of the new release:

  >
  >
  > Support for Arm AArch64 (64-bit Armv8-A) machines, including "Arm ServerReady"  
  >  compliant machines (SBBR+SBSA)  
  >  Enhanced hardware support for Armv7-A  
  >  Updated GPU drivers (e.g. support for Intel Kabylake)  
  >  Enhanced virtualization support  
  >  Support for hardware-accelerated virtualization (NVMM)  
  >  Support for Performance Monitoring Counters  
  >  Support for Kernel ASLR  
  >  Support several kernel sanitizers (KLEAK, KASAN, KUBSAN)  
  >  Support for userland sanitizers  
  >  Audit of the network stack  
  >  Many improvements in NPF  
  >  Updated ZFS  
  >  Reworked error handling and NCQ support in the SATA subsystem  
  >  Support a common framework for USB Ethernet drivers (usbnet)
  >
  >

* More information on the RC can be found on the [NetBSD 9 release page](https://www.netbsd.org/releases/formal-9/NetBSD-9.0.html)

---

News Roundup
----------

### [Running FreeNAS on a Digitalocean droplet](https://www.shlomimarco.com/post/running-freenas-on-a-digitalocean-droplet) ###

* ZFS is awesome. FreeBSD even more so. FreeNAS is the battle-tested, enterprise-ready-yet-home-user-friendly software defined storage solution which is cooler then deep space, based on FreeBSD and makes heavy use of ZFS. This is what I (and soooooo many others) use for just about any storage-related task. I can go on and on and on about what makes it great, but if you're here, reading this, you probably know all that already and we can skip ahead.
* I've needed an offsite FreeNAS setup to replicate things to, to run some things, to do some stuff, basically, my privately-owned, tightly-controlled NAS appliance in the cloud, one I control from top to bottom and with support for whatever crazy thing I'm trying to do. Since I'm using DigitalOcean as my main VPS provider, it seemed logical to run FreeNAS there, however, you can't. While DO supports many many distos and pre-setup applications (e.g OpenVPN), FreeNAS isn't a supported feature, at least not in the traditional way :)
* Before we begin, here's the gist of what we're going to do:

>
>
> Base of a FreeBSD droplet, we'll re-image our boot block device with FreeNAS iso. We'll then install FreeNAS on the second block device. Once done we're going to do the ol' switcheroo: we're going to re-image our original boot block device using the now FreeNAS-installed second block device.
>
>

* Part 1: re-image our boot block device to boot FreeNAS install media.
* Part 2: Install FreeNAS on the second block-device
* Part 3: Re-image the boot block device using the FreeNAS-installed block device

---

### [NomadBSD 1.3 is now available](https://nomadbsd.org/) ###

* From the release notes:

>
>
> The base system has been changed to FreeBSD 12.1-RELEASE-p1  
>  Due to a deadlock problem, FreeBSD's unionfs has been replaced by unionfs-fuse  
>  The GPT layout has been changed to MBR. This prevents problems with Lenovo  
>  systems that refuse to boot from GPT if "lenovofix" is not set, and systems that  
>  hang on boot if "lenovofix" is set.  
>  Support for ZFS installations has been added to the NomadBSD installer.  
>  The rc-script for setting up the network interfaces has been fixed and improved.  
>  Support for setting the country code for the wlan device has been added.  
>  Auto configuration for running in VirtualBox has been added.  
>  A check for the default display has been added to the graphics configuration scripts. This fixes problems where users with Optimus have their NVIDIA card disabled, and use the integrated graphics chip instead.  
>  NVIDIA driver version 440 has been added.  
>  nomadbsd-dmconfig, a Qt tool for selecting the display manager theme, setting the  
>  default user and autologin has been added.  
>  nomadbsd-adduser, a Qt tool for added preconfigured user accounts to the system has been added.  
>  Martin Orszulik added Czech translations to the setup and installation wizard.  
>  The NomadBSD logo, designed by Ian Grindley, has been changed.  
>  Support for localized error messages has been added.  
>  Support for localizing the password prompts has been added.  
>  Some templates for starting other DEs have been added to \~/.xinitrc.  
>  The interfaces of nomadbsd-setup-gui and nomadbsd-install-gui have been improved.  
>  A script that helps users to configure a multihead systems has been added.  
>  The Xorg driver for newer Intel GPUs has been changed from "intel" to "modesetting".  
>  /proc has been added to /etc/fstab  
>  A D-Bus session issue has been fixed which prevented thunar from accessing samba shares.  
>  DSBBg which allows users to change and manage wallpapers has been added.  
>  The latest version of update\_obmenu now supports auto-updating the Openbox menu. Manually updating the Openbox menu after packet (de)installation is therefore no longer needed.
>
>
>
> Support for multiple keyboard layouts has been added.  
>  www/palemoon has been removed.  
>  mail/thunderbird has been removed.  
>  audio/audacity has been added.  
>  deskutils/orage has been added.  
>  the password manager fpm2 has been replaced by KeePassXC  
>  mail/sylpheed has been replaced by mail/claws-mail  
>  multimedia/simplescreenrecorder has been added.  
>  DSBMC has been changed to DSBMC-Qt  
>  Many small improvements and bug fixes.
>
>

---

### [At e2k19 nobody can hear you scream](https://undeadly.org/cgi?action=article;sid=20191204170908) ###

* After 2 years it was once again time to pack skis and snowshoes, put a satellite dish onto a sledge and hike through the snowy rockies to the Elk Lakes hut.
* I did not really have much of a plan what I wanted to work on but there were a few things I wanted to look into. One of them was rpki-client and the fact that it was so incredibly slow. Since Bob beck@ was around I started to ask him innocent X509 questions ... as if there are innocent X509 questions! Mainly about the abuse of the X509\_STORE in rpki-client. Pretty soon it was clear that rpki-client did it all wrong and most of the X509 verification had to be rewritten. Instead of only storing the root certificates in the store and passing the intermediate certs as a chain to the verification function rpki-client threw everything into it. The X509\_STORE is just not built for such an abuse and so it was no wonder that this was slow.
* Lucky me I pulled benno@ with me into this dark hole of libcrypto code. He managed to build up an initial diff to pass the chains as a STACK\_OF(X509) and together we managed to get it working. A big thanks goes to ingo@ who documented most of the functions we had to use. Have a look at STACK\_OF(3) and sk\_pop\_free(3) to understand why benno@ and I slowly turned crazy.
* Our next challenge was to only load the necessary certificate revocation list into the X509\_STORE\_CTX. While doing those changes it became obvious that some of the data structures needed better lookup functions. Looking up certificates was done using a linear lookup and so we replaced the internal certificate and CRL tables with RB trees for fast lookups. deraadt@ also joined the rpki-client commit fest and changed the output code to use rename(2) so that files are replaced in an atomic operation. Thanks to this rpki-client can now be safely run from cron (there is an example in the default crontab).
* I did not plan to spend most of my week hacking on rpki-client but in the end I'm happy that I did and the result is fairly impressive. Working with libcrypto code and especially X509 was less than pleasant. Our screams of agony died away in the snowy rocky mountains and made Bob deep dive into UVM with a smile since he knew that benno@ and I had it worse.
* In case you wonder thanks to all changes at e2k19 rpki-client improved from over 20min run time to validate all VRPS to roughly 1min to do the same job. A factor 20 improvement!
* Thanks to Theo, Bob and Howie to make this possible. To all the cooks for the great food and to Xplornet for providing us with Internet at the hut.

---

Beastie Bits
----------

* [FOSDEM 2020 BSD Devroom schedule](https://fosdem.org/2020/schedule/track/bsd/)
* [Easy Minecraft Server on FreeBSD Howto](https://www.freebsdfoundation.org/freebsd/how-to-guides/easy-minecraft-server-on-freebsd/)
* [stats(3) framework in the TCP stack](https://svnweb.freebsd.org/base?view=revision&revision=355304)
* [4017 days of uptime](https://twitter.com/EdwinKremer/status/1203071684535889921)
* [sysget - A front-end for every package manager](https://github.com/emilengler/sysget)
* [PlayOnBSD’s Cross-BSD Shopping Guide](https://www.playonbsd.com/shopping_guide/)

---

Feedback/Questions
----------

* [Pat asks about the proper disk drive type for ZFS](http://dpaste.com/2FDN26X#wrap)
* [Brad asks about a ZFS rosetta stone](http://dpaste.com/2X8PBMC#wrap)

---

* Send questions, comments, show ideas/topics, or stories you want mentioned on the show to [feedback@bsdnow.tv](mailto:feedback@bsdnow.tv)

---
 Your browser does not support the HTML5 video tag.

Special Guest: Mariusz Zaborski.