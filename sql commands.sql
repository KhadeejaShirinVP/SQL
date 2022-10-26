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

--............................................................................
DROP TABLE studentsinfo;
DROP DATABASE students;
alter table studentsInfo add bloodGroup varchar(8000);
alter table studentsInfo drop column bloodGroup;
alter table studentsInfo add DOB DATE;
alter table studentsInfo alter column DOB datetime ;

insert into studentsInfo values('071','khadeeja','afsal','9867543266','rose villa','tirur','india','07-04-1997');    
truncate table studentsInfo;
--sp_rename 'studentsInfo','InfoStudents';


--.............................................................
create database demo2;

alter database demo2 modify name = demo3;

....................................................................
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

---------------------------------------------------------------------------------------------------------------
--................................................................................................
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

--insert
--type 1
insert into studentsinfo (StudentID,StudentName,ParentName,PhoneNumber,AddressOfStudent,City,Country)
values (1,'shyam','mohan',9878654567,'Queen Road','delhi','india');

--type 2
insert into studentsinfo values (2,'kallyani','krishna',7898765643,'marathahalli house','banglure','india')
insert into studentsinfo values (3,'khalid','rahman',5645678909,'mayo road','orissa','india')
insert into studentsinfo values (4,'kasim','abdul',5643234312,'oberoi street','kolkata','india')
insert into studentsinfo values (5,'kristofer','john',9087907654,'rose house','madurai','india')

select * from studentsinfo

--it will update the name and city no change other columns.
update studentsinfo set StudentName= 'Ahana',City='ahmedabad'
where StudentID=1;

--delete the COLUMN
DELETE FROM studentsinfo where StudentName='Ahana';
---------------------------------------------------
create table SampleSourceTable(StudentID int,StudentName varchar(8000),Marks int);
create table SampleTargetTable(StudentID int,StudentName varchar(8000),Marks int);

insert into SampleSourceTable values('1','vihaan',90);
insert into SampleSourceTable values('2','khalid',87);
insert into SampleSourceTable values('3','kallyani',75);

insert into SampleTargetTable values('1','vihaan',90);
insert into SampleTargetTable values('2','khalid',67);
insert into SampleTargetTable values('3','Anay',70);

SELECT *FROM SampleSourceTable
SELECT *FROM SampleTargetTable

--merge
MERGE SampleTargetTable target using SampleSourceTable source on (target.StudentID=source.StudentID)
when matched and target.StudentName<>source.StudentName or target.Marks<>source.Marks
then
update set target.StudentName=source.StudentName, target.Marks= source.Marks
when not matched by target
then
insert (StudentID,StudentName,Marks)values (source.StudentID,source.StudentName,source.Marks)
when not matched by source 
then delete;

--select specify columns
select StudentID,StudentName from studentsinfo

--selection 1,2,3 students only
select top 3 * from studentsinfo

select distinct City from studentsinfo

---order by
select * from studentsinfo order by StudentName,ParentName;   --this effect studentName col.that means change will occur on first mentioned column.

select * from studentsinfo order by StudentName asc,ParentName desc; 

--group by
select count (StudentID),City from studentsinfo group by City;

--grouping 
select StudentID,StudentName,count(City) from studentsinfo group by
grouping sets ((StudentID,StudentName,City),(StudentID),(StudentName),(City));

--having
select count (StudentID),City from studentsinfo group by City having count (StudentID)=1
order by count (StudentID)desc;

select * into StudentsBackUP From studentsinfo;

--selection of mentioned col
select * into PuneStudents from studentsinfo where City='pune';
select * from PuneStudents

--group by cube
select StudentID,count(City) from studentsinfo group by cube (StudentID) order by StudentID;  ---null is come at top

--group by rollup
select StudentID,count(City) from studentsinfo group by rollup (StudentID);  --null is come at bottom

..............................................................................................................................

create table OffsetMarks(Mark int);
insert into OffsetMarks values (65);
insert into OffsetMarks values (64);
insert into OffsetMarks values (62);
insert into OffsetMarks values (65);
insert into OffsetMarks values (61);

--offset
select * from OffsetMarks order by Mark OFFSET 1 ROWS;   --sorted and Delete fisrt couple

--rows fetch next
select * from OffsetMarks order by Mark offset 3 rows fetch next 2 rows only;   ---sorted and delete first 3 couples(rows).then show 2 rows

......................................................................................................................................
--pivot example
create table SupplierTable
(
SupplierID int not null,
DaysOfManufacture int,
Cost int,
CustomerID int,
PurchaseID varchar(4000)
);

insert into SupplierTable values(1,12,1230,11,'P1');
insert into SupplierTable values(2,21,1543,22,'P2');
insert into SupplierTable values(3,32,2355,11,'P3');
insert into SupplierTable values(4,14,4567,22,'P1');
insert into SupplierTable values(5,12,5678,33,'P3');
insert into SupplierTable values(6,23,3456,33,'P1');
insert into SupplierTable values(7,98,7654,11,'P2');
insert into SupplierTable values(8,67,3489,22,'P2');
insert into SupplierTable values(9,45,7612,11,'P3');
insert into SupplierTable values(10,43,5408,33,'P2');
insert into SupplierTable values(1,12,1230,11,'P1');

SELECT CustomerID, avg(Cost)as AverageCostOfCustomer from SupplierTable group by CustomerID; 

--pivot
select 'AverageCostOfCustomer' AS Cost_According_To_Customers, [11],[22],[33]
from(
select CustomerID,Cost from SupplierTable) AS SourceTable
PIVOT
(
AVG(Cost) for CustomerID in ([11],[22],[33]))as PivotTable;



