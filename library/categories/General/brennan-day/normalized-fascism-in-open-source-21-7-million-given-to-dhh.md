+++
title = "Normalized Fascism in Open Source: $21.7 Million Given to DHH"
description = "Open source has become a safe harbor for far-right politics, from David Heinemeier Hansson's white-nationalist rhetoric and the Omacom Foundation's $21.7 million in patron funding to so-called apolitical projects that treat marginalized contributors as political, and why a united"
date = "2026-09-02T02:00:00Z"
url = "https://brennan.day/normalized-fascism-in-open-source-12-million-given-to-dhh/"
author = "mail@brennanbrown.ca (Brennan Kenneth Brown)"
text = ""
lastupdated = "2026-10-08T09:34:20.332252402Z"
seen = false
+++

**Update, October 7, 2026:** This post has been updated to reflect the Omacom Foundation's growth from $12 million to \~$21.7 million, along with its new patrons, hires, and sponsorships. For a continuously updated summary, see [Stop Omarchy](https://stopomarchy.neocities.org).

I'm somebody who's written rather extensively on [generative AI ethics](https://brennan.day/collections/ai/), and I feel there is a lot that is unethical about the current corporate climate and culture surrounding the technology. And when I write about LLMs and chatbots, I'm careful not to make judgments about the people using the end products—I don't think you're a bad person if you use ChatGPT or Claude, or whatever.

What I'm discussing today is different. There is no room for debate or argument, here—only hard, absolute lines in the sand.

Much of the world has become far too complacent and complicit with people (and their companies) who proclaim and hold far-right, fascist ideology. These are not image boards residing in the fringe corners of an anonymous Internet made up of people who have slipped through the cracks. No, these are wealthy people in power who are blatant and shameless in their support for those who continuously beat the drum of bigotry, xenophobia, transphobia, and cynical accelerationist hatred.

Open source technology has become a culture safe for this rhetoric and ideology, with millions of dollars being invested to continue this status quo.

You need to be made aware of this, and then you need to be vocal and take action.

DHH [](#dhh)
----------

[David Heinemeier Hansson](https://dhh.dk/) is the most well-known figurehead here. He is the creator of Ruby on Rails, CTO of 37signals, and a Shopify board member.

In September 2025, DHH published ["As I remember London"](https://web.archive.org/web/20250925050154/https://world.hey.com/dhh/as-i-remember-london-e7d38e64), mourning that London is "no longer full of native Brits"—a claim that redefines "native Brit" to mean "white." Developer Jake Lazaroff [details how DHH](https://jakelazaroff.com/words/dhh-is-way-worse-than-i-thought/) describes a Tommy Robinson march as "heartwarming," where speakers called for "remigration" (a euphemism for the ethnic cleansing of non-white residents) and one speaker demanded that countries "ban halal," "ban mosques," and "ban temples." DHH invokes abuse scandals to bolster his white-nationalist rhetoric, framing non-white men as predators of "British girls," while UK data [shows no such racial skew](https://www.csacentre.org.uk/research-resources/research-evidence/scale-nature-of-abuse/trends-in-official-data/). [LibreNews](https://thelibre.news/lets-talk-about-dhh/) reaches the same conclusion.

In July 2026, DHH published ["Wolves, sheep, and gypsies"](https://web.archive.org/web/20260721200429/https:/world.hey.com/dhh/wolves-sheep-and-gypsies-ba44af6a), an essay comparing Denmark's rebounding wolf population to Roma encampments in Copenhagen parks as two versions of the same problem, closing with: "When wolves get out of control, you shoot them. When gypsies take over public spaces, you deport them. This isn't hard, it isn't cruel. It's the basic logic of self-preservation." As [Bluesky user Aditya Mukerjee pointed out](https://couchsky.app/u/chimeracoder.bsky.social/p/3mrnl6w23p22g), the Roma people DHH is talking about deporting are mostly citizens of the countries they live in. "Deport" doesn't describe a coherent policy proposal, it's ethnic cleansing with softer wording. DHH then complained publicly [when Claude refused his request](https://world.hey.com/dhh/i-m-sorry-dave-380ec27d) to translate the post into Italian, with Anthropic's model explaining it was declining because "putting Roma people alongside wolves, with shooting and deportation as parallel solutions, is dehumanizing toward an ethnic group."

Developer Joel Drapper wrote how [Ruby Central had lost a $250,000-a-year sponsorship](https://joel.drapper.me/p/rubygems-takeover/) from Sidekiq after giving DHH a speaking slot at RailsConf a few weeks later, leaving the nonprofit financially dependent on Shopify (where DHH sits on the board); Shopify then pushed Ruby Central to consolidate control rather than lose its funding. [The Register](https://www.theregister.com/2025/09/25/open_source_to_closed_doors/) and [Heise](https://www.heise.de/en/news/Who-owns-an-open-source-project-RubyGems-threatens-to-split-10685184.html) both covered the fallout.

But none of this has cost DHH money—if anything, he's only gained. In August 2026, DHH [announced the Omacom Foundation](https://omarchy.org/news/2026/08/omacom-foundation-launches-with-8-million/) to bankroll his Linux distribution, Omarchy, which is nothing more than a few vibecoded scripts on top of Arch Linux. Arch itself [refused DHH's money and support](https://canartuc.medium.com/5-million-users-60-982-a-year-declined-10-million-foundation-in-28-hours-4b966832eeb1). Those vibecoded scripts have consequences, too: Omarchy shipped with a default configuration that [let any user process escalate to root](https://0xcc.io/posts/omarchy-root-creds/) through the Docker socket, alongside issues like [video-title bash injection and notifications able to run arbitrary bash](https://blog.happyfellow.dev/merchants-of-insecurity/). Its [installer ISO](https://github.com/omacom/omarchy/releases) is around 6 GB, more than 4x the size of the Arch ISO.

The foundation launched with $8 million. As of this update, it reports [approximately $21.7 million in total backing](https://omarchy.org/news/2026/09/alibaba-cloud-joins-as-founding-corporate-patron/).

There are twelve "Founding Patrons" pledging a million dollars apiece:

* [Tobi Lütke](https://x.com/tobi), CEO of [Shopify](https://www.shopify.com/)
* [Patrick Collison](https://x.com/patrickc), CEO of [Stripe](https://stripe.com/)
* [Michael Dell](https://x.com/MichaelDell), Chairman and CEO of [Dell Technologies](https://www.dell.com/)
* [Jack Dorsey](https://x.com/jack), Block Head and Chairman of [Block](https://block.xyz/)
* [Matthew Prince](https://x.com/eastdakota), CEO of [Cloudflare](https://www.cloudflare.com/)
* [Brendan Iribe](https://x.com/brendaniribe), Cofounder of [Sesame](https://www.sesame.com/) and Oculus
* [Jason Fried](https://x.com/jasonfried), CEO of [37signals](https://37signals.com/)
* [Drew Houston](https://x.com/drewhouston), cofounder and co-CEO of [Dropbox](https://www.dropbox.com/)
* [Peter Steinberger](https://x.com/steipete), creator of [OpenClaw](https://openclaw.ai/)
* [Brian Armstrong](https://x.com/brian_armstrong), CEO of [Coinbase](https://www.coinbase.com/)
* [Yunjie Dai](https://x.com/xdanger), cofounder of [TapTap](https://www.taptap.io/)
* DHH himself.

And these people are each contributing $100,000:

* [Ryan R. Hughes](https://x.com/ryanrhughes), partner at [Oodle](https://heyoodle.com/)
* [Ed Huang](https://x.com/dxhuang), cofounder and CTO of [PingCAP](https://www.pingcap.com/)
* [Adrien Treccani](https://www.linkedin.com/in/atreccani/), founder of [Metaco](https://ripple.com/products/custody/)
* [Max Schoening](https://x.com/mschoening), Head of Product at [Notion](https://www.notion.com/)
* Brian Cartmell, entrepreneur ([announcement](https://omarchy.org/news/2026/09/brian-cartmell-and-american-cloud-join-as-open-patronage-doubles/))

And these corporations are each contributing $100,000 a year for three years:

* [1Password](https://1password.com/)
* [37signals](https://37signals.com/)
* [Four Technologies](https://www.paywithfour.com/)

And these corporations are each contributing $1 million a year for three years:

* [DigitalOcean](https://www.digitalocean.com/) ([announcement](https://omarchy.org/news/2026/09/digitalocean-joins-as-founding-corporate-patron/))
* [Alibaba Cloud](https://www.alibabacloud.com/) ([announcement](https://omarchy.org/news/2026/09/alibaba-cloud-joins-as-founding-corporate-patron/))

Alibaba Cloud's deal is also helping build "Omarchy China," a local CDN, hosting, website, and meetup network, and collaborating to make Omarchy the "ideal agentic operating system" for Alibaba's upcoming Qwen Book computer.

This corporation is contributing $1.5 million in tokens to the mission:

* [Meta Superintelligence Labs](https://www.meta.com/superintelligence/)

And these corporations are each contributing $150,000 in tokens, with renewal by mutual agreement:

* [Fireworks](https://fireworks.ai/)
* [OpenAI](https://openai.com/)
* [OpenRouter](https://openrouter.ai/)
* [OrcaRouter](https://www.orcarouter.ai/) ([announcement](https://omarchy.org/news/2026/09/orcarouter-joins-as-a-distinguished-corporate-patron/))

[Anthropic](https://www.anthropic.com/) was also listed in this tier when this post was first published, but has since been removed from the live patrons page ([archived snapshot from September 13](http://web.archive.org/web/20260913031005/https://omarchy.org/patrons/)).

Over a dozen of the most powerful executives in tech looked at a man who wrote that a British march calling for the deportation of non-white citizens was "heartwarming," and decided he was the person they wanted to hand a multimillion-dollar foundation to.

[The Omarchy Doctrine](http://web.archive.org/web/20260911142433/https://omarchy.org/doctrine/), published on the project's own site, preaches heritage as duty, holding the line, and the will to power. As security researcher Davi Ottenheimer [lays out](https://www.flyingpenguin.com/dhh-omarchy-doctrine-fascism-stage-one-by-definition/), it matches Roger Griffin's definition of fascism as palingenetic populist ultranationalism, and Robert Paxton's first stage of fascism: a creed, a leader, followers. There's now $21.7 million already pledged for the next stage.

Omarchy's Patrons [](#omarchys-patrons)
----------

Because 21.7 million dollars isn't enough for some people, below the named executives and corporate sponsors sits a much longer list of supporters. Omarchy's open [patron program](https://omarchy.org/patrons/), where "each [contributes] as they see fit" in exchange for a badge on the site. That page lists several hundred backers, the vast majority of them ordinary developers and small consultancies, and open patronage [doubled in ten days](https://omarchy.org/news/2026/09/brian-cartmell-and-american-cloud-join-as-open-patronage-doubles/) to more than $120,000 across 826 patrons. A few names stuck out to me:

* [Axel Fontaine](https://axelfontaine.com/) is the creator of [Flyway](https://www.red-gate.com/blog/the-next-chapter-of-flyway/), the widely used database migration tool he sold to Redgate in 2019. He's [also submitted code to the Omarchy repo](https://github.com/basecamp/omarchy/pull/6231), which makes him both a funder and a hands-on contributor.
* [Marc Köhlbrugge](https://marc.io/) is the founder of [WIP](https://wip.co) and [BetaList](https://betalist.com), fixtures of the indie-hacker/bootstrapper scene that Omarchy's bullshit ricing aesthetic is clearly courting.
* [ServiceStack](https://servicestack.net/) is an established .NET web-services framework vendor, one of the patrons backing the project as a company rather than an individual.
* [American Cloud](https://omarchy.org/news/2026/09/brian-cartmell-and-american-cloud-join-as-open-patronage-doubles/), a cloud provider, sits alone in the highest open tier ($25,000 or more).
* [Werner Vogels](https://en.wikipedia.org/wiki/Werner_Vogels), CTO of Amazon, is listed in the $8,000-or-more tier.
* [Bertrand Janin](https://tamentis.com/) is a longtime open-source developer (ex-Ramp, ex-Truveris) running his own small shop, Atelier Janin.
* [Pagecord](https://pagecord.com/) is a hosted blogging platform I've [written about before](https://brennan.day/indieweb-ethos-and-pagecord/), where I documented how creator Olly fed a user's 26-year blog into an LLM without consent, then shipped the outputted script to production without reading it.
* [Vincent Ritter](https://vincentritter.com/), founder of Tinylytics and Scribbles, is a repeat presence in IndieWeb/micro.blog drama. In January 2025, [Adam Newbold catalogued a pattern of bigoted posting](https://social.lol/@neatnik/116919420230729975): complaining about being ["offended by pronouns"](https://danielpunkass.micro.blog/2025/01/23/mantons-enough-responds-to-the.html), being disappointed by more inclusive Apple emojis, disparaging "foreigners" who drive for Uber and play "foul rap music," and praising Elon Musk the day after he performed two Nazi salutes on camera. Ritter's original posts making these remarks have since been deleted, [Jason Becker notes as much](https://json.blog/2025/01/22/compassion-when-i-cannot-offer.html). Manton Reece, of micro.blog, publicly defends him.
* **9538-7874 Quebec inc.** is one of at least a couple of numbered, unnamed Canadian corporations on the list. Bizarre shell companies with no public identity attached to them at all. I'm currently unsure about these.

Most of these several hundred names are unremarkable, and that's on purpose. A grassroots-looking patronage tier can launder small supporters and known industry names alongside the big-hitting marquee donors.

Omarchy's Team [](#omarchys-team)
----------

The people working directly on Omarchy are listed on the project's [Teams page](https://omarchy.org/teams/):

**Core**

* [DHH](https://dhh.dk/) (USA/Denmark)
* [Ryan R. Hughes](https://x.com/ryanrhughes) (USA)
* [Tobi Lütke](https://x.com/tobi) (Canada)
* [Bjarne Øverli](https://x.com/iamdothash) (Norway)
* [HANCORE](https://github.com/HANCORE-linux) (Germany)
* [Spencer Bull](https://x.com/SpencerGBull) (USA)
* [Krzysztof Wilczyński](https://x.com/kwilczynski) (Japan)
* [outfoxxed](https://x.com/outfoxxedd) (USA)
* [Emir Beganović](https://x.com/emirbeganovic) (Netherlands)
* [ThePrimeagen](https://x.com/ThePrimeagen) (USA)
* [Mehmet İnce](https://x.com/mdisec) (UK)

**Security**

* [Mehmet İnce](https://x.com/mdisec) (UK)
* [Adrian Rangel](https://x.com/acrogenesis) (Mexico)
* [Erik Melton](https://x.com/meltonaerik) (Norway)
* [Sayem Chowdhury](https://x.com/Sayem314) (Bangladesh)
* [Sebastian Stange](https://x.com/bastidotnet) (Germany)
* [Afonso Oliveira](https://x.com/AFOliveira__) (Portugal)

**Design**

* [Barış Girişmen](https://x.com/BarisGirismen) (Türkiye)
* [Christoffer Hallas](https://x.com/hicsfh) (USA)
* [Daniel Schmier](https://x.com/captainscorch) (Germany)
* [Andrés Villagrán](https://x.com/avillagran) (Chile)
* [Niklas Jul](https://github.com/SirJul1337) (Denmark)

**Rangers**

* [Mihai](https://x.com/SandorhaziM) (Romania)
* [Mateo Vaz](https://x.com/Mateo_VX) (Uruguay)
* [Nira](https://x.com/niraletter) (Nepal)

Since this post was first published, Omarchy has also added two platform teams: M, for Apple hardware, and Dragon, for Qualcomm Snapdragon. [ThePrimeagen](https://drewdevault.com/weird-guys/#primeagen) (Michael B. Paulson), who appears on Drew DeVault's list, [joined Core](https://omarchy.org/news/2026/09/theprimeagen-joins-omarchy-core/) in September to lead "Agentic QA."

The foundation's money is being spent. It has hired its first three full-time staff: [Krzysztof Wilczyński](https://omarchy.org/news/2026/09/omacom-foundation-hires-krzysztof-wilczynski/) on the kernel, [outfoxxed](https://omarchy.org/news/2026/09/omacom-foundation-hires-outfoxxed/) (creator of Quickshell) on the shell, and [Emir Beganović](https://omarchy.org/news/2026/09/omacom-foundation-hires-emir-beganovic/) on infrastructure. It funds multi-year [sponsorships](https://omarchy.org/sponsorships/) of Hyprland, mise, and 0xSero's Sybil Solutions, pays stipends to artists through its "Omarchy AIR" residency, and in October [launched a $100,000 bug bounty](https://omarchy.org/news/2026/10/omarchy-launches-bug-bounty-program-on-hackerone/) on HackerOne.

The same infrastructure companies bankrolling Omarchy and Ladybird are also the backbone of the ongoing violence of U.S. deportations. This includes [Amazon's AWS contracts powering ICE](https://www.immigrantdefenseproject.org/wp-content/uploads/How-Amazon-Powers-ICEs-Deportation-Machine.pdf) (Amazon's CTO, Werner Vogels, is himself an Omarchy patron), [Palantir building ICE's case-management system](https://mijente.net/wp-content/uploads/2018/10/WHO’S-BEHIND-ICE_-The-Tech-and-Data-Companies-Fueling-Deportations-_v1.pdf), and the use of [Salesforce's tools](https://www.nytimes.com/2025/10/16/us/salesforce-benioff-ice.html).

"Apolitical" [](#apolitical)
----------

[Andreas Kling](https://ladybird.org/), founder of the Ladybird browser project (itself an Omacom-adjacent beneficiary, [sponsored by Cloudflare, FUTO, Shopify, 37signals, Proton, and JetBrains](https://ladybird.org/#sponsors)), built his project's identity around refusing a documentation patch that would have made SerenityOS's manuals gender-neutral, on the grounds that gender-neutral language was "personal politics" that didn't belong in a technical project. Blogger [Kelson Vibber](https://kvibber.com/reviews/software/ladybird-inclusivity/) wrote how that became Ladybird's official contributing guidelines, which now bar "discussions on societal politics"—a policy treating the mere existence of trans contributors as more "political" than excluding them. In 2026, Kling [posted in support of Charlie Kirk](https://x.com/awesomekling/status/1966456391146606806) after Kirk's assassination and, per discussion on [Lobsters](https://lobste.rs/s/oaxcep/cloudflare_is_sponsoring_ladybird), bristled at being called a fascist for it—a reaction hard to square with "apolitical," since Kirk was a movement figure who, per his own [Wikipedia entry](https://en.wikipedia.org/wiki/Charlie_Kirk), promoted the "white genocide" conspiracy theory and criticized the Civil Rights Act.

[Vaxry](https://blog.vaxry.net/articles/2024-fdo-and-redhat), the developer behind the Hyprland Wayland compositor (another Omacom-funded project), was banned in 2024 by [Freedesktop.org](http://Freedesktop.org)'s Code of Conduct team over a pattern of the Hyprland Discord enabling harassment of trans community members, including an incident where moderators changed a trans user's display name to strip their pronouns. In Vaxry's own retelling on the *Tech Over Tea* podcast, [recounted at LibreNews](https://thelibre.news/hyprland-banned-from-freedesktop-why/), the moderator swapped "they/them" for "who/cares," and the user wasn't allowed to change it back. Vaxry's own [public response](https://blog.vaxry.net/articles/2024-fdo-and-redhat) framed the ban as ideological overreach by "social justice warriors," while Freedesktop describes over a year of private attempts to get him to address the toxicity before going public. Hyprland's contributing guidelines now [ban "political" speech too](https://web.archive.org/web/20260330133306/https://blog.vaxry.net/resource/articleFDO/RHMails.pdf).

The funding relationship has only deepened since. The [Omacom Foundation announced an exclusive, three-year sponsorship of Hyprland](https://www.techtimes.com/articles/326089/20260831/omacom-foundation-hits-126m-1password-37signals-fund-linux-patron-model.htm), with an option to extend for two more years. Vaxry's prior funding of individual donations and a €5/month Hyprperks subscription tier is being discontinued in favour of this single exclusive arrangement, meaning the developer [freedesktop.org](http://freedesktop.org) banned for enabling transphobic harassment is now bankrolled solely by DHH.

[Enrico "metux" Weigelt](https://github.com/X11Libre/xserver/commit/4839966900d948c5793064b5dccbdb3fd35f558b) forked the deprecated Xorg server into Xlibre as a rebellion against a "RedHat DEI" conspiracy he believes exists. The founding document of the project was a rant about big-tech diversity initiatives, and its code of conduct is a text file that just says "404." [FUTO](https://web.archive.org/web/20251022160356/https://futo.org/about/futo-statement-on-opensource/) is a funder of Immich and is run by Eron Wolf, a friend and platformer of Curtis Yarvin, the "dark enlightenment" writer whose ideas about dismantling democracy have now found purchase in the current U.S. administration. [Brendan Eich](https://samambreen.wordpress.com/2019/08/16/an-open-letter-to-brendan-eich/), Mozilla's co-founder and now Brave's CEO, used Brave's infrastructure to give payments to Kiwi Farms, a forum whose harassment campaigns [have been linked to multiple suicides](https://www.motherjones.com/politics/2023/02/kiwi-farms-die-drop-cloudflare-chandler-trolls/).

We witness the same pattern over and over. A tech project is declared "apolitical," and defines any accommodation of marginalized contributors as a political act, and keeps the actual politics of the maintainers—nostalgia for ethnically white homogeneous cities and hostility to gender-neutral pronouns—off the table entirely. Because that's just, you know, how they feel. "Apolitical" has never meant a lack of politics. It's meant politics that current power doesn't have to defend.

The Throughline [](#the-throughline)
----------

We have been watching the fragile fury of white masculinity and hate metastasize and fester over the years, from Gamergate's harassment campaigns through years of anti-SJW cringe compilation content mills, the marking of Antifa as the enemy, the tantrum-throwing #AllLivesMatter movement, and the manufactured panic over DEI and "wokeism."

You are not living in the neoliberal-Obama era where basic compassion and empathy are the default anymore. And you haven't been for a long time. Despite their cries about censorship and deplatforming, and despite their persecution fetish, these people are not on the fringe. They have board seats and sponsorships and multimillion-dollar foundations.

It is no coincidence this is occuring as companies and brands [return to X](https://www.theglobeandmail.com/investing/markets/stocks/UL/pressreleases/31643497/why-big-brands-are-quietly-returning-to-x/), as the United States [votes at a Midterm election being interfered with by a sitting president](https://www.americanprogress.org/article/the-trump-administration-is-interfering-in-the-2026-midterm-elections-to-entrench-the-imperial-presidency/), as conservatives [normalize the far-right in Europe politics](https://www.lemonde.fr/en/opinion/article/2026/05/06/sweden-s-right-is-now-normalizing-the-far-right-party-born-from-the-fascist-movement_6753170_23.html) and [culture](https://www.errc.org/news/the-normalisation-of-neo-fascism:-anti-roma-racism-at-the-heart-of-europes-far-right).

If you want a more thorough and longer list of people, companies, and products, then I recommend reading up on [Devine Lu Linvega's](https://wiki.xxiivv.com/site/devine_lu_linvega.html) [Fashware](https://git.sr.ht/~rabbits/fashware) list on Sourcehut, as well as Drew DeVault's list of [Weird Little Guys](https://drewdevault.com/weird-guys/).

You may be in a position where the specific harms and rhetoric being spewed are not aimed at you, and you may have been coaxed into viewing what I'm saying here as overreaction, or as a rabid, self-righteous screed. Millions of dollars have been spent to ensure this, and it could not be further from the truth.

We cannot afford to continue to shrug off the presence of these people and their projects in open source. A united stand must be taken.

**Speak up on this**. Boycott aggressively. Let people know you don't support Cloudflare, Shopify, 37signals, Dell, 1Password, DigitalOcean, Alibaba Cloud, Framework, Block, Coinbase, Dropbox, TapTap, and any other company enabling the spread of dangerous and harmful political ideologies that will continue to result in further violence and death. And let people know the harm these companies are actively doing.

We cannot allow this to continue; we must be far more proactive and assertive in our fight against the normalization of fascism and the far right. We must be willing to sacrifice ease and convenience, and we must be willing to sever all connections with these entities.

It is our only way forward.

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