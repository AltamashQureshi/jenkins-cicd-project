#!/bin/bash
# ============================================================
#  deploy.sh — Copy built WAR file to deploy directory
#  Usage: bash scripts/deploy.sh <war-file> <deploy-dir>
# ============================================================

set -e   # Stop immediately if any command fails

WAR_FILE="$1"
DEPLOY_DIR="$2"

echo "[deploy.sh] Starting deployment..."
echo "[deploy.sh] WAR File  : $WAR_FILE"
echo "[deploy.sh] Deploy Dir: $DEPLOY_DIR"

if [ -z "$WAR_FILE" ] || [ -z "$DEPLOY_DIR" ]; then
    echo "[deploy.sh] ERROR: Missing arguments."
    echo "[deploy.sh] Usage: bash deploy.sh <war-file> <deploy-dir>"
    exit 1
fi

if [ ! -f "$WAR_FILE" ]; then
    echo "[deploy.sh] ERROR: WAR file not found at $WAR_FILE"
    exit 1
fi

mkdir -p "$DEPLOY_DIR"
cp "$WAR_FILE" "$DEPLOY_DIR/"

echo "[deploy.sh] Deployed: $(basename $WAR_FILE) -> $DEPLOY_DIR"
echo "[deploy.sh] Done!"
