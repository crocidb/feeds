+++
title = "Be Your Own Privacy-Respecting Google, Bing & Brave"
description = '... by running your own instance of the free and open-source federated \_metasearch\_ engine \_SearXNG\_ on OpenBSD!'
date = "2025-11-24T12:16:52Z"
url = "https://xn--gckvb8fzb.com/be-your-own-privacy-respecting-google-bing-brave/"
author = "marius@xn--gckvb8fzb.com (Marius)"
text = ""
lastupdated = "2025-12-10T15:23:56.760912971Z"
seen = false
+++

Search engines have long been a hot topic of debate, particularly among the tinfoil-hat-wearing circles on the internet. After all, these platforms are in a unique position to collect vast amounts of user data and identify individuals with unsettling precision. However, with the shift from traditional web search, driven by search queries and result lists, to a LLM-powered *question-and-answer* flow across major platforms, concerns have grown and it’s no longer just about privacy:

Today, there’s increasing skepticism about the accuracy of the results. In fact, it’s not only harder to discover new information online, but verifying the accuracy of these AI-generated answers has become a growing challenge.

As with any industry upended by new technology, a flood of alternatives is hitting the market, [promising to be the antidote](/doubting-your-favorite-web-search-engine/) to the established players. However, as history has shown, many of these newcomers are unlikely to live up to their initial hype in the long run. Meanwhile, traditional search services are either adopting the same LLM-driven approach or [shutting down entirely](https://mullvad.net/en/blog/shutting-down-our-search-proxy-leta).

However, as long as major search engines still allow software to tap into their vast databases without depending too heavily on their internal algorithms and AI-generated answers, there’s some hope. We can take advantage of these indexes and create our own privacy-respecting search engines that prioritize the content we actually want to see. Let’s check how to do so using the popular *metasearch* engine *SearxNG* on *OpenBSD*!

SearXNG
----------

*SearXNG* is a free and open-source metasearch engine, initially forked from *Searx* after its discontinuation, which can tap into over 70 different search engines to receive search results from.

**Note:** *SearXNG* is **not** a search engine but a *metasearch* engine, which means that it does not have its own index but instead it uses existing indexes from e.g. *Google*, *Brave*, *Bing*, *Mojeek*, and others. What *SearXNG* does is that it runs your search query through all of the search engines that you have enabled on your *SearXNG* instance, onto which it applies custom prioritization and removal rules in an effort to tailor the results to *your taste*.

*SearXNG* is not particularly resource-intensive and doesn’t require significant storage space, as it does not maintain its own search index. However, depending on your performance requirements, you may need to choose between slightly longer wait times or higher costs, especially for cloud instances. I tested *SearXNG* on a [Vultr](https://www.vultr.com/?ref=9671208-9J) instance with 1 vCPU and 1GB of RAM, and it performed adequately. That said, for higher traffic or more demanding usage, you’ll need to allocate more CPU and RAM to ensure optimal performance.

Setup
----------

Let’s start by setting up the base system. This guide assumes you’re using the latest version of OpenBSD (7.8, at the time of writing) and that you’ve already configured and secured SSH access. Additionally, your firewall should be set up to allow traffic on ports 22, 80, and 443. Ideally, you should also have implemented preventive measures against flooding and brute-force attacks, such as *PF*’s built-in rate limiting.

**Note:** I’m going to use `lycos.lol` as domain for this specific setup, as well as `lycos` as hostname for the *SearXNG* instance. Make sure to replace these values with your domain/preferred hostname in the configuration files below.

### Basics ###

First, let’s install the dependencies that we need:

```
lycos# pkg_add git libxml libxslt py3-pybind11 redis nginx

```

The default configuration of redis works just fine for now, so we can enable and start the service right away:

```
lycos# rcctl enable redis
lycos# rcctl start redis

```

Next, we create a dedicated user for *SearXNG*:

```
lycos# useradd -m -L daemon _lycos
lycos# id _lycos
uid=1000(_lycos) gid=1000(_lycos) groups=1000(_lycos)

```

### Python & *SearXNG* ###

With the newly created user we clone the *SearXNG* repository from GitHub and set up a Python *virtual environment*:

```
lycos# su -l _lycos -
lycos$ whoami
_lycos
lycos$ pwd
/home/_lycos
lycos$ git clone "https://github.com/searxng/searxng" ./searxng
Cloning into './searxng'...
...
lycos$ python3 -m venv --system-site-packages ./searx
lycos$ echo "export SEARXNG_SETTINGS_PATH=/etc/searxng/settings.yml" >> .profile
lycos$ echo ". /home/_lycos/searx/bin/activate" >> .profile
lycos$ exit
lycos# su -l _lycos -
((searx) ) lycos$
((searx) ) lycos$ pip install -U pip setuptools wheel pyyaml
((searx) ) lycos$ cd searxng
((searx) ) lycos$ pwd
/home/_lycos/searxng
((searx) ) lycos$ pip install --use-pep517 --no-build-isolation -e .
((searx) ) lycos$ pip install --use-pep517 --no-build-isolation uWSGI

```

Next, we copy the default configuration from the repository to `/etc/searxng/settings.yml`; Make sure to `mkdir /etc/searxng` beforehand:

```
lycos# cp /home/_lycos/searxng/utils/templates/etc/searxng/settings.yml /etc/searxng/settings.yml

```

### Settings ###

While the default settings will work *just fine* it’s advisable to configure the `settings.yml` according to your requirements. One key element that will make or break your experience with *SearXNG* is the `hostnames` plugin and its configuration. Make sure to enable the plugin:

```
searx.plugins.hostnames.SXNGPlugin:
  active: true

```

… and make sure to [properly configure](https://docs.searxng.org/dev/plugins/hostnames.html) it:

```
hostnames:
  replace: "hostnames-replace.yml"
  remove: "hostnames-remove.yml"
  low_priority: "hostnames-prio-low.yml"
  high_priority: "hostnames-prio-high.yml"

```

The `replace` configuration tells *SearXNG* to rewrite specific URLs. This is especially useful if you’re not running [LibRedirect](https://libredirect.github.io) but would still like results from e.g. *X.com* to open on *Xcancel.com* instead.

The `remove` configuration contains URLs that you want *SearXNG* to completely remove from your search results, e.g. *Pinterest*, *Facebook* or *LinkedIn* (unless you need those for [OSINT](https://en.wikipedia.org/wiki/Open-source_intelligence)).

The `low_priority` configuration lists URLs that *SearXNG* should de-prioritize in your search results. The `high_priority` setting, on the other hand, does the exact opposite: It instructs *SearXNG* to prioritize results from the listed URLs.

If you need examples for those files feel free to check [the lycos.lol repository](https://github.com/mrusme/lycos.lol).

**PS:** Definitely make sure to change the `server.secret_key`!

### uWSGI ###

We’re going to run *SearXNG* using *uWSGI*, a popular Python web application server. To do so, we create the file `/etc/uwsgi/searxng.ini` with the following content:

```
# -*- mode: conf; coding: utf-8  -*-
[uwsgi]

pidfile = /home/_lycos/searxng.pid

# Disable as soon as the setup is complete
disable-logging = false

uid = _lycos
gid = _lycos

env = LANG=C.UTF-8
env = LANGUAGE=C.UTF-8
env = LC_ALL=C.UTF-8

chdir = /home/_lycos/searxng/searx

env = SEARXNG_SETTINGS_PATH=/etc/searxng/settings.yml

chmod-socket = 660

single-interpreter = true
master = true
lazy-apps = true
enable-threads = true

module = searx.webapp
virtualenv = /home/_lycos/searx
pythonpath = /home/_lycos/searxng

socket = 127.0.0.1:8888
buffer-size = 32768

#static-map = /static=/home/_lycos/searxng/searx/static
static-expires = /* 31557600
static-gzip-all = True
offload-threads = %k

```

**Comment** from [karolyi](https://git.ksol.io/karolyi) in the [VT100 community channel](/contact/#xmpp):

>
>
> use cheaper algo that can bring your workers down to 0 to spare resources when it’s not used. comes with a slower initial startup though, after not being used for a while:
>
>
>
> ```
> # set cheaper algorithm to use, if not set default will be used
> cheaper-algo = spare
> # minimum number of workers to keep at all times
> cheaper = 1
> # number of workers to spawn at startup
> cheaper-initial = 1
> # how many workers should be spawned at a time
> cheaper-step = 1
>
> ```
>
>
>
> this is set to keep 1 worker. it can size up workers on demand
>
>

Next, we create the file `/etc/rc.d/searxng` with the following content:

```
#!/bin/ksh

daemon="/home/_lycos/searx/bin/uwsgi"
daemon_flags="--ini /etc/uwsgi/searxng.ini --daemonize2 1"
daemon_user="_lycos"

. /etc/rc.d/rc.subr

rc_reload=NO

rc_cmd $1

```

This way we can use `rcctl` to enable and run *uWSGI* by issuing the following commands:

```
lycos# chmod +x /etc/rc.d/searxng
lycos# rcctl enable searxng
lycos# rcctl start searxng

```

**Info:** In case the startup should fail, it is always possible to `doas -l _lycos -` and start *uWSGI* manually to see what the issue might be:

```
/home/_lycos/searx/bin/uwsgi --ini /etc/uwsgi/searxng.ini

```

### *Nginx* ###

For serving the Python web application we use *Nginx*. Therefor, we create `/etc/nginx/searxng.vhost` with the following content:

```
server {
  listen 80;
  listen [::]:80;
  server_name lycos.lol;

  root /dev/null/;

  location /.well-known/acme-challenge/ {
  default_type "text/plain";
  rewrite ^/.well-known/acme-challenge/(.*) /$1 break;
  root     /var/www/acme;
  }

  location / {
  return 301 https://$host$request_uri;
  }
}

server {
  http2 on;
  listen 443 ssl;
  listen [::]:443 ssl;

  http3 on;
  listen 443 quic reuseport;
  listen [::]:443 quic reuseport;

  server_name lycos.lol;

  add_header Alt-Svc 'h3=":443"; ma=86400';

  root /dev/null/;

  if ($request_method !~ ^(GET|HEAD|POST)$ ) {
    return 405;
  }

  add_header X-Frame-Options "SAMEORIGIN";
  add_header X-DNS-Prefetch-Control "off";
  add_header Strict-Transport-Security "max-age=63072000" always;
  add_header X-Content-Type-Options nosniff;
  add_header X-XSS-Protection "1; mode=block";
  add_header X-Robots-Tag none;

  add_header Content-Security-Policy "default-src 'none'; script-src 'self'; style-src 'self' 'unsafe-inline'; form-action 'self'; font-src 'self'; frame-ancestors 'self'; base-uri 'self'; connect-src 'self' https://overpass-api.de; img-src 'self' data: https://*.tile.openstreetmap.org; frame-src https://www.youtube-nocookie.com https://player.vimeo.com https://www.dailymotion.com https://www.deezer.com https://www.mixcloud.com https://w.soundcloud.com https://embed.spotify.com";

  add_header Permissions-Policy "accelerometer=(); ambient-light-sensor=(); autoplay=(); battery=(); camera=(); display-capture=(); encrypted-media=(); fullscreen=(); geolocation=(); gyroscope=(); idle-detection=(); magnetometer=(); microphone=(); midi=(); payment=(); picture-in-picture=(); screen-wake-lock=(); serial=(); usb=(); web-share=(); xr-spatial-tracking=(); clipboard-read=(); clipboard-write=(); gamepad=(); speaker-selection=()";
  add_header Feature-Policy "accelerometer 'none'; ambient-light-sensor 'none'; autoplay 'none'; battery 'none'; camera 'none'; display-capture 'none'; encrypted-media 'none'; fullscreen 'none'; geolocation 'none'; gyroscope 'none'; idle-detection 'none'; magnetometer 'none'; microphone 'none'; midi 'none'; payment 'none'; picture-in-picture 'none'; screen-wake-lock 'none'; serial 'none'; usb 'none'; web-share 'none'; xr-spatial-tracking 'none'; clipboard-read 'none'; clipboard-write 'none'; gamepad 'none'; speaker-selection 'none'";

  ssl_certificate /etc/ssl/lycos.lol.pem;
  ssl_certificate_key /etc/ssl/private/lycos.lol.key;
  ssl_protocols TLSv1.1 TLSv1.2 TLSv1.3;
  ssl_prefer_server_ciphers on;
  ssl_ciphers "EECDH+AESGCM:EDH+AESGCM:AES256+EECDH:AES256+EDH";

  location / {
    proxy_buffering off;
    include uwsgi_params;
    uwsgi_pass 127.0.0.1:8888;
    uwsgi_buffering off;

    uwsgi_param  HTTP_HOST             $host;
    uwsgi_param  HTTP_CONNECTION       $http_connection;
    uwsgi_param  HTTP_X_SCHEME         $scheme;
    uwsgi_param  HTTP_X_REAL_IP        $remote_addr;
    uwsgi_param  HTTP_X_FORWARDED_FOR  $proxy_add_x_forwarded_for;
  }

  location /static/ {
    gzip_static on;
    alias /var/www/static/;
  }
}

```

**Note:** In order to not serve the static files through *uWSGI* we instruct Nginx to server them. However, because Nginx is running under a different user/group, we will need to `rsync -avH /home/_lycos/searxng/searx/static/. /var/www/static/` for this to work.

You are free to adjust this to your needs, however.

We include this file in our main `/etc/nginx/nginx.conf` configuration:

```
http {
  ...
  include /etc/nginx/searxng.vhost;
  ...
}

```

**Note:** I’m not going to dive into the repetitive SSL setup, but you can find [plenty other write-ups](/tag/openbsd) on this site that explain how to configure it on OpenBSD.

Next, we enable *Nginx* and start it:

```
lycos# rcctl enable nginx
lycos# rcctl start nginx

```

You should be able to access your *SearXNG* instance by navigating to `https://<your-domain>` in a browser.

### Troubleshooting ###

In case you encounter issues with the semaphores required for interprocess communication within *uWSGI*, make sure to check [the `kern.seminfo.*` settings][sminfo] and increase specifically the [`kern.seminfo.semmni`](https://man.openbsd.org/sysctl.2#KERN_SEMINFO_SEMMNI~2) parameter, e.g. by adding the following line to `/etc/sysctl.conf`:

```
kern.seminfo.semmni=100

```

Summary
----------

As can be seen, setting up a *SearXNG* instance on OpenBSD is fairly easy and doesn’t require much work. However, configuring it to your liking so that you can get the search results you’re interested in is going to require more effort and time. Especially the `hostnames` plugin is likely something that will evolve over time, the more you’ll use the search engine.

At this point, however, you’re ready to enjoy your self-hosted, privacy-respecting *metasearch* engine based upon *SearXNG*! :-)

---

PS: *A cautionary tale*
----------

I had registered the domain `lycos.lol` for this closed-access *SearXNG* instance. However, a day after the domain became active, *NIC.LOL* set the domain status to `serverHold`. I asked [*Njalla*](/infrastructure/#domains), my registrar, if they would know more and their reply was:

>
>
> Right now the domain in question has the status code “serverHold”.
>
>
>
> serverHold is a status code set by the registry (the one that manage the whole TLD) and that means they have suspended the domain name because the domain violated their terms or rules.
>
>

Upon further investigation, it became clear that the domain was falsely flagged by [everyone’s favorite](https://lwn.net/Articles/987566/) [tax-haven-based](<https://www.spamhaus.org/privacy-notice/#:~:text=Spamhaus Project SLU, Address: C. Prat de la Creu, 59-65, Esc D, 5, AD500 Andorra la Vella, Andorra>) internet bully, *Spamhaus*. After all, when the domain was dropped globally the only thing that was visible on the domain’s Nginx was an empty page. The domain also didn’t have (and still hasn’t) any MX records configured.

I reached out to *Spamhaus* who replied with the following message:

>
>
> Thank you for contacting the Spamhaus Ticketing system,
>
>
>
> It appears that this ticket was submitted using a disposable or temporary email address; because of this, we cannot confirm its authority. To ensure that we can help you, please do not use a temporary email address (this includes freemails such as gmail.com, hotmail.com, etc) and ensure that the ticket contains the following:
>
>
>
> * Information that makes clear the requestor’s authority over the domain or IP
> * Details on how the issue(s) have been addressed
> * Reference any other Spamhaus removal ticket numbers related to this case
>
>
>
> When these issues have been resolved, another ticket may be opened to request removal.
>
>
>
> –  
>  Regards,  
>  Marvin Adams  
>  The Spamhaus Project
>
>

*Spamhaus* flagged the domain I just purchased, which I could have used for sending email. Upon contacting them, they then closed my ticket because I was using a temporary email address instead of, let’s say, my own *lycos.lol* domain. And even though it was a free or temporary email that I had sent the email from, I thought it was my domain registrar’s responsibility to handle KYC, not *Spamhaus*’s.

I’ve always known that *Spamhaus* is an [incompetent and corrupt](https://news.ycombinator.com/item?id=3408407) organization, but I didn’t fully realize how mentally challenged they are until now.

Also, shoutout to *NIC.LOL* for happily taking my cash without providing any support in this matter whatsoever. This serves as a harsh reminder that the **once fun place we called the internet is dead** and that everything these days is controlled by corporations which you’re always at the mercy of. It also highlights how misleading and inaccurate some popular posts on sites like *Hacker News* can be, e.g. [“Become unbannable from your email”](https://news.ycombinator.com/item?id=45509243). They’re not just lacking in detail but they’re obviously wrong with the *unbannable* part.

After some back-and-forth, I managed to get `lycos.lol` back online and set up the SearXNG instance. The instance will be available to members of the [community channel](/contact/#xmpp). Additionally, [I’ve taken further steps](https://bsky.app/profile/xn--gckvb8fzb.com/post/3m4xelctkgk2t) to protect this website from future hostility by Spamhaus: Say hello to `xn--gckvb8fzb.cc`! More on that in a future [status update](/collection/updates/).

**Footnote:** The artwork was generated using AI and further botched by me using the [*greatest image manipulation program*](https://www.gimp.org). [Learn why](/on-generative-ai-imagery/).