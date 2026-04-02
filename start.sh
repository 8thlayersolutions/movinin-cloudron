#!/bin/bash
set -eu

APP_CODE="/app/code"
APP_USER="cloudron"

# Source runtime environment first
source "${APP_CODE}/env.sh"

# Ensure persistent dirs exist
mkdir -p /app/data/cdn /app/data/uploads /run

# Ownership for runtime user
chown -R ${APP_USER}:${APP_USER} /app/data /run

# If upstream expects a writable .env, generate one here.
# Adjust keys later if Movin' In uses different exact names.
cat > "${APP_CODE}/backend/.env" <<EOF
NODE_ENV=${NODE_ENV}
HOST=${HOST}
PORT=${PORT}
BASE_URL=${BASE_URL}

MONGODB_URL=${MONGODB_URL}
MONGODB_HOST=${MONGODB_HOST}
MONGODB_PORT=${MONGODB_PORT}
MONGODB_DATABASE=${MONGODB_DATABASE}
MONGODB_USERNAME=${MONGODB_USERNAME}
MONGODB_PASSWORD=${MONGODB_PASSWORD}

SMTP_HOST=${SMTP_HOST}
SMTP_PORT=${SMTP_PORT}
SMTP_SECURE=${SMTP_SECURE}
SMTP_FROM=${SMTP_FROM}

CDN_ROOT=${CDN_ROOT}
UPLOADS_ROOT=${UPLOADS_ROOT}
CDN_SERVER=${CDN_SERVER}
CDN_PATH=${CDN_PATH}
STORAGE_PATH=${STORAGE_PATH}
EOF

chown ${APP_USER}:${APP_USER} "${APP_CODE}/backend/.env"

cd "${APP_CODE}/backend"

# Start the upstream backend. This is the same startup family you were targeting.
exec /usr/local/bin/gosu ${APP_USER}:${APP_USER} npm run start:setup