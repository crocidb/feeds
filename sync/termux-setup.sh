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

echo ""
echo "[setup] Starting the WebDAV server..."
exec "$(dirname "$0")/termux-start.sh"
