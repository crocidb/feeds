+++
title = "129: The New Linker Strangles"
description = "OpenZFS Mastery has reached chapter 9, on boot loaders. The most tediously terrifying system administration task is an operating system upgrade. The new kernel might not boot the system, but that’s the least of your problems. What if a critical program requires an old version of "
date = "2026-09-17T08:08:37Z"
url = "https://mwl.io/archives/24982"
author = "Michael Lucas"
text = ""
lastupdated = "2026-09-21T09:42:44.435946196Z"
seen = false
+++

[OpenZFS Mastery](https://www.tiltedwindmillpress.com/product/openzfs-sponsor/) has reached chapter 9, on boot loaders.

>
>
> The most tediously terrifying system administration task is an operating system upgrade. The new kernel might not boot the system, but that’s the least of your problems. What if a critical program requires an old version of a shared library? Maybe that new terminal mode is subtly incompatible with your application. Or perhaps the new linker strangles your mission-critical software. Sometimes problems aren’t immediately apparent but creeping damage becomes visible after a week or two, when reverting the upgrade becomes even more difficult. No matter what precautions you take or how much testing you perform, any upgrade can go bad.
>
>
>
> Sysadmins have developed all sorts of tools and coping strategies to manage bad upgrades. Boot loaders help you quickly recover from bad kernels. Backups help you slowly recover from bad userlands. But none of these help you understand exactly what went wrong and duplicate the problem.
>
>
>
> Unless you’re running ZFS.
>
>

[OpenZFS Mastery sponsorships are still open.](https://www.tiltedwindmillpress.com/product/openzfs-sponsor/)