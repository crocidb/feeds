+++
title = "Privacy Setup for Android 16 with GrapheneOS"
description = "A guide to figure out whether GrapheneOS makes sense for you and how to set up a smartphone or tablet with Android 16, using GrapheneOS, in a privacy-focused way."
date = "2026-04-22T11:14:20Z"
url = "https://xn--gckvb8fzb.com/privacy-setup-for-android-16-with-grapheneos/"
author = "marius@xn--gckvb8fzb.com (Marius)"
text = ""
lastupdated = "2026-04-22T14:43:17.309837066Z"
seen = false
+++

[GrapheneOS](https://grapheneos.org) is a free and open-source mobile operating system, built on top of the Android Open Source Project (AOSP) but with a strong focus on privacy and security. It’s developed independently, with no ties to Google or any hardware vendor, and it’s the operating system I’ve been recommending (and using on my own devices) for years, both on the [phone side](/reclaiming-mobile-privacy-with-grapheneos/) and on the [tablet side](/de-googled-pixel-tablet-with-grapheneos-a-review/).

Compared to the Android you get out of the box on a new *Samsung Galaxy*, *nothing phone* or even *Google Pixel*, GrapheneOS is a fundamentally different thing. Where *stock* Android ships deeply integrated with *Google*’s services, that constantly sync contacts, calendars, search history, advertising identifiers, approximate location, and trickle telemetry back to *Mountain View*, GrapheneOS strips all of that out by default. Where vendor Android additionally ships with preloaded apps from *Facebook*, *Microsoft*, *Amazon* and the manufacturer’s own ecosystem, each with their own telemetry pipeline, GrapheneOS ships with almost nothing at all. And where stock Android relies on *Google* for things like push notifications, attestation, captive portal checks and time synchronization, GrapheneOS routes these through its own infrastructure, or makes them optional entirely. On top of that, GrapheneOS adds a substantial amount of hardening at every layer of the stack, from a [hardened memory allocator](https://grapheneos.org/features) and stricter sandboxing rules, all the way up to user-facing tools like per-app network and sensor permission toggles that simply don’t exist on stock Android.

In short, GrapheneOS is what Android *could* look like if the people building it weren’t in the business of selling your data. And because it’s open source, independently audited and developed with a clear threat model in mind, it has earned the trust of journalists, activists, engineers and plenty of ordinary people who simply don’t want their phone to be a surveillance device.

With all that said, there’s a common misconception that I keep encountering, that simply flashing [GrapheneOS](https://grapheneos.org/install/web) onto a compatible device is enough to magically protect its owner from *Big Tech* or other adversaries spying on them and their data. While GrapheneOS goes to great lengths to disable and circumvent the tracking that smartphone vendors like *Google* usually build into their Android phones, and hardens various aspects of the system on top of that, the main cause for concern is usually less the bare naked Android system, but more often than not the apps running on top of it. If you are using apps like *Facebook*, *TikTok*, *Outlook* and *Amazon*, the surveillance happens within these apps and platforms, regardless of what operating system they’re running on.

Common questions from others that I’m encountering with regard to the use of GrapheneOS are along the lines of *“I need to use this banking app on my phone, can I do that with GrapheneOS?”*, or *“I need to use Microsoft Teams for work, does GrapheneOS support it?”*. While many of these questions can be answered with *yes*, there’s a fundamental issue with this approach, in which people think that if only they switch the base operating system of their smartphone, all of the sudden they will become *invisible* to the companies behind these apps. This is sadly a misconception.

The operating system is, albeit an important part, only one layer of the stack. Flashing GrapheneOS protects you from a lot of what *Google* bakes into stock Android, and it adds a surprising amount of defense in depth via things like the [hardened memory allocator](https://grapheneos.org/features), the [network permission toggle](https://grapheneos.org/features#network-permission-toggle) or [storage scopes](https://grapheneos.org/features#storage-scopes). What it cannot do, however, is change what the apps you install are sending to their backends.

The case for a dedicated *spyware device*
----------

If you depend heavily on using apps that are inherently privacy-invasive, it doesn’t make much sense to limit yourself to the few devices that an operating system like GrapheneOS is able to run on, and then go through all the hoops of getting the apps that you need to work on those devices. In such a case, compartmentalization is the better approach:

Run these type of apps on e.g. a modern iOS device, which is a platform with industry leading out-of-the-box security for the average user, and only use a GrapheneOS device for the apps and platforms that you have full control over or can reasonably trust to not spy on you.

This is in my opinion the most important mental model to internalize before starting down this path. The goal isn’t *“one device that does it all, perfectly private”*, as that device doesn’t exist and chasing it will only give you a false sense of privacy. The goal is to make sure that the device which lives in your pocket, the one that knows where you drive, where you sleep and who you talk to, is running a minimal, trustworthy and hardened stack. Everything that brings known spyware into the mix, like corporate communication suites, banking apps, rideshare apps, airline loyalty clients, food delivery apps, all the usual suspects, belongs on a separate, deliberately untrusted device. That device can happily be a stock iPhone or a stock Pixel. Don’t fight that reality, use it in the most minimal way possible.

That device does not need a copy of your full address book and calendar, nor does it needs access to your primary password vault. And it most certainly doesn’t need your family vacation photos or your *Taylor Swift* concert videos. It can co-exist just fine on a dedicated SIM card, with a dedicated phone number and everything else that the *corporate you* needs. Using the *spyware* device in such a conscious way ultimately benefits your *privacy alter-ego*, as it maintains a *public persona* of yourself that *hAs NoThInG tO hIdE*.

Many people recoil at the idea of carrying two phones, but in practice the *spyware device* rarely needs to leave your desk or (Faraday-)bag. You pull it out when you need to check in for a flight, pay a bill, submit an expense report or hop on a corporate video call. For everything else, the GrapheneOS device is more than sufficient. And because it doesn’t carry the weight of two dozen chatty apps, its battery life and overall responsiveness will improve dramatically as a side effect.

Android 16 *Private Space*
----------

However, because life is never as clear cut as this, with Android 16 there is a new [*Private Space*](https://source.android.com/docs/security/features/private-space) feature that can be utilized to further compartmentalize apps within the same device. *Private Space* is essentially a separate user, nested inside of the owner user, with its own isolated storage, its own set of installed apps and its own work/background state. The apps inside a *Private Space* don’t share any common data with the rest of your apps and they don’t even necessarily share the same network routes. Therefor, if you are using a VPN on your main profile, your *Private Space* apps won’t *see* this and hence won’t be using the connection, and vice-versa.

That last bit is worth pausing on. You can have a completely different VPN configuration, a completely different set of DNS settings and, effectively, a completely different exit IP for the apps inside your *Private Space*, without having to juggle user profiles via the lockscreen. When the space is *locked*, the apps inside it are frozen, their processes are torn down, their notifications are silenced and their icons disappear from the app drawer and the recents view. When the space is *unlocked*, it’s as if you briefly teleported to a second phone, used the app you needed, and then went back.

Examples of apps which would make sense to run inside the *Private Space* would be for example the *Uber* app. This app contains your private information (name, payment info) and is something you don’t want to be running in the background 24/7, as you quite likely only need it sporadically, whenever you have to hail a ride. By installing *Uber* only inside the *Private Space*, it will only be allowed to run once you unlock the space. You don’t need to worry about [*Uber* continuing to track your location](https://www.npr.org/sections/thetwo-way/2017/08/29/547113818/uber-ends-its-controversial-post-ride-tracking-of-users-location) after you completed your ride ever again.

A similar argument can be made for a messenger like *WhatsApp*. I would not recommend relying on *WhatsApp* as your primary means of communication, but if you have that one group chat with family members that absolutely refuses to move off *WhatsApp*, or that one client who insists on sending you voice notes there, installing it inside the *Private Space* and only unlocking it when you actually need to check in is a reasonable middle ground. You get the communication channel, Meta doesn’t get a background service on your primary profile 24/7.

However, this approach clearly only makes sense for apps that you only need to use sporadically or in emergency situations in which you might not have your dedicated *spyware device* with you. If you need to use something like *Microsoft Teams* on a constant basis, putting it into the confined *Private Space* might not make much sense as, unless the space is unlocked, the app won’t deliver message notifications. The official AOSP documentation [even carries a warning](https://source.android.com/docs/security/features/private-space) that *Private Space* is not suitable for apps that need to run in the background or send critical notifications, such as medical apps. Treat it as the right tool for *“occasional use”*, not as a replacement for proper profile hygiene.

*Private Space* vs. secondary user profiles
----------

People new to GrapheneOS often ask how *Private Space* differs from the traditional [secondary user profiles](https://grapheneos.org/features#improved-user-profiles) that GrapheneOS has supported for years. The short answer is that *Private Space* is strictly more convenient, and secondary profiles are strictly more isolated.

Secondary user profiles have their own encryption keys, derived from their own unlock credential. When you switch out of a profile or, even better, explicitly *end the session* of the profile, its data goes back to rest on disk and no longer resides in memory in a decrypted state. *Private Space*, on the other hand, lives inside the owner profile and piggybacks on its encryption context. When the owner profile is unlocked, the mere existence of data inside the *Private Space* can be inferred, even if the contents themselves remain protected. For most threat models this difference is purely academic, but it’s worth being aware of.

In practice, my recommendation, and the one [GrapheneOS itself tends to partially make](https://grapheneos.org/features#improved-user-profiles), is roughly as follows:

* Owner profile: Lean, minimal, no Google services. F-Droid, trustworthy apps, a solid browser like *Vanadium* or *Cromite*.
* Secondary user profile for *sandboxed Google Play*: Install [sandboxed Google Play](https://grapheneos.org/usage#sandboxed-google-play) here, along with the handful of apps that genuinely require Play Services, like certain banking apps. Keep this profile as small as possible, enable notifications so you don’t miss a transfer confirmation, and *end the session* whenever you’re done.
* *Private Space* inside the owner profile: The *occasional use* bucket. Uber, Lyft, food delivery, maybe *WhatsApp* for that one stubborn contact, loyalty apps that you open once a quarter. Lock it when you don’t need it.

If you’re coming from a setup that relied solely on secondary profiles, you’ll notice that *Private Space* eliminates the lockscreen dance for the casual apps, while leaving the cryptographic isolation of secondary profiles available for the things that truly warrant it.

Installation
----------

The GrapheneOS installation itself is a breeze and, in my experience, the easiest way to put a non-stock operating system onto a smartphone. No `adb`, no `fastboot`, no fiddling with recovery images or sideloading obscure ZIPs. You unlock the bootloader, connect the phone to a computer and open [GrapheneOS’ WebUSB installer](https://grapheneos.org/install/web) in a compatible browser. From there, the installer walks you through the individual steps. The whole process takes around fifteen minutes and results in a factory-fresh GrapheneOS device.

Make sure your device is in the list of [officially supported models](https://grapheneos.org/faq#supported-devices). Up until nowUp until now GrapheneOS specifically targets Google Pixel phones because Pixels offer verified boot with user-controllable root-of-trust, proper firmware and driver updates, the Titan M2 security chip and a bunch of other hardware-level properties that other Android vendors simply don’t match. This, however, is supposed to change with compatible devices from *Motorola* hitting the market in 2027. Running a *“privacy ROM”* on an unsupported device is in many ways worse than running stock Android, since you lose verified boot and in some cases even timely security patches.

Once the device boots into GrapheneOS for the first time, resist the urge to immediately install all the apps you’re used to. Walk through the setup wizard, set a strong PIN or passphrase (six digits minimum!) and then, before doing anything else, spend fifteen minutes in the settings.

The actual setup
----------

This is the part most guides gloss over. GrapheneOS ships with sensible defaults, but a handful of additional tweaks can noticeably harden the device against both remote and physical threats.

### Security & privacy settings ###

* Auto-reboot: *Settings ➔ Security & privacy ➔ Auto reboot*. By default GrapheneOS reboots the device after 18 hours of being locked, putting all data back at rest and rendering cold-boot and many forensic attacks significantly harder. I personally lower this to eight or twelve hours.
* Duress PIN: *Settings ➔ Security & privacy ➔ Device unlock ➔ Duress Password*. This lets you configure an alternate PIN or password that, when entered on the lockscreen, [irreversibly wipes the device](https://grapheneos.org/features#duress) in the background without any warning or confirmation. Useful if you’re ever in a situation where you’re compelled to hand over the device unlocked.
* Lockdown: The standard Android *lockdown* action (long-press the power button ➔ *Lockdown*) disables biometrics and notification previews until the next successful PIN/passphrase entry. Make this a reflex whenever you hand the phone to someone or walk into a situation where you might be compelled to unlock it with your face or fingerprint.
* PIN scrambling and two-factor fingerprint unlock: Both are available in the lockscreen settings. The former randomizes the keypad layout to defeat shoulder-surfing, the latter requires a PIN after the fingerprint as a second factor.
* USB-C port control: *Settings ➔ Security & privacy ➔ More security & privacy ➔ USB-C port*. Set this to *Charging-only when locked*, or even *Charging-only* at all times if you rarely use the port for data. This prevents a plugged-in cable from establishing a data connection without your explicit consent.

### Network and sensor toggles ###

GrapheneOS adds a [network permission toggle](https://grapheneos.org/features#network-permission-toggle) that appears on the install dialog of every new app and as a toggle in the app’s permissions screen. Habitually uncheck network access for any app that has no business talking to the internet. A gallery viewer, a calculator, a local file manager, a launcher, none of these should need network access. It’s a tiny friction with a disproportionately large effect on the amount of telemetry and personal data leaving your device.

The [sensors permission toggle](https://grapheneos.org/features#sensors-permission-toggle) covers everything the regular Android permissions don’t: Accelerometer, gyroscope, compass, barometer, and so on. You can block these on a per-app basis, which is particularly valuable for apps that have no legitimate reason to know how often you pick up your phone. GrapheneOS also exposes quick-toggle tiles for the camera and microphone in the pull-down menu, which cut access at the system level rather than the per-app level and are convenient for walking into a sensitive meeting or leaving the phone on the nightstand.

### Private DNS ###

Under *Settings ➔ Network & internet ➔ Private DNS* you can point the system resolver at a DNS-over-TLS provider of your choice. *Quad9*, [*Mullvad DNS*](https://mullvad.net/en/help/dns-over-https-and-dns-over-tls) and *NextDNS* are all reasonable options. [Cloudflare](/thoughts-on-cloudflare/) is (sadly) GrapheneOS’ default fallback. If you run your own recursive resolver, which I’d argue is the gold standard, even better. Keep in mind that the *Private DNS* hostname is looked up once via plaintext, so use a provider you’re okay briefly touching in the clear.

Apps
----------

With the base system locked down, it’s time to think about what actually goes on it. My general recommendation is to solely use [F-Droid](https://f-droid.org) for free-software apps. Yes, F-Droid has its well-documented issues as is far from perfect, but for technically literate users who can read source code it remains the best option available in terms of provenance and privacy.

For a browser, *Vanadium* is the default and the safest pick from a pure security standpoint, as it’s a hardened Chromium fork maintained by the GrapheneOS team, with strict site isolation, JIT disabled by default and a per-site JavaScript toggle. The main tradeoff is the lack of proper extension support, which rules out more sophisticated blocking support. If that’s a dealbreaker, install *Cromite* alongside Vanadium and reserve it for sites where you really need content blocking, while keeping Vanadium as your default for general browsing and anything sensitive. Also make sure to [disable JavaScript by default](/disable-javascript-org/) and only enable it for sites that you know and trust!

Everyday hygiene
----------

Once the setup is done, the real work is maintaining the discipline. A few habits that have served me well over the years:

* Resist re-installing apps you just removed. The whole point of going through this exercise is to shrink your attack surface. If you find yourself missing *Instagram* after two weeks, it’s worth asking whether you actually miss *Instagram* or whether you miss the dopamine loop.
* Review permissions periodically.
* Keep the *spyware device* actually separate. No shared *WhatsApp* account, no shared password manager vault. Treat it as a different person’s phone.
* Hit *lockdown* before boarding a plane or crossing a border. Biometrics offer essentially no legal protection in most jurisdictions. Lockdown forces the next unlock to require a passphrase and if things go sideways there’s the duress PIN.
* Reboot the device before sleep. *Before First Unlock* is a meaningfully different security state from *After First Unlock*. A fresh reboot means the keys haven’t been touched since the last time you intentionally typed your passphrase.

Final thoughts
----------

GrapheneOS on a recent Pixel remains, in my opinion, the closest thing to a genuinely private and secure mobile device that a non-state-actor can own today, despite *Google*’s hardware being absolute garbage from quality control and performance perspectives. What GrapheneOS is *not*, however, is a magic spell that undoes the surveillance business models of the companies whose apps we’ve allowed into our lives.

If you take one thing away from this post, let it be the compartmentalization mindset. Use a dedicated stock iOS or Android device for the stuff that absolutely demands surveillance-laden apps like banking portals that only ship as an app, corporate messaging suites, airline loyalty programs, food delivery, and rideshare. Use your GrapheneOS device for everything else, and save the *Private Space* on that GrapheneOS device for the in-between category, the apps you genuinely only need once in a while, like *Uber* while traveling, or a messenger like *WhatsApp* that a handful of people in your life refuse to leave behind. Reserve secondary user profiles for the hard cases that require Google services but that you don’t want bleeding into your daily profile.

For new GrapheneOS users, the temptation will be to replicate your old app collection one-to-one. Don’t. Treat the move as an opportunity to audit what you actually need, and keep the owner profile as boring and empty as possible.

For experienced users, the addition of *Private Space* in Android 16 is, I think, the single biggest quality-of-life improvement in years. It lets you retire a bunch of those one-off secondary profiles you created for *“that one app”*, without giving up meaningful isolation. Revisit your profile layout, consolidate where it makes sense, and lock the rest away behind a space that is off until you explicitly ask for it.

None of this replaces thinking about your own threat model, your own habits and the people you communicate with. But on top of a thoughtful threat model, GrapheneOS with Android 16 is sadly about as good as it gets.

**Footnote:** The cover image is a parody (*“meme”*) made from a screen capture of *Google*’s *Made by Google* event with *Jimmy Fallon*. The host sadly **did not** publicly endorse GrapheneOS the same way he [e.g. endorsed](https://www.youtube.com/watch?v=5zi12wrh5So) the [highly questionable](https://web.archive.org/web/20260215032906if_/https://gordongoner.com/) [*Bored Ape*](https://en.wikipedia.org/wiki/Bored_Ape) [NFT](https://futurism.com/the-byte/bored-apes-almost-worthless-now).