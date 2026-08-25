+++
title = "★ Apple Screwed Up the TestFlight App’s Sort Order a Month Ago, and It’s Still Screwed Up, but the More I Think About It, the More Clear It Is They Started Screwing This Up 15 Years Ago"
description = 'It’s 2026 and an important, much-used app from Apple doesn’t offer basic list sorting controls that would have been a glaring omission 40 years ago. This was a completely solved problem decades ago, when computer RAM was measured in \kilo\bytes.'
date = "2026-08-19T21:39:47Z"
url = "https://daringfireball.net/2026/08/apple_testflight_list_sort_order"
author = "John Gruber"
text = ""
lastupdated = "2026-08-24T15:49:14.121963493Z"
seen = false
+++

[Zac Hall at 9to5Mac, a month ago](https://9to5mac.com/2026/07/21/apple-just-improved-testflight-for-users-with-a-lot-of-beta-apps/):

>
>
> Sometimes a small change can make a big impact. That’s especially true for Apple’s latest TestFlight update for users with a lot of pre-release software.
>
>
>
> Apple just updated TestFlight for iPhone, iPad, Mac, and more. The new version, 4.3, introduces “a search field to quickly find apps.”
>
>
>
> A quick comparison to version 4.2.2. shows just that: TestFlight now includes a search field along the bottom on iPhone and at the top of the sidebar on Mac.
>
>

This was a one-step-forward/two-steps-back regression. Of course it’s better to be able to search a list than not to have a search feature.

But when Apple implemented this change, they also changed the sort order of the list of apps you’re registered to test. Starting with this update, the list is sorted in alphabetical order. For as long as I can remember — perhaps dating back to [when TestFlight was a third-party utility](https://techcrunch.com/2014/02/21/rumor-testflight-owner-burstly-is-being-acquired-by-apple/) — the list was ordered by *recency*. The most recently updated app was at the top; the oldest at the bottom. Sorting by recency is really the only sort order that makes sense when you’re registered for dozens (or more) of apps. For me, trying to see if there is an update to a new app [whose name starts with U](https://marco.org/2026/08/14/unforgetful) now requires scrolling through over 100 items.

Sorting this list alphabetically by app name is like sorting my email by sender name. The main reason I ever open the app is to see what’s new. There’s no way now to see which apps have been updated recently other than painstakingly scrolling through what, for me, is a very long list.

I didn’t complain about this when the sort order changed last month because I figured it was an oopsie — that alphabetical order was supposed to kick in only when displaying search results, not by default. But here we are a month later and the presentation of apps in TestFlight makes me a little irritated every day. Do people inside Apple not use TestFlight themselves?

Also, if I consider the broader view, this really speaks to how much we’ve lost in terms of UI vocabulary. For *decades*, any list of items with names and dates could be sorted by name or date, ascending or descending, through the standard use of clickable headers at the top of every list. This was true for almost any such list in any app, on any platform — Mac, Windows, Unix, Amiga, whatever. This was just basic GUI stuff. Like: Can you select, copy, and paste text? Can you present a menu of command options? Can you assign keyboard shortcuts to frequently used commands? Can you sort a list of items by useful criteria like name or date?

iOS in 2007 introduced a simplified UI vocabulary that omitted many of these baseline GUI features. That seemed like a reasonable trade-off for a device with a 3.5-inch display and fat fingers as the only input device. But then iOS became popular and Apple stopped bringing the richer UI vocabulary of the Mac to iOS — copy-and-paste, for example, [didn’t appear until iOS 3.0](https://daringfireball.net/2009/06/copy_and_paste) (then named “iPhone OS”) — and started bringing iOS’s simplified, child-like UI grammar to MacOS. I’m only writing this article because Apple changed the sort order of apps in TestFlight from date to name. But the real problem is that there is only one sort order in TestFlight. I just can’t emphasize how ridiculous it would have been for any app, on any platform, to offer a list like this without “Name” and “Date” headers at the top that you could click to change the sort order (including clicking them again to switch between ascending and descending).

It’s 2026 and an important, much-used app from Apple doesn’t offer basic list sorting controls that would have been a glaring omission 40 years ago. We don’t complain because TestFlight isn’t an anomaly in this regard. Many (most?) apps from Apple today have lists that omit headers to control sort order, even though changing sort order is often very useful, and intuitively sortable list views used to be so bog-standard that we all just took them for granted.

It certainly shouldn’t have taken until July 2026 to be able to search in TestFlight, either. And being able to search, and see the results sorted alphabetically, shouldn’t mean you can no longer view the full list sorted by recency. These limitations are all so crude. It’s the GUI equivalent of borderline illiteracy.<sup id="fnr1-2026-08-19"><a href="#fn1-2026-08-19">1</a></sup>

I mean really, what are we doing here? This was a completely solved problem decades ago, when computer RAM was measured in *kilo*bytes. It’s like if most new books just no longer contained page numbers, because a cadre of dilettante designers decided that they prefer the way pocket-sized pamphlets look without them, and what works for an 8-page pamphlet must surely work for a 300-page novel.

---

1. Here’s another one: selecting multiple items in a list and then taking action on those items at once. This was a completely solved GUI problem. The Mac had standards for selecting a range of items (Shift-clicking) and selecting/de-selecting items non-contiguously (Command-clicking). You can still do this in Mac-assed Mac apps. But in apps like TestFlight you can’t. While suffering through this new alphabetical sort order for the last month, I’ve spent a minute or two every day deleting old apps from my list to winnow it down. This is a painstaking multi-step process for each app, and can only be done one app at a time. Why in the world can’t we select multiple apps at once and take an action like “Stop Testing” on the entire selection in one fell swoop? (Part of the answer might be that TestFlight appears to be largely written in [SwiftUI, not AppKit](https://daringfireball.net/2026/06/swiftui_only_makes_it_easy_to_develop_bad_apps).) [↩︎](#fnr1-2026-08-19)