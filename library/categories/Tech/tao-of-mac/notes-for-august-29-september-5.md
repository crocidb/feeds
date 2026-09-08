+++
title = "Notes for August 29–September 5"
description = "As many people have remarked, the moat between ideas and technical execution is narrower than ever, and that has a number of consequences–both when it comes to investment (in this case, personal, although I am collecting war stories…) and focus. And I th"
date = "2026-09-05T21:00:00Z"
url = "https://taoofmac.com/space/notes/2026/09/05/2100?utm_content=atom"
author = "Rui Carmo"
text = ""
lastupdated = "2026-09-08T09:44:10.292012165Z"
seen = false
+++

As many people have remarked, the moat between ideas and technical execution is narrower than ever, and that has a number of consequences–both when it comes to investment (in this case, personal, although [I am collecting war stories](/space/site/disclaimer)…) and focus. And I think I need to be more selective about what gets my evenings, since I am back at work and already spending too much of my free time building things on a computer.

[

I Need To Stop Using AI
----------

](/space/notes/2026/09/05/2100#i-need-to-stop-using-ai)

Why? Because I am right back where I was before my break, spending too little time doing anything but sitting at a computer, or using a computer to do things that only work on a computer.

I keep having ideas, and even though I finish my workdays achy and drained, I inevitably get caught up in the excitement of being able to build stuff quickly. And since my free Codex subscription is due to end this month, I’m trying to make the most of it…

I need to get back to electronics, hardware, and reading (maybe even music) as a hobby, and stop spending so much time glued to a screen–which is something I have been trying to balance against my writing backlog, and part of the reason the notes this week are relatively sparse.

But there are some hints of progress in finding a better balance between screen time and other activities:

[

### More Time In The Big Blue Room ###

](/space/notes/2026/09/05/2100#more-time-in-the-big-blue-room)

I finally hit my daily step goal for several days in a row, which has been a small but satisfying victory and has eased some of the strain from sitting at my desk for long periods (albeit not completely).

The trick? Doing the grocery shopping myself. You end up walking more than you would if you relied on delivery, and it adds a bit of variety to your daily routine. Not to mention milk carton lifting, which is a surprisingly effective upper-body workout.

[

### Review Backlog ###

](/space/notes/2026/09/05/2100#review-backlog)

I spent some time (re)setting up test machines and going through my review backlog, trying to catch up on notes and tasks that had accumulated while I was focused on other projects–even though I have little to show for it in terms of output, I managed to at least organize most of my notes, some of which date back several months now…

[

A Legion Of My Own
----------

](/space/notes/2026/09/05/2100#a-legion-of-my-own)

As an offshoot of the work I did with [micro-VMs](/space/blog/2026/06/18/1845#running-microvms-in-proxmox-ve-the-easy-way), I’ve been poking at two related problems for a while: getting agents to preserve their state, and tackling the holy grail of freeing computing environments from being tied to a particular machine.

[`legion`](https://github.com/rcarmo/legion?utm_campaign=unsolicited_traffic&utm_medium=web&utm_source=taoofmac.com) takes that idea and gives it a twist. Rather than packing everything into one portable process, it is a self-hosted runtime for durable agents backed by a Raft cluster, with WASM and Bun functions (making those available across the whole cluster is still work in progress):

* every agent turn is event-sourced
* nodes form a Raft cluster
* code is deployed as content-addressed WASM modules or Bun bundles
* it’s all organized as a 9P namespace

The namespace provides a uniform way to manage the whole thing, and was, I confess, a whimsical choice. But my intention is that crashes, restarts and individual machines going away should not make an agent stop or lose track of ongoing work, and so far this seems like a moderately sane way to do it.

This is still at an early design stage and might end up going nowhere, but there are already enough runnable examples to exercise most of the architecture:

<img src="/space/notes/2026/09/05/2100/legion.png?v=cd2c4091bd93" alt="Legion Web Chat showing a durable conversation across reconnects" width="1025" height="828"> Legion’s web chat reconnecting to a durable conversation [

Keeping Track of Meeting Agendas
----------

](/space/notes/2026/09/05/2100#keeping-track-of-meeting-agendas)

I had an epiphany about how to keep track of meeting agendas without relying on my memory alone: give the computer the talking points and have it listen for what we’ve already covered, leaving me to pay attention to the conversation.

And yes, [Teams] does that, but I wanted something that works entirely on my Mac and was fully local, without relying on any cloud services, plus I was curious to see how far I could push Apple’s on-device models for better privacy and responsiveness.

Which is why [`swift-smart-prompter`](https://github.com/rcarmo/swift-smart-prompter?utm_campaign=unsolicited_traffic&utm_medium=web&utm_source=taoofmac.com) started as a little demo of how much useful work Apple’s on-device speech and language models can do, even on relatively low-end hardware.

Then [my NLP background kicked in](/space/blog/2011/08/11/2240#making-your-mail-sit-up-and-beg), and it grew into a Mac app that listens to both sides of a call, tracks which topics have come up and suggests a short next response in a floating cue panel (which I can keep above the meeting window, instead of continually looking away to consult my notes):

<img src="/space/notes/2026/09/05/2100/smartprompter.png?v=6a3d4958c037" alt="Sometimes I am just too tired to keep track of meeting agendas" width="1108" height="1162"> Sometimes I am just too tired to keep track of meeting agendas

And, of course, there’s a hack: instead of using diarization, I rely on the audio split: `ScreenCaptureKit` gives me the microphone and system audio separately, so the transcripts are labelled “You” and “Call”–it doesn’t try to distinguish individual people at the other end at all.

And although I’ve been hacking on on-device translation and semantic understanding, that’s still a bit slow, so topic matching has a keyword-based fallback, with Apple Intelligence adding contextual cues and coverage classification that so far seems to work regardless of the language being spoken. Mostly. Ok, for English and Portuguese, at least for now.

Plus, I can manually correct the checklist when it gets things wrong. Without Apple Intelligence, it still shows the next uncovered point.

It all stays on the Mac, with no cloud API or account, and neither audio nor transcripts are written to disk. It does need macOS 26 and the appropriate on-device speech models, and multilingual use is a bit of a chore, since you have to fish around to enable everything.

[

Poor Man’s Screen Sharing
----------

](/space/notes/2026/09/05/2100#poor-man-s-screen-sharing)

On a more pragmatic note, I have a “me” problem with Azure Virtual Desktop: meetings happen inside it, but sometimes I need to share something that is on my local desktop, which the remote machine obviously cannot see.

My poor man’s fix is provisionally called ShareCam: select a region locally and pipe it into AVD as a camera. Crude, but it works, and once I clean it up I will put it up on GitHub someplace:

<img src="/space/notes/2026/09/05/2100/sharecam.png?v=68446c92a7df" alt="Sharecam selecting a region of the local desktop to share inside Azure Virtual Desktop" width="1025" height="659"> Selecting part of my local desktop to send into Azure Virtual Desktop

And yes, this shows up instead of my camera view, but that is perfectly acceptable for my use case. The only real challenge is that screen sharing typically has a dedicated pane in Teams and Zoom, whereas my solution just replaces the camera feed and people have to arrange it themselves accordingly.

This was also based on [`rcarmo/swift-app-template`](https://github.com/rcarmo/swift-app-template?utm_campaign=unsolicited_traffic&utm_medium=web&utm_source=taoofmac.com), which I’ve been tweaking to build all my new little Mac tools. It took me all of… 25 minutes to get it working end-to-end, including a second pass for individual window selection and capture that still needs some UX tweaks. `gpt-6-astra` did the core implementation in less than 15 minutes–having the template ready certainly helped.

And this, I think, is what I should be doing more of: investing my personal development time in satisfying life hacks and little tools I will actually use instead of trying to boil small oceans–those I can always keep doing at work…