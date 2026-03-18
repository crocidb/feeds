#!/bin/sh
# Client-side sync helper for bulletty feeds.
#
# Usage:
#   sync.sh
#
# Configuration (set in your shell profile or .env):
#   FEEDS_HOST        WebDAV server URL, e.g. http://myhost:8080
#   FEEDS_USER        WebDAV username (default: admin)
#   FEEDS_PASS        WebDAV password (plain text; rclone will obscure it)
#   FEEDS_LOCAL_DIR   Local feeds directory (default: $PWD)
#
# To change hosts (e.g. migrate from homelab to VPS), just update FEEDS_HOST.

FEEDS_HOST="${FEEDS_HOST:-http://localhost:23284}"
FEEDS_USER="${FEEDS_USER:-admin}"
FEEDS_PASS="${FEEDS_PASS:-changeme}"
FEEDS_LOCAL_DIR="${FEEDS_LOCAL_DIR:-$PWD}"

# Build an obscured password for rclone (avoids plain text in process list)
OBSCURED_PASS=$(rclone obscure "$FEEDS_PASS")

REMOTE=":webdav:"
RCLONE_OPTS="--webdav-url=${FEEDS_HOST} --webdav-user=${FEEDS_USER} --webdav-pass=${OBSCURED_PASS}"

# Detect if this is the first run (no bisync listings exist yet)
BISYNC_CACHE_DIR="${HOME}/.cache/rclone/bisync"
if ! ls "${BISYNC_CACHE_DIR}"/*webdav*.lst 2>/dev/null | grep -q .; then
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
