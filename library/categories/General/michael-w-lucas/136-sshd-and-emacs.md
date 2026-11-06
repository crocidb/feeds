+++
title = "136: sshd and Emacs"
description = "Here’s a chunk from the caching chapter of OpenZFS Mastery. The ARC surrenders memory readily upon request, but freeing memory doesn’t happen instantaneously. While the process of releasing memory from the ARC has been accelerated in recent OpenZFS, it will always take longer tha"
date = "2026-11-05T10:41:38Z"
url = "https://mwl.io/archives/25044"
author = "Michael Lucas"
text = ""
lastupdated = "2026-11-05T13:08:21.660558154Z"
seen = false
+++

Here’s a chunk from the caching chapter of [OpenZFS Mastery](https://www.tiltedwindmillpress.com/product/openzfs-sponsor/).

>
>
>  The ARC surrenders memory readily upon request, but freeing memory doesn’t happen instantaneously. While the process of releasing memory from the ARC has been accelerated in recent OpenZFS, it will always take longer than allocating free memory. On a host with a very large ARC, dumping gigabytes of objects from the cache might take a measurable fraction of a second. Depending on your host’s purpose you might need to restrict the ARC’s maximum size, or require the kernel to preserve at least a minimum amount of RAM for the ARC.
>
>
>
> Proxmox is intended for virtualization, and automatically caps the ARC at 10% of available memory. Linux OpenZFS defaults to capping the ARC at 50% of memory. FreeBSD goes the other direction and reserves 1 GiB of RAM for core system functions like sshd and Emacs, allowing ZFS to claim as much as it needs. No operating system vendor knows your specific workload, so all of these are equally incorrect.
>
>

I think I can get most of this book done before my surgery on 12 November. [You sponsoring the book would help me pay my bills as I recover.](https://www.tiltedwindmillpress.com/product/openzfs-sponsor/)