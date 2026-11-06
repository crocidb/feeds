+++
title = "[$] Removing binder.c"
description = " The final talk at Kangrejos 2026 was about the removal of the C implementation of Android's  Binder driver, the primary interprocess communication mechanism used on Android devices. Carlos Llamas announced "
date = "2026-10-30T17:46:46Z"
url = "https://lwn.net/Articles/1102982/"
author = "daroc"
text = ""
lastupdated = "2026-11-02T23:27:02.322452725Z"
seen = false
+++

 The final talk at Kangrejos 2026 was about the removal of the C implementation of Android's [ Binder driver](https://source.android.com/docs/core/architecture/ipc/binder-overview), the primary interprocess communication mechanism used on Android devices. Carlos Llamas announced that he had deleted the C code to general applause, and then shared some insights about what went into replacing the C implementation. Alice Ryhl, who has worked on the Rust implementation for some years, added her own thoughts about what the most difficult and interesting parts of the transition were.