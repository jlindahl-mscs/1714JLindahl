-- Joslyn Lindahl 
--1714 Exercise 2E

--2E.1) Building name and location, Columns: BuildingName, Address, City+State+Zip, filter Winona, MN
SELECT        BuildingName, Address, City + N',' + N' ' + State + N' ' + Zip AS [City State Zip]
FROM            Building
WHERE        (City = N'Winona')

--2E.2) Apartment estimated rent, columns: BuildingName, ApartmentNum, SquareFeet * 0.9 plus 100.00 per bathroom, filter Red Wing
SELECT        Building.BuildingName, Apartment.ApartmentNum, Apartment.SquareFeet * 0.9 + Apartment.Bathrooms * 100 AS [Estimated Rent]
FROM            Apartment INNER JOIN
                         Building ON Apartment.BuildingId = Building.BuildingId
WHERE        (Building.City = N'Red Wing')
GROUP BY Building.BuildingName, Apartment.ApartmentNum, Apartment.SquareFeet * 0.9 + Apartment.Bathrooms * 100, Apartment.Bathrooms

-- 2E.3) 2E.3Estimated vs actual rent, columns:  BuildingName, ApartmentNum, Rent, EstimatedRent, Rent - EstimatedRent, filter Red Wing, MN
SELECT        Building.BuildingName, Apartment.ApartmentNum, Apartment.Rent, Apartment.SquareFeet * 0.9 + Apartment.Bathrooms * 100 AS [Estimated Rent], Apartment.Rent - (Apartment.SquareFeet * 0.9 + Apartment.Bathrooms * 100) 
                         AS Difference
FROM            Apartment INNER JOIN
                         Building ON Apartment.BuildingId = Building.BuildingId
GROUP BY Building.BuildingName, Apartment.ApartmentNum, Apartment.Rent, Apartment.SquareFeet * 0.9 + Apartment.Bathrooms * 100, Building.City, Apartment.Rent - (Apartment.SquareFeet * 0.9 + Apartment.Bathrooms * 100)
HAVING        (Building.City = N'Red Wing')

-- 2E.4) Invoice total columns: BuildingId, ApartmentNum, Tenant FirstName+LastName, InvoiceDate, total LineItem.Amount
SELECT        Apartment.BuildingId, Apartment.ApartmentNum, Person.FirstName + N' ' + Person.LastName AS Name, Invoice.InvoiceDate, SUM(LineItem.Amount) AS InvoiceTotal
FROM            Invoice INNER JOIN
                         Apartment ON Invoice.ApartmentId = Apartment.ApartmentId INNER JOIN
                         Person ON Apartment.TenantId = Person.PersonId INNER JOIN
                         LineItem ON Invoice.InvoiceId = LineItem.InvoiceId
GROUP BY Apartment.BuildingId, Apartment.ApartmentNum, Person.FirstName + N' ' + Person.LastName, Invoice.InvoiceDate


--2E.5) Invoice total and receipt BuildingId, ApartmentNum, Tenant FirstName+LastName, InvoiceDate, total LineItem.Amount, Receipt.Amount
SELECT        Apartment.BuildingId, Apartment.ApartmentNum, Person.FirstName + N' ' + Person.LastName AS Name, Invoice.InvoiceDate, SUM(LineItem.Amount) AS InvoiceTotal, Receipt.Amount
FROM            Invoice INNER JOIN
                         Apartment ON Invoice.ApartmentId = Apartment.ApartmentId INNER JOIN
                         Person ON Apartment.TenantId = Person.PersonId INNER JOIN
                         LineItem ON Invoice.InvoiceId = LineItem.InvoiceId INNER JOIN
                         Receipt ON Invoice.InvoiceId = Receipt.InvoiceId
GROUP BY Apartment.BuildingId, Apartment.ApartmentNum, Person.FirstName + N' ' + Person.LastName, Invoice.InvoiceDate, Receipt.Amount

--2E.6) Invoice total vs received columns: BuildingId, ApartmentNum, Tenant FirstName+LastName, InvoiceDate, total LineItem.Amount, Receipt.Amount, total LineItem.Amount - Receipt.Amount Received less than total Invoice.Amount
SELECT        Building.BuildingId, Apartment.ApartmentNum, Person.FirstName + N' ' + Person.LastName AS Name, Invoice.InvoiceDate, SUM(LineItem.Amount) AS [Invoice Total], Receipt.Amount AS Received, SUM(LineItem.Amount) 
                         - Receipt.Amount AS Difference
FROM            Building INNER JOIN
                         Apartment ON Building.BuildingId = Apartment.BuildingId INNER JOIN
                         Invoice ON Apartment.ApartmentId = Invoice.ApartmentId INNER JOIN
                         Receipt ON Invoice.InvoiceId = Receipt.InvoiceId INNER JOIN
                         LineItem ON Invoice.InvoiceId = LineItem.InvoiceId INNER JOIN
                         Person ON Apartment.TenantId = Person.PersonId
GROUP BY Building.BuildingId, Apartment.ApartmentNum, Person.FirstName + N' ' + Person.LastName, Invoice.InvoiceDate, Receipt.Amount
HAVING        (SUM(LineItem.Amount) > Receipt.Amount)

--2E.7) 2E.7 Late payments columns: BuildingId, ApartmentNum, tenant FirstName+LastName, days late, filter days late > 0
SELECT        Apartment.BuildingId, Apartment.ApartmentNum, Person.FirstName + N' ' + Person.LastName AS Name, Invoice.DueDate, Receipt.ReceiptDate, DATEDIFF(DAY, Invoice.DueDate, Receipt.ReceiptDate) AS [Days Late]
FROM            Apartment INNER JOIN
                         Person ON Apartment.TenantId = Person.PersonId INNER JOIN
                         Invoice ON Apartment.ApartmentId = Invoice.ApartmentId INNER JOIN
                         Receipt ON Invoice.InvoiceId = Receipt.InvoiceId
GROUP BY Apartment.BuildingId, Apartment.ApartmentNum, Person.FirstName + N' ' + Person.LastName, Invoice.DueDate, Receipt.ReceiptDate, DATEDIFF(DAY, Invoice.DueDate, Receipt.ReceiptDate)
HAVING        (DATEDIFF(DAY, Invoice.DueDate, Receipt.ReceiptDate) > 0)

-- 2E.8) Next InvoiceDate columns: PersonId, tenant FirstName + LastName, most recent InvoiceDate, most recent InvoiceDate + 1 month
SELECT        Person.PersonId, Person.FirstName + N' ' + Person.LastName AS Tenant, MAX(Invoice.InvoiceDate) AS [Recent Invoice], DATEADD(month, 1, MAX(Invoice.InvoiceDate)) AS [Next Invoice]
FROM            Person INNER JOIN
                         Apartment ON Person.PersonId = Apartment.TenantId INNER JOIN
                         Invoice ON Apartment.ApartmentId = Invoice.ApartmentId
GROUP BY Person.PersonId, Person.FirstName + N' ' + Person.LastName