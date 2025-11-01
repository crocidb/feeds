---
title = "Ruby, Python e native threads"
description = "Pode ser que eu seja meio burro (heheh) mas eu ainda achava que o Ruby e o Python usavam Green Threads, mas depois de conversar com uma galera me disseram que eram threads nativas. Pesquisando na internet eu vi que eram mesmo, mas decidi rodar um strace para ver elas rolando e po"
date = "2014-02-14T00:00:00Z"
url = "https://pothix.com/threads-rubypython/"
author = ""
text = ""
lastupdated = "2025-10-22T08:59:09.370133704Z"
seen = true
---

Pode ser que eu seja meio burro (heheh) mas eu ainda achava que o Ruby e o Python usavam Green Threads, mas depois de conversar com uma galera me disseram que eram threads nativas. Pesquisando na internet eu vi que eram mesmo, mas decidi rodar um strace para ver elas rolando e postar sobre isso. Fiz dois scripts simples: Python import threading import time for i in range(5): t = threading.