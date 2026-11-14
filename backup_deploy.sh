#!/usr/bin/env bash
set -euo pipefail

BACKUP_DIR="/opt/backup"

echo "Введите ip-адрес сервера:"
read HOST_IP

ssh ubuntu@$HOST_IP "sudo mkdir -p $BACKUP_DIR"
ssh ubuntu@$HOST_IP "sudo chown ubuntu:ubuntu $BACKUP_DIR"

scp backup_mysql_db.sh ubuntu@$HOST_IP:$BACKUP_DIR/
ssh ubuntu@$HOST_IP "chmod 700 $BACKUP_DIR/backup_mysql_db.sh"

scp backup_mysql_db_cron.sh ubuntu@$HOST_IP:$BACKUP_DIR/
ssh ubuntu@$HOST_IP "chmod 700 $BACKUP_DIR/backup_mysql_db_cron.sh"

scp .env ubuntu@$HOST_IP:$BACKUP_DIR/
ssh ubuntu@$HOST_IP "chmod 600 $BACKUP_DIR/.env"

ssh ubuntu@$HOST_IP "$BACKUP_DIR/backup_mysql_db.sh"

ssh ubuntu@$HOST_IP "$BACKUP_DIR/backup_mysql_db_cron.sh"
