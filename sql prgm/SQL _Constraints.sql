
--default
create table Employee1
(ID int not null,
EmpName nvarchar(50) null,
DateOfJoin date default getdate()
)

insert into Employee1 values (1,'Shirin','10/10/2022')
insert into Employee1(ID,EmpName) values (2,'krishna')
insert into Employee1 (ID,EmpName) values (3,'shyam')

select * from Employee1