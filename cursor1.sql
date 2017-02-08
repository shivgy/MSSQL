
DECLARE @MYCURSOR CURSOR
DECLARE @COUNT INT = 0
DECLARE @MyField MyField_DataType
DECLARE @t1 TABLE(MyColumn1 MyColumn1_DataType)


BEGIN
	insert INTO @t1(MyColumn1) VALUES('1234'),('5678'),('9012'),('3456'),('7890'),('1112'),('1314'),('1516'),('1718'),('1920'),('2122'),('2324'),('2526'),('2728'),('2930'),('3132'),('3334'),('3536'),('3738'),('3940')


	SET @MYCURSOR = CURSOR FOR SELECT * FROM @t1

	OPEN @MYCURSOR
	FETCH NEXT FROM @MYCURSOR INTO @MyField

	WHILE @@fetch_status = 0
	BEGIN
		SET @COUNT = @COUNT + 1
		insert into DataBase.dbo.Table_Name(Parameter1,Parameter2,Parameter3,Parameter4,Parameter5,Parameter6,Parameter7) VALUES('v1','v2',@MyField,'v3',GETDATE(),'v4','v5')
		FETCH NEXT FROM @MYCURSOR INTO @MyField

	END
	PRINT @COUNT
	CLOSE @MYCURSOR
	DEALLOCATE @MYCURSOR

END
 
