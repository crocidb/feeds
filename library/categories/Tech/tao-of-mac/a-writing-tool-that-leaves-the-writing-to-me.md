+++
title = "A Writing Tool That Leaves the Writing to Me"
description = "As my AI policy points out, I do revise my posts with AI, but until now, I’ve resorted to post-draft LLM passes that take a bunch of SKILL.md files and either fix outright typos and misspellings or add editorial blockquotes to my drafts."
date = "2026-09-19T16:59:00Z"
url = "https://taoofmac.com/space/blog/2026/09/19/1659?utm_content=atom"
author = "Rui Carmo"
text = ""
lastupdated = "2026-09-21T09:42:47.669724947Z"
seen = false
+++

As [my AI policy](/space/site/ai_policy#ai-usage-policy) points out, I do revise my posts with AI, but until now, I’ve resorted to post-draft LLM passes that take a bunch of `SKILL.md` files and either fix outright typos and misspellings or add editorial blockquotes to my drafts. The entire process feels needlessly *technical* in the sense that doing it inside [`vim`](/space/cli/vim#vim-and-neovim) or [VS Code](/space/apps/code#visual-studio-code) (typically as I bring stuff together for a final draft) detracts–or, rather, *distracts me*–from the writing experience too much, and sometimes automated replacements slip through.

I’ve been trying to do the techie thing and “shift left” all the stuff involved with revisions so that the final pass is mostly about auto-linking, diagrams, captions and the like. But I am fundamentally tired of trying to use [Obsidian](/space/apps/obsidian) as an editor, [Dinkus](/space/links/2026/08/23/1121#dinkus) (my current favourite on my laptop) doesn’t have an official iPad port, and [iA Writer](/space/apps/ia_writer#ia-writer) plain doesn’t work the way it should regarding accessing external folders on an iPad either, so I’ve actually been creating *yet another Markdown editor* based on [`swift-markdown-engine`](https://github.com/nodes-app/swift-markdown-engine?utm_campaign=unsolicited_traffic&utm_medium=web&utm_source=taoofmac.com).

The problem with that is that I still need to bite the bullet and go against my own ethical principles–which, in this case, means facing the unlikely proposition of finding myself paying for an Apple developer account to be able to [run my own code on my own hardware without it expiring after a week](/space/links/2026/08/18/1921#apple-announces-changes-for-apps-in-the-european-union).

But this week I stumbled upon [this very interesting post](https://sockpuppet.org/blog/2026/09/17/how-to-write-with-an-llm/?utm_campaign=unsolicited_traffic&utm_medium=web&utm_source=taoofmac.com) about using LLMs for writing. The AI angle is that the model just points out problems; it does not do wholesale replacements or even allow for an “apply all” button, and forces you to go back and revise things yourself.

That now has me looking at building a web app I can use from my iPad to do focused reviews, with comments attached to passages (possibly with `mark` or `aside` tags) and blind comparisons between revisions, and that I can run against a folder in my vault and keep in sync.

Since I already have my own checklists for things like reviews, terminology, etc., the idea seemed interesting enough for me to take a stab at it:

<img src="/space/blog/2026/09/19/1659/writing-workshop.png?v=369a9b15395f" alt="Writing workshop interface" width="1600" height="1080"> An early look at the writing workshop.

This is being built atop the [`pi` SDK](https://pi.dev/?utm_campaign=unsolicited_traffic&utm_medium=web&utm_source=taoofmac.com) and using [ProseMirror](https://prosemirror.net/?utm_campaign=unsolicited_traffic&utm_medium=web&utm_source=taoofmac.com) (which I’ve avoided using so far), but I’m taking some care to ensure I can port the entire thing to my nascent native [Swift](/space/dev/swift) editor. I haven’t actually used it for *anything* of substance, but I quite like the idea of having *one* thing to do consistent revisions.

And yes, I know [Word](/space/apps/word) has Copilot. It’s not a guided experience for writers, and, most importantly, it’s not *my* guided experience and workflow.