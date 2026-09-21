#!/usr/bin/env bash
set -euo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
COMPOSE_FILE="$ROOT_DIR/compose/docker-compose.yml"
ENV_FILE="$ROOT_DIR/.env"

if [[ ! -f "$ENV_FILE" ]]; then
  echo "Missing .env file. Copy .env.example to .env and configure it first." >&2
  exit 1
fi

status="$(docker compose --env-file "$ENV_FILE" -f "$COMPOSE_FILE" ps --status running --services || true)"

for service in redis minio; do
  if ! grep -qx "$service" <<<"$status"; then
    echo "Service '$service' is not running" >&2
    exit 1
  fi
done

echo "All expected services are running."
