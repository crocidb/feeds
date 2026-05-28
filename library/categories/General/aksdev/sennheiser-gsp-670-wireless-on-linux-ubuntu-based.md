+++
title = "Sennheiser GSP 670 wireless on Linux (Ubuntu based)"
description = "Update!This patch has been added to the kernel, so if you have kernel 5.14.15-200 you should be good to go! It seems to also work on 5.13.0-28 on Kubuntu!Here's link to the patch [https://mailman.alsa-project.org/pipermail/alsa-devel/2021-October/191190.html](https://mailman.alsa"
date = "2021-08-12T00:00:00Z"
url = "https://akselmo.dev/posts/sennheiser-gsp-670-wireless-on-linux/"
author = "Akseli"
text = ""
lastupdated = "2026-05-27T23:22:57.151449825Z"
seen = true
+++

Update!

This patch has been added to the kernel, so if you have kernel 5.14.15-200 you should be good to go! It seems to also work on 5.13.0-28 on Kubuntu!

Here's link to the patch [https://mailman.alsa-project.org/pipermail/alsa-devel/2021-October/191190.html](https://mailman.alsa-project.org/pipermail/alsa-devel/2021-October/191190.html)

**However**, you may need to still set up the Pulseaudio profile, so check that out if it's not working for you even on the right kernel.

---

I got myself a new wireless headset and while it works fine on Windows, it had some problems running on my Kubuntu: It would only work over a wire.

