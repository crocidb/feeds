+++
title = "WorkOS: Connect Your Agents to Your API"
description = "My thanks to WorkOS for, once again, sponsoring DF last week. What’s the best way to connect AI agents to your API? REST is great for human developers; [MCP serves the agents](https://workos.com/guide/model-context-protocol?utm_source=daringfireball&utm_medium=newsletter&utm_camp"
date = "2026-08-09T23:54:18Z"
url = "https://workos.com/blog/mcp-vs-rest?utm_source=daringfireball&utm_medium=newsletter&utm_campaign=q32026"
author = "John Gruber"
text = ""
lastupdated = "2026-08-10T22:24:07.301306432Z"
seen = true
+++

My thanks to WorkOS for, once again, sponsoring DF last week. What’s the best way to connect AI agents to your API? REST is great for human developers; [MCP serves the agents](https://workos.com/guide/model-context-protocol?utm_source=daringfireball&utm_medium=newsletter&utm_campaign=q32026&utm_content=body_guide). Many teams treat REST and MCP as competing standards, and through choice or necessity, pick one. But they ought not be considered rivals. They’re separate layers. Most MCP servers just call REST internally to do the real work. The best ones don’t convert every endpoint into a tool, they focus on what the agents are actually trying to accomplish.

That layered approach also means shipping OAuth 2.1 with scoped tokens. [WorkOS AuthKit already speaks that spec](https://workos.com/docs/authkit/mcp?utm_source=daringfireball&utm_medium=newsletter&utm_campaign=q32026&utm_content=body_authkit), so you skip building an auth provider on top. [Check out WorkOS’s breakdown on MCP vs. REST](https://workos.com/blog/mcp-vs-rest?utm_source=daringfireball&utm_medium=newsletter&utm_campaign=q32026).

[ ★ ](https://daringfireball.net/linked/2026/08/09/workos)