-- Create the table and insert values as portrayed in the previous example.
CREATE TABLE pvt (
    VendorID INT,
    Emp1 INT,
    Emp2 INT,
    Emp3 INT,
    Emp4 INT,
    Emp5 INT);
GO


INSERT INTO pvt
VALUES (1, 4, 3, 5, 4, 4);

INSERT INTO pvt
VALUES (2, 4, 1, 5, 5, 5);

INSERT INTO pvt
VALUES (3, 4, 3, 5, 4, 4);

INSERT INTO pvt
VALUES (4, 4, 2, 5, 5, 4);

INSERT INTO pvt
VALUES (5, 5, 1, 5, 5, 5);
GO


	SELECT * 
		FROM  (
			SELECT 
				VendorID,
				Emp1,
				Emp2,
				Emp3,
				Emp4,
				Emp5 
					FROM pvt
	) AS t
	UNPIVOT
	(
	ventas -- operacion de cantidades
		FOR empleados -- columna de empleados
                 IN (Emp1,Emp2,Emp3,Emp4,Emp5)
	) AS UNPVT;

