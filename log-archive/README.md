📦 Log Archive Tool
A simple Linux-based Python CLI tool that archives and compresses log files into timestamped .tar.gz files.

The tool can be run manually or automated using Linux Cron to prevent log files from continuously consuming disk space.

✨ Features
Accepts a log directory as a CLI argument
Validates the provided directory
Compresses logs into .tar.gz
Creates timestamped archive filenames
Automatically creates the archive/ directory
Maintains an archive activity log
Can be automated using Linux Cron
Installable as a Linux CLI command
🏗️ Project Structure
log-archive/
│
├── archive/
│   └── logs_archive_YYYYMMDD_HHMMSS.tar.gz
│
├── logs/
│   ├── app.log
│   ├── error.log
│   └── access.log
│
├── log_archive.py
├── archive.log
├── pyproject.toml
├── README.md
├── LEARNINGS.md
└── .gitignore

🛠️ Technologies
Python 3
Linux
argparse
pathlib
tarfile
datetime
Linux Cron
Git
GitHub
📋 Prerequisites
Make sure the following are installed:

Linux
Python 3
pip
Git
Check Python:

python3 --version

Check pip:

pip --version

🚀 Installation
1. Clone the Repository
git clone <YOUR_GITHUB_REPOSITORY_URL>
cd log-archive

2. Create a Virtual Environment
python3 -m venv .venv

Activate it:

source .venv/bin/activate

You should see:

(.venv)

in your terminal.

3. Install the CLI
pip install -e .

After installation, the following command should be available:

log-archive

▶️ Usage
The basic syntax is:

log-archive <log-directory>

Example:

log-archive logs

For a real Linux log directory:

log-archive /var/log

Example Output
Archive created successfully: archive/logs_archive_20260907_143025.tar.gz

🔍 Verify the Archive
List generated archives:

ls -lh archive/

Example:

logs_archive_20260907_143025.tar.gz

To inspect the contents:

tar -tzf archive/logs_archive_20260907_143025.tar.gz

❌ Error Handling
Directory Does Not Exist
log-archive abc

Output:

Error: Directory 'abc' does not exist.

Path Is a File
log-archive log_archive.py

Output:

Error: 'log_archive.py' is not a directory.

No Argument
log-archive

The CLI displays the required argument information.

⏰ Cron Automation
The tool can be scheduled using Linux Cron.

For example, to run the archive process every day at midnight:

0 0 * * * /home/codedev/devops-lab/log-archive/.venv/bin/log-archive /home/codedev/devops-lab/log-archive/logs

The schedule:

0 0 * * *

means:

Every day at 12:00 AM.

View configured Cron jobs:

crontab -l

Edit Cron jobs:

crontab -e

Note: Use absolute paths in Cron to ensure the correct executable and log directory are used.
