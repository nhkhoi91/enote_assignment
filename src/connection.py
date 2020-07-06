import pymysql
import sqlalchemy as db
import os

USER = os.environ['USER']
PASSWORD = os.environ['PASSWORD']
HOST = os.environ['HOST']
DB = 'assignment'

def get_connector():
    engine = db.create_engine("mysql+pymysql://" + USER + ":" + PASSWORD + "@" + HOST + "/" + DB)
    return engine