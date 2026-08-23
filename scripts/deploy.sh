#!/bin/bash

set -e

echo "starting deployment..."

SOURCE="$HOME/devops-lab/application/app.sh"
DEST="/opt/devops-app/app.sh"

echo "copying application..."

sudo cp "$SOURCE" "$DEST"

echo "setting permissions..."

sudo chown root:developers "$DEST"
sudo chmod 770 "$DEST"

echo "deployment complete!"

echo "testing application..."

sudo "$DEST"
