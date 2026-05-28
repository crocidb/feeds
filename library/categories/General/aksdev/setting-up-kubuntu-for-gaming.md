+++
title = "Setting up Kubuntu for gaming"
description = "I have Kubuntu non-LTS version myself, so I wanted to write down how I set up Kubuntu for basic gaming. Hopefully it'll help someone. Setting up Linux can be tricky, but it's well worth it.Note: I use AMD GPU so I don't have proper guide for Nvidia users when it comes to drivers."
date = "2021-11-12T00:00:00Z"
url = "https://akselmo.dev/posts/setting-up-kubuntu-for-gaming/"
author = "Akseli"
text = ""
lastupdated = "2026-05-27T23:22:57.140351790Z"
seen = true
+++

I have Kubuntu non-LTS version myself, so I wanted to write down how I set up Kubuntu for basic gaming. Hopefully it'll help someone. Setting up Linux can be tricky, but it's well worth it.

Note: I use AMD GPU so I don't have proper guide for Nvidia users when it comes to drivers.

Anyway, first, ask yourself:

[Is Linux for me?](#is-linux-for-me)
----------

*You may want to check my other post [Who is Linux for]({% post\_url 2021-11-20-Who-is-Linux-for %}), but the text below is pretty much the same in short, and more gaming related.*

I'll say it straight: In my opinion, if you're not willing to learn new things, or experiment with technology, Linux is probably not for you, especially gaming wise. It is still a bit more hurdle than playing games on Windows. Some games will not work: They may run, but they either have anticheat or some other third party thing (like launcher) that doesn't work properly. Steam Proton and Lutris make this MUCH easier than it was before, but it's still **community** supported platform. Most people do things like software (like Lutris) on Linux on their free time, for free.

If you're also afraid of terminal, or simply refuse to learn using it, Linux may not be for you. It's a very good tool to set up, install and launch things, due to it being **distro-agnostic.** What this means is that I can give you advice for Kubuntu, but same terminal commands will very likely work for you in Linux Mint or Ubuntu.

That is why you see command lines everywhere! It's easier to tell someone "run this command" than "Open your UI, go there, then there.. Oh wait, you use completely different looking UI than I do." There are differences between distros when it comes to commands too, however they're usually related to package managers (things that install software for you).

Linux is perfect platform for nerds and geeks who just think computers are cool and like learning new things every day. It's perfect for those who want to get into computer stuff more as well.

In other hand, Windows also has it's own tinkering you need to do sometimes, especially for older games: Changing INI files, changing registry keys with regedit, that kind of thing. Linux gaming, for now, sometimes has a bit more of it, especially when it comes to some older titles that have super weird dependencies on older DLL's or stuff like that. With more modern titles however, if there's no anticheat involved, Steam Proton and Wine have ran the games really well for me.

And of course, if the developers are cool enough, there's also Linux native builds, like for Splitgate, that run better than on Windows.

One more thing: If you have never installed Windows yourself, this guide may be too technical for you. I suggest starting from the basics before attempting to dig into the Linux world. Linux installation is super simple and easy process (IMO easier than Windows) but for someone who has never installed any OS on any system, it may be bit more difficult.

[Why Kubuntu?](#why-kubuntu)
----------

I've used Linux Mint, Ubuntu, Xubuntu... And now Kubuntu. And I've found that Kubuntu is the easiest to setup for gaming. Linux Mint is also a brilliant distro, but Kubuntu has KDE Plasma and other KDE tools, which are awesome and modern. Then theres huge community support of Ubuntu behind it all, which makes troubleshooting a lot easier.

I will probably distro-hop in future, but I gotta say, Kubuntu has made me really happy with it's huge amount of customization and stability. For newcomers to Linux, it feels a bit like Windows by default, which makes things easier.

I do recommend to explore what works for your workflow and go with that, eventually.

[The Guide](#the-guide)
----------

Before you install anything, I want you to run [Kubuntu](https://kubuntu.org/getkubuntu/) in either Virtual Machine or through the Live USB. Yes, you can run Kubuntu (and many other Linux distros) from USB without installing anything.

For gaming, I recommend going with the Non-LTS version. This means that the software and kernel is a bit more up-to-date than with LTS version, which means that you get the newer GPU driver stuff and other software faster.

In this guide, I assume you use the non-LTS version. That's what I use as well.

Get that Kubuntu ISO flashed on your USB stick, reboot and boot into Kubuntu. (Internet is full of tutorials for that.)

I want you to first test if everything works on that Live-USB mode. Any weird glitches with video? Any other issues? Write them down and look for results, help and tutorials to fix them, since those issues may continue after installing.

[Installation](#installation)
----------

So, you checked everything and you are pretty sure everything seems good. Alright, awesome! I recommend installing it alongside Windows, in case you regret everything ~~you have ever done~~ installing The Penguin on your PC.

However, if at all possible, you could install Linux on another HDD/SSD entirely: This way, Windows updates will less likely break the dual-boot capability. But this usually means that when dual booting, instead of getting a simple UI to select which system to boot to, you have to select the right boot-drive from BIOS instead.

When the installation is done, let Kubuntu update *everything*. Just let it update in peace.

[Nvidia GPU users](#nvidia-gpu-users)
----------

Alright, this is where I am gonna fall flat on my face with this guide: I don't have Nvidia, so I don't know how to help with the Nvidia drivers. I've only heard that people should use the proprietary Nvidia drivers.

The best way to get Nvidia drivers on your device is to search for your distro's wiki/forums for how people have instaled it. I was told the way of Nvidia driver installation has changed many times, so there's lots of outdated information out there.

[AMD GPU users](#amd-gpu-users)
----------

Congrats, since AMD drivers are open source, they're already in the kernel! This means that you don't have to download separate drivers for it. There is proprietary AMD GPU drivers as well, but I've heard many times they're not as good as the open source ones. I assume they're more for server stuff anyway.

[Mesa drivers](#mesa-drivers)
----------

Mesa is the thing that helps your GPU do OpenGL stuff. You want that to be fairly fresh. Luckily with Non-LTS version of Kubuntu, it's pretty new already, so if your games run out of the box, then you don't have to worry about it.

If something breaks however, there are two PPA's you can use to get more up-to-date or stable drivers:

* [Oibaf PPA](https://launchpad.net/~oibaf/+archive/ubuntu/graphics-drivers)
  * Updates fast, follows the Git updates.

* [Kisak PPA](https://launchpad.net/~kisak/+archive/ubuntu/kisak-mesa)
  * More stable, slower than Oibaf, can be a bit slower than non-LTS Kubuntu as well.

Look into these more yourself, ask around questions, sometimes you don't need to update Mesa drivers at all anyway.

[Vulkan drivers](#vulkan-drivers)
----------

Vulkan is pretty essential since it is used to translate DirectX stuff to Vulkan, which makes the DirectX games run on Linux.

For Vulkan, following command should be enough:

```
sudo apt install libvulkan1 mesa-vulkan-drivers vulkan-tools

```

This will install Vulkan library, drivers for Mesa (Nvidia has it's own afaik) and Vulkan tools. After installation, you can try it out and see if it works by opening terminal and typing `vkcube`. If you get a spinning cube inside a window, congrats, Vulkan is working for you!

This is all I had to do to get Vulkan working on my AMD setup. If you have issues, ask around.

[Steam](#steam)
----------

For steam, I recommed installing it through the "tried and true" .deb file. Flatpacks are cool, but they can sometimes have permission issues when they trie to "talk" to other files in the system. Snaps have same thing. *I am not expert on these things*, but with .deb it will very likely work. At least for me it did. :)

To get steam, just open terminal and type

```
sudo apt update
sudo apt install steam

```

It's that simple!

After logging into Steam, do the following:

1. Open Steam settings
2. Select Steam Play
3. Check "Enable Steam Play for supported titles"
4. Also check "Enable Steam Play for all other titles"
5. Keep "Run other titles with:" as "Proton Experimental"

I'll also guide how to get Proton-GE installed, which is community supported version of Proton. This means it gets updated more frequently, and sometimes has better support for some games.

Proton Experimental is pretty solid, but sometimes you need to switch the version of Proton the game uses. To do that, do the following:

1. Right click the game in the Steam game library list
2. Select "Properties..."
3. Select "Compatibility"
4. Check "Force the use of specific Steam Play compatibility tool"
5. From the list, select other Proton version.
6. Try playing around with different versions to see if it helps.

To save some time, check out [ProtonDB](https://www.protondb.com/) where you can search for a specific game, and see how others have gotten the game running (if they have). It's an excellent site you should keep an eye on!

[Lutris](#lutris)
----------

Lutris is a community powered tool that can help running and installing games from GOG.com etc. Since it's community powered, it may be outdated when it comes to some games installation scripts. However, it works as a great launcher for non-Steam titles, since you can use Wine-GE (same as Proton-GE but without the Steam parts) with it!

To install lutris, do the following commands in terminal

```
sudo add-apt-repository ppa:lutris-team/lutris
sudo apt update
sudo apt install lutris

```

First command adds the Lutris repository to your system, second updates all the sources, and third installs Lutris.

Inside Lutris you can log in to GOG.com, install Origin, search for games to install etc. etc. There's so much stuff in Lutris I am not going to cover all of it in this guide.

[Proton-GE and Wine-GE](#proton-ge-and-wine-ge)
----------

Proton and Wine GE versions (GE = GloriousEggroll) are definitely something you want to use, especially with newer titles or more obscure ones. They're versions of Proton and Wine that are updated more frequently by the community, to keep games working.

For example I had problem with EVE Online launcher not working, Proton-GE got update to it within hours from the trouble first appearing. :D

Many people in ProtonDB use Proton-GE, so having same version than others there will help a lot!

For keeping Proton and Wine GE up to date, check out [ProtonUp-Qt](https://davidotek.github.io/protonup-qt/)

It's the easiest, simplest way to update newer GE versions.

[Disable compositing when gaming](#disable-compositing-when-gaming)
----------

Compositor is the thing that makes your desktop look snazzy with all the transparency stuff, shadows etc. When gaming, you want to disable that. It eats some of your perf, and sometimes it can be quite noticeable.

For me some games get +20 fps boost from disabling compositing, which is pretty wild.

The default hotkey to disable compositing is `Alt+Shift+F12`

You can also set, at least on Kubuntu, the window automatically disable compositing.

1. Press ALT+F3 when having some window open you want to disable compositing for
2. Go to "More Actions" -\> "Configure Special Window/Application settings" (it doesn't really matter which, I usually select application)
3. Click "Add Property"
4. Search for "Block Compositing"
5. Set it to "Force" and "Yes"
6. Click "Apply" and "OK"

Now whenever this window/app is open, it will tell compositor to shutdown.

Enjoy your FPS boost! :D

[Optional enhancements](#optional-enhancements)
----------

I will update this list whenever I find out something!

### [DXVK](#dxvk) ###

DXVK is a tool that translates DirectX 11 stuff to Vulkan, so your Linux PC can run it.

Usually Proton does this part for you, but if you need to run stuff without Proton, you may want to install it yourself.

It is pretty simple to install, you should follow the Readme on it's github site: [https://github.com/doitsujin/dxvk](https://github.com/doitsujin/dxvk)

You can omit the `export WINEPREFIX` part completely to make it install itself to your default Wine prefix, which is usually `~/.wine`. However I had to install it to `~/.wine64` as well.

### [Remove Snap](#remove-snap) ###

Alright, without getting into the whole "snaps vs flatpacks" debacle, I am just gonna say that for me, Snaps added additional boot time.

Also things may change for snap in future, so I dont know how future proof this part is.

First, remove everything you have installed with snap.

List all packages:

```
snap list

```

Remove the packages with

```
sudo snap remove --purge package_name_here

```

Delete snap cache

```
sudo rm -rf /var/cache/snapd/

```

Delete snapd

```
sudo apt autoremove --purge snapd

```

Clear snap folder from your home

```
rm -rf ~/snap

```

Now this is pretty important part, and keeps snap being reinstalled to your system:

```
sudo apt-mark hold snapd

```

Now you should be snap free and your boot time should not be as slow! Maybe. For me it helped though!

\+++ **NOTE**: If you break your system, you're on your own. I am not responsible for your systems health.

I hope this guide helped to figure out what you may have to do to get the optimal gaming setup on your Linux system!

Also if I forgot something or you have ideas, enhancements, guides of your own, feel free to drop a comment!