---
title = "Gramophone audio from photograph, revisited"
description = """"I am the atomic powered robot. Please give my best wishes to everybody!"Those are the words uttered by Tommy, a childhood toy robot of mine. I've taken a look at his miniature vinyl record sound mechanism a few times before ([1](http://www.windytan.com/2013/02/the-atomic-powe"""
date = "2017-07-27T18:01:00.003Z"
url = "tag:blogger.com,1999:blog-5096278891763426276.post-2720644313846660674"
author = "Oona Räisänen"
text = ""
lastupdated = "2025-10-22T08:59:03.890152787Z"
seen = true
---

> "I am the atomic powered robot. Please give my best wishes to everybody!"

Those are the words uttered by Tommy, a childhood toy robot of mine. I've taken a look at his miniature vinyl record sound mechanism a few times before ([#1](http://www.windytan.com/2013/02/the-atomic-powered-robot.html), [#2](http://www.windytan.com/2013/02/the-laser-equipped-lego-train.html)), in an attempt to recover the analog audio signal using only a digital camera. Results were noisy at best. The blog posts resurfaced in a recent IRC discussion which inspired me to try my luck with a slightly improved method.

### Source photo ###

I will be using an old photo of Tommy's internal miniature record I already had from previous adventures in 2012. I don't want to perform another invasive operation on Tommy to take a new photograph, as I already broke a plastic tab last time I opened him. But it also means I don't have control over the photographing environment. It's part of the challenge.

The picture was taken with a DSLR and it's an uncompressed 8-bit color photo measuring 3000 by 3000 pixels. There's a fair amount of focus blur, chromatic aberration and similar distortions. But at this resolution, a clear pattern can be seen when zooming into the grooves.

[![[Image: Close-up shot of a miniature vinyl record, with a detail view of the grooves.]](https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEgt3gSLou9vVgUvBmkE3ED4wax1cru1J1s0FR8z1w2v59j3HqKD-l6MXafFwLk8SUS34_D5YkpPuGEDBv_4HgPwAlsrH_5dVNCqppDjuyYPS5lvUlMv72WIyiRfU4w6auJxqNW0wDCl-xVB/s350/vinyyli-zoom.jpg)](https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEgt3gSLou9vVgUvBmkE3ED4wax1cru1J1s0FR8z1w2v59j3HqKD-l6MXafFwLk8SUS34_D5YkpPuGEDBv_4HgPwAlsrH_5dVNCqppDjuyYPS5lvUlMv72WIyiRfU4w6auJxqNW0wDCl-xVB/s1600/vinyyli-zoom.jpg)

This pattern superficially resembles a variable-area optical audio track seen in old film prints, and that's why I previously tried to decode it as such. But it didn't produce satisfactory results, and there is no physical reason it even should. In fact, I'm not even sure as to which physical parameter the audio is encoded in – does the needle move vertically or horizontally? How would this feature manifest itself in the photograph? Do the bright blobs represent crests in the groove, or just areas that happen to be oriented the right way in this particular lighting?

### Unwrapping ###

To make the grooves a little easier to follow I first unwrapped the circular record into a linear image. I did this by remapping the image space from polar to 9000-wide Cartesian coordinates and then resampling it with a windowed sinc kernel:

[![[Image: The photo of the circular record unwrapped into a long linear strip.]](https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEgEcWYze6gwl_Adheon9elKRD6fon9GdyWpGg_LoCzE8UtkpPVtzcfOVNNB5EWT91ZjCl5l8mDfiUeYGuVOWDYCa5k6KxHmmgDLdQmJIOHCiWBGKlJQSv9-i7dVhL3ttktCXo2-zccBkkr5/s520/unwrapped.png)](https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEgEcWYze6gwl_Adheon9elKRD6fon9GdyWpGg_LoCzE8UtkpPVtzcfOVNNB5EWT91ZjCl5l8mDfiUeYGuVOWDYCa5k6KxHmmgDLdQmJIOHCiWBGKlJQSv9-i7dVhL3ttktCXo2-zccBkkr5/s1600/unwrapped.png)

### Mapping the groove path ###

