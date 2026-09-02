+++
title = "Apple Rethinks Plan to Merge ‘Hide My Email’ Domain Name With ‘Sign In With Apple’"
description = "Apple Developer News:Starting later this year, new Sign in with Apple addresses, previously issued on privaterelay.appleid.com, will be issued on private.icloud.com. Existing addresses on privaterelay.appleid.com will continue to work and forward mail to users without i"
date = "2026-08-24T23:33:50Z"
url = "https://developer.apple.com/news/?id=1ptvdtcm"
author = "John Gruber"
text = ""
lastupdated = "2026-09-01T19:33:12.444924620Z"
seen = true
+++

Apple Developer News:

>
>
> Starting later this year, new Sign in with Apple addresses, previously issued on `privaterelay.appleid.com`, will be issued on `private.icloud.com`. Existing addresses on `privaterelay.appleid.com` will continue to work and forward mail to users without interruption.
>
>
>
> After further consideration and reviewing community feedback, iCloud+ Hide My Email addresses will remain on `icloud.com`.
>
>

[Back in June, Apple announced](https://daringfireball.net/linked/2026/06/18/new-domain-for-signinwithapple-and-icloudhidemyemail) plans to merge both systems onto the new `private.icloud.com` domain. The objection to this plan was rather obvious: it’s fine for Sign In With Apple to use an easily distinguishable domain name, because the only sites that see such email addresses are those that support Sign In With Apple (SIWA). The problem with moving Hide My Email (HME) addresses to a distinguishable domain name is that we often want to use such hidden email addresses on sites that would prefer to block those addresses and try to force us to use our “real” addresses. A little birdie suggested to me after I wrote about it in June that there were strong objections to the merger internally all along, from the HME side. Seems like those objections have won out.

[ ★ ](https://daringfireball.net/linked/2026/08/24/apple-rethinks-hide-my-email-domain)