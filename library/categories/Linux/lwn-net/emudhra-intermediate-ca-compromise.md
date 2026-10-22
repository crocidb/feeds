+++
title = "eMudhra intermediate CA compromise"
description = "Mozilla has announced that it has received a [report](https://groups.google.com/a/mozilla.org/g/dev-security-policy/c/0R3XLJL6FuE/m/0XofdebrAAAJ"
date = "2026-10-20T14:56:23Z"
url = "https://lwn.net/Articles/1101643/"
author = "jzb"
text = ""
lastupdated = "2026-10-21T11:46:09.758532311Z"
seen = false
+++

Mozilla has [announced](https://blog.mozilla.org/security/2026/10/20/protecting-firefox-users-following-the-compromise-of-emudhra-intermediate-certificates/) that it has received a [report](https://groups.google.com/a/mozilla.org/g/dev-security-policy/c/0R3XLJL6FuE/m/0XofdebrAAAJ) that private keys associated with eight [eMudhra](https://emudhra.com/en-us/) intermediate certificates have been compromised:

>  These keys could allow attackers to issue fraudulent HTTPS certificates for websites they do not control. An attacker who could intercept a user's connection could use those certificates to impersonate websites and potentially read or modify traffic.

Mozilla has blocked the affected certificates using its [OneCRL](https://blog.mozilla.org/security/2015/03/03/revoking-intermediate-certificates-introducing-onecrl/) centralized list of revoked certificates, and has updated the trusted certificate list in [Network Security Services (NSS) 3.131.1](https://groups.google.com/a/mozilla.org/g/dev-tech-crypto/c/vSxZxnOMMvs).

There is a [single-page site](https://emudhra.we-have-a-problem.com/) about the compromise that goes into more detail. According to the site the certificates have also been blocked in Chrome since October 17, Apple devices since the 19th, and Microsoft blocked the certificates on the 20th. There is also a table that displays whether a browser or other client still trusts the compromised certificates.

The NetBSD foundation has [issued instructions](https://mastodon.sdf.org/@netbsd/117473734072004396) to block the certificates on NetBSD installations. Users of other browsers and operating systems may wish to check for updates or guidance to disable the compromised certificates.