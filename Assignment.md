#Assignment
## Section A: Describe yourself

| Area | Knowledge|
|------|----------|
| SQL  | 4        |
| ETL tools <br> 1. Spark + S3 Data Lake + Hive + Presto <br> 2. S3 + Redshift <br> 3. ElasticBeats + Apache Kafka + Elastic Search| 3 <br> I have prior experience with these technologies |
| Reporting/ Analytical tools <br> 1. Pandas <br> 2. Matplotlib/ Pyplot <br> 3. Tableau | 3|

### What database design principle do you know?
Depends on the nature of the application, the choice of database technology should be different, 
leading to different data access patterns, and therefore, different principles when 
designing database. As OLAP and OLTP are two familiar application types for most business 
(and BI role), I would like to discuss briefly the characteristics of each type of application, 
the data access patterns, and the dimensions (in particular: CRUD operations’ velocity, 
computational power needed, availability, reliability, and scalability) that I would 
consider when designing a database. 

* OLTP application: an application used by online business for interacting with customers. 
This type of application is characterized by having huge amount of CRUD operation per seconds, 
a high level of scalability because of the high volatility in the number of transaction and 
time ratio, and a high demand for availability. Computational power, however, is quite low as 
often no sophisticated JOIN is needed). Historically, SQL database with normalization 
(often to third normal form) is used to reduce CRUD running time, as well as to guarantee 
data integrity for the system. However, as SQL is originally designed to work on 
a single server, horizontal scaling for SQL is hard, and often data integrity is temporary 
partly scarified (in terms of not having a strong global consistency according to CAP theorem). 
Lately, NoSQL is adopted to solve the problem of scalability, as it is horizontally 
scalable by design. For NoSQL, the design principle is different from the one for 
SQL database. The most important concepts for NoSQL are PartitionKey and SortKey, 
which are key elements in distributed system. PartitionKey and SortKey should be wisely 
chosen so that one server should not be hit much harder than other servers.
 Also, as there is no JOIN operation in NoSQL, it should be designed as a 1 table for 1 
 service, instead of having multiple tables as in relational database.
 
 * OLAP application: as business also need to analyze and report data to 
 answer business questions, and because these queries takes lots of computational power, 
 a duplication and transformation of the transaction database is often 
 created to satisfy this need. OLAP data access pattern is characterized by having 
 occasionally read and write operations, with often no create or delete at all as data is 
 often dump from OLTP application. 
 The queries, however, are complicated and consume a lot of computational power, 
 as lots of JOIN and GROUP BY are needed to denormalized the data. Therefore, one 
 key principle in designing an OLAP application is to consider having ETL process, 
 where data is denormalized and transform into star schema or snowflake schema before 
 loading into OLAP database. The number of dimension for fact table should be carefully 
 design, as too little dimensions would not carry enough data for analytic, and too many 
 dimensions would take a lot of storage and be confusing. Data integrity rules can be 
 relaxed, as most updated data from OLTP database do not need to be presented in OLAP 
 right away.
 
 ### What are the most valuable books/ courses have you completed in the last 3 years related to data warehouses and business intelligence
 * Logical Database Design Principle by John Garmany, Jeff Walker, Terry Clark
 * Applied Plotting, Charting & Data Representation in Python on Coursera
 