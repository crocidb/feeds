+++
title = "Announcing XRAID: declustered parity RAID for zoned XFS"
description = "Christoph Hellwig has announced the initial public release of XRAID—declustered parity RAID that is integrated into XFS.The two primary aims of XRAID are to support parity RAID on zoned devices like SMR hard drives, and"
date = "2026-11-13T14:39:47Z"
url = "https://lwn.net/Articles/1107473/"
author = "jzb"
text = ""
lastupdated = "2026-11-19T14:05:14.613259015Z"
seen = false
+++

Christoph Hellwig has [announced](https://lwn.net/ml/all/20261113112913.GA31748@lst.de/) the initial public release of XRAID—declustered parity RAID that is integrated into XFS.

>
>
> The two primary aims of XRAID are to support parity RAID on zoned devices like SMR hard drives, and to provide a fast RAID implementation without inherent data integrity problems. XRAID, just like zoned XFS also works on conventional hard drives and SSDs. Optimizing for SSD performance has not been a focus, but even without that, writes are up to 20 times faster than mdraid. [...]
>
>
>
> Work on XRAID has been ongoing for a year and a half, and while we aren't anywhere near ready for an upstream submission, we are interested in feedback and testing from a wider audience now. The current implementation supports zero to 2 parities. We did experiments with the SnapRAID parity library to support 3 and more parities, and while that is not included in the current version, support for more parities is planned and the code is prepared for it.
>
>
>
> The xfsprogs branch includes mkfs support and a new "xraid" utility for managing devices and inspecting an XRAID file-systems. We have also extended Zonar (The zoned file-system visualisation tool) to show how each logical zone maps onto physical zones on devices.
>
>

Hellwig gave a [presentation](https://2026.fossy.ca/schedule/presentation/451/) at FOSSY in August on this topic; video of the talk does not seem to be available yet, but his [slides](https://verein.lst.de/~hch/raid-sucks.pdf) are available.