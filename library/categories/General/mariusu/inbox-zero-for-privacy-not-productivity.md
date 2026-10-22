+++
title = "Inbox Zero for Privacy, not Productivity"
description = 'Using the \_Inbox Zero\_ productivity meme to approach a privacy practice that turns your mail server into a place where there is simply nothing left to steal.'
date = "2026-10-08T11:32:21Z"
url = "https://xn--gckvb8fzb.com/inbox-zero-for-privacy-not-productivity/"
author = "marius@xn--gckvb8fzb.com (Marius)"
text = ""
lastupdated = "2026-10-21T11:46:09.517626631Z"
seen = false
+++

The concept of *Inbox Zero* has been worn out by the productivity crowd over the years and you’ve most likely come across the genre yourself. The type of ideas that tell you to empty your inbox in an effort to attain a state of serene focus, and ascend to become the kind of *knowledge worker* who *“processes”* correspondence rather than merely reading it. To be fair, ever since *“AI”* has been widely adopted to write and even read e-mails, I haven’t heard much from the former *Inbox Zero* fans, but I never found their framing compelling to begin with. What does interest me, however, is that the average mailbox has grown into one of the most complete, most sensitive, and probably least defended archives of private data a person owns, and that this archive is stored on *someone else’s computer*.

So, with the tinfoil hats firmly back on, let’s look at *Inbox Zero* not as a ritual of productivity, but as a practice of privacy.

Honeypot
----------

Let’s first consider what is in your inbox right now. Probably password reset links, maybe invoices bearing your full legal name and home address, likely a dozen booking confirmations that double as a travel itinerary, maybe even medical exchanges and the occasional scan of an identity document that you sent *“just this once”* to this company that likely got breached at least once since you began reading this post. For most people an e-mail account amounts to a more thorough dossier than anything an intelligence service could have ever assembled by hand a few decades ago.

And all of it is stored… *where, exactly?* Oh, right, on a mail server you do not control, operated by a company you are obliged to *“just trust, bro”*, reachable from anywhere on the planet by whoever happens to have the IMAP password (or exploit). I’ve [written before](/anonymous-paid-email-account/) about why none of us can trust any online service to safeguard our data anymore, and e-mail is the textbook example of the problem. A mailbox holding a decade of correspondence is a target that turns a data breach into a catastrophe.

The *productivity* flavor of *Inbox Zero* does nothing to help here. When the productivity gurus instruct you to *“archive”* a message, what they really mean is clicking a button that relocates it from `INBOX` to a folder named `Archive`, on the same server. From a privacy and security standpoint an inbox holding five messages alongside an archive of fifty thousand is no safer than the cluttered inbox you started out with, as it is the very same data, on the very same machine, exposed to the very same risk. But that’s because the productivity crowd doesn’t give a flying flock about privacy or security to begin with.

However, it turns out that we can build on top of the *Inbox Zero* principle, but actually make it make sense from a data safety perspective by implementing a single, simple change in the process!

Local archiving
----------

The privacy-minded take on *Inbox Zero* is fairly simple: Once you are done with an e-mail, you don’t just move it to another folder, but you move it off the mail server and onto storage that you physically control. The server keeps your `INBOX` along with whatever you haven’t dealt with yet, but nothing more. Everything you have already handled is stored in a local mailbox on your own disk, ideally one that is encrypted at rest, backed up, and not reachable from the internet at all. This simple change in behavior is enough for most people to greatly decrease the damage they would suffer from a data breach of their mail service, and it doesn’t cost much to implement.

Rather than treating the server as the one place where your mail is stored and your laptop as a viewer onto it, you treat your laptop as the place where your mail is stored, and the server as a temporary drop box for incoming and outgoing messages. It’s literally as easy as that, and everyone no matter their technical abilities can implement this change.

Threat model
----------

Before getting to the actual implementation and the necessary configuration, be aware that this approach is not a silver bullet. Don’t get tricked into a false sense of security!

Moving your archive onto local storage protects you against one specific and common class of disaster, namely your mail provider being breached, compelled, acquired, or simply deciding one day to mine your mailbox for *iMpRoViNg SeRvIcE qUaLiTy*. Once a message has been moved off the server, no future compromise of that server can expose that one message, at least unless the provider stores a *backup copy* of that mail, which, these days, is assumed.

This approach, however, **does not un-send mail**, as every message you archive locally still has a copy in the mailbox of whoever you were corresponding with, on *their* provider’s server. It does not erase the *metadata* either, since the mere fact that you and a given person exchanged messages at a given time may well remain visible in server and transport logs long after the bodies of those messages have left your account. The metadata problem is one of e-mail’s big issues, and no amount of local archiving fixes it.

