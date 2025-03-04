USE northwind; 

-- min y max de precio producto
SELECT MIN(unitprice) AS lowestPrice, MAX(unitprice) AS highestPrice
	FROM products;
    
-- precio medio de todos ellos y numero total de productos
SELECT AVG(unitprice), COUNT(unitsinstock)
		FROM products;
        
SELECT COUNT(unitsinstock)
	FROM products;

-- carga max y min
SELECT MIN(freight) AS lowestfreight, MAX(freight) AS highestfreight
	FROM orders
    WHERE ShipCountry = "UK";
    
SELECT *        -- lo pongo para ver si habia pais UK
	FROM orders;
    
-- que productos se venden por encima del precio medio y ordenarlos de mayor a menor

SELECT AVG(unitprice)
	FROM products;

SELECT productname, unitprice
	FROM products
    WHERE unitprice > 28.86636364
	ORDER BY unitprice DESC;

-- productos descontinuados

SELECT *
	FROM products;

SELECT COUNT(*) AS numproductsdiscontinued
	FROM products
    WHERE discontinued = 1;
    
-- detalles de productos NO descontinuados = 0, productID y productName, 10 con ID mas alto

SELECT productID, productName 
	FROM products
    WHERE discontinued = 0
    ORDER BY productID DESC
    LIMIT 10;
    
-- relacion numero pedido y max carga, y que ID ha enviado cada pedido

SELECT employeeID,
	COUNT(*) AS numOrder,
    MAX(freight) AS maxFreight
	FROM orders
    GROUP BY EmployeeID;

SELECT * 
 FROM orders;
 
-- 	descartar pedidos sin fecha y ordenarlos segun ID

SELECT employeeID,
	COUNT(*) AS numOrder,
    MAX(freight) AS maxFreight
    FROM orders
    WHERE OrderDate IS NOT NULL
    GROUP BY EmployeeID;
    
-- CARGA MAXIMA Y ID DE EMPLADO, PERO DE LOS EMPLEADOS QUE TENGAS MAS DE 50 PEDIDOS, USARIA HAVING   

-- WHERE CONDICION INDIVIDUAL
-- HAVING CONDICION DE GRUPO
-- LO QUE ESTE EN NUESTRA TABLA ORIGINAL VA AL WHERE, LO ME SALE ANTES DEL GROUP BY
-- LO QUE SACO EN UN GROUP BY VA EN EL HAVING, LO QUE ME SALE DESPUES DEL GROUP BY. 