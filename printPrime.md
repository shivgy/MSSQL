# Write a SQL query to print all the prime numbers between 1  and 1000
```
DECLARE 
@i INT, 
@a INT, 
@count INT, 
@p nvarchar(max)
SET @i = 1 
WHILE (@i <= 1000) 
BEGIN SET @count = 0 
SET @a = 1 
WHILE (@a <= @i) 
BEGIN IF (@i % @a = 0) SET @count = @count + 1 SET @a = @a + 1 
END IF (@count = 2) SET @P = CONCAT(@P,CONCAT(@i,'&')) SET @i = @i + 1 
END
PRINT LEFT(@P, LEN(@P) - 1)
```
