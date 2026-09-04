+++
title = "Meetup.com in your calendar"
description = "Subscribe to Meetup.com groups via Apple Calendar, Google Calendar, or Microsoft Outlook."
date = "2025-02-16T00:00:00Z"
url = "https://taylor.town/meetup-ics"
author = "Taylor Troesh"
text = ""
lastupdated = "2026-04-20T13:20:40.205641973Z"
seen = true
+++

**tl;dr:** It's a URL that fetches [meetup.com](https://meetup.com) groups as an `.ics` file.

1. Find a Meetup.com group
----------

[This board game group](https://www.meetup.com/seattle-board-games) has the following url:

```
https://www.meetup.com/seattle-board-games
```

2. Subscribe to the magic calendar link
----------

The following link will generate an `.ics` file with all of their events:

```
https://www.meetup.com/seattle-board-games/events/ical
```

Opening an `.ics` file will add all its events to your calendar, but the calendar will not automatically update nor fetch new events.

In Apple Calendar, you must *subscribe* to the calendar to receive updates:

![](https://taylor.town/meetup-subscribe.png)

Doing so will create a new calendar with synced events:

![](https://taylor.town/meetup-calendar.png)