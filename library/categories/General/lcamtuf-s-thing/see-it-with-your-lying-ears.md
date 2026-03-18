+++
title = "See it with your lying ears"
description = "This blog has a history of answering questions that no one should be asking. Today, we continue that proud legacy."
date = "2026-01-10T00:00:05Z"
url = "https://lcamtuf.substack.com/p/see-it-with-your-lying-ears"
author = "lcamtuf"
text = ""
lastupdated = "2026-02-11T20:17:01.315726695Z"
seen = false
+++

For the past couple of weeks, I couldn’t shake off an intrusive thought: raster graphics and audio files are awfully similar — they’re sequences of analog measurements — so what would happen if we apply the same transformations to both?…

Let’s start with downsampling: what if we divide the data stream into buckets of *n* samples each, and then map the entire bucket to a single, averaged value?

>
>
> ```
> for (pos = 0; pos < len; pos += win_size) {
>     
>   float sum = 0;
>   for (int i = 0; i < win_size; i++) sum += buf[pos + i];
>   for (int i = 0; i < win_size; i++) buf[pos + i] = sum / win_size;
>
> }
> ```
>
>

For images, the result is aesthetically pleasing pixel art. But if we do the same audio… well, put your headphones on, you’re in for a treat:

<iframe src="https://player.vimeo.com/video/1152752363?autoplay=0&amp;h=c43b9bc88e" frameborder="0" gesture="media" allow="autoplay; fullscreen" allowautoplay="true" allowfullscreen="true"></iframe>

*The model for the images is our dog, Skye. The song fragment is a cover of “It Must Have Been Love” performed by Effie Passero.*

If you’re familiar with audio formats, you might’ve expected this to sound different: a muffled but neutral rendition associated with low sample rates. Yet, the result of the “audio pixelation” filter is different: it adds unpleasant, metallic-sounding overtones. The culprit is the stairstep pattern in the resulting waveform:

