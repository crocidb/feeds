+++
title = "358: OpenBSD Kubernetes Clusters"
description = "Yubikey-agent on FreeBSD, Managing Kubernetes clusters from OpenBSD, History of FreeBSD part 1, Running Jitsi-Meet in a FreeBSD Jail, Command Line Bug Hunting in FreeBSD, Game of Github, Wireguard official merged into OpenBSD, and moreNOTES   This episode of BSDNow is broug"
date = "2020-07-09T13:00:00Z"
url = "https://www.bsdnow.tv/358"
author = "feedback@bsdnow.tv (JT Pennington)"
text = ""
lastupdated = "2026-03-26T14:37:50.528832730Z"
seen = false
+++

Yubikey-agent on FreeBSD, Managing Kubernetes clusters from OpenBSD, History of FreeBSD part 1, Running Jitsi-Meet in a FreeBSD Jail, Command Line Bug Hunting in FreeBSD, Game of Github, Wireguard official merged into OpenBSD, and more

***NOTES***  
 This episode of BSDNow is brought to you by [Tarsnap](https://www.tarsnap.com/)

Headlines
----------

### [yubikey-agent on FreeBSD](https://kernelnomicon.org/?p=855) ###

>
>
> Some time ago Filippo Valsorda wrote yubikey-agent, seamless SSH agent for YubiKeys. I really like YubiKeys and worked on the FreeBSD support for U2F in Chromium and pyu2f, getting yubikey-agent ported looked like an interesting project. It took some hacking to make it work but overall it wasn’t hard. Following is the roadmap on how to get it set up on FreeBSD. The actual details depend on your system (as you will see)
>
>
> ---
>

### [Manage Kubernetes clusters from OpenBSD](https://e1e0.net/manage-k8s-from-openbsd.html) ###

>
>
> This should work with OpenBSD 6.7. I write this while the source tree is locked for release, so even if I use -current this is as close as -current gets to -release  
>  Update 2020-06-05: we now have a port for kubectl. So, at least in -current things get a bit easier.
>
>
> ---
>

News Roundup
----------

### [History of FreeBSD Part 1: Unix and BSD](https://klarasystems.com/articles/history-of-freebsd-unix-and-bsd/?utm_source=bsdnow) ###

>
>
> FreeBSD, a free and open-source Unix-like operating system has been around since 1993. However, its origins are directly linked to that of BSD, and further back, those of Unix. During this History of FreeBSD series, we will talk about how Unix came to be, and how Berkeley’s Unix developed at Bell Labs.
>
>
> ---
>

### [Running Jitsi-Meet in a FreeBSD Jail](https://honeyguide.eu/posts/jitsi-freebsd/) ###

>
>
> Due to the situation with COVID-19 that also lead to people being confined to their homes in South Africa as well, we decided to provide a (freely usable of course) Jitsi Meet instance to the community being hosted in South Africa on our FreeBSD environment.  
>  That way, communities in South Africa and beyond have a free alternative to the commercial conferencing solutions with sometimes dubious security and privacy histories and at the same time improved user experience due to the lower latency of local hosting.
>
>
>
> * [Grafana for Jitsi-Meet](https://honeyguide.eu/posts/jitsi-grafana/) \*\*\*
>
>

### [Command Line Bug Hunting in FreeBSD](https://adventurist.me/posts/00301) ###

>
>
> FreeBSD uses bugzilla for tracking bugs, taking feature requests, regressions and issues in the Operating System. The web interface for bugzilla is okay, but if you want to do a lot of batch operations it is slow to deal with. We are planning to run a bugsquash on July 11th and that really needs some tooling to help any hackers that show up process the giant bug list we have.
>
>
> ---
>

Beastie Bits
----------

* [Game of Github](https://glebbahmutov.com/game-of-github/)
* + [Wireguard official merged into OpenBSD](https://marc.info/?l=openbsd-cvs&m=159274150512676&w=2) \*\*\*

### Tarsnap ###

* This weeks episode of BSDNow was sponsored by our friends at Tarsnap, the only secure online backup you can trust your data to. Even paranoids need backups.

Feedback/Questions
----------

* [Florian : Lua for $HOME](<https://github.com/BSDNow/bsdnow.tv/blob/master/episodes/358/feedback/Florian - Lua for $HOME>)
* [Kevin : FreeBSD Source Question](<https://github.com/BSDNow/bsdnow.tv/blob/master/episodes/358/feedback/Kevin - FreeBSD Source Question>)
* [Tom : HomeLabs](<https://github.com/BSDNow/bsdnow.tv/blob/master/episodes/358/feedback/Tom - HomeLabs>)

  ---

* Send questions, comments, show ideas/topics, or stories you want mentioned on the show to [feedback@bsdnow.tv](mailto:feedback@bsdnow.tv)

  ---