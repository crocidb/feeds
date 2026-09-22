+++
title = "llama.cpp with SYCL (oneAPI) for Intel Panther Lake on Gentoo"
description = "A brief write-up on how to get llama.cpp working with SYCL via Intel's oneAPI for Intel Panther Lake processors with Arc iGPUs on Gentoo Linux."
date = "2026-09-14T17:48:29Z"
url = "https://xn--gckvb8fzb.com/llamacpp-with-sycl-oneapi-for-intel-panther-lake-on-gentoo/"
author = "marius@xn--gckvb8fzb.com (Marius)"
text = ""
lastupdated = "2026-09-21T09:42:43.133540848Z"
seen = false
+++

Alright, so if you’ve read the title and thought you were having a stroke, you might not be the target audience for this post. If, however, you thought *“more tokens/s?”*, you should keep on reading.

If you remember my review of the new [Lenovo X1 Carbon Gen 14 Aura](/lenovo-x1-carbon-gen-14-aura/#local-ai) with Intel Panther Lake Core Ultra X7 368H vPro from a while ago, you might recall that I had tested its local *“AI”* performance using Ollama, via Vulkan, which obviously didn’t perform particularly well across various models. The proper way to run local LLMs is to use Intel’s official *oneAPI* framework and compile [llama.cpp](https://llama.app) with SYCL enabled, which will greatly increase performance.

This post is a very brief write-up of how that can be done and primarily serves as [yet](/hardened-gentoo-with-full-disk-encryption-on-the-star-labs-starbook-mk-vi/) [another](/mailman3-on-openbsd-71/) [documentation](/ultra-portable-data-center-part-two/) for future-me.

Gentoo
----------

I’m assuming that you’re already running your Gentoo system with the `xe` driver and `VIDEO_CARDS="intel"`. First, install the necessary dependencies:

```sh
emerge -av dev-libs/intel-compute-runtime dev-libs/level-zero \
           dev-util/intel-graphics-compiler media-libs/gmmlib \
           dev-util/clinfo

```

You’ll likely have to unmask a couple of those packages, like `clinfo`, but that’s fine. When this is done, add your user to the `video` and `render` groups if you haven’t already and log back in. Test that the GPU is being recognized by `clinfo -l`:

```
Platform #0: Intel(R) OpenCL
 `-- Device #0: Intel(R) Core(TM) Ultra X7 368H
Platform #1: rusticl
Platform #2: Intel(R) OpenCL Graphics
 `-- Device #0: Intel(R) Arc(TM) B390 GPU

```

oneAPI
----------

Next, [go and get](https://www.intel.com/content/www/us/en/developer/tools/oneapi/oneapi-toolkit-download.html?packages=dl-essentials&dl-essentials-os=linux&dl-lin=offline) the *“Intel Deep Learning Essentials”* package and use `./intel-deep-learning-essentials-2026.1.2.25_offline.sh -a --cli` to install it as a user. I chose the installation path `~/projects/intel/oneapi`, but you’re free to install it anywhere you please.

**Note:** Even if you deselect the telemetry option, the installer will try to contact Intel’s servers post-installation, so make sure your [OpenSnitch](https://github.com/evilsocket/opensnitch) blocks all requests from that process towards the interwebs.

llama.cpp
----------

While the [FireBurn overlay](https://github.com/FireBurn/Overlay) has `sci-misc/llama-cpp`, it does not yet allow you to specify `sycl` as a USE flag, and the official Gentoo repository has no llama.cpp ebuild at all. Hence we clone the project’s Git repository and compile it manually:

```sh
git clone https://github.com/ggml-org/llama.cpp
cd llama.cpp
source ~/projects/intel/oneapi/setvars.sh
cmake -B build -DGGML_SYCL=ON -DGGML_SYCL_F16=ON -DCMAKE_C_COMPILER=icx -DCMAKE_CXX_COMPILER=icpx -DCMAKE_BUILD_TYPE=Release
cmake --build build --config Release -j

```

Run
----------

Once llama.cpp finishes building, you can start it and have it download a model, e.g., Mistral or Qwen3:

```sh
source ~/projects/intel/oneapi/setvars.sh

```

```sh
./build/bin/llama-server -hf bartowski/Mistral-7B-Instruct-v0.3-GGUF:Q4_K_M -ngl 99 -sm none -mg 0 -c 8192 --host 127.0.0.1 --port 8080

```

or:

```sh
./build/bin/llama-server -hf Qwen/Qwen3-4B-GGUF:Q4_K_M --jinja -ngl 99 --temp 0.6 --top-k 20 --top-p 0.95 --min-p 0 --presence-penalty 1.5 -c 40960 -n 32768 --no-context-shift --host 127.0.0.1 --port 8080

```

Open a browser at [http://127.0.0.1:8080](http://127.0.0.1:8080), and you can try the model right away.

On my Lenovo, I managed to increase the tokens/second by roughly 60% compared to what Ollama (via Vulkan) was able to achieve. For example, the Mistral model went from approximately 13.88 tokens/s to 22.36 tokens/s.