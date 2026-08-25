+++
title = "Changing Language for Storage Capacity"
description = "Back in the 90s a notably pedantic coworker informed us ignorant peasants that, according to International Electrotechnical Commission standard IEC 80000-13:2008, disks and memory were now to be measured in “bi” units such as kibibyte and mebibyte. I agreed that he was technicall"
date = "2026-08-17T17:05:34Z"
url = "https://mwl.io/archives/24954"
author = "Michael Lucas"
text = ""
lastupdated = "2026-08-24T15:49:16.007851282Z"
seen = false
+++

Back in the 90s a notably pedantic coworker informed us ignorant peasants that, according to International Electrotechnical Commission standard IEC 80000-13:2008, disks and memory were now to be measured in “bi” units such as kibibyte and mebibyte. I agreed that he was technically correct, but nobody cared and saying “mebibytes” made you sound like either a pedant or an idiot.[<sup>1</sup>](https://mwl.io/archives/24954#easy-footnote-bottom-1-24954) For all practical system administration purposes, the difference between a 1.544 MB floppy and a 1.544 MiB floppy was negligible. Yes, the operating system showed everything in mebibytes, but everything was labeled as being megabytes, and we all knew what it means.

This is no longer true.

My main test host has six hard drive bays. Each has a 3 TB drive, which is only 2.7 TiB. The operating system shows everything in binary-based tebibytes. I bought 18 TB of storage and got only 16.3 TiB.

People look to my books for information to keep their jobs. That missing two TiB is part of the information. If you’re doing capacity planning, it’s vital. From now on, my books need to use bi units for most storage.

In some cases, it looks stupid. Disks are also sold with 4K sectors. The package says that. “K” is an ambiguous label. It could mean kilobytes or kibibytes. Technically, disk sectors are kibibytes. I think I’ll just keep calling them 4K disks.

Memory? I want to say that nobody cares and that everybody knows what we mean. I don’t run any applications that use terabytes of memory, and for routine system administration tasks the difference between 32 GB and 32 GiB is negligible. But *someone* does care, and mixing GB of RAM with TiB of storage seems odd. Dang it. I think I have to be pedantic.

But in the 90s? Nobody cared, and we all knew what we meant. Unless you worked in embedded systems.