#!/data/data/com.termux/files/usr/bin/sh
# Starts the WebDAV sync server inside the Alpine proot.
# Edit the env vars below or export them before running.

set -e

ALPINE="alpine"
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
