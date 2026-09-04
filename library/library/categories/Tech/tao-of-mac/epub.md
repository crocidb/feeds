+++
title = "EPUB"
description = "EPUB is an open W3C format for distributing digital publications as a single file. It packages structured web content–primarily XHTML, [CSS](/space/mark"
date = "2026-08-08T12:00:00Z"
url = "https://taoofmac.com/space/markup/epub?utm_content=atom"
author = "Rui Carmo"
text = ""
lastupdated = "2026-08-10T12:13:33.794002630Z"
seen = false
+++

[EPUB](https://www.w3.org/TR/epub-33/?utm_campaign=unsolicited_traffic&utm_medium=web&utm_source=taoofmac.com) is an open W3C format for distributing digital publications as a single file. It packages structured web content–primarily [XHTML](/space/markup/html), [CSS](/space/markup/css), [SVG](/space/markup/svg#scalable-vector-graphics), images and fonts–with metadata, navigation and a defined reading order.

Most EPUB publications are reflowable, allowing a reading system to adapt text to the screen and the reader’s font, spacing and colour preferences. The format also supports fixed layouts, media overlays, scripting, page lists and landmarks, but readers implement those features inconsistently.

[

Container and Publication Structure
----------

](/space/markup/epub#container-and-publication-structure)

An `.epub` file is an Open Container Format ZIP archive with the media type `application/epub+zip`. Its root `mimetype` file identifies the format, and `META-INF/container.xml` points to the package document.

The package document contains the publication metadata, a manifest of resources and a spine that defines the default reading order. A separate XHTML navigation document provides the table of contents and can also include page and landmark navigation.

[

Versions and Compatibility
----------

](/space/markup/epub#versions-and-compatibility)

[EPUB 3.3](https://www.w3.org/TR/epub-33/?utm_campaign=unsolicited_traffic&utm_medium=web&utm_source=taoofmac.com) is the W3C Recommendation as of 13 January 2026. It retains the EPUB 3 package version value `3.0` and supersedes the EPUB 2 specifications. The companion [Reading Systems specification](https://www.w3.org/TR/epub-rs-33/?utm_campaign=unsolicited_traffic&utm_medium=web&utm_source=taoofmac.com) requires readers to attempt to process older publications.

EPUB 2 remains common in older libraries and devices. Its NCX table of contents and other legacy package features can be included in EPUB 3 files for compatibility, but new publications should use the EPUB 3 navigation document and current metadata model.

[

Accessibility
----------

](/space/markup/epub#accessibility)

EPUB content uses the accessibility semantics of XHTML, SVG and related web standards. [EPUB Accessibility 1.1](https://www.w3.org/TR/epub-a11y-11/?utm_campaign=unsolicited_traffic&utm_medium=web&utm_source=taoofmac.com) adds publication-wide conformance and discoverability requirements, including accessibility metadata, logical reading order and navigation.

[EPUBCheck](https://github.com/w3c/epubcheck?utm_campaign=unsolicited_traffic&utm_medium=web&utm_source=taoofmac.com) verifies format conformance, and [Ace by DAISY](https://daisy.github.io/ace/?utm_campaign=unsolicited_traffic&utm_medium=web&utm_source=taoofmac.com) reports many accessibility issues. Complete validation also requires testing the publication with representative reading systems and assistive technology.

[

DRM and Interoperability
----------

](/space/markup/epub#drm-and-interoperability)

EPUB itself does not require digital rights management. Its container supports encryption metadata, but distributors apply mutually incompatible commercial DRM schemes. Those schemes can block copying, text-to-speech or transfer between reading systems even when the underlying EPUB is valid.

DRM-free publications can still render differently because reading systems vary in CSS, font, scripting, fixed-layout and media support. Reflowable XHTML with conservative CSS works across the widest range of readers.

[

Authoring and Validation
----------

](/space/markup/epub#authoring-and-validation)

[Calibre](/space/apps/calibre) can convert, inspect and manage EPUB files, while [Sigil](/space/apps/sigil) edits the package and its content directly. A publishing workflow should run EPUBCheck after every structural change, then use Ace and manual accessibility testing.

Since an EPUB is a ZIP archive, ordinary archive tools are useful for inspection, but repackaging must preserve the OCF rules–in particular, `mimetype` must be the first entry and must remain uncompressed.

[

Finding Books
----------

](/space/markup/epub#finding-books)

[Standard Ebooks](https://standardebooks.org?utm_campaign=unsolicited_traffic&utm_medium=web&utm_source=taoofmac.com) publishes free, carefully produced public-domain books in EPUB format, with consistent typography, metadata and compatibility across reading systems.

[

Resources
----------

](/space/markup/epub#resources)

|                                                              Category                                                               |                                                                Date                                                                 |                                                               Link                                                               |                                               Notes                                               |
|-------------------------------------------------------------------------------------------------------------------------------------|-------------------------------------------------------------------------------------------------------------------------------------|----------------------------------------------------------------------------------------------------------------------------------|---------------------------------------------------------------------------------------------------|
|                                                             Collections                                                             |                                                                2025                                                                 |      [Standard Ebooks](https://standardebooks.org?utm_campaign=unsolicited_traffic&utm_medium=web&utm_source=taoofmac.com)       |                    free, carefully produced public-domain books in EPUB format                    |
|                                                               Guides                                                                |                                                                2025                                                                 |[EPUB 3 Overview](https://www.w3.org/TR/epub-overview-33/?utm_campaign=unsolicited_traffic&utm_medium=web&utm_source=taoofmac.com)|                               non-normative introduction to EPUB 3                                |
|                                                              Libraries                                                              |                                                                2026                                                                 |    [fast-ebook](https://github.com/arc53/fast-ebook?utm_campaign=unsolicited_traffic&utm_medium=web&utm_source=taoofmac.com)     |Rust-powered Python library for reading, writing, validating and converting EPUB 2 and EPUB 3 files|
|                                                               Readers                                                               |                                                                2024                                                                 |    [Foliate](https://johnfactotum.github.io/foliate/?utm_campaign=unsolicited_traffic&utm_medium=web&utm_source=taoofmac.com)    |                             ebook reader for Linux with EPUB support                              |
|                                                                2011                                                                 |           [pPub](https://github.com/sakisds/pPub?utm_campaign=unsolicited_traffic&utm_medium=web&utm_source=taoofmac.com)           |                                                     Python-based EPUB reader                                                     |                                                                                                   |
|                                                           Specifications                                                            |                                                                2026                                                                 |        [EPUB 3.3](https://www.w3.org/TR/epub-33/?utm_campaign=unsolicited_traffic&utm_medium=web&utm_source=taoofmac.com)        |                             W3C authoring and container specification                             |
|                                                                2024                                                                 |[EPUB Accessibility 1.1](https://www.w3.org/TR/epub-a11y-11/?utm_campaign=unsolicited_traffic&utm_medium=web&utm_source=taoofmac.com)|                                    accessibility conformance and discoverability requirements                                    |                                                                                                   |
|[EPUB Reading Systems 3.3](https://www.w3.org/TR/epub-rs-33/?utm_campaign=unsolicited_traffic&utm_medium=web&utm_source=taoofmac.com)|                                      processing and rendering requirements for reading systems                                      |                                                                                                                                  |                                                                                                   |
|                                                                Tools                                                                |                                                              {date:%Y}                                                              |                                                  [Calibre](/space/apps/calibre)                                                  |                           library management, conversion and inspection                           |
|                                                     [Sigil](/space/apps/sigil)                                                      |                                                             EPUB editor                                                             |                                                                                                                                  |                                                                                                   |
|                                                             Validation                                                              |                                                              {date:%Y}                                                              |       [Ace by DAISY](https://daisy.github.io/ace/?utm_campaign=unsolicited_traffic&utm_medium=web&utm_source=taoofmac.com)       |                       automated accessibility checker for EPUB publications                       |
|        [EPUBCheck](https://github.com/w3c/epubcheck?utm_campaign=unsolicited_traffic&utm_medium=web&utm_source=taoofmac.com)        |                                                  official EPUB conformance checker                                                  |                                                                                                                                  |                                                                                                   |