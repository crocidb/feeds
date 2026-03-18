#!/bin/sh
# Client-side sync helper for bulletty feeds.
#
# Usage:
#   sync.sh before   — pull from server before opening bulletty
#   sync.sh after    — push to server after closing bulletty
#
# Configuration (set in your shell profile or .env):
#   FEEDS_HOST        WebDAV server URL, e.g. http://myhost:8080
#   FEEDS_USER        WebDAV username (default: admin)
#   FEEDS_PASS        WebDAV password (plain text; rclone will obscure it)
#   FEEDS_LOCAL_DIR   Local feeds directory (default: ~/feeds)
#
# To change hosts (e.g. migrate from homelab to VPS), just update FEEDS_HOST.

FEEDS_HOST="${FEEDS_HOST:-http://localhost:8080}"
FEEDS_USER="${FEEDS_USER:-admin}"
FEEDS_PASS="${FEEDS_PASS:-changeme}"
FEEDS_LOCAL_DIR="${FEEDS_LOCAL_DIR:-$HOME/feeds}"

if [ -z "$1" ]; then
    echo "Usage: sync.sh <before|after>"
    exit 1
fi

# Build an obscured password for rclone (avoids plain text in process list)
OBSCURED_PASS=$(rclone obscure "$FEEDS_PASS")

REMOTE=":webdav,url=${FEEDS_HOST},user=${FEEDS_USER},pass=${OBSCURED_PASS}:"

case "$1" in
    before)
        echo "[sync] Pulling from $FEEDS_HOST before opening bulletty..."
        rclone bisync "$FEEDS_LOCAL_DIR" "$REMOTE" \
            --conflict-resolve newer \
            --resilient \
            --create-empty-src-dirs \
            --log-level INFO
        echo "[sync] Done. You can now open bulletty."
        ;;
    after)
        echo "[sync] Pushing to $FEEDS_HOST after closing bulletty..."
        rclone bisync "$FEEDS_LOCAL_DIR" "$REMOTE" \
            --conflict-resolve newer \
            --resilient \
            --create-empty-src-dirs \
            --log-level INFO
        echo "[sync] Done."
        ;;
    *)
        echo "Unknown command: $1"
        echo "Usage: sync.sh <before|after>"
        exit 1
        ;;
esac
