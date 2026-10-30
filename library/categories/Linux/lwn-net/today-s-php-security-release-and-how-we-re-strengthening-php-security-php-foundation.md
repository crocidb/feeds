+++
title = "Today's PHP Security Release, and How We're Strengthening PHP Security (PHP Foundation)"
description = "The PHP Foundation has put out a blog entry explaining how the vulnerabilities disclosed today came about and why they took so long to fix.To fix the OOM problem, "
date = "2026-10-21T20:20:34Z"
url = "https://lwn.net/Articles/1102060/"
author = "corbet"
text = ""
lastupdated = "2026-10-22T13:34:56.301472463Z"
seen = false
+++

The PHP Foundation has put out [a blog entry](https://thephp.foundation/blog/2026/10/21/todays-php-security-release-and-how-were-strengthening-php-security/) explaining how the vulnerabilities disclosed today came about and why they took so long to fix.

>  To fix the OOM problem, the PHP security team developed several competing approaches, but each came with its own trade-offs: backward compatibility breaks, new denial-of-service potential, or requiring changes to many third-party extensions which seemed impossible to coordinate. The PHP security team, operating on consensus, struggled to choose between these and feared the repercussions of shipping the wrong choice. Combined with the lack of a known path to remote code execution and the small team of core developers with the necessary deep knowledge of the engine occupied with many responsibilities, this decision process caused work on a fix to stall and restart repeatedly over months. We won't pretend otherwise: the delay was a structural failure, caused by both the security team's decision process and its lack of resources.