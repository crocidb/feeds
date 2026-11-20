+++
title = "Deletion from Rich Blog Commentary"
description = " webmentioncomputingindiewebDeletion from Rich Blog CommentaryThe Right to be Forgotten https://khleedril.org/blog/2026-05-20--charmed-webmentions--deletion.html khleedril.org/2026-05-20--charmed-webmentions--deletionDale Mellor [ https://khleedril.org/dale-me"
date = "1970-01-01T00:00:00Z"
url = "https://khleedril.org/blog/2026-05-20--charmed-webmentions--deletion.html"
author = "Dale Mellor"
text = ""
lastupdated = "2026-11-12T12:47:49.943146756Z"
seen = false
+++

 webmentioncomputingindieweb

Deletion from Rich Blog Commentary
==========

The Right to be Forgotten
----------

 https://khleedril.org/blog/2026-05-20--charmed-webmentions--deletion.html

 khleedril.org/2026-05-20--charmed-webmentions--deletion

Dale Mellor [ https://khleedril.org/dale-mellor ](https://khleedril.org/dale-mellor)

 20th May, 2026

### Introduction ###

 We are working towards implementation of rich commenting on this blog, and here we ponder the nature of the right to be forgotten and the machinery needed to make this possible in a federated rich commenting system.

 By *rich blog commentary* we mean a system where comments can be made on othersʼ comments, as well as our top-level articles, thus creating a local threaded discussion forum. But it is expected that comments will be posted elsewhere and syndicated to us (the *POSSE* principle<sup><a href="#posse">[2]</a></sup>) via a *webmention*<sup><a href="#webmention-protocol">[1]</a></sup>.

### The Right to be Forgotten ###

 One of this authorʼs peeves is people deleting posts they made on the open web, after they have been referred to by other people, effectively breaking other peoplesʼ web sites. I often come across blogs laden with references to othersʼ work, but they themselves insist on deleting stuff they decide they donʼt like to keep out there. In effect, they are pushing their mess on everybody else. I am of the opinion that, like old-fashioned book publishing, once it is out there, it is out there forever.

 Indiewebbing and the right to be forgotten are very much at loggerheads with each other when it comes to recording conversations, because in this case one person totally wants a comment to be deleted, while another person totally does not. If I have kept a response to something you posted, I would like to keep a copy of your original post, if not the entire thread from the original article down to the last comment-on-comment, for posterity, so that my contribution keeps its context which I can see if I look back at it at a later time.

 But then what should happen if you decide you want everyone to forget about your comment? You can delete it from your own service easily enough (whether or not you actually delete the data from your disk drive and all the backups), and most webmention sites allow for a null notification (maybe a HTTP 410 return) to indicate that a post is to be deleted, in which case a legally-obliging site would delete your post from its disk drives and all backup locations and log files.

 But the post may still be lying around other servers (not to mention anonymous aggregators) who have kept copies ‘for posterity’ so that their own posts keep their contexts. The appropriate thing here would be for the article server to notify all participants in the comment threads about the deletion requests, and then the whole community must hope that all participants will do the right thing (which is almost surely a lie given the nature of the big players and home and foreign government surveillance).

 Legalities aside, the main point which comes out of this is that the article server needs to be able to update all conversation participants when a change anywhere in the conversation takes place. (*Salmention<sup><a href="#salmention">[3]</a></sup>*-flavoured webmentions are a step towards this end, but they only notify the parents of modified posts). This at the very least allows comment servers to send notifications to their users about changes in a comment thread they are participating in.

### Rich Comment Implementations ###

 The great thing about the indieweb is that people are free to do entirely what they want with their web sites. They can play loose and free with whatever standards they choose to adopt. This can be both a positive and a negative: on the plus side is liberty, on the negative, proper interoperability is difficult to achieve and code which implements it has to deal with lots of potential misunderstandings. These comments, I think, summarize well both *webmentions* and, moreso, *microformats*, both of which leave much room for wiggles. This document is written in the same vein: we do not attempt to define a rigid new protocol, but merely describe how our web site (blog) works, and invite others to interoperate with it however they see fit.

 At the other extreme, the otherwise excellent *ActivityPub* is a comprehensively specified protocol, particularly in the semantics, (it is still not perfect), and it is quite a Herculean effort to fully implement it, especially with its quasi-optional use of JSON-LD (Javascript Object Notation, Linked Data). We wonder if we can find the best of two worlds, and produce a social discussion system which is truly de-centred, but done in a way which can be implemented to a level of sophistication chosen by the indieweb site owner: simple webmentions can be kept simple!

 Of course, people can always choose to defer discussion to a social media system, such as the *Fediverse*, or may choose to not indulge in discussion at all (if it is too easy, comments tend to be trite and flippant: a waste of everybodyʼs time).

### Our Implementation ###

 In developing the system you are looking at right now, I am considering how to allow feedback through the webmention<sup><a href="#webmention-protocol">[1]</a></sup> mechanism (I am slowly working through all the indieweb protocols floating around), and on occasional articles which merit them I would like to provide directly a discussion facility, i.e., allow comments on comments from anybody who can provide at least a basic, standard, webmention.

 On the face of it, the Webmention Protocol is very simple, and allows anyone to post a comment on anyone elseʼs articles very easily. And right then there opens a can of worms: one finds oneself wanting to allow comments on comments, and, when commenting on anotherʼs comments on anotherʼs article, want to keep a copy of the entire conversation locally for posterity. And all the while, any commenter anywhere has the right to be forgotten, and may decide they want to modify their original post, to correct small typing mistakes or silly misunderstandings (though adversarially they may try to retrospectively coerce the conversation in their favour by modifying the apparent history of the thread: another reason for wanting to keep copies of full conversations locally).

 Then when I respond to someone elseʼs article on their server through the Webmention Protocol, and they respond back to me, I (usually) donʼt get a ping-back of that. This to be fair is a policy matter for the article site, not me, but shouldnʼt that be considered a common curtesy? Especially if the idea is that an article generates discussion, then all the participants will need regular notifications of updates. And policies like this need to be set on each individual article.

 In all cases of changes in conversations, it clearly becomes necessary to inform all participants when changes take place.

### Next Steps ###

 In our next post on this topic we will nail down the exact protocol and the semantics of it so that other sites can choose to interact with it, or not.

### References ###

1. <a name="webmention-protocol"></a> [https://www.w3.org/TR/webmention/](https://www.w3.org/TR/webmention/)  
    The Webmention Protocol specification at W3C.
2. <a name="posse"></a> [https://indieweb.org/POSSE](https://indieweb.org/POSSE)  
    The POSSE principle explainer at Indieweb.org.
3. <a name="salmention"></a> [https://indieweb.org/Salmention](https://indieweb.org/Salmention)  
    The salmention specification.