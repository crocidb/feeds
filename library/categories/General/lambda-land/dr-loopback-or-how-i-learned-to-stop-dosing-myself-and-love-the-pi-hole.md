+++
title = "Dr. Loopback, Or: How I Learned to Stop DOSing Myself and Love the Pi-Hole"
description = "I noticed that my Internet was acting strangely: whenever I visited a web page, my browser would hang for a good second or two before it started loading anything. Zoom calls worked without a problem for school, so this tipped me off that something was wrong with the DNS lookup or"
date = "2020-12-11T00:00:00Z"
url = "https://lambdaland.org/posts/2020-12-11-raspberry-pi-dos/"
author = """

            
              Ashton Wiersdorf
            
          """
text = ""
lastupdated = "2026-07-21T09:22:07.307100604Z"
seen = false
+++

I noticed that my Internet was acting strangely: whenever I visited a web page, my browser would hang for a good second or two before it started loading anything. Zoom calls worked without a problem for school, so this tipped me off that something was wrong with the DNS lookup or the handshake.

Sure enough, I popped open my [Pi-Hole](https://pi-hole.net/) admin console, and was greeted with this:

![Pi-Hole Admin Console](/img/pi_hole_before.png)

The green number in the `Total Queries` box would jump by 10, 20, or sometimes even 100 every second.

I tried turning off, disconnecting, and rebooting my various computers and devices to see if it was just some rogue process messing everything up. No change. I rebooted my router. No change. I updated and restarted the Pi-Hole. Still no change.

I noticed that a *lot* of requests to the domain `lb._dns-sd._udp.0.0.0.10.in-addr.arpa`. I did a web search and found [a single post on a forum](https://discourse.pi-hole.net/t/many-requests-to-lb-dns-sd-udp-0-1-168-192-in-addr-arpa/18241) that suggested turning off conditional forwarding on the Pi-Hole.

I went into admin settings, turned off conditional forwarding, and was rewarded with this:

![Pi-Hole Admin Console](/img/pi_hole_after.png)

Now my pi isn’t overloaded with DNS requests, and my Internet is as snappy as it used to be.

What happened, I think, was that a device on my network would try and lookup some name. The router would forward this request to the pi, which would then forward it back to the router, which would then send it back to the pi, etc. Boom. Infinite loop, and all my DNS requests got bogged down.

I’m not very good with networking; that’s probably my biggest weakness. I learned a thing today, though!