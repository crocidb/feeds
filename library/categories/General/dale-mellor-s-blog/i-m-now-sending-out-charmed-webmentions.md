+++
title = "Iʼm Now Sending Out Charmed Webmentions"
description = " computingwebmentionindiewebIʼm Now Sending Out Charmed WebmentionsWhat to do if you receive one from me https://khleedril.org/blog/2026-06-21--charmed-webmentions.html khleedril.org/2026-06-21--charmed-webmentionsDale Mellor [ https://khleedril.org/dale-mello"
date = "1970-01-01T00:00:00Z"
url = "https://khleedril.org/blog/2026-06-21--charmed-webmentions.html"
author = "Dale Mellor"
text = ""
lastupdated = "2026-11-12T12:47:49.938873924Z"
seen = false
+++

 computingwebmentionindieweb

Iʼm Now Sending Out Charmed Webmentions
==========

What to do if you receive one from me
----------

 https://khleedril.org/blog/2026-06-21--charmed-webmentions.html

 khleedril.org/2026-06-21--charmed-webmentions

Dale Mellor [ https://khleedril.org/dale-mellor ](https://khleedril.org/dale-mellor)

 21st June, 2026

 article .pre { font-size: 70%; font-family: "monospace"; border: 1px dashed black; } article div.pre span { color: #0c0; } article ol { text-align: justify; }

### 1. Introduction ###

 In developing the system you are looking at right now, I am considering how to allow feedback through the webmention<sup><a href="#webmention-protocol">[1]</a></sup> mechanism (I am slowly working through all the Indieweb protocols floating around), and on occasional articles which merit them I would like to provide directly a discussion facility, i.e., allow comments on comments from anybody who can provide at least a basic, standard, webmention.

 On the face of it, the webmention protocol is very simple, and allows anyone to post a comment on anyone elseʼs articles easily. And right then there opens a can of worms: one finds oneself wanting to allow comments on comments, and, when commenting on anotherʼs comments on anotherʼs article, want to keep a copy of the entire conversation locally for posterity.

 Then when I respond to someone elseʼs article on their server through the webmention protocol, and they respond back to me there, I (usually) donʼt get a ping-back of that. This, to be fair, is a policy matter for the article site, not me, but shouldnʼt that be considered a common courtesy? Especially if the idea is that an article generates discussion, then all the participants will need regular notifications of updates.

 The great thing about the Indieweb is that people are free to do entirely what they want with their web sites. They can play loose and free with whatever standards they choose to adopt. This can be both a positive and a negative: on the plus side is liberty, on the negative, proper interoperability is difficult to achieve and code which implements it has to deal with lots of potential misunderstandings. These comments, I think, summarize well both *webmentions* and, moreso, *microformats*, both of which leave much room for wiggles. This document is written in the same vein: we do not attempt to define a rigid new protocol, but merely describe how our web site (blog) works, and invite others to interoperate with it however they see fit.

 Of course, people can always choose to defer discussion to a social media system, such as the *Fediverse*, or may choose to not indulge in discussion at all (if it is too easy, comments tend to be trite and flippant: a waste of time).

### <a name="bottom-up"></a>2. Charmed Webmentions ###

 All of this entails that there are four URLs involved in the most general webmention after a comment is made on a comment: each of the erstwhile participantsʼ webmention end-points (hereafter we refer to people who have made a comment earlier in the discussion as *erstwhile commenters*), the articleʼs own URL, the target commentʼs URL, and the new comment URL.

 And so we send out ‘charmed’ webmentions to alert the participants of the new interaction, which we augment with a new form-data field article. In this way a least-effort receiver can prompt the user to go to the article to see the new activity which has taken place in the discussion.

 An even lower-effort recipient might receive what would appear to be an irrelevant webmention in which none of the URLs are directly relevant to the participant, and that would be ignored if a server has not been modified to recognize these charmed mentions.

 We recognize three different actor types: the article server, the immediate commenterʼs server, and an erstwhile commenterʼs server.

 New comments are submitted to the *article* server in the form of a standard webmention (a HTTP POST message carrying form-encoded source and target fields), except that the target can be one of the comments on an article as well as the article itself (note that all participants MUST send comments to the article server, NEVER to the target comment server; this will ensure that the conversation is maintained and all participants will get a notification of the update).

 And so the article server flows upwards from the new comment, through the parentage, and relays the webmention, if possible, to all erstwhile comment servers in the conversation. The relayed webmentions will be charmed with the augmented field article to help with identification and to distinguish it as a relay; it is to be expected that most servers, those with unmodified webmention implementations, will either ignore or fail the mention as they havenʼt been adapted for this extension (the target will point to an alien URL for them); *salmention*<sup><a href="#salmention">[4]</a></sup>-enabled servers will continue to work as before (note that the salmention protocol only alerts the target comment of the update, not the whole chain).

 When a comment server is notified of a new comment via a charmed webmention relayed to it from an article server, it could if it wanted to download the new comment and store it locally for posterity, tracking all charmed webmentions that come in and keeping a record of the entire conversation.

#### 2.1 Actions of the Article Server ####

 The modification we must make to the *webmention* end-point on the article server is that the target will not necessarily be on our server, but may be to a comment on another server which has been mentioned to us. It just means that we have to work a little bit harder to determine if the target link relates to our site in some way, either directly or indirectly, and, more to the point, which article is it on? Once that is known, the server wrangles the new mention into the comment tree under that article, making a new leaf. Note that the server dictates the policy, perhaps on a per-article basis, of what comments are acceptable: maybe none, maybe one layer deep (i.e., no comments-on-comments), or perhaps an arbitrarily large and complex tree is allowed to develop (*à la* a discussion forum).

 Additionally, the article server needs to consider whether webmentions represent new comments, revisions or even deletions, and modify the articleʼs comment tree appropriately, again according with local policy.

 Whatever changes take place, the article server must then decide which corresponding comment servers should be notified of the change: policy might be no notifications, only the immediate parent postʼs server is notified, or maybe all servers between the tree root (the article itself) and the new post are notified. In general this work should be done asynchronously and in relatively slow time to not cause network avalanches, with an extra field in the relayed webmention of the form article=https://khleedril.org/blog/2026-06-21--charmed-webmentions.html (to use this page as an example).

#### 2.2 Actions of an Immediate Comment Server ####

 Comment servers have a lot of leeway in their action policies, and the consequences of them. Up front, they must choose how much detail of conversations they want to track and store locally. At the simplest level, they could simply not track anything, and ignore webmentions they might receive which do not refer to any posts they hold. This is the status quo. On the other hand, for a tiny bit of effort they might notice that a webmention contains an article field, and simply notify their users that a change in the conversation on that article has taken place by supplying the article URL; the user can then deal with any consequences manually.

 At the other extreme, a comment server may decide it wants to keep all of a conversation locally, both for posterity and to provide the users alternative, local, presentations of the conversation (the comment server is free to reduce and re-format original posts differently to the article server). When a webmention comes in, they will want to get the article and all comments from the article server, and compare with the locally-held versions. If there are differences, the comment server may invoke some sophisticated algorithm to synchronize the local and remote representations of the conversation, and carefully inform the user of changes made in the history of the conversation (this may have been done with subversive intention).

 At an even further extreme, the comment server might allow responses in the conversation directly on that server via webmentions. These should be relayed as ordinary webmentions to the original article server, which must always be considered to be the definitive store of *all* comments on its articles. In this way a fully federated system of interoperating servers carry the conversation, just like *ActivityPub* servers do, and there is no ambiguity about the provenance of the conversation (unless the article server is intentionally subversive).

 In any case, the comment server should always notify ONLY the article server of any edits to the comment, or wishes for deletion from the conversation; the article server will notify adjacent comment-holders in the discussion according to its policy.

#### 2.3 Actions of an Erstwhile Comment Server ####

 Servers with conventional webmention functionality will continue to work, they will simply ignore charmed mentions they receive as none of the URLs in them will relate directly to anything on the server.

 The next level of interaction is to simply notify the local user that action has taken place on an article they have commented on in the past, providing the URL to the article itself (which is of course provided directly in the charmed webmention). It is prudent that the server tracks articles which have actually been commented on, to avoid spamming the user in case of errant communications.

 At the hightest level the server would choose to make local copies of discussion threads the user is engaged with, so that the thread is immediately available and the comment which has been made is kept in context. This would follow the same reasoning as for the immediate comment server, discussed above.

### 3. Conclusion ###

 If you post a comment to this article, donʼt be surprised if you get some odd webmentions coming back at you at random times. It means someone else has added to the discussion. Maybe you can use this information (point the user to the mentionʼs article field), or you can just ignore it as per the status quo.

### 4. References ###

1. <a name="webmention-protocol"></a> [https://www.w3.org/TR/webmention/](https://www.w3.org/TR/webmention/)  
    the Webmention Protocol specification at W3C.
2. <a name="indiewebcamp"></a> [https://indieweb.org](https://indieweb.org)  
    the Indiewebcamp home page, a wiki.
3. <a name="indiewebcamp-comments"></a> [https://indieweb.org/comments](https://indieweb.org/comments)  
    Indiewebcampʼs extensive living development and discussion of comments.
4. <a name="salmention"></a> [https://indieweb.org/Salmention](https://indieweb.org/Salmention)  
    Indiewebcampʼs Salmention protocol.
5. <a name="durnell"></a> [https://tracydurnell.com/2025/01/09/sanding-off-friction-from-indie-web-connection/](https://tracydurnell.com/2025/01/09/sanding-off-friction-from-indie-web-connection/)  
    Tracy Durnellʼs appraisal of the Indieweb interaction situation.
6. [https://news.indieweb.org/en](https://news.indieweb.org/en)  
    Posted on IndieNews 2026-06-30.