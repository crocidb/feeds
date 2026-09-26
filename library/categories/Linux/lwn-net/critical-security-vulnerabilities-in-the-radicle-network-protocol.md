+++
title = "Critical security vulnerabilities in the Radicle network protocol"
description = "The Radicle peer-to-peer code-collaboration project has disclosed two critical vulnerabilities in the network protocol used by Radicle nodes. The first flaw is that the netwo"
date = "2026-09-23T14:20:46Z"
url = "https://lwn.net/Articles/1096200/"
author = "jzb"
text = ""
lastupdated = "2026-09-23T18:24:55.794555244Z"
seen = false
+++

The [Radicle](https://radicle.dev/) peer-to-peer code-collaboration project has [disclosed two critical vulnerabilities](https://radicle.dev/2026/09/23/disclosure-of-vulnerability-in-network-protocol) in the network protocol used by Radicle nodes. The first flaw is that the network protocol used by Radicle "
> does not give the confidentiality it was expected to give

", which allows anyone who can observe the network between two nodes to read the data exchanged. The second is that peer authentication is broken and allows impersonation, so an attacker can spoof their Node ID and read private repositories they should not be able to read.

>
>
> In practice, the two flaws are most useful when they can be exploited together: an attacker on the path sees the Node IDs at both ends of a connection, and both are normally on the allow-list. That attacker can read whatever is exchanged while they watch, and can then use a Node ID they saw to fetch the whole repository on demand. The realistic threat is anyone on the path between your node and node it syncs with, and no setting or allow-list protects against them.
>
>
>
> We are publishing this before the security update is available. You can act on it today, and no fix we release later can undo an exposure that has already happened.
>
>

See the post for workarounds that can be used today; a major update that will be backward-incompatible is underway.