---
title = "Collaborative web weaving"
description = "At this week’s Homebrew Website Club, I was introduced to the Live Share extension developed by Microsoft for Visual Studio Code. The extension lets you start a collaborative editing session to which you can invite others. Excited to learn that this extension exists, and curious "
date = "2025-09-11T09:18:45Z"
url = "https://jamesg.blog/2025/09/11/collaborative-web-weaving-coding/"
author = "James' Coffee Blog"
text = ""
lastupdated = "2025-10-22T08:57:31.821067961Z"
seen = true
---

At this week’s Homebrew Website Club, I was introduced to the [Live Share](https://marketplace.visualstudio.com/items?itemName=MS-vsliveshare.vsliveshare) extension developed by Microsoft for Visual Studio Code. The extension lets you start a collaborative editing session to which you can invite others.

Excited to learn that this extension exists, and curious to see what collaborative features were available, I installed it and started a session from a folder I had open with a few HTML files. The extension gave me a link that people could use to join my live sharing session from their Visual Studio Code interfaces. I shared the link.

Five of us started collaborating in real-time on a web page.

Using a HTML file I had already started, we made our own changes. Without direction, everyone added whatever came to mind. One person added an animation that changed the font on the page every few seconds. From that experiment, we all learned that you can use CSS keyframes to create animations to change fonts. Another collaborator wrote a story. Someone put the whole page into a `marquee` tag. Someone made a strobing “rainbow” mode that changed the background of various elements.

Here is a screenshot from part of our web page:

![A web page with an image, a marquee tag, a table, prose, and more.](https://editor.jamesg.blog/content/images/2025/09/live-1.png)

The resulting page was a bit chaotic, but it was *so fun* to make. We had no prompt. We, like musicians, riffed. We played. As [Angelo](https://ragt.ag), who actively experiments with collaboration on his website, would say: *we’re doing it live.*

In our HTML document, we wrote code and stories. We asked how each other’s code worked. We debugged code. We made something that wouldn’t have existed without the collaborative session.

Joe, one of the people in the session, published the code from our web page which includes attribution and a button to toggle the “rainbow” mode (which is off by default, and should only be toggled if you are not sensitive to strobing light effects). [You can view the page we made on Joe's website.](https://smorgasborg.artlung.com/hwc-2025-09-10-eu/) [You can also view my archive on my website.](https://jamesg.blog/hwc-demo.html)

With the Live Share extension, the cursor position of every author in the document was visible to everyone else. This meant we could follow along as everyone wrote in the document. There was also a feature to follow someone as they code so your view changes as they navigate the code. I couldn’t figure out how to toggle this; it was on by default for me. This feature would be especially useful for instructional discussions where someone walks through a codebase before another collaborator contributes.

There was also a chat interface that showed when people joined or left the session, and in which we could chat. This was a useful auxiliary space to communicate (read: check if everything is working, then tell jokes) while we wrote code.

~~One limitation with the setup is that we think it required participants to have Visual Studio Code installed on their computer. The web version didn’t seem to support the collaborative extension (although maybe it does and we didn’t figure it out).~~ Update: Zachary let me know that he was able to use the live share extension in a Visual Studio Code web interface in Microsoft Edge during the call, after logging in with GitHub. It was not required to have Visual Studio Code installed locally.

I would love to see a web-native version of this technology where I could create a space to code, share a link, and invite others to contribute. Like Etherpad, but for code. It would be even better if I could self-host this and invite people with a password.

I would love to author more HTML documents in real-time! Making HTML documents with friends feels like it is truly of the spirit of the web: fun, playful, and with an output that you can share.