--Joslyn Lindahl 1714 
--Exercise 2C
--Summary queries, Groups and Joins

--2c1) Building table, State,City, count buildings
SELECT        State, City, COUNT(*) AS [Building Count]
FROM            Building
GROUP BY State, City

--2c2) Building table, City, count Buildings, group by City, filter MN
SELECT        City, COUNT(*) AS [Building Count]
FROM            Building
GROUP BY City, State
HAVING        (State = N'MN')
ORDER BY City

--2c3) Building & Apartment table, BuildingNum,BuildingName,average rent, group by BuildingNum, BuildingName
SELECT        Building.BuildingId, Building.BuildingName, AVG(Apartment.Rent) AS [Average Rent]
FROM            Apartment INNER JOIN
                         Building ON Apartment.BuildingId = Building.BuildingId
GROUP BY Building.BuildingId, Building.BuildingName
ORDER BY Building.BuildingId

--2c4)Building & Apartment Table City, total Rent, filter MN
SELECT        Building.City, Building.BuildingName, SUM(Apartment.Rent) AS [Total Rent]
FROM            Apartment INNER JOIN
                         Building ON Apartment.BuildingId = Building.BuildingId
GROUP BY Building.City, Building.BuildingName, Building.State
HAVING        (Building.State = N'MN')

--2c5) Building and Apartment tables, Cheapest rent, group by city
SELECT        Building.City, MIN(Apartment.Rent) AS [Cheapest Rent]
FROM            Apartment INNER JOIN
                         Building ON Apartment.BuildingId = Building.BuildingId
GROUP BY Building.City
ORDER BY Building.City

--2c6) Building & Apartment tables, BuildingName, Smallest size, average size, largest size, group by BuildingName, filter Available in Winona
SELECT        Building.BuildingName, MIN(Apartment.SquareFeet) AS [Smallest Size], AVG(Apartment.SquareFeet) AS [Average Size], MAX(Apartment.SquareFeet) AS [Largest Size]
FROM            Apartment INNER JOIN
                         Building ON Apartment.BuildingId = Building.BuildingId
GROUP BY Building.BuildingName, Building.City, Apartment.TenantId
HAVING        (Building.City = N'Winona') AND (Apartment.TenantId IS NULL)
ORDER BY Building.BuildingName

--2c7) Invoice & LineItem tables, InvoiceId column, cheapest price column, filter garage during september 2018
SELECT        MIN(LineItem.Amount) AS [Cheapest Garage Sept2018]
FROM            Invoice INNER JOIN
                         LineItem ON Invoice.InvoiceId = LineItem.InvoiceId
GROUP BY Invoice.InvoiceId, LineItem.Description, Invoice.InvoiceDate
HAVING        (LineItem.Description = N'Garage') AND (Invoice.InvoiceDate = CONVERT(DATETIME, '2018-09-21 00:00:00', 102)) AND (MIN(LineItem.Amount) = 60)

--2c8) Invoice and LineItem tables, InvoiceID,total amount billed, group by InvoiceId, filter by September 2018
SELECT        Invoice.InvoiceId, SUM(LineItem.Amount) AS [Total Amount]
FROM            Invoice INNER JOIN
                         LineItem ON Invoice.InvoiceId = LineItem.InvoiceId
GROUP BY Invoice.InvoiceId, Invoice.DueDate
HAVING        (Invoice.DueDate = CONVERT(DATETIME, '2018-10-01 00:00:00', 102))
ORDER BY Invoice.InvoiceId