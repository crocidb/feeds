+++
title = "A local-first sync setup for a markdown-based feed reader"
description = "I’ve been using Obsidian extensively lately, with several different vaults and they’re all git repositories. That means I can sync them on any computer I use, and by having revisions I can go back to the previous state of any note or draft, keeping the whole history of it. I can "
date = "2026-04-26T00:00:00Z"
url = "https://crocidb.com/post/a-local-first-sync-setup-for-a-markdown-based-feed-reader/"
author = "Bruno Croci"
text = ""
lastupdated = "2026-04-27T12:43:09.923890361Z"
seen = true
+++

I’ve been using Obsidian extensively lately, with several different vaults and they’re all git repositories. That means I can sync them on any computer I use, and by having revisions I can go back to the previous state of any note or draft, keeping the whole history of it. I can even sync it with my phone and edit notes on the go at any moment without having to pay an external sync service. That’s where I drew inspiration for my feed reader, **bulletty**. After the days of **Google Reader** and the recent concerns about privacy and the rise of self-hosting solutions, it was just natural that I needed a local solution for following the sites and blogs that I like.

[**bulletty**](https://github.com/crocidb/bulletty) is a TUI feed reader/aggregator that stores all the feed articles as local markdown files. Very inspired by how Obsidian deals with its vaults, literally just a bunch of text files and a system that “integrates” them together. Reminiscent of the UNIX philosophy, if you think about it. A *bulletty library* is basically this filesystem structure:

```
library/
  | .appearance.toml
  | .later.toml
  | categories/
    | General/
      | website-feed/
        | .feed.toml
        | feed-article1.md
        | feed-article2.md
      | another-site/
        | .feed.toml
        | foo-bar.md
        | ...
    | Another Category/
      | ...

```

`.appearance.toml` stores information about theme and UI customizations and `.later.toml` stores the list added to the **Read Later** category. Each `.feed.toml` contains the basic info about the feed such as title, description, url, and last time it was updated. For example, this is my own blog feed in my library:

```
title = "Bruno Croci"
description = "Bruno Croci"
url = "https://crocidb.com/index.xml"
feed_url = "https://crocidb.com/index.xml"
author = "Bruno Croci"
slug = "bruno-croci"
lastupdated = "2026-03-26T10:38:57.253789604Z"

```

The markdown files also contain a bit of metadata, including a property `seen`, which indicates whether the article has ever been opened.

Everything is text. So it’s really convenient to sync as a git repository. All I have to do is **(1)** pull before opening bulletty, then **(2)** commit and **(3)** push after every session. Since I have 4 different systems I use weekly, now I can sync all my feed activity with some help from GitHub to store it for me. I’ve been daily-driving this for around 8 months. But there were some issues.

See, when you have tens of subscriptions, including prolific news sites, you can get over a hundred files changed on each session. Think that all the `.feed.toml` files will change the `lastupdated` value. All the new articles downloaded from each feed source, plus at least one change to the articles that were already there, but you read this session. If you add or remove something from the read later category? Another change. If I missed one of the sync steps, I’d have to deal with some conflicts, which is very annoying when you’re dealing with this amount of data. I also hated coming up with commit messages every time.

Turns out it makes a lot of sense to create commits/revisions for Obsidian vault changes, but not really for feed articles. It was time to think of a better solution.

Automatic File Sync
----------

For such an amount of files, I thought that having an automatic file sync would be better. Something like `rsync`. And I can’t just use any storage services, as it kind of defeats the purpose, it should be local-first. So I came up with the idea of creating a container that hosts a file syncing service that I could deploy in any of my computers within my Tailscale network so that I could access it from anywhere. That container would also be backing up once a day to the remote git server.

![All the nodes are within a Tailscale network, so they can access each other with a simple MagicDNS node name](images/sync.gif)

All the nodes are within a Tailscale network, so they can access each other with a simple MagicDNS node name

Let’s try to understand how to sync files within a local network. I’ve only had experience with `scp`, basically “copy over ssh” and `rsync` a more robust “copy over ssh”, as in: don’t copy if the file is already there. The problem with `rsync` is that it’s a one way solution. It will only sync the directory from A to B. Or B to A, but you get the point. We need a two way synchronization system.

After some quick research, I found out about [Syncthing](https://docs.syncthing.net/intro/getting-started.html) and [rclone](https://rclone.org/). Both free open source software. Syncthing seemed too much for what I needed. It offers a web interface to manage the sync data, and I wanted something more similar to `rsync`. `rclone`, on the other hand, has a subcommand called `bisync` that synchronizes two different directories **bidirectionally**. It also supports several protocols and can sync with cloud services too.

`bisync` is a command that is run in the client, but it needs a server.

Server Container
----------

The command to serve a whole directory for `bisync` with `rclone` using [WebDAV](https://en.wikipedia.org/wiki/WebDAV) (file sharing through HTTP) is quite simple:

```
rclone serve webdav /dir/to/share \
    --addr :23284 \
    --user my-user \
    --pass my-password \

```

But first we need a container with `rclone`, `ssh` and `git`. `rclone` already offers a Docker image based on Alpine Linux. Good, so the concept is:

* put up a Podman container
* container has access to a local **library** git repo
* container starts an `rclone` WebDAV server for that library (entrypoint)
* container exposes WebDAV server port
* container sets a cron job to sync with the remote git repo once a day (daily backup)

Repository Setup
----------

First, I set my repository up as basically two directories in the base:

![The feed library and the sync code](images/Pastedimage20260426154201.png)

The feed library and the sync code

The `library` is the raw **bulletty** library, exactly as I described earlier. The `sync/` directory contains all the important code to sync that library. I’ll explain how it works, but in a simplified way. If you want to check the full code for what I’ve been daily-driving, check the [github repo](https://github.com/crocidb/feeds).

Starting with a `podman-compose.yml`, the file that tells podman what our container does and what it needs:

```
version: "3.8"

services:
  feeds-sync:
    build:
      context: .
      dockerfile: Containerfile
    ports:
	  # the port that our WebDAV server will run
      - "23284:23284"
    volumes:
      # bind mount all the feed directory to the container
      - ../:/repo
      # ssh key backup the feed data to github (read-only)
      - ~/.ssh:/root/.ssh:ro
    restart: unless-stopped

```

Then the `Containerfile`, which basically starts the server and the backup service:

```
FROM docker.io/rclone/rclone:latest

# install git, openssh, and cronie (cron daemon)
RUN apk add --no-cache git openssh-client cronie

# register daily backup cron job
RUN echo "0 0 * * * /repo/sync/daily-backup.sh >> /var/log/daily-backup.log 2>&1" \
    | crontab -

EXPOSE 23284

ENTRYPOINT ["/repo/sync/entrypoint.sh"]

```

The `entrypoint.sh` is:

```
#!/bin/sh
set -e

REPO_DIR="/repo"
DATA_DIR="/repo/library"

# configure git identity (required for commits inside the container)
git config --global user.name "${GIT_USER_NAME:-feeds-sync}"
git config --global user.email "${GIT_USER_EMAIL:-feeds-sync@localhost}"

# trust the data directory (mounted volume may have different ownership)
git config --global --add safe.directory "$REPO_DIR"

# start cron daemon in the background
echo "[entrypoint] Starting cron daemon..."
crond &

# syncing with git at first
/daily-backup.sh

echo "[entrypoint] Starting rclone WebDAV server on :23284..."
exec rclone serve webdav "$DATA_DIR" \
    --addr :23284 \
    --user "${WEBDAV_USER:-admin}" \
    --pass "${WEBDAV_PASS:-changeme}" \
    --vfs-cache-mode full \
    --log-level INFO

```

It basically sets up the git user/email globally within the container, then does a first backup by invoking `daily-backup.sh`, then starts the **WebDAV** server with `rclone`.

Then `daily-backup.sh` will basically pull and push (resolving conflicts with the remote data):

```
#!/bin/sh
REPO_DIR="/repo"
DATA_DIR="/repo/library"
REMOTE="${GIT_REMOTE:-origin}"
BRANCH="${GIT_BRANCH:-main}"
DATE=$(date -u +%Y-%m-%d)

echo "[daily-backup] Starting backup for $DATE..."

# ensure GitHub host key is trusted
mkdir -p /root/.ssh
ssh-keyscan github.com >> /root/.ssh/known_hosts 2>/dev/null

cd "$REPO_DIR"

git add -A

# only commit if there are staged changes
if git diff --cached --quiet; then
    echo "[daily-backup] Nothing to commit. Skipping."
else
    git commit -m "daily backup $DATE"
    echo "[daily-backup] Committed changes."
fi

# pull first (rebase local commits on top of remote to avoid diverged histories)
if ! git pull --rebase -X theirs "$REMOTE" "$BRANCH"; then
    echo "[daily-backup] ERROR: git pull --rebase failed. Aborting to avoid push conflict."
    git rebase --abort 2>/dev/null || true
    exit 1
fi

git push "$REMOTE" "$BRANCH" && echo "[daily-backup] Pushed to $REMOTE/$BRANCH." \
    || { echo "[daily-backup] Warning: git push failed."; git remote -v; ssh -T git@github.com; }

echo "[daily-backup] Done."

```

That’s all I need to start the syncing server in any of my computers in my network:

```
podman-compose up

```

Syncing on the Client
----------

Now I just have to sync my feeds on my clients before **and** after opening bulletty. The sync script is:

```
#!/bin/sh
FEEDS_HOST="${FEEDS_HOST:-http://localhost:23284}"
FEEDS_USER="${FEEDS_USER:-admin}"
FEEDS_PASS="${FEEDS_PASS:-changeme}"

FEEDS_LOCAL_DIR="${bulletty dirs library}"
OBSCURED_PASS=$(rclone obscure "$FEEDS_PASS")

REMOTE=":webdav:"
RCLONE_OPTS="--webdav-url=${FEEDS_HOST} --webdav-user=${FEEDS_USER} --webdav-pass=${OBSCURED_PASS}"

# detect if this is the first run (no bisync listings exist yet)
BISYNC_CACHE_DIR="${HOME}/.cache/rclone/bisync"
LOCAL_DIR_ENCODED=$(echo "$FEEDS_LOCAL_DIR" | sed 's|/|-|g')
if ! ls "${BISYNC_CACHE_DIR}"/*${LOCAL_DIR_ENCODED}*.lst 2>/dev/null | grep -q .; then
    echo "[sync] First run detected — performing initial resync..."
    RESYNC_FLAG="--resync"
else
    RESYNC_FLAG=""
fi

echo "[sync] Syncing with $FEEDS_HOST..."
rclone bisync "$FEEDS_LOCAL_DIR" "$REMOTE" \
    $RCLONE_OPTS \
    $RESYNC_FLAG \
    --conflict-resolve newer \
    --resilient \
    --create-empty-src-dirs \
    --log-level INFO
echo "[sync] Done."

```

This script will initialize the `bisync` connection with `FEEDS_HOST`, which is the host in my Tailscale network that is running the server, then sync with it!

Of course it’s a pain to manually run this script every time I want to read my feeds. So I implemented some hooks in bulletty for when the TUI starts and when it ends. If you go to `bulletty dirs local-config`:

```
cd $(bulletty dirs local-config)

```

In it, there’s the `config.toml` file, the local file (that is not synced with the library) that actually tells the program where the library is. Now, it also lets you set hooks for some actions:

```
datapath = "/home/crocidb/.local/share/bulletty"

[hooks]
before_tui = "/home/crocidb/.config/bulletty/sync.sh"
after_tui = "/home/crocidb/.config/bulletty/sync.sh"

```

Now it tells **bulletty** to run `sync.sh` when opening and closing!

If I deploy my syncing service in any other node in my network, all I need to do is set `FEEDS_HOST` on my shell, or edit my local sync script. Check out how that works:

**IMPORTANT:** These hooks are not present in the last version of bulletty, as of the writing of this post (v0.2.2). It’s still on the main branch though.

Running the Server on an Old Android Phone
----------

I have a couple of old Android phones that I don’t use and I’m looking to put them to some use. Sometimes we forget, but they are powerful machines that are locked by corporate practices. This **Galaxy S20+** here is at least twice as powerful as a Raspberry Pi 5, but I can’t use it the way I want. However, there *is* a way to make it useful right now and that’s using **Termux**.

![My old Samsung phone serving a syncing device for my feed data](images/Pastedimage20260425154817.png)

My old Samsung phone serving a syncing device for my feed data

Termux basically creates a whole Linux environment and a shell that can be used on Android. It’s not as good as actually just running the whole system in the hardware, but that’s what we have for now. And for what it is, it’s actually really easy to set up.

It doesn’t support containers, not in the sense of Docker. But it does support [proot](https://wiki.termux.com/wiki/PRoot), a user-space implementation of `chroot`, aka the containers before containers were cool. And with [proot-distro](https://github.com/termux/proot-distro#functionality-overview), we can install *isolated environments* based on several distributions.

So I also ported my syncing service to it:

```
#!/data/data/com.termux/files/usr/bin/sh
set -e

ALPINE="alpine"
REPO_DIR="$(cd "$(dirname "$0")/.." && pwd)"

echo "[setup] Repo directory: $REPO_DIR"

# ensure proot-distro is installed
if ! command -v proot-distro > /dev/null 2>&1; then
    echo "[setup] Installing proot-distro..."
    pkg install -y proot-distro
fi

# install Alpine if not already present
if ! proot-distro list | grep -q "^$ALPINE.*installed"; then
    echo "[setup] Installing Alpine Linux..."
    proot-distro install "$ALPINE"
else
    echo "[setup] Alpine already installed."
fi

# install packages inside Alpine
echo "[setup] Installing packages in Alpine (rclone git openssh-client cronie)..."
proot-distro login "$ALPINE" -- sh -c "
    apk update && apk add --no-cache rclone git openssh-client cronie
"

# register cron job inside Alpine
echo "[setup] Registering daily backup cron job in Alpine..."
proot-distro login "$ALPINE" -- sh -c "
    echo '0 0 * * * /repo/sync/daily-backup.sh >> /var/log/daily-backup.log 2>&1' | crontab -
"

# run the server
echo ""
echo "[setup] Starting the WebDAV server..."

REPO_DIR="$(cd "$(dirname "$0")/.." && pwd)"

export GIT_USER_NAME="${GIT_USER_NAME:-feeds-sync}"
export GIT_USER_EMAIL="${GIT_USER_EMAIL:-feeds-sync@localhost}"
export GIT_REMOTE="${GIT_REMOTE:-origin}"
export GIT_BRANCH="${GIT_BRANCH:-main}"
export WEBDAV_USER="${WEBDAV_USER:-admin}"
export WEBDAV_PASS="${WEBDAV_PASS:-changeme}"

exec proot-distro login "$ALPINE" \
    --bind "$REPO_DIR:/repo" \
    --bind "$HOME/.ssh:/root/.ssh" \
    -- sh -c "
        export GIT_USER_NAME='$GIT_USER_NAME'
        export GIT_USER_EMAIL='$GIT_USER_EMAIL'
        export GIT_REMOTE='$GIT_REMOTE'
        export GIT_BRANCH='$GIT_BRANCH'
        export WEBDAV_USER='$WEBDAV_USER'
        export WEBDAV_PASS='$WEBDAV_PASS'
        exec /repo/sync/entrypoint.sh
    "

```

This will basically create a new proot with **Alpine Linux**, install the necessary software (git, rclone, cronie, etc), then start the server in it.

With that, I just need to make sure my phone is on, is on the Tailscale network and has Termux open, with `sshd` running. In all my nodes, I just have to set the name of the phone node in `FEEDS_HOST` in my `sync.sh` script and it will sync from it.

Conclusion
----------

I’ve been daily-driving this new sync setup for a few months now and it’s really satisfying to see it working well. Of course, it’s not without issues. Sometimes I notice that it doesn’t sync some small changes like the state of an article from *unread* to *read*, but so far it hasn’t been a problem for me. In general, I feel like it’s the best feed-reading experience I’ve had.

With upcoming features to bulletty such as deleting feed articles, as well as adding highlights and notes to them, I’ll put this to a better test, since there will be way more changes to the article files.