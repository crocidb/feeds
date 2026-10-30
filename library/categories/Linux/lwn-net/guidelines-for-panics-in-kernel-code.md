+++
title = "[$] Guidelines for panics in kernel code"
description = " Alexandre Courbot spends most of his time working on the kernel doing code reviews. Recently, he's been wondering about what the standards should be for when Rust code is allowed to panic, and how it should do error handling more generally. Unlike many of the other talks at Kang"
date = "2026-10-27T13:56:24Z"
url = "https://lwn.net/Articles/1100873/"
author = "daroc"
text = ""
lastupdated = "2026-10-27T22:33:08.840334036Z"
seen = false
+++

 Alexandre Courbot spends most of his time working on the kernel doing code reviews. Recently, he's been wondering about what the standards should be for when Rust code is allowed to panic, and how it should do error handling more generally. Unlike many of the other talks at Kangrejos 2026, his talk was not presenting some existing work, but rather hoping to solicit opinions on the topic from the assembled Rust for Linux developers. He brought along a collection of tricky cases that he had run into recently to prompt discussion.