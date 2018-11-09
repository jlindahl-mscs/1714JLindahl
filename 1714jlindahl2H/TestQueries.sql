--Joslyn Lindahl
--Exercise 2H
--Test Queries
-- 11/08/2018

--1. Books using tables Books, Authors, Genres
SELECT        Books.Id AS BookId, Books.Title, Authors.FirstName + N' ' + Authors.LastName AS Author, Genres.Description AS Genre, Books.ISBN
FROM            Authors INNER JOIN
                         Books ON Authors.Id = Books.Author_Id INNER JOIN
                         Genres ON Books.Genre_Id = Genres.Id
GROUP BY Books.Id, Books.Title, Authors.FirstName + N' ' + Authors.LastName, Genres.Description, Books.ISBN

--2. Borrowers
SELECT        Transactions.Borrower_Id, People.LastName, People.FirstName
FROM            Transactions INNER JOIN
                         People ON Transactions.Borrower_Id = People.Id



--3. Lenders 
SELECT        Transactions.Lender_Id, People.LastName + N', ' + People.FirstName AS Lender
FROM            People INNER JOIN
                         Transactions ON People.Id = Transactions.Lender_Id


--4. Books by Lender & Date checked out and date returned 
SELECT        Transactions.Lender_Id, People.LastName + N', ' + People.FirstName AS Lender, Books.Title, Transactions.DateBorrowed, Transactions.DateReturned
FROM            People INNER JOIN
                         Transactions ON People.Id = Transactions.Lender_Id INNER JOIN
                         Books ON Transactions.Book_Id = Books.Id
GROUP BY Transactions.Lender_Id, People.LastName + N', ' + People.FirstName, Books.Title, Transactions.DateBorrowed, Transactions.DateReturned