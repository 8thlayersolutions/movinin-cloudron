# Upstream notes for Movin' In Cloudronization

## MongoDB

Upstream Docker Compose currently runs a dedicated `mongo` service and wires the backend with `backend/.env.docker`.
For Cloudron, remove that runtime dependency and rely on the MongoDB addon.

## Storage

Upstream Compose mounts a shared `cdn` volume at `/var/www/cdn/movinin`.
This package remaps that to `/app/data/cdn` using these env vars:

- `MI_CDN_ROOT`
- `MI_CDN_USERS`
- `MI_CDN_TEMP_USERS`
- `MI_CDN_PROPERTIES`
- `MI_CDN_TEMP_PROPERTIES`
- `MI_CDN_LOCATIONS`
- `MI_CDN_TEMP_LOCATIONS`

## Mail

Movin' In requires SMTP settings via:

- `MI_SMTP_HOST`
- `MI_SMTP_PORT`
- `MI_SMTP_USER`
- `MI_SMTP_PASS`
- `MI_SMTP_FROM`

Cloudron sendmail is mapped to those in `env.sh`.
