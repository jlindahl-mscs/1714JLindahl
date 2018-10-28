
-- --------------------------------------------------
-- Entity Designer DDL Script for SQL Server 2005, 2008, 2012 and Azure
-- --------------------------------------------------
-- Date Created: 10/26/2018 16:54:09
-- Generated from EDMX file: C:\Users\Josly\Desktop\INTRO TO VISUAL DATABASE APPLICATION TOOLS\1714JLindahl\jlindahl2f\AnimalShelterModel.edmx
-- --------------------------------------------------

SET QUOTED_IDENTIFIER OFF;
GO
USE [jlindahl2f];
GO
IF SCHEMA_ID(N'dbo') IS NULL EXECUTE(N'CREATE SCHEMA [dbo]');
GO

-- --------------------------------------------------
-- Dropping existing FOREIGN KEY constraints
-- --------------------------------------------------


-- --------------------------------------------------
-- Dropping existing tables
-- --------------------------------------------------


-- --------------------------------------------------
-- Creating all tables
-- --------------------------------------------------

-- Creating table 'AnimalTypes'
CREATE TABLE [dbo].[AnimalTypes] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Type] nvarchar(20)  NOT NULL
);
GO

-- Creating table 'Animals'
CREATE TABLE [dbo].[Animals] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [AnimalName] nvarchar(max)  NOT NULL,
    [Birthdate] datetime  NOT NULL,
    [Description] nvarchar(50)  NOT NULL,
    [AnimalType_Id] int  NOT NULL,
    [Person_Id] int  NOT NULL
);
GO

-- Creating table 'People'
CREATE TABLE [dbo].[People] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Title] nvarchar(5)  NOT NULL,
    [FirstName] nvarchar(25)  NOT NULL,
    [LastName] nvarchar(35)  NOT NULL,
    [Phone] nvarchar(15)  NOT NULL
);
GO

-- Creating table 'DonationTypes'
CREATE TABLE [dbo].[DonationTypes] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Description] nvarchar(15)  NOT NULL
);
GO

-- Creating table 'Donations'
CREATE TABLE [dbo].[Donations] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [DonationDate] datetime  NOT NULL,
    [Value] decimal(18,0)  NOT NULL,
    [Person_Id] int  NOT NULL,
    [DonationType_Id] int  NOT NULL
);
GO

-- --------------------------------------------------
-- Creating all PRIMARY KEY constraints
-- --------------------------------------------------

-- Creating primary key on [Id] in table 'AnimalTypes'
ALTER TABLE [dbo].[AnimalTypes]
ADD CONSTRAINT [PK_AnimalTypes]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'Animals'
ALTER TABLE [dbo].[Animals]
ADD CONSTRAINT [PK_Animals]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'People'
ALTER TABLE [dbo].[People]
ADD CONSTRAINT [PK_People]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'DonationTypes'
ALTER TABLE [dbo].[DonationTypes]
ADD CONSTRAINT [PK_DonationTypes]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'Donations'
ALTER TABLE [dbo].[Donations]
ADD CONSTRAINT [PK_Donations]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- --------------------------------------------------
-- Creating all FOREIGN KEY constraints
-- --------------------------------------------------

-- Creating foreign key on [AnimalType_Id] in table 'Animals'
ALTER TABLE [dbo].[Animals]
ADD CONSTRAINT [FK_AnimalTypeAnimal]
    FOREIGN KEY ([AnimalType_Id])
    REFERENCES [dbo].[AnimalTypes]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_AnimalTypeAnimal'
CREATE INDEX [IX_FK_AnimalTypeAnimal]
ON [dbo].[Animals]
    ([AnimalType_Id]);
GO

-- Creating foreign key on [Person_Id] in table 'Animals'
ALTER TABLE [dbo].[Animals]
ADD CONSTRAINT [FK_PersonAnimal]
    FOREIGN KEY ([Person_Id])
    REFERENCES [dbo].[People]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_PersonAnimal'
CREATE INDEX [IX_FK_PersonAnimal]
ON [dbo].[Animals]
    ([Person_Id]);
GO

-- Creating foreign key on [Person_Id] in table 'Donations'
ALTER TABLE [dbo].[Donations]
ADD CONSTRAINT [FK_PersonDonation]
    FOREIGN KEY ([Person_Id])
    REFERENCES [dbo].[People]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_PersonDonation'
CREATE INDEX [IX_FK_PersonDonation]
ON [dbo].[Donations]
    ([Person_Id]);
GO

-- Creating foreign key on [DonationType_Id] in table 'Donations'
ALTER TABLE [dbo].[Donations]
ADD CONSTRAINT [FK_DonationTypeDonation]
    FOREIGN KEY ([DonationType_Id])
    REFERENCES [dbo].[DonationTypes]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_DonationTypeDonation'
CREATE INDEX [IX_FK_DonationTypeDonation]
ON [dbo].[Donations]
    ([DonationType_Id]);
GO

-- --------------------------------------------------
-- Script has ended
-- --------------------------------------------------