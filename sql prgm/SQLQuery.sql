--create database
create database task1;

--create table employee
create table Employee
(
EmpID INT not null primary key,
EmpName varchar(100),
EmpAge int,
SalaryID int not null,
DepID int NOT NULL
);



--insert values
insert into Employee(EmpID,EmpName,EmpAge,SalaryID,DepID) values (101,'Pavan',34,211,1);
insert into Employee(EmpID,EmpName,EmpAge,SalaryID,DepID) values (102,'Akhil',33,212,2);
insert into Employee(EmpID,EmpName,EmpAge,SalaryID,DepID) values (103,'Fidha',24,213,3);
insert into Employee(EmpID,EmpName,EmpAge,SalaryID,DepID) values (104,'Kavya',28,214,4);

SELECT * FROM Employee

--create table department
create table Department
(
DepID INT NOT NULL PRIMARY KEY,
DepName varchar(100),
);

--insert values
insert into Department(DepID,DepName) values (1,'Development');
insert into Department(DepID,DepName) values (2,'Testing');
insert into Department(DepID,DepName) values (3,'Devops');
insert into Department(DepID,DepName) values (4,'QA');

select * from Department

--create table salary
create table Salary
(
SalaryID INT NOT NULL PRIMARY KEY,
SalaryAmt int not null,
);


--insert values
insert into Salary(SalaryID,SalaryAmt) values(211,423434)
insert into Salary(SalaryID,SalaryAmt) values(212,255325)
insert into Salary(SalaryID,SalaryAmt) values(213,257634)
insert into Salary(SalaryID,SalaryAmt) values(214,213456)

select * from Salary
select * from Department
SELECT * FROM Employee

--inner join
select Employee.EmpName,Department.DepName,Salary.SalaryAmt
from((Employee
inner join Department on Employee.DepID=Department.DepID)
inner join Salary on Employee.SalaryID=Salary.SalaryID);

