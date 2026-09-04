---
title = "Zeit v1"
description = 'Nearly five years after its initial release, \_Zeit\_ has stood the \_test of time\_ (\_hah\_), and with the complete rewrite that is \_Zeit v1\_, I hope to continue that legacy while evolving it into a more advanced tool.'
date = "2025-10-30T09:28:08Z"
url = "https://xn--gckvb8fzb.com/zeit-v1/"
author = "marius@xn--gckvb8fzb.com (Marius)"
text = ""
lastupdated = "2025-10-31T14:47:07.903246940Z"
seen = true
---

*Zeit* began nearly five years ago as a pet project. I needed a lightweight, user-friendly tool to track time, with the added capability to export data for integration with other, mostly home-brewed software used for accounting and invoicing. At the time, I had only a basic set of features in mind and no clear long-term plan for the tool. Little did I know that I seemingly wasn’t alone in my need for a time tracker that stays out of the way and doesn’t come with an attached (paid) cloud service.

### The history of *Zeit v0* ###

Whenever users requested new features or options, I either implemented them myself or accepted their pull requests without much hesitation. My guiding principle was simple: If a small enhancement could make the software more useful to even one other person, I was happy to introduce it.

Nearly five years after its initial release, *Zeit* has stood the test of time (*hah*) quite well and continues to grow in popularity on [GitHub](https://github.com/mrusme/zeit). What began as a minimal command-line time-tracking utility has evolved into a more feature-rich program. Depending on your perspective, you might say it now has *a few too many* features.

Fast forward to today, and the first version of *Zeit* (referred to as *zeit v0*) has strayed far from its original goal of being a clean, minimal command-line tool. Instead, it has grown into an unwieldy user experience, cluttered with features that are neither intuitive nor well thought out. From a code standpoint, many of the decisions that made sense a few years ago now seem suboptimal, especially as we look to the future.

While I could have sifted through the original [*v0* codebase](https://github.com/mrusme/zeit/tree/v0) to clean it up and remove features that were added by contributors who eventually stopped maintaining them, I opted to rewrite *Zeit* from scratch. The new version is built on more modern dependencies, with a cleaner, more streamlined codebase, and is free of the “one-off” features added for individual users who no longer appear to use *Zeit*.

### A full rewrite: *Zeit v1* ###

Over the past five years, I’ve learned a great deal from user feedback. With *Zeit v1*, I’ve implemented the most practical and useful feature requests in a way that feels cohesive and polished, rather than like an afterthought.

Starting with the database, *Zeit v1* replaces the old storage engine, [BuntDB](https://github.com/tidwall/buntdb), with [BadgerDB v4](https://github.com/dgraph-io/badger). BadgerDB is an embeddable, persistent, and fast key-value (KV) database written in pure Go. This new database not only stores time entries but also user-specific configurations, eliminating the need for a separate config file and reducing external dependencies. This shift addresses past issues with unnecessary dependencies, such as [Viper](https://github.com/mrusme/zeit/issues/56), that would eventually cause more headaches than they would benefit the project.

*“Why not use SQLite?”* you might ask. The answer is simple: Cross-compiling. Unfortunately, there is no fully compliant SQLite implementation written in pure Go. Using the official SQLite implementation requires `CGO`, which complicates cross-compilation for various platforms. Additionally, the data *Zeit* generates fits well into a key-value store and doesn’t require the complexity of a relational database on the client side.

Next, I cleaned up the overall project structure and organized it into distinct areas for the database layer, internal business logic, the command-line interface (CLI), and output. Unlike *v0*, *Zeit* now uses [*Charm*’s *lipgloss* v2 library](https://github.com/charmbracelet/lipgloss) to render CLI output, taking advantage of the terminal’s default theme for colors. This results in a more seamless integration of *Zeit* into your terminal user interface (TUI) aesthetics.

Additionally, most *Zeit* commands (e.g., `blocks`, `export`, etc.) now support JSON output alongside the standard CLI output. This makes it easier to integrate *Zeit* with other tools. For example, to build your own project/task picker, you can leverage the JSON output of the `projects` command and use `jq` to create a list of project/task entries. You can then feed that list into your favorite *dmenu* launcher, simplifying the process of managing your time-tracking data:

```
zeit projects -f json \
  | jq -r \
  '.[] | .sid as $parent_sid | .tasks? // [] | .[] | "\($parent_sid)/\(.sid)"' \
  | $DMENU_PROGRAM

```

One change that will break compatibility with [existing integrations](https://github.com/mrusme/zeit/tree/v0?tab=readme-ov-file#integrations) is the new command-line interface, which adopts a similar approach to many of my newer tools, such as [*whats*](https://github.com/mrusme/whats). In the past, *Zeit* users had to learn and memorize command-line flags like `--project`, `--task`, `--begin`, and even less intuitive ones like `--only-projects-and-tasks` or `--append-project-id-to-task`. While *Zeit v1* still supports similar flags, its primary focus now shifts to a more *natural* way of using command-line arguments:

```
zeit start block \
  with note "Research: Coca-Cola Colombian death squads" \
  on personal/knowledge \
  4 hours ago \
  ended 10 minutes ago

```

As demonstrated by this otherwise complex example, which tracks a new *block* of time with a note on the *personal* project and *knowledge* task, starting four hours ago and ending ten minutes ago, the use of a more *natural* approach to command-line arguments significantly enhances a user’s understanding of the command. However, because *Zeit* still supports flags, the same command can also be executed using those:

```
zeit start \
  --note "Research: Coca-Cola Colombian death squads" \
  --project "personal" \
  --task "knowledge" \
  --start "4 hours ago" \
  --end "10 minutes ago"

```

The structure is kept (almost) identical across various commands and can hence be as well used for filters:

```
zeit blocks \
  on personal/knowledge \
  from last week \
  until two hours ago

```

This command lists all tracked time blocks for the *personal* project and *knowledge* task, from last week (at this time) until two hours ago today. As shown, the need for a detailed explanation is minimal, as the command’s purpose is easily understood just by looking at it. Similarly, as demonstrated in the previous example, the same flags can also be used with the `blocks` command:

```
zeit blocks \
  --project "personal" \
  --task "knowledge" \
  --start "last week" \
  --end "two hours ago"

```

If you use *Zeit* daily, you may find the *natural arguments* interface more intuitive and enjoyable than working with flags. However, if you’re building a tool that interacts with `zeit` to inject or extract data, you’ll likely prefer sticking to the more programmatically robust flags.

### The elephant in the room ###

With the complete rewrite of *Zeit*, one major change is its license.

Historically, all of my software projects on GitHub have been published under the GNU GPL v3 license, allowing **anyone** to use the software under conditions deemed appropriate by the [FSF](https://www.fsf.org) and the [OSI](https://opensource.org). However, as I explained in a previous status update [here](https://xn--gckvb8fzb.com/updates-2025-q3/#thoughts-on-licensing), these organizations were founded in a different era and, in my view, have failed to adapt to the realities of today. One glaring example of this is their incoherent stance on *freedom*, particularly when it comes to freedom of speech. It’s curious that many advocates of the GNU/OSI philosophies call for limitations on free speech while insisting that software must be usable without restriction in order to qualify as *free* and *open source*.

To put it simply, *Zeit v1* is no longer published under the GNU GPL or any of the OSI-approved licenses. Instead, it is now licensed under a partially modified HL3 license, which I’ve dubbed the [*SEGV license*](/segv/). This is not an *open source license* in the traditional (and, in my opinion, flawed) sense, but rather a *source-available* license. That said, I reject the taxonomy imposed by the FSF and the OSI and will continue to call my software *open source*, as the license change won’t have any practical impact for the average user. However, it is designed to ideally prevent certain groups whose goals I consider morally wrong from using the software.

Try it!
----------

I’ve completed the [first release of *Zeit v1*](https://github.com/mrusme/zeit/releases/tag/v1.0.0), marking the official debut of this complete rewrite, now with version number *v1.0.0*. Along with the new version, *Zeit* also has an official website:

[zeit.observer](https://zeit.observer)

While the site currently serves as a simple landing page, it will grow in functionality over time, as indicated by the features listed as coming *“soon”*.

Please note, however, that this new version is a full rewrite and **not compatible** with existing *Zeit v0* databases. If you’re currently using *Zeit v0*, worry not: You can export your entries using `zeit export --format zeit`, and then import them into *v1* with the new `zeit import -f v0` command. Just make sure you **first** export the database using *Zeit v0* and **only then** upgrade to *Zeit v1* and run the import command.

If you’re looking for a command-line utility for time tracking, especially if you’re already using another tracker, I’d love for you to give *Zeit v1* a try and [share your thoughts](/contact/). Let me know your top three missing features and which platforms you typically use for time tracking.