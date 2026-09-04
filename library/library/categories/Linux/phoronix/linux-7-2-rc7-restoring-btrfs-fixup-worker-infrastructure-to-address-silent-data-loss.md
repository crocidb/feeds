+++
title = "Linux 7.2-rc7 Restoring Btrfs Fixup Worker Infrastructure To Address Silent Data Loss"
description = "Back during the Linux 7.2 merge window the Btrfs file-system dropped its COW fixup mechanism, which was used to detect dirty pages without an ordered extent. This code was removed as it was believed the kernel's memory management layer had solved the underlying conditions but in "
date = "2026-08-06T21:09:10Z"
url = "https://www.phoronix.com/news/Btrfs-Restores-Fixup-Worker"
author = "Michael Larabel"
text = ""
lastupdated = "2026-08-06T21:59:24.899874315Z"
seen = false
+++

Back during the Linux 7.2 merge window the Btrfs file-system dropped its COW fixup mechanism, which was used to detect dirty pages without an ordered extent. This code was removed as it was believed the kernel's memory management layer had solved the underlying conditions but in reality it ended up leading to silent data loss. That Btrfs fixup worker infrastructure is now restored in time for Linux 7.2-rc7 this weekend and the stable v7.2 kernel later this month...