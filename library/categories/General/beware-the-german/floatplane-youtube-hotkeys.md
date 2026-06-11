+++
title = "Floatplane YouTube Hotkeys"
description = '<subvia <a rel="external" href="https://gist.github.com/iGerman00/db6a2c4c8d4dc30ed17d309c97310a50"https://gist.github.com/iGerman00/db6a2c4c8d4dc30ed17d309c97310a50</a</subFloatplane YouTube HotkeysThis is a relatively simple, decent'
date = "2024-05-05T00:00:00Z"
url = "https://igerman.cc/blog/floatplane-hotkeys/"
author = "german s."
text = ""
lastupdated = "2026-06-08T12:43:31.137057639Z"
seen = true
+++

<sub>via <a rel="external" href="https://gist.github.com/iGerman00/db6a2c4c8d4dc30ed17d309c97310a50">https://gist.github.com/iGerman00/db6a2c4c8d4dc30ed17d309c97310a50</a></sub>

Floatplane YouTube Hotkeys[#](#floatplane-youtube-hotkeys)
==========

This is a relatively simple, decent script to introduce some extra hotkeys to [Floatplane](https://floatplane.com). By default, only some hotkeys are active.  
 I've only tested this script on my Chromium-based browser with Tampermonkey, however I have no reason to believe it won't work on other browsers.

Hotkeys that I have added:

* `k`, `MediaPlayPause` - play/pause
* `StopMedia` - pause
* `j` - seek 10 seconds back
* `l` - seek 10 seconds forward
* `,` - step one frame backwards (while paused)
* `.` - step one frame forwards (while paused)

>
>
> *Note: frame seeking assumes 30fps*
>
>

* `0` - video beginning
* `1` through `9` - seek to 10-90% of the video
* `i` - toggle picture in picture
* `>` - increase playback rate
* `<` - decrease playback rate
* `Home` - seek to start
* `End` - seek to end

```
// ==UserScript==
// @name         Floatplane YouTube Hotkeys
// @namespace    http://tampermonkey.net/
// @version      2024-04-27
// @description  Replicates YouTube's hotkeys for use in the Floatplane player
// @author       iGerman00
// @match        https://*.floatplane.com/*
// @icon         https://www.google.com/s2/favicons?sz=64&domain=floatplane.com
// @grant        none
// @run-at       document-end
// ==/UserScript==

(function () {
  "use strict";

  const playbackRates = [0.25, 0.5, 1, 1.5, 2, 2.5, 3];
  let controlsSetUp = false;

  function getPlayer() {
    if (window.PLAYER && window.PLAYER.el) {
      selfLog("Player found");
      return window.PLAYER;
    }
    selfLog("Player not found");
    return null;
  }

  function handleKeydown(e) {
    const player = getPlayer();
    if (!player || !document.activeElement.innerHTML.includes("player")) {
      selfLog("Keyboard event ignored: player not focused or undefined");
      return;
    }

    selfLog("Key pressed:", e.key);
    switch (e.key) {
      case "k":
      case "MediaPlayPause":
        if (player.paused()) {
          selfLog("Playing video");
          player.play();
        } else {
          selfLog("Pausing video");
          player.pause();
        }
        break;
      case "StopMedia":
        selfLog("Stopping video");
        player.pause();
        break;
      case "j":
        selfLog("Seeking backward 10 seconds");
        player.currentTime(player.currentTime() - 10);
        createPlayerModal(player, "-10s");
        break;
      case "l":
        selfLog("Seeking forward 10 seconds");
        player.currentTime(player.currentTime() + 10);
        createPlayerModal(player, "+10s");
        break;
      case ",":
        if (player.paused()) {
          selfLog("Seeking one frame backward");
          player.currentTime(player.currentTime() - 1 / 30);
        }
        break;
      case ".":
        if (player.paused()) {
          selfLog("Seeking one frame forward");
          player.currentTime(player.currentTime() + 1 / 30);
        }
        break;
      case "0":
        selfLog("Seeking to beginning of video");
        player.currentTime(0);
        break;
      case "i":
        selfLog("Toggling picture in picture");
        if (document.pictureInPictureElement) {
          document.exitPictureInPicture();
        } else {
          player.requestPictureInPicture();
        }
        break;
      case ">":
        selfLog("Increasing playback rate");
        changePlaybackRate(1);
        break;
      case "<":
        selfLog("Decreasing playback rate");
        changePlaybackRate(-1);
        break;
      case "Home":
        selfLog("Seeking to beginning of video");
        player.currentTime(0);
        break;
      case "End":
        selfLog("Seeking to end of video");
        player.currentTime(player.duration());
        break;
      case "1":
      case "2":
      case "3":
      case "4":
      case "5":
      case "6":
      case "7":
      case "8":
      case "9":
        selfLog("Seeking to percentage of video:", parseInt(e.key) / 10);
        player.currentTime((player.duration() * parseInt(e.key)) / 10);
        createPlayerModal(player, parseInt(e.key) * 10 + "%");
        break;
    }
  }

  function changePlaybackRate(direction) {
    const player = getPlayer();
    if (!player) return;
    const currentRate = player.playbackRate();
    const index = playbackRates.indexOf(currentRate);
    if (direction === 1 && index < playbackRates.length - 1) {
      selfLog("Increasing playback rate to:", playbackRates[index + 1]);
      player.playbackRate(playbackRates[index + 1]);
      createPlayerModal(player, playbackRates[index + 1] + "x");
    } else if (direction === -1 && index > 0) {
      selfLog("Decreasing playback rate to:", playbackRates[index - 1]);
      createPlayerModal(player, playbackRates[index - 1] + "x");
      player.playbackRate(playbackRates[index - 1]);
    }
  }

  function setupKeyboardControls() {
    if (controlsSetUp) return;
    selfLog("Setting up keyboard controls");
    document.addEventListener("keydown", handleKeydown);
    controlsSetUp = true;
  }

  function observePlayerInit() {
    const observer = new MutationObserver((mutations) => {
      if (getPlayer()) {
        selfLog("Player (re)initialization detected");
        observer.disconnect(); // Disconnect observer to reset if necessary
        setupKeyboardControls(); // Ensure controls are setup after (re)initialization
      }
    });
    observer.observe(document.body, { childList: true, subtree: true });
    selfLog("Observer set up to detect player initialization");
  }

  function createPlayerModal(player, text) {
    const existingModals = document.getElementsByClassName(
      "fp-yt-hotkeys-modal"
    );
    for (let i = 0; i < existingModals.length; i++) {
      existingModals[i].remove();
    }

    const element = document.createElement("div");
    element.className = "fp-yt-hotkeys-modal";
    element.innerHTML = text;

    element.style.position = "absolute";
    element.style.top = "10%";
    element.style.left = "50%";
    element.style.transform = "translate(-50%, -50%)";
    element.style.padding = "20px";
    element.style.fontSize = "16px";
    element.style.backgroundColor = "rgba(0, 0, 0, 0.5)";
    element.style.color = "white";
    element.style.borderRadius = "3px";
    element.style.zIndex = "10000";
    element.style.transition = "opacity 0.2s";
    element.style.opacity = "1";

    player.el().appendChild(element);

    setTimeout(() => {
      element.style.opacity = "0";
      setTimeout(() => {
        element.remove();
      }, 500);
    }, 750);
  }

  if (getPlayer()) {
    setupKeyboardControls();
  } else {
    observePlayerInit();
  }

  function selfLog(...args) {
    return; // Comment out to enable logging
    console.log("%cFloatplane YouTube Hotkeys:", "color: #FF0000;", ...args);
  }
})();
```