+++
title = "How I use Jujutsu"
description = "About three months ago I started using Jujutsu (JJ), a new Version Control System, for my personal projects. It took me a while to get used to it after more than a decade of using [Git](https://git-s"
date = "2026-01-10T00:00:00Z"
url = "https://abhinavsarkar.net/posts/jj-usage/"
author = "Abhinav Sarkar"
text = ""
lastupdated = "2026-07-21T09:17:41.442511653Z"
seen = false
+++

About three months ago I started using [Jujutsu](https://jj-vcs.dev/) (JJ), a new *[Version Control System](https://en.wikipedia.org/wiki/Version_Control_System)*, for my personal projects. It took me a while to get used to it after more than a decade of using [Git](https://git-scm.com/), but now I’m quite comfortable with it. Working with Jujutsu requires a shift from the mental model of Git. However, it is not as daunting as it may seem on the first day.

This post was originally published on [abhinavsarkar.net](https://abhinavsarkar.net/posts/jj-usage/?mtm_campaign=feed).

Looking back, I don’t actually use all the fancy things JJ provides, and you may not need to either. In this post I list my most used JJ commands and how I use them. It is not meant to be a tutorial, or even a comprehensive list, but it should be enough to get you started.

This post assumes that the reader knows how to use Git.

### Contents ###

1. [Starting Up](#starting-up)
   1. [`jj git init`](#jj-git-init)
   2. [`jj git clone`](#jj-git-clone)
   3. [`jj config`](#jj-config)

2. [Creating Changes](#creating-changes)
   1. [`jj new`](#jj-new)
   2. [`jj describe`](#jj-describe)
   3. [`jj commit`](#jj-commit)
   4. [`jj status`](#jj-status)

3. [Modifying Changes](#modifying-changes)
   1. [`jj edit`](#jj-edit)
   2. [`jj squash`](#jj-squash)
   3. [`jj split`](#jj-split)
   4. [`jj restore`](#jj-restore)
   5. [`jj rebase`](#jj-rebase)
   6. [`jj duplicate`](#jj-duplicate)
   7. [`jj abandon`](#jj-abandon)
   8. [`jj absorb`](#jj-absorb)

4. [Viewing Changes](#viewing-changes)
   1. [`jj log`](#jj-log)
   2. [`jj diff`](#jj-diff)
   3. [`jj show`](#jj-show)

5. [Managing Branches](#managing-branches)
   1. [`jj bookmark`](#jj-bookmark)

6. [Managing State](#managing-state)
   1. [`jj op log`](#jj-op-log)
   2. [`jj undo`](#jj-undo)
   3. [`jj redo`](#jj-redo)

7. [Working with Git](#working-with-git)
   1. [`jj git push`](#jj-git-push)
   2. [`jj git fetch`](#jj-git-fetch)
   3. [`jj git remote`](#jj-git-remote)

8. [Other Useful Commands](#other-useful-commands)
   1. [`jj revert`](#jj-revert)
   2. [`jj resolve`](#jj-resolve)

9. [Custom Configuration](#custom-configuration)
   1. [Revset Aliases](#revset-aliases)
   2. [Command Aliases](#command-aliases)

10. [Conclusion](#conclusion)

Starting Up[#](#starting-up)
----------

JJ uses Git as a backend. This means that you can still use Git commands in your repo, and push them to Git remotes. Your coworkers can keep using Git with shared repos without ever being aware that you use JJ.

### `jj git init`[#](#jj-git-init) ###

`jj git init` initializes a new Jujutsu repository. You do this once, and you’re ready to start working. I usually run it with the `--colocate` option, which allows me to use Git commands as well in the same repo. If you want to work in an existing Git repo, you should run it with `--git-repo .` in the repo directory, to make JJ aware of it. Afterward, you don’t need to use Git commands.

### `jj git clone`[#](#jj-git-clone) ###

`jj git clone` clones a Git repo and initializes it as a JJ repo. You can supply the `--colocate` option if you want.

### `jj config`[#](#jj-config) ###

`jj config` configures user settings. You can edit the user-level JJ config file by running `jj config edit --user`. You can also override settings at repo level. For example, to set a different user email for a repo, run `jj config set --repo user.email someone@example.com`. You can also run `jj config list` to list the current config in effect.

Creating Changes[#](#creating-changes)
----------

This is an area where JJ differs a lot from Git. JJ has no staging area, which means that every change you make is automatically and continuously staged. This came as a big surprise to me when I was getting started.

If you are planning to use JJ with an existing Git repo, get rid of the untracked files either by committing them, or deleting them, or adding them to `.gitignore`. Alternatively, you can set the config `snapshot.auto-track = "none()"`, which disables auto-tracking of files, but then you’ll have to track each new file manually by running the command `jj file track`.

JJ has the concept of commits, same as Git. However, the workflow is different. Since there is no staging area, you start with creating a commit. That’s right! The first thing you do is create a commit, and then fill it by changing your files. Once you are done, you finalize the commit, and move on to a new fresh commit. JJ prefers to call them “changes” instead of commits to distinguish them from Git commits.

### `jj new`[#](#jj-new) ###

`jj new` creates a new change. If you know what your change is about, you can start with a commit message: `jj new -m "Fixes XYZ"`, but JJ does not mandate it. You can start making changes without worrying about the message.

One useful variation that I use a lot is `jj new -A '<change-id>'`. This creates a new change after the given change but before all the change’s descendants, effectively inserting a new change in the commit tree while simultaneously rebasing all descendant change.

### `jj describe`[#](#jj-describe) ###

Once you are done, you can add a commit message to the current change by running `jj describe`. You can also provide the message inline: `jj describe -m "Fixes XYZ"`. As I mentioned, you don’t need to add a message to start working on a change, but you do need it before you push the change to a Git remote. You can run it any number of times to change the current change’s message.

### `jj commit`[#](#jj-commit) ###

Alternatively, you can run `jj commit` to describe the current commit and start a new one. It is equivalent to running `jj describe` followed by `jj new`.

I use a mix of `new`, `describe` and `commit`, depending on the situation.

### `jj status`[#](#jj-status) ###

Like the `git status` command, `jj status` tells you the state your current change is in. It lists the changed files and their individual statuses (added, modified, etc).

Modifying Changes[#](#modifying-changes)
----------

This is where JJ really shines compared to Git. Moving commits around or editing them is a massive pain in Git. However, JJ makes it so easy, I do it many times a day.

### `jj edit`[#](#jj-edit) ###

`jj edit '<change-id>'` switches you over to the given change so you can modify it further. You use this when you’ve already committed a change but you need to tweak it. By default, you can edit only the changes that haven’t been pushed to the main branch of your repo’s remote. After you edit files, all the descendant changes are automatically rebased if there are no conflicts.

### `jj squash`[#](#jj-squash) ###

`jj squash` simply combines the current change with its parent. It is useful when you commit something, and realize that you forgot to make some small changes. Another use for it is to resolve conflicts: create a new change after the conflicted change, fix the conflict, and squash it to resolve.

### `jj split`[#](#jj-split) ###

`jj split` is the opposite of `jj squash`: you use it to interactively split the current change into two or more changes. Often when I’m working on a feature and I find some unrelated things to fix, such as linter warnings, I go ahead and fix them in the same change. After I’m done with all the work for the feature, I use `jj split` to split the change into unrelated changes so that the project history stays clean.

### `jj restore`[#](#jj-restore) ###

`jj restore` restores files to how they were before the change, pretty much same as `git restore`. You can run it in interactive mode by adding the `--interactive` option. You can also restore the files to how they were in a different change by specifying a change ID with the `--from` option.

### `jj rebase`[#](#jj-rebase) ###

`jj rebase` moves changes from anywhere to anywhere. You can use it to move individual changes between branches, or rearrange them in the same branch like so:

```
jj rebase -s '<change-id-to-move>' -o '<new-parent-change-id-to-move-to>'
```

When you move single changes like this, their descendant changes become invalid, but you can move them also in the same way. Or you can move entire branch of changes:

```
jj rebase -b '<branch-root-change-id-to-move>' -o '<new-parent-change-id-to-move-to>'
```

It mostly works without any issues, but if there are conflicts, you’ll need to resolve them. I actually use rebase all the time. When I’m working on multiple features, and I find something that is more suited to be done on a different feature branch than I’m currently on, I finish working on the change, and then just move it to the different branch. Another use is to rebase feature branches on the main branch every day, like so:

```
jj rebase -b oy -b st -b om -b tk -o main
```

Here, `oy`, `st`, `om`, and `tk` are shorthand change IDs of the roots of various feature branches.

You can also use rebase to splice changes/branches in the middle of other branches using the `-A` (after) and `-B` (before) options, but I rarely do this.

### `jj duplicate`[#](#jj-duplicate) ###

`jj duplicate` is like `jj rebase` except the changes are not moved but copied to the destination. It’s somewhat like `git cherry-pick`.

### `jj abandon`[#](#jj-abandon) ###

`jj abandon` discards a change and rebases all its descendants onto the discarded change’s parent. I use it to get rid of failed experiments or prototypes.

### `jj absorb`[#](#jj-absorb) ###

`jj absorb` is supposed to automatically break the current change and integrate parts of it into ancestor changes at the right places, but I haven’t managed to make it work yet. I need to look more deeply into this.

Viewing Changes[#](#viewing-changes)
----------

### `jj log`[#](#jj-log) ###

`jj log` shows the change graph. JJ has a concept of [revsets](https://www.jj-vcs.dev/latest/revsets/) (sets of changes) that has an entire language to specify change IDs. `jj log` takes an `-r` argument that uses the revsets language to choose which changes to show. For example:

```
# all changes in the last one month
jj log -r 'committer_date(after:"1 month ago")'

# all changes done by me
jj log -r 'author("Abhinav Sarkar")'

# all changes done by me in the last one month
jj log -r 'author("Abhinav Sarkar") & committer_date(after:"1 month ago")'

# all changes that changed the given file
jj log -r 'files(about.md)'

# all changes that currently have conflicts
jj log -r 'conflicts()'
```

The revset language is rich and revsets can be used with many JJ commands. You can also create your own aliases for it, as we’ll see in a later section.

### `jj diff`[#](#jj-diff) ###

`jj diff` shows differences between two changes, or in general between two revsets:

```
# diff between the parent change and the current change
jj diff

# diff between the current change (@) and another change for files in the src directory
jj diff --from @ --to '<change-id>' src/

# diff between the main and develop branches
jj diff -r 'main..develop'
```

### `jj show`[#](#jj-show) ###

`jj show` shows the details of the current change. You can also use `jj show '<change-id>'` to inspect another change without switching to it.

Managing Branches[#](#managing-branches)
----------

I’ve been mentioning branches, but actually JJ does not have branches like Git does. Instead, it has bookmarks, which are named pointers to changes. You can bookmark any change by giving it a name, and you can manipulate the bookmarks. Then to have branches, all you need to do is to point a bookmark to the required tip of the change graph.

### `jj bookmark`[#](#jj-bookmark) ###

`jj bookmark create '<name>'` creates a new bookmark pointing to the current change with the given name. You can use bookmarks to mark the root or the tip of a feature branch, or to mark a milestone you want to return to later. When you rebase a change that a bookmark points to, the bookmark moves with it automatically.

To list all existing bookmarks, run `jj bookmark list`. To delete a bookmark you no longer need, run `jj bookmark delete '<name>'`. If the deleted bookmark is tracked as a remote Git branch, the deletion is propagated to the remote as well. Alternatively, you can delete a bookmark only locally by running `jj bookmark forget '<name>'`.

You can also move, rename, and set bookmarks, as well as associate/disassociate them with Git remote branches. If you push a change with a bookmark to a Git remote, JJ creates a Git branch with the same name on the remote, but locally it remains a JJ bookmark.

Managing State[#](#managing-state)
----------

JJ tracks each operation in the repository in an immutable log, and provides commands to work with this log.

### `jj op log`[#](#jj-op-log) ###

`jj op log` shows a history of all operations performed on the repository. Each operation is assigned a unique ID, and you can see what changed with each operation.

You can use the op IDs to restore the whole repo to an earlier state by running `jj op restore '<opID>'`.

### `jj undo`[#](#jj-undo) ###

`jj undo` undoes the last operation performed on the repository. Unlike `git reset`, which modifies history, `jj undo` works on the Jujutsu operations themselves. This means it doesn’t lose any information; it just moves you back one step in the operation history. You can run this repeatedly to move backward in the operation history one step at a time.

### `jj redo`[#](#jj-redo) ###

`jj redo` is the opposite of `jj undo`, that is, it moves you forward in the operation history by one step. It can also be run repeatedly.

The operation log along with the undo and redo commands provide a safety net that makes it much easier to experiment with JJ without the fear of losing work.

Working with Git[#](#working-with-git)
----------

JJ uses Git as its backend, and provides commands to interact with remote Git repos. We already learned about `jj git init` and `jj git clone`. We can also push and fetch.

### `jj git push`[#](#jj-git-push) ###

`jj git push` pushes your JJ changes to a Git remote. By default, it pushes all tracked bookmarks that have new changes. If you want to push a specific bookmark, you can specify it with `jj git push --bookmark '<name>'`. You can also push to all or tracked branches with the `--all` and `--tracked` options respectively. When you push, JJ converts the changes into Git commits and creates or updates remote Git branches accordingly.

One thing to note is that JJ refuses to push changes that have conflicts or are missing commit messages.

### `jj git fetch`[#](#jj-git-fetch) ###

`jj git fetch` fetches changes from a Git remote and updates your local repository. It’s equivalent to `git fetch`. After fetching, you can see the remote changes in your change graph, and you can rebase your local changes on top of them if needed.

You can fetch from a specific remote by running `jj git fetch --remote '<name>'`, and fetch a particular branch by running `jj git fetch --branch '<name>'`.

### `jj git remote`[#](#jj-git-remote) ###

`jj git remote` manages your Git remotes. You can add a new remote with `jj git remote add <name> <url>`, or list existing remotes with `jj git remote list`. This is similar to `git remote` but integrated with JJ; it does not update the remotes of your underlying Git repo.

Other Useful Commands[#](#other-useful-commands)
----------

### `jj revert`[#](#jj-revert) ###

`jj revert '<change-id>'` creates a new change that undoes the effects of the specified change, pretty much like `git revert`. The reverted change remains in the history of the repo.

### `jj resolve`[#](#jj-resolve) ###

`jj resolve` marks conflicts as resolved during a merge. When JJ can’t automatically merge changes (for example, when two changes modified the same lines), it creates a conflicted state in your working directory. After you manually fix the conflicts in your files, you run `jj resolve` to tell JJ that the conflicts are resolved and the merge can proceed. JJ then automatically rebases any descendant changes.

Custom Configuration[#](#custom-configuration)
----------

JJ is highly customizable through its configuration files. You can define custom aliases for commonly used commands and revsets, which can significantly ease up your workflow. These are stored in your JJ config file at the user and/or repo level. Here’s my configuration:

```
[aliases]
log-recent = [ "log", "-r", "default() & recent()" ]
tug = [
    "bookmark",
    "move",
    "--from",
    "heads(::@ & bookmarks())",
    "--to",
    "closest_pushable(@)",
]

[revset-aliases]
"closest_pushable(to)" = """
heads(::to & mutable() & ~description(exact:"") & (~empty() | merges()))
"""
"default()" = """
coalesce(trunk(),root())::present(@) | ancestors(visible_heads() & recent(), 5)
"""
"recent()" = """
committer_date(after:"1 month ago")
"""

[ui]
default-command = "log-recent"
```

### Revset Aliases[#](#revset-aliases) ###

You can compose revsets to create new revsets. These are the ones I use:

* `closest_pushable(to)`: finds nonempty leaf changes that are mutable, have descriptions, and can be pushed to a remote.
* `default()`: finds changes from the default branch or the repository root to the current change, plus ancestors of visible leaf changes from the last 5 days. This gives me a good overview of the state of my repo.
* `recent()`: finds all changes from the last month.

### Command Aliases[#](#command-aliases) ###

I use the above defined revsets to create some custom commands:

* `log-recent`: shows the recent changes from the default branch to the present, combining the `default()` and `recent()` revsets.
* `tug`: moves the bookmark in the current branch to the closest pushable commit.

I have the default command set to `log-recent` so running only `jj` shows me the recent log.

My usual workflow is to create a new commit, work on it, describe it, split/squash/rebase as needed, then run `jj tug && jj git push`.

Conclusion[#](#conclusion)
----------

Three months in, JJ has become my primary version control tool. The learning curve was steep, but it was worth it. The ability to freely rearrange changes and experiment without fear has fundamentally changed how I work. I spend less time wrestling with Git and more time actually coding.

JJ has plenty of other useful features such as workspaces and the ability to manipulate multiple changes at once that I haven’t explored deeply. There’s a lot more to discover as I continue using it. If you use Git for personal projects and find yourself frustrated with rebasing or commit management, JJ might be worth a try.

For further learning, I recommend the [*Jujutsu for Everyone* tutorial](https://jj-for-everyone.github.io/), [Steve Klabnik’s tutorial](https://steveklabnik.github.io/jujutsu-tutorial/introduction/introduction.html) and [Justin Pombrio’s Jujutsu cheat sheet](https://justinpombrio.net/2025/02/11/jj-cheat-sheet.html), and of course, the [Jujutsu official documentation](https://www.jj-vcs.dev/latest/).

 If you have any questions or comments, please leave a comment below. If you liked this post, please share it. Thanks for reading!

---

Thanks for reading this post via feed. Feeds are great, and you're great for using them. ♥

This post was originally published on [abhinavsarkar.net](https://abhinavsarkar.net/posts/jj-usage/?mtm_campaign=feed).

### Like, repost, or comment on: ###

* [Fediverse](https://fantastic.earth/@abnv/115870639648433879)
* [Lobsters](https://lobste.rs/s/osmrzx)
* [Reddit](https://www.reddit.com/r/programming/comments/1q97pqx/)
* [Hacker News](https://news.ycombinator.com/item?id=46564973)
* [My website](https://abhinavsarkar.net/posts/jj-usage/?mtm_campaign=feed#comment-container)

Read more of my [posts](https://abhinavsarkar.net/posts/) and [notes](https://abhinavsarkar.net/notes/).

![](https://anna.abhinavsarkar.net/matomo.php?idsite=1&rec=1)