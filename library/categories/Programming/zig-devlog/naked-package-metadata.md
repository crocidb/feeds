+++
title = "Naked Package Metadata"
description = "Naked Package MetadataNaked packages are ones that do not include a build manifest (build.zig.zon file). This is typically due to them being maintained by third parties outside the Zig ecosystem.Until now, those package hashes looked like: `N-V8AAA7lSA"
date = "2026-10-20T00:00:00Z"
url = "https://ziglang.org/devlog/2026/#2026-10-20"
author = ""
text = ""
lastupdated = "2026-10-22T13:34:58.242158778Z"
seen = false
+++

[Naked Package Metadata](#2026-10-20)
==========

Naked packages are ones that do not include a build manifest (build.zig.zon file). This is typically due to them being maintained by third parties outside the Zig ecosystem.

Until now, those package hashes looked like: `N-V-__8AAA7lSAA6p7eRmPGVeA9uHmeiJ2DX-ISiPliRJ8Y7`

This is because, without a build.zig.zon file, there was no `name` and `version` to use in the package hash. Furthermore, those packages have brittle hashes because they included all fetched files without any filter, which may accidentally have included unwanted hidden files that nonetheless cause the package hash to change. Or, the package might have contained symlinks that cannot be created on a particular OS. Without a filter, such files, even if they were unneeded, caused fetching to fail.

Now, Zig supports specifying `version` and `paths` for naked packages next to the URL. The dependency name will also be factored into the package hash, but **only when `version` is provided.** This allows users to opt in, as opposed to having the package hash change suddenly when updating Zig.

Here’s an updated zlib for example:

```
    .dependencies = .{
        .zlib = .{
            .url = "https://github.com/madler/zlib/archive/refs/tags/v1.3.2.tar.gz",
            .hash = "zlib-1.3.2-__8AANXpEADvBXGMSfhczMTZVAA-TkkE4ecoohAR7s3p",
            .version = "1.3.2",
            .paths = .{
                "LICENSE",
                "adler32.c",
                "compress.c",
                "crc32.c",
                "crc32.h",
                "deflate.c",
                "deflate.h",
                "gzclose.c",
                "gzguts.h",
                "gzlib.c",
                "gzread.c",
                "gzwrite.c",
                "infback.c",
                "inffast.c",
                "inffast.h",
                "inffixed.h",
                "inflate.c",
                "inflate.h",
                "inftrees.c",
                "inftrees.h",
                "trees.c",
                "trees.h",
                "uncompr.c",
                "zconf.h",
                "zlib.h",
                "zutil.c",
                "zutil.h",
            },
        },
    },

```

Before:

```
4.3M    zig-pkg/N-V-__8AAI4ANwDM8MWhHTUFLKfvLE_n2NQk6mh0sFDzhTqO

```

After:

```
1.2M    zig-pkg/zlib-1.3.2-__8AANXpEADvBXGMSfhczMTZVAA-TkkE4ecoohAR7s3p

```

[Pull Request](https://codeberg.org/ziglang/zig/pulls/37340)