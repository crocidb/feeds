+++
title = "Podcast RSS XML (in Ugly SQL)"
description = "I hate SQL. Its verbose, inconsistent syntax feels like bathing in strangers' vomit."
date = "2024-02-15T00:00:00Z"
url = "https://taylor.town/xml-sql"
author = "Taylor Troesh"
text = ""
lastupdated = "2026-04-20T13:20:40.327839368Z"
seen = true
+++

I recently built [a tool to deliver flashcards via podcast feeds](https://flashcasts.com).

Let me start by saying that I hate SQL. Its verbose, inconsistent syntax feels like bathing in strangers' vomit.

Unfortunately, SQL is the best means to get reasonable performance from real-world datasets. Postgres is an unbelievably consistent platform, where I can test all my queries in a live environment and inspect the state of the DB without a separate debugger. Large classes of errors don't exist, thanks to transaction-safety. As I write more SQL, I'm convinced that web servers should play second-fiddle whenever possible.

While working on flashcasts, I could run my ugly XML query against local or production data -- no packages, no docker, no builds, no versioning, no deployments. Is this what the [prolog folks have been trying to tell us all along](https://www.youtube.com/watch?v=G_eYTctGZw8)?

Anyway, before I get into the SQL, wanted to note that I'm using [Hono](https://hono.dev) and [Postgres.js](https://github.com/porsager/postgres) on [Deno](https://deno.com), and overall happy with the experience:

```
app.all("/feed/:feed_id{[-\\w]+\\.xml$}", async c => {
  const feed_id = c.req.param("feed_id").replace(/\.xml$/, "");
  c.header("Content-Type", "application/xml");
  if (!["HEAD", "GET"].includes(c.req.method)) return c.body(null, 405);
  const [x] = await sql`
    // incoming SQL
```

Here's the RSS header for the entire feed:

```
select xmlelement(name "rss",
  xmlattributes('2.0' AS "version", 'http://www.itunes.com/dtds/podcast-1.0.dtd' AS "xmlns:itunes"),
  xmlelement(name "channel",
    xmlelement(name "title", (select title from feed_)),
    xmlelement(name "link", 'https://flashcasts.com/feed/' || ${feed_id} || '.xml'),
    xmlelement(name "description", (select description from feed_)),
    xmlelement(name "language", 'en-us'),
    xmlelement(name "itunes:author", 'Flashcasts'),
    xmlelement(name "itunes:explicit", 'no'),
    xmlelement(name "itunes:category", xmlattributes('Education' AS "text"),
      xmlelement(name "itunes:category", xmlattributes('Self-Improvement' AS "text"))),
    xmlelement(name "itunes:image", xmlattributes((select image_url from feed_) as "href")),
```

Here's how I build the episodes:

```
select
  xmlagg(
    xmlelement(name "item",
      xmlelement(name "title", (select ('Episode #' || n from feed_)),
      xmlelement(name "link", 'https://flashcasts.com/episode/' || e.episode_id || '.mp3'),
      xmlelement(name "guid", 'https://flashcasts.com/episode/' || e.episode_id),
      xmlelement(name "description", e.description::xml),
      xmlelement(name "pubDate", to_char(e.created_at, 'Dy, DD Mon YYYY HH24:MI:SS +0000')),
      xmlelement(name "itunes:duration", duration),
      xmlelement(name "itunes:episode", n),
      xmlelement(name "itunes:season", 1),
      xmlelement(name "itunes:explicit", 'no'),
      xmlelement(name "enclosure",
        xmlattributes(
          'https://flashcasts.com/episode/' || e.episode_id || '.mp3' AS "url",
          'audio/mpeg' AS "type", bytes as "length"))
    )
  )
from (
  select *, row_number() over (partition by e.feed_id order by e.created_at asc) as n
  from episode e
  cross join lateral (
    select
      sum(c.bytes_f + c.bytes_b) + (${SILENT_BYTES} * sum(f.pause::int + fd.pause::int)) as bytes
    , sum(duration_f + c.duration_b + (fd.pause::int + f.pause::int) * interval '1 second') as duration
    , ''
      || '<![CDATA['
      ||   '<p><a href="https://flashcasts.com/episode/' || e.episode_id || '">View this episode in your browser.</a></p>'
      ||   '<ul>'
      ||     string_agg('<li>' || c.body_f || '</li>', '')
      ||   '</ul>'
      ||   '<p>This episode was narrated by OpenAI''s Text-to-Speech API.</p>'
      || ']]>' as description
    from card c
    left join feed_deck fd on (fd.feed_id,fd.deck_id) = (e.feed_id,c.deck_id)
    left join feed f using (feed_id)
    where c.card_id = any(e.card_ids)
    group by e.feed_id, e.episode_id
  ) c
  where e.feed_id = ${feed_id}
) e
```

Here's the whole thing, in all its copy/pastable glory. As a bonus, I left some [frugly](https://taylor.town/frugly) logic in there:

```
with feed_ as (select * from feed left join usr using (usr_id) where feed_id = ${feed_id})
select xmlelement(name "rss",
  xmlattributes('2.0' AS "version", 'http://www.itunes.com/dtds/podcast-1.0.dtd' AS "xmlns:itunes"),
  xmlelement(name "channel",
    xmlelement(name "title", (select (case when is_pro is false then '[FREE] ' else '' end) || title from feed_)),
    xmlelement(name "link", 'https://flashcasts.com/feed/' || ${feed_id} || '.xml'),
    xmlelement(name "description", (select (case when is_pro is false then '[FREE] ' else '' end) || description from feed_)),
    xmlelement(name "language", 'en-us'),
    xmlelement(name "itunes:author", 'Flashcasts'),
    xmlelement(name "itunes:explicit", 'no'),
    xmlelement(name "itunes:category", xmlattributes('Education' AS "text"),
      xmlelement(name "itunes:category", xmlattributes('Self-Improvement' AS "text"))),
    xmlelement(name "itunes:image", xmlattributes(
      (select case when is_pro is false then 'https://flashcasts.com/cover-free.jpg' else coalesce(image_url,'https://flashcasts.com/cover.jpg') end from feed_) as "href")),
    (
      select
        xmlagg(
          xmlelement(name "item",
            xmlelement(name "title", (select (case when is_pro is false then '[FREE] ' else '' end) || 'Episode #' || n from feed_)),
            xmlelement(name "link", 'https://flashcasts.com/episode/' || e.episode_id || '.mp3'),
            xmlelement(name "guid", 'https://flashcasts.com/episode/' || e.episode_id),
            xmlelement(name "description", e.description::xml),
            xmlelement(name "pubDate", to_char(e.created_at, 'Dy, DD Mon YYYY HH24:MI:SS +0000')),
            xmlelement(name "itunes:duration", duration),
            xmlelement(name "itunes:episode", n),
            xmlelement(name "itunes:season", 1),
            xmlelement(name "itunes:explicit", 'no'),
            xmlelement(name "enclosure", xmlattributes('https://flashcasts.com/episode/' || e.episode_id || '.mp3' AS "url", 'audio/mpeg' AS "type", bytes as "length"))
          )
        )
      from (
        select *, row_number() over (partition by e.feed_id order by e.created_at asc) as n
        from episode e
        cross join lateral (
          select
            sum(c.bytes_f + c.bytes_b) + (${SILENT_BYTES} * sum(f.pause::int + fd.pause::int)) as bytes
          , sum(duration_f + c.duration_b + (fd.pause::int + f.pause::int) * interval '1 second') as duration
          , ''
            || '<![CDATA['
            ||   '<p><a href="https://flashcasts.com/episode/' || e.episode_id || '">View this episode in your browser.</a></p>'
            ||   '<ul>'
            ||     string_agg('<li>' || c.body_f || '</li>', '')
            ||   '</ul>'
            ||   '<p>This episode was narrated by OpenAI''s Text-to-Speech API.</p>'
            || ']]>' as description
          from card c
          left join feed_deck fd on (fd.feed_id,fd.deck_id) = (e.feed_id,c.deck_id)
          left join feed f using (feed_id)
          where c.card_id = any(e.card_ids)
          group by e.feed_id, e.episode_id
        ) c
        where e.feed_id = ${feed_id}
      ) e
    )
  )
) AS feed
```