---
title = "Designing a new button to visually show and hide alt text"
description = "In Developing an alt text button for images on my website, I wrote about how I made a button for visibly showing and hiding alt text on my website. I enjoy reading alt text. Alt text is great. My implementation method used a combination of a HTML checkbox and the CSS :has selecto"
date = "2025-09-11T13:28:05Z"
url = "https://jamesg.blog/2025/09/11/alt-text-button-design/"
author = "James' Coffee Blog"
text = ""
lastupdated = "2025-10-22T08:57:31.818548104Z"
seen = true
---

In [Developing an alt text button for images on my website](https://jamesg.blog/2025/08/17/alt-text-button), I wrote about how I made a button for visibly showing and hiding alt text on my website. I enjoy reading alt text. [Alt text is great.](https://tech.lgbt/@dotjayne/115001457009393204)

My implementation method used a combination of a HTML checkbox and the CSS `:has` selector. A `div` containing the alt text for an image would appear or disappear depending on whether the corresponding checkbox was checked.

My code had a few limitations. I had to think a lot about how to visually hide the checkbox. Focus styles required a lot of thought and tripped me up a few times as I wrote my code. I also wondered whether a checkbox was the right semantic. In addition, if the CSS didn't load on the page for some reason, the interactivity would be lost. Since writing the blog post, I have wondered: what can I improve?

I went back to the drawing board with the intent to use the HTML `details` and `summary` elements. These elements allow you to show and hide content on a web page natively. With a bit of tinkering, I have a new version of the project, which is [now in its own open source (MIT-0 licensed) GitHub repository](https://github.com/capjamesg/alt-text-button). I have also published the code on a [demo web page](https://capjamesg.github.io/alt-text-button/) so you can try the interaction for yourself.

Here is a demo video showing the new button:

*The button is not yet live on my website, although I hope to move to my new button code soon!*

**How the button works**
----------

Below I am going to talk about a few of the styles that make this alt text button work. For all the CSS, refer to the GitHub repository.

Before styling, I needed a good foundation of semantic HTML. This is the structure upon which my code depends:

```
<figure>
    <picture>
        <img alt="A supermarket in Berlin with a sign that reads 'freshly made smiles'." loading="lazy" src="https://jamesg.blog/assets/smiles.avif">
    </picture>
    <details class="alt" aria-label="Show or hide the alt text for the image">
        <summary>ALT</summary>
        <p>A supermarket in Berlin with a sign that reads "freshly made smiles".</p>
    </details>
</figure>

```

By default, the `details` element is closed. In this state, the `ALT` button appears in the top left of the image. This is implemented using `absolute` positioning. The parent `figure` has a `position:relative` rule.

When the details element is opened, the enclosed `p` tag is displayed. By default, the `summary` element (which contains the "ALT" label) expands in width when the details element is opened. To get around this, I set the width of the `summary` to `max-content`, which ensures that the summary tag stays the same size:

```
figure details[open] summary {
  width: max-content;
  margin-bottom: 0.25rem;
  list-style: none;
 }

```

The CSS makes use of the `details[open]` selector. This lets me apply styles exclusively to a `details` element that has been opened by the user. I originally used `details:open`, but that selector doesn't work in Safari at the time of writing this blog post.

When the details element is opened, its background is set to `transparent` and its border is removed:

```
figure details[open] {
  border: none;
  background-color: transparent !important;
  padding: 0;
}

```

Without setting the background colour to be transparent, the whole space that takes up the `details` element -- which includes the `summary` -- would have a white background, whereas I want the button and `p` to be in their own boxes.

I style the `summary` and `p` tags as their own boxes with this code:

```
figure details[open] p, figure details[open] summary {
  border-radius: var(--border-radius);
  border: 1px solid #ccc;
  padding: 0.25rem 0.5rem;
  color: black;
}

```

In designing this system, I wanted to make sure it was accessible. A big part of this was ensuring the system works well with a keyboard. The `details` element is already accessible (yay for semantic HTML!) but I wanted to add my own more visible focus styles. I like having a black background and yellow text: a colour combination that contrasts well and also stands out.

When a `summary` is focused, its parent `details` is assigned a black background and the summary text is set to yellow. This makes the keyboard focus clear as a user navigates through the page.

**Conclusion, and what's next**
----------

With my new code, I am using the details and summary element, which I think is more semantically appropriate. I have also moved the code into an open source repository.

If you have ideas on how my code can be improved or made more concise, please file a contribution on GitHub, or email me at readers [at] jamesg [dot] blog.

The code is licensed under an MIT-0 license, which gives you the right to use, copy, modify, publish, and distribute the software as you want. I chose this license because I want this project to be as easy for other people to include in their websites as possible.

If you end up using the alt text button, let me know!