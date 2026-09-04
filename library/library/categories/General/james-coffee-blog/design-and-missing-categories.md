+++
title = "Design and missing categories"
description = "Ever since I moved to using Ghost as the tool for publishing my blog posts [1], I have forgotten to add categories to some of my blog posts. My old system had a few if statements that would automatically select a category. If none of the rules triggered and I did not choose a cat"
date = "2026-02-08T19:25:50Z"
url = "https://jamesg.blog/2026/02/08/design-and-missing-categories/"
author = "James' Coffee Blog"
text = ""
lastupdated = "2026-02-11T20:17:01.792909933Z"
seen = true
+++

Ever since I moved to using Ghost as the tool for publishing my blog posts [1], I have forgotten to add categories to some of my blog posts. My old system had a few `if` statements that would automatically select a category. If none of the rules triggered and I did not choose a category, I could not publish a post until I chose one.

The Ghost blog editor hides the category field behind a menu in which several metadata options are available. The photo below shows the Ghost blog post editor with the metadata menu open:

![The Ghost editor showing an editable text area on the left with a blog post in it and, on the right, a "Post settings" widget with various options such as Post URL and Tags. ](https://editor.jamesg.blog/content/images/2026/02/ghost_editor.png)

I usually only open the menu when I want to check the slug of a post. This is usually the last thing I do before I publish a post. My eyes often glimpse past the category field when I am in the configuration menu. After publishing a post, when I go to check it to make sure everything looks okay, I sometimes see there is no assigned category for the post. "*I forgot to add a category again!" I sometimes think.*

I was thinking about it and it would be nice if there was an option to show the `Category` field below the title of a post. With such a design, I wouldn’t need to open a menu to set a category. Or perhaps Ghost could have an option that prevents me from publishing a post without a category. While a post doesn’t technically *need* a category, I like assigning them so that it is easier to find posts on my website.

This post doesn’t have any direct “call to action”. The issue is not big enough for me to want to make any changes anywhere. With that said, I wanted to write this experience down because I think it says something about how default-invisible fields are easier to forget about. My workflow with Ghost is usually to copy-paste a post from Typora, the markdown editor I use, make sure the post is formatted correctly, add alt-text to images, then publish.

Or maybe my experience says something about how my muscle memory has learned to scan over the field (does that say something about the software design too?). Or maybe this says I really should strive toward making a good post preview workflow.

In any case, I love Ghost’s software; it has improved my website editing experience immeasurably. This is just one thing I noticed.

[**1**] Posts written in Ghost are then turned into web pages using my static site generator; I only use Ghost to manage posts.