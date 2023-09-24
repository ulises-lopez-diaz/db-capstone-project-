-- Task 1
DELIMITER //
CREATE PROCEDURE GetMaxQuantity()
BEGIN
    SELECT MAX(Quantity) AS `Max Quantity In Order`
    FROM Orders;
END;
//
DELIMITER ;

-- Task 2

-- Declaración de variables
SET @GetOrderDetail = 'SELECT OrderID, Quantity, TotalCost FROM Orders WHERE CustomerID = ?';
SET @id = 1;

-- Preparar el statement
PREPARE GetOrderDetail FROM @GetOrderDetail;

-- Asignar el valor del parámetro ejecutar el statement
EXECUTE GetOrderDetail USING @id;


-- Task 3

DELIMITER //
CREATE PROCEDURE CancelOrder(IN OrderID INT)
BEGIN
    DECLARE Message VARCHAR(100);
    SET Message = CONCAT('Order ', OrderID, ' is cancelled');
    SELECT Message AS Confirmation;
    
    DELETE FROM Orders 
    WHERE OrderID = OrderID;
END;
//
DELIMITER ;

CALL CancelOrder(5);

