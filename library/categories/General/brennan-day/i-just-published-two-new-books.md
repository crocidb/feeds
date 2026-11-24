+++
title = "I Just Published Two New Books"
description = "As I find myself entering a season of wintering, I go from compulsive writing to curating and organizing. As a result, I just published two new books: Constellation of Living Stars, the first volume of essays from this blog, and Golden Boy, a collection of poems from 2024 to 2026"
date = "2026-11-20T18:30:00Z"
url = "https://brennan.day/i-just-published-two-new-books/"
author = "mail@brennanbrown.ca (Brennan Kenneth Brown)"
text = ""
lastupdated = "2026-11-23T10:53:38.759055474Z"
seen = true
+++

Please excuse my brief detour from my usual commentary and essay writing. Today's post is going to be some shameless self-promotion instead! As I wrote on [Dreamwidth](https://brennanbrown.dreamwidth.org/3310.html) a few weeks ago, I've found myself more in a season of curation and tending as the winter season approaches. My fervour and compulsion of near-daily writing seem to be winding down.

I leaned into this, and bought a Microsoft Office 2019 key off of G2A (since my university version of Office 365 expired) to begin the work of creating a new book manuscript based on the writing I've been doing on my blog; however, unlike my previous independently published books, I decided to try my hand at using scripts and automation for the process rather than going through the tedious work of manually copy-and-pasting writing and reformatting it.

