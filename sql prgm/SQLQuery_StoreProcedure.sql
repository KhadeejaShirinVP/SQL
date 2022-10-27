
--store procedure--

--**create**--
create procedure GetEmployeeDetails
as
begin
select  Employee_FirstName,Employee_EmailID,Employee_PhnNo,Department_Name from Employee 
inner join Department on Employee.Employee_Dept = Department.Department_ID
end
........................................................................................................
--for find from bunch of store procedure ,if we know the name of store procedure
sp_helptext GetEmployeeDetails

.............................................................................................
--execution
GetEmployeeDetails   --by using procedure name only

exec GetEmployeeDetails
...........................................................................................................
--**alter**--
alter procedure GetEmployeeDetails
as
begin

select  Employee_FirstName,Employee_EmailID,Employee_PhnNo,Department_Name from Employee 
inner join Department on Employee.Employee_Dept = Department.Department_ID
where Department_Name='Malayalam'
end

--alter with parameter declaration--
alter procedure GetEmployeeDetails
@Department varchar(8000)
as
begin

select  Employee_FirstName,Employee_EmailID,Employee_PhnNo,Department_Name from Employee 
inner join Department on Employee.Employee_Dept = Department.Department_ID
where Department_Name=@Department
end
---now  we use this for excution like,
GetEmployeeDetails 'Malayalam'
GetEmployeeDetails 'English'

--alter using multiple parameter--
alter PROC GetEmployeeDetails
@Department varchar(8000),
@ID INT
as
begin

select  Employee_FirstName,Employee_EmailID,Employee_PhnNo,Department_Name from Employee 
inner join Department on Employee.Employee_Dept = Department.Department_ID
where Department_Name=@Department
end

--EXECUTION
GetEmployeeDetails 'Malayalam',1

...................................................................................................................................
--DROP OF STORE PROCEDURE--
--DROP PROC GetEmployeeDetails

