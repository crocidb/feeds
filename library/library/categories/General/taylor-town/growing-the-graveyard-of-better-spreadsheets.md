+++
title = 'growing the graveyard of "better spreadsheets"'
description = "spreadsheets remain popular for good reasons"
date = "2024-09-14T00:00:00Z"
url = "https://taylor.town/better-spreadsheets"
author = "Taylor Troesh"
text = ""
lastupdated = "2026-04-20T13:20:40.262129793Z"
seen = true
+++

![](https://taylor.town/scrapsheets-mock-1.png)

* [the promise of spreadsheets](#promise)
* [the problem with spreadsheets](#problem)
* [my proposal for spreadsheets](#proposal)

the promise of spreadsheets
----------

[VisiCalc](https://en.wikipedia.org/wiki/VisiCalc) transformed the Apple II from toy to tool. Spreadsheets were the first Killer App.

Modern descendants (e.g. Microsoft Excel, Google Sheets) remain popular for good reasons:

1. humans have loved ledgers/tables for milennia; they seem to suit our brain circuitry well
2. maintaining direct manipulation affords an easy barrier-to-entry
3. there are very few ways to regularly tile a plane; grids are one such way to organize information densely
4. regular tiling produces a coordinate system with addresses, which allows for indirect manipulation via keyboard (or formulas)
5. cells are type-agnostic -- interspersed numbers/text can flexibly communicate information across domains
6. visual density encourages formulas to stay small; because chunked recalculation is cheap, spreadsheets can compile instantly/automatically
7. quick recompilation produces tight feedback loops; spreadsheets feel reactive/responsive even on limited hardware
8. lack of hidden state and side-effects makes for straightforward multiplayer experience (e.g. via CRDTs)

the problem with spreadsheets
----------

 I highly recommend watching Emery Berger's [Saving the World from Spreadsheets](https://www.youtube.com/watch?v=GyWKxFxyyrQ). It details the spread and severity of spreadsheet errors, along with an overview of [ExceLint's](https://github.com/ExceLint/ExceLint) genius internals.

To dethrone Excel/Sheets, one must (1) seriously improve the spreadsheet design (2) without violating all of the synergetic principles that make them so delightful.

With that in mind, I'm going to list my gripes with modern spreadsheets:

* **scalar formula outputs:** I want to multiply matrices, join tables, compare datasets, etc. These operations *produce* 2D data, which does not fit nicely into single formula cells.
* **siloed datasets:** Every spreadsheet program should have one-click access to free/paid datasets across the internet (with live updates) -- every table on Wikipedia, every dump on Kaggle, every CSV on Github, etc.
* **rampant errors:** [Spreadsheet errors are serious business.](https://www.researchgate.net/publication/228662532_What_We_Know_About_Spreadsheet_Errors) Many basic errors could be prevented by (1) embedding intent into UI actions for better automated checking, (2) discouraging manual data-entry, (3) constraining values, (4) reducing data pre-processing, (5) defaulting to live/external sources-of-truth.
* **skill ceiling:** Without a "true" embedded programming language, spreadsheets depend on export/import for "difficult" problems. This creates an artificial skill cap for naturally advanced users.
* **weak formulas:** Let me run arbitrary programs in every cell! I'll run a computer vision algorithm in there if I damn well please. Everybody hates exporting CSVs to non-domain-expert programmers to do simple stuff in R/Python/Mathematica.
* **simplistic data types:** Images, 3D models, audio -- cells could be so much more than text/numbers.
* **"throw-away" formulas:** Important formulas are shared via copy/paste. Further edits/improvements to each formula are siloed rather than shared.
* **async programming:** Almost everything I want in spreadsheets starts with an HTTP request or an SQL query. Let's build that functionality into the spreadsheet! I don't want to build an ad-hoc data pipeline to fetch the latest numbers.
* **missing input controls:** Throw some sliders and checkboxes in there!
* **cascading "Tetris" problems:** When 2+ tables share a spreadsheet, moving/splicing data becomes painful. There should probably be some means of arranging independent tabular units.
* **inviable on small screens:** Have you ever tried to look at a spreadsheet on your phone?

my proposal for spreadsheets
----------

I'm currently working on a thing called "scrapsheets", which will hopefully grow into a Killer App for [my weird programming language](https://scrapscript.org).

[My first attempt at scrapsheets](https://taylor.town/live-2024-cfp) was a great learning experience. It was crappy in very interesting ways; I'm much more confident entering my second try at "better spreadsheets":

* **"real" programming language:** [Scrapscript](https://scrapscript.org) is a "real" programming language (coming soon!) and data serialization format. Scrapsheets is a "real" programming environment for productive programmers.
* **leverage relational language:** Scrapsheet's embedded DSL borrows heavily from SQL. Find your inner join!
* **shared code & datasets:** All formulas/datasets pushed to the scrapyard are forever usable by all other scrapsheets users. Furthermore, [code is data and data is code](https://en.wikipedia.org/wiki/Code_as_data).
* **types and tags:** Scrapscript's strict type system constrains data, while [GADTs](https://en.wikipedia.org/wiki/Generalized_algebraic_data_type) communicate intent.
* **compose columns:** Spreadsheets can be assembled from typed columns. To emulate Excel/Sheets, use text/number columns everywhere.
* **arrays over scalars:** To take pages from the [array-oriented languages](https://en.wikipedia.org/wiki/Array_programming), *groups* of things should supercede individual values. In scrapsheets, all formulas produce tables/matrices.
* **"masonry" layout:** Strongly-typed columns make for inflexible tables -- so the tables must become atomic targets for arrangement. A "brick wall" of draggable tables offers an intuitive workaround.
* **embrace async:** By combining modular async tables, different units of the spreadsheet can load/reload independently.
* **for small screens too:** By restricting the masonry layout to 4 columns, mobile-friendly design is straightforward via a zoom-to-table interface.
* **BYOD:** Render everything!
* **colocate code:** To reduce the amount of hidden state, we can colocate the scrapscript programs next to their tables in the masonry layout.

Many of these features fall naturally out of my general design/architecture:

* The scrapsrcipt code that generates a table sits in a drawer under the table.
* Source tables are mainly constructed via column literals and decoders. More tables can be derived via relational operations (e.g. joins, filters).
* Tables may reference external sources, e.g. databases, web pages, CSV files.
* A tables may reference other tables in the sheet. When those tables are updated, the changes cascade through dependent tables.
* Each table can be dragged/resized within the 4-column grid on each shelf.

All of this can be expressed succinctly via something I'm calling "reactive relational algebra", which is really just normal relational algebra plus time and self-reference. I'll save that for a follow-up post.

Anyway, I'll be demoing scrapsheets at [LIVE 2024](https://liveprog.org) next month! Expect the codebase to be published somewhere online in the coming weeks.

I really hope scrapsheets is good enough to keep investing in, but I'm also mentally prepared for scrapsheets to become another grave in the "better spreadsheet" cemetery. Hey, at least we'll learn something!