+++
title = "How fast can browsers process base64 data?"
description = '<img width="150" height="150" src="https://lemire.me/blog/wp-content/uploads/2025/11/Capture-decran-le-2025-11-28-a-23.50.58-150x150.png" class="webfeedsFeaturedVisual wp-post-image" alt="" style="display: block; margin-bottom: 5px; clear:both;max-width: 100%;" link_thumbnail="" '
date = "2025-11-29T05:00:03Z"
url = "https://lemire.me/blog/2025/11/29/how-fast-can-browsers-process-base64-data/"
author = "Daniel Lemire"
text = ""
lastupdated = "2026-03-19T16:26:22.831673911Z"
seen = false
+++

<img width="150" height="150" src="https://lemire.me/blog/wp-content/uploads/2025/11/Capture-decran-le-2025-11-28-a-23.50.58-150x150.png" class="webfeedsFeaturedVisual wp-post-image" alt="" style="display: block; margin-bottom: 5px; clear:both;max-width: 100%;" link_thumbnail="" decoding="async" loading="lazy">

Base64 is a binary-to-text encoding scheme that converts arbitrary binary data (like images, files, or any sequence of bytes) into a safe, printable ASCII string using a 64-character alphabet (A–Z, a–z, 0–9, +, /). Browsers use it in JavaScript to embedding binary data directly in code or HTML or to transmitting binary data as text.

Browsers recently added convenient and safe functions to process base 64 functions `Uint8Array.toBase64()` and `Uint8Array.fromBase64()`. Though they are several parameters, it comes down to an encoding and a decoding function.

```
const b64 = Uint8Array.toBase64(bytes);      // string          
const recovered = Uint8Array.fromBase64(b64); // Uint8Array 
```

When encoding, it takes 24 bits from the input. These 24 bits are divided into four 6-bit segments, and each 6-bit value (ranging from 0 to 63) is mapped to a specific character from the Base64 alphabet: the first 26 characters are uppercase letters A-Z, the next 26 are lowercase a-z, then digits 0-9, followed by + and / as the 62nd and 63rd characters. The equals sign = is used as padding when the input length is not a multiple of 3 bytes.

How fast can they be ?

Suppose that you consumed 3 bytes and produced 4 bytes per CPU cycle. At 4.5 GHz, it would be that you would encode to base64 at 13.5 GB/s. We expect lower performance going in the other direction. When encoding, any input is valid: any binary data will do. However, when decoding, we must handle errors and skip spaces.

[I wrote an in-browser benchmark](https://simdutf.github.io/browserbase64/). You can try it out in your favorite browser.

I decided to try it out on my Apple M4 processor, to see how fast the various browsers are. I use blocks of 64 kiB. The speed is measured with respect to the binary data.

|       browser       |encoding speed|decoding speed|
|---------------------|--------------|--------------|
|       Safari        |   17 GB/s    |   9.4 GB/s   |
|       SigmaOS       |   17 GB/s    |   9.4 GB/s   |
|       Chrome        |   19 GB/s    |   4.6 GB/s   |
|        Edge         |   19 GB/s    |   4.6 GB/s   |
|        Brave        |   19 GB/s    |   4.6 GB/s   |
|        Servo        |  0.34 GB/s   |  0.40 GB/s   |
|    Firefox (old)    |  0.34 GB/s   |  0.40 GB/s   |
|Firefox (version 146)|   2.2 GB/s   |   2.6 GB/s   |

[<img loading="lazy" decoding="async" class="alignnone size-large wp-image-22349" src="http://lemire.me/blog/wp-content/uploads/2025/11/browser_encoding_decoding_speed-1024x424.png" alt="" width="660" height="273" srcset="https://lemire.me/blog/wp-content/uploads/2025/11/browser_encoding_decoding_speed-1024x424.png 1024w, https://lemire.me/blog/wp-content/uploads/2025/11/browser_encoding_decoding_speed-300x124.png 300w, https://lemire.me/blog/wp-content/uploads/2025/11/browser_encoding_decoding_speed-768x318.png 768w, https://lemire.me/blog/wp-content/uploads/2025/11/browser_encoding_decoding_speed-1536x636.png 1536w, https://lemire.me/blog/wp-content/uploads/2025/11/browser_encoding_decoding_speed-2048x848.png 2048w" sizes="auto, (max-width: 660px) 100vw, 660px">](http://lemire.me/blog/wp-content/uploads/2025/11/browser_encoding_decoding_speed-scaled.png)

Safari seems to have slightly slower encoding speed than the Chromium browsers (Chome, Edge, Brave), however it is about twice as fast at decoding. Servo and Firefox have similarly poor performance with the unexpected result of having faster decoding speed than encoding speed. (Newer versions of Firefox, released after this post, have better performance.) I could have tried other browsers but most seem to be derivatives of Chromium or WebKit.

For context, the disk of a good laptop can sustain over 3 GB/s of read or write speed. Some high-end laptops have disks that are faster than 5 GB/s. In theory, your wifi connections might get close to 5 GB/s with Wifi 7. Some Internet providers might get close to providing similar network speeds although your Internet connection is likely several times slower.

The speeds on most browsers are faster than you might naively guess. They are faster than networks or disks.

**Note.** The slower decoding speed on Chromium-based browsers appears to depend on the v8 JavaScript engine which decodes the string first to a temporary buffer, before finally copying from the temporary buffer to the final destination. (See BUILTIN(Uint8ArrayFromBase64) in v8/src/builtins/builtins-typed-array.cc.)

**Note**. Denis Palmeiro from Mozzila let me know that upcoming changes in Firefox will speed up performance of the base64 functions. I have since updated the numbers above.