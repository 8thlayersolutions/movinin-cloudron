#!/bin/bash
set -eu

source /app/code/env.sh

mkdir -p \
  /app/data/logs \
  /app/data/cdn/users \
  /app/data/cdn/temp/users \
  /app/data/cdn/properties \
  /app/data/cdn/temp/properties \
  /app/data/cdn/locations \
  /app/data/cdn/temp/locations

cd /app/data

exec node /app/code/backend/dist/src