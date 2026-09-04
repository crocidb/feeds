+++
title = "[$] Caching for extended attributes"
description = "Extended attributes (xattrs) provide a way to attach key/value metadata to inodes—files, directories, and the like—in a filesystem. As with many Linux filesystems, the [FUSE filesystem](https://docs.kernel.org/filesystems/fuse"
date = "2026-06-02T18:35:52Z"
url = "https://lwn.net/Articles/1074919/"
author = "jake"
text = ""
lastupdated = "2026-06-07T00:10:44.964574084Z"
seen = true
+++

[Extended attributes](https://man7.org/linux/man-pages/man7/xattr.7.html) (xattrs) provide a way to attach key/value metadata to inodes—files, directories, and the like—in a filesystem. As with many Linux filesystems, the [FUSE filesystem](https://docs.kernel.org/filesystems/fuse/) supports xattrs. In a filesystem-track session at the 2026 [Linux Storage, Filesystem, Memory Management, and BPF Summit](https://events.linuxfoundation.org/lsfmmbpf/), FUSE maintainer Miklos Szeredi led a discussion about caching xattrs in kernel memory; he would like to create some common infrastructure that could be used by FUSE and shared with other filesystems.