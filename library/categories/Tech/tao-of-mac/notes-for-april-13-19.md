+++
title = "Notes for April 13-19"
description = "This was a pretty decent week despite my allergies having kicked in to a point where I have constant headaches, but at least I had quite a bit of fun with my projects.“Now I Have the Full Picture”Yeah, I find O"
date = "2026-04-19T14:00:00Z"
url = "https://taoofmac.com/space/notes/2026/04/19/1400?utm_content=atom"
author = "Rui Carmo"
text = ""
lastupdated = "2026-04-20T13:16:30.838030753Z"
seen = false
+++

This was a pretty decent week despite my allergies having kicked in to a point where I have constant headaches, but at least I had quite a bit of fun with my projects.

[

“Now I Have the Full Picture”
----------

](/space/notes/2026/04/19/1400#now-i-have-the-full-picture)

Yeah, I find Opus sycophancy and its traits obnoxious, but this time it’s right–I was trying to get [Cydintosh](/space/links/2026/04/15/0718) to work with my particular flavor of Cheap Yellow Display and having so much trouble matching screen corruption and flipped colors (and bits) to the display code, that after I finally managed to get at least a stable (if broken) boot picture on screen, I thought to myself… why not let [`piclaw`](https://github.com/rcarmo/piclaw?utm_source=taoofmac.com&utm_medium=web&utm_campaign=unsolicited_traffic&utm_content=external_link) sort this out for me?

So I plugged the CYD and a Logitech Brio 4K into the [Orange Pi 6+](/space/reviews/2026/04/11/1900), and… I got the most surreal ESP32 closed loop debugging setup going:

<img alt="I ended up moving the camera farther away to get better focus" src="https://taoofmac.com/media/notes/2026/04/19/1400/h6dFl1CWTHcJ6u9Jq_z2vMC056s=/cyd-esp32-camera-debug.png" width="940" height="256" style="max-width: 100% !important;height: auto !important;">I ended up moving the camera farther away to get better focus

Five minutes later, I had all the display bugs fixed except for touch input, which was still rotated–a fair bargain.

[

Proxmox microVMs
----------

](/space/notes/2026/04/19/1400#proxmox-microvms)

I was looking at [smolvm](https://github.com/smol-machines/smolvm?utm_source=taoofmac.com&utm_medium=web&utm_campaign=unsolicited_traffic&utm_content=external_link) and going through my notes on [Firecracker](https://github.com/firecracker-microvm/firecracker?utm_source=taoofmac.com&utm_medium=web&utm_campaign=unsolicited_traffic&utm_content=external_link) and other sandboxing mechanisms, when I realized I had come across [QEMU](/space/emulation/qemu) [microVMs](https://www.qemu.org/docs/master/system/i386/microvm.html?utm_source=taoofmac.com&utm_medium=web&utm_campaign=unsolicited_traffic&utm_content=external_link) a few months ago when looking at agent sandboxing mechanisms and the old QEMU JIT.

Now, I actually think that microVMs are *way* overrated, but I was literally in the shower when I realized that, for me (since I have zero interest in running microVMs in my laptop) [Proxmox](/space/os/linux/distributions/proxmox) would be the perfect way to manage them (also since I have zero interest in running another exotic hypervisor).

So I did a little spelunking, and… It worked. Badly, but it worked. I took my terminal session, added a few notes, and asked [`piclaw`](https://github.com/rcarmo/piclaw?utm_source=taoofmac.com&utm_medium=web&utm_campaign=unsolicited_traffic&utm_content=external_link) to investigate if it was possible to patch the UI–and guess what, [it was a pretty simple patch](https://github.com/rcarmo/pve-microvm?utm_source=taoofmac.com&utm_medium=web&utm_campaign=unsolicited_traffic&utm_content=external_link)–I got the agent to flesh out a Debian package, turn my hacks into a CI/CD workflow that builds and packs a suitable kernel into the `.deb`, and now I have a nice VM template, decent integration of microVMs into the web UI, the works.

[pve-microvm](https://github.com/rcarmo/pve-microvm?utm_source=taoofmac.com&utm_medium=web&utm_campaign=unsolicited_traffic&utm_content=external_link) patches `qemu-server` to add the machine type, ships a template workflow that pulls OCI container images and converts them to PVE disk images, and redirects serial to the web console so you get a proper terminal in the UI. There’s also `init` support and a balloon device (as well as `qemu-agent` support), but the OCI images are so barebones that I haven’t yet sorted out all of the ergonomics about using them to automatically deploy stuff.

<img src="https://taoofmac.com/media/notes/2026/04/19/1400/jJWfleWT2xGkUwuIMvGT-fmGK0E=/pve-poster.jpg" style="max-width: 100%;height: auto;width: 100%" alt="Your browser cannot play this video" width="800" height="454"> Proxmox microVM integration in action

This looks like a *very* low impact addition to [Proxmox](/space/os/linux/distributions/proxmox) so far and I would love to upstream it, but I’m not holding my breath since maintainers aren’t trivial to reach and the old-style “join our developer mailing-list” approach is… just too effort-intensive as I have *so much* stuff to do these days.

[

We Now Do PowerPC JITs Too
----------

](/space/notes/2026/04/19/1400#we-now-do-powerpc-jits-too)

The [macemu](https://github.com/rcarmo/macemu?utm_source=taoofmac.com&utm_medium=web&utm_campaign=unsolicited_traffic&utm_content=external_link) work took an unexpected turn–I shifted from [BasiliskII](/space/emulation) (68k) to SheepShaver (PowerPC), and things moved a lot faster than I expected. To make a long story short, it was Friday and I idly asked [piclaw](https://github.com/rcarmo/piclaw?utm_source=taoofmac.com&utm_medium=web&utm_campaign=unsolicited_traffic&utm_content=external_link) to do a comparative source analysis between both emulators, hoping for something that I’d missed in the quagmire of ROM patches I’ve been wading through.

Turns out that it told me that there was no real JIT support *and* did a comparative analysis of *opcode coverage*, ending with “there are, however, much less opcodes to translate in the RISC architecture. Do you want me to set up a quick opcode test harness for PPC”?

Uh… yeah? By Friday evening, every opcode family except AltiVec had native ARM64 codegen *and* was booting to the Welcome to Macintosh screen (and crashing, but this was comparatively 100x faster than the 68k work), and yesterday afternoon, after some back and forth about creating a *second* harness (effectively a headless Mac with no hardware to skip problematic ROM regions), I got it to do AltiVec via NEON (which the [Orange Pi 6 Plus](/space/reviews/2026/04/11/1900) supports–I’ve yet to devise a fallback path for older chips).

The process was straightforward: point [piclaw](https://github.com/rcarmo/piclaw?utm_source=taoofmac.com&utm_medium=web&utm_campaign=unsolicited_traffic&utm_content=external_link) at an opcode group, have it implement the native codegen, run the harness, iterate on whatever broke, then once an opcode group was “done”, smoke test it on the headless Mac harness. The AltiVec stuff was the most satisfying part–mapping NEON intrinsics to Altivec semantics is tedious but tractable, exactly the kind of work where AI earns its keep and the harness catches every subtle difference.

SheepShaver now boots [Mac OS](/space/com/apple/macos) to a desktop with VNC input working. There’s still a long way to go because I have done *zero* hardware testing (it’s got no audio, only VNC input and, more importantly, no network or graphics acceleration), but a from-scratch PPC JIT on ARM64 booting to a desktop in around 24h is… not nothing.

I wish I could finish the 68k JIT, though, the register allocation strategy I guided the agent towards and the weird ROM patches BasiliskII does just don’t get along.

[

Lounge About Agentic Computing
----------

](/space/notes/2026/04/19/1400#lounge-about-agentic-computing)

The fun part for me has been that a *lot* of this has been done on an iPad on my couch, using the Apple Pencil or iOS voice typing to scratch out instructions. After an outing yesterday, I had the idea to just swipe between agents, and… oh boy.

The idea is simple–swipe left or right on the timeline to switch between agents–but making it feel right on an iOS PWA required far too many weird CSS and JS hacks, and the one real problem I’m having is that AI, no matter how many times you specify in painful detail what you want and how many actual code samples you give it, is still too prone to breaking very intricate UX–I’m getting really tired of weird regressions every time I add another feature.

[

I’m Not In Thrall To Anthropic, But I Can Help
----------

](/space/notes/2026/04/19/1400#im-not-in-thrall-to-anthropic-but-i-can-help)

I’m not an Anthropic customer (besides GitHub Copilot’s model selection, which now also includes the new, lobotomized Opus 4.7, I have a personal Codex subscription for OSS work), but so many people seem to have been caught by their ban on third-party coding harnesses that I decided to dust off [Vibes](https://github.com/rcarmo/vibes?utm_source=taoofmac.com&utm_medium=web&utm_campaign=unsolicited_traffic&utm_content=external_link), start porting it to [Go](/space/dev/golang) (which I had already in my backlog) and turning it into an ACP-only wrapper so that people can use Claude with a nice web UI.

I think it’s the least I can do, and also gives me a decent web UI to drop in for my own work when I absolutely have to use Copilot.

[

Haiku on ARM64
----------

](/space/notes/2026/04/19/1400#haiku-on-arm64)

And, of course, since I have far too many projects already, I decided to see if I could get [Haiku](https://github.com/rcarmo/haiku?utm_source=taoofmac.com&utm_medium=web&utm_campaign=unsolicited_traffic&utm_content=external_link) to boot on ARM64. I don’t particularly care about doing [AI] for salesy startupy business stuff, but I *love* using it to build things I think should exist, and I have quite a few more I’d like to make happen…