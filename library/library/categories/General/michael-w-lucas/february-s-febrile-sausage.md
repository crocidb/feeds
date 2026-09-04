+++
title = "February’s Febrile Sausage"
description = "This See the Sausage Being Made post goes to Patronizers in February and becomes public in March. Not a Patronizer? You could be! $12 a year gets you my latest updates, occasional free tidbits, and the completely pointless MWL Footnote Fortune File, freshly updated for the new ed"
date = "2026-03-30T19:29:50Z"
url = "https://mwl.io/archives/24612"
author = "Michael Lucas"
text = ""
lastupdated = "2026-05-08T14:12:54.047740980Z"
seen = true
+++

This See the Sausage Being Made post goes to Patronizers in February and becomes public in March. Not a Patronizer? You could be! [$12 a year gets you my latest updates, occasional free tidbits, and the completely pointless MWL Footnote Fortune File](https://patronizemwl.com/), freshly updated for the new edition of [Networking for System Administrators](https://www.kickstarter.com/projects/mwlucas/networking-for-system-administrators-2nd-edition).

Yes, I just published a StSbM post last week, but I need to get back on track and I have news.

Most importantly, I’m making some words. The writing in the original ZFS books isn’t bad, but it could be better, so generally applicable ZFS discussion is getting redrafted. The FreeNAS miniXL makes a fine test server, and I’m even discovering FreeBSD bugs through bhyve. (The docs say you can install FreeBSD 15 with 256 MBRAM, but for a ZFS install you need at least 350MB to install from packages on ISO. I’d call this a doc bug rather than an OS bug, because if you’re running ZFS on a host with less than 350MB RAM you’re daft, but reducing pkg(8) memory usage is worthwhile.) I’m fixing some of the inconsistencies and standardizing language for certain concepts and tools, which I really should have done the first time around but nobody noticed so I guess we got away with it and that’s all that matters.

The challenge for this book? Linux. ZFS considers Linux a Tier 1 platform, but Linux does not consider ZFS a Tier 1 filesystem. ZFS works. You can install it. But there’s no standard way to use ZFS as a root filesystem on Linux. Many people maintain constantly evolving hacks to support ZFS on root. Some variants added support to the installer only to remove it. Proxmox uses ZFS as its primary filesystem, but very few people run Proxmox on their laptop. I think the majority of the book must assume that Linux users have their root on extFS and data disks with ZFS. It seems that [ZFSBootMenu](https://docs.zfsbootmenu.org/en/v3.1.x/) is the current leading Linux ZFS boot manager, so I’ll probably do a final chapter discussing that. Such chapters are the shortest-lived part of any book. Putting it at the end makes it easy to ignore when it becomes obsolete.

Which brings me to the big reason for posting this now: Eddie Sharam sent me the cover art. Behold, an ancient Mediterranean vase.

[<img loading="lazy" decoding="async" class="aligncenter size-large wp-image-26466" src="https://www.tiltedwindmillpress.com/wp-content/uploads/2026/02/daemon-cover16_Full_Image-50pct-1024x694.jpg" alt="" width="980" height="664">](https://sponsor.mwl.io)

This is an actual painting, available for sale once the book is released, probably as part of the Kickstarter. I pay Eddie reasonably for his work, but making a living as a visual artist is even more fraught than making a living as a writer. If he can get a few bucks more, I’m all for it. Central front and back images mean that we’ll have to do some digital manipulation to make the spine work on the hardcover, but Eddie’s down with that. (No, I don’t digitally alter images. That would require visual skills I have no desire to develop.)

Last month’s cleaning efforts highlighted a problem that’s a decade in the making: my surplus copies warehouse.

<img loading="lazy" decoding="async" class="aligncenter size-large wp-image-26467" src="https://www.tiltedwindmillpress.com/wp-content/uploads/2026/02/20260204_114253-1024x768.jpg" alt="" width="980" height="735">

The printer screwed up on the N4SA2e special editions, shipping me 32 regular hardcovers with the special dust jackets. I couldn’t use those for Patronizers, sponsors, or Kickstarters. They did, however, overwhelm my ability to ignore these shelves and force me to face reality. I need to do *something* with these.

The good news is, crowdfunding forced me to solve the problems of shipping.

I’m going to add them to the [TWP bookstore](https://www.tiltedwindmillpress.com/), signed, at list price.

Parts of it will be clunky, because WooCommerce shipping is arcane and inflexible. I hired expert help to solve this problem. They failed, so I’m not investing more effort therein. All shipping will happen on Mondays, unless I fry my brain and can only perform a mechanical task. But between good shipping envelopes, a label printer, and my newfound skill in tape gun reloading, it’s manageable.

I have a handful of tech books, a whole bunch of Prohibition Orcs, and a scattering of novels. The troublesome one will be the chapbooks. I might do a “random chapbook, $5” add-on item. Short story roulette, anyone?

Patronizers, you get dibs. If there’s something you want, drop me a note.

Somewhere in here, I have to set up the 1 April Kickstarter. Yes, I’m doing another one. I promise it’ll be stupid. You might laugh. A handful of you will leap at it, probably as a gag gift. But it’ll amuse me as I’m scrabbling through the ZFS book.

I’m also looking at the production tools for the tech book after OpenZFS. The first edition of *SSH Mastery* was originally laid out in LaTeX. The PDF looked great. I sent it to the print-on-demand networks. [Some indie printer, somewhere in the world, choked on its lack of Adobe-specific and Microsoft-specific gunk](https://mwl.io/faq#tools). The book was pulled from distribution globally because one location had trouble. I had to hire someone to redesign it in Adobe InDesign, and quickly. Afterwards, I had to dive into the InDesign gutter myself.

That was sixteen years ago.

Are those printers still running in Farawayistan? Perhaps.

But other people are reporting good results replacing both Adobe and Microsoft Office with LibreOffice in producing complicated books. I’m seriously considering trying it for the next tech book. This has risks. If one printer in Farawayistan can’t print the book, distributors will yank the book from distribution globally. I’ll have to redo the book in InDesign, and perhaps even in Office. Sponsors and Kickstarter backers have changed buying patterns, though. I need to produce books for signing in the US, and books for dropship in the US, UK, and Australia. My printer (today) is Ingram. Ingram maintains its printers in those locations quite well. I expect to print those easily.

Worst case: I release book for wide distribution, some printer can’t handle it. I redo it in LibreOffice/InDesign. If that fails, I convert everything to Office and InDesign and start over. My hardcore readers will get the book on time. The rest of the world waits an extra month for print.

The worrisome thing is opening old InDesign files, but I have a license for the Affinity suite. Not the new subscription model, not the newer freeware trap, an actual “you bought this software and can use it forever” license.

Truly, I’d love to be rid of Adobe. And Microsoft. And Adobe. *Adobe.*

I better sign off before I choke on my own rage. Thank you all for your support, it means the world to me–especially in these times.