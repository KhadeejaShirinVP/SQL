create database task1;
create table Employee
(
EmpID INT not null primary key,
EmpName varchar(100),
EmpAge int,
SalaryID int not null,
DepID int NOT NULL
);

insert into Employee(EmpID,EmpName,EmpAge,SalaryID,DepID) values (101,'Pavan',34,211,260000);
insert into Employee(EmpID,EmpName,EmpAge,SalaryID,DepID) values (102,'Akhil',33,212,167789);
insert into Employee(EmpID,EmpName,EmpAge,SalaryID,DepID) values (103,'Fidha',24,213,255669);
insert into Employee(EmpID,EmpName,EmpAge,SalaryID,DepID) values (104,'Kavya',28,214,130000);




SELECT * FROM Employee

create table Department
(
DepID INT NOT NULL PRIMARY KEY,
DepName varchar(100),
);

insert into Department(DepID,DepName) values (1,'Development');
insert into Department(DepID,DepName) values (2,'Testing');
insert into Department(DepID,DepName) values (3,'Devops');
insert into Department(DepID,DepName) values (4,'QA');

select * from Department

create