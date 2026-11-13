+++
title = "Hacking the meta ray-ban smartglasses"
description = "Back in July I wanted to check out the pwn2own targets for 2026. Since the rules hadn’t been released yet, I decided I would check last year’s targets in the hope that it would be similar. Imagine my surprise when I managed to get arbitrary code execution on the glasses and they "
date = "2026-11-06T17:51:45Z"
url = "https://p0pcycle.com/2026/11/06/hacking-the-meta-ray-ban-smartglasses/"
author = "P0pcycle"
text = ""
lastupdated = "2026-11-12T00:42:28.130076656Z"
seen = true
+++

Back in July I wanted to check out the pwn2own targets for 2026. Since the rules hadn’t been released yet, I decided I would check last year’s targets in the hope that it would be similar.

Imagine my surprise when I managed to get arbitrary code execution on the glasses and they weren’t in the wearables category anymore :’).

It’s fine though because I still reported it to meta, and after fighting the payout a few times, we settled (ok there was no settling but I agreed to the new payout).

Before attempting this, I remember telling my friend about it. They said “ooof good luck. These are usually pretty hardened and no-one attempted them last year at p2o.”

My response: Watch me.

<img data-recalc-dims="1" fetchpriority="high" decoding="async" width="1024" height="835" data-attachment-id="1735" data-permalink="https://p0pcycle.com/2026/11/06/hacking-the-meta-ray-ban-smartglasses/image-152/" data-orig-file="https://i0.wp.com/p0pcycle.com/wp-content/uploads/2026/11/image-3.png?fit=3024%2C2465&amp;ssl=1" data-orig-size="3024,2465" data-comments-opened="1" data-image-title="image" data-image-description="" data-image-caption="" data-large-file="https://i0.wp.com/p0pcycle.com/wp-content/uploads/2026/11/image-3.png?fit=1024%2C835&amp;ssl=1" src="https://i0.wp.com/p0pcycle.com/wp-content/uploads/2026/11/image-3.png?resize=1024%2C835&amp;ssl=1" alt="" class="wp-image-1735" style="aspect-ratio:1.2268117734355677;width:337px;height:auto" srcset="https://i0.wp.com/p0pcycle.com/wp-content/uploads/2026/11/image-3.png?resize=1024%2C835&amp;ssl=1 1024w, https://i0.wp.com/p0pcycle.com/wp-content/uploads/2026/11/image-3.png?resize=300%2C245&amp;ssl=1 300w, https://i0.wp.com/p0pcycle.com/wp-content/uploads/2026/11/image-3.png?resize=768%2C626&amp;ssl=1 768w, https://i0.wp.com/p0pcycle.com/wp-content/uploads/2026/11/image-3.png?resize=1536%2C1252&amp;ssl=1 1536w, https://i0.wp.com/p0pcycle.com/wp-content/uploads/2026/11/image-3.png?resize=2048%2C1669&amp;ssl=1 2048w, https://i0.wp.com/p0pcycle.com/wp-content/uploads/2026/11/image-3.png?w=3000&amp;ssl=1 3000w" sizes="(max-width: 1000px) 100vw, 1000px">

### Acquiring glasses because who’s paying €500 (not me) ###

First step was acquiring the glasses. I am lucky that my brother-in-law had a pair he didn’t really use, so I could steal them for a few weeks.

### First recon ###

I installed the Meta AI app, which is the app to control the glasses (connecting them, synchronizing pictures, and so on).

In order to extract the firmware, I obviously wasn’t going to tear the glasses apart and start fiddling with probes n shit. So I went for extracting it using the OTA (over-the-air) update.

When connecting the glasses for the first time, it immediately offered to update the firmware. So naturally, I was intrigued. Using JADX, I reversed the Meta AI app to see how the update is fetched.

`OtaArtifactFetcher` prepares and sends the update request. The response is converted into an `OTAArtifactInfo` object containing metadata such as the device/build information.

```java
arrayListA0y2.add(new OTAArtifactInfo([...], downloadUri, [...]));
```

I then notice this assignment in `OTAArtifactInfo`():

```
this.downloadUri = str3;
```

I found that I could just hook into `OTAArtifactInfo` and print `str3` which contained the CDN update URL :))) and then I just printed it.

