+++
title = "Joining the IndieWeb - #1: Microformats"
description = "This is part one of a series where I document how I’m making this site more interoperable with IndieWeb tools and standards. I’ll update this notice to link to part 2 once I’ve written itInteroperability is the heart of what makes the digital world work.In my first job I "
date = "2026-05-29T00:00:00Z"
url = "https://tomrenner.com/posts/joining-the-indieweb-1/"
author = "contact@tomrenner.com (Tom Renner)"
text = ""
lastupdated = "2026-06-01T21:30:54.492356019Z"
seen = false
+++

>
>
> *This is part one of a series where I document how I’m making this site more interoperable with IndieWeb tools and standards. I’ll update this notice to link to part 2 once I’ve written it*
>
>

Interoperability is the heart of what makes the digital world work.

In my first job I worked with academic libraries to make research more openly available, sharing data about all forms of research outputs across the globe through the use of open data formats. These community-owned standards ensured that thousands of different systems globally could communicate, making each other aware of new findings in a field, and bringing the gobal academic community into closer contact.<sup id="fnref:1"><a href="#fn:1" class="footnote-ref" role="doc-noteref">1</a></sup>

It was hugely empowering. By working with open schemas that I could help shape and contribute to, I could build systems that directly benefit researchers, and help to accelerate the advancement of human knowledge.

---

This love of open standards has stuck with me, and shaped how I view the world. It’s a topic that sometimes pops up in articles, usually when a social media boss does something heinous.

This is because interoperbility is an anti-goal for any major platform. If you have a large market share, enabling free movement of data in and out of your platform is going to hurt your bottom line. Simply put, if Facebook has [one third of the world’s population on its platform](https://www.statista.com/statistics/272014/global-social-networks-ranked-by-number-of-users/), they’re going to lose more users than they gain by making it easy to migrate in and out.

As a human with ethics, I’m not a fan of this kind of lock-in. Nor am I a fan of the major social media sites. And so I’m always looking for ways to support the decentralisation of our digital world.

I highly encourage the [POSSE](https://indieweb.org/POSSE) (Publish on your Own Site, Syndicate Everywhere) approach, as it ensures you keep ownership of your own content, and I encourage *everyone* to stop reading this post and check out the fantastic [Protocols not Platforms](https://knightcolumbia.org/content/protocols-not-platforms-a-technological-approach-to-free-speech) essay if you haven’t already.

Following these threads, I found my way to [microformats](https://indieweb.org/microformats). These are simple HTML tags you can add to pages, following an open standard (there’s that phrase again) to describe your content in a machine-readable way. This makes key metadata available to other websites, so that topics can be linked together, authors can be credited for their work, and information can be displayed nicely to users in feeds.

The joy of this being an *open* standard, is that the linked sites do not need to have any relation to each other the interoperate – they do not need to be produced by the same person or company, built by the same software, or anything else. They just need to agree on how data is described.

This loosely connected band of internets sites is known as the IndieWeb. Together all of these small, disparate corners of the internet are trying to form a technical platform to make the internet more social and connected again, without tying us into one mega-platform (because we’ve all seen how well that works).

---

The technical bit
----------

Ok, so what does that look like for this blog?

### h-card ###

The `h-card` is the most basic, and fundamental, section of metadata. It is used to form a digital identity, and share that identity. So we start with the basics - my name.

```
<span class="h-card">
    <span class="p-name">Tom Renner</span>
    <span class="p-given-name">Tom</span>
    <span class="p-family-name">Renner</span>
    ...
</span>

```

and then add to that a one-line bio (`p-note`)

```
<span class="h-card">
    <span class="p-name">Tom Renner</span>
    <span class="p-given-name">Tom</span>
    <span class="p-family-name">Renner</span>
    <span class="p-note">Generalist developer and team lead, based in Munich. Cares about ethical tech, teamwork, and badgers.</span>
    ...
</span>

```

and then follow that up with two `u-url` links. The first, linking to this site, also has the `u-uid` tag, making it the canonical identifier for this digital profile. Having a second `u-url` tag links those two domains together, confiming that they form two parts of my online identity.

```
<span class="h-card">
    <span class="p-name">Tom Renner</span>
    <span class="p-given-name">Tom</span>
    <span class="p-family-name">Renner</span>
    <span class="p-note">Generalist developer and team lead, based in Munich. Cares about ethical tech, teamwork, and badgers.</span>
    <a class="u-url u-uid" href="https://tomrenner.com">tomrenner.com</a>
    <a class="u-url" rel="me" href="https://mastodon.social/@trenner">@trenner@mastodon.social</a>
</span>

```

This is still quite a minimal `h-card`. There are a large number of additional [properties](https://microformats.org/wiki/h-card#Properties) that can be included to flesh that profile out, if you so choose.<sup id="fnref:2"><a href="#fn:2" class="footnote-ref" role="doc-noteref">2</a></sup>

The other important piece of microformat markup is the `p-category` attribute. This is added to the “Tags” section of each page, and provides that information to consiming websites. These include many RSS readers and other aggregators, ensuring that the categories I pick out for posts will be reflected and available elsewhere.

```
<ul>
   <li>
     <a href="/tags/ai/"
        class="p-category">AI</a>
   </li>
   <li>
     <a href="/tags/technologies/"
        class="p-category">Technologies</a>
   </li>
   <li>
     <a href="/tags/management/"
        class="p-category">Management</a>
   </li>
</ul>

```

### IndieAuth ###

A really cool system enabled by this HTML metadata approach is [IndieAuth](https://indieauth.com). This protocol uses your website as a form of online identity, allowing you to sign in to participating services just by entering your site’s URL.

This works by checking for links tagged with `rel=me`, following them to connected services, and then checking that your profiles on those services link back to your site.

So for example, I have

```
    <link rel="me" href="https://mastodon.social/@trenner" />
    <link rel="me" href="https://github.com/tr325" />

```

which identify these as my Github and Mastodon profiles. Then on those sites I list this domain as being my personal page, and it checks for those meta tags. Since I can edit the source code of this site and also the contents of the Github and Mastodon profiles, I’ve proved that they are all managed by the same person.

This then forms the basis of a digital identity, which can be used as an account for other services - in the same way I previously might have “signed in with Google”, services on the IndieWeb let you sign in using IndieAuth.

My name is not needed, all can be totally anonymous if necessary, and I haven’t needed to sign up for a this party platform; I simply provide IndieAuth with the URL of my website, and it reads publicly available data to verify my identity.

What comes next
----------

Despite the length of this post, the changes to the site are pretty minimal. A couple more tags in the `<head>`, nothing more. It’s nothing spectacular, but it does honest, useful work to enrich the online ecosystem I’m a part of.

I’m excited to dive deeper into this ecosystem, and start hooking into more IndieWeb systems. Building an open, decentralised network of pages that communicate in mutually agreed and beneficial ways is a vision of the internet I want to support.

Next up: cross-site notifications!

---

1. Hire librarians. We live in the information age, and librarians have been studying and practicing information management for literal millenia. The institutional and professional knowlege that has been built up in that field is unmatched, and if only programmers were curious enough to ask the right questions our software would be a whole lot better on average. I am of the firm belief that every tech company above \~30 people would benefit hugely from having a librarian on staff. [↩︎](#fnref:1)

2. And these `p-*` and `u-*` properties can also be applied to many other root entities, forming a rich abd flexible schema for describing content. `p-*` properties contain plain-text content, `u-*` properties contain URLs, and root classes are denoted by `h-*` entries. [↩︎](#fnref:2)