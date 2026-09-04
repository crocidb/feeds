+++
title = "Lenovo X1 Carbon Gen 14 Aura"
description = 'A review of the \_Lenovo ThinkPad X1 Carbon Gen 14 Aura Edition\_ with \_Intel Panther Lake\_ \_Core Ultra X7 368H vPro\_, from the perspective of a Linux user coming from a \_Star Labs\_ \_StarBook Mk VI AMD\_, and running a hardened Gentoo installation.'
date = "2026-07-08T07:16:37Z"
url = "https://xn--gckvb8fzb.com/lenovo-x1-carbon-gen-14-aura/"
author = "marius@xn--gckvb8fzb.com (Marius)"
text = ""
lastupdated = "2026-07-09T12:05:22.311415142Z"
seen = false
+++

**tl;dr:** After [the long](/updates-2026-q1/) and [painful goodbye](/updates-2026-q2/) to my *Star Labs StarBook Mk VI AMD*, I caved and did what every Linux nerd eventually does, which is buying a *ThinkPad*. I left *Team Red* and chose the *X1 Carbon Gen 14 Aura Edition* with *Intel*’s new *Panther Lake* *Core Ultra X7 368H vPro*, 32GB of (sadly soldered) RAM and the 2.8K OLED panel. It’s a sub-1kg, repairable carbon-fibre slab that runs Linux beautifully and that I can service (or get serviced) pretty much anywhere on the planet thanks to the widespread availability of parts and service points. Migration consisted of installing the latest *Gentoo* distribution kernel (to have all necessary modules available), pulling the SSD with my [hardened Gentoo installation](/hardened-gentoo-with-full-disk-encryption-on-the-star-labs-starbook-mk-vi/) out of the *StarBook*, dropping it into the *Lenovo*, and booting the system. Plus one round of recompiling all packages for the new architecture, but that’s… details.

