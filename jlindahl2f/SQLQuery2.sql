-- DonationTypes
SET IDENTITY_INSERT [dbo].[DonationTypes] ON 
GO
INSERT [dbo].[DonationTypes] ([Id], [Description]) VALUES (1, N'Cash')
GO
INSERT [dbo].[DonationTypes] ([Id], [Description]) VALUES (2, N'Dog food')
GO
INSERT [dbo].[DonationTypes] ([Id], [Description]) VALUES (3, N'Cat food')
GO
INSERT [dbo].[DonationTypes] ([Id], [Description]) VALUES (4, N'Cages')
GO
INSERT [dbo].[DonationTypes] ([Id], [Description]) VALUES (5, N'Miscellaneous')
GO
SET IDENTITY_INSERT [dbo].[DonationTypes] OFF
GO
-- AnimalTypes
SET IDENTITY_INSERT [dbo].[AnimalTypes] ON 
GO
INSERT [dbo].[AnimalTypes] ([Id], [Type]) VALUES (1, N'Dog')
GO
INSERT [dbo].[AnimalTypes] ([Id], [Type]) VALUES (2, N'Cat')
GO
INSERT [dbo].[AnimalTypes] ([Id], [Type]) VALUES (3, N'Bird')
GO
INSERT [dbo].[AnimalTypes] ([Id], [Type]) VALUES (4, N'Fish')
GO
INSERT [dbo].[AnimalTypes] ([Id], [Type]) VALUES (5, N'Reptile')
GO
SET IDENTITY_INSERT [dbo].[AnimalTypes] OFF
GO
-- People
SET IDENTITY_INSERT [dbo].[People] ON 
GO
INSERT [dbo].[People] ([Id], [Title], [FirstName], [LastName], [Phone]) VALUES (101, N'Mr', N'Mark', N'Swanson', N'111-111-1001')
GO
INSERT [dbo].[People] ([Id], [Title], [FirstName], [LastName], [Phone]) VALUES (102, N'Ms', N'Sheela', N'Word', N'111-111-1002')
GO
INSERT [dbo].[People] ([Id], [Title], [FirstName], [LastName], [Phone]) VALUES (103, N'Mr', N'Mikael', N'Sandberg', N'111-111-1003')
GO
INSERT [dbo].[People] ([Id], [Title], [FirstName], [LastName], [Phone]) VALUES (104, N'Mr', N'Arvind', N'Rao', N'111-111-1004')
GO
SET IDENTITY_INSERT [dbo].[People] OFF
GO
-- Animals
SET IDENTITY_INSERT [dbo].[Animals] ON 
GO
INSERT [dbo].[Animals] ([Id], [AnimalType_Id], [Person_Id], [AnimalName], [Birthdate], [Description]) VALUES (1000, 1, 101, N'Chopper', CAST(N'2018-09-21T00:00:00' AS SmallDateTime), N'Vicious Pomeranian')
GO
INSERT [dbo].[Animals] ([Id], [AnimalType_Id], [Person_Id], [AnimalName], [Birthdate], [Description]) VALUES (1001, 2, 102, N'Fluffy', CAST(N'2018-09-22T00:00:00' AS SmallDateTime), N'White, long-hair')
GO
INSERT [dbo].[Animals] ([Id], [AnimalType_Id], [Person_Id], [AnimalName], [Birthdate], [Description]) VALUES (1003, 1, 103, N'Spike', CAST(N'2018-09-23T00:00:00' AS SmallDateTime), N'Black, white spots')
GO
INSERT [dbo].[Animals] ([Id], [AnimalType_Id], [Person_Id], [AnimalName], [Birthdate], [Description]) VALUES (1004, 2, 104, N'Leo', CAST(N'2018-09-24T00:00:00' AS SmallDateTime), N'Tabby')
GO
SET IDENTITY_INSERT [dbo].[Animals] OFF
GO
-- Donations
SET IDENTITY_INSERT [dbo].[Donations] ON 
GO
INSERT [dbo].[Donations] ([Id], [Person_Id], [DonationType_Id], [DonationDate], [Value]) VALUES (101, 101, 1, CAST(N'2018-10-04T00:00:00' AS SmallDateTime), 100.0000)
GO
INSERT [dbo].[Donations] ([Id], [Person_Id], [DonationType_Id], [DonationDate], [Value]) VALUES (102, 102, 1, CAST(N'2018-10-05T00:00:00' AS SmallDateTime), 125.0000)
GO
INSERT [dbo].[Donations] ([Id], [Person_Id], [DonationType_Id], [DonationDate], [Value]) VALUES (103, 102, 1, CAST(N'2018-10-06T00:00:00' AS SmallDateTime), 200.0000)
GO
INSERT [dbo].[Donations] ([Id], [Person_Id], [DonationType_Id], [DonationDate], [Value]) VALUES (104, 104, 1, CAST(N'2018-10-07T00:00:00' AS SmallDateTime), 150.0000)
GO
INSERT [dbo].[Donations] ([Id], [Person_Id], [DonationType_Id], [DonationDate], [Value]) VALUES (105, 101, 2, CAST(N'2018-10-08T00:00:00' AS SmallDateTime), 250.0000)
GO
INSERT [dbo].[Donations] ([Id], [Person_Id], [DonationType_Id], [DonationDate], [Value]) VALUES (106, 102, 1, CAST(N'2018-10-09T00:00:00' AS SmallDateTime), 200.0000)
GO
INSERT [dbo].[Donations] ([Id], [Person_Id], [DonationType_Id], [DonationDate], [Value]) VALUES (107, 103, 4, CAST(N'2018-10-10T00:00:00' AS SmallDateTime), 120.0000)
GO
INSERT [dbo].[Donations] ([Id], [Person_Id], [DonationType_Id], [DonationDate], [Value]) VALUES (108, 104, 1, CAST(N'2018-10-11T00:00:00' AS SmallDateTime), 50.0000)
GO
INSERT [dbo].[Donations] ([Id], [Person_Id], [DonationType_Id], [DonationDate], [Value]) VALUES (109, 101, 3, CAST(N'2018-10-12T00:00:00' AS SmallDateTime), 135.0000)
GO
INSERT [dbo].[Donations] ([Id], [Person_Id], [DonationType_Id], [DonationDate], [Value]) VALUES (110, 102, 5, CAST(N'2018-10-13T00:00:00' AS SmallDateTime), 175.0000)
GO
INSERT [dbo].[Donations] ([Id], [Person_Id], [DonationType_Id], [DonationDate], [Value]) VALUES (111, 103, 2, CAST(N'2018-10-14T00:00:00' AS SmallDateTime), 185.0000)
GO
INSERT [dbo].[Donations] ([Id], [Person_Id], [DonationType_Id], [DonationDate], [Value]) VALUES (112, 104, 3, CAST(N'2018-10-15T00:00:00' AS SmallDateTime), 75.0000)
GO
INSERT [dbo].[Donations] ([Id], [Person_Id], [DonationType_Id], [DonationDate], [Value]) VALUES (113, 101, 2, CAST(N'2018-10-16T00:00:00' AS SmallDateTime), 250.0000)
GO
INSERT [dbo].[Donations] ([Id], [Person_Id], [DonationType_Id], [DonationDate], [Value]) VALUES (114, 102, 3, CAST(N'2018-10-17T00:00:00' AS SmallDateTime), 65.0000)
GO
INSERT [dbo].[Donations] ([Id], [Person_Id], [DonationType_Id], [DonationDate], [Value]) VALUES (115, 101, 5, CAST(N'2018-10-18T00:00:00' AS SmallDateTime), 100.0000)
GO
INSERT [dbo].[Donations] ([Id], [Person_Id], [DonationType_Id], [DonationDate], [Value]) VALUES (116, 104, 5, CAST(N'2018-10-19T00:00:00' AS SmallDateTime), 85.0000)
GO
SET IDENTITY_INSERT [dbo].[Donations] OFF
GO