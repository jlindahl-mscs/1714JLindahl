--Joslyn Lindahl
--1714 Exercise 2D

--2D.1) Building, Apartment and Administrator, BuildingId,BuildingName,City,ApartmentNum,FirstName, LastName
SELECT        Building.BuildingId, Building.BuildingName, Building.City, Apartment.ApartmentNum, Person.FirstName, Person.LastName
FROM            Building INNER JOIN
                         Apartment ON Building.BuildingId = Apartment.BuildingId INNER JOIN
                         Person ON Apartment.AdminId = Person.PersonId
ORDER BY Building.City, Building.BuildingName, Person.FirstName, Person.LastName


--2D.2) Tenants,Buildings,Apartments, columns: PersonId,LastName,FirstName,City,BuildingId,BuildingName,ApartmentNum, sort by LastName,FirstName, BuildingId
SELECT        Person.PersonId, Person.LastName, Person.FirstName, Building.City, Building.BuildingId, Building.BuildingName, Apartment.ApartmentNum
FROM            Person INNER JOIN
                         Apartment ON Person.PersonId = Apartment.TenantId INNER JOIN
                         Building ON Apartment.BuildingId = Building.BuildingId
ORDER BY Person.LastName, Person.FirstName, Building.BuildingId

--2D.3) Apartment,tenant,Invoice, LineItems, columns: ApartmentNum,LastName,FirstName,InvoiceId,InvoiceDate,Description,Amount, filter BuildingId 1, sorty by ApartmentNum,LastName,FirstName, InvoiceDate
SELECT        Apartment.ApartmentNum, Person.LastName, Person.FirstName, LineItem.InvoiceId, Invoice.InvoiceDate, LineItem.Description, LineItem.Amount
FROM            Apartment INNER JOIN
                         Person ON Apartment.TenantId = Person.PersonId INNER JOIN
                         Invoice ON Apartment.ApartmentId = Invoice.ApartmentId INNER JOIN
                         LineItem ON Invoice.InvoiceId = LineItem.InvoiceId
WHERE        (Apartment.BuildingId = 1)
ORDER BY Apartment.ApartmentNum, Person.LastName, Person.FirstName, Invoice.InvoiceDate

--2D.4) Apartment, tenant,invoice total, columns: BuildingId, ApartmentId, LastName,FirstName, InvoiceId,InvoiceDate,Invoice Total
SELECT        Apartment.BuildingId, Apartment.ApartmentId, Person.LastName, Person.FirstName, Invoice.InvoiceId, Invoice.InvoiceDate, SUM(LineItem.Amount) AS [Invoice Total]
FROM            Apartment INNER JOIN
                         Person ON Apartment.TenantId = Person.PersonId INNER JOIN
                         Invoice ON Apartment.ApartmentId = Invoice.ApartmentId INNER JOIN
                         LineItem ON Invoice.InvoiceId = LineItem.InvoiceId
GROUP BY Apartment.BuildingId, Apartment.ApartmentId, Person.LastName, Person.FirstName, Invoice.InvoiceId, Invoice.InvoiceDate

--2D.5) Invoice, tenant, receipt tables, InvoiceId, InvoiceDate, BuildingId, ApartmentNum, LastName, FirstName, ReceiptDate, Receipt.Amount
SELECT        Invoice.InvoiceId, Invoice.InvoiceDate, Apartment.BuildingId, Apartment.ApartmentNum, Person.LastName, Person.FirstName, Receipt.ReceiptDate, Receipt.Amount
FROM            Invoice INNER JOIN
                         Receipt ON Invoice.InvoiceId = Receipt.InvoiceId INNER JOIN
                         Apartment ON Invoice.ApartmentId = Apartment.ApartmentId INNER JOIN
                         Person ON Apartment.TenantId = Person.PersonId
GROUP BY Invoice.InvoiceId, Invoice.InvoiceDate, Apartment.BuildingId, Apartment.ApartmentNum, Person.LastName, Person.FirstName, Receipt.ReceiptDate, Receipt.Amount
ORDER BY Invoice.InvoiceDate, Receipt.ReceiptDate

--2D.6) Invoice, tenant, apartment, billed, received, columns: InvoiceId, InvoiceDate, LastName, BuildingId, ApartmentNum, total billed, recieved
SELECT        Invoice.InvoiceId, Invoice.InvoiceDate, Person.LastName, Apartment.BuildingId, Apartment.ApartmentNum, SUM(LineItem.Amount) AS [Total Billed], Receipt.Amount AS Recieved
FROM            Invoice INNER JOIN
                         Apartment ON Invoice.ApartmentId = Apartment.ApartmentId INNER JOIN
                         Person ON Apartment.TenantId = Person.PersonId INNER JOIN
                         LineItem ON Invoice.InvoiceId = LineItem.InvoiceId INNER JOIN
                         Receipt ON Invoice.InvoiceId = Receipt.InvoiceId
GROUP BY Invoice.InvoiceId, Invoice.InvoiceDate, Person.LastName, Apartment.BuildingId, Apartment.ApartmentNum, Receipt.Amount

--2D.7) Administrator, invoice, total billed, received, columns: PersonId, admin LastName, InvoiceId, InvoiceDate, total billed, received
SELECT        Apartment.AdminId AS PersonId, Person.LastName AS Admin, Invoice.InvoiceId, Invoice.InvoiceDate, SUM(LineItem.Amount) AS [Total Billed], Receipt.Amount AS Recieved
FROM            LineItem INNER JOIN
                         Invoice ON LineItem.InvoiceId = Invoice.InvoiceId INNER JOIN
                         Receipt ON Invoice.InvoiceId = Receipt.InvoiceId INNER JOIN
                         Apartment ON Invoice.ApartmentId = Apartment.ApartmentId INNER JOIN
                         Person ON Apartment.AdminId = Person.PersonId
GROUP BY Apartment.AdminId, Person.LastName, Invoice.InvoiceId, Invoice.InvoiceDate, Receipt.Amount
ORDER BY Recieved