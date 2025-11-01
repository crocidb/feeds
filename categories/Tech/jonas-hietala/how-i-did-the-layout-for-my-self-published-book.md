---
title = "How I did the layout for my self-published book"
description = "This is a rundown of how I typeset and laid out my self-published book for the web version, the EPUB version, and the printed version.I was planni"
date = "2024-07-17T19:35:07Z"
url = "http://jonashietala.se/blog/2024/02/17/how_i_did_the_layout_for_my_self-published_book/index.html"
author = "Jonas Hietala"
text = ""
lastupdated = "2025-10-22T08:58:11.262755967Z"
seen = true
---

This is a rundown of how I typeset and laid out my self-published book for the [web version](https://whycryptocurrencies.com/toc.html), the [EPUB version](https://buy.whycryptocurrencies.com/download), and the [printed version](https://whycryptocurrencies.com/#print).

I was planning to include many more details, but the project took a lot longer than planned so I’ve forgotten some things.

[Web page](#Web-page)
----------

I started by creating the book in a web format. It’s a static site generator that simply outputs HTML with some custom CSS styling to make it look pretty. I wrote a separate post on [how I wrote a book with Pollen](/blog/2020/05/03/how_i_wrote_my_book_using_pollen/), check it out if you want more details.

As I’ve become more proficient with CSS, I would’ve used Flexbox and Grid instead of floats and other hacks. Still, I’m quite pleased with how it looks even though I’d rather not look at the implementation.

I’m absolutely no CSS or design wizard, I just spent quite some time tweaking until I ended up with something decent (I guess design is simple, but not easy).

[EPUB](#EPUB)
----------

The initial plan was to use Pollen to generate both the web and eBook version from the same source. This is supported in Pollen by branching in the output functions, for example this emphasis function [from the tutorial](https://docs.racket-lang.org/pollen/fourth-tutorial.html):

```
(define (emph . elements)
  (case (current-poly-target)
    [(txt) `("**" ,@elements "**")]
    [else (txexpr 'strong empty elements)]))

```

Unfortunately, I didn’t do this from the beginning and I wanted to create an EPUB after the book, and all the functions, had already been made.

I could of course go back and modify them all, but it was much faster to just branch the repo and modify the webpage until it produced a valid EPUB. Hardly ideal, but it actually wasn’t as bad as it may sound.

Check out the [epub3 branch](https://github.com/treeman/why_cryptocurrencies/tree/epub3) on GitHub for the complete source for the EPUB.

### [Creating an EPUB](#Creating-an-EPUB) ###

There are many EPUB generators out there, but those I tried didn’t produce very pretty books (in many cases the results were quite bad). But an EPUB is merely XHTML with some extra files, so it’s fairly straightforward to create one by hand.

There is an [EPUB 3 specification](https://www.w3.org/TR/epub-33/) one can reference, but I’ve always found that it’s much easier to get going by [looking at examples](https://github.com/IDPF/epub3-samples).

For my book, this is how the file structure ended up in the EPUB:

```
├── META-INF
│   ├── container.xml
│   └── encryption.xml
├── OEBPS
│   ├── content.opf
│   ├── main.css
│   ├── toc.ncx
│   ├── fonts
│   │   └── ...
│   ├── images
│   │   ├── emission-rates-fallback.png
│   │   ├── emission-rates.svg
│   │   ├── generals.png
│   │   └── ...
│   ├── how_do_cryptocurrencies_work.xhtml
│   └── ...
└── mimetype

```

The `.epub` file itself is just a zip of the above, with the mimetype first in the archive:

```
#!/bin/bash

cd _ebook/
zip -X0 why_cryptocurrencies.epub mimetype
zip -Xur9D why_cryptocurrencies.epub *

```

If you want to take a closer look, you can [download the EPUB for free](https://buy.whycryptocurrencies.com/download) and unzip it.

The `mimetype` contains the mimetype (without a trailing newline):

```
application/epub+zip

```

The entry-point to everything is the `META-INF/container.xml` file that simply redirects us to `OEBPS/content.opf`:

```
<?xml version="1.0"?>
<container version="1.0" xmlns="urn:oasis:names:tc:opendocument:xmlns:container">
    <rootfiles>
        <rootfile full-path="OEBPS/content.opf" media-type="application/oebps-package+xml"/>
   </rootfiles>
</container>

```

We don’t have to use the `OEBPS/` directory, but most of the examples I looked at used it so I ran with it. Maybe it’s some kind of standard or something, I don’t know.

`content.opf` contains what you think it does: all the content for the book:

```
<?xml version="1.0" encoding="UTF-8"?>
<package xmlns="http://www.idpf.org/2007/opf" unique-identifier="pub-identifier" version="3.0" xml:lang="en">
    <metadata xmlns:dc="http://purl.org/dc/elements/1.1/" xmlns:opf="http://www.idpf.org/2007/opf">
        <!-- There are other meta fields you want to set, this is just an example -->
        <dc:title id="title">Why Cryptocurrencies?</dc:title>
        <meta refines="#title" property="title-type">main</meta>
        <!-- Sets the cover page that shows up in EPUB readers -->
        <meta name="cover" content="images-cover-front" />
        <!-- With EPUB 3 you can also create fixed layouts.
             My EPUB tries to mimic the reflowable web version,
             although you could bundle both in the same EPUB file if you wanted to. -->
        <meta property="rendition:layout">reflowable</meta>
        <meta property="rendition:flow">scrolled-doc</meta>
        ...
    </metadata>
    <manifest>
        <!-- The .ncx file is a deprecated file that EPUB 3 readers should ignore,
             but it may be included to help EPUB 2 readers understand the file.
             Instead the <spine> element is used to describe the reading order of the book.
             I won't describe the file more, if you're curious download the epub and crack it open. -->
        <item id="ncx" href="toc.ncx" media-type="application/x-dtbncx+xml" />
        <item id="style" href="main.css" media-type="text/css" />

        <!-- Every chapter in the book has its own .xhtml file. -->
        <item id="how_do_cryptocurrencies_work" href="how_do_cryptocurrencies_work.xhtml" media-type="application/xhtml+xml" />
        ...

        <!-- All images needs its own entry too. -->
        <item id="images-generals" href="images/generals.png" media-type="image/png"  />
        <!-- This is the cover reference defined earlier in the <metadata> section. -->
        <item id="images-cover-front" href="images/cover/front.png" media-type="image/png"  properties="cover-image"/>
        <!-- Svg images should specify a png fallback. -->
        <item id="images-emission-rates" href="images/emission-rates.svg" media-type="image/svg+xml" fallback="images-emission-rates-fallback" />
        <item id="images-emission-rates-fallback" href="images/emission-rates-fallback.png" media-type="image/png" />
        ...

        <!-- And the fonts needs to be specified as well. -->
        <item id="century_supra_a_regular" href="fonts/century_supra_a_regular.woff2" media-type="application/font-woff" />
        ...
    </manifest>
    <spine toc="ncx">
        <!-- The spine contains the default reading order of chapters
             (or "items", they don't have to be chapters). -->
        <itemref idref="coverpage" />
        <itemref idref="titlepage" linear="yes" properties="page-spread-left"/>
        <itemref idref="dedication" linear="yes" properties="page-spread-right"/>
        <itemref idref="acknowledgements" linear="yes" properties="page-spread-right"/>
        <itemref idref="toc"  properties="page-spread-right"/>
        <itemref idref="about_the_book" properties="page-spread-right"/>
        <itemref idref="eli5" properties="page-spread-right"/>
        ...
    </spine>
</package>

```

There’s also font “encryption” via `encryption.xml` (which is only obfuscation) that I had to use because of the license of the fonts I use, but generally it’s not needed.

And that’s basically all an EPUB is. I used a very hacky [Python script](https://github.com/treeman/why_cryptocurrencies/blob/epub3/ebookify) to move the files into position, generate the spine, image items, and the other stuff I alluded to above.

Why did I write that in Python instead of in Racket, which the rest of the book made with? I really have no idea…

### [Styling](#Styling) ###

I had an incredibly frustrating experience trying to style the EPUB to match the web version, with matching spacing, typeset, sidenotes, and the rest. It felt that whatever I tried, every reader would just ignore all the styling and fall back to their own and—in my opinion—horrible appearance.

I even gave up on the eBook for a time because of it.

But then I noticed I had made an EPUB 2 instead of an EPUB 3, and with the newer version all styling worked with little modification. This of course depends on the EPUB reader, but there’s not much I can do about that:

[![](/images/crypto_readers/ReadEra.png)](/images/crypto_readers/ReadEra.png) [![](/images/crypto_readers/eBoox.png)](/images/crypto_readers/eBoox.png) [![](/images/crypto_readers/lithium.png)](/images/crypto_readers/lithium.png)

Different Android readers (ReadEra, eBoox, and Lithium) renders the EPUB very differently. Unfortunately, the EPUB won’t look great on all readers.

### [Validating](#Validating) ###

With the EPUB created, you should validate it. The commonly recommended [idpf validator](http://validator.idpf.org/) seems to be down, I instead used [epubcheck](https://github.com/w3c/epubcheck) I found on github.

Turns out I had a few errors in my EPUB:

```
$ java -jar epubcheck.jar ~/code/why_cryptocurrencies/_ebook/why_cryptocurrencies.epub
Check finished with errors
Messages: 2 fatals / 2183 errors / 2 warnings / 0 infos

```

And this was after I had made a bunch of corrections. Sigh…

Fixing them was annoying and time consuming, but it wasn’t hard. Most of them were easily fixed by updating the templates and tag generation within Pollen.

Errors I ran into includes xhtml being more strict than html, so I couldn’t nest an `<aside>` inside a `<li>`, leading to a nice big refactor of my sidenote generation code.

Another error pointed out that I had to provide `.png` fallbacks for all `.svg` images. With the [fish shell](https://fishshell.com/) and [inkscape](https://inkscape.org/) you can mass convert images like so:

```
for file in *.svg
    inkscape -w 1024 $file --export-filename (basename $file .svg)-fallback.png
end

```

And then specify the fallback in `content.opf` as shown before.

[Physical book](#Physical-book)
----------

The initial idea was, again, to use Pollen to create the book. I wanted to use Pollen to generate Latex that could produce the PDF I wanted.

But that’s not the route I went with. Similar to how it was a big challenge to get Pollen to produce an EPUB version in conjunction to a regular HTML version, making it produce a Latex variant was a big task. In addition, making Latex reproduce my sidenote styling and placement wasn’t at all straightforward (maybe I just suck at Latex).

I instead laid out the PDF with [InDesign](https://www.adobe.com/products/indesign.html). It required more manual tweaks that I really didn’t enjoy, but on the flip side it was very easy to make manual adjustments to get the layout *just* right.

### [XML importer](#XML-importer) ###

Of course, we don’t want to manually copy-paste the whole book, that would be silly. InDesign has an XML importer that we can use to import the book, and if we setup styles to automatically apply to certain elements (such as `<aside>` sidenotes) you get quite a lot of help.

Yes, it’s buggy and not well documented, but it’s still a life-saver.

![](/images/crypto_indesign/references.png) I had to style the references manually because the importer messed them up…

### [Styles](#Styles) ###

To work effectively with InDesign I found that effective use of styles is a must. The most important part of laying out my book was getting sizing and spacing right, and to do that you setup styles for the different cases and apply them (mostly to paragraphs).

Lots of people love to rag on CSS, but CSS is very powerful and it’s relatively simple to for example style a list, with proper spacing before, after, and between elements and text just the way you want it. With InDesign this wasn’t nearly as straightforward, and I ended up with several styles I had to apply depending on the surrounding context:

![](/images/crypto_indesign/list_paragraph_styles.png) I ended up with quite a few paragraphs related to lists. The first and last paragraph needed special handling because the spacing was slightly different in order to play nice with other styles. Then there’s “multi” that contains multiple paragraphs in one list item, nested lists, and different types of lists…

All this just to get consistent spacing for my various lists.

![](/images/crypto_indesign/styled_lists_spread.png) I think the lists look nice and are very readable.

### [Lots of manual tweaks](#Lots-of-manual-tweaks) ###

Most of the time what I did in InDesign is read through the book to make small adjustments. I adjusted sidenote placements, tweaked styles here and there, adjusted page breaks to balance pages, adjusted paragraphs, added index references… And then I did it all over again.

Yes it’s time consuming and annoying, but also weirdly therapeutic. I could satisfy my need for perfection by nudging text boxes around until the end of time.

![](/images/crypto_indesign/boxes_laid_out.png) Who needs therapy when you can lay out boxes?

### [Printed books have certain expectations](#Printed-books-have-certain-expectations) ###

If you upload a book on a website, or even if you create an EPUB, you can almost do whatever you want and it’ll probably be fine. But printed books has certain expectations that should be followed.

For example how a new chapter or section should start on a new page to the right, and leave the left page blank if needed. Or how chapters and sections next to page numbers on the bottom can help you navigate a technical book such as mine. These are things you don’t really notice, unless you come across a book without them. (Fiction has other expectations because you don’t jump around when you read.)

One thing that’s easy to forget about in the internet age the **index** you can find at the end of many books. It’s designed to help you easily find things in the book, sort of like a curated search engine, but on paper.

![](/images/crypto_indesign/index.png) A correctly structured index is invaluable. Mine at least exists.

Designing a good index is hard, because it’s not about listing all keywords in the book. It’s about anticipating the needs of the reader, so someone searching for “Bitcoin” may be redirected to the chapter [How do cryptocurrencies work?](https://whycryptocurrencies.com/how_do_cryptocurrencies_work.html), even though Bitcoin isn’t singled out in the chapter (it discuses cryptocurrencies in general).

The index also acts as a sort of overview of what topics are discussed. (Aren’t you curious why [Dakota Skye is mentioned in the index](https://whycryptocurrencies.com/undesirable_businesses.html)?)

This seems difficult to do well—and I probably failed hard—but I tried.

[What I’d do differently](#What-Id-do-differently)
----------

If I would write a book again, I would try to do what I wanted to in the first place: generate all versions from a single source.

I wouldn’t have used [Pollen](https://docs.racket-lang.org/pollen/index.html). While it feels really nice to be able to inject code anywhere in your markup, having to maintain 3 different outputs with every function you write is a bit much.

Instead I’d try some kind of standard markup format with preexisting EPUB and PDF generation. I could still set it up to have custom transformations, but it would be so much easier to work with compared to programming the generation completely by myself.

Working with InDesign was actually fine, but keeping the different versions in sync was difficult, so it would still be beneficial to cut it out from the process if possible.

But I’d still want to do the layout myself. It didn’t feel difficult, I mostly enjoyed the process, and I think the result was quite good.

The boxes don’t nudge themselves you know?