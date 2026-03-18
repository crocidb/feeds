#!/bin/sh
# Daily backup: commit any changes in /data and push to GitHub.
# Runs at midnight UTC via cron (registered in Containerfile).

DATA_DIR="/data"
REMOTE="${GIT_REMOTE:-origin}"
BRANCH="${GIT_BRANCH:-main}"
DATE=$(date -u +%Y-%m-%d)

echo "[daily-backup] Starting backup for $DATE..."

cd "$DATA_DIR"

# Pull first to incorporate any remote changes before committing
git pull "$REMOTE" "$BRANCH" || echo "[daily-backup] Warning: git pull failed."

git add -A

# Only commit if there are staged changes
if git diff --cached --quiet; then
    echo "[daily-backup] Nothing to commit. Skipping."
else
    git commit -m "daily backup $DATE"
    echo "[daily-backup] Committed changes."
fi

git push "$REMOTE" "$BRANCH" && echo "[daily-backup] Pushed to $REMOTE/$BRANCH." \
    || echo "[daily-backup] Warning: git push failed."

echo "[daily-backup] Done."
