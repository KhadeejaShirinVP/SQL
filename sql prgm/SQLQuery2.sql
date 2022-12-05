create database DemoAPI
USE DemoAPI


CREATE TABLE [dbo].[Users]
(
    [id] [int] NOT NULL,
    [name] [nvarchar](50) NULL,
    [password] [nvarchar](50) NULL

    CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED ([id] ASC),
	CONSTRAINT [FK_Roles] foreign key (id) references User_Roles([User_id])
)

CREATE TABLE [dbo].[Roles]
(
    [id] [int] NOT NULL,
    [name] [nvarchar](50) NULL,

    CONSTRAINT [PK_Roles] PRIMARY KEY CLUSTERED ([id] ASC),
	CONSTRAINT [FKasf] foreign key (id) references User_Roles([Role_id])
)
drop table Roles

drop table [dbo].[Users]


INSERT Users
Select 1,'sasff',3414
CREATE TABLE [dbo].[Roles]
(
    [id] [int] NOT NULL,
    [name] [nvarchar](50) NULL,

    CONSTRAINT [PK_Roles] PRIMARY KEY CLUSTERED ([id] ASC)
)

INSERT INTO Roles VALUES(1,'Customer')
insert into Roles values(2,'Contractor')

CREATE TABLE [dbo].[User_Roles]
(  
    [User_id] [int] NOT NULL,
    [Role_id] [int] NOT NULL,
	

    CONSTRAINT [PK_User_Roles] PRIMARY KEY ([User_id]),
	CONSTRAINT [UQ_Key] UNIQUE (Role_id)
)

drop table Users

drop table User_Roles

SELECT * FROM [dbo].[Users]
SELECT * FROM [dbo].[Roles]
SELECT * FROM [dbo].[User_Roles]