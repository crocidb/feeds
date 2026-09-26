+++
title = "Some Old Expectations for the New Apple"
description = "In Nilay Patel’s Decoder conversation with Mark Gurman about John Ternus and Apple’s next big thing, Gur"
date = "2026-09-22T07:09:00Z"
url = "https://taoofmac.com/space/blog/2026/09/22/0709?utm_content=atom"
author = "Rui Carmo"
text = ""
lastupdated = "2026-09-23T18:25:00.350252399Z"
seen = false
+++

In [Nilay Patel’s Decoder conversation with Mark Gurman](https://www.theverge.com/podcast/996874/apple-john-ternus-tim-cook-mark-gurman-future-ai-siri-iphone?utm_campaign=unsolicited_traffic&utm_medium=web&utm_source=taoofmac.com) about John Ternus and Apple’s next big thing, Gurman describes something camera-equipped AirPods might eventually do: look at an email on your computer screen and help add an event to your calendar. And that was when he lost me.

The email is already on a computer, and by all accounts of how computers have worked for the past decade, the software running on it ought to be able to add an event to a calendar. Introducing a camera seems like a roundabout way to get past the [data silos I’ve been complaining about](/space/blog/2018/12/09/1852#sitting-at-the-crossroads-of-computing-paradigms) for years.

Not that it wasn’t a *good* Decoder episode (I’m a regular listener), but it was a very mixed bag and I have… feelings about it, especially because a lot of the discussion revolves around finding Apple’s next huge business. But I am more concerned about the *now* than vague hypotheses–I expect something different from the devices I already own.

And I also expect Apple to get its act together in many other ways.

[

Another Centrepiece
----------

](/space/blog/2026/09/22/0709#another-centrepiece)

Gurman thinks Ternus will need a new centrepiece for Apple, something that takes over from the iPhone. He traces a progression through the Mac, iCloud and now AI, with glasses and screenless devices as possible next steps. This is a very typical “next big thing” expectation and something that would be natural for Apple to pursue, but it feels off (and a quintessentially outsider take) to me considering their trajectory so far.

Cook built an extraordinary manufacturing and logistics organisation, and I’ve [given him credit for that](/space/links/2026/09/01/0750#tim-cook-s-final-message-as-apple-ceo). Maintaining growth at that scale is an unenviable task, but I’d like to hear more about improving the products it already sells. Near the end of the episode, Nilay observes that he doesn’t really need a new Apple TV, and guess what, a device that does its job for years is a perfectly good outcome for me, too.

But I just don’t get the yearning for another centrepiece to Apple’s portfolio. As an example, I [wanted something like the iPad in 2004](/space/blog/2004/03/06#the-perfect-pda), and was [delighted when it arrived](/space/blog/2010/01/28/2331#five-years-later-people-go-crazy-about-the-one-apple-product-that-i-wanted-all-along). My requirements were mostly about reading, writing and getting at my information without carrying around a laptop. A folding screen might help with some of that, sure, and [the Duo](https://www.theverge.com/tech/991203/iphone-duo-foldable-news-specs-price-release-date?utm_campaign=unsolicited_traffic&utm_medium=web&utm_source=taoofmac.com) might be an answer, but the way Apple has stuck to artificial software restrictions still puts me off.

[

Models and Shared Calendars
----------

](/space/blog/2026/09/22/0709#models-and-shared-calendars)

And yet, I think there is a more fundamental issue that industry pundits keep harping on and circling around, which is that Apple *really* doesn’t know what to do with AI–it’s like some sort of fundamental impedance mismatch.

Patel and Gurman question Apple’s failure to build a competitive frontier model given how much effort it put into owning its silicon and modems. Later, Gurman argues that Apple could follow a successful OpenAI device quickly, because models are becoming commoditised and another supplier would work with Apple. But *why should Apple*? What is the incentive for them to do that, and how would they differentiate?

The huge gaping hole in Apple’s in-house model strategy isn’t new (and, to me, the biggest indicator of that impedance mismatch, since Gurman says he has seen no evidence of major AI acquisitions or huge pay packages to attract researchers), but I think Patel and Gurman are conflating two different things.

If a third-party model would let Apple compete with that hypothetical device, why is owning a frontier model essential to making a useful assistant? Relying on Google gives Apple a dependency to worry about, yes, but we’ve seen that before in search, maps, etc. That dependency doesn’t explain why Apple still *can’t use the models properly*, or why so much of the software Apple *does* own is still so difficult to use together.

Siri needs to carry out a request correctly, using the right information, without leaving me to spend more time checking the result than it would have taken to do it myself. And yes, it’s improved, but it’s still hampered by Apple’s single-user mindset.

Ironically, this does tie into the “home hub” concept, too. Bear with me.

When I wrote about [the family assistant I wanted Apple to build](/space/blog/2026/05/14/1220#the-siri-for-families-apple-will-never-build), I was concerned about the immediate circle: shared calendars, reminders and keeping a household running. Smaller models can handle the intent parsing for those jobs–provided the application code checks which data the family member making the request may access and which actions the agent may take on their behalf. A more capable model doesn’t fix inaccessible task lists or the way iCloud treats a family as separate accounts sharing a payment method–and this is just my particular concern; there are *dozens* of integration surfaces that Apple just keeps ignoring.

The home hub Gurman describes would recognise who is standing in front of it and show them personalised content. I’d like to know how it handles shared calendars and reminders, including who can see or change them. Those are the things I already find frustrating about iCloud, and putting a screen on a robotic arm won’t fix them.

The gap that neither Nilay nor Gurman addressed is that Apple owns enough of that software to have an absurd advantage. It also controls the APIs that would let other people fill in the gaps, and not just for AI. I’ve been building personal agents on hardware vastly less capable than what’s in my iPad, but still need another machine for my container-based development tools. Apple doesn’t expose a hypervisor on iPadOS, so I can’t run those containers in a hardware-accelerated Linux VM on the device.

Yes, I know it’s a use case Apple doesn’t care about. But their hobbling of the iPad and refusal to address touch on the Mac are two core examples of things that they need to fix and that cascade into their entire approach to integration and software in general.

[

The People in the Room
----------

](/space/blog/2026/09/22/0709#the-people-in-the-room)

Then there’s the literal tone deafness about things like the Watch’s newfound always-on transcription features, and the fact that Apple has pretty much failed to read the room regarding how regular people will think about these new AI features.

Nilay asks at one point how people around these devices are supposed to feel about being recorded, and that’s the key issue for me. Apple’s ability to protect stored information doesn’t settle whether people wanted it captured in the first place, and I don’t want a future where my Watch (which is a medical device) will be banned because of this kind of idiocy.

The entire thing is just ill-conceived, and as bad as Meta glasses and their LEDs. A small icon visible to the wearer does very little for someone sitting across the table, and regular people won’t care that local processing and discarding the original audio can limit exposure. There’s an entire can of worms around whether the other person still needs to know that what they said is being transcribed, but my key point is that *these things did not need to exist*.

There is no timeline in which any of this is anything but product managers trying to see what sticks without understanding how regular people will think about the feature.

Gurman’s explanation of the proposed AirPods cameras felt weirdly inconsistent as well–they would apparently be able to read labels without producing ordinary photos or videos (and I completely get how that can work), but he acknowledges that he can’t explain how the system would limit what it recognises about people. Without that explanation and taking into account basic human concerns, I see an entire Flock-like controversy arising, and I just don’t understand how Apple is literally walking into that by purposefully including audio and visual features *nobody asked for* in their products.

Hands-free visual assistance could be useful, especially for accessibility, and Gurman argues that Apple should have shown more demos and explained its privacy approach more coherently, but I still think Apple just doesn’t get how to do any of these things–not technically, but from a purely *acceptable* perspective.

[

Still Paying for Permission
----------

](/space/blog/2026/09/22/0709#still-paying-for-permission)

The bit that I was more interested in was when Gurman reported that Ternus and Eddy Cue are looking for more ways to make money from the App Store, with Schiller more wary of squeezing developers and attracting further regulatory scrutiny.

Phil has bucketloads of common sense. Him stepping away does not convey a good message.

Gurman says there wasn’t a falling-out, but the direction he describes is discouraging given my [relief that the new CEO came from hardware rather than services](/space/links/2026/04/21/0730#john-ternus-to-become-apple-ceo), and does nothing for people wanting to actually take advantage of the devices they own.

I [keep coming back to the same fundamental objection](/space/links/2026/08/18/1921#apple-announces-changes-for-apps-in-the-european-union): I want to run my own software on hardware I paid for, without paying Apple to stop it expiring after a week. This has nothing to do with running a rival app store. My [Swift editor project](/space/blog/2026/09/19/1659#a-writing-tool-that-leaves-the-writing-to-me) is something I’m building for myself, and I keep thinking that I would love to run it on my iPad, but can’t keep it there without either paying for the privilege or re-signing it every week. And the entire Apple toolchain assumes I want to distribute a product, with all the ceremony that entails, when I just want to use it on my iPad.

And that is, at a personal level, the thing where I wish Ternus would make allowances, especially now that Apple has stupidly powerful personal hardware–more capable hardware makes those restrictions harder to defend, and app-signing rules need to change.

[

What I’m Waiting For
----------

](/space/blog/2026/09/22/0709#what-i-m-waiting-for)

I said [earlier this month](/space/links/2026/09/01/0750#tim-cook-s-final-message-as-apple-ceo) that I’d reserve judgement on Ternus for a year or so. Like Nilay and Gurman, I acknowledge that much of what he launches will have been in development under Cook, and being reportedly more willing to make decisions doesn’t tell us whether he’ll make better ones–but he can change priorities without waiting for a new hardware cycle, and the [list of papercuts](/space/blog/2026/05/18/1320#apple-papercuts) I put together in May has plenty of candidates, most of which are close to drinking age.

What I want isn’t rocket science–Mail needs to find and let me manage my mail (and it’s marginally better now). Calendar and Reminders need to work reliably across the people and tools that use them (and Calendar is still broken when it comes to accepting and handling meeting requests). I’d like automation interfaces that survive OS updates, and documented access to the information I’ve put into iCloud.

And letting me use more of my iPad’s ample processing power would be welcome. At the very least, I’d like to spend less of the next year writing workarounds for some of those things–assuming I can keep them on my devices for more than a week…