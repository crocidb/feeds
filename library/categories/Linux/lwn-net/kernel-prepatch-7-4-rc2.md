+++
title = "Kernel prepatch 7.4-rc2"
description = 'Linus Torvalds has released the 7.4-rc2 prepatch and it will come as no surprise that it is a large one ("a big -rc2 to go with the largest ever -rc1"). Much of the size was made up of some automated Coccinelle updates that were spread out a'
date = "2026-11-09T14:55:38Z"
url = "https://lwn.net/Articles/1106300/"
author = "jake"
text = ""
lastupdated = "2026-11-11T16:05:19.263366007Z"
seen = false
+++

Linus Torvalds has released the [7.4-rc2 prepatch](https://lwn.net/Articles/1106299/) and it will come as no surprise that it is a large one ("
> a big -rc2 to go with the largest ever -rc1

"). Much of the size was made up of some automated Coccinelle updates that were spread out all over the tree; once those are factored out, the rest looks fairly normal:
>  When masking that noise out from the diffstat, the shape of it changes - not spread out over thousands of files any more. But it does not look unusual: a third is drivers (gpu, networking and sound account for most of it, but there's a bit of everything), another third is networking and bpf, and the final third is "the rest" (mostly filesystems, mm, arch updates).
>
>  And yes, much of this was driven by various AI fixes. I think I'll stop repeating that, and we can just take it for granted. But this time around Alexei [Starovoitov] claims that on the bpf side at least the fixes are now coming in faster than the new reports, and that sounds lovely if true.
>
>