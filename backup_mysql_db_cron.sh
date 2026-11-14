#!/usr/bin/env bash
set -euo pipefail

BACKUP_DIR="/opt/backup"
CRON_JOB="* * * * * cd ${BACKUP_DIR} && ./backup_mysql_db.sh >> ${BACKUP_DIR}/cron.log 2>&1"

(crontab -l 2>/dev/null; echo "${CRON_JOB}") | crontab -

echo "Backup cron job added"
