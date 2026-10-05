import argparse
import tarfile
from pathlib import Path
from datetime import datetime


def main():
    parser = argparse.ArgumentParser(
        description="Archive log files into a compressed tar.gz file"
    )

    parser.add_argument(
        "log_directory",
        help="Path to the log directory"
    )

    args = parser.parse_args()

    log_directory = Path(args.log_directory)

    if not log_directory.exists():
        print(f"Error: Directory '{log_directory}' does not exist.")
        return

    if not log_directory.is_dir():
        print(f"Error: '{log_directory}' is not a directory.")
        return

    archive_directory = Path("archive")
    archive_directory.mkdir(exist_ok=True)

    timestamp = datetime.now().strftime("%Y%m%d_%H%M%S")

    archive_name = f"logs_archive_{timestamp}.tar.gz"
    archive_path = archive_directory / archive_name

    with tarfile.open(archive_path, "w:gz") as tar:
        tar.add(log_directory, arcname=log_directory.name)

    print(f"Archive created successfully: {archive_path}")

    log_file = Path("archive.log")

    with log_file.open("a") as file:
        file.write(
            f"{datetime.now().strftime('%Y-%m-%d %H:%M:%S')} "
            f"- Archived logs directory: {log_directory}\n"
        )


if __name__ == "__main__":
    main()
