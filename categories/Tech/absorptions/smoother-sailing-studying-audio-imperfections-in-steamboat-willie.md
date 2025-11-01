---
title = "Smoother sailing: Studying audio imperfections in Steamboat Willie"
description = '<img alt="" border="0" width="240" data-original-height="600" data-original-width="720" src="https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEgmpMyJpJ8YH4hEKMKde_Pow2smdNeAH6fSTNsUd-g0ZOzvJRNoDwj0N1WNQL82P5MMJSZrz83kgqX9K86wFDNtde3Fczi4X8juTW3orD9acpHU3OrdTbAvqq2IfILDZJ'
date = "2024-01-23T19:47:00.018Z"
url = "tag:blogger.com,1999:blog-5096278891763426276.post-128397700755784922"
author = "Oona Räisänen"
text = ""
lastupdated = "2025-10-22T08:59:03.866373613Z"
seen = true
---

<img alt="" border="0" width="240" data-original-height="600" data-original-width="720" src="https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEgmpMyJpJ8YH4hEKMKde_Pow2smdNeAH6fSTNsUd-g0ZOzvJRNoDwj0N1WNQL82P5MMJSZrz83kgqX9K86wFDNtde3Fczi4X8juTW3orD9acpHU3OrdTbAvqq2IfILDZJFvZtaav4JT1HbDybzN7sNyxr0ilR5mQMr0QZTF0Qb_r615A421JOMBvHli4fIX/s480/mikki.jpg">

