+++
title = "Desktop icon behavior survey results"
description = "Here's the data! import { Colors } from 'chart.js'; Chart.register(Colors);Thank you all for filling the survey I mentioned in my other post here. We got 1518 full responses total, which is a lot!Without further ado, h"
date = "2026-11-06T19:52:58Z"
url = "https://akselmo.dev/posts/desktop-icon-survey-results/"
author = "Akseli"
text = ""
lastupdated = "2026-11-07T14:31:41.573888941Z"
seen = false
+++

*Here's the data!*

 import { Colors } from 'chart.js'; Chart.register(Colors);

Thank you all for filling the survey I mentioned in my other post [here](https://akselmo.dev/posts/akademy-2026-desktop-icon-bof/). We got 1518 full responses total, which is a lot!

Without further ado, here's the data in charts.

**FYI: I am not a data scientist, just a random guy trying to piece up something.**

[General usage statistics](#general-usage-statistics)
----------

First I want to go through some general usage stuff.

### [What is your desktop icon usage like?](#what-is-your-desktop-icon-usage-like) ###

In general, people tend to actually not use them much. They still may *have* some icons, but they get mostly ignored.

A lot of people use the desktop as a place to store temporary files they're working on, then presumably move them somewhere else when done with them. As a to-do list of sorts.

Then there's shortcuts to applications people use a daily.

Lastly, not as many store files on desktop regularly.

So to me it seems that people ignore them most of the time, but use them as shortcuts for apps to do work, or just need a temporary place for something they're working on.

 \<a href="/assets/images/desktopsurvey/iconusage.png"\>\<img src="/assets/images/desktopsurvey/iconusage.png" alt="Desktop icon usage chart"\>\</a\>

Note that this was a multichoice question. I allowed people to pick "I don't really use desktop icons", because I believed all these could be true at the same time: People don't necessarily think about them often, but they use them.

<details> <summary>Raw data</summary>

|                What is your desktop icon usage like?                |Count|
|---------------------------------------------------------------------|-----|
|             I add shortcuts to applications I use daily             | 394 |
|I use desktop as a temporary place for things I'm actively working on| 649 |
|                I store files on my desktop regularly                | 259 |
|                  I don't really use desktop icons                   | 819 |
</details>

### [Average desktop icon amount](#average-desktop-icon-amount) ###

I calculated the average of the icon values, and it seems the average of everyone is **9** icons on desktop.

There were some people typing in *128937128973987* or similar so I removed those. Sorry, I don't believe you! Send me proof!

But the largest amount I'm willing to believe was **150** icons. That's a lot!

### [Automatic or manual sorting?](#automatic-or-manual-sorting) ###

This is surprisingly even. I expected way more people move icons around, but it's literally 60/40 situation.

 \<a href="/assets/images/desktopsurvey/autoormanual.png"\>\<img src="/assets/images/desktopsurvey/autoormanual.png" alt="Automatic or manual sorting chart"\>\</a\>

<details> <summary>Raw data</summary>

|Do you use automated arrangement or position the icons manually?|Count|
|----------------------------------------------------------------|-----|
|                           Automatic                            | 605 |
|                             Manual                             | 913 |
</details>

[Icons on side of monitor when screen changes](#icons-on-side-of-monitor-when-screen-changes)
----------

Here's the real juicy parts: How do we want icons to behave when something happens?

When icons are placed on the side of the monitor, and screen resolution changes, we did not really know what users want the icons to actually do.. Until now!

The survey had users to make choice between example images. I have added the images here as a refresher.

### [Monitor resolution expands](#monitor-resolution-expands) ###

[![Leave icons at current position example](/assets/images/desktopsurvey/q0a1.png)](/assets/images/desktopsurvey/q0a1.png)

*Leave icons at current position.*

[![Move icons to the new resolutiom example](/assets/images/desktopsurvey/q0a2.png)](/assets/images/desktopsurvey/q0a2.png)

*Move icons to the new resolution.*

Overwhelming majority of you want the icons to move to the new resolution and not stay in the current position, which I find interesting, as some might find that a bit jarring! But in a way, it makes sense.

 \<a href="/assets/images/desktopsurvey/resolutionexpand.png"\>\<img src="/assets/images/desktopsurvey/resolutionexpand.png" alt="Resolution expands chart"\>\</a\>

<details> <summary>Raw data</summary>

|  Monitor resolution expands.  |Count|
|-------------------------------|-----|
|Leave icons at current position| 244 |
|Move them to the new resolution|1274 |
</details>

### [Monitor resolution shrinks](#monitor-resolution-shrinks) ###

[![Rearrange icons to fit example](/assets/images/desktopsurvey/q1a1.png)](/assets/images/desktopsurvey/q1a1.png)

*Rearrange icons to fit the new resolution in their original form.*

[![Rearrange them automatically example](/assets/images/desktopsurvey/q1a2.png)](/assets/images/desktopsurvey/q1a2.png)

*Rearrange them automatically to new position, from start.*

This had even more overwhelming majority! Only 71 of you want the automated arrangement. So this preference is quite clear!

 \<a href="/assets/images/desktopsurvey/resolutionshrink.png"\>\<img src="/assets/images/desktopsurvey/resolutionshrink.png" alt="Resolution shrink chart"\>\</a\>

<details> <summary>Raw data</summary>

|                  Monitor resolution shrinks.                   |Count|
|----------------------------------------------------------------|-----|
|Rearrange icons to fit the new resolution in their original form|1447 |
|    Rearrange them automatically to new position, from start    | 71  |
</details>

### [Monitor resolution shrinks, but the area where you move new icons has already some icons](#monitor-resolution-shrinks-but-the-area-where-you-move-new-icons-has-already-some-icons) ###

[![Move all icons example](/assets/images/desktopsurvey/q3a1.png)](/assets/images/desktopsurvey/q3a1.png)

*Move all icons, to make room for the others.*

[![Rearrange example](/assets/images/desktopsurvey/q3a2.png)](/assets/images/desktopsurvey/q3a2.png)

*Rearrange them automatically to new position, from start.*

Here 1/3 of the people wanted them to be automatic and start over from the beginning. Moving all icons makes sense, but I think it's going to be more difficult to make and more bug prone.

 \<a href="/assets/images/desktopsurvey/alreadyhasicons.png"\>\<img src="/assets/images/desktopsurvey/alreadyhasicons.png" alt="Already has icons chart"\>\</a\>

<details> <summary>Raw data</summary>

|Monitor resolution shrinks, but the area where you move new icons has already some icons.|Count|
|-----------------------------------------------------------------------------------------|-----|
|                       Move all icons, to make room for the others                       |1052 |
|                Rearrange them automatically to new position, from start                 | 466 |
</details>

### [Desktop is full of icons](#desktop-is-full-of-icons) ###

You have added so many files on the desktop that it's full, then you add some more! We wanted to know what should happen in this case.

[![Scrollbar example](/assets/images/desktopsurvey/q4a1.png)](/assets/images/desktopsurvey/q4a1.png)

*Add a scrollbar so you can scroll for more icons!*

[![Warning example](/assets/images/desktopsurvey/q4a2.png)](/assets/images/desktopsurvey/q4a2.png)

*Tell user the desktop cant show more icons, but they can be found from Desktop folder.*

[![Popup example](/assets/images/desktopsurvey/q4a3.png)](/assets/images/desktopsurvey/q4a3.png)

*Show user an "overflow menu" that has the icons that do not fit inside a popup.*

Most of you seem to want the popup, which makes sense as this is very much what happens on mobile: When there's a lot of icons on the screen, and you try to add more, they turn into folders instead.

I was surprised the scrollbar was the second choice, as that's already what happens on Plasma, and I have heard so many times that it's confusing.

My personal favorite, the warning, is at third. It's my favorite because it's the least complex. :)

 \<a href="/assets/images/desktopsurvey/howtoadapt.png"\>\<img src="/assets/images/desktopsurvey/howtoadapt.png" alt="Full of icons chart"\>\</a\>

<details> <summary>Raw data</summary>

|                            How should the desktop adapt?                             |Count|
|--------------------------------------------------------------------------------------|-----|
|                  Add a scrollbar so you can scroll for more icons!                   | 467 |
|Tell user the desktop cant show more icons, but they can be found from Desktop folder.| 309 |
|    Show user an "overflow menu" that has the icons that do not fit inside a popup    | 742 |
</details>

### [Monitor is changed to vertical mode](#monitor-is-changed-to-vertical-mode) ###

A usecase I very rarely encounter, but felt like we should look into anyway.

[![Rotate example](/assets/images/desktopsurvey/q5a1.png)](/assets/images/desktopsurvey/q5a1.png)

*Keep icons where they are, just rotate them in place.*

[![Rearrange example](/assets/images/desktopsurvey/q5a2.png)](/assets/images/desktopsurvey/q5a2.png)

*Rearrange icons so that they are somewhat close to the original arrangement.*

Most of you want a rearrangement, though rotating in place seems to fit many as well. I would prefer rotating in place as implementor as it's the simplest, since we do not have to relayout everything.

 \<a href="/assets/images/desktopsurvey/verticalmode.png"\>\<img src="/assets/images/desktopsurvey/verticalmode.png" alt="Verticalmode chart"\>\</a\>

<details> <summary>Raw data</summary>

|      How should icons on your desktop adapt to rotating your screen?      |Count|
|---------------------------------------------------------------------------|-----|
|           Keep icons where they are, just rotate them in place            | 557 |
|Rearrange icons so that they are somewhat close to the original arrangement| 961 |
</details>

### [Monitor disconnection](#monitor-disconnection) ###

This is one of the most difficult ones to solve, as screens often behave weirdly when plugged/unplugged. Sometimes we do not know fully if the screen is ready or not, reporting back weird resolution, etc..

As a note for this question, the reverse would happen: The icons would be back on the reconnected screen.

[![Move to remaining screen example](/assets/images/desktopsurvey/q6a1.png)](/assets/images/desktopsurvey/q6a1.png)

*They move to the remaining screen.*

[![Not visible on remaining screen example](/assets/images/desktopsurvey/q6a2.png)](/assets/images/desktopsurvey/q6a2.png)

*They aren't visible on the remaining screen.*

I was expecting most to vote for the moving to the remaining screen, and I was right! However, I did not expect it to be this small divide.. A lot of you are fine with the icons not showing on the remaining screen!

 \<a href="/assets/images/desktopsurvey/screendisconnect.png"\>\<img src="/assets/images/desktopsurvey/screendisconnect.png" alt="Disconnection chart"\>\</a\>

<details> <summary>Raw data</summary>

|What should happen to the icons on that screen?|Count|
|-----------------------------------------------|-----|
|  They aren't visible on the remaining screen  | 626 |
|       They move to the remaining screen       | 892 |
</details>

[Conclusions](#conclusions)
----------

Most of these things are what I expected, though I did not expect as much divide: I was expecting 90/10 divisions, not 60/40!

But thank you all for answering to the survey. I will have to properly mull over and plan now with all this data in my hands.

**Note that this data does not decide anything, but it works as a *guidance* for us.**

There's a lot of writing for me to read about the icons, so I will go through that over time. But thank you for these responses, as it will help us KDE folk figure out how to fix the desktop icon situation, as it's still bit flakey.

No promises when, but I want to get into it when I have gotten more Union bug fixes done.

Thank you again! Your help has been very valuable. \<3

ps. Hope you don't mind my crappy charts. I am using chartjs for it, but if you have javascript off, you should see the images I took instead.

[](https://brid.gy/publish/mastodon)

 // Awful pile of javascript to get the nice charts to work. // Without javascript you'll see the images instead! const backgroundColor = '#ffffff' const textColor = '#000' const colors = [ '#06afec', '#d5250e', '#c7ab20', '#27e546', ] let barOptions = { plugins: { legend: { display: false }, title: { display: true, text: "" }, }, } let pieOptions = { plugins: { legend: { display: true }, title: { display: true, text: "" }, }, maintainAspectRatio: false } // Background color const backgroundPlugin = { id: 'customCanvasBackgroundColor', beforeDraw: (chart, args, options) =\> { const {ctx} = chart; ctx.save(); ctx.globalCompositeOperation = 'destination-over'; ctx.fillStyle = backgroundColor; ctx.fillRect(0, 0, chart.width, chart.height); ctx.restore(); } }; // Splits the lines in the labels below things when using \\n const newLinePlugin = { beforeInit: function(chart) { chart.data.labels.forEach(function(e, i, a) { if (/\\n/.test(e)) { a[i] = e.split(/\\n/); } }); } } // Joins the lines back in tooltips const tooltipPlugin = { afterDraw: function (chart) { chart.config.data.labels.forEach(function(label,index) { if(Array.isArray(label)){ chart.config.data.labels[index] = label.join(' '); } }); } } const plugins = [backgroundPlugin, newLinePlugin, tooltipPlugin] Chart.defaults.color = textColor Chart.defaults.font.family = "sans-serif" Chart.defaults.font.size = 14 const usage = document.getElementById('usageChart'); barOptions.plugins.title.text = "What is your desktop icon usage like?" new Chart(usage, { type: 'bar', data: { labels: [ "I add shortcuts to\\napplications I use daily", "I use desktop as a\\ntemporary place for things\\nI'm actively working on", "I store files on\\nmy desktop regularly", "I don't really\\nuse desktop icons" ], datasets: [{ label: 'Count', data: [394, 649, 259, 819], borderWidth: 1, backgroundColor: colors, }] }, options: barOptions, plugins: plugins, }); const sort = document.getElementById('sortChart'); pieOptions.plugins.title.text = "Automatic or manual sorting?" new Chart(sort, { type: 'pie', data: { labels: [ "Automatic", "Manual" ], datasets: [{ label: 'Count', data: [605, 913], borderWidth: 1, backgroundColor: colors, }] }, options: pieOptions, plugins: plugins, }); const expand = document.getElementById('expandsChart'); pieOptions.plugins.title.text = "When monitor resolution expands.." new Chart(expand, { type: 'pie', data: { labels: [ "Leave icons at the current position", "Move them to the new resolution" ], datasets: [{ label: 'Count', data: [244, 1274], borderWidth: 1, backgroundColor: colors, }] }, options: pieOptions, plugins: plugins, }); const shrink = document.getElementById('shrinksChart'); pieOptions.plugins.title.text = "When monitor resolution shrinks.." new Chart(shrink, { type: 'pie', data: { labels: [ "Rearrange icons to fit the new resolution in their original form", "Rearrange them automatically to new position, from start" ], datasets: [{ label: 'Count', data: [1447, 71], borderWidth: 1, backgroundColor: colors, }] }, options: pieOptions, plugins: plugins, }); const shrinksIconsChart = document.getElementById('shrinksIconsChart'); pieOptions.plugins.title.text = "Monitor resolution shrinks, but the area where you move new icons has already some icons" new Chart(shrinksIconsChart, { type: 'pie', data: { labels: [ "Move all icons, to make room for the others", "Rearrange them automatically to new position, from start" ], datasets: [{ label: 'Count', data: [1052, 466], borderWidth: 1, backgroundColor: colors, }] }, options: pieOptions, plugins: plugins, }); const fullOfIconsChart = document.getElementById('fullOfIconsChart'); pieOptions.plugins.title.text = "When desktop is full of icons, how should the desktop adapt?" new Chart(fullOfIconsChart, { type: 'pie', data: { labels: [ "Add a scrollbar so you can scroll for more icons!", "Tell user the desktop cant show more icons, but they can be found from Desktop folder.", "Show user an \\"overflow menu\\" that has the icons that do not fit inside a popup" ], datasets: [{ label: 'Count', data: [467, 309, 742], borderWidth: 1, backgroundColor: colors, }] }, options: pieOptions, plugins: plugins, }); const verticalmodeChart = document.getElementById('verticalmodeChart'); pieOptions.plugins.title.text = "How should icons on your desktop adapt to rotating your screen?" new Chart(verticalmodeChart, { type: 'pie', data: { labels: [ "Keep icons where they are, just rotate them in place", "Rearrange icons so that they are somewhat close to the original arrangement.", ], datasets: [{ label: 'Count', data: [557, 961], borderWidth: 1, backgroundColor: colors, }] }, options: pieOptions, plugins: plugins, }); const disconnectionChart = document.getElementById('disconnectionChart'); pieOptions.plugins.title.text = "When disconnecting a screen, what should happen to the icons on that screen?" new Chart(disconnectionChart, { type: 'pie', data: { labels: [ "They aren't visible on the remaining screen", "They move to the remaining screen", ], datasets: [{ label: 'Count', data: [626, 892], borderWidth: 1, backgroundColor: colors, }] }, options: pieOptions, plugins: plugins, });