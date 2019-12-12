-- Multi-Table Query Practice

-- Display the ProductName and CategoryName for all products in the database. Shows 77 records.

select p.ProductName
    , p.ProductName
    , cat.CategoryName
    , *     
from [product] as p

join category as cat
    on p.categoryId = cat.id;

-- Display the order Id and shipper CompanyName for all orders placed before August 9 2012. Shows 429 records.
select o.Id, s.CompanyName
from [order] as o 
join [Shipper] as s on s.id = o.ShipVia
where o.OrderDate <"2012-08-09"

-- Display the name and quantity of the products ordered in order with Id 10251. 
--Sort by ProductName. Shows 3 records.
select distinct s.CompanyName
from [order] as o 
join [Shipper] as s on s.id = o.ShipVia
-- Display the OrderID, Customer's Company Name and the employee's LastName 
--for every order. All columns should be labeled clearly. Displays 16,789 records.
select o.id as OrderId, c.CompanyName as Customer,e.LastName as Employee 
from [Order] as o 
join customer as c 
    on c.Id = o.CustomerId
join employee as e
    on e.Id = o.EmployeeId