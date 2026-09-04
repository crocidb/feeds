+++
title = "Making My Content More Easily Digestible"
description = "A few readers gently pointed out that my posts have grown far too long and too dense to comfortably get through, so I set out to turn one of them into a more digestible format, to try and see if this is something my readership finds worthwhile."
date = "2026-07-04T09:09:40Z"
url = "https://xn--gckvb8fzb.com/making-my-content-more-easily-digestible/"
author = "marius@xn--gckvb8fzb.com (Marius)"
text = ""
lastupdated = "2026-07-06T19:13:35.439746028Z"
seen = false
+++

Over the past few months a recurring theme has emerged in my inbox, as well as within the [community channel](/contact/#xmpp), and it is one that I have been chewing on for a while now. Several of you have, kindly and very politely, told me more or less the same thing, which is that even though the topics I write about are interesting enough, the posts themselves have grown so long and so dense that actually getting through one of them has turned into something of a commitment rather than the casual read it probably ought to be.

I cannot really argue with that, because it is true. Whenever I sit down to write about something like [*Bureaucracy is Eating the World*](/bureaucracy-is-eating-the-world/), or [*A Word on Omarchy*](/a-word-on-omarchy/), or [*Doubting Your Favorite Web Search Engine*](/doubting-your-favorite-web-search-engine/), I find myself pulled in two directions at once. On the one hand I want to be accurate and diligent, which in practice means citing my sources, anticipating the counter-arguments, and walking through the reasoning (and in many cases evidence) step by step instead of asking the reader to simply take my word for it. On the other hand I am painfully aware that the result of all that diligence is, more often than not, a wall of text that runs to several thousand words.

In those posts in particular I clearly landed on the wrong side of that trade-off, and the feedback was entirely fair. The information is, I think, worth having, but the packaging asks a lot of the reader, and not everyone who might benefit from the content has the hour or so of uninterrupted attention that getting through it properly demands.

**Note:** Yes, I am perfectly aware of the irony of writing a not-exactly-short post about how my posts have become too long, but bear with me here for a moment.

A more digestible format
----------

[![](/making-my-content-more-easily-digestible/images/video-export_hu_124efbb8992c0cbb.webp)](/making-my-content-more-easily-digestible/images/video-export.jpg)

What the feedback really did, though, was hand me an idea. Rather than butchering the original write-ups down to a length at which they would lose the very nuance that justified writing them in the first place, I figured I could instead try to produce a second, more compact version of my most detailed pieces. One that lives alongside the original rather than replacing it.

I decided to start with [*Bureaucracy is Eating the World*](/bureaucracy-is-eating-the-world/) simply because it is one of the longest, and densest, and newest write-ups. And when you ask yourself what tends to be more digestible than a multi-thousand-word essay, the answer that most people arrive at almost immediately is *video and audio*, both of which you can consume while doing the dishes, commuting, or otherwise not staring at a screen full of paragraphs.

So I started fiddling around with a whole handful of different programs and apps, trying to work out a reasonable pipeline for turning the written text into something more compact and considerably easier to consume, and it turned into a much deeper rabbit hole than I had naively assumed it would be when I started.

Giving the post a voice (but not mine)
----------

[![](/making-my-content-more-easily-digestible/images/speech-synthesis_hu_69599dcd2023aa0a.webp)](/making-my-content-more-easily-digestible/images/speech-synthesis.png)

The first piece of the puzzle was the narration, and here I worked my way through a zoo of *“AI”* text-to-speech services before ultimately settling on a service called *ElevenLabs* to generate the spoken version of the existing post, mostly because the quality of the output was, to my ears at least, the least robotic and the easiest to listen to for any extended stretch of time.

Now, the obvious question, is why I would hand my own words over to a machine to read out loud rather than simply recording myself, which would arguably be more authentic and would certainly have involved less fiddling. The answer, predictably for anyone who has read more than a post or two on here, is **privacy**.

Your voice is not merely a sound, it is a biometric identifier, just as much as your fingerprint or the geometry of your face, and the moment you put a sufficiently long, clean recording of it onto the public internet you have effectively handed anyone who cares to grab it the raw material they need to clone it. Voice cloning has, over the past couple of years, gone from an expensive novelty to something that runs on consumer hardware off a few seconds of reference audio, and it is already being used in the wild to defraud people, whether that takes the shape of the classic *“grandchild in trouble, please wire money”* phone call, or the more targeted corporate variety in which an employee approves a transfer because the *“CEO”* apparently rang and asked them to.

On top of the outright fraud there is the machinery of surveillance capitalism, which will happily fold a *voiceprint* into the (shadow-)profile it is already busy assembling on every single one of us, cross-reference it against the recordings collected by smart speakers, call centres, telecommunication companies, and who knows what else, and then use it as yet another durable identifier that follows you around regardless of which account you happen to be logged into or not. I am simply not willing to surrender my right to my own voice, along with a measurable chunk of my privacy, in exchange for the modest convenience of having a blog post read aloud, especially not when a machine can today do that very job equally well and at a quality that is, for this particular purpose, entirely sufficient.

Giving the post a face
----------

[![](/making-my-content-more-easily-digestible/images/sfm-glitch_hu_2ccf0eb5a5bcf48e.webp)](/making-my-content-more-easily-digestible/images/sfm-glitch.png)

With the audio sorted, I needed something for the viewer to actually look at, and this is where the project spiralled into something far more involved than I had anticipated. My initial plan was to do everything in [*Blender*](https://www.blender.org), which is the obvious, powerful, free and open-source choice, but the learning curve on *Blender* is famously steep, and after a few evenings of mostly fumbling around I had to be honest with myself about the fact that I was spending far more time fighting the software than producing anything watchable. I therefore ended up reaching instead for [*Source Filmmaker*](https://store.steampowered.com/app/1840/Source_Filmmaker/), or *SFM*, the slightly ancient animation tool that *Valve* built on top of the *Source* engine, purely because its learning curve is so much gentler than *Blender*’s and because it let me get the job done without first having to become a 3D animation expert.

Where things became tedious, however, was the animation itself. My first instinct was to take the lazy route and let *motion capture* (*“mocap”*) do the heavy lifting, so I gave [*Rokoko*’s](https://www.rokoko.com) *video-to-mocap* tool a try, hoping that I could simply feed it some footage and get usable animation data back out, but it failed pretty miserably, probably because I didn’t have the space nor the equipment (multiple cameras) to set it up properly.

I then went looking for alternatives, and discovered that you can, for instance, pair an old *Xbox Kinect* with various bits of software (the likes of *Brekel*) that are able to spit out *FBX* files, which in turn can be used to drive the characters. The catch is that the pipeline of exporting the *SFM* animation, importing it into *Blender*, and then using *Rokoko*’s retargeting plugin to map the captured motion onto the *SFM* model is a fiddly, multi-step affair, and the end result, no matter how patiently you tweak it, will never come close to what you would get out of *Rokoko*’s actual motion-capture suit and gloves, which I do not own and was not about to buy for a single experimental video.

So I abandoned the shortcuts altogether and animated every sequence by hand instead, and even though the individual sequences are fairly simple and relatively short, doing it this way still took a considerable amount of time and not a small amount of patience. *SFM* is, after all, a fairly old piece of software that carries a noticeable amount of quirks, and the [*StarBook*](/a-brief-review-of-the-star-labs-starbook-mk-vi-ryzen-ultrabook/) that I happened to be running this entire experiment on was, to put it generously, never the right tool for 3D animation work in the first place.

To make matters slightly worse, I was unable to coax *SFM* into exporting anything above 720p, no matter how I adjusted its startup parameters, because anything beyond that resolution would come out glitchy and unusable, so 720p is, for this first attempt at least, simply what we are working with.

The result
----------

All of this rather long-winded preamble is simply to say that what follows below is a first experimental attempt at presenting one of my denser posts in a format that some might find easier to digest than the original wall of text, in the hope that it piques the interest to dive deeper into the topic. The whole point of this is to find out whether the slice of my readership that feels buried under several thousand words actually prefers something like this, or whether the effort is better spent elsewhere. Keep in mind that the video is nevertheless a *compressed* version of the original post, that does not include every little detail, as it would have otherwise, too, grow out of proportion.

You can [find the result here](https://odysee.com/@xn--gckvb8fzb.com:7/bureaucracy-is-eating-the-world:6), or, if you happen to have JavaScript enabled [despite my warnings](https://disable-javascript.org), below:

<iframe src="https://odysee.com/$/embed/@xn--gckvb8fzb.com:7/bureaucracy-is-eating-the-world:6" style="position: absolute;
                 top: 0;
                 left: 0;
                 width: 100%;
                 height: 100%;
                 border: 0" allowfullscreen="" scrolling="no" allow="encrypted-media *;">
  </iframe>

---

If the response is positive, then I might well turn these into a more regular thing. If it is not, then at the very least I will have learned a fair bit about text-to-speech, *Source Filmmaker*, and the *dark art* of motion capture along the way, which is hardly the worst outcome.

Either way, I would very much appreciate your honest feedback on this, so please do let me know what you think, whether this format could work, whether the pacing and the visuals help or hinder, and whether this is something you would like to see more of going forward. As always, you know [where to find me](/contact/).