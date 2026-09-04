+++
title = "FreeBSD on a Raspberry Pi"
description = '\+++I’m a FreeBSD guy. My first computer was a FreeBSD machine that my dad had running in a closet. I learned how to use Emacs as well as the command line on that black-screen white-text no-mouse interface. That’s how real programmers spend their childhood! 😎 😜I’ve only heard goo'
date = "2020-02-12T00:00:00Z"
url = "https://lambdaland.org/posts/2020-02-12-freebsd-on-a-raspberry-pi/"
author = """

            
              Ashton Wiersdorf
            
          """
text = ""
lastupdated = "2026-07-21T09:22:07.325116281Z"
seen = false
+++

\+++

I’m a FreeBSD guy. My first computer was a FreeBSD machine that my dad had running in a closet. I learned how to use Emacs as well as the command line on that black-screen white-text no-mouse interface. That’s how real programmers spend their childhood! 😎 😜

I’ve only heard good things about FreeBSD. While not known as particularly desktop-friendly (various Linux distros win here) I’ve heard tales of its rock-solid stability. I wanted to try running on FreeBSD again, just to see what all the fuss was about.

Installing
==========

Installing was relatively straight forward. I followed the instructions [here](<https://wiki.freebsd.org/action/show/arm/Raspberry Pi?action=show&redirect=FreeBSD/arm/Raspberry+Pi>).

Once I got the card flashed (took about an hour) and booted, I reset the passwords for users `root` and `freebsd`. Note that at time of writing WiFi wasn’t supported; I had to hard-link an Ethernet cable. It found the connection without any trouble, so that was nice.

Initial Setup
==========

Setting up the clock
----------

[https://www.freebsd.org/doc/handbook/network-ntp.html](https://www.freebsd.org/doc/handbook/network-ntp.html)

The clock is necessary to start working with the ports. Set the config variables in `/etc/rc.conf`:

```
ntpd_enable=YES
ntpd_sync_on_start=YES  # This one might not be necessary
```

You should be able to just run this without rebooting. (I ended up rebooting, but I think I did things out of order.)

```
service ntpd start
```

Installing the port tree
----------

[https://www.freebsd.org/doc/handbook/ports-using.html](https://www.freebsd.org/doc/handbook/ports-using.html)

Run the following: (I think you can do this in any directory)

```
portsnap fetch
portsnap extract
```

Installing the critical tools: Emacs and Git
==========

I tried going into `/usr/ports/editors/emacs/` and running `make install`, but I must have had an option wrong because it tried installing… I think the entire X Windowing System. Yikes.

I gave up after about a day and instead ran `pkg install emacs-nox` and `pkg install git`; those ran pretty quickly.