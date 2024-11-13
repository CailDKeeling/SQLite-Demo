/*******************************************************************************
Drop Tables
********************************************************************************/
DROP TABLE IF EXISTS [CUSTOMER];
DROP TABLE IF EXISTS [RENTAL];
DROP TABLE IF EXISTS [VEHICLE];
DROP TABLE IF EXISTS [RATE];
/*******************************************************************************
Create Tables
********************************************************************************/
CREATE TABLE [CUSTOMER]
(
[CustID] INTEGER,
[Name] NVARCHAR(160) NOT NULL,
[Phone] NVARCHAR(30),
CONSTRAINT [PK_Customer] PRIMARY KEY ([CustID])
);
CREATE TABLE [RENTAL]
(
[CustID] INTEGER NOT NULL,
[VehicleID] INTEGER NOT NULL,
[StartDate] DATE,
[OrderDate] DATE,
[RentalType] INTEGER,
[Qty] INTEGER,
[ReturnDate] DATE,
[TotalAmount] INTEGER,
[PaymentDate] DATE,
FOREIGN KEY ([CustID]) REFERENCES [CUSTOMER]([CustID])
ON DELETE NO ACTION ON UPDATE NO ACTION,
FOREIGN KEY ([VehicleID]) REFERENCES [VEHICLE]([VehicleID])
ON DELETE NO ACTION ON UPDATE NO ACTION
);
CREATE TABLE [VEHICLE]
(
[VehicleID] NVARCHAR(160) NOT NULL,
[Description] NVARCHAR(160) NOT NULL,
[Year] INTEGER NOT NULL,
[Type] INTEGER NOT NULL,
[Category] INTEGER NOT NULL,
CONSTRAINT [PK_Vehicle] PRIMARY KEY ([VehicleID]),
FOREIGN KEY ([Type]) REFERENCES [RATE]([Type])
ON DELETE NO ACTION ON UPDATE NO ACTION,
FOREIGN KEY ([Category]) REFERENCES [RATE]([Category])
ON DELETE NO ACTION ON UPDATE NO ACTION
);
CREATE TABLE [RATE]
(
[Type] INTEGER NOT NULL,
[Category] INTEGER NOT NULL,
[Weekly] INTEGER NOT NULL,
[Daily] INTEGER NOT NULL,
CONSTRAINT [PK_RATE] PRIMARY KEY ([Type],[Category])
);
