+++
title = "Update Regarding the Base Prices of the M5 Max Mac Studio"
description = "I made a mistake in my table earlier today regarding the base price of [the M5 Max Mac Studio](https://www.apple.com/shop/buy-mac/mac-studio/m5-max-chip-18-core-cpu-32-core-gpu-36gb"
date = "2026-08-25T22:17:40Z"
url = "https://daringfireball.net/2026/08/configurations_and_pricing_for_new_mac_minis_and_mac_studios"
author = "John Gruber"
text = ""
lastupdated = "2026-09-01T19:33:12.437780138Z"
seen = true
+++

I made a mistake in [my table earlier today](https://daringfireball.net/2026/08/configurations_and_pricing_for_new_mac_minis_and_mac_studios) regarding the base price of [the M5 Max Mac Studio](https://www.apple.com/shop/buy-mac/mac-studio/m5-max-chip-18-core-cpu-32-core-gpu-36gb-memory-512gb-storage), but my mistake was because of a rather sneaky design in Apple’s purchasing flow. Apple’s web interface looks like this:

[![Screenshot from Apple.com, showing the 40-core GPU version of the M5 Max Mac Studio as “+ $300”.](https://daringfireball.net/misc/2026/08/m5-max-mac-studio-sneaky-pricing.png)](https://daringfireball.net/misc/2026/08/m5-max-mac-studio-sneaky-pricing.png)

Both of the available M5 Max SoCs have 18-core CPUs, but the entry model (that starts at $2,500) has a 32-core GPU, and the upgraded chip has a 40-core GPU. That upgrade is labeled “+ $300”, which makes it look as though the starting price for the 18/40-core model is $2,800. That’s the price I put in the original version of my chart.

But if you select that option, you’ll notice that the actual starting price jumps from $2,500 to $3,100 — a $600 difference, not $300. The reason is that the $2500 18/32-core version only comes with one option for RAM: 36 GB. The 18/40-core chip has three tiers for RAM: 48, 64, and 128 GB. So when you switch from the 18/32-core chip to the 18/40-core chip, you don’t just get 8 extra GPU cores (which Apple is saying costs $300), but the base RAM jumps from 36 to 48 GB, and that costs you an *additional* $300.

Apple does show a blue notification stripe when you change chips here, which states “Based on your new selection, other parts of your configuration have been updated. Please review the changes.” But because the RAM options are mutually exclusive between the two M5 Max variants, it’s easy to make the mistake I did, and think the base price for the 18/40-core M5 Max Studio is $2,500 + $300 = $2,800, when in fact it’s $2,500 + $300 + $300 = $3,100.

I regret the error, and we all regret how expensive all of this has gotten.

[ ★ ](https://daringfireball.net/linked/2026/08/25/update-regarding-the-base-prices-of-the-m5-max-mac-studio)