from src.process_file import process_all_files
from src.connection import get_connector


def main():
    engine = get_connector()
    process_all_files(engine)


if __name__ == "__main__":
    main()
