+++
title = "Apple Support: ‘About the Illuminated Apple Logo on MacBook Pro With PROLED XDR Display’"
description = "Apple Support:To make the Apple logo dark in all lighting conditions, you can turn off its illumination using Terminal, which is in the Utilities folder of your Applications folder. You can also use Spotlight to find and open it.Type or paste this command in Terminal, th"
date = "2026-11-06T15:03:51Z"
url = "https://support.apple.com/en-us/149248"
author = "John Gruber"
text = ""
lastupdated = "2026-11-06T15:07:03.056586076Z"
seen = false
+++

Apple Support:

>
>
> To make the Apple logo dark in all lighting conditions, you can turn off its illumination using Terminal, which is in the Utilities folder of your Applications folder. You can also use Spotlight to find and open it.
>
>
>
> Type or paste this command in Terminal, then press Return:
>
>
>
> ```
> sudo defaults write com.apple.CoreBrightness LEBacklightMode -int 0
>
> ```
>
>
>
> [...]
>
>
>
> To turn logo illumination on again, enter this command in Terminal:
>
>
>
> ```
> sudo defaults delete com.apple.CoreBrightness LEBacklightMode
>
> ```
>
>

Apple might make this a GUI setting, but if I were them, I’d keep it this way. Make the people without fun in their souls use the Terminal command.

[ ★ ](https://daringfireball.net/linked/2026/11/06/apple-support-illuminated-apple-logo)