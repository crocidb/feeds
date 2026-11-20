+++
title = "Stacked diffs with Maiao"
description = " I have been using the community fork of Maiao for a little while now, and it is excellent. For anyone who prefers working with stacked diffs, but needs to interact with a more traditional forge such as GitHub, try using Maiao for a bit. *It just does the right thing in almost ev"
date = "2026-11-16T23:00:00Z"
url = "https://entropicthoughts.com/stacked-diffs-with-maiao"
author = "a@xkqr.org (kqr)"
text = ""
lastupdated = "2026-11-19T14:05:13.683406719Z"
seen = false
+++

 I have been using the community fork of Maiao for a little while now, and it is excellent. For anyone who prefers working with stacked diffs, but needs to interact with a more traditional forge such as GitHub, try using Maiao for a bit. *It just does the right thing in almost every situation*. It’s cut my frustration with GitHub at least in half, if not more.

 For the small group of readers who are stoked about stacked diffs, that’s probably enough of a pitch. For the rest of the world, let’s back up a little.

 On traditional forge platforms, pre-commit code review happens on *pull requests* (sometimes called *merge requests*), where each pull request is created from a git branch.

 Users that are new to git can then think of a branch as one development effort toward a small goal. They keep adding commits to that branch as long as its tip does not represent the goal state. At the end, when everything looks right and the change is approved, they perform an explicit merge. This means they create a merge commit on the upstream branch that references both the old upstream and the branch they worked on.

[(Continue reading the full article on the web.)](https://entropicthoughts.com/stacked-diffs-with-maiao)