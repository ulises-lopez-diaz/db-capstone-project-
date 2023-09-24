-- Task 1
--
CREATE VIEW OrdersView AS
SELECT OrderID, Quantity, TotalCost FROM Orders
WHERE Quantity > 2;

SELECT * FROM OrdersView;

-- Task 2

SELECT 
	CD.CustomerID, 
	CD.CustomerName, 
	ORD.OrderID AS OrderID,
	CAST((ORD.TotalCost / ORD.Quantity) AS DECIMAL(10,2)) AS Cost,
	M.Dessert AS MenuName,
	M.Course AS CourseName,
	M.Starter AS StarterName
FROM CustomerDetails CD
INNER JOIN Orders ORD
ON CD.CustomerID = ORD.CustomerID
INNER JOIN Menu M
ON M.MenuID = ORD.MenuID


-- Task 3
SELECT Dessert AS MenuName
FROM Menu
WHERE MenuID IN (
    SELECT MenuID
    FROM Orders
    GROUP BY MenuID
    HAVING COUNT(*) > 2
);
