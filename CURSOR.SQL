DECLARE @MyCursor CURSOR;
DECLARE @COUNT INT = 0;
DECLARE @MyField MyField_DataType;

BEGIN
	SET @MyCursor = CURSOR FOR 
	SELECT UNITNO FROM table_name WHERE condition_1 AND condition_2

	OPEN @MyCursor
	FETCH NEXT FROM @MyCursor INTO @MyField

	WHILE @@fetch_status = 0
	BEGIN
    SET @COUNT = @COUNT + 1
		PRINT @MyField
		--algorithm/code
		FETCH NEXT FROM @MyCursor INTO @MyField

		SET @MyField=NULL
	END;
	PRINT @COUNT
	CLOSE @MYCURSOR;
	DEALLOCATE @MYCURSOR;

END;