[

<img src="https://substackcdn.com/image/fetch/$s_!RMMa!,w_1456,c_limit,f_auto,q_auto:good,fl_progressive:steep/https%3A%2F%2Fsubstack-post-media.s3.amazonaws.com%2Fpublic%2Fimages%2F641ae3ed-f886-4213-a0ca-f8d3a56409f2_2680x1180.png" width="1456" height="641" data-attrs="{&quot;src&quot;:&quot;https://substack-post-media.s3.amazonaws.com/public/images/641ae3ed-f886-4213-a0ca-f8d3a56409f2_2680x1180.png&quot;,&quot;srcNoWatermark&quot;:null,&quot;fullscreen&quot;:null,&quot;imageSize&quot;:null,&quot;height&quot;:641,&quot;width&quot;:1456,&quot;resizeWidth&quot;:null,&quot;bytes&quot;:301754,&quot;alt&quot;:null,&quot;title&quot;:null,&quot;type&quot;:&quot;image/png&quot;,&quot;href&quot;:null,&quot;belowTheFold&quot;:false,&quot;topImage&quot;:true,&quot;internalRedirect&quot;:&quot;https://lcamtuf.substack.com/i/183768069?img=https%3A%2F%2Fsubstack-post-media.s3.amazonaws.com%2Fpublic%2Fimages%2F641ae3ed-f886-4213-a0ca-f8d3a56409f2_2680x1180.png&quot;,&quot;isProcessing&quot;:false,&quot;align&quot;:null,&quot;offset&quot;:false}" class="sizing-normal" alt="" srcset="https://substackcdn.com/image/fetch/$s_!RMMa!,w_424,c_limit,f_auto,q_auto:good,fl_progressive:steep/https%3A%2F%2Fsubstack-post-media.s3.amazonaws.com%2Fpublic%2Fimages%2F641ae3ed-f886-4213-a0ca-f8d3a56409f2_2680x1180.png 424w, https://substackcdn.com/image/fetch/$s_!RMMa!,w_848,c_limit,f_auto,q_auto:good,fl_progressive:steep/https%3A%2F%2Fsubstack-post-media.s3.amazonaws.com%2Fpublic%2Fimages%2F641ae3ed-f886-4213-a0ca-f8d3a56409f2_2680x1180.png 848w, https://substackcdn.com/image/fetch/$s_!RMMa!,w_1272,c_limit,f_auto,q_auto:good,fl_progressive:steep/https%3A%2F%2Fsubstack-post-media.s3.amazonaws.com%2Fpublic%2Fimages%2F641ae3ed-f886-4213-a0ca-f8d3a56409f2_2680x1180.png 1272w, https://substackcdn.com/image/fetch/$s_!RMMa!,w_1456,c_limit,f_auto,q_auto:good,fl_progressive:steep/https%3A%2F%2Fsubstack-post-media.s3.amazonaws.com%2Fpublic%2Fimages%2F641ae3ed-f886-4213-a0ca-f8d3a56409f2_2680x1180.png 1456w" sizes="100vw" fetchpriority="high">

](https://substackcdn.com/image/fetch/$s_!RMMa!,f_auto,q_auto:good,fl_progressive:steep/https://substack-post-media.s3.amazonaws.com/public/images/641ae3ed-f886-4213-a0ca-f8d3a56409f2_2680x1180.png)*Not great, not terrible.*

Our eyes don’t mind the pattern on the computer screen, but the cochlea is a complex mechanical structure that doesn’t measure sound pressure levels per se; instead, it has clusters of different nerve cells sensitive to different sine-wave frequencies. Abrupt jumps in the waveform are perceived as wideband noise that wasn’t present in the original audio stream.

The problem is easy to solve: we can run the jagged waveform through a rolling-average filter, the equivalent of blurring the pixelated image to remove the artifacts:

<iframe src="https://player.vimeo.com/video/1152752229?autoplay=0&amp;h=98da641a37" frameborder="0" gesture="media" allow="autoplay; fullscreen" allowautoplay="true" allowfullscreen="true" loading="lazy"></iframe>

But this brings up another question: is the effect similar if we keep the original 44.1 kHz sample rate but reduce the bit depth of each sample in the file?

>
>
> ```
> /* Assumes signed int16_t buffer, produces n + 1 levels for even n. */
>
> for (int i = 0; i < len; i++) {
>
>   int div = 32767 / (levels / 2);
>   buf[i] = round(((float)buf[i]) / div) * div;
>
> }
> ```
>
>

The answer is yes and no: because the frequency of the injected errors will be on average much higher, we get hiss instead of squeals:

<iframe src="https://player.vimeo.com/video/1152752516?autoplay=0&amp;h=fd1368596f" frameborder="0" gesture="media" allow="autoplay; fullscreen" allowautoplay="true" allowfullscreen="true" loading="lazy"></iframe>

Also note that the loss of fidelity is far more rapid for audio than for quantized images!

As for the hiss itself, it’s inherent to any attempt to play back quantized audio; it’s why [digital-to-analog converters](https://lcamtuf.substack.com/p/dacs-and-adcs-or-there-and-back-again) in your computer and audio gear typically need to incorporate some form of lowpass filtering. Your sound card has that, but we injected errors greater than what the circuitry was designed to mask.

But enough with image filters that ruin audio: we can also try some audio filters that ruin images! Let’s start by adding a slightly delayed and attenuated copy of the data stream to itself:

>
>
> ```
> for (int i = shift; i < len; i++)
>   buf[i] = (5 * buf[i] + 4 * buf[i - shift]) / 9;
> ```
>
>

Check it out:

<iframe src="https://player.vimeo.com/video/1152758681?autoplay=0&amp;h=2263a4d064" frameborder="0" gesture="media" allow="autoplay; fullscreen" allowautoplay="true" allowfullscreen="true" loading="lazy"></iframe>

For photos, small offsets result in an unappealing blur, while large offsets produce a weird “double exposure” look. For audio, the approach gives birth to a large and important family of filters. Small delays give the impression of a live performance in a small room; large delays sound like an echo in a large hall. Phase-shifted signals create effects such as “flanger” or “phaser”, a pitch-shifted echo sounds like a chorus, and so on.

So far, we’ve been working in the time domain, but we can also analyze data in the frequency domain; any finite signal can be deconstructed into a sum of sine waves with different amplitudes, phases, and frequency. The two most common conversion methods are the [discrete Fourier transform](https://lcamtuf.substack.com/p/not-so-fast-mr-fourier) and the discrete cosine transform, but there are [more wacky options to choose from](https://lcamtuf.substack.com/p/is-the-frequency-domain-a-real-place) if you’re so inclined.

For images, the frequency-domain view is rarely used for editing because almost all changes tend to produce visual artifacts; the technique is used for compression, feature detection, and noise removal, but not much more; it can be used for sharpening or blurring images, but there are easier ways of doing it without Fourier.

For audio, the story is different. For example, the approach makes it fairly easy to build vocoders that modulate the output from other instruments to resemble human speech, or to develop systems such as Auto-Tune, which make out-of-tune singing sound passable.

In the earlier article, I shared a simple implementation of the fast Fourier transform (FFT) in C:

>
>
> ```
> void __fft_int(complex* buf, complex* tmp,
>                const uint32_t len, const uint32_t step) {
>
>   if (step >= len) return;
>   __fft_int(tmp, buf, len, step * 2);
>   __fft_int(tmp + step, buf + step, len, step * 2);
>
>   for (uint32_t pos = 0; pos < len; pos += 2 * step) {
>     complex t = cexp(-I * M_PI * pos / len) * tmp[pos + step];
>     buf[pos / 2] = tmp[pos] + t;
>     buf[(pos + len) / 2] = tmp[pos] - t;
>   }
>
> }
>
> void in_place_fft(complex* buf, const uint32_t len) {
>   complex tmp[len];
>   memcpy(tmp, buf, sizeof(tmp));
>   __fft_int(buf, tmp, len, 1);
> }
> ```
>
>

Unfortunately, the transform gives us decent output only if the input buffer contains nearly-steady signals; the more change there is in the analysis window, the more smeared and intelligible the frequency-domain image. This means we can’t just take the entire song, run it through the aforementioned C function, and expect useful results.

Instead, we need to chop up the track into small slices, typically somewhere around 20-100 ms. This is long enough for each slice to contain a reasonable number of samples, but short enough to more or less represent a momentary “steady state” of the underlying waveform.

[

<img src="https://substackcdn.com/image/fetch/$s_!U9pc!,w_1456,c_limit,f_auto,q_auto:good,fl_progressive:steep/https%3A%2F%2Fsubstack-post-media.s3.amazonaws.com%2Fpublic%2Fimages%2F936141e4-030a-4fdd-9675-fd735b1169f4_2813x781.png" width="1456" height="404" data-attrs="{&quot;src&quot;:&quot;https://substack-post-media.s3.amazonaws.com/public/images/936141e4-030a-4fdd-9675-fd735b1169f4_2813x781.png&quot;,&quot;srcNoWatermark&quot;:null,&quot;fullscreen&quot;:null,&quot;imageSize&quot;:null,&quot;height&quot;:404,&quot;width&quot;:1456,&quot;resizeWidth&quot;:null,&quot;bytes&quot;:78706,&quot;alt&quot;:null,&quot;title&quot;:null,&quot;type&quot;:&quot;image/png&quot;,&quot;href&quot;:null,&quot;belowTheFold&quot;:true,&quot;topImage&quot;:false,&quot;internalRedirect&quot;:&quot;https://lcamtuf.substack.com/i/183768069?img=https%3A%2F%2Fsubstack-post-media.s3.amazonaws.com%2Fpublic%2Fimages%2F936141e4-030a-4fdd-9675-fd735b1169f4_2813x781.png&quot;,&quot;isProcessing&quot;:false,&quot;align&quot;:null,&quot;offset&quot;:false}" class="sizing-normal" alt="" srcset="https://substackcdn.com/image/fetch/$s_!U9pc!,w_424,c_limit,f_auto,q_auto:good,fl_progressive:steep/https%3A%2F%2Fsubstack-post-media.s3.amazonaws.com%2Fpublic%2Fimages%2F936141e4-030a-4fdd-9675-fd735b1169f4_2813x781.png 424w, https://substackcdn.com/image/fetch/$s_!U9pc!,w_848,c_limit,f_auto,q_auto:good,fl_progressive:steep/https%3A%2F%2Fsubstack-post-media.s3.amazonaws.com%2Fpublic%2Fimages%2F936141e4-030a-4fdd-9675-fd735b1169f4_2813x781.png 848w, https://substackcdn.com/image/fetch/$s_!U9pc!,w_1272,c_limit,f_auto,q_auto:good,fl_progressive:steep/https%3A%2F%2Fsubstack-post-media.s3.amazonaws.com%2Fpublic%2Fimages%2F936141e4-030a-4fdd-9675-fd735b1169f4_2813x781.png 1272w, https://substackcdn.com/image/fetch/$s_!U9pc!,w_1456,c_limit,f_auto,q_auto:good,fl_progressive:steep/https%3A%2F%2Fsubstack-post-media.s3.amazonaws.com%2Fpublic%2Fimages%2F936141e4-030a-4fdd-9675-fd735b1169f4_2813x781.png 1456w" sizes="100vw" loading="lazy">

](https://substackcdn.com/image/fetch/$s_!U9pc!,f_auto,q_auto:good,fl_progressive:steep/https://substack-post-media.s3.amazonaws.com/public/images/936141e4-030a-4fdd-9675-fd735b1169f4_2813x781.png)*An example of FFT windowing.*

If we run the FFT function on each of these windows separately, each output will tell us about the distribution frequencies in that time slice; we can also string these outputs together into a spectrogram, plotting how frequencies (vertical axis) change over time (horizontal axis):

[

<img src="https://substackcdn.com/image/fetch/$s_!mzOB!,w_1456,c_limit,f_auto,q_auto:good,fl_progressive:steep/https%3A%2F%2Fsubstack-post-media.s3.amazonaws.com%2Fpublic%2Fimages%2Fd5cfdea3-912e-4a22-87b0-2e75e55d4ef9_1879x1171.jpeg" width="1456" height="907" data-attrs="{&quot;src&quot;:&quot;https://substack-post-media.s3.amazonaws.com/public/images/d5cfdea3-912e-4a22-87b0-2e75e55d4ef9_1879x1171.jpeg&quot;,&quot;srcNoWatermark&quot;:null,&quot;fullscreen&quot;:null,&quot;imageSize&quot;:null,&quot;height&quot;:907,&quot;width&quot;:1456,&quot;resizeWidth&quot;:null,&quot;bytes&quot;:2090763,&quot;alt&quot;:null,&quot;title&quot;:null,&quot;type&quot;:&quot;image/jpeg&quot;,&quot;href&quot;:null,&quot;belowTheFold&quot;:true,&quot;topImage&quot;:false,&quot;internalRedirect&quot;:&quot;https://lcamtuf.substack.com/i/183768069?img=https%3A%2F%2Fsubstack-post-media.s3.amazonaws.com%2Fpublic%2Fimages%2Fd5cfdea3-912e-4a22-87b0-2e75e55d4ef9_1879x1171.jpeg&quot;,&quot;isProcessing&quot;:false,&quot;align&quot;:null,&quot;offset&quot;:false}" class="sizing-normal" alt="" srcset="https://substackcdn.com/image/fetch/$s_!mzOB!,w_424,c_limit,f_auto,q_auto:good,fl_progressive:steep/https%3A%2F%2Fsubstack-post-media.s3.amazonaws.com%2Fpublic%2Fimages%2Fd5cfdea3-912e-4a22-87b0-2e75e55d4ef9_1879x1171.jpeg 424w, https://substackcdn.com/image/fetch/$s_!mzOB!,w_848,c_limit,f_auto,q_auto:good,fl_progressive:steep/https%3A%2F%2Fsubstack-post-media.s3.amazonaws.com%2Fpublic%2Fimages%2Fd5cfdea3-912e-4a22-87b0-2e75e55d4ef9_1879x1171.jpeg 848w, https://substackcdn.com/image/fetch/$s_!mzOB!,w_1272,c_limit,f_auto,q_auto:good,fl_progressive:steep/https%3A%2F%2Fsubstack-post-media.s3.amazonaws.com%2Fpublic%2Fimages%2Fd5cfdea3-912e-4a22-87b0-2e75e55d4ef9_1879x1171.jpeg 1272w, https://substackcdn.com/image/fetch/$s_!mzOB!,w_1456,c_limit,f_auto,q_auto:good,fl_progressive:steep/https%3A%2F%2Fsubstack-post-media.s3.amazonaws.com%2Fpublic%2Fimages%2Fd5cfdea3-912e-4a22-87b0-2e75e55d4ef9_1879x1171.jpeg 1456w" sizes="100vw" loading="lazy">

](https://substackcdn.com/image/fetch/$s_!mzOB!,f_auto,q_auto:good,fl_progressive:steep/https://substack-post-media.s3.amazonaws.com/public/images/d5cfdea3-912e-4a22-87b0-2e75e55d4ef9_1879x1171.jpeg)*Audio waveform (top) and its FFT spectrogram view.*

Alas, the method isn’t conductive to audio editing: if we make separate frequency-domain changes to each window and then convert the data back to the time domain, there’s no guarantee that the tail end of the reconstituted waveform for window *n* will still line up perfectly with the front of the waveform for window *n + 1*. We’re likely to end up with clicks and other audible artifacts where the FFT windows meet.

A clever solution to the problem is to use the Hann function for windowing. In essence, we multiply the waveform in every time slice by the value of *y* = *sin<sup>2</sup>(t)*, where *t* is scaled so that each window begins at *t* = 0 and ends at *t =* π. This yields a sinusoidal shape that has a value of zero near the edges of the buffer and peaks at 1 in the middle:

[

<img src="https://substackcdn.com/image/fetch/$s_!DaKn!,w_1456,c_limit,f_auto,q_auto:good,fl_progressive:steep/https%3A%2F%2Fsubstack-post-media.s3.amazonaws.com%2Fpublic%2Fimages%2F2722020b-adce-4ef7-bca2-1ada31183279_2813x1875.png" width="1456" height="970" data-attrs="{&quot;src&quot;:&quot;https://substack-post-media.s3.amazonaws.com/public/images/2722020b-adce-4ef7-bca2-1ada31183279_2813x1875.png&quot;,&quot;srcNoWatermark&quot;:null,&quot;fullscreen&quot;:null,&quot;imageSize&quot;:null,&quot;height&quot;:970,&quot;width&quot;:1456,&quot;resizeWidth&quot;:null,&quot;bytes&quot;:155041,&quot;alt&quot;:null,&quot;title&quot;:null,&quot;type&quot;:&quot;image/png&quot;,&quot;href&quot;:null,&quot;belowTheFold&quot;:true,&quot;topImage&quot;:false,&quot;internalRedirect&quot;:&quot;https://lcamtuf.substack.com/i/183768069?img=https%3A%2F%2Fsubstack-post-media.s3.amazonaws.com%2Fpublic%2Fimages%2F2722020b-adce-4ef7-bca2-1ada31183279_2813x1875.png&quot;,&quot;isProcessing&quot;:false,&quot;align&quot;:null,&quot;offset&quot;:false}" class="sizing-normal" alt="" srcset="https://substackcdn.com/image/fetch/$s_!DaKn!,w_424,c_limit,f_auto,q_auto:good,fl_progressive:steep/https%3A%2F%2Fsubstack-post-media.s3.amazonaws.com%2Fpublic%2Fimages%2F2722020b-adce-4ef7-bca2-1ada31183279_2813x1875.png 424w, https://substackcdn.com/image/fetch/$s_!DaKn!,w_848,c_limit,f_auto,q_auto:good,fl_progressive:steep/https%3A%2F%2Fsubstack-post-media.s3.amazonaws.com%2Fpublic%2Fimages%2F2722020b-adce-4ef7-bca2-1ada31183279_2813x1875.png 848w, https://substackcdn.com/image/fetch/$s_!DaKn!,w_1272,c_limit,f_auto,q_auto:good,fl_progressive:steep/https%3A%2F%2Fsubstack-post-media.s3.amazonaws.com%2Fpublic%2Fimages%2F2722020b-adce-4ef7-bca2-1ada31183279_2813x1875.png 1272w, https://substackcdn.com/image/fetch/$s_!DaKn!,w_1456,c_limit,f_auto,q_auto:good,fl_progressive:steep/https%3A%2F%2Fsubstack-post-media.s3.amazonaws.com%2Fpublic%2Fimages%2F2722020b-adce-4ef7-bca2-1ada31183279_2813x1875.png 1456w" sizes="100vw" loading="lazy">

](https://substackcdn.com/image/fetch/$s_!DaKn!,f_auto,q_auto:good,fl_progressive:steep/https://substack-post-media.s3.amazonaws.com/public/images/2722020b-adce-4ef7-bca2-1ada31183279_2813x1875.png)*The Hann function for FFT windows.*

At first blush, it’s hard to see how this multiplication would help: the consequence of the operation is that the input waveform is attenuated by an cyclic sinusoidal pattern, and the attenuation pattern will carry over to any waveform reconstructed from the FFT data (bottom row).

The trick is to also calculate another sequence of “halfway” FFT windows of the same size that are shifted 50% in relation to the existing ones (second row below):

[

<img src="https://substackcdn.com/image/fetch/$s_!CyCB!,w_1456,c_limit,f_auto,q_auto:good,fl_progressive:steep/https%3A%2F%2Fsubstack-post-media.s3.amazonaws.com%2Fpublic%2Fimages%2Fc6431f65-be69-4ce7-b80d-a1fc3caa6526_2813x1875.png" width="1456" height="970" data-attrs="{&quot;src&quot;:&quot;https://substack-post-media.s3.amazonaws.com/public/images/c6431f65-be69-4ce7-b80d-a1fc3caa6526_2813x1875.png&quot;,&quot;srcNoWatermark&quot;:null,&quot;fullscreen&quot;:null,&quot;imageSize&quot;:null,&quot;height&quot;:970,&quot;width&quot;:1456,&quot;resizeWidth&quot;:null,&quot;bytes&quot;:243456,&quot;alt&quot;:null,&quot;title&quot;:null,&quot;type&quot;:&quot;image/png&quot;,&quot;href&quot;:null,&quot;belowTheFold&quot;:true,&quot;topImage&quot;:false,&quot;internalRedirect&quot;:&quot;https://lcamtuf.substack.com/i/183768069?img=https%3A%2F%2Fsubstack-post-media.s3.amazonaws.com%2Fpublic%2Fimages%2Fc6431f65-be69-4ce7-b80d-a1fc3caa6526_2813x1875.png&quot;,&quot;isProcessing&quot;:false,&quot;align&quot;:null,&quot;offset&quot;:false}" class="sizing-normal" alt="" srcset="https://substackcdn.com/image/fetch/$s_!CyCB!,w_424,c_limit,f_auto,q_auto:good,fl_progressive:steep/https%3A%2F%2Fsubstack-post-media.s3.amazonaws.com%2Fpublic%2Fimages%2Fc6431f65-be69-4ce7-b80d-a1fc3caa6526_2813x1875.png 424w, https://substackcdn.com/image/fetch/$s_!CyCB!,w_848,c_limit,f_auto,q_auto:good,fl_progressive:steep/https%3A%2F%2Fsubstack-post-media.s3.amazonaws.com%2Fpublic%2Fimages%2Fc6431f65-be69-4ce7-b80d-a1fc3caa6526_2813x1875.png 848w, https://substackcdn.com/image/fetch/$s_!CyCB!,w_1272,c_limit,f_auto,q_auto:good,fl_progressive:steep/https%3A%2F%2Fsubstack-post-media.s3.amazonaws.com%2Fpublic%2Fimages%2Fc6431f65-be69-4ce7-b80d-a1fc3caa6526_2813x1875.png 1272w, https://substackcdn.com/image/fetch/$s_!CyCB!,w_1456,c_limit,f_auto,q_auto:good,fl_progressive:steep/https%3A%2F%2Fsubstack-post-media.s3.amazonaws.com%2Fpublic%2Fimages%2Fc6431f65-be69-4ce7-b80d-a1fc3caa6526_2813x1875.png 1456w" sizes="100vw" loading="lazy">

](https://substackcdn.com/image/fetch/$s_!CyCB!,f_auto,q_auto:good,fl_progressive:steep/https://substack-post-media.s3.amazonaws.com/public/images/c6431f65-be69-4ce7-b80d-a1fc3caa6526_2813x1875.png)*Overlapping FFT windows with Hann weighting.*

This leaves us with one output waveform (A in the bottom row) that’s attenuated by the repeating *sin<sup>2 </sup>*pattern that starts at the beginning of the clip, and then another waveform (B) that’s attenuated by an identical *sin<sup>2 </sup>*pattern shifted one-half of the cycle. The second pattern can be also written as *cos<sup>2</sup>*.

With this in mind, we can write the equations for the two waveforms we can reconstruct from the FFT streams as:

If we sum these waveforms, we get:

This is where we wheel out the Pythagorean identity, an easily-derived rule that tells us that the following must hold for any *x*:

If you’re unfamiliar with this identity, recall that in a right triangle, *sin(α)* is the ratio of the opposite to the hypotenuse (*a/c*), while cos*(α)* is the ratio of the adjacent to the hypotenuse (*b/c*). If we choose *c =* 1, this simplifies to *sin(α) = a* and *cos(α) = b*. Further, from the Pythagorean theorem, *a<sup>2</sup> + b<sup>2</sup> = c<sup>2</sup>*, so we can assert that *sin<sup>2</sup>(α) + cos<sup>2</sup>(α) = 1* for any angle *α*.

In effect, the underlined multiplier in the earlier equation for the summed waveform is always 1; in the A + B sum, the Hann-induced attenuation cancels out.

At the same time, because the signal at the edges of each FFT window is attenuated to zero, we get rid of the waveform-merging discontinuities. Instead, the transitions between windows involve gradual shifts between A and B signals, masking any editing artifacts.

Where was I going with this? Ah, right! With this trick up of our sleeve, we can goof around in the frequency domain to — for example — selectively shift the pitch of the vocals in our clip:

<iframe src="https://player.vimeo.com/video/1152768108?autoplay=0&amp;h=e15bb614a7" frameborder="0" gesture="media" allow="autoplay; fullscreen" allowautoplay="true" allowfullscreen="true" loading="lazy"></iframe>

*Source code for the effect is available [here](https://lcamtuf.coredump.cx/blog/fft_pitch.tgz). It’s short and easy to experiment with.*

I also spent some time approximating the transform for the dog image. In the first instance, some low-frequency components are shifted to higher FFT bins, causing spurious additional edges to crop up and making Skye look jittery. In the second instance, the bins are moved in the other direction, producing a distinctive type of blur.

*PS. Before I get hate mail from DSP folks, I should note that high-quality pitch shifting is usually done in a more complex way. For example, many systems actively track the dominant frequency of the vocal track and add correction for voiceless consonants such as “s”. If you want to down a massive rabbit hole, [this text](https://www.diva-portal.org/smash/get/diva2:1381398/FULLTEXT01.pdf) is a pretty accessible summary.*

*As for the 20 minutes spent reading this article, you’re not getting that back.*

[Subscribe now](https://lcamtuf.substack.com/subscribe?)