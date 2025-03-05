USE northwind;

-- datos de todas las empleadas y sus supervisoras. Concretamente nos piden: la ubicación, nombre, y apellido tanto de las empleadas 
-- como de las jefas. Investiga el resultado, ¿sabes decir quién es el director?

SELECT *
	FROM employees;
    
SELECT e1.City AS CityEmpleado, e1.FirstName AS NombreEmpleado, e1.LastName AS ApellidoEmpleado, e2.City AS CityJefe, e2.FirstName AS NombreJefe, e2.LastName AS ApellidoJefe
	FROM employees AS e1, employees AS e2
    WHERE e1.ReportsTo = e2.EmployeeID;
    
----------------------------------------------------------------------------------------------------------------------

-- categorías de productos, incluso si no tienen productos asociados   (IMP, CATEGORIA LA QUIERO MANTENER COMPLETA)
-- obtener el nombre de la categoría y el nombre de los productos dentro de cada categoría. (IMP!!!!!!! ENUNCIADO)
-- RIGTH JOIN con 'categories'?, usemos tambien la tabla 'products'.
SELECT c.CategoryName AS NombreCategoria, p.ProductName AS NombreProductos
	FROM categories AS c RIGHT JOIN products AS p -- ESTE ESTA MAL DEBERIA SER FROM products AS p RIGHT JOIN categories AS c
    USING (CategoryID);
-- ESTAMOS PONIENDO CATEGORIA A IZ Y PRODUCT A DERECHA, POR LO QUE NOS ESTAMOS LLEVANDO PRODUCTO A IZQ.  
-- DEBERIAMOS PONER ENTONCES PRODUCTOS A DERECHA. POR EL ENUNCIADO!!!!!!!!!!!!!!!!!!!!!!!

SELECT *
	FROM products;    
    
SELECT c.CategoryName AS NombreCategoria, p.ProductName AS NombreProductos
	FROM categories AS c LEFT JOIN products AS p
    USING (CategoryID);
    -- AQUI ESTAMOS MANTENIENDO TABLA C COMPLETA. 
    
-----------------------------------------------------------------------------------------------------------------
    
-- obtener una lista de todos los pedidos junto con los datos de las empresas clientes
-- hay algunos pedidos que pueden no tener un cliente asignado. 
-- Necesitamos asegurarnos de incluir todos los pedidos, incluso si no tienen cliente registrado.

SELECT *
	FROM orders;   
    
    
SELECT orders.OrderID, customers.CompanyName
	FROM customers
	LEFT JOIN orders
	ON orders.CustomerID = customers.CustomerID;

SELECT o.OrderID, o.OrderDate, c.CustomerID, c.CompanyName
FROM Orders o
LEFT JOIN Customers c ON o.CustomerID = c.CustomerID;

