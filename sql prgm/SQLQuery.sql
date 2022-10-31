--create database
create database task1;

--create table employee
create table Employee
(
EmpID INT not null primary key,
EmpName varchar(100),
EmpAge int,
SalaryID int not null FOREIGN KEY REFERENCES [dbo].[Salary](SalaryID),
DepID int NOT NULL FOREIGN KEY REFERENCES [dbo].[Department](DepID)
);



--insert values
insert into Employee(EmpID,EmpName,EmpAge,SalaryID,DepID) values (101,'Pavan',34,211,1);
insert into Employee(EmpID,EmpName,EmpAge,SalaryID,DepID) values (102,'Akhil',33,212,2);
insert into Employee(EmpID,EmpName,EmpAge,SalaryID,DepID) values (103,'Fidha',24,213,2);
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

----------------------------------------------------------------------------------------
--create stored procedure FOR INSERT
create proc InsertData(
						@EmpID INT,
						@EmpName VARCHAR(100),
						@EmpAge INT,
						@SalaryID INT, 
						@DepID INT
						)
AS
BEGIN
			INSERT INTO Employee
					(EmpID,EmpName,EmpAge,SalaryID,DepID)
			VALUES
					(@EmpID,@EmpName,@EmpAge,@SalaryID,@DepID)
END

exec InsertData 107,'Kallyan',29,211,3
------DISPLAY THE TABLE
--create view GetEmplyeeDetails
--select EmpName,EmpAge
--from Employee
--where 
	.......................................................................................................................................
	
	--create view
	CREATE VIEW GetEmplyeeDetails
	as
	SELECT EmpName,DepName,SalaryAmt
	from Employee inner join Department on Employee.DepID=Department.DepID
	inner join Salary on Employee.SalaryID=Salary.SalaryID

	select * from GetEmplyeeDetails
....................................................................................................................
--update
create proc UpdateEmployee
@EmpID int,
@EmpName varchar (100)
as
begin
	update Employee set EmpName=@EmpName where EmpID=@EmpID;
END

EXEC UpdateEmployee 102,'ANSHI'

................................................................................................................
--DELETE
create proc DeleteDetails
@EmpID int
as
begin
	delete from Employee where EmpID=@EmpID
end

--exec DeleteDetails 103
--------------------------------------------------------------------------------------------------------------------------------------

--dePARTMENT SP CREATION
CREATE PROC InsertDep
					(@DepID int,
					 @DepName varchar(100) 
					)
as
begin
			insert into Department
					(DepID,DepName)
			values 
					(@DepID,@DepName)
end

exec InsertDep 5,'database'

---------------------------------------------------------------------------------------------------------------------------------------
--update the department
create proc UpdateDepartment
@DepID int,
@DepName varchar (100)
as
begin
	update Department set DepName=@DepName where DepID=@DepID;
END

EXEC UpdateDepartment 4,'QA'

-----------------------------------------------------------------------------------------------------------------------------
--insert salary etails
create proc insertSal
					(@SalaryID INT,
					@SalaryAmt int
					)
as 
begin 
			insert into Salary
					(SalaryID,SalaryAmt)
			values	
					(@SalaryID,@SalaryAmt)
end

exec insertSal 215,467483

------------------------------------------------------------------------------------------------------------------------
--update salary
create proc UpdateSalaryDetails
@SalaryID int,
@SalaryAmt int
as
begin
	update Salary set SalaryAmt=@SalaryAmt where SalaryID=@SalaryID;
END

EXEC UpdateSalaryDetails 214,453298



