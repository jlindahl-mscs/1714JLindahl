--Joslyn Lindahl
--Exercise 2B Summary Queries
--Property Manager Db

--2b.1) Building table, Count all buildings
SELECT        COUNT(*) AS [Count All Buildings]
FROM            Building

--2b.2) Building table, Count, Buildings in Winona
SELECT        COUNT(*) AS [Buildings in Winona]
FROM            Building
GROUP BY City
HAVING        (City = N'Winona')

--2b.3) Apartment table, Average rent of all apartments
SELECT        AVG(Rent) AS [Average Rent]
FROM            Apartment

--2b.4) Apartment table, Total rent, Apartments in building 1
SELECT        SUM(Rent) AS [Bldg1 Total Rent]
FROM            Apartment
GROUP BY BuildingId
HAVING        (BuildingId = 1)

--2b.5) Apartment table, Cheapest rent, building 2
SELECT        MIN(DISTINCT Rent) AS [Bldg2 Cheapest Rent]
FROM            Apartment
GROUP BY BuildingId
HAVING        (BuildingId = 2)

--2b.6) Apartment table, smallest size, avg size, largest size in building1
SELECT        MIN(DISTINCT SquareFeet) AS [Smallest Size], AVG(SquareFeet) AS [Avg Size], MAX(SquareFeet) AS [Largest Size]
FROM            Apartment
GROUP BY BuildingId
HAVING        (BuildingId = 1)

--2b.7) LineItem table, cheapest price, Garage
SELECT        MIN(Amount) AS [Cheapest Garage]
FROM            LineItem
GROUP BY Description
HAVING        (Description = N'Garage')

--2b.8) LineItem table, Total amount billed, gas
SELECT        SUM(Amount) AS [Total Gas Billed]
FROM            LineItem
GROUP BY Description
HAVING        (Description = N'Gas')

--2b.9) LineItem table, total rent, October
SELECT        SUM(Amount) AS [Total October Rent]
FROM            LineItem
GROUP BY Description
HAVING        (Description = N'Rent, October 2018')