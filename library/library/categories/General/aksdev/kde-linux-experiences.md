+++
title = "KDE Linux experiences"
description = "I daily drove KDE Linux for almost a year and I liked it, but I'm also switching back to Fedora KDE. Here's my ramblings about it all.KDE Linux is the hot new Linux distro from KDE themselves. A"
date = "2026-08-21T15:49:00Z"
url = "https://akselmo.dev/posts/kde-linux-experiences/"
author = "Akseli"
text = ""
lastupdated = "2026-08-24T15:49:14.344854161Z"
seen = false
+++

I daily drove [KDE Linux](https://linux.kde.org/) for almost a year and I liked it, but I'm also switching back to [Fedora KDE](https://fedoraproject.org/kde/). Here's my ramblings about it all.

[KDE Linux](https://linux.kde.org/) is the hot new Linux distro from KDE themselves. At the moment it uses Arch Linux as it's base but with heavy modifications and changes. You can read more about it on the site, but to sum up: It's an atomic/"immutable" distro that does not have any kind of package management outside of installing flatpaks. *(Do note that they're experimenting on using buildstream instead of Arch Linux.)*

As one of the KDE devs I've been daily driving it on my desktop, which I use for both work and leisure (gaming).

The following text can be quite technical as I am viewing this through my developer workflow lense, though I will also touch on regular user things.

[Upsides](#upsides)
----------

![My lizard fursona making an smile face.](/assets/images/emotes/smile.png)

For general purpose computing and KDE dev, things are looking great!

Honestly, it works rather well, considering the alpha status. And for development purposes, the nightly builds of the newest hottest stuff from our git repos is very nice: I don't have to build everything myself every morning.

Though there are some issues with that too: Sometimes the servers are not producing a new image, for reason or another, so I may end up building things myself anyway. Some other times, there is an image that just has some broken change in. Luckily in those situations I can just boot a previous image and use that.

What I really liked though was the [systemd-sysext](https://www.freedesktop.org/software/systemd/man/latest/systemd-sysext.html) workflow. Sysext is a tool that allows me to layer my changes to the system on top of the previous stuff. So when the system is running `/usr/bin/konsole` it actually runs my self-built `/home/akseli/Projects/kde/usr/bin/konsole`. As far as the system is concerned, it's in the same path.

What we currently do in other distros is some environment flag magic to run things from the build-path, instead of `/usr/bin/`. It also works fine, but can be a bit more brittle, especially when testing something like a login manager.

The workflow is simple:

* I build my changes to an app, Plasma desktop component, etc. using kde-builder.
* I refresh the sysext with `run0·systemd-sysext·--always-refresh=yes·refresh;`
  * `sudo` works too, i use `run0` because it has the popup so I notice it after a long build.

* The changes are now live on my system!
  * Apps may need to be restarted sometimes of course.
  * If something goes wrong, I can just clean the sysext folder.

It feels more robust and easier to manage.

So on this front, KDE Linux has been really fun to work with. Perfect for testing and development of all the KDE Plasma stuff.

When it comes to applications from flatpaks, they usually work fine, but they can have the typical flatpak issues: Some app needs a permission to a folder that it can't see, so you have to turn off the app, add permissions, turn back on the app, yadda yadda. Apps that use [XDG portals](https://flatpak.github.io/xdg-desktop-portal/docs/) properly usually work fine, though there's a bug somewhere in the stack that when the system updates (the atomic image of the OS changes), the portal forgets the folder paths and you have to reopen the file for the path to refresh.

When it comes to gaming stuff, Steam Flatpak has worked really well. I have not noticed any issues compared to the native package. Same with Bottles, all has been just fine and nice. Though sometimes there has been bugs with running games, such as games not locking your cursor properly, but they're often gone with the next update as more people spot these bugs now.

[Downsides](#downsides)
----------

![My lizard fursona making an sad face.](/assets/images/emotes/sad.png)

With anything more complex than what the system is intended for, things get difficult.

As an atomic distribution, it is expected that any dev tools that are not already installed on the machine, such as your favorite terminal tools or text editors, you will have to either to download them from the internet like a Windows user (plop the binary in `~/.local/bin`), or use Distrobox/Kapsule/Toolbox... etc.

Container workflow feels cumbersome to me most of the time. For KDE work, since all the tools to build and run applications are already installed on the system, it's rather effortless. But when I want to continue a game project like my [Artificial Rage](https://sr.ht/~akselmo/ArtificialRage/) game project, I would have to enter a distrobox, install all the things, then edit and build the application inside that container. And when I switch a project, it's expected I create a new container for that, and so on.

I don't really like that. I prefer my tools to just be available on the host so I can run them without messing with containers: I have bad memory and am terrible with context switching, so I keep forgetting changing or creating containers.

What I did instead was create bunch of dumb scripts called [dbi](https://sr.ht/~akselmo/dbi/) that are a wrapper for installing tools and "exporting" them from the distrobox so I can use them on host without having to enter them. By exporting I mean they use the `distrobox-export` command that creates a symlink to your `~/.local/bin` with the app name, so you can just run them from terminal like always.

It's not ideal, but it works. Sadly this comes with a performance deficit when running programs like [eza](https://github.com/eza-community/eza), which is `ls` alternative that shows icons. I like my little icons. :) When running `eza` directly on host, it runs immediately, but when using the distrobox version, it will take 1-2 seconds, which gets surprisingly annoying when going through folders. No idea if that could be improved somehow, but the speedbump is likely from the part where it enters the container.

This reveals the larger downside: Lack of "blessed" package management, especially for commandline applications.

I have tried multiple tools, but all of them had some issues:

* Brew, while had great user experience, would sometimes overtake the system python installation and break kde-builder
  * I don't know if this has been fixed? I have not dared to try.

* Coldbrew, which has similarly nice user experience, but the package versions can be hit or miss
* Nix, which is very overcomplicated for this usecase and the user experience is just annoying
  * It works, but you will have to remember to garbage-collect and whatnot every time you update apps
  * Fixable with a nice wrapper, I think
  * However some claim this is "not the Nix way" so I'm left here wanting something this tool can do but is not meant for?

Which left me with always just using distrobox and accepting the performance and UX penalty.

Another thing I miss is having KMail and KOrganizer just installed on my system, talking with my digital clock applet so when I click on it, I would see my calendar event. It's very small thing, but it's huge quality of life feature for me. The Kontact flatpak can't do that, and it's sadly really broken in general.

Lastly, as I work on the [Union](https://invent.kde.org/plasma/union) style engine, flatpak applications will not see the Union styles yet. This means I will have either to [build a separate KDE platform](https://akselmo.dev/posts/flatpak-kdeplatform-ci/) for it myself using the CI, which can be super slow. Especially if I have to build it multiple times to see the changes. I can build some apps myself but more complex ones such as KMail will take a lot of time for me. This is where I miss just installing an app from `dnf` on Fedora, as it can just use the styles on my computer, as the app is also installed on the host like the Union style is.

[Regular use and my use](#regular-use-and-my-use)
----------

For regular user, who plays video games and uses a web browser and never really touches terminal, I think KDE Linux will do very fine, especially when it starts having stable releases that do not update every night. At it's current iteration, it's more a developer tool than something I would recommend for regular user, unless you're super enthusiastic or have spare machines.

But me, being the nerd that writes blogposts about Linux and KDE that I am, I like having more control over the system. I don't mind having all my dev tools cluttered on my host system. *(However if it touches NPM, it's going into a container. Luckily I rarely have to bother with that.)* And in general, atomic distributions can be rather opinionated: If those don't match your view of the distribution, it can be hard to get along as you can't really modify it for your usecase. (Yes I know about ostree.)

So I would say that the more complicated your usecase gets and if you need tools that are not already in the base system, it can get quite cumbersome.

So that's why I'm switching back to Fedora KDE: It gave me all the control I needed. I will likely stil use flatpaks for almost all apps on my machine though, as I do find sandboxing rather useful at times.

I highly encourage anyone who wants to test newest KDE stuff to run KDE Linux on a VM or a secondary machine. I will keep using KDE Linux on my laptop as there I don't have so many different needs, and I want to just install the new shiny stuff from git, not build on it, as building anything on that laptop is super slow.

This whole thing has also made me realise something..

![My lizard fursona making an smile face.](/assets/images/emotes/smile.png)

All distros have their own strenghts, weaknesses and tradeoffs. It's all about choosing what works for you and your system.

My desktop system will benefit from Fedora KDE, but my laptop will benefit from KDE Linux.

I will keep observing how the story of KDE Linux develops. I may try it again on my desktop later, we will see.

Some of you reading might ask: *"But why Fedora KDE?"*

It's one of the nicest distros I've used when it comes to KDE stuff. The people working on Fedora KDE are some of the nicest folks I've met with, and they work very closely with KDE upstream. Fedora KDE follows KDE releases really closely so it feels like I'm always on current release, making the development workflow very easy.

Thanks for reading!

ps. Friend sent me this and I cackled like a hyena.

[![Dumb meme about me liking the popup more than security features](/assets/images/meme/popup.png)](/assets/images/meme/popup.png)

[](https://brid.gy/publish/mastodon)