+++
title = "Advanced Webweaving: Auditing Against Specification.Website"
description = "I ran brennan.day against The Website Specification's 140-item checklist covering foundations, SEO, accessibility, security, performance, privacy, and resilience. Notes on a broken web manifest I'd never noticed, why I don't have cookie consent banners, CSP debugging with third-p"
date = "2026-08-16T02:00:00Z"
url = "https://brennan.day/advanced-webweaving-auditing-against-specification-website/"
author = "mail@brennanbrown.ca (Brennan Kenneth Brown)"
text = ""
lastupdated = "2026-09-08T09:41:46.917334859Z"
seen = true
+++

During my time on the omg.lol IRC channel (a place I find inspiration for many posts, it seems!), [Skippy](https://skippy.omg.lol/) shared an interesting website, [The Website Specification](https://specification.website/).

Now, I have to admit the site has a certain questionable aesthetic, but the checklist is valuable nonetheless. I've always tried to make sure my web development follows good practices and good hygiene, but there were plenty of things I've never really heard of or come across before.

It's a big list. Foundations, SEO, accessibility, security, well-known URIs, "agent readiness" (bleh), performance, privacy, resilience, internationalisation. There's around 140 items to check off, each with a one-line justification for why it matters and a `Required` / `Recommended` / `Optional` / `Avoid` tag.

Being the maximalist I am (in other words, I enjoy implementing functionality to my site as a means of procrastinating writing) I decided to go through, one-by-one, and see what I would need to change or add to my site.

A Deliberate Skip [](#a-deliberate-skip)
----------

Before anything else, I skipped the entire "Agent Readiness" category. I'm not going to add a `llms.txt` to my codebase, or per-page markdown endpoints. It's quite a cruel joke that the generative AI gets simple, readable markdown while the rest of us are stuck with far more complex HTML, isn't it? Instead of figuring out a way to get web browsers to display Markdown directly, we've duct-taped a solution for robots.

Anyways, that's enough ranting about that for now. In addition, as I've already written about, I have no AI-crawler-specific `robots.txt` rules. The game of cat-and-mouse writing elaborate blockades is something I'm not interested in. The only winning move is not to play. That said, I did actually add some fun honeypots that you can find if you try to visit high-risk application paths, default CMS/root paths, secrets & configuration file locations, or API & discovery endpoints. Maybe I'll make another post for that if there's interest.

Agent readiness, as a category, assumes you *want* agents reading your site efficiently. Unlike search engine optimization (which is usually snake oil itself), optimization for LLMs just makes your content easier to steal, and doesn't help getting more humans to your website.

A Silly Bug [](#a-silly-bug)
----------

When you go over an audit like this, it makes you re-examine things you've written ages ago. In the case of my `site.webmanifest`, it made me realize it had empty `name` and `short_name` fields:

```json
{"name":"","short_name":"","icons":[{"src":"/android-chrome-192x192.png", ...
```

Any Android user who tried to "Add to Home Screen" would've gotten a shortcut with no label. Even worse, the icon paths were root-relative (`/android-chrome-192x192.png`) when the actual files live at `/assets/images/favicon/android-chrome-192x192.png`. The manifest has been silently erroring and pointing at 404s since whenever I first generated it with some online favicon tool and never looked at the output again. I fixed both:

```json
{
  "name": "brennan.day",
  "short_name": "brennan.day",
  "start_url": "/",
  "scope": "/",
  "icons": [
    {"src": "/assets/images/favicon/android-chrome-192x192.png", "sizes": "192x192", "type": "image/png"},
    {"src": "/assets/images/favicon/android-chrome-512x512.png", "sizes": "512x512", "type": "image/png"}
  ],
  "theme_color": "#fbf1c7",
  "background_color": "#fbf1c7",
  "display": "standalone"
}
```

In addition, the `<meta name="theme-color">` was embarrassingly set to `#65312fff`. I have no idea when I wrote out this typo—8-digit hex values do actually have utility, with the extra two digits [adding alpha channel for transparency](https://www.quackit.com/css/color/values/css_hex_color_notation_8_digits.cfm), but that wasn't what was happening here. Anyways, I split the hex into a light/dark pair instead, matching my site's palette:

```html
<meta name="theme-color" content="#fbf1c7" media="(prefers-color-scheme: light)">
<meta name="theme-color" content="#282828" media="(prefers-color-scheme: dark)">
```

Security Headers, or: What I'd Been Putting Off [](#security-headers-or-what-i-d-been-putting-off)
----------

A lot of work went into security headers. My `netlify.toml` initially had `X-Frame-Options`, which is [an outdated](https://developer.mozilla.org/en-US/docs/Web/HTTP/Reference/Headers/X-Frame-Options) `X-XSS-Protection` header that I removed, as it does nothing in any current browser, and [the spec](https://specification.website/) says to avoid using it.

I had no [Content Security Policy](https://developer.mozilla.org/en-US/docs/Web/HTTP/Guides/CSP), no [HSTS](https://developer.mozilla.org/en-US/docs/Web/HTTP/Reference/Headers/Strict-Transport-Security), and nothing about [cross-origin isolation](https://developer.mozilla.org/en-US/docs/Web/API/Window/crossOriginIsolated).

Writing a CSP for a site that embeds webring widgets and uses KaTeX, Mermaid, and has an IndieAuth comment flow took a bit of work:

```perl
Content-Security-Policy = default-src 'self';
  script-src 'self' 'unsafe-inline' 'wasm-unsafe-eval'
    https://cloud.umami.is https://neatstats.net https://cdn.jsdelivr.net
    https://webring.fun https://silly.possiblyaxolotl.com
    https://bubbles.town https://status.lol;
  style-src 'self' 'unsafe-inline' https://cdn.jsdelivr.net
    https://silly.possiblyaxolotl.com;
  img-src 'self' data: https:;
  font-src 'self' data: https://cdn.jsdelivr.net;
  connect-src 'self' https://cloud.umami.is https://*.supabase.co
    https://webring.fun https://neatstats.net https://bubbles.town;
  frame-src https://www.youtube.com;
  object-src 'none'; base-uri 'self';
  form-action 'self' https://indieauth.com https://buttondown.com
    https://*.supabase.co;
  frame-ancestors 'none'; upgrade-insecure-requests;
  report-to default;
```

I'm not going to pretend that's a *strict* CSP. It still has `'unsafe-inline'` for both scripts and styles, because my site has inline `<style>` blocks for critical CSS (which is a [debateable practice](https://csswizardry.com/2022/09/critical-css-not-so-fast/)) and quite a few one-off inline `<script>` tags (theme toggle, scroll progress, the IndieAuth PKCE flow) scattered across templates.

Doing this properly would mean having nonces or hashes on every single script, which frankly isn't a refactor I'm interested in. What I have now still improves security if there was something like a XSS bug, by locking down which *domains* can be a script/style/connect/frame source at all.

For `Strict-Transport-Security` and `Permissions-Policy`, there was nothing complicated to add:

```perl
Strict-Transport-Security = "max-age=63072000; includeSubDomains"
Permissions-Policy = "camera=(), microphone=(), geolocation=(), payment=(), usb=(), interest-cohort=()"
```

`Cross-Origin-Embedder-Policy` made me stop and think, the spec's default recommendation is `require-corp`, which blocks any cross-origin resource that doesn't explicitly opt in with its own `Cross-Origin-Resource-Policy` header. For instance, my website ~~hotlinks~~ loads badge images from `aaronparecki.com`, `indieweb.org`, and `mirrors.creativecommons.org`, none of which I control. `require-corp` would've broken these images. I used `credentialless` instead, isolating the page the same way but only strips credentials from cross-origin requests rather than blocking them.

I also wrote a `Reporting-Endpoints` header pointing at a tiny new Netlify Function that logs whatever the browser sends it:

```javascript
// netlify/functions/csp-report.js
exports.handler = async (event) => {
  if (event.httpMethod !== "POST") return { statusCode: 405, body: "" };
  console.warn("[reporting-api] " + (event.body || "").slice(0, 4000));
  return { statusCode: 204, body: "" };
};
```

This isn't an actual observability pipeline, as it only `console.warn` into logs through Netlify's log drains. But if my CSP is breaking something for a visitor, I'll be able to find out.

The CSP Learning Curve [](#the-csp-learning-curve)
----------

Of course, implementing a CSP wasn't as simple as copying the spec's recommendations. My initial CSP broke several things on my site:

* The webring widgets from `webring.fun` and `silly.possiblyaxolotl.com` stopped loading
* The bubbles.town upvote button failed to load
* The status.lol widget was blocked
* NeatStats analytics stopped working

The issue was that these third-party services make API calls to their own domains for data, and I hadn't included those domains in my `connect-src` directive. Additionally, some services load their own CSS files that I hadn't whitelisted in `style-src`.

I had to iteratively add missing domains:

```perl
script-src 'self' 'unsafe-inline' 'wasm-unsafe-eval'
  https://cloud.umami.is https://neatstats.net https://cdn.jsdelivr.net
  https://webring.fun https://silly.possiblyaxolotl.com
  https://bubbles.town https://status.lol;
style-src 'self' 'unsafe-inline' https://cdn.jsdelivr.net
  https://silly.possiblyaxolotl.com;
connect-src 'self' https://cloud.umami.is https://*.supabase.co
  https://webring.fun https://neatstats.net https://bubbles.town;
form-action 'self' https://indieauth.com https://buttondown.com
  https://*.supabase.co;
```

The lesson here is that CSPs require knowing exactly which domains your third-party services use—not just for loading their scripts, but also for any API calls they make in the background. Browser console errors were invaluable for debugging this.

After implementing my initial CSP, I noticed my Umami metrics suddenly dropped to near-zero. It turned out that Umami had changed their API gateway domains, moving from just `cloud.umami.is` to also using `gateway.umami.is`, `eu.umami.is`, and various `api-gateway.*.umami.dev` endpoints. This is a known issue that breaks tracking for sites with strict CSPs. I had to add all these new gateway domains to my `connect-src` directive to restore analytics functionality.

I also had to update my service worker to skip cross-origin requests entirely. The service worker was trying to handle requests to external domains (webring scripts, badge images, etc.) but couldn't properly cache them due to CORS restrictions, which was causing "undefined" response errors. By adding a check to only handle same-origin requests, the service worker now focuses on my own content while letting external resources load normally.

Terrible, Terrible Cookies [](#terrible-terrible-cookies)
----------

The checklist's Privacy category flags cookie consent as `Required`. But guess what? My website has zero cookies, hurray! Umami, my analytics, is [documented as cookie-free](https://umami.is/privacy) and I already say so in my [privacy policy](https://brennan.day/privacy/), and nothing else on my website creates cookies either.

Not every item deserves a "yes" just because the checklist says **Required**. Read the justification, check if it applies to *your* site.

Beyond this, there are better alternatives to cookies you can use. For saving user preferences and settings, use `localStorage`:

```javascript
// Set it
localStorage.setItem('theme', 'dark');

// Get it
const theme = localStorage.getItem('theme'); // 'dark'

// Remove it
localStorage.removeItem('theme');
```

Local storage also has a 10MB storage limit vs. 4KB limit for cookies. The catch is data persists forever unless cleared.

`sessionStorage` works exactly like localStorage, but automatically clears the data when the user closes the browser tab.

```javascript
sessionStorage.setItem('formStep', '3');
```

For large, complex data (e.g., offline images, large cached JSON), you can use `localForage` (a library that yes, rhymes). Native IndexedDB is powerful but complicated (uses callbacks, cursors, and databases). `localForage` is a tiny library that gives you a localStorage-style API but stores data in IndexedDB behind the scenes.

```javascript
// Include the library, then:
localforage.setItem('shoppingCart', { items: 200, total: '$500' });
localforage.getItem('shoppingCart').then((cart) => console.log(cart));
```

This handles binary data (blobs/files) and holds over 50MB, and uses Promises (async) so it doesn't freeze your webpage.

A Useful Service Worker [](#a-useful-service-worker)
----------

My old service worker cached `/assets/css/style.css`, a file that hasn't existed since I split my CSS into multiple files, so it was actually caching nothing. I rewrote it so a failed navigation falls back to a real offline page instead of the browser's own "no internet" screen, and images load cache-first instead of network-first:

```javascript
if (event.request.mode === 'navigate') {
  event.respondWith(
    fetch(event.request).catch(() =>
      caches.match(event.request).then(response => response || caches.match(OFFLINE_URL))
    )
  );
  return;
}
```

I also added a check to skip cross-origin requests entirely, which was causing CORS-related errors. The service worker now only handles same-origin requests, letting external resources (webring scripts, badge images, etc.) load normally:

```javascript
// Skip cross-origin requests to avoid CORS issues
if (!event.request.url.startsWith(self.location.origin)) {
  return;
}
```

Finally Fixing the Annoying Flash [](#finally-fixing-the-annoying-flash)
----------

While testing all these changes, I finally dealt with the flashing on page load—elements in the main content and sidebar would resize visibly on page loads, regardless if it was your first visit or not.

This was because I was using the deferring technique `media="print" onload="this.media='all'"`. This is a [known pattern](https://css-tricks.com/the-simplest-way-to-load-css-asynchronously/) for loading CSS asynchronously to improve performance, but it has the annoying downside of causing [flashes of Unstyled Content](https://css-tricks.com/the-simplest-way-to-load-css-asynchronously/) and [layout shifts](https://developer.chrome.com/docs/aurora/aurora-resource-inlining) when the deferred CSS finally loads and applies.

I just removed the deferred loading and let CSS load normally. The tradeoff is slightly slower initial render, but no more flashing. Sometimes the performance optimization causes the problem it's supposed to solve.

Other Small Fixes (Rapid Fire Round!) [](#other-small-fixes-rapid-fire-round)
----------

There were a handful of things that were quick, once I knew to look for them:

**`text-wrap: balance` / `text-wrap: pretty`** on headings and body copy, so the browser handles orphaned last-line words nicely.

```css
h1, h2, h3, h4, h5, h6 {
  text-wrap: balance;
}

p, li, dd, figcaption {
  text-wrap: pretty;
}
```

**`scrollbar-gutter: stable`** so pages that scroll (nearly every post) and pages that don't aren't shifting width against each other.

```css
html {
  scrollbar-gutter: stable;
}
```

**`scroll-margin-top` / `scroll-padding-top`** on headings and anchor targets, so jumping to `#comments` or a table-of-contents link doesn't land the heading directly underneath my sticky header (something that's been bothering me forever).

```css
html {
  scroll-padding-top: 5rem;
}

h1, h2, h3, h4, h5, h6,
:target,
[id] {
  scroll-margin-top: 5rem;
}
```

**A [`@view-transition`](https://developer.mozilla.org/en-US/docs/Web/API/View_Transition_API) block** with `navigation: auto`, so Chrome (for now) animates between page loads. Unsupported browsers just navigate normally, but it's a one-line opt-in.

```css
@view-transition {
  navigation: auto;
}
```

**[Forced colours mode](https://developer.mozilla.org/en-US/docs/Web/CSS/@media/forced-colors)** support, for people running accessibility options, like Windows High Contrast. My rainbow nav underline and scroll-progress bar are pure decoration with no border to fall back on, so this snippet allows them to remain:

```css
@media (forced-colors: active) {
  .site-header::after,
  nav.site-nav a::after {
    background: CanvasText;
    forced-color-adjust: none;
  }

  button, .hero-btn, input[type="submit"] {
    border: 1px solid ButtonText;
  }
}
```

**[`:user-valid` / `:user-invalid`](https://developer.mozilla.org/en-US/docs/Web/CSS/:user-invalid)** on form fields, real-time validation styling in CSS instead of JS class-toggling, and it only triggers after you've interacted with the field, so a required-but-empty input doesn't pop up before you've typed anything.

```css
input:user-invalid, textarea:user-invalid {
  border-color: var(--link-hover);
}

input:user-valid, textarea:user-valid {
  border-color: var(--nav-green);
}
```

**A container query** on the sidebar modules, this way the badge grid responds to the module's rendered width instead of just the viewport.

```css
.sidebar .module {
  container-type: inline-size;
  container-name: sidebar-module;
}

@container sidebar-module (max-width: 220px) {
  .badges-grid {
    grid-template-columns: repeat(auto-fill, minmax(70px, 1fr));
  }
}
```

**`contain: layout paint`** on post cards and sidebar modules, telling the browser those subtrees can't affect anything outside themselves.

```css
a.post-card {
  contain: layout paint style;
}
```

**Speculation Rules** for same-origin prefetching, skipping honeypot paths and anything marked `rel="nofollow"`:

```html
<script type="speculationrules">
{
  "prefetch": [{
    "source": "document",
    "where": { "and": [
      { "href_matches": "/*" },
      { "not": { "href_matches": "/honeypot/*" } },
      { "not": { "selector_matches": "[rel~=\"nofollow\"]" } }
    ]},
    "eagerness": "moderate"
  }]
}
</script>
```

**Visible breadcrumbs** on posts and pages, matching the `BreadcrumbList` JSON-LD I already wrote but never rendered on the site:

```html
<nav class="breadcrumbs" aria-label="Breadcrumb">
  <ol>
    <li><a href="/">Home</a></li>
    <li aria-current="page">Advanced Webweaving: Auditing Against Specification.Website</li>
  </ol>
</nav>
```

**`inputmode`, `enterkeyhint`, and `autocomplete`** on the comment sign-in, newsletter, contact, and guestbook forms, so the correct mobile keyboard shows up:

```html
<input type="url" name="me" inputmode="url" enterkeyhint="go" autocomplete="url" required>
<input type="email" name="email" inputmode="email" enterkeyhint="send" autocomplete="email" required>
```

**A `/500.html`** page and a `/maintenance.html` page, the latter being a documented, one-line redirect flip in `netlify.toml` for if ever I need to put the site into maintenance mode. (Some future unforseeable disaster.):

```toml
# Commented out until I actually need it
# [[redirects]]
#   from = "/*"
#   to = "/maintenance.html"
#   status = 503
#   force = true
```

[**IndexNow**](https://www.indexnow.org/), a protocol I'd never heard of before this audit. Bing, Yandex, and a couple others let you push a "changes made" ping instead of waiting for a crawl. Generate a key, and drop it at the site root, and then I added a post-deploy hook next to the WebSub ping I already had:

```bash
curl -s -X POST "https://api.indexnow.org/indexnow" \
  -H "Content-Type: application/json; charset=utf-8" \
  -d "{\"host\": \"brennan.day\", \"key\": \"...\", \"urlList\": [...]}"
```

A [**`webfinger`**](https://www.rfc-editor.org/rfc/rfc7033) endpoint at `/.well-known/webfinger`, which is how the Fediverse resolves `acct:brennan@brennan.day`-style identifiers to profile links. Mine is a static file instead of query-aware endpoint, since I only have the one identity to resolve (mine):

```json
{
  "subject": "acct:brennan@brennan.day",
  "links": [
    { "rel": "self", "type": "application/activity+json", "href": "https://social.lol/@brennan" }
  ]
}
```

A **`/.well-known/traffic-advice`** file, which is Chrome-specific and tells its private prefetch proxy whether it's allowed to send prefetch traffic to my origin:

```json
[{ "user_agent": "prefetch-proxy", "google_prefetch_proxy_eap": { "fraction": 1.0 } }]
```

Adding a [Syndication module](https://web.resource.org/rss/1.0/modules/syndication/) (`sy:updatePeriod`, `sy:updateFrequency`) in my RSS feed, so feed readers with the ability can now display how frequently my blog is updated:

```xml
<rss version="2.0" xmlns:sy="http://purl.org/rss/1.0/modules/syndication/">
  <channel>
    <sy:updatePeriod>daily</sy:updatePeriod>
    <sy:updateFrequency>1</sy:updateFrequency>
  </channel>
</rss>
```

`Redirect-By: Netlify`, a header that states which system issued a redirect, in case I'm debugging a redirect chain:

```toml
[[headers]]
  for = "/*.html"
  [headers.values]
    No-Vary-Search = '''params=("utm_source" "utm_medium" "utm_campaign" "fbclid" "gclid")'''

[[headers]]
  for = "/*"
  [headers.values]
    Redirect-By = "Netlify"

[[headers]]
  for = "/assets/*"
  [headers.values]
    Cross-Origin-Resource-Policy = "cross-origin"
```

A few more additions:

* [`No-Vary-Search`](https://developer.mozilla.org/en-US/docs/Web/HTTP/Reference/Headers/No-Vary-Search) on HTML responses, listing out the usual tracking parameters (`utm_source`, `fbclid`, `gclid`, etc.) so a cache treats `/post/` and `/post/?utm_source=mastodon` as the same page instead of two (I try my best to avoid any tracking params, but other sites don't).
* `Cross-Origin-Resource-Policy: cross-origin` on my asset headers, so nothing about the other origin isolation changes stops someone else from embedding my own images.
* Core Web Vitals as a category is just reviewing what real users experience, which I did with [PageSpeed Insights](https://pagespeed.web.dev/). The current assessment is **Passed**: **Largest Contentful Paint (LCP) 1.8 s**, **Interaction to Next Paint (INP) 68 ms**, **Cumulative Layout Shift (CLS) 0**. Other metrics: **First Contentful Paint (FCP) 1.6 s**, **Time to First Byte (TTFB) 1.6 s**. These were taken from the latest 28-day [Chrome UX Report](https://developer.chrome.com/docs/crux) for mobile.

Things Still Unaddressed [](#things-still-unaddressed)
----------

There were also several other things I didn't get to from the long, detailed 140-item checklist:

* **DNS CAA records and DNSSEC** are controlled by CDN, and not in this repo, so I'll need to review those.
* **Trusted Types** would require auditing every `innerHTML`-style sink across my templates *and* the third-party widgets I don't control.
* **SRI on the webring/reaction-button scripts** isn't happening until they're pinned to a version instead of `@main`. Subresource Integrity on a moving target just means the hash breaks the next time I push a commit. I did add it to my pinned Mermaid script, where it made sense.
* **Actual uptime monitoring** means picking and paying for a third-party service, which I don't think is necessary for my site.
* **Strict CSP with nonces/hashes** would require refactoring all my inline scripts and styles to use proper CSP mechanisms, which is more work than I'm willing to invest right now.

The Actual Point [](#the-actual-point)
----------

This is the part where I say none of this was really about the checklist. Don't get me wrong, checklists *are* good for finding the things you've stopped seeing because you've been looking at the same code every day for months. Fixing the broken web manifest, the theme-colour meta tag doing nothing, and the breadcrumb schema I wasn't actually using.

But the value wasn't in checking every box, it was about learning what my site was lacking due to my ignorance, and making meaningful changes to improve the experience for my readers and visitors.

If you run your own site through [the checklist](https://specification.website/checklist/), I'm curious what it turns up for you! (And please let me know if any of these changes actually ended up breaking something.)

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