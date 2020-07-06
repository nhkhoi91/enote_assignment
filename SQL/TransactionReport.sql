DROP TEMPORARY TABLE IF EXISTS month_table;
CREATE TEMPORARY TABLE month_table AS
SELECT * 
FROM (
select * from 
(select adddate('1970-01-01',t4*10000 + t3*1000 + t2*100 + t1*10 + t0) gen_date from
 (select 0 t0 union select 1 union select 2 union select 3 union select 4 union select 5 union select 6 union select 7 union select 8 union select 9) t0,
 (select 0 t1 union select 1 union select 2 union select 3 union select 4 union select 5 union select 6 union select 7 union select 8 union select 9) t1,
 (select 0 t2 union select 1 union select 2 union select 3 union select 4 union select 5 union select 6 union select 7 union select 8 union select 9) t2,
 (select 0 t3 union select 1 union select 2 union select 3 union select 4 union select 5 union select 6 union select 7 union select 8 union select 9) t3,
 (select 0 t4 union select 1 union select 2 union select 3 union select 4 union select 5 union select 6 union select 7 union select 8 union select 9) t4) v
WHERE gen_date between '2020-02-15' and '2020-06-06') t1
JOIN (SELECT 1234 id_person union SELECT 345) t2;

SELECT month_table.id_person, date_format(gen_date, '%m.%Y') as month, COALESCE(sum(t2.transaction_amount), 0)
FROM month_table 
LEFT JOIN 
(SELECT person.id_person as id_person, transaction_date, transaction_amount
FROM transaction
JOIN account ON transaction.id_account = account.id_account
JOIN person ON account.id_person = person.id_person
WHERE person.id_person IN (1234, 345)
AND transaction_date BETWEEN date('2020-02-15') AND date('2020-06-06')
) t2
ON month_table.id_person = t2.id_person AND month_table.gen_date = t2.transaction_date
GROUP BY id_person, date_format(gen_date, '%m.%Y')
ORDER BY month_table.id_person DESC, month;