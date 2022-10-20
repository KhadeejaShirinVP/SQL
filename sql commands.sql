CREATE DATABASE students1;
USE students1;
CREATE TABLE studentsinfo
(
StudentID int,
StudentName  varchar(8000),
ParentName varchar(8000),
PhoneNumber bigint,
AddressOfStudent varchar(8000),
City varchar(8000),
Country varchar(8000)
);

DROP TABLE studentsinfo;
DROP DATABASE students;
alter table studentsInfo add bloodGroup varchar(8000);
alter table studentsInfo drop column bloodGroup;
alter table studentsInfo add DOB DATE;
alter table studentsInfo alter column DOB datetime ;

insert into studentsInfo values('071','khadeeja','afsal','9867543266','rose villa','tirur','india','07-04-1997');    
truncate table studentsInfo;
sp_rename 'studentsInfo','InfoStudents';


....................................................
create database demo2;

alter database demo2 modify name = demo3;

...............................................
   we have 3 tables.
   1. employee table -Employee ID
					 -Employee Name
					 -Employee Age
					 -salary ID
					 -Department ID
	2. Department TABLE- Department ID
						-Department Name
	3. salary table -salary ID
					-salary

					
SELECT * from employee TABLE
SELECT * from department TABLE
SELECT * from salary TABLE

--for inner join
SELECT (e.NAME,d.Department Name,s.salary)
FROM Employee e;
inner join Department d on e.Department Name=d.Department ID
inner join salary s on e.salary=s.salary
where s.salary > 10000


