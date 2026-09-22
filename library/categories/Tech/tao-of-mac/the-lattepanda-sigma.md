+++
title = "The LattePanda Sigma"
description = "Following up on my testing of the LattePanda Mu and IOTA, this time I’m looking at the [Sigma](https://www.lattepanda.com/lattepanda-sigma?utm_campaign=unsolicited_traffic&ut"
date = "2026-09-13T17:00:00Z"
url = "https://taoofmac.com/space/reviews/2026/09/13/1700?utm_content=atom"
author = "Rui Carmo"
text = ""
lastupdated = "2026-09-21T09:42:47.689904668Z"
seen = false
+++

Following up on my testing of the LattePanda [Mu](/space/reviews/2025/08/11/2100#the-lattepanda-mu) and [IOTA](/space/reviews/2025/11/09/1930#the-lattepanda-iota), this time I’m looking at the [Sigma](https://www.lattepanda.com/lattepanda-sigma?utm_campaign=unsolicited_traffic&utm_medium=web&utm_source=taoofmac.com), which (as is becoming the norm with my recent pieces) I actually got before summer break.

I wanted to have a look at it because it is something else again in the LattePanda universe: consider a laptop-class Intel motherboard with the case, keyboard, and display removed, but with more accessible I/O than most mini-PCs, and you’re close enough:

<img src="/space/reviews/2026/09/13/1700/sigma-box.jpg?v=4fe5c08a0b62" alt="LattePanda Sigma retail box" width="2048" height="1152"> LattePanda Sigma retail box.

And it doesn’t stop at I/O: the [Sigma](https://www.lattepanda.com/lattepanda-sigma?utm_campaign=unsolicited_traffic&utm_medium=web&utm_source=taoofmac.com) I’ve been testing has a [Core i5-1340P](https://ark.intel.com/content/www/us/en/ark/products/232126/intel-core-i51340p-processor-12m-cache-up-to-4-60-ghz.html?utm_campaign=unsolicited_traffic&utm_medium=web&utm_source=taoofmac.com) and 32 GB of soldered LPDDR5 (which is probably worth its price in gold right now), making it probably the most powerful “single board computer” I’ve ever used.

>
>
> **Disclaimer:** [DFRobot](https://www.dfrobot.com?utm_campaign=unsolicited_traffic&utm_medium=web&utm_source=taoofmac.com) was, again, kind enough to send me a [Sigma](https://www.lattepanda.com/lattepanda-sigma?utm_campaign=unsolicited_traffic&utm_medium=web&utm_source=taoofmac.com) free of charge, and as usual, this article follows my [review policy](/space/site/review_policy#review-policy).
>
>

Even though I generally prefer ARM and AMD for that, there is *a lot* of Intel hardware in industrial manufacturing, and I see i5 factory floor machines starting to crop up as replacements for older generations already.

But besides summer break, one of the reasons this post is a tad long is that I took a, well… *long* look at how to use the Xe iGPU for inference, because I realized [`llama.cpp`](https://github.com/rcarmo/llama-cpp?utm_campaign=unsolicited_traffic&utm_medium=web&utm_source=taoofmac.com) has an absurdly large range of techniques baked into it that are a cut above what I have on [`go-pherence`](https://github.com/rcarmo/go-pherence?utm_campaign=unsolicited_traffic&utm_medium=web&utm_source=taoofmac.com)–and why not learn from that?

[

Hardware
----------

](/space/reviews/2026/09/13/1700#hardware)

At 146x102mm, the [Sigma](https://www.lattepanda.com/lattepanda-sigma?utm_campaign=unsolicited_traffic&utm_medium=web&utm_source=taoofmac.com) is quite a bit larger than the [IOTA](/space/reviews/2025/11/09/1930#the-lattepanda-iota) and the [Mu](/space/reviews/2025/08/11/2100#the-lattepanda-mu) Lite Carrier and feels much more like an industrial motherboard than a hobbyist SBC.

The board is built around Intel’s [Core i5-1340P](https://ark.intel.com/content/www/us/en/ark/products/232126/intel-core-i51340p-processor-12m-cache-up-to-4-60-ghz.html?utm_campaign=unsolicited_traffic&utm_medium=web&utm_source=taoofmac.com), which was originally meant as a mobile CPU (hence its 28W rating), but LattePanda designed the cooler for a sustained 44W configuration, and that is definitely the first thing you’ll notice when you pick it up:

<img src="/space/reviews/2026/09/13/1700/sigma-aluminium-base.jpg?v=f9103c8c88ea" alt="The single-piece aluminium base of the Sigma" width="2048" height="1152"> The single-piece aluminium base of the Sigma.

I must say that having the whole thing bolted to an aluminium slab actually made it quite nice to test, since I didn’t have to worry about getting loose screws or other parts under it.

[

### Specs and Features ###

](/space/reviews/2026/09/13/1700#specs-and-features)

Removing the aluminium base reveals the mainboard and its components quite clearly, in a very neat layout:

<img src="/space/reviews/2026/09/13/1700/sigma-board-underside.jpg?v=7f68354f8ffd" alt="Underside of the Sigma board with M.2 slots, RTC battery and expansion headers" width="2048" height="1152"> Underside of the Sigma board with M.2 slots, RTC battery and expansion headers.

And yet, there is a lot going on here that is not immediately obvious from the outside or underside:

* [Core i5-1340P](https://ark.intel.com/content/www/us/en/ark/products/232126/intel-core-i51340p-processor-12m-cache-up-to-4-60-ghz.html?utm_campaign=unsolicited_traffic&utm_medium=web&utm_source=taoofmac.com), with 4 P-cores, 8 E-cores, 16 threads and 12 MB cache
* 32 GB LPDDR5-6400, shared with the Iris Xe GPU–one of the things I really like about this board.
* two M.2 M-key slots, one PCIe 4.0 x4 and one PCIe 3.0 x4
* two 2.5GbE ports (based on Intel I226-V)
* two Thunderbolt 4 ports, as well as HDMI 2.1 and eDP 1.4b
* an M.2 E-key for Wi-Fi/Bluetooth and an additional B-key slot with SATA, PCIe, USB and SIM connectivity (you get some nice thermal pads in the box, too)
* SATA, internal USB, front-panel, audio and serial headers
* A barrel jack for 19V power input (the supplied PSU is rated for 90W, which is plenty of headroom, as we’ll see)
* and, finally, an onboard ATmega32U4-compatible LattePanda Leonardo for GPIO, PWM, analogue input, UART, I2C and SPI (which I didn’t test beyond the `hello world` check below)

This is also a slightly beefier i5 than I’ve seen before–as an example, compared with the [i5-1235U](https://ark.intel.com/content/www/us/en/ark/products/226261/intel-core-i51235u-processor-12m-cache-up-to-4-40-ghz.html?utm_campaign=unsolicited_traffic&utm_medium=web&utm_source=taoofmac.com) in the [TerraMaster F4-424 Max](/space/blog/2024/12/26/2330#the-terramaster-f4-424-max), the [i5-1340P](https://ark.intel.com/content/www/us/en/ark/products/232126/intel-core-i51340p-processor-12m-cache-up-to-4-60-ghz.html?utm_campaign=unsolicited_traffic&utm_medium=web&utm_source=taoofmac.com) adds 2 extra P-cores and 4 threads, keeping the 80 execution units in the Xe graphics unit.

[

### Initial Setup and Connectivity ###

](/space/reviews/2026/09/13/1700#initial-setup-and-connectivity)

For my tests, I dug out a 1 TB WD Blue drive and an Intel AX210 Wi-Fi 6E/Bluetooth module.

The latter worked so well that I ended up freeing the Ethernet ports and just letting the [Sigma](https://www.lattepanda.com/lattepanda-sigma?utm_campaign=unsolicited_traffic&utm_medium=web&utm_source=taoofmac.com) work wirelessly (at a link rate of 1.2Gbps), but that is why you can see the Bluetooth device in what otherwise is a pretty sparse USB inventory:

```
# lsusb
Bus 001 Device 001: ID 1d6b:0002 Linux Foundation 2.0 root hub
Bus 002 Device 001: ID 1d6b:0003 Linux Foundation 3.0 root hub
Bus 003 Device 001: ID 1d6b:0002 Linux Foundation 2.0 root hub
Bus 003 Device 002: ID 3343:803a Unknown LattePanda Leonardo
Bus 003 Device 003: ID 8087:0032 Intel Corp. AX210 Bluetooth
Bus 004 Device 001: ID 1d6b:0003 Linux Foundation 3.0 root hub

```

And yes, there’s a [Leonardo](https://docs.arduino.cc/hardware/leonardo/?utm_campaign=unsolicited_traffic&utm_medium=web&utm_source=taoofmac.com) in the USB inventory.

This mix of standard Intel devices and a small onboard microcontroller is still one of LattePanda’s better ideas, and makes it appealing for industrial devices: the host can run an ordinary operating system while the microcontroller handles timing-sensitive tasks and GPIO independently.

As to the PCI bus, I would call it… unashamedly Intel?

```
# lspci
00:02.0 VGA compatible controller: Intel Corporation Raptor Lake-P Iris Xe Graphics
01:00.0 Ethernet controller: Intel Corporation Ethernet Controller I226-V
02:00.0 Ethernet controller: Intel Corporation Ethernet Controller I226-V
03:00.0 Network controller: Intel Corporation Wi-Fi 6E AX210/AX1675 2x2
58:00.0 Non-Volatile memory controller: Sandisk Corp WD Blue SN580 NVMe SSD

```

[

### Storage ###

](/space/reviews/2026/09/13/1700#storage)

I didn’t use the SATA interface for testing, and the WD Blue SN580 I used through the PCIe 4.0 M-key slot behaved as expected, but for the sake of thoroughness, I still wanted to document its performance here using `fio` benchmarks:

|             Workload              |      Result       |p99 completion latency|
|-----------------------------------|-------------------|----------------------|
|   Sequential write, 1MiB, QD32    |     4.11GB/s      |       10.68ms        |
|    Sequential read, 1MiB, QD1     |     2.63GB/s      |        0.57ms        |
|    Sequential read, 1MiB, QD32    |     3.95GB/s      |       10.03ms        |
|      Random read, 4KiB, QD1       |    10.65k IOPS    |        0.15ms        |
|      Random read, 4KiB, QD32      |   248.95k IOPS    |        0.33ms        |
|Random 70/30 read/write, 4KiB, QD32|173.84k/74.55k IOPS|     0.62/0.16ms      |

Nothing unexpected here. I didn’t do a test across more than one slot (NVMes are too precious to wear down on purpose these days), so these figures are for the PCIe 4.0 slot only.

[

### Networking ###

](/space/reviews/2026/09/13/1700#networking)

Both I226-V interfaces use `igc` and advertise 10/100/1000/2500Mbit/s modes, and I had zero issues saturating the links during my tests. By now, 2.5GbE is just rock solid for most local network tasks, the Intel implementation is reliable, and I wouldn’t hesitate to rely on it for demanding workloads. The only reason I switched to my own Wi-Fi 6E card was because it was a bit more convenient and I could get possible fan noise further away from my desk while I tested thermals.

[

### Thermals ###

](/space/reviews/2026/09/13/1700#thermals)

And speaking of that, as you may have seen from the box shot, the board is dominated by its large heatsink and cooling assembly, which covers the CPU and other critical components:

<img src="/space/reviews/2026/09/13/1700/sigma-heatsink.jpg?v=670b0b6eedb9" alt="LattePanda Sigma board with large heatsink and cooling assembly" width="2048" height="1152"> LattePanda Sigma board with large heatsink and cooling assembly.

The only criticism I have of the design is that the slight slope on the heatsink (seen above on the left side of the photo) might make it a bit tricky to design a case that fits snugly (or connects the exhaust to the outside, like I did for the [Mu](/space/reviews/2025/08/11/2100#the-lattepanda-mu)) and has the potential to turn into a dust trap over time, but otherwise the cooling solution appears very effective indeed.

Neither `sensors` nor `/sys/class/thermal` worked as I expected at first, but `turbostat` could read the processor MSRs and supplied package/core temperatures, effective frequency, package power and hardware throttle counters. But after yelling at `rpm-ostree` for a bit, I got some very usable temperature data anyway:

```
# sensors
wlwifi_1-virtual-0
Adapter: Virtual device
temp1:        +39.0°C

lattepanda_sigma_ec-isa-0000
Adapter: ISA adapter
CPU Fan:     1497 RPM
Board Temp:   +36.0°C
CPU Temp:     +43.0°C

acpitz-acpi-0
Adapter: ACPI interface
temp1:        +27.8°C

coretemp-isa-0000
Adapter: ISA adapter
Package id 0:  +41.0°C  (high = +100.0°C, crit = +100.0°C)
Core 0:        +34.0°C  (high = +100.0°C, crit = +100.0°C)
Core 4:        +36.0°C  (high = +100.0°C, crit = +100.0°C)
Core 8:        +37.0°C  (high = +100.0°C, crit = +100.0°C)
Core 12:       +35.0°C  (high = +100.0°C, crit = +100.0°C)
Core 16:       +39.0°C  (high = +100.0°C, crit = +100.0°C)
Core 17:       +39.0°C  (high = +100.0°C, crit = +100.0°C)
Core 18:       +39.0°C  (high = +100.0°C, crit = +100.0°C)
Core 19:       +39.0°C  (high = +100.0°C, crit = +100.0°C)
Core 20:       +39.0°C  (high = +100.0°C, crit = +100.0°C)
Core 21:       +39.0°C  (high = +100.0°C, crit = +100.0°C)
Core 22:       +39.0°C  (high = +100.0°C, crit = +100.0°C)
Core 23:       +39.0°C  (high = +100.0°C, crit = +100.0°C)

nvme-pci-5800
Adapter: PCI adapter
Composite:    +34.9°C  (low  = -40.1°C, high = +83.8°C)
                       (crit = +87.8°C)
Sensor 1:     +45.9°C  (low  = -273.1°C, high = +65261.8°C)
Sensor 2:     +34.9°C  (low  = -273.1°C, high = +65261.8°C)

```

This was something I wanted to check because the fan was not inaudible (worst case was a persistent whooshing noise, with zero whine), but quiet enough at times for me to wonder if it was on. There’s no stall sensor, apparently, so you can’t directly detect if the fan is stuck or not spinning, but you can still monitor its RPM–and the reason I care about it is that fan monitoring is useful in industrial environments to detect fan failures.

#### Sustained Load ####

While doing benchmarks I left `intel_pstate`, the `powersave` governor and firmware power limits unchanged, and collected `turbostat` samples every two seconds through a set of CPU, memory, storage and media runs. And since I did everything in sequence with minimal (but realistic) cooldown periods between runs, the resulting data was so nice that I decided to keep it all in one chart:

![LattePanda Sigma package and core temperatures, busy CPU frequency and package power across the benchmark window](/space/reviews/2026/09/13/1700/sigma-thermal-profile.svg?v=b0dfc24c3737) `turbostat` readings every two seconds throughout the benchmark run. Power figures cover the CPU package only.

Low-power operation is amazingly good–the system idles at 39.5C and 2.0W package power, jumping up to 54C and 19.1W (and back down) as needed. During sustained 7-Zip, package temperature averaged 81.3C and peaked at 89C, with power averaging 33.5W and peaking at 39.2W.

At the wall, I measured roughly 44.0W max consumption (including the rest of the system, of course, which the CPU telemetry doesn’t account for).

But (and another reason why I find newer Intel silicon so impressive, and am hoping to look at the Ultra series next), I was actually surprised there was *no real throttling*. On an i5, which typically would start throttling under sustained load at high temperatures.

Yes, there was a plateau (3.72GHz, give or take), but neither the core nor package hardware throttle counter changed during the entire sweep, and no kernel thermal warnings appeared.

[

Software
----------

](/space/reviews/2026/09/13/1700#software)

Since the [Sigma](https://www.lattepanda.com/lattepanda-sigma?utm_campaign=unsolicited_traffic&utm_medium=web&utm_source=taoofmac.com) fits a rather broad range of applications between a personal workstation and a beefy low-power server, I started with the workstation part (by installing [Fedora](/space/os/linux/distributions/fedora), where I did most of my testing) and, later on, popped in a second SSD with [Proxmox](/space/os/linux/distributions/proxmox#proxmox-ve) to try it out both as a Debian box and as a server.

As you’d expect, both Fedora and Proxmox were completely uneventful to set up, but each is worth a few notes.

[

### Fedora Silverblue ###

](/space/reviews/2026/09/13/1700#fedora-silverblue)

Back in June, I landed on Fedora Silverblue 44 with kernel 7.1.5, which had full support for everything: the Iris Xe uses `i915`, both I226-V Ethernet controllers use `igc`, and the CPU runs under `intel_pstate`. But, more importantly, *I got a completely stable Vulkan stack* for my compute experiments.

There were no vendor kernels, board-specific image builders or mystery boot partitions involved, so the contrast with the ARM boards I keep testing is almost comical.

And yes, Thunderbolt worked fine too, as did the [Leonardo](https://docs.arduino.cc/hardware/leonardo/?utm_campaign=unsolicited_traffic&utm_medium=web&utm_source=taoofmac.com) when I did a little `hello world` test–but I did not test them thoroughly yet.

[

### Proxmox ###

](/space/reviews/2026/09/13/1700#proxmox)

This was by far the easiest installation, because, well, I cheated.

I had previously installed [Proxmox](/space/os/linux/distributions/proxmox#proxmox-ve) on the [IOTA](/space/reviews/2025/11/09/1930#the-lattepanda-iota) for testing before using its internal eMMC instead, so I just popped that SSD into the [Sigma](https://www.lattepanda.com/lattepanda-sigma?utm_campaign=unsolicited_traffic&utm_medium=web&utm_source=taoofmac.com) (with a 3D-printed jig to hold the half-length board in place) and, as you’d expect, everything worked perfectly.

With 32GB RAM, two extra P-cores and dual 2.5GbE, this is a *really good* home server, especially considering the power envelope, so it was a no-brainer to temporarily migrate over a few of the things I am running on the [Terraserver](/space/blog/2024/12/26/2330#the-terramaster-f4-424-max):

* My [Gitea](/space/apps/gitea) instance and two of the CI/CD workers (the other two run on [`borg`](/space/blog/2023/02/18/1845#borg-my-post-pandemic-homelab-server), on-demand)
* The main [`piclaw`](https://rcarmo.github.io/projects/piclaw/?utm_campaign=unsolicited_traffic&utm_medium=web&utm_source=taoofmac.com) development instance, which is constantly rebuilding itself
* The test [Jellyfin](https://jellyfin.org/?utm_campaign=unsolicited_traffic&utm_medium=web&utm_source=taoofmac.com) LXC I have been using to develop [`jellyfin-livetube`](https://github.com/rcarmo/dotnet-jellyfin-livetube?utm_campaign=unsolicited_traffic&utm_medium=web&utm_source=taoofmac.com), which, despite not having local access to the ZFS video storage, performed just as well over Wi-Fi 6 (it is, after all, using a nearly identical Intel Xe chipset, and the network overhead is minimal).
* The test instance for [`wrdp`](https://github.com/rcarmo/wrdp?utm_campaign=unsolicited_traffic&utm_medium=web&utm_source=taoofmac.com), which also had zero issues serving Wayland desktops using H.264 acceleration.

[

### Media Acceleration ###

](/space/reviews/2026/09/13/1700#media-acceleration)

This deserves a little more digging into, since VA-API can be fiddly to set up, and getting it to work correctly with Fedora’s media packages when I booted back into it required some tweaks.

In the initial test installation, Fedora’s default `ffmpeg-free` build disabled the native H.264 and HEVC decoders, so hardware acceleration was effectively unavailable–no H.264, HEVC or even AV1 in sight.

Debian (in the [Jellyfin](https://jellyfin.org/?utm_campaign=unsolicited_traffic&utm_medium=web&utm_source=taoofmac.com) LXC container inside [Proxmox](/space/os/linux/distributions/proxmox#proxmox-ve)) “just worked”, which was annoying, so I went back to the all-Fedora setup and got H.264 acceleration working using `rpm-fusion`.

All around, transcoding 4K content was smooth and didn’t tax the CPU significantly (depending on the particular codec combo, of course, since audio tends to be piped through the CPU). Multiple streams weren’t an issue, either.

In fact, I am currently using the [Sigma](https://www.lattepanda.com/lattepanda-sigma?utm_campaign=unsolicited_traffic&utm_medium=web&utm_source=taoofmac.com) as my reference machine to develop my [`wrdp`](https://github.com/rcarmo/wrdp?utm_campaign=unsolicited_traffic&utm_medium=web&utm_source=taoofmac.com) and [`go-264`](https://github.com/rcarmo/go-264?utm_campaign=unsolicited_traffic&utm_medium=web&utm_source=taoofmac.com) projects since it is already proving to be a very capable platform for media acceleration and transcoding tasks.

[

Raw Performance
----------

](/space/reviews/2026/09/13/1700#raw-performance)

One of the quirks of the [Sigma](https://www.lattepanda.com/lattepanda-sigma?utm_campaign=unsolicited_traffic&utm_medium=web&utm_source=taoofmac.com) is that the [i5-1340P](https://ark.intel.com/content/www/us/en/ark/products/232126/intel-core-i51340p-processor-12m-cache-up-to-4-60-ghz.html?utm_campaign=unsolicited_traffic&utm_medium=web&utm_source=taoofmac.com) has four performance cores with Hyper-Threading and eight efficiency cores without it–that’s 12 physical cores, not 16 equivalent ones. The E-cores are useful, but doubling the thread count doesn’t mean doubling the available compute: first you’re adding SMT threads to the same P-cores, then you’re bringing in a different class of core altogether.

7-Zip makes good use of the extra threads, but the “linear” scaling you’d hope for isn’t quite there.

![7-Zip compression, decompression and total rating in MIPS versus thread count](/space/reviews/2026/09/13/1700/sigma-7zip-thread-scaling.svg?v=976a1abcf36e) One P-core thread, four physical P-cores, four P-cores with SMT, and all P- and E-core threads, respectively.

|        Placement        |Threads|Compression|Decompression|Total rating|
|-------------------------|-------|-----------|-------------|------------|
|    One P-core thread    |   1   |5,232 MIPS | 4,334 MIPS  | 4,783 MIPS |
|  Four physical P-cores  |   4   |31,643 MIPS| 17,219 MIPS |24,431 MIPS |
|  Four P-cores with SMT  |   8   |41,456 MIPS| 24,791 MIPS |33,124 MIPS |
|All P- and E-core threads|  16   |62,266 MIPS| 43,702 MIPS |52,984 MIPS |

Going from four P-core threads to eight with SMT raises the total rating by only 36%, not 100%.

Adding the eight E-cores brings another 60%, so even though all 16 threads deliver the best result, they only manage about 2.2 times the throughput of four physical P-cores, despite having four times the thread count.

That’s useful extra performance, but it isn’t proportional scaling–and neither SMT threads nor E-cores truly replace physical P-cores. But for background workloads like what you’d have on a server or during heavy multitasking, the extra threads can still be beneficial.

As to RAM speed, the [Sigma](https://www.lattepanda.com/lattepanda-sigma?utm_campaign=unsolicited_traffic&utm_medium=web&utm_source=taoofmac.com)’s LPDDR5-6400 does not disappoint.

I pulled out a little memory bandwidth testing to see how the [Sigma](https://www.lattepanda.com/lattepanda-sigma?utm_campaign=unsolicited_traffic&utm_medium=web&utm_source=taoofmac.com) handles sustained data transfers–not just the peak theoretical numbers, but what it can actually deliver under load. After futzing around a bit, I hit upon a simple STREAM-style benchmark that uses three 256MiB arrays: Copy transfers data from one array to another, while Triad multiplies values from one array by a constant, adds values from a second, and writes the results to a third. The GB/s figures count the data read and written per second, showing the sustained memory bandwidth the CPU can actually achieve:

![Copy and Triad memory bandwidth in GB/s versus thread count](/space/reviews/2026/09/13/1700/sigma-memory-bandwidth.svg?v=8f827b829f42) Three 256MiB arrays, using one P-core thread, four physical P-cores, four P-cores with SMT, and all P- and E-core threads.

|        Placement        |  Copy   |  Triad  |
|-------------------------|---------|---------|
|    One P-core thread    |22.31GB/s|25.64GB/s|
|  Four physical P-cores  |55.11GB/s|51.93GB/s|
|  Four P-cores with SMT  |55.81GB/s|52.88GB/s|
|All P- and E-core threads|52.74GB/s|57.70GB/s|

Four P-cores already saturate the best copy result, so adding more threads doesn’t help much there. The E-cores add around 9% to the best Triad result (probably because they will lean heavily on cache), and it plateaus after that–but it’s nothing to sneeze at.

The upside is that, in practice, the CPU and Iris Xe share this 52-58GB/s pool–there is no separate GPU memory bottleneck, or a need to bucket data across a slow bus.

[

Local Inference
----------

](/space/reviews/2026/09/13/1700#local-inference)

This is, as usual, where I went totally overboard.

>
>
> **Update:** I have tidied up all the tests I did (many of which did not make it into this review, since they were exploratory) into [this set of documentation](https://github.com/rcarmo/llama-cpp/blob/master/docs/local/intel-i5-1340p/README.md?utm_campaign=unsolicited_traffic&utm_medium=web&utm_source=taoofmac.com) in my private `llama.cpp` fork, so if you want to reproduce any of this or look into the post-review iGPU work, this is where you will find it.
>
>

Based on older experiments on the [TerraMaster](/space/blog/2024/12/26/2330#the-terramaster-f4-424-max), I was expecting quite low performance (around 3 tokens/s by default), but I have been tweaking my own fork of [`llama.cpp`](https://github.com/rcarmo/llama-cpp?utm_campaign=unsolicited_traffic&utm_medium=web&utm_source=taoofmac.com), so I had [`piclaw`](https://rcarmo.github.io/projects/piclaw/?utm_campaign=unsolicited_traffic&utm_medium=web&utm_source=taoofmac.com) rebuild it with Clang 22, `-march=native`, AVX2 and AVX-VNNI support to take advantage of the new CPU features.

Then I downloaded the cool models *du jour* (`Gemma 4`, `Qwen 3.6` and `Ornith`–a biased `Qwen` derivative) and set up a little agentic test suite: Each candidate got the same repository-search agent task (sized to fit under 4K tokens), which prompted the model to do at least one tool call (which when successful was under 200 tokens):

![Prefill and generation throughput for three models on a controlled repository-search agent task](/space/reviews/2026/09/13/1700/sigma-llm-agent-workload.svg?v=f5da5f332819) Repository-search task results for models with both prefill and generation measurements.

This is effectively one-shotting a 4K context, and, overall, I can’t complain about the [Sigma](https://www.lattepanda.com/lattepanda-sigma?utm_campaign=unsolicited_traffic&utm_medium=web&utm_source=taoofmac.com) for this kind of workload:

|          Model          |  Selected CPU profile   |   Prefill    |  Generation  |
|-------------------------|-------------------------|--------------|--------------|
|      `Gemma 4 E4B`      |MTP-3, F16 KV, Flash off |61.19 tokens/s|25.30 tokens/s|
|    `Ornith 1.0 35B`     |MTP-2, F16 KV, Flash off |37.53 tokens/s|16.65 tokens/s|
|`Qwen3.6 35B-A3B Q2_K_XL`|MTP-3, Q4\_0 KV, Flash on|28.36 tokens/s|15.34 tokens/s|

`Gemma 4 E4B` was the obvious winner (as it tends to be in low-resource scenarios), and its performance advantage was clear both in prefill and generation throughput–but, most importantly, *it can do tool calls right*, which is not something every model can do (even though the other two did fine, `Gemma` is a bit more predictable at that at the expense of actual coding skills).

`Ornith` ingested prompts faster than `Qwen` and was slightly faster for short generation, while `Qwen` caught up somewhat in longer generation scenarios, but they’re fairly evenly matched.

[

### MTP and Other Knobs ###

](/space/reviews/2026/09/13/1700#mtp-and-other-knobs)

Then I began trying multi-token prediction (MTP) to see if it could improve throughput without sacrificing accuracy. If you’re new to this, MTP uses a draft head (i.e., a smaller “model”) to propose several tokens and lets the target model verify them together. It is not a generic “turbo” switch–the useful depth depends on the model, and more drafting can make things slower, but it can significantly boost throughput when used appropriately.

After a couple of hours of trial and error (and with longer prompts), I arrived at the following results:

|       Model        | Target only  |Best isolated MTP result|Selected depth|
|--------------------|--------------|------------------------|--------------|
|   `Gemma 4 E4B`    |12.69 tokens/s|     22.01 tokens/s     |      3       |
|  `Ornith 1.0 35B`  |12.80 tokens/s|     15.41 tokens/s     |      2       |
|`Qwen3.6 35B-A3B Q2`|11.04 tokens/s|     14.54 tokens/s     |      3       |

Then I started poking at other parameters–including stuff that affects memory usage and computational efficiency, and that doesn’t make sense in CPU-only scenarios. Also, I quickly realized that on this i5, the best way to maximize throughput was to carefully balance the load across the P-core SMT pairs (yes, you can do CPU pinning) without overwhelming the CPU–given what I got from the memory bandwidth tests, that was unsurprising.

But from a user perspective this is still essentially one-shotting prompts, which is cute but not very realistic for agents that need to maintain a large working context over time, so I froze a prompt at about 124K tokens and ran it through `Gemma` and `Ornith` in one 131,072-token slot:

![Prefill throughput, generation throughput and peak proportional memory use for Gemma, Ornith and Qwen near their tested context limits](/space/reviews/2026/09/13/1700/sigma-llm-near-capacity.svg?v=f22576df71bd) `Gemma` and `Ornith` used comparable prompts of around 124K tokens. `Qwen` topped out at 99,104, so its timings are for a shorter prompt.

This was a lot more interesting, and a trifle hotter than the earlier one-shot tests (fortunately, again, the CPU did not actually throttle):

|       Model        |Prompt tokens|   Prefill    | Generation  |Peak PSS|Peak temperature|
|--------------------|-------------|--------------|-------------|--------|----------------|
|   `Gemma 4 E4B`    |   124,112   |22.49 tokens/s|4.49 tokens/s|10.9GiB |      90C       |
|  `Ornith 1.0 35B`  |   124,341   |13.14 tokens/s|2.63 tokens/s|23.3GiB |      91C       |
|`Qwen3.6 35B-A3B Q2`|   99,104    |4.58 tokens/s |2.10 tokens/s|13.4GiB |      90C       |

The thing is, even though `Gemma` and `Ornith` handled the large context without crashing, the generation speed dropped significantly as the context grew. `Gemma` took up less RAM (and sweeping through weights in RAM more efficiently is, ultimately, why it was able to maintain higher throughput), but for coding tasks that require frequent context updates, this is not really a usable speed–consider it the extreme end of what one might tolerate interactively, and yet perfectly good for batch processing or long-form generation where latency is less critical.

[

### Iris Xe Offload ###

](/space/reviews/2026/09/13/1700#iris-xe-offload)

This did not go as expected. I’m used to seeing some improvement with GPU offload, especially for prompt ingestion, but the Iris Xe behaved differently, and I’ve yet to pin down exactly why (but I have some theories).

First of all, there are two main ways to do compute on the Iris Xe: using Vulkan for explicit GPU offload, or using SYCL for a more integrated approach with the CPU. And… they are both quirky, and (initially) worse than the CPU:

![Separate comparisons of CPU versus Vulkan synthetic Qwen probes and CPU versus SYCL on the original Gemma and Ornith agent task](/space/reviews/2026/09/13/1700/sigma-llm-backends.svg?v=1948cc26b6e0) Each pair compares CPU and GPU results from the same test. The panels use different tests and scales.

So I just filed that away for future investigation and tried to squeeze more performance out of the CPU path instead.

[

### Going Split Brain ###

](/space/reviews/2026/09/13/1700#going-split-brain)

When I came back to this in September, I decided to use a trick that works well with discrete GPUs: let Vulkan handle prefill, then stop the GPU worker and hand the cached state over to the CPU for generation with MTP. This was a particularly fun trick to pull on the [Sigma](https://www.lattepanda.com/lattepanda-sigma?utm_campaign=unsolicited_traffic&utm_medium=web&utm_source=taoofmac.com), because:

* Vulkan handles the heavy lifting for the initial prefill, which is usually the most computationally expensive part.
* I can just *copy across stuff* to the CPU in this architecture, without a transfer across PCIe from discrete GPU memory.
* The cached state goes across as a checkpointed snapshot (not zero-copy, sadly, because, well, Vulkan and conversions, etc., so the handoff still takes time).
* Follow-up tool turns with a warm cache stay on the CPU, so they don’t pay for another handoff.

Getting that working with `Gemma` required fixing two fairly fundamental things in my [`llama.cpp`](https://github.com/rcarmo/llama-cpp?utm_campaign=unsolicited_traffic&utm_medium=web&utm_source=taoofmac.com) fork, though: There was a stupid bug (probably mine) that clipped things to 16K entries, and (this was the bit where `Astra` was useful) I had to make `Gemma`’s compact sliding-window attention cache transferable, preserving its valid padding and checking the text/token state format so the CPU could resume without processing the whole prompt again.

Watching it re-use N-1 cached tokens in an N-token test was quite satisfying–no need to chew through the whole prompt again. But compared with keeping everything on the CPU, the gain was more noticeable in the complete workflow, not follow-up turns:

![Gemma CPU-only versus Vulkan-prefill and CPU-generation timings for a complete coding workflow and its warm follow-up rounds](/space/reviews/2026/09/13/1700/sigma-gemma-workflow.svg?v=0df93b30bd18) Eight counterbalanced runs in September: 28.8% less time overall and 3.4% more time on warm follow-up rounds, which are included in the total. Lower is better.

And yes, this is not quite a general-purpose speedup: the complete coding workflow took 28.8% less time, but the warm follow-up rounds were 3.4% slower. It helps when there’s a fresh prompt to ingest; once an agent is working from a warm cache, there isn’t an extra turn-by-turn gain here.

I am looking into this further to see if there are ways to generalize the approach or improve the handoff between Vulkan and the CPU, but this is the kind of rabbit hole I can’t really get into these days, so I pivoted to another thing: speech recognition.

[

### Whispering Really Quickly ###

](/space/reviews/2026/09/13/1700#whispering-really-quickly)

Why speech? Well, because that Vulkan/CPU hybrid approach for `Gemma` got me thinking: `Whisper` has a much smaller model size and lower computational requirements compared to `Gemma`, and it might benefit from a similar prefill-and-handoff strategy, potentially allowing for faster speech recognition on the CPU after an initial Vulkan prefill. At least that was the theory.

So far, I don’t have pretty charts because the conversion from Vulkan-prefill to CPU generation is still a pain to do on the fly (even segmenting the audio, etc.), but I got `Whisper v3 Large` working with that approach at eight times real-time speed on the [Sigma](https://www.lattepanda.com/lattepanda-sigma?utm_campaign=unsolicited_traffic&utm_medium=web&utm_source=taoofmac.com) already without really optimizing anything and just doing the bulk Vulkan to CPU data conversion repeatedly.

>
>
> I am now porting that into [`go-pherence`](https://github.com/rcarmo/go-pherence/tree/main/models/whisper?utm_campaign=unsolicited_traffic&utm_medium=web&utm_source=taoofmac.com), so I’ll likely update this post once I have repeatable benchmarks.
>
>

But the short version is that I can run *both* `Whisper` and `Gemma` simultaneously on the [Sigma](https://www.lattepanda.com/lattepanda-sigma?utm_campaign=unsolicited_traffic&utm_medium=web&utm_source=taoofmac.com)–which in turn means that this might well be a killer home automation server if you want fast speech recognition and simple, efficient language model processing all in one place.

Of course, not being a [Home Assistant](https://www.home-assistant.io/?utm_campaign=unsolicited_traffic&utm_medium=web&utm_source=taoofmac.com) person (I rely on Siri and [HomeKit](/space/com/apple/homekit), for better or for worse), I can’t really take the next logical steps here, but I do want a local, private speech transcription solution (I would like to [clone the Index 01](/space/blog/2026/09/09/1909#the-iphone-duo-and-the-rest) to a degree), and the [Sigma](https://www.lattepanda.com/lattepanda-sigma?utm_campaign=unsolicited_traffic&utm_medium=web&utm_source=taoofmac.com) is working quite well for that purpose already.

[

Living With It
----------

](/space/reviews/2026/09/13/1700#living-with-it)

I’ve since swapped back to the Fedora SSD full time, and have been using the [Sigma](https://www.lattepanda.com/lattepanda-sigma?utm_campaign=unsolicited_traffic&utm_medium=web&utm_source=taoofmac.com) as a development server for [`wrdp`](https://github.com/rcarmo/wrdp?utm_campaign=unsolicited_traffic&utm_medium=web&utm_source=taoofmac.com), [`go-264`](https://github.com/rcarmo/go-264?utm_campaign=unsolicited_traffic&utm_medium=web&utm_source=taoofmac.com), [`go-pherence`](https://github.com/rcarmo/go-pherence?utm_campaign=unsolicited_traffic&utm_medium=web&utm_source=taoofmac.com), etc. I am thinking of reinstalling [Proxmox](/space/os/linux/distributions/proxmox#proxmox-ve) on the bigger drive and consolidating most of my development there–including migrating quite a few of my other projects from [`borg`](/space/blog/2023/02/18/1845#borg-my-post-pandemic-homelab-server) to it as well, since even though `borg` has ample storage and RAM, the [Sigma](https://www.lattepanda.com/lattepanda-sigma?utm_campaign=unsolicited_traffic&utm_medium=web&utm_source=taoofmac.com) is just quieter and more power-efficient.

[

Verdict
----------

](/space/reviews/2026/09/13/1700#verdict)

The expandability, built-in 32GB of RAM and the [i5-1340P](https://ark.intel.com/content/www/us/en/ark/products/232126/intel-core-i51340p-processor-12m-cache-up-to-4-60-ghz.html?utm_campaign=unsolicited_traffic&utm_medium=web&utm_source=taoofmac.com)’s core count would already make me choose the [Sigma](https://www.lattepanda.com/lattepanda-sigma?utm_campaign=unsolicited_traffic&utm_medium=web&utm_source=taoofmac.com) over most Intel mini-PCs I’d otherwise consider. But quiet operation and power efficiency are what make me want to keep using it as a development and home server.

For consolidating services into a custom server build or a small 10-inch rack, I’d also much rather start with this board than stack a bunch of mini-PCs. The two M.2 storage slots and SATA connectivity leave room to expand–if you need more SATA ports, you can use the second M.2 slot with an adapter, and Thunderbolt gives you another option for fast storage. I haven’t tested every expansion option (and, like many times before, I wish I had an eGPU setup to try).

Taking a DIY approach, I appreciate the readily accessible I/O and don’t particularly miss the enclosure (though a proper case would certainly make things tidier).

For now, it’s back on Fedora doing development work while I find the time to design a 3D-printed case that suits me–there are some available, but none is quite what I’d like…