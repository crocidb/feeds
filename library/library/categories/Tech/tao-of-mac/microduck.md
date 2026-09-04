+++
title = "Microduck"
description = '<img class="quicklook" src="/space/links/2026/08/28/0652/large.jpg?v=3a73f25f06d7" alt="quicklook" width="320" height="240"This is extremely impressive, not just f'
date = "2026-08-28T06:52:00Z"
url = "https://taoofmac.com/space/links/2026/08/28/0652?utm_content=atom"
author = "Rui Carmo"
text = ""
lastupdated = "2026-09-01T19:33:17.049579270Z"
seen = false
+++

[<img class="quicklook" src="/space/links/2026/08/28/0652/large.jpg?v=3a73f25f06d7" alt="quicklook" width="320" height="240">](https://pollen-robotics.com/microduck/?utm_campaign=unsolicited_traffic&utm_medium=web&utm_source=taoofmac.com)

This is *extremely* impressive, not just from a design and kinematics perspective, but because the entire 50Hz control loop runs locally on an RK3566 (not the RK3588 I first assumed), with the ONNX movement policies running on the robot itself.

The [repository](https://github.com/pollen-robotics/microduck?utm_campaign=unsolicited_traffic&utm_medium=web&utm_source=taoofmac.com) includes the MuJoCo/PPO training code and Rust runtime, so every shipped behaviour can be retrained–which is quite something for a 25cm, 800g biped with fifteen motors that can walk, skate, grab things and get back up by itself.

It is a completely superfluous thing to spend north of $500 on, and I have no idea what I would do with one or where I would find the time, but it presses all the “shut up and take my money” buttons–and if [NVIDIA’s acquisition of Hugging Face](/space/links/2026/08/27/0747#nvidia-is-buying-hugging-face-for-12-9-billion) goes through, I suppose we may have to call it the Jetson Donald or something…