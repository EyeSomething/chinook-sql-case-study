-- Count the number of customers in each country.

SELECT c.Country, COUNT (*) AS number_of_customers
FROM Customer c
GROUP BY c.Country
ORDER BY number_of_customers DESC;

-- Find the top 10 customers based on total spending.

SELECT i.CustomerId, Sum(i.total) AS total_sales
FROM Invoice i
GROUP BY i.CustomerId
ORDER BY total_sales DESC
LIMIT 10;

-- Identify which employee supports the most customers.

SELECT c.SupportRepId, COUNT (*) AS number_of_customers
FROM Customer c 
GROUP BY c.SupportRepId
ORDER BY number_of_customers DESC;

-- Find customers who created more than five invoices.

SELECT i.CustomerId, COUNT (*) as number_of_invoices
FROM Invoice i
GROUP BY i.CustomerId
HAVING number_of_invoices > 5
ORDER BY number_of_invoices DESC