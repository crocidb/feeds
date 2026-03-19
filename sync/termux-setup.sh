#!/data/data/com.termux/files/usr/bin/sh
# termux-setup.sh
# Provisions an Alpine proot-distro environment equivalent to the Containerfile.
# Run once from Termux to set up; use termux-start.sh afterwards to launch.

set -e

ALPINE="alpine"
REPO_DIR="$(cd "$(dirname "$0")/.." && pwd)"
SCRIPTS_DIR="$(cd "$(dirname "$0")" && pwd)"
ALPINE_ROOT="$PREFIX/var/lib/proot-distro/installed-rootfs/$ALPINE"

echo "[setup] Repo directory: $REPO_DIR"

# --- 1. Ensure proot-distro is installed ---
if ! command -v proot-distro > /dev/null 2>&1; then
    echo "[setup] Installing proot-distro..."
    pkg install -y proot-distro
fi

# --- 2. Install Alpine if not already present ---
if ! proot-distro list | grep -q "^$ALPINE.*installed"; then
    echo "[setup] Installing Alpine Linux..."
    proot-distro install "$ALPINE"
else
    echo "[setup] Alpine already installed."
fi

# --- 3. Install packages inside Alpine (equivalent to Containerfile RUN apk add) ---
echo "[setup] Installing packages in Alpine (rclone git openssh-client cronie)..."
proot-distro login "$ALPINE" -- sh -c "
    apk update && apk add --no-cache rclone git openssh-client cronie
"

# --- 4. Copy scripts into Alpine (equivalent to Containerfile COPY) ---
echo "[setup] Copying scripts into Alpine..."
cp "$SCRIPTS_DIR/entrypoint.sh"   "$ALPINE_ROOT/entrypoint.sh"
cp "$SCRIPTS_DIR/daily-backup.sh" "$ALPINE_ROOT/daily-backup.sh"
chmod +x "$ALPINE_ROOT/entrypoint.sh" "$ALPINE_ROOT/daily-backup.sh"

# --- 5. Register cron job inside Alpine (equivalent to Containerfile RUN crontab) ---
echo "[setup] Registering daily backup cron job in Alpine..."
proot-distro login "$ALPINE" -- sh -c "
    echo '0 0 * * * /daily-backup.sh >> /var/log/daily-backup.log 2>&1' | crontab -
"

# --- 6. Write a launcher script in Termux ---
cat > "$SCRIPTS_DIR/termux-start.sh" << EOF
#!/data/data/com.termux/files/usr/bin/sh
# Starts the WebDAV sync server inside the Alpine proot.
# Edit the env vars below or export them before running.

export GIT_USER_NAME="\${GIT_USER_NAME:-feeds-sync}"
export GIT_USER_EMAIL="\${GIT_USER_EMAIL:-feeds-sync@localhost}"
export GIT_REMOTE="\${GIT_REMOTE:-origin}"
export GIT_BRANCH="\${GIT_BRANCH:-main}"
export WEBDAV_USER="\${WEBDAV_USER:-admin}"
export WEBDAV_PASS="\${WEBDAV_PASS:-changeme}"

REPO_DIR="$REPO_DIR"

exec proot-distro login $ALPINE \\
    --bind "\$REPO_DIR:/repo" \\
    --bind "\$HOME/.ssh:/root/.ssh" \\
    -- sh -c "
        export GIT_USER_NAME='\$GIT_USER_NAME'
        export GIT_USER_EMAIL='\$GIT_USER_EMAIL'
        export GIT_REMOTE='\$GIT_REMOTE'
        export GIT_BRANCH='\$GIT_BRANCH'
        export WEBDAV_USER='\$WEBDAV_USER'
        export WEBDAV_PASS='\$WEBDAV_PASS'
        exec /entrypoint.sh
    "
EOF
chmod +x "$SCRIPTS_DIR/termux-start.sh"

echo ""
echo "[setup] Done. Run ./termux-start.sh to start the WebDAV server."
