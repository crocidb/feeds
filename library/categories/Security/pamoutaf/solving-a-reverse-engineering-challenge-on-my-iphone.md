+++
title = "Solving a reverse engineering challenge on my iPhone"
description = "While I was on holiday, I decided to leave my laptop behind (bad decision, always travel with your loved ones). At first, it was fine. However, last minute on the BlackHoodie Discord, I noticed there was a reverse engineering challenge by ProofPoint to win a free malware reverse "
date = "2025-11-10T15:21:03Z"
url = "https://p0pcycle.com/2025/11/10/solving-a-reverse-engineering-challenge-on-my-iphone/"
author = "P0pcycle"
text = ""
lastupdated = "2026-11-12T00:42:28.166260486Z"
seen = true
+++

While I was on holiday, I decided to leave my laptop behind (bad decision, always travel with your loved ones). At first, it was fine. However, last minute on the BlackHoodie Discord, I noticed there was a reverse engineering challenge by ProofPoint to win a free malware reverse engineering course by Invoke RE (and a Binary Ninja license!!!).

This seemed like the perfect opportunity to apply, since I decided to take the year off to career switch and learn vulnerability research *and* malware analysis.

However, as I mentioned, I did not take my laptop with me. I was stuck with my iPhone… ![😩](https://s.w.org/images/core/emoji/17.0.2/72x72/1f629.png)

The puzzle started out with a URL. The page had one line of cryptic text, and with a little of web CTF experience, I knew the interesting information was going to be in the website’s HTML code. Being on Safari, I couldn’t get/figure out how to view the HTML source code of a website, so instead I used an online cURL website, and I found what looked like a base64 encoded comment.

<img data-recalc-dims="1" loading="lazy" decoding="async" width="1179" height="2556" data-attachment-id="833" data-permalink="https://p0pcycle.com/2025/11/10/solving-a-reverse-engineering-challenge-on-my-iphone/img_9869/" data-orig-file="https://i0.wp.com/p0pcycle.com/wp-content/uploads/2025/11/img_9869.png?fit=1179%2C2556&amp;ssl=1" data-orig-size="1179,2556" data-comments-opened="1" data-image-title="IMG_9869" data-image-description="" data-image-caption="" data-large-file="https://i0.wp.com/p0pcycle.com/wp-content/uploads/2025/11/img_9869.png?fit=472%2C1024&amp;ssl=1" src="https://i0.wp.com/p0pcycle.com/wp-content/uploads/2025/11/img_9869.png?resize=1179%2C2556&amp;ssl=1" alt="" class="wp-image-833" style="aspect-ratio:0.4612719853992537;width:246px;height:auto">

I decoded it to find a text saying something in the lines of “Good job, the exe is ProofPoint.exe”.

I figured that would be a page of itself so I went back to the original URL and navigated to /ProofPoint.exe and *lo and behold*, it downloaded (with my permission) an exe file.

Again, I am on my iPhone so I cannot run this file. However, I can reverse engineer it if I throw it in decompiler… But how?

I consulted some of my friends for this, and one suggested Binary Ninja Cloud (good option), and someone else suggested dogbolt.com. The latter one was perfect because the file size was small enough, and I could chose which decompiler I wanted.

I usually go with Binary Ninja (\<3), however I decided to grab the decompiled pseudo C code from Hex-Ray’s IDA because it provided a little bit more information (the ASCII values) I needed to complete this challenge on my phone.

<img data-recalc-dims="1" loading="lazy" decoding="async" width="632" height="1376" data-attachment-id="829" data-permalink="https://p0pcycle.com/2025/11/10/solving-a-reverse-engineering-challenge-on-my-iphone/screenshot-2025-11-09-at-16-47-11/" data-orig-file="https://i0.wp.com/p0pcycle.com/wp-content/uploads/2025/11/screenshot-2025-11-09-at-16.47.11.png?fit=632%2C1376&amp;ssl=1" data-orig-size="632,1376" data-comments-opened="1" data-image-title="Screenshot 2025-11-09 at 16.47.11" data-image-description="" data-image-caption="" data-large-file="https://i0.wp.com/p0pcycle.com/wp-content/uploads/2025/11/screenshot-2025-11-09-at-16.47.11.png?fit=470%2C1024&amp;ssl=1" src="https://i0.wp.com/p0pcycle.com/wp-content/uploads/2025/11/screenshot-2025-11-09-at-16.47.11.png?resize=632%2C1376&amp;ssl=1" alt="" class="wp-image-829" style="aspect-ratio:0.4594368553108447;width:223px;height:auto">

With this, I could start reverse engineering the logic without needing to run the exe.

The program required a passphrase in order to print a Google Form link that would allow me to sign up to the *free* malware reverse engineering course.

I won’t give out the solution here, but you basically had to provide a string (the passphrase) which had to validate a variable that matched the ASCII values. It was some sort of a cumulative sum check. Anyways…

<img data-recalc-dims="1" loading="lazy" decoding="async" width="1178" height="2234" data-attachment-id="860" data-permalink="https://p0pcycle.com/2025/11/10/solving-a-reverse-engineering-challenge-on-my-iphone/image-85/" data-orig-file="https://i0.wp.com/p0pcycle.com/wp-content/uploads/2025/11/image-5.png?fit=1178%2C2234&amp;ssl=1" data-orig-size="1178,2234" data-comments-opened="1" data-image-title="image" data-image-description="" data-image-caption="" data-large-file="https://i0.wp.com/p0pcycle.com/wp-content/uploads/2025/11/image-5.png?fit=540%2C1024&amp;ssl=1" src="https://i0.wp.com/p0pcycle.com/wp-content/uploads/2025/11/image-5.png?resize=1178%2C2234&amp;ssl=1" alt="" class="wp-image-860" style="aspect-ratio:0.5273566249176005;width:204px;height:auto">

I took some notes, reversed the cumulative sum bit, wrote some pseudo python code, provided the ASCII characters and had an LLM decoded it for me. I then got the passphrase. *(Yes, I could have used an online python repl, but the one I used to use somehow became an AI web application builder??? I think…)*

I thought “Yay! Maybe I can also decode the Google Form URL? It’s in the binary, sooo…”. I did the same procedure, going back into the Main function and grabbing the ASCII values which were XOR’ed with the passphrase to provide the Google Form URL. I gave back my pseudo python-code to an LLM but somehow it wasn’t decoding the URL fully and I couldn’t access it. I thought I was cooked, that I wasn’t going to be able to submit the solution on time, also knowing there was *ONE* spot left!!!!

<img data-recalc-dims="1" loading="lazy" decoding="async" width="762" height="234" data-attachment-id="851" data-permalink="https://p0pcycle.com/2025/11/10/solving-a-reverse-engineering-challenge-on-my-iphone/image-81/" data-orig-file="https://i0.wp.com/p0pcycle.com/wp-content/uploads/2025/11/image-1.png?fit=762%2C234&amp;ssl=1" data-orig-size="762,234" data-comments-opened="1" data-image-title="image" data-image-description="" data-image-caption="" data-large-file="https://i0.wp.com/p0pcycle.com/wp-content/uploads/2025/11/image-1.png?fit=762%2C234&amp;ssl=1" src="https://i0.wp.com/p0pcycle.com/wp-content/uploads/2025/11/image-1.png?resize=762%2C234&amp;ssl=1" alt="" class="wp-image-851" style="aspect-ratio:3.256462864177267;width:309px;height:auto">

Turns out my URL was missing 6 characters so it was definitely a skill issue, but nonetheless, I still solved it. How, you may ask?

The overkill way was to create a remote VPS which ran some Linux distro, log into the server, install wine (windows emulator), download the challenge PE executable, run it, and enter the passphrase to obtain the URL.

Instead, I did:

<img data-recalc-dims="1" loading="lazy" decoding="async" width="933" height="260" data-attachment-id="844" data-permalink="https://p0pcycle.com/2025/11/10/solving-a-reverse-engineering-challenge-on-my-iphone/img_16264896a8ca-1/" data-orig-file="https://i0.wp.com/p0pcycle.com/wp-content/uploads/2025/11/img_16264896a8ca-1.jpeg?fit=933%2C260&amp;ssl=1" data-orig-size="933,260" data-comments-opened="1" data-image-meta="{&quot;orientation&quot;:&quot;1&quot;}" data-image-title="IMG_16264896A8CA-1" data-image-description="" data-image-caption="" data-large-file="https://i0.wp.com/p0pcycle.com/wp-content/uploads/2025/11/img_16264896a8ca-1.jpeg?fit=933%2C260&amp;ssl=1" src="https://i0.wp.com/p0pcycle.com/wp-content/uploads/2025/11/img_16264896a8ca-1.jpeg?resize=933%2C260&amp;ssl=1" alt="" class="wp-image-844" style="aspect-ratio:3.588676856290133;width:371px;height:auto"> <img data-recalc-dims="1" loading="lazy" decoding="async" width="1116" height="349" data-attachment-id="846" data-permalink="https://p0pcycle.com/2025/11/10/solving-a-reverse-engineering-challenge-on-my-iphone/img_8059dfe09b86-1/" data-orig-file="https://i0.wp.com/p0pcycle.com/wp-content/uploads/2025/11/img_8059dfe09b86-1.jpeg?fit=1116%2C349&amp;ssl=1" data-orig-size="1116,349" data-comments-opened="1" data-image-meta="{&quot;orientation&quot;:&quot;1&quot;}" data-image-title="IMG_8059DFE09B86-1" data-image-description="" data-image-caption="" data-large-file="https://i0.wp.com/p0pcycle.com/wp-content/uploads/2025/11/img_8059dfe09b86-1.jpeg?fit=1024%2C320&amp;ssl=1" src="https://i0.wp.com/p0pcycle.com/wp-content/uploads/2025/11/img_8059dfe09b86-1.jpeg?resize=1116%2C349&amp;ssl=1" alt="" class="wp-image-846" style="width:371px;height:auto">

And voilà, that was it. I wouldn’t solve a challenge on a phone again, but I was happy I learned that it was possible.

This makes me want to have a VPS, like DigitalOcean or something, so if I make the mistake of not taking my laptop with me again, I could still do some sort of hacking.

Hope this short story gives you confidence to **start hacking on your phone** :p

<img data-recalc-dims="1" loading="lazy" decoding="async" width="880" height="58" data-attachment-id="854" data-permalink="https://p0pcycle.com/2025/11/10/solving-a-reverse-engineering-challenge-on-my-iphone/image-83/" data-orig-file="https://i0.wp.com/p0pcycle.com/wp-content/uploads/2025/11/image-3.png?fit=880%2C58&amp;ssl=1" data-orig-size="880,58" data-comments-opened="1" data-image-title="image" data-image-description="" data-image-caption="" data-large-file="https://i0.wp.com/p0pcycle.com/wp-content/uploads/2025/11/image-3.png?fit=880%2C58&amp;ssl=1" src="https://i0.wp.com/p0pcycle.com/wp-content/uploads/2025/11/image-3.png?resize=880%2C58&amp;ssl=1" alt="" class="wp-image-854" style="aspect-ratio:15.173996175908222;width:323px;height:auto"> <img data-recalc-dims="1" loading="lazy" decoding="async" width="978" height="64" data-attachment-id="853" data-permalink="https://p0pcycle.com/2025/11/10/solving-a-reverse-engineering-challenge-on-my-iphone/image-82/" data-orig-file="https://i0.wp.com/p0pcycle.com/wp-content/uploads/2025/11/image-2.png?fit=978%2C64&amp;ssl=1" data-orig-size="978,64" data-comments-opened="1" data-image-title="image" data-image-description="" data-image-caption="" data-large-file="https://i0.wp.com/p0pcycle.com/wp-content/uploads/2025/11/image-2.png?fit=978%2C64&amp;ssl=1" src="https://i0.wp.com/p0pcycle.com/wp-content/uploads/2025/11/image-2.png?resize=978%2C64&amp;ssl=1" alt="" class="wp-image-853" style="aspect-ratio:15.285053929121725;width:376px;height:auto">

And I made it!!