+++
title = "Proposed Linux Patch For A Brief Delay To Match PCI Spec Will Hopefully Address Some Bugs"
description = 'Going back to February there was a bug report around the xHCI controller dieing on resume from s2idle when using an AMD Ryzen AI Max+ "Strix Halo" Framework Desktop. In turn all USB devices behind the xHCI controller are lost on resume, but unbinding and binding the driver can re'
date = "2026-07-09T13:35:01Z"
url = "https://www.phoronix.com/news/Linux-Delay-D3cold-Patch-Fix"
author = "Michael Larabel"
text = ""
lastupdated = "2026-07-09T17:48:29.124246047Z"
seen = false
+++

Going back to February there was a bug report around the xHCI controller dieing on resume from s2idle when using an AMD Ryzen AI Max+ "Strix Halo" Framework Desktop. In turn all USB devices behind the xHCI controller are lost on resume, but unbinding and binding the driver can restore the functionality without a reboot. After months of back and forth communication, it looks like a solution has been figured out and comes down to a nuance of the PCI spec with needing a brief wait...