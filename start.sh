#!/bin/bash
set -euo pipefail

cd /app/code

# shellcheck source=/app/code/env.sh
. /app/code/env.sh

mkdir -p \
  /app/data/cdn/users \
  /app/data/cdn/temp/users \
  /app/data/cdn/properties \
  /app/data/cdn/temp/properties \
  /app/data/cdn/locations \
  /app/data/cdn/temp/locations \
  /app/data/logs

# Run the upstream setup phase once per container boot. The upstream backend
# Dockerfile uses `npm run start:setup`, so keep the same behavior here.
cd /app/code/backend
exec npm run start:setup
