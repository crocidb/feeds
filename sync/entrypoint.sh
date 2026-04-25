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
