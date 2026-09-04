+++
title = "[$] Securely suspending LUKS-encrypted disks"
description = " When a laptop is asleep, its memory is not unreadable. The right tooling can attach to the computer's memory bus and read out its contents, and  cold-boot attacks can theoretically read values from memory for a short time after t"
date = "2026-09-02T17:14:15Z"
url = "https://lwn.net/Articles/1090568/"
author = "daroc"
text = ""
lastupdated = "2026-09-03T22:47:40.625939026Z"
seen = false
+++

 When a laptop is asleep, its memory is not unreadable. The right tooling can attach to the computer's memory bus and read out its contents, and [ cold-boot attacks](https://en.wikipedia.org/wiki/Cold_boot_attack) can theoretically read values from memory for a short time after the computer loses power. That is really an unavoidable fact about the hardware, but some users would still like to ensure that, even if this happens, their long-term encryption keys, such as the key for full-disk encryption, remain unreadable. In June 2026, Ingo Blechschmidt [ discovered](https://mathstodon.xyz/@iblech/116769502749142438) that Linux kernel versions after 6.9 (released in May 2024) were not erasing disk-encryption keys when a laptop was put to sleep, even when configured to do so. He quickly identified a potential fix, which has been merged, but it was not a comprehensive solution.