Finally, moving the mails off-server relocates the risk rather than removing it. Your own storage is now the dossier, and should that storage be neither encrypted nor backed up you have traded a remote risk for a local one. Full-disk encryption and an encrypted backup strategy are therefore advisable.

With that established, and an [encrypted laptop](/hardened-gentoo-with-full-disk-encryption-on-the-star-labs-starbook-mk-vi/) with sane backups assumed, let’s look at how this is actually done in the clients people tend to use.

Thunderbird
----------

Thunderbird ships with this capability built in, which makes it the easiest place to start if you are coming from a graphical client. Every Thunderbird profile already contains a special account called *Local Folders* that stores mail on your own machine.

In the folder pane you locate the *Local Folders* account, usually pinned to the bottom, right-click it and create a new subfolder named something along the lines of `Archive`, mirroring your server-side folder structure if you care to.

To archive a message you then select it in your IMAP inbox and drag it onto that local folder, or use the right-click *Move To* menu. Keep in mind that only the *move* action removes the message from the server, while *copy* leaves a duplicate behind, so you want the *move*.

If you feel extra fancy you can even set the `Archive` directory in the *Local Folders* account as [a destination for archived e-mail](https://support.mozilla.org/en-US/questions/1323866) in your main account.

Alternatively you can also use *Message Filters*, found under *Tools*, and build a rule that, say, relocates everything older than thirty days from the inbox into the local archive on demand. I prefer moving things by hand as I finish with them, since it forces me to decide what *“done”* is supposed to mean, and it also lets me structure my `Archive` with subfolders for individual areas, but a filter can make for a reasonable safety net nevertheless.

**Warning:** Thunderbird refers to its *Local Folders* storage as *“maildir”*, and Mozilla lets you select it as such. It is [**not** a real maildir](https://wiki.mozilla.org/Thunderbird/Maildir):

>
>
> Note this is NOT full maildir in the sense that most people, particularly linux users or mail administrators, know as maildir.
>
>

Having stored years of mail in Thunderbird’s *Local Folders* myself, I eventually found that I had locked it all into a format no other *maildir*-aware tool could read, and no clean way to get it out.

Apple Mail
----------

Apple Mail offers the same concept under a different name, with local mailboxes in the *On My Mac* section. You create one through *Mailbox*, *New Mailbox*, setting the location to *On My Mac* and giving it a name such as `Archive`. From there you select messages in your primary account and reach for *Message*, *Move To*, *On My Mac*, *Archive*, or simply drag them across. As with Thunderbird, *Move To* removes the message from the server while *Copy To* leaves a copy behind, so the move is once again what you need to use.

**Note:** When moving a large backlog across for the first time, Apple’s own documentation recommends doing so in batches of a few hundred messages rather than selecting ten years of mail in one go, as the transfer can otherwise time out somewhere in the middle.

Outlook
----------

Outlook is where things become *weird*, for the simple reason that there are now *two* Outlooks, and they behave differently.

*Classic Outlook*, the long-standing Win32 application, supports exactly what we are after by way of *Outlook Data Files*, the familiar `.pst` files. A `.pst` is a local, on-disk mail store, which you create through *File*, *Account Settings*, *Data Files*, *Add*, after which you select messages in your IMAP inbox and drag them into a folder inside that `.pst`. This is a move, so the messages leave the server, and it is the decades-old way of taking mail offline in the Microsoft world.

*New Outlook*, the cloud-first rewrite that Microsoft has been pushing onto everyone, is different. Having been re-architected around Microsoft’s cloud bs, it has had its local `.pst` support [largely gutted](https://office-watch.com/2026/outlook-new-for-windows-guide/). At the time of writing, new Outlook can neither create nor write to a `.pst` the way classic Outlook can. The supposedly *“modern”* client makes it harder to keep your mail on your own machine, and if local archiving matters to you while you are stuck on Windows with Outlook, you currently have to fall back to *classic Outlook*.

**Note:** That a brand-new flagship mail client in 2026 makes it *harder* to keep your own mail on your own computer shows where the incentives are. The cloud is not being offered to you because it serves **you** better, but because your mailbox and the data it contains is very precious to *Big Tech*.

aerc
----------

Now we get to the setups I use myself. [aerc](https://aerc-mail.org/) is a terminal mail client that speaks IMAP directly and lets you configure several accounts of differing backend types at once. It lets us define one account for the IMAP server and a second account that is nothing more than a local *maildir* on disk, and then bind a key to move messages from the former to the latter.

The relevant part of `~/.config/aerc/accounts.conf` looks something like this:

```ini
# The mail server
[Mailserver]
source   = imaps://you%40example.org@imap.example.org
outgoing = smtps://you%40example.org@smtp.example.org
from     = Your Name <you@example.org>
copy-to  = Sent
# Note the deliberate absence of an `archive = ...` line pointing at a
# server-side folder. We archive locally instead.

# A plain local maildir on your (encrypted) disk. This is where dealt-with
# mail is stored.
[Local]
source = maildir://~/.mail/local

```

The matching binding in `~/.config/aerc/binds.conf`:

```ini
[messages]
# Move the selected (marked) messages into the local maildir account.
# The -a flag targets a different account. aerc creates the folder if it does
# not yet exist.
A = :move -a Local Archive<Enter>

```

With that in place the workflow reduces to reading a message, dealing with it, and pressing `A`. The message is gone from the server and is now stored in `~/.mail/local/Archive` as a standard *maildir*, one file per message, readable by `grep`, `mu`, `notmuch`, `mbsync`, or anything else that understands the format. There is no proprietary bs and no lock-in, and because it is a *maildir* you can point a full-text indexer at it and search a decade of mail instantly and entirely offline, and it will **very likely** work better than Google Mail’s search.

aerc’s `:move -a <account> <folder>` performs the cross-account move for you, copying the message into the destination account’s backend and removing it from the source.

neomutt
----------

[neomutt](https://neomutt.org/) treats IMAP folders and local *maildirs* as the same thing, namely a *mailbox*, and lets you move messages between them with a single keystroke. `<copy-message>`, bound to `C` by default, copies a message into another mailbox and leaves the original in place, while `<save-message>`, bound to `s`, copies it into another mailbox and marks the original for deletion. The *save* function is really a *move*.

A local archive in neomutt is therefore nothing more than *save*-ing a message out of your IMAP inbox and into a local *maildir* folder. A minimal `~/.config/neomutt/neomuttrc` illustrates the idea:

```muttrc
# --- The mail server ---
set folder    = "imaps://imap.example.org/"
set spoolfile = "+INBOX"
set imap_user = "you@example.org"

# --- Local maildir archive ---
set mbox_type = Maildir
# Optionally keep sent mail local as well:
set record    = "~/.mail/local/Sent"

# Tell neomutt about both the server inbox and the local archive:
mailboxes "+INBOX" "~/.mail/local/Archive"

# `s` already moves (copy + delete original), this is just an explicit,
# no-prompt macro so that archiving is a single keystroke:
macro index,pager A "<save-message>~/.mail/local/Archive<enter>" \
  "archive to local maildir"

```

You tag a few messages with `t`, press `A`, and they are moved off the server into your local *maildir*. Running `$`, or quitting the mailbox, syncs the deletions back and the messages are gone from the provider.

Many people pair neomutt with [`mbsync`/isync](https://isync.sourceforge.io/) or `offlineimap` for offline access. However, those tools follow a different philosophy, because they *mirror* the server locally, which by default means the mail exists in both places at once. If your goal is to get mail *off* the server, you need to configure the sync tool to expunge after fetching.

Habit
----------

As we can see, the technology here is trivial and (almost) every client mentioned above can do this today, most of them with a single keystroke or a drag of the mouse. The difficulty is the discipline, in treating *“I have finished with this e-mail”* and *“this e-mail is no longer on the server”* as the same thing.

Now, funny enough, this is where the productivity framing of *Inbox Zero* turns out to be useful after all. The habit it cultivates, of touching each message once, deciding, and moving on, is the very habit that keeps your server empty. You merely point the *“moving on”* at local storage rather than at a server-side folder. If pressing `A` twenty times a day becomes a burden, a periodic filter or a small *cron*’d move script can take anything older than a given number of days off the server on your behalf. I prefer to do it by hand, but automation is a fine fallback.

Run things this way for a while and your provider’s copy of your life shrinks to a rolling window of recent messages. At least if we disregard the fact that every message is probably copied by the provider and fed into some machine-learning system upon retrieval anyway, but that however is more of an issue with your choice of providers.

However, were your provider to be compromised tomorrow, with a server-side archive every mail going back years would leak. With this setup it’s at least only a handful of recent e-mails.

But there is more to this approach than just the breach scenario. The archive is yours, stored as real *maildir* or *mbox* files on storage you control, readable for as long as you like by ordinary tools, with no vendor able to lock you in or out. It costs nothing besides a little bit of storage, and it introduces no new dependency, given that it’s plain old IMAP paired with a *local folder*, which is something that has worked for over thirty years. As a small bonus you also stop worrying about storage quotas, since the server stays nearly empty regardless of how much you correspond.

*Inbox Zero* was always marketed as a route to feeling calmer, but for me the calm has little to do with a tidy inbox, and much more to do with knowing that there is nothing on that server worth breaking in for.