+++
title = "Using a Real Mail Client with Outlook"
description = "I recently managed to get access to my Outlook email from Emacs. This took some doing as my university had disabled app passwords. I consider Outlook to be harmful, but inasmuch as companies and schools continue to enforce OAUTH-only auth"
date = "2023-05-03T00:00:00Z"
url = "https://lambdaland.org/posts/2023-05-03_email_with_outlook/"
author = """

            
              Ashton Wiersdorf
            
          """
text = ""
lastupdated = "2026-07-21T09:22:07.257040642Z"
seen = false
+++

I recently managed to get access to my Outlook email from Emacs. This took some doing as my university had disabled app passwords. I [consider Outlook to be harmful](/posts/2022-08-28_keep_email_federated), but inasmuch as companies and schools continue to enforce OAUTH-only authentication with email systems, it is good to find workarounds.

This is how I set up email sending/receiving on my computer running macOS with [DavMail](https://davmail.sourceforge.net/index.html). I also use [mbsync](https://linux.die.net/man/1/mbsync) (confusingly also known as isync) to actually fetch my email, and [mu/mu4e](https://www.djcbsoftware.nl/code/mu/) to index and read mail. [Douglas Rumbaugh has an awesome blog post](https://douglasrumbaugh.com/post/davmail-authentication/) that I followed to get this working. You should read that. This will mostly be my specific configuration settings as well as some tips and tricks.

DavMail configuration
----------

I just installed DavMail using [brew](https://brew.sh/):

```
brew install davmail
```

I tried installing the cask version, but that never worked for me. Oh well. Command line is better anyway.

### Config file ###

Now comes the tricky part: we need to point DavMail the right direction to fetch a token. Start with the following in a config file: (I used `~/.davmail.properties` as my config file)

```
# Disallow access to the davmail server from remote hosts (i.e., other
# computers on the network)
davmail.allowRemote=false

# Don't use SSL (between email client and davmail)
davmail.ssl.nosecurecaldav=false
davmail.ssl.nosecureimap=false
davmail.ssl.nosecureldap=false
davmail.ssl.nosecuresmtp=false

# Ports to run the different services on. You'll need these to connect
# your clients. If you have several Exchange accounts, each one will need
# to run on different ports
davmail.caldavPort=5000
davmail.imapPort=5001
davmail.ldapPort=5002
davmail.smtpPort=5003

# Connection details for your exchange account. Odds are good that the
# url listed here will work for you. If not, see if your University/employer
# has any details on the correct host URL to connect to their email services
# with.
davmail.url=https://outlook.office365.com/EWS/Exchange.asmx

# Set the authentication mode to manual
davmail.mode=O365Manual

# Run davmail in server mode
davmail.server=true
davmail.enableKeepAlive=true
```

That’s snarfed verbatim from the Douglas Rumbaugh post. The `davmail.url` worked for me, and will probably work for you. My university uses a Duo-2FA powered authentication system, and that’s still the right URL. Go figure.

With that in place, fire up DavMail on the terminal like so:

```
davmail ~/.davmail.properties        # put the path to your config file here
```

This sets up a mail server *proxy* running locally on your computer.

Email client config
----------

Douglas Rumbaugh has some examples for mbsync, which is what I use too. I like using the built-in macOS `security` tool to store my passwords in my system keychain, so I don’t have to type a gpg decryption key every time I want to sync.

```
security add-generic-password -a umail -s mbsync -w   # this will prompt for the secret
```

I put the login I use for my school account in there.

Now, inside my `.mbsyncrc` I can do this:

```
IMAPAccount uni
Host 127.0.0.1
Port 1143
User XXXXXXXX@XXXXX.edu
PassCmd "security find-generic-password -a umail -s mbsync -w"
SSLType None
AuthMechs LOGIN

IMAPStore uni-remote
Account uni

MaildirStore uni-local
Path ~/Mail/Umail/
Inbox ~/Mail/Umail/INBOX
SubFolders Verbatim

Channel uni
Far :uni-remote:
Near :uni-local:
Patterns *
SyncState *
Create Both
Sync All
Expunge Near
```

Fetching the secret token
----------

With DavMail running and an IMAP-speaking client ready to go, you are prepared to fetch a secret token.

Sync your mail through DavMail—in my case, by running `mbsync -a uni`. You should see a link pop up in the DavMail log output:

```
Please open the following link:
https://login.microsoftonline.com/common/oauth2/authorize?<...>
 proceed through authentication steps and paste back the final url that contains authentication code (blank page)
Authentication code:
```

Follow the instructions on the page—I finished doing a DUO push. Once that was done, I got redirected to a blank screen. **COPY THE URL** of that page, and dump it into a text editor to pull out the key you will need from the query string.

The key will look something like `{AES}<really long base64 encoded string>`, and for me it was sandwiched between a few of the query parameters.

With that key in hand, you can either paste it into the terminal, or you might have to open the DavMail config file. Douglas’s instructions said pasting the whole URL worked for him, but it never did for me.

Here’s what my config file looked like in the end:

```
davmail.ssl.keystoreType=
davmail.ssl.keystorePass=
davmail.proxyPassword=
davmail.oauth.tenantId=
davmail.oauth.clientId=
davmail.smtpPort=1025
davmail.enableKerberos=false
davmail.folderSizeLimit=
davmail.forceActiveSyncUpdate=false
davmail.imapAutoExpunge=true
davmail.useSystemProxies=false
davmail.proxyUser=
davmail.caldavEditNotifications=false
davmail.ssl.nosecuresmtp=false
davmail.caldavPastDelay=0
davmail.ssl.keyPass=
log4j.logger.httpclient.wire=WARN
davmail.noProxyFor=
davmail.server=true
davmail.popMarkReadOnRetr=false
davmail.ssl.nosecureimap=false
davmail.disableTrayActivitySwitch=false
davmail.caldavAutoSchedule=true
davmail.enableProxy=false
davmail.proxyPort=
davmail.logFileSize=
davmail.mode=O365Manual
davmail.smtpSaveInSent=true
davmail.bindAddress=
davmail.ssl.nosecurepop=false
davmail.ssl.pkcs11Library=
log4j.rootLogger=WARN
davmail.ssl.keystoreFile=
log4j.logger.davmail=DEBUG
davmail.ssl.clientKeystoreType=
davmail.clientSoTimeout=
davmail.ssl.pkcs11Config=
davmail.ssl.clientKeystorePass=
davmail.imapPort=1143
davmail.url=https://outlook.office365.com/EWS/Exchange.asmx
log4j.logger.org.apache.http.conn.ssl=WARN
davmail.sentKeepDelay=0
davmail.ssl.nosecureldap=false
davmail.imapAlwaysApproxMsgSize=false
davmail.ssl.nosecurecaldav=false
davmail.popPort=1110
davmail.defaultDomain=
davmail.showStartupBanner=true
log4j.logger.httpclient=WARN
davmail.proxyHost=
davmail.ldapPort=1389
davmail.server.certificate.hash=
log4j.logger.org.apache.http.wire=WARN
davmail.disableGuiNotifications=false
davmail.imapIdleDelay=
davmail.allowRemote=false
davmail.disableUpdateCheck=false
log4j.logger.org.apache.http=WARN
# FIXME: make sure the username is correct here; for me it was "uXXXXXXX@umail.utah.edu"
davmail.oauth.USERNAME.refreshToken={AES}THIS IS WHERE THE SECRET KEY GOES!!!
davmail.caldavPort=1080
davmail.enableKeepAlive=true
davmail.ssl.clientKeystoreFile=
davmail.logFilePath=
davmail.carddavReadPhoto=true
davmail.keepDelay=30
davmail.oauth.redirectUri=
davmail.caldavAlarmSound=
```

Try re-running your email sync, and see if it works!

Configuring Emacs for sending mail
----------

I use mu4e, but I think the `smtpmail-*` variables are also used by `gnus` and `notmuch` for sending mail—I could be wrong though, so if I am, someone please correct me. :)

I use the following in my mu4e [work context](https://www.djcbsoftware.nl/code/mu/mu4e/Contexts.html); adjust as needed:

```
(make-mu4e-context
 :name "Work"
 :match-func
 (lambda (msg)
   (when msg
     (string-prefix-p "/Umail" (mu4e-message-field msg :maildir))))
 :vars
 '((user-mail-address . "ashton.wiersdorf@utah.edu")
   (user-full-name . "Ashton Wiersdorf")
   (mu4e-compose-signature . "SIGNATURE GOES HERE")
   ;;                               ↓ this is a neat function ↓
   ;; (message-send-mail-function . message-send-mail-with-mailclient)

   (mu4e-get-mail-command . "mbsync uni")

   (mu4e-bookmarks .
                   ((:name "Inbox" :query "maildir:/Umail/INBOX" :key 105)
                    (:name "Flagged" :query "g:f AND NOT flag:trashed" :key 102)
                    (:name "Unread messages" :query "flag:unread AND NOT flag:trashed" :key 117)
                    (:name "Today's messages" :query "date:today..now" :key 116)
                    (:name "Last 7 days" :query "date:7d..now" :key 119)
                    (:name "Messages with images" :query "mime:image/*" :hide-unread t :key 112)
                    (:name "Drafts" :query "maildir:/Umail/Drafts" :key 100)))

   (message-send-mail-function . smtpmail-send-it)
   (smtpmail-smtp-server . "localhost")
   (smtpmail-smtp-user . "XXXXXXXX@XXXXXXXXX.edu")   ; base username email, not my nice first.last@utah.edu alias
   (smtpmail-stream-type . plain)
   (smtpmail-smtp-service . 1025)

   (mu4e-drafts-folder .  "/Umail/Drafts")
   (mu4e-sent-folder . "/Umail/Sent")
   (mu4e-trash-folder . "/Umail/Trash")
   (mu4e-refile-folder . "/Umail/Archive")))
```

I also had to add the following to my `~/.authinfo.gpg`:

```
machine localhost port 1025 login XXXXXXXX@XXXXXXX.edu password XXXXXXXXX
```

Note that the URL is `localhost` —this is because we are using DavMail as a *proxy* for Outlook.

If you have not set up your authsources, might be a good time to do that to manage secrets with Emacs. I have this in my config:

```
(setq auth-sources '("~/.authinfo.gpg"))
```

David Wilson has an [awesome video on how to set up gpg](https://www.youtube.com/watch?v=nZ_T7Q49B8Y) to manage passwords with Emacs. I’d check out all his videos because he covers some seriously great stuff in the Emacs and the Guix space.

Anyway, email with Outlook sucks—we wouldn’t have to do any of this crap if app passwords were a thing. But if there is no other way, then DavMail can bring a little sanity back to your email workflow.

\+++ Update 2023-09-24 = “I used to have my affiliate link for Fastmail here. I’ve genuinely enjoyed their services and have received no financial compensation for the little recommendation I gave them here. However, I’ve decided to remove the affiliate link because I don’t think it’s appropriate for my blog.”