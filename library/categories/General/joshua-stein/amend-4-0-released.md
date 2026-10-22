+++
title = "Amend 4.0 Released"
description = "Amend 4.0 has been released:* amend-4.0.sit (StuffIt 3 archive, includes source code and THINK C 5 project file)     SHA256: c838ee34931c00c03869affe7f9d6b85c0bbc51dd1242d11e8682a3774fdd0e3    SHA1: `040059d0b3302f1b"
date = "2026-10-19T05:00:00Z"
url = "https://jcs.org/2026/10/19/amend4"
author = "joshua stein"
text = ""
lastupdated = "2026-10-21T11:46:10.763776472Z"
seen = false
+++

[Amend](/amend) 4.0 has been released:

* [amend-4.0.sit](/amend/amend-4.0.sit) (StuffIt 3 archive, includes [source code](//amendhub.com/jcs/amend) and THINK C 5 project file)  
   SHA256: `c838ee34931c00c03869affe7f9d6b85c0bbc51dd1242d11e8682a3774fdd0e3`  
  SHA1: `040059d0b3302f1bd6ec0207b9a2f12dccdda374`

Changes in this version:

* New repository format that tracks author e-mail in addition to name; existing repositories are migrated automatically on open
* Add inregrated resource file support; `.rsrc` files can be added directly to a repo and files are converted to DeRez-style ASCII output before diffing, so running SADerez to produce separate `.r` files on every change is no longer required
* Allow Command+. to cancel loading a repo
* Allow Command+. to cancel diffing; if diff text has already been output it will remain available, otherwise the window will be closed
* Center settings dialog, make sure author name is present
* Use database transactions to avoid leaving repository database files in a partially-committed state if we crash
* Numerous bug fixes