---
title = "Ditching Sonos for Music Assistant"
description = "My general advice for life is: be a good person, and care for the people around you. And follow this one very specific rule: avoid vendor lock-in.Sean Boots Rule number one: Avoid vendor lock-inI"
date = "2025-06-08T06:00:07Z"
url = "http://jonashietala.se/blog/2025/06/04/ditching_sonos_for_music_assistant/index.html"
author = "Jonas Hietala"
text = ""
lastupdated = "2025-10-22T08:58:11.102836884Z"
seen = true
---

>
>
> My general advice for life is: be a good person, and care for the people around you. And follow this one very specific rule: **avoid vendor lock-in**.
>
>
>
> Sean Boots [Rule number one: Avoid vendor lock-in](https://sboots.ca/2021/05/12/rule-number-one-avoid-vendor-lock-in/)
>
>

I’ve always wondered how to setup a sound systems around the house that you can control from your devices, such as your phone. To get a working setup it seemed you had to embrace vendor lock-in; either by committing to an entire ecosystem such as [Sonos](https://www.sonos.com/), or by relying on a service like Spotify and buying amplifiers that supports their particular integration (such as [Spotify Connect](https://connect.spotify.com/)).

When I wanted to replace and upgrade our old Sonos speaker I did som research and I found a promising alternative: it’s called [Music Assistant](https://www.music-assistant.io/) and it’s great.

![](/images/music_assistant/ma_dashboard.png) The [Music Assistant](https://www.music-assistant.io/) dashboard.

[The woes of Sonos](#The-woes-of-Sonos)
----------

We’ve had a Sonos speaker in our kitchen for more than a decade. At first I was very happy with it; the speaker was easy to use, it integrated well with Spotify, and despite being a single fairly cheap speaker the sound was pretty good.

But gradually the experience got worse:

1. The speaker sometimes refused to play songs via Spotify.
2. We couldn’t connect to the speaker via the Sonos app (having to unplug the speaker and pray to the Sonos god that it would be enough to fix it).
3. Playback randomly paused.
4. The speaker lost WIFI connection, reconnecting after a while.
5. Finally, the radio integration stopped working altogether (this is critical for my girlfriend who always listens to the radio).

It could be worse—at least our speaker wasn’t [bricked](https://news.ycombinator.com/item?id=21895086) and we (supposedly) dodged a bunch of other issues by never upgrading to the new app.

[The new setup](#The-new-setup)
----------

1. Use [Music Assistant](https://www.music-assistant.io/) as the central controller for streaming music and radio to different players and speakers.

2. Setup an [Arylic A50+](https://www.arylic.com/products/arylic-a50-wifi-bluetooth-multiroom-full-digital-hifi-amplifier-with-airplay-dlna-multiroom-control) amplifier that [Music Assistant](https://www.music-assistant.io/) can control.

   Together with a pair of speakers it replaces the Sonos in the kitchen.

3. Connect [Music Assistant](https://www.music-assistant.io/) with [Home Assistant](https://www.home-assistant.io/) to control playback via our smart-home dashboard and automations.

4. Setup more players for [Music Assistant](https://www.music-assistant.io/) to control.

[What is ](#What-is-Music-Assistant-and-why-is-it-awesome)[Music Assistant](https://www.music-assistant.io/) and why is it awesome?
----------

[Music Assistant](https://www.music-assistant.io/) is a service that acts as a hub that connects different providers and players, letting you control the sound in your home from one central location.

![](/images/music_assistant/ma_how_it_worps.jpg) Image showing how [Music Assistant](https://www.music-assistant.io/) bridges different sources with different players. Taken from [this Home Assistant blog post](https://www.home-assistant.io/blog/2024/05/09/music-assistant-2/).

So you could have this kind of setup and let [Music Assistant](https://www.music-assistant.io/) connect them together in whatever way you wish, including multi-room setups (if the players are from the same ecosystem, such as Airplay or Squeezebox):

|  Provider   |   |             Player             |
|-------------|---|--------------------------------|
|   Spotify   |   |             Sonos              |
|   Audible   |   |           Chromecast           |
|    Radio    | → | Media player in Home Assistant |
|    Plex     |   |Streaming amplifier (Squeezebox)|
|Local storage|   |Computer with Linux (Squeezebox)|

Careful to not get nerd sniped; with room presence detection you could have the music follow you automatically as you move around the house.

Here’s a few reasons why I think [Music Assistant](https://www.music-assistant.io/) is awesome:

* Freedom from the limitations of one ecosystem.
* Can mix and match music from local storage and Spotify in the same playlist.
* One place to control all your speakers of varying types and connections.
* [Integrates well with Home Assistant](https://www.home-assistant.io/blog/2024/05/09/music-assistant-2/).

[Music Assistant](https://www.music-assistant.io/), as it’s name hints at, started out as a [Home Assistant](https://www.home-assistant.io/) component. That’s why I initially dismissed it but [Music Assistant](https://www.music-assistant.io/) is now a standalone service.

### [How to set it up](#How-to-set-it-up) ###

1. [Install Music Assistant](https://www.music-assistant.io/installation/)

   I host my homelab things using docker compose and it was as simple as:

   ```
   services:
     music-assistant-server:
       image: ghcr.io/music-assistant/server:latest
       container_name: music-assistant-server
       restart: unless-stopped
       # Network mode must be set to host for MA to work correctly
       network_mode: host
       volumes:
         - ./music-assistant-server/data:/data/
       # privileged caps (and security-opt) needed to mount
       # smb folders within the container
       cap_add:
         - SYS_ADMIN
         - DAC_READ_SEARCH
       security_opt:
         - apparmor:unconfined
       environment:
         - LOG_LEVEL=info

     # And home assistant and other things.

   ```

2. Add providers

   A provider is a source of music. There’s a bunch of them but at the moment I only use a few:

   ![](/images/music_assistant/ma_spotify.png)

   The Spotify provider for example should automatically sync all Spotify playlists into [Music Assistant](https://www.music-assistant.io/) and allows you to search and play any song on Spotify.

   Radio stations from RadioBrowser won’t show up automatically. You first have to find them under the `Browse` tab and add them to the library, then they’ll appear in the `Radio` tab.

3. Add players

   We need players to play our music, here’s what I currently use:

   ![](/images/music_assistant/ma_players.png)

   The players should be automatically added as long as they have a matching provider enabled.

   Quite a few different providers are supported. I could even add our Sonos speaker as a player and we managed to once more listen to the radio on it. Rejoice!

Open-source music management—particularly on Linux—has a reputation of being notoriously troublesome. But I’ve gotta say, [Music Assistant](https://www.music-assistant.io/) was simple to setup and it works well (except issues with some players that I’ll get to shortly).

[Trying out different players](#Trying-out-different-players)
----------

I was fairly lost in what kind of amplifier and music player I should get.

There’s a lot of options out there but I was worried about paying a lot of money for something I wasn’t sure it would integrate well into my smart home setup. Here’s a few options I’ve tried:

### [Sonos](#Sonos) ###

![](/images/music_assistant/sonos.jpg) The Sonos speaker has found new life in our washing room.

It’s pretty funny, the Sonos speaker works better with [Music Assistant](https://www.music-assistant.io/) than with the Sonos app. The radio completely stopped working via the Sonos app, while I can use [Music Assistant](https://www.music-assistant.io/) to play the radio on the Sonos speaker.

The speaker might still disconnect or stop playback at odd times but it’s good enough to raise the mood in the washing room.

### [Squeezelite on Linux](#Squeezelite-on-Linux) ###

![](/images/music_assistant/living_room_speakers.jpg) Our living room setup with a TV, game consoles, speakers, a dumb amplifier, and a computer running Void Linux.

I hate modern smart TVs with a passion so to stream we use a computer running Linux, connected to a dumb amplifier with some speakers. It works well but it makes it a bit more cumbersome to play music.

By installing [Squeezelite](https://github.com/ralph-irving/squeezelite) the computer acts as a squeezebox client, effectively transforming it into a smart player for [Music Assistant](https://www.music-assistant.io/) and [Home Assistant](https://www.home-assistant.io/) to stream music to.

I started out by doing this on my work desktop too but since then [Music Assistant](https://www.music-assistant.io/) has added the ability to stream via the web interface, much like if you visit [https://open.spotify.com/](https://open.spotify.com/) in your browser.

### [A HifiBerry player](#A-HifiBerry-player) ###

![](/images/music_assistant/hifiberry_pi.jpg) The [HifiBerry AMP2](https://www.hifiberry.com/shop/boards/dealing-with-blocked-p5-holes-7/) on top of a Raspberry Pi 3, acting as the amplifier and smart music controller. All you need is to connect the passive speakers.

As I had a Raspberry Pi lying around it made sense to try the [HifiBerry AMP2](https://www.hifiberry.com/shop/boards/dealing-with-blocked-p5-holes-7/) that transforms the Pi into a surprisingly capable amplifier and smart music controller. For simplicity I decided to start with their operating system [HifiBerryOS](https://www.hifiberry.com/hifiberryos/) that hopefully should “just work” and be open enough for me to manually fix things if needed.

While it works very well as a Spotify Connect device or to play over Bluetooth I had issues with it acting as a Squeezelite or Airplay client as the [volume was super low](https://github.com/hifiberry/hifiberry-os/issues/529) when I tried to stream to it from [Music Assistant](https://www.music-assistant.io/).

It *might* be a software issue with [HifiBerryOS](https://www.hifiberry.com/hifiberryos/) but I haven’t had the energy to debug it or try other OS versions. Maybe I’ll revisit it when I want to outfit another room with speakers.

I ran into an issue where the Spotify mobile app got stuck at “Connecting” when I tried to play to HifiBerry.

This [was an issue with a static DNS entry](https://github.com/ashthespy/Vollibrespot/issues/13). To [fix it](https://github.com/ashthespy/Vollibrespot/issues/13#issuecomment-2481246915) I had to remove `ap-gew4.spotify.com` from `/etc/hosts` on the device.

### [](#Arylic-A50)[Arylic A50+](https://www.arylic.com/products/arylic-a50-wifi-bluetooth-multiroom-full-digital-hifi-amplifier-with-airplay-dlna-multiroom-control) ###

![](/images/music_assistant/arylic.jpg)

I was planning to use the HifiBerry to power two new speakers in the ceiling in the kitchen to replace the Sonos. But I got stressed out by the [HifiBerry not working properly](#A-HifiBerry-player) and the kitchen renovation was looming ever closer so I bought the [Arylic A50+](https://www.arylic.com/products/arylic-a50-wifi-bluetooth-multiroom-full-digital-hifi-amplifier-with-airplay-dlna-multiroom-control), hoping that it would work better with [Music Assistant](https://www.music-assistant.io/).

The device supports both Airplay and Squeezebox like the HifiBerry but again there were some issue with the volume being very low. I don’t know if both devices just happen to have similar bugs, if there’s a bug with [Music Assistant](https://www.music-assistant.io/), or if it’s some weird compatibility issue.

*Sigh.*

But there’s another way to make it work; the Arylic has an excellent [Home Assistant](https://www.home-assistant.io/) integration and if you go that way then [Music Assistant](https://www.music-assistant.io/) can use the Arylic as a player properly. You need the LinkPlay integration in [Home Assistant](https://www.home-assistant.io/) and then enable the [Home Assistant integration](#Home-Assistant-integration) in [Music Assistant](https://www.music-assistant.io/).

(I tried the same with the HifiBerry integration but for some reason the HifiBerry media player exposed from Home Assistant didn’t show up in [Music Assistant](https://www.music-assistant.io/).)

The Arylic has a bunch of other integrations such as Bluetooth and Spotify Connect. This is great as it allows my girlfriend to use Spotify on her phone to control the new speakers in the kitchen, exactly like how she used to control Sonos.

If the spouse approves of your smart home shenanigans then you know you’ve done a good job.

[Home Assistant integration](#Home-Assistant-integration)
----------

[Music Assistant](https://www.music-assistant.io/) integrates well with [Home Assistant](https://www.home-assistant.io/). Setup is straightforward:

1. Add the [Music Assistant](https://www.music-assistant.io/) integration in [Home Assistant](https://www.home-assistant.io/):

   ![](/images/music_assistant/ma_ha.png)

   This will expose all players in [Music Assistant](https://www.music-assistant.io/) to [Home Assistant](https://www.home-assistant.io/) (such as the Squeezebox players running on Linux).

2. Enable the [Home Assistant](https://www.home-assistant.io/) plugin in [Music Assistant](https://www.music-assistant.io/):

   ![](/images/music_assistant/ma_plugins.png)

   This will expose all media players in [Home Assistant](https://www.home-assistant.io/) to [Music Assistant](https://www.music-assistant.io/) (such as the Arylic or the [Home Assistant Voice Preview Edition](https://www.home-assistant.io/voice-pe/)).

With this setup you can setup Home Assistant actions to start a particular radio station, add a media player card to start/stop playback, or simply give [Music Assistant](https://www.music-assistant.io/) access to more players.

### [In Home Assistant how do you…](#In-Home-Assistant-how-do-you) ###

* Play the `P4 Norrbotten` radio station?

  ```
  action: music_assistant.play_media
  target:
    entity_id: media_player.kitchen
  data:
    media_id: P4 Norrbotten

  ```

* Play the `To Hell and Back` track?

  ```
  action: music_assistant.play_media
  target:
    entity_id: media_player.kitchen
  data:
    media_id: To Hell and Back
    media_type: track

  ```

* Play the `kpop` playlist?

  ```
  action: music_assistant.play_media
  target:
    entity_id: media_player.kitchen
  data:
    media_id: kpop
    media_type: playlist

  ```

* Play the `kpop` playlist randomized?

  ```
  action: media_player.shuffle_set
  target:
    entity_id:
      - media_player.kitchen
  data:
    shuffle: true

  action: music_assistant.play_media
  target:
    entity_id: media_player.kitchen
  data:
    media_id: kpop
    media_type: playlist
    enqueue: replace

  ```

You get the new `music_assistant.play_media` action but otherwise you control the media players just as the other media player entities in [Home Assistant](https://www.home-assistant.io/).

[It’s not perfect](#Its-not-perfect)
----------

[Music Assistant](https://www.music-assistant.io/) is a fairly young open source project so minor bugs are to be expected. There are also two larger feature that I miss:

* I’d like to have access to my library even when I’m away from home. Maybe [an Android app](https://github.com/orgs/music-assistant/discussions/1834) with native volume controls, notifications, and support for offline listening?

* A better widget for [Home Assistant](https://www.home-assistant.io/).

  ![](/images/music_assistant/mini_media_player.png) The mini media player card.

  For basic sound controls in the kitchen I use the [Mini Media Player](https://github.com/kalkih/mini-media-player) card but I’d like a better way to filter through playlists and music via the [Home Assistant](https://www.home-assistant.io/) Lovelace UI. I currently embed the [Music Assistant](https://www.music-assistant.io/) dashboard itself via an iframe but the UI is a bit too clunky for the size of my tablet.

[What’s next?](#Whats-next)
----------

Still, I must admit, I’m stoked about finding a smarter way to control music throughout our house and I’m searching for an excuse to expand the setup in the future. Here are some ideas I have:

* Speakers in the kid’s room to play music or audio books before they go to sleep.
* More music in my exercise space (it kind of works if I increase the volume of my office speakers, but it’s not ideal).
* A proper Hi Fi setup for true music enjoyment somewhere in the house.

Despite some integration issues and us not using [Music Assistant](https://www.music-assistant.io/) to it’s fullest potential it has still improved our setup in a major way.