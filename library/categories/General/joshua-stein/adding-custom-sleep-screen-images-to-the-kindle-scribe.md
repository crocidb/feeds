+++
title = "Adding Custom Sleep Screen Images to the Kindle Scribe"
description = "Last year I upgraded my Kindle Paperwhite to a Kindle Scribe to be able to write notes and draw diagrams while programming to help visualize things.One thing that bothered me about the Scribe was that its sleep screen images were pretty boring and because I'm now often reading PD"
date = "2025-02-24T05:00:00Z"
url = "https://jcs.org/2025/02/24/kindle"
author = "joshua stein"
text = ""
lastupdated = "2026-07-28T12:43:13.645632602Z"
seen = false
+++

Last year I upgraded my Kindle Paperwhite to a Kindle Scribe to be able to write notes and draw diagrams while programming to help visualize things.

One thing that bothered me about the Scribe was that its sleep screen images were pretty boring and because I'm now often reading PDFs or writing in a notebook, I couldn't benefit from the Kindle OS's new functionality that uses the cover of the book being read as the sleep screen image (which previously required a jailbreak and custom software).

Since the process for installing custom sleep screen images is rather cumbersome and the information is scattered across old forum posts, I thought I'd document how I did it to possibly make it easier for someone else.

Table of Contents
----------

