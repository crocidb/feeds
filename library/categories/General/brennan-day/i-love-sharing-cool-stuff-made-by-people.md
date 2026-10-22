+++
title = "I Love Sharing Cool Stuff Made By People"
description = "After cataloguing the computers I already own, I asked the fediverse to share things made with their human hands, and they delivered. On itch.io games and the free tools anyone can start creating with (Twine, Ink, Inform 7, Bitsy, Godot, GB Studio), my new digital-art habit on af"
date = "2026-10-12T02:00:00Z"
url = "https://brennan.day/i-love-sharing-cool-stuff-made-by-people/"
author = "mail@brennanbrown.ca (Brennan Kenneth Brown)"
text = ""
lastupdated = "2026-10-21T11:46:09.808091120Z"
seen = false
+++

Yesterday, I wrote [a diary entry on Dreamwidth](https://brennanbrown.dreamwidth.org/2698.html) cataloguing the computers I own after my 2015 MacBook Pro died due to a swollen battery I couldn't afford to repair. While this was meant to be a simple inventory, writing it made me pause and realize that I really have so much, and that I've been under-utilizing both my time and what I own.

And I think most of us underestimate what we can do, starting right now, with the things we already have. We tell ourselves that we need the better tool, the right season when we have more time, the [gear acquisition syndrome](https://brennan.day/playing-the-games-we-have/) scratch that never gets fully itched. Meanwhile, everything needed for a creative, contemplative, useful life could already be sitting in your house.

I also shared a new little note on my homepage [asking people to share things with me](https://social.lol/@brennan/117420781673792362) that they made (with their human hands) that I could write about. I've already gotten a number of responses, and I think there's a nice unintentional throughline.

Make Things! [](#make-things)
----------

To start, [Maya Zimmerman](https://social.lol/@mayazimmerman@gamedev.lgbt) shared the various [games, visual flash fiction, music, and font she made](https://easypeazygames.itch.io/) on [itch.io](http://itch.io), and I get so inspired by devs like that. I think a great gateway into game development is by creating interactive fiction, poetry, and prose. There are a lot of free tools available for this:

* [Twine](https://twinery.org/) for browser-based hypertext stories
* [Ink](https://www.inklestudios.com/ink/) and its editor [Inky](https://github.com/inkle/inky) for branching prose
* [Inform 7](https://inform7.com/) for parser IF, written in a programming language that reads like English sentences
* [Decker](https://beyondloom.com/decker/), a HyperCard-like tool for 1-bit creations
* [Bitsy](https://ledoux.itch.io/bitsy) for tiny narrative games
* [Ren'Py](https://www.renpy.org/) for visual novels, where you can use public domain images or your own digital art.

And from there, you can get into full-on game development:

* [Godot](https://godotengine.org/) (free, open source): go through the ["Your first 2D game"](https://docs.godotengine.org/en/stable/getting_started/first_2d_game/) tutorial, use [Pixel Studio](https://play.google.com/store/apps/details?id=com.PixelStudio) for the art (free on mobile).
* [TIC-80](https://tic80.com/) (free edition): a 240×136 fantasy console with code, sprites, and music all in one tool.
* [GB Studio](https://gbstudio.dev/) (free): drag-and-drop Game Boy games that compile to ROMs that are shareable as [itch.io](http://itch.io) web builds.
* [devkitARM](https://devkitpro.org/) + [Tonc](https://gbadev.net/tonc/) (free): GBA homebrew in C, tested in [mGBA](https://mgba.io/).

I've tried to branch out creatively a little myself. I've started a small [digital art sketching habit](https://brennan.day/art), which isn't hard to get into if you already own a tablet. You don't need the expensive, brand-name stylus or well-known paper-like protector. The ones I got were affordable: an [ESR paper-feel screen protector](https://www.esrtech.com/collections/paper-feel-ipad-screen-protector) and a [Metapen A8](https://metapen.com/products/basic-a8). And the same goes for software—there's no need to pay the ridiculous subscription fee for Photoshop ([especially now](https://arstechnica.com/ai/2026/10/software-is-over-bold-ai-developer-takes-aim-at-adobe-with-open-source-clones/)).

Speaking of genAI, [Stuart](https://social.lol/@stuartml@mastodon.social) shared with me two interesting websites. [NoAIlist.org](https://noailist.org/) catalogues over 300 projects that are explicit about not having any generative AI work. The second is [ScienceFind.org](https://sciencefind.org/), which is a "tool that suggests science [wikipedia.org](http://wikipedia.org) articles for learning/studying. Learn something new every day!" Isn't that lovely?

While I'm on my soapbox, I'd love to recommend [Lyon](https://social.lol/@lyonsinbeta@mastodon.social)'s idea to add a [**/carless**](https://lyonsinbeta.com/carless/) page to the [slash pages](https://slashpages.net/) of your site.

Our Incredible Journey [](#our-incredible-journey)
----------

Next, my friend and 11ty expert [Adam](https://social.lol/@adjb@hcommons.social) asked me about what's happening with [Deno](https://deno.com) and [Bun](https://bun.sh). [Deno being bought by Cloudflare](https://deno.com/blog/cloudflare)—a company [I already would advise you to stay away from](https://brennan.day/choosing-friction-and-clear-skies-i-m-no-longer-using-cloudflare/) as best you can. For those unaware, Deno is a fast, open-source runtime for JavaScript, TypeScript, and WebAssembly. Unsurprisingly, CF is killing the Deno runtime immediately after the purchase was announced:

>
>
> We will support the Deno runtime for another year with monthly releases containing bug fixes and security updates. After that year we will end our development of the Deno runtime. Deno will remain open source, and we welcome others who want to continue its development.
>
>

Bun is an all-in-one JavaScript and TypeScript runtime, package manager, bundler, and test runner powered by the Apple JavaScriptCore engine. It was [acquired by Anthropic](https://www.anthropic.com/news/anthropic-acquires-bun-as-claude-code-reaches-usd1b-milestone), the creators of the LLM chatbot Claude, back in December. Only a few days ago the headline appeared ["Claude Rewrites Bun's Million Lines of Code in 11 Days for $165,000"](https://finance.biggo.com/news/b171d858-6390-4aef-bd0b-a651cfa942f6), which is an [anti-pattern you should avoid](https://brennan.day/adding-thousands-of-lines-to-your-codebase-isnt-impressive-its-actually-bad/) (not brag about)—and that I've already written about.

What I'll say about this is that there is no tool, product, or service (open source or otherwise) that is safe from the hands of a corporation willing to buy and destroy it. The Tumblr blog [Our Incredible Journey](https://ourincrediblejourney.tumblr.com/) has an extensive archive of acquisitions turning into shutdowns for many years now.

One of the reasons I'm a [JAMstack developer](https://jamstack.org/) that doesn't use JS frameworks is because there is no company that can buy HTML or CSS or vanilla JavaScript. When you get to the bare fundamentals of development, and you focus on those, not only are you avoiding undue bloat, you're also ensuring the longevity and robustness of your web development.

Other Cool Things [](#other-cool-things)
----------

There are so many people still making cool things with their own two hands and wrinkly pink brains. [Eltrac](https://eltr.ac/en/) shared with me his project of "[a new Webmention receiver in Clojure](https://codeberg.org/eltrac/weepinbell) (a beautiful Lisp dialect)." He was compelled to make this, as the original [Webmention.io](https://github.com/aaronpk/webmention.io) by Aaronpk is being rewritten from Ruby to PHP using Claude Code. As Eltrac wrote—and I agree—that seems to be "solving one problem with another." Regardless, Eltrac is also looking for people in the IndieWeb who are into functional programming languages like Clojure (which has a [no genAI policy](https://clojure.org/dev/contributor_agreement#_no_generated_code)). I myself dabbled in Haskell before, but it's really something I need to get back into!

Eltrac is also helping out [ch0ccyra1n](https://ch0ccyra1n.planetexpress.me/) with development of [Golda](https://codeberg.org/PersonalTechHelp/golda), a "fork of Hugo (the static site generator) with LLM-generated code stripped off" which I think is a great initiative!

Finally, there were a few other things that weren't messaged to me directly that I am excited about, and that I'm going to share nonetheless!

The first is [ApricotBB](https://apricotbb.net/) by [Brindly](https://brindly.art/), which is his take on modernizing forum software. I participate in several forums regularly myself, and I have to say this already looks seriously awesome. I will probably get a forum of my own going just to use it once it's released!

Next, I want to share [a blog post by Hakkerman](https://hakkerman.eu/blog/small-bubblers/) (who I wrote about previously in regards to [coffee and mutual aid](https://brennan.day/yes-buy-them-a-coffee-support-and-mutual-aid-on-the-indieweb/)), about how to support small Bubblers. Bubblers here meaning people who participate on [Bubbles.town](https://bubbles.town), an aggregator I've [written about previously](https://brennan.day/bubbles-town-four-months-later/). I think the advice in general is good: invest more time in smaller creators! Look for small view counts and upvotes. Hakkerman rightly calls me out for being on the front page all the damn time, but I'm heartbroken he doesn't think I'm quirky or eclectic. It was a real wake-up call that I need to recalibrate myself and [write more weird shit](https://brennan.day/write-weird-shit/)!

A Tiny Atlas of Free Things [](#a-tiny-atlas-of-free-things)
----------

Finally, here's a bonus atlas of free things if you'd like to add something to your bookmarks folder!

* **Listening:** [Radio Garden](https://radio.garden/) (a spinning globe of every live station on Earth!), [NTS](https://www.nts.live/), [BBC World Service](https://www.bbc.co.uk/sounds), plus whatever your national public broadcaster and campus/community stations are—for me, that's [CBC Listen](https://www.cbc.ca/listen), [CKUA](https://ckua.com/), [CJSW 90.9](https://cjsw.com/), and [ICI Radio-Canada](https://ici.radio-canada.ca/). Your local public library probably has Freegal, Libby, or hoopla. Plus [LibriVox](https://librivox.org/) audiobooks (recorded by human voices only!), and field recordings on [Freesound](https://freesound.org/) and [radio aporee ::: maps](https://aporee.org/maps).
* **Podcasts:** [BBC In Our Time](https://www.bbc.co.uk/programmes/b006qykl), [CBC Ideas](https://www.cbc.ca/radio/ideas), [CBC Unreserved](https://www.cbc.ca/radio/unreserved), [The Documentary Podcast](https://www.bbc.co.uk/programmes/p02nq0lx), [Philosophize This!](https://philosophizethis.org/), [The History of Philosophy Without Any Gaps](https://historyofphilosophy.net/), and author talks via the [Library Speakers Consortium](https://libraryc.org/).
* **Reading:** [Project Gutenberg](https://www.gutenberg.org/) (plus [Gutenberg Canada](https://gutenberg.ca/), [Project Gutenberg Australia](https://gutenberg.net.au/), and [Canadiana](https://www.canadiana.ca/)), [Wikisource](https://en.wikisource.org/), the [Internet Archive](https://archive.org/), [Open Library](https://openlibrary.org/), [Standard Ebooks](https://standardebooks.org/), [Library and Archives Canada](https://library-archives.canada.ca/). For zine culture, the [Queer Zine Archive Project](https://www.qzap.org/), [ZineWiki](https://zinewiki.com/), and [Broken Pencil](https://brokenpencil.com/).
* **Watching:** [Kanopy](https://www.kanopy.com/) and [Qello Concerts](https://www.qello.com/) (free with many library cards), the [NFB](https://www.nfb.ca/), [CBC Gem](https://gem.cbc.ca/), [TVO Docs](https://www.tvo.org/documentaries/browse), [DW Documentaries](https://www.youtube.com/@DWDocumentary), [Al Jazeera Documentary](https://www.youtube.com/@AlJazeeraDocumentary), [NHK World](https://www3.nhk.or.jp/nhkworld/en/), [Thought Maybe](https://thoughtmaybe.com/), and the [Internet Archive's film collection](https://archive.org/details/movies).
* **Learning:** [Open Yale](https://oyc.yale.edu/), [MIT OCW](https://ocw.mit.edu/), [freeCodeCamp](https://www.freecodecamp.org/), [The Odin Project](https://www.theodinproject.com/), my own [LearnWebDev.fyi](https://learnwebdev.fyi), [OpenLearn](https://www.open.edu/openlearn/), [Saylor](https://www.saylor.org/), [LinkedIn Learning](https://www.linkedin.com/learning/) (free with many library cards), and the catalogue-of-catalogues [Class Central](https://www.classcentral.com/).
  * For practice: [Exercism](https://exercism.org/), [Project Euler](https://projecteuler.net/), [Advent of Code](https://adventofcode.com/), and [OverTheWire's wargames](https://overthewire.org/wargames/).

* **Languages:** [Anki](https://apps.ankiweb.net/), [Clozemaster](https://www.clozemaster.com/), [Language Transfer](https://www.languagetransfer.org/), [Mauril](https://mauril.ca/en/) (Canada-only), RFI's [*Journal en français facile*](https://francaisfacile.rfi.fr/), [ICI TOU.TV](https://ici.tou.tv/), and [TV5MONDE](https://apprendre.tv5monde.com/). For sign languages: [Lifeprint](https://www.lifeprint.com/), [SignBSL](https://www.signbsl.com/), and [Spread the Sign](https://www.spreadthesign.com/).
* **Making:**
  * **Art:** [Krita](https://krita.org/), [MediBang Paint](https://medibangpaint.com/), [FireAlpaca](https://firealpaca.com/), [GIMP](https://www.gimp.org/), and [Inkscape](https://inkscape.org/); instruction from [Drawabox](https://drawabox.com/) and [Ctrl+Paint](https://www.ctrlpaint.com/); timed references from [Line of Action](https://line-of-action.com/) and [Quickposes](https://quickposes.com/); daily prompts from [Inktober](https://inktober.com/).
  * **Music:** [musictheory.net](https://www.musictheory.net/), [JustinGuitar](https://www.justinguitar.com/), Ableton's [Learning Music](https://learningmusic.ableton.com/) and [Learning Synths](https://learningsynths.ableton.com/), [Chrome Music Lab](https://musiclab.chromeexperiments.com/), and for recording, [Audacity](https://www.audacityteam.org/), [LMMS](https://lmms.io/), or GarageBand on anything Apple.
  * **Games & IF:** [itch.io](https://itch.io/) and its [jams](https://itch.io/jams), the [IFDB](https://ifdb.org/), the [Interactive Fiction Community Forum](https://intfiction.org/), the [IFComp](https://ifcomp.org/), and year-round jams like the [Global Game Jam](https://globalgamejam.org/), [7DRL](https://7drl.com/), [Ludum Dare](https://ldjam.com/), [GMTK](https://gmtk.itch.io/), and [js13kGames](https://js13kgames.com/).
  * **Zines & paper:** this [one-sheet folding guide](https://www.snailmailfriends.com/how-to-make-a-zine), [Dirty Little Zine](https://dirtylittlezine.com/), the [tildeverse zine](https://zine.tildeverse.org/), [Austin Kleon's blackout poetry](https://www.newspaperblackout.com/), [origami.me](https://origami.me/) diagrams, and Canon's [Creative Park](https://creativepark.canon/).
  * **Photography:** [Fuji X Weekly](https://fujixweekly.com/) film-simulation recipes and [Snapseed](https://play.google.com/store/apps/details?id=com.niksoftware.snapseed) for editing.
  * **Repair:** [iFixit](https://www.ifixit.com/) guides and [Repair Café](https://www.repaircafe.org/) events.

* **Outside:**
  * **Citizen science:** [iNaturalist](https://inaturalist.org/), [eBird](https://ebird.org/), [Merlin](https://merlin.allaboutbirds.org/), [Pl@ntNet](https://plantnet.org/), [Zooniverse](https://www.zooniverse.org/), [SciStarter](https://scistarter.org/), and [Globe at Night](https://globeatnight.org/).
  * **Phenology & fungi:** most countries have a phenology network, like [Alberta PlantWatch](https://plantwatch.naturealberta.ca/), USA-NPN's [Nature's Notebook](https://www.usanpn.org/nn), or the Woodland Trust's [Nature's Calendar](https://naturescalendar.woodlandtrust.org.uk/); a regional mycological society like the [Alberta Mycological Society](https://www.albertamushrooms.ca/) (or [NAMA](https://namyco.org/)'s member clubs), and [NAMA's spore-print how-to](https://namyco.org/interests/education/how-to-make-a-spore-print/).
  * **Birding:** [xeno-canto](https://xeno-canto.org/), [Birds of the World](https://birdsoftheworld.org/) (free via many libraries), [BirdLife International](https://www.birdlife.org/) partners, and free field trips from your local naturalist club (mine are [Nature Calgary](https://naturecalgary.com/)'s at the [Inglewood Bird Sanctuary](https://www.calgary.ca/parks/inglewood-bird-sanctuary.html)).
  * **Sky:** [Stellarium](https://stellarium.org/), [Heavens-Above](https://www.heavens-above.com/), the [WMO International Cloud Atlas](https://cloudatlas.wmo.int/), [AuroraWatch](https://aurorawatch.ca/) (Canada), and the interactive [light-pollution map](https://www.lightpollutionmap.info/).
  * **Walks & maps:** [Geocaching](https://www.geocaching.com/), [plogging](https://en.wikipedia.org/wiki/Plogging) logged with [Litterati](https://www.litterati.org/), [OpenStreetMap](https://www.openstreetmap.org/) via [StreetComplete](https://streetcomplete.app/), [Every Door](https://every-door.app/), or [Organic Maps](https://organicmaps.app/), [Mapillary](https://www.mapillary.com/), [Jane's Walk](https://janeswalk.org/), and the [sit-spot](https://wildernessawareness.org/articles/core-routine-sit-spot/) practice.

* **Contributing to the Commons:** become a Wikipedian via the [interactive tour](https://en.wikipedia.org/wiki/Help:Introduction) or the [Wikipedia Adventure](https://en.wikipedia.org/wiki/Wikipedia:The_Wikipedia_Adventure), then help with [Citation Hunt](https://citationhunt.toolforge.org), the [Typo Team](https://en.wikipedia.org/wiki/Wikipedia:Typo_Team), a [WikiProject](https://en.wikipedia.org/wiki/Wikipedia:WikiProject), the [Community Portal](https://en.wikipedia.org/wiki/Wikipedia:Community_portal), and the [Teahouse](https://en.wikipedia.org/wiki/Wikipedia:Teahouse). Beyond that: [Wikimedia Commons](https://commons.wikimedia.org/) ([Wiki Loves Monuments](https://www.wikilovesmonuments.org/) runs every September), [Distributed Proofreaders](https://www.pgdp.net/) ([Canada](https://www.pgdpcanada.net/)) for Project Gutenberg, translating free software on [Hosted Weblate](https://hosted.weblate.org/) ([11ty](https://www.11ty.dev/), [Lagrange](https://gmi.skyjake.fi/lagrange/), [WriteFreely](https://writefreely.org/), and [Halloy](https://halloy.chat/) are on there), narrating for [LibriVox](https://librivox.org/), and transcribing for the Library of Congress's [By the People](https://crowd.loc.gov/) and the [Smithsonian Transcription Center](https://transcription.si.edu/).
* **Spritiuality:** the [Examen](https://www.ignatianspirituality.com/ignatian-prayer/the-examen/), [lectio divina](https://en.wikipedia.org/wiki/Lectio_divina) with [Pray As You Go](https://prayasyougo.org/) or [Lectio 365](https://lectio365.com/) (good passage sources: the [First Nations Version](https://firstnationsversion.com/), the Psalms, [Rilke](https://poets.org/poet/rainer-maria-rilke), [Mary Oliver](https://poets.org/poet/mary-oliver)), [Death Cafés](https://deathcafe.com/), meditation with the [Plum Village App](https://plumvillage.app/) or [UCLA Mindful](https://www.uclahealth.org/uclamindful/free-guided-meditations).
* **Métis and Indigenous Heritage:** [michif.org](https://michif.org/) (Southern Michif course), [Rupertsland Institute](https://www.rupertsland.org/) (Northern Michif), the [Virtual Museum of Métis History and Culture](https://www.metismuseum.ca/), [speakmichif.ca](https://speakmichif.ca/), and [Library and Archives Canada](https://library-archives.canada.ca/).

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