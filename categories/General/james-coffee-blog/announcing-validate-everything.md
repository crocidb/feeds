+++
title = "Announcing Validate Everything"
description = "Today the IndieWeb community hosted a Create Day event in which participants were invited to make something on the web. The theme of the event was “Build Don't Buy”, an invitation to make something this Black Friday. While I wasn’t sure what I wanted to make, I knew I wanted to m"
date = "2025-11-28T21:09:32Z"
url = "https://jamesg.blog/2025/11/28/validate-everything/"
author = "James' Coffee Blog"
text = ""
lastupdated = "2025-12-10T15:23:59.456725361Z"
seen = false
+++

Today the [IndieWeb community hosted a Create Day event](https://events.indieweb.org/2025/11/indieweb-black-friday-create-day-build-don-t-buy-C044CcYllKyt) in which participants were invited to make something on the web. The theme of the event was “Build Don't Buy”, an invitation to make something this Black Friday.

While I wasn’t sure what I wanted to make, I knew I wanted to make *something*. I consulted my list of ideas and one stood out: a website that lets you type in a URL and creates links to various helpful validators. This project was inspired by Adactio’s “[Bookmarklets for testing your website](https://adactio.com/journal/20965)” project.

During the event, I made a new page on my website called “[Validate Everything](https://jamesg.blog/validate-everything)”. The web page lets you paste in a URL and automatically generates links to validators like the WAVE accessibility validator, the Google Rich Results Test tool, microformats testers, and more. I added tools I have used in the past to validate or understand the markup behind web pages.

I use a several validators but I typically end up typing the name of the validator into a search engine and then reading through the results to find the one I want. With this project, I wanted to have a single page with many common validators.

You can [try out the page today](https://jamesg.blog/validate-everything), and [see the source code on GitHub](https://github.com/capjamesg/validate-everything). Contributions are most welcome!

**How the page works**
----------

As part of the project, I wanted to experiment with CSS. I asked myself: could I show/hide the validator links depending on whether there was a valid URL in the form field on the web page? After some thought, reading, experimentation, and discussion with fellow participants in the Create Day event, I learned that you can select a form field if it its contents are valid or invalid using the `:valid` and `:invalid` selectors. I could then combine these with the `:has` and `:not` selectors to manipulate content on the page depending on whether the user has typed in a valid URL in the form field on the page.

I came up with the following selector to show/hide the validator links not he page depending on if there is a valid URL in the page form field:

```
body:not(:has(#url:valid)) #items {
      display: none;
}

```

This selector will select the `#items` element if the page `body` does not have an element with the ID `#url` that is valid. If the condition is met, the `#items` element is hidden. The `#items` element contains the list of validators.

For `:valid` to work, I needed to specify a few validation rules in my HTML input. I wrote the following input tag:

```
<input type="url" id="url" name="url" placeholder="https://example.com" pattern="https://.*\.[a-zA-Z]{2,}.*" required autocomplete="off" />

```

This input says that the URL field must have a URL that:

1. Starts with `https://`, and;
2. Is followed by any string of characters, which is then;
3. Followed by a `.` (dot), which is then;
4. Followed by two or more letters.

For example, `https://jamesg.blog` would be valid, and as a result the validator URL list would appear. But `https://jamesg.b` would not be valid (only one character follows the `.`), so the validator list would not appear. An input is also required by specifying the HTML `required` boolean. This means that the validator URLs will not appear when the field is blank.

*NB: This regex is not testing for whether a user’s TLD is valid. This could be done with a more complex regex, but this is something I can always add later. What I have right now is good enough!*

When a URL is typed in, JavaScript makes two changes to the page:

1. A `?url=…` parameter is added so that the user has a link they can bookmark/share, and;
2. All the validator links are updated to add the text the user has typed in.

This means that when the user has finished typing – or has pasted in – their URL, all the links on the page will directly link to different validator websites.

**Building things is fun**
----------

I had a lot of fun making this web page! I learned about the `:valid` CSS rule. I got to play around with the `:has` selector more. I experimented with page spacing and typography. And I also learned that you can’t click on a `view-source:` link directly on a page in Firefox for security reasons. Indeed, with everything I build, I always learn something new.

I have been in a bit of a creative rut lately in terms of making new things. I am learning about so many new things, but I’m not ready to translate much of what I am learning into a project. I am eager to make things that push me outside my comfort zone and let me use my new skills, but I haven’t been quite sure where to begin. I read somewhere that sometimes the hardest step is getting started. Today, I was able to get started and create a page that I think is fun and interesting, useful, and based on an idea I had several months ago. I’m proud of the page I made today. I love making things.

Addendum: How it started
----------

I like taking screenshots of my projects as I build them, especially if I'm experimenting with different designs.

I had a tab open from my first version of this project I made early in the meetup. I took the following screenshot:

![](https://editor.jamesg.blog/content/images/2025/11/list.png)

When [compared with the live page](https://jamesg.blog/validate-everything), you can see the above list has the essence of what I wanted: a URL bar, and a list of links. I then added subheadings to separate the validators into categories, realising there were many I wanted to add. I added some styles (and dark mode!) and worked on the JavaScript to make the page work.

Which is to say: all projects start somewhere, and are built one step at a time!