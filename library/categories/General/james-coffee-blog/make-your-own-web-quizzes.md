+++
title = "Make your own web quizzes!"
description = "When I announced that I was open-sourcing a quiz maker earlier this week, I noted that there were several limitations to what I had built. Most importantly, my quiz maker was a Python script, which substantially limits how many people can use it. After writing the blog post, Kami"
date = "2026-06-25T00:00:00Z"
url = "https://jamesg.blog/2026/06/25/make-your-own-web-quizzes"
author = "James' Coffee Blog"
text = ""
lastupdated = "2026-06-29T12:19:24.800536235Z"
seen = true
+++

When I announced that I was [open-sourcing a quiz maker](https://jamesg.blog/2026/06/20/open-sourcing-a-quiz-maker) earlier this week, I noted that there were several limitations to what I had built. Most importantly, my quiz maker was a Python script, which substantially limits how many people can use it.

After writing the blog post, Kami has made a HTML quiz maker that works in the browser. You can [read the write-up on her blog](https://kami.bearblog.dev/i-made-an-html-quiz-maker/), and [try out the quiz maker for yourself](https://kamiscorner.xyz/quiz-maker/). I helped out with the styles, which I really enjoyed. It is always nice to have a new design challenge!

How to use the quiz maker
----------

To use the quiz maker, you need to first set a name for your quiz. Next, you can add all of the potential results that your quiz. For example, the [blogger archetype quiz](https://jamesg.blog/blogger-archetypes) had results like “Author” and “Culture maker”, each with their own descriptions.

Then, you can create as many questions as you like. Each question can have one of several answers, and you can choose whether or not a player should be able to select one or multiple choices. You can then set which end result each answer contributes to. For example, the answer “ Watch the world go by” to the question “When you are spending time outdoors, what do you like to do best?” contributes to the answer “Explorer” in the blogger archetype quiz.

When you have configured your quiz, you can click the “Show code” button to get the code for your quiz. This code contains semantic HTML and all of the JavaScript needed to make the quiz work.

Kami built the quiz maker so that if you refresh your quiz will save. You can also click the “Show code” button to export a JSON version of the quiz, so you can keep a local copy that you can then import back into the website at any time.

Make a quiz
----------

Thank you Kami for making such a wonderful tool! If you are reading this and have wanted to make a quiz like my [“Which HTML element are you?” quiz](https://jamesg.blog/html-quiz) or [blogger archetype quiz](https://jamesg.blog/blogger-archetypes), Kami’s tool will let you do just that.

If you make a quiz with the tool, please do [send me an email](https://jamesg.blog/email). I'd love to fill out the quiz that you make.

[open-sourcing a quiz maker](https://jamesg.blog/2026/06/20/open-sourcing-a-quiz-maker) [blogger archetype quiz](https://jamesg.blog/blogger-archetypes) [send me an email](https://jamesg.blog/email) [“Which HTML element are you?” quiz](https://jamesg.blog/html-quiz) [read the write-up on her blog](https://kami.bearblog.dev/i-made-an-html-quiz-maker/) [try out the quiz maker for yourself](https://kamiscorner.xyz/quiz-maker/)