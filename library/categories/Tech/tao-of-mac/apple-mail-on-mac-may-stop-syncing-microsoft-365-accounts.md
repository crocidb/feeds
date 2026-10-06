+++
title = "Apple Mail on Mac May Stop Syncing Microsoft 365 Accounts"
description = '<img class="quicklook" src="/space/links/2026/10/02/0731/large.jpg?v=732f16aed8c9" alt="quicklook" width="320" height="213"The '
date = "2026-10-02T07:31:00Z"
url = "https://taoofmac.com/space/links/2026/10/02/0731?utm_content=atom"
author = "Rui Carmo"
text = ""
lastupdated = "2026-10-05T09:04:51.133838780Z"
seen = true
+++

[<img class="quicklook" src="/space/links/2026/10/02/0731/large.jpg?v=732f16aed8c9" alt="quicklook" width="320" height="213">](https://www.macrumors.com/2026/10/01/apple-mail-mac-stop-sync-microsoft-365/?utm_campaign=unsolicited_traffic&utm_medium=web&utm_source=taoofmac.com)

The writing has been on the wall for EWS in Exchange Online for ages, and Apple’s [promised Graph support](https://support.apple.com/en-us/guide/deployment/integrate-with-microsoft-exchange-dep158966b23/web?utm_campaign=unsolicited_traffic&utm_medium=web&utm_source=taoofmac.com) still hasn’t shipped; M365 can temporarily keep EWS enabled until April 2027, but right now some tenants may effectively kick out Apple Mail/Calendar, which is just stupid because it is definitely not Microsoft’s fault that EWS is being phased out in favor of a better, much more flexible approach.

I have *zero* idea about why it’s taking Apple this long to get their act together, since EWS has been feature-frozen since 2018 and [Graph](https://learn.microsoft.com/en-us/graph/overview?utm_campaign=unsolicited_traffic&utm_medium=web&utm_source=taoofmac.com) has been meat and potatoes stuff for ages. Even though I do run [Outlook](/space/apps/outlook) locally for my (very rare now) consulting/advisory work, I am not looking forward to being locked out of my accounts just because Apple effectively stopped maintaining its cloud account integrations and has been phoning it in for the last 3 or 4 macOS releases–not to mention that, as I’ve found over the past couple of years while trying to automate stuff, it is effectively impossible to have a unified local API for contacts, calendars and to-dos that actually works, let alone e-mail…

So I guess it’s a moderately good thing I’ve been using [Graph](https://learn.microsoft.com/en-us/graph/overview?utm_campaign=unsolicited_traffic&utm_medium=web&utm_source=taoofmac.com) wrappers for years now to get around Apple’s inability to maintain things, no?