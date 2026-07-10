+++
title = "120: The Pool Reverts"
description = "Here’s a chunk of OpenZFS Mastery. I’ve caught up to where I stopped, and new words will be coming soon. Pool features that are enabled are available for use, but not yet used on any bits on the disk. Your OpenZFS supports a new compression algorithm, but has not actually used it"
date = "2026-07-09T07:21:38Z"
url = "https://mwl.io/archives/24890"
author = "Michael Lucas"
text = ""
lastupdated = "2026-07-09T12:05:17.747975166Z"
seen = false
+++

Here’s a chunk of [OpenZFS Mastery.](https://mwl.io/sponsor) I’ve caught up to where I stopped, and new words will be coming soon.

>
>
> Pool features that are enabled are available for use, but not yet used on any bits on the disk. Your OpenZFS supports a new compression algorithm, but has not actually used it to write any data to disk. This pool could be imported on a system that doesn’t support the feature, because the new host won’t see anything that makes it freak out.
>
>
>
> Disabled pool features are available in the operating system but not turned on. Nothing in the pool says that these features are available. This pool can be used on hosts that don’t support this feature.
>
>
>
> If the feature is active, the pool can only be read by an OpenZFS that supports the feature. This pool cannot be moved to a system that doesn’t support this feature. If the feature is active, but all datasets using the feature are destroyed, the pool reverts the feature setting to enabled.
>
>

[OpenZFS Mastery is open for sponsorships. Just like it has been for a while.](https://mwl.io/sponsor)