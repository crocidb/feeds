+++
title = "Wallops 2.2 Released"
description = "A new release of my Wallops IRC client is available:* wallops-2.2.sit (StuffIt 3 archive)     SHA256: adc2b473664ec0960b5b028335566831dd69f4a1de40f79e22bf1337292cca88    SHA1: 603c5080c41a0d5752cae49a08376db4e18628b1This update includes"
date = "2026-02-02T05:00:00Z"
url = "https://jcs.org/2026/02/02/wallops22"
author = "joshua stein"
text = ""
lastupdated = "2026-07-28T12:43:13.641128575Z"
seen = false
+++

A new release of my [Wallops IRC client](/wallops) is available:

* [wallops-2.2.sit](/wallops/wallops-2.2.sit) (StuffIt 3 archive)  
   SHA256: `adc2b473664ec0960b5b028335566831dd69f4a1de40f79e22bf1337292cca88`  
  SHA1: `603c5080c41a0d5752cae49a08376db4e18628b1`

This update includes a number of new features and bugfixes:

* Auto-connect with the last saved settings on startup, if they are available, unless the Command key is held down
* Add support for sending [Pushover notifications](https://pushover.net/) when the user's nick is mentioned or directly messaged, when a screen saver is detected to be running; sends to Pushover's API over plain-text HTTP
* Improve nick highlighting when the user's nick is not at the beginning of the line
* Speed up parsing of nicknames when joining large channels
* Add support for the `/monitor` command which is sent directly to the server
* Fix bug that may have caused a crash when initially connecting, and when reconnecting