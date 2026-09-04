+++
title = "My thoughts on Flatpak (that nobody asked for)"
description = "Hindsight preface: This was written in very tired state.I have been chatting about this with people who know more than I ever will about Flatpak.Soo I have added few edits here and there.If I seem frustrated, most of my frustration is aimed at the unnecessary shit slinging over p"
date = "2023-06-09T00:00:00Z"
url = "https://akselmo.dev/posts/my-thoughts-on-flatpak-that-nobody-asked-for/"
author = "Akseli"
text = ""
lastupdated = "2026-05-27T23:22:57.084477711Z"
seen = true
+++

Hindsight preface: This was written in very tired state.

I have been chatting about this with people who know more than I ever will about Flatpak.

Soo I have added few edits here and there.

If I seem frustrated, most of my frustration is aimed at the unnecessary shit slinging over packaging formats.

*We all want the good stuff, why the hell are we fighting?!*

---

Might as well, since everyone else is doing this.

First off, I am just a dev, and mostly a *user*, not packager and...

**I don't really care about the packaging format, as long as it works.**

Anyhow, these are my current thoughts on them, both positive and negative.

[I get the thing I want](#i-get-the-thing-i-want)
==========

I like Flatpaks when I am using an ancient system like Debian Stable, and still if it has Flatpak support, I can download actually usable versions of many applications. Even nightly versions!

This is good. I like this.

[flatpak run blabla.org.bla.bla.bla.com.eu.biz.exe.yes](#flatpak-run-blabla-org-bla-bla-bla-com-eu-biz-exe-yes)
==========

Flatpaks are clearly made GUI applications in mind, but still, typing that whole prose of commands *and* having to remember the `org.com.package.eu` lines hinders terminal UX.

Sometimes you just need to run things through terminal to debug things, or maybe you want to make a new shortcut of the app, or whatever. Maybe you want to even make a terminal application into a Flatpak app!

Typing that massive command really deters using flatpaks for terminal applications too, because every time you install apps, you have to make an alias or memorize the magic words.

Flatpak, when installing an application, should just create that for you.

Yes there's third party solutions. But the solution should be first party one.

But it is a minor nit in the end and I can live with it.. But I am gonna complain about it from time to time due to my bad memory lol.

[Flatpaks *can* take sometimes too much space](#flatpaks-can-take-sometimes-too-much-space)
==========

The more packages you install through Flatpak, the more it "pays off."

This makes sense in systems that use mostly or always Flatpaks.

But when you mix and match, because, as a user *you really don't care, you just want the app to work* you may be frustrated to suddenly see your laptop with 256gb SSD losing big portion of it's space to the 5 apps you installed with dependencies, that do not match and can't be reused.

If you're starved for space, you may be better off just uninstalling Flatpaks in general and then using native packages, which (hopefully) your distro manages for you so that the dependencies are shared.

**And no, saying "bro, just buy more space, bro" is not an excuse.** Not everyone has that luxury, especially if they live in poorer countries and such. It's time to stop this silly notion of making things bigger because "well we have so much space now."

So if you need to ooze everything out of your system space, you may want to avoid Flatpaks if you don't install *everything* from there.

But if you're using a distro that uses Flatpaks for everything, your file usage is going to be very similar like with native packages. Unless every app has different dependencies even if they're based on same framework.

There really is no good or bad here. Just different use cases.

Edit: I have heard very different opinions on this. My thoughts on this have not changed, but I do believe it works for some but not for all. I think we need more benchmarking and actual evidence to make further claims.

So take my point about this with the "source: me and my pals" level.

[Permission management](#permission-management)
==========

This is where I tend lose my marbles with Flatpaks. (But it's not really Flatpaks fault)

There are times when the app is uploaded to Flathub by some random and they never really checked what permissions the Flatpak actually needs.

So the it can be either leaking like a sieve or not working at all.

Luckily, I see this less often, but only if the app is sent to Flathub by the people who know what permissions are actually needed.

Still, there are times when I have to install Flatseal (Luckily KDE has it's own permission manager now!) and fiddle with some switches until the app does what it was actually designed to do. This is especially noticeable by programming tools like text editors.

So I just usually end up giving all the permissions. *I just want the app to work.*

And if even then it doesn't do the thing I need it to do, I just use a native package.

~~Having Android style pop-up asking for permission when the app needs it could be good solution for this.~~ Edit: [Apparently this *is* a thing with portals.](https://theevilskeleton.gitlab.io/2023/05/11/overview-of-flatpaks-permission-models.html) That is super neat. I just didn't know, possibly because I'm on KDE Plasma. Plasma *can* use portals for this too, but KDE priority is now to get Qt6 out and working.

On the flipside, when installing random apps, I do feel a bit more safer. But I do not know if it's a placebo, due to the fact that I am reaaally not a security expert. :P

[Where are my files???](#where-are-my-files)
==========

Sometimes when installing an application from Flatpak, one expects to get multiple applications. My best example for this is Xonotic: Xonotic comes with the game binaries and dedicated server binaries.

I tried to find those with the Flatpak I was using for Xonotic but I could never find them.

Backing up configs can be a mystery too. Flatpak could have some integrated configuration manager or something that helps users syncing their configs easily.

Edit: Seems to be out of scope, but personally I do believe Flatpak would just benefit from this.

[Github](#github)
==========

Why the hell is all Flathub related stuff on Github? Is it to save on hosting costs or something? If so, I hope Flathub can move on it's own system soon.

In general I am tired of everything being tied to Github, but that's a separate rant.

Learn from Twitter and Reddit: Do not build your thing around **just one** corporate owned service. It *will* end up badly. I've seen in the future with my tinfoil hat, and I know.

Trust me, bro.

[To sum it all up..](#to-sum-it-all-up)
==========

**I really don't care about your packaging method. I care that the app works as expected when I launch it.**

So far native packages have been better in my experience when it comes to this.

[But I am not a "Flatpak hater!"](#but-i-am-not-a-flatpak-hater)
----------

**I do want these to work!**

Because when it works it's awesome. It makes distributing files much easier.

I think sandboxing is a cool feature (if it is not just a placebo, I am no security expert). I can use newest coolest shiny things on distros that get updated once in a decade.

I just don't think the current solution is The Solution yet. It needs refinement and the above negative points are the papercuts that put me off of using it.

**But I root for you, Flatpak. I think you're onto something really good in here.**

PS. And I am tired also of some people thinking that, like Rust, it's the Holy Solution To Everything Ever. There's no such thing when it comes to computers. I want to be wrong though.

PPS. I hope I didn't type too "angry" here. I blame my lacking english skills. And lacking social skills. And just lack of skills in general. Skill issue(s).

**No dislike towards anyone who works on Flatpak, just absolute pure respect.** This stuff must be difficult to work on especially when some part of internet seems to always be screaming when something is done to it.

This post was just me whining a bit, here in my tiny corner of the internets.

glhf.