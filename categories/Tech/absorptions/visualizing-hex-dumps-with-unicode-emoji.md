---
title = "Visualizing hex dumps with Unicode emoji"
description = "Memorizing SSH public key fingerprints can be difficult; they're just long random numbers displayed in base 16. There are some terminal-friendly solutions, like OpenSSH's randomart. But because I use a Unicode terminal, I like to map the individual bytes into characters in the [M"
date = "2014-10-29T23:52:00.003Z"
url = "tag:blogger.com,1999:blog-5096278891763426276.post-7039745451118618656"
author = "Oona Räisänen"
text = ""
lastupdated = "2025-10-22T08:59:03.912668438Z"
seen = true
---

Memorizing SSH public key fingerprints can be difficult; they're just long random numbers displayed in base 16. There are some terminal-friendly solutions, like OpenSSH's randomart. But because I use a Unicode terminal, I like to map the individual bytes into characters in the [Miscellaneous Symbols and Pictographs](https://en.wikipedia.org/wiki/Miscellaneous_Symbols_and_Pictographs) block.

This Perl script does just that:

```

@emoji = qw( 🌀  🌂  🌅  🌈  🌙  🌞  🌟  🌠  🌰  🌱  🌲  🌳  🌴  🌵  🌷  🌸
             🌹  🌺  🌻  🌼  🌽  🌾  🌿  🍀  🍁  🍂  🍃  🍄  🍅  🍆  🍇  🍈
             🍉  🍊  🍋  🍌  🍍  🍎  🍏  🍐  🍑  🍒  🍓  🍔  🍕  🍖  🍗  🍘
             🍜  🍝  🍞  🍟  🍠  🍡  🍢  🍣  🍤  🍥  🍦  🍧  🍨  🍩  🍪  🍫
             🍬  🍭  🍮  🍯  🍰  🍱  🍲  🍳  🍴  🍵  🍶  🍷  🍸  🍹  🍺  🍻
             🍼  🎀  🎁  🎂  🎃  🎄  🎅  🎈  🎉  🎊  🎋  🎌  🎍  🎎  🎏  🎒
             🎓  🎠  🎡  🎢  🎣  🎤  🎥  🎦  🎧  🎨  🎩  🎪  🎫  🎬  🎭  🎮
             🎯  🎰  🎱  🎲  🎳  🎴  🎵  🎷  🎸  🎹  🎺  🎻  🎽  🎾  🎿  🏀
             🏁  🏂  🏃  🏄  🏆  🏇  🏈  🏉  🏊  🐀  🐁  🐂  🐃  🐄  🐅  🐆
             🐇  🐈  🐉  🐊  🐋  🐌  🐍  🐎  🐏  🐐  🐑  🐒  🐓  🐔  🐕  🐖
             🐗  🐘  🐙  🐚  🐛  🐜  🐝  🐞  🐟  🐠  🐡  🐢  🐣  🐤  🐥  🐦
             🐧  🐨  🐩  🐪  🐫  🐬  🐭  🐮  🐯  🐰  🐱  🐲  🐳  🐴  🐵  🐶
             🐷  🐸  🐹  🐺  🐻  🐼  🐽  🐾  👀  👂  👃  👄  👅  👆  👇  👈
             👉  👊  👋  👌  👍  👎  👏  👐  👑  👒  👓  👔  👕  👖  👗  👘
             👙  👚  👛  👜  👝  👞  👟  👠  👡  👢  👣  👤  👥  👦  👧  👨
             👩  👪  👮  👯  👺  👻  👼  👽  👾  👿  💀  💁  💂  💃  💄  💅 );

while (<>) {
  if (/[a-f0-9:]+:[a-f0-9:]+/) {
    ($b, $m, $a) = ($`, $&, $');
    print $b.join("  ", map { $emoji[$_] } map hex, split /:/, $m)." ".$a;
  }
}
```

What's happening here? First we create a 256-element array containing a hand-picked collection of emoji. Naturally, they're all assigned an index from 0x00 to 0xff. Then we'll loop through standard input and look for lines containing colon-separated hex bytes. Each hex value is replaced with an emoji from the array.

Here's the output:

![[Image: Terminal screenshot showing a PGP key fingerprint and the same with all hex numbers replaced with emoji.]](https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEiSqjooSaf0To6FrwZgBLMDYJQHvR191sOKPXBI2QkiB8wQm6MVOKg2UbXH9cw3fL0v99vL2mxvdLEgJwXoZGl6_lE9LzAvKm7ccBuX__Nsv4JtwsE7dfI9C1mqdqnl29pEm78SDW1n3H8y/s480/rsa.png)

The script could easily be extended to support output from other hex-formatted sources as well, such as xxd:

![[Image: Terminal screenshot showing a hex dump of a poem and the same with all hex numbers replaced with emoji. kissofoni; tassun kynsi neulana / musa korvista kajahtaa]](https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEgslVegzWOtb-hUhvIKDSKCLGAo_hfuorZCNSp90FuuO8_sprWa_eYVleRlCJFJfdR0m0B7d-uz4iUHY4MbJsMFI-VPigBi3IcC6vTxL9J7pZLclC-zSbNcI-yEgEC6RSlihrTr-7npZaVN/s480/korvista.png)

Some additional methods for visualizing hex dumps and key fingerprints, from the comments section:

* [PGP Strong Set Top 50 Fingerprint Art](http://user.xmission.com/~atoponce/art/)
* [VizHash GD - a visual hash](http://sebsauvage.net/wiki/doku.php?id=php:vizhash_gd)