```javascript
Java.perform(function () {var OTAArtifactInfo = Java.use("com.facebook.wearable.common.ota.models.OTAArtifactInfo");OTAArtifactInfo["$init"].implementation = function (l, j, oTAArtifactType, ..., str3, ...) {   this["$init"](l, j, oTAArtifactType, ..., str3, ...);    console.log("downloadUri:");    console.log(str3);};});
```

<img data-recalc-dims="1" decoding="async" width="1024" height="153" data-attachment-id="1748" data-permalink="https://p0pcycle.com/2026/11/06/hacking-the-meta-ray-ban-smartglasses/image-155/" data-orig-file="https://i0.wp.com/p0pcycle.com/wp-content/uploads/2026/11/image-6.png?fit=1462%2C218&amp;ssl=1" data-orig-size="1462,218" data-comments-opened="1" data-image-title="image" data-image-description="" data-image-caption="" data-large-file="https://i0.wp.com/p0pcycle.com/wp-content/uploads/2026/11/image-6.png?fit=1024%2C153&amp;ssl=1" src="https://i0.wp.com/p0pcycle.com/wp-content/uploads/2026/11/image-6.png?resize=1024%2C153&amp;ssl=1" alt="" class="wp-image-1748" style="aspect-ratio:6.6936572199730096;width:332px;height:auto" srcset="https://i0.wp.com/p0pcycle.com/wp-content/uploads/2026/11/image-6.png?resize=1024%2C153&amp;ssl=1 1024w, https://i0.wp.com/p0pcycle.com/wp-content/uploads/2026/11/image-6.png?resize=300%2C45&amp;ssl=1 300w, https://i0.wp.com/p0pcycle.com/wp-content/uploads/2026/11/image-6.png?resize=768%2C115&amp;ssl=1 768w, https://i0.wp.com/p0pcycle.com/wp-content/uploads/2026/11/image-6.png?w=1462&amp;ssl=1 1462w" sizes="(max-width: 1000px) 100vw, 1000px">

That URL contained a zip, so that looked like the right candidate. **HOWEVER**, this was around 156 MB and its payload depended on the device’s existing build. It was an incremental update… I wanted the full update.

**Getting the full firmware update**

Decompiling further code revealed a GraphQL input named `device_firmware_full_update_only`. The app normally populated it with false, so I hooked the generic method responsible for adding GraphQL fields and replaced the value with true only when the field name matched exactly. This allowed me to fetch the full firmware update URL.

I was then able to retrieve the zip from the CDN. Unzipping it showed me that this was an Android update, including the **payload.bin**.

<img data-recalc-dims="1" decoding="async" width="1024" height="278" data-attachment-id="1740" data-permalink="https://p0pcycle.com/2026/11/06/hacking-the-meta-ray-ban-smartglasses/image-153/" data-orig-file="https://i0.wp.com/p0pcycle.com/wp-content/uploads/2026/11/image-4.png?fit=1230%2C334&amp;ssl=1" data-orig-size="1230,334" data-comments-opened="1" data-image-title="image" data-image-description="" data-image-caption="" data-large-file="https://i0.wp.com/p0pcycle.com/wp-content/uploads/2026/11/image-4.png?fit=1024%2C278&amp;ssl=1" src="https://i0.wp.com/p0pcycle.com/wp-content/uploads/2026/11/image-4.png?resize=1024%2C278&amp;ssl=1" alt="" class="wp-image-1740" srcset="https://i0.wp.com/p0pcycle.com/wp-content/uploads/2026/11/image-4.png?resize=1024%2C278&amp;ssl=1 1024w, https://i0.wp.com/p0pcycle.com/wp-content/uploads/2026/11/image-4.png?resize=300%2C81&amp;ssl=1 300w, https://i0.wp.com/p0pcycle.com/wp-content/uploads/2026/11/image-4.png?resize=768%2C209&amp;ssl=1 768w, https://i0.wp.com/p0pcycle.com/wp-content/uploads/2026/11/image-4.png?w=1230&amp;ssl=1 1230w" sizes="(max-width: 1000px) 100vw, 1000px">

