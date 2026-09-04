+++
title = "399: Comparing Sandboxes"
description = "Comparing sandboxing techniques, Statement on FreeBSD development processes, customizing FreeBSD ports and packages, the quest for a comfortable NetBSD desktop, Nginx as a TCP/UDP relay, HardenedBSD March 2021 Status Report, Detailed Behaviors of Unix Signal, and moreNOTES "
date = "2021-04-22T07:00:00Z"
url = "https://www.bsdnow.tv/399"
author = "feedback@bsdnow.tv (JT Pennington)"
text = ""
lastupdated = "2026-03-26T14:37:50.462638481Z"
seen = true
+++

Comparing sandboxing techniques, Statement on FreeBSD development processes, customizing FreeBSD ports and packages, the quest for a comfortable NetBSD desktop, Nginx as a TCP/UDP relay, HardenedBSD March 2021 Status Report, Detailed Behaviors of Unix Signal, and more

***NOTES***  
 This episode of BSDNow is brought to you by [Tarsnap](https://www.tarsnap.com/bsdnow)

Headlines
----------

### [Comparing sandboxing techniques](https://www.omarpolo.com/post/gmid-sandbox.html) ###

>
>
> I had the opportunity to implement a sandbox and I'd like to write about the differences between the various sandboxing techniques available on three different operating systems: FreeBSD, Linux and OpenBSD.
>
>
> ---
>
>
> ### [Statement on FreeBSD development processes](https://lists.freebsd.org/pipermail/freebsd-hackers/2021-March/057127.html) ###
>
>
>
> In light of the recent commentary on FreeBSD's development practices, members of the Core team would like to issue the following statement.
>
>
> ---
>
>
> ### [Customizing FreeBSD Ports and Packages](https://klarasystems.com/articles/customizing-freebsd-ports-and-packages/) ###
>
>
>
> A basic intro to building your own packages
>
>
> ---
>

News Roundup
----------

### [FVWM(3) and the quest for a comfortable NetBSD desktop](https://www.unitedbsd.com/d/442-fvwm3-and-the-quest-for-a-comfortable-netbsd-desktop) ###

>
>
> FVWM substantially allows one to build a fully-fledged lightweight desktop environment from scratch, with an almost unparalleled degree of freedom. Although using FVWM does not require any knowledge of programming languages, it is possible to extend it with M4, C, and Perl preprocessing.
>
>
> ---
>
>
> ### [Nginx as a TCP/UDP relay](https://dataswamp.org/~solene/2021-02-24-nginx-stream.html) ###
>
>
>
> In this tutorial I will explain how to use Nginx as a TCP or UDP relay as an alternative to Haproxy or Relayd. This mean nginx will be able to accept requests on a port (TCP/UDP) and relay it to another backend without knowing about the content. It also permits to negociates a TLS session with the client and relay to a non-TLS backend. In this example I will explain how to configure Nginx to accept TLS requests to transmit it to my Gemini server Vger, Gemini protocol has TLS as a requirement.
>
>
> ---
>
>
> ### [HardenedBSD March 2021 Status Report](https://hardenedbsd.org/article/shawn-webb/2021-03-31/hardenedbsd-march-2021-status-report) ###
>
>
>
> This month, I worked on finding and fixing the regression that caused kernel panics on our package builders. I think I found the issue: I made it so that the HARDENEDBSD amd64 kernel just included GENERIC so that we follow FreeBSD's toggling of features. Doing so added QUEUE\_MACRO\_DEBUG\_TRASH to our kernel config. That option is the likely culprit. If the next package build (with the option removed) completes, I will commit the change that removes QUEUE\_MACRO\_DEBUG\_TRASH from the HARDENEDBSD amd64 kernel.
>
>
> ---
>
>
> ### [Detailed Behaviors of Unix Signal](https://www.dyx.name/posts/essays/signal.html) ###
>
>
>
> When Unix is mentioned in this document it means macOS or Linux as they are the mainly used Unix at this moment. When shell is mentioned it means Bash or Zsh. Most demos are written in C for macOS with Apple libc and Linux with glibc.
>
>
> ---
>
>
> ### Tarsnap ###
>
>
>
> * This weeks episode of BSDNow was sponsored by our friends at Tarsnap, the only secure online backup you can trust your data to. Even paranoids need backups.
>
>

Feedback/Questions
----------

* [andrew - flatpak](<https://github.com/BSDNow/bsdnow.tv/blob/master/episodes/399/feedback/andrew - flatpak>)

* [chris - mac and truenas](<https://github.com/BSDNow/bsdnow.tv/blob/master/episodes/399/feedback/chris - mac and truenas>)

* [robert - some questions](<https://github.com/BSDNow/bsdnow.tv/blob/master/episodes/399/feedback/robert - some questions>)

  ---

* Send questions, comments, show ideas/topics, or stories you want mentioned on the show to [feedback@bsdnow.tv](mailto:feedback@bsdnow.tv)

  ---