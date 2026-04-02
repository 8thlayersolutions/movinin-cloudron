#!/bin/bash
set -eu

APP_CODE="/app/code"
ENV_FILE="/app/data/env/backend.env"

source "${APP_CODE}/env.sh"

mkdir -p \
  /app/data/env \
  /app/data/cdn/users \
  /app/data/cdn/temp/users \
  /app/data/cdn/properties \
  /app/data/cdn/temp/properties \
  /app/data/cdn/locations \
  /app/data/cdn/temp/locations \
  /run

rm -f "${ENV_FILE}"
touch "${ENV_FILE}"

write_env() {
  local key="$1"
  local value="${2:-}"
  printf '%s=%q\n' "$key" "$value" >> "${ENV_FILE}"
}

write_env NODE_ENV "$NODE_ENV"
write_env MI_WEBSITE_NAME "$MI_WEBSITE_NAME"
write_env MI_PORT "$MI_PORT"
write_env MI_HTTPS "$MI_HTTPS"

write_env MI_DB_URI "$MI_DB_URI"
write_env MI_DB_SSL "$MI_DB_SSL"
write_env MI_DB_DEBUG "$MI_DB_DEBUG"
write_env MI_DB_SERVER_SIDE_JAVASCRIPT "$MI_DB_SERVER_SIDE_JAVASCRIPT"

write_env MI_COOKIE_SECRET "$MI_COOKIE_SECRET"
write_env MI_AUTH_COOKIE_DOMAIN "$MI_AUTH_COOKIE_DOMAIN"
write_env MI_JWT_SECRET "$MI_JWT_SECRET"

write_env MI_SMTP_HOST "$MI_SMTP_HOST"
write_env MI_SMTP_PORT "$MI_SMTP_PORT"
write_env MI_SMTP_USER "$MI_SMTP_USER"
write_env MI_SMTP_PASS "$MI_SMTP_PASS"
write_env MI_SMTP_FROM "$MI_SMTP_FROM"

write_env MI_CDN_ROOT "$MI_CDN_ROOT"
write_env MI_CDN_USERS "$MI_CDN_USERS"
write_env MI_CDN_TEMP_USERS "$MI_CDN_TEMP_USERS"
write_env MI_CDN_PROPERTIES "$MI_CDN_PROPERTIES"
write_env MI_CDN_TEMP_PROPERTIES "$MI_CDN_TEMP_PROPERTIES"
write_env MI_CDN_LOCATIONS "$MI_CDN_LOCATIONS"
write_env MI_CDN_TEMP_LOCATIONS "$MI_CDN_TEMP_LOCATIONS"

write_env MI_ADMIN_HOST "$MI_ADMIN_HOST"
write_env MI_FRONTEND_HOST "$MI_FRONTEND_HOST"

write_env MI_DEFAULT_LANGUAGE "$MI_DEFAULT_LANGUAGE"
write_env MI_MINIMUM_AGE "$MI_MINIMUM_AGE"
write_env MI_TIMEZONE "$MI_TIMEZONE"
write_env MI_STRIPE_SECRET_KEY "$MI_STRIPE_SECRET_KEY"
write_env MI_PAYPAL_SANDBOX "$MI_PAYPAL_SANDBOX"
write_env MI_PAYPAL_CLIENT_ID "$MI_PAYPAL_CLIENT_ID"
write_env MI_PAYPAL_CLIENT_SECRET "$MI_PAYPAL_CLIENT_SECRET"
write_env MI_ADMIN_EMAIL "$MI_ADMIN_EMAIL"

cd "${APP_CODE}/backend"

set -a
. "${ENV_FILE}"
set +a

exec npm run start:setup