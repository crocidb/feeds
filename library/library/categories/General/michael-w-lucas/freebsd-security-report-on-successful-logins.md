+++
title = "FreeBSD security report on successful logins"
description = "By default, FreeBSD sends a daily security report listing all sorts of good stuff, and failed logins. I don’t care about poorly-programmed password gropers fumbling at a service that doesn’t accept passwords. I don’t want to read pages of stupidity. Over the years I’ve trained my"
date = "2026-03-17T13:04:20Z"
url = "https://mwl.io/archives/24601"
author = "Michael Lucas"
text = ""
lastupdated = "2026-05-08T14:12:54.061410632Z"
seen = true
+++

By default, FreeBSD sends a daily security report listing all sorts of good stuff, and failed logins.

I don’t care about poorly-programmed password gropers fumbling at a service that doesn’t accept passwords. I don’t want to read pages of stupidity. Over the years I’ve trained myself to skip the stupidity, which is bad practice. If I get automated email it better contain only things I care about.

I care about *successful* logins. The number of folks who log onto my hosts is minuscule. I want to skim a short list of logins, recognize them all, and move on with my day.

[I’ve trivially modified the failedlogin script to recognize successful logins](https://cdn.mwl.io/crap/801.loginsuccess). No, I’m not going to put this on github. I quit using github several years ago.[<sup>1</sup>](https://mwl.io/archives/24601#easy-footnote-bottom-1-24601) Drop it into /usr/local/etc/periodic/security and enable it in /etc/periodic.conf.local.

`security_status_loginfail_enable=NO  
 security_status_loginsuccess_enable=YES`

This only catches SSH logins, though. If anyone has suggestions for improving the regex catching assorted logins for the services you use, I’m open to it.

Will I submit it as a PR? Uh, maybe? Depends if anyone cares.