+++
title = "Do What I Mean"
description = "DWIM (Do What I Mean) is a design philosophy where software resolves ambiguous or imperfect input by inferring the user's intent from context, rather than demanding a fully explicit, literal specification.It originated in the late 1960s with Warren Teitelman's work on BBN-LISP (l"
date = "2026-08-07T00:00:00Z"
url = "https://vlnn.dev/?stack=do-what-i-mean"
author = "Generalistic writings from @vlnn"
text = ""
lastupdated = "2026-08-10T12:13:26.951899477Z"
seen = true
+++

DWIM (Do What I Mean) is a design philosophy where software resolves ambiguous or imperfect input by inferring the user's intent from context, rather than demanding a fully explicit, literal specification.

It originated in the late 1960s with Warren Teitelman's work on BBN-LISP (later Interlisp), where the system would automatically correct typos and misspelled identifiers in code instead of failing with an error.

The core trade-off is cognitive load versus predictability: DWIM saves the user from tedious explicitness, but a wrong guess can be worse than no guess, since the system silently does something unintended — famously satirized in Xerox PARC jokes about DWIM deleting the wrong files.