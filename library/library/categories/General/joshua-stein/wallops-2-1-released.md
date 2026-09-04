+++
title = "Wallops 2.1 Released"
description = "Another update to Wallops building on the 2.0 release is available:* wallops-2.1.sit (StuffIt 3 archive)     SHA256: 7cb16046e076488e1997e1232631cf2dc9737bac0a94f0348caf5d183927f4a9    SHA1: `fd1d7145aa4baaf5322175"
date = "2024-09-23T05:00:00Z"
url = "https://jcs.org/2024/09/23/wallops21"
author = "joshua stein"
text = ""
lastupdated = "2026-07-28T12:43:13.648629969Z"
seen = false
+++

Another update to [Wallops](/wallops) building on the [2.0 release](/2024/09/12/wallops2) is available:

* [wallops-2.1.sit](/wallops/wallops-2.1.sit) (StuffIt 3 archive)  
   SHA256: `7cb16046e076488e1997e1232631cf2dc9737bac0a94f0348caf5d183927f4a9`  
  SHA1: `fd1d7145aa4baaf5322175f348644d1057267a65`

This update includes a number of new features and bugfixes:

* Implement tab completion in channels; by typing part of a user's nick and pressing tab, the input bar will show their completed nick with ":" after it
* Do UTF-8 to MacRoman conversion of incoming text, where possible
* Add support for `/connect`, `/reconnect`, and `/server` to reconnect after a broken connection, or to switch servers, without having to close the window
* Add keyboard shortcuts `Cmd-1` through `Cmd-9` to switch to that numbered tab, and `Cmd-,` and `Cmd-.` to switch to the previous and next tabs
* Add support for `/say`, useful when having to say something starting with a slash
* Limit input line to the maximum IRC line length and beep when it's exceeded
* Handle when a user being queried changes their nick
* Handle DNR (MacTCP's DNS resolver) returning `0.0.0.0` when a host does not exist
* When sending a message to a user with `/msg`, don't update the server window's tab since the activity is only what we just sent
* Improve matching the user's own nick when highlighting messages to us (and notifying about them), including matches not just at the beginning of a line
* Fix notifications sometimes not being canceled
* Fix handling the user's nick when changed and not in any channels
* Fix background window updates that were sometimes drawing over the wrong window
* Fix rendering of outline on connection window's Connect button