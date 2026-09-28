import sqlite3
from pathlib import Path

conn = sqlite3.connect('C:/Users/h1n2e/Downloads/Project_3.1/data/raw/ipl.db')
path = Path('C:/Users/h1n2e/Downloads/Project_3.1/sql/01_nulls_and_blanks.sql')
script = path.read_text(encoding='utf-8')
conn.executescript(script)
conn.commit()
print('ok', path.name)
