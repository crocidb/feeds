+++
title = "Softcore First, Hardcore Eventually: A Ladder for the IndieWeb"
description = "Responding to Adam Newbold's 'Hardcore IndieWeb' guide, I argue for a ladder approach to joining the IndieWeb. Rather than choosing between easy platforms and full technical independence, people should climb rungs progressively. Start with BearBlog or Pika, learning hand-coded HT"
date = "2026-07-20T02:00:00Z"
url = "https://brennan.day/softcore-first-hardcore-eventually-a-ladder-for-the-indieweb/"
author = "mail@brennanbrown.ca (Brennan Kenneth Brown)"
text = ""
lastupdated = "2026-09-08T09:41:46.963259656Z"
seen = true
+++

Yesterday, [omg.lol](https://omg.lol) founder (and overall wonderful person) [Adam Newbold](https://adam.omg.lol) posted a guide titled [*"Hardcore IndieWeb"*](https://www.neatnik.net/hardcore-indieweb), where he went over how anybody can start their own fully independent website for only $0.01 USD per day thanks to the hosting solution [NearlyFreeSpeech](https://www.nearlyfreespeech.net/) provides. (The guide doesn't even touch [IndieWeb Standards](https://spec.indieweb.org/) which are commonly pointed to when this topic is brought up, which I personally appreciate it.)

I think a lot of people see a tension between making things accessible and non-technical versus having more autonomy and control over what you own digitally, right? Like a spectrum from super-easy no-ownership (corporate social media) to super-technical full-ownership (creating and hosting your entire website by hand).

A guide like Adam's tries to bridge this, by making a point that your content should be fully owned by you and fully portable and that it doesn't have to be technically complicated. He places particular emphasis on the point that, while there are platforms that exist which make the process of making and publishing your own site easier, the platonic ideal of the IndieWeb is to be independent from platforms and to avoid incurring the costs associated with them.

I've posted my own guide for [people who don't have technical skills but want to join the IndieWeb](https://brennan.day/a-beginners-guide-to-the-indieweb-for-writers-who-dont-code-but-maybe-want-to-a-little/) myself, specifically towards bloggers and writers. My philosophy is that people should dip their toes with options like [BearBlog](https://bearblog.dev/) or [Pika](https://pika.page/) or [Pagecord](https://pagecord.com/), all of which are relatively simple with free tiers.

"Hardcore" and "easy" IndieWeb aren't two camps you have to pick a side of. No, there are rungs on the ladder, and most people need to climb it, rather than getting dropped on whichever rung feels most ideologically pure and getting told to figure out the rest.

UX designers call this [progressive disclosure](https://www.uxpin.com/studio/blog/what-is-progressive-disclosure/), a concept Jakob Nielsen introduced in 1995 for the practice of hiding advanced functionality until a user is ready for it, so nobody gets overwhelmed by a feature they don't need yet. I think the IndieWeb needs to onboard people the same way. Not "here's the full stack, own everything on day one," and definitely not "stay on the silo forever because the alternative looks scary," but a sequence. To go from corporate silo, to easy platform, to your own domain with simple hand-written HTML, to a static site generator, to a server you run yourself if you'd like.

One Hat at a Time [](#one-hat-at-a-time)
----------

I recommend platforms like BearBlog and Pika because when joining the IndieWeb, you have to wear a lot of different hats—writer, designer, developer, advocate—and that can be overwhelming. So my idea is that people start with one, say writing, and then when they feel comfortable with the work involved with blogging (however that may look for them), then they can start learning the HTML needed to make their own custom site.

But maybe I am wrong in my approach here and the process of learning to code HTML shouldn't be another step, but done in parallel. There are many resources for learning, as well as HTML templates which act as great starters. [Neocities](https://neocities.org/) is a free host with an in-browser editor, but its own [tutorials](https://neocities.org/tutorials) walk total beginners through hand-writing one real page and publishing it to the actual web, no drag-and-drop site builder. That's closer to what I mean by climbing the ladder in order. Learn the actual language the web is made of, just with training wheels on the hosting part.

Ease and Complexity [](#ease-and-complexity)
----------

Something I want to note here is that when you are starting your journey, I absolutely think you should be coding your HTML and CSS by hand instead of using something like a static-site generator. It is the best way to learn what's actually going on under the hood. [Bret Victor made a version of this argument](https://worrydream.com/LearnableProgramming/) about programming in general years ago. His point is that a learning environment should let you see what your code is actually doing to the thing in front of you, rather than asking you to imagine it.

Hand-coding your first HTML page does exactly that: you write a tag, you refresh, you see the result. There's no abstraction there.

The reason why I use a static site generator is because once you get comfortable with HTML and CSS, after a while you'll grow a little tired of constantly re-writing the same `<head>`, `<header>` and `<footer>` for each page. This is the biggest reason why I use 11ty myself! It allows me to have layout templates and partials, which you can think of as modules for the site.

For example, the sidebar on the right of my blog is [its own file](https://gitlab.com/brennankbrown/brennan.day/-/blob/main/src/_includes/partials/sidebar.njk?ref_type=heads) which is then loaded into [the base.njk template](https://gitlab.com/brennankbrown/brennan.day/-/blob/main/src/_includes/layouts/base.njk?ref_type=heads) at line 976 of my site. (Okay, probably a bad example given how messy my files are, but I hope you get the idea.)

This way, you write everything once and [don't repeat yourself](https://en.wikipedia.org/wiki/Don't_repeat_yourself). When I write a blog post, I only have to write the Markdown of it with some [YAML properties](https://gitlab.com/brennankbrown/brennan.day/-/blob/main/src/posts/2026-07-16-writer-life.md?ref_type=heads), the rest is taken care of by 11ty. This eliminates the need for an interface at all, really, since I can just write the Markdown right in a text editor and it's rather human-readable.

But it's really important that I emphasize this makes things easier only after you understand the fundamentals. If you jump into coding with an SSG like 11ty or Hugo or Jekyll, then you'll miss understanding how the HTML itself works.

### Server-side Includes [](#server-side-includes) ###

Static site generators aren't the next rung for everyone. If you want to avoid installing Node and learning a templating language feels like a lot to take on just to stop repeating yourself, there's a step in between.

[Server Side Includes](https://en.wikipedia.org/wiki/Server_Side_Includes) (SSI) is a leftover from the '90s that still works today: you save the file as `.shtml` instead of `.html`, drop a directive like `<!--#include virtual="partials/footer.html" -->` where you want the shared content to go, and the server stitches the pieces together before it ever reaches a browser.

No build step, no npm install, nothing new to learn beyond one line of syntax, and it's supported out of the box on Apache-based hosts, [NFS included](https://faq.nearlyfreespeech.net/section/technology/cgisupport).

### CSS? [](#css) ###

Another example I want to share is CSS. A lot of functionality has been added to it over the years, which again makes things a lot easier for experienced devs, like CSS properties (variables):

```css
  :root {
    --bg-color: white;           /* plain-text color */
    --text-color: black;         /* plain-text color */
    --header-bg: #2d3436;       /* hex color */
    --box-purple: #6c5ce7;      /* hex color */
    --box-gray: #f2f2f2;        /* hex color */
}
```

This means you only ever have to set a hex once and you can reuse it multiple times in the stylesheet, similar to how I use templates in 11ty. Hurray, right?

No. If you're just starting out with HTML and CSS, you will have no idea what a variable is. Templates for beginners should not have code like this. This is unneeded complexity when you first start out. When you're a beginner, this is very hard to parse:

```css
  header {
    background-color: var(--header-bg);
}
```

And then when the beginner asks, they're given the answer "*A variable in coding is a named storage location in a computer's memory that holds data which can be accessed and modified during program execution.*"

What the fuck does that mean? Goodness. This is what we should really be starting with:

```css
  header {
    background-color: red;
}
```

And then, once this is understood, we can move on to hex codes. And then, once the beginner gets tired of writing the same hex codes over and over then you can move on to CSS properties.

When we've worked in a domain for a long enough time, [we forget what is familiar to a person who isn't an expert in it](https://xkcd.com/2501/). There is a lot we take for granted, and unpacking these assumptions and being able to teach by meeting people where they are is true accessibility and accommodation.

Psychologists call this the [curse of knowledge](https://en.wikipedia.org/wiki/Curse_of_knowledge), a cognitive bias where an expert can no longer reconstruct what it felt like not to know something, so they skip the exact steps a beginner needs most. The fix can't be "try harder to imagine being a beginner," it has to be an intentional curriculum.

Platforms Disappear, Text Files Don't [](#platforms-disappear-text-files-dont)
----------

Platforms don't just lock your data in, they also vanish from under you. [Glitch.com](https://blog.glitch.com/post/changes-are-coming-to-glitch) was one of my favourite places to tinker with code, and it sadly shut down in 2025, citing changing market dynamics and the rising operational costs of dealing with platform abuse. Millions of small sites and prototypes went offline. It's the same story as Geocities, Angelfire, and Tripod before it. Free, easy, fun to use, and eventually gone, taking whatever you built there down with it.

This is what "own your data" actually means in the [IndieWeb principles](https://indieweb.org/principles). Not a purity test of whether you're allowed to use a platform, but an insurance policy against platforms disappearing. You can absolutely publish through BearBlog or Pika first. The point of eventually climbing to your own domain is that it will outlive anyone else's business decisions or shut down.

Anyways, all of this to say I signed up for NFS and I love it! I've put [a guide](https://brennan.casa/notes/blog-workflow/) for people who are curious about the process of using 11ty on it, and how it compares to a platform like Netlify, or self-hosting. Start wherever you are on the ladder.

---

>
>
> **About Brennan Kenneth Brown**
>
>
>
> Queer Métis writer, cultural critic, and web developer based in Mohkínstsis (Calgary), Treaty 7 territory. Author of nine books and counting, the founder of Fireweed Writing School and Berry House Studio, and of Write Club at Mount Royal University. His work has been cited in Le Monde and other publications.
>
>
>
> **Enjoy this content?** Support my work and help me create more:
>
>
>
> [Patreon](https://patreon.com/brennankbrown) | [Ko-fi](https://ko-fi.com/brennan) | [GitHub Sponsors](https://github.com/sponsors/brennanbrown)
>
>