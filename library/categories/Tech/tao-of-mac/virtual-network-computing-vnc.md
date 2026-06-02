+++
title = "Virtual Network Computing (VNC)"
description = "Probably the most useful Open Source tool of all (ok, maybe SSH is more useful), VNC was originally created by the AT&T Research facility in Cambridge and is a remote display protocol that, despite being rather inefficient (something mode"
date = "2007-03-17T22:22:31Z"
url = "https://taoofmac.com/space/protocols/vnc?utm_content=atom"
author = "Rui Carmo"
text = ""
lastupdated = "2026-06-01T21:30:51.383242310Z"
seen = false
+++

Probably the most useful Open Source tool of all (ok, maybe [SSH](/space/cli/ssh) is more useful), [VNC](/space/protocols/vnc) was originally created by the AT&T Research facility in Cambridge and is a remote display protocol that, despite being rather inefficient (something modern forks try to improve upon, but certainly still less than [RDP](/space/protocols/rdp), has the advantage of being very simple and require only very light clients (the [Windows](/space/com/microsoft/windows) binary is contained within just 230KB, and [Java](/space/dev/java) implementations can be downloaded on-the-fly from any browser).

[Mac OS X](/space/com/apple/macos) includes a [VNC](/space/protocols/vnc) server (check the Sharing preference pane, it’s part of [Apple](/space/com/apple) Remote Desktop).

[

### Mac Screen Sharing ###

](/space/protocols/vnc#mac-screen-sharing)

[Apple](/space/com/apple) uses a variant of the [VNC](/space/protocols/vnc) protocol for its own screen sharing solution, and [this article](http://www.macworld.com/article/131094/2007/12/screensharepower.html?utm_source=taoofmac.com&utm_medium=web&utm_campaign=unsolicited_traffic&utm_content=external_link) has some useful tweaks to the Leopard built-in client that I’m reproducing here for safekeeping:

#### Displaying a [Bonjour](/space/com/apple/bonjour) browser ####

```
defaults write com.apple.ScreenSharing ShowBonjourBrowser_Debug 1

```

#### Displaying additional controls (pre-10.5.5) ####

```
defaults write com.apple.ScreenSharing \
'NSToolbar Configuration ControlToolbar' -dict-add 'TB Item Identifiers' \
'(Scale,Control,Share,Curtain,Capture,FullScreen,GetClipboard,SendClipboard,Quality)'

```

In 10.5.5, [Apple](/space/com/apple) decided to get stingy again, so [this workaround](http://www.macworld.com/article/135649/2008/09/screen_sharing_buttons.html?utm_source=taoofmac.com&utm_medium=web&utm_campaign=unsolicited_traffic&utm_content=external_link) became necessary–which is kind of ridiculous.

When [Snow Leopard](/space/com/apple/macos/snow_leopard) rolled around, they broke even more of the [UI](http://en.wikipedia.org/wiki/User_interface?utm_source=taoofmac.com&utm_medium=web&utm_campaign=unsolicited_traffic&utm_content=external_link), but it’s still possible to set display quality via a preference ([via](http://www.macosxhints.com/article.php?story=20091012012014486&utm_source=taoofmac.com&utm_medium=web&utm_campaign=unsolicited_traffic&utm_content=external_link)):

```
defaults write com.apple.ScreenSharing controlObserveQuality n

```

…gives you:

1. black and white
2. grayscale
3. 8-bit color
4. 16-bit color
5. full color

[

### Resources ###

](/space/protocols/vnc#resources)

|                                                                                                  Category                                                                                                   |                                                                                 Link                                                                                 |                                Notes                                |
|-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|----------------------------------------------------------------------------------------------------------------------------------------------------------------------|---------------------------------------------------------------------|
|                                                                                                   Clients                                                                                                   |       [arduinoVNC](https://github.com/Links2004/arduinoVNC?utm_source=taoofmac.com&utm_medium=web&utm_campaign=unsolicited_traffic&utm_content=external_link)        |                  A VNC client library for Arduino                   |
|                              [zohead/fbvnc](https://github.com/zohead/fbvnc?utm_source=taoofmac.com&utm_medium=web&utm_campaign=unsolicited_traffic&utm_content=external_link)                              |                                                              a patched VNC client for embedded systems                                                               |                                                                     |
|                                                                                                  Libraries                                                                                                  |[MicroPython RFB](https://github.com/PinkInk/upylib/tree/master/rfb?utm_source=taoofmac.com&utm_medium=web&utm_campaign=unsolicited_traffic&utm_content=external_link)|             An interesting library for embedded systems             |
|                            [asyncvnc](https://github.com/barneygale/asyncvnc?utm_source=taoofmac.com&utm_medium=web&utm_campaign=unsolicited_traffic&utm_content=external_link)                             |                                                                   An asyncio Python client library                                                                   |                                                                     |
|                                                                                                    Other                                                                                                    |              [pyvnc](http://code.google.com/p/pyvnc?utm_source=taoofmac.com&utm_medium=web&utm_campaign=unsolicited_traffic&utm_content=external_link)               |             A ctypes client that uses libvnc directly.              |
|                         [Enhanced Full-Screen Clients](http://lars.werner.no/vnc?utm_source=taoofmac.com&utm_medium=web&utm_campaign=unsolicited_traffic&utm_content=external_link)                         |                                                                                                                                                                      |                                                                     |
|                                    [Palm VNC](http://palmvnc2.free.fr?utm_source=taoofmac.com&utm_medium=web&utm_campaign=unsolicited_traffic&utm_content=external_link)                                    |                                                                 with server-side scaling extensions                                                                  |                                                                     |
|                             [fbvnc](http://pocketworkstation.org/fbvnc.html?utm_source=taoofmac.com&utm_medium=web&utm_campaign=unsolicited_traffic&utm_content=external_link)                              |                                                                       framebuffer-based client                                                                       |                                                                     |
|                             [vnc2dl](http://wiki.github.com/quentinsf/vnc2dl?utm_source=taoofmac.com&utm_medium=web&utm_campaign=unsolicited_traffic&utm_content=external_link)                             |                                                            a client that renders on a DisplayLink device                                                             |                                                                     |
|                           [DirectVNC](http://www.adam-lilienthal.de/directvnc?utm_source=taoofmac.com&utm_medium=web&utm_campaign=unsolicited_traffic&utm_content=external_link)                            |                                                                       framebuffer-based client                                                                       |                                                                     |
|                                [VNCj](http://www.amherst.edu/~tliron/vncj?utm_source=taoofmac.com&utm_medium=web&utm_campaign=unsolicited_traffic&utm_content=external_link)                                |                                                             a nice way to serve Java `AWT` applications                                                              |                                                                     |
|                    [FlashVNC](http://www.darronschall.com/weblog/archives/000192.cfm?utm_source=taoofmac.com&utm_medium=web&utm_campaign=unsolicited_traffic&utm_content=external_link)                     |                                                                            a Flash viewer                                                                            |                                                                     |
|                                 [perlVNC](http://www.mazleg.com/perlvnc?utm_source=taoofmac.com&utm_medium=web&utm_campaign=unsolicited_traffic&utm_content=external_link)                                  |                                                                                fear.                                                                                 |                                                                     |
|                            [MochaVNC](http://www.mochasoft.org/vnc/home.html?utm_source=taoofmac.com&utm_medium=web&utm_campaign=unsolicited_traffic&utm_content=external_link)                             |                                     for Palm and Pocket PC, supports post-3.3 procotol versions and has a built-in SSH tunneler.                                     |                                                                     |
|                                                                                                   Servers                                                                                                   |             [J2ME VNC](http://j2mevnc.sourceforge.net?utm_source=taoofmac.com&utm_medium=web&utm_campaign=unsolicited_traffic&utm_content=external_link)             |                            for MIDP/J2ME                            |
|                                 [MetaVNC](http://metavnc.sourceforge.net?utm_source=taoofmac.com&utm_medium=web&utm_campaign=unsolicited_traffic&utm_content=external_link)                                 |                                                              an intriguing way to share single windows                                                               |                                                                     |
|         [Ultra VNC Single-Click Server](http://ultravnc.sourceforge.net/addons/singleclick.html?utm_source=taoofmac.com&utm_medium=web&utm_campaign=unsolicited_traffic&utm_content=external_link)          |               a nice, customizable Windows server that helpdesk staff could e-mail to someone in need of help back when that was acceptable behavior.                |                                                                     |
|                                   [Alkit VNC](http://w2.alkit.se/avnc?utm_source=taoofmac.com&utm_medium=web&utm_campaign=unsolicited_traffic&utm_content=external_link)                                    |                                                                     allows single-window sharing                                                                     |                                                                     |
|                                     [RealVNC](http://www.realvnc.com?utm_source=taoofmac.com&utm_medium=web&utm_campaign=unsolicited_traffic&utm_content=external_link)                                     |                                      the original (and still the reference) implementation. Also has the most efficient client                                       |                                                                     |
|       [Vine Server (formerly called OSXvnc)](http://www.redstonesoftware.com/products/vine_server?utm_source=taoofmac.com&utm_medium=web&utm_campaign=unsolicited_traffic&utm_content=external_link)        |                                                native macOS server, supporting multiple simultaneous remote sessions                                                 |                                                                     |
|                                   [VirtualGL](http://www.virtualgl.org?utm_source=taoofmac.com&utm_medium=web&utm_campaign=unsolicited_traffic&utm_content=external_link)                                   |                                             Finely tuned OpenGL encapsulation (with server-side hardware acceleration).                                              |                                                                     |
|                                 [wayvnc](https://github.com/any1/wayvnc?utm_source=taoofmac.com&utm_medium=web&utm_campaign=unsolicited_traffic&utm_content=external_link)                                  |                                                          a VNC server for wlroots-based Wayland compositors                                                          |                                                                     |
|                      [ESP32 VNC Server](https://github.com/hackffm/ESP32_VNCServer?utm_source=taoofmac.com&utm_medium=web&utm_campaign=unsolicited_traffic&utm_content=external_link)                       |                                                              A VNC server for the ESP32 microcontroller                                                              |                                                                     |
|                              [esp-vnc](https://github.com/sensepost/esp-vnc?utm_source=taoofmac.com&utm_medium=web&utm_campaign=unsolicited_traffic&utm_content=external_link)                              |                                                                      Another little VNC server                                                                       |                                                                     |
|                                                                                                    Tools                                                                                                    |              [Gitso](http://code.google.com/p/gitso?utm_source=taoofmac.com&utm_medium=web&utm_campaign=unsolicited_traffic&utm_content=external_link)               |         A reverse VNC connection tool for support purposes.         |
|                            [VNC Snapshot](http://vncsnapshot.sourceforge.net?utm_source=taoofmac.com&utm_medium=web&utm_campaign=unsolicited_traffic&utm_content=external_link)                             |                                            can take screenshots of a section of the display and save them in JPEG format                                             |                                                                     |
|                                                                                                 Web Clients                                                                                                 |        [Ajax VNC](http://sourceforge.net/projects/ajaxvnc?utm_source=taoofmac.com&utm_medium=web&utm_campaign=unsolicited_traffic&utm_content=external_link)         |  Clientless VNC solution implemented with canvas and a Java server  |
|                                 [noVNC](https://github.com/kanaka/noVNC?utm_source=taoofmac.com&utm_medium=web&utm_campaign=unsolicited_traffic&utm_content=external_link)                                  |                                                              A decent, secure websockets/canvas client                                                               |                                                                     |
|                                                                                                    macOS                                                                                                    |                                                       [Chicken of the VNC](/space/SourceForge:projects/cotvnc)                                                       |No international key support, works OK with the built-in macOS server|
|                                                                                 [JollysFastVNC](/space/apps/JollysFastVNC)                                                                                  |                                           The best client out there in terms of speed and international keyboard support.                                            |                                                                     |
|[VNCDimension](http://www.mdimension.com/cgi-bin/WebObjects/MDTWebsite.woa/1/wa/viewPage?pageName=Software&utm_source=taoofmac.com&utm_medium=web&utm_campaign=unsolicited_traffic&utm_content=external_link)|                                       partial support for non-US keyboards (but no dead keys) and very fast graphical updates.                                       |                                                                     |
[](/space/protocols/vnc#tricks)

### [Tricks](/space/protocols/vnc#tricks) ###

My current (minimalist) `Xvnc` startup file for Linux, so that I remember that unsetting `SESSION_MANAGER` is the right way to avoid complaints from `gnome-session`:

```
$ cat .vnc/xstartup
#!/bin/sh
unset SESSION_MANAGER
[ -x /etc/vnc/xstartup ] && exec /etc/vnc/xstartup
[ -r $HOME/.Xresources ] && xrdb $HOME/.Xresources
xsetroot -solid grey
vncconfig -iconic &
gnome-session &

```