create database Contractor_FindingDemo
use Contractor_FindingDemo


create table User_Type (typeId int primary key ,usertype varchar(30))
insert into User_Type values (1,'customer')
insert into User_Type values(2,'contractor')

select *from Tb_User

drop table User_Type

create table Tb_User(
UserId int primary key identity(1,1),
TypeUser int foreign key references User_Type(typeId),
FirstName varchar(30)not null,
LastName varchar(30),
EmailId varchar(30) unique not null,
[Password] varchar(30) not null,
PhoneNumber bigint not null,
CreatedDate datetime,
UpdatedDate Datetime,
Active bit);

delete from Tb_User

drop table Tb_User

select*from Tb_User


create table Tb_Gender(GenderId int primary key ,GenderType varchar(30))
insert into Tb_Gender values(1,'Male')
insert into Tb_Gender values (2,'Female')
insert into Tb_Gender values (3,'Others')

drop table Tb_Gender

/*service table*/
create table Service_providing (ServiceId int primary key ,ServiceName varchar(50)unique)
insert into Service_providing values (1,'Interior')
insert into Service_providing values (2,'Exterior')
insert into Service_providing values (3,'exterior and Interior')

select * from Service_providing
drop table Service_providing

/*contractor details*/
create table Contractor_details (ContractorId int foreign key references Tb_User(UserId),
CompanyName varchar(30)not null,
Gender int foreign key references Tb_Gender(GenderId),
license varchar(30) primary key,
[Services] int foreign key references Service_providing(ServiceId),
Lattitude float ,
Longitude float,
Pincode int not null,
phoneNumber bigint)

drop table Contractor_details

 --/*map*/
 --create table Map(latitude float unique not null,longitude float unique not null,PlaceID float primary key)
 ----insert into Map values(12.9716, 77.5946 )
 --select * from Ma

 create table Tb_Building(ID int primary key,Building varchar(30) unique)
 insert into Tb_Building values(1,'individual')
 insert into Tb_Building values (2,'Apartment')

create table Tb_Customer(Land_sqft float not null,
RegistrationNo varchar (30) primary key,
Building_Type int foreign key references Tb_Building(ID),
Lattitude float ,
Longitude float,
Pincode int not null)


 --drop table Contractor_details
 --drop table Service_providing
 --drop table Tb_Gender
 --drop table Tb_User
 --drop table User_Type


 select * from  Contractor_details
select * from Service_providing
select * from Tb_Gender
select * from User_Type
select * from Tb_User
select * from Tb_Building
select * from Tb_Customer

 select * from  Contractor_details
 select * from Tb_User