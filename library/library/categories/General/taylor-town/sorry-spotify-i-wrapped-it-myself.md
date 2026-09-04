+++
title = "Sorry Spotify, I Wrapped It Myself"
description = "I meticulously document my album ratings (in plaintext)."
date = "2024-12-18T00:00:00Z"
url = "https://taylor.town/wrapped"
author = "Taylor Troesh"
text = ""
lastupdated = "2026-04-20T13:20:40.221884237Z"
seen = true
+++

![a grid of assorted book covers](https://taylor.town/wrapped-books-2024.jpg)

As the next calendar year nears, friends inevitably broadcast [Spotify Wrapped](https://en.wikipedia.org/wiki/Spotify_Wrapped) data across the groupchats.

 Peasants like me receive [Apple Music Replay](https://music.apple.com/us/replay). [Follow me](https://music.apple.com/profile/surprisetalk) at your indiscretion.

I'm unsure why, but I meticulously document [my album ratings](https://taylor.town/music) ([in plaintext](https://taylor.town/music.txt)). It's easy to grab my top picks of the year:

 Protip: you can append `.txt` to any of my essay URLs to fetch the plaintext version. For example, compare [/books](https://taylor.town/books) with [/books.txt](https://taylor.town/books.txt).

```
rev=$(git rev-list --since="2024-01-01" HEAD | tail -1)
git diff $rev HEAD -- src/Music.md | grep '^+' | grep ★★★★★
```

```
+| ★★★★★ | Roxy Radclyffe :: _The Median's Ark_                                                                                                                                |
+| ★★★★★ | Camarón de la Isla :: _La Leyenda del Tiempo_                                                                                                                       |
+| ★★★★★ | The Beatles :: _Magical Mystery Tour_                                                                                                                               |
+| ★★★★★ | Squarepusher :: _Hard Normal Daddy_                                                                                                                                 |
+| ★★★★★ | The Lemon Twigs :: _Everything Harmony_                                                                                                                             |
+| ★★★★★ | Janelle Monáe :: _The ArchAndroid_                                                                                                                                  |
+| ★★★★★ | Yo-Yo Ma, Stuart Duncan, Edgar Meyer & Chris Thile :: _The Goat Rodeo Sessions_                                                                                     |
+| ★★★★★ | Akademiska Damkören Lyran :: _Låt mig vara den jag är_                                                                                                              |
+| ★★★★★ | Comus :: _First Utterance_                                                                                                                                          |
```

Use [sacad](https://github.com/desbma/sacad) to download the album artwork:

```
pipx install sacad
sacad "roxy radclyffe" "the median's ark" 300 foo/0.jpg
```

Stitch the covers together with [ImageMagick](https://github.com/ImageMagick/ImageMagick):

```
brew install imagemagick
montage foo/*.jpg -tile 3x3 -geometry 300x300+0+0 wrapped-music-2024.jpg
```

![a grid of assorted album artwork](https://taylor.town/wrapped-music-2024.jpg)