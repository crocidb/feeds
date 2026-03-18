+++
title = "Brainstorming source code editing for web applications"
description = "Last year, I worked on a bookmarklet for editing pages on my website. When clicked, the bookmarklet would open the page in GitHub that corresponded with the page I was viewing. I used the bookmarklet so much I turned it into a browser extension, which I still use regularly to edi"
date = "2026-02-10T17:36:41Z"
url = "https://jamesg.blog/2026/02/10/source-code-editing-web-applications/"
author = "James' Coffee Blog"
text = ""
lastupdated = "2026-02-11T20:17:01.778775234Z"
seen = false
+++

Last year, I worked on a [bookmarklet for editing pages on my website](https://jamesg.blog/2025/02/16/my-static-site-editing-bookmarklet). When clicked, the bookmarklet would open the page in GitHub that corresponded with the page I was viewing. I used the bookmarklet so much I [turned it into a browser extension](https://jamesg.blog/2025/05/21/building-an-edit-button-browser-extension), which I still use regularly to edit pages on my (still static) website.

While I was working on the project, I had an idea I have not yet explored: what if an edit button in a web application could take you to the source code behind a page? The edit button could link to, for example, a template file responsible for rendering the page. This would allow a developer to more easily go from what they are seeing in the browser to the back-end logic that controls that page.

I thought this would be especially useful for making small edits to an application. For example, while my [Artemis debug mode](https://jamesg.blog/2026/02/07/debug-mode) lets me see some useful debugging information in the browser, my next steps are always the same: I open the code on my desktop, look for a specific file or files, then start reading. What if the debug mode had a link directly to the relevant source code?

I recently had an idea that builds on the idea of adding an edit link for a whole page: what if a web application had a sort of “source code lens” that let you clicks on an item on a page and see its corresponding back-end template file, like you can do with front-end source code in developer tools? What if I could hover over the navigation bar to open the file that controls the navigation bar, then hover over a specific part of the page body to edit code for that specific element?

The common theme between these ideas is bringing front-end development closer to the back-end code. How can I make context shifting between what I am seeing in my browser and the functions and view files that control what I am seeing easier?

I haven't built this yet – my “brainstorming” posts are for just that – but I would like to try and experiment with this at some point. A minimal implementation would be to have an edit link for templates that goes to the `jinja2` template for the page I am viewing. From that point, I could better understand if this feature would help make the jump from “oh, I want to change this page” to opening the logic that controls the page easier.