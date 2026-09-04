+++
title = "Supply chain attack on arrayref (Rust blog)"
description = "The Rust blog reports on a malicious crate, called proc-macro1, that was uploaded to the crates.io repository.Furthermore, we discovered that the popular arrayref crate had recently been republished and "
date = "2026-08-20T13:26:01Z"
url = "https://lwn.net/Articles/1089720/"
author = "corbet"
text = ""
lastupdated = "2026-08-24T15:49:16.139654794Z"
seen = false
+++

The Rust blog [reports](https://blog.rust-lang.org/2026/08/20/supply-chain-attack-on-arrayref/) on a malicious crate, called proc-macro1, that was uploaded to the crates.io repository.

>  Furthermore, we discovered that the popular arrayref crate had recently been republished and made to depend on this crate, with the most recent versions yanked. We have removed the malicious version and unyanked the maliciously-yanked versions. Other crates by that author (internment, append-only-vec) were also affected so we have done the same for those, and locked the account as a precaution. We do not believe the author of arrayref to be acting maliciously, but their computer or credentials are likely compromised, and we are attempting to contact them.