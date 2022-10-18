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
