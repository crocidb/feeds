+++
title = "Phoneblogging"
description = "Around 2 billion people access the internet exclusively via smartphones, yet the IndieWeb community largely neglects mobile-first design and phoneblogging UX. A casual survey of writers reveals three approaches to mobile publishing: no phoneblogging, partial (drafts on phone, fin"
date = "2026-08-02T02:00:00Z"
url = "https://brennan.day/phoneblogging/"
author = "mail@brennanbrown.ca (Brennan Kenneth Brown)"
text = ""
lastupdated = "2026-09-08T09:41:46.939309308Z"
seen = true
+++

Of course, for my first post of [Blaugust](https://nerdgirlthoughts.game.blog/2026/07/15/blaugust-2026-is-coming/), what would I be writing about other than blogging? In all seriousness though, this is far more about UI/UX and accessibility, and I think it touches on something both important and neglected by the IndieWeb community.

In some webweaving circles, you'll see websites created that only work properly on a desktop screen. Sometimes this is due to coding difficulties—I've been there many times myself, media queries in CSS can be a difficult beast to tame! But other times, this is an intentional design choice, which I've seen on certain [NeoCities](https://neocities.org) sites, for example.

In conjunction with this, in the circles I'm in there's an understanding that the computer (laptop, desktop) is a better user experience compared to a tablet or smartphone. I literally just wrote a post about [my adoration for the personal computer](https://brennan.day/wow-i-love-the-puter/), so I'm contributing to the problem.

And it is a problem, because globally, [around 2 billion people access the internet exclusively via their smartphones](https://www.pewresearch.org/internet/fact-sheet/mobile/), representing half of mobile internet users. In 2019, [World Advertising Research Center predicted that number to be 3.7 billion people](https://www.cnbc.com/2019/01/24/smartphones-72percent-of-people-will-use-only-mobile-for-internet-by-2025.html), and it will most likely continue to increase. In the United States, 16% of adults (tens of millions of people) are smartphone-only internet users who lack home broadband.

I believe this is an existential problem for the IndieWeb currently. If people are designing their personal sites to be desktop-only, then they are alienating billions of people who only have a phone to access—and most are living in developing nations and the global south.

The Real Problem with Phoneblogging [](#the-real-problem-with-phoneblogging)
----------

But, luckily, this problem is solved by being more mindful that responsive design actually is important, learning how to implement it, and realizing that this is not something you can shrug off simply because you have a personal negative view of smartphones—whether due to your own problematic screentime or usage, or whatever.

This isn't the actual problem I want to write about, though. What I want to figure out is how someone can start a blog, or join the IndieWeb from their phone themselves.

This is a puzzling UX use case to solve—or at the very least, has been one that has been almost completely neglected.

When it comes to taking notes and coming up with a draft for a blog post, then your phone is a fantastic tool. There are numerous note-taking apps for both Android and iOS to choose from, many of which would sync automatically to your desktop—ah, but there's the rub!

Cross-platform options like [Obsidian](https://obsidian.md/mobile), [Simplenote](https://simplenote.com/), and [Google Keep](https://keep.google.com/) will sync notes across an Android or iOS phone and desktop. If you're inside Apple's walled garden, [Bear](https://bear.app/) gives you Markdown-native notes synced via iCloud, and [Drafts](https://getdrafts.com/) is built around capturing text fast (and being expensive) and routing it wherever it needs to go next—though neither of those two has an Android counterpart.

When it comes to microblogging a thought that's less than a thousand characters, phones are also excellent for that. Whether you're on [BlueSky](https://bsky.app/) or [Threads](https://www.threads.com/) or using one of the multiple well-designed Mastodon apps like [Ivory](https://apps.apple.com/us/app/ivory-for-mastodon-by-tapbots/id6444602274), [Ice Cubes](https://apps.apple.com/us/app/ice-cubes-for-mastodon/id6444915884), or [Mona](https://apps.apple.com/us/app/mona-for-mastodon/id1659154653) on iOS, or [Tusky](https://tusky.app/) on Android. This isn't the issue I'm trying to tackle.

No, I'm talking about full-fledged longform blogging. Rarely, if ever, do you find a comfortable user experience for the writing part. You're either constantly switching to symbols within the on-screen keyboard if you're writing in Markdown, or you're trying to press impossibly small buttons for rich-text formatting.

There are workarounds for the limitations of an on-screen keyboard. You could dictate your writing by speaking, or if you can afford a bluetooth keyboard (or one that can connect via your phone's charging port) then that too would vastly improve the experience.

And don't get me wrong, there are mobile apps that exist, though they're by and large siloed solutions tied to a single platform:

* **[WordPress](https://apps.wordpress.com/)**: the official app (also on [Google Play](https://play.google.com/store/apps/details?id=org.wordpress.android) for Android) lets you write, edit, and publish from your phone.
* ~~**[Ghost](https://ghost.org/changelog/android/)**:~~ ~~Ghost has an official Android app~~ Update: Ghost's Android app was discontinued. There's only [unofficial ones](https://play.google.com/store/apps/details?id=com.ghost.mobile). Thanks to [Sérgio](https://mastodon.social/@sdsantos) for pointing this out. but no iOS app. Apple users are stuck with unofficial community builds like [Ghost Publisher](https://forum.ghost.org/t/ghost-publisher-an-ios-app-for-ghost/13809).
* **[Medium](https://apps.apple.com/us/app/medium/id828256236)**: also on [Android](https://play.google.com/store/apps/details?id=com.medium.reader&hl=en-US) is fine for reading, and *can* do serious longform writing.
* **[Tumblr](https://apps.apple.com/us/app/tumblr-social-media-art/id305343404)**: also on [Android](https://play.google.com/store/apps/details?id=com.tumblr) is still going, still chaotic, and a good blogging platform underneath all the fandom noise, in my opinion.

Even Google's [Blogger](https://play.google.com/store/apps/details?id=com.google.android.apps.blogger) has an Android app. A cursory search on the iOS app store also showed me solutions like [Git Blog App](https://apps.apple.com/us/app/git-blog/id6759486108), which lets you commit directly to a Git-based static site from your phone.

I also want to shout-out here to [Pagecord](https://pagecord.com/), an independent blogging platform that is focused on giving people as many ways as possible to post. They have post-by-email, an Obsidian plugin, an iA Writer solution, scripts, Shortcuts, or "anything that can make an HTTP request. 🔌"

But writing is only one part of blogging. If you blog like me, you'll have dozens of tabs open at the same time—looking things up, adding sources, sharing links—and this only takes a couple key strokes or mouse movements on desktop, but is an infuriating slog on a mobile device switching back and forth constantly. And if you're on a low-end device, there's a good chance of a crash or losing work when RAM automatically tries to free itself up.

What Others Have to Say [](#what-others-have-to-say)
----------

I decided to [pose the question to my friends on Mastodon](https://social.lol/@brennan/117015965558924306) to see real-life examples of phoneblogging and was very happy with the diversity of results. Of course, this is purely anecdotal, but it does give a good insight into this.

### 1. No Phoneblogging [](#1-no-phoneblogging) ###

To start, some people do not partake in blogging on their phone whatsoever:

>
>
> Nah, writing on a laptop only. I need the commitment of sitting down, taking time out to do it, even if it's a short note. I might make a note on a phone occasionally.
>
>
>
> I use a static site generator, so it would be hard to publish on a phone anyway, but for me that's a plus.
>
>
>
> — [Paternoster @paternoster@mas.to](https://social.lol/@paternoster@mas.to)
>
>

>
>
> Low vision keeps me from interacting with my phone much. If I use it for anything related to blogging, it is most likely going to be for a photo.
>
>
>
> — [Emma @emma](https://social.lol/@emma)
>
>

>
>
> Absolutely no, desktop only.
>
>
>
> Fedi/bsky posts yes, chats yes, blog posts require a lot of concentration to write, and also I'm just not using an OSK [onscreen keyboard] for that.
>
>
>
> — [Alice @alice@mk.nyaa.place](https://social.lol/@alice@mk.nyaa.place)
>
>

### 2. Partial Phoneblogging [](#2-partial-phoneblogging) ###

Then there's a group of people who use their phone for drafts and note-taking, but then transition to finishing the blog post on their desktop:

>
>
> It depends when the idea hits me. If I'm out and about, I'll sketch or maybe even finish the post in the Notes app on my iPhone. I won't post from my iPhone though, I'll copy and paste when I get to my Mac (unless I'm really away, like a vacation). If I'm at my Mac, I'll probably just start writing directly in the blog editor.
>
>
>
> — [James Huff @macmanx](https://social.lol/@macmanx)
>
>

>
>
> Not really. For a while I used the WordPress app occasionally, but I always had to go back and clean things up from the website afterward.
>
>
>
> Add that my phone typing has gotten worse over time (or maybe the onscreen keyboards have), while my physical keyboarding has gotten better. (That kinda surprised me—after how many decades of typing, suddenly I'm touch-typing more reliably? How? And it's not like I stopped typing on phones either, so why has *that* changed?)
>
>
>
> I guess the closest I get to blogging from my phone now is when I write a social media post (or thread) that I later fix up or expand, or when I jot down notes that I build on later. I'd much rather connect a tablet to a smallish keyboard than deal with the tiny screen and tinier touch-points if I'm going to write anything longer than, say, this.
>
>
>
> — [Kelson @kelson@notes.kvibber.com](https://social.lol/@kelson@notes.kvibber.com)
>
>

>
>
> I'll sometimes build outlines with it using the app Journelly. I never finish them there though. The outline typically gets imported into the app I use on my computer to finalize things.
>
>
>
> (And to be clear when I say build I mean create and write. It's not AI but typically a bulleted list of notes I make myself in the approximate order I'll want them in the end result)
>
>
>
> — [Brandon @mbjones](https://social.lol/@mbjones)
>
>

>
>
> I don't publish from my phone, but I occasionally like to thought dump on the go. My workflow includes a folder of MD files so I just pop open Obsidian with a template for the date and title, and write in a bullet-point list format. It's easier for future me to edit and reorganize my thought process when it's small chunks. I also prefer to write in simple sentences, since I'm not great at typing longform when I can't catch most of it.
>
>
>
> Sometimes, if I have enough privacy (which isn't often) I do voice-to-text, again for drafts, not final versions.
>
>
>
> — [Hatch @binomech](https://social.lol/@binomech)
>
>

>
>
> Wouldn't call myself a blogger (relevant to your last blog post haha) so feel free to discard this reply, but the few times I've written something that wasn't (fan)fiction, it depended on where I was, what I was doing, and how long I expected the piece to be.
>
>
>
> I think my Design Philosophy piece was written mostly in Ellipsus on my phone, but I don't really remember: [https://www.mrnnki.com/writing.php?id=6](https://www.mrnnki.com/writing.php?id=6)
>
>
>
> I expected it to be longer than it ended up being.
>
>
>
> My Name Is Mrnnki was definitely written on my phone: [https://www.mrnnki.com/writing.php?id=12](https://www.mrnnki.com/writing.php?id=12)
>
>
>
> I was at a brew barn listening to some music and thinking about online identities.
>
>
>
> Bluesky Sucks was written on my computer, directly in HTML: [https://www.mrnnki.com/writing.php?id=13](https://www.mrnnki.com/writing.php?id=13)
>
>
>
> I was at home and already working on something for my website, determined to rewrite my old Tumblr post into something a bit more accurate.
>
>
>
> Direct publishing to my website from my phone is not something I'd ever do, hah. I'd have to make the admin panel for it myself, and keeping that secure wouldn't be fun
>
>
>
> — [Mrnnki @mrnnki@problemeowtic.net](https://social.lol/@mrnnki@problemeowtic.net)
>
>

### 3. Full Phoneblogging [](#3-full-phoneblogging) ###

To my surprise, there are quite a few people who do, in fact, use their phone to blog! And I love their solutions to this:

>
>
> I do, I have a micropub endpoint for my static site and make use of it a lot. On mobile, I usually only fix typos, add a sentence or two, upload images. For the bulk writing I prefer my laptop, but I'll often prepare drafts on my laptop and then publish later from mobile via micropub. The existing clients could use some love though. I hope it becomes more popular, it's such an underrated protocol IMHO!
>
>
>
> — [Ruben @kedara](https://social.lol/@kedara)
>
>

I've set up a [Micropub endpoint](https://brennan.day/posting-to-your-static-site-with-quill-and-micropub/) for my own blog! Funnily enough I haven't ever used it. Silly me.

>
>
> I do. I write the majority of my notes from a dedicated page that's kinda like a social media post UI (screenshot attached). I occasionally write longer, standard posts from my phone too, but that's rare and usually shorter posts, like the Linkception post from last night—that was written on my phone.
>
>
>
> Most often I use my phone for notes or adding drafts when I have an idea.
>
>
>
> — [Kev Quirk @kev@fosstodon.org](https://social.lol/@kev@fosstodon.org)
>
>

>
>
> Oh, I used to! In 2021 I wrote [a blog post about updating my Hugo blog from my phone](https://www.jayeless.net/blog/updating-my-hugo-blog-from-my-phone). After that I moved to a git CI/CD setup with Indiekit to update my blog from my phone... but it was too janky and unreliable; I ended up strongly preferring to just wait until I was at my computer to post.
>
>
>
> — [Jessica Smith @jayeless](https://social.lol/@jayeless)
>
>

>
>
> Absolutely. With the help of #Obsidian. For my Notes I have there a simple creation workflow, with templates and the help of the plugin #Templater. My Posts and their drafts are created on my laptop, but synced to Obsidian to write on wherever I am. With this my phone is just one computer I can use to write.
>
>
>
> — [Kristof Zerbe @kiko@indieweb.social](https://social.lol/@kiko@indieweb.social)
>
>

>
>
> I do it quite a lot, because I'm mostly in bed and getting the laptop out is a hassle. Funnily enough what gave me the confidence that I could do it without a large editing surface and tooling is that I once built a blogging platform to which you can post directly from the terminal as an exercise when I had to learn Rails for work.
>
>
>
> — [Anna Miriamsdochter @venite@mastodon.nl](https://social.lol/@venite@mastodon.nl)
>
>

>
>
> I'd say 90% of my blogging is done on the phone. From photo shooting, editing, writing, to publishing, everything happens on the phone.
>
>
>
> Same percentage of reading on the same device. If the site doesn't work on mobile, I'll probably get it via RSS, or not at all.
>
>
>
> — [maique @maique@social.lol](https://social.lol/@maique)
>
>

>
>
> I do. I optimised the wiki for just that. I have an "edit this page" link and a "add to this page" link. Since adding new pages needs a way to type their name before I can edit it, there's a form that provides this, containing the date. When adding to a page that has a name that starts with a date, the addition also starts with a date. When saving a page, links to it are automatically added from the front page and from hashtag pages so no extra edits are required.
>
>
>
> — [Alex Schroeder @alex@social.alexschroeder.ch](https://social.lol/@alex@social.alexschroeder.ch)
>
>

I absolutely love Alex's solution, and the coolest part is that he made it himself! Please check out his project [Oddmu](https://alexschroeder.ch/view/Oddμ)

Results [](#results)
----------

First, I want to take a moment to appreciate these responses. I only sent out this question yesterday, and I received so many responses from writers I admire. I am so grateful for this community, and it is one of the reasons I am such an advocate for the IndieWeb in the first place. I'm sure there will be more replies by the time I post this.

Second, people are creative and resilient, surprise surprise. People find ways to phoneblog despite the limitations and constraints.

But these solutions do, for the most part, require technical know-how that most people don't have. I'd love for there to be more accessible, simple ways to blog from your phone while maintaining the IndieWeb ethos.

The mobile web is exactly where corporate media platforms thrive. Years and billions of dollars of research have gone into making Instagram, Facebook, TikTok, Twitter and co. as addictive as possible, regardless of the detrimental social consequences that has caused in its wake.

I don't like writing about a problem where I have no proposed solution, but I think awareness is a good first step. The IndieWeb must make mobile-first a priority, not something to scoff at. We must find sustainable, accessible ways to make phoneblogging fun!

### Coda [](#coda) ###

During my research for this post, I found an even more astonishing fact. [3.4 billion people still don't have access to the Internet *at all*](https://www.forbes.com/sites/johnkoetsier/2026/02/18/34-billion-people-dont-have-access-to-mobile-internet-costing-the-global-economy-3-trillion/). Nearly half the world remains offline. It is completely incorrect to assume the Internet connects us all. We still have so much work to do.

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