#!/bin/bash
set -eux  # <-- important (shows errors)

source /app/code/env.sh

mkdir -p \
  /app/data/logs \
  /app/data/cdn/users \
  /app/data/cdn/temp/users \
  /app/data/cdn/properties \
  /app/data/cdn/temp/properties \
  /app/data/cdn/locations \
  /app/data/cdn/temp/locations

cd /app/code/backend

echo "=== Running setup ==="
node dist/src/setup/setup.js

echo "=== Starting server ==="
exec node --import ./dist/src/monitoring/instrument.js dist/src
