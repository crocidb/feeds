+++
title = "Fallbacks"
description = "When I published Sunset this evening, I saw the post in my web reader, Artemis, and realised that the title was not what I expected. I clicked through to the blog post and realised I had put the title in the “category” field rather than the “title” field. This meant there was no "
date = "2026-09-27T00:00:00Z"
url = "https://jamesg.blog/2026/09/27/fallbacks"
author = "with words, wonder"
text = ""
lastupdated = "2026-09-28T20:25:30.494250892Z"
seen = false
+++

When I published [Sunset](https://jamesg.blog/2026/09/27/sunset) this evening, I saw the post in my web reader, [Artemis](https://artemis.jamesg.blog), and realised that the title was not what I expected. I clicked through to the blog post and realised I had put the title in the “category” field rather than the “title” field. This meant there was no title for my web reader to pick up on. This triggered fallback behaviour built in to Artemis: if a title is not available for a post, Artemis selects the first few words to use as a replacement.

If Artemis cannot find a title, it tries to find something. You could think of the substitute title as an “inferred” title. This is useful behaviour firstly because some posts intentionally do not have titles (i.e. because the post content was written as a short note). Secondly, this behaviour acts as a useful fallback: trying to infer a title means Artemis can show *something* that represents a post in a case where no title is set (as was the case this evening when I published a post without a title).

Similarly, if a post doesn’t have a date, Artemis should use the date the post was discovered. This ensures the final database record contains a date even if one could not be found or, if, for some reason, the date could not be parsed (i.e. it was in an invalid format).

When designing software, it is worth considering what the “fallback” state should be if a value is missing. Can a value be inferred, as was the case with the post title? With that said, fallbacks are not always possible in software: in some cases, no fallback can be provided because a value cannot be inferred (or should not be inferred), in which case it might be best to ask for user intervention, or roll-back a change, or do whatever is necessary and appropriate to assure the integrity of the data in the system.

Fallback states also apply if support for a technology is missing. In terms of the web, MDN has a page on “[graceful degradation](https://developer.mozilla.org/en-US/docs/Glossary/Graceful_degradation)” which invites web page to consider how their page will work even if a visitor is not using a modern browser:

>
>
> **Graceful degradation** is a design philosophy that centers around trying to build a modern website/application that will work in the newest browsers, but falls back to an experience that while not as good still delivers essential content and functionality in older browsers.
>
>

It was nice to see a fallback in action this evening. It was a good reminder about how software can delight when it responds well to information not in a specific format. It took a long time to get here for Artemis, though: the Artemis codebase has grown more robust with time precisely because I have seen lots of failure states – where titles are not available, or are longer than expected, or where dates are improperly formatted, and more – and added code around them, eager to avoid any state where a post is not added to a user’s reader (which spiritually constitutes data loss in that something that should be present is not) because something was not formatted as expected.

[Artemis](https://artemis.jamesg.blog) [graceful degradation](https://developer.mozilla.org/en-US/docs/Glossary/Graceful_degradation) [Sunset](https://jamesg.blog/2026/09/27/sunset)