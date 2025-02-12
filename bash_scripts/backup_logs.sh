#!/bin/bash

# Переменные
LOG_DIR="/var/log/httpd"
FILENAME="access_log"
FILE_PATH="$LOG_DIR/$FILENAME"
BACKUP_DIR="$LOG_DIR/backups"

# Создаем папку для бэкапов, если нет создаем
mkdir -p "$BACKUP_DIR"

# Имя архива + дата в названии
BACKUP_FILE="$BACKUP_DIR/log_$(date +\%Y\%m\%d).tar.gz"

# Архивируем
tar -czf "$BACKUP_FILE" "$FILE_PATH"

# Оригинальный лог очищаем
> "$FILE_PATH"

# 3 оставляе остальные удаляем
find "$BACKUP_DIR" -name "log_*.tar.gz" -type f -mtime +3 -delete

echo "DONE: $BACKUP_FILE"