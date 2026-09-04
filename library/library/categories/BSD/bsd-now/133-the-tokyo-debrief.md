+++
title = "133: The Tokyo Debrief"
description = "This week on BSDNow, Allan and I are back from AsiaBSDCon and we have an interview with Brad Davis about the new “Packaging Base” call-for-testing. We’ll be sharing our thoughts and stories on how the weekThis episode was brought to you by[![iXsystems - Enterprise Serve"
date = "2016-03-16T12:00:00Z"
url = "https://www.bsdnow.tv/133"
author = "feedback@bsdnow.tv (JT Pennington)"
text = ""
lastupdated = "2026-03-26T14:37:51.053851638Z"
seen = true
+++

This week on BSDNow, Allan and I are back from AsiaBSDCon and we have an interview with Brad Davis about the new “Packaging Base” call-for-testing. We’ll be sharing our thoughts and stories on how the week

This episode was brought to you by
----------

[![iXsystems - Enterprise Servers and Storage for Open Source](/images/1.png)](http://www.ixsystems.com/bsdnow)[![DigitalOcean - Simple Cloud Hosting, Built for Developers](/images/2.png)](http://www.digitalocean.com/)[![Tarsnap - Online Backups for the Truly Paranoid](/images/3.png)](http://www.tarsnap.com/bsdnow)

---

Headlines
----------

### AsiaBSDCon 2016 - Wrap-up ###

### [FreeBSD gets Haswell graphics support in time for 11.0-RELEASE](https://svnweb.freebsd.org/changeset/base/296548) ###

* The moment that many have been waiting for has finally arrived, support for Haswell graphics has been committed to FreeBSD -CURRENT
* The brings the DRM/i915 code up to date with Linux kernel 3.8.13
* Work has already started on updating to Linux kernel 3.9
* It is hoped that subsequent updates will be much easier, and much faster
* It does not appear to require setting the i915.preliminary\_hw\_support loader tunable \*\*\*

### [OpenBSD vmm/vmd Update](http://bhyvecon.org/bhyvecon2016-Mike.pdf) ###

* For the third year running, bhyvecon was held last week, during the lead up to AsiaBSDCon
* Bhyvecon has expanded, and now covers all virtualization on BSDs
* There were presentations on bhyve, Xen Dom0 on FreeBSD, Xen DomU for OpenBSD, and OpenBSD’s vmm
* OpenBSD vmm started at the Brisbane 2015 hackathon in Australia
* Work continued through the summer and fall thanks to funding by the OpenBSD Foundation
* The presentation answered some outstanding questions, such as, why not just port bhyve?
* Initial focus is OpenBSD on OpenBSD
* Loader currently supports FreeBSD and NetBSD as well
* After the initial commits, other developers joined in to help with the work
* Reyk reworked the vmd and vmctl commands, to provide a better user interface
* Future plans:
  * Nested VMX
  * i386 support
  * AMD SVM support
  * Filesystem passthru
  * Live migration (with ZFS like command syntax)

* Other developers are working on related projects:
  * qemu interface: Allow qemu to be accelerated by the vmm backend, while providing emulated hardware, for legacy systems
  * KVM interface: Make vmm look like KVM, so existing tools like openstack “just work” \*\*\*

Interview - Brad Davis - [brd@freebsd.org](mailto:brd@freebsd.org) / [@so14k](https://twitter.com/so14k)
----------

* Packaging Base

News Roundup
----------

### [Packaging the base system with pkg(8)](https://lists.freebsd.org/pipermail/freebsd-pkgbase/2016-March/000032.html) ###

* The official call for testing for FreeBSD’s pkg(8)’d base is out
* Users are requested to checkout the release-pkg branch, and build it as normal (buildworld, buildkernel)
* Instead of installworld, run: make packages
* This will produce a pkg repo in the /usr/obj directory
* The post to the mailing list includes an example pkg repo config file to point to those packages
* Run: pkg update -r FreeBSD-base
* This will read the metadata from the new repository
* Then run: pkg install -g 'FreeBSD-\*'
* This will find all packages that start with ‘FreeBSD-’ and install them
* In the future, there will be meta packages, so you can just install FreeBSD-base and it will pull in other packages are dependencies
* Currently, there are a large number of packages (over 700), because each shared library is packaged separately, and almost all optional features are in a separate package
* The number of packages is also increased because there are separate -debug, -profiling, etc versions of each package
* New features are being added to pkg(8) to mark important system components, like libc, as ‘vital’, so they cannot be deleted accidently
* However, in the case of using pkg(8)’d base to create a jail, the administrator should be able to delete the entire base system
* Classic conundrum: “UNIX does not stop you doing something stupid, as that would also stop you doing something clever”
* Work is still ongoing
* At AsiaBSDCon, after the interview was recorded, bapt@ and brd@ had a whiteboarding session and have come up with how they expect to handle the kernel package, to ensure there is a /boot/kernel.old for you to fall back to incase the newly installer kernel does not work correctly. \*\*\*

### [FreeBSD 10.3-RC2 Now Available](https://lists.freebsd.org/pipermail/freebsd-stable/2016-March/084384.html) ###

* The second release candidate for FreeBSD 10.3 is now available for testing
* Notable changes include:
  * Import an upstream fix for ‘zfs send -i’ to avoid data corruption in specific instances
  * Boot loaders and kernel have been taught to handle ELF sections of type SHT\_AMD64\_UNWIND. This does not really apply to FreeBSD 10.3, but is required for 11.0, so will make upgrades easier
  * Various mkdb commands (/etc/services, /etc/login.conf, etc) commands now use fsync() instead of opening the files as O\_SYNC, greatly increasing the speed of the database generation

* From the earlier BETA3, the VFS improvements that were causing ZFS hangs, and the new ‘tryforward’ routing code, have been reverted
* Work is ongoing to fix these issues for FreeBSD 11.0
* There are two open issues:
  * A fix for OpenSSH CVE-2016-3115 has not be included yet
  * the re-addition of AES-CBC ciphers to the default server proposal list. AES-CBC was removed as part of the update to OpenSSH version 7.1p2, but the plan is to re-add it, specifically for lightweight clients who rely on hardware crypto offload to have acceptable SSH performance

* Please go out and test \*\*\*

### [OPNsense 16.1.6 released](https://forum.opnsense.org/index.php?topic=2378.0) ###

* A new point-release of OPNsense has dropped, and apart from the usual security updates, some new features have been included

>
>
> * firmware: bootstrap utility can now directly install e.g. the development version
> * dhcp: all GUI pages have been reworked for a polished look and feel
> * proxy: added category-based remote file support if compressed file contains multiple files
> * proxy: added ICAP support (contributed by Fabian Franz)
> * proxy: hook up the transparent FTP proxy
> * proxy: add intercept on IPv6 for FTP and HTTP proxy options
> * logging: syslog facilities, like services, are now fully pluggable
> * vpn: stripped an invalid PPTP server configuration from the standard configuration
> * vpn: converted to pluggable syslog, menu and ACL
> * dyndns: all GUI pages have been reworked for a polished look and feel
> * dyndns: widget now shows IPv6 entries too
> * dns forwarder: all GUI pages have been reworked for a polished look and feel
> * dns resolver: all GUI pages have been reworked for a polished look and feel
> * dns resolver: rewrote the dhcp lease registration hooks
> * dns resolver: allow parallel operation on non-standard port when dns forwarder is running as well
> * firewall: hide outbound nat rule input for "interface address" option and toggle bitmask correctly
> * interfaces: fix problem when VLAN tags weren't generated properly
> * interfaces: improve interface capability reconfigure
> * ipsec: fix service restart behaviour from GUI
> * captive portal: add missing chain in certificate generation
> * configd: improve recovery and reload behaviour
> * load balancer: reordered menu entries for clarity
> * ntp: reordered menu entries for clarity
> * traffic shaper: fix mismatch for direction + dual interfaces setup
> * languages: updated German and French
>
>

---

### [Call for testing - ASLR patch](https://lists.freebsd.org/pipermail/freebsd-arch/2016-March/017719.html) ###

* A patch that provides a first pass implementation of basic ASLR (Address Space Layout Randomization) for FreeBSD has been posted to the mailing list
* “Stack gap, W<sup>X,</sup> shared page randomization, KASLR and other techniques are explicitly out of scope of this work.”
* “ASLR is enabled on per-ABI basis, and currently it is only enabled on native i386 and amd64 (including compat 32bit) ABIs. I expect to test and enable ASLR for armv6 and arm64 as well, later”
* “Thanks to Oliver Pinter and Shawn Webb of the HardenedBSD project for pursuing ASLR for FreeBSD. Although this work is not based on theirs, it was inspired by their efforts.” \*\*\*

Feedback/Questions
----------

* [ Daniel - OpenZFS](http://slexy.org/view/s20Z81SPq3)
* [ Florian - JBODS](http://slexy.org/view/s2be4zDkG6)
* [ Hunter - SSL on DO](http://slexy.org/view/s2o0MijCFy)
* [ Ben - Backups](http://slexy.org/view/s2fXlOwdU7)
* [ Damian - Bug’in Me!](http://slexy.org/view/s2weBPb8sx) \*\*\*