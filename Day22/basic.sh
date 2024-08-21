#!/bin/bash

OUTPUT_FILE="basicreport.txt"

check_disk_usage() {
    echo "Disk Usage Report Shown Below :-"
    df -h
    echo
}

check_memory_usage() {
    echo "Memory Usage Report :- "    
    free -h
    echo
}

check_cpu_load() {
    echo "CPU Load Report :-"
    top -bn1 | grep "Cpu(s)"
    echo
}

if [ -n "$OUTPUT_FILE" ]; then
    {
        check_disk_usage
        check_memory_usage
        check_cpu_load
    } > "$OUTPUT_FILE"  
    echo "Report saved to $OUTPUT_FILE"

fi