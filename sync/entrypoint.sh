#!/bin/sh
set -e

DATA_DIR="/data"

# Configure git identity (required for commits inside the container)
git config --global user.name "${GIT_USER_NAME:-feeds-sync}"
git config --global user.email "${GIT_USER_EMAIL:-feeds-sync@localhost}"

# Trust the data directory (mounted volume may have different ownership)
git config --global --add safe.directory "$DATA_DIR"

# Pull latest state from GitHub on startup
echo "[entrypoint] Pulling latest state from remote..."
cd "$DATA_DIR"
git pull "${GIT_REMOTE:-origin}" "${GIT_BRANCH:-main}" || {
    echo "[entrypoint] Warning: git pull failed (possibly no network or fresh repo). Continuing."
}

# Start cron daemon in the background
echo "[entrypoint] Starting cron daemon..."
crond -b -l 8

echo "[entrypoint] Starting rclone WebDAV server on :93284..."
exec rclone serve webdav "$DATA_DIR" \
    --addr :93284 \
    --user "${WEBDAV_USER:-admin}" \
    --pass "${WEBDAV_PASS:-changeme}" \
    --vfs-cache-mode full \
    --log-level INFO
