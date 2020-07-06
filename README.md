# ENOTE ASSIGNMENT
This repo contains part A of the assignment in `Assignment.md`, 2 SQL files for creating required schema in `/data` folder, 
and a transaction report, as well as Python code for loading csv files and pushing to respective database tables.

## Getting started
These instructions will help you create the required schema on MySQL, insert data into these
tables, and populate the report.

## Prerequisites
For this project to run smoothly, you need to have a SQL server and Pip installed on your machine.

## Installing
Please install the missing libraries using this command
```bash
pip install -r requirements.txt
```

## Environment and data setup
For security reason, I use environment variables to store MySQL connection variable. 
Therefore, please setup the variables by copying the following line and modifying 
according to your connection
```python
USER=root;PASSWORD=abc;HOST=127.0.0.1;
```

Next, 3 csv files that are in the attachment needs to be copy to data folder for the 
program to run successfully. Also, set `main.py` as the main file for the program.

## Runing the assignment
First, run file `SchemaCreateScript.sql` to create the schema and tables. After that, run
the python script to populate data into tables, and finally run file `TransactionReport.sql`
to create the requested report.