*Steamboat Willie* (1928) was one of the earliest cartoons with synchronized sound. That is, it had post-production sound effects; this was something new and exciting. Now that the cartoon has recently entered the public domain[[bbc24]](#bbc24) we can safely delve into its famous soundtrack. See, there's something interesting about how it sounds...

If you listen closely to the [soundtrack on Youtube](https://www.youtube.com/watch?v=I5pG1wbRKOg) it sounds somehow distorted. You might be tempted to point out that it's 96 years old, yes. But you might also recognize that it is suffering from *flutter*, i.e. an unstable playback or recording speed.

In the spirit of this blog let's geek out for a bit and study this flutter distortion further. Can we learn something interesting? Could we perhaps learn enough to be able to reduce it?

Of course the flutter might be 100% authentic to how it sounded in theatres in the 1920s; we don't know when and why it appeared in the audio (more on that later!). It might have sounded even worse. But we can still hope to enjoy the sound effects in their original recorded form.

### Prior work ###

I'm not the first one to notice this clip is 'fluttering' and to try and do something about it. I found videos of people's attempts to un-flutter it using Celemony Capstan, a professional tool made just for this purpose, with varying results. Capstan uses Melodyne's famous note detection engine to detect musical features and then controls a varispeed effect to cancel out any flutter.

But Capstan is expensive, and it's more fun to come up with a home-made solution anyway. And what about non-musical sounds? Besides, I had some code laying around in a forgotten desk drawer that just might fit the purpose.

### Finding a high quality source ###

Why would I need a high-quality digital file of a poor-quality soundtrack from the 1920s? I guess it's the archivist in me hoping that it has been preserved with high level of detail. But also, if you're going to try and dig up some hidden details in the sound, you'd want minimal interference from any lossy psychoacoustic compression, right? These artifacts might become audible after varispeed effects and could also hinder frequency detection.

[<img alt="[Image: Two spectrograms labeled 'random Youtube video' and '4K version', the former showing compression artifacts.]" border="0" width="520" data-original-height="515" data-original-width="1353" src="https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEhxHxA1NzbJulmPxer0gk48ImmkoN4ji66G3lnAMiMYlLkE0ekgJ6VTq9umFEn97Wr5dGUIo8fzsUpC8w6DL_9yptx8BqDQe0swHSQpJ62F3f-CYlLrYNMwLsW61j4GLWbLINrLsSpvwkih9Mn7I_kbaXADf47Imt3AgK3Hxo3U-wM4JQpFkNOy9DtHQUA3/s520/yt-vs-4k.jpg" srcset="https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEhxHxA1NzbJulmPxer0gk48ImmkoN4ji66G3lnAMiMYlLkE0ekgJ6VTq9umFEn97Wr5dGUIo8fzsUpC8w6DL_9yptx8BqDQe0swHSQpJ62F3f-CYlLrYNMwLsW61j4GLWbLINrLsSpvwkih9Mn7I_kbaXADf47Imt3AgK3Hxo3U-wM4JQpFkNOy9DtHQUA3/s1040/yt-vs-4k.jpg 2x">](https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEhxHxA1NzbJulmPxer0gk48ImmkoN4ji66G3lnAMiMYlLkE0ekgJ6VTq9umFEn97Wr5dGUIo8fzsUpC8w6DL_9yptx8BqDQe0swHSQpJ62F3f-CYlLrYNMwLsW61j4GLWbLINrLsSpvwkih9Mn7I_kbaXADf47Imt3AgK3Hxo3U-wM4JQpFkNOy9DtHQUA3/s1353/yt-vs-4k.jpg)

The high-quality [source](https://archive.org/details/steamboat-willie-4-k-resolution) I found is in the Internet Archive. It might originally be coming from the 4K Blu-Ray release called Celebrating Mickey. The spectrogram doesn't show almost any compression artifacts that I can see, even in the quietest frequency ranges! Perfect!

[<img alt="[Image: A single film frame.]" border="0" width="400" data-original-height="457" data-original-width="1100" src="https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEhC59_S2FfWRnMghfZ4QuHa4GEugXiwUtUudblRrARDPO-v171yCcH4ri_lUxGpkcWCbh1d6htKfH7CSqmMjjJpG0id9XcyMLNTz2k5yVn2jTDvWu62jhr1bl0BOugwiI2CepLB3Y20DwI2sPGV_kQvPmt1nNdwvQPFVVeHVk-9JtyuxoUyyLCiG3IhXd-e/s400/film_scan.jpg">](https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEhC59_S2FfWRnMghfZ4QuHa4GEugXiwUtUudblRrARDPO-v171yCcH4ri_lUxGpkcWCbh1d6htKfH7CSqmMjjJpG0id9XcyMLNTz2k5yVn2jTDvWu62jhr1bl0BOugwiI2CepLB3Y20DwI2sPGV_kQvPmt1nNdwvQPFVVeHVk-9JtyuxoUyyLCiG3IhXd-e/s1100/film_scan.jpg)

But the Internet Archive [delivers](https://archive.org/details/steamboat-willie-16mm-film-scan-4k-lossless) something even better. There's a (visually) lossless 4K scan of the movie with the [optical soundtrack](https://en.wikipedia.org/wiki/Sound-on-film) partially included (above)! The high-quality version is 34 GB, but there's a downscaled 480p MP4 one thousandth of the size.

I listened to the optical soundtrack from this low-resolution version with a little pixel-reader script. Turns out the flutter is already present on the film! (Edit: Note that we don't know where this particular film print came from. When was it created? Is there an original somewhere, without flutter?)

### Hand-guiding a frequency tracker ###

Looking at the above spectrogram, we can see that the frequency of everything is zig-zagging as a function of time – that's flutter all right. But how to quantify these variations? We could zoom in on one of the frequency peaks and follow the course of its frequency in time. I'm using FFT peak interpolation to find more accurate frequency estimates[[gasior04]](#gasior04).

Take the sound of Pete's tobacco hitting the ship's bell around the 01'45'' mark. You'd think a bell is supposed to have a constant frequency, yet this one sounds quite unstable. We can follow any one of the harmonics and see how the playback speed (bell frequency) varies over the period of one second:

[<img alt="[Image: Spectrogram with fluctuating tones.]" border="0" width="550" data-original-height="532" data-original-width="1784" src="https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEgnShT00BrqwOsAyo2lEg8GsM894ogOPfS0K1BARfwYSE_2TfpPVAYjTkdx1f1rff48an2iDaUxXdQguAdkJDbZqW5Pk06ZHylJx9iZTxmAu1ztnikQIF-rVobS5xPQZmB_QRQhTO4P_Ym4Bz5HttsqxFNw8260cjloq4UeKI7iwReipqjaBaTJnuJYZs3G/s550/flutterpercent.png" srcset="https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEgnShT00BrqwOsAyo2lEg8GsM894ogOPfS0K1BARfwYSE_2TfpPVAYjTkdx1f1rff48an2iDaUxXdQguAdkJDbZqW5Pk06ZHylJx9iZTxmAu1ztnikQIF-rVobS5xPQZmB_QRQhTO4P_Ym4Bz5HttsqxFNw8260cjloq4UeKI7iwReipqjaBaTJnuJYZs3G/s1100/flutterpercent.png 2x">](https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEgnShT00BrqwOsAyo2lEg8GsM894ogOPfS0K1BARfwYSE_2TfpPVAYjTkdx1f1rff48an2iDaUxXdQguAdkJDbZqW5Pk06ZHylJx9iZTxmAu1ztnikQIF-rVobS5xPQZmB_QRQhTO4P_Ym4Bz5HttsqxFNw8260cjloq4UeKI7iwReipqjaBaTJnuJYZs3G/s1784/flutterpercent.png)

To my eye, this oscillation looks periodic and not random at all. We can run another round of FFT on a longer stretch of samples to find the strongest period of these fluctuations: It turns out to be 15 Hz. (Why 15? I so hoped it would have been 24 Hz – it would have made a more interesting story! More on that later...)

[<img alt="[Image: Spectrum plot showing a peak at 15.0 Hz about 15 dB higher than background.]" border="0" width="550" data-original-height="397" data-original-width="1490" src="https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEiVcLRpMLSy3_mVGx7bqA2qq5eM5OgSp_4PBNZs0ESSw0WGaYm_uNd-xOEhyWpeEy5_9itOS3Ta34aAkOTqVMf38gGuTxfbi8Ru9NNl1EaeHQxQh3OrIaF4uurbNYPz4guDRldNGc9PT0rlKgeAAxX-1uJKHQDUt9qQLAHc8I3kLwiiEoT_XhUZmTwdV_tv/s550/15hz.png" srcset="https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEiVcLRpMLSy3_mVGx7bqA2qq5eM5OgSp_4PBNZs0ESSw0WGaYm_uNd-xOEhyWpeEy5_9itOS3Ta34aAkOTqVMf38gGuTxfbi8Ru9NNl1EaeHQxQh3OrIaF4uurbNYPz4guDRldNGc9PT0rlKgeAAxX-1uJKHQDUt9qQLAHc8I3kLwiiEoT_XhUZmTwdV_tv/s1100/15hz.png 2x">](https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEiVcLRpMLSy3_mVGx7bqA2qq5eM5OgSp_4PBNZs0ESSw0WGaYm_uNd-xOEhyWpeEy5_9itOS3Ta34aAkOTqVMf38gGuTxfbi8Ru9NNl1EaeHQxQh3OrIaF4uurbNYPz4guDRldNGc9PT0rlKgeAAxX-1uJKHQDUt9qQLAHc8I3kLwiiEoT_XhUZmTwdV_tv/s1490/15hz.png)

Okay, so can we repeat this process for the whole movie? I don't think we can just automatically follow the frequency of every peak, since some sounds will naturally contain vibration and rises and drops in frequency. Not all of it is due to flutter. Some sort of a vetting process is needed. We could try a tedious manual route...

[<img alt="[Image: GUI of a software with spectrograms and oscillogram plots.]" border="0" width="550" data-original-height="952" data-original-width="1204" src="https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEjeHxYb1XXSjCwdDvUnGoPv0OVbnzi2W_PaxSo2_tfchJ73ArpUu6D61cFciKnrS8T5fsmgblIapbsuvmPx7tg2wSthgzbLsxvo8H8PGBncLuCemYWExdgDEdADr_Pl21gpg9PtsylusilHh9Y8I7cDCzsFPJs-nTlbSn_-NJnKNcwm_uU2cQMC5Nwpt7Yh/s550/annotation.jpg" srcset="https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEjeHxYb1XXSjCwdDvUnGoPv0OVbnzi2W_PaxSo2_tfchJ73ArpUu6D61cFciKnrS8T5fsmgblIapbsuvmPx7tg2wSthgzbLsxvo8H8PGBncLuCemYWExdgDEdADr_Pl21gpg9PtsylusilHh9Y8I7cDCzsFPJs-nTlbSn_-NJnKNcwm_uU2cQMC5Nwpt7Yh/s1100/annotation.jpg 2x">](https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEjeHxYb1XXSjCwdDvUnGoPv0OVbnzi2W_PaxSo2_tfchJ73ArpUu6D61cFciKnrS8T5fsmgblIapbsuvmPx7tg2wSthgzbLsxvo8H8PGBncLuCemYWExdgDEdADr_Pl21gpg9PtsylusilHh9Y8I7cDCzsFPJs-nTlbSn_-NJnKNcwm_uU2cQMC5Nwpt7Yh/s1204/annotation.jpg)

I made a little software tool (above) where I could click and drag little boxes onto a spectrogram to search for peaks in. This wobbly line is then simply taken to be the speed variation (red graph in the top picture).

It became quite a chore to annotate longer sounds as this software didn't come with undo, edit, or save features for the longest time!

Now let's think about what to do with this speed information...

### Desk drawer deep dive ###

Some time ago I had made a tool that could well come in handy now. It was for correcting wobbly wideband radio recordings stored on VHS tapes. These recordings contained some empty carriers that happened to work like seismographs, accurately recording the tape speed variations. The tool then used a [Lagrange polynomial](https://en.wikipedia.org/wiki/Lagrange_polynomial) to interpolate new samples at a steady interval, so called 'digital varispeed'.

It was ultimately based on an interesting paper on de-fluttering magnetic tapes using the tape bias signal as reference[[howarth04]](#howarth04).

[<img alt="[Image: Buttons of an old device, one of them Varispeed, labeled 1981. Below, part of a GUI with the text Varispeed, labeled 2023.]" border="0" width="240" data-original-height="386" data-original-width="547" src="https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEi-ftP_bhx7_ijHh3uG18VJRLnLsRbKWaho5kgEz3Hu5y5m5R1pYC3BivLZunACRMAllEkv4YrMKk1ANe3YVOeyuM2rvzMEW8LoHJqyewoU8B6ABosgMbwAptHtv4VTwU0zbKB6fJP5Qx36iiDS8Pm-ok9yAd9EYUfQO06Oi8-JSQp0UIe0LPhcsV4hqP6P/s240/1981.jpg">](https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEi-ftP_bhx7_ijHh3uG18VJRLnLsRbKWaho5kgEz3Hu5y5m5R1pYC3BivLZunACRMAllEkv4YrMKk1ANe3YVOeyuM2rvzMEW8LoHJqyewoU8B6ABosgMbwAptHtv4VTwU0zbKB6fJP5Qx36iiDS8Pm-ok9yAd9EYUfQO06Oi8-JSQp0UIe0LPhcsV4hqP6P/s547/1981.jpg)

By the way, I keep mentioning *varispeed* and never explained it. This was a feature of old studio-grade reel-to-reel tape recorders where the playback speed could be freely varied by the operator; hence vari+speed. Audio people still use this word in the digital world to essentially refer to variable-rate resampling, which has the same effect, so I'm using them interchangeably. (Topmost photo: Ferdinando Traversa, [CC BY](https://creativecommons.org/licenses/by/4.0/), cropped to detail)

Here's what this digital varispeed sounds like when exaggerated. In the below example I'm doing it in a simpler way. Instead of the Lagrange method I first upsampled some music by 10x in an audio software; hand-drew a speed curve in Audacity; and then used that curve to pick samples out of the oversampled music:

[<img alt="[Image: A waveform in Audacity.]" border="0" width="550" data-original-height="182" data-original-width="1501" src="https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEjRocIM1OFdKzStrX8VTZ_pZnynkIJRxVZzCKjdBIkCa9FqKFTXNrYfwUBvsO0dp0iy0FpivP1g_FQboHFDF3xgNcWd303GLKqwH3s3NB2hyphenhyphenwhXyNdi3kNUMhS07pEdQw9cbcmaRZ94IGMfwdLfqDsIj9vh4PH2Qtqpvr6kJGZipaShCdrVYg-j59Sjo9Cy/s550/speed-variations.png" srcset="https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEjRocIM1OFdKzStrX8VTZ_pZnynkIJRxVZzCKjdBIkCa9FqKFTXNrYfwUBvsO0dp0iy0FpivP1g_FQboHFDF3xgNcWd303GLKqwH3s3NB2hyphenhyphenwhXyNdi3kNUMhS07pEdQw9cbcmaRZ94IGMfwdLfqDsIj9vh4PH2Qtqpvr6kJGZipaShCdrVYg-j59Sjo9Cy/s1100/speed-variations.png 2x">](https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEjRocIM1OFdKzStrX8VTZ_pZnynkIJRxVZzCKjdBIkCa9FqKFTXNrYfwUBvsO0dp0iy0FpivP1g_FQboHFDF3xgNcWd303GLKqwH3s3NB2hyphenhyphenwhXyNdi3kNUMhS07pEdQw9cbcmaRZ94IGMfwdLfqDsIj9vh4PH2Qtqpvr6kJGZipaShCdrVYg-j59Sjo9Cy/s1501/speed-variations.png)

 const wavesurfer = WaveSurfer.create({ container: '#varywave', waveColor: 'rgb(25, 100, 200)', progressColor: 'rgb(0, 100, 100)', url: 'https://oona.windytan.com/blogfiles/vary-out.mp3', mediaControls: true, })  \<div class="audiodiv"\>\<audio controls=""\>\<source src="https://oona.windytan.com/blogfiles/vary-out.mp3"\>\</audio\>\</div\>

Carefully controlled, this effect can be used to cancel out flutter. Here's how: If we knew exactly how the playback speed was fluctuating we could instantly vary the speed of our resampler in the opposite direction, thus canceling the variations. And with the above research we now have that knowledge!

Well, almost. I couldn't always see a clear frequency peak to follow, so the graph is patchy. But.. Maybe it could help to band-pass the speed signal at 15 Hz? This would help fill out small gaps and also preserve vibrato and other fluctuations that aren't part of the flutter distortion. We can at least try!

[<img alt="[Image: Two waveforms, one of them piecewise and noisy, the other one smooth and continuous.]" border="0" width="550" data-original-height="244" data-original-width="1028" src="https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEj0n3FreUSaXNwU3f4_NacMaZACdrpp-bcD3AGkqcOLVPbVbGDs34gKuhIYvmzoW8sBSLWWJ1UwhJVefJ7HPRSFV3sw93N2oPVT5p98J54dQz6kQEiAPE_HKoej4DE4dXHtbMREBfLOX43NVzJ8LgETuGbJKS6KET1NqhfyXqmn8FOW3Pw579ivisEsNnU5/s550/flutter-filter.png" srcset="https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEj0n3FreUSaXNwU3f4_NacMaZACdrpp-bcD3AGkqcOLVPbVbGDs34gKuhIYvmzoW8sBSLWWJ1UwhJVefJ7HPRSFV3sw93N2oPVT5p98J54dQz6kQEiAPE_HKoej4DE4dXHtbMREBfLOX43NVzJ8LgETuGbJKS6KET1NqhfyXqmn8FOW3Pw579ivisEsNnU5/s1100/flutter-filter.png 2x">](https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEj0n3FreUSaXNwU3f4_NacMaZACdrpp-bcD3AGkqcOLVPbVbGDs34gKuhIYvmzoW8sBSLWWJ1UwhJVefJ7HPRSFV3sw93N2oPVT5p98J54dQz6kQEiAPE_HKoej4DE4dXHtbMREBfLOX43NVzJ8LgETuGbJKS6KET1NqhfyXqmn8FOW3Pw579ivisEsNnU5/s1028/flutter-filter.png)

In the example above, I replaced empty parts with a constant value of 100% and then filtered the whole thing. This sews the disjointed parts together in a smooth way.

### Can we hear some examples already? ###

This clip is from when the goat ate Minnie's sheet music and guitar – the apparent catalyst event that sent Mickey Mouse to seek revenge on the entire animal kingdom.

\#scorehogwave \> div { word-wrap: break-word; word-break: normal; }  const regions\_scorehog = WaveSurfer.Regions.create(); const wavesurfer\_scorehog = WaveSurfer.create({ container: '#scorehogwave', waveColor: 'rgb(25, 100, 200)', progressColor: 'rgb(0, 100, 100)', mediaControls: true, plugins: [regions\_scorehog], }); wavesurfer\_scorehog.load('https://oona.windytan.com/blogfiles/scorehog-combined.mp3'); wavesurfer\_scorehog.on('decode', () =\> { // Regions regions\_scorehog.addRegion({ start: 0.8, content: 'Before', drag: false, }) regions\_scorehog.addRegion({ start: 14.5, content: 'After', drag: false, }) });  \<div class="audiodiv"\>\<audio controls=""\>\<source src="https://oona.windytan.com/blogfiles/scorehog-combined.mp3" id="scorehogaudio"\>\</audio\>\</div\>

You can definitely hear the difference in the bell-like sounds coming from the goats insides. It even sounds like the little flute notes in the beginning are easier to tell apart in the corrected version.

Here's another musical example, with strings.

\#jousiawave \> div { word-wrap: break-word; word-break: normal; }  const regions\_jousia = WaveSurfer.Regions.create(); const wavesurfer\_jousia = WaveSurfer.create({ container: '#jousiawave', waveColor: 'rgb(25, 100, 200)', progressColor: 'rgb(0, 100, 100)', mediaControls: true, plugins: [regions\_jousia], }); wavesurfer\_jousia.load('https://oona.windytan.com/blogfiles/jousia-combined.mp3'); wavesurfer\_jousia.on('decode', () =\> { // Regions regions\_jousia.addRegion({ start: 0.9, content: 'Before', drag: false, }) regions\_jousia.addRegion({ start: 14.5, content: 'After', drag: false, }) });  \<div class="audiodiv"\>\<audio controls=""\>\<source src="https://oona.windytan.com/blogfiles/jousia-combined.mp3" id="scorehogaudio"\>\</audio\>\</div\>

The cow's moo. That's a hard one because it's so rich in harmonics, in the spectrogram it looks almost like a *spaghetti bolognese*. My algorithm is constrained to a box and can't stay with one harmonic when the 'moo' slides in frequency. You can hear some artifacts because of this, but still the result sounds less sheep-like than the original.

|Before|   | <img alt="[Image: Movie screenshot]" border="0" width="160" data-original-height="270" data-original-width="324" src="https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEj-rof_q4SRStw6UAZpRiymm4m8SaiYjwDouDWZPEIiFYqRiKC45pmSaQ2Rh40dMz6yzsRUYrEPIWta3lOCicEgyPLUV9w4KljzS8jHH8iQ0JvhaGZqIY42Y92MJsBCuGEAQaZAI_inkwl5okdLezPlxoWDJbyUcR15Cql4wZyL5bQx5zvVBcZF__ECBsYo/s320/example-moo.jpg">|
|------|---|-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
|After |   |                                                                                                                                                                                                                                                                                                                                                                                                       |

But Mickey whistling "Steamboat Bill" in the beginning of the film actually doesn't sound better when corrected... I preferred a bit of vibrato!

|Before|   | <img alt="[Image: Movie screenshot]" border="0" width="160" data-original-height="270" data-original-width="324" src="https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEjjuZucmQXJmuMxSCIdBgbrQKBvsv2d5RW-Kq8GB0cPQmCXGruPZUfl8v2D5zy4yRCSKZKwUuVodofx1pDjkigdDlcnxqYcpYFrlTKUPnE26IJxCkBxP9jByvT0VInbjYEhBOK0TeWElBiwweNZ_1oz3izzt7mVv4iAlGaVvpsXG75pCebzIJLy-hPmAmgL/s320/example-whistle.jpg">|
|------|---|-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
|After |   |                                                                                                                                                                                                                                                                                                                                                                                                           |

### Sidetrack 1: Anything else we can find? ###

Glad you're still reading! Let's step away from flutter for a while and take the raw audio track itself under the Fourier microscope. Zooming closer, is there anything interesting in the lower end?

[<img alt="[Image: Spectrogram showing a frequency range from 0 to 180 Hz.]" border="0" width="550" data-original-height="296" data-original-width="1074" src="https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEhpgDAGqXTHKKLEf-Nsc4U2aBDg1NhpfQnoLcZt9fPXrh5LgosyzGyRckaNuA9O1Gb0XRKevcuwdFx9ZtCXGNKn5SNrrbGoMIHmNPjJW8_phqO4ZcB02wHAPpsin8q4yWw1WXI41Ly6l5tUYrm5kPC75aUH6jr1H8NIWW86Oe80bgwO5Rf8EcmCjsb_1vi5/s550/annotated-200px.jpg" srcset="https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEhpgDAGqXTHKKLEf-Nsc4U2aBDg1NhpfQnoLcZt9fPXrh5LgosyzGyRckaNuA9O1Gb0XRKevcuwdFx9ZtCXGNKn5SNrrbGoMIHmNPjJW8_phqO4ZcB02wHAPpsin8q4yWw1WXI41Ly6l5tUYrm5kPC75aUH6jr1H8NIWW86Oe80bgwO5Rf8EcmCjsb_1vi5/s1100/annotated-200px.jpg 2x">](https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEhpgDAGqXTHKKLEf-Nsc4U2aBDg1NhpfQnoLcZt9fPXrh5LgosyzGyRckaNuA9O1Gb0XRKevcuwdFx9ZtCXGNKn5SNrrbGoMIHmNPjJW8_phqO4ZcB02wHAPpsin8q4yWw1WXI41Ly6l5tUYrm5kPC75aUH6jr1H8NIWW86Oe80bgwO5Rf8EcmCjsb_1vi5/s1074/annotated-200px.jpg)

We can faintly see peaks at multiples of both 24 and 60 Hz. No surprises there, really... 24 Hz being the film framerate and 60 Hz the North American mains frequency. Was there a projector running in the recording studio? Or maybe it's an artifact of scanning the soundtrack one frame at a time? In any case, these sounds are pretty weak.

[<img alt="[Image: Spectrogram showing tones with apparent sidebands.]" border="0" width="550" data-original-height="275" data-original-width="856" src="https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEgmJ6HtiyVj-yVW0JA7Ae5VYVOLhNuSfVoam0-yXFdzlKW6u1LeVuulZ872Jv7i8ec3-ofsac_qnXfL78uXDvydAiiOc97mPVXO03fLrR6rOPQv4n26REMoqsqOgwRIlkv1VzxaZI0ZOmYAZWCzT_FsVv4nldRBxQDIvxZ9OgsuFUOxFUUfcHsLJmiaBdoa/s550/sidebands.jpg" srcset="https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEgmJ6HtiyVj-yVW0JA7Ae5VYVOLhNuSfVoam0-yXFdzlKW6u1LeVuulZ872Jv7i8ec3-ofsac_qnXfL78uXDvydAiiOc97mPVXO03fLrR6rOPQv4n26REMoqsqOgwRIlkv1VzxaZI0ZOmYAZWCzT_FsVv4nldRBxQDIvxZ9OgsuFUOxFUUfcHsLJmiaBdoa/s1100/sidebands.jpg 2x">](https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEgmJ6HtiyVj-yVW0JA7Ae5VYVOLhNuSfVoam0-yXFdzlKW6u1LeVuulZ872Jv7i8ec3-ofsac_qnXfL78uXDvydAiiOc97mPVXO03fLrR6rOPQv4n26REMoqsqOgwRIlkv1VzxaZI0ZOmYAZWCzT_FsVv4nldRBxQDIvxZ9OgsuFUOxFUUfcHsLJmiaBdoa/s856/sidebands.jpg)

In some places you can see some sort of modulation that seems to be generating sidebands, just like in radio signals. It's especially visible in Mickey's whistle when it's flutter-corrected, here at the 5-second mark. The sidebands peaks are 107 and 196 Hz away from the 'carrier' if you will. I'm not sure what this could be. Fluctuating amplitude?

### Sidetrack 2: Playing sound-on-film frame by frame? ###

This is an experiment I did some time ago. It's just a silly thought - what would happen if the soundtrack was being read in the same way as the picture is – stopped 24 times per second? Would this be the *ultimate* flutter distortion?

In the olden days, sound was stored on the film next to the picture frames as analog information. Unlike the picture frames that had to be stopped momentarily for projection, the sound had to be played at a constant speed. There was a complicated mechanism in the projector to make this possible.

I found some speed curves for old-school movie projectors in [[bickford72]](#bickford72). They describe the film's deceleration and acceleration during these stops. Let's emulate these speed curves in audio with the oversampling varispeed method.

The video below is a 3D animation where this same speed curve controls an animation of a moving film in an imaginary machine. The clip is from another 1920s animation, *Alice in the Wooly West* (1926).

[![Embedded YouTube video](https://img.youtube.com/vi/6yyuMOBck2s/0.jpg)](https://www.youtube.com/watch?v=6yyuMOBck2s)

*\~\~ Now we know \~\~*

### Conclusions ###

* We found a 15 Hz speed fluctuation that was, to some extent, reversible.
* This flutter signal is already present in the optical soundtrack of a film scan (of unknown origin).
* With enough manual work, much of the soundtrack could probably be 'corrected'.
* 'Hmm, that sounds odd' are sometimes the words of a white rabbit.

### References ###

* ["Disney's earliest Mickey and Minnie Mouse enter public domain as US copyright expires"](https://www.bbc.com/news/entertainment-arts-67833411). BBC News. 2024-01-01.
* Howarth, J. & Wolfe, P. J. (2004): [Correction of Wow and Flutter Effects in Analog Tape Transfers](https://www.aes.org/e-lib/browse.cfm?elib=12870)
* Gasior, M. & Gonzalez, J.L. (2004): Improving FFT Frequency Measurement Resolution by Parabolic and Gaussian Spectrum Interpolation
* Bickford, John H. (1972). "Geneva Mechanisms". Mechanisms for intermittent motion ([PDF](https://web.archive.org/web/20140102154224/http://ebooks.library.cornell.edu/k/kmoddl/pdf/002_010.pdf)). New York: Industrial Press Inc.