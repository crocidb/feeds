+++
title = "On (disabling) suggested filenames on macOS 27"
description = "This week I was writing a story and noticed something strange: I didn’t give the document a title, but, after saving it, the document had a title that I did not expect. If I don’t have a name for a story yet, or if I am doing free writing, I will often not give a document a title"
date = "2026-09-17T00:00:00Z"
url = "https://jamesg.blog/2026/09/17/macos-suggested-filenames"
author = "with words, wonder"
text = ""
lastupdated = "2026-09-21T09:42:42.414406803Z"
seen = false
+++

This week I was writing a story and noticed something strange: I didn’t give the document a title, but, after saving it, the document had a title that I did not expect. If I don’t have a name for a story yet, or if I am doing free writing, I will often not give a document a title, instead allowing the default behaviour in the tool I use to write, [Typora](https://typora.io), which is to take the first few words or maybe sentence of the document, or the first line. In the case of markdown, the first line is almost always my title, and so this default behaviour worked out well; where the first line was a paragraph, the first part of the document was taken as the title.

⁂ ⁂ ⁂

As a writer, every detail of my words matter to me: the punctuation, the grammar, the italics, the capitals (or lack thereof) the titles. Everything has meaning. When I noticed the unfamiliar title, I was displeased, because I am used to the software working in a certain way. If I don’t have a title, a fragment of the start of the document should be taken. I don’t want a “Suggested” title. I want a predictable title I set or one taken from the first few words of the piece, as was the previous behaviour.

Today I think I finally figured out why the document title had changed. macOS 27 has a feature called “Suggest file names”, whose description, listed in the Finder Settings, reads:

>
>
> Suggested names when renaming, saving and editing files are based on file content and the names of other files in the folder.
>
>

The suggested name for this document is “Typora Document” :facepalm:

Here is a screenshot I took of an earlier post I was planning to draft where I finally saw the behaviour in action:

![A screenshot of an open Typora window with a heading on the first line of the document that says "Upcoming web and writing events" but a "Suggested" title at the top of the window that reads "Web and Writing Events"](https://jamesg.blog/assets/uploads/suggestedtitle.png)

ALT

A screenshot of an open Typora window with a heading on the first line of the document that says "Upcoming web and writing events" but a "Suggested" title at the top of the window that reads "Web and Writing Events"

I found a [Reddit thread with instructions on how to disable the feature](https://www.reddit.com/r/MacOS/comments/1wia14h/settings_to_disable_some_ai_features_in_macos_27/), which offers the following instructions to disable suggested file names (bold text removed):

>
>
> Finder → Settings → General → uncheck Suggest file names.
>
>

I have disabled this feature, and do not intend on turning it back on.

⁂ ⁂ ⁂

Encountering this “feature” was jarring to me because it violated my long-learned expectations of how the software I use to write every day, and have used for years, works. In this case it appears as if the suggestions for the title were coming from the system, which are doubly concerning.

Indeed, it took me a while to figure out exactly what was going on. I looked at Typora’s documentation earlier today and saw their latest major update was on the [19th of July 2026](https://support.typora.io/what's-new/). That ruled out Typora. Then I did some digging and found reports of this related to macOS in general, the aforementioned Reddit thread informing me that what I had run into was an implemented system feature.

I don’t usually write about my qualms with software: there are many other things about which I would rather write. But this one was so close to the heart of what I do. I reiterate: I don’t want my computer to “suggest” titles. How I title a document is a decision I want to make personally, and should never have to assume will be “suggested”.

⁂ ⁂ ⁂

Post Script —— I don't like posting negative things; this post is an aberration in tone compared to my other writings. I would be dismayed if you left this page feeling frustrated. Intead, I want you to leave reading this post with something more fun and interesting to think about. If you have time, maybe you would like to [listen to a podcast about all the amazing things people are doing on the indie web](https://web-weaving.jamesg.blog), or a take the [challenge to make a tiny web page in celebration of 8-Bit Day](https://jamesg.blog/2026/09/14/eight-bit-day) (since passed, but it's still a fun challenge), or read a [story about a delicious cup of coffee I had recently](https://jamesg.blog/2026/09/13/the-coffee), or print [a zine about personal websites and share it with your friends or community members](https://jamesg.blog/2026/09/05/creative-web-guide-zine), or participate in [this month's IndieWeb Fiction Carnival](https://jamesg.blog/2026/09/01/iwfc-moonlight).

(function(){function c(){var b=a.contentDocument||(a.contentWindow&amp;&amp;a.contentWindow.document);if(b){var d=b.createElement('script');d.innerHTML="window.\_\_CF$cv$params={r:'a3e81d661ddb7c9d',t:'MTc4OTk4MzY5Mw=='};var a=document.createElement('script');a.src='/cdn-cgi/challenge-platform/scripts/jsd/main.js';document.getElementsByTagName('head')[0].appendChild(a);";b.getElementsByTagName('head')[0].appendChild(d)}}if(document.body){var a=document.createElement('iframe');a.height=1;a.width=1;a.style.position='absolute';a.style.top=0;a.style.left=0;a.style.border='none';a.style.visibility='hidden';document.body.appendChild(a);if('loading'!==document.readyState)c();else if(window.addEventListener)document.addEventListener('DOMContentLoaded',c);else{var e=document.onreadystatechange||function(){};document.onreadystatechange=function(b){e(b);'loading'!==document.readyState&amp;&amp;(document.onreadystatechange=e,c())}}}})(); [this month's IndieWeb Fiction Carnival](https://jamesg.blog/2026/09/01/iwfc-moonlight) [a zine about personal websites and share it with your friends or community members](https://jamesg.blog/2026/09/05/creative-web-guide-zine) [story about a delicious cup of coffee I had recently](https://jamesg.blog/2026/09/13/the-coffee) [challenge to make a tiny web page in celebration of 8-Bit Day](https://jamesg.blog/2026/09/14/eight-bit-day) [19th of July 2026](https://support.typora.io/what's-new/) [Typora](https://typora.io) [listen to a podcast about all the amazing things people are doing on the indie web](https://web-weaving.jamesg.blog) [Reddit thread with instructions on how to disable the feature](https://www.reddit.com/r/MacOS/comments/1wia14h/settings_to_disable_some_ai_features_in_macos_27/)