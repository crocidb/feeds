FEEDS_HOST="${FEEDS_HOST:-http://maelle:23284}"
FEEDS_USER="${FEEDS_USER:-admin}"
FEEDS_PASS="${FEEDS_PASS:-changeme}"
FEEDS_LOCAL_DIR="${FEEDS_LOCAL_DIR:-$PWD}"

# Build an obscured password for rclone (avoids plain text in process list)
OBSCURED_PASS=$(rclone obscure "$FEEDS_PASS")

REMOTE=":webdav:"
RCLONE_OPTS="--webdav-url=${FEEDS_HOST} --webdav-user=${FEEDS_USER} --webdav-pass=${OBSCURED_PASS}"

# Detect if this is the first run (no bisync listings exist yet)
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
