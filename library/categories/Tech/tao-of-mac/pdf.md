+++
title = "PDF"
description = "The Portable Document Format developed by Adobe - essentially Encapsulated PostScript with a few indexing,crypt"
date = "2006-10-10T20:46:17Z"
url = "https://taoofmac.com/space/com/adobe/pdf?utm_content=atom"
author = "Rui Carmo"
text = ""
lastupdated = "2026-06-29T12:19:41.711583396Z"
seen = false
+++

The Portable Document Format developed by [Adobe](http://en.wikipedia.org/wiki/Adobe_Systems?utm_source=taoofmac.com&utm_medium=web&utm_campaign=unsolicited_traffic&utm_content=external_link) - essentially Encapsulated [PostScript](/space/dev/postscript) with a few indexing,crypto and security features thrown in.

[

Resources
----------

](/space/com/adobe/pdf#resources)

|                                                                                  Date                                                                                   |                                                                                       Link                                                                                        |                                                               Notes                                                                |
|-------------------------------------------------------------------------------------------------------------------------------------------------------------------------|-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|------------------------------------------------------------------------------------------------------------------------------------|
|                                                                               2026-06-20                                                                                |       [make-look-scanned](https://github.com/overflowy/make-look-scanned?utm_source=taoofmac.com&utm_medium=web&utm_campaign=unsolicited_traffic&utm_content=external_link)       |a CLI and browser/WASM tool that degrades PDFs to mimic physical scans, adding skew, grain, blur, shadows, and compression artifacts|
|                                                                               2026-03-01                                                                                |          [markdown-to-pdf](https://github.com/speajus/markdown-to-pdf?utm_source=taoofmac.com&utm_medium=web&utm_campaign=unsolicited_traffic&utm_content=external_link)          |              Markdown-to-PDF pipeline implemented in TypeScript so you can render PDFs without spinning up a browser.              |
|                                                                               2026-02-28                                                                                |                [vmprint](https://github.com/cosmiciron/vmprint?utm_source=taoofmac.com&utm_medium=web&utm_campaign=unsolicited_traffic&utm_content=external_link)                 |  A pure-JS, zero-dependency typesetting engine that renders bit-perfect PDFs across any runtime without needing Headless Chrome.   |
|                                                                               2025-12-26                                                                                |                [OCRmyPDF](https://github.com/ocrmypdf/OCRmyPDF?utm_source=taoofmac.com&utm_medium=web&utm_campaign=unsolicited_traffic&utm_content=external_link)                 |                                              adds an OCR text layer to scanned PDFs.                                               |
|                                                                               2024-11-24                                                                                |                          [PDFify](https://pdfify.app?utm_source=taoofmac.com&utm_medium=web&utm_campaign=unsolicited_traffic&utm_content=external_link)                           |                                       A Mac app to create searchable PDFs with OCR support.                                        |
|                                                                               2006-07-09                                                                                |                        [epub2pdf](http://epub2pdf.com/?utm_source=taoofmac.com&utm_medium=web&utm_campaign=unsolicited_traffic&utm_content=external_link)                         |                                              A Java tool to output EPUB files to PDF.                                              |
|                                                                               2006-05-02                                                                                |                      [Tabbloid](http://www.tabbloid.com/?utm_source=taoofmac.com&utm_medium=web&utm_campaign=unsolicited_traffic&utm_content=external_link)                       |                            An interesting service that takes RSS feeds and e-mails you a PDF magazine.                             |
|                                                                               2005-01-01                                                                                |                                                         [Multivalent PDF Tools](/space/SourceForge:projects/multivalent/)                                                         |                                                          written in Java                                                           |
|                                                         [PDF Creator](/space/SourceForge:projects/pdfcreator/)                                                          |                                                                                                                                                                                   |                                                                                                                                    |
|     [Foxit PDF Viewer](http://foxitsoftware.com/pdf/rd_intro.php?utm_source=taoofmac.com&utm_medium=web&utm_campaign=unsolicited_traffic&utm_content=external_link)     |                             very fast, very small, somewhat buggy image display and font rendering. Lets you remove *all* toolbars, advertising, etc.                             |                                                                                                                                    |
|            [RedMon](http://www.cs.wisc.edu/~ghost/redmon/?utm_source=taoofmac.com&utm_medium=web&utm_campaign=unsolicited_traffic&utm_content=external_link)            |                                                                       The ancient Windows print redirector                                                                        |                                                                                                                                    |
|                  [CutePDF](http://www.cutepdf.com/?utm_source=taoofmac.com&utm_medium=web&utm_campaign=unsolicited_traffic&utm_content=external_link)                   |                                                     works properly under Terminal Services, Citrix, etc. (my current choice)                                                      |                                                                                                                                    |
|                     [FPDF](http://www.fpdf.org/?utm_source=taoofmac.com&utm_medium=web&utm_campaign=unsolicited_traffic&utm_content=external_link)                      |a PHP class to generate PDFs (Ruby [port](http://zeropluszero.com/software/fpdf?utm_source=taoofmac.com&utm_medium=web&utm_campaign=unsolicited_traffic&utm_content=external_link))|                                                                                                                                    |
|                 [Primo PDF](http://www.primopdf.com/?utm_source=taoofmac.com&utm_medium=web&utm_campaign=unsolicited_traffic&utm_content=external_link)                 |                                                           doesn’t work properly under Terminal Services for some reason                                                           |                                                                                                                                    |
|            [PrinceXML](http://www.princexml.com/overview/?utm_source=taoofmac.com&utm_medium=web&utm_campaign=unsolicited_traffic&utm_content=external_link)            |                                                                   converts XHTML into hyperlinked PDF documents                                                                   |                                                                                                                                    |
|[PDFTools](http://www.sheelapps.com/index.php?p=PDFTools.HomePage=view&utm_source=taoofmac.com&utm_medium=web&utm_campaign=unsolicited_traffic&utm_content=external_link)|                                                        for Windows, allows for combining and manipulating multiple files.                                                         |                                                                                                                                    |
|              [Ghostscript](https://www.ghostscript.com?utm_source=taoofmac.com&utm_medium=web&utm_campaign=unsolicited_traffic&utm_content=external_link)               |                                                                            The one that started it all                                                                            |                                                                                                                                    |

[Mac OS X](/space/com/apple/macos) uses Display [PostScript](/space/dev/postscript) (part of its [NeXT](/space/com/next) heritage), so you don’t need anything to view or create PDFs in it (just save the Print Preview results to a file).

[Samba](https://www.ghostscript.com?utm_source=taoofmac.com&utm_medium=web&utm_campaign=unsolicited_traffic&utm_content=external_link) Printer
----------

```
[smbpdf]
  comment = PDF Generator
  path = /var/spool/samba
  printable = Yes
  print command = gs -dNOPAUSE -dBATCH -q - \
  sDEVICE=pdfwrite -sOutputFile=%H/%s.pdf; rm %s

```

[

Compression
----------

](/space/com/adobe/pdf#compression)

[Here’s](Compress.zip) a plugin for PDF compression that I used under [Leopard](/space/com/apple/macos/leopard), but you can just do:

```
gs -sDEVICE=pdfwrite -dCompatibilityLevel=1.4 -dNOPAUSE -dQUIET -dBATCH --sOutputFile=file-out.pdf file-in.pdf

#...or:
gs -sDEVICE=pdfwrite -dCompatibilityLevel=1.4 -dPDFSETTINGS=/ebook -dColorConversionStrategy=/Gray -dProcessColorModel=/DeviceGray -dNOPAUSE -dQUIET -dBATCH -sOutputFile=file-out.pdf file-in.pdf

```

[

Simulating a Scanned Image
----------

](/space/com/adobe/pdf#simulating-a-scanned-image)

```
#!/bin/sh
ROTATION=$(shuf -n 1 -e ‘-‘ ‘’)$(shuf -n 1 -e $(seq 0.05 .5))

convert -density 150 $1 \
  -linear-stretch ‘1.5%x2%’ \
  -rotate ${ROTATION} \
  -attenuate ‘0.01’ \
  +noise  Multiplicative \
  -colorspace ‘gray’ $2

```

[

Editing PDFs
----------

](/space/com/adobe/pdf#editing-pdfs)

I’ve found that LibreOffice Writer has the ability to edit PDFs in-line to some degree (thanks to its integration with Draw). It will not preserve font names or styles, though.

Affinitiy Designer, however, can do so much better (although it will not deal with embedded fonts)

[

Removing Metadata
----------

](/space/com/adobe/pdf#removing-metadata)

You can tweak or remove document metadata by using a `pdfmarks` file with Ghostscript:

```
[ /Title (Document title)
  /Author (Author name)
  /Subject (Subject description)
  /Keywords (comma, separated, keywords)
  /ModDate (D:20061204092842)
  /CreationDate (D:20061204092842)
  /Creator (application name or creator note)
  /Producer (PDF producer name or note)
  /DOCINFO pdfmark

```

…and combining it like this:

```
gs -dSAFER -dBATCH -dNOPAUSE -sDEVICE=pdfwrite -sOutputFile=output.pdf original.pdf pdfmarks

```

[

Removing Passwords
----------

](/space/com/adobe/pdf#removing-passwords)

The `qpdf` utility (some assembly required) can do it cleanly like so:

```
qpdf —password=foobar —decrypt orig.pdf new.pdf

```