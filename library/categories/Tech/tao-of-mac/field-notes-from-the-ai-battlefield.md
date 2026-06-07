+++
title = "Field Notes From The AI Battlefield"
description = "Since today is a bank holiday for me, I decided to consolidate a few more of my notes into a post. What follows is a set of guiding “principles” that I’ve found useful over the past year or so and that I’ve codified into various bits of scaffolding I reuse across my projects.As u"
date = "2026-06-04T12:22:00Z"
url = "https://taoofmac.com/space/blog/2026/06/04/1222?utm_content=atom"
author = "Rui Carmo"
text = ""
lastupdated = "2026-06-06T15:22:27.762039460Z"
seen = false
+++

Since today is a bank holiday for me, I decided to consolidate a few more of my notes into a post. What follows is a set of guiding “principles” that I’ve found useful over the past year or so and that I’ve codified into various bits of scaffolding I reuse across my projects.

As usual, I’ve tried to strip away all of the hype and fuzziness and stick to facts, but everyone has their own way of leveraging AI, so your mileage may vary.

However, unlike most of what I read online about AI these days, I am not pitching any specific tooling, although all of this is based on my experience.

>
>
> **Full Disclaimer**: I [work at Microsoft](/space/blog/2025/10/15/0000) and have a personal Codex account that OpenAI provided for my OSS work, as well as access to random Tier 2 providers that I use to test [`piclaw`](https://rcarmo.github.io/projects/piclaw/?utm_source=taoofmac.com&utm_medium=web&utm_campaign=unsolicited_traffic&utm_content=external_link).
>
>

If you like this, you might be interested on [my notes on MCP servers](/space/blog/2026/04/29/2341), a minor rant about [GPT 5.x model regressions](/space/notes/2026/05/07/0600) and my [agentic development workflow](/space/blog/2026/03/08/2130).

[

Do Not Blindly Trust AI-generated Code
----------

](/space/blog/2026/06/04/1222#do-not-blindly-trust-ai-generated-code)

A great example I usually point out is that if you ask an LLM to do extensive error handling on a piece of code, it will almost invariably (at least in [TypeScript](/space/dev/typescript)) generate empty `catch(){}` blocks and call *that* “error handling”.

Another is when I asked it to optimize a particular tree traversal function for an edge case and it *just hard coded the result*.

And this applies to nearly everything you ask any LLM to do–but code can be validated, and tested, and measured in various dimensions, and you can turn some of its foibles against it.

In the case of the first example above, a linter will catch that, and you can force the AI to turn those empty catches into something useful (like warning messages in logs).

The second one is nastier, but it too can be fixed through proper test fixtures (dynamic but non-repetitive).

Which is why I invariably wrap all my AI-driven projects into several layers of deterministic testing and automation.

[

Automate Everything Away from the Model
----------

](/space/blog/2026/06/04/1222#automate-everything-away-from-the-model)

The ground rule I follow is that even SOTA models are inherently unreliable, so when I set up a project or after the first few days of goofing around with a prototype, I try to make sure everything runs on rails.

I typically start with putting together a `Makefile` because it works/is preinstalled everywhere, is extremely familiar to LLMs, and means I have to do zero thinking myself when running steps manually, but you can use whatever you want.

The important thing is that *it must cover the entire development and release cycle*, because your agent will inevitably start drifting off and forget how it should do things.

I set it up like this:

* `Makefile` targets to do everything (that way there is no “secret sauce” only the model “knows” to do tests, a build, etc.)
  * linting/static analysis (`go vet` is great, but you should also prepare for typical LLM “lazy” idioms like empty `catch` blocks, which should be considered critical errors)
  * tests (unit/fuzzing/functional)
  * builds
  * packaging
  * upstream dependency updates (packages and vendored files)

* One or more `SKILL.md` file(s) that explain how to use the `Makefile` and cover the dev/test/debug/release workflows. You should make sure those are referenced from `AGENTS.md` or use the `.github/copilot` conventions (insert your flavor of choice here).

The key thing is to *always aim for reproducible steps*. The model will *always* go off into the weeds seeking an adventure regardless of how many admonitions you put in `AGENTS.md` or equivalent, especially when debugging things, but the `Makefile` (or equivalent) should be your ground truth.

The `SKILL.md` files are… Well, of dubious value, really. I’ve found [recent regressions in GPT 5.x](/space/notes/2026/05/07/0600) to have made them less effective since unlike `gpt-5.3-codex` newer models often don’t even read the files, but your mileage may vary.

[

Keep An Eye On Tests
----------

](/space/blog/2026/06/04/1222#keep-an-eye-on-tests)

In short, LLM-written tests are generally crap. Anthropic models, in particular, just plain *cheat* at writing them, so if you ask your LLM to write them, make sure you actually *read* them.

Unit tests written by LLMs very seldom do anything beyond the obvious, miss edge cases, etc. The only models that write halfway decent tests (as of mid-2026) are the Codex family of GPT models, and even vanilla 5.4/5.5 regressed on that from my standpoint, so my usual tactics are:

* Build a set of prompts to have *different* models refactor tests without looking at the *internals* of your code (i.e., focus on contracts).
* Treat tests as a black box that outputs a report, so that the session you are coding in does not see the tests and the session that runs and writes the tests does not see the code. You can call these different agents if you want–I call it separation of concerns.
* Set up CI/CD flows that run all of the tests with *zero* agent intervention, *but* have CI/CD generate concise Markdown reports the agents can consume.

The last point is critical, so set it up as soon as you can–it frees up time on your machine and any decent agent can use `gh` (or equivalent) to fetch CI/CD artifacts, review the results and file issues for itself.

[

Use LLMs to Fast-Track User Stories
----------

](/space/blog/2026/06/04/1222#use-llms-to-fast-track-user-stories)

This is where SOTA models shine. Even Sonnet, bless its little stupid heart, can take a set of requirements and distill them into user stories and feature files much faster than formal committee-style BDD processes, and the quality and coverage (so far) seems to be better than humans’.

If you work with customers, this last bit is *very* important–humans will want to describe the user stories that matter to *them* in exquisitely irrelevant detail while completely skimping on the ones they don’t care about, whereas LLMs won’t care if they are describing boring bits or not, and they won’t quibble at the details–they will just *do* it.

The resulting user stories need to be reviewed, of course, but piping UX requirements through an LLM and [Gherkin](https://cucumber.io/docs/gherkin/reference/?utm_source=taoofmac.com&utm_medium=web&utm_campaign=unsolicited_traffic&utm_content=external_link) typically generates pretty decent scripted tests, especially if the LLM can look at your Preact/Vue/etc. code and build corresponding Playwright scripts.

This will save you *weeks* of work, and catch dozens of inevitable regressions as LLMs subtly break your front-end code *en passant* while implementing new features.

Ask me how I know.

[

Again, Never Let The LLM Run Tests
----------

](/space/blog/2026/06/04/1222#again-never-let-the-llm-run-tests)

Mind that *I never rely on the LLM to run Playwright for the actual tests directly* - it will either cheat, be creative about how it inputs things, refresh the page to see if the DOM changes and break test state, etc. – it’s fine to use it to *explore* an app and draft the scripts, but when you run these things in CI/CD, you want them to be extremely deterministic.

And you want evidence of all functional tests, so I have a little toolkit to gather that evidence:

* Playwright for web testing
* `tmux` for TUI testing ([`rmux`](https://github.com/Helvesec/rmux?utm_source=taoofmac.com&utm_medium=web&utm_campaign=unsolicited_traffic&utm_content=external_link) is also a thing now, but if you work in regulated industries the paperwork to get it baked into an image will likely outweigh the benefits)
* A custom VNC harness for my retro emulators (using `tesseract` for OCR, which is surprisingly capable)
* And, sometimes, a webcam or an USB video capture adapter (plus a sub-agent that only describes what it sees)

As a bonus, besides a Markdown report, I also generate a PDF report with screenshots and logs for the failing cases–and an override switch to screenshot *all* the tests for occasional audits.

Again, ask me why.

[

Do Not Let The Models Edit Freely
----------

](/space/blog/2026/06/04/1222#do-not-let-the-models-edit-freely)

LLMs will *always* mangle long files, regardless of how big the model or context window is. Anthropic models (as of mid-2026) are particularly prone to that for some reason (as well as “drive by shootings” where they mangle tangentially related files).

You need to decrease your exposure to this kind of risk and do some proactive damage control by decreasing the impact of any such errors. It is not a matter of *if*, it is a matter of *when*, and it will nearly always manifest as weird regressions a few days down the line.

What I do:

* If possible in your harness, disable full-file `write` tooling and force the model to use `edit` or `diff` for focused edits. The added friction will typically prevent it from mangling entire files.
* Set strict caps on file sizes and (depending on the kind of package) guidelines for breaking up functionality.
* Review changes to see if unexpected files were touched (I have been meaning to create a `SKILL.md` for doing this automatically, but eyeballing by listing uncommitted files it is just easier).

Sometimes I wish I could just make unrelated files read-only before letting the LLM loose on React/Preact code, so I am looking into LSPs and static analysis to see if I can do the coding equivalent of raycasting–projecting out which files would be related to a specific change.

[

Aggressively Refactor at Every Opportunity
----------

](/space/blog/2026/06/04/1222#aggressively-refactor-at-every-opportunity)

Every few sessions. *stop and refactor the code*. Most technical debt from AI use comes from letting it literally piss all over your nice module structure.

In particular, I’ve found that LLMs like to define redundant types and duplicate code pretty much at random because *they can’t see across your entire code base*. If they’re operating in one part of the tree, they’ll be completely oblivious to the rest.

What I do is that once I have implemented one feature (or a sequence of features) and tests pass, I aggressively go in and review every single type, helper and filename.

Models can do *baseline* audits (the trope about OpenAI models fixing code Anthropic ones wrote is very much true in my experience), and you can trust *the outlines* of the audits, but with some caveats:

* They will always cut short the depth to which they analyze code
* They will often stop at module or dependency boundaries
* They will only try to merge or remove duplicate code if it is blatantly obvious (and even then it is not a guarantee)

I *do* use models for audits, but only as a starting point. Then I go in and:

* Point out where there was feature creep or duplication of code/responsibilities in the module structure
* Enforce things like centralized logging
* Manually flag duplicates and give instructions by adding `TODO` comments to the code

In [Go](/space/dev/golang) (which I have sort of gravitated to recently due to the balance of great profiling and refactoring tools and less cognitive overhead than [Rust](/space/dev/rust)), `gopls` can significantly help the model do most file splitting/refactoring automatically and without any chance for the model to mess things up, so every so often I fire up a dedicated session, hand it a prebaked set of guidelines and do a full-on refactoring pass.

[

Prune Abstractions
----------

](/space/blog/2026/06/04/1222#prune-abstractions)

Models have a tendency to follow “best practices” to a point where they create untenable messes of nested abstractions, very much like the sort of people who write Python as if they were cosplaying at writing Java–classes, accessors and factories everywhere, etc. You know what I’m talking about.

This is something that initial SPECs and system prompts actually help with, until the context window is so full that those guidelines are “forgotten”.

Weed those out ruthlessly. By all means define reusable contracts and use strong typing ([TypeScript](/space/dev/typescript) is a godsend in that regard), but expect your linter and LSP to catch your LLM red-handed.

[

Learn To Walk Away
----------

](/space/blog/2026/06/04/1222#learn-to-walk-away)

There are many ways to work with AI, and none of them work for everyone, but there are some basic tenets I follow:

* Shorter Sessions = more attrition. One-shotting features will just create more pain and technical debt down the line, and they foster an *illusion* of progress, not stuff you can actually rely on.
* Make sure you are willing to put in the design and spec effort. The more you *think* and plan yourself, the more grounding you can provide to an agent to keep it on track.
* Leaving the agent to its own devices for an hour or so will give you time to ponder–yes, it might be risky token-wise if you haven’t specced out the work well enough, but that is part of the challenge here.

I think Ralph loops are profoundly stupid and wasteful, but am very much a fan of writing a `SPEC`, chunking it into a `plan.md` (or your harness’ equivalent) that includes clear directions for testing and then using things like `/goal complete the plan.md file`, because that provides the agent with a clear cut set of steps.

Goal seeking of various forms ([autoresearch](/space/notes/2026/03/29/1300), performance optimizations, etc.) can be *extremely* effective and reliable, but only if you’ve stacked up most of the previous tricks written above (and even then I’ve caught LLMs cheating at benchmarks in the most egregious way: “the simplest option is to not execute the query” is a real thing that actually happened).

[

Aim For Reproducible Everything
----------

](/space/blog/2026/06/04/1222#aim-for-reproducible-everything)

Again, do not trust *any* of the code the agent puts out. And even if it works, keep track of *how* it works–in a sentence, instrument the crap out of everything:

* Enforce structured logging as soon as possible, and have automated checks to ensure that errors/exceptions/etc. are logged.
* Maintain a set of benchmarking/regression tests that output actual metrics (if you don’t use OpenTelemetry, try to at least have a text file with key metrics)
* Be *very* thorough about regression testing. Taking the time to rebuild and run last week’s version will often show that you’ve missed either testing for something or *measuring* something important.

Again, CI/CD is your friend here, and a lot of my time, even on personal projects, has been spent on building test and smoke harnesses of various kinds:

* Mock up external APIs and write various failure modes into the mocks so that the LLM will have to deal with “errors” from the start.
* When doing emulation/JIT work, create a test harness for each specific operation that you can `gdb` through (LLMs can actually do this pretty well), then a smoke harness that you can compare with QEMU, etc.
* When doing microcontroller work, build and test subroutines separately in the host machine before assuming they will work in the microcontroller.
* When doing inference optimizations (like in [`go-pherence`](https://github.com/rcarmo/go-pherence?utm_source=taoofmac.com&utm_medium=web&utm_campaign=unsolicited_traffic&utm_content=external_link)), cross-check similar kernels across back-ends and architectures to ensure they all provide the same results

The list goes on, but the key thing is that *everything should be automatable* and outside the control of the LLM.

Is all the above hard work? Yes. But can you take most of it along with you when you start a new project? Also pretty much yes–and the icing on the cake is that once you’ve gotten the basics down, the principles are all transferrable across stacks/environments/runtimes and the thought process will keep your wits sharp.

Not to mention these things will save you a bunch of time.