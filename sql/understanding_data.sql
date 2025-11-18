-- List all tables in the database.

SELECT *
FROM sqlite_master
WHERE type = 'table';

-- Display the first five rows of the following tables: Customer, Invoice, InvoiceLine, Track.

SELECT *
FROM Customer c
LIMIt 5;


SELECT *
FROM Invoice i
LIMIT 5;


SELECT *
FROM InvoiceLine il
LIMIT 5;


SELECT *
FROM Track t
LIMIT 5;