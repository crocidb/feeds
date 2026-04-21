+++
title = "eventbrite.ics"
description = "Subscribe to Eventbrite orgs via Apple Calendar, Google Calendar, or Microsoft Outlook."
date = "2024-02-06T00:00:00Z"
url = "https://taylor.town/eventbrite-ics"
author = "Taylor Troesh"
text = ""
lastupdated = "2026-04-20T13:20:40.335282686Z"
seen = true
+++

**tl;dr:** It's a URL that subscribes to Eventbrite orgs as an `.ics` file.

1. Find an eventbrite org
----------

[NASA's Eventbrite page](https://www.eventbrite.com/o/nasa-30164999184) has the following url:

```
https://www.eventbrite.com/o/nasa-30164999184
```

2. Subscribe to the magic calendar link
----------

The following link will generate an `.ics` file with all of NASA's events:

```
https://taylor.town/eventbrite?org=30164999184
```

Opening an `.ics` file will add all its events to your calendar, but the calendar will not automatically update nor fetch new events.

In Apple Calendar, you must *subscribe* to the calendar to receive updates:

![](https://taylor.town/new-calendar-subscription.png)

Doing so will create a new calendar with synced events:

![](https://taylor.town/nasa-calendar.jpg)