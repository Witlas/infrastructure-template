#!/usr/bin/env bash
set -euo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
COMPOSE_FILE="$ROOT_DIR/compose/docker-compose.yml"

if [[ ! -f "$ROOT_DIR/.env" ]]; then
  echo "Missing .env file. Copy .env.example to .env and configure it first." >&2
  exit 1
fi

docker compose --env-file "$ROOT_DIR/.env" -f "$COMPOSE_FILE" pull
docker compose --env-file "$ROOT_DIR/.env" -f "$COMPOSE_FILE" up -d