The Technical Workflow [](#the-technical-workflow)
----------

Every post on this blog is a Markdown file, which means it is relatively easy to make a build pipeline:

1. One script lists all 300-odd posts into a spreadsheet. I mark each post as yes, maybe, or no, assign it to a part, and put it in order. That spreadsheet generates a manifest, which is the book's table of contents.
2. Interiors are text only, so the build removes images, embeds, and web boilerplate, and normalizes title case and scene breaks.
3. Every inline link becomes a Chicago-style footnote at the bottom of the page: author, title, site, date, URL. Another script fetches the title of each linked page (falling back to the Wayback Machine for dead links). The first volume has over 1,400, wow!
4. [Pandoc](https://pandoc.org) turns the cleaned Markdown into a Word document using a reference file that matches a template 5×8 inch book manuscript, with mirrored margins, page-number footers, and EB Garamond for the type. The front and back matter are generated to (eg. title page, copyright page, etc.).
5. That's where the Office key comes in. I do the last edits in Word, update the table of contents, and export the PDF.

Once I had everything prepared and set up, it wasn't that hard to adapt the scripts for a Tumblr export (which I'll get to later).

Of course, it wasn't smooth sailing. I had some funny mistakes. My first PDF was 102 MB and it failed to process. It turned out that EB Garamond was installed as a *variable* font, which Word can't embed in a PDF! So it turned every line of text into a hidden image: over 37,000. Installing static copies of the font fixed it, and the PDF went to a much more reasonable size of 10 MB.

Once I've modified a document in Word, regenerating it from the scripts destroys those edits. I learned this when a rebuild overwrote the finished *Golden Boy* manuscript. I got it back through Word's Document Recovery and OneDrive's version history.

I built the EPUB from the finished Word document with Pandoc, made the AZW3 and MOBI versions with [Calibre](https://calibre-ebook.com), and made the Kindle KPF files with Amazon's Kindle Previewer. Kindle Previewer rejected *Golden Boy* at first because of an SVG image in the front matter.

Sure, none of this was as tedious as copying and pasting, but it wasn't effortless either. [Is it worth the time?](https://xkcd.com/1205/), well, that depends on how many books I'll be publishing with this workflow in the future.

I've Been Doing This For Years [](#i-ve-been-doing-this-for-years)
----------

I first got into independent publishing during the COVID-19 lockdown. This was back when I was primarily publishing poetry, and I scoured the Internet looking for all of the work that was still online, cached, and archived that I could compile into a single book, which I called [*THE DOGWOOD VERSES*](https://www.lulu.com/shop/brennan-kenneth-brown/the-dogwood-verses/hardcover/product-pmv7zj.html). I'm quite proud of what I managed to publish back in 2021, with over 500 pages of my writing from the time I was 15 years old up to 25.

Then, during my undergrad, I released a series of poetry chapbooks, some of which were over-the-top class projects. Some of these include [a love letter to Fyodor Dostoevsky](https://brennanbrown.gumroad.com/l/your-brothers-keeper), and [lyric essays on the prairies](https://brennanbrown.gumroad.com/l/prairie-boyspirit).

I also helped edit two anthologies while I was the president of [the creative writing club](https://writeclub.netlify.app/about) at my university, [*A Collection of Filth*](https://www.amazon.ca/Fringe-Collection-Filth-Danaë-Webb/dp/B0CYQ1NRY9/141-9316588-7490560) and [*A Collection of Community*](https://www.amazon.ca/Fringe-Collection-Felix-Costa-Gomez/dp/B0F4PKFRZQ/133-2706333-7772961). Since I've graduated, the club is still publishing! The third issue is out, [*A Collection of Progression and Regression*](https://www.amazon.ca/Fringe-Collection-Progression-Regression-University/dp/B0GTZHG119), and the fourth is in the works.

All of this to say that I've gotten a little adept at figuring out how to publish books independently. I do every part myself: the cover, the formatting, the product copy, all of it.

Taking stock of what posts I wanted published this time around with brennan.day as my corpus, I realized I had too many to fit into a single book! The baseline page limit is around 700-800 pages, and so I decided to split it up into two volumes.

Constellation of Living Stars [](#constellation-of-living-stars)
----------

![The front cover of Constellation of Living Stars on a pale pink background. The title is set in large black italic type at the top right, above a framed painting of a banquet in a rocky seaside grotto, captioned 'the feast of acheloüs, peter paul rubens, c. 1615.' Below the painting are the words '[essays, volume one]' and the author's name, Brennan Kenneth Brown of brennan.day.](https://brennan.day/assets/images/books/constellation-of-living-stars.jpg) *Constellation of Living Stars*, featuring *The Feast of Achelous* by Peter Paul Rubens, c. 1615

I decided the first volume is going to be named after a blog post I wrote in March, [a Constellation of Living Stars](https://brennan.day/constellation-of-living-stars/).

The first one, which is what I'm releasing, contains three different sections:

1. Writing on the craft of writing: Mise en place for writers, the neurology of narrative, a defence of Rupi Kaur, the writers who burned all their words and the ones who wrote the most in history, and why you should fold a thousand cranes without expecting a wish.
2. Spirit, Indigeneity & Community: Thomas King and Greenland's Inuit, cultural extinction, Long COVID and the pandemic we pretend has ended, tragic theism, loving immigrants and trans folk as a Christlike act, the berry pickers, and what it means to be a river.
3. Lyric Essays & Memoir: from turning twenty-nine to finding my footing at thirty. Late blooming, clown burnout, a eulogy, grain elevator country, deep time and grief, and a love letter to everything, ending where the sidewalk ends.

The second volume, which I plan to release in early 2027, will contain my writings on the independent web, technology, and generative artificial intelligence. It'll be of similar size.

So, if I'm planning two volumes but only releasing one, what's the other book I'm publishing right now?

Book Two: Golden Boy [](#book-two-golden-boy)
----------

![The front cover of Golden Boy! on a deep red background. The title, GOLDEN BOY!, is in bold yellow capital letters at the top, above a yellow woodcut-style illustration of a smiling, freckled boy holding a bucket of bottles, framed by a thin yellow border. Below are the words 'poems, 2024—2026' and the author's name, brennan kenneth brown, also in yellow.](https://brennan.day/assets/images/books/golden-boy.jpg) *Golden Boy*, with a frontispiece from [Boy and Bottles](https://openclipart.org/detail/320988/boy-and-bottles) on Openclipart

The answer is a book of poetry! I've collected everything I've written since my last release, [*The Reaper and Her Sickle*](https://brennanbrown.gumroad.com/l/the-reaper-and-her-sickle), which came out in August of 2024. Less than three months later, I wrote a poem called "Another New Beginning," sitting in the East Gate Starbucks at Mount Royal University, watching students feed their phones at the outlets like pilgrims at an altar. So, that's where this book starts.

I noticed, throughout, that I can't stop finding churches in places that aren't churches. A Safeway at two in the morning. A Denny's at three on my twenty-ninth birthday, nose-deep in a stolen copy of *The Brothers Karamazov*. A 7-Eleven, a Husky station on Macleod Trail, a laundromat where a stranger hands over quarters to another. This is how God works. A church basement on Tuesday nights, mould and instant coffee, where God turns out to be "just Derek in his stupid jersey, / Linda and her grocery store cookies."

I've spent most of my adult life trying to figure out God. I've never had certainty, but I do have a habit of attention, and the belief that the sacred doesn't care where it shows up. Industrial lights hum like saints. The thumb on the phone moves like rosary beads.

### Why the title "Golden Boy"? [](#why-the-title-golden-boy) ###

Clifford Odets' 1937 drama *Golden Boy* follows Joe Bonaparte, a gifted young Italian-American violinist in 1930s New York who abandons music for professional prizefighting in pursuit of money, status, and power. Joe is a sensitive, talented violinist whose father, Mr. Bonaparte, hopes he will pursue a musical career. Driven by Depression-era ambition and the desire to be a "somebody," Joe signs up to box with manager Tom Moody and trainer Tokio, risking injury to the hands he needs to play.

In 1995, director Hiroyuki Kitakubo and animation studio Studio A.P.P.P. debuted the anime *Golden Boy*. It follows Kintaro Oe, a 25-year-old dropout who had mastered the entire law curriculum at Tokyo University before deliberately leaving without a degree. Convinced that books had taught him all they could, Kintaro sets out across Japan on a bicycle to enroll in the “school of life,” taking a series of odd jobs—janitor, campaign staffer, noodle-shop hand, animation errand boy—not for money or status but for experience.

In 1999, singer-songwriter John Darnielle of the Mountain Goats released the album *Ghana*, with the first track "Golden Boy," a sermon-like song about living a moral, obedient life. Why? Because "there are no pan-Asian supermarkets down in hell/So you can't buy Golden Boy peanuts," a brand from Singapore.

Performing “Golden Boy” at Swedish American Hall on 20 February 2020, Darnielle made an observation about the chorus:

>
>
> “There are no Golden Boy peanuts left in this world, as far as anyone can tell. But if I can just get spiritual with you for a moment, the song says that in hell—hell, the place of eternal suffering and torment, the place where no happiness can be found—that’s the place where no Golden Boy peanuts are. But it’s also been further observed that we now all: you, I, your parents, your friends, your enemies, strangers, all live in a place where there are no such peanuts.”
>
>

Most importantly, on top of the Manitoba Legislative Building in Winnipeg, there is a gilded statue of a young man running into the wind. He holds a torch in one hand and a sheaf of wheat in the other, and he faces north. Everyone in the city calls him the Golden Boy. His gold is the "stolen gold that paved the railways." That's the problem with golden boys, isn't it? They're beautiful, and they're bought with something.

I think, for a while, I wanted to be one. The boy who wrote poems in a back alley during lunch instead of eating, who was going to make something of it. In truth, I hope one day I can be the Golden Boy.

Get the Books [](#get-the-books)
----------

**[*Constellation of Living Stars*](https://brennanbrown.gumroad.com/l/constellation-of-living-stars)**

* [Paperback on Lulu](https://www.lulu.com/shop/brennan-kenneth-brown/constellation-of-living-stars/paperback/product-m2rg7ze.html)
* [eBook bundle on Gumroad](https://brennanbrown.gumroad.com/l/constellation-of-living-stars) (EPUB, AZW3, MOBI, and PDF)
* [Amazon.ca](https://www.amazon.ca/Constellation-Living-Stars-Collection-Essays/dp/B0HS2L91W9)

**[*Golden Boy*](https://brennanbrown.gumroad.com/l/golden-boy)**

* [Paperback on Lulu](https://www.lulu.com/shop/brennan-kenneth-brown/golden-boy/paperback/product-q648ne5.html)
* [eBook bundle on Gumroad](https://brennanbrown.gumroad.com/l/golden-boy) (EPUB, AZW3, MOBI, and PDF)
* [Amazon.ca](https://www.amazon.ca/GOLDEN-BOY-Brennan-Kenneth-Brown/dp/B0HS4NXN3M)

I'll emphasize that I think writing is good medicine, and medicine should be free. Every poem in *Golden Boy* is free to read online at [https://bkpoetry.com](https://bkpoetry.com), and every essay in *Constellation of Living Stars* is free to read online at [brennan.day](https://brennan.day). So don't feel as if you have to buy either book to read my work!

---

>
>
> **About Brennan Kenneth Brown**
>
>
>
> Queer Métis writer, cultural critic, and web developer based in Mohkínstsis (Calgary), Treaty 7 territory. Author of nine books and counting, the founder of Berry House Studio, and of Write Club at Mount Royal University. He's also the creator of the transformative works archive fanfiction.lol, and the IndieWeb commons folk.zone. His work has been cited in Le Monde, The Register, and other publications.
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