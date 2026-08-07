+++
title = "Distinguishing user and system content"
description = "When I was designing the inline message to indicate a link in a user’s Artemis reader has been flagged as malicious, I intentionally designed the system message and state to be distinguished from the user-set author name. Here is what the final design looked like: The Artemis fee"
date = "2026-06-01T00:00:00Z"
url = "https://jamesg.blog/2026/06/01/distinguishing-user-and-system-content"
author = "James' Coffee Blog"
text = ""
lastupdated = "2026-06-01T21:30:16.219988572Z"
seen = true
+++

When I was designing the [inline message to indicate a link in a user’s Artemis reader has been flagged as malicious](https://jamesg.blog/2026/06/01/flagging-suspicious-websites-in-artemis), I intentionally designed the system message and state to be distinguished from the user-set author name.

Here is what the final design looked like:

![The Artemis feed showing three entries. The first entry has been flagged as suspicious, and shows a clear, distinguished label indicating this, as well as being indented with a coloured border. This creates contrast between the two posts below that have not been flagged which appear without the indent or suspicious link label.](https://editor.jamesg.blog/content/images/2026/06/artemisflaggedlink.png)

ALT

The Artemis feed showing three entries. The first entry has been flagged as suspicious, and shows a clear, distinguished label indicating this, as well as being indented with a coloured border. This creates contrast between the two posts below that have not been flagged which appear without the indent or suspicious link label.

The message “This link has been flagged as suspicious. Learn why.” appears above the article title. This post that has been flagged as suspicious is visually indented compared to other posts. Both of these indicators are set by the system.

Because Artemis is designed to be text-heavy, I could have instead designed the feature to add a tag next to an author’s name, like this:

![](https://editor.jamesg.blog/content/images/2026/06/inlineflagexample.png)

Because the link already goes to a wall that indicates to the user the link is malicious, this technically could have sufficed, but it wouldn't be a good implementation. This implementation with the “flagged as malicious” label right next to the author name would set a bad precedent for including system messages immediately next to author names, which are customisable by the user.

When I designed the [“via” feature,](https://jamesg.blog/2026/02/23/artemis-via) for example, I put the “(via)” label in italics. Because users cannot add italics to author names, because the “via” feature only indicates a link points to another website, and because users set their own author names, I thought this would be a sufficient distinction. But for something related to security and integrity – a link being flagged as malicious – a clear visual distinction that cannot be confused with anything else was absolutely essential.

More broadly, having a system message in the same place as a user-controlled field is confusing at best, and potentially malicious at worst.

I thought I’d write this down since it isn’t necessarily obvious, but something that I think about when I am designing features. There are also other real-world examples of this pattern. Signal, for example, adds a little blue checkmark next to the “Note to Self” chat that is specifically for messaging yourself. This indicates that the user is an official chat.

![The Signal chat for the official "Note to Self" feature shows a blue checkmark next to the name "Note to Self".](https://editor.jamesg.blog/content/images/2026/06/signalnotetoself.png)

ALT

The Signal chat for the official "Note to Self" feature shows a blue checkmark next to the name "Note to Self".

The official Signal chat also has the same checkmark.

In both the “Note to Self” and official Signal chat, the author name at the top of the chat has an “Official chat” label that is set by the system. This creates a clear distinction between chats between users and chats between system users (the Note to Self feature, the official Signal account):

![The Signal "Note to Self" chat window with the words "Official chat" under the words "Note to Self" both in the persistent author indicator in the top left and in the big box that appears at the top of the chat logs.](https://editor.jamesg.blog/content/images/2026/06/signalofficialchat-1.png)

ALT

The Signal "Note to Self" chat window with the words "Official chat" under the words "Note to Self" both in the persistent author indicator in the top left and in the big box that appears at the top of the chat logs.

[“via” feature,](https://jamesg.blog/2026/02/23/artemis-via) [inline message to indicate a link in a user’s Artemis reader has been flagged as malicious](https://jamesg.blog/2026/06/01/flagging-suspicious-websites-in-artemis)