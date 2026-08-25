+++
title = "Building Piclaw on Top of an Opinionated Coding Agent"
description = "I’ve spent the better part of six months building piclaw–my personal AI assistant, workspace and, occasionally, agent swarm–on top of [Mario Zechner](https://mariozechner"
date = "2026-08-21T22:18:00Z"
url = "https://taoofmac.com/space/blog/2026/08/21/2218?utm_content=atom"
author = "Rui Carmo"
text = ""
lastupdated = "2026-08-24T15:49:20.663247468Z"
seen = false
+++

I’ve spent the better part of six months building [`piclaw`](https://github.com/rcarmo/piclaw?utm_campaign=unsolicited_traffic&utm_medium=web&utm_source=taoofmac.com)–my personal AI assistant, workspace and, occasionally, agent swarm–on top of [Mario Zechner](https://mariozechner.at/?utm_campaign=unsolicited_traffic&utm_medium=web&utm_source=taoofmac.com)’s [`pi`](/space/ai/agentic/pi) engine, and I think it’s time to write about not just my motivation but also how I feel about having invested that much time into the whole thing.

This is important (at least to me) because [`pi`](/space/ai/agentic/pi) is an *excellent* coding agent with a very clear point of view about how things should work. The internals are concise, well structured and easy to follow, with the brilliant twist that extensions can literally take over the entire thing–to the point where you can pretty much rewrite the entire agent loop (however you care to define *loop* these days).

Building a different kind of UI on top of it has been educational, very rewarding and occasionally maddening, and I’ve reached the point where I need to write down what I’ve learned and a lot of the underlying rationale–partly because I just want to *use* the thing now and move on, and partly because there’s a lot buried in the project documentation itself (there are a lot of *whats* and *hows*, but relatively few *whys*).

[

Why `pi`?
----------

](/space/blog/2026/08/21/2218#why-pi)

The key thing that captivated me is that [`pi`](/space/ai/agentic/pi) is, in effect, a self-modifying agent harness.

Yes, *self-modifying*. Like… a virus. I like to think that its virality (however you cast it) is one of the unstated reasons it has found its way into a *lot* of projects lately, but let’s skip that bit and just reframe “self-modifying” as both *self-improving* and *self-evolving* without dipping too much into the penny arcade theatrics of AGI.

I’ve come to the point where I think that even without agency, self-modifying harnesses like `pi` are *way* more powerful than just about anything we’re getting from megacorps, because they can morph into your own completely personalised environment–which is what `piclaw` became for me.

When I started out fooling around with what eventually became [`steward`](https://github.com/rcarmo/bun-steward?utm_campaign=unsolicited_traffic&utm_medium=web&utm_source=taoofmac.com), the field of open coding agents was a mess of half-finished [Python](/space/dev/python) scripts and [VS Code](/space/apps/code) forks, and [`pi`](/space/ai/agentic/pi) stood out because it was opinionated in the right ways: [TypeScript](/space/dev/typescript) as the runtime, a clean turn-based conversation model, good terminal UX and–critically–a willingness to evolve quickly. [Mario Zechner](https://mariozechner.at/?utm_campaign=unsolicited_traffic&utm_medium=web&utm_source=taoofmac.com) made strong choices about tool calling, context management and model interaction, and they were essentially the right ones.

And if you take the essential bit literally, the thing [`pi`](/space/ai/agentic/pi) got *most* right was restraint. Or, if you have been following the philosophical debate about AI use, *taste*.

At the risk of reiterating the basics most people already know about [`pi`](/space/ai/agentic/pi), it starts with a small, carefully chosen set of built-in tools–file I/O, shell, search and editing–and leaves the LLM to fend for itself in UNIX land, which gives it tremendous power and flexibility.

Compare that with what AI lab harnesses are becoming: sprawling collections of specialised tools, bespoke UI panels, inline diffs, notebook integrations, code review modes and whatever else someone thought of that ~~quarter~~ week. Every one of those features eats context, adds latency and makes prompts longer–which means the model has less room to think about your actual problem.

[`pi`](/space/ai/agentic/pi) starts from the other end: give the model the minimum surface it needs to be effective and spend the rest of the token budget on the actual problems at hand. The introspection is excellent too–you can see what the model is doing, which tools it is calling and what the context looks like at any point. No magic, no hidden system prompts, no mystery. That transparency is worth more to me than feature polish, because it means I can *debug* things when they go wrong.

I didn’t necessarily want *just* a coding agent, though, and after a while, I realised I didn’t even want to run it in a terminal. I wanted an extensible agent that could run headless, manage my homelab, edit my wiki, file links, take notes, run scheduled tasks, and generally be useful in ways that might only occasionally have to do with writing code.

[`pi`](/space/ai/agentic/pi)’s small tool surface and clean turn model were close enough to what I needed that building on top of it seemed faster than starting from scratch.

[

Escaping The Terminal
----------

](/space/blog/2026/08/21/2218#escaping-the-terminal)

As I’ve written [many times before](/space/blog/2026/03/08/2130), I don’t run coding agents locally–that’s why I spent quite some time coming up with things like [`agentbox`](https://github.com/rcarmo/agentbox?utm_campaign=unsolicited_traffic&utm_medium=web&utm_source=taoofmac.com) and [`webterm`](https://github.com/rcarmo/webterm?utm_campaign=unsolicited_traffic&utm_medium=web&utm_source=taoofmac.com) to run them in remote machines.

But the biggest departure from [`pi`](/space/ai/agentic/pi) came from using it inside [`vibes`](https://github.com/rcarmo/vibes?utm_campaign=unsolicited_traffic&utm_medium=web&utm_source=taoofmac.com), which started out as a generic web UI that I could use from my phone. And with my mobile background, it was pretty obvious (at least to me) that a highly optimised web UI was vastly better than using [WhatsApp](https://www.whatsapp.com/?utm_campaign=unsolicited_traffic&utm_medium=web&utm_source=taoofmac.com) or [Telegram](https://telegram.org/?utm_campaign=unsolicited_traffic&utm_medium=web&utm_source=taoofmac.com) as a bridge–not only could I make it much more secure over [Tailscale](/space/apps/tailscale) (without any middlemen), but I could build a much nicer, *continuous* experience across devices, reconnecting from anywhere and picking up exactly where you left off:

<img src="/space/blog/2026/08/21/2218/piclaw-cross-device-session.png?v=fb7ccb4983ac" alt="The same Piclaw session open across several devices" width="2048" height="792"> The same Piclaw session across devices

Another key factor is that I almost invariably begin and end my days on an iPad, which pretty much defined the rest of the UX–I can reference timeline messages, annotate them with Apple Pencil, etc., making for somewhat terse but very effective interactions, especially when doing reviews. I just toggle between Safari tabs to move between chat and GitHub or Gitea diffs, and with a little bit of `AGENTS.md` tweaking or per-session prompting things can be very productive.

<img src="/space/blog/2026/08/21/2218/piclaw-ipad-workspace.jpg?v=4ff7b9313084" alt="Piclaw open in Safari on an iPad" width="768" height="1024"> Piclaw on the iPad

The entire thing unfolds like origami–files on one side, plan trackers on the other, documents opening into tabs or detached panes, and ample touch support throughout (resizing panes, swiping between chats, etc.). I also took advantage of `pi`’s brilliant session tree internals to create multiple “agents” (that can talk to each other inside each instance using a `chat` tool, and [even across instances](https://rcarmo.github.io/piclaw-addons/addons/remote-peer/?utm_campaign=unsolicited_traffic&utm_medium=web&utm_source=taoofmac.com)…)

<img src="/space/blog/2026/08/21/2218/piclaw-interface-panes.png?v=bd57e78fc109" alt="The Piclaw interface with its timeline, plan and utility panes open" width="2048" height="1913"> This is what Piclaw looks like to me these days  You’ll notice that the above is a bit… crowded. And I am not even using the file explorer or the built-in terminal, but it is pretty much how I use `piclaw` on a daily basis. From the top, you can see:

* Several agents that I can switch quickly between (in this case they’re actually coordinating to fix an add-on and deploy it across the “fleet”)
* A timeline with rich link previews, my latest prompt, and three temporary panes:
  * Thinking output from the model
  * Tool output
  * Tool execution details (what, current working directory, and git branch)

* A `plan` sidebar that the model started using *without prompting* (this is `gpt-5.6-sol`, so it tends to remember previous instructions)
* A compose box with model status/plan/context information (you can’t see the submission, previous message references and image attachment widgetry in this shot)

The top dashboard and the side pane are add-ons, and they’re designed to be used on demand, so the typical UX is much less cluttered–but my key point is that despite several attempts we’ve made at “improving” it, this has been working out *really well* for me on the iPad with both voice and Apple Pencil input, and I seldom use *anything else* these days.

One thing you can’t see is that it is running on a remote VM–`piclaw` has a handy little widget I can pop up on the top right-hand side that gives me sandbox instance info:

<img src="/space/blog/2026/08/21/2218/piclaw-instance-stats.png?v=37e355182b42" alt="Piclaw widget showing resource usage for a remote instance" width="320" height="264"> Remote instance stats  A colleague and I dabbled with a Visual Studio-like UX, but I still prefer the fully responsive front-end, since it evolved to match my peculiar working style:

* Constantly switching between devices (iPad, work laptop, iPhone, work AVD, MacBook, Linux laptop, etc.)
* Multiple concurrent sessions (typically one per project) in each instance.
* Very long sessions that can last *weeks*.

Unlike people who have the luxury of uninterrupted focus time and can work on only one thing at once, I have to switch constantly between meetings, coding, planning, researching, writing, etc. I tend to work on some things in very short bursts over quite long periods of time–and having something stuck in a terminal someplace, even over `tmux` and `ssh`, would never cut it.

This is probably the biggest reason why I’ve never considered [`piclaw`](https://github.com/rcarmo/piclaw?utm_campaign=unsolicited_traffic&utm_medium=web&utm_source=taoofmac.com) a “product”, even though it naturally evolved many of the trappings of other coding agents–including external add-ons.

[

Extending `pi` Into The Browser
----------

](/space/blog/2026/08/21/2218#extending-pi-into-the-browser)

But the key thing is that *all the above are just extensions*, since I leaned *hard* on [`pi`](/space/ai/agentic/pi)’s extension mechanism, extending it to support the web interface.

`pi` has a very capable terminal UI, and its extension contract exposes a bunch of it, but a lot of its flexibility doesn’t (or didn’t) cross the IPC interface, so I gave `piclaw` its own browser UI contract: extensions are route- and event-aware, and the shell extension host can mount, focus, resize, save, detach or dispose of them.

They retain the standard `pi` extension features, but can provide editors, file viewers, terminals and even a VNC client without reaching into the main application bundle. And, of course, they can do all sorts of fancy widgetry in the timeline (which has used [SQLite](/space/db/sqlite) from the start and can serialise widget states).

There are many things that are just intrinsic to [`piclaw`](https://github.com/rcarmo/piclaw?utm_campaign=unsolicited_traffic&utm_medium=web&utm_source=taoofmac.com), of course. The [`piclaw`](https://github.com/rcarmo/piclaw?utm_campaign=unsolicited_traffic&utm_medium=web&utm_source=taoofmac.com) web server provides a bunch of scaffolding for managing UI panes, SSE events, settings, the works, plus there is an encrypted `keychain`, database and state introspection for the chat/sessions and file attachments in the timeline, etc.

But most of the shipping extensions started out like this:

```
{
  "piclaw": {
    "compatibleVersions": ">=1.8.0",
    "tags": ["example"]
  },
  "pi": {
    "extensions": ["index.ts"],
    "web": {
      "entries": ["web/index.ts"]
    }
  }
}

```

This translates into actual code like so:

```
// index.ts -- a normal Pi extension, loaded by the agent runtime
// schema and handlers omitted
export default function example(pi: ExtensionAPI) {
  pi.registerTool({ name: "example", parameters, execute });
  pi.on("session_shutdown", closeResources);
}

// web/index.ts -- loaded separately by Piclaw in the browser
__piclaw_web.registerPane({
  id: "example-viewer",
  label: "Example",
  capabilities: ["preview"],
  placement: "tabs",
  canHandle: ({ path }) => path?.endsWith(".example") ? 100 : false,
  mount(container, context) {
    return createExamplePane(container, context);
  }
});

```

Slowly, gradually, `piclaw` effectively built its own UX out of what are essentially all `pi` extensions, which I think is a great example of how good the original design was.

[

Earendil’s Moving Castle
----------

](/space/blog/2026/08/21/2218#earendil-s-moving-castle)

Now, the design still *is* good, but the problem with building on top of someone else’s opinionated engine is that, to an outside observer, their opinions keep changing. [`pi`](/space/ai/agentic/pi) is very actively developed–which is good–but there was a period when every upstream bump brought a non-trivial risk of things breaking in ways that were hard to diagnose.

I am very happy with `piclaw` as a tool to the point where I seldom use anything else, but I want to truly *use* it rather than spend so much time maintaining it, and over six months I’ve dealt with:

* Tool-calling interfaces changing shape
* Context-window management behaving differently after upstream refactors, causing my longer system prompts to be silently truncated.
* The model configuration layer being restructured, each time requiring changes to my settings and onboarding code.
* Streaming behaviour changing subtly enough that my web UI’s SSE handling would occasionally drop tokens or duplicate thinking indicators.

A later refactor to model handling fortunately converged with my approach, but still required a day of coddling GPT-5.6–very soon after I had spent two days integrating and testing a new context-compaction approach.

In a way, all of the above was useful because [`piclaw`](https://github.com/rcarmo/piclaw?utm_campaign=unsolicited_traffic&utm_medium=web&utm_source=taoofmac.com) now has a gazillion regression tests–not just for the core and event loop (since my event loop has to do a fair bit more than “just” running a TUI, like routing SSE events, updating tables, etc.) but also for the UX (including a very spiffy PDF report that spans dozens of Playwright tests).

So the first “new” thing I learned out of the whole thing was how to apply the TDD mantra I had to follow in a few customer projects to [`piclaw`](https://github.com/rcarmo/piclaw?utm_campaign=unsolicited_traffic&utm_medium=web&utm_source=taoofmac.com), including getting the LLMs to generate decent user stories (and [Gherkin](https://cucumber.io/docs/gherkin/?utm_campaign=unsolicited_traffic&utm_medium=web&utm_source=taoofmac.com)) for tests and making sure the entire thing can run in Actions. I’d done it before, but not at this scale and depth for a single project.

This makes builds slow, but it’s completely consistent with my [usual process](/space/blog/2026/03/08/2130) of ensuring LLMs generate useful code, and it’s been pretty rewarding.

The flip side is that spending three and a half evenings on compatibility work when upstream broke stuff I didn’t expect sucked. However, **I don’t blame Mario for this**. It had to happen.

The core of `pi` has got to be a very hard thing to reshape and evolve (especially considering the explosive popularity it’s been enjoying), and the constant model and provider churn certainly doesn’t help. If you peek under the hood, the sheer amount of work poured into [`pi-ai`](https://github.com/badlogic/pi-mono/tree/main/packages/ai?utm_campaign=unsolicited_traffic&utm_medium=web&utm_source=taoofmac.com) *just to talk to provider endpoints* is batshit insane, and is possibly tracking more moving targets than NORAD.

[

Sixteen Releases Later
----------

](/space/blog/2026/08/21/2218#sixteen-releases-later)

Since I first dated this draft on June 19th, [`piclaw`](https://github.com/rcarmo/piclaw?utm_campaign=unsolicited_traffic&utm_medium=web&utm_source=taoofmac.com) has gone through *sixteen* distinct [Earendil](https://github.com/earendil-works/pi-mono?utm_campaign=unsolicited_traffic&utm_medium=web&utm_source=taoofmac.com) releases, from `0.79.8` to `0.84.1`. Most were uneventful dependency bumps, but package/API splits and a `ModelRuntime` rewrite for provider discovery, credentials and model catalogues prompted another couple of late evenings, since I now rely upon the latter for my own carefully crafted [Azure](/space/com/microsoft/azure) and [GitHub](https://github.com/?utm_campaign=unsolicited_traffic&utm_medium=web&utm_source=taoofmac.com) extensions (because, well, I need to dynamically resolve models [that are not public](/space/site/disclaimer)).

I could just let upstream stabilise, sure, but the way things are going I’m pretty sure that will take *years*, and none of the above requires [`pi`](/space/ai/agentic/pi) to promise API stability. But since just using the SDK and IPC isn’t really an option for me (at least not yet–more on that in a bit), I have to accept these as the natural consequences of shaping my working environment on top of a moving foundation–Earendil has more on their plate than catering to my somewhat eccentric use case.

Compaction pushed this furthest, since my style of work lends itself to *very* long sessions and I have access to multi-million token models, so my usage pattern seems to be very different than most.

Upstream added reasons, retry metadata, post-compaction estimates and eventually retry lifecycle events; my smart-compaction add-on grew summary validation, continuity checks, provider-specific execution and request-auth preservation around those hooks. When I implemented provider-native remote compaction, I then had to handle summaries that one provider could create but could not replay through another, etc. *That* made me respect the work done in `pi-ai` even more, by the way…

Fortunately, more recent upstream work has *converged* with decisions I had already made. Cache-friendly dynamic tool loading, full provider extensions, and compaction metadata plus retries for failed summaries are all things a long-running assistant needs, and let me ditch some of my workarounds. I still had to adapt [`piclaw`](https://github.com/rcarmo/piclaw?utm_campaign=unsolicited_traffic&utm_medium=web&utm_source=taoofmac.com)’s credential store, model refresh, scheduler and extension loader, but I was no longer maintaining those ideas entirely outside the engine, and some of that scaffolding became integration code.

And I’ve finally caught up to the point where I am now *proactively* tracking the new upstream agent harness and started breaking down [`piclaw`](https://github.com/rcarmo/piclaw?utm_campaign=unsolicited_traffic&utm_medium=web&utm_source=taoofmac.com) into individually testable “effectors” (for lack of a better word) that can just plug in to the new agent loop as it changes state.

With luck, I should be able to adopt the new harness as it comes out. Worst case scenario, I’ll have to refactor a bit more, but some of it is long overdue, to be honest.

But let’s take a little detour.

[

TypeScript, Bun and the RAM Problem
----------

](/space/blog/2026/08/21/2218#typescript-bun-and-the-ram-problem)

The other thing I’ve learned–and this is less about [`pi`](/space/ai/agentic/pi) specifically than the [TypeScript](/space/dev/typescript) ecosystem in general–is that the runtime overhead is brutal on constrained devices. [Bun](/space/cli/bun) is, to me, a *massive* improvement over [Node.js](https://nodejs.org/?utm_campaign=unsolicited_traffic&utm_medium=web&utm_source=taoofmac.com) (and its [recent upgrade to 1.4](/space/links/2026/08/20/1818) is one of the reasons I decided to finally clean up my notes and post this), but it still has its challenges.

Using [Bun](/space/cli/bun) 1.3, [`piclaw`](https://github.com/rcarmo/piclaw?utm_campaign=unsolicited_traffic&utm_medium=web&utm_source=taoofmac.com) running on my [ARM](https://www.arm.com/?utm_campaign=unsolicited_traffic&utm_medium=web&utm_source=taoofmac.com) devices used somewhere between 400 and 600MB for the main process, depending on how many tools are loaded and how much conversation state is in memory. On a desktop or a VM that’s nothing, but on a smaller ARM board that is also trying to run builds, it is a meaningful chunk of RAM.

Early results with 1.4 (*very* early, since I just did the first [`piclaw`](https://github.com/rcarmo/piclaw?utm_campaign=unsolicited_traffic&utm_medium=web&utm_source=taoofmac.com) release based on it) are… mixed. I have seen some of my instances go down to 200MB RSS, but others remain in the same range.

[Bun](/space/cli/bun) is fast, and I genuinely like working in [TypeScript](/space/dev/typescript) for the web UI and tool surface (mostly linting and testing, honestly, because I still don’t really like the language). But the combination of JavaScript runtime overhead, the `node_modules` graph and a process that loads dozens of tool definitions at startup means I am paying a tax that a compiled language would avoid, and I am constantly reminded of that.

I still prefer [Python](/space/dev/python) (and continue to explore doing harnesses in it), so there’s a draw away from the internals of [`pi`](/space/ai/agentic/pi) that I just cannot ignore.

Anyway, I adopted a few different tactics to try to keep things under control.

[

The Extension Split
----------

](/space/blog/2026/08/21/2218#the-extension-split)

The first mitigation was architectural, suitably [`pi`](/space/ai/agentic/pi)-aligned, and typically lazy: I split [`piclaw`](https://github.com/rcarmo/piclaw?utm_campaign=unsolicited_traffic&utm_medium=web&utm_source=taoofmac.com) into a core runtime and a set of lazy-loaded (ha!) extensions, hacking session management (which I also extended to support multiple parallel running sessions) to support dynamic loading.

So extensions like [Proxmox](/space/os/linux/distributions/proxmox) tooling, [Portainer](/space/os/linux/docker/portainer) integration, [SSH](/space/cli/ssh), wiki helpers and other (incidentally) context-heavy tools are loaded only when the model needs them, rather than inflating the base process (or the session) from the start.

This helped, and eventually converged with [`pi`](/space/ai/agentic/pi)’s recent releases, which made this less of a hack as the core added its own dynamic tool loading (which was tricky for a bit since it mangled the cached prompt prefix in my custom handling…). I only use subprocesses for scheduled tasks and some add-ons, but I wired those through as well.

The thing is, shipping all those extensions with [`piclaw`](https://github.com/rcarmo/piclaw?utm_campaign=unsolicited_traffic&utm_medium=web&utm_source=taoofmac.com) itself started becoming unmanageable, so…

[

Everything Gets An App Store
----------

](/space/blog/2026/08/21/2218#everything-gets-an-app-store)

I eventually decided to move the larger integrations into a separate [`piclaw-addons`](/space/notes/2026/04/26/2144) repository, making it possible to download and install things directly from it:

<img src="/space/blog/2026/08/21/2218/piclaw-addons-library.png?v=25222ac25c65" alt="The Piclaw add-on library displayed in its management interface" width="1784" height="1262"> The Piclaw add-on library

This created more maintenance, but it also forced me to treat extensions differently in general. The repository now has standalone-import tests, metadata validation, etc., and one of my slow burning tasks has been migrating stuff out of the core repository into what is now a nearly 50-strong add-on library.

That includes niche provider integrations, infrastructure clients, viewers and editors, delegation and compaction machinery, terminal renderers and small pieces of UI that make sense only in the web app. Each is installed as a Pi package and its runtime entry still receives [`pi`](/space/ai/agentic/pi)’s native `ExtensionAPI`, so tools, events, session state and shutdown semantics still belong to the core (which is why I’m quite optimistic about my chances of adopting its upcoming [`pi`](/space/ai/agentic/pi) harness without a lot of breakage).

Also, some of the best improvements to my workflow came via contributed add-ons: [`delegate`](https://github.com/rcarmo/piclaw-addons/tree/main/addons/delegate?utm_campaign=unsolicited_traffic&utm_medium=web&utm_source=taoofmac.com), in particular (which just invokes `pi` as one or more subprocesses, at least until I find the time to refactor it), has been pretty useful for things like “audit this PR independently using sol, terra and opus and give me an assessment”.

[

A Place For Every Setting
----------

](/space/blog/2026/08/21/2218#a-place-for-every-setting)

Oh, yes, and *that* scary thing around the add-ons library above is the Settings pane. Every extension in [`piclaw`](https://github.com/rcarmo/piclaw?utm_campaign=unsolicited_traffic&utm_medium=web&utm_source=taoofmac.com) (bundled or add-on) has access to a settings contract that lets it create and render its own UX. Here’s the scheduled tasks pane, for instance.

<img src="/space/blog/2026/08/21/2218/piclaw-scheduled-tasks-settings.png?v=53b99c616547" alt="Piclaw settings for scheduled tasks" width="1782" height="1262"> The scheduled tasks settings pane

Settings panes use a fairly straightforward pattern: the browser talks to an authenticated `/agent/addons/api/<addon>/<action>` endpoint, the runtime registers the handler, non-secret values go into the extension KV store and passwords or tokens go into the keychain.

But there’s more to this than just the (slightly overkill) amount of functionality I built into [`piclaw`](https://github.com/rcarmo/piclaw?utm_campaign=unsolicited_traffic&utm_medium=web&utm_source=taoofmac.com). *Using* it has also forced me to reflect (and learn) a lot about how to effectively use LLMs across the board.

[

Knowledge, Memory And Regret
----------

](/space/blog/2026/08/21/2218#knowledge-memory-and-regret)

One of the things that became obvious after keeping sessions around for weeks is that the conversation itself is mostly disposable–but only just. The most useful bits are what survives *outside* it–files in the workspace, instructions in `AGENTS.md`, and skills.

Like everyone else, I leverage agent skills extensively, and have dozens of `SKILL.md` files and scripts that describe how I want recurring jobs done (including all the little caveats I would otherwise have to rediscover every few months).

That is a much saner kind of memory than stuffing old chats into a vector database and hoping similarity search will do the right thing, but I’ve found there are multiple complementary aspects of agent memory and ways to ensure reproducible behaviour.

To begin with, each new session gets the same workspace and operating conventions, plus enough current project state to resume work without dragging months of conversational debris into the context window.

But I’ve also incorporated a recurring self-diagnosis that does light tweaks to skills and a small set of “memory” files. Every night, an out-of-band “dreaming” session goes over recent activity, updates human-readable daily notes and distils the useful bits into preferences, corrections, project state and a compact startup index–while pruning things that no longer need to be folded into every session. It is deliberately lossy, and all the better for it.

Then there is [`late-night-regrets`](https://rcarmo.github.io/piclaw-addons/addons/late-night-regrets/?utm_campaign=unsolicited_traffic&utm_medium=web&utm_source=taoofmac.com), my somewhat pointed name for an add-on that looks back at interaction history and classifies course corrections, misinterpretations, over-engineering, under-delivery, context failures and useful proactive work. Typically for me (if you’ve ever come across any of my news processing pipelines), the classifier is a small Bayesian affair that consumes no model tokens; a separate reflection pass rates high-confidence failures and turns them into notes or steering cues for later sessions in a `feedback.md` file that is referenced when starting a new session.

That is about as much “self-improvement” as I am willing to trust right now: review what happened, summarize what went wrong, and keep changes to a (very) limited set of files. There is no model secretly rewriting `AGENTS.md` at 2:30 in the morning–it just wakes up with better notes and, occasionally, a list of regrets.

But me being me, I had to take it a step further.

[

Memory Across Agents
----------

](/space/blog/2026/08/21/2218#memory-across-agents) <img src="/space/blog/2026/08/21/2218/memento-visual-debugger.png?v=2dbf58863069" alt="Memento visual debugger showing shared memory nodes and diagnostics" width="2048" height="1291"> Memento’s visual debugger

[`Memento`](/space/notes/2026/07/19/1500) came out of wanting to carry some of that knowledge across machines and agents without sharing chats, credentials or piles of machine-local cruft. The durable concepts are Markdown in Git, split into namespaces and put through a proposal/curation flow, and I initially designed it to share skills and their associated scripts and assets. I hacked in my own embedding engine, but as usual with me it relies mostly on indexing rather than taking embeddings as the source of truth–which, given my experience with opaque memory systems, is an important distinction.

This is only a month or so old, but has already proven itself useful in very mundane ways, like allowing [`piclaw`](https://github.com/rcarmo/piclaw?utm_campaign=unsolicited_traffic&utm_medium=web&utm_source=taoofmac.com) to replicate itself to new machines and bootstrap them with the shared skills available to every instance:

<img src="/space/blog/2026/08/21/2218/piclaw-remote-setup.png?v=66ccaac1b82f" alt="Piclaw setting itself up on a remote host" width="1708" height="1720"> Setting up Piclaw on a remote host  Memento knows that I care about exact current-state reporting, clean Git history and verifying things on the actual target; it has engineering practices distilled from several unrelated projects; and it carries entire skills, including the bootstrap skill used above and the supervisor/worker “squad” model I use to keep sibling agent sessions from wandering off into the weeds.

The best thing? [`Memento`](/space/notes/2026/07/19/1500) works *very* well with other agent harnesses, including [OpenMinis](/space/links/2026/07/20/2213) on my iPad.

[

Where This Leaves Piclaw
----------

](/space/blog/2026/08/21/2218#where-this-leaves-piclaw)

[`piclaw`](https://github.com/rcarmo/piclaw?utm_campaign=unsolicited_traffic&utm_medium=web&utm_source=taoofmac.com) is still my primary assistant, running on six machines and doing useful work every day. The extension architecture made it maintainable, and [`pi`](/space/ai/agentic/pi)’s upstream improvements continue to make it better.

But, again, it is a “product” for one. And it is quite likely to stay that way, but part of the reason for that is that I very strongly believe that *this kind of thing is already a commodity* and that it makes zero sense for anyone to invest on selling AI code editors, shells, etc. Partly because the people who can build these things are increasingly likely to do it for themselves, and partly because the least common denominator is already out there in a zillion form factors.

Regardless of everything I’ve learned in the process, the most interesting part (for me, at least) is that [`pi`](/space/ai/agentic/pi)’s philosophy is the key differentiator–having a self-modifying agent hardness to build from is what enabled me to very quickly build [`piclaw`](https://github.com/rcarmo/piclaw?utm_campaign=unsolicited_traffic&utm_medium=web&utm_source=taoofmac.com) up from a web wrapper into my main working environment, with its own interface, extension model and accumulated habits, and I’m going to keep following that approach going forward.

Here’s to the next version–but first, I need to enjoy my last couple of vacation days.