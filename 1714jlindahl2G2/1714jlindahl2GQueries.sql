--1714 Joslyn Lindahl
--Exercise 2G

--1. Buildings, Apartments and Admin
SELECT        Buildings.Id, Buildings.BuildingName, Buildings.City, Apartments.ApartmentNum, People.FirstName + N' ' + People.LastName AS Admin
FROM            Apartments INNER JOIN
                         Buildings ON Apartments.Building_Id = Buildings.Id INNER JOIN
                         People ON Apartments.Admin_Id = People.Id
GROUP BY Buildings.Id, Buildings.BuildingName, Buildings.City, Apartments.ApartmentNum, People.FirstName + N' ' + People.LastName, Buildings.State
HAVING        (Buildings.State = N'MN')
ORDER BY Buildings.Id, Apartments.ApartmentNum

--2. Apartments, invoices, line items
SELECT        Buildings.Id AS Building_Id, Apartments.ApartmentNum, People.LastName + N' , ' + People.FirstName AS Tenant, Invoices.Id AS Invoice_Id, LineItems.Description, LineItems.Amount
FROM            Apartments INNER JOIN
                         Buildings ON Apartments.Building_Id = Buildings.Id INNER JOIN
                         Invoices ON Apartments.Id = Invoices.Apartment_Id INNER JOIN
                         LineItems ON Invoices.Id = LineItems.Invoice_Id INNER JOIN
                         People ON Apartments.Tenant_Id = People.Id
GROUP BY Buildings.Id, Apartments.ApartmentNum, People.LastName + N' , ' + People.FirstName, Invoices.Id, LineItems.Description, LineItems.Amount
ORDER BY Apartments.ApartmentNum DESC

--3.Tenants, invoices, receipts
