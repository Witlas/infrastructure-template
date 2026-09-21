#!/usr/bin/env bash
set -euo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
COMPOSE_FILE="$ROOT_DIR/compose/docker-compose.yml"

status="$(docker compose --env-file "$ROOT_DIR/.env" -f "$COMPOSE_FILE" ps --status running --services || true)"

for service in redis minio; do
  if ! grep -qx "$service" <<<"$status"; then
    echo "Service '$service' is not running" >&2
    exit 1
  fi
done

echo "All expected services are running."
