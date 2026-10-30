# Feeds Sync

Syncs the bulletty feed library: serves it over WebDAV (port 23284) and
backs it up to git daily. Runs as a **rootless Podman container** managed by
systemd (Quadlet), so it starts automatically at boot.

## How it works

- `~/.config/containers/systemd/feeds-sync.container` — Quadlet definition
  (image, port, volumes, env vars). systemd generates `feeds-sync.service` from it.
- Lingering is enabled for the user (`loginctl enable-linger crocidb`), so the
  service starts at boot without login.
- `podman-compose.yml` is kept only as a convenient way to rebuild the image.

## Useful commands

```bash
# check status
systemctl --user status feeds-sync

# follow logs
journalctl --user -u feeds-sync -f

# restart
systemctl --user restart feeds-sync

# stop the container (it will NOT restart on its own after this)
systemctl --user stop feeds-sync

# start it again
systemctl --user start feeds-sync

# stop it permanently (survives reboots: disable + stop)
systemctl --user disable --now feeds-sync

# re-enable autostart at boot
systemctl --user enable --now feeds-sync
```

## Rebuilding the image

After changing `Containerfile`, `entrypoint.sh`, or scripts:

```bash
podman-compose build
systemctl --user restart feeds-sync
```

## Changing configuration

Edit env vars (`WEBDAV_USER`, `WEBDAV_PASS`, `GIT_*`) or ports/volumes in
`~/.config/containers/systemd/feeds-sync.container`, then:

```bash
systemctl --user daemon-reload
systemctl --user restart feeds-sync
```
