from pathlib import Path

SQL_PATH = Path(__file__).parent / "sql"
DB_PATH = Path(__file__).parent / "sql"

with open(SQL_PATH) as file:
    print(file.read())