from pathlib import Path


def get_project_root() -> Path:
    return Path(__file__).parent.parent


def fix_birth_date(date):
    if '/' in date:
        parts = date.split('/')
        sep = '/'
    elif '-' in date:
        parts = date.split('-')
        sep = '-'
    else:
        print('some other format')
        return date
    year = int(parts[2])
    if year > 10:
        year += 1900
    else:
        year += 2000
    return parts[0] + sep + parts[1] + sep + str(year)


def fix_transaction_date(date):
    parts = date.split('/')
    sep = '/'
    year = int(parts[2])
    year += 2000
    return parts[0] + sep + parts[1] + sep + str(year)
