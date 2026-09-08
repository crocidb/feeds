+++
title = "Creating a Digital Garden in 11ty: Tracking My Daily Word Count with URLminder"
description = "I decided to build brennan.click, a wiki-linked digital commonplace book in Eleventy, with auto-generated stubs created with eleventy-plugin-interlinker, pure-CSS hover transclusion and footnotes with no JavaScript, and a plain-text /urlminder.txt feed that drives a Beeminder goa"
date = "2026-07-24T11:00:00Z"
url = "https://brennan.day/creating-a-digital-garden-in-11ty-tracking-my-daily-word-count-with-urlminder/"
author = "mail@brennanbrown.ca (Brennan Kenneth Brown)"
text = ""
lastupdated = "2026-09-08T09:41:46.953461081Z"
seen = true
+++

Continuing where I left off yesterday [writing about Beeminder](https://brennan.day/beeminder-getting-back-on-the-horse/), I realized that there were a couple goals/systems that I needed to modify due to how various integration options and API have changed.

I used to have a goal named [**/github**](https://beeminder.com/brennanbrown/github) which would track my commits across all my repositories on GitHub. But GitHub's API changed, and so now you can only track the commits of one repository at a time. Beyond this, most of my active and maintained projects are now on other platforms like [GitLab](https://gitlab.com/brennankbrown) and [Source.tube](https://source.tube/brennan/) due to [my grievances with GitHub](https://github.com/brennanbrown/brennanbrown#️-choose-a-better-developer-platform).

(An aside: I deleted most of my corporate social media, but I maintain a GitHub for my professional career, which is currently non-existent, lol.)

Anyways, I decided to use this as a good excuse to build an experiment that's been on my mind for awhile: a dedicated, low-friction place to dump my day-to-day small stuff which doesn't really belong on [Brennan.day](https://brennan.day). Quotes, bookmarks, half-formed notes, a diary line, a code snippet worth remembering. I want to create a commonplace book, wiki-linked digital garden which I have a reason to work on every day.

I have been collecting (hoarding) domains like a magpie, and I decided to use [https://brennan.click](https://brennan.click) for this project.

The /urlminder.txt Feed (tracking word count) [](#the-urlminder-txt-feed-tracking-word-count)
----------

I realized I could kill two birds with one stone with this project. I used to use the wonderful online Markdown editor [Draft](https://web.archive.org/web/20230104023309/https://draftin.com/) to track the amount of words I wrote per day on Beeminder on my goal [**/writing**](https://beeminder.com/brennanbrown/writing). They sadly shut down and I never found a good alternative.

I actually tried creating my own, a Swift MacBook app called [Bearminder](https://github.com/brennanbrown/bearminder), which uses the [Bear](https://bear.app/) API to send word count to Beeminder. But I found it too cumbersome and I am not a good Swift dev.

But, I realized this project was the perfect opportunity for me to actually finally use [URLminder](https://help.beeminder.com/article/88-urlminder), which lets Beeminder count the words in any publicly accessible URL. It's typically meant for Google Docs, and raw HTML will inflates your word count with every markup tag, but it is accurate with plain-text.

I decided to create an Eleventy function in .11ty.js template format to define a route that isn't backed by a markdown file at all, just a render function returning plain text:

```javascript
export const data = {
  permalink: "urlminder.txt",
  eleventyExcludeFromCollections: true,
};

export function render(data) {
  const notes = (data.collections.notesPublished || []).slice().sort(
    (a, b) => a.date - b.date
  );

  return notes
    .map((note) => {
      const raw = fs.readFileSync(note.inputPath, "utf8");
      const { content } = matter(raw);
      const dateStr = note.date.toISOString().split("T")[0];
      return `## ${note.data.title} (${dateStr})\n\n${content.trim()}\n`;
    })
    .join("\n");
}
```

It reads every published note's raw markdown straight off disk (stripping frontmatter with `gray-matter`) rather than the rendered HTML, concatenates them in date order, and serves the result at `https://brennan.click/urlminder.txt`, which is the URL I pointed my Beeminder goal at.

URLminder-backed goals are [Odometer](https://help.beeminder.com/article/68-odometer-goals) type, meaning the count can only go up. Since `notesPublished` filters out `type: stub` entries, and stubs by definition have no content, the feed only grows as I actually write things!

`templateFormats: ["md", "njk", "11ty.js", "txt"]` in `.eleventy.js` is what makes Eleventy recognize `.11ty.js` and serve the output with a `.txt` extension in the first place.

The Napkin Spec [](#the-napkin-spec)
----------

These were the ideas I wanted to implement with the project:

* Flat namespace of notes, one markdown file per entry, filename = slug = title.
* [[double-bracket]] wiki-links that resolve automatically (and never break, as missing targets will generate stub pages rather than a dead link.)
* Backlinks on every page, automatically generated.
* Transclusion: Hover-to-preview excerpts on outgoing links, and hover-to-reveal footnotes, both with CSS and not JavaScript
* Brutalist design: one column, no breakpoints, [Modern Font Stacks](https://modernfontstacks.com/) for type, Gruvbox for colour as you've come to expect.
* A dedicated /urlminder.txt route that dumps the plain-text markdown source of every published note, so [Beeminder's URLminder](https://help.beeminder.com/article/88-urlminder) can count words written and drive an Odometer goal.
* AGPL-3.0-or-later for the code, CC BY-SA for the writing like all my other projects.

Architecture [](#architecture)
----------

```txt
src/
  notes/          # everything published, flat, one file per entry
  inbox/          # daily freewrite dump, excluded from the build
  _data/          # symbols.js (symbol taxonomy)
  _includes/      # layouts, partials
  assets/css/     # design system
  urlminder.11ty.js
```

The project has one flat `src/notes/` directory, rather than category subfolders. Wiki-links need to resolve to exactly one file by slug, so category lives in a `type` frontmatter field instead of a folder path:

```yaml
---
title:              # optional, overrides the filename-derived title
type: note          # note | quote | bookmark | diary | snippet | stub
symbol: ●           # single Unicode character
date: 2026-07-24
tags: [gruvbox, css]
source_url:         # for quote / bookmark entries
---
```

`type` doubles as an 11ty collection, so I loop over `type_note`, `type_quote`, etc. on the homepage without any extra bookkeeping.

Wiki-Links [](#wiki-links)
----------

The whole point of a digital garden is low-friction cross-referencing, and I decided to use [`@photogabble/eleventy-plugin-interlinker`](https://github.com/photogabble/eleventy-plugin-interlinker) for this. This plugin means that if you write `[[science]]` anywhere in a note, and it resolves to the URL `https://brennan.click/science/`, whether or not `notes/science.md` exists yet.

The plugin exposes a `resolvingFns` map, so you can override how a resolved (or unresolved) link renders. I use it for two things:

1. Rendering a distinct style for broken links, and, for links that *do* resolve
2. Attaching a build-time excerpt of the target note for the hover preview (more on that below):

```javascript
eleventyConfig.addPlugin(EleventyInterlinkerPlugin, {
  defaultLayout: "layouts/stub.njk",
  deadLinkReport: "json",
  resolvingFns: new Map([
    [
      "default",
      async (link) => {
        const title = link.title || link.name;
        if (!link.exists || !link.page) {
          return `<span class="wikilink-wrapper"><a class="wikilink wikilink--broken" href="https://brennan.day/${slugify(link.name)}/">${title}</a></span>`;
        }
        const excerpt = excerptFromFile(link.page.inputPath);
        const preview = excerpt
          ? `<span class="wikilink-preview" aria-hidden="true">${excerpt}</span>`
          : "";
        return `<span class="wikilink-wrapper"><a class="wikilink" href="${link.href}">${title}</a>${preview}</span>`;
      },
    ],
  ]),
});
```

If I have a note that has `[[a link]]` to a page that doesn't exist, `deadLinkReport: "json"` writes it to `.dead-links.json` after building. Then, a script slugifies each broken link name, and creates a minimal `type: stub` file for any that doesn't already exist in `src/notes/`:

```javascript
const slugs = new Set(Object.keys(raw).map(extractSlug).filter(Boolean));

for (const slug of slugs) {
  const filePath = path.join(notesDir, `${slug}.md`);
  if (fs.existsSync(filePath)) continue;
  fs.writeFileSync(filePath, `---\ntype: stub\nsymbol:\ndate: ${today}\n---\n`, "utf8");
}
```

Since a fresh build's link doesn't resolve until the stub file exists on disk, the `npm run build` script has to run Eleventy twice, generating stubs in between:

```json
"build": "eleventy && npm run stubs && eleventy"
```

First pass builds the site and writes `.dead-links.json`. The stub script turns that report into real (if empty) files. Second pass builds again, and now every wikilink resolves to something. No dead links! Stubs are also then flagged as content debt to be filled in later.

### Backlink Generation [](#backlink-generation) ###

Backlinks come from the interlinker plugin as a `backlinks` template variable. Forward links (what a note itself links out to) are obtained by regex-matching the plugin's own `wikilink` CSS class back out of the rendered HTML, as the plugin doesn't expose that list directly:

```javascript
eleventyConfig.addFilter("forwardLinks", (content) => {
  const matches = [
    ...(content || "").matchAll(/<a class="wikilink[^"]*" href="([^"]+)">([^<]*)<\/a>/g),
  ];
  return matches.map(([, href, text]) => ({ url: href, title: text }));
});
```

Both lists render at the bottom of `layouts/note.njk` as a "Links to" / "Linked from" pair.

CSS-only Transclusion and Footnotes [](#css-only-transclusion-and-footnotes)
----------

I wanted hovering over a wiki-link to reveal a snippet of the page it points to, the kind of transclusion preview [Obsidian](https://obsidian.md/) popularized, but without any client-side JavaScript for what's supposed to be a minimal, brutalist site.

AetherAnne, another IndieWeb netizen I deeply admire, wrote up [a tutorial for displaying footnotes](https://aetheranne.ca/blog/tutorials/how-to-display-footnotes-on-hover-without-javascript/) without JS, using the CSS next-sibling combinator: putting the reveal content in a hidden sibling element right after the trigger, then flipping its `display` on `:hover`. I was able to use this solution for transclusion:

```css
.wikilink-wrapper {
  position: relative;
  display: inline-block;
}

.wikilink-preview {
  display: none;
  position: absolute;
  bottom: 100%;
  left: 0;
  max-width: 30ch;
  padding: 0.5rem 0.75rem;
  background: var(--panel);
  border: 1px solid var(--border);
}

.wikilink-wrapper:hover .wikilink-preview,
.wikilink-wrapper:focus-within .wikilink-preview {
  display: block;
}
```

`:focus-within` alongside `:hover` means keyboard users tabbing through links also get the preview, not just mouse users.

The preview text itself is generated at build time, not scraped from the DOM. Each resolved wikilink reads its target file straight off disk, strips markdown syntax and wikilinks down to plain words, and takes the first forty:

```javascript
function excerptFromFile(inputPath, wordLimit = 40) {
  const raw = fs.readFileSync(inputPath, "utf8");
  const { content } = matter(raw);
  const plain = toPlainText(
    content
      .replace(/^#{1,6}\s+/gm, "")
      .replace(/[*_`]/g, "")
      .replace(/\[\[([^\]|]+)(\|([^\]]+))?\]\]/g, (_, name, __, alias) => alias || name)
  );
  const words = plain.split(/\s+/).filter(Boolean);
  return words.slice(0, wordLimit).join(" ") + (words.length > wordLimit ? "…" : "");
}
```

Footnotes use the same hover pattern, but require an extra step. `markdown-it-footnote` renders each footnote's body at the *end* of the token stream, in a `footnote_tail` block, disconnected from the inline `footnote_ref` marker that triggers it. There's no built-in way to grab a footnote's own text from the ref that points to it.

Get the finalized token stream once per document, right after `footnote_tail` runs, and cache each footnote body by id:

```javascript
md.core.ruler.after("footnote_tail", "extract_footnote_contents", (state) => {
  const contents = {};
  let currentId = null;
  let buffer = [];
  for (const token of state.tokens) {
    if (token.type === "footnote_open") {
      currentId = token.meta.id;
      buffer = [];
      continue;
    }
    if (token.type === "footnote_close") {
      contents[currentId] = md.renderer.render(buffer, md.options, state.env);
      currentId = null;
      continue;
    }
    if (currentId !== null && token.type !== "footnote_anchor") {
      buffer.push(token);
    }
  }
  state.env.footnoteContents = contents;
});
```

Then I override the ref renderer to look up that cached content and wrap the superscript in a hidden sibling span, which is AetherAnne's pattern, wired through markdown-it instead of hand-written HTML:

```javascript
md.renderer.rules.footnote_ref = (tokens, idx, options, env, self) => {
  const original = defaultFootnoteRefRender(tokens, idx, options, env, self);
  const id = tokens[idx].meta.id;
  const text = (env.footnoteContents && env.footnoteContents[id]) || "";
  const hidden = `<span class="fn-content" aria-hidden="true">${text}</span>`;
  return `<span class="fn-wrapper">${original}${hidden}</span>`;
};
```

`aria-hidden="true"` on the hidden span keeps screen reader users from sitting through the footnote inline; they still get the normal jump-to-bottom-of-page link the superscript already provides.

Design [](#design)
----------

Once again, I'm not using a CSS framework or preprocessor. `src/assets/css/style.css` is under 320 lines, and the layout is one centered column, `max-width: 50em` to eliminate the need for media queries. I'm also once again using [Modern Font Stacks](https://modernfontstacks.com/) for the fonts:

```css
h1, h2, h3, h4, h5, h6 {
  font-family: 'Iowan Old Style', 'Palatino Linotype', 'URW Palladio L', P052, serif;
}

body {
  font-family: ui-monospace, 'Cascadia Code', 'Source Code Pro', Menlo, Consolas,
    'DejaVu Sans Mono', monospace;
}

/* Gruvbox Palette */

:root {
  --bg: #fbf1c7;
  --fg: #3c3836;
  --link: #076678;
}

@media (prefers-color-scheme: dark) {
  :root {
    --bg: #282828;
    --fg: #ebdbb2;
    --link: #83a598;
  }
}
```

### Symbols [](#symbols) ###

I wrote a couple weeks ago about [using ASCII symbols for organization](https://brennan.day/blogging-with-magic-unicode-simple-doesnt-have-to-mean-boring/) on a blog as a fast, simple alternative to heavy SVG icon sets. I figured this project would be a perfect use-case for this.

Each note `type` (`note`, `quote`, `bookmark`, `diary`, `snippet`, `stub`) gets an accent colour and Unicode symbol, defined once in `src/_data/symbols.js`. The specific symbols I'm using are not at all set in stone, and I need to use this for awhile to get a feel for what actually makes sense.

|  type  |symbol|          rationale           |
|--------|------|------------------------------|
| quote  |  \>  |     classic quote symbol     |
|bookmark|  ⚹   |       reads as starred       |
|  note  |  ●   |    generic filled circle     |
| diary  |  🜁   |          air symbol          |
|snippet |  🜃   |         earth symbol         |
|  stub  |  ☉   |empty circle, nothing here yet|

```javascript
export default {
  quote: { symbol: ">", class: "sym--quote", label: "quote" },
  bookmark: { symbol: "⚹", class: "sym--bookmark", label: "bookmark" },
  note: { symbol: "●", class: "sym--note", label: "note" },
  diary: { symbol: "🜁", class: "sym--diary", label: "diary" },
  snippet: { symbol: "🜃", class: "sym--snippet", label: "code snippet" },
  stub: { symbol: "☉", class: "sym--stub", label: "stub" },
};
```

Sorting the Inbox [](#sorting-the-inbox)
----------

I realize that getting into the routine of adding to this project may be cumbersome at first, so I decided to add a GTD-style brain dump inbox. The daily-minimum version of "adding content" is just opening `src/inbox/` (excluded from the build via `.eleventyignore`) and dumping a thought, no frontmatter, no formatting, then committing. That keeps the Beeminder goal alive on busy days.

I can then go through inbox fragments, classify what `type` each is and assign a `symbol` from the taxonomy table, write out proper frontmatter and a slug, add `[[wikilinks]]` to anything that already exists as a note, and create a new file for it at `src/notes/<slug>.md`, then clear it out of the inbox.

Parting Words [](#parting-words)
----------

The double-build (`eleventy && npm run stubs && eleventy`) is a little inelegant, and every build is slower as a result. A single-pass version would need the interlinker plugin to accept a "create the file for me" resolving function rather than just reporting dead links, which isn't something the plugin exposes. This isn't going to be a big deal until the site gets large, and at that point I might just roll my own custom plugin for this.

It's really fun to find a small, personal problem and let the constraints of the smallweb do the work of keeping the scope feasible.

You may be surprised given my recent [criticisms of PKMs](https://brennan.day/what-have-note-taking-pkms-accomplished-really/), but the truth is I've always wanted to have a digital garden. I have a habit of being able to recall and juggle many things in my mind for writing, but it would be great to properly collect and organize interesting things I find, but the workflow never stuck with me. I hope that this project, in conjunction with Beeminder's accountability, will finally make the workflow stick!

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