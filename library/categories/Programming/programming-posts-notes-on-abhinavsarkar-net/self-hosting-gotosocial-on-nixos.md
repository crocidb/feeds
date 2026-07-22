+++
title = "Self-hosting GoToSocial on NixOS"
description = "GoToSocial is an ActivityPub server. It is a lightweight alternative to Mastodon, and very suitable for self-hosting single user instances<sup1</sup. Though it does not have all of Mas"
date = "2022-11-20T00:00:00Z"
url = "https://abhinavsarkar.net/notes/2022-gotosocial-on-nixos/"
author = "Abhinav Sarkar"
text = ""
lastupdated = "2026-07-21T09:17:41.572369518Z"
seen = false
+++

[GoToSocial](https://gotosocial.org/) is an [ActivityPub](https://activitypub.rocks/) server. It is a lightweight alternative to [Mastodon](https://joinmastodon.org/), and very suitable for self-hosting single user instances[<sup>1</sup>](#fn1). Though it does not have all of Mastodon’s features (it’s getting there), it is already quite useable.

This post was originally published on [abhinavsarkar.net](https://abhinavsarkar.net/notes/2022-gotosocial-on-nixos/?mtm_campaign=feed).

I decided to self-host GoToSocial on my VPS (which runs [NixOS](https://nixos.org)), pointing to my own domain. So instead of having a fediverse address like *`@abnv@mastodon.social`*, I’d have an address *`@abnv@soc.abnv.me`*[<sup>2</sup>](#fn2).

First, we package GoToSocial for NixOS:

```
{ pkgs }:

let
  pname = "gotosocial";
  version = "0.5.2";
in pkgs.stdenv.mkDerivation {
  inherit pname version;
  src = pkgs.fetchzip {
    url = "https://github.com/superseriousbusiness/${pname}/releases/download/v${version}/${pname}_${version}_linux_amd64.tar.gz";
    sha256 = "sha256-AfHXsQm0NHaqoyv7Jg6LHqzHmuahBiyAqHIBbY6rDJg=";
    stripRoot = false;
  };
  installPhase = ''
    mkdir -p "$out"/bin
    mv gotosocial $out/bin/
    mv web $out/
  '';
}
```

 nix/packages/gotosocial.nix

Next, we write a minimal[<sup>3</sup>](#fn3) NixOS module to run GoToSocial:

```
{ options, lib, config, pkgs, ... }:

let
  serverName = "soc.abnv.me";
  port = 9755;
  userName = "gotosocial";
  serviceName = userName;
  dataDir = "/var/lib/${userName}";
  pkg = import ./nix/packages/gotosocial.nix { inherit pkgs; };
  yaml = pkgs.formats.yaml { };
  configFile = yaml.generate "${serviceName}.yaml" {
    host = serverName;
    bind-address = "localhost";
    port = port;
    db-type = "sqlite";
    db-address = "${dataDir}/data/sqlite.db";
    web-template-base-dir = "${pkg}/web/template/";
    web-asset-base-dir = "${pkg}/web/assets/";
    accounts-registration-open = false;
    storage-local-base-path = "${dataDir}/media";
  };
  serviceConfig = config.services."${serverName}";
  options = { enable = lib.mkEnableOption "${serverName} service"; };
in {
  options.services.${serverName} = options;
  config = lib.mkIf serviceConfig.enable {
    users.users.${userName} = {
      isSystemUser = true;
      group = userName;
      createHome = true;
      home = dataDir;
    };
    users.groups.${userName} = { };

    systemd.tmpfiles.rules = [
      "d ${dataDir}/data 1770 ${userName} ${userName}"
      "d ${dataDir}/media 1770 ${userName} ${userName}"
    ];

    systemd.services.${serviceName} = {
      enable = true;
      description = "${serviceName} service";
      restartIfChanged = true;
      restartTriggers = [ configFile pkg ];
      wantedBy = [ "multi-user.target" ];
      serviceConfig = {
        User = userName;
        Group = userName;
        WorkingDirectory = dataDir;
        ExecStart = "${pkg}/bin/gotosocial --config-path ${configFile} server start";
      };
    };

    services.nginx.virtualHosts.${serverName} = {
      forceSSL = true;
      enableACME = true;
      locations."/" = {
        proxyPass = "http://127.0.0.1:${port}";
        extraConfig = ''
          proxy_set_header Upgrade $http_upgrade;
          proxy_set_header Connection $connection_upgrade;
        '';
      };
      extraConfig = ''
        client_max_body_size 40M;
      '';
    };
  };
}
```

First, we set up a user and a group for GoToSocial, and the directories for data and uploaded media. Then, we create the config file. We are using [SQLite](https://www.sqlite.org/) as the database here[<sup>4</sup>](#fn4). Next, we set up a [Systemd](https://systemd.io/) service to run the GoToSocial binary with the created config file. Finally, we set up an [Nginx](https://nginx.org/) virtual host to proxy requests to the GoToSocial process.

When we import and enable this module in our NixOS configuration, we have a self-hosted GoToSocial instance running. I have mine at [soc.abnv.me](https://soc.abnv.me), and you can follow me at [*`@abnv@abnv.me`*](https://soc.abnv.me/@abnv).

That’s it for now. Happy #twittermigration.

 If you have any questions or comments, please leave a comment below. If you liked this post, please share it. Thanks for reading!

---

1. GoToSocial provides only the backend server. You’ll need a frontend as well. [Pinafore](https://pinafore.social/) on web, or [Tusky](https://tusky.app/) on Android work well.[↩︎](#fnref1)

2. It is also possible to have an address like `@abnv@abnv.me` with some [extra configuration](https://docs.gotosocial.org/en/latest/advanced/host-account-domain/).[↩︎](#fnref2)

3. There are couple of ways we can improve this module:

   * By adding [sandboxing](https://www.digitalocean.com/community/tutorials/how-to-sandbox-processes-with-systemd-on-ubuntu-20-04) for the GoToSocial process.
   * By adding [automatic restarts](https://www.freedesktop.org/software/systemd/man/systemd.service.html#Restart=) on failures.
   * By adding a separate route in Nginx for better caching of public assets.

   [↩︎](#fnref3)
4. GoToSocial also supports [PostgreSQL](https://www.postgresql.org/).[↩︎](#fnref4)

---

Thanks for reading this post via feed. Feeds are great, and you're great for using them. ♥

This post was originally published on [abhinavsarkar.net](https://abhinavsarkar.net/notes/2022-gotosocial-on-nixos/?mtm_campaign=feed).

### Like, repost, or comment on: ###

* [Fediverse](https://fantastic.earth/@abnv/110396110265909682)
* [Lobsters](https://lobste.rs/s/lfyi9e)
* [Reddit](https://www.reddit.com/r/NixOS/comments/z077gc/)
* [My website](https://abhinavsarkar.net/notes/2022-gotosocial-on-nixos/?mtm_campaign=feed#comment-container)

Read more of my [posts](https://abhinavsarkar.net/posts/) and [notes](https://abhinavsarkar.net/notes/).

![](https://anna.abhinavsarkar.net/matomo.php?idsite=1&rec=1)