+++
title = "Photography Workflow with ~~Darktable on Linux~~ Lightroom on GrapheneOS"
description = 'A brief overview of my photography workflow with \~\~\_Darktable\_ on Linux\~\~ \_Lightroom Mobile\_ on GrapheneOS.'
date = "2026-05-20T13:14:47Z"
url = "https://xn--gckvb8fzb.com/photography-workflow-with-lightroom-on-grapheneos/"
author = "marius@xn--gckvb8fzb.com (Marius)"
text = ""
lastupdated = "2026-05-21T08:46:35.135906204Z"
seen = false
+++

**Disclaimer:** I had initially prepared this post under the title *Photography Workflow with *Darktable* on Linux*, but after endless fights with *Darktable* I eventually decided to scrap that workflow altogether and look for an alternative. The workflow documented herein is unfortunately **very** far from the result I was striving for, yet it is sadly the best I can put together given the current state of open-source RAW development and photo editing software.

After I [gave Adobe the finger](/giving-adobe-the-finger/) back in 2019 and moved my photography workflow to *Capture One* on a [MacBook](/computer/#d3lt4), I eventually had to reconsider this approach when I moved [back to Linux on the desktop](/linux-on-the-desktop-part-two/) and replaced the device with a [Linux laptop](/a-brief-review-of-the-star-labs-starbook-mk-vi-ryzen-ultrabook/). I briefly tried running *Capture One* in a Windows VM on my [laptop](/computer/#f0g6), but decided against it, as it was a huge PITA and lacked proper hardware acceleration.

Initially I considered a fork of what is probably the best-known open-source RAW developer and photography workflow application out there, *Darktable*, called [*Ansel*](https://ansel.photos/en/), but ultimately decided against it. The points that *Ansel*’s author, Aurélien, [brought up](https://ansel.photos/en/news/darktable-dans-le-mur-au-ralenti/) seemed like valid criticisms and demonstrated both his knowledge of and his passion for making *Darktable* a better tool. However, reading further through his website and his GitHub account, it became apparent that he might be the kind of misunderstood genius who has great ideas and ambition, but who would ultimately struggle to operate within, let alone lead the kind of community required to successfully maintain a fork of a piece of software this large. I therefore didn’t have high hopes of this *lone cowboy* keeping up with, let alone surpassing, the development efforts the *Darktable* community is currently putting in. Given that *Ansel* was explicitly billed as a hard-fork that would not remain compatible with the official *Darktable* release, going down that path felt too risky. *Ansel* would ultimately **have to** provide a migration path for existing *Darktable* users, as otherwise there would be little to no incentive for anyone with a functioning *Darktable* workflow already in place to put up with the effort.

Instead, I decided to stick with *Darktable*. For about a year I tried to build a new workflow on top of it. The things I would miss the most from *Capture One* were the *VSCO* presets that I had brought over from *Lightroom*, and for which there didn’t seem to be any way to convert them into a format compatible with *Darktable* while producing roughly similar results.

Luckily, João, a developer and photographer, made what he calls [t3mujinpack](https://github.com/t3mujin/t3mujinpack), a collection of film emulation presets for *Darktable*. In [a blog post](https://blog.joaoalmeidaphotography.com/en/t3mujinpack-film-darktable/), he provides details on which film stocks are included and how to make use of them in *Darktable*.

His pack includes the presets I almost exclusively use from *VSCO*: Kodak’s Portra 160, 400 and 800. While the results aren’t 100% identical to what *Capture One* produces with the converted *VSCO* packs, neither are those exports identical to what *Lightroom* originally produced. Every piece of software has slight differences in its inner workings, so this is to be expected and can be adjusted for.

During my [travel](/travel/) through all of Spain in 2024 I decided to rely exclusively on *Darktable* for developing and editing the photos that I would ultimately upload to this site. That was a big mistake.

*Darktable* sucks, badly.
----------

I rarely say bad things about truly open-source software, because ultimately it *is* open-source, it’s driven by a community of volunteers, and everyone should be happy that these people do what they do. Also, given that it’s open-source, anyone is free to go ahead and improve what they deem worth improving.

However, *Darktable* is, in my opinion, one of the few exceptions that seem to have derailed so badly that it’s fair to say it has reached a point of no return in terms of usability and *jankiness*.

Let me explain by starting with one of the most annoying things:

```
$ darktable
Gdk-Message: 10:26:22.250: Lost connection to Wayland compositor.

```

```
$ darktable
Gdk-Message: 10:46:16.140: Error 104 (Connection reset by peer) dispatching to
Wayland display.

```

More often than not, *Darktable* crashes in the middle of editing sessions, apparently due to Wayland-related issues. However, since I’m also running *GIMP* and *Blender*, which I would argue do similar, or even slightly more complex things than *Darktable*, yet don’t run into such issues, I’d assume that this is not a problem with my Wayland setup specifically. I didn’t try to debug the issue further, as I was mainly focused on testing and establishing a workflow. Had *Darktable* otherwise worked perfectly fine for me and only run into this issue every once in a while, I would have dug deeper to find the root cause. Unfortunately, this was only one of many things that kept me from continuing to use *Darktable*.

Besides the random crashes, *Darktable* is unbearably janky and slow. The UI feels like it’s about to fall over at any moment, regardless of whether ROCm acceleration is enabled or not. UI elements feel hacked together, the overall navigation is hostile towards regular users, and it’s impossible to find anything just by looking, because everything is hidden behind collapsed modules, tabs and a gazillion sliders and buttons. To give a single example of the sheer UI craziness that is *Darktable*: To rotate an image to the right (clockwise), you need to drag a slider to the left (counterclockwise). While on a touchscreen interface this might be more intuitive, when using a touchpad on a [laptop](/computer/#f0g6) or even a mouse it definitely doesn’t feel natural. After all, maybe a slider isn’t the best UI element for this operation to begin with?

Another issue that I experienced was related to organizing photos. With over 4000 (RAW) photos in the library, *Darktable* becomes unbearable to work with. Aside from the spontaneous crashes and overall slow UI, finding specific photos in a library of that size is an excruciatingly painful task. Unlike *Capture One* and *Lightroom*, *Darktable* doesn’t easily support a workflow based on individual, smaller libraries, e.g. organized by location or event. There are ways to sort photos within *Darktable*’s main library, but I couldn’t find an easy way to split them out into multiple small libraries.

Assuming that you managed to find and edit the photos you were looking for, the headaches continue when you try to export them. It appears that *Darktable* is unable to export photos with pixel-perfect adherence to the [crop aspect ratio](https://github.com/darktable-org/darktable/issues/16638). The implementation details and the proposed solution appear to be just as janky as everything else, and a quick search for [`workaround`](<https://github.com/search?q=repo:darktable-org/darktable workaround&type=code>) in the *Darktable* GitHub repository uncovers a lot more of that same jankiness.

I ended up running the following command over every photo exported by *Darktable*, just to obtain a properly shaped image, meaning I’d lose a few pixels here and there:

```
find ./ \
  -type f \
  -iname '*.jpg' \
  -exec identify -format '%w %h %i\n' '{}' \; \
    | awk '{ if($1 < $2) { system("convert " $3 " -resize 2160x " $3); system("convert " $3 " -crop 2160x3840+0+0 " $3) } else { system("convert " $3 " -resize 3840x " $3); system("convert " $3 " -crop 3840x2160+0+0 " $3) }}'

```

As mentioned a long time back in an [update](/update-2024-q3/#a-rant-on-linux-photography), I ended up with a broken *Darktable* library, meaning that [I](/travel/spain/valencia/) [lost](/travel/spain/alicante/) [all](/travel/spain/cartagena/) [the](/travel/spain/granada/) [adjustments](/travel/spain/malaga/) [that](/travel/spain/marbella/) [I](/travel/uk/gibraltar/) [did](/travel/spain/el-puerto-de-santa-maria/) [manage](/travel/spain/seville/) [to](/travel/spain/cordoba/) [export](/travel/spain/madrid/) [up](/travel/spain/bilbao/) [until](/travel/spain/san-sebastian/) [that](/travel/andorra/) [point](/travel/spain/barcelona/). Short story long, I eventually ditched *Darktable* for a *plan B*.

*Lightroom* on GrapheneOS
----------

After *Darktable* broke my library and I lost months’ worth of edits, I found myself back at square one. The idea of returning to Adobe felt like defeat, but when I looked at what was actually available for my setup, which is a [Google Pixel Tablet](/computer/#c4l1c0) running [GrapheneOS](/tag/grapheneos/), Adobe *Lightroom* for Android turned out to be the only realistic option that could handle RAW files and offer a non-destructive editing workflow.

Adobe *Lightroom Mobile* is, on paper, a reasonably capable RAW editor for Android. It supports a wide range of camera RAW formats and offers the familiar tone curve, HSL sliders, color grading, masking, and healing tools that anyone coming from desktop *Lightroom* will recognize. It can read photos directly from the device’s own storage, edit them locally without an internet connection, and export to JPEG with full control over quality and output dimensions. In short, the feature set is there.

### Workflow ###

The physical side of the workflow is straightforward. I attach a USB-C SD card reader to the Pixel Tablet, open a file manager, and copy the RAW files from the card into a dedicated folder on the tablet’s internal storage. From there I open *Lightroom*, import the photos from that folder into a local album, and work through them one by one. Once a photo is where I want it, I export it as a JPEG into the `AdobeLightroom` folder on the tablet’s storage. That folder is monitored by [Syncthing](/build-your-own-decentralized-dropbox-with-syncthing/), which synchronizes the finished exports to my other devices in the background.

### Performance ###

The performance of Adobe *Lightroom* on Android is, to put it mildly, terrible. Rendering a RAW preview after entering edit mode takes long enough that you find yourself staring at a loading indicator more often than at the actual photo. Scrolling through a grid of thumbnails is a choppy, stuttering affair that makes you wonder whether the application is doing something computationally expensive or is just poorly written. I acknowledge that the Pixel Tablet is an older budget device, yet *Lightroom* treats it as if it were running on hardware from 2005.

### Bugs & crashes ###

*Lightroom* on Android is every bit as buggy as Adobe products traditionally are on macOS and Windows, but somehow worse, because the interface is also frequently broken in ways that make the application essentially unusable without restarting it. The UI will routinely enter a state where confirmation and action buttons either stop responding to taps, as if the touch layer has fallen out of sync with whatever is rendered on screen, or simply disappear altogether. The only resolution is to quit the app and reopen it, at which point you hope that the edit you were in the middle of survived.

Entire features will similarly go dark without warning. The auto-straighten function, which should detect the horizon in a photo and level it, simply grays out and stops working at some point. No error, no indication as to why it has become unavailable, nothing. Again, restart the app, try again, maybe it works this time. These are not edge cases or exotic scenarios, but rather the normal operating experience of Adobe *Lightroom Mobile*.

### Privacy ###

One of the things I was most concerned about before committing to this workflow was the prospect of Adobe silently uploading my photos to their cloud infrastructure. The desktop version of *Lightroom* has a long and well-documented history of syncing content to Adobe’s servers in ways that are easy to miss and difficult to fully disable. On Android, GrapheneOS gives you a tool that the desktop doesn’t: Per-application network permission revocation.

I first disabled the cloud sync option within *Lightroom*’s own settings, then went into GrapheneOS’s permission manager and removed the network permission from the *Lightroom* app entirely. It continues to function as a local RAW editor without any network access whatsoever. Photos stay on the device. Nothing leaves without my explicit say-so via Syncthing.

**Note:** To keep things simple, I did not go into the fact that *Lightroom* is running inside an [Android 16 *Private Space*](/privacy-setup-for-android-16-with-grapheneos/), which also contains a sandboxed instance of *Google Play Services* and lets me create a virtual barrier between the rest of the FOSS apps on the Pixel Tablet and this ~~spyware~~ ~~malware~~ ~~crap~~ proprietary software. With this setup, however, importing data becomes slightly more tedious, as it requires the *Google Files* app to be able to read an attached USB-C storage device (SD card) from within the *Private Space*. The *Google Files* app is a giant UX disaster all by itself, into which, for the sake of our both’s time and mental health, I won’t dive into.

### Presets ###

One pleasant surprise was that I managed to import the *VSCO* *Lightroom* presets I purchased well over a decade ago into *Lightroom Mobile* on Android. The `.xmp` preset files still work, and the film emulations I had relied on for years, in particular the Kodak Portra series, show up in the presets panel and can be applied to photos.

With Adobe being Adobe, however, this had to come with a catch. *Lightroom Mobile* is apparently incapable of remembering which preset was applied to a given photo. Open an edited photo that had a *VSCO* preset applied, and *Lightroom* will display a warning telling you it cannot find the preset, even though the preset is sitting right there in the presets list, available and functioning, ready to be applied to new photos. The edit itself is intact… well… at least sometimes. Other times, *Lightroom* simply loses the edits altogether. It’s the kind of bug that suggests the feature was never properly tested beyond the initial happy path, which is about what you’d expect from Adobe.

Verdict
----------

To be frank, this workflow sucks compared to the one I had on macOS using *Capture One*. *Lightroom* is still the terrible POS it had always been, and paying money to [a company like Adobe](<https://search.brave.com/search?q=adobe horrible company>) feels like funding a criminal organization. Unfortunately, there doesn’t appear to be a viable alternative, especially not one that’s [libre](https://en.wikipedia.org/wiki/Free_software). The remaining options would be to either pay into Apple’s walled garden by purchasing one of their newer *iAmtheproduct* devices and subscribing to *Capture One Mobile*, or to rely exclusively on [Fuji’s in-camera film simulations](/fujifilm-x100vi/) (which sadly won’t work for [the Sony](/camera/#sony-a7iii)). Judging by [the reviews](https://apps.apple.com/us/app/capture-one/id1514081672?see-all=reviews) of *Capture One Mobile*, however, the former option doesn’t appear too promising either.

Looking at the situation in a more positive light, I nevertheless managed to replace the underlying stack on which my photography workflow runs with more privacy-respecting software ([GrapheneOS](/tag/grapheneos/)). That’s at least *something*, although it seems this workflow won’t live that long either, given that Google keeps locking down their Pixel devices and GrapheneOS appears to be pivoting to [Motorola-made hardware](https://motorolanews.com/motorola-three-new-b2b-solutions-at-mwc-2026/), who might not release a GrapheneOS-compatible *Moto Pad* anytime soon. Oh well.

**Pro tip:** A USI 2.0 pen makes using *Lightroom* on a device like the Pixel Tablet significantly less painful, at least as long as the USI pen actually works properly, which sadly isn’t always the case with the *Renaisser* pen I own. If you’re looking for a more general review of the Google Pixel Tablet with GrapheneOS, [look here](/de-googled-pixel-tablet-with-grapheneos-a-review/).