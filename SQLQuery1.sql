/*CREATE TABLE Employee  
(  
EmployeeID int Primary Key,  
FirstName varchar(255),  
LastName varchar(255),  
Email varchar(255),  
AddressLine varchar(255),  
City varchar(255)  
);  

Insert Into Employee (EmployeeID,FirstName,LastName,Email,AddressLine,City)
Values (1,'Ad','Cd','ADF','SD','FD');


Insert Into Employee (EmployeeID,FirstName,LastName,Email,AddressLine,City)
Values 
(2,'Ad','Cd','ADF','SD','FD'),
(3,'Ad','Cd','ADF','SD','FD');


EXEC sp_rename 'Employee', 'sqltrial'; --to rename a table name
*/

/*Create Table Sqltrial2(
EmployeeID int ,
Salary varchar(255),
Hobby varchar(255)
);

Insert Into Sqltrial2
Values
(1,542,'fdf'),
(2,5884,'dffad');



Update sqltrial
Set FirstName = 'adam'
where EmployeeID = 3;

*/

/*
Select * from sqltrial;
Select * from Sqltrial2;


Select a.EmployeeID,b.Salary,a.FirstName,b.Hobby From sqltrial a Left Join Sqltrial2 b On a.EmployeeID = b.EmployeeID Order By FirstName;
Select a.EmployeeID,a.LastName,b.Salary From sqltrial a Right Join Sqltrial2 b On a.EmployeeID = b.EmployeeID
Select a.FirstName ,b.Salary From sqltrial a Inner join Sqltrial2 b On a.EmployeeID = b.EmployeeID 
Select a.FirstName, a.LastName,a.City, b.Salary, b.Hobby From sqltrial a Full Outer Join Sqltrial2 b On a.EmployeeID = b.EmployeeID   --to get all table data this is used

Select a.FirstName,b.Salary From sqltrial a cross join Sqltrial2 b where a.EmployeeID = b.EmployeeID
Select a.FirstName,b.Salary From sqltrial a cross join Sqltrial2 b	
*/

---------------SQL STORED PROCEDURE --------------------------------Selection

--select * from sqltrial
/*
Create Procedure stotrial 
@name nvarchar(50)
As
Begin 
Select * From sqltrial where FirstName = @name
End;
*/

--Exec stotrial @name = kl;

--Drop Procedure stotrial

/* Create Procedure stotrial 
@name nvarchar(50), @stay nvarchar(50)
As
Begin 
Select * From sqltrial where FirstName = @name or City = @stay
End; 
*/
--Exec stotrial @stay = Nagpur , @name=kl;

-----------------------------------------------------------------------------Insertion

/*Create Procedure intrial 
@val1 int, @val2 nvarchar(50), @val3 nvarchar(50)
As
Begin
Insert into sqltrial2(EmployeeID, Salary, Hobby)
Values(@val1,@val2,@val3);
End;
*/
--Exec intrial 1,'45','fg';

--Select* from sqltrial2
------------------------------------------------------------------------------Updation
/*Create Procedure uptrial
@new int
As 
Begin
Update Sqltrial2 set Salary = @new where EmployeeID = 1;
End;
*/
--Exec uptrial 9999;
--select * from Sqltrial2
------------------------------------------------------------------------------Updation with multiple input
/*Create Procedure uptrial2
@newupd int , @newhob nvarchar(50)
As
Begin
Update Sqltrial2 set Hobby = @newhob where EmployeeID = @newupd;
End;
*/
--Exec uptrial2 2,'gug';

--Select * from Sqltrial2

------------------------------------------------------------------------------Deletion Procedure

/*Create Procedure deltrial
@del int
As
Begin
Delete From Sqltrial2 where EmployeeID = @del;
End;
*/
--Exec deltrial 7; 
Select * from Sqltrial2