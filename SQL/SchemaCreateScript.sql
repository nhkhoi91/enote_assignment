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
