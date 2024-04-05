#!/bin/bash

# Define log files and patterns to monitor
declare -A logs_patterns
logs_patterns["/var/log/apache2/error.log"]="error"
logs_patterns["/var/log/mysql/error.log"]="error"
logs_patterns["/var/log/auth.log"]="denied|failed"

# Function to monitor a single log file
monitor_log() {
    local log_file=$1
    local pattern=$2
    echo "Monitoring $log_file for patterns: $pattern"
    tail -f $log_file | grep --line-buffered -E $pattern | while read line; do
        echo "$(date): $line"
        # You can add actions here, like sending email notifications
    done
}

# Start monitoring each log file in a background process
for log_file in "${!logs_patterns[@]}"; do
    monitor_log $log_file "${logs_patterns[$log_file]}" &
done

# Keep the script running to maintain the background processes
wait
