+++
title = "Invitation to Join a Posse of Webmention Scratch-Builders to Work Towards Interoperability"
description = " webmentioncomputingindiewebInvitation to Join a Posse of Webmention Scratch-Builders to Work Towards InteroperabilityA Call to Arms for Indieweb Developers https://khleedril.org/blog/2026-05-29--webmentions-posse.html khleedril.org/2026-05-29--webmentions-pos"
date = "1970-01-01T00:00:00Z"
url = "https://khleedril.org/blog/2026-05-29--webmentions-posse.html"
author = "Dale Mellor"
text = ""
lastupdated = "2026-11-12T12:47:49.941675123Z"
seen = true
+++

webmentioncomputingindieweb

Invitation to Join a Posse of Webmention Scratch-Builders to Work Towards Interoperability
==========

A Call to Arms for Indieweb Developers
----------

 https://khleedril.org/blog/2026-05-29--webmentions-posse.html

 khleedril.org/2026-05-29--webmentions-posse

Dale Mellor [ https://khleedril.org/dale-mellor ](https://khleedril.org/dale-mellor)

 29th May, 2026

I am a software scratch-builder (it is a great learning resource and gives me much satisfaction knowing that I know how things work under the surface), and I am a relative newcomer to the world of Indieweb, and have started to journey through the multitude of protocols that are out there. Recently I have spent a lot of time working on Webmentions<sup><a href="#webmentions">[1]</a></sup>, and have come to realize that there really isnʼt a solid understanding of how it is supposed to work. Many sites implement it simply as, ‘Create a web page with a link to us, and tell us the URL of that page.’ At that level it seems very simple, but there be dragons which are actually quite hard to slay. The first is simply that the receiver of a webmention, after doing verification that the request has integrity and is genuine, has to have an algorithm to actually extract the meat of the, possibly malicious, message which is being conveyed. So we get to Microformats2<sup><a href="#microformats">[2]</a></sup>…

Iʼm not going to grind out the never-ending list of dragons which arise; Iʼm sure all webmention scratch-builders have hit the same obstacles. The upshot is that it is a small effort to properly interact with a third-party web site through webmentions (though, without feedback, it is a bit of a hit-and-miss exercise), but it is a Herculean task to make an implementation which interacts properly with all third-party sites. And it is a task which simply cannot be performed by an individual, but requires a like-minded community to work together to thrash out the details of a robust, agreeable protocol.

This call-to-arms is precisely that: an attempt to find a set of developers who wish to work together to achieve interoperability across all the sites of those developers.

There will not be a set of definite expectations on the project: no explicit time-scale nor pre-supposed end point. Rather, participants will be expected to send test messages to each otherʼs site, and provide constructive feedback about their experience. Participants should be open to a little debate about how best to solve particular problems, and then will be expected to make an effort to implement those solutions.

Given the above, hopefully a time will come when we can make a hard specification document about how we made webmentions work reliably between ourselves, and thence make life easier for those who come along later (IndiewebCamp<sup><a href="#indiewebcamp">[3]</a></sup> already has something like that, but I think that there is room for improvement).

To respond to this please set up a test, or scratch, page that people can throw tentative webmentions at, and thus get the interoperability development rolling. (I have my own scratch page<sup><a href="#test-page">[4]</a></sup>.) Then please try to send a webmention to the current page you are on, specifying the URL of your test page. If that webmention fails (hah!), please try to use the ping-back field near the bottom of this page. If that fails, please use my contact form which can be reached from the bottom of this page; in that case, we have much work to do!

Please come back here regularly to see if new members want interaction testing, and for general news or announcements about the project; Iʼll try to keep the discussion threads here simple.

Thank you, and good luck!

[ Also posted on IndieNews ](https://news.indieweb.org/en)

#### References ####

1. <a name="webmentions"></a> [https://webmention.net/draft/](https://webmention.net/draft/)  
   W3C Webmentions specification
2. <a name="microformats"></a> [https://microformats.org/wiki/microformats2](https://microformats.org/wiki/microformats2)  
   Microformats2 description
3. <a name="indiewebcamp"></a> [https://indieweb.org/Webmention](https://indieweb.org/Webmention)  
   IndiewebCamp Webmentions description
4. <a name="test-page"></a> [https://khleedril.org/blog/2026-05-28--webmention-practise.html](https://khleedril.org/blog/2026-05-28--webmention-practise.html)  
    My practise page
5. <a name="newleafjournal"></a> [https://thenewleafjournal.com/social-webs-of-personal-websites/](https://thenewleafjournal.com/social-webs-of-personal-websites/)  
    A rambling essay from the New Leaf Journal about blogging and connecting blogs together.