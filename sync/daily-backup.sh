#!/bin/sh
# Daily backup: commit any changes in /data and push to GitHub.
# Runs at midnight UTC via cron (registered in Containerfile).

REPO_DIR="/repo"
DATA_DIR="/repo/library"
REMOTE="${GIT_REMOTE:-origin}"
BRANCH="${GIT_BRANCH:-main}"
DATE=$(date -u +%Y-%m-%d)

echo "[daily-backup] Starting backup for $DATE..."

# Ensure GitHub host key is trusted
mkdir -p /root/.ssh
ssh-keyscan github.com >> /root/.ssh/known_hosts 2>/dev/null

cd "$REPO_DIR"

git add -A

# Only commit if there are staged changes
if git diff --cached --quiet; then
    echo "[daily-backup] Nothing to commit. Skipping."
else
    git commit -m "daily backup $DATE"
    echo "[daily-backup] Committed changes."
fi

# Pull first (rebase local commits on top of remote to avoid diverged histories)
if ! git pull --rebase "$REMOTE" "$BRANCH"; then
    echo "[daily-backup] ERROR: git pull --rebase failed. Aborting to avoid push conflict."
    git rebase --abort 2>/dev/null || true
    exit 1
fi

git push "$REMOTE" "$BRANCH" && echo "[daily-backup] Pushed to $REMOTE/$BRANCH." \
    || { echo "[daily-backup] Warning: git push failed."; git remote -v; ssh -T git@github.com; }

echo "[daily-backup] Done."
