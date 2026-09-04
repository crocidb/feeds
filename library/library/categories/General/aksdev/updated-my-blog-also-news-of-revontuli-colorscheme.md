+++
title = "Updated my blog! Also news of Revontuli colorscheme"
description = "Note: Old links to my site may not work anymore, due to change in the URL layout!! I tried to make a redirect for them however.Blog updateI have finally updated my blog look and feel. In fact, I completely switched my static site generator from [Jekyll"
date = "2023-06-03T00:00:00Z"
url = "https://akselmo.dev/posts/blog-update-and-revontuli/"
author = "Akseli"
text = ""
lastupdated = "2026-05-27T23:22:57.086288237Z"
seen = true
+++

*Note: Old links to my site may not work anymore, due to change in the URL layout!! I tried to make a redirect for them however.*

[Blog update](#blog-update)
==========

I have finally updated my blog look and feel. In fact, I completely switched my static site generator from [Jekyll](https://jekyllrb.com/) to [Zola](https://www.getzola.org/)!

I used Jekyll at first due to it being the one that Github Pages used. It was clunky but once set up it just did the job.

But the reason why I changed to Zola was not Jekyll itself, it was the mess of setting up Ruby on my home PC.

I tried Ruby Version Manager, using Ruby from DNF packages, changing paths, but there was always some package that kept failing. All I wanted to do is test my site before I push it to server. I couldn't test on my own PC. **Yes, I had to test on production!**

And I didn't want to set a virtual machine or docker or whatever for a dang static site generator. That is just silly!

So instead I went with Zola since my friend told me about it. Zola is just a single binary that you run and it does the magic for you, which is all I wanted.

Moving from Jekyll to Zola was a bit messy, due to the differences in markdown files, but I could mostly just use [Kate](https://kate-editor.org/) powerful search and replace regexp stuff to switch things over.

Then I set up myself a theme, but it wasn't completely explained how it works.. Basically I had to have exact matching files from the theme in my own blog source folder, and Zola could then build it. The files had to include `{% extends "theme/templates/page.html" %}` in them too, otherwise it failed to show the theme.

After getting the theme up and running, I just modified it heavily ([Source here](https://codeberg.org/akselmo/archie-zola-modified)) with my own colorscheme.

[Revontuli](#revontuli)
==========

Speaking of the colorscheme: AksDark has now a proper name! **Revontuli**!

![Screenshot of Revontuli in Konsole](/assets/images/revontuli/revontuli-konsole.png)

![Screenshot of Revontuli in KDE Plasma](/assets/images/revontuli/revontuli-plasma.png)

Yes, the colors are the same as before really, but the name is now different. Some colorschemes for apps Kate and Konsole have tiny differences though. These are the ones I'm going to update onwards.

Check out it's repository for the applications support: [https://codeberg.org/akselmo/Revontuli](https://codeberg.org/akselmo/Revontuli)

I didn't want to use "AksDark" as a name anymore, since I have seen people download it and I've gotten few comments telling me they like it too. I wanted something that works for it, and my wife (well, she is gonna be my wife in couple weeks.. :D ) came up with "Revontuli" for the name.

Revontuli is a Finnish word that means "northern light." She said it works because it's dark theme but colorful, like northern lights are colorful against a dark sky.

The plan is to have collection of matching themes for various applications, be it code editors or other applications. When it comes to code editors, I want the syntax highlighting be exactly the same, and if not exactly, then very closely similar.

This helps a lot if one wants to switch editors, but they don't have to relearn the new syntax highlighting.

I first used [Themer.dev (link has Revontuli applied)](https://themer.dev/?colors.dark.accent0=#ff3344&colors.dark.accent1=#33ffa0&colors.dark.accent2=#ff9233&colors.dark.accent3=#5fff33&colors.dark.accent4=#33ffff&colors.dark.accent5=#33aaff&colors.dark.accent6=#838fff&colors.dark.accent7=#D970FF&colors.dark.shade0=#202020&colors.dark.shade1=#303030&colors.dark.shade2=#404040&colors.dark.shade3=#505050&colors.dark.shade4=#606060&colors.dark.shade5=#707070&colors.dark.shade6=#E0DCE0&colors.dark.shade7=#FFFFFF&colors.light.accent0=#ff3344&colors.light.accent1=#33ffa0&colors.light.accent2=#ff9233&colors.light.accent3=#5fff33&colors.light.accent4=#33ffff&colors.light.accent5=#33aaff&colors.light.accent6=#838fff&colors.light.accent7=#D970FF&colors.light.shade0=#f2f2f2&colors.light.shade1=#E0DCE0&colors.light.shade2=#C1BCC2&colors.light.shade3=#A29DA3&colors.light.shade4=#847E85&colors.light.shade5=#656066&colors.light.shade6=#474247&colors.light.shade7=#000000&activeColorSet=dark&calculateIntermediaryShades.dark=true&calculateIntermediaryShades.light=true) to generate themes for applications, but there was a problem: Many of the syntax highlighting definitions do not match each other. I do hope Themer developers and contributors will look into this and unify the colorschemes.

However, I do love Themer, so if any devs of Themer are reading this, **thank you** for the great generator. It helped Revontuli to start as a colorscheme, and I hope eventually people will contribute Revontuli colors for all kinds of apps! :)

I will be uploading the Revontuli themes soon:tm: (either today or tomorrow) after this post to KDE store, so you can search from there. In the meanwhile you can get the colorschemes from the repository, where they're always up-to-date.

Again, thanks for liking AksDark! I hope Revontuli will serve you well from now on! It works great for me, at least. ;)

[I kinda want to write more](#i-kinda-want-to-write-more)
==========

I have bunch of weird blog ideas but I have not written them since they're not that "relevant" to maybe what people want to read here. I am trying to get out of that mindset and start posting more, be it very short posts or long novels. I will try to start tagging my posts too if I do that more often. It's my blog, I'm allowed to write whenever I want and how much I want!

[Quick bit about blog comments](#quick-bit-about-blog-comments)
==========

I am currently testing out how the blog comments would work if one would use email instead. Check below for mailing list link and mail link. The mailing list is hosted on [https://sr.ht](https://akselmo.dev/posts/blog-update-and-revontuli/sourcehut).

*That's all for this time, thanks for reading!*