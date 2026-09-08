+++
title = "More Mindful Web Development"
description = "Yet another technical audit of brennan.day, this time using the Safi Studio Scanner, covering fixes for duplicate headings, meta descriptions, image dimensions, JSON-LD organization data, render-blocking scripts, and a switch from IndieAuth to IndieLogin—plus what I left alone.=="
date = "2026-09-08T02:00:00Z"
url = "https://brennan.day/more-mindful-web-development/"
author = "mail@brennanbrown.ca (Brennan Kenneth Brown)"
text = ""
lastupdated = "2026-09-08T09:41:46.876834409Z"
seen = true
+++

Another month, yet another technical tutorial and audit of my website. I already know what you're thinking, and I totally agree: how much could there possibly be to examine and fix on a little static blog?!

I was fairly certain I'd be content for a long while after [my last post](https://brennan.day/advanced-webweaving-auditing-against-specification-website/) where I went through my site using [specification.website](https://specification.website/), but fellow writer George De Bruin of [Unattributed](https://unattributed.cc) just posted a blog post titled ["Guys, we really, really suck at this!"](https://unattributed.cc/2026/09/06/guys-we-really-really-suck/) where he used the [Safi Studio Scanner](https://safi-studio-scanner.abdulkadersafi.com/) to audit his website along with a few dozen others within the IndieWeb and found some rather abysmal results. Safi crawls a site and scores it on your average metrics, such as SEO, content, images, structured data, security, performance, etc.

⚠️ **Do not try this at home.** I want to preface this by saying that the Safi scanner's website looks awfully vibecoded, which makes me assume the npm package created to audit your site is as well. The previous tool I used, specification.website, also was created with an LLM, but that was just a [plain text checklist](https://specification.website/checklist/), so there's no risk using that. This, however, does come with risk being something you're actually installing on your system (npm itself has a rather [bad reputation](https://securitylabs.datadoghq.com/articles/npm-worm-compromises-popular-npm-packages/) of vulnerabilities). There are [plenty](https://datayze.com/site-validator) [of other](https://validator.w3.org/) [ways to audit](https://pagespeed.web.dev/) and [check important validation](https://www.debugbear.com/test/website-grader) on your site, use those instead of this.

My Site Didn't Play Nice [](#my-site-didnt-play-nice)
----------

To start, I had to modify the script doing the scanning. As De Bruin let me know, my site was the only one he tried to audit that didn't scan properly, because I have numerous webring links that don't have `rel="nofollow"`, and the way the script works is that it scans every linked page (great idea, right?). Luckily, this change wasn't hard to make.

```javascript
const report = await audit('http://localhost:8082', {
  maxPages: 25,
  maxDepth: 3,
  concurrency: 4,
  browser: false,
  skip: ['links'],
});
```

I built and served my site locally instead of scanning production, making iterative changes easier as well, and reran the audit many times during the process.

