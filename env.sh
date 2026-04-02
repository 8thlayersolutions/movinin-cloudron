#!/bin/bash
set -eu

# Cloudron runtime
export NODE_ENV=production
export BASE_URL="https://${CLOUDRON_APP_DOMAIN}"
export APP_DOMAIN="${CLOUDRON_APP_DOMAIN}"
export APP_ORIGIN="https://${CLOUDRON_APP_DOMAIN}"

# Main listen port for the backend/app
# Keep this aligned with CloudronManifest.json -> httpPort
export PORT="${PORT:-4004}"
export HOST="0.0.0.0"

# Persistent storage on Cloudron
# Cloudron expects runtime writes to go under /app/data for persistence/backups.
export DATA_ROOT="/app/data"
export CDN_ROOT="/app/data/cdn"
export UPLOADS_ROOT="/app/data/uploads"
mkdir -p "${CDN_ROOT}" "${UPLOADS_ROOT}"

# MongoDB addon
# Cloudron injects CLOUDRON_MONGODB_* variables when the mongodb addon is enabled.
export MONGODB_URL="${CLOUDRON_MONGODB_URL}"
export MONGODB_HOST="${CLOUDRON_MONGODB_HOST}"
export MONGODB_PORT="${CLOUDRON_MONGODB_PORT}"
export MONGODB_DATABASE="${CLOUDRON_MONGODB_DATABASE}"
export MONGODB_USERNAME="${CLOUDRON_MONGODB_USERNAME}"
export MONGODB_PASSWORD="${CLOUDRON_MONGODB_PASSWORD}"

# Alias common names many node apps expect
export DB_URI="${MONGODB_URL}"
export DB_HOST="${MONGODB_HOST}"
export DB_PORT="${MONGODB_PORT}"
export DB_NAME="${MONGODB_DATABASE}"
export DB_USER="${MONGODB_USERNAME}"
export DB_PASSWORD="${MONGODB_PASSWORD}"

# Mail / sendmail addon
# Cloudron injects CLOUDRON_EMAIL_* variables when sendmail is enabled.
export SMTP_HOST="${CLOUDRON_MAIL_SMTP_SERVER}"
export SMTP_PORT="${CLOUDRON_MAIL_SMTP_PORT}"
export SMTP_SECURE="true"
export SMTP_USER="${CLOUDRON_MAIL_SMTP_USERNAME}"
export SMTP_PASSWORD="${CLOUDRON_MAIL_SMTP_PASSWORD}"
export SMTP_FROM="${CLOUDRON_MAIL_FROM}"

# Optional app-facing aliases
export MAIL_HOST="${SMTP_HOST}"
export MAIL_PORT="${SMTP_PORT}"
export MAIL_FROM="${SMTP_FROM}"

# Helpful defaults for upstream code/config
export CDN_SERVER="${BASE_URL}"
export CDN_PATH="${CDN_ROOT}"
export STORAGE_PATH="${UPLOADS_ROOT}"