+++
title = "[$] How to be safe from quantum computing"
description = " Practical quantum computers have been ten years away for the last several decades. Now, however, it's beginning to look as though they will be possible in just a few years. Recent  research with obfuscated results demonstrated much lower memo"
date = "2026-08-24T14:57:41Z"
url = "https://lwn.net/Articles/1088305/"
author = "daroc"
text = ""
lastupdated = "2026-08-24T15:49:16.116203111Z"
seen = false
+++

 Practical quantum computers have been ten years away for the last several decades. Now, however, it's beginning to look as though they will be possible in just a few years. Recent [ research with obfuscated results](https://lwn.net/Articles/1066156/) demonstrated much lower memory requirements to factor [ ECDSA](https://en.wikipedia.org/wiki/Elliptic_Curve_Digital_Signature_Algorithm) keys on a quantum computer, with [ work by other researchers in the open](https://www.ecdsa.fail/) more than halving memory use compared to the state of the art in 2023. At the same time, computer manufacturers are [ boasting](https://abit.ee/en/processors/ibm-quantum-processor-nighthawk-ibm-miami-quantum-computing-qubits-coherence-heron-r3-quantum-advant-en) quantum processors that retain viable superpositions over longer periods. Given how slowly software updates filter out to stable systems, it's worth looking at what configuration changes and protocol updates are needed to be safe from quantum computers now.