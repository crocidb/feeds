+++
title = "Re: Replies Instead of Comments"
description = " bloggingindiewebRe: Replies Instead of Comments https://khleedril.org/blog/2026-11-13--replies-instead-of-comments.html khleedril.org/2026-11-13--replies-instead-of-commentsDale Mellor  https://khleedril.org/dale-mellor  13th Novemb"
date = "1970-01-01T00:00:00Z"
url = "https://khleedril.org/blog/2026-11-13--replies-instead-of-comments.html"
author = "Dale Mellor"
text = ""
lastupdated = "2026-11-19T14:05:13.750092082Z"
seen = false
+++

 bloggingindieweb

Re: Replies Instead of Comments
==========

 https://khleedril.org/blog/2026-11-13--replies-instead-of-comments.html

 khleedril.org/2026-11-13--replies-instead-of-comments

Dale Mellor [ https://khleedril.org/dale-mellor ](https://khleedril.org/dale-mellor)

 13th November, 2026

Prior to recent changes on Bubbles.town<sup><a href="#bubbles_town">[5]</a></sup>, there were in principle multiple ways to comment on an article:

1. Comment on Bubbles.town
2. Comment on the Fediverse, e.g., Mastodon (sometimes an option)
3. Comment on the article directly (usually an option)
4. Write a reply, send a webmention (sometimes an option)
5. Write a response article;
   1. Maybe send a webmention
   2. Let Bubbles pick it up via RSS, thread automatically to original posting (OP)

Since earlier this month, the first option has been removed<sup><a href="#bubbles">[1]</a></sup>. I think that this is a good idea for all the reasons given in that reference, and additionally that no blogs that I am aware of linked back to comments on Bubbles, so readers looking at the OP would never have known about the Bubbles comment.

In general, the same remark applies to the other options: unless the original article makes an effort to pull comments back from all the places they may appear, there will never be an intact registry of all comments received, resulting in multiple fragmentation of the comment space; this is why I argue here that the best thing would be to agree on a single commenting mechanism across the independent web.

As the Bubbles article <sup><a href="#bubbles">[1]</a></sup> points out, Option 2 is very difficult to implement, the ActivityPub<sup><a href="#activitypub">[2]</a></sup> protocol being both sophisticated but also quite ambiguous in many respects. This has to be regarded as too much of a burden on individual bloggers. It also has to be said that there is quite a disconnect between a blog post and the Fediverse, and that there are other outlets to advertise the OP, e.g. BlueSky/AT protocol, use of which would further fragment the comment space. While Bubbles will automatically create a Mastodon posting for an article, and a—yet another—RSS notice of it, the OP itself may not know that any such things exist.

Option 3, commenting on the article directly, is perhaps the best way to maintain a central registry of comments. But the operative word is ‘central’; it defeats the POSSE<sup><a href="#posse">[3]</a></sup> principle, that commenters own their own comments, keep them on their own website, and post elsewhere. It means that if the article blog disappears, then all the comments will go with it. And some of those comments may have stood as articles in their own right: but they would not have appeared as such on RSS feeds, or, indeed, on Bubbles.

Option 5.2 would seem to be Bubblesʼ new preference. In general, I think that writing an article as a comment is a bit too heavy-handed, and, apart from on Bubbles, the article does not really get linked properly to the OP. Longer responses, however, are definitely better as articles, especially where these clarify the context to which the response is being written, and thus produce a self-contained document. It is also good that the Bubbles policy encourages this to happen. But I think that fluid conversations are difficult when participation involves this much work. It may also be that such articles do not sit well with the nature of the blog from which they are being disseminated, i.e. subject-irrelevant content.

Option 5.1 is the best of both worlds. A stand-alone article is produced which is ‘published’ in the normal way on the blogosphere (whatever that means), Bubbles will pick it up and hopefully link it to the OP, a webmention to the OP will allow them to register the comment properly under the OP (whether they reproduce it or provide a back-link to the comment is up to them). It is possible that the OP can also accept comments-on-comments (this blog does!) and webmention them back to the first commenter (this is the *salmention* protocol<sup><a href="#salmention">[4]</a></sup>). As already noted, this does actually become quite heavy-handed, and, while a blogger can choose to implement as much or as little of the protocol as they choose, it is still quite a burden—and it SHOULD include comment removal processing, where a comment is deleted and a *tombstone* webmention sent.

My own favorite is Option 4, as my blogʼs administrative interface allows me to write quick notes which donʼt appear in my main blog listing, but are simply given cryptic (but permanent) URLs and webmentioned to the OP. This has all the advantages listed above, except that Bubbles will not see these kinds of comments, but at least it does not clog up my own article listings with responses to other articles (I could list them separately if I wanted to).

Given these remarks, it is no secret that I am a fan of the webmention protocol, and it would please me enormously if this were universally used to make comments on blog articles, at the demise of all the other methods which I think muddy the water and dilute independent web principles too much.

#### References ####

1. <a name="bubbles"></a>[https://dshbx.de/blog/bubbles/entry/612df1ea-0643-45b3-9e22-d160a86e5594](https://dshbx.de/blog/bubbles/entry/612df1ea-0643-45b3-9e22-d160a86e5594)  
   The post explaining the recent changes on Bubbles.
2. <a name="activitypub"></a>[https://www.w3.org/TR/activitypub/](https://www.w3.org/TR/activitypub/)  
   The ActivityPub specification document.
3. <a name="posse"></a> [https://indieweb.org/POSSE](https://indieweb.org/POSSE)  
    The POSSE principle explainer at Indieweb.org.
4. <a name="salmention"></a> [https://indieweb.org/Salmention](https://indieweb.org/Salmention)  
    The salmention specification.
5. <a name="bubbles_town"></a>[https://bubbles.town/](https://bubbles.town/)  
   The Bubbles site itself