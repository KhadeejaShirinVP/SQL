/*type of user*/
create table Type_User(id int unique ,user_type varchar(30) primary key not null ,duration datetime default (getdate()))
insert into Type_User values(1,'customer',GETDATE())
insert into Type_User values(2,'contractor',GETDATE())

drop table Type_User

select * from Type_User

/*state */
create table state_name (stateId int primary key ,stateName varchar(30) unique not null)

select * from state_name



/*city */
create table city_name(cityId int primary key,cityName varchar(30) not null)

drop table city_name
select * from city_name

 /*map*/
 create table Map(latitude float unique not null,longitude float unique not null,PlaceID float primary key)
 --insert into Map values(12.9716, 77.5946 )
 select * from Map

  drop table Map


 /*Gender*/
 create table Gender(genderID int primary key,genderName varchar(30) unique not null)
 insert into Gender values(1,'male')
 insert into Gender values(2,'female')
 insert into Gender values(3,'others')
 select * from Gender


 /*user details*/
 create table User_Details(userId int primary key identity(1,1),firstName varchar(30),lastName varchar(30),
 typeUser int foreign key references Type_User(id),
 gender int foreign key references Gender(genderID),mailId varchar(30) unique not null,password varchar(30) not null,
 phoneNumber bigint unique not null,stateName int foreign key references state_name(stateId),
 CityName int foreign key references city_name(cityId))

 drop table User_Details
 drop table Gender
 drop table city_name
 drop table state_name
 drop table Contractor_details
 drop table Service_Details


-- /* Service table*/
-- create table Service_Details(Service_ID int unique not null,_Service_Name varchar (30) primary key not null)

--select * from Service_Details

--drop table Service_Details

-- /* contractor details*/
-- create table Contractor_details(contractorID int foreign key references User_Details(userId),companyName varchar(30),License varchar(30) unique not null,
--								serviceName varchar(30) foreign key references Service_Details (_Service_Name),  
--								Latittude float foreign key references Map(latitude),longitude float foreign key references Map(longitude),Pincode bigint )

--select * from Contractor_details
drop table Contractor_details
drop table Service_providing


/*service table*/
create table Service_providing (serviceId int  primary key,ServiceName varchar(30) unique not null)


/*contractor details*/
create table Contractor_details (ContractorId int foreign key references User_Details(userId),CompanyName varchar(30),license varchar(30) primary key not null,
[Services] int foreign key references Service_providing(serviceId),[Location] float foreign key references Map(PlaceID))

--create table Contractor_details (ContractorId int foreign key references User_Details(userId),CompanyName varchar(30),license varchar(30) primary key not null,
--[Services] int foreign key references Service_providing(serviceId),Latitude float foreign key references Map(latitude),Longitude float foreign key references Map(longitude)
--)


select * from Contractor_details