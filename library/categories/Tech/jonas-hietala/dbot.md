---
title = "Dbot"
description = 'So I made a small irc bot in 294 characters in code-golfing language 1: Perl.Usageperl DbotCommands .name - Echo the bots name .hello - Output “hello world!”* .src - Dump the source codeCode`use IO::Socket;$s=IO::Socket::INET-new("158.3'
date = "2024-07-17T19:35:07Z"
url = "http://jonashietala.se/blog/2012/11/13/dbot/index.html"
author = "Jonas Hietala"
text = ""
lastupdated = "2025-10-22T08:58:11.709195759Z"
seen = true
---

So I made a small irc bot in 294 characters in code-golfing language #1: Perl.

Usage
==========

`perl Dbot`

Commands
==========

* `.name` - Echo the bots name
* `.hello` - Output “hello world!”
* `.src` - Dump the source code

Code
==========

```
use IO::Socket;$s=IO::Socket::INET->new("158.38.8.251:6667");sub o{print$s "$_[0]\n"}o("NICK $0");o("USER b * * :b");while(<$s>){o("PONG$1")if/^PING(.*)$/;o("JOIN #$0")if/004/;if(($p,$h)=/(P.+)\.(.*)./){o("$p$h world!")if$h=~"h";o($p.$0)if$h=~"n";if($h=~"s"){open F,$0;o($p.do{local$/=<F>})}}}

```

Well uh let’s try that again, without minimize shall we?

```
use IO::Socket;

# Connect to one server of irc.quakenet.org
$s = IO::Socket::INET->new("158.38.8.251:6667");

# o("txt") writes "txt\n" to the server
sub o{ print$s "$_[0]\n" }

# Register our nickname, same as file name
o("NICK $0");
# Register username, necessary stuff :<
o("USER b * * :b");

# Never quit!
while(<$s>) {
    # Play a bit of ping-pong
    o("PONG$1") if /^PING(.*)$/;

    # Join when ping-pong has completed
    o("JOIN #$0") if /004/;

    # Parse a message our channel with message ".<cmd>"
    # so example:
    # :<user-info> PRIVMSG #<channel> :.<cmd>
    # (P.+) Match 'PRIVMSG #<channel> :'
    # \. Cmd prefix
    # (.*) Cmd
    # . Trailing \r
    if(($p,$h) = /(P.+)\.(.*)./) {
        # .hello Echo hello world! Unless an abuser appears!
        o("$p$h world!") if $h =~ "h";
        # .name Echo name of bot
        o($p.$0) if $h =~ "n";

        # .src Output whole source code
        if($h =~ "s") {
            # Open running script file handler
            open F,$0;
            # Echo contents of running script
            # file slurping
            o($p . do{ local$/ = <F> })
        }
    }
}

```

All hacky, but I had some fun with it.