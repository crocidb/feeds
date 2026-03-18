+++
title = "Calendars and web readers"
description = "For the last few weeks I have been thinking about the intersection of calendars and web readers. Author's note: You can skip the next paragraph if you're not interested in the technical aside. What started this thinking was a technical interest. With h-feed, you can publish a lis"
date = "2026-02-06T14:36:47Z"
url = "https://jamesg.blog/2026/02/06/calendars-and-web-readers/"
author = "James' Coffee Blog"
text = ""
lastupdated = "2026-02-11T20:17:01.823894070Z"
seen = false
+++

For the last few weeks I have been thinking about the intersection of calendars and web readers.

*Author's note: You can skip the next paragraph if you're not interested in the technical aside.*

What started this thinking was a technical interest. With [h-feed](https://github.com/gRegorLove/mf2-to-iCalendar), you can publish a list of [h-events](https://microformats.org/wiki/h-event). This allows you to mark up information about events in HTML and put them in a feed. You could then write a converter that turns the h-feed into an iCal file. This means you could generate an iCal file from HTML with the right markup. [gRegor](https://github.com/gRegorLove/mf2-to-iCalendar) has some open source code for this purpose.

*Author's note: Now I'm back to talking about design.*

But then I got thinking about what this means. h-feeds can be followed in a web reader. This means, with the right conversion logic, you could follow a calendar in your web reader. Would you want to do this?

I started exploring what it would look like for Artemis to show events in the web reader but I didn't make something that was ready to use. I am unsure whether events should be in the same place as all the articles you're following on the web. Having a dedicated place for them feels prudent.

Today I experimented with what it would look like to have "widgets" in Artemis that could be customised (part of a line of thinking I am exploring about what it would mean for software to be modular). Here is a quick mock-up I made that shows what an events list could look like:

![A screenshot of the Artemis web interface showing a list of events in small text at the top and, below, articles published by authors James follows.](https://editor.jamesg.blog/content/images/2026/02/calendar.png)

I am particularly interested in the design aspect of all of this. I am not fully satisfied with the calendar I use and wonder what a "calm" calendar would look like. Of course, the above image is lacking in being able to edit your calendar, etc. but, for my purposes, something like a list of events for only the day would be a great point of reference in addition to a more robust calendar.

*Aside: Taylor Swift's new music video Opalite is out today, which I learned about via Artemis. She has a pet rock in it! (Unfortunately the video is only available on Apple Music / Spotify at the time I am writing this so I can't share a link, but it will surely be on YouTube at some point).*