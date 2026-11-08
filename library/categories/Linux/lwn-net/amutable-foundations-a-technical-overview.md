+++
title = "Amutable Foundations: A Technical Overview"
description = "Lennart Poettering, Michael Vogt, and Joaquim Rocha have put together a detailed overview of what the Amutable Operating System (AOS) and associated infrastructure will look like.The image-based OS approach e"
date = "2026-11-07T09:32:56Z"
url = "https://lwn.net/Articles/1105934/"
author = "corbet"
text = ""
lastupdated = "2026-11-07T14:31:42.355639149Z"
seen = false
+++

Lennart Poettering, Michael Vogt, and Joaquim Rocha have put together [a detailed overview](https://amutable.com/blog/amutable-foundations-technical-overview) of what the Amutable Operating System (AOS) and associated infrastructure will look like.

>  The image-based OS approach enables us to enforce some very strict but powerful security properties, which elevate the security posture of the system substantially above traditional Linux systems. Specifically, let's highlight seven major essential security properties of AOS here:
>
> 1. **No Shell + No SSH + No Language Interpreters**. By default AOS does not install a UNIX shell, nor makes remote access via SSH available on the nodes. Moreover, we do not install any of the usual language interpreters (Python, Perl, …) by default. For most nodes a shell or interpreted language support is not required and it removes a whole class of attacks.
> 2. **Signed Images Only**. On AOS only images that come with Verity data signed by a signing key listed in the Verity keyring may be activated.
> 3. [...]
>
>