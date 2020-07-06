CREATE DATABASE IF NOT EXISTS assignment;
USE assignment;

/* 
	id_person: As INT can only represent around 4 million ids, 
    and storage is often not a problem these days, I choose BIGINT to represent id number
    
    name and surname: I assume max length of 50 of each part
    
    zip code: this dataset does not reflect the real world zipcode. 
    For example, Argentina zipcode is either NNNN or ANNNNAAA, with A is a char and n is an int.
    As current zipcode now has max 10 characters, I decide to use varchar(15)
    
    phone_number: all NaN here. Ideally, all phone number should be converted to E.164 format and 
    use BIGINT as data type. However, as it is often not the case, I use varchar here.
    
    birth_date: there are 2 issues with birth_date column:
		+ Inconsist data format: there are 2 type of formats: %m/%d/%y and %d-%b-%y. This is not an issue for MySQL, as 
        DATE datatype is always in %Y-%m-%d format. This issue is fixed using pandas.astype('datetime64[ns]') function,
        because pandas is smart enough to recognize different format and convert it to datetime64.
        + Year without century as a zero-padded decimal number: this is a more serious issue, as csv file does not 
		contain any metadata for other programs to derive the century part. To fix this, I made an educated guess that
        a customer must be at least 10 years old to make a transaction. Hence, if year is greater than 10 then 19 is added
        as century, otherwise 20 is added. This transformation is written in Python code.
    */
DROP TABLE IF EXISTS Transaction;
DROP TABLE IF EXISTS Account;
DROP TABLE IF EXISTS Person;
CREATE TABLE Person (
	id_person bigint unsigned,
    name varchar(100),
    surname varchar(100),
    zip varchar(15),
    city varchar(100),
    country varchar(100),
    email varchar(255),
    phone_number varchar(50),
    birth_date date,
	PRIMARY KEY (id_person));


CREATE TABLE Account (
	id_account bigint unsigned,
    id_person bigint unsigned,
    account_type varchar(50) NOT NULL,
    PRIMARY KEY (id_account),
    FOREIGN KEY (id_account) REFERENCES Person(id_person));
    
/* 
	All of the fields in transaction table are machine generated and should not 
    contain NULL values
    
    transaction type: I use CHAR here to optimize space. Depend on use case
    this can be changed to VARCHAR
    
    There are duplication in id_transaction colume, leading to duplication in 
    (id_transaction, id_account, transaction_type, transaction_date) tuple. There are two posibilities I can think of:
        - id_transaction is a unique column. Somehow, the manual extraction violates this attribute.
        - id_transaction is reseted after a period of time (1 day for example), leading to the fact that 
        id_transaction cannot stand alone but must be part of a primary key tuple. As the whole 
        (id_transaction, id_account, transaction_type, transaction_date) tuple also contains duplication,
        either some more columns are missing from this table, or transaction_amount is also part of the primary key.
	As I do not have enough context and do not want to alter data here, I would make all 5 columns Primary Key (as there 
    is no duplication on this (yet)). Logically, this solution is not good, as transaction_amount could also be duplicated.
*/


CREATE TABLE Transaction (
	id_transaction bigint unsigned,
    id_account bigint unsigned,
    transaction_type char(2),
    transaction_date date,
    transaction_amount float,
    PRIMARY KEY (id_transaction, id_account, transaction_type, transaction_date, transaction_amount),
    FOREIGN KEY (id_account) REFERENCES Account(id_account));

ALTER DATABASE assignment CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci;
ALTER TABLE Person CONVERT TO CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
