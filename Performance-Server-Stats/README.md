# Server Performance Stats

A simple Bash script to monitor basic Linux server performance.

## Features

- CPU usage
- Memory usage (total, used, free, percentage)
- Disk usage per filesystem
- Top 5 processes by CPU usage
- Top 5 processes by memory usage

## Requirements

- Linux or WSL
- Bash
- Standard utilities: `top`, `free`, `df`, `ps`, `awk`

## Run the Project

Clone the repository:

```bash
git clone https://github.com/khushizz/Performance-Server-Stats.git
```

Go to the project directory:

```bash
cd Performance-Server-Stats
```

Give execute permission:

```bash
chmod +x server-stats.sh
```

Run the script:

```bash
./server-stats.sh
```

Or:

```bash
bash server-stats.sh
```

## Sample Output

```
========================================
       SERVER PERFORMANCE STATS
========================================

CPU Usage
---------
Total CPU Usage: 12.50%

Memory Usage
------------
Total: 8192 MB | Used: 4096 MB | Free: 2048 MB | Usage: 50.00%

Disk Usage
----------
/dev/sda1   50G   20G   28G  42% /

Top 5 Processes by CPU
----------------------
USER     PID    %CPU  %MEM  COMMAND
root     1234   15.2   2.1  nginx

Top 5 Processes by Memory
-------------------------
USER     PID    %CPU  %MEM  COMMAND
root     5678    1.0  12.5  mysqld
```

## Project URL

https://roadmap.sh/projects/server-stats

