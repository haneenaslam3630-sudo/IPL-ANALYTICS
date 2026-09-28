import json
from pathlib import Path

p = Path('notebooks/.ipynb_checkpoints/data_prepration.ipynb')
data = json.loads(p.read_text(encoding='utf-8'))
for i, cell in enumerate(data.get('cells', []), 1):
    src = ''.join(cell.get('source', []))
    if 'deliveries_' in src or 'CREATE TABLE' in src or 'sqlite3' in src or 'OperationalError' in src or 'print' in src:
        print('\n=== CELL', i, cell.get('cell_type'), '===')
        print(src)
        print('--- outputs ---')
        outputs = cell.get('outputs', [])
        for out in outputs:
            print(out.get('output_type'))
            if out.get('output_type') == 'error':
                print(out.get('ename'), out.get('evalue'))
                print('\n'.join(out.get('traceback', [])))
            elif out.get('output_type') == 'stream':
                print(''.join(out.get('text', [])))
            else:
                print(out)
