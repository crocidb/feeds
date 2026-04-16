+++
title = "Python"
description = "Python is one of my favorite programming languages due to its terseness and amazing flexibility, and after decades using it I find it quite amusing that it i"
date = "2007-04-15T10:44:37Z"
url = "https://taoofmac.com/space/dev/python?utm_content=atom"
author = "Rui Carmo"
text = ""
lastupdated = "2026-04-15T10:42:49.423885215Z"
seen = true
+++

[Python](http://www.python.org?utm_source=taoofmac.com&utm_medium=web&utm_campaign=unsolicited_traffic&utm_content=external_link) is one of my favorite programming languages due to its terseness and amazing flexibility, and after decades using it I find it quite amusing that it is now the language of choice for data science and machine learning.

[

My Stuff
----------

](/space/dev/python#my-stuff)

|                                        Year                                         |                                                                                  Item                                                                                  |                                      Notes                                      |
|-------------------------------------------------------------------------------------|------------------------------------------------------------------------------------------------------------------------------------------------------------------------|---------------------------------------------------------------------------------|
|                                        2016                                         |               [Sushy](https://github.com/rcarmo/sushy?utm_source=taoofmac.com&utm_medium=web&utm_campaign=unsolicited_traffic&utm_content=external_link)               |                             my current wiki engine                              |
|                                        2015                                         |            [rss2imap](https://github.com/rcarmo/rss2imap?utm_source=taoofmac.com&utm_medium=web&utm_campaign=unsolicited_traffic&utm_content=external_link)            |                    The way I used read my news a while back                     |
|                                        2009                                         |                                                                [PNG Canvas](/space/Projects/PNGCanvas)                                                                 |a native Python [PNG](PNG) creation module, suitable for use in Google App Engine|
|                                        2007                                         |                                                                      [Yaki](/space/Projects/Yaki)                                                                      |                             my previous wiki engine                             |
|                                        2006                                         |                                                               [MailArchive](/space/Projects/MailArchive)                                                               |    a quick hack to file web pages as [MIME](MIME) compliant e-mail messages.    |
|                                        2005                                         |                                                                 [PicoStats](/space/Projects/PicoStats)                                                                 |                         a minimalist Apache log parser.                         |
|                      [IMAP Backup](/space/Projects/imapbackup)                      |                                                    another quick hack that apparently filled a long-standing need.                                                     |                                                                                 |
|                    [The Python Grimoire](/space/Python/Grimoire)                    |which I converted into [TiddlyWiki](http://www.tiddlywiki.com/?utm_source=taoofmac.com&utm_medium=web&utm_campaign=unsolicited_traffic&utm_content=external_link) format|                                                                                 |
|                                        2004                                         |                                                                  [newspipe](/space/Projects/newspipe)                                                                  |    which I used daily for a couple of years and occasionally contributed to     |
|                 [PicoRendezvous.py](/space/projects/picorendezvous)                 |                                            a minimalist (and dumb) [Bonjour](/space/com/apple/bonjour) / Rendezvous client                                             |                                                                                 |
|[Growl](/space/apps/growl) native protocol [implementation](/space/projects/netgrowl)|                                             this spawned numerous variants, including a [proxy](/space/projects/regrowl).                                              |                                                                                 |
[](/space/dev/python#resources)

[Resources](/space/dev/python#resources)
----------

**Error:** Could not parse 'table.yaml'

```
while parsing a block mapping
  in "<byte string>", line 2, column 1
did not find expected key
  in "<byte string>", line 1682, column 1

```

[

Techniques
----------

](/space/dev/python#techniques)

* [daemon.py](/media/dev/python/cJjZP8v6tb5vfwv6nP2OCVcwbW4=/daemon.py.txt), an example daemon script.
* [Pydoc](http://www.python.org/doc/current/lib/module-pydoc.html?utm_source=taoofmac.com&utm_medium=web&utm_campaign=unsolicited_traffic&utm_content=external_link) built-in Web help, anytime, anywhere
* [How to Write a Spelling Corrector](http://www.norvig.com/spell-correct.html?utm_source=taoofmac.com&utm_medium=web&utm_campaign=unsolicited_traffic&utm_content=external_link) - an interesting technique that can come in handy to fix/suggest search terms, etc.
* [Python Webcam Color Track](http://phillipinbahia.blogspot.com/2006/08/python-webcam-color-track.html?utm_source=taoofmac.com&utm_medium=web&utm_campaign=unsolicited_traffic&utm_content=external_link)
* [Python webcam fun - motion detection](http://gumuz.looze.net/wordpress/index.php/archives/2005/06/06/python-webcam-fun-motion-detection/?utm_source=taoofmac.com&utm_medium=web&utm_campaign=unsolicited_traffic&utm_content=external_link)

[

Notes
----------

](/space/dev/python#notes)[

### Setting `distutils` paths in OS X ###

](/space/dev/python#setting)

Create a file named `.pydistutils.cfg` in your home directory with the following contents and set `$PATH` accordingly:

```
[install]
install_lib = ~/Library/Python/$py_version_short/site-packages
install_scripts = ~/Library/Python/$py_version_short/bin
install_data = ~/Library/Python/$py_version/share

```

This will install packages to your `Library` folder rather than to the system directory, saving you the trouble to use `sudo` or risking messing with the system installation. Of course `virtualenv` does a better job for keeping track of project-specific dependencies, but this is great for common/complex dependencies and is sure to survive operating system upgrades.

And then you can use `easy_install` or `pip install --user` with impunity, although you might need to do something like:

```
ARCHFLAGS=-Wno-error=unused-command-line-argument-hard-error-in-future easy_install pandas

```

…for getting around some `clang` oddities.

[

### Instant Web Server on port 8000 (2.x) ###

](/space/dev/python#instant-web-server-on-port-8000-2-x)

```
#!/bin/sh
python -c '__import__("SimpleHTTPServer").test()'

```

[

Totally Unrelated
----------

](/space/dev/python#totally-unrelated)

* [Estimating the Airspeed of an Unladen Swallow](http://www.style.org/unladenswallow/?utm_source=taoofmac.com&utm_medium=web&utm_campaign=unsolicited_traffic&utm_content=external_link)