Sadly there’s no *Coreboot*, the *Intel Management Engine* is silently *plotting* in the background, and you’re trusting a closed firmware stack from a vendor with an [interesting](https://en.wikipedia.org/wiki/Superfish) [past](https://en.wikipedia.org/wiki/Lenovo#Lenovo_Service_Engine). If you’re looking for a fully liberated laptop, this sadly isn’t it. But then again, even in 2026, sadly [almost nothing really is](#firmware).

As some of you who suffered through [the last](/updates-2026-q1/) [two updates](/updates-2026-q2/) already know, the first half of 2026 was, to put it mildly, a *hardware massacre*. Phones broke, a tablet got preemptively retired, head- and earphones died, and my primary workstation (the [*Star Labs StarBook Mk VI AMD*](/a-brief-review-of-the-star-labs-starbook-mk-vi-ryzen-ultrabook/)) suffered increasing stability issues and finally [bricked itself during a firmware update](https://github.com/StarLabsLtd/firmware/issues/396). I wrote at length about why I ultimately decided to part ways with *Star Labs*, so I won’t rehash all of it here, but the short version is, that with the *Star Labs* laptop I loved the idea, I loved the design, but I could no longer rely on the hardware, and I needed a device that I could repair no matter where in the world I happen to be.

I had been eyeing the [*ASUS ExpertBook Ultra*](/updates-2026-q1/) with the *X9 388H* for a while, but it remained a paper launch, and after my misadventures trying to source *ASUS* hardware across the globe, I lost faith in the service and spare-part situation, so I did the boring, sensible, *adult* thing and bought the laptop that has authorised service centres and spare parts on every continent: A *Lenovo ThinkPad X1 Carbon*.

*Wait, weren’t you Team Red?*, you might ask. I was, and in spirit I still am. For the better part of a decade I bought almost exclusively AMD. But as I ranted about [previously](/updates-2026-q1/), with AMD laptops it’s *always something*. The ports, the display, the chassis, the TDP, *something* always forces a compromise I don’t want to make at this price point. *Panther Lake* made enough of a splash, performance-per-watt-wise, that I was willing to give *Team Blue* another shot, despite *Intel*’s long history of monopolistic behaviour, security holes and general d!ckhead-ish behaviour. And to be fair, AMD’s behaviour [isn’t](https://www.youtube.com/watch?v=dkPPejQXFNo) [much](https://www.youtube.com/watch?v=WsCrKGY9F1o) [better](https://www.youtube.com/watch?v=uJcf2UGCH1w) [these](https://www.youtube.com/watch?v=p6O4LCmah98) [days](https://www.youtube.com/watch?v=cl7zSJh0Ihk) [anyway](https://www.youtube.com/watch?v=4HjWHNLRMB0).

What it is
----------

[![](/lenovo-x1-carbon-gen-14-aura/images/lenovo-x1-carbon-gen-14-aura_1328_hu_4276691ede941b1.webp)](/lenovo-x1-carbon-gen-14-aura/images/lenovo-x1-carbon-gen-14-aura_1328.jpg)

The [*ThinkPad X1 Carbon Gen 14 Aura Edition*](https://www.lenovo.com/us/en/p/laptops/thinkpad/thinkpadx1/lenovo-thinkpad-x1-carbon-gen-14-aura-edition-14-inch-intel/len101t0159) is *Lenovo*’s 2026 flagship ultrabook. It’s the fourteenth iteration of a line that, at this point, basically *is* the archetype of the *“business ultrabook”*. The *“Aura Edition”* branding is an *Intel* co-marketing thing, and the single *X7* sticker went straight into the bin. Speaking of which, yes, it’s going to get [stickerbombed](/tag/stickerbomb/), but that’ll take some time.

The interesting part however is not the age-old *ThinkPad* aesthetic, but what lies underneath, namely a brand-new [*Panther Lake*](https://www.notebookcheck.net/Intel-Core-Ultra-X7-368H-Processor-Benchmarks-and-Specs.1196557.0.html) chip, a redesigned repairable chassis, and crucially proper Linux support straight from the manufacturer. My specific configuration is the one I’ll be reviewing here, but keep in mind that *Lenovo* sells this chassis in a dozen permutations.

### Specifications ###

[![](/lenovo-x1-carbon-gen-14-aura/images/lenovo-x1-carbon-gen-14-aura_1356_hu_7d06560439473f93.webp)](/lenovo-x1-carbon-gen-14-aura/images/lenovo-x1-carbon-gen-14-aura_1356.jpg)

|Component|                                                              Specification                                                              |
|---------|-----------------------------------------------------------------------------------------------------------------------------------------|
|   CPU   |                                            *Intel Core Ultra X7 368H vPro* (*Panther Lake*)                                             |
|   RAM   |                                                      32GB *LPDDR5x-8533*, soldered                                                      |
| Display |                                    14" 2.8K (2880x1800) OLED, 120Hz VRR, anti-reflective/anti-smudge                                    |
| Storage |M.2 2280 PCIe Gen5 slot (single-sided only); shipped with a 256GB Gen4 *Union Memory* TLC *Opal* SSD (*swapped, see [below](#migration)*)|
|  WLAN   |                                               *Intel BE211* Wi-Fi 7 + Bluetooth, plus NFC                                               |
| Camera  |                                     10MP RGB + IR with a ToF sensor and a physical shutter (*yay!*)                                     |
|  Ports  |                                  3x Thunderbolt 4, 1x USB-A (5Gbps), 1x HDMI 2.1, 1x 3.5mm combo jack                                   |
| Battery |                                                                  58Wh                                                                   |
| Weight  |                                                                \~0.98kg                                                                 |

These figures reflect my specific machine type (`21V7`) and the official platform specs come from [Lenovo’s PSREF spec sheet](https://psref.lenovo.com/l/Product/ThinkPad_X1_Carbon_Gen_14_Aura_Edition).

Speaking of which, on Linux you can read the model, marketing name and serial straight from the *DMI* tables (handy for a *PSREF* lookup), and pull a broader hardware overview with `inxi`/`lscpu`:

```bash
cat /sys/class/dmi/id/product_name
cat /sys/class/dmi/id/product_version
cat /sys/class/dmi/id/product_serial

dmidecode -t system
inxi -Fxxxz
lscpu

```

The Panther
----------

[![* Iran, North Korea, Syria, Cuba, Russia, Belarus](/lenovo-x1-carbon-gen-14-aura/images/panther-lake_hu_cb445731d3126bb1.webp)](/lenovo-x1-carbon-gen-14-aura/images/panther-lake.jpg)\* Iran, North Korea, Syria, Cuba, Russia, Belarus

The star of the show is *Intel*’s [*Core Ultra X7 368H vPro*](https://www.notebookcheck.net/Intel-Core-Ultra-X7-368H-Processor-Benchmarks-and-Specs.1196557.0.html), part of the *Panther Lake* generation. After years of *Intel* embarrassing itself, this is the most interesting mobile chip the company has shipped in a long while, and the first one in ages that made me, a committed AMD user, go back to *Team Blue*.

It’s a 16-core, 16-thread unit, and no, there’s no *HyperThreading* here. The cores break down into:

* 4x *Cougar Cove* performance cores, up to 5.0 GHz
* 8x *Darkmont* efficiency cores, up to 3.8 GHz
* 4x *Darkmont* low-power efficiency cores, up to 3.6 GHz

It carries 12.5MB of L2 and 18MB of L3 (*Smart Cache*, shared), and *Intel* rates it at a 25W base (PL1) with an 80W maximum turbo (PL2). *Lenovo* configures it for roughly 30W sustained in this chassis, which is a step up from the \~17-20W that last year’s *Lunar Lake* *Gen 13* ran at.

[![](/lenovo-x1-carbon-gen-14-aura/images/lenovo-x1-carbon-gen-14-aura_1338_hu_41aafd2e9a2e789.webp)](/lenovo-x1-carbon-gen-14-aura/images/lenovo-x1-carbon-gen-14-aura_1338.jpg)

What makes *Panther Lake* architecturally interesting is that it’s a disaggregated, multi-process design. The compute tile is built on *Intel*’s own *18A* node, while the GPU tile is fabbed by *TSMC* on *N3E*.

**Note:** The *X1 Carbon Gen 14* is offered *“up to”* the *X7 368H*, and only the X7 tier gets the 12-core *Arc B390* iGPU. Every cheaper *Core Ultra 5*/*7* option makes do with *Intel*’s weaker standard integrated graphics. That GPU split is the whole reason I went for the X7, as it is, in my opinion, the only configuration worth buying, if you care about graphics at all.

### Numbers ###

[![](/lenovo-x1-carbon-gen-14-aura/images/lenovo-x1-carbon-gen-14-aura_1346_hu_f81fe6e8f0510f51.webp)](/lenovo-x1-carbon-gen-14-aura/images/lenovo-x1-carbon-gen-14-aura_1346.jpg)

In *Geekbench 6* the *368H* lands at around 2,870 single-core and somewhere between [16,422](https://browser.geekbench.com/v6/cpu/18523729), [16,885](https://browser.geekbench.com/v6/cpu/18573217) and [17,318](https://browser.geekbench.com/v6/cpu/18526050) multi-core. These (along with the [graphics](#graphics) and AI numbers below) were captured on a *\*cough\** [factory](https://github.com/massgravel/Microsoft-Activation-Scripts) *\*cough\** *Windows 11* install on its 256GB SSD.

For context, [*XDA*](https://www.xda-developers.com/review-thinkpad-x1-carbon-gen-14-aura-ediiton/) measured the mid-tier *Core Ultra 7 355* review unit at 2,610 / 11,263 in *Geekbench 6*. And for comparison, my *Star Labs StarBook Mk VI AMD* scores [1,906 / 6,245 in *Geekbench 6*](https://browser.geekbench.com/v6/cpu/18495501), with an [*OpenCL* score of 13,051](https://browser.geekbench.com/v6/compute/6637305) and a [*Vulkan* score of 11,932](https://browser.geekbench.com/v6/compute/6637315).

[![](/lenovo-x1-carbon-gen-14-aura/images/starbook-power-plan_hu_16a5c5fc2552dabb.webp)](/lenovo-x1-carbon-gen-14-aura/images/starbook-power-plan.png)

**Note:** Despite having set the power setting on *Windows 11* to *Performance*, the *Geekbench* report still lists the *Power Plan* as *Balanced*.

For my purposes, however, the more relevant metric is real-world responsiveness, and the chip is *quick*. Cold-compiling *ungoogled-chromium* on Gentoo, juggling a few dozen terminal panes, a couple of browsers and the usual pile of background daemons and it still doesn’t break a sweat. On the *StarBook* [`qlop`](https://wiki.gentoo.org/wiki/Q_applets#Extracting_information_from_emerge_logs_.28qlop.29) would normally report something between 12 to 48 hours for *ungoogled-chromium*, depending on how many pre-compiled system libraries the specific release would be able to utilize without errors. On the *X1* that number more than halved, with the average runtime being well below six hours.

Here are the exact `qlop` timings for a couple of the usual heavyweights, on the *StarBook* versus the *X1*:

|      Package       |StarBook Mk VI AMD|X1 Carbon (368H)|
|--------------------|------------------|----------------|
|      `boost`       |      8′08"       |     3′13"      |
|      `clang`       |      35′19"      |     21′47"     |
|       `gcc`        |      41′09"      |     21′13"     |
|    `librewolf`     |      48′18"      |     35′44"     |
|       `llvm`       |      39′12"      |     21′09"     |
|      `nodejs`      |      44′09″      |     21′51″     |
|   `qtwebengine`    |     3:24:42      |    1:56:23     |
|       `rust`       |      30′37"      |     16′58"     |
|   `thunderbird`    |      45′33"      |     19′15"     |
|`ungoogled-chromium`|     12:07:13     |    5:35:42     |
|       `zig`        |      28′01″      |     15′06″     |

### Graphics ###

[![](/lenovo-x1-carbon-gen-14-aura/images/lenovo-x1-carbon-gen-14-aura_1354_hu_1410f1107e877d6b.webp)](/lenovo-x1-carbon-gen-14-aura/images/lenovo-x1-carbon-gen-14-aura_1354.jpg)

The integrated GPU is *Intel*’s new *Arc B390* with 12 Xe3 cores clocked up to \~2.5 GHz, with hardware ray tracing included. The *Xe3* iGPU scores [56,930 in *Geekbench 6*’s OpenCL test](https://browser.geekbench.com/v6/compute/6648670), and between [49,213](https://browser.geekbench.com/v6/compute/6668335) and [63,874 in *Vulkan*](https://browser.geekbench.com/v6/compute/6648683), which puts it roughly in the territory of a discrete desktop *GeForce RTX 3050*. Unlike *NVIDIA*’s hardware, however, the *B390* is still backed by open-source, in-tree `xe` drivers.

I’m not much of a gamer, but for the curious, here’s how a handful of titles fare on the *B390*:

|         Game          |           Settings           |Resolution| FPS |
|-----------------------|------------------------------|----------|-----|
|Rise of the Tomb Raider|          Very High           |2880x1800 |30–39|
|Rise of the Tomb Raider|          Very High           |1920x1200 |36–70|
|  Cities: Skylines II  |             High             |1920x1200 |20–21|
|  Cities: Skylines II  |            Medium            |1920x1200 |26–32|
|MGS V: The Phantom Pain|Extra High + volumetric clouds| 1600x900 |53–71|
|   Planet Coaster 2    |            Ultra             |1728x1080 |46–53|
|    Cyberpunk 2077     |            Ultra             |1920x1200 |41–63|
|Ghost Recon Breakpoint |           Maximum            |1920x1200 |41–56|

So nothing that’ll trouble a discrete GPU, but for an iGPU in a sub-1kg ultrabook, playable frame rates in actual games at sensible settings is more than I’d ever have asked of integrated graphics a couple of generations ago.

[![](/lenovo-x1-carbon-gen-14-aura/images/lenovo-x1-carbon-gen-14-aura_1352_hu_daab5fd33a89d12b.webp)](/lenovo-x1-carbon-gen-14-aura/images/lenovo-x1-carbon-gen-14-aura_1352.jpg)

What surprised me the most out of all of this was the *Cyberpunk 2077* result, since I would never have expected an iGPU sitting inside a lightweight ultrabook to hold somewhere between 40 and 60 fps at *Ultra* settings and a 1920x1200 resolution in what is still one of the most punishing games you can throw at a machine, and yet it does exactly that, with the frame rate only ever falling off a cliff the very moment I enabled one of the ray-traced lighting presets.

The curious part, however, is that this drop isn’t a case of the hardware lacking the feature altogether, because the *Arc B390* actually ships with [native hardware ray tracing](https://www.notebookcheck.net/Intel-Arc-B390-12-Xe3-Panther-Lake-iGPU-Benchmarks-and-Specs.1169503.0.html), carrying one dedicated ray-tracing unit per *Xe3* core, so twelve RTUs in total. The question is whether the silicon can be fed fast enough to do ray tracing at a frame rate worth having, and the answer seems to be *“nope”*. Ray tracing, and *BVH traversal* in particular, generates an enormous amount of scattered, incoherent memory accesses, and unlike a discrete card that gets to service all those random reads out of its own dedicated, high-bandwidth *GDDR*, an iGPU like the *B390* has no *VRAM* of its own and instead shares the very same *LPDDR5x* pool as the CPU, which leaves it to contend for a fraction of the bandwidth that a proper GPU would have. And once you throw in the fact that a dozen RTUs is a tiny number next to the many dozens you’d find on a discrete *Arc*, *Radeon* or *GeForce*, as well as the shared \~30W power budget that the GPU has to split with the rest of the *SoC*, ray tracing ends up being the one workload in which the gap between this little chip and an actual graphics card still shows.

[![](/lenovo-x1-carbon-gen-14-aura/images/lenovo-x1-carbon-gen-14-aura_1360_hu_223141c0ae918646.webp)](/lenovo-x1-carbon-gen-14-aura/images/lenovo-x1-carbon-gen-14-aura_1360.jpg)

None of that really bothers me, though, since ray tracing on an iGPU was always going to be more of a party trick than something I’d lean on day to day, and for the rare occasions on which I actually [do need that sort of horsepower](/making-my-content-more-easily-digestible/), I can always just hang an external GPU off one of the Thunderbolt ports somewhere down the line. This appears to be a route that, judging by the various reports of people running eGPUs over Thunderbolt on previous *X1 Carbon* generations under Linux, all the way from a relatively tame *Akitio Node* with an *NVIDIA* card on a *Gen 5* to a frankly unhinged dual-*RTX 3090* contraption hanging off a *Gen 9* running *Fedora*, appears to work well enough in practice. And while a fair share of those write-ups inevitably involve someone making their peace with *NVIDIA*’s proprietary driver, that’s precisely the part I’d happily skip, because the far more appealing option for me would be to pair the laptop with one of the *Radeon* cards I already own (such as the *RX 6700 XT* that currently lives inside [my *other computer*](/computer/#cbrspc7)). Thanks to the open, in-tree `amdgpu` driver there’s no out-of-tree blob to wrangle in the first place, native kernel-level Thunderbolt hotplug is simply *there*, and on *Wayland* in particular, which is what [my Sway setup](/minimalist-and-functional-desktop-environment-without-xorg/) runs on, the whole thing sidesteps the old X.Org `HotplugDriver` gymnastics entirely. But it remains to be seen how good/reliable a setup like that can work.

### Local *“AI”* ###

[![](/lenovo-x1-carbon-gen-14-aura/images/lenovo-x1-carbon-gen-14-aura_1378_hu_52d8d8f54dae2bda.webp)](/lenovo-x1-carbon-gen-14-aura/images/lenovo-x1-carbon-gen-14-aura_1378.jpg)

The *Ollama* version used here is `cecd26` and it was compiled using `cmake -B build -DOLLAMA_LLAMA_BACKENDS=vulkan`. The *Vulkan* version is `1.4.341.0` and *Mesa* `26.0.7`. Here are the results of the [LLM benchmark](https://llm.aidatatools.com):

```
model_name =    mistral:7b
prompt = Write a step-by-step guide on how to bake a chocolate cake from scratch.
eval rate:            13.82 tokens/s
prompt = Develop a python function that solves the following problem, sudoku game
eval rate:            13.69 tokens/s
prompt = Create a dialogue between two characters that discusses economic crisis
eval rate:            13.96 tokens/s
prompt = In a forest, there are brave lions living there. Please continue the story.
eval rate:            13.82 tokens/s
prompt = I'd like to book a flight for 4 to Seattle in U.S.
eval rate:            14.11 tokens/s
--------------------
Average of eval rate:  13.88  tokens/s
----------------------------------------
model_name =    phi4:14b
prompt = Write a step-by-step guide on how to bake a chocolate cake from scratch.
eval rate:            6.95 tokens/s
prompt = Develop a python function that solves the following problem, sudoku game
eval rate:            6.94 tokens/s
prompt = Create a dialogue between two characters that discusses economic crisis
eval rate:            7.00 tokens/s
prompt = In a forest, there are brave lions living there. Please continue the story.
eval rate:            7.00 tokens/s
prompt = I'd like to book a flight for 4 to Seattle in U.S.
eval rate:            7.02 tokens/s
--------------------
Average of eval rate:  6.982  tokens/s
----------------------------------------
model_name =    gemma2:9b
prompt = Explain Artificial Intelligence and give its applications.
eval rate:            12.74 tokens/s
prompt = How are machine learning and AI related?
eval rate:            12.82 tokens/s
prompt = What is Deep Learning based on?
eval rate:            12.78 tokens/s
prompt = What is the full form of LSTM?
eval rate:            13.92 tokens/s
prompt = What are different components of GAN?
eval rate:            12.74 tokens/s
--------------------
Average of eval rate:  13.0  tokens/s
----------------------------------------
model_name =    llava:7b
prompt = Describe the image, sample1.jpg
eval rate:            23.96 tokens/s
prompt = Describe the image, sample2.jpg
eval rate:            23.89 tokens/s
prompt = Describe the image, sample3.jpg
eval rate:            24.22 tokens/s
prompt = Describe the image, sample4.jpg
eval rate:            24.11 tokens/s
prompt = Describe the image, sample5.jpg
eval rate:            23.90 tokens/s
--------------------
Average of eval rate:  24.016  tokens/s
----------------------------------------
model_name =    llava:13b
prompt = Describe the image, sample1.jpg
eval rate:            13.52 tokens/s
prompt = Describe the image, sample2.jpg
eval rate:            13.85 tokens/s
prompt = Describe the image, sample3.jpg
eval rate:            13.60 tokens/s
prompt = Describe the image, sample4.jpg
eval rate:            13.71 tokens/s
prompt = Describe the image, sample5.jpg
eval rate:            13.59 tokens/s
--------------------
Average of eval rate:  13.654  tokens/s
----------------------------------------
model_name =    deepseek-r1:8b
prompt = Summarize the key differences between classical and operant conditioning in psychology.
eval rate:            11.37 tokens/s
prompt = Translate the following English paragraph into Chinese and elaborate more -> Artificial intelligence is transforming various industries by enhancing efficiency and enabling new capabilities.
eval rate:            11.48 tokens/s
prompt = What are the main causes of the American Civil War?
eval rate:            11.30 tokens/s
prompt = How does photosynthesis contribute to the carbon cycle?
eval rate:            11.41 tokens/s
prompt = Develop a python function that solves the following problem, sudoku game.
eval rate:            9.79 tokens/s
--------------------
Average of eval rate:  11.07  tokens/s
----------------------------------------
model_name =    deepseek-r1:14b
prompt = Summarize the key differences between classical and operant conditioning in psychology.
eval rate:            6.10 tokens/s
prompt = Translate the following English paragraph into Chinese and elaborate more -> Artificial intelligence is transforming various industries by enhancing efficiency and enabling new capabilities.
eval rate:            6.17 tokens/s
prompt = What are the main causes of the American Civil War?
eval rate:            6.08 tokens/s
prompt = How does photosynthesis contribute to the carbon cycle?
eval rate:            6.10 tokens/s
prompt = Develop a python function that solves the following problem, sudoku game.
eval rate:            5.81 tokens/s
--------------------
Average of eval rate:  6.052  tokens/s
----------------------------------------
Sending the following data to a remote server
-------Linux----------

No NVIDIA GPU detected.
Your machine UUID : XXXXXXXX-XXXX-XXXX-XXXXXXXXXXXXXXXXX
-------Linux----------

No NVIDIA GPU detected.
{
    "mistral:7b": "13.88",
    "phi4:14b": "6.98",
    "gemma2:9b": "13.00",
    "llava:7b": "24.02",
    "llava:13b": "13.65",
    "deepseek-r1:8b": "11.07",
    "deepseek-r1:14b": "6.05",
    "uuid": "XXXXXXXX-XXXX-XXXX-XXXXXXXXXXXXXXXXX",
    "ollama_version": "0.0.0"
}
----------
====================
-------Linux----------

No NVIDIA GPU detected.
-------Linux----------

No NVIDIA GPU detected.
{
    "system": "Linux",
    "memory": 30.834156036376953,
    "cpu": "Intel(R) Core(TM) Ultra X7 368H",
    "gpu": "Panther Lake [Intel Graphics]",
    "os_version": "Gentoo Linux",
    "system_name": "Linux",
    "uuid": "XXXXXXXX-XXXX-XXXX-XXXXXXXXXXXXXXXXX"
}
----------

```

According to the [results](https://llm.aidatatools.com/results-linux.php), the *Ultra X7* appears to perform similarly to e.g. the *AMD Ryzen 9 7900 12-Core Processor*, the *AMD Ryzen AI 7 350* with *Radeon 860M*, the *12th Gen Intel Core i9-12900H*, and the *AMD Ryzen 7 7700X 8-Core* for the *DeepSeek R1 8b* model.

Anyway, there’s also an *NPU* rated at 50 TOPS, which I still need to test.

Memory and storage
----------

[![](/lenovo-x1-carbon-gen-14-aura/images/lenovo-x1-carbon-gen-14-aura_1364_hu_e4255e05252db18c.webp)](/lenovo-x1-carbon-gen-14-aura/images/lenovo-x1-carbon-gen-14-aura_1364.jpg)

Here’s the first gripe with the *Lenovo*, which is the RAM. Sadly my model only comes with 32GB of *LPDDR5x-8533* memory, and it’s soldered. On the *X7* the memory should be able to run at the full 9600 MT/s, but for whatever reason *Lenovo* decided that, unless you’re willing to add another $1,000 on top, you’ll only be getting the *“slower”* RAM. And while the SoC theoretically supports up to 96GB, *Lenovo* will only sell you a maximum of 64GB. Swallowing a non-upgradeable 32GB config stung, especially in the current [*“AI”*-driven hardware climate](/hold-on-to-your-hardware/), in which most people (including myself) are looking at prolonged lifespans for their hardware. I gambled on 32GB being enough for a terminal-centric workflow for the foreseeable future, and so far it is, but I’d be lying if I said I was okay with not being able to change my mind later.

Storage-wise the machine shipped with a bare-minimum 256GB M.2 2280 TLC *Opal* self-encrypting drive, which I promptly removed. The slot itself is PCIe Gen5 with sequential reads near 12,850 MB/s (with a Gen5 drive in it), but it only supports single-sided 2280 drives. Luckily my 2TB *SK hynix Gold P31* (`SHGP31-2000GM`), which had been living in the *StarBook* since [I upgraded it](/hardened-gentoo-with-full-disk-encryption-on-the-star-labs-starbook-mk-vi/), is exactly that, so it dropped straight in. Yes, the P31 is *only* a Gen3 drive in a Gen5 slot, but it goes without saying that SSD pricing these days is absolute nonsense. Also, while the *Opal* self-encrypting drives are *cool* and all, I run my own [full-disk encryption with `dm-crypt`](/hardened-gentoo-with-full-disk-encryption-on-the-star-labs-starbook-mk-vi/) rather than relying on the drive’s implementation. The 2TB I already owned is plenty, and I do not care that much about sequential SSD benchmarks that I’m unlikely to ever notice in practice.

Display
----------

[![](/lenovo-x1-carbon-gen-14-aura/images/lenovo-x1-carbon-gen-14-aura_1342_hu_e78c12e49c3ca51c.webp)](/lenovo-x1-carbon-gen-14-aura/images/lenovo-x1-carbon-gen-14-aura_1342.jpg)

The 2.8K OLED panel is, frankly, the nicest display I’ve had on a laptop. It’s a 14", 16:10, 2880x1800 OLED running at 120Hz with variable refresh (it’ll drop as low as \~30Hz to save power), rated at 500 nits SDR and covering 100% of *DCI-P3*. It also carries an *HDR 500 True Black* certification worth precisely nothing to me on Linux, but there it is. In proper *ThinkPad* fashion, the hinge lets the lid lay completely flat, which is something that my initial candidate, the *ASUS ExpertBook Ultra*, would not have been able to do. Critically for me, *Lenovo* ships it with an anti-reflective and anti-smudge coating, which means it’s matte enough to actually use in various lighting conditions.

Coming from the *StarBook*’s perfectly-fine-but-unremarkable 1080p IPS panel, the jump to a high-refresh OLED is the kind of upgrade you don’t think you need until you have it. Blacks are black, like, *really* black and text is razor-sharp, and at 120Hz animations are buttery smooth. My only real reservation is the usual OLED burn-in over a multi-year ownership period, especially with things like a *Waybar* that’s always there, not moving and barely changing any of the text it displays. I might need to tweak that part of my setup long-term.

If there’s one thing one might complain about it’s the brightness ceiling. The panel tops out at 500 nits, which, for today’s standards is not *a lot*. However, personally I find the display bright enough and I tend to run it at around 50% brightness throughout the day while indoors, which visually is equal to the *StarBook*’s display running at almost 100% brightness. As an added bonus, the OLED PWM dimming runs at a far higher frequency than older panels, so those of us sensitive to flicker can stare at it all day without the headache.

Connectivity and I/O
----------

[![](/lenovo-x1-carbon-gen-14-aura/images/lenovo-x1-carbon-gen-14-aura_1344_hu_56d970541718a47a.webp)](/lenovo-x1-carbon-gen-14-aura/images/lenovo-x1-carbon-gen-14-aura_1344.jpg)

The port selection is great, especially compared to the *StarBook*:

* 3x Thunderbolt 4 (USB-C), with at least one on each side, so I can charge or dock from whichever side the cable lands on
* 1x USB-A (5Gbps), always-on so it’ll charge a device with the lid shut, although it’ll probably continue to permanently host my [YubiKey](/minimalist-and-functional-desktop-environment-without-xorg/)
* 1x HDMI 2.1
* 1x 3.5mm headphone/microphone combo jack, although I’d wish it would be on the right side rather than the left

Wireless duties are handled by an *Intel BE211* Wi-Fi 7 card with Bluetooth 5.4, and my unit also has NFC because *yolo*. *Lenovo* additionally offers an optional 5G *WWAN* modem with a nano-SIM slot, which I skipped, because I’d rather [use my dedicated router](/minimal-yet-productive-travel-desk-setup/), and because Linux support doesn’t seem to be quite there yet anyway. The *Intel* WLAN card, on the other hand, is supported out of the box by the in-tree `iwlwifi` driver under Linux.

The webcam is a 10MP RGB + IR module (with *ImmerVision* wide-FOV optics), a *Time-of-Flight* sensor for presence detection, and, most importantly, a physical *ThinkShutter* a.k.a. a way to physically cover it without the use of dot-stickers, which is a very welcome feature. The IR camera is there for *Windows Hello*, which is useless to me, but the [`howdy`](https://github.com/boltgolt/howdy)-on-IR crowd will appreciate it.

On my specific model (with the OLED display) the [webcam has](https://forums.lenovo.com/t5/Other-Linux-Discussions/X1-Carbon-Gen-14-21V7-OLED-MIPI-camera-OV08X40-IPU7-not-working-on-Linux-—-firmware-LCHS/m-p/10033620) [not been](https://bugzilla.redhat.com/show_bug.cgi?id=2483180) [working](https://bugs.launchpad.net/ubuntu/+bug/2156567), as of the time of writing this post.

As for the keyboard, the following will probably earn me ~~some~~ a lot of hate, and while I agree that compared to every other laptop keyboard the *ThinkPad*’s integrated one is a masterpiece with 1.5mm of travel, slightly concave keycaps, a *sane* arrow-key layout, spill resistance, and two backlight levels plus an auto mode, … I frankly still prefer typing [on my own keyboard](/keyboard/) [Sonshi-style](/sonshi-style-aka-keyboard-on-laptop/). But yeah, don’t worry, if you’re the type of person that exclusively uses the *ThinkPad*’s keyboard then you will be happy to hear that it’s a solid integrated keyboard, still. Also, don’t ever talk to me about keyboards.

(-:

**Note:** Two *Gen 14* tweaks that are worth mentioning are the key legends, which are now centred and spelled out in full (*“Backspace”* rather than a glyph), and the power button, that has migrated into the top-right of the keyboard deck with the fingerprint reader built into it, right next to the longish *Delete* key.

[![](/lenovo-x1-carbon-gen-14-aura/images/lenovo-x1-carbon-gen-14-aura_1336_hu_a469da0cf94222ea.webp)](/lenovo-x1-carbon-gen-14-aura/images/lenovo-x1-carbon-gen-14-aura_1336.jpg)

The red *TrackPoint* nub, however, is still superior to every touchpad I have ever operated (including the integrated one) and I’m happy that *Lenovo* is still holding on to it. One buying tip that I’m glad I caught beforehand concerns the touchpad configuration. *Lenovo* offers two different touchpads on the *X1 Carbon*, the good old regular touchpad with actual buttons on its upper border, and a *haptic ForcePad*, which technically seems to be the sleeker one. However, choosing it will cost you the discrete physical *TrackPoint* buttons that only the regular touchpad brings. If, like me, you actually plan to use the nub, the plain mechanical *“diving board”* pad keeps those buttons, and that’s the one I went for.

Lastly, audio finally comes from a stereo system that the *Space Frame* now fires *upward* through the keyboard deck rather than down at the desk. It’s startlingly loud for a 14" laptop, though it’s still laptop audio, so better get headphones. That said, these sound like *Bowers & Wilkins* 603s in comparison to the bad speakers on the *StarBook*.

Space Frame
----------

[![](/lenovo-x1-carbon-gen-14-aura/images/lenovo-x1-carbon-gen-14-aura_1358_hu_7072b8c11aa75341.webp)](/lenovo-x1-carbon-gen-14-aura/images/lenovo-x1-carbon-gen-14-aura_1358.jpg)

This is one of the main reasons I picked the *X1 Carbon* over its alternatives. For *Gen 14*, *Lenovo* completely redesigned the internals around what they call a *Space Frame*, which is a structural redesign that lets them mount components on both sides of the mainboard, shrink the internal footprint, and fit a 70% larger fan for better sustained performance.

Materially it remains the classic *X1 Carbon* composition however. The device has a carbon-fibre lid over a magnesium (and aluminium) body, rated to *[MIL-STD-810H](https://en.wikipedia.org/wiki/MIL-STD-810)* and starting at 0.977kg, which is absurdly light for a 14" machine. *Lenovo* did let it grow in one dimension though, as the *Carbon* is now a gentle wedge of roughly 7.7mm at the front to 17.6mm at the back. The 14th iteration is hence a notch chunkier toward the rear than the near-uniform *Gen 13*, which is a deliberate trade to make room for the bigger fans. The footprint is otherwise unchanged, so existing sleeves will probably still fit. The soft matte finish feels great, but I will [stickerbomb](/tag/stickerbomb/) it nevertheless, in an effort to camouflage my workstation as a somewhat unhinged comic book that nobody in their right mind would ever try to steal.

Going back to the *Space Frame* design, for someone whose past year has been defined by hardware failures, the *Lenovo* is ultimately a properly and easily repairable device, thanks to its new build. *iFixit* gave it a 9/10, all while, for context, the *MacBook Pro 14"* only scored a 4/10. And frankly on the *X1* the score seems well-deserved.

To get into the *Space Frame* you undo four screws, and the bottom comes off. The keyboard deck then lifts away magnetically, without the need for any tools. The battery comes out with a few screws and a connector that releases itself, while the SSD, the fans, the I/O ports and even the display assembly are all individually serviceable. *Lenovo* even publishes [step-by-step repair videos](https://support.lenovo.com/us/en/solutions/ht518609) with photos and difficulty ratings for each repair. After the *StarBook* saga, which ended with me [hunting down a CH341A programmer](https://github.com/StarLabsLtd/firmware/issues/396) and having to reach out to *Star Labs* directly to un-brick the thing, this properly documented *Lego-brick* serviceability, that actually has a replacement-parts market online and offline, is exactly what I wanted.

Battery
----------

[![](/lenovo-x1-carbon-gen-14-aura/images/lenovo-x1-carbon-gen-14-aura_1362_hu_dc74fe72e51641f7.webp)](/lenovo-x1-carbon-gen-14-aura/images/lenovo-x1-carbon-gen-14-aura_1362.jpg)

The battery is a 58Wh cell that is barely up from the *Gen 13*’s 57Wh, as *Lenovo* is seemingly leaning on *Panther Lake*’s efficiency rather than on capacity, and this is probably my second-biggest gripe. While it appears that in looping-video tests reviewers got anywhere from [9.5](https://www.youtube.com/watch?v=avrYHt3Ybf0) to [14](https://www.youtube.com/watch?v=aZAlRpIe5Q4) hours (depending on configuration and brightness) my realistic mixed working day in browsers and terminals lands around 6 to 7 hours. The moment I’m starting to compile things, however, this figure takes a nosedive to something closer to 2 to 3 hours.

58Wh is definitely on the small side for a 2026 flagship. However, with higher-density battery cells becoming available, an added lightweight power bank could be a viable compromise for days on which the integrated battery won’t last long enough, while still accounting for a total weight below that of your regular *T14*.

*Lenovo* bundles a relatively compact 65W USB-C brick that rapid-charges the cell to 80% in about an hour, and because it’s bog-standard USB-C PD, any charger or a dock pushing \>60W will run it at full performance.

### *“Why no Framework?”* ###

[![](/lenovo-x1-carbon-gen-14-aura/images/framework-computer_hu_c51bc7062d093d42.webp)](/lenovo-x1-carbon-gen-14-aura/images/framework-computer.png)

*“You wanted repairable and Linux-friendly, why not a Framework?”*, I hear you asking. It’s a fair question, and generally I would like the idea behind *Framework*’s computers to succeed. I would like to see a future in which you can put together your laptop the same way you do your standard ITX build. I would love to see independent manufacturers producing parts for laptops like the *Framework*, that would allow you to, I don’t know, replace the default keyboard with an *HHKB* variant, or that would make it possible to pick which processor, which RAM and which GPU you’d like to have in your device. And while *Framework* kind of built this *“ecosystem”* for themselves, six years into their saga the third-party components are still nowhere to be found, with a handful of exceptions which, however, are clearly driven by *Framework* (think the *Cooler Master* case or the *DeepComputing RISC-V* mainboard).

I don’t mean to rain on anyone’s parade here, but unless the ecosystem broadens significantly, so that users can find third-party expansion cards, and mainboards, and keyboards, and macropads, and graphics modules, and are not dependent solely on *Framework* (a company that *might* at some point *enshittify*), I don’t quite see the point of putting up with a device that is significantly bulkier, has had an [inferior](https://community.frame.work/t/long-time-owners-what-are-your-impressions-on-the-build-quality-and-feel/59195) [build](https://www.reddit.com/r/framework/comments/1j7upe8/are_framework_laptops_built_welly/) [quality](https://www.reddit.com/r/framework/comments/1ekyopv/framework_build_quality/) and comes with [its](https://www.reddit.com/r/framework/comments/se698c/what_are_your_major_criticisms_of_the_framework/) [fair](https://community.frame.work/t/my-framework-16-experience-has-been-unstable-how-has-yours-been/65393) [share](https://linustechtips.com/topic/1585979-framework-is-still-very-much-bleeding-edge-and-i-cant-reccommend-it-anymore/) [of](https://community.frame.work/t/fw-16-review-the-good-the-bad-the-ugly/56831) [issues](https://www.trustpilot.com/review/frame.work).

However, none of this would have been a true deal-breaker for me, if it wasn’t for *Framework* supporting a [seventh-grade computer science project](/a-word-on-omarchy/#summary) over **actual** Linux distributions, which cooled my enthusiasm considerably. Because let’s be real, when comparing purely the hardware itself, the new *Framework Laptop 13 Pro* seems like a legitimately good machine, despite its soulless *Apple*-esque aesthetic. The *X7 Panther Lake* option that comes with a modular *LPCAMM2* RAM definitely beats *Lenovo*’s soldered memory outright, and the brighter 700-nit display might also work better than the *X1* in outdoor environments, despite it not being as beautiful to look at as *Lenovo*’s OLED. Lastly, the 74Wh battery of the *Framework* packs significantly more juice into the *13 Pro*, which is definitely a plus over the lightweight 58Wh of the *X1 Carbon*.

Apart from that, however, I’d like to think that the build quality and specifically the *weight-to-power ratio* of the *Gen 14* *Lenovo* remains superior to the *Framework Laptop 13 Pro*. And yes, this is subjective, but the *X1 Carbon* is simply the *nicer device* when compared to the *Framework*, with its expansion-card slots, visible seams and sort-of *makeshift* aesthetic. The *ThinkPad*, with its clean lines and total absence of visual clutter looks and feels like a finished, more premium product. And with around 400g less in weight than the *Framework 13 Pro*, which also happens to be noticeably thicker, the *X1* is more of the type of device that I don’t mind [carrying around](/travel/).

Linux
----------

[![](/lenovo-x1-carbon-gen-14-aura/images/lenovo-x1-carbon-gen-14-aura_1376_hu_31528305036d962e.webp)](/lenovo-x1-carbon-gen-14-aura/images/lenovo-x1-carbon-gen-14-aura_1376.jpg)

Now, as for Linux compatibility, it turns out that *Panther Lake* is, somewhat surprisingly, in excellent shape on Linux. *Phoronix* ran the *X7 358H* through [around 300 benchmarks on Ubuntu 26.04 with the Linux 6.19 kernel](https://www.phoronix.com/review/intel-core-ultra-x7-358h-linux) and found it already *“in very good shape for both performance and power efficiency, exceeding expectations […] relative to prior generation Intel laptop processors as well as the AMD Strix Point competition”*. For a brand-new architecture, that is about as good a verdict as you can hope for, and it matches my experience with the newer 7.x kernels.

A few things that I’ve stumbled upon during my first few weeks with the *Lenovo* that still need to be sorted out are …

* … as mentioned before, the webcam that doesn’t seem to work yet and that reports as follows in `dmesg`:

  ```
  intel_ipu7_isys: module is from the staging directory, the quality is unknown, you have been warned.
  intel-ipu7 0000:00:05.0: no subdev found in graph

  ```

* … *some* issue with the *UCSI* power supply code, which is reported in `dmesg` as follows:

  ```
  ucsi_acpi USBC000:00: UCSI_GET_PDOS failed (-70)
  ucsi_acpi USBC000:00: UCSI_GET_PDOS failed (-70)
  ucsi_acpi USBC000:00: GET_CABLE_PROPERTY failed (-95)
  ucsi_acpi USBC000:00: GET_CABLE_PROPERTY failed (-95)
  ucsi_acpi USBC000:00: UCSI_GET_PDOS failed (-70)

  ```

* … some GPU engine resets every once in a while, reported as:

  ```
  xe 0000:00:02.0: [drm] Tile0: GT0: Engine reset: engine_class=rcs ...
  Timedout job: ... in sway [8925]
  Xe device coredump has been created

  ```

* … an audio issue where there’s a ton of noise over the 3.5mm jack as soon as any sound plays, but which instantly stops when the audio stops. I cross-tested this under *Windows 11* and experienced the exact same effect, so maybe it’s not at all a Linux issue, but more like a hardware or firmware issue. Luckily, I can work around this issue by using my [DAC](/audio/#dac) or my [audio interface](/audio/#motu-m2).

[![](/lenovo-x1-carbon-gen-14-aura/images/fastfetch_hu_14ad36c61a37d8f.webp)](/lenovo-x1-carbon-gen-14-aura/images/fastfetch.png)

For anyone considering this machine for Linux, you’ll want a recent Kernel version. *Panther Lake* support landed and matured around Linux 6.19 / 7.x, so don’t try to run this on some ancient *eNtErPrIsE* LTS kernel and expect the *Xe3* graphics or power management to behave. Speaking of which, the *Xe3* iGPU uses the modern `xe` DRM driver and the *Intel* Mesa stack. On [Wayland/Sway](/minimalist-and-functional-desktop-environment-without-xorg/) it’s been *almost* flawless and does everything, from hardware acceleration, to external displays.

### Migration ###

[![](/lenovo-x1-carbon-gen-14-aura/images/lenovo-x1-carbon-gen-14-aura_1334_hu_4ab6634b670b8663.webp)](/lenovo-x1-carbon-gen-14-aura/images/lenovo-x1-carbon-gen-14-aura_1334.jpg)

The actual switch from the *StarBook* to the *ThinkPad* was almost painless, which is the highest praise I can give it. With the [hardened Gentoo](/hardened-gentoo-with-full-disk-encryption-on-the-star-labs-starbook-mk-vi/) that I’m running the *“migration”* consisted of basically 1. taking the [*SK hynix P31*](#storage) out of the *StarBook*, 2. putting it into the *ThinkPad*, 3. and booting (and 4. recompiling the whole system *\*cough\**).

The one sensible precaution I took was switching from my hand-rolled, hardware-specific kernel to Gentoo’s pre-built binary kernel on the latest Linux 7.x series for the move. A distribution kernel ships with essentially every important driver, so it doesn’t care that it suddenly woke up on completely different silicon.

Once I’d confirmed everything worked, I could go back to trimming the kernel down at my leisure. My [Sway/Wayland setup](/minimalist-and-functional-desktop-environment-without-xorg/), my [dotfiles](https://codeberg.org/mrus/dotfiles) and my entire terminal-centric workflow are deliberately [system-agnostic](/updates-2026-q2/), so beyond the kernel swap there was *almost* nothing to reconfigure.

Where it did take a little while, though, was the rebuild. My system had been optimised for *Zen 3* (the *StarBook*’s *Ryzen*) which means the entire thing had been compiled with `-march=znver3`. So I changed the `march` flag to suit the new *Panther Lake* and rebuilt the whole system from scratch with the usual `emerge --ask --emptytree --newuse --keep-going --verbose --deep @world` command, which amounted to somewhere around 1600 packages churning through the compiler before everything was once again native to the hardware it was actually running on.

**Note:** The system ran just fine on the *Panther Lake*, despite having been compiled with Zen 3 architecture optimizations, with the exception of browsers (*Ungoogled Chromium*, *LibreWolf*). Those would suffer from crashing tabs all the time, with a corresponding `trap invalid opcode` in `dmesg`. However, it is nevertheless a good idea to rebuild the whole system, rather than only the obviously affected packages, to avoid any surprises down the road.

On top of that there were some hardware-specific bits to sort out. I had to install additional firmware (`sof-firmware`, `intel-microcode`), and I had to migrate from `amdgpu` to `intel` in `VIDEO_CARDS` for packages like `mesa` and `libdrm` to use the *Intel* hardware, and I also needed the `libva-intel-media-driver` package.

Firmware
----------

[![](/lenovo-x1-carbon-gen-14-aura/images/lenovo-x1-carbon-gen-14-aura_1332_hu_391baef47fac815c.webp)](/lenovo-x1-carbon-gen-14-aura/images/lenovo-x1-carbon-gen-14-aura_1332.jpg)

Now for the part that, as a [privacy-focused](/tag/privacy/) user, is pretty bad.

The *X1 Carbon Gen 14* runs *Lenovo*’s proprietary UEFI firmware, and the *Intel Management Engine* is present and active. There is no *Coreboot* port for this machine, and there almost certainly never will be.

This was, hands down, the hardest pill to swallow. One of the few things the [*StarBook* promised](/a-brief-review-of-the-star-labs-starbook-mk-vi-ryzen-ultrabook/) (even if *Star Labs* took actual years to ship the first version for AMD) was an eventual *Coreboot* path. On the *Lenovo*, however, you are trusting a closed firmware blob and a processor with a co-processor, engineered by a company that is [partially owned by the US government](https://www.intc.com/news-events/press-releases/detail/1748/intel-and-trump-administration-reach-historic-agreement-to), that you cannot audit, sitting below your operating system, with its own network-capable stack, that was built by a [Chinese company](https://www.darkreading.com/threat-intelligence/millions-of-lenovo-laptops-contain-firmware-level-vulnerabilities).

*Lenovo* specifically does not have a spotless record here. This is the company that shipped the [*Superfish*](https://en.wikipedia.org/wiki/Superfish) adware with a self-signed root CA that actively broke TLS on consumer machines in 2015, and that same year was caught using the [*Lenovo Service Engine*](https://en.wikipedia.org/wiki/Lenovo#Lenovo_Service_Engine) firmware mechanism (via Windows' *WPBT*) to silently reinstall software from the BIOS. To be fair, both of those scandals hit the consumer *IdeaPad*/*Yoga* lines rather than the business *ThinkPads*, and they’re a decade old, but they’re a reminder of what this vendor can do when seemingly nobody’s watching.

Of course this is not unique to *Lenovo* and the exact same *IME*-and-no-*Coreboot* reality applies to that *Framework* I was just comparing it to, to the *ASUS* I was chasing, and to essentially every modern x86 laptop you can actually buy and use as a daily driver in 2026. There is no liberated, *Coreboot*-running, *ME*-less machine with a current CPU, a 2.8K OLED and worldwide service. You either run a decade-old *ThinkPad* as a matter of principle, or you make peace with the fact that the firmware layer is a compromise and that you simply [cannot guarantee to not be compromised](/how-do-you-trust-that-your-personal-machine-is-not-compromised/).

If a fully open firmware stack is a hard requirement for you, then this laptop, like nearly all of its contemporaries, will disappoint you, and it’ll likely not be for you.

Price
----------

[![](/lenovo-x1-carbon-gen-14-aura/images/lenovo-x1-carbon-gen-14-aura_1379_hu_dba3dbc652f3146a.webp)](/lenovo-x1-carbon-gen-14-aura/images/lenovo-x1-carbon-gen-14-aura_1379.jpg)

None of this is cheap, and the ongoing [hardware crisis](/hold-on-to-your-hardware/) hasn’t helped. Pricing starts at around $2,000 for a *Core Ultra 5* with the FHD IPS panel, a configuration like mine lands well above that, with maxed-out units sailing confidently past the $3,000-mark. I was lucky to get a good deal (relatively speaking) on my specific device, but ultimately paying top money for a 32GB, soldered-RAM machine still stings. However, [as I explained](/updates-2026-q1/), after the year I’ve had, *reliability and serviceability* were worth the premium to me.

Verdict
----------

[![](/lenovo-x1-carbon-gen-14-aura/images/lenovo-x1-carbon-gen-14-aura_1326_hu_851a0d328e64509d.webp)](/lenovo-x1-carbon-gen-14-aura/images/lenovo-x1-carbon-gen-14-aura_1326.jpg)

The *ThinkPad X1 Carbon Gen 14 Aura Edition* is not the laptop I would buy in a perfect world. In a perfect world I would get something with user-replaceable RAM, a bigger battery and an open firmware stack with no *Management Engine* lurking beneath it. All of that ideally designed and at least partially manufactured by a European company that could potentially tip the global scales away from the US/China duopoly.

But we don’t live in that world, and given the options that actually exist, this is the most *sensible* machine that would fit my life right now. It’s astonishingly light, the OLED is gorgeous, *Panther Lake* is fast and efficient on Linux, the *Space Frame* makes it repairable, and there’s an authorised service centre for it on every continent I’m likely to find myself on. After the year of hardware attrition I’ve had, *boring reliability* and *serviceability anywhere* turned out to be the features I valued most.

If the *StarBook* was the *dreamy* choice, that dream ended in continuous glitches and ultimately [a CH341A programmer](https://github.com/StarLabsLtd/firmware/issues/396). This is now the pragmatic choice where the *Lenovo* is the tool that *just works* and it (hopefully) continues to do so for the foreseeable future.

**PS:** Make sure to check [future updates](/collection/updates/) if you’re interested about the long-term experience with the *Lenovo X1 Carbon*.