Using [payload-dumper](https://github.com/ssut/payload-dumper-go) on payload.bin, I could dump the images and mount them into a filesystem.

<img data-recalc-dims="1" loading="lazy" decoding="async" width="1024" height="430" data-attachment-id="1779" data-permalink="https://p0pcycle.com/2026/11/06/hacking-the-meta-ray-ban-smartglasses/image-156/" data-orig-file="https://i0.wp.com/p0pcycle.com/wp-content/uploads/2026/11/image-5-edited.png?fit=1203%2C505&amp;ssl=1" data-orig-size="1203,505" data-comments-opened="1" data-image-title="image" data-image-description="" data-image-caption="" data-large-file="https://i0.wp.com/p0pcycle.com/wp-content/uploads/2026/11/image-5-edited.png?fit=1024%2C430&amp;ssl=1" src="https://i0.wp.com/p0pcycle.com/wp-content/uploads/2026/11/image-5-edited-1024x430.png?resize=1024%2C430&amp;ssl=1" alt="" class="wp-image-1779" style="aspect-ratio:2.381466810706998;width:508px;height:auto" srcset="https://i0.wp.com/p0pcycle.com/wp-content/uploads/2026/11/image-5-edited.png?resize=1024%2C430&amp;ssl=1 1024w, https://i0.wp.com/p0pcycle.com/wp-content/uploads/2026/11/image-5-edited.png?resize=300%2C126&amp;ssl=1 300w, https://i0.wp.com/p0pcycle.com/wp-content/uploads/2026/11/image-5-edited.png?resize=768%2C322&amp;ssl=1 768w, https://i0.wp.com/p0pcycle.com/wp-content/uploads/2026/11/image-5-edited.png?w=1203&amp;ssl=1 1203w" sizes="auto, (max-width: 1000px) 100vw, 1000px">

Firmware was acquired but how do I get a shell on the glasses?

### Device Access Toolkit ###

There is a developer mode on the Meta AI app that allows devs to write apps that can interact with the glasses. It is called DAT SDK (Device Access Toolkit).

In order to do that, you need to install the DAT APK on the glasses. The MetaAI app basically downloads it in real-time and fetches the DAT application to install it on the device. Do you see where I am going with this?

<img data-recalc-dims="1" loading="lazy" decoding="async" width="1024" height="237" data-attachment-id="1731" data-permalink="https://p0pcycle.com/2026/11/06/hacking-the-meta-ray-ban-smartglasses/image-151/" data-orig-file="https://i0.wp.com/p0pcycle.com/wp-content/uploads/2026/11/image-2.png?fit=1668%2C386&amp;ssl=1" data-orig-size="1668,386" data-comments-opened="1" data-image-title="image" data-image-description="" data-image-caption="" data-large-file="https://i0.wp.com/p0pcycle.com/wp-content/uploads/2026/11/image-2.png?fit=1024%2C237&amp;ssl=1" src="https://i0.wp.com/p0pcycle.com/wp-content/uploads/2026/11/image-2.png?resize=1024%2C237&amp;ssl=1" alt="" class="wp-image-1731" srcset="https://i0.wp.com/p0pcycle.com/wp-content/uploads/2026/11/image-2.png?resize=1024%2C237&amp;ssl=1 1024w, https://i0.wp.com/p0pcycle.com/wp-content/uploads/2026/11/image-2.png?resize=300%2C69&amp;ssl=1 300w, https://i0.wp.com/p0pcycle.com/wp-content/uploads/2026/11/image-2.png?resize=768%2C178&amp;ssl=1 768w, https://i0.wp.com/p0pcycle.com/wp-content/uploads/2026/11/image-2.png?resize=1536%2C355&amp;ssl=1 1536w, https://i0.wp.com/p0pcycle.com/wp-content/uploads/2026/11/image-2.png?w=1668&amp;ssl=1 1668w" sizes="auto, (max-width: 1000px) 100vw, 1000px">

### Installing self-signed app on the glasses ###

Up until and including firmware 126, the firmware did not verify that the DAT APK was signed by Meta. So it was theoretically possible to install any app on the glasses because there was no verification as to if it was a legit app or not.

An easy-not-so-easy swap was possible. I could, using frida, swap out the legit DAT application for a self-signed application of my own. That meant I could run any app on the glasses.

```javascript
// hook DAT Installerfield(this, "$localFile")  .set(this, replacement);field(this, "$appName")  .set(this, "DAT Probe");packageField.set(this, cachedPackage);// Meta AI sends my apkreturn invokeSuspend.call(this, result);
```

Now I have my own self-signed DAT apk running on the glasses! bosh!! ![😎](https://s.w.org/images/core/emoji/17.0.2/72x72/1f60e.png)

### How to run the DAT APK on the glasses ###

The DAT apk runs only when a DAT session is requested by the developer app to interact with the glasses.

So, in order to run the fake DAT apk, I installed a sample app from Meta called **Camera Access**, which would then create a DAT session with the app on the glasses.

<img data-recalc-dims="1" loading="lazy" decoding="async" width="1024" height="454" data-attachment-id="1727" data-permalink="https://p0pcycle.com/2026/11/06/hacking-the-meta-ray-ban-smartglasses/image-150/" data-orig-file="https://i0.wp.com/p0pcycle.com/wp-content/uploads/2026/11/image-1.png?fit=1764%2C782&amp;ssl=1" data-orig-size="1764,782" data-comments-opened="1" data-image-title="image" data-image-description="" data-image-caption="" data-large-file="https://i0.wp.com/p0pcycle.com/wp-content/uploads/2026/11/image-1.png?fit=1024%2C454&amp;ssl=1" src="https://i0.wp.com/p0pcycle.com/wp-content/uploads/2026/11/image-1.png?resize=1024%2C454&amp;ssl=1" alt="" class="wp-image-1727" srcset="https://i0.wp.com/p0pcycle.com/wp-content/uploads/2026/11/image-1.png?resize=1024%2C454&amp;ssl=1 1024w, https://i0.wp.com/p0pcycle.com/wp-content/uploads/2026/11/image-1.png?resize=300%2C133&amp;ssl=1 300w, https://i0.wp.com/p0pcycle.com/wp-content/uploads/2026/11/image-1.png?resize=768%2C340&amp;ssl=1 768w, https://i0.wp.com/p0pcycle.com/wp-content/uploads/2026/11/image-1.png?resize=1536%2C681&amp;ssl=1 1536w, https://i0.wp.com/p0pcycle.com/wp-content/uploads/2026/11/image-1.png?w=1764&amp;ssl=1 1764w" sizes="auto, (max-width: 1000px) 100vw, 1000px">

 However, I couldn’t really check that it was running properly. It was difficult to debug.

### Beep is the new printf ###

There is no screen on this pair of sunglasses. No console, no logs, no “yoo your code is running”. So how could I make sure my code was even executing? The answer is by *listening* to it.

I used **android.media.ToneGenerator** in my DAT APK to signal which part of the code was executing:

* 3 beeps: listener started, looking for a Wi-Fi Direct address
* 5 beeps: found one (in wifi group 192.168.49.x)
* 4 beeps: TCP 31337 bound, we’re in business
* 6 beeps: something went wrong

So using this sequence, I managed to debug a big issue that I hadn’t considered: the Camera Access app was failing because it was expecting the real DAT apk on the glasses. When it couldn’t start DWA,` startDwaReadinessProbe()` would report `START_ERROR_DWA_UNAVAILABLE`.

And every time it failed, it closed my connection.

**The fix**  
I used frida to hook `startDwaReadinessProbe()` in order to disable the DWA timeout and keep the connection alive.

```javascript
startDwaReadinessProbe.implementation =function () {// No operation};
```

### Bind shell ###

When the Meta AI app wants to sync photos & videos from the glasses, it will create a WiFi Direct group on subnet 192.168.49.x. The glasses will connect to that group and they get an IP address.

In order to get the glasses to connect to the Wi-Fi Direct group, I used Frida to hook into the CameraAccess app and request the “high link lease” from the Meta AI app.

```
sub = device.createLinkLease(2, 1, cb); highLeaseSubscriptions.push(sub);
```

My implanted app bound a listener on TCP 31337 on that address, which dropped me into an interactive shell.

So from the phone I could just nc’d into it and sent commands, like `id`, to get shell-level execution in the app’s context.

```
ServerSocket listener = new ServerSocket(31337, 4, address))
```

```shell
nc <glasses-ip> 31337# iduid=10097(u0_a97) gid=10097(u0_a97) groups=3003(inet) ...great power comes great opsec
```

**great power comes great opsec**

### Great power requires great opsec ###

I had this uncontrollable power for about 5 days, and while I was searching for a privesc on the glasses, my shell access had disappeared.

Unfortunately, I either had terrible opsec back then (possible) or unluckily they looked into it and patched it.

But fear not !!

### Mobile Config ###

Firmware 127 started enforcing signature verification of the DAT apk, so self-signing my own DAT apk wasn’t working anymore.

The check was done by `wss_appmanager.signature_verification_enabled` in the MobileConfig file.

The glasses ask the phone for their config, so the phone fetches it from Meta’s servers and forwards it back over Airship. It controls a bunch of feature flags on the glasses without requiring a firmware update.

One of those flags requires the firmware to check that apps are signed by Meta before installing them.

<img data-recalc-dims="1" loading="lazy" decoding="async" width="1024" height="336" data-attachment-id="1725" data-permalink="https://p0pcycle.com/2026/11/06/hacking-the-meta-ray-ban-smartglasses/image-149/" data-orig-file="https://i0.wp.com/p0pcycle.com/wp-content/uploads/2026/11/image.png?fit=1492%2C490&amp;ssl=1" data-orig-size="1492,490" data-comments-opened="1" data-image-title="image" data-image-description="" data-image-caption="" data-large-file="https://i0.wp.com/p0pcycle.com/wp-content/uploads/2026/11/image.png?fit=1024%2C336&amp;ssl=1" src="https://i0.wp.com/p0pcycle.com/wp-content/uploads/2026/11/image.png?resize=1024%2C336&amp;ssl=1" alt="" class="wp-image-1725" srcset="https://i0.wp.com/p0pcycle.com/wp-content/uploads/2026/11/image.png?resize=1024%2C336&amp;ssl=1 1024w, https://i0.wp.com/p0pcycle.com/wp-content/uploads/2026/11/image.png?resize=300%2C99&amp;ssl=1 300w, https://i0.wp.com/p0pcycle.com/wp-content/uploads/2026/11/image.png?resize=768%2C252&amp;ssl=1 768w, https://i0.wp.com/p0pcycle.com/wp-content/uploads/2026/11/image.png?w=1492&amp;ssl=1 1492w" sizes="auto, (max-width: 1000px) 100vw, 1000px">

It arrives on the glasses from the paired phone, and the device loads it only after verifying the file is *structurally* correct, not that it hadn’t been tampered with.

That makes every flag in it, including `signature_verification_enabled`, modifiable by the phone and accepted by the glasses.

So by flipping a byte in the `0.mctable` (which is the file that holds the values) from `0x80` to `0x00` (enabled to disabled), I was able to **bypass** the signature verification that they were originally enforcing, and re-install my self-signed APK on the glasses.

We’re soooo back.

### Where to from here ###

This was all reported to Meta through their bug bounty platform. They have approved my blogpost which makes me assume it is now fixed.

Now that I had shell access, it was a lot easier to start mapping the attack surface. That, my friends, is a story for another time!

Thanks for reading!

<img data-recalc-dims="1" loading="lazy" decoding="async" width="831" height="1024" data-attachment-id="1772" data-permalink="https://p0pcycle.com/2026/11/06/hacking-the-meta-ray-ban-smartglasses/view-recent-photos/" data-orig-file="https://i0.wp.com/p0pcycle.com/wp-content/uploads/2026/11/View-recent-photos.png?fit=1179%2C1453&amp;ssl=1" data-orig-size="1179,1453" data-comments-opened="1" data-image-title="View recent photos" data-image-description="" data-image-caption="" data-large-file="https://i0.wp.com/p0pcycle.com/wp-content/uploads/2026/11/View-recent-photos.png?fit=831%2C1024&amp;ssl=1" src="https://i0.wp.com/p0pcycle.com/wp-content/uploads/2026/11/View-recent-photos.png?resize=831%2C1024&amp;ssl=1" alt="" class="wp-image-1772" style="aspect-ratio:0.8114353489703687;width:298px;height:auto" srcset="https://i0.wp.com/p0pcycle.com/wp-content/uploads/2026/11/View-recent-photos.png?resize=831%2C1024&amp;ssl=1 831w, https://i0.wp.com/p0pcycle.com/wp-content/uploads/2026/11/View-recent-photos.png?resize=243%2C300&amp;ssl=1 243w, https://i0.wp.com/p0pcycle.com/wp-content/uploads/2026/11/View-recent-photos.png?resize=768%2C946&amp;ssl=1 768w, https://i0.wp.com/p0pcycle.com/wp-content/uploads/2026/11/View-recent-photos.png?w=1179&amp;ssl=1 1179w" sizes="auto, (max-width: 831px) 100vw, 831px">