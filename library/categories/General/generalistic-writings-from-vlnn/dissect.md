+++
title = "dissect"
description = 'dissect parses a line by cutting it at the exact delimiters written between fields: %{client} - %{duration} means "everything up to - is client, the rest is duration." One left-to-right pass, no regex engine, no backtracking — which is why it costs a fraction of grok on hig'
date = "2026-08-05T00:00:00Z"
url = "https://vlnn.dev/?stack=dissect"
author = "Generalistic writings from @vlnn"
text = ""
lastupdated = "2026-08-06T09:52:33.841289562Z"
seen = false
+++

`dissect` parses a line by cutting it at the exact delimiters written between fields: `%{client} - %{duration}` means "everything up to `-` is client, the rest is duration." One left-to-right pass, no regex engine, no backtracking — which is why it costs a fraction of grok on high-volume streams. The price is rigidity: each rule handles exactly one layout, so a stray extra space or a reordered field breaks the match. Use dissect when the format is fixed (your own app logs, machine-generated output) and reserve grok for lines whose shape varies.