1. [Top](#)

1. [Jailbreaking](#jailbreaking)
2. [Disabling OTA Updates](#disabling-ota-updates)
3. [Installing KOReader](#installing-koreader)
4. [Installing Custom Images](#installing-custom-images)

Jailbreaking
----------

On my Kindle Paperwhite, I long-ago used a [jailbreak](https://www.mobileread.com/forums/showthread.php?t=356872) to install a bunch of software packages that enabled custom sleep screen images. For the newer Scribe, this wasn't available until recently with the ["WinterBreak"](https://kindlemodding.org/jailbreaking/WinterBreak/) jailbreak, and the process to use custom images is now easier.

To install WinterBreak on the Scribe, one needs a computer with an [MTP](https://en.wikipedia.org/wiki/Media_Transfer_Protocol) application since the Scribe now uses MTP like an Android phone rather than attaching as a regular USB disk drive. On my Mac, I used [OpenMTP](https://openmtp.ganeshrvel.com/).

Follow the instructions at the [WinterBreak](https://kindlemodding.org/jailbreaking/WinterBreak/) page, which at the time of writing (and worked on my 1st generation Scribe running firmware 5.17.3) were:

1. Download the current [WinterBreak](https://kindlemodding.org/jailbreaking/WinterBreak/) release
2. Enable Airplane mode on the Kindle
3. Connect the Scribe to the computer with a USB-C cable
4. Extract the WinterBreak archive and copy all of the files (except `.git*`, `README.md`, and `instructions.txt`) to the Kindle's home directory, including the `.active_content_sandbox` directory which may not initially be visible in the MTP program
5. Tap the "Disconnect" button on the Kindle and unplug it
6. Swipe down from the top of the Kindle screen to open the settings drawer and tap "All Settings", then "Device options", then "Restart"
7. Once restarted, tap the shopping cart icon on the Kindle to open the Kindle Store; when prompted to turn Airplane mode off, tap "Yes"
8. Instead of the usual Kindle Store page, there will be a small icon labeled "Mesquito"; tap on it
9. A bunch of debugging messages will print on the screen and it will say "Please install hotfix now."
10. Plug the Kindle into the computer again with the USB-C cable
11. Download the [Hotfix](https://kindlemodding.org/jailbreaking/post-jailbreak/setting-up-a-hotfix/) `.bin` file and copy it to the Kindle's home directory with the MTP program
12. Tap the "Disconnect" button on the Kindle and unplug it
13. Swipe down from the top of the Kindle screen again and tap "All Settings", then tap the 3-dot menu button at the top and tap "Update your Kindle"; tap "Update" when prompted
14. Once the Kindle restarts, there will be a new item in the "Your recent items" list named "KUAL"

Disabling OTA Updates
----------

To prevent a future automatic update from disabling your jailbreak and possibly removing your custom software, you can [install the "renameotabin" extension](https://kindlemodding.org/jailbreaking/post-jailbreak/disable-ota) using the instructions shown there.

Installing KOReader
----------

Once jailbroken, the [KOReader](https://koreader.rocks/) application can be installed, which offers a different interface for reading books. I don't particularly like it (especially since it's a bit cumbersome to launch each time) but it's needed for the utilities included in it.

* [Find](http://build.koreader.rocks/download/nightly/?C=M&O=D) the latest KOReader nightly release directory and download the `kindlehf` zip file in that directory
* Connect the Scribe to the computer with a USB-C cable and open the MTP program
* Extract the KOReader zip file and copy its `koreader` and `extensions` directories to the home directory on the Scribe (there will probably already be an `extensions` directory, so the `extensions/koreader` directory from the zip file needs to go in that `extensions` directory)
* Tap the "Disconnect" button on the Kindle and unplug it
* From the Kindle's home screen, tap "KUAL"; there should now be a "KOReader" entry in the list

Installing Custom Images
----------

Sleep screen images for the Kindle Scribe (at least my 1st generation device) must be 8-bit grayscale PNG images, with a resolution of 1860x2480. I used [GIMP](https://www.gimp.org/) to prepare some photos by scaling/cropping them to 1860x2480, converting to grayscale, and then exporting as a PNG. In GIMP's "Export Image as PNG" dialog, the "automatic.pixelformat" option should be changed to "8bpc GRAY". From what I've read, having images in a different format can cause crashes, so it's best to just force this format.

When exporting your images, name them `bg_ss00.png`, `bg_ss01.png`, `bg_ss02.png`, etc.

To install them:

* Connect the Scribe to the computer with a USB-C cable and open the MTP program
* Copy your `bg_ss*.png` images to the Kindle's home directory
* Tap the "Disconnect" button on the Kindle and unplug it
* From the Kindle's home screen, tap "KUAL"
* In KUAL, tap "KOReader", then the first "Start KOReader" option; the screen will go back to the Library and after a few seconds, KOReader will start
* Tap the "KOReader" header at the top to open its menu
* Tap the tools icon, then tap the "\>" button to go to Page 2
* Tap "More tools"
* Tap "Terminal emulator" and then "Open terminal session"
* You are now at a root shell, standing in an open field west of a white house, with a boarded front door; there is a small mailbox here

You will need to delete the factory sleep screen images and then copy the `bg_ss*.png` images you transferred over to that directory. If you want to keep the factory images, don't delete anything and start your `bg_ss*.png` numbering at `07` since there are 7 factory sleep screen images (which start at `00`).

To modify the system sleep images, you'll need to remount `/` as read-write since it's read-only by default. In the Terminal emulator screen at the root `#` prompt, enter:

```
mount -o remount,rw /

```

If you want to delete the factory images, enter:

```
rm /usr/share/blanket/screensaver/*.png

```

To copy your custom images to the system directory, enter:

```
cp /mnt/us/bg_ss* /usr/share/blanket/screensaver/

```

Once finished, tap the "X" button above the keyboard to close the terminal emulator. Once back at KOReader, tap the 3-line button at the top right and tap "Exit", then "Exit" again. You'll be returned to the Kindle home screen.

Swipe down from the top of the Kindle screen to open the settings drawer and tap "All Settings", then "Screen and brightness". Make sure the "Show covers on lock screen" option is disabled. Tap "Device options", then "Restart"

Once restarted, press the Kindle's sleep button and, if all went well, you should see a randomly-selected image from the custom ones you uploaded.

[<img src="/images/2025-02-24-custom_kindle-335x393.jpg" srcset="/images/2025-02-24-custom_kindle-335x393.jpg 1x, /images/2025-02-24-custom_kindle-670x786@2x.jpg 2x" width="335" height="393" class="1/2">](/images/2025-02-24-custom_kindle-1277x1500.jpg)A phoropter