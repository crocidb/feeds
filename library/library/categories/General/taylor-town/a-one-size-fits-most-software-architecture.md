+++
title = "A One-Size-Fits-Most Software Architecture"
description = "Here's a few ways to say the same thing.    ·→ action ·    |               |    |               ↓interface         state    ↑               |    |               |    · query ←·`    ·--→ controller ·    |                  |    |                  ↓  view    "
date = "2019-02-01T00:00:00Z"
url = "https://taylor.town/a-one-size-fits-most-software-architecture"
author = "Taylor Troesh"
text = ""
lastupdated = "2026-04-20T13:20:40.777362815Z"
seen = true
+++

Here's a few ways to say the same thing.

```
    ·---→ action ---·
    |               |
    |               ↓
interface         state
    ↑               |
    |               |
    ·---- query ←---·
```

```
    ·--→ controller ---·
    |                  |
    |                  ↓
  view               model
    ↑                  |
    |                  |
    ·----- view ←------·
```

```
    ·-→ insert/update ---·
    |                    |
    |                    ↓
 client               database
    ↑                    |
    |                    |
    ·------ read ←-------·
```

```
    ·-→ PUT/POST/PATCH --·
    |                    |
    |                    ↓
 client                server
    ↑                    |
    |                    |
    ·------- GET ←-------·
```

---

Step 1: Feel it Out
----------

*Always* start with the interface! Not just mockups, but actually build the entire front-end first. Whether it's a CLI or web-app, you can construct it such that it gets "fake" information from the server, or fakes the request completely in the client. Either way, this is the place to start. Every button and command should be a dud, but it should be there before you even *consider* touching the fun stuff! 90% of changes to the back-end are "Oh, the user can't do this? The entire system needs to be redesigned." User-flow errors are seriously the most costly errors to make, so make sure that every button is fakeable before you touch the server.

Note that this doesn't just apply to *visual* front-ends, this also applies to APIs. It's most helpful to start with the boundaries where your code touches *the outside world*. In the beginning, focus on the *outermost* logic.

Examples:

* App / Front-End: Build a full GUI with buttons that don't do anything.
* Class / Library / HTTP Server: Build an API that returns fake/randomized results/errors.

### Optional: Check it Out ###

Before moving on to the next step, show off the design to your friends/team/user-testers. We want to catch design errors before we start actually building things!

### Optional: Test it Out ###

Now's the time to create integration tests (if you're into that sort of thing).

It's a joy to watch your tests pass as you build out more of the actual logic later!

---

Step 2: State is Sacred
----------

Your schema/model/database must make [impossible states impossible](https://www.youtube.com/watch?v=IcgmSRJHu_8).

Don't worry about efficiency! Worry about the sanctity of your data. Worry about efficiency and caching when you're dealing with queries. Your data is sacred.

Constrain everything. Throw errors if values across your system don't match up. Whatever you do, make sure that your database/model/whatever can be trusted!

There should be no conflicting values in your model. For instance, choose firstname/lastname or fullname. There should be no means for a user to define firstname/lastname *and* fullname. Everything in your system will be "calculated" elsewhere. Only define the minimal state necessary.

You will feel tempted to separate things into "users" and "transactions" from the beginning, but *watch out* for clumping! Think of your entire state/model/database as one, coherent body of data.

Examples:

* Define a PostgreSQL schema. Consider making a minimal DB layer (with even more constraints)!
* Design a Redux store.
* Build a Redis access layer with constraints.
* Design an Elm model.
* Draft your major MVC models.

### Optional: Fake News ###

It's incredibly helpful to have fake data stored when you're building out applications. You'll receive immediate feedback as you connect things together!

After your schema is defined, consider creating a script that generates fake data for your database.

---

Step 3: Like & Subscribe
----------

Now we need to get data from the storage to the interface. Subscription-based models are really nice, but `GET` requests work just as well.

The point is, we need data from the database. As a rule-of-thumb, organize the queries by *page* rather than by *object*. The interface doesn't need a *user*, it wants *profile* or *settings*. Let SQL and the server do all the joins and merging and data-structure stuff. The interface should expect its data completely formatted (with few exceptions). Most applications will only need 5-15 of these queries. And each of these queries should need around 1-5 parameters. If you say "that's impossible!", then you likely built your system incredibly wrong.

PostgreSQL `VIEW`s are really nice for this kind of thing! You can store a query, and PostgreSQL will cache the results and let you compose it in other commands throughout your database. Each `VIEW` should roughly correspond to one `GET` query.

Resist the urge to group things by "users" or "transactions". Group things by *usage* rather than *meaning*.

---

Step 4: Do Something
----------

When you have data flowing from your storage through your queries to your interface, it's time to link up the actions!

Each action (e.g. `POST`) should roughly correspond to a form/button in your interface.

Each action should be represented as a clear state-transition in your model. When possible, make your model immutable, so that information is only added, and that you can reconstruct the entire state at a given point in time.