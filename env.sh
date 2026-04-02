#!/bin/bash
set -eu

export NODE_ENV=production
export MI_WEBSITE_NAME="Movin' In"
export MI_PORT="${PORT:-4004}"
export MI_HTTPS="false"

export MI_COOKIE_SECRET="${CLOUDRON_APP_DOMAIN}-cookie-secret-change-me"
export MI_JWT_SECRET="${CLOUDRON_APP_DOMAIN}-jwt-secret-change-me"

export MI_DB_URI="${CLOUDRON_MONGODB_URL}"
export MI_DB_SSL="false"
export MI_DB_DEBUG="false"
export MI_DB_SERVER_SIDE_JAVASCRIPT="false"

export MI_SMTP_HOST="${CLOUDRON_MAIL_SMTP_SERVER}"
export MI_SMTP_PORT="${CLOUDRON_MAIL_SMTP_PORT}"
export MI_SMTP_USER="${CLOUDRON_MAIL_SMTP_USERNAME:-}"
export MI_SMTP_PASS="${CLOUDRON_MAIL_SMTP_PASSWORD:-}"
export MI_SMTP_FROM="${CLOUDRON_MAIL_FROM}"

export MI_CDN_ROOT="/app/data/cdn"
export MI_CDN_USERS="/app/data/cdn/users"
export MI_CDN_TEMP_USERS="/app/data/cdn/temp/users"
export MI_CDN_PROPERTIES="/app/data/cdn/properties"
export MI_CDN_TEMP_PROPERTIES="/app/data/cdn/temp/properties"
export MI_CDN_LOCATIONS="/app/data/cdn/locations"
export MI_CDN_TEMP_LOCATIONS="/app/data/cdn/temp/locations"

export MI_AUTH_COOKIE_DOMAIN="${CLOUDRON_APP_DOMAIN}"
export MI_ADMIN_HOST="https://${CLOUDRON_APP_DOMAIN}"
export MI_FRONTEND_HOST="https://${CLOUDRON_APP_DOMAIN}"

export MI_DEFAULT_LANGUAGE="en"
export MI_MINIMUM_AGE="21"
export MI_TIMEZONE="UTC"
export MI_STRIPE_SECRET_KEY=""
export MI_PAYPAL_SANDBOX="true"
export MI_PAYPAL_CLIENT_ID=""
export MI_PAYPAL_CLIENT_SECRET=""
export MI_ADMIN_EMAIL="admin@${CLOUDRON_APP_DOMAIN}"

mkdir -p \
  "${MI_CDN_USERS}" \
  "${MI_CDN_TEMP_USERS}" \
  "${MI_CDN_PROPERTIES}" \
  "${MI_CDN_TEMP_PROPERTIES}" \
  "${MI_CDN_LOCATIONS}" \
  "${MI_CDN_TEMP_LOCATIONS}"