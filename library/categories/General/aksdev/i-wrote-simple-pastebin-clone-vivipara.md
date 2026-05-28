+++
title = "I wrote simple pastebin clone: Vivipara"
description = "I just spent this weekend writing my own little pastebin clone, called Vivipara. I also have bunch of thoughts about various programming languages. Read about it all in this one blogpost![Vivipara, my smol and quick text paste service](vivipar"
date = "2026-05-10T22:34:00Z"
url = "https://akselmo.dev/posts/vivipara-and-languages/"
author = "Akseli"
text = ""
lastupdated = "2026-05-27T23:22:56.951964974Z"
seen = true
+++

I just spent this weekend writing my own little pastebin clone, called [Vivipara](https://sr.ht/~akselmo/Vivipara/). I also have bunch of thoughts about various programming languages. Read about it all in this one blogpost!

[Vivipara, my smol and quick text paste service](#vivipara-my-smol-and-quick-text-paste-service)
----------

For a while now, I have been looking for some sort of pastebin clone for myself. However, all of the ones I could find seem to be rather public: Anyone can create a paste.

What I wanted is only *I* can create pastes, but anyone can read them.

I used [Privatebin](https://privatebin.net/) for a while, even tried self-hosting it, but it was a bit too much for my simple needs. I just need to share a backtrace occasionally. I also try to avoid javascript if at all possible, so that this can be run in any browser.

So I thought hey, I'm gonna try make my own. Why not, seems like a fun weekend project.

![My lizard fursona making an laugh face.](/assets/images/emotes/laugh.png)

And it was fun!

I genuinely enjoyed thinking this project through. In the end, it turned out to be very simple and smol. Very [smolweb](https://smolweb.org/) friendly, too!

You can see a demo-paste in here: [https://paste.akselmo.dev/paste/akseli/f2c85d38-2600-4263-8ea2-a337feaeb195](https://paste.akselmo.dev/paste/akseli/f2c85d38-2600-4263-8ea2-a337feaeb195)

The creation process was not that bad. [Go](https://go.dev/) language was really easy for my lizard brains to understand, so I could just start creating the site. There's little technical nitty gritty to talk about, in the end this is very simple Create and Read webapp. Deletion is handled automatically by the application, if user has set the items to be deleted. Currently the files have all same deletion date, I'd like to make that file specific at some point.

![My lizard fursona making an smug face.](/assets/images/emotes/smug.png)

No "AI" was used when creating Vivipara, it's all artisanal, handcrafted slop! I will avoid those tools as long as I can, since they would take the fun of the craft away from me, and make the learning process much more difficult, if not impossible.

Now I was going to try to make this with [Zig](https://ziglang.org/) at first, but ended up settling with Go. Which gets me into the language thoughts..

[Thinking about programming languages](#thinking-about-programming-languages)
----------

As much as I want to make ideological choices a priority, sometimes I just have to admit that the pragmatic choice prevails. In this case it was using a language that excels in the specific field (Go and web) because that was the only way I could create what i wanted in reasonable time, with reasonable effort.

![My lizard fursona making an sad face.](/assets/images/emotes/sad.png)

My ideological side is of course not very happy on relying anything by Google.

Had i more free time, I would follow those ideological choices more, I think: I would try to use a language that is very "underdog" and avoids anything corporate, such as Zig.

Zig community has very much the values I share, so my ideological side would love to join the fray and use it as much as possible. I applaud the effort that has gone into the language.

![My lizard fursona making an laugh face.](/assets/images/emotes/laugh.png)

Also Zig mascots are cute lizards, of course I want to use it!

Buut.. It wasn't in the cards in this time.

*I also have some bonus thoughts on couple other languages, though I did not use them this time.*

### [Zig](#zig) ###

Learning this language is very difficult for me. There are not many good examples I could find, though search engines are dreadful these days so it's possible I missed something.

Zig does have a HTTP server stuff in it's stdlib, but I could not find any good examples how to set up anything.

And when I do find examples, they're always out of date and incompatible! Zig moves really fast, changing and refactoring things, so the language suddenly moves a feature to somewhere else, and I'm following a guide that is too old, so I get confused..

Seems most people who like the language have been there from the start, so they know when things change and know where to go. They understand the basics of the language already, so adapting to changes is easier and easier every time.

But little ol' me? I have no idea where to even start. I can write a hello world, sure, but anything more complicated I am at loss. I thought writing this pastebin clone would be simple way to learn a language: Listen requests, serve web pages, save files. That's all it does, essentially.

So where I ended up is: I *want* to use Zig, but I *can't* even learn it! I mean sure, I could spend week(s) to learn it, but this was supposed to be a weekend project. Thus for my smol brains, learning Zig is not a weekend thing. Especially when things keep changing and guides are out of date often.

I really hope Zig stabilizes soon enough for me to start properly learning it. I am very keen to learn it. I'd like to write a game with it. But at the moment, the effort required is too much, as I already have a dayjob with wrangling C++.

![My lizard fursona making an grumpy face.](/assets/images/emotes/grumpy.png)

Also the Zig language server had some issues where it sometimes showed I'm doing things wrong and sometimes not.

### [Go](#go) ###

Go surprised me. It was so easy to pick up and just start tinkering with. The syntax is small and concise, I can just.. Get it. Within a hour or two.

It was refreshing to work with a language that just lets you do things instead of figuring out how to do even *start* doing things.

The documentation I could find for it was rather good, though there is a lot of "AI" slop sites that were annoying me and giving me false info. But mostly the official docs were good enough.

Even I knew nothing, I could still create something useful for myself while learning the language. It was just that easy for me to get in the flow and just have fun writing Vivipara.

I also found out that I don't really mind `if err != nil` that much, but maybe it's because I have only spent one weekend with the language, not years. :D

Of course, the whole Google problem is there, so I'm not very happy about that, but this was the pragmatic choice and I'm glad I made it this time.

I also think that Go will pretty much replace Python for me in my toolbelt, for the most part at least. The tooling and distribution of Go applications is thousand times better than with Python, in my opinion.

So yeah, I think I like Go, despite some of it's warts. One of my favorite languages for sure.

### [Bonus: Rust](#bonus-rust) ###

"But why not Rust?" the 🦀 in the audience asks.

Honestly.. I'm bit afraid of this language and the learning curve.

Every time I've tried to use it, I get confused by the syntax. The lifetime syntax being `'` is for example something I easily just glance over. Maybe I need my eyes checked, I don't know, but that symbol is just way too easy to miss!

But I believe I can make it work for myself. I just wanted to try Go this time.

I am planning to write a new driver for my [TuftySysMon](https://git.sr.ht/~akselmo/TuftySysMon) project. Currently it's a Python script, but I want to replace it with a Rust application.

Whenever I'll tackle that, I'll let you know how it goes! I do want to learn Rust, because it's being used more and more in KDE stuff too!

### [Bonus: Hare](#bonus-hare) ###

I really admire the goal of [Hare being stable for long time](https://harelang.org/blog/2023-11-08-100-year-language/). The community behind it seems to share very much my values, and I *love* "boring" languages.

Sadly it's not usable for me yet: I am very much dependant on language servers. I wish it wasn't like that, but let me explain.

My ADHD can be rough. I lose track of time easily. I confuse myself easily, I forget what I was doing.. Language servers help me keep my focus: They help me avoid context switching.

Instead of going through documentation in another window, typing stuff in another window, I can read documentation in my editor. I can also go through all the available functions, variables etc. within the editor. For me it's very common to open a documentation, read about a Thing, then go back to editor.. And I already have forgot the name of the thing! Like, super common. Happens daily.

I can jump around the code really easily, without having to search stuff (in Kate this is CTRL+Click a symbol), so I don't forget how I was going to do something.

I also get distracted easily. The amount of times I open browser to read documentation but end up browsing something else is too high. And then I forget what I was doing.

When everything is inside the editor, I do not have this issue as much.

I guess one could say "Skill issue" and sure, but my ADHD does what it does. Rapid context switching is very much a mind killer for me.

So when Hare gets a language server implementation that is daily driveable, I'm going to use it for something. Write a small game with it. Because everything else in that language is very appealing to me. And I believe I will love it way more than Go.

[That was many words](#that-was-many-words)
----------

Here you go, long incoherent ramble.

Anyway, if you are going to self-host Vivipara, [let me know!](https://lists.sr.ht/~akselmo/vivipara-discuss)

And yes, I moved to Sourcehut recently! I am very interested in trying the email workflow and I genuinely like how the site looks and feels like.

I am still keeping my donations up for Codeberg and will likely use it for some projects. :)

That's all for this time, thanks for reading!

[](https://brid.gy/publish/mastodon)