+++
title = "Brainstorming the multi-lingual reading experience for Artemis"
description = "I now follow three websites or feeds whose authors write in French; in at least two cases, the authors write in both French and English. When I see posts in different languages, I use Firefox’s Translate feature to read them. Firefox Translate is not perfect, but as long as I can"
date = "2026-10-21T00:00:00Z"
url = "https://jamesg.blog/2026/10/21/brainstorming-multi-lingual-artemis"
author = "with words, wonder"
text = ""
lastupdated = "2026-10-22T13:34:56.979859688Z"
seen = false
+++

I now follow three websites or feeds whose authors write in French; in at least two cases, the authors write in both French and English. When I see posts in different languages, I use Firefox’s Translate feature to read them. Firefox Translate is not perfect, but as long as I can get the gist of something I am happy (although suggestions for better translation practices, ideally locally, and without complex, internet-connected, or paid technology, would be sincerely appreciated!).

Now that I am seeing more French in my [Artemis](https://artemis.jamesg.blog) feed, I have been thinking about what features may be useful to help me make the most of what I see. Here is a snippet of some posts in my web reader right now:

![Five posts in Artemis by four authors. The first three posts are in French. The last two are in English.](https://jamesg.blog/assets/artemis-multi-lingual.png)

ALT

Five posts in Artemis by four authors. The first three posts are in French. The last two are in English.

One of the features I am experimenting <sup class="footnote-reference" id="f-1"><a href="https://jamesg.blog/longform-feed#1">1</a></sup> with (seen in the screenshot above) is adding the language code associated with an article before the title of the article, like so:

>
>
> [FR] [post title]
>
>

I only add this if the title isn't in a language I know (English).

To determine the language that corresponds with a post, I am using the “[langdetect](https://pypi.org/project/langdetect/)” Python package <sup class="footnote-reference" id="f-2"><a href="https://jamesg.blog/longform-feed#2">2</a></sup>. There are likely ways to infer language deterministically (ActivityStreams has a “contentMap” value that contains as keys language codes that map to post content, e.g. “fr” would map to a post written in French).

This feature is most useful when a title is also written in a language I don’t know. The tag gives me a clear visual indication that a post is in a different language before I start reading the title. This helps me while scanning my feed.

One edge case where this tag adds confusion, however, is when all the words in the title happen to be in English. This was the case with one title in my feed, “[Writober 2026 – Lounge ](https://alexsirac.com/writober-2026-lounge/)”, whose contents are in French but the title is readable in English. In this case, an “[FR]” preface to the title is technically correct, but is jarring given the title co-incidentally is in words that I can read as English.

⁂ ⁂ ⁂

Earlier today at HWC Asia/Pacific, I raised the idea of multi-lingual feeds and we had a good discussion. Part of me wants to offer a translated version of a post title, but I am not sure whether I want to be running a full translation model on the server. [Argos Translate](https://github.com/argosopentech/argos-translate/) looks like a promising model should I want to go down this path, though I would sincerely appreciate recommendations on this front. The red line is that I want all translation to either happen within Artemis or, if absolutely necessary, the user’s browser. I don’t want to use an external API.

There is an experimental [Translator API](https://developer.mozilla.org/en-US/docs/Web/API/Translator/translate) in the browser which could, in theory, allow the use of JavaScript to translate specific parts of the page on load. With that said, this API does not have Firefox or Safari support, and it would mean titles would be translated on every page load.

I am also unsure whether using a translation will deprive me of some part of the experience of seeing multilingual text. I read one Mastodon post in Artemis today that was written in French. I was able to translate the post myself approximately enough to get the joke, even though I know *very* few words of French. I felt really good after this!

⁂ ⁂ ⁂

Reflecting on what multi-lingual features a readers should have has taken me down a long rabbit hole of considerations. If an article has a translated version, could a web reader show an icon to indicate that there is a translated version? Could said reader automatically retrieve the translated version? What could/should Artemis do when the titles of feeds are in a different language? Yesterday I was subscribing to a French blog that uses WordPress. The titles of the feeds were in French and at first I accidentally selected the comments feed as the one to which I wanted to subscribe.

Language use on the web is complicated, and I am only scratching the surface. Stephanie Booth’s talk “[While We Wait for BabelFish: Languages on theInternet](https://www.youtube.com/watch?v=wdAT1P4fKXc) [sic]”, although given in 2007, has given me a lot to think about. As I only speak one language (although I do understand the specific Scots dialect/words from where I grew up), I have a limited view of what is best to do. Someone who only speaks one language may prefer a different UI to someone who speaks multiple. That is to say: there is a lot to explore, and I would love help! If you have thoughts, [I would be delighted to hear from you](https://jamesg.blog/email).

<sup class="footnote-definition-label" id="f-3">1</sup>

This experiment is currently enabled only on my account. I do this sometimes so I can get a feel for a feature before releasing it either in the Artemis Labs section of the software as an experiment or as a fully-fledged feature.

[[↩]](https://jamesg.blog/longform-feed#f-1)

<sup class="footnote-definition-label" id="f-4">2</sup>

Technical note: I check if the post content is more than two words to prevent false positives, something I ran into with short Mastodon posts. This logic will likely need to be made more robust, though.

[[↩]](https://jamesg.blog/longform-feed#f-2)

[Writober 2026 – Lounge](https://alexsirac.com/writober-2026-lounge/) [Translator API](https://developer.mozilla.org/en-US/docs/Web/API/Translator/translate) [Argos Translate](https://github.com/argosopentech/argos-translate/) [I would be delighted to hear from you](https://jamesg.blog/email) [1](https://jamesg.blog/longform-feed#1) [2](https://jamesg.blog/longform-feed#2) [[↩]](https://jamesg.blog/longform-feed#f-1) [[↩]](https://jamesg.blog/longform-feed#f-2) [langdetect](https://pypi.org/project/langdetect/) [While We Wait for BabelFish: Languages on theInternet](https://www.youtube.com/watch?v=wdAT1P4fKXc)