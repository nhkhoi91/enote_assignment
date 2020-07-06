import os
import pandas as pd
from src.utils import fix_birth_date, fix_transaction_date, get_project_root

root_folder = get_project_root()
person_file_path = os.path.join(root_folder, 'data', 'BI_assignment_person.csv')
account_file_path = os.path.join(root_folder, 'data', 'BI_assignment_account.csv')
transaction_file_path = os.path.join(root_folder, 'data', 'BI_assignment_transaction.csv')


def process_all_files(engine):
    process_person_file(engine)
    process_account_file(engine)
    process_transaction_file(engine)


def process_person_file(engine):
    person_df = pd.read_csv(person_file_path)
    person_df.dropna(how='all', inplace=True)
    person_df['birth_date'] = person_df['birth_date'].apply(fix_birth_date)
    person_df['birth_date'] = person_df['birth_date'].astype('datetime64[ns]')
    person_df.to_sql('Person', con=engine, if_exists='append', index=False)


def process_account_file(engine):
    account_df = pd.read_csv(account_file_path)
    account_df.to_sql('Account', con=engine, if_exists='append', index=False)


def process_transaction_file(engine):
    transaction_df = pd.read_csv(transaction_file_path)
    transaction_df['transaction_date'] = transaction_df.transaction_date.apply(fix_transaction_date)
    transaction_df['transaction_date'] = transaction_df['transaction_date'].astype('datetime64[ns]')
    transaction_df.to_sql('Transaction', con=engine, if_exists='append', index=False)
