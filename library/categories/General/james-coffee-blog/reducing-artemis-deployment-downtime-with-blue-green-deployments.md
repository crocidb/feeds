+++
title = "Reducing Artemis’ deployment downtime with blue-green deployments"
description = "Artemis, the calm web reader I maintain, runs as a systemd process. When I want to update the software, I deploy the new code to the server and then restart the systemd process. This has a significant downside: while the Artemis process is restarting, the software is unavailable "
date = "2026-02-06T16:00:34Z"
url = "https://jamesg.blog/2026/02/06/blue-green-deployment/"
author = "James' Coffee Blog"
text = ""
lastupdated = "2026-02-11T20:17:01.813511041Z"
seen = true
+++

[Artemis](https://artemis.jamesg.blog), the calm web reader I maintain, runs as a `systemd` process. When I want to update the software, I deploy the new code to the server and then restart the `systemd` process. This has a significant downside: while the Artemis process is restarting, the software is unavailable to users. During this period – which usually lasts around 5-10 seconds – a maintenance message appears when you try to load any page.

This week, I started work on improving this. I wondered “how could I reduce, or even eliminate, downtime when deploying new software updates?” I searched and found that “blue-green deployment” is what I needed.

How it works
----------

[Blue-green deployment](https://en.wikipedia.org/wiki/Blue–green_deployment) involves having two Artemis processes running: a primary version which handles all requests, and a fallback version which can handle requests while the primary version is being refreshed. When I go to deploy Artemis now, the following happens:

1. I deploy the application code.
2. I restart the main process (the blue deployment).
3. The fallback process (the green deployment) takes over handling requests.
4. When the main process has restarted, requests will go back to the main process.
5. The fallback process is restarted so that it is also running the latest version of the software.

The last four steps are implemented in a deployment script to make sure all the steps happen in the right order.

Nginx implementation
----------

I use `nginx` to handle web requests. To implement blue-green deployments, I use the following code:

```
upstream appbackend {
    server localhost:9000;
    server localhost:9001 backup;
}
​
server {
   root artemis.jamesg.blog;
   [...]
   location / {
    proxy_pass http://appbackend;
      [...]
}
```

This code is based heavily [on a Stack Overflow answer which implements something similar](https://serverfault.com/questions/929500/nginx-reverse-proxy-for-high-availability-setup), except in my case I am using individual ports on the server to host different versions of the software rather than different IPs. In this code, port 9000 is hosting the main (blue) application, and 9001 is hosting the fallback (green) application.

The fallback process has been designed to be essentially read-only: account pages, feed filters, and other pages that involve forms are temporarily disabled. This means you can, for example, read and refresh your feed, but you can’t change your feed settings. While all actions would be saved to the database anyway, I would want to do a lot more testing to make sure that everything works as expected on the fallback process.

Here is what the read-only message that appears on pages that have web forms looks like:

![The Artemis UI with a message that reads "Artemis is being updated. We are rolling out an update right now. Please refresh this page in a few seconds and try again."](https://editor.jamesg.blog/content/images/2026/02/readonly.png)

Routing in Flask for read-only mode
----------

From a technical perspective, the way the read-only mode works is there is an environment variable that stores which deployment is running (blue, the main one, or green). If the green deployment is running, I have an `if` statement that stops the Flask blueprint files loading for all the files that relate to write-based actions.

The 404 page is overwritten to display the update rollout message. This implementation means I didn’t have to manually update all the routes with logic to decide whether to show the read-only message (but it only works because my code was organised into separate files, with groups where most routes in a file were either read-only or read-write).

Conclusion
----------

I have been enjoying this deployment method so far. It is much more preferable to seeing the maintenance message appear on every page. The maintenance message was a separate HTML file in a separate directory and, as a result, never caught my attention to update. That page had many duplicate styles, too, because it couldn’t rely on the CSS files that were served by the main application if the main application was down.

This deployment method doesn’t prevent downtime. There was some downtime earlier this week due to `nginx` crashing, but that was a separate problem. (And one that has me finally investigating how to use `systemd` to make a service that has crashed automatically recover using the `Restart` directive)