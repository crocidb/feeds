+++
title = "The IMAP Protocol"
description = "References RFC:2177 – IMAP4 IDLE command [RFC:4551](http://www.faqs.org/rfcs/rfc4551.html?utm_campaign=unsolicited_traf"
date = "2007-01-28T12:22:31Z"
url = "https://taoofmac.com/space/protocols/imap?utm_content=atom"
author = "Rui Carmo"
text = ""
lastupdated = "2026-11-24T14:07:00.356653711Z"
seen = false
+++

[

References
----------

](/space/protocols/imap#references)

* [RFC:2177](http://www.faqs.org/rfcs/rfc2177.html?utm_campaign=unsolicited_traffic&utm_medium=web&utm_source=taoofmac.com) – IMAP4 IDLE command
* [RFC:4551](http://www.faqs.org/rfcs/rfc4551.html?utm_campaign=unsolicited_traffic&utm_medium=web&utm_source=taoofmac.com) – IMAP Extension for Conditional STORE Operation or Quick Flag Changes Resynchronization
* [Simulating IMAP over telnet](http://support.microsoft.com/default.aspx?NoWebContent=1&scid=http://support.microsoft.com:80/support/kb/articles/Q189/3/26.ASP&utm_campaign=unsolicited_traffic&utm_medium=web&utm_source=taoofmac.com)
* [Dovecot Secure IMAP Server](http://dovecot.procontrol.fi/?utm_campaign=unsolicited_traffic&utm_medium=web&utm_source=taoofmac.com) – looks really interesting, and might replace my current [IMAP](https://en.wikipedia.org/wiki/IMAP?utm_campaign=unsolicited_traffic&utm_medium=web&utm_source=taoofmac.com) server one day.
* [Perdition](http://www.vergenet.net/linux/perdition/?utm_campaign=unsolicited_traffic&utm_medium=web&utm_source=taoofmac.com), a [IMAP](https://en.wikipedia.org/wiki/IMAP?utm_campaign=unsolicited_traffic&utm_medium=web&utm_source=taoofmac.com)/[POP3](/space/protocols/pop3) proxy for large-scale deployments
* [binc](http://www.bincimap.org/?utm_campaign=unsolicited_traffic&utm_medium=web&utm_source=taoofmac.com) – maildir-only, tries to follow the [qmail](qmail) way of doing things.

[

Resources
----------

](/space/protocols/imap#resources)

|                                                    Category                                                     |                                                             Date                                                             |                                                                 Link                                                                  |                                                                         Notes                                                                          |
|-----------------------------------------------------------------------------------------------------------------|------------------------------------------------------------------------------------------------------------------------------|---------------------------------------------------------------------------------------------------------------------------------------|--------------------------------------------------------------------------------------------------------------------------------------------------------|
|                                                     Backup                                                      |                                                             2026                                                             |        [bichon](https://github.com/rustmailer/bichon?utm_campaign=unsolicited_traffic&utm_medium=web&utm_source=taoofmac.com)         |                          a server-side application for archiving and searching emails with a REST API and full-text indexing.                          |
|                                                      2022                                                       |[imap-backup](https://github.com/joeyates/imap-backup?utm_campaign=unsolicited_traffic&utm_medium=web&utm_source=taoofmac.com)|                                                              Ruby-based                                                               |                                                                                                                                                        |
|                                                      2007                                                       |  [imapbackup](http://github.com/rcarmo/imapbackup?utm_campaign=unsolicited_traffic&utm_medium=web&utm_source=taoofmac.com)   |                                              My own backup script, generates mbox files                                               |                                                                                                                                                        |
|                                                    Filtering                                                    |                                                             2010                                                             |[imapautofiler](https://github.com/imapautofiler/imapautofiler?utm_campaign=unsolicited_traffic&utm_medium=web&utm_source=taoofmac.com)|                                                     comprehensive Python tool for filing messages                                                      |
|                                                      2007                                                       |      [imapfilter](http://imapfilter.hellug.gr?utm_campaign=unsolicited_traffic&utm_medium=web&utm_source=taoofmac.com)       |                                                                                                                                       |                                                                                                                                                        |
|                                                    Migration                                                    |                                                             2022                                                             |       [imapsync](https://github.com/imapsync/imapsync?utm_campaign=unsolicited_traffic&utm_medium=web&utm_source=taoofmac.com)        |                                                              commercially supported tool                                                               |
|                                                Quota management                                                 |                                                             2007                                                             |         [IMAPsize](http://www.broobles.com/imapsize?utm_campaign=unsolicited_traffic&utm_medium=web&utm_source=taoofmac.com)          |                                                    a Windows application for checking folder sizes                                                     |
|                                                     Servers                                                     |                                                             2026                                                             |     [Stalwart](https://github.com/stalwartlabs/stalwart?utm_campaign=unsolicited_traffic&utm_medium=web&utm_source=taoofmac.com)      |Mail and collaboration server supporting IMAP, JMAP, SMTP, POP3, CalDAV, CardDAV and WebDAV, with Exchange protocol support and built-in spam filtering.|
|                                                      Sync                                                       |                                                             2022                                                             |           [lieer](https://github.com/gauteh/lieer?utm_campaign=unsolicited_traffic&utm_medium=web&utm_source=taoofmac.com)            |                                                        not really IMAP as it is Gmail-specific                                                         |
|                                                      2007                                                       |        [isync](http://isync.sourceforge.net?utm_campaign=unsolicited_traffic&utm_medium=web&utm_source=taoofmac.com)         |                                                        a mailbox synchronizer                                                         |                                                                                                                                                        |
|[OfflineIMAP](http://www.offlineimap.org?utm_campaign=unsolicited_traffic&utm_medium=web&utm_source=taoofmac.com)|                                              Maintains a local maildir replica                                               |                                                                                                                                       |                                                                                                                                                        |

### [](/space/protocols/imap#cyrus-specific)[Cyrus](Cyrus)-specific ###

* [SirAdmin](http://blogs.cofa.unsw.edu.au/blog/nigelkersten/osxserver/?permalink=SirAdmin-a-GUI-replacement-for-cyradm.html&utm_campaign=unsolicited_traffic&utm_medium=web&utm_source=taoofmac.com), a [Mac OS X](/space/com/apple/macos) [GUI](https://en.wikipedia.org/wiki/GUI?utm_campaign=unsolicited_traffic&utm_medium=web&utm_source=taoofmac.com) replacement for `cyradm`
* [Cyrus Aggregator](http://asg.web.cmu.edu/cyrus/ag.html?utm_campaign=unsolicited_traffic&utm_medium=web&utm_source=taoofmac.com)

[

Mobile Clients
----------

](/space/protocols/imap#mobile-clients)

Although most mobile phones have moderately decent e-mail clients, some of them are [POP3](/space/protocols/pop3)-only or (as in the case of [Motorola](/space/com/motorola) handsets) so poorly designed and useless that you wonder how their developers found a job in the first place, so it still makes sense to search for alternative [IMAP](https://en.wikipedia.org/wiki/IMAP?utm_campaign=unsolicited_traffic&utm_medium=web&utm_source=taoofmac.com) clients.

* [mail4me](http://mail4me.objectweb.org/software/downloads/?utm_campaign=unsolicited_traffic&utm_medium=web&utm_source=taoofmac.com), abandonware from the [Enhydra](Enhydra) project. Barebones at best.
* [logicmail](http://logicmail.sourceforge.net/?utm_campaign=unsolicited_traffic&utm_medium=web&utm_source=taoofmac.com) for [Blackberry](com/blackberry) devices, inspired on mail4me.
* [vimoMail](http://www.vimomail.com?utm_campaign=unsolicited_traffic&utm_medium=web&utm_source=taoofmac.com) – [MIDP](/space/dev/java/midp), nagware, only displays 3 mails per session, poor [MIME](MIME) encoding handling. Not worth the trouble.

*This page was updated on Nov 24<sup>th</sup> 2026.*