However, you can get it to work with a Kernel module fix. I got help for this in this nice Github thread: [https://github.com/szszoke/sennheiser-gsp670-pulseaudio-profile/issues/13](https://github.com/szszoke/sennheiser-gsp670-pulseaudio-profile/issues/13)

Many thanks to this blog post: [https://includeguitar.home.blog/2019/06/18/boss-katana-linux-%e2%9d%a4%ef%b8%8f/](https://includeguitar.home.blog/2019/06/18/boss-katana-linux-❤️/)!

Most of the steps are same and I will be shamelessly copy pasting some of the commands, but I want to show the steps specific for this headset. **Again, huge thanks to everyone involved in that Github issue thread!!! All the thanks go to them!** Also these steps are typed for Kubuntu in mind, so they should work on any Ubuntu based distro.

[Before you start](#before-you-start)
----------

Before you begin, just few things you should keep in mind:

* First, modifying kernel, if it goes badly, **can make things unusable and your computer may not even boot up.** Be careful around these parts. This is necessary scary part to point out.
* Second, when your kernel gets updates, you have to do these steps all over again, unless someone pushes the fix up to the kernel developers. When that happens, this fix is not necessary.
* Last but not least: **Take backups!**

[Download kernel and install dependencies](#download-kernel-and-install-dependencies)
----------

First, unplug your headset dongle and headset itself, just make sure its not connected to the PC. Then install build dependencies in your terminal:

```
sudo apt install build-essential -y
sudo apt build-dep linux -y

```

Then make a directory where to download the kernel:

```
mkdir ~/gspquirk
cd ~/gspquirk
apt source linux

```

I named mine with "gspquirk" because that's what we're going to be doing: Add a "quirk" for the GSP headset.

If you can't download the kernel sources or install dependencies because of `E: You must put some 'source' URIs in your sources.list`, do the following: Go to terminal and type

```
sudo software-properties-*

```

This should open your software property window. In there, enable "Source code" box and close.

[Modifying the quirks-table.h](#modifying-the-quirks-table-h)
----------

Navigate to the kernel source folder you downloaded and get your configuration and Module.symvers from your current kernel fith following commands.

```
cp /lib/modules/`uname -r`/build/.config . -v
cp /lib/modules/`uname -r`/build/Module.symvers . -v

```

Update the `Makefile` according to your current kernel:

Check your `uname -r` output. For me it is `5.11.0-25-generic`

Open the `Makefile` and make sure the following parts match, on top of the makefile:

```
VERSION = 5
PATCHLEVEL = 11
SUBLEVEL = 22
EXTRAVERSION = -25-generic

```

For me, the extra version part was missing, so I added it there myself.

Save your changes and run this command inside the same folder:

```
make modules_prepare

```

[Add pulseaudio profile settings](#add-pulseaudio-profile-settings)
----------

Find out your headset id values by running

```
lsusb

```

For me, since my headset is on newer firmware, it is: `Bus 003 Device 003: ID 1395:0300 Sennheiser Communications EPOS GSA 70`.

It could also be different, and the ID part could also be `1395:0089` if you're on older firmware.

Write that ID number down somewhere.

Next, you want to make a new rules file for your headset, on your current machine, not the linux kernel you downloaded!

Check the rules folder if you already have `pulseaudio-sennheiser-gsp670.rules` file: `ls /etc/udev/rules.d/`.

If not, make a file called `91-pulseaudio-sennheiser-gsp670.rules` (this is what it's for me, the 91 could also be 90 or some other number) in there and add following text inside it:

```
# GSA-70 dongle with updated firmware
ATTRS{idVendor}=="1395", ATTRS{idProduct}=="0300", ENV{PULSE_PROFILE_SET}="usb-gaming-headset.conf"
# GSA-70 dongle with older firmware
ATTRS{idVendor}=="1395", ATTRS{idProduct}=="0089", ENV{PULSE_PROFILE_SET}="usb-gaming-headset.conf"
# GSP-670 headset
ATTRS{idVendor}=="1395", ATTRS{idProduct}=="008a", ENV{PULSE_PROFILE_SET}="usb-gaming-headset.conf"

```

Also if you already have the file inside it, make sure your rules file looks similar. Notice the IDs? One of them is the same you found with `lsusb`

Save and then restart pulseaudio:

```
pulseaudio -k
pulseaudio -D

```

Now you should have a new rule for your headset that you can assign inside pulseaudio settings. We'll get back to that later.

[Adding the quirk](#adding-the-quirk)
----------

Back inside the linux source folder you downloaded, open following file: `sound/usb/quirks-table.h`

Inside the file, find the last quirk. They usually have comments on them, for me the last one was

```
{
    /*
  * Pioneer DJ DJM-450
  * PCM is 8 channels out @ 48 fixed (endpoint 0x01)
  * and 8 channels in @ 48 fixed (endpoint 0x82).
  */

    (snip)
},

```

As you can see, they always end with a comma. Add the following quirk behind the last quirk.

Notice that if you have older headset firmware, you have to change the `0x0300` next to `USB_DEVICE(0x1395, ID_HERE)` to `0x0089` or whatever `lsusb` shows to you!

```
{
  /*
   * Sennheiser GSP670: Load interfaces in a different order
   */
  USB_DEVICE(0x1395, 0x0300),
  .driver_info = (unsigned long) &(const struct snd_usb_audio_quirk) {
    .ifnum = QUIRK_ANY_INTERFACE,
    .type = QUIRK_COMPOSITE,
    .data = &(const struct snd_usb_audio_quirk[]) {
      // Communication
      {
        .ifnum = 3,
        .type = QUIRK_AUDIO_STANDARD_INTERFACE
      },
      // Recording
      {
        .ifnum = 4,
        .type = QUIRK_AUDIO_STANDARD_INTERFACE
      },
      // Main
      {
        .ifnum = 1,
        .type = QUIRK_AUDIO_STANDARD_INTERFACE
      },

      {
        .ifnum = -1
      }
    }
  }
},

```

(Thanks [bundabrg](https://github.com/szszoke/sennheiser-gsp670-pulseaudio-profile/issues/13#issuecomment-891662521)!)

Also make sure the quirk is **above** these lines!

```
#undef USB_DEVICE_VENDOR_SPEC
#undef USB_AUDIO_DEVICE

```

And, make sure that you didn't accidentally add the quirk inside another quirk.

Then, save the file, and it's time to build!

Build the USB audio module:

```
make M=sound/usb

```

[Install the module](#install-the-module)
----------

First, back up your old module:

```
sudo cp /lib/modules/`uname -r`/kernel/sound/usb/snd-usb-audio.ko /lib/modules/`uname -r`/kernel/sound/usb/snd-usb-audio.ko.old -v

```

Then make sure you have **ALL USB AUDIO DEVICES UNPLUGGED**, so you can remove the module that is in use:

```
sudo rmmod snd-usb-audio

```

Overwrite the current module with the one you just made

```
sudo cp ./sound/usb/snd-usb-audio.ko /lib/modules/`uname -r`/kernel/sound/usb/snd-usb-audio.ko -v

```

Refresh the modules:

```
sudo depmod -a

```

And then, load the module!

```
sudo modprobe snd-usb-audio

```

You can now plug in all your headsets and sound devices. Have fingers crossed that they work. If not, remember the backup you made? You'll have to unload the modules, rename the backup as the current file, then refresh and load the modules again.

[Make sure you use correct audio rule](#make-sure-you-use-correct-audio-rule)
----------

Open audio/pulseaudio settings and find where you can configure the rules. You may have to search for this one, since I only know how to do it for Kubuntu:

On Kubuntu, in Audio settings there is a Configure button. Click that and you should see "EPOS GSA 70"

Under that, there is dropdown selection for "Profile" From there, select `Chat Output + Game Output + Chat Input`

Test the headset from the dropdown that is below, and you can test your mic in any app that supports it really.

[That should be it](#that-should-be-it)
----------

For me, these steps worked and made my headset work. It's a lot of stuff to do just to get a headset to work, but I hope in future these are already applied to kernel so we don't have to dabble with these kind of settings again. :)

If your headset doesnt work after these steps, try rebooting your PC once so kernel will load everything proper. And again, remember the backup you made, so you can load the old usb sound module in case the new one didn't work.