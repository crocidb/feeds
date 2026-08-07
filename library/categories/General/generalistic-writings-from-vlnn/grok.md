+++
title = "grok"
description = "grok is main parsing filter in Logstash. It's a library of named regex patterns (%{IP:client}, %{NUMBER:duration}) composed into line-matchers. It makes regexes readable and reusable, but it is still regex with it's problems: unanchored or greedy patterns on high-volume strea"
date = "2026-08-05T00:00:00Z"
url = "https://vlnn.dev/?stack=grok"
author = "Generalistic writings from @vlnn"
text = ""
lastupdated = "2026-08-06T09:52:33.849661058Z"
seen = false
+++

grok is main parsing filter in Logstash. It's a library of named regex patterns (`%{IP:client}`, `%{NUMBER:duration}`) composed into line-matchers. It makes regexes readable and reusable, but it is still regex with it's problems: unanchored or greedy patterns on high-volume streams are a classic Logstash CPU sink.

For fixed formats, `dissect` (positional splitting) is much cheaper.