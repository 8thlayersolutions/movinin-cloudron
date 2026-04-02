#!/bin/bash
set -eu

# Cloudron Mongo addon values normally expose these variables:
# CLOUDRON_MONGO_URL, CLOUDRON_MONGO_HOST, CLOUDRON_MONGO_PORT,
# CLOUDRON_MONGO_USERNAME, CLOUDRON_MONGO_PASSWORD, CLOUDRON_MONGO_DATABASE.
# Build MI_DB_URI from the URL when available, otherwise synthesize one.
if [ -n "${CLOUDRON_MONGO_URL:-}" ]; then
  export MI_DB_URI="${CLOUDRON_MONGO_URL}"
else
  export MI_DB_URI="mongodb://${CLOUDRON_MONGO_USERNAME}:${CLOUDRON_MONGO_PASSWORD}@${CLOUDRON_MONGO_HOST}:${CLOUDRON_MONGO_PORT}/${CLOUDRON_MONGO_DATABASE}?authSource=admin&appName=movinin"
fi

export MI_DB_SSL="${MI_DB_SSL:-false}"
export MI_PORT="${PORT:-4004}"
export MI_HTTPS="false"
export MI_AUTH_COOKIE_DOMAIN="${CLOUDRON_APP_DOMAIN}"
export MI_ADMIN_HOST="${MI_ADMIN_HOST:-https://${CLOUDRON_APP_DOMAIN}}"
export MI_FRONTEND_HOST="${MI_FRONTEND_HOST:-https://${CLOUDRON_APP_DOMAIN}}"

# Cloudron sendmail addon exposes a local MTA. Movin' In requires SMTP settings.
# Default to the internal mail relay on port 2525 with no auth.
export MI_SMTP_HOST="${SMTP_SERVER:-127.0.0.1}"
export MI_SMTP_PORT="${SMTP_PORT:-2525}"
export MI_SMTP_USER="${SMTP_USERNAME:-}"
export MI_SMTP_PASS="${SMTP_PASSWORD:-}"
export MI_SMTP_FROM="${MI_SMTP_FROM:-noreply@${CLOUDRON_MAIL_DOMAIN:-$CLOUDRON_APP_DOMAIN}}"

# Persisted storage paths
export MI_CDN_ROOT="/app/data/cdn"
export MI_CDN_USERS="/app/data/cdn/users"
export MI_CDN_TEMP_USERS="/app/data/cdn/temp/users"
export MI_CDN_PROPERTIES="/app/data/cdn/properties"
export MI_CDN_TEMP_PROPERTIES="/app/data/cdn/temp/properties"
export MI_CDN_LOCATIONS="/app/data/cdn/locations"
export MI_CDN_TEMP_LOCATIONS="/app/data/cdn/temp/locations"

export MI_COOKIE_SECRET="${MI_COOKIE_SECRET:-${CLOUDRON_APP_ID}-${CLOUDRON_APP_DOMAIN}-cookie-secret-change-me}"
export MI_JWT_SECRET="${MI_JWT_SECRET:-${CLOUDRON_APP_ID}-${CLOUDRON_APP_DOMAIN}-jwt-secret-change-me}"
export MI_WEBSITE_NAME="${MI_WEBSITE_NAME:-Movin' In}"
export MI_DEFAULT_LANGUAGE="${MI_DEFAULT_LANGUAGE:-en}"
export MI_TIMEZONE="${MI_TIMEZONE:-UTC}"

# Optional custom overrides live in /app/data/env.sh and are sourced last.
if [ -f /app/data/env.sh ]; then
  # shellcheck source=/dev/null
  . /app/data/env.sh
fi
