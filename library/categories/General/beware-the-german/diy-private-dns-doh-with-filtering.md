+++
title = "DIY private DNS (DoH) with filtering"
description = "DIY Private Filtered DNSCreate your own secure DNS server with filtering capabilities  NextDNS, eat your heart outThis tutorial will guide you through setting up a private DNS server using Caddy and AdGuard Home. You'll create a se"
date = "2026-03-22T00:00:00Z"
url = "https://igerman.cc/blog/free-nextdns/"
author = "german s."
text = ""
lastupdated = "2026-06-08T12:43:31.127556678Z"
seen = false
+++

DIY Private Filtered DNS[#](#diy-private-filtered-dns)
==========

>
>
> Create your own secure DNS server with filtering capabilities  
>  NextDNS, eat your heart out
>
>

This tutorial will guide you through setting up a private DNS server using Caddy and AdGuard Home. You'll create a secure, encrypted personal DNS endpoint with content filtering and authorization that you can use from anywhere in the world.

What you'll get[#](#what-you-ll-get)
----------

* A personal DNS server that blocks ads and unwanted content
* Encrypted DNS connections for privacy
* Access from any modern device that supports DNS-over-HTTPS (DoH)
* Authentication to prevent unauthorized access

Prerequisites[#](#prerequisites)
----------

1. A server (even a free Oracle Cloud instance is sufficient)
2. A domain or subdomain pointed to your server
3. Basic command line and Caddy comfort (or a friend who can help)

Step 1: Install required software[#](#step-1-install-required-software)
----------

1. [Install Caddy](https://caddyserver.com/docs/install#debian-ubuntu-raspbian) web server (this tutorial assumes the default systemd installation)
2. Install AdGuard Home using [their Docker image](https://hub.docker.com/r/adguard/adguardhome) (recommended)
3. Make sure Docker and Docker Compose are installed

Step 2: Configure Docker for AdGuard Home[#](#step-2-configure-docker-for-adguard-home)
----------

Create a `docker-compose.yml` file with the following content:

```
version: "3.3"
services:
  adguardhome:
    container_name: adguardhome
    restart: unless-stopped
    volumes:
      - ./work:/opt/adguardhome/work
      - ./conf:/opt/adguardhome/conf
      - /var/lib/caddy/.local/share/caddy/certificates/acme-v02.api.letsencrypt.org-directory/example.org:/certs
      # ⚠️ IMPORTANT! Replace "example.org" with your actual domain
      # Make sure this directory exists and contains .crt and .key files
    ports:
      - 1234:80/tcp   # Dashboard access
      - 5678:443/tcp  # DNS over HTTPS
      - 5678:443/udp  # DNS over HTTPS
      - 9012:3000/tcp # Initial configuration page
    image: adguard/adguardhome
```

Step 3: Initial AdGuard Home setup[#](#step-3-initial-adguard-home-setup)
----------

1. Start Docker Compose:

   ```
   docker compose up -d
   ```

2. Access the initial setup page at `http://your-server-ip:9012`

3. Complete the setup wizard, creating an admin account and selecting your preferred filtering options

Step 4: Configure AdGuard Home[#](#step-4-configure-adguard-home)
----------

1. Edit the `conf/AdGuardHome.yaml` file to add trusted proxies (for correct client IP display):

   ```
   dns:
     trusted_proxies:
       - 172.16.0.0/12  # Add this line for Docker subnet
       - 127.0.0.0/8
       - ::1/128
   ```

2. In the AdGuard Home dashboard, configure encryption settings:

   * Set server name to your domain (e.g., `example.org`)
   * Set the certificate paths to:
     * `/certs/example.org.crt`
     * `/certs/example.org.key`

   * You can keep the default HTTPS port (443) or change it (update your Docker Compose file if you do)
   * Clear any DNS-over-TLS and QUIC port settings if present
   * Save the settings

Step 5: Configure Caddy as a reverse proxy[#](#step-5-configure-caddy-as-a-reverse-proxy)
----------

Create or edit your Caddyfile:

```
https://example.org {
    # DNS-over-HTTPS format: example.org/your_auth_token/dns-query/[optional_device_id]
    # Example: https://example.org/qwerty1234/dns-query/my-iphone

    vars {
        # Generate a secure token with: openssl rand -hex 32
        auth_token 1611709b3d87afec72b914e8c95e26d3644419d62687567e274ade41456afb02
    }

    @auth_token path /{http.vars.auth_token}*

    handle @auth_token {
        uri strip_prefix /{http.vars.auth_token}
        handle /dns-query* {
            reverse_proxy https://127.0.0.1:5678 {
                transport http {
                    tls_insecure_skip_verify
                }

                # For proper client IP tracking:
                header_up Host {upstream_hostport}
                header_up X-Real-IP {http.request.remote.host}
            }
        }

        handle {
            # Requests with valid token but invalid path
            respond "Invalid request" 400
        }
    }

    handle {
        # Unauthorized requests (including homepage)
        respond "Hello." 403
    }
}
```

Step 6: Activate your configuration[#](#step-6-activate-your-configuration)
----------

1. Reload Caddy to apply the configuration:

   ```
   sudo systemctl reload caddy
   ```

2. Restart AdGuard Home:

   ```
   docker compose restart adguardhome
   ```

Step 7: Using your private DNS[#](#step-7-using-your-private-dns)
----------

On your devices, configure DNS-over-HTTPS with the following URL:

```
https://example.org/your_auth_token/dns-query
```

Where:

* `example.org` is your domain
* `your_auth_token` is the token you set in your Caddyfile
* You can optionally add a device ID at the end: `/dns-query/my-phone`

Troubleshooting[#](#troubleshooting)
----------

* If AdGuard can't access the certificates, check the folder permissions. I run such smaller stuff with [Dockge](https://github.com/louislam/dockge), which runs containers as root
* If DNS isn't working, verify the ports in your Docker Compose file match the ones in your Caddyfile
* Check your domain's DNS settings to make sure it points directly to your server

Now you have your own private, secure, and filtered DNS service that you control completely!