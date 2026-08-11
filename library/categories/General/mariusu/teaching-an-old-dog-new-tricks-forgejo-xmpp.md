+++
title = "Teaching an Old Dog New Tricks: Forgejo + XMPP"
description = "Forgejo only lets people register with an email address, so I bent it a little bit to make it send XMPP messages and let users sign up with a JID instead."
date = "2026-08-10T09:25:25Z"
url = "https://xn--gckvb8fzb.com/teaching-an-old-dog-new-tricks-forgejo-xmpp/"
author = "marius@xn--gckvb8fzb.com (Marius)"
text = ""
lastupdated = "2026-08-10T12:13:28.497526214Z"
seen = false
+++

I recently [decided to leave *Codeberg*](/i-regret-migrating-to-codeberg/) and run my own *Forgejo* instance instead. After finishing the initial setup, I realized that a forge I host myself is a forge that I get to shape, and that I no longer have to settle for whatever feature set someone else considered reasonable. I can now make it truly mine, and switch on the things I have always wanted a *Git* host to do.

The first of those things concerns the registration. Right now *Forgejo*, like pretty much every other forge, wants an email address and sends a verification link to it, because apparently a clicked link is still considered a proof that a human is on the other end. I, however, would much rather let people sign up with an *XMPP* *JID* instead. Partly, because an email address you can receive a link at has long stopped being a real obstacle for automated spam, so the whole email verification is less beneficial than people assume, and partly because *XMPP* is the superior protocol, and I would prefer my users to arrive over it rather than over email to begin with.

Unfortunately, *Forgejo* has no native *XMPP* support. Additionally, it also makes no use of *Go*’s *shared objects*, which would let extensions be built largely independently of the core, and which for a monolith of this size would make a great deal of sense. There is no clean place to add a protocol to it without going into the core itself.

I was not, however, looking to implement real *JID* registration and authentication **into** *Forgejo*. That would have been a fight against windmills, and I say that from experience. My past attempts at far lighter changes were killed off by bureaucratic requirements like [*design discussions* and *collecting of use cases*](https://codeberg.org/forgejo/forgejo/issues/4260#issuecomment-9645566), and probably a [*laissez-passer A38*](https://en.wikipedia.org/wiki/The_Twelve_Tasks_of_Asterix) somewhere along the way. So I did what any reasonable but slightly unhinged person would do, and decided to bridge *Forgejo*’s existing email integration into *XMPP* instead.

Introducing *Switchyard*
----------

[*Switchyard*](https://tty.fail/mrus/switchyard) is a small daemon that speaks *SMTP* on one side and *XMPP* on the other. Email and *XMPP* happen to share the same address form, `user@host.tld`, so the recipient maps across directly, and a message addressed to `hello@example.com` goes out as a chat to the *JID* `hello@example.com`. It accepts the mail a service submits over *SMTP*, turns each one into a job on a queue, and a worker delivers it over a standing *XMPP* connection that reconnects on its own when the server drops it.

Because it listens for *SMTP* the way any mail server does, *Forgejo* needs no patch to hand its mail over. It gets configured as the `mailer` endpoint with the same block you would point at a real mail server:

```ini
[mailer]
ENABLED        = true
FROM           = forgejo@myhost.tld
PROTOCOL       = smtp
SMTP_ADDR      = 127.0.0.1
SMTP_PORT      = 587
USER           = forgejo
PASSWD         = `change-me`

```

On the other end, a short `switchyard.toml` gives it the credentials it checks *Forgejo* against, a certificate for the submission port, and the single *XMPP* account it sends everything from:

```toml
[redis]
addrs = ["127.0.0.1:6379"]

[smtp]
allowed_ips = ["127.0.0.1/32"]
username = "forgejo"
password = "change-me"

[smtp.tls]
enable = true
cert = "/etc/switchyard/tls/cert.pem"
key = "/etc/switchyard/tls/key.pem"

[xmpp]
server = "xmpp.myhost.tld:5222"
username = "switchyard@myhost.tld"
password = "change-me"

```

With that in place, every message *Forgejo* would otherwise send by email, like the sign-up confirmation, the password reset, or the note about a new issue, instead goes out over *XMPP* to whatever *JID* the user typed into the email field. *Switchyard* also handles IDNs, because, you know, that’s kind of my thing. :-)

*SMTP* always carries the domain in its *punycode* form, while *XMPP* uses the native *IDN*, so it decodes the recipient domain on the way through, and a user who registers as `user@xn--gckvb8fzb.com` in *Forgejo* is reached at `user@マリウス.com` on *XMPP*.

Beyond *Forgejo*
----------

This lightweight service is not specific to *Forgejo*. *Switchyard* works with anything that can be pointed at an *SMTP* server, and turns that software into something that speaks *XMPP* without the software itself knowing that anything changed. The one adjustment that should be made on the other side is relabeling the *“Email address”* field in the *HTML* templates to *“JID”*, so people know what to put there. In *Forgejo*’s case that is a small template patch, which you can easily maintain yourself. It’s a very different commitment from maintaining a full *XMPP* implementation that upstream will most likely never accept.

The downside is that this costs you email (for now!). Once *Forgejo* is talking to *Switchyard*, everything it sends goes to *XMPP*, and a user who did enter an email address gets nothing. I’m already working on fixing that, by having *Switchyard* first check whether the destination host is an actual *XMPP* server at all, and fall back to forwarding the message to an ordinary mail server that you configure when it is not. That way one protocol (*SMTP*) comes in, and is distributed to either the preferred one (*XMPP*) when available, or forwarded to the fallback (*SMTP*) when it isn’t. Easy-peasy lemon-squeezy.

Is any of this clean and elegant engineering? Definitely not. It is an *SMTP* server wired to an *XMPP* client (with a job queue in between), it works, and it does the job. With *Switchyard* I get a feature that belongs upstream but almost certainly will never get there, and for me this counts more than a clean implementation that would maybe win the beauty contest, but would remain a patch for probably the rest of its life. A patch that I would have to continuously merge and maintain across *Forgejo* releases.

**Note:** I’m still in the midst of thoroughly testing this implementation on [tty.fail](https://tty.fail/mrus), which is my own Git platform, and I haven’t yet opened up registrations for others to sign up. In case you would like to contribute to any of the projects and therefor would like to get early access, join the [community channel](/contact/#xmpp) and let me know!