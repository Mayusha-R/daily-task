#!/bin/bash

SYSLOG_FILE="/var/log/syslog"
AUTH_LOG_FILE="/var/log/auth.log"

check_logs() {
    local file=$1
    local error=$2
    echo "Checking $file for '$error'..."
    grep "$error" "$file" | head -n 5
}

echo "System Log Errors "
check_logs $SYSLOG_FILE "error"
