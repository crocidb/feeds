+++
title = "Timing events in code"
description = "Earlier this year I noticed my Artemis reader page (the page that lists posts published by sites to which I am subscribed) was loading slowly. The logic to generate the page encompasses several hundred lines of code, which do everything from retrieving posts from the database to "
date = "2026-09-06T00:00:00Z"
url = "https://jamesg.blog/2026/09/06/timing-events-in-code"
author = "with words, wonder"
text = ""
lastupdated = "2026-09-08T09:44:05.307656087Z"
seen = true
+++

pre { line-height: 125%; } td.linenos .normal { color: inherit; background-color: transparent; padding-left: 5px; padding-right: 5px; } span.linenos { color: inherit; background-color: transparent; padding-left: 5px; padding-right: 5px; } td.linenos .special { color: #000000; background-color: #ffffc0; padding-left: 5px; padding-right: 5px; } span.linenos.special { color: #000000; background-color: #ffffc0; padding-left: 5px; padding-right: 5px; } .highlight .hll { background-color: #49483e } .highlight { background: #272822; color: #F8F8F2 } .highlight .c { color: #959077 } /\* Comment \*/ .highlight .err { color: #ED007E; background-color: #1E0010 } /\* Error \*/ .highlight .esc { color: #F8F8F2 } /\* Escape \*/ .highlight .g { color: #F8F8F2 } /\* Generic \*/ .highlight .k { color: #66D9EF } /\* Keyword \*/ .highlight .l { color: #AE81FF } /\* Literal \*/ .highlight .n { color: #F8F8F2 } /\* Name \*/ .highlight .o { color: #FF4689 } /\* Operator \*/ .highlight .x { color: #F8F8F2 } /\* Other \*/ .highlight .p { color: #F8F8F2 } /\* Punctuation \*/ .highlight .ch { color: #959077 } /\* Comment.Hashbang \*/ .highlight .cm { color: #959077 } /\* Comment.Multiline \*/ .highlight .cp { color: #959077 } /\* Comment.Preproc \*/ .highlight .cpf { color: #959077 } /\* Comment.PreprocFile \*/ .highlight .c1 { color: #959077 } /\* Comment.Single \*/ .highlight .cs { color: #959077 } /\* Comment.Special \*/ .highlight .gd { color: #FF4689 } /\* Generic.Deleted \*/ .highlight .ge { color: #F8F8F2; font-style: italic } /\* Generic.Emph \*/ .highlight .ges { color: #F8F8F2; font-weight: bold; font-style: italic } /\* Generic.EmphStrong \*/ .highlight .gr { color: #F8F8F2 } /\* Generic.Error \*/ .highlight .gh { color: #F8F8F2 } /\* Generic.Heading \*/ .highlight .gi { color: #A6E22E } /\* Generic.Inserted \*/ .highlight .go { color: #66D9EF } /\* Generic.Output \*/ .highlight .gp { color: #FF4689; font-weight: bold } /\* Generic.Prompt \*/ .highlight .gs { color: #F8F8F2; font-weight: bold } /\* Generic.Strong \*/ .highlight .gu { color: #959077 } /\* Generic.Subheading \*/ .highlight .gt { color: #F8F8F2 } /\* Generic.Traceback \*/ .highlight .kc { color: #66D9EF } /\* Keyword.Constant \*/ .highlight .kd { color: #66D9EF } /\* Keyword.Declaration \*/ .highlight .kn { color: #FF4689 } /\* Keyword.Namespace \*/ .highlight .kp { color: #66D9EF } /\* Keyword.Pseudo \*/ .highlight .kr { color: #66D9EF } /\* Keyword.Reserved \*/ .highlight .kt { color: #66D9EF } /\* Keyword.Type \*/ .highlight .ld { color: #E6DB74 } /\* Literal.Date \*/ .highlight .m { color: #AE81FF } /\* Literal.Number \*/ .highlight .s { color: #E6DB74 } /\* Literal.String \*/ .highlight .na { color: #A6E22E } /\* Name.Attribute \*/ .highlight .nb { color: #F8F8F2 } /\* Name.Builtin \*/ .highlight .nc { color: #A6E22E } /\* Name.Class \*/ .highlight .no { color: #66D9EF } /\* Name.Constant \*/ .highlight .nd { color: #A6E22E } /\* Name.Decorator \*/ .highlight .ni { color: #F8F8F2 } /\* Name.Entity \*/ .highlight .ne { color: #A6E22E } /\* Name.Exception \*/ .highlight .nf { color: #A6E22E } /\* Name.Function \*/ .highlight .nl { color: #F8F8F2 } /\* Name.Label \*/ .highlight .nn { color: #F8F8F2 } /\* Name.Namespace \*/ .highlight .nx { color: #A6E22E } /\* Name.Other \*/ .highlight .py { color: #F8F8F2 } /\* Name.Property \*/ .highlight .nt { color: #FF4689 } /\* Name.Tag \*/ .highlight .nv { color: #F8F8F2 } /\* Name.Variable \*/ .highlight .ow { color: #FF4689 } /\* Operator.Word \*/ .highlight .pm { color: #F8F8F2 } /\* Punctuation.Marker \*/ .highlight .w { color: #F8F8F2 } /\* Text.Whitespace \*/ .highlight .mb { color: #AE81FF } /\* Literal.Number.Bin \*/ .highlight .mf { color: #AE81FF } /\* Literal.Number.Float \*/ .highlight .mh { color: #AE81FF } /\* Literal.Number.Hex \*/ .highlight .mi { color: #AE81FF } /\* Literal.Number.Integer \*/ .highlight .mo { color: #AE81FF } /\* Literal.Number.Oct \*/ .highlight .sa { color: #E6DB74 } /\* Literal.String.Affix \*/ .highlight .sb { color: #E6DB74 } /\* Literal.String.Backtick \*/ .highlight .sc { color: #E6DB74 } /\* Literal.String.Char \*/ .highlight .dl { color: #E6DB74 } /\* Literal.String.Delimiter \*/ .highlight .sd { color: #E6DB74 } /\* Literal.String.Doc \*/ .highlight .s2 { color: #E6DB74 } /\* Literal.String.Double \*/ .highlight .se { color: #AE81FF } /\* Literal.String.Escape \*/ .highlight .sh { color: #E6DB74 } /\* Literal.String.Heredoc \*/ .highlight .si { color: #E6DB74 } /\* Literal.String.Interpol \*/ .highlight .sx { color: #E6DB74 } /\* Literal.String.Other \*/ .highlight .sr { color: #E6DB74 } /\* Literal.String.Regex \*/ .highlight .s1 { color: #E6DB74 } /\* Literal.String.Single \*/ .highlight .ss { color: #E6DB74 } /\* Literal.String.Symbol \*/ .highlight .bp { color: #F8F8F2 } /\* Name.Builtin.Pseudo \*/ .highlight .fm { color: #A6E22E } /\* Name.Function.Magic \*/ .highlight .vc { color: #F8F8F2 } /\* Name.Variable.Class \*/ .highlight .vg { color: #F8F8F2 } /\* Name.Variable.Global \*/ .highlight .vi { color: #F8F8F2 } /\* Name.Variable.Instance \*/ .highlight .vm { color: #F8F8F2 } /\* Name.Variable.Magic \*/ .highlight .il { color: #AE81FF } /\* Literal.Number.Integer.Long \*/ .highlight .nn, .highlight .n{color: light-dark(black, var(--dark-foreground-color)) }pre { line-height: 125%; } td.linenos .normal { color: inherit; background-color: transparent; padding-left: 5px; padding-right: 5px; } span.linenos { color: inherit; background-color: transparent; padding-left: 5px; padding-right: 5px; } td.linenos .special { color: #000000; background-color: #ffffc0; padding-left: 5px; padding-right: 5px; } span.linenos.special { color: #000000; background-color: #ffffc0; padding-left: 5px; padding-right: 5px; } .highlight .hll { background-color: #ffffcc } .highlight { background: #f8f8f8; } .highlight .c { color: #3D7B7B; font-style: italic } /\* Comment \*/ .highlight .err { border: 1px solid #F00 } /\* Error \*/ .highlight .k { color: #008000; font-weight: bold } /\* Keyword \*/ .highlight .o { color: #666 } /\* Operator \*/ .highlight .ch { color: #3D7B7B; font-style: italic } /\* Comment.Hashbang \*/ .highlight .cm { color: #3D7B7B; font-style: italic } /\* Comment.Multiline \*/ .highlight .cp { color: #9C6500 } /\* Comment.Preproc \*/ .highlight .cpf { color: #3D7B7B; font-style: italic } /\* Comment.PreprocFile \*/ .highlight .c1 { color: #3D7B7B; font-style: italic } /\* Comment.Single \*/ .highlight .cs { color: #3D7B7B; font-style: italic } /\* Comment.Special \*/ .highlight .gd { color: #A00000 } /\* Generic.Deleted \*/ .highlight .ge { font-style: italic } /\* Generic.Emph \*/ .highlight .ges { font-weight: bold; font-style: italic } /\* Generic.EmphStrong \*/ .highlight .gr { color: #E40000 } /\* Generic.Error \*/ .highlight .gh { color: #000080; font-weight: bold } /\* Generic.Heading \*/ .highlight .gi { color: #008400 } /\* Generic.Inserted \*/ .highlight .go { color: #717171 } /\* Generic.Output \*/ .highlight .gp { color: #000080; font-weight: bold } /\* Generic.Prompt \*/ .highlight .gs { font-weight: bold } /\* Generic.Strong \*/ .highlight .gu { color: #800080; font-weight: bold } /\* Generic.Subheading \*/ .highlight .gt { color: #04D } /\* Generic.Traceback \*/ .highlight .kc { color: #008000; font-weight: bold } /\* Keyword.Constant \*/ .highlight .kd { color: #008000; font-weight: bold } /\* Keyword.Declaration \*/ .highlight .kn { color: #008000; font-weight: bold } /\* Keyword.Namespace \*/ .highlight .kp { color: #008000 } /\* Keyword.Pseudo \*/ .highlight .kr { color: #008000; font-weight: bold } /\* Keyword.Reserved \*/ .highlight .kt { color: #B00040 } /\* Keyword.Type \*/ .highlight .m { color: #666 } /\* Literal.Number \*/ .highlight .s { color: #BA2121 } /\* Literal.String \*/ .highlight .na { color: #687822 } /\* Name.Attribute \*/ .highlight .nb { color: #008000 } /\* Name.Builtin \*/ .highlight .nc { color: #00F; font-weight: bold } /\* Name.Class \*/ .highlight .no { color: #800 } /\* Name.Constant \*/ .highlight .nd { color: #A2F } /\* Name.Decorator \*/ .highlight .ni { color: #717171; font-weight: bold } /\* Name.Entity \*/ .highlight .ne { color: #CB3F38; font-weight: bold } /\* Name.Exception \*/ .highlight .nf { color: #00F } /\* Name.Function \*/ .highlight .nl { color: #767600 } /\* Name.Label \*/ .highlight .nn { color: #00F; font-weight: bold } /\* Name.Namespace \*/ .highlight .nt { color: #008000; font-weight: bold } /\* Name.Tag \*/ .highlight .nv { color: #19177C } /\* Name.Variable \*/ .highlight .ow { color: #A2F; font-weight: bold } /\* Operator.Word \*/ .highlight .w { color: #BBB } /\* Text.Whitespace \*/ .highlight .mb { color: #666 } /\* Literal.Number.Bin \*/ .highlight .mf { color: #666 } /\* Literal.Number.Float \*/ .highlight .mh { color: #666 } /\* Literal.Number.Hex \*/ .highlight .mi { color: #666 } /\* Literal.Number.Integer \*/ .highlight .mo { color: #666 } /\* Literal.Number.Oct \*/ .highlight .sa { color: #BA2121 } /\* Literal.String.Affix \*/ .highlight .sb { color: #BA2121 } /\* Literal.String.Backtick \*/ .highlight .sc { color: #BA2121 } /\* Literal.String.Char \*/ .highlight .dl { color: #BA2121 } /\* Literal.String.Delimiter \*/ .highlight .sd { color: #BA2121; font-style: italic } /\* Literal.String.Doc \*/ .highlight .s2 { color: #BA2121 } /\* Literal.String.Double \*/ .highlight .se { color: #AA5D1F; font-weight: bold } /\* Literal.String.Escape \*/ .highlight .sh { color: #BA2121 } /\* Literal.String.Heredoc \*/ .highlight .si { color: #A45A77; font-weight: bold } /\* Literal.String.Interpol \*/ .highlight .sx { color: #008000 } /\* Literal.String.Other \*/ .highlight .sr { color: #A45A77 } /\* Literal.String.Regex \*/ .highlight .s1 { color: #BA2121 } /\* Literal.String.Single \*/ .highlight .ss { color: #19177C } /\* Literal.String.Symbol \*/ .highlight .bp { color: #008000 } /\* Name.Builtin.Pseudo \*/ .highlight .fm { color: #00F } /\* Name.Function.Magic \*/ .highlight .vc { color: #19177C } /\* Name.Variable.Class \*/ .highlight .vg { color: #19177C } /\* Name.Variable.Global \*/ .highlight .vi { color: #19177C } /\* Name.Variable.Instance \*/ .highlight .vm { color: #19177C } /\* Name.Variable.Magic \*/ .highlight .il { color: #666 } /\* Literal.Number.Integer.Long \*/  @font-face { font-family: 'MonaspaceArgon'; src: url('/assets/fonts/MonaspaceArgon-Regular.woff2') format('woff2'); font-weight: 400; font-style: normal; } pre, code { font-family: 'MonaspaceArgon', ui-monospace, monospace; }

Earlier this year I noticed my Artemis reader page (the page that lists posts published by sites to which I am subscribed) was loading slowly. The logic to generate the page encompasses several hundred lines of code, which do everything from retrieving posts from the database to formatting dates and entry titles. I had a feeling that the database queries may need to be optimised, but I knew that I needed more information to help me figure out what was going wrong.

Around that time, I added timers in my code. These timers track the duration of several parts of the code that relates to computing the page. These durations are then published on the reader page, hidden in a `details` element, for me as an administrative user. Putting the data on my reader page meant that if a page load was slower than expected, I could immediately see a breakdown of what tasks took the longest without having to go to a separate page.

Here is a sample of what the breakdown looks like:

![A table with two columns: Event Name and Time. Event Name lists three events: feed_query, "Find publish date distance for inactive authors", and "Find avg. # of posts published each day on days where posts are published". The right column shows time in seconds with three decimal places of precision.](https://editor.jamesg.blog/content/images/2026/09/timer.png)

ALT

A table with two columns: Event Name and Time. Event Name lists three events: feed\_query, "Find publish date distance for inactive authors", and "Find avg. # of posts published each day on days where posts are published". The right column shows time in seconds with three decimal places of precision.

Currently, I track six events, each for different parts of the reader loading process.

I wrote a custom Python class called `Timer` to track these events. The syntax is as follows:

```
timer = Timer()

with timer:
    timer.event = "Find publish date distance for inactive authors"

    ...

with timer:
    timer.event = "Find avg. # of posts published each day on days where posts are published"

    ...

```

`Timer` uses the context manager feature in Python. Every time `with timer:` is used, the class tracks the time when the context is opened, and, when the context is closed, the time elapsed since the context was opened. I use the `timer.event` syntax within each `with` statement to assign a name to the event.

Here is the full code:

```
import time
from typing import Optional

class Timer:
    def __init__(self):
        self.events: list[dict[str, str]] = []
        self.event: Optional[str] = None
        self.instantiation_time = time.time()

    def __enter__(self):
        self.start = time.time()

    def __exit__(self, _, __, ___):
        self.events.append({"event": self.event or "", "elapsed": time.time() - self.start})

    def all_events(self):
        events = self.events + [{"event": "time_since_instantiation", "elapsed": time.time() - self.instantiation_time}]
        for event in events:
            event["elapsed"] = round(float(event["elapsed"]), 3)

        return events

```

When the `all_events()` function is called, the class automatically computes the total time from the beginning task to the end task, and logs this as an event called `time_since_instantiation`. It also rounds the times logged to allow for clearer presentation.

The Real Python website has a [tutorial on context managers](https://realpython.com/python-with-statement/) which also uses a timer example, but mine expands it to allow for logging multiple events. *Note to self: Real Python uses `perf_counter()` to measure start and end times. Maybe I should be using that too?*

The logs from `Timer` are most useful during development work, where the `Timer` system gives me both a clear idea of how long key pieces of code are taking, and the means to easily track the times of other events as I add new parts to the codebase.

I thought I would write this up as a general debugging tip. Before you try to fix something, it’s important to know what is causing the slow down. Timing your code can help.

[tutorial on context managers](https://realpython.com/python-with-statement/)