#!/usr/bin/env bash
set -euo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
COMPOSE_FILE="$ROOT_DIR/compose/docker-compose.yml"
ENV_FILE="$ROOT_DIR/.env"

if [[ ! -f "$ENV_FILE" ]]; then
  echo "Missing .env file. Copy .env.example to .env and configure it first." >&2
  exit 1
fi

if grep -Eq '^MINIO_ROOT_(USER|PASSWORD)=change-me$' "$ENV_FILE"; then
  echo "Refusing to deploy with placeholder MinIO credentials. Update MINIO_ROOT_USER and MINIO_ROOT_PASSWORD in .env." >&2
  exit 1
fi

docker compose --env-file "$ENV_FILE" -f "$COMPOSE_FILE" pull
docker compose --env-file "$ENV_FILE" -f "$COMPOSE_FILE" up -d
