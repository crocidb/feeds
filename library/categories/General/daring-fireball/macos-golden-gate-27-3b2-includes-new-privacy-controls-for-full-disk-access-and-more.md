+++
title = "MacOS Golden Gate 27.3b2 Includes New Privacy Controls for Full Disk Access (and More)"
description = "Remember a month ago when Apple announced, without any significant detail, that they would be changing the permission-granting UI for Full Disk Access to “introduce addit"
date = "2026-11-16T20:27:34Z"
url = "https://9to5mac.com/2026/11/16/macos-27-3-includes-new-privacy-controls-for-full-disk-access-and-more/"
author = "John Gruber"
text = ""
lastupdated = "2026-11-19T14:05:14.067797593Z"
seen = false
+++

[Remember a month ago](https://daringfireball.net/2026/10/apple_full_disk_access) when Apple announced, [without any significant detail](https://developer.apple.com/news/?id=p6zjojqw), that they would be changing the permission-granting UI for Full Disk Access to “introduce additional controls to ensure that users who genuinely wish to grant an app this extraordinary level of access can only do so with very explicit user action”? It’s launching today in developer beta 2 of MacOS 27.3. Chance Miller has a great overview at 9to5Mac:

>
>
> In macOS 27.2, “Device Control and Data Access” is a unified toggle in System Settings, where Apple says that apps with that level of access can “view and send email, edit contacts and photos, monitor your keyboard, track websites, record your screen, control any app on your Mac, and more.”
>
>
>
> In macOS 27.3, Apple is splitting “Device Control and Data Access” into two categories:
>
>
>
> * Accessibility: Intended specifically for assistive technologies, with permissions handled through an entitlement process.
>   
>   
> * System and App Protection Override: A new category for apps that need to bypass certain macOS protections to control other apps or perform automated tasks.
>   
>   
>
>
>
> For the latter, users will be able to specify which apps an automation tool can access rather than granting it unrestricted control. For instance, you could give an app access to the Mail app, but not Messages.
>
>
>
> macOS 27.3 also adds an option for users to require an app to request permission every time it requires access, rather than granting it access indefinitely.
>
>
>
> Apple is also introducing a new menu bar indicator that will provide additional transparency when an app is controlling another app with System and App Protection Override. This is designed to let users know when an automation tool is interacting with apps and information in the background.
>
>

I’m installing it now, but from what I’ve seen so far, these changes not only alleviate my concerns that Apple might over-tighten the screws, I actually think they add clarity and give users *more*, not less, control over their Macs.

[ ★ ](https://daringfireball.net/linked/2026/11/16/macos-27-full-disk-access)