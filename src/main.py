import mysql.connector
from mysql.connector import errorcode
from src.process_file import process_all_files
from src.connection import get_connector


def main():
    with get_connector() as engine:
        process_all_files(engine)

if __name__ == "__main__":
    main()
