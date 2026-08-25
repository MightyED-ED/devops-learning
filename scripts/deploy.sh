#!/bin/bash

set -euo pipefail


TIMESTAMP=$(date)
LOG_FILE="$HOME/devops-lab/logs/deploy.log"
SOURCE="$HOME/devops-lab/application/app.sh"
DEST="/opt/devops-app/app.sh"

exec > >(tee -a "$LOG_FILE") 2>&1
trap 'echo "[ERROR] Deployment failed at line $LINENO. See $LOG_FILE."' err
echo "===$TIMESTAMP starting deployment..."
echo "copying application..."

sudo cp "$SOURCE" "$DEST"
echo "cp exit code: $?"
echo "setting permissions..."

sudo chown root:developers "$DEST"
sudo chmod 770 "$DEST"

echo "deployment complete!"

echo "testing application..."

sudo "$DEST"

echo "===$TIMESTAMP deployment finished ==="
