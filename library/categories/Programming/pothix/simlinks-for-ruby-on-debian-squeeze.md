---
title = "Simlinks for ruby on Debian Squeeze"
description = "Every time we need to deploy a new Ruby application on top of Debian Squeeze we need to fix some Ruby depedencies to make the application work as it should. It happens because we’re building using rvm instead of the packaged version of ruby, but it needed to be that way in order "
date = "2012-07-17T00:00:00Z"
url = "https://pothix.com/ruby-debian-squeeze/"
author = ""
text = ""
lastupdated = "2025-10-22T08:59:09.400493800Z"
seen = true
---

Every time we need to deploy a new Ruby application on top of Debian Squeeze we need to fix some Ruby depedencies to make the application work as it should. It happens because we’re building using rvm instead of the packaged version of ruby, but it needed to be that way in order to use our old build server. I’ll keep it documented here: ln -s /usr/lib/libruby-1.9.1.so.1.9.1 /usr/lib/libruby.so.1.9 ln -s /usr/bin/rake1.