It's not easy to automatically follow the groove. As one would imagine, it's not a mathematically perfect spiral. Sometimes the groove disappears into darkness, or blurs into the adjacent track. But it wasn't overly tedious to draw a guiding path manually. Most of the work was just copy-pasting from a previous groove and making small adjustments.

I opened the unwrapped image in Inkscape and drew a colored polyline over all obvious grooves. I tried to make sure a polyline at the left image border would neatly continue where the previous one ended on the right side.

The grooves were alternatively labeled as 'a' and 'b', since I knew this record had two different sound effects on interleaved tracks.

[![[Image: A zoomed-in view of the unwrapped grooves labeled and highlighted with colored lines.]](https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEgrCXDEnEGkileTPi_q5Zd8GVmEr4cxNPZBYj2zm4PXfMw4MP7v_HeI0Z024NxWeSfvObC3TXZJNFBig3xqHrB2luaHAFm-9RwYibcEacWEwfeqlFlmQJd1mMgP7EulMwK-oqbVAaQ62tmh/s420/raidat-manuaalisesti.png)](https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEgrCXDEnEGkileTPi_q5Zd8GVmEr4cxNPZBYj2zm4PXfMw4MP7v_HeI0Z024NxWeSfvObC3TXZJNFBig3xqHrB2luaHAFm-9RwYibcEacWEwfeqlFlmQJd1mMgP7EulMwK-oqbVAaQ62tmh/s1600/raidat-manuaalisesti.png)

This polyline was then exported from Inkscape and loaded by a script that extracted a 3-7 pixel high column from the unwrapped original, centered around the groove, for further processing.

### Pixels to audio ###

I had noticed another information-carrying feature besides just the transverse area of the groove: its displacement from center. The white blobs sometimes appear below or above the imaginary center line.

[![[Image: Parts of a few grooves shown greatly magnified. They appear either as horizontal stripes, or horizontally organized groups of distinct blobs.]](https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEi7BPvUXTmKHG6U_RrgeUoaXAKahZ67hbjVsTxb7MbfyvxA1AAf-swR0fSdSKx_PnWjHSKoXDYrf3lQiiATcOkx8tlmEBg0bhn_lQc3Bs2TBm3FNaA9aJ3MjQxNeLTh_lEDaPNh_wWRn78B/s380/groove-center-displacement.png)](https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEi7BPvUXTmKHG6U_RrgeUoaXAKahZ67hbjVsTxb7MbfyvxA1AAf-swR0fSdSKx_PnWjHSKoXDYrf3lQiiATcOkx8tlmEBg0bhn_lQc3Bs2TBm3FNaA9aJ3MjQxNeLTh_lEDaPNh_wWRn78B/s1600/groove-center-displacement.png)

I had my script calculate the brightness mass center (weighted y average) relative to the track polyline at all x positions along the groove. This position was then directly used as a PCM sample value, and the whole groove was written to a WAV file. A noise reduction algorithm was also applied, based on sample noise from the silent end of the groove.

The results are much better than what I previously obtained (see video below, or [mp3 here](https://oona.windytan.com/blogfiles/atomicpowered.mp3)):

[![Embedded YouTube video](https://img.youtube.com/vi/J0XMDiM2PrA/0.jpg)](https://www.youtube.com/watch?v=J0XMDiM2PrA)

### Future ideas ###

Several factors limit the fidelity and dynamic range obtained by this method. For one, the relationship between the white blobs and needle movement is not known. The results could possibly still benefit from more pixel resolution and color bit depth. The blob central displacement (insofar as it is the most useful feature) could also be more accurately obtained using a Gaussian fit or similar algorithm.

The groove guide could be drawn more carefully, as some track slips can be heard in the recovered audio.

Opening up the robot for another photograph would be risky, since I already broke a plastic tab before. But other ways to optically capture the signal would be using a USB microscope or a flatbed scanner. These methods would still be only slightly more complicated that just using a microphone! The linear light source of the scanner would possibly cause problems with the circular groove. I would imagine the problem of the disappearing grooves would still be there, unless some sort of carefully controlled lighting was used.