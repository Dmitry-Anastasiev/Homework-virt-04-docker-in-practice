#!/usr/bin/env bash
set -euo pipefail

BACKUP_DIR="/opt/backup"
TIMESTAMP=$(date +"%Y%m%d_%H%M%S")

if [ -f "/opt/backup/.env" ]; then
  set -a
  source "/opt/backup/.env"
  set +a
fi

: "${DB_HOST:?DB_HOST не задан}"
: "${DB_PORT:?DB_PORT не задан}"
: "${DB_USER:?DB_USER не задан}"
: "${DB_PASSWORD:?DB_PASSWORD не задан}"
: "${DB_NAME:?DB_NAME не задан}"

BACKUP_FILE="${DB_NAME}_${TIMESTAMP}.sql"

docker run \
  --rm --entrypoint "" \
  --network shvirtd-example-python_backend \
  -e MYSQL_HOST="${DB_HOST}" \
  -e MYSQL_PORT="${DB_PORT}" \
  -e MYSQL_USER="${DB_USER}" \
  -e MYSQL_PASSWORD="${DB_PASSWORD}" \
  -e MYSQL_DATABASE="${DB_NAME}" \
  -v "${BACKUP_DIR}":/backup \
  schnitzler/mysqldump \
  mysqldump --opt -h ${DB_HOST} -u ${DB_USER} -p${DB_PASSWORD} --result-file=/backup/${BACKUP_FILE} ${DB_NAME}

echo "Backup created: ${BACKUP_DIR}/${BACKUP_FILE}"
