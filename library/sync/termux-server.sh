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