Duplicate Headers [](#duplicate-headers)
----------

One of the most recurring warnings was `core-seo/single-h1`, indicating that a lot of my pages had more than one `<h1>` header. This confuses both search engines and screen reader users navigating my site by headings.

There were three separate sources for this problem:

1. My site header used an `<h1>` for the "brennan.day" in the header on every page.

2. My homepage had the "Recent Posts" heading marked up as an `<h1>`.

3. My homepage and tag pages had a hidden `<h1>` inside the `h-feed` microformat, used to give the feed a machine-readable name.

The fix here is to ensure everything except the single `<h1>` per page is an `<h2>`, `<p>`, `<div>`, or `<span>` depending on context.

```njk
{# src/_includes/partials/header.njk - before #}
<h1 class="weblog-title"><a href="/">{{ site.title }}</a></h1>

{# after #}
<p class="weblog-title" data-pagefind-ignore><a href="/">{{ site.title }}</a></p>
```

The hidden feed-name heading became a `<span>` since its only meant to satisfy the microformat.

```njk
{# before #}
<h1 class="p-name" style="display:none;">{{ site.title }}</h1>

{# after #}
<span class="p-name" style="display:none;">{{ site.title }}</span>
```

Pages, like [/guestbook/](https://brennan.day/guestbook/), [/accounts/](https://brennan.day/accounts/), and [/slash-pages/](https://brennan.day/slash-pages/) never had an `<h1>` because their layout didn't render one automatically like the way I have set for standard posts and page layouts. I added one in the Markdown body using the title variable, so it stays in sync with the page's `<title>` tag without hardcoding it twice:

```markdown
---
title: Guestbook
layout: base.njk
---

<h1>{{ title }}</h1>

Welcome to my guestbook!
```

I made sure the styles remained the same, so nothing looks different visually.

Meta Descriptions [](#meta-descriptions)
----------

Meta descriptions should be between 70 and 160 characters long. My global fallback description (used whenever a description wasn't set on a page) was a lengthy paragraph introducing myself.

Rather than rewrite my author bio, I kept it as the fallback and normalized description through a `truncate(155)` filter:

```njk
{% set pageDescription = (description or site.description) | truncate(155) %}
<meta name="description" content="{{ pageDescription }}">
<meta property="og:description" content="{{ pageDescription }}">
```

There were also pages that had descriptions that were too short, such as my [/now/](https://brennan.day/now/), [/search/](https://brennan.day/search/), [/slash-pages/](https://brennan.day/slash-pages/), and [/guestbook/](https://brennan.day/guestbook/) pages.

```markdown
# Before
description: What I am working on right now, current projects and focus areas.

# After
description: What I am working on right now, including current projects, focus areas, and recent updates.
```

Next, I added a description to [/search/](https://brennan.day/search/) and to tag pages via `eleventyComputed`:

```njk
eleventyComputed:
  description: "Essays, posts, and writing tagged with '{{ tag }}' on the independent blog brennan.day."
```

Images Without Dimensions [](#images-without-dimensions)
----------

My `thumbnail` shortcode generates `width`, `height`, `loading`, and `decoding` for responsive post images, but some images still didn't have dimensions, such as featured images rendered directly in layouts, the footer watermark, and the signature graphic, so I added those:

```html
<img src="/assets/images/signature.svg" alt="Brennan's signature" width="300" height="25" loading="lazy" decoding="async">
```

Fixing the JSON-LD [](#fixing-the-json-ld)
----------

I have a [structured data](https://json-ld.org/) JSON that is already rather robust. What it didn't have was an `Organization` object, which Safi's `structured-data/org-or-website` rule checks for.

I added it to the shared structured-data partial, so it appears on every HTML page, referencing the same `@id` values the rest of the graph already used:

```njk
{
  "@type": "Organization",
  "@id": "{{ site.url }}/#organization",
  "name": "{{ site.title }}",
  "url": "{{ site.url }}",
  "logo": "{{ site.url }}/assets/images/site-preview.jpg",
  "sameAs": [
    {% for relMeUrl in site.relMe %}
    "{{ relMeUrl }}"{% if not loop.last %},{% endif %}
    {% endfor %}
  ]
}
```

I also added a `datePublished` field to the `WebSite` and `WebPage` objects, falling back to the last git commit date when a page doesn't have its own frontmatter date.

Render-blocking Scripts [](#render-blocking-scripts)
----------

Pagefind's default UI script was loading in the `<head>` without `defer`, which meant the browser had to stop and fetch it before it could finish parsing the page:

```njk
{# before #}
<script src="/pagefind/pagefind-ui.js"></script>

{# after #}
<script src="/pagefind/pagefind-ui.js" defer></script>
```

I did the same for Mermaid's CDN script on [/style/](https://brennan.day/style/), which was already only loaded conditionally, but still blocked without `defer`. The inline `mermaid.initialize()` call already runs inside a `DOMContentLoaded` listener, so deferring the script itself doesn't change when initialization happens, just when the browser is allowed to keep parsing the rest of the page while it downloads.

Looking at Links [](#looking-at-links)
----------

I skipped the `links` category on the first run, but then I realized page discovery only ever follows internal links, regardless of whether `links` rules are enabled. The links category itself just checks the URLs already found on those same-origin pages. So I turned it back on:

```javascript
const report = await audit('http://localhost:8082', {
  maxPages: 60,
  maxDepth: 4,
  concurrency: 4,
  browser: false,
});
```

I found a couple more errors with this. First that my [/start-here/](https://brennan.day/start-here/) page linked to the tag `political` even though my site uses `politics`.

Next, I realized my [/slash-pages/](https://brennan.day/slash-pages/) directory links to [/resume/](https://brennan.day/resume/) and [/poetry/](https://brennan.day/poetry/), both of which route through Netlify redirects rather than existing as pages:

```toml
[[redirects]]
  from = "/resume"
  to = "https://cv.brennanbrown.ca"
  status = 301

[[redirects]]
  from = "/poetry"
  to = "https://bkpoetry.com"
  status = 301
```

Netlify treats [/resume](https://brennan.day/resume) and [/resume/](https://brennan.day/resume/) as different paths, and only matches a redirect rule against the exact one you wrote. I found the same mismatch a third time in `assets/xsl/rss-style.xsl`, which links to [/feed/](https://brennan.day/feed/) against a `from = "/feed"` rule.

The fix is to add another rule with the trailing slash:

```toml
[[redirects]]
  from = "/resume/"
  to = "https://cv.brennanbrown.ca"
  status = 301

[[redirects]]
  from = "/poetry/"
  to = "https://bkpoetry.com"
  status = 301

[[redirects]]
  from = "/feed/"
  to = "/feed.xml"
  status = 301
```

Switching from IndieAuth to IndieLogin [](#switching-from-indieauth-to-indielogin)
----------

This part had nothing to do with the Safi scanner, rather, Clare Hooley [brought it to my attention that](https://social.lol/@clare_hooley@mastodon.me.uk/117225212934724560), because I was using IndieAuth, she couldn't use her Codeberg account to login and write a comment on one of my blog posts.

Now, [my comment section solution](https://brennan.day/building-an-indieauth-comment-system-for-your-static-site/) is incredibly hacky, but has miraculously worked for many people and many comments. So of course I hesitate to update anything and possibly break it.

But [IndieLogin.com](https://indielogin.com/) is a newer, actively-maintained service that checks `rel="me"` links of GitHub, GitLab, Codeberg, and email, on top of resolving a full IndieAuth server if the visitor has one. It's time I upgraded.

Swapping the form's action was the easier part:

```njk
{# before #}
<form id="indieauth-form" action="https://indieauth.com/auth" method="get">

{# after #}
<form id="indieauth-form" action="https://indielogin.com/authorize" method="get">
```

The harder part was that [IndieLogin.com](http://IndieLogin.com) doesn't behave like a normal OAuth provider. It only confirms who someone is, it doesn't hand back an access token the way `tokens.indieauth.com` does, and this was the issue I had when I tried changing this in the past.

```json
{ "me": "https://example.com/" }
```

My comment-posting endpoint expected a bearer token it could hand to a token-introspection endpoint on every request. [IndieLogin.com](http://IndieLogin.com) has no such endpoint, so I created my own.

Once the visitor's `me` URL comes back, a Netlify Function signs a short-lived token with HMAC-SHA256 and a server-side secret, and that's what gets stored in the browser and sent back when posting a comment:

```javascript
function signSession(me) {
  const secret = process.env.COMMENT_SESSION_SECRET;
  const payload = Buffer.from(JSON.stringify({
    me,
    exp: Math.floor(Date.now() / 1000) + SESSION_TTL_SECONDS
  })).toString('base64url');
  const signature = crypto.createHmac('sha256', secret).update(payload).digest('base64url');
  return `${payload}.${signature}`;
}
```

Now, the comment endpoint verifies that signature and expiry locally instead of making a network call.

My Micropub endpoint, which OAuth clients like Quill talk to, still uses `tokens.indieauth.com`.

**Update, shortly after publishing:** Alas, I had to revert the IndieLogin switch. Turns out that `indielogin.com` only accepts client IDs that have been manually added to its database, and the public instance's registration queue is not being serviced, so `brennan.day` was rejected. I reverted the comment form and Netlify Functions to use `indieauth.com` and `tokens.indieauth.com` again. One day...

What Hasn't Been Fixed [](#what-hasnt-been-fixed)
----------

Most of my site's scoring is now in the high 90s for most categories for the arbitrary, vibecoded appeasement of the Safi scanner, but not all of them.

Because I was scanning a local instance of my site instead of the production URL, there were numerous errors. Security headers (`CSP`, `HSTS`, `X-Frame-Options`, and so on) for instance, but I recently used the [Mozilla HTTP Observability Report](https://developer.mozilla.org/en-US/observatory/analyze?host=brennan.day) for that and scored a B-, due to things outside of my control, like certain webrings that use `JavaScript` instead of simple URLs.

There were also silly failures, such as no cookie consent banner detected (why would I have one on my cookieless site?) and that no analytics tag was detected either. Why? Because I use Umami, and Safi's detection regex only recognizes a specific list of providers (Google Analytics, Plausible, Fathom, Matomo, Segment, PostHog, Mixpanel, Hotjar, Clarity).

Production Scan Results [](#production-scan-results)
----------

After publishing, I re-ran the Safi scanner against the live production site (`https://brennan.day`) rather than my local build. The results were better in most categories:

|      Category      |Score|
|--------------------|-----|
|      core-seo      | 99  |
|      content       | 97  |
|       images       | 93  |
|    performance     | 89  |
|      security      | 91  |
|    social-media    | 99  |
|  structured-data   | 100 |
|    crawlability    | 100 |
|        eeat        | 100 |
|internationalization| 100 |
|       legal        | 100 |
|   url-structure    | 100 |
|       links        | 41  |
|     analytics      | 64  |

**Overall score: 77/100** across 60 crawled pages.

The `links` category is now the biggest remaining issue, almost entirely because of broken or missing `rel=noopener` external links from webrings and blogrolls rather than anything I can fix on my own pages. With caveats in mind, my site is scoring in the high 90s for everything under my direct control.

What Did We Learn This Time? [](#what-did-we-learn-this-time)
----------

Scanners are useful the way spellcheckers are. They can help catch simple mistakes, like how many `<h1>` headers are on a page, or the character length of meta descriptions, but there will often be many false positives, out of scope asks, and unimportant metrics. It takes wisdom as a web developer to know the difference.

It is always far more important to get feedback from actual users (especially [disabled users](https://brennan.day/why-make-your-website-accessible-anyways/)) of your site rather than chasing perfect 100s on any auditor.

But, like nearly every other coding venture on this website, it is a surefire way to have fun procrastinating actual important stuff!

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