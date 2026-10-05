#!/bin/bash

echo "======================================"
echo "       SERVER PERFORMANCE STATS"
echo "======================================"

# -------------------------------
# CPU Usage
# -------------------------------

CPU_IDLE=$(top -bn1 | grep "Cpu(s)" | awk '{print $8}')
CPU_USAGE=$(echo "100 - $CPU_IDLE" | bc)

echo
echo "CPU Usage: ${CPU_USAGE}%"

# -------------------------------
# Memory Usage
# -------------------------------

MEM_TOTAL=$(free -m | awk '/Mem:/ {print $2}')
MEM_USED=$(free -m | awk '/Mem:/ {print $3}')
MEM_FREE=$(free -m | awk '/Mem:/ {print $4}')

MEM_PERCENT=$(echo "scale=2; ($MEM_USED / $MEM_TOTAL) * 100" | bc)

echo
echo "Memory Usage:"
echo "Total : ${MEM_TOTAL} MB"
echo "Used  : ${MEM_USED} MB"
echo "Free  : ${MEM_FREE} MB"
echo "Usage : ${MEM_PERCENT}%"

# -------------------------------
# Disk Usage
# -------------------------------

DISK_TOTAL=$(df -h / | awk 'NR==2 {print $2}')
DISK_USED=$(df -h / | awk 'NR==2 {print $3}')
DISK_FREE=$(df -h / | awk 'NR==2 {print $4}')
DISK_PERCENT=$(df -h / | awk 'NR==2 {print $5}')

echo
echo "Disk Usage:"
echo "Total : ${DISK_TOTAL}"
echo "Used  : ${DISK_USED}"
echo "Free  : ${DISK_FREE}"
echo "Usage : ${DISK_PERCENT}"

# -------------------------------
# Top 5 Processes by CPU
# -------------------------------

echo
echo "Top 5 Processes by CPU Usage:"
echo "--------------------------------------"

ps aux --sort=-%cpu | head -n 6

# -------------------------------
# Top 5 Processes by Memory
# -------------------------------

echo
echo "Top 5 Processes by Memory Usage:"
echo "--------------------------------------"

ps aux --sort=-%mem | head -n 6

# -------------------------------
# System Information
# -------------------------------

echo
echo "System Information:"
echo "--------------------------------------"

echo "OS:"
grep PRETTY_NAME /etc/os-release

echo
echo "Uptime:"
uptime -p

echo
echo "Load Average:"
uptime

echo
echo "Logged-in Users:"
who

echo
echo "======================================"
echo "              DONE"
echo "======================================"#!/bin/bash

echo "================================"
echo "     SERVER PERFORMANCE STATS"
echo "================================"

CPU_IDLE=$(top -bn1 | grep "Cpu" | awk '{print $8}')

CPU_USAGE=$(echo "100 - $CPU_IDLE" | bc)

echo "CPU Usage: $CPU_USAGE%"#! bin/bash
