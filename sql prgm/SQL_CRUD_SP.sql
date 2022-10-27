
------CRUD-SP
create database CrudForCon;
use CrudForCon;

create table CRUD_SP
(
ID INT IDENTITY(1,1) PRIMARY KEY,
Ename varchar (100),
Age int,
EAddress varchar (100)
);

select * from CRUD_SP


--select
--insert
--update
--delete

EXEC usp_Employee_Management 0,'',0,'','SELECT'
EXEC usp_Employee_Management 0,'Khadeeja Shirin',25,'INDIA','INSERT'
EXEC usp_Employee_Management 0,'Anshika',23,'INDIA','INSERT'
EXEC usp_Employee_Management 2,'Vanshika',24,'UK','UPDATE'
EXEC usp_Employee_Management 3,'',0,'','DELETE'


CREATE PROC usp_Employee_Management
(
@ID INT,
@Name varchar (100),
@Age int,
@Address varchar(100),
@Type varchar (100)
)
AS
BEGIN
		if @Type='SELECT'
		BEGIN
			select * from CRUD_SP
		END;
		IF @Type='INSERT'
		BEGIN
			INSERT INTO CRUD_SP(Ename,Age,EAddress) VALUES (@Name,@Age,@Address);
		END;
		IF @Type='UPDATE'
		BEGIN
			update CRUD_SP set Ename=@Name,Age=@Age,EAddress=@Address where ID=@ID;
		END;
		IF @Type='DELETE'
		BEGIN
			delete from CRUD_SP where ID=@ID
		END;
END;




