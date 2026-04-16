+++
title = "Obsidian"
description = "Obsidian is a very popular cross-platform note-taking application that allows you to use plain Markdown as a very "
date = "2022-08-03T12:00:00Z"
url = "https://taoofmac.com/space/apps/obsidian?utm_content=atom"
author = "Rui Carmo"
text = ""
lastupdated = "2026-04-15T10:42:49.427212743Z"
seen = true
+++

[Obsidian](http://obsidian.md?utm_source=taoofmac.com&utm_medium=web&utm_campaign=unsolicited_traffic&utm_content=external_link) is a very popular cross-platform [note-taking](/space/gtd/notes) application that allows you to use plain [Markdown](/space/markup/markdown) as a very flexible notes database and that I have somewhat begrudgingly adopted as a key part of my workflow during 2025.

I don’t exactly remember when I started using Obsidian daily—I suspect it was when I finally figured out how to use it with [SyncThing](/space/apps/syncthing) on my iPad, but another (just as important) milestone I remember was when I got [the Kanban plugin](https://github.com/mgmeyers/obsidian-kanban?utm_source=taoofmac.com&utm_medium=web&utm_campaign=unsolicited_traffic&utm_content=external_link) working, since that gave me a sensible cross-platform way to manage my to-dos across Mac and Linux (Reminders just doesn’t cut it in that scenario).

Don’t get me wrong, *I still don’t like Obsidian*. It is one of the many Electron-based nightmares that we have to run on our devices because, unfortunately, there isn’t anything demonstrably more developer-friendly (note that I didn’t say *better*).

In particular, I don’t like that it’s not open source, since despite not minding paying for software I think that anything I commit to using for multiple years should last “forever”. I don’t like how it approaches linking and metadata, and I absolutely didn’t like that it tries to tie you to a proprietary syncing service.

Despite all that, I use it daily on Linux, macOS, and iOS, and the combination of cross-platform access and the Kanban workflow fits my day-to-day needs perfectly.

[

Pluses
----------

](/space/apps/obsidian#pluses)

* The Kanban plugin has turned into my master to-do list, and I never managed to get Reminders to work cross-platform in the same way.
* There is a plugin that allows me to have my [Supernote Nomad](/space/reviews/2025/06/14/1530) notes show up in Obsidian, which is a nice trick. In fact, I can even run Obsidian on the Nomad itself.
* The Markdown editor essentially disappears when you’re editing, which I like because it lets me focus on the content rather than the formatting. Somehow [iA Writer](/space/apps/ia_writer) feels less polished, which is weird—I suspect it’s about it not being truly WYSIWYG.
* Obsidian’s secret power on mobile is the iOS swiping keyboard—I’m able to thumb type quite quickly with it, to the point where it’s just ridiculously easy to take an idle moment to jot down ideas.
* The Data Tables feature is stupendously powerful, and I am actively resisting using it too much because I know it will make my notes less portable.

[

Minuses
----------

](/space/apps/obsidian#minuses)

There are enough rough edges that I still keep coming up against the same issues:

* Its WikiLinks can’t be relative, or link to a page/folder rather than an `.md` file.
* Electron is a resource hog and feels sluggish on older hardware, so I end up editing in [Vim](/space/cli/vim) or another editor quite often.
* It cannot deal with front-matter “properly” (at least not the way I want it to), so importing this site into it never worked (and it is highly likely that it never will). That also means I can’t use it as a primary editor for this site directly, or, in fact, for a few [MkDocs](https://www.mkdocs.org?utm_source=taoofmac.com&utm_medium=web&utm_campaign=unsolicited_traffic&utm_content=external_link)-based sites I maintain.
* It’s proprietary in key ways (syncing, mobile app limitations, not open source).
* The Canvas feature is a nice idea, but it is nowhere near as good as a proper mind-mapping app like [XMind](/space/apps/xmind) (or even Apple’s Freeform).
* The graph view is cute, but not really useful for anything other than showing off.
* Setting a common look and feel across platforms is tricky, especially on iOS where CSS tweaks are limited.
* Plugins are *very* brittle, and hit-or-miss in quality. After a few months of trying out various plugins, I have no clue as to whether my current set of plugins will be maintained in the future (a couple that I use already bear deprecation notices, and I certainly don’t want to maintain them).
* It really doesn’t understand about folders, or about “one note per folder with all attachments” approaches. With the right plugins you can just paste an image into a note and it will store the attachment in the same folder, but it still feels hacky.

[

Workarounds
----------

](/space/apps/obsidian#workarounds)

I eventually worked out a set of alternatives and workarounds that make Obsidian usable for me:

* On iOS you can use Möbius Sync to keep a local folder and then use [SyncThing](/space/apps/syncthing) to sync a single vault. You do have to be careful about it, since the mobile app is *way* behind the desktop apps in functionality and feels artificially gimped—for instance, you cannot pick a vault location at will, so you need to be creative with workarounds (this is even true if, like me, you’re used to iOS folder sharing).
* Thanks to the [Linter plugin](https://github.com/platers/obsidian-linter?utm_source=taoofmac.com&utm_medium=web&utm_campaign=unsolicited_traffic&utm_content=external_link), I can enforce a set of formatting and metadata rules that make my notes consistent across platforms and editors, even if Obsidian itself doesn’t really understand them.
* I have a little script that takes an Obsidian note and moves it across to this site, where I finish editing it and publish it using VS Code. In fact, if VS Code had a decent live Markdown editor and a comparable Kanban editor, I might just use that instead of Obsidian altogether.

I suspect that some day I will take something like [Foam](https://foambubble.github.io/foam/?utm_source=taoofmac.com&utm_medium=web&utm_campaign=unsolicited_traffic&utm_content=external_link) and hack it into a workable notes system that I can run in [VS Code](/space/apps/code), but for now Obsidian is “good enough” despite its many flaws.

[

Resources
----------

](/space/apps/obsidian#resources)

|                                                                           Category                                                                           |                                                                                                                     Date                                                                                                                     |                                                                                                           Link                                                                                                           |                                                                                    Notes                                                                                     |
|--------------------------------------------------------------------------------------------------------------------------------------------------------------|----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
|                                                                         Alternatives                                                                         |                                                                                                                     2026                                                                                                                     |                                     [Napkin](https://github.com/Michaelliv/napkin?utm_source=taoofmac.com&utm_medium=web&utm_campaign=unsolicited_traffic&utm_content=external_link)                                     |local-first CLI for Obsidian vaults that operates directly on markdown files without the Obsidian app, designed as a memory system for AI agents using progressive disclosure.|
|                                                                             2024                                                                             |                                              [siyuan](https://github.com/siyuan-note/siyuan?utm_source=taoofmac.com&utm_medium=web&utm_campaign=unsolicited_traffic&utm_content=external_link)                                               |                                                 a privacy-first personal knowledge management system that supports block-level references and Markdown WYSIWYG editing.                                                  |                                                                                                                                                                              |
|                                                                           Plugins                                                                            |                                                                                                                     2026                                                                                                                     |                         [Memory for AI](https://github.com/jrcruciani/obsidian-memory-for-ai?utm_source=taoofmac.com&utm_medium=web&utm_campaign=unsolicited_traffic&utm_content=external_link)                          |           Plugin that gives Obsidian agents a dedicated, persistent memory interface to retain and recall conversation context and project notes across sessions.            |
|         [YAOS](https://github.com/kavinsood/yaos?utm_source=taoofmac.com&utm_medium=web&utm_campaign=unsolicited_traffic&utm_content=external_link)          |                                          Zero-terminal real-time sync engine for Obsidian using your own Cloudflare Worker instead of conventional file sync or self-hosted database-heavy setups.                                           |                                                                                                                                                                                                                          |                                                                                                                                                                              |
|[obsidian-skills](https://github.com/kepano/obsidian-skills?utm_source=taoofmac.com&utm_medium=web&utm_campaign=unsolicited_traffic&utm_content=external_link)|                                        Agent Skills bundle for Obsidian that teaches compatible agents to edit Obsidian Markdown, Bases, JSON Canvas, and interact with vaults via the Obsidian CLI.                                         |                                                                                                                                                                                                                          |                                                                                                                                                                              |
| [Sidekick](https://github.com/vieiraae/obsidian-sidekick?utm_source=taoofmac.com&utm_medium=web&utm_campaign=unsolicited_traffic&utm_content=external_link)  |AI-powered assistant panel that plugs into GitHub Copilot or BYOK providers, bundles agents/skills/tools/prompts/triggers, offers ghost-text autocomplete and editor context menu actions, and boots a `sidekick/` folder with sample configs.|                                                                                                                                                                                                                          |                                                                                                                                                                              |
|                                                                             2025                                                                             |                                  [Smart Composer](https://github.com/glowingjade/obsidian-smart-composer?utm_source=taoofmac.com&utm_medium=web&utm_campaign=unsolicited_traffic&utm_content=external_link)                                  |                               Probably the nicest, most straightforward LLM plugin for revising grammar and overall formatting. Supports LiteLLM and custom endpoints without any issues.                                |                                                                                                                                                                              |
|  [livesync](https://github.com/vrtmrz/obsidian-livesync?utm_source=taoofmac.com&utm_medium=web&utm_campaign=unsolicited_traffic&utm_content=external_link)   |                                                                                 Obsidian plugin for WebRTC-based real-time collaboration and synchronization                                                                                 |                                                                                                                                                                                                                          |                                                                                                                                                                              |
|                                                                          Publishing                                                                          |                                                                                                                     2026                                                                                                                     |                        [Obsidian Web Sync R2](https://github.com/soestin/Obsidian-Web-Sync-R2?utm_source=taoofmac.com&utm_medium=web&utm_campaign=unsolicited_traffic&utm_content=external_link)                         |                                      Publish an Obsidian vault as a website using Cloudflare Workers and R2, synced via Remotely Sync.                                       |
|                                                                             2024                                                                             |                                                                                                      [Quartz](/space/quartz.jzhao.xyz)                                                                                                       |a static site generator that can directly publish Obsidian vaults. It’s beautiful, but suffers from the usual PWA stupidity of downloading a `contentindex.json` *with your site’s entire plaintext* to facilitate search.|                                                                                                                                                                              |