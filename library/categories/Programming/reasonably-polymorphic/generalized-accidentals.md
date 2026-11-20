+++
title = "Generalized Accidentals"
description = "Just a little note on yesterday’s ornamental offsets. I realized overnight that this idea is way less weird to musicians than originally thought. The offset idea is really just generalized accidentals.Check it "
date = "2026-11-16T11:09:00Z"
url = "blog/accidentals/index.html"
author = "Sandy Maguire"
text = ""
lastupdated = "2026-11-19T14:05:17.969887846Z"
seen = false
+++

Just a little note on yesterday’s [ornamental offsets](/blog/notes-scales/#some-failed-attempts-at-pinnning-down-scales). I realized overnight that this idea is way less weird to musicians than originally thought. The offset idea is really just *generalized accidentals.*

Check it out: standard music notation, without ever saying so, assumes a `Fin 7` scale. The notation maps these degrees alternatingly between lines and spaces-between-lines. Thus `0..6 :: Deg 7` look like this:

![The Diatonic Scale](/images/music8/out3.cropped.svg)The Diatonic Scale

which correspond to seven contiguous white keys on the piano. But the piano also has five black keys between any seven contiguous white keys. Adding in the black keys gets us an additional five pitch classes, which brings us up to the `Fin 12` scale that Western music is based around.

Modulo some technicalities, there’s no way to notate these black keys directly. The black key between C and D is known either as “C sharp” or “D flat” — sharps moving one offset up in `Deg 12`, and flats moving one offset down. Thus the twelve pitch classes of the chromatic scale are notated either as sharps:

![Chromatic Sharps](/images/music8/out4.cropped.svg)Chromatic Sharps

or equivalently, as flats:

![Chromatic Flats](/images/music8/out2.cropped.svg)Chromatic Flats

Although it is usually omitted, there is also a “natural” symbol, to indicate the *absence* of a sharp or a flat. If we include these symbols into our sharps example, we get this:

![Chromatic Naturals and Sharps](/images/music8/out5.cropped.svg)Chromatic Naturals and Sharps

which represents exactly the same thing as the “Chromatic Sharps” figure. We’re just being a little more pedantic here.

To drive everything home, these accidental symbols are *exactly* the `Deg 12` ornaments on a `Note 7` that we were investigating last time. If we change the `♮` symbol to `0`, the `♯` to `+1` and the `♭` to `-1`, our chromatic scales look like this:

![Explicit Accidental Sharps](/images/music8/out6.cropped.svg)Explicit Accidental Sharps ![Explicit Accidental Flats](/images/music8/out8.cropped.svg)Explicit Accidental Flats

Both examples now have “obvious” encodings as `Note 7`s: use the notated pitch as the `Deg 7`, and the offset as a `stepIn @12`. Thus “Explicit Accidental Sharps” is encoded as:

```
[ 0
, stepIn @12 1 0
, 1
, stepIn @12 1 1
, 2
, 3
, stepIn @12 1 3
, 4
, stepIn @12 1 4
, 5
, stepIn @12 1 5
, 6
] :: [Note 7]
```

Rather unsurprisingly, when we `applyScale diatonic` over this collection, we get `[0..11] :: Note 12`, which is just to say that this enumerates all of the pitch classes in the chromatic scale. And of course it does, because we designed it that way in the first place!

So this all brings us back to yesterday’s `Ornaments` type, which allows us to express offsets at *any* scale degree — not just `Deg 12` like sharps and flats in standard musical notation allow us to target. So let’s broaden our visualization a little more, making it explicit that our chromatic offsets are in `Deg 12`:

![Deg 12 Explicit Accidentals](/images/music8/out9.cropped.svg)Deg 12 Explicit Accidentals

Now that this has been made explicit, there’s no reason why we can’t add *multiple* accidentals to any given note. For example, we could make put a `stepIn @10 2` on the second note, *in addition to* a `stepsIn @12 (-1)`!

![Mixing Accidentals](/images/music8/out10.cropped.svg)Mixing Accidentals

This one says that if we were to map our `Note 7` into `Note 10`, we’d move the second note up by `2 :: Deg 10`. Then when we mapped the resulting `Note 10`s into `Note 12`, we’d move that note again — this time down by `-1 :: Deg 12`.

So the ideas here really *are* familiar to musicians — the standard notation just makes it hard to see what it is we’re talking about.

To give a bit more of a musical example, we can give a little triadic motif:

![Triadic Motif](/images/music8/out11.cropped.svg)Triadic Motif

Notice that the third note here is one `Deg 7` above the `Note 3`, while the fourth note is one `Deg 12` *below* the `Note 3`. In musical terms, we’re arpeggiating a triad, but inserting a diatonic note above the “third” and a chromatic note below the “fifth” (scare quotes because the thirds and fifths move!)

If we then repeat this motif twice more, each time one `Deg 3` up, we get this:

![Triadic Motif Sequence](/images/music8/out12.cropped.svg)Triadic Motif Sequence

Finally, mapping this sequence into standard notation (assuming we map via `triad` and `diatonic`) produces this rather pleasing melody:

![Melody](/images/music8/out13.cropped.svg)Melody

Notice how what was a completely regular pattern in `Note 3` expands out unevenly each time around, producing interesting motific development.

Hopefully this gives a taste of what all that `Note` and `Ornaments` nonsense from yesterday is all about. Not only are these ideas already familiar to musicians, they also immediately produce musically interesting results!