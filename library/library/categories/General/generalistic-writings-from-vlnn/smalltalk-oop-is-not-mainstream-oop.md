+++
title = "Smalltalk OOP is not mainstream OOP"
description = "Smalltalk OOP model is based on messaging, not classes and inheritanceIn Smalltalk, an object is an opaque cell that receives messages and decides — at runtime, itself — how to respond. 3 + 4 isn't an operator invocation; it's the message + 4 sent to the object 3, which can"
date = "2026-08-09T00:00:00Z"
url = "https://vlnn.dev/?stack=smalltalk-oop-is-not-mainstream-oop"
author = "Generalistic writings from @vlnn"
text = ""
lastupdated = "2026-08-10T12:13:26.902780112Z"
seen = true
+++

Smalltalk OOP model is based on messaging, not classes and inheritance

In Smalltalk, an object is an opaque cell that receives messages and decides — at runtime, itself — how to respond. `3 + 4` isn't an operator invocation; it's the message `+ 4` sent to the object `3`, which can handle it however it likes. Even control flow works this way: `ifTrue:` is a message sent to a Boolean object with a block as an argument. There are no statements, no privileged syntax — everything is objects sending messages.