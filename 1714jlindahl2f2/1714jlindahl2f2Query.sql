--Joslyn Lindahl
--1714 Exercise 2F Animal Shelter Test Queries
--Animal Shelter Database


--1. All Animals
SELECT        Animals.AnimalName AS Expr1, AnimalTypes.Type, People.FirstName + N' ' + People.LastName AS Owner
FROM            Animals INNER JOIN
                         AnimalTypes ON Animals.AnimalType_Id = AnimalTypes.Id INNER JOIN
                         People ON Animals.Person_Id = People.Id
GROUP BY AnimalTypes.Type, People.FirstName + N' ' + People.LastName, Animals.AnimalName, Animals.Birthdate
ORDER BY Animals.Birthdate

--2. Cash Donations
SELECT        People.LastName + N',' + N' ' + People.FirstName AS Donor, Donations.DonationDate, Donations.Value AS Amount
FROM            Donations INNER JOIN
                         People ON Donations.Person_Id = People.Id
GROUP BY People.LastName + N',' + N' ' + People.FirstName, Donations.DonationDate, Donations.Value, Donations.DonationType_Id
HAVING        (Donations.DonationType_Id = 1)
ORDER BY Donations.DonationDate

--3. Total Donations for each Donor
SELECT        MIN(DISTINCT Donations.Person_Id) AS Id, People.FirstName + N' ' + People.LastName AS Donor, SUM(Donations.Value) AS [Total Donations]
FROM            Donations INNER JOIN
                         People ON Donations.Person_Id = People.Id
GROUP BY People.FirstName + N' ' + People.LastName
ORDER BY Id

--4. Number of Dogs per Owner
SELECT        MIN(DISTINCT People.Id) AS Id, People.LastName + N',' + N' ' + People.FirstName AS Owner, COUNT(AnimalTypes.Id) AS [Number of Dogs]
FROM            Animals INNER JOIN
                         People ON Animals.Person_Id = People.Id INNER JOIN
                         AnimalTypes ON Animals.AnimalType_Id = AnimalTypes.Id
GROUP BY AnimalTypes.Type, People.LastName + N',' + N' ' + People.FirstName
HAVING        (COUNT(AnimalTypes.Id) = 1) AND (AnimalTypes.Type = N'Dog')
ORDER BY Id DESC