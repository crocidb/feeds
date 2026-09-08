+++
title = "A Guide to Becoming a Rogue Scholar"
description = "I've been weighing grad school against continuing my own open-access publication, so I wrote a guide to becoming a 'Rogue Scholar' using ORCID, citation metadata, issue numbers, print CSS, and Wayback Machine archiving to try to make my static Eleventy site as citable, permanent,"
date = "2026-08-19T02:00:00Z"
url = "https://brennan.day/a-guide-to-becoming-a-rogue-scholar/"
author = "mail@brennanbrown.ca (Brennan Kenneth Brown)"
text = ""
lastupdated = "2026-09-08T09:41:46.909993243Z"
seen = true
+++

**Abstract:** This post argues that a personal website can function as a citable, open-access publication, then walks through how to do it: register an ORCID, apply to [Rogue Scholar](https://rogue-scholar.org/) for DOI and archive mirroring, add issue numbers and ISSN metadata, generate one-click citation exports, mark up pages with Highwire Press and Dublin Core tags, syndicate with a metadata-rich RSS/JSON feed, write print CSS, and mirror everything to the Wayback Machine.

It's been around a year and a half since I graduated university with my bachelor of arts, majoring in English Honours. One of the only reasons you'd do an Honours program is if you want a better chance of getting into a master's program afterwards, in addition to the faculty connections you build.

And that was my original plan—I was going to return to my hometown of Winnipeg and get my MA in English, most likely at the University of Manitoba, doing a thesis-based route and publishing whatever I completed. Obviously, none of this ended up happening.

During my undergrad, I became enthralled by the idea of being a scholar and an academic. I was lucky enough to have the opportunity to get [a peer-reviewed paper published](https://mrujs.mtroyal.ca/index.php/mruhr/article/view/768), a critical analysis of an Indigenous graphic novel. Although there are publications like the [Journal of Undergraduate Research](https://www.jurpress.org/), it is rather rare.

While I was initially going to do my honours thesis on poetry through an Indigenous lens, I instead decided to do [a metadisciplinary analysis of the pedagogy](https://doi.org/10.13140/RG.2.2.25021.37600) of the English degree. A large portion of this work was examining digital humanities, and how students are *actually* interfacing with literature and texts today.

>
>
> The very concept of “text” has exploded into a thousand strange forms: fifteen-second video essays cutting deeper for students than any academic paper, sprawling collaborative fanfictions where readers and writers blur together in real-time, memetic satires of corporate mascots, roleplay forums where teenagers craft elaborate mythologies through nothing but status updates. Dozens of literary forms being born and dying every day. The boundaries between creator and consumer, between high art and shitpost, between canon and transformation, all seem to be dissolving in real-time, surely. Salt in hot water.
>
>

...What *is* Digital Humanities? [](#what-is-digital-humanities)
----------

"Digital humanities" is a term academia has spent two decades arguing over. [Kathleen Fitzpatrick](https://dhdebates.gc.cuny.edu/read/untitled/section/abdd0db0-2eaa-4af7-aac3-7f24ca70ed3b) has described the field as a wide-ranging grouping of scholars who either 1) use computing tools to investigate old humanities questions, or 2) ask humanities-style questions about computing itself.

"Big tent" was the theme of the field's largest annual conference back in [2011](https://dhdebates.gc.cuny.edu/read/untitled), and the philosophy has never left. Digital humanities is an expanded field that holds digital archives, text mining, 3D modeling of historical objects, born-digital dissertations, #hashtag activism, alternate reality games, and whatever gets invented next year. Centres like [UCL's](https://www.ucl.ac.uk/digital-humanities/dhoer/Background) stretch the tent even further, treating DH less as a subject with fixed borders, and more as a *way* of working that any humanities question can be run through.

Taken as a subject, this site has no business calling itself a unified body of scholarship. I write about the science of ball lightning in one post, Eleventy build errors the next, a personal lyric essay on clown burnout after that, and then security research into a malware fork. But all of my posts are statically built, syndicated with microformats, mirrored to the Wayback Machine, addressed by a stable URL, and, as of this essay, are using citation metadata. The practice stays constant, and so the topic can drift.

Marshall McLuhan's line about [the medium being the message](https://en.wikipedia.org/wiki/The_medium_is_the_message) wasn't arguing that content doesn't matter. He was arguing that a medium reshapes, that the form of transmission works on a reader and a culture, separate from the message. The medium holds the corpus together.

Scholars have already been treating personal academic blogs as scholarly output for years, now. [Michael Ullyot](https://ullyot.ucalgaryblogs.ca/2012/02/24/on-blogging-in-the-digital-humanities/), writing from the University of Calgary, argued that in digital humanities, blog posts function as the field's communication channel, often the only venue through which new questions and methods reach anyone before a journal picks them up.

Librarian [Barbara Fister](https://www.insidehighered.com/blogs/library-babel-fish/serial-scholarship-blogging-traditional-academic-practice) describes serial blogging as mirroring the academic habit of publishing issue after issue. And Alexis Lothian and Amanda Phillips's [#transformDH](https://journals.dartmouth.edu/journals/xmlpage/4/article/425) work argued that digital humanities produced outside institutional walls, such as in fan communities and other spaces with no formal tie to a university, are as serious and legitimate as anything produced within one.

The State of Academia [](#the-state-of-academia)
----------

If you're a reader of my site, it should be unsurprising that the area of focus for my honours thesis was to examine how we can create a liberated future where academia is not ivory tower elitism and gatekeeping. Much easier said than done—I know.

I'm sure I also don't need to tell you the dire straits academia is in. This is happening in the [United States](https://www.newyorker.com/news/fault-lines/the-enrollment-cliff-is-here-which-schools-will-survive-it), [Canada](https://www.timeshighereducation.com/opinion/canadas-overseas-student-collapse-forcing-reckoning-over-quality), the [United Kingdom](https://www.theguardian.com/education/2026/aug/13/uk-universities-face-financial-crisis-amid-collapse-in-international-students), all around the world. There is a collapse of [trust in higher education](https://www.forbes.com/sites/mattscogin/2026/06/22/the-collapse-of-trust-in-higher-ed-why-pr-wont-fix-systemic-failure/).

The culture of academia isn't faring any better. Peter Fleming's book [*Dark Academia: How Universities Die*](https://www.plutobooks.com/product/dark-academia/) examines how "commercialisation, mental illness and self-harm, the rise of managerialism, students as consumers and evaluators, and the competitive individualism casts a dark sheen of alienation over departments."

And this isn't even mentioning the newfound crisis of how generative AI has [upended the traditional pedagogy of education](https://www.theguardian.com/technology/ng-interactive/2026/mar/10/ai-impact-professors-students-learning) in general, with schools [returning to pen and paper](https://www.npr.org/2026/08/15/nx-s1-5929156/the-ai-cheating-disaster-that-forced-mexicos-top-university-back-to-pen-and-paper) and [oral exams](https://phys.org/news/2026-08-oral-exams-comeback-ai-problems.html) as band-aid solutions.

Seeing all of this might make you think I'm a cynic and abolitionist, but that isn't the case at all. Despite everything, I still see an irreplaceable value in academia, and I believe radical reform can steer the massive ship of institutions back towards their original ideals.

Registration for 2027 master's programs opens in only a couple of weeks, now. And I find myself weighing the decision between returning to scholarship or maintaining my independent, open-access publication here.

Having it Both Ways [](#having-it-both-ways)
----------

But then I had the epiphany that it doesn't have to be either/or—and that I have an excellent way to demonstrate how to lower the gates of the ivory tower myself.

There are a number of open, free academic platforms anybody can join. You can register for an [ORCID](https://orcid.org), get an account on [Research Gate](https://www.researchgate.net/) and [Google Scholar](https://scholar.google.ca/citations?user=XqdnVq0AAAAJ).

But that's just the tip of the iceberg. One project idea I had but never executed was starting a peer-reviewed, academic journal myself. There's web software called [Open Journal Systems](https://pkp.sfu.ca/software/ojs/) that thousands of universities and institutions use around the world. The problem is that hosting solutions have starting costs of [$500 per year](https://openjournalsystems.com/ojs-hosting/).

But the thing is, this is software you can install and host on your own server. Most academics don't have the necessary technical skills to do this, but they *do* have grants and budgets, which is why hosting platforms are able to sell their services for predatory prices like this.

My original plan was to found a journal with support from my honours advisor and the executive team at Write Club, since I could host OJS myself:

>
>
> The Anaglyph envisions a literary landscape that is inclusive, accessible, and amplifies marginalized voices. We aim to democratize and decolonize Canadian literature by providing a platform for underrepresented writers and challenging traditional gatekeeping structures within the publishing industry. The name "Anaglyph" is inspired by the technique of overlaying two images in different colours to create a three-dimensional effect when viewed through a lens; our mission to bring together diverse perspectives to form a richer, more multidimensional literary experience for all.
>
>

The Dean, subsequently, denied us funding for this initiative:

>
>
> The Arts Endeavour Committee has reviewed your application. I regret that on this occasion the committee felt other applications should take preference, and no funding could be allocated in support of your project *The Anaglyph: Democratizing and Decolonizing Literary Studies Through Student-Led Digital Publishing*. We received applications that totalled more than twice the amount we had to allocate.
>
>

I no longer have academic support, funding, or my colleagues and peers from Write Club, but I am far more technically adept than I was when I originally applied for funding. Without the team needed for an academic journal, I have a different plan now. (Although if enough people write to me asking me to boot up an OJS and try this again, I certainly wouldn't be opposed.)

I've decided to become an independent scholar—what I also call a "rogue" scholar—not peer-reviewed or institution-backed, but whose work is public, citable, and open to post-publication review.

What an Independent Scholar Actually Does [](#what-an-independent-scholar-actually-does)
----------

If I'm going to argue that independent publishing can stand in for institutional scholarship, then I want my site to behave as a scholarly record, instead of just a blog that happens to be well-organized.

This means offering the same functionality journals have: citability, discoverability, authorship, and permanence. Over the past few days I went and built this for myself, and I greatly encourage you to add the same to your own site.

### Applying to Rogue Scholar [](#applying-to-rogue-scholar) ###

The first step is applying to [Rogue Scholar](https://rogue-scholar.org/), an open-access archive that creates DOIs for science and scholarly blog posts, and mirrors them into the Internet Archive. It's run by [Front Matter](https://front-matter.io/), and it's free, unlike [Crossref membership, which costs $200 USD a year](https://www.crossref.org/fees/). I've applied, and I'm currently looking for an institutional sponsor (such as [Coalition Publica](https://www.coalition-publi.ca/)) to cover a Crossref membership down the line.

### Registering an ORCID [](#registering-an-orcid) ###

I've also registered an [ORCID](https://orcid.org), which can be understood as a universal author ID for academia. Researchers use it to disambiguate themselves from others who share their name, and it's a persistent identifier across institutions, journals, and platforms. Mine is [0009-0004-9951-3451](https://orcid.org/0009-0004-9951-3451), and I've wired it into my site: `rel="me"` on my accounts page, the h-card on every post byline, and a handful of citation and structured data fields I'll get into below.

Adding Journal-like Functionality [](#adding-journal-like-functionality)
----------

The above matters so long as my site has the technical front-matter, scripting, and elements that make it citable. Here are a few things I've done:

### An Issue Numbering System [](#an-issue-numbering-system) ###

Journals have issues. Every article belongs to one, with a number, so citations can say "Vol. 4, No. 12" in addition to the URL. I don't publish in discrete issues due to my publishing frequency, so I made every single post its own issue. Post #1 is issue #1, post #212 is issue #212, and so on.

I created an Eleventy filter for this. `collections.posts` sorts by newest-first by default, so the oldest post (at the end of the array) is issue #1:

```javascript
// config/filters.js
eleventyConfig.addFilter("getIssueNumber", (collection, page) => {
  if (!collection || !page || !page.url) return "";
  const index = collection.findIndex(item => item.url === page.url);
  if (index === -1) return "";
  // collection is sorted newest-first, so the oldest item is issue #1
  return collection.length - index;
});
```

Because this number is computed from the current length of the collection, unpublishing or deleting a post would shift every later number. For a system whose goal is permanence and citability, that is fragile. The long-term fix is to assign an `issue` field in each post's frontmatter and have the filter fall back to that. I have not migrated the archive yet, so the current numbers are best-effort.

Then in `src/_includes/layouts/post.njk`, the issue number is displayed under the featured image caption, in small caps, above the title:

```njk
<p class="publication-issue"><span class="sc">issue #{{ collections.posts | getIssueNumber(page) }} of {{ site.title }}</span></p>
<h1 class="p-name" data-pagefind-meta="title">{{ title }}</h1>
```

`.sc` is a one-line utility class I already had (`font-variant: small-caps;`), so no new CSS needed.

It's a small thing, but it's the difference between a post feeling like an entry in an ongoing publication versus a mere blog post.

### ISSN Metadata [](#issn-metadata) ###

An ISSN (International Standard Serial Number) is a unique 8-digit code used to identify continuing publications like magazines, journals, newspapers, and websites. It helps libraries, stores, and databases quickly find and sort specific serial titles without mixing them up.

In Canada, you can [apply for an ISSN](https://issn.bac-lac.canada.ca/eng/requests/publication) free of charge.

I just applied, so I don't have an assigned ISSN yet. The [ISSN eligibility rules](https://www.issn.org/understanding-the-issn/assignment-rules/the-issn-for-electronic-media/) may mean that my publication is ineligible, but as I wrote earlier, I do think there's sufficient merit.

Anyways, the field for an ISSN is set up, with the value saved in `src/_data/site.json`.

```njk
{% if site.issn %}<meta name="citation_issn" content="{{ site.issn }}">{% endif %}
```

It'll propagate to the citation meta tags, the JSON-LD, the RSS feed's `<category domain="ISSN">`, and both the about page and colophon, without touching a single template again.

### Publication Information Dropdown [](#publication-information-dropdown) ###

Below the fold of every post, there's now a `<details>` element with what you'd find on a journal's article page: title, author with ORCID link, issue number, ISSN (once assigned), published and modified dates, canonical URL, place of publication, and contact:

```njk
<details class="cite-article h-cite">
  <summary>Publication Information</summary>
  <p><strong>Title:</strong> <span class="p-name">{{ title }}</span></p>
  <p><strong>Author:</strong> <span class="p-author p-name">{{ site.author.name }}</span>
    {% if site.author.orcid %} <a class="u-uid" href="{{ site.author.orcid }}" rel="me">ORCID</a>{% endif %}</p>
  <p><strong>Issue:</strong> #{{ collections.posts | getIssueNumber(page) }} of {{ site.title }}</p>
  {% if site.issn %}<p><strong>ISSN:</strong> <span class="p-issn">{{ site.issn }}</span></p>{% endif %}
  <p><strong>Date Published:</strong> <time class="dt-published" datetime="{{ date | isoDate }}">{{ date | readableDate }}</time></p>
  ...
</details>
```

It's marked up with `h-cite` microformats so, in theory, other IndieWeb tools parsing my posts can pull structured citation data out of it the same way they'd parse an `h-entry`.

### A "Cite This Issue" Button [](#a-cite-this-issue-button) ###

Right below that, I added a second `<details>` block that provides one-click citation exports. Click it open and you get MLA 9, APA 7, Chicago notes-bibliography, and BibTeX, all pre-filled with the post's frontmatter:

```njk
<details class="cite-export">
  <summary>Cite this issue</summary>
  <ul class="citation-formats">
    <li>
      <strong>MLA 9</strong>
      <pre>{{ site.author.name }}. "{{ title }}." {{ site.title }}, {{ date | readableDate }}, {{ site.url }}{{ page.url }}.</pre>
    </li>
    <li>
      <strong>BibTeX</strong>
      <pre>@online{brennan{{ year }}{{ page.url | slugify }},
  author = {{ '{' }}{{ '{' }}{{ site.author.name }}{{ '}' }}{{ '}' }},
  title = {{ '{' }}{{ title }}{{ '}' }},
  year = {{ '{' }}{{ year }}{{ '}' }},
  url = {{ '{' }}{{ site.url }}{{ page.url }}{{ '}' }},
  urldate = {{ '{' }}{{ buildTime | htmlDateString }}{{ '}' }}
}</pre>
    </li>
    <!-- APA, Chicago follow the same pattern -->
  </ul>
</details>
```

Writing out the literal curly brace brackets for the BibTeX is a little clumsy, as you can see, because Nunjucks and BibTeX both use them. It's not pretty, but it works.

### Citation Meta Tags and Dublin Core [](#citation-meta-tags-and-dublin-core) ###

Google Scholar, Zotero, and most citation managers look for a specific, decades-old convention called Highwire Press tags, prefixed `citation_*`. I added a full set to every post's `<head>` in `src/_includes/partials/meta.njk`:

```html
<meta name="citation_title" content="{{ title }}">
<meta name="citation_author" content="{{ site.author.name }}">
<meta name="citation_publication_date" content="{{ date | isoDate | split('T') | first | replace('-', '/') }}">
<meta name="citation_journal_title" content="{{ site.title }}">
{% if site.issn %}<meta name="citation_issn" content="{{ site.issn }}">{% endif %}
<meta name="citation_issue" content="{{ collections.posts | getIssueNumber(page) }}">
{% if site.author.orcid %}<meta name="citation_author_orcid" content="{{ site.author.orcid }}">{% endif %}
```

Right below that, I added the [Dublin Core](https://www.dublincore.org/specifications/dublin-core/dcmi-terms/) set, which is the older, broader library-science metadata standard that many archives and repositories still use: `DC.Title`, `DC.Creator`, `DC.Publisher`, `DC.Date`, `DC.Identifier`, `DC.Rights`, and so on.

The `Article` block in my JSON-LD (`src/_includes/partials/structured-data.njk`) has the same info, an `issueNumber` field, and a conditional `identifier` object with `propertyID: "ISSN"`:

```json
{
  "@type": "Article",
  "issueNumber": "{{ collections.posts | getIssueNumber(page) }}",
  "identifier": {
    "@type": "PropertyValue",
    "propertyID": "ISSN",
    "value": "{{ site.issn }}"
  }
}
```

### The RSS Feed [](#the-rss-feed) ###

Rogue Scholar (and basically every serious feed reader) parses your RSS feed, not your HTML, so the feed needed the same metadata as the posts themselves. `src/feed.njk` got a `dc` namespace and a `content` namespace added to the root `<rss>` element, then per-item tags for creator, date, language, identifier, source, and rights:

```njk
<item>
  <guid isPermaLink="true">{{ absolutePostUrl }}</guid>
  <dc:creator>{{ site.author.name }}</dc:creator>
  <dc:date>{{ post.data.date | isoDate }}</dc:date>
  <dc:rights>https://creativecommons.org/licenses/by-sa/4.0/</dc:rights>
  {% if site.issn %}<category domain="ISSN">{{ site.issn }}</category>{% endif %}
  ...
</item>
```

At the channel level, I added an `<atom:author>` block pointing at my ORCID as the author URI, a `<copyright>` line, and a channel `<image>`. Small stuff, but it's the difference between a feed that just lists titles and links versus one that actually declares who's responsible for the content and under what terms you're allowed to reuse it.

### CSS Print Styles: Making a Post Feel Like a Publication on Paper [](#css-print-styles-making-a-post-feel-like-a-publication-on-paper) ###

The last piece isn't about metadata at all. If you use the shortcut Ctrl/Cmd + P and try to print one of my posts, you'll now see a nicely styled output, something I attempted to make feel closer to what a printed version of Brennan.day would actually look like, given the limitations of using only CSS.

One of the tricks is `page-break-before` and `flex-direction: column` with the `order` property, so I can rearrange the DOM for print without needing to modify the markup itself:

```css
@media print {
  .h-entry {
    display: flex;
    flex-direction: column;
  }

  /* Title / cover page */
  .post-single .post-header {
    order: 1;
    text-align: center;
    padding-top: 15vh;
  }

  /* Featured image, still on the cover page */
  .featured-image {
    order: 2;
    page-break-inside: avoid;
  }

  /* A dedicated masthead page, after the cover */
  .print-masthead {
    display: block;
    order: 3;
    page-break-before: always;
    page-break-after: always;
  }

  /* The actual essay */
  .e-content {
    order: 4;
  }
}
```

That `.print-masthead` div is invisible on screen (`display: none` outside of `@media print`) and only appears when you print, as its own page, listing the issue number, publisher, place of publication, and contact:

```njk
<div class="print-masthead">
  <p class="sc">{{ site.title }} — issue #{{ collections.posts | getIssueNumber(page) }}</p>
  <p>Publisher: {{ site.author.name }}</p>
  <p>Place of publication: {{ site.author.location.city }}, {{ site.author.location.region }}, {{ site.author.location.country }}</p>
  <p>Available at: {{ site.url }}</p>
  <p>Contact: {{ site.author.email }}</p>
</div>
```

I also added the featured image's caption date and URL onto the page as a `::after` pseudo-element (`content: attr(data-date) "\A" attr(data-url);`), added drop-cap-style paragraph indentation for body text after the first one, and widow and orphan control (`widows: 2; orphans: 2;`).

There are many other elements on my site that don't make sense to print, so those aren't displayed:

```css
.site-header, .sidebar, .site-footer,
nav, .breadcrumbs, .post-meta,
.post-tags, .post-footer, .post-nav,
.like-form, .newsletter-signup, .comments-section,
.webmentions, .related-posts-list, .toc,
.reply-context, .external-link-notice, .cite-article,
noscript, script, iframe {
  display: none !important;
}
```

On screen, paragraphs are separated by margin, but in print I wanted no gap between paragraphs, and the second paragraph onward gets a first-line indent instead:

```css
.e-content p {
  margin: 0;
}

.e-content p + p {
  text-indent: 1.5em;
}
```

And since a browser's print renderer doesn't know or care about clean page breaks, I explicitly declare which elements are allowed to split across pages and which aren't:

```css
pre, blockquote, img,
figure, table {
  page-break-inside: avoid;
}

h1, h2, h3 {
  page-break-after: avoid;
}
```

It's a personal pet peeve of mine to have a heading stranded at the bottom of a page with its own content pushed onto the next one, and certainly nobody wants a figure split in half.

These are small details, but I wanted to ensure I created something you'd want to staple together and put in a binder.

### Archiving to the Wayback Machine [](#archiving-to-the-wayback-machine) ###

Permanence isn't just about metadata sitting in the head of a page. It doesn't matter how many `citation_*` tags or DOIs a post has if the page itself disappears. Rogue Scholar solves this for the posts it ingests, since it holds its own [Archive-It](https://archive-it.org/) subscription that backs up everything it archives.

But I wanted the same insurance for my *entire* site, so I wrote `scripts/archive-to-wayback.js`.

The script reads every URL out of my live `sitemap.xml` and submits each one to the Internet Archive's [Save Page Now](https://web.archive.org/save) API, which snapshots the page into the Wayback Machine:

```javascript
async function fetchSitemapUrls(sitemapUrl) {
  const res = await fetchWithTimeout(sitemapUrl, {}, 30_000);
  const xml = await res.text();
  const urls = [...xml.matchAll(/<loc>\s*([^<\s]+)\s*<\/loc>/g)].map((m) => m[1]);
  return [...new Set(urls)];
}
```

With 400+ pages on the site now, it needs to survive being interrupted, and it needs to not get rate-limited off the API.

So it's resumable by default. Every result gets written to `.cache/wayback-archive/progress.json` immediately after each URL, keyed by the URL itself. Re-running it skips whatever's already marked `saved`:

```javascript
const pending = urls.filter((url) => !progress.results[url] || progress.results[url].status === 'failed');
```

[Archive.org](http://Archive.org)'s anonymous Save Page Now limit is roughly three requests a minute, so my script waits 20 seconds between each one to stay under that. You can get a free [S3-style key pair](https://archive.org/account/s3.php) from [archive.org](http://archive.org), and that enables the script to send authenticated requests instead, which are more reliable:

```javascript
if (AUTHENTICATED) {
  headers.Authorization = `LOW ${ACCESS_KEY}:${SECRET_KEY}`;
}
```

A single failed request retries with backoff up to three times. But if five requests in a row fail, then that's probably [archive.org](http://archive.org) having an outage, which [sadly happens](https://www.malwarebytes.com/blog/news/2024/10/internet-archive-suffers-data-breach-and-ddos):

```javascript
if (consecutiveFailures >= OUTAGE_STREAK_THRESHOLD) {
  saveProgress(progress);
  await sleep(OUTAGE_BACKOFF_MS);
  consecutiveFailures = 0;
  continue; // retry the same URL, don't advance i or record a failure
}
```

The script also stops after three hours, rather than running indefinitely in the background to prevent *too* much leeching on [Archive.org](http://Archive.org)'s servers, since it can always be started up again.

What About Peer Review? [](#what-about-peer-review)
----------

Obviously, this setup doesn't replicate expert peer review. A journal article is not just a durable object with metadata, it has also been evaluated by other people who know the field.

ORCID, DOIs, ISSNs, and Highwire Press tags make a post discoverable and citable, but they do not make it reviewed.

This set up is designed for post-publication, open review. My posts have a public URL, a permanent archive, and a comment section. I am reachable by email and on the fediverse. I can issue corrections or new versions transparently. Webmentions and GitLab issues can become a record of response and critique, and I can invite named readers or mentors to comment on specific essays before or after they go live.

None of that is comparable to a double-blind peer review. I would rather a reader evaluate the argument themselves, check the sources, and cite it with the stated limitation: this is an independent scholarly contribution, not a peer-reviewed journal article.

Beyond this set up, I'd recommend platforms like [PubPub](https://pubpub.org/), [Humanities Commons](https://hcommons.org/), [Zenodo](https://zenodo.org/), the [Open Science Framework](https://osf.io/), [Knowledge Commons](https://www.knowledgecommons.org/), and the [Open Journal Systems](https://pkp.sfu.ca/software/ojs/) software I mentioned earlier.

The Point of All This [](#the-point-of-all-this)
----------

My goal here is to help lower the barriers for people who want to participate in academia and scholarship but can't engage in a formal institution for whatever reason—lack of funding, lack of sufficient grades, lack of time. There are plenty of things stopping people from entering and finishing post-secondary. I hope the ideas I've laid out here help give inspiration and validity to those who feel less legitimate because they aren't enrolled in a university or college—I promise you are, too.

I've taken the parts of academic publishing that actually matter: permanence, citability, clear authorship, a stable identifier for both the publication and the person, and built it all into a static site anyone could clone and use themselves.

The merit of scholarship was never on loan from a department. It's built into the infrastructure now. DOIs, metadata, long-term archiving, doing on my own server what would cost funding and years of institutional support within a university's walls.

If you're sitting on your own personal site wondering whether any of this is worth doing without an institution behind you: it is. An ISSN application costs nothing to attempt. An ORCID takes five minutes. Rogue Scholar is free. Citation meta tags are copy-paste. I've come to realize that one of the only things that actually stands between a "blog" and a "publication" is functionality.

As always, the source for everything above is on [GitLab](https://gitlab.com/brennankbrown/brennan.day) if you want to steal it for your own rogue scholarship.

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