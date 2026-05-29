+++
title = "Interface stability"
description = 'The main Artemis interface has remained largely the same since I made the software available for others to use. Here is the interface in December 2024. Here is the interface in 2026 [^1] [^2]: The Artemis web reader showing a list of posts under the heading "Friday, March 27th". '
date = "2026-03-27T00:00:00Z"
url = "https://jamesg.blog/2026/03/27/interface-stability"
author = "James' Coffee Blog"
text = ""
lastupdated = "2026-03-30T10:52:54.063047048Z"
seen = false
+++

The main Artemis interface has remained largely the same since I made the software available for others to use. [Here is the interface in December 2024](https://artemis.jamesg.blog/assets/demo_dark.webp). Here is the interface in 2026 [^1] [^2]:

![The Artemis web reader showing a list of posts under the heading "Friday, March 27th".](https://editor.jamesg.blog/content/images/2026/03/ui.png)

ALT

The Artemis web reader showing a list of posts under the heading "Friday, March 27th".

The main change that I have made is that the navigation bar now has a “search” link, now that search is supported.

When I added the search link, I spent quite a bit of time thinking about whether I should make it opt-in via a settings toggle [^3]. I knew that adding the search link in the place where I wanted it to be – after the “add” link used to add an author to one’s reader – would shift other links, which would mean that two navigation links that had been there for months would now be in different places.

After some thought, I ultimately opted to add the link in for everyone. I thought the search feature was sufficiently useful that it should be in the navigation bar.

Aside from that, the interface now has supported for “nested” posts, which appear in certain contexts (mostly: when you are subscribed to a Mastodon account, you replies that make up a thread of posts by the same author in lighter grey text and nested below the main post, to preserve space). This is an enhancement; it doesn’t disrupt the core functionality of showing the list of posts.

I haven’t had any impulse to redesign the software. I like the way things are. The software feels visually stable. It works, and doesn’t change much. I have added a few new layouts, but those layouts co-exist – users can choose what layout they want to use from their account settings.

I was thinking about this today after reflecting on all the times when a redesign has been jarring for me. I am cognisant of redesigns in software I have used that still, sometimes years on, don’t do essential things as easily as was possible before their redesign.

Of note, there are areas where the interface has changed more substantially. Such changes primarily pertain to settings or subscription management. Indeed, software changes: Artemis does a lot more than it did two years ago. The interface reflects that. For example, the account settings page started to grow significantly, so I broke it up into several sub-pages. This reorganisation felt better than the alternative of continuing to add more options to a single page.

As software changes, so too might a UI; there is no part of me that can reasonably make any blanket statement about how redesigns are not a good idea, or that redesigns are essential, or that UI stability should be prioritised over another design principle. Context matters. Rather, I aim to document that UI stability should be a design consideration. It feels good when everything is in roughly the same place.

[^1]: The colours are different because I have since set a custom colour theme in my account settings.

[^2]: You may notice that the 2024 version had an "invite" button. This was something I had enabled only for my account if I remember correctly so that I could manage invite codes.

[^3]: Another thought that crossed my mind was to make the link opt-in, but on by default for new users. This would have been substantially more engineering so I didn’t do it, but I still love this idea.

[Here is the interface in December 2024](https://artemis.jamesg.blog/assets/demo_dark.webp)