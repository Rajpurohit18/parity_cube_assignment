#!/bin/bash

LOGFILE="/var/log/date.log"

# Create the logfile if it doesn't exist and ensure write permissions
sudo touch "$LOGFILE"
sudo chmod 666 "$LOGFILE"

while true; do
    echo "Current Date and Time: $(date)" >> "$LOGFILE"
    sleep 30
done
