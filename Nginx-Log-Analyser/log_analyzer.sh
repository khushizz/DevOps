```bash
#!/bin/bash

# Log file
LOG_FILE="${1:-access.log}"

# Check if log file exists
if [ ! -f "$LOG_FILE" ]; then
    echo "Error: Log file '$LOG_FILE' not found."
    exit 1
fi

echo "=========================================="
echo "           LOG ANALYSIS REPORT"
echo "=========================================="

echo ""
echo "Top 5 IP addresses with the most requests:"
echo "-------------------------------------------"

awk '{print $1}' "$LOG_FILE" |
sort |
uniq -c |
sort -nr |
head -5 |
awk '{print $2 " - " $1 " requests"}'


echo ""
echo "Top 5 most requested paths:"
echo "---------------------------"

awk '{print $7}' "$LOG_FILE" |
sort |
uniq -c |
sort -nr |
head -5 |
awk '{print $2 " - " $1 " requests"}'


echo ""
echo "Top 5 response status codes:"
echo "----------------------------"

awk '{print $9}' "$LOG_FILE" |
sort |
uniq -c |
sort -nr |
head -5 |
awk '{print $2 " - " $1 " requests"}'


echo ""
echo "Top 5 user agents:"
echo "------------------"

awk -F'"' '{print $6}' "$LOG_FILE" |
sort |
uniq -c |
sort -nr |
head -5 |
awk '{
    count=$1
    $1=""
    sub(/^ /, "")
    print $0 " - " count " requests"
}'
```
