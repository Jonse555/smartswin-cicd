#!/bin/bash

BACKUP_FILE="/work/mysql/backup/trading-win-$(date +%Y%m%d%H%M%S).sql"
LOG_FILE="/work/mysql/backup/mysql_backup.log"

mysqldump -h47.128.146.172 -P14001 -u"root" -p"sWin@o12" \
        --opt \
        --routines \
        --triggers \
        --hex-blob \
        --single-transaction \
        --add-drop-table \
        --comments \
        --complete-insert \
        "trading-win" >> $BACKUP_FILE
echo "[$(date '+%Y-%m-%d %H:%M:%S')] 备份成功: $BACKUP_FILE" >> "$LOG_FILE"
