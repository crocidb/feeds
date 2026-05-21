+++
title = "Unexpected Synology Woes"
description = "Last weekend my DS1019+ decided, for some unfathomable reason, to stop working after I took it out of the closet, dusted it and put it back, and I have feelings about it.In fact, I’ve had them throughout the whole week, because it’s taken forever to"
date = "2026-05-15T13:30:00Z"
url = "https://taoofmac.com/space/blog/2026/05/15/1330?utm_content=atom"
author = "Rui Carmo"
text = ""
lastupdated = "2026-05-20T09:23:14.778536826Z"
seen = false
+++

Last weekend my [DS1019+](/space/blog/2020/04/04/2310) decided, for some unfathomable reason, to stop working after I took it out of the closet, dusted it and put it back, and I have feelings about it.

In fact, I’ve had them throughout the whole week, because it’s taken forever to get most of my home services up again.

Fortunately, my home automation and a few other things are spread among my [Proxmox](/space/os/linux/distributions/proxmox) nodes, but I had a *bunch* of things running on that NAS, and I wanted to document what happened because someone else might have the same issues I did and end up here.

[

Symptoms
----------

](/space/blog/2026/05/15/1330#symptoms)

The machine booted up (power LED initially blinking, solid green status LED, disk activity almost immediately), but would not show up on the network.

Both LAN interfaces would be up, but issued *zero* packets. No DHCP requests, no link-local addressing, not even replies to `arping` (and yes, I knew the MAC addresses of the machine, because that’s the kind of thing I keep tabs on). I plugged in my MacBook and my [MiniBook X](/space/reviews/2025/05/15/2230) on each interface, rebooted, and saw… nothing.

`tcpdump` saw nothing at all. I thought it might be some sort of OS glitch (which is why I tried both laptops), but no luck.

So I tried to reset it to factory configuration. You have two reset levels, the first of which only resets your admin password and network settings, the second has you reinstall the OS without losing data.

But nothing worked, and [Synology](/space/com/synology)’s tooling just couldn’t find the NAS or connect to it.

[

Recovery
----------

](/space/blog/2026/05/15/1330#recovery)

The first thing I did was set up [Virtual DSM](https://github.com/vdsm/virtual-dsm?utm_source=taoofmac.com&utm_medium=web&utm_campaign=unsolicited_traffic&utm_content=external_link) on `borg` to see if I could, in the direst of emergencies, access our off-site [Azure](/space/com/microsoft/azure) backups. That *sort* of worked, but the experience was so fiddly that I was reminded of all of HyperBackup’s pitfalls in one fell swoop–most notably that I effectively need a Synology to get at that data, which is not something I want to rely on.

Yes, there is a HyperBackup desktop application. No, it did not work for me–it apparently expects you to download backup files from the cloud to your local machine, and I need to be able to directly restore files from Azure, period.

After filing a ticket with Synology about my unresponsive system, they sent me an AI-generated troubleshooting list, in the middle of which was a step I could not find anywhere in their online documentation: *booting the machine without any disks*.

*That* apparently also automatically reset settings (which is, in retrospect, weird, because it feels like *something* should be stored in the chassis for this kind of emergency), and I was finally able to discover it on the network, reset the admin password, reconfigure the network, etc.

So if you have the same symptoms, this might save your day. And, as it turns out, be the prelude to an entire week of pain, because mine spent the past five days or so grinding through data scrubbing. Because that is a thing it felt like doing, and I’ve been coping with the fallout since then–extremely slow access, very slow response times as I tried to double-check services and settings, etc.

[

What Didn’t Work Right
----------

](/space/blog/2026/05/15/1330#what-didnt-work-right)

First of all, all my [Docker](/space/os/linux/docker) containers were gone. Container Manager, for some reason, does not preserve any settings in this scenario, and if I didn’t have [Portainer](/space/os/linux/docker/portainer) installed and a copy of (most of) my stacks in [Gitea](/space/apps/gitea), this would have been enough for me to never again run containers on a Synology.

As it was, I was able to point [`piclaw`](https://github.com/rcarmo/piclaw?utm_source=taoofmac.com&utm_medium=web&utm_campaign=unsolicited_traffic&utm_content=external_link) to the machine and have it reconstruct all critical services in a few hours (it would have been much faster if it wasn’t doing scrubbing). And, as it turns out, there was also enough residual info in the underlying Docker daemon itself to fill in most of the gaps.

But barring that, there were a bunch of things that made recovery a pretty stressful endeavor:

* The mobile apps (DS Finder and the like) were useless in finding or diagnosing the issue at every step.
* The web site did not list disk removal as a troubleshooting step (at least not that I could see, since it went straight into the dual-step reset procedure).
* The timing documented for holding the reset button for reset 1 (4 seconds) was *not* accurate. It was more like 20, and I feared for a moment I might end up triggering reset 2, which would require reinstalling the OS.
* Synology’s desktop tools are, to be brief, very poorly maintained and look like something out of the 90s, even down to the Windows look on macOS.

So even for an “appliance” NAS, the experience could be much better.

[

Let’s Have an Adventure
----------

](/space/blog/2026/05/15/1330#lets-have-an-adventure)

Resetting the configuration had zero impact on my data–at least so far as I can tell. Shares, users, all the regular stuff was preserved, and after a few glitches with cloud backups (because disk scrubbing made them fail overnight twice), everything seems in order.

But since the machine spent so long simultaneously scrubbing and swapping as I tried to restore services, it’s clear that I cannot rely on it for interactive use anymore.

Synology doesn’t really let me upgrade RAM on the thing (you sort of can, but it’s already capped at the maximum RAM the J4125 can officially support), so I’ve started removing stuff from it–most of the Docker services I’ve been running there for years are now moving into [Proxmox](/space/os/linux/distributions/proxmox) microVMs or [LXC](/space/os/linux/lxc)s running elsewhere, and are either going to use the Synology as a “dumb” NAS and mount storage directly, or be backed up to it using [Borg Backup Server](https://github.com/marcpope/borgbackupserver?utm_source=taoofmac.com&utm_medium=web&utm_campaign=unsolicited_traffic&utm_content=external_link) (which is going to be the only new Docker container running on it).

I’ve already moved [Portainer](/space/os/linux/docker/portainer) and [Gitea](/space/apps/gitea) off it, and having them run (even with very constrained resources) on separate microVMs in an N150 makes a world of difference–so much so that I have to wonder why I put up with the J4125’s slowness for years.

I set [Proxmox](/space/os/linux/distributions/proxmox) to snapshot both VMs daily (and added a temporary direct-to-cloud [`restic`](/space/cli/restic) backup), and am now slowly moving the rest. Or, rather [`piclaw`](https://github.com/rcarmo/piclaw?utm_source=taoofmac.com&utm_medium=web&utm_campaign=unsolicited_traffic&utm_content=external_link) is doing that. I had it draft a plan to group containers and create target VMs/LXCs, and the agent is now merrily [`rsync`](/space/cli/rsync)ing data and container configs out of the Synology.

[

Mid-Term
----------

](/space/blog/2026/05/15/1330#mid-term)

After the dust settles, I am going to move all of my backups out of the Synology ecosystem–I currently rely on HyperBackup to back up my data to [Azure](/space/com/microsoft/azure), but the recovery attempt was so off-putting that I am going to look into using [`restic`](/space/cli/restic) directly to Azure.

[Backrest](https://github.com/garethgeorge/backrest?utm_source=taoofmac.com&utm_medium=web&utm_campaign=unsolicited_traffic&utm_content=external_link) looks like a nice way to do that, with the added benefit that `restic` backups (which I have already been using for years) seem to work better with Azure storage tiering (and thus might even be cheaper in the long run).