#!/usr/bin/env bash
set -euo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
COMPOSE_FILE="$ROOT_DIR/compose/docker-compose.yml"
ENV_FILE="$ROOT_DIR/.env"
BACKUP_DIR="$ROOT_DIR/backups"
TIMESTAMP="$(date +%Y%m%d-%H%M%S)"
mkdir -p "$BACKUP_DIR"

REDIS_FILE="$BACKUP_DIR/redis-$TIMESTAMP.rdb"
ARCHIVE_FILE="$BACKUP_DIR/minio-$TIMESTAMP.tar.gz"

if [[ ! -f "$ENV_FILE" ]]; then
  echo "Missing .env file. Copy .env.example to .env and configure it first." >&2
  exit 1
fi

docker compose --env-file "$ENV_FILE" -f "$COMPOSE_FILE" exec -T redis redis-cli SAVE >/dev/null
docker compose --env-file "$ENV_FILE" -f "$COMPOSE_FILE" cp redis:/data/dump.rdb "$REDIS_FILE"
docker compose --env-file "$ENV_FILE" -f "$COMPOSE_FILE" exec -T minio tar -czf - /data > "$ARCHIVE_FILE"

echo "Backups created:"
echo "- $REDIS_FILE"
echo "- $ARCHIVE_FILE"
