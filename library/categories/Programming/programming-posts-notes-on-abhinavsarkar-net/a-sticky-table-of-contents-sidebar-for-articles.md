+++
title = "A Sticky Table of Contents Sidebar for Articles"
description = "I have a table of contents (ToC) at the beginning of each of my long blogposts, but till now, the ToC has shown up inline in the posts, and scrolled away as you read it. For better navigation, I recently added a sidebar ToC. It shows up only on"
date = "2026-11-11T00:00:00Z"
url = "https://abhinavsarkar.net/notes/2026-sticky-toc-sidebar/"
author = "Abhinav Sarkar"
text = ""
lastupdated = "2026-11-11T16:05:20.916322736Z"
seen = false
+++

I have a table of contents (ToC) at the beginning of each of my [long blogposts](https://abhinavsarkar.net/posts/?mtm_campaign=feed), but till now, the ToC has shown up inline in the posts, and scrolled away as you read it. For better navigation, I recently added a sidebar ToC. It shows up only on large screens; small screens still display the inline ToC. See it in action in [one of my posts](https://abhinavsarkar.net/posts/jj-usage/?mtm_campaign=feed). I’ve extracted the code as standalone snippets and I present the same in this note.

This post was originally published on [abhinavsarkar.net](https://abhinavsarkar.net/notes/2026-sticky-toc-sidebar/?mtm_campaign=feed).

The HTML[#](#the-html)
----------

The first step is to add the ToC as HTML in the web page. We use a simple `<ol>` wrapped in `<nav>` for this purpose. The body of the post resides in the `<section class="body">` element. In the example below, notice that there are two identical copies of the ToC `<nav>`: one outside and just before the post body inside an `<aside>` element, and one inside and at the beginning of the post body. The `<aside>` element must be a sibling before the post body, because the CSS that hides the inline copy works off that relationship.

Notice that we support nesting in the ToC with `<ol>`s nested inside `<li>`s. Also notice the classes on the HTML elements; we’ll use them for styling the ToCs and the sidebar. Heading IDs must match the fragment links in the ToCs.

```
<article class="post">
  <aside class="toc-sidebar">
    <nav class="toc" aria-label="Table of contents">
      <h2>Contents</h2>
      <ol>
        <li><a href="#loading-data">Loading Data</a></li>
        <li>
          <a href="#parsing">Parsing</a>
          <ol>
            <li><a href="#expressions">Expressions</a></li>
            <li><a href="#statements">Statements</a></li>
          </ol>
        </li>
      </ol>
    </nav>
  </aside>

  <section class="body">
    <nav class="toc" aria-label="Table of contents">
      <h2>Contents</h2>
      <ol>
        <li><a href="#loading-data">Loading Data</a></li>
        <li>
          <a href="#parsing">Parsing</a>
          <ol>
            <li><a href="#expressions">Expressions</a></li>
            <li><a href="#statements">Statements</a></li>
          </ol>
        </li>
      </ol>
    </nav>

    <h2 id="loading-data">Loading Data</h2>
    …
    <h2 id="parsing">Parsing</h2>
    <h3 id="expressions">Expressions</h3>
    …
    <h3 id="statements">Statements</h3>
  </section>
</article>
```

The CSS[#](#the-css)
----------

The CSS below styles the ToC and the sidebar. We assume that the `<article>` has a width of 50rem and is centered in the page. The sidebar is hidden by default and shows up only on viewports with width larger than 120rem.

```
article.post {
  max-width: 50rem;
  margin: 0 auto;
}

aside.toc-sidebar {
  --width: 25rem;
  --top: 2rem;
  display: none;
  position: sticky;
  float: left;
  top: var(--top);
  width: var(--width);
  max-height: calc(100vh - var(--top) - 1rem);
  margin-left: calc(-1 * var(--width) - 5rem);
  overflow-y: auto;

  li::marker {
    color: rgba(0, 0, 0, 0.5);
  }

  a, h2 {
    opacity: 0.5;
  }

  &:hover {
    a, h2 {
      opacity: 1;
    }
  }

  a:focus-visible {
    opacity: 1;
  }
}

@media screen and (min-width: 120rem) {
  aside.toc-sidebar {
    display: block;

    ~ section.body nav.toc {
      display: none;
    }
  }

  article.post {
    display: flow-root;
  }
}
```

The sidebar floats to the left and its `display` is set to [`sticky`](https://developer.mozilla.org/en-US/docs/Web/CSS/Reference/Properties/position#sticky). The sidebar width and offset from top are set with CSS properties, which are reused to calculate the sidebar `margin-left` and `max-height`. The negative margin pulls the sidebar out of the article to its left. Because of the `max-height` and `overflow-y` properties, the sidebar itself scrolls if it is taller than the viewport.

We dim the sidebar header and links using `opacity: 0.5` by default so that it is not distracting while reading the post. Upon hovering the sidebar, we set the text and link opacity to 1 to undim them. The links are also undimmed when focused with the keyboard.

Finally, the `@media` rule displays the sidebar on screens with width more than 120rem, and at the same time hides the inline ToC. A page without a sidebar therefore shows its inline ToC at every width. Setting the article `display` to `flow-root` is required to work around a [Firefox](https://firefox.com) bug that causes it to insert blank space in the place of the floated sidebar if there are elements in the post body that have `clear: left/both` set.

At this point, the basic sidebar is done and it works fine[<sup>1</sup>](#fn1). Here are some screenshots:

[![Inline table of contents on a small screen]() \<picture\>\<source srcset="/images/2026-sticky-toc-sidebar/inline.webp" type="image/webp"\>\<img src="/images/2026-sticky-toc-sidebar/inline.png" class="mw-80pct w-100pct" alt="Inline table of contents on a small screen"\>\</img\>\</picture\>](https://abhinavsarkar.net/images/2026-sticky-toc-sidebar/inline.png) Inline table of contents on a small screen [![Sticky sidebar on a larger screen]() \<picture\>\<source srcset="/images/2026-sticky-toc-sidebar/no-js.webp" type="image/webp"\>\<img src="/images/2026-sticky-toc-sidebar/no-js.png" class="mw-80pct w-100pct" alt="Sticky sidebar on a larger screen"\>\</img\>\</picture\>](https://abhinavsarkar.net/images/2026-sticky-toc-sidebar/no-js.png) Sticky sidebar on a larger screen [![Opaque sidebar upon being hovered]() \<picture\>\<source srcset="/images/2026-sticky-toc-sidebar/hover.webp" type="image/webp"\>\<img src="/images/2026-sticky-toc-sidebar/hover.png" class="mw-80pct w-100pct" alt="Opaque sidebar upon being hovered"\>\</img\>\</picture\>](https://abhinavsarkar.net/images/2026-sticky-toc-sidebar/hover.png) Opaque sidebar upon being hovered

The JavaScript[#](#the-javascript)
----------

This section is optional and the sidebar works fine without it. I wanted to further enhance it to highlight the headings that show on the screen at any time. That’s what this small amount of JavaScript does.

```
(() => {
  const sidebar = document.querySelector("aside.toc-sidebar");
  const body = document.querySelector("article.post section.body");
  if (!sidebar || !body) return;

  const getTargetingLink = (target) => {
    return sidebar.querySelector(`a[href="#${target.id}"]`);
  };

  const headings = Array.from(body.querySelectorAll("h2, h3, h4"));
  const targetingLinks = new Map();
  const intersections = new Map();

  for (const heading of headings) {
    const link = getTargetingLink(heading);
    targetingLinks.set(heading, link);
    if (link) intersections.set(link, { intersecting: false, time: 0 });
  }

  let previousHighlighted = null;

  const highlightLinks = () => {
    let highlighted = false;
    let maxTime = 0;
    for (const [link, entry] of intersections) {
      link.style.opacity = entry.intersecting ? "1" : "";
      if (!entry.intersecting) continue;
      highlighted = true;
      if (entry.time > maxTime) {
        maxTime = entry.time;
        previousHighlighted = link;
      }
    }
    if (!highlighted && previousHighlighted) {
      previousHighlighted.style.opacity = "1";
    }
  };

  let idleCallbackId = null;

  const observerCallback = (entries) => {
    for (const entry of entries) {
      const link = targetingLinks.get(entry.target);
      if (link) {
        intersections.set(link, {
          intersecting: entry.isIntersecting,
          time: entry.time,
        });
      }
    }
    if (idleCallbackId) window.cancelIdleCallback(idleCallbackId);
    if (window.requestIdleCallback) {
      idleCallbackId = window.requestIdleCallback(highlightLinks, { timeout: 500 });
    } else {
      highlightLinks();
    }
  };

  const observer = new IntersectionObserver(observerCallback, {
    rootMargin: "0px",
    scrollMargin: "0px",
    threshold: 1.0,
  });

  headings
    .filter((heading) => targetingLinks.get(heading))
    .forEach((heading) => observer.observe(heading));

  let resizedFinished = null;

  window.addEventListener("resize", () => {
    clearTimeout(resizedFinished);
    resizedFinished = setTimeout(highlightLinks, 250);
  });
})();
```

We start by looking up the sidebar and the post body. If the sidebar doesn’t exist, there is nothing to do. `getTargetingLink` finds the sidebar link for a passed heading, if it exists. We use it to build `targetingLinks`, a map of headings in the post body to sidebar links that link to them, if any. We also initialize a map `intersections` that tracks the on-screen state of the headings for all links. Note that we only support `<h2>`, `<h3>`, and `<h4>` headings.

`highlightLinks` is the workhorse that goes over all sidebar links, and if their corresponding headings are showing highlights them by setting their opacity. At the same time, it also dims the links for which the linked headings are not on screen. It also tracks the previously highlighted link for the case when there are no headings showing on the screen, using the timestamp at which the headings become visible.

To make this whole thing work, we use the [Intersection Observer API](https://developer.mozilla.org/en-US/docs/Web/API/Intersection_Observer_API). We create and attach the observer to all linked headings. The observer calls the callback function `observerCallback` with entries that reference the headings that show up on or scroll off the screen. We use them to update the `intersections` map, and call `highlightLinks` to handle the highlighting[<sup>2</sup>](#fn2). Since the callback runs in the browser’s main thread, if [`window.requestIdleCallback`](https://developer.mozilla.org/en-US/docs/Web/API/Window/requestIdleCallback) is available, we use it to do highlighting without blocking urgent tasks on the main thread.

Finally, we set up a handler for the window resize event (with a debounce time), so that the sidebar links are highlighted correctly when the viewport is resized.

Here are some screenshots showing highlighting in action:

[![Sidebar showing the highlighted heading]() \<picture\>\<source srcset="/images/2026-sticky-toc-sidebar/sidebar.webp" type="image/webp"\>\<img src="/images/2026-sticky-toc-sidebar/sidebar.png" class="mw-80pct w-100pct" alt="Sidebar showing the highlighted heading"\>\</img\>\</picture\>](https://abhinavsarkar.net/images/2026-sticky-toc-sidebar/sidebar.png) Sidebar showing the highlighted heading [![Sidebar highlighting the current heading while scrolled]() \<picture\>\<source srcset="/images/2026-sticky-toc-sidebar/sidebar-active.webp" type="image/webp"\>\<img src="/images/2026-sticky-toc-sidebar/sidebar-active.png" class="mw-80pct w-100pct" alt="Sidebar highlighting the current heading while scrolled"\>\</img\>\</picture\>](https://abhinavsarkar.net/images/2026-sticky-toc-sidebar/sidebar-active.png) Sidebar highlighting the current heading while scrolled [![Several headings on screen at once, all highlighted in the sidebar]() \<picture\>\<source srcset="/images/2026-sticky-toc-sidebar/multiple-active.webp" type="image/webp"\>\<img src="/images/2026-sticky-toc-sidebar/multiple-active.png" class="mw-80pct w-100pct" alt="Several headings on screen at once, all highlighted in the sidebar"\>\</img\>\</picture\>](https://abhinavsarkar.net/images/2026-sticky-toc-sidebar/multiple-active.png) Several headings on screen at once, all highlighted in the sidebar
---

That’s all I have for this post. I implemented this feature in a single sitting, and it was fun figuring things out. I hope this is helpful to someone out there.

 If you have any questions or comments, please leave a comment below. If you liked this post, please share it. Thanks for reading!

---

1. If you care about printing the page, this CSS works out automatically because the sidebar is hidden and the inline ToC is displayed by default, and the sidebar is shown by a `screen`-only query. So upon printing, the sidebar stays hidden and the inline ToC is printed.[↩︎](#fnref1)

2. We need to track the state in the `intersections` map because the callback only receives entries for the headings that show up or disappear, not all. If we act based only on the passed entries, the headings that were on screen and stay on screen would not get highlighted.[↩︎](#fnref2)

---

Thanks for reading this post via feed. Feeds are great, and you're great for using them. ♥

This post was originally published on [abhinavsarkar.net](https://abhinavsarkar.net/notes/2026-sticky-toc-sidebar/?mtm_campaign=feed).

### Like, repost, or comment on: ###

* [My website](https://abhinavsarkar.net/notes/2026-sticky-toc-sidebar/?mtm_campaign=feed#comment-container)

Read more of my [posts](https://abhinavsarkar.net/posts/) and [notes](https://abhinavsarkar.net/notes/).

![](https://anna.abhinavsarkar.net/matomo.php?idsite=1&rec=1)