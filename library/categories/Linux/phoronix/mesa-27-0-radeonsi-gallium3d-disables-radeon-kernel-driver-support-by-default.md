+++
title = "Mesa 27.0 RadeonSI Gallium3D Disables Radeon Kernel Driver Support By Default"
description = "As part of encouraging AMD Radeon Linux users to switch over to the AMDGPU kernel driver and/or upgrade their kernels, Mesa 27.0 with the RadeonSI Gallium3D driver is disabling its Radeon kernel driver compatibility by default. This affects the early GCN 1.0 and GCN 1.1 graphics "
date = "2026-11-23T19:11:36Z"
url = "https://www.phoronix.com/news/RadeonSI-Radeon-Disable-Default"
author = "Michael Larabel"
text = ""
lastupdated = "2026-11-24T14:06:58.243084888Z"
seen = false
+++

As part of encouraging AMD Radeon Linux users to switch over to the AMDGPU kernel driver and/or upgrade their kernels, Mesa 27.0 with the RadeonSI Gallium3D driver is disabling its Radeon kernel driver compatibility by default. This affects the early GCN 1.0 and GCN 1.1 graphics processors that had been still using the legacy Radeon kernel driver by default up until about a year ago when it reached feature parity on the AMDGPU kernel driver. For now the Radeon kernel driver support in Mesa 27.0 is disabled by default but can be re-enabled, but eventually that Radeon kernel driver support by RadeonSI will be removed...