---
title = "A Word on Omarchy"
description = 'An in-depth look at the currently trending \_Arch\_ Linux configuration that is \_Omarchy\_.'
date = "2025-10-22T10:22:43Z"
url = "https://xn--gckvb8fzb.com/a-word-on-omarchy/"
author = "marius@xn--gckvb8fzb.com (Marius)"
text = ""
lastupdated = "2025-10-24T09:36:19.635183658Z"
seen = true
---





**Pro tip:** If you’ve arrived here via a link aggregator, feel free to skip ahead to the [Summary](#summary) for a conveniently digestible *tl;dr* that spares you all the tedious details, yet still provides enough ammunition to trash-talk this post in the comments of whatever platform you stumbled upon it.

In the recent months, there has been a noticeable shift away from the *Windows* desktop, as well as from *macOS*, to Linux, driven by various frustrations, such as the *Windows 11* *Recall* feature. While there have historically been more than enough Linux distributions to choose from, for each skill level and amount of desired pain, a recent *Arch*-based configuration has seemingly made strides across the Linux landscape: *Omarchy*.

[![Google Search Trends showing an increase for Omarchy](/a-word-on-omarchy/images/omarchy-trend_hu_28ecef8704b00bb0.webp)](/a-word-on-omarchy/images/omarchy-trend.png)Google Search Trends showing an increase for Omarchy

This *pre-configured Arch* system is the brainchild of *David Heinemeier Hansson*, a Danish web developer and entrepreneur known as one of the co-founders of *37signals* and for developing the *Ruby on Rails* framework.

Omwhat?
----------

The name *Omarchy* appears to be a portmanteau of *Arch*, the Linux distribution that *Hansson*’s configuration is based upon, and お任せ, which translates to *omakase* and means to leave something up to someone else (任せる, makaseru, *to entrust*). When ordering *omakase* in a restaurant, you’re leaving it up to the chef to serve you whatever they think is best. *Oma(kase)* + *(A)rch* + *y* is supposedly where the name comes from.

It’s important to note that, contrary to what *Hansson* says in the [introduction video](https://www.youtube.com/watch?v=TcHY0AEd2Uw), *Omarchy* is **not an actual Linux distribution**. Instead, it’s an *opinionated* installation of *Arch* Linux that aims to make it easy to set up and run an *Arch* desktop, seemingly with as much *TUI-hacker-esque* aesthetic as possible. *Omarchy* comes bundled with *Hyprland*, a tiling window manager that focuses on customizability and graphic effects, but [apparently not as much on code quality](https://bugs.gentoo.org/930831) and [safety](https://github.com/hyprwm/xdg-desktop-portal-hyprland/issues/242#issuecomment-2244595525).

However, the sudden *hype* around *Omarchy*, which at this point has attracted attention and seemingly even funding from companies like [Framework (Computer Inc.)](https://x.com/FrameworkPuter/status/1975721241345728683) (*attention*) and [Cloudflare](https://blog.cloudflare.com/supporting-the-future-of-the-open-web/#omarchy-an-independent-development-environment) (*attention and seemingly funding*), made me want to take a closer look at the supposed *cool kid on the block* to understand what it was all about.

Omarchy
----------

[![Arch Linux bootloader](/a-word-on-omarchy/images/bootloader01_hu_84d4b9b8d6c2728.webp)](/a-word-on-omarchy/images/bootloader01.png)Arch Linux bootloader

*Omarchy* is a pre-configured installation of the *Arch* distribution that comes with a TUI installer on a 6.2GB ISO. It ships with a collection of [shell scripts](https://github.com/basecamp/omarchy/tree/master/bin) that use existing FOSS software (e.g. [walker](https://github.com/abenz1267/walker)) to implement individual features. The project is based on the work that the FOSS community, especially the Arch Linux maintainers, have done over the years, and ties together individual components to offer a supposed *ready-to-use* desktop experience. *Omarchy* also adds some links to different websites, disguised as *“Apps”*, but more on that later. This, however, seems to be enough to spark an avalanche of attention and, more importantly, financial support for the project.

Anyway, let’s give *Omarchy* an actual try, and see what *chef Hansson* recommended to us.

Installation
----------

[![Installer prompting for a name](/a-word-on-omarchy/images/install04-name_hu_e5b164fc014d1692.webp)](/a-word-on-omarchy/images/install04-name.png)Installer prompting for a name

The *Omarchy* installer is a simple text user interface that tries to replicate what [*Charm*](https://charm.land) has pioneered with their TUI libraries: A smooth command-line interface that preserves the simplicity of the *good old days*, yet enhances the experience with playful colors, emojis, and animations for the younger, future generation of users. Unlike mature installers, *Omarchy*’s installer script doesn’t allow for much customization, which is probably to be expected with an *“Opinionated Arch/Hyprland Setup”*.

**Info:** *Omarchy* uses [gum](https://github.com/charmbracelet/gum), a *Charm* tool, under the hood.

[![Installer prompting for a password](/a-word-on-omarchy/images/install03-pwd02_hu_d07392e76cd5c683.webp)](/a-word-on-omarchy/images/install03-pwd02.png)Installer prompting for a password

One of the first things that struck me as unexpected was the fact that I was able to use `install` as my user password, an easy-to-guess word that *Omarchy* will also use for the drive encryption, without any resistance from the installer. Most modern Linux distributions actively prevent users from setting easily guessable or brute-forceable passwords.

Moreover, taking into account that the system relies heavily on [sudo](https://www.cve.org/CVERecord/SearchResults?query=sudo) (instead of the more modern [doas](https://wiki.archlinux.org/title/Doas)), and also considering that the default installation configures the maximum number of [password retries to 10](https://github.com/basecamp/omarchy/blob/1e859d37cb7fef6ac687442dc1fe515d01d1302d/install/config/increase-sudo-tries.sh#L2) (instead of the more cautious limit of three), it raises an important question: Does *Omarchy* care about security? Let’s take a look at [the *Omarchy* manual](https://learn.omacom.io/2/the-omarchy-manual/93/security) to find out:

>
>
> Omarchy takes security extremely seriously. This is meant to be an operating system that you can use to do *Real Work* in the *Real World*. Where losing a laptop can’t lead to a security emergency.
>
>

According to the manual, *taking security extremely seriously* means enabling *full-disk encryption* (but without rejecting simple keys), blocking all ports except for 22 (SSH, on a desktop) and 53317 (LocalSend), continuously running `yay -Syu` (even though staying bleeding-edge has [repeatedly proven](https://lwn.net/Articles/1032193/) to be in insufficient security measure in the past) and maintaining a [Cloudflare protected](/thoughts-on-cloudflare/) package mirror.

That’s seemingly all. Hm.

[![Installer prompting for an email address](/a-word-on-omarchy/images/install05-email_hu_9bcc296f8779ec55.webp)](/a-word-on-omarchy/images/install05-email.png)Installer prompting for an email address

Proceeding with the installation, the TUI prompts for an email address, which makes the whole process feel a bit like the *Windows* setup routine. While one might assume *Omarchy* is simply trying to accommodate its new user base, the actual reason appears to be much simpler: [`git config`](https://github.com/basecamp/omarchy/blob/1e859d37cb7fef6ac687442dc1fe515d01d1302d/install/config/git.sh#L19). If, however, you’d be expecting for *Omarchy* to set up [GPG](https://github.com/basecamp/omarchy/blob/1e859d37cb7fef6ac687442dc1fe515d01d1302d/default/gpg/dirmngr.conf#L1) with proper defaults, configure SSH with equally secure defaults, and perhaps offer an option to create new GPG/SSH keys or import existing ones, in order to enable proper commit and push signing for Git, you will be left disappointed.

Unfortunately, none of this is the case. The Git config doesn’t enable commit or push signing, neither the GPG nor the SSH client configurations set secure defaults, and the user isn’t offered a way to import existing keys or create new ones. Given that [*Hansson* himself](https://github.com/basecamp/omarchy/commits/master/) usually does not sign his commits, it seems that these aspects are not particularly high on the project’s list of priorities.

The rest of the installer routine is fairly straightforward and offers little customization, so I won’t bore you with the details, but you can check the screenshots below.

[![0001-01-01 00:00:00 +0000 UTC](/a-word-on-omarchy/images/install01-lang_hu_de9fd845f488aecb.webp) ](/a-word-on-omarchy/images/install01-lang.png)

[![0001-01-01 00:00:00 +0000 UTC](/a-word-on-omarchy/images/install02-user01_hu_373cbe84896dfad7.webp) ](/a-word-on-omarchy/images/install02-user01.png)

[![0001-01-01 00:00:00 +0000 UTC](/a-word-on-omarchy/images/install02-user02_hu_7925e852d2401597.webp) ](/a-word-on-omarchy/images/install02-user02.png)

[![0001-01-01 00:00:00 +0000 UTC](/a-word-on-omarchy/images/install03-pwd01_hu_7aed9fb534775a4d.webp) ](/a-word-on-omarchy/images/install03-pwd01.png)

[![0001-01-01 00:00:00 +0000 UTC](/a-word-on-omarchy/images/install03-pwd02_hu_42866aea3878717e.webp) ](/a-word-on-omarchy/images/install03-pwd02.png)

[![0001-01-01 00:00:00 +0000 UTC](/a-word-on-omarchy/images/install04-name_hu_75f85a54ca65da42.webp) ](/a-word-on-omarchy/images/install04-name.png)

[![0001-01-01 00:00:00 +0000 UTC](/a-word-on-omarchy/images/install05-email_hu_2c65c3336d687e36.webp) ](/a-word-on-omarchy/images/install05-email.png)

[![0001-01-01 00:00:00 +0000 UTC](/a-word-on-omarchy/images/install06-disk_hu_e4cfd4f3fe213dba.webp) ](/a-word-on-omarchy/images/install06-disk.png)

[![0001-01-01 00:00:00 +0000 UTC](/a-word-on-omarchy/images/install07-pride_hu_1f853de3d2378750.webp) ](/a-word-on-omarchy/images/install07-pride.png)

[![0001-01-01 00:00:00 +0000 UTC](/a-word-on-omarchy/images/install08-raid_hu_b06af4d1c62afa49.webp) ](/a-word-on-omarchy/images/install08-raid.png)

First boot
----------

[![Empty desktop with a Waybar statusbar and two notifications](/a-word-on-omarchy/images/desk01-welcome_hu_3d2ea3777c67d875.webp)](/a-word-on-omarchy/images/desk01-welcome.png)Empty desktop with a Waybar statusbar and two notifications

After initially downloading the official ISO file, the first boot of the system greets you with a terminal window informing you that it needs to update *a few packages*. And by *“a few”* it means another 1.8GB. I’m still not entirely sure why the v3.0.2 ISO is a hefty 6.2GB, or why it requires downloading an additional 1.8GB **after** installation on a system with internet access. For comparison, the [official Arch installer image is just 1.4GB in size](https://archlinux.org/download/).

[![Desktop with terminal window in which updater is running](/a-word-on-omarchy/images/desk03-upd_hu_59795e83bc77ebce.webp)](/a-word-on-omarchy/images/desk03-upd.png)Desktop with terminal window in which updater is running

While downloading the updates (which took over an hour for me), and with over 15GB of storage consumed on my hard drive, I set out to experience the full *Omarchy* goodness!

After hovering over a few icons on the *Waybar*, I discovered the menu button on the very left. It’s not a traditional menu, but rather a shortcut to the aforementioned *walker* launcher tool, which contains a few submenus:

[![Desktop with open menu](/a-word-on-omarchy/images/desk04-menu_hu_bf74418d8009def2.webp)](/a-word-on-omarchy/images/desk04-menu.png)Desktop with open menu

The menu reads: Apps, Learn, Trigger, Style, Setup, Install, Remove, Update, About, System;

It feels like a random assortment of categories, settings, package manager subcommands, and actions. From a UX perspective, this main menu doesn’t make much sense to me. But I’m feeling lucky, so let’s just go ahead and type *“Browser”*!

Hm, nothing. *“Firefox”*, maybe? Nope. *“Chrome”*? Nah. *“Chromium”*? No.

Unfortunately the search in the menu is not *universal* and requires you to first click into the *Apps* category.

Apps
----------

The *Apps* category seems to list all available GUI (and some TUI) applications. Let’s take a look at the default apps that *Omarchy* comes with:

[![Desktop with open App menu](/a-word-on-omarchy/images/desk05-apps_hu_8cbbce6194386dde.webp)](/a-word-on-omarchy/images/desk05-apps.png)Desktop with open App menu

The bundled *“apps”* are: 1Password, Alacritty, Basecamp, Bluetooth, Calculator, ChatGPT, Chromium, Discord, Disk Usage, Docker, Document Viewer, Electron 37, Figma, Files, GitHub, Google Contacts, Google Messages, Google Photos, HEY, Image Viewer, Kdenlive, LibreOffice, LibreOffice Base, LibreOffice Calc, LibreOffice Draw, LibreOffice Impress, LibreOffice Math, LibreOffice Writer, Limine-snapper-restore, LocalSend, Media Player, Neovim, OBS Studio, Obsidian, OpenJDK Java 25 Console, OpenJDK Java 25 Shell, Pinta, Print Settings, Signal, Spotify, Typora, WhatsApp, X, Xournal++, YouTube, Zoom;

Aside from the fact that nearly a third of the *apps* are essentially just *browser windows pointing to websites*, which leaves me wondering where the 15GB of used storage went, the selection of apps is also… well, let’s call it *opinionated*, for now at least.

Browser
----------

[![Desktop with open Chromium browser showing the Settings page](/a-word-on-omarchy/images/browser01_hu_18e44f5c2885e5c8.webp)](/a-word-on-omarchy/images/browser01.png)Desktop with open Chromium browser showing the Settings page

Starting with the browser, *Omarchy* comes with *Chromium* by default, specifically version 141.0.7390.107 in my case, which, unlike, for example, [ungoogled-chromium](https://github.com/ungoogled-software/ungoogled-chromium), has disabled support for manifest v2 and thus doesn’t include extensions like *uBlock Origin* or any other advanced add-ons. In fact, the browser is completely vanilla, with no *decent* configuration. The only extension it includes is the [*copy-url*](https://github.com/basecamp/omarchy/tree/master/default/chromium/extensions/copy-url) extension, which serves a rather obscure purpose: Providing a non-intuitive way to copy the current page’s URL to your clipboard using an even less intuitive shortcut (`Shift + Alt + L`) while using any of the *“Apps”* that are essentially just browser windows without browser controls.

Other than that, it’s pretty much stock Chromium. It allows all third-party cookies, doesn’t send “Do Not Track” requests, sends browsing data to *Google Safe Browsing*, but doesn’t enforce HTTPS. It has JavaScript optimization enabled for all websites, which increases the attack surface, and it uses Google as the default search engine. There’s not a single *opinionated* setting in the configuration of the default browser on *Omarchy*, let alone in the choice of browser itself. And the fact that the only extension installed and active by default is an obscure workaround for the lack of URL bars in *“App”* windows doesn’t exactly make this first impression of what is likely one of the most important components for the typical *Omarchy* user very appealing.

Alright, let’s have a look at what is probably the second most important *app* after the browser for many people in the target audience: *Basecamp*!  
 Just kidding. Obviously, it’s the terminal.

Terminal
----------

[![Desktop with open terminal window showing the top command](/a-word-on-omarchy/images/terminal01_hu_b09ded3585f5c990.webp)](/a-word-on-omarchy/images/terminal01.png)Desktop with open terminal window showing the top command

*Omarchy* comes with *Alacritty* by default, which is a bit of an odd choice in 2025, especially for a desktop that seemingly prioritizes form over function, given the ultra-conservative approach the Alacritty developers take toward anything related to form and sometimes even function. I would have rather expected *Kitty*, *WezTerm*, or [Ghostty](/ghost-in-the-shell/).

That said, Alacritty works and is fairly configurable. Unfortunately, like the browser and various other tools such as Git, there’s little to no *opinionated* configuration happening, especially one that would enhance integration with the *Omarchy* ecosystem. *Omarchy* seemingly highlights the availability of *NeoVim* by default, yet doesn’t explicitly configure Alacritty’s *vi mode*, leaving it at its *factory defaults*. In fact, aside from the [`F11` keybinding](https://github.com/basecamp/omarchy/blob/1e859d37cb7fef6ac687442dc1fe515d01d1302d/config/alacritty/alacritty.toml#L19) for full-screen mode, which is a less-than-ideal shortcut for anyone with a [keyboard smaller than 100%](/keyboard/) (unless specifically mapped), the Alacritty config doesn’t define any other shortcuts to integrate the terminal more seamlessly into the supposed *opinionated* workflow.

Not even the desktop’s key-repeat rate is configured to a reasonable value, as it takes about a second for it to kick in.

[![Screensaver captured mid-animation](/a-word-on-omarchy/images/screensaver_hu_8fb43da89bbc19d7.webp)](/a-word-on-omarchy/images/screensaver.png)Screensaver captured mid-animation

**Fun fact:** When you leave your computer idling on your desk, the screensaver you’ll encounter isn’t an actual [*hyprlock*](https://wiki.hypr.land/Hypr-Ecosystem/hyprlock/) that locks your desktop and uses PAM authentication to prevent unauthorized access. Instead, it’s a [shell script that launches a full-screen Alacritty window](https://github.com/basecamp/omarchy/blob/1e859d37cb7fef6ac687442dc1fe515d01d1302d/bin/omarchy-cmd-screensaver#L10) to display a CPU-intensive ASCII animation.

While *Omarchy* does use *hyprlock*, its timeout is set longer than that of the screensaver. Because you can’t dismiss the screensaver with your mouse (only with your keyboard) it might give inexperienced users a false sense of security. This is yet another example of prioritizing gimmicky animations over actual functionality and, to some degree, security.

Bash
----------

Like the browser and the terminal emulator, the [default shell configuration](https://github.com/basecamp/omarchy/tree/master/default/bash) is a pretty basic *B….ash*, and useful extensions like [*Starship*](https://starship.rs) are barely configured. For example, I `cd`ed into a boilerplate Python project directory, activated its *venv*, and expected *Starship* to display some useful information, like the virtual environment name or the Python version. However, none of these details appeared in my prompt.

*“Surely if I do the same in a **Ruby on Rails** project, Starship will show me some useful info!”* I thought, and `cd`ed into a *Rails* boilerplate project. Nope. In fact…

[![Desktop with open terminal showing missing commands](/a-word-on-omarchy/images/rails_hu_eafc5feb7fbac829.webp)](/a-word-on-omarchy/images/rails.png)Desktop with open terminal showing missing commands

*Omarchy* doesn’t come with *Rails* pre-installed. I assume *Hansson*’s target audience doesn’t primarily consist of *Rails* developers, despite the unconditional `alias r`, but let’s not get ahead of ourselves. It is nevertheless puzzling that *Omarchy* doesn’t come with at least *Ruby* pre-installed. I find it a bit odd that the person who literally built the most successful *Ruby* framework on earth is pre-installing *“Apps”* like *HEY*, *Spotify*, and *X*, but **not his own FOSS creation** or even just the *Ruby* interpreter.

If you want *Rails*, you have to navigate through the *menu* to *“Install”*, then *“Development”*, and finally select *"‘Ruby on Rails"* to make *RoR* available on your system. Not just *Ruby*, though. And even going the extra mile to do so still won’t make *Starship* display any additional useful info when inside a *Rails* project folder.

**PS:** The [script](https://github.com/basecamp/omarchy/blob/master/bin/omarchy-install-dev-env) that installs these development tools bypasses the system’s default package manager and repository, opting instead to use *mise* to install interpreters and compilers. This is yet another example of security not being taken quite as seriously as it should be. At the very least, the script should inform the user that this is about to happen and offer the option to use the package manager instead, if the distributed version meets the user’s needs.

**Fun fact:** At the time of writing, *mise* installed Ruby 3.4.7. The latest package available through the package manager is – you guessed it – 3.4.7.

Apropos Bash: Scripts everywhere!
----------

As mentioned earlier, *Omarchy* is built entirely using Bash scripts, and there’s nothing inherently wrong with that. When done correctly and kept at a sane limit, Bash scripts are powerful and relatively easy to maintain. However, the scripts in *Omarchy* are unfortunately riddled with little oversights that can cause issues. Those scripts are also used in places in which a proper software implementation would have made more sense.

Take the theme scripts, for example. If you go ahead and create a new theme under `~/.config/omarchy/themes` and name it `hello\ world`, and then run `omarchy-theme-next` a couple of times until the tool hits your new theme, you can see one effect of these oversights. Nothing catastrophic happened, except now `omarchy-theme-next` won’t work anymore. If you’d want to annoy an unsuspecting *Omarchy* user, you could do this:

```
for letter in {a..z}; do mkdir "$HOME/.config/omarchy/themes/$letter\ x"; done

```

While this is such a tiny detail to complain about, it is an equally low-hanging fruit to write scripts in a way in which this won’t happen. Apart from the numerous places where globbing and word splitting can occur, there are other instances of code that could have also been written a little bit more elegantly. Take [this line](https://github.com/basecamp/omarchy/blob/1e859d37cb7fef6ac687442dc1fe515d01d1302d/bin/omarchy-update-restart#L16), for example:

```
for file in "$HOME"/.local/state/omarchy/restart-*-required; do
  if [ -f "$file" ]; then
    filename=$(basename "$file")
    service=$(echo "$filename" | sed 's/restart-\(.*\)-required/\1/')
    echo "Restarting $service"
    omarchy-state clear "$filename"
    omarchy-restart-"$service"
  fi
done

```

To drop `restart-` and `-required` from the `filename`, you don’t have to call `echo` and pipe to `sed`. Instead, you can simply use Bash’s built-in regex matching to do so:

```
if [[ $filename =~ ^restart-(.*)-required$ ]]; then service="${BASH_REMATCH[1]}"; fi

```

Similarly, in [this line](https://github.com/basecamp/omarchy/blob/1e859d37cb7fef6ac687442dc1fe515d01d1302d/bin/omarchy-upload-log#L114) there’s no need to test for a successful exit code with a dedicated `if [ $? -eq 0 ] ...` check, when you can simply make the call from within the `if` condition:

```
if URL=$(curl -sF "file=@$TEMP_LOG" -Fexpires=24 https://0x0.st); then ...

```

And frankly, I have no idea what [this line](https://github.com/basecamp/omarchy/blob/1e859d37cb7fef6ac687442dc1fe515d01d1302d/bin/omarchy-version-branch#L3) is supposed to be:

```
echo $(git -C "$OMARCHY_PATH" rev-parse --abbrev-ref HEAD)

```

*What are you doing, Hansson? Are you alright?*

Make no mistake to believe that the remarks made above are the only issues with *Hansson*’s scripts in *Omarchy*. While these specific examples are nitpicks, they paint a picture that is only getting less colorful the more we look into the details.

Security and fragility
----------

We can continue to gauge the quality of the scripts by looking beyond just syntax. Take, for example, the *migration* `1752104271.sh`:

```
echo "Switching to polkit-gnome for better fingerprint authentication
compatibility"

if ! command -v /usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1 &>/dev/null; then
  sudo pacman -S --noconfirm --needed polkit-gnome
  systemctl --user stop hyprpolkitagent
  systemctl --user disable hyprpolkitagent
  sudo pacman -Rns --noconfirm hyprpolkitagent
  setsid /usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1 &
fi

```

This script runs five commands in sequence within an `if` condition: first `pacman`, followed by two `systemctl` invocations, then `pacman` again, and finally `setsid`. While this might work as expected *“on a sunny day”*, the first `pacman` command could fail for various reasons. If it does, the subsequent commands may encounter issues that the script doesn’t account for, and the outcome of this *migration* will be differently from what the author anticipated.

For experienced users, the impact in such a case may be minimal, but for others, it may present a more significant hurdle. Furthermore, as can be seen in [here](https://github.com/basecamp/omarchy/blob/38f5a00ad6d84c10180a1012575997a28d952e1c/bin/omarchy-migrate#L11), the invoking process cannot detect if only one of the five commands failed. As a result, the entire migration might be marked as *skipped*, despite changes being made to the system. But let’s continue to look into specifically the *migrations* in just a moment.

The real concern here, however, is the widespread absence of exception handling, either through status code checks for previously executed commands or via dependent executions (e.g., `command_a && command_b`). In most scripts, there is no validation to ensure that actions have the desired effect and the current state actually represents the desired outcome. Almost all sequentially executed commands depend upon one another, yet the author doesn’t make sure that if `command_a` fails the script won’t just blindly run `command_b`.

**Note:** Although `install.sh` sets `set -eEo pipefail`, which would cause a script like the one presented above to fail when the first command fails, the *migrations* are invoked by sourcing the `preflight/all.sh` script. This script, in turn, invokes the `preflight/migrations.sh` script using the helper function `run_logged()`. However, this function executes the `migrations.sh` script in the following way:

```
# Use bash -c to create a clean subshell
bash -c "source '$script'" </dev/null >>"$OMARCHY_INSTALL_LOG_FILE" 2>&1

```

In this case, the `set -eEo pipefail` options are not inherited by the actual *migration*, meaning it won’t stop immediately when an error occurs. This behavior makes sense, as abruptly stopping the installation would leave the system in an undefined state. But even if we ignored that and assumed that *migrations* would stop when the first command would fail, it still wouldn’t actually *handle* the exception, but merely stop the following commands from performing actions on an unexpected state.

To understand the broader issue and its impact on security, we need to dive deeper into the system’s functioning, and especially into *migrations*. This helps illustrate how the fragile nature of *Omarchy* could take a dangerous turn, especially considering the lack of tests, let alone any dedicated testing infrastructure.

### Migrations ###

Let’s start by adding some context and examining how configurations are applied in *Omarchy*. Inspired by his work as a web developer, *Hansson* has attempted to bring concepts from his web projects into the scripts that shape his Linux setup. In *Omarchy*, configuration changes are handled through *migration* scripts, as we just saw, which are in principle *similar* to the database *migrations* you might recall from *Rails* projects. However, unlike *SQL* or the Ruby DSL used in *Active Record Migrations*, these Bash scripts do not merely contain a structured query language; They execute actual system commands during installation. More importantly: They are not idempotent by default!

While the idea of *migrations* isn’t inherently problematic, in this case, it can (and has) introduce(d) issues that go/went unnoticed by the *Omarchy* maintainers for extended periods, but more on that in a second.

The [*migration* files in *Omarchy*](https://github.com/basecamp/omarchy/tree/master/migrations) are a collection of ambiguously named scripts, each containing a set of changes to the system. These changes aren’t confined to specific configuration files or components. They can be entirely arbitrary, depending on what the *migration* is attempting to implement at the time it is written.

To modify a configuration file, these *migrations* typically rely on the `sed -i` command. For instance, the first *migration* intended to change `Setting=` from `A` to `B` might execute something like `sed -i '/Setting=A/Setting=B/' file`. The then following one would have to account for the previous change: `sed -i '/Setting=B/Setting=C/' file`.

Another common approach involves removing a specific line with `sed -i /.../d` and appending the new settings via `echo "Setting=B" >> file`.

However, since multiple *migrations* are executed sequentially, often touching the same files and running the same commands, determining the final state of a configuration file can become a tedious process. There is no clear indication of which *migration* modifies which file, nor any specific keywords (e.g., `UPDATE file SET setting = *`) to *grep* for and help identify the relevant *migration(s)* when searching through the code.

Moreover, because *migrations* rely on fixed paths and vary in their commands, it’s impossible to test them against mock files/folders, to predict their outcome. These scripts can invoke anything from sourcing other scripts to running `sudo rm -rf` commands, with no restrictions on what they can or cannot do. There’s no *“framework”* or *API* within which these scripts operate.

To understand what I mean by that, let’s take a quick look at a fairly widely used *pile of scripts* that is of similar importance to a system’s functionality: *OpenRC*. While the *init.d* scripts in OpenRC are also just that, namely scripts, they follow a relatively well-defined *API*:

```
#!/sbin/openrc-run

extra_commands="checkconfig"
extra_started_commands="reload"

: ${SSHD_CONFDIR:=${RC_PREFIX%/}/etc/ssh}
: ${SSHD_CONFIG:=${SSHD_CONFDIR}/sshd_config}
: ${SSHD_PIDFILE:=${RC_PREFIX%/}/run/${SVCNAME}.pid}
: ${SSHD_BINARY:=${RC_PREFIX%/}/usr/sbin/sshd}
: ${SSHD_KEYGEN_BINARY:=${RC_PREFIX%/}/usr/bin/ssh-keygen}

command="${SSHD_BINARY}"
pidfile="${SSHD_PIDFILE}"
command_args="${SSHD_OPTS} -o PidFile=${pidfile} -f ${SSHD_CONFIG}"

: ${SSHD_SSD_OPTS:=--wait 1000}
start_stop_daemon_args="${SSHD_SSD_OPTS}"

depend() {
  use logger dns entropy
	if [ "${rc_need+set}" = "set" ] ; then
		: # Do nothing, the user has explicitly set rc_need
	else
		local x warn_addr
		for x in $(awk '/^ListenAddress/{ print $2 }' "$SSHD_CONFIG" 2>/dev/null) ; do
			case "${x}" in
				0.0.0.0|0.0.0.0:*) ;;
				::|\[::\]*) ;;
				*) warn_addr="${warn_addr} ${x}" ;;
			esac
		done
		if [ -n "${warn_addr}" ] ; then
			need net
			ewarn "You are binding an interface in ListenAddress statement in your sshd_config!"
			ewarn "You must add rc_need=\"net.FOO\" to your ${RC_PREFIX%/}/etc/conf.d/sshd"
			ewarn "where FOO is the interface(s) providing the following address(es):"
			ewarn "${warn_addr}"
		fi
	fi
}

checkconfig() {
	checkpath --mode 0755 --directory "${RC_PREFIX%/}/var/empty"

	if [ ! -e "${SSHD_CONFIG}" ] ; then
		eerror "You need an ${SSHD_CONFIG} file to run sshd"
		eerror "There is a sample file in /usr/share/doc/openssh"
		return 1
	fi

	${SSHD_KEYGEN_BINARY} -A || return 2

	"${command}" -t ${command_args} || return 3
}

start_pre() {
  checkconfig || return $?
}

stop_pre() {
  if [ "${RC_CMD}" = "restart" ] ; then
		checkconfig || return $?
	fi
}

reload() {
	checkconfig || return $?
	ebegin "Reloading ${SVCNAME}"
	start-stop-daemon --signal HUP --pidfile "${pidfile}"
	eend $?
}

```

**Note:** I’m not claiming that *OpenRC*’s implementation is flawless or the ultimate solution, far from it. However, given the current state of the *Omarchy* project, it’s fair to say that *OpenRC* is **significantly** better within its existing constraints.

*Omarchy*, however, does not use any sort of *API* for that matter. Instead, scripts can basically do whatever they want, in whichever way they deem adequate. Without such well defined *interfaces*, it is hard to understand the effects that *migrations* will have, especially when changes to individual services are split across a number of different *migration* scripts.

Here’s a fun challenge: Try to figure out how your `/etc/systemd/` folder looks after installation by only inspecting the *migration* files.

To make matters worse, other scripts (outside the *migration* folder) may also modify configurations that were previously altered by *migrations*, at runtime, such as `/etc/systemd/resolved.conf`.

**Note:** To the disappointment of every *NixOS* user, unlike database *migrations* in *Rails*, the *migrations* in *Omarchy* don’t support *rollbacks* and, judging by their current structure, are unlikely to do so moving forward. The only chance *Omarchy* users have in case a *migration* should ever brick their existing system is to make use of the available [snapshots](https://wiki.archlinux.org/title/Snapper).

All of this (the lack of *interfaces*, the missing exception handling and checks for desired outcomes, the overlapping modification, etc.) creates a chaotic environment that is hard to overview and maintain, which can severely compromise system integrity and, by extension, security.

Want an example?

### Firewall ###

On my fresh installation, I wanted to validate the following claim from the [manual](https://learn.omacom.io/2/the-omarchy-manual/93/security):

>
>
> Firewall is enabled by default: All incoming traffic by default except for port 22 for ssh and port 53317 for LocalSend. We even lock down Docker access using the ufw-docker setup to prevent that your containers are accidentally exposed to the world.
>
>

What I discovered upon closer inspection, however, is that ***Omarchy*’s firewall doesn’t actually run, despite its pre-configured ruleset**. Yes, you read that right, everyone installing the v3.0.2 ISO (and presumably earlier versions) of *Omarchy* is left with a system that doesn’t block any of the ports that individual software might open during runtime.

Please bear in mind that apart from the full-disk encryption, the firewall is the only security measure that *Omarchy* puts in place. And it’s off by default. Only once I manually enabled and started `ufw` using `systemctl enable ufw`/`systemctl start ufw`, it did activate the rules mentioned in the handbook.

As highlighted in [the original issue](https://github.com/basecamp/omarchy/issues/1423), it appears that, with the chaos that are the *migration-*, *preflight-* and *first-run-* scripts no one ever realized that you need to **tell `systemd` to explicitly enable a service** for it to actually run. And because it’s all made up of Bash scripts that can do whatever they want, you cannot easily test these things to notice that the state that was expected for a specific service was not reached.

Unlike in *Rails*, where you can initialize your (test) database and run each *migration* manually if necessary to make sure that the schema reaches the desired state and that the database is *seeded* correctly, this agglomeration of Bash scripts is not structured data. Hence, applying the same principle to something as arbitrary as a Bash script is not as easily possible, at least not without clearly defined structures and *interfaces*.

As a user who trusted *Omarchy* to secure their installation, I would be upset, to say the least. The system failed to keep users safe, and more importantly, nobody noticed for a long time. There was no hotfix ISO issued, nor even a heads-up to existing users alongside the implemented fix ([e.g. `eselect news read`](https://devmanual.gentoo.org/general-concepts/news/index.html)). While mistakes happen, simply brushing them under the rug feels like rather negligent behavior. When looking into the future, the mess that is the Bash scripts certainly won’t decrease in complexity, making me doubt that things like these won’t happen again.

**Note:** The firewall fix was listed in v2.1.1. However, on my installation of v3.0.2 the firewall would still not come up automatically. I double-checked this by running the installation of v3.0.2 twice, and both times the firewall would not autostart after the second reboot.

While writing this post, v3.1.0 (*update: v3.1.1*) was released and I also checked the issue there. v3.1.0 appears to have finally fixed the firewall issue. Having that said, it shows how much of a mess the whole system is, when things that were identified and supposedly fixed multiple versions ago still don’t work in newer releases weeks later.

**Tl;dr:** v3.1.0 appears to be the first release to actually fix the firewall issue, even though it was identified and presumably fixed in v2.1.1, according to the changelog.

### SSH ###

With the firewall active, it becomes apparent that *Omarchy*’s `ufw` configuration does indeed leave port 22 (SSH) open, even though the SSH daemon is not running by default. While I couldn’t find a clear explanation for why this port is left open on a desktop system without an active SSH server, my assumption is that it’s intended to allow the user to remotely access their workstation should they ever need to.

It’s important to note that the `sshd_config` file in *Omarchy*, like many other system files, remains unchanged. Users might reasonably assume that, since *Omarchy* intentionally leaves the SSH port open, it must have also configured the SSH server with sensible defaults. Unfortunately, this is not the case.

In a typical Arch installation, users would eventually come across the [*“Protection”* section](https://wiki.archlinux.org/title/OpenSSH#Protection) on the OpenSSH wiki page, where they would learn about the crucial settings that should be adjusted for security reasons. However, when using a system like *Omarchy*, which is marketed as an *opinionated* setup that *takes security seriously*, users might expect these considerations to be handled for them, making it all the more troubling that no sensible configuration is in place, despite the deliberate decision to leave the SSH port open for future use.

### Taking security seriously? ###

*Hansson* seemingly struggles to get even basics like `ufw` right. The fact that there’s so little oversight, that users are allowed to set weak password for both, their account and drive encryption, and that the only other security measure put in place, the firewall, simply hasn’t been working, does not speak in favor of *Omarchy*.

**Info:** `ufw` is abstraction layer that simplifies managing the powerful `iptables`/`nftables` firewall and it stands for “**u**ncomplicated **f**ire**w**all”.

Going into this review I wasn’t expecting [a hardened Linux installation](/hardened-gentoo-with-full-disk-encryption-on-the-star-labs-starbook-mk-vi/) with *SELinux*, intrusion detection mechanisms, and all these things. But *Hansson* is repeatedly addressing users of *Windows* and *macOS* (operating systems with working firewalls and notably more security measures in place) who are frustrated with their OS, as a target audience. At this point, however, *Omarchy* is a significantly worse option for those users.

Not only does *Omarchy* give a hard pass on *Linux Security Modules*, [*linux-hardened*](https://archlinux.org/packages/extra/x86_64/linux-hardened/), *musl*, *hardened\_malloc*, or tools like [*OpenSnitch*](https://github.com/evilsocket/opensnitch), and fails to properly address security-related topics like SSH, GPG or maybe even [AGE](https://github.com/FiloSottile/age) and [AGE/Yubikey](https://github.com/str4d/age-plugin-yubikey), but it in fact **weakens the system security** with changes like the increase of `sudo` and login password retries and the decrease of [*faillock* timeouts](https://github.com/basecamp/omarchy/blob/1e859d37cb7fef6ac687442dc1fe515d01d1302d/install/config/increase-lockout-limit.sh#L1).

*Omarchy* appears to be **undoing security measures** that were put in place by the software- and by the *Arch*-developers, while the basis it uses for building the system does not appear to be reliable enough to protect its users from future mishaps.

A *hacker*-esque experience?
----------

Then there is the big picture of *Omarchy* that *Hansson* tries to curate, which is that of a TUI-centered, *hacker*-esque desktop that promises *productivity* and so on. He even goes as far as calling it *“a pro system”*.

However, as we clearly see from the implementation, configuration and the project’s approach to security, this is unlike anything you would expect from *a pro system*. The entire image of a TUI-centered productivity environment is further contradicted in many different places, primarily by the lack of *opinions* and *configuration*. If the focus is supposed to be on *“pro”* usage, and especially the command-line, then…

* Why don’t any of the Bash scripts and functions provide a `--help` flag or maybe even autocompletions?
* Why are there no *Omarchy*-related `man` pages?
* Why does the system come with *GNOME Files*, which requires several *gvfs* processes running in the background, yet it lacks basic command-line file managers like `mc` or `lf`?
* Why would you [define `r` as an `alias` for `rails`](https://github.com/basecamp/omarchy/blob/1e859d37cb7fef6ac687442dc1fe515d01d1302d/default/bash/aliases#L28) unconditionally, but not install *Rails* by default?
* Why bother shipping tools like `btop` and `bat` but fail to provide aliases for `top`, `cat`, etc to make use of these tools by default?
* Why **wouldn’t** you set up an O.G. alias like `ll` [in your defaults](https://github.com/basecamp/omarchy/blob/1e859d37cb7fef6ac687442dc1fe515d01d1302d/default/bash/aliases#L2)?
* Why ship the *GNOME Calculator* but not include any command-line calculators (e.g., `bc`, `eva`), forcing users to rely on basics like `expr 2 \* 2`?
* Why ship the full suite of LibreOffice, but not a single useful terminal tool like `sc-im`, `slides`, `pandoc`, etc.?
* Why define functions like [`format-drive`](https://github.com/basecamp/omarchy/blob/1e859d37cb7fef6ac687442dc1fe515d01d1302d/default/bash/functions#L19) with `ext4` and without an option to enable encryption, when the rest of the system uses `dm-crypt` and `btrfs`? And if it’s intended for use by inexperienced users primarily for things like USB sticks, why not make it `exfat` instead of `ext4` so the drive works across most operating systems?
* Why not define actually useful functions like [`extract`](https://github.com/ohmyzsh/ohmyzsh/blob/master/plugins/extract/extract.plugin.zsh) or `urlencode`/`urldecode`?
* Why doesn’t your Bash configuration include history- and command-flag-based auto-suggestions? Or a terminal-independent *vi mode*? Or at least more consistent Emacs-style shortcuts?
* Why don’t you include some *quality-of-life* tools like `gitui` or some other [command-line](/command-line/) community favorites? If you had to squeeze in *ChatGPT*, why not have [Crush](https://github.com/charmbracelet/crush) available by default?
* Why does the base install with a single running *Alacritty* window occupy over 2.2GB of RAM right after booting? For comparison: My [Gentoo system](/minimalist-and-functional-desktop-environment-without-xorg/) with a single instance of Ghostty ends up at around half of that.
* Why set up *NeoVim* but not define `vim` as an alias for `nvim`, or even create a symlink?
* And speaking of *NeoVim*, why does the supposedly *opinionated* config make *NeoVim* feel slower than *VSCode*?
* …

The configuration doesn’t live up to its sales pitch, and there are many aspects that either don’t make sense or aren’t truly *opinionated*, meaning they’re no different from a standard *Arch* Linux installation. In fact, I would go as far as to say that *Omarchy* is barely a ready-to-use system at all out of the box and requires **a lot** of in-depth configuration of the underlying *Arch* distribution for it to become actually useful.

Let’s look at only a few details.

Missing a few screws, literally
----------

There are some fairly basic things you’ll miss on the *“lightweight”* 15GB installation of *Omarchy*:

### RAID ###

With the attention *Omarchy* is receiving, particularly from *Framework (Computer Inc.)*, it is surprising that there is no option to install the system on RAID1 hardware:

[![Installer prompting to select one of two available drives](/a-word-on-omarchy/images/install08-raid_hu_d48ec4436dd1ac70.webp)](/a-word-on-omarchy/images/install08-raid.png)Installer prompting to select one of two available drives

I would argue that RAID1 is a fairly common use case, especially with *Framework (Computer Inc.)* 16" laptops, which support a secondary storage device.

Considering that *Omarchy* is positioning itself to compete against e.g. *macOS* with *TimeMachine*, yet it does not include an automated off-drive backup solution for user data by default – which by the way is just another notable shortcoming we could discuss – and given that configuring a RAID1 root with encryption is notoriously tedious on Linux, even for advanced users, the absence of this option is especially disappointing for the intended audience. Even moreso when neither the installer nor the post-installation process provides any means to utilize the additional storage device, leaving inexperienced users seemingly stuck with the `format-drive` command.

### Swap ###

*Omarchy* does not come with a dedicated *swap* partition, leaving me even more puzzled about its use of 15GB of disk space. I won’t talk through why having a dedicated *swap* partition that is ideally encrypted using the same `dm-crypt` mechanisms already in place is a good idea. This topic has been thoroughly discussed and written about countless times. However, if you, like seemingly the *Omarchy* author, are unfamiliar with the benefits of having *swap* on Linux, I highly recommend reading [this insightful write-up](https://chrisdown.name/2018/01/02/in-defence-of-swap.html) to get a better understanding.

What I will note, however, is that the current configuration does not appear to support *hibernation* via the `systemctl hibernate` command through the use of a dynamic *swap file*. This leads me to believe that hibernation may not function on *Omarchy*. Given the ongoing battery drain issues with especially *Framework (Computer Inc.)* laptops while in *suspend* mode, it’s clear that hibernation is an essential feature for many Linux laptop users.

Additionally, it’s hard to believe that *Hansson*, a former *Apple evangelist*, wouldn’t be accustomed to the simple act of closing the lid on his laptop and expecting it to enter a light sleep mode, and eventually transitioning into deep sleep to preserve battery life. If he had ever used *Omarchy* day-to-day on a laptop in the same way most people use their *MacBooks*, he would almost certainly have noticed the absence of these features.

This further reinforces the impression that *Omarchy* is a project designed to appear robust at first glance, but reveals a surprisingly hollow foundation upon closer inspection.

### Laptop ###

Let’s keep our focus on laptop use. We’ve seen *Hansson* showcasing his *Framework (Computer Inc.)* laptop on camera, so it’s reasonable to assume he’s using *Omarchy* on a laptop. It’s also safe to say that many users who might genuinely want to try *Omarchy* will likely do so on a laptop as well. That said, as we’ve established before, closing the laptop lid doesn’t seem to trigger *hibernate* mode in *Omarchy*. But if you close the lid and slip the laptop into your backpack, surely it would activate some power-saving measures, right? At the very least, it should blank the screen, switch the CPU governor to *powersaving*, or perhaps even initiate *suspend to RAM*?

Well…

[![Terminal output showing missing laptop-mode, tlp, acpi, etc.](/a-word-on-omarchy/images/terminal02-laptop_hu_5dbb547126a4bf96.webp)](/a-word-on-omarchy/images/terminal02-laptop.png)Terminal output showing missing laptop-mode, tlp, acpi, etc.

Of course, I can’t test these scenarios firsthand, as I’m evaluating *Omarchy* within a securely confined virtual machine, where any unintended consequences are contained. Still, based on the system’s configuration, or more accurately the lack thereof, it seems unlikely that an *Omarchy* laptop will behave as expected. The system might switch power profiles due to the [*power-profiles-daemon*](https://linrunner.de/tlp/faq/ppd.html) when not plugged in, yet its functionality is not comparable to a properly configured `tlp` or similar. It seems improbable that it will enter *suspend to RAM* or *hibernate* mode, and it’s doubtful any other power-saving measures (like temporarily halting non-essential background processes) will be employed to conserve battery life.

### Mail ###

Although the configuration comes with an *“app”* for mail, namely *HEY*, that platform [does not support standard mail protocols](https://www.hey.com/faqs/#can-i-check-my-hey-email-with-my-existing-email-app). I don’t think it’s a hot take to say that probably 99% of *Omarchy*’s potential users will need to work with an email system that *does* support IMAP and SMTP, however. Yet, the base system offers zero tools for that. I’m not even asking for anything *“fancy”* like `neomutt`; *Omarchy* unfortunately doesn’t even come with the most basic tools like the `mail` command out of the box.

Whether you want to send email through your provider, get a simple summary for a scheduled *Cron* job delivered to your local mailbox, or just debug some mail-related issue, the `mail` command is relatively essential, even on a desktop system, but it is nowhere to be found on *Omarchy*.

### Cron ###

Speaking of which: *Cron* jobs? Not a thing on *Omarchy*. Want to automate backing up some files to remote storage? Get ready to dive into the wonderful world of [`systemd` timers](https://wiki.archlinux.org/title/Systemd/Timers), where you’ll spend hours figuring out where to create the necessary files, what they need to contain, and how to activate them. *Omarchy* could’ve easily included a *Cron* daemon or at least `systemd-cron` for the sake of convenience. But I guess this is a *pro system*, and if the user needs periodic jobs, they will have to figure out `systemd`.

*Omarchy* is, after all, `systemd`-based …

### Docker ###

… and that’s why it makes perfect sense for it to use rootless [*Podman*](https://wiki.archlinux.org/title/Podman) containers instead of Docker. That way, users can take advantage of `systemd` [*quadlets*](https://wiki.archlinux.org/title/Podman#Quadlet) and all the glorious integration.

Unfortunately, *Omarchy* doesn’t actually use *Podman*. It uses plain ol’ Docker instead.

### Power ###

Like most things in *Omarchy*, power monitoring and alerting are handled through [a script](https://github.com/basecamp/omarchy/blob/master/bin/omarchy-battery-monitor), which is executed every 30 seconds via a `systemd` timer. That’s your crash course on `systemd` timers right there, *Omarchy* users! This script queries `upower` and then uses `awk` to parse the battery percentage and state. It’s almost comical how *hacky* the implementation is.

Given that the system is already using *UPower*, which transmits power data via *D-Bus*, there’s a much cleaner and more efficient way to handle things. You could simply use a piece of software that connects to *D-Bus* to continuously monitor the power info *UPower* sends. Since it’s already dealing with *D-Bus*, it can also send a desktop notification directly to whatever notification service you’re using (like `mako` in *Omarchy*’s case). No need for `awk`, `notify-send`, or a periodic Bash script triggered by a `systemd` timer.

*“But where could I possibly find such a piece of software?”*, you might ask. Worry not, *Hr. Hansson*, I have [just the thing you need](https://github.com/mrusme/zpoweralertd)!

That said, I can understand that you, *Hr. Hansson*, might be somewhat reluctant to place your trust in software created by someone who is actively delving into the intricacies of your project, rather than merely offering a superficial YouTube interview to casually navigate the Hyprland UI for half an hour. Of course, *Hr. Hansson*, you could have always taken the initiative to develop a more robust solution yourself, in a proper, lower-level language, and neatly integrated it into your *Omarchy* repository. But we will explore why this likely hasn’t been a priority for you, *Hr. Hansson*, in just a moment.

### Tmux/screen ###

While the author’s [previous attempt](https://omakub.org) for a *developer setup* still came with [*Zellij*](/you-dont-need-a-terminal-multiplexer-on-your-desktop/#one-more-thing), this time his *opinions* seemingly changed and *Omarchy* doesn’t include *Zellij*, or *Tmux* or even *screen* anymore. And nope, *picocom* isn’t there either, so good luck reading that *Arduino* output from `/dev/ttyUSB`.

### Rsync ###

That moment, when you realize that you’ve spent hours figuring out [`systemd` timers](#cron), only to find out that you can’t actually back up those files to a remote storage because there’s no `rsync`, let alone `rclone` or `restic`. At least there is the `cp` command. :-)

### tcpdump ###

Nope.

### netcat ###

Unfortunately not, but *Omarchy* comes with `telnet` and `telnetd` by default.

### Et cetera ###

I could go on and on, and scavenge through the rest of the unconfigured system and the scripts, like for example the `omarchy-install-tailscale` one, where *Omarchy* once again seems to prefer `curl | sh`-ing random scripts from the internet (or anyone *man-in-the-middle*-ing it) rather than using the system package manager to install *Tailscale*. But, for the sake of both your sanity and mine, I’ll stop here.

As we’ve seen, *Omarchy* is more *unconfigured* than it is *opinionated*. Can you simply install all the missing bits and piece and configure them yourself? Sure! But then what is the point of this supposed *“perfect developer setup”* or *“pro system”* to begin with?

In terms of the *“opinionated”* buzzword, most actual opinions I’ve come across so far are mainly about colors, themes, and security measures. I won’t dare to judge the former two, but as for the latter, well, unfortunately they’re *the wrong opinions*. In terms of implementation: *Omarchy* is just scripts, scripts, and more scripts, with no proper structure or (CI) tests.

**BTW:** A quick shout out to your favorite *tech influencer*, who probably has at least one video *reviewing* the *Omarchy* project without mentioning anything along these lines. It is unfortunate that these influential people barely scratch the surface on a topic like this, and it is even more saddening that recording a 30 minute video of someone clicking around on a UI seemingly counts as a legitimate *“review”* these days. The primary focus for many of these people is seemingly on pumping out *content* and generating *hype* for views and attention rather than providing a thoughtful, thorough analysis.

Documentation
----------

(*Alright, we’re almost there. Stick with me, we’re in the home stretch.*)

The [*Omarchy* manual](https://learn.omacom.io/2/the-omarchy-manual): The ultimate repository of *Omarchy* wisdom, all packed into 33 pages, clocking in at little over 10,000 words. For context, this post on *Omarchy* alone is almost 10,000 words long.

As is the case with the rest of the system, the documentation also adheres to *Hansson*’s *form over function* approach. I’ve mentioned this before, but it bears repeating: *Omarchy* doesn’t offer any built-in `--help` for its scripts, let alone auto-completion, nor does it come with traditional `man` pages. The documentation is tucked away in yet another SaaS product from *Hansson*’s company (*Writebook*) and its focus is predominantly on themes, more themes, creating your own themes, and of course, the [ever-evolving](https://github.com/basecamp/omarchy/releases/) hotkeys. Beyond that, the manual mostly covers how to locate configuration files for individual UI components and offers guidance on how to configure Hyprland for a range of what feels like outrageously expensive peripherals. For the truly informative content, look no further than the *shell function* guide, with gems such as:

>
>
> `format-disk [/dev/drive]`: Format an entire disk with a single ext4 partition. Be careful!
>
>

*Wow, thanks, Professor Oak, I will be!* :-)

On a more serious note, though, the documentation leaves much to be desired, as evidenced by the user questions over on the [GitHub discussions page](https://github.com/basecamp/omarchy/discussions). Take this [question](https://github.com/basecamp/omarchy/discussions/2386), which unintentionally sums up the *Omarchy* experience for probably many inexperienced users:

>
>
> I installed this from github without knowing what I was getting into (the page is very minimal for a project of this size, and I forgot there was a link in the footnotes). Please tell me there’s a way to remove Omarchy without wiping my entire computer. I lost my flashdrive, and don’t have a way to back up all my important files anymore.
>
>

While this may seem comical on the surface, it’s a sad testament to how *Omarchy* appears to have a knack for luring in unsuspecting users with flashy visuals and so called *“reviews”* on YouTube, only to leave them stranded without adequate documentation. The only recourse? Relying on the solid *Arch* docs, which is an abrupt plunge into the deep end, given that *Arch* assumes you’re at least familiar with its very basics and that **you** know how **you** set up **your own** system.

Maybe GitHub isn’t the most representative forum for the project’s support; I haven’t tried Discord, for example. But no matter where the community is, users should be able to fend for themselves with proper documentation, turning to others only as a last resort.

What could have been done better?
----------

It’s difficult to compile a list of things that could have made *Omarchy* a reasonable setup for people to consider, mainly because, in my opinion, the core of the setup – scripts doing things they shouldn’t or that should have been handled by other means (e.g., the package manager) – is fundamentally flawed. That said, I do think it’s worth mentioning a few improvements that, if implemented, could have made *Omarchy* a *less bad* option.

### Fix config updates ###

Configuration files should not be altered through loose *migration* scripts. Instead, updated configuration files should be provided directly (ideally via packages, see below) and applied as patches using a mechanism similar to [*etc-update*](https://github.com/gentoo/portage/blob/master/bin/etc-update) or *dpkg*. This approach ensures clarity and reduces confusion, preserves user modifications, and aligns with established best practices.

```
Configuration file '/etc/apache2/mods-available/ssl.conf'
    ==> Modified (by you or by a script) since installation.
    ==> Package distributor has shipped an updated version.
    What would you like to do about it ? Your options are:
    Y or I : install the package maintainer's version
    N or O : keep your currently-installed version
    D      : show the differences between the versions
    Z      : start a shell to examine the situation
    The default action is to keep your current version.
    *** ssl.conf (Y/I/N/O/D/Z) [default=N] ?

```

Improve on the user experience where necessary and maybe even contribute improvements back.

### Build software ###

Use proper software implementations where appropriate.

Want a fancy screensaver? Extend *Hyprlock* instead of awkwardly repurposing a fullscreen terminal window to mimic one.

Need to display power status notifications without relying on GNOME or KDE components? Develop a lightweight solution that integrates cleanly with the desktop environment, or extend the existing Waybar battery widget to send notifications.

Don’t like existing Linux *“App Store”* options? Build your own, rather than diverting a launcher from its intended use only to run Bash scripts that install packages from third-party sources on a system that has a perfectly good package manager in place.

### Package software properly ###

Arguably the most crucial improvement: Package the required software and install it via the system’s package manager. Avoid relying on brittle scripts, third-party tools like *mise*, or worse, piping `curl` scripts directly into `sh`.

I understand that the author is coming from an operating system where it’s *sort of fine* to `curl | sh` and use software like `rvm` to manage individual Ruby versions. However, we have to take into consideration that specifically *macOS* has a **significantly** more advanced security architecture in place than (unfortunately) most out-of-the-box Linux installations have, let alone *Omarchy*. On *Hanssons* setup the `curl | sh` approach is neither sensible nor advisable, especially given that it’s ultimately a system that is built around a proper package manager. If you want multiple versions of Ruby, package them and use [slotting](https://devmanual.gentoo.org/general-concepts/slotting/) (or the equivalent of it on the distribution that you’re using, e.g. installation to version-specific directories on *Arch*).

Much of what the *migrations* and other scripts attempt to do could, and should have been achieved through well-maintained packages and the proven mechanisms of a package manager.

### Have (decent) opinions ###

Whether it’s *Gentoo*, *NixOS*, or *Ubuntu*, each distribution operates in its own unique way, offering users a distinct set of tools and defaults. Yet, they all share one common trait: A set of strong, well-defined opinions that shape the system. *Omarchy*, in contrast, feels little more than a *glorified collection of Hyprland configurations* atop an unopinionated, barebones foundation. If you’re going to have opinions, don’t limit them to just nice colors and cute little wallpapers. Form opinions on the tools that truly matter, on how those tools should be configured, and on the more intricate, challenging aspects of the system, not just the surface-level, easy choices. Have opinions on the really sticky and complicated stuff, like power-saving modes, redundant storage, critical system functionality, and security. Above all, cultivate *reasonable* opinions, ones that others can get behind, and build a system that reflects those.

### Provide proper documentation ###

Comprehensive documentation is essential to help users understand how the system works. Currently, there’s no clear explanation for the myriad Bash scripts, nor is there any user-facing guidance on how global system updates affect individual configuration files.

Summary
----------

(*finally…*)

*Omarchy* feels like a project created by a Linux newcomer, utterly captivated by all the *cool things that Linux can do*, but lacking the architectural knowledge to get the basics right, and the experience to give each tool a thoughtful review. Instead of carefully selecting software and ensuring that everything works as promised, the approach seems to be more about throwing everything that somehow *looks cool* into a pile. There’s no attention to sensible defaults, no real quality control, and certainly no verification that the setup won’t end up causing harm or, at the very least, frustration for the user. The primary focus seems to be on creating a visually appealing but otherwise hollow *product*.

Moreover, the entire *Omarchy* ecosystem is held together by often poorly written Bash scripts that lack any structure, let alone properly defined *interfaces*. Software packages are being installed via `curl | sh` or similar mechanisms, rather than provided as properly packaged solutions via a package manager. *Hansson* is quick to label *Omarchy* a *Linux distribution*, yet he seems reluctant to engage with the foundational work that defines a true distribution: **The development and proper packaging (“distribution”) of software**.

Whenever *Hansson* seeks a software (or software version) that is unavailable in the *Arch* package repositories, he bypasses the proper process of packaging it for the system. Instead, he resorts to running arbitrary scripts or tools that download the required software from third-party sources, rather than offering the desired versions through a more standardized package repository.

*Hansson* also appears to avoid using lower-level programming languages to implement features in a more robust and maintainable manner **at all costs**, often opting instead for makeshift solutions, such as executing *“hacky”* Bash scripts through `systemd` timers. A closer look at his [GitHub profile](https://github.com/dhh) and [Basecamp’s repositories](https://github.com/orgs/basecamp/repositories) reveals that *Hansson* has seemingly worked exclusively with *Ruby* and *JavaScript*, with most contributions to more complex projects, like `kamal-proxy` or `thruster`, coming from other developers. This observation is not meant to diminish the author’s profession and accomplishments as a web developer, but it highlights the lack of experience in areas such as systems programming, which are crucial for the type of work required to build and maintain a proper Linux distribution.

Speaking of packages, the system gobbles up 15GB of storage on a basic install, yet fails to deliver truly useful or high-quality software. It includes a hodgepodge of packages, like OpenJDK and websites of paid services in *“App”*-disguise, but lacks any real optimization for specific use cases. Despite *Omarchy* claiming to be *opinionated* most of the included software is left at its default settings, straight from the developers. Given *Hansson*’s famously strong opinions on everything, it makes me wonder if the *Omarchy* author simply hasn’t yet gained the experience necessary to develop clear, informed stances on individual configurations. Moreover, his prioritization of his paid products like *Basecamp* and *HEY* over his own free software like *Rails* leaves a distinctly bitter aftertaste when considering *Omarchy*.

What’s even more baffling is that seemingly no one at *Framework (Computer Inc.)* or *Cloudflare* appears to have properly vetted the project they’re directing attention (and sometimes financial support) to. I find it hard to believe that knowledgeable people at either company have looked at *Omarchy* and thought, *“Out of **all the Linux distributions** out there, this barely configured stack of poorly written Bash scripts on top of *Arch* is clearly the best choice for us to support!”* In fact, I would go as far as to call it *a slap in the face* to each and every proper distro maintainer and FOSS developer.

Furthermore, I fail to see the supposed gap *Omarchy* is trying to fill. A fresh installation of *Arch* Linux, or any of its established derivatives like *Manjaro*, is by no means more complicated or time-consuming than *Omarchy*. In fact, it is *Omarchy* that complicates things further down the line, by including a number of unnecessary components and workarounds, especially when it comes to its chosen desktop environment. The moment an inexperienced user wants or needs to change anything, they’ll be confronted with a jumbled mess that’s difficult to understand and even harder to manage.

If you *want* Arch but are too lazy to read through [its fantastic Wiki](https://wiki.archlinux.org/), then look at [*Manjaro*](https://www.urbandictionary.com/define.php?term=Manjaro), it’ll take care of you. If that’s still not to your liking, maybe explore something [completely different](https://distrowatch.com).

On the other hand, if you’re just looking to tweak your existing desktop, check out other people’s [dotfiles](https://github.com/topics/dotfiles) and dive into the [unixporn](https://lemmy.ml/c/unixporn) communities for inspiration.

As boring as *Fedora Workstation* or *Ubuntu Desktop* might sound, these are solid choices for anyone who doesn’t want to waste time endlessly configuring their OS and, more importantly, wants something that works right out of the box and **actually** keeps them safe. *Fedora Workstation* comes with *SELinux* enabled in *“enforcing”* mode by default, and *Ubuntu Desktop* utilizes *AppArmor* out of the box.

**Note:** Yes, I hear you loud and clear, *SuSE* fans. The moment your favorite distro gets its things together with regard to the *AppArmor-SELinux* transition and actually enables SELinux in enforcing mode across all its different products and versions I will include it here as well.

*Omarchy* is essentially an installation routine for someone else’s *dotfiles* slapped on top of an otherwise barebones Linux desktop. Although you could simply run its installation scripts on your existing, fully configured *Arch* system, it doesn’t seem to make much sense and it’s definitely not the author’s primary objective.

If this was just *Hansson’s* personal laptop setup, nobody, including myself, would care about the oversights or eccentricities, but it is not. In fact, this project is clearly **marketed** to the broader, less experienced user base, with *Hansson* repeatedly misrepresenting *Omarchy* as being *“for developers or anyone interested in a pro system”*. I emphasize **marketed** here, because *Hansson* is using his reach and influence in every possible way to advertise and seemingly monetize *Omarchy*; Apart from the corporate financial support, the project even has its own *merch* that people can spend money on. Given that numerous *YouTubers* have been heavily promoting the project over the past few weeks, often in the same breath with *Framework (Computer Inc.)*, it wouldn’t be surprising to see the company soon offering it as a pre-installation option on their hardware.

[![Wikipedia page of author mistakenly calling Omarchy a distro](/a-word-on-omarchy/images/hansson_hu_2003dd1cdd6c348e.webp)](/a-word-on-omarchy/images/hansson.png)Wikipedia page of author mistakenly calling Omarchy a distro

### Verdict ###

If you’re serious about Linux, you’re unlikely to fall for the *Omarchy* sales pitch. However, if you’re an inexperienced user who’s heard about *Omarchy* from a *tech-influencer* raving about it, I strongly recommend starting your Linux journey elsewhere, with a distribution that actually prioritizes **your** security and system integrity, and is built and maintained by people who live and breathe systems, and especially Linux.

---

Alright, that’s it.

